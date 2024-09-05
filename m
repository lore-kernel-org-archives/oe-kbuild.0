Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA70C188017
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Sep 2024 20:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725569784; cv=none; b=q/84f1Jt/6qxmR7+QBtdrfbUpx9Mh1zGPIWwCqjheOzuWdhK3zdJIiveVGFJiZLArW79Z+u8075NrViMQWk+Lney+UMYvr/d2Xl+cd1UeBkwspQG+kE15WYmf4R6G7y7n13NasEIgKNGyeRL7zZy+5TIWxRvsOuioFArUZF58oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725569784; c=relaxed/simple;
	bh=uCLu8ph1w1YStt7D8UFQAHlAXG/h1f6U/AVDGuO4h5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=thWv00XB/59pwskFstMi1eaIM2VF0NrqpLq8bOS8/2Rtn/ypeQTVQ8fvJOGMHe1b4S0+N5OYFgzu7TOffKI0NpgDcNTGQoBbOd1M1qZTWvm3mDig3hPuDVRD+2pBgvDPQPDjar+Hs79dtMH6EBJHbcXBYu5BJirZ2AAn9RGq7IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDwcPvYU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDwcPvYU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725569783; x=1757105783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uCLu8ph1w1YStt7D8UFQAHlAXG/h1f6U/AVDGuO4h5A=;
  b=UDwcPvYUdtirw+Po8iG7flWqiUJQ9D0Iq4N5byCQNVynB+7wrxy3l6zf
   YXGzNcne5VQhfkxFWZvbBVuoeDwcDLRLznjzeQkuQdV4y2jHIpsPb+REs
   RMMHi+qZ3pkVNygBGmb+5vnrB0BMglcl62zdvtVhYVxuYYlYWqo4mEpJm
   VNKV7yQTH24KkMfqh6k399xOk2vTN/ZIpHYmtZwc/cAr8RJ9Bsx+KU2hW
   gXVuECUHjLWgUJJUvB4tvE2Pr1oyJZgv6uflCYQ1Z2mJ8yFoLRGYsz2CH
   X5mtm/EeDB8UqLk3qNsR2NBuKA5bnQeCroTuPkGj8gX1pR/TVAx3AnnI1
   Q==;
X-CSE-ConnectionGUID: wDCS1qTjR5WQmeHL1KchBA==
X-CSE-MsgGUID: ORcDZUmMSVe0puLnuX1yTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="34914463"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="34914463"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 13:56:22 -0700
X-CSE-ConnectionGUID: JHpCdor0RU+49kbo2Ho81Q==
X-CSE-MsgGUID: aSro7g0jSteu4Q2SkM5JVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="65749791"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Sep 2024 13:56:20 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smJWc-000AJv-2X;
	Thu, 05 Sep 2024 20:56:18 +0000
Date: Fri, 6 Sep 2024 04:54:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sunxi:sunxi/for-next 5/7]
 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: pmic@34:
 adc:compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202409060431.9LFeKN8Q-lkp@intel.com>
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
TO: Chris Morgan <macromorgan@hotmail.com>
CC: "Chen-Yu Tsai" <wens@csie.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
head:   1c215074f370261de614a905f1511ac61eb5a821
commit: 6b5502c1d43d050a652299cd37a06e0b3801e284 [5/7] arm64: dts: allwinner: h700: Add charger for Anbernic RG35XX
:::::: branch date: 6 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-053-20240905 (https://download.01.org/0day-ci/archive/20240906/202409060431.9LFeKN8Q-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409060431.9LFeKN8Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409060431.9LFeKN8Q-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-938.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: pmic@34: adc:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-adc'] is too short
   	'x-powers,axp209-adc' was expected
   	'x-powers,axp221-adc' was expected
   	'x-powers,axp813-adc' was expected
   	'x-powers,axp803-adc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: pmic@34: battery-power:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-battery-power-supply'] is too short
   	'x-powers,axp202-battery-power-supply' was expected
   	'x-powers,axp209-battery-power-supply' was expected
