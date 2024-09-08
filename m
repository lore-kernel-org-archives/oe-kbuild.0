Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E52F1C01
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Sep 2024 19:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725825097; cv=none; b=nvg2TH5VHW/VCC6hzUfEEcN/m9ffifvEtcLq9Np5GR7GgVLefA24VgXMxpUg3gy4KACt/5KMKVD5nlGAxWQjp66e7xIiM7w0AeRv0PvTaHmhr2v0CWNhuzBtyGTygfxRkv+62H0u0YUp0cHT6CKPcXTWuFP+fjKUZuEutBe2wWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725825097; c=relaxed/simple;
	bh=K8EBGfUIGB9nLUauqyPJT8FeAGnfv4/iz92kHYFVlqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V9YAt1Zwg/MylFJiKq3BQ4KpJk4p61BQC6x6VdAQnfmB+6N9qSwjtsBCvUy439BYYCaqVQOETB2HiSC+iG/kH3HCPRO7gaNMxMTNt2yYGNZq0y1nD5hd/JElrH6uAIGNFNuOcdVDrBXrM1n4wxhPgcY2OxO6U7OOGfzEQOzNq80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/gV520T; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/gV520T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725825095; x=1757361095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K8EBGfUIGB9nLUauqyPJT8FeAGnfv4/iz92kHYFVlqI=;
  b=C/gV520TYcU5QiwZClK4GBxbGVavENWcvsCs5Md4PYHOVlL2XJ5SpbTl
   nc+SXPSfd4aAXxBNvlFgBkc3nSvy4J1OQqhlx7Y2z/hdERnIKULglvxiD
   ANZRjf+eWIguNP9FCVl+F1Tl+TKnG00/hWMJcmsyG4rz+M3QKsk21OBgM
   agpYdURqxxq3GSGDwBKySmQsGY53WZv/KQmtew89qCmrYrhcxi4QPm+Zn
   /DI+KU+PLcHTBDNA8BdLcfdOuh/4gHoaPrwD7Z16Z4spHOIo3Yo/dZlhZ
   fqEGBvsOgOUcMo9+60fGNtTC70vIU1GusajgyjrYR6U4+VC77EpQFymJn
   w==;
X-CSE-ConnectionGUID: jjAC0iqARi6Oa7/Hd1Hqxw==
X-CSE-MsgGUID: d2BvjpKERFSBqwNpgLWrpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="42020107"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="42020107"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 12:51:34 -0700
X-CSE-ConnectionGUID: iz3vwMgQRtOjvxYnf822kQ==
X-CSE-MsgGUID: ixGpY9FSQ3qjxQWU6dsxqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="66154057"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Sep 2024 12:51:34 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snNwZ-000Dtz-1n;
	Sun, 08 Sep 2024 19:51:31 +0000
