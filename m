Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16253AC0F5
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 17:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778346094; cv=none; b=hPENPmQbgN364TIUAaEn6pf4CplQeWEEpno0tq3M3X1aPxu6DBRHkyA2RYbT3v/zgM4koTlkT52spzmQdN+c1B5WsDeHFOhvqHLJzxxW06wUVt9nnvmALogp3gPRkJoO2qxHgTpdPqS330c5rLqLKb+OmSBQVRSq/gjTBv5IoTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778346094; c=relaxed/simple;
	bh=TSbdMCPbhvQFTuyrTjvk0s6keZiQPmmv4GvqYf3tQ80=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TgeTCiDppsVnAQ4p1/FJSbrU3Roia97QI6Z9DeaPa5q9qkJUzpzwr7F9AV3UAA0yCntOqOWeUTk6I2CYIsKYW4pNF2rE3oO9cZ7MD4EiicTQe4X3BlQyLN1ki+c+qpH8rbn3Ta1QYhpsi/M35FJAIufDDQQb/n6aJLIfL4xxDmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9A6TFqt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9A6TFqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778346092; x=1809882092;
  h=date:from:to:cc:subject:message-id;
  bh=TSbdMCPbhvQFTuyrTjvk0s6keZiQPmmv4GvqYf3tQ80=;
  b=E9A6TFqt5VlBXeVXu0t+sAfZEzZttnA5BL7TIs3Tgxu1K17AfZNXTrwq
   Qp0qemDsIKJ19q5GrOIU5j/THHsjGSECfxI+Tx9MMmmTwYxonkLWViAEY
   Xn79y4RWwGqWALCXdzZUO0rlYrMd8Z9tZ5j5XvLyoSivxx8W7GDsldeeZ
   Lf7ts3LWN23PXvstdTL+/q+LIUwDE6vzQuz5glnj5NaUTBsxyBCJgQY2G
   ES6qMwIZsB/S/y/tf8gI7EBDvkRx6VPdQjV9QDhImniJsiQ4s8QJOHJ+q
   4kheSbriuYF2W+UzrseqBhLYO1c2ylA6Ze6vR0h5hs9Jg3EWC31f2Bnk7
   g==;
X-CSE-ConnectionGUID: Q5xBgZY+SGme6/GnVyiXBQ==
X-CSE-MsgGUID: kq0O+0x1SwWcQoeI+NVgrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="104755032"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="104755032"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 10:01:31 -0700
X-CSE-ConnectionGUID: 0TB2ciBeRfKQCbBrAO4XvQ==
X-CSE-MsgGUID: JYqyRYHYRFWREewxYQ1p2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="234385047"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 09 May 2026 10:01:30 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLl3Q-000000007WT-0qTz;
	Sat, 09 May 2026 17:01:28 +0000
Date: Sat, 09 May 2026 19:01:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb:
 ssbi@500000 (qcom,ssbi): pmic: 'usb-detect' does not match any of the
 regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9a-f]+$', 'keypad@[0-9a-f]+$',
 'led@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pwrkey@[0-9a-f]+$', 'rtc@[0-...