--
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: pmic@34: usb-power:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-usb-power-supply'] is too short
   	'x-powers,axp717-usb-power-supply' is not one of ['x-powers,axp192-usb-power-supply', 'x-powers,axp202-usb-power-supply', 'x-powers,axp221-usb-power-supply', 'x-powers,axp223-usb-power-supply', 'x-powers,axp813-usb-power-supply']
   	'x-powers,axp803-usb-power-supply' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: pmic@34: usb-power: 'input-current-limit-microamp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: pmic@34: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: /soc/i2c@7081400/pmic@34/adc: failed to match any schema with compatible: ['x-powers,axp717-adc']
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: /soc/i2c@7081400/pmic@34/battery-power: failed to match any schema with compatible: ['x-powers,axp717-battery-power-supply']
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: /soc/i2c@7081400/pmic@34/usb-power: failed to match any schema with compatible: ['x-powers,axp717-usb-power-supply']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-938.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: pmic@34: adc:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-adc'] is too short
   	'x-powers,axp209-adc' was expected
   	'x-powers,axp221-adc' was expected
   	'x-powers,axp813-adc' was expected
   	'x-powers,axp803-adc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: pmic@34: battery-power:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-battery-power-supply'] is too short
   	'x-powers,axp202-battery-power-supply' was expected
   	'x-powers,axp209-battery-power-supply' was expected
--
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: pmic@34: usb-power:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-usb-power-supply'] is too short
   	'x-powers,axp717-usb-power-supply' is not one of ['x-powers,axp192-usb-power-supply', 'x-powers,axp202-usb-power-supply', 'x-powers,axp221-usb-power-supply', 'x-powers,axp223-usb-power-supply', 'x-powers,axp813-usb-power-supply']
   	'x-powers,axp803-usb-power-supply' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: pmic@34: usb-power: 'input-current-limit-microamp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: pmic@34: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: /soc/i2c@7081400/pmic@34/adc: failed to match any schema with compatible: ['x-powers,axp717-adc']
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: /soc/i2c@7081400/pmic@34/battery-power: failed to match any schema with compatible: ['x-powers,axp717-battery-power-supply']
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: /soc/i2c@7081400/pmic@34/usb-power: failed to match any schema with compatible: ['x-powers,axp717-usb-power-supply']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-938.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: pmic@34: adc:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-adc'] is too short
   	'x-powers,axp209-adc' was expected
   	'x-powers,axp221-adc' was expected
   	'x-powers,axp813-adc' was expected
   	'x-powers,axp803-adc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: pmic@34: battery-power:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-battery-power-supply'] is too short
   	'x-powers,axp202-battery-power-supply' was expected
   	'x-powers,axp209-battery-power-supply' was expected
--
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: pmic@34: usb-power:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-usb-power-supply'] is too short
   	'x-powers,axp717-usb-power-supply' is not one of ['x-powers,axp192-usb-power-supply', 'x-powers,axp202-usb-power-supply', 'x-powers,axp221-usb-power-supply', 'x-powers,axp223-usb-power-supply', 'x-powers,axp813-usb-power-supply']
   	'x-powers,axp803-usb-power-supply' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: pmic@34: usb-power: 'input-current-limit-microamp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: pmic@34: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: /soc/i2c@7081400/pmic@34/adc: failed to match any schema with compatible: ['x-powers,axp717-adc']
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: /soc/i2c@7081400/pmic@34/battery-power: failed to match any schema with compatible: ['x-powers,axp717-battery-power-supply']
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: /soc/i2c@7081400/pmic@34/usb-power: failed to match any schema with compatible: ['x-powers,axp717-usb-power-supply']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-938.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: pmic@34: adc:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-adc'] is too short
   	'x-powers,axp209-adc' was expected
   	'x-powers,axp221-adc' was expected
   	'x-powers,axp813-adc' was expected
   	'x-powers,axp803-adc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: pmic@34: battery-power:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-battery-power-supply'] is too short
   	'x-powers,axp202-battery-power-supply' was expected
   	'x-powers,axp209-battery-power-supply' was expected
--
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: pmic@34: usb-power:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-usb-power-supply'] is too short
   	'x-powers,axp717-usb-power-supply' is not one of ['x-powers,axp192-usb-power-supply', 'x-powers,axp202-usb-power-supply', 'x-powers,axp221-usb-power-supply', 'x-powers,axp223-usb-power-supply', 'x-powers,axp813-usb-power-supply']
   	'x-powers,axp803-usb-power-supply' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: pmic@34: usb-power: 'input-current-limit-microamp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: pmic@34: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: /soc/i2c@7081400/pmic@34/adc: failed to match any schema with compatible: ['x-powers,axp717-adc']
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: /soc/i2c@7081400/pmic@34/battery-power: failed to match any schema with compatible: ['x-powers,axp717-battery-power-supply']
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: /soc/i2c@7081400/pmic@34/usb-power: failed to match any schema with compatible: ['x-powers,axp717-usb-power-supply']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
