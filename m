Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0064277C88
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Sep 2026 03:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790567815; cv=none; b=OBUMTH5hCFQg/FZ319yVs7NeeokmjZSQpEOuwmhpL2goqStl6DlTuqGqG16dPS+t3Xy4N0w8g8D1Gbp685ZxRuVoBly23LMN+mpdbWvFqJWEsUe2aqJEzUDZ4m7WCryhr0laNppHgNQn3olutAduHo/dkSuJdDZibgkOhbcPz3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790567815; c=relaxed/simple;
	bh=tFXPmSGk/2IlXcB6iuGmSjd0TF42TsUvNrDfSKlLhjE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YyXTLZAP/+RCuaK+kBgDETS8fwS5ChJluKQs9pPsbTA/tn/eGd1Lv7aljbcaSX/e9fTzcipHV4RSkOfJZL2wqYRLG5t+Rjpfg/qfn5uh6qtM3hwXTOUNMMV6oq25HFlp7YQrmQNLxAR2CqDfdUIC5mASB6heUnHVNNeilyuEAYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDSxE/ES; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDSxE/ES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790567814; x=1822103814;
  h=date:from:to:cc:subject:message-id;
  bh=tFXPmSGk/2IlXcB6iuGmSjd0TF42TsUvNrDfSKlLhjE=;
  b=cDSxE/ES/yJ9F3aPEObUFvB1+6V3D2og7hz+7RSOeLoGl1xLRVNr2C3+
   3O6bki3+hhHkmtGvW/FHvo9cNNFhIC2OnN4oMIZjZRrsPCjQdm+hEbbhS
   EuqAvlU2EJyb6bd+ApEdQhyEwrqT/DgBBIUiPIAHOyeOqPphT0t35F2vQ
   R1tsgj8y6nXhdiLx3mDZWqho9aMzpDqllShVJctNUrH5l73mdfo0HZKFE
   UeNJpbPaIndNo30AN2S5T7peuGh9o1FLhKDXJLq1IA+M9XiP+5xONrSz5
   kDhRLYKz85fhNNzBCZDrClas2/XbrtOL+LxVIQAUFUJMMyKBnTZFG+oX9
   w==;
X-CSE-ConnectionGUID: XsRpEVcvRD6zCiGOnsc37g==
X-CSE-MsgGUID: T0bqo4fCR8iavs7LKHVCGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="78820313"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="78820313"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 20:56:53 -0700
X-CSE-ConnectionGUID: YRgWsHg9Te2RIzzaRCcvhw==
X-CSE-MsgGUID: YM+U8YHeRWKx9YIyUX7jeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="273549609"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 27 Sep 2026 20:56:52 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xB2Ty-000000000qt-0MZE;
	Mon, 28 Sep 2026 03:56:50 +0000
Date: Mon, 28 Sep 2026 05:56:25 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-nomadik:ux500-dts-for-soc 3/9]
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg1: ste,config:
 b'\x00\x00\x00(' is not of type 'object', 'integer', 'array', 'boolean',
 'null'
Message-ID: <202609280556.gpnJVG3Q-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-dts-for-soc
head:   2eb92e6b94b612eccb53366f65018ae5e8d072d5
commit: 72c808001efa2a4146821ecb6f70645c15eb9629 [3/9] ARM: dts: ux500: Add the Imagis ISA to Janice DTS
:::::: branch date: 4 days ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-2400-20260924 (https://download.01.org/0day-ci/archive/20260928/202609280556.gpnJVG3Q-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609280556.gpnJVG3Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609280556.gpnJVG3Q-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg1: ste,config: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg2: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg1: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg2: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg3: ste,config: b'\x00\x00\x00*' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg1: ste,config: b'\x00\x00\x00(' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg2: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg3: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: proximity@44 (sharp,gp2ap002a00f): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
--
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-0 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'magnetometer@2e' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: current-sense-shunt (current-sense-shunt): 'io-channel-ranges' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/afe/current-sense-shunt.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-1 (i2c-gpio): $nodename:0: 'i2c-gpio-1' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-1 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-frequency', 'touchkey@20' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-2 (i2c-gpio): $nodename:0: 'i2c-gpio-2' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-2 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'haptic-engine@49' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-3 (i2c-gpio): $nodename:0: 'i2c-gpio-3' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-3 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'nfc@2b' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: nfc@2b (nxp,pn544-i2c): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nfc/nxp,pn544.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