Date: Mon, 9 Sep 2024 03:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sunxi:sunxi/for-next 5/8]
 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: pmic@34:
 battery-power:compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202409090309.hkWsZnhL-lkp@intel.com>
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
head:   0acd498601249b488986a213abbd6403a096041c
commit: 6b5502c1d43d050a652299cd37a06e0b3801e284 [5/8] arm64: dts: allwinner: h700: Add charger for Anbernic RG35XX
:::::: branch date: 15 hours ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20240908 (https://download.01.org/0day-ci/archive/20240909/202409090309.hkWsZnhL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090309.hkWsZnhL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409090309.hkWsZnhL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-938.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: pmic@34: adc:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-adc'] is too short
   	'x-powers,axp209-adc' was expected
   	'x-powers,axp221-adc' was expected
   	'x-powers,axp813-adc' was expected
   	'x-powers,axp803-adc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: pmic@34: battery-power:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-battery-power-supply'] is too short
   	'x-powers,axp202-battery-power-supply' was expected
   	'x-powers,axp209-battery-power-supply' was expected
   	'x-powers,axp221-battery-power-supply' was expected
   	'x-powers,axp803-battery-power-supply' was expected
   	'x-powers,axp813-battery-power-supply' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: pmic@34: battery-power: 'monitored-battery' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: pmic@34: usb-power:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-usb-power-supply'] is too short
   	'x-powers,axp717-usb-power-supply' is not one of ['x-powers,axp192-usb-power-supply', 'x-powers,axp202-usb-power-supply', 'x-powers,axp221-usb-power-supply', 'x-powers,axp223-usb-power-supply', 'x-powers,axp813-usb-power-supply']
   	'x-powers,axp803-usb-power-supply' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: pmic@34: usb-power: 'input-current-limit-microamp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: pmic@34: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: /soc/i2c@7081400/pmic@34/adc: failed to match any schema with compatible: ['x-powers,axp717-adc']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: /soc/i2c@7081400/pmic@34/battery-power: failed to match any schema with compatible: ['x-powers,axp717-battery-power-supply']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: /soc/i2c@7081400/pmic@34/usb-power: failed to match any schema with compatible: ['x-powers,axp717-usb-power-supply']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-938.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: pmic@34: adc:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-adc'] is too short
   	'x-powers,axp209-adc' was expected
   	'x-powers,axp221-adc' was expected
   	'x-powers,axp813-adc' was expected
   	'x-powers,axp803-adc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: pmic@34: battery-power:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-battery-power-supply'] is too short
   	'x-powers,axp202-battery-power-supply' was expected
   	'x-powers,axp209-battery-power-supply' was expected
   	'x-powers,axp221-battery-power-supply' was expected
   	'x-powers,axp803-battery-power-supply' was expected
   	'x-powers,axp813-battery-power-supply' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: pmic@34: battery-power: 'monitored-battery' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: pmic@34: usb-power:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-usb-power-supply'] is too short
   	'x-powers,axp717-usb-power-supply' is not one of ['x-powers,axp192-usb-power-supply', 'x-powers,axp202-usb-power-supply', 'x-powers,axp221-usb-power-supply', 'x-powers,axp223-usb-power-supply', 'x-powers,axp813-usb-power-supply']
   	'x-powers,axp803-usb-power-supply' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: pmic@34: usb-power: 'input-current-limit-microamp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: pmic@34: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: /soc/i2c@7081400/pmic@34/adc: failed to match any schema with compatible: ['x-powers,axp717-adc']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: /soc/i2c@7081400/pmic@34/battery-power: failed to match any schema with compatible: ['x-powers,axp717-battery-power-supply']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: /soc/i2c@7081400/pmic@34/usb-power: failed to match any schema with compatible: ['x-powers,axp717-usb-power-supply']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-938.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: pmic@34: adc:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-adc'] is too short
   	'x-powers,axp209-adc' was expected
   	'x-powers,axp221-adc' was expected
   	'x-powers,axp813-adc' was expected
   	'x-powers,axp803-adc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: pmic@34: battery-power:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-battery-power-supply'] is too short
   	'x-powers,axp202-battery-power-supply' was expected
   	'x-powers,axp209-battery-power-supply' was expected
   	'x-powers,axp221-battery-power-supply' was expected
   	'x-powers,axp803-battery-power-supply' was expected
   	'x-powers,axp813-battery-power-supply' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: pmic@34: battery-power: 'monitored-battery' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: pmic@34: usb-power:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-usb-power-supply'] is too short
   	'x-powers,axp717-usb-power-supply' is not one of ['x-powers,axp192-usb-power-supply', 'x-powers,axp202-usb-power-supply', 'x-powers,axp221-usb-power-supply', 'x-powers,axp223-usb-power-supply', 'x-powers,axp813-usb-power-supply']
   	'x-powers,axp803-usb-power-supply' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: pmic@34: usb-power: 'input-current-limit-microamp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: pmic@34: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: /soc/i2c@7081400/pmic@34/adc: failed to match any schema with compatible: ['x-powers,axp717-adc']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: /soc/i2c@7081400/pmic@34/battery-power: failed to match any schema with compatible: ['x-powers,axp717-battery-power-supply']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: /soc/i2c@7081400/pmic@34/usb-power: failed to match any schema with compatible: ['x-powers,axp717-usb-power-supply']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-938.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: pmic@34: adc:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-adc'] is too short
   	'x-powers,axp209-adc' was expected
   	'x-powers,axp221-adc' was expected
   	'x-powers,axp813-adc' was expected
   	'x-powers,axp803-adc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: pmic@34: battery-power:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-battery-power-supply'] is too short
   	'x-powers,axp202-battery-power-supply' was expected
   	'x-powers,axp209-battery-power-supply' was expected
   	'x-powers,axp221-battery-power-supply' was expected
   	'x-powers,axp803-battery-power-supply' was expected
   	'x-powers,axp813-battery-power-supply' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: pmic@34: battery-power: 'monitored-battery' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: pmic@34: usb-power:compatible: 'oneOf' conditional failed, one must be fixed:
   	['x-powers,axp717-usb-power-supply'] is too short
   	'x-powers,axp717-usb-power-supply' is not one of ['x-powers,axp192-usb-power-supply', 'x-powers,axp202-usb-power-supply', 'x-powers,axp221-usb-power-supply', 'x-powers,axp223-usb-power-supply', 'x-powers,axp813-usb-power-supply']
   	'x-powers,axp803-usb-power-supply' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: pmic@34: usb-power: 'input-current-limit-microamp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: pmic@34: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: /soc/i2c@7081400/pmic@34/adc: failed to match any schema with compatible: ['x-powers,axp717-adc']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: /soc/i2c@7081400/pmic@34/battery-power: failed to match any schema with compatible: ['x-powers,axp717-battery-power-supply']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: /soc/i2c@7081400/pmic@34/usb-power: failed to match any schema with compatible: ['x-powers,axp717-usb-power-supply']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