Message-ID: <202605091802.xhzMj6th-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alexandre MINETTE <contact@alex-min.fr>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Alexandre-MINETTE-via-B4-Relay/dt-bindings-arm-qcom-Add-Samsung-Galaxy-S4/20260503-092020
head:   5eea8ec897bc79e313f44f6f0d08c7f613989dbd
commit: 98fbb0970efa8838f2fcb00002d9a8197e6cc886 ARM: dts: qcom: pm8921: Add USB ID extcon
date:   7 days ago
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-2052-20260503 (https://download.01.org/0day-ci/archive/20260509/202605091802.xhzMj6th-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605091802.xhzMj6th-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605091802.xhzMj6th-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1136.21-1184.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@4700000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1202.21-1256.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: ssbi@500000 (qcom,ssbi): pmic: 'usb-detect' does not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9a-f]+$', 'keypad@[0-9a-f]+$', 'led@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pwrkey@[0-9a-f]+$', 'rtc@[0-9a-f]+$', 'vibrator@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/bus/qcom,ssbi.yaml
>> arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: pmic (qcom,pm8921): 'usb-detect' does not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9a-f]+$', 'keypad@[0-9a-f]+$', 'led@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pwrkey@[0-9a-f]+$', 'rtc@[0-9a-f]+$', 'vibrator@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom-pm8xxx.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12500000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12500000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 126], [24, 128]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12520000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12520000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 295], [24, 297]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12530000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
--
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1136.21-1184.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@4700000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1202.21-1256.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: ssbi@500000 (qcom,ssbi): pmic: 'usb-detect' does not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9a-f]+$', 'keypad@[0-9a-f]+$', 'led@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pwrkey@[0-9a-f]+$', 'rtc@[0-9a-f]+$', 'vibrator@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/bus/qcom,ssbi.yaml
>> arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: pmic (qcom,pm8921): 'usb-detect' does not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9a-f]+$', 'keypad@[0-9a-f]+$', 'led@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pwrkey@[0-9a-f]+$', 'rtc@[0-9a-f]+$', 'vibrator@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom-pm8xxx.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12500000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12500000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 126], [24, 128]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12520000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12520000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 295], [24, 297]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12530000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
--
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1136.21-1184.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@4700000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1202.21-1256.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: ssbi@500000 (qcom,ssbi): pmic: 'usb-detect' does not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9a-f]+$', 'keypad@[0-9a-f]+$', 'led@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pwrkey@[0-9a-f]+$', 'rtc@[0-9a-f]+$', 'vibrator@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/bus/qcom,ssbi.yaml
>> arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: pmic (qcom,pm8921): 'usb-detect' does not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9a-f]+$', 'keypad@[0-9a-f]+$', 'led@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pwrkey@[0-9a-f]+$', 'rtc@[0-9a-f]+$', 'vibrator@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom-pm8xxx.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12500000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12500000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 126], [24, 128]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12520000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12520000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 295], [24, 297]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12530000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
--
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1202.21-1256.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: ssbi@500000 (qcom,ssbi): pmic: 'usb-detect' does not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9a-f]+$', 'keypad@[0-9a-f]+$', 'led@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pwrkey@[0-9a-f]+$', 'rtc@[0-9a-f]+$', 'vibrator@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/bus/qcom,ssbi.yaml
>> arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: pmic (qcom,pm8921): 'usb-detect' does not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9a-f]+$', 'keypad@[0-9a-f]+$', 'led@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pwrkey@[0-9a-f]+$', 'rtc@[0-9a-f]+$', 'vibrator@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom-pm8xxx.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12500000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12500000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 126], [24, 128]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12520000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12520000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 295], [24, 297]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12530000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
--
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1136.21-1184.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@4700000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1202.21-1256.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: ssbi@500000 (qcom,ssbi): pmic: 'usb-detect' does not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9a-f]+$', 'keypad@[0-9a-f]+$', 'led@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pwrkey@[0-9a-f]+$', 'rtc@[0-9a-f]+$', 'vibrator@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/bus/qcom,ssbi.yaml
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: pmic (qcom,pm8921): 'usb-detect' does not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9a-f]+$', 'keypad@[0-9a-f]+$', 'led@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pwrkey@[0-9a-f]+$', 'rtc@[0-9a-f]+$', 'vibrator@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom-pm8xxx.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12500000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12500000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 126], [24, 128]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12520000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12520000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 295], [24, 297]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12530000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
--
>> arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dtb: ssbi@500000 (qcom,ssbi): pmic: 'usb-detect' does not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9a-f]+$', 'keypad@[0-9a-f]+$', 'led@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pwrkey@[0-9a-f]+$', 'rtc@[0-9a-f]+$', 'vibrator@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/bus/qcom,ssbi.yaml
>> arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dtb: pmic (qcom,pm8921): 'usb-detect' does not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9a-f]+$', 'keypad@[0-9a-f]+$', 'led@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pwrkey@[0-9a-f]+$', 'rtc@[0-9a-f]+$', 'vibrator@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom-pm8xxx.yaml
--
>> arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: ssbi@500000 (qcom,ssbi): pmic: 'usb-detect' does not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9a-f]+$', 'keypad@[0-9a-f]+$', 'led@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pwrkey@[0-9a-f]+$', 'rtc@[0-9a-f]+$', 'vibrator@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/bus/qcom,ssbi.yaml
>> arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: pmic (qcom,pm8921): 'usb-detect' does not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9a-f]+$', 'keypad@[0-9a-f]+$', 'led@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pwrkey@[0-9a-f]+$', 'rtc@[0-9a-f]+$', 'vibrator@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom-pm8xxx.yaml
--
>> arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dtb: ssbi@500000 (qcom,ssbi): pmic: 'usb-detect' does not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9a-f]+$', 'keypad@[0-9a-f]+$', 'led@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pwrkey@[0-9a-f]+$', 'rtc@[0-9a-f]+$', 'vibrator@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/bus/qcom,ssbi.yaml
>> arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dtb: pmic (qcom,pm8921): 'usb-detect' does not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9a-f]+$', 'keypad@[0-9a-f]+$', 'led@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pwrkey@[0-9a-f]+$', 'rtc@[0-9a-f]+$', 'vibrator@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom-pm8xxx.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
