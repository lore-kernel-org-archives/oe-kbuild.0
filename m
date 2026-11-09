Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260086;
	b=KyRd0d/vCZ2tjbdY9HLK2ZyeRw3LAJz+wBD9gVhc1uJgAmjgJlYqbEQnqG9EKjVs96oQ
	 QwLoZlDylyR3s69HENabcA7DMgdSsfNhkhgczJG6msqF+1qHU/tW89sPgmkBOW6JQ3yAX
	 9GnttnuBY9yqpiz817cacoBdWTZ5gAsWvP5MeFHxKHZ7Cy5Ai624bOPuEUsvDOLFTxYeB
	 qOuvAqHTt+BKWMTgxm3tev8Hs6EtJujU0/Bt80lLvxwcfyik//yrlGBYwn7fmBeZM7MRJ
	 iSvo18/Xg8odfSV8l3Rigt03g+DFYO15K2U04xjMclIVAeH2ISOwVLtYTZLY5RmL7Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260086;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=l48mwVA7+6KuplRIaVdxLwLleXM3NRxkx2/LPZULh2g=;
	b=MIKr5ceMoFDKDhiAclIUB/u4g4pNf7GINkqPBK+14DtHzwznMLR1WPhEcipkeOOrROzc
	 Kp1H699eb8/hWVIk3gweO/SPEZfNLYmFZaHSHqBXoZCqCTxjsq8w4igZN7YnfJBhs0vJr
	 u/zZiIjRejbxEBs+NqXHLYecwrccKwl0kZEpZ4Obnq7867rHHy38ZoPilFopArzouw3ZV
	 qpHp/C1AHEXStZQSW5Ud7V/iT19s6lY7rHHQdc4BHHNjzBHNVOrEaFxnW9vXAOJnEyRtm
	 ScyabqyAZ1vmOzOAf+0wHPwaAf2n6gE1eEUnXQGTpI4bb4ZjEDRrn13r3KsMNhwfbnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XsrIqmb0;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3970C606A321
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Nov 2026 21:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3970C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XsrIqmb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794260085; x=1825796085;
  h=date:from:to:cc:subject:message-id;
  bh=Xxk1dLEf5zNCofMj/7CpM+mtE/EfFocen/anUmZHt/M=;
  b=XsrIqmb0U0m2YfU381n+Kwa7yu6ezRIiw53uUKlyRDs6h/ejPr9tfmpL
   6KQNHlWIQ8fg3UTeJHfXARfp6YUilo9PcG6FUj1YkGnejYrD9GL51WJRN
   KRRtrqIMNU9YBfJUFTnUf7wDnhTcTNSEp8kUbQcF8LQWZA2LadX60VUC7
   JXG6uaWLHNheYmwB4I+vF7waPGudkkKPZJlj+dwCuXSnjIl5v3AsJ84kg
   uKUnxi88wWv2uyHt+38oOVvpw+ui+nfXUt7TLLsUvtEOcNeHIse9GP+QM
   w7N3oO/MoonkNBpv3yRJHNm8QIYRwT5i3BfHBoQvZNhcYabw7CQ8zeO54
   A==;
X-CSE-ConnectionGUID: tdcccLqaQyOaiUmDfdQQfQ==
X-CSE-MsgGUID: hfxUAZ5KSJ+itUJMUGK+8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2883459"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2883459"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 13:34:44 -0800
X-CSE-ConnectionGUID: fOXzQO0AQOW6VnUG4ht5iQ==
X-CSE-MsgGUID: 39x2KRIBSiyglOerL6ECKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7988532"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 09 Nov 2026 13:34:43 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQX0f-000000000U7-3gBO;
	Mon, 09 Nov 2026 21:34:37 +0000
Date: Mon, 09 Nov 2026 22:34:30 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 8/10]
 arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtb:
 timer@4c00a000 (st,stm32-timers): 'timer@14' does not match any of the
 regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
Message-ID: <202611092256.CgOAcjd5-lkp@intel.com>
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
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261109/202611092256.CgOAcjd5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611092256.CgOAcjd5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611092256.CgOAcjd5-lkp@intel.com/

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
