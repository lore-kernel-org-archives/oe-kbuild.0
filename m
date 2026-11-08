Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794167584;
	b=WU3cs0YsJ2bAlxexi3XscGtjX0PJQc14iwCWK2Ail2M+iDfN4d343r4jgb2baoKaChHk
	 Cjcc/KBfIBSedSEDrIjM003iacHn/B2YdM1EabXTnQoLv4pUJJkPX1T/uTTh4a+6tIDXJ
	 roOSGtWe3B8BxZ7h4MPp7Lnbggy4VdXLxVVRJUDoiJ9P4ZnG38ggihaPufxbnHu4xqzd3
	 rrKgNcSsZ/ZKrNge7xRHsDVDgAa4HsP696h9ojPHIG1GGboJH7wezlM2Ft90EU+EIU/vz
	 Gj5GoWKGDhHPuKqB4sb2yzWq06Veg4Bh4ztDZyLjzEWABJ60Owgh6zankLEM64d6ygA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794167584;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=dQw0YFZI6LoBDkUpGXfRQPSLEEW2HQcOf2J324UYMjU=;
	b=QriTYrtCxpjIaejhBO51Hv+FczH8gBKYOIOy65bAVFaANKkGyTmC9MzDHQlKY1xuRtHt
	 W9yj7cBvb0GcKKkeo0oYOCe7Cm2mB3+GylFMxYLIm9J1g9bXuFPhCXIiAWYWcsU7sar3+
	 QwDEH81IZpCfTTNHaBWzwa0wVwmLZ9w4PSR6RZ2T/LZzM+JXeVQg9zw8RfZH3Ue2gnLvr
	 iH+rdDB2ga2sVox7rZWlK8EJD/OAVRlqOG4yGKkj3kn96/SoVQxuQFT8MfQoS6hXbYYmN
	 lv0KwwhqXflM2Ew339FwnpsWmBocRKrrh/j1r8NeQbdtRCANsGywYpzVv9y63o740Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YIoz8Eho;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72513606A31C
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Nov 2026 19:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72513606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YIoz8Eho
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794167581; x=1825703581;
  h=date:from:to:cc:subject:message-id;
  bh=ujsRfV9IbLufpLQF3HwT2oaa088qcH20XHHqnJGuQV4=;
  b=YIoz8EhobtXVqvXAl+CAkPZTq1S6pRZ/NTf9/mgxsPRouLfl5Y2YfHJf
   qISLiAnUiXBvy7FHReNylIatViNb6Q6Z7by1qX+5tMlmJxWEh+sjS6eqG
   t3uShqBSTCSNeYTHTNWS3TWhZdI5miet5Wq93Xnhjgkz3Fgk6oC5syG7V
   O2KxfrKEKk4GB0XPZ6MMB+Qbnjm5spxMR2T878Oe6E8dscnFaCpOP9syL
   mRkGaG/TX0Jtoo/WEekxACWTXVhlo/8b4xRkHCWbJcFFVV4E6qzzyuaPS
   Gw6jTapSi3Lhx03cUDk91q/CbqG/TiGARq7/OWal2i/1Qo1ew1TK+FjRd
   g==;
X-CSE-ConnectionGUID: mRvIv9BnQ0eqYyZP71xIXw==
X-CSE-MsgGUID: uPS+W5WQRnWWY/uv8dAtUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2780661"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2780661"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 11:53:01 -0800
X-CSE-ConnectionGUID: Swgihy27Q8WUq/1d5U+dFA==
X-CSE-MsgGUID: UC3PaNmDRuuyTr77X5IA1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7744478"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 08 Nov 2026 11:52:59 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQ8wi-00000000BgQ-1KOd;
	Sun, 08 Nov 2026 19:52:56 +0000
Date: Sun, 08 Nov 2026 20:52:07 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 8/10]
 arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtb:
 timer@4c00a000 (st,stm32-timers): 'timer@14' does not match any of the
 regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
Message-ID: <202611082031.B7Gyl1Lc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Linus Walleij <linusw@kernel.org>
CC: Ivan Vecera <ivecera@redhat.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

Hi Rob,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   c025fbcb8c919392aa3537a5cf6131c1d2733017
commit: 17c58242988d2b4363fe9d506d387d7d13d50842 [8/10] dt-bindings: Use hex unit address patterns
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261108/202611082031.B7Gyl1Lc-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611082031.B7Gyl1Lc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611082031.B7Gyl1Lc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtb: adc@48004000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml
>> arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtb: timer@4c00a000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtb: timer@4c00b000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtb: timer@4c00c000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtb: adc@48003000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02-overlay-wifi-rsi.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02-overlay-wifi-rsi.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02-overlay-wifi-rsi.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-644-100-x6-otm8009a.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-644-100-x6-otm8009a.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-644-100-x6-otm8009a.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-644-100-x6-rpi7inch.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-644-100-x6-rpi7inch.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-644-100-x6-rpi7inch.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-fdcan1-x6.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-fdcan1-x6.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-fdcan1-x6.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-fdcan2-x6.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-fdcan2-x6.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-fdcan2-x6.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-i2c1-eeprom-x6.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-i2c1-eeprom-x6.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-i2c1-eeprom-x6.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-i2c2-eeprom-x6.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-i2c2-eeprom-x6.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-i2c2-eeprom-x6.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-ov5640-x7.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-ov5640-x7.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-ov5640-x7.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-spi2-eeprom-x6.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-spi2-eeprom-x6.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-spi2-eeprom-x6.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-460-200-x11.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-460-200-x11.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-460-200-x11.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-497-200-x12.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-497-200-x12.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-497-200-x12.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-531-100-x21.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-531-100-x21.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-531-100-x21.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-531-100-x22.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-531-100-x22.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-531-100-x22.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-638-100-x12-rpi7inch.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-638-100-x12-rpi7inch.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-638-100-x12-rpi7inch.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-672-100-x18.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-672-100-x18.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-672-100-x18.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-548-200-x2-mi0700s4t-6.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-548-200-x2-mi0700s4t-6.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-548-200-x2-mi0700s4t-6.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-553-100-x2-tst043015cmhx.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-553-100-x2-tst043015cmhx.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-553-100-x2-tst043015cmhx.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
