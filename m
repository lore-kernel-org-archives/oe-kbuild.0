Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20F51B81D3
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 01:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768007071; cv=none; b=LDiF950jjMD1BfYa/X0fuqWBtmyHaZBfc5jT7S6kZX5Zt2H+f6GMQaAnX7gLfZcfaEXAHzVfJxLeM47OzG40JVNSkjxNJoXhYrtzSJY9qI3732BQep0vLAQuWEb9xwmt6zwEcTWFw39aRxK1BBrrkRm+At1/UEdlLWHYQHJPaq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768007071; c=relaxed/simple;
	bh=1Ktx3nmllStHL7WILLgwHHN9TvnQ36tq80+CfyFBzHw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FrNb+P/aU2pYHxsz2o5VZQ6D1QgM8RklIVfmZnA8fSMZjlt18SrhcN5y8lQs5mJRzPX0owFdJG0iJMrwCZvbGJcqVqluKt1dYXlz4FInCGqGZcLd+/X7MssGKafVrOqSFZ8e7onLPYvpCgscOkEF9hsogWcABNakrbMnb1NrRnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZP7h+94V; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZP7h+94V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768007070; x=1799543070;
  h=date:from:to:cc:subject:message-id;
  bh=1Ktx3nmllStHL7WILLgwHHN9TvnQ36tq80+CfyFBzHw=;
  b=ZP7h+94VLd/5EYcItSfVpnRJ61UwAY8J0ctYsChXzfL1QKvABC0YPNLl
   uWzFGXdS/BW/yfCh55YgZP1Tu7H5Gp3vOukYSeFg5hoITk56qtYG9novm
   zyy1UN1Z97rNlDN3fJSnGQQNnfdekurePCLIgtRo1k1lznascEVUv74W8
   BoCE6yTYaWeqaaI9gQSbCl3MdhCx/gq23BhhlYGvOPoP3BrqK4GgWcxmN
   bINf30WD67vw2Ujau4Sz9W3lAfzidgFVPGp44AkOFCXXIMiTD45RDXWHC
   NNk6Mhxps9DlpuCKwjk+X68adnI9HHDC1SV1zck5uniXUP4b+5YqXuDQo
   Q==;
X-CSE-ConnectionGUID: a6twM616TymS8qAldqw66w==
X-CSE-MsgGUID: R2bPJibKQP6Y0CIsOm/sVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69288663"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69288663"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 17:04:29 -0800
X-CSE-ConnectionGUID: rF67K+XpTcGbJLzX8vZQuw==
X-CSE-MsgGUID: GFI0kWG3RJK4VCTl/46EyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="207741597"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 09 Jan 2026 17:04:28 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veNOz-000000002AC-2zkv;
	Sat, 10 Jan 2026 01:04:25 +0000
Date: Sat, 10 Jan 2026 02:04:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.20-armsoc/dts64 8/40]
 arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb:
 /i2c@ff3c0000/eeprom@50: failed to match any schema with compatible:
 ['belling,bl24c04a', 'atmel,24c04']
Message-ID: <202601100248.LB1saO5R-lkp@intel.com>
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
CC: linux-rockchip@lists.infradead.org
TO: FUKAUMI Naoki <naoki@radxa.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.20-armsoc/dts64
head:   da0de806d8b46238ac3891a894806da4d1c26cdf
commit: 1b2d6b75e2b3374157c9015435381b217a887145 [8/40] arm64: dts: rockchip: Add EEPROMs for Radxa ROCK 4 boards
:::::: branch date: 5 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2051-20260109 (https://download.01.org/0day-ci/archive/20260110/202601100248.LB1saO5R-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601100248.LB1saO5R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601100248.LB1saO5R-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: usb@fe800000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: /i2c@ff3c0000/eeprom@50: failed to match any schema with compatible: ['belling,bl24c04a', 'atmel,24c04']
>> arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: eeprom@50 (belling,bl24c04a): compatible: 'oneOf' conditional failed, one must be fixed:
>> 	arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: eeprom@50 (belling,bl24c04a): compatible: 'oneOf' conditional failed, one must be fixed:
   		'belling,bl24c04a' does not match 'c00$'
   		'belling,bl24c04a' does not match 'c01$'
   		'belling,bl24c04a' does not match 'cs01$'
   		'belling,bl24c04a' does not match 'c02$'
   		'belling,bl24c04a' does not match 'cs02$'
   		'belling,bl24c04a' does not match 'mac402$'
   		'belling,bl24c04a' does not match 'mac602$'
   		'belling,bl24c04a' does not match 'c04$'
   		'belling,bl24c04a' does not match 'cs04$'
   		'belling,bl24c04a' does not match 'c08$'
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dtb: /i2c@ff3c0000/eeprom@50: failed to match any schema with compatible: ['belling,bl24c04a', 'atmel,24c04']
>> arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dtb: eeprom@50 (belling,bl24c04a): compatible: 'oneOf' conditional failed, one must be fixed:
>> 	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dtb: eeprom@50 (belling,bl24c04a): compatible: 'oneOf' conditional failed, one must be fixed:
   		'belling,bl24c04a' does not match 'c00$'
   		'belling,bl24c04a' does not match 'c01$'
   		'belling,bl24c04a' does not match 'cs01$'
   		'belling,bl24c04a' does not match 'c02$'
   		'belling,bl24c04a' does not match 'cs02$'
   		'belling,bl24c04a' does not match 'mac402$'
   		'belling,bl24c04a' does not match 'mac602$'
   		'belling,bl24c04a' does not match 'c04$'
   		'belling,bl24c04a' does not match 'cs04$'
   		'belling,bl24c04a' does not match 'c08$'
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dtb: codec@11 (everest,es8316): Unevaluated properties are not allowed ('interrupt-parent', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8316.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dtb: /i2c@ff3c0000/eeprom@50: failed to match any schema with compatible: ['belling,bl24c04a', 'atmel,24c04']
>> arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dtb: eeprom@50 (belling,bl24c04a): compatible: 'oneOf' conditional failed, one must be fixed:
>> 	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dtb: eeprom@50 (belling,bl24c04a): compatible: 'oneOf' conditional failed, one must be fixed:
   		'belling,bl24c04a' does not match 'c00$'
   		'belling,bl24c04a' does not match 'c01$'
   		'belling,bl24c04a' does not match 'cs01$'
   		'belling,bl24c04a' does not match 'c02$'
   		'belling,bl24c04a' does not match 'cs02$'
   		'belling,bl24c04a' does not match 'mac402$'
   		'belling,bl24c04a' does not match 'mac602$'
   		'belling,bl24c04a' does not match 'c04$'
   		'belling,bl24c04a' does not match 'cs04$'
   		'belling,bl24c04a' does not match 'c08$'
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dtb: /i2c@ff3c0000/eeprom@50: failed to match any schema with compatible: ['belling,bl24c04a', 'atmel,24c04']
>> arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dtb: eeprom@50 (belling,bl24c04a): compatible: 'oneOf' conditional failed, one must be fixed:
>> 	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dtb: eeprom@50 (belling,bl24c04a): compatible: 'oneOf' conditional failed, one must be fixed:
   		'belling,bl24c04a' does not match 'c00$'
   		'belling,bl24c04a' does not match 'c01$'
   		'belling,bl24c04a' does not match 'cs01$'
   		'belling,bl24c04a' does not match 'c02$'
   		'belling,bl24c04a' does not match 'cs02$'
   		'belling,bl24c04a' does not match 'mac402$'
   		'belling,bl24c04a' does not match 'mac602$'
   		'belling,bl24c04a' does not match 'c04$'
   		'belling,bl24c04a' does not match 'cs04$'
   		'belling,bl24c04a' does not match 'c08$'
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dtb: codec@11 (everest,es8316): Unevaluated properties are not allowed ('interrupt-parent', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8316.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dtb: /i2c@ff3c0000/eeprom@50: failed to match any schema with compatible: ['belling,bl24c04a', 'atmel,24c04']
>> arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dtb: eeprom@50 (belling,bl24c04a): compatible: 'oneOf' conditional failed, one must be fixed:
>> 	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dtb: eeprom@50 (belling,bl24c04a): compatible: 'oneOf' conditional failed, one must be fixed:
   		'belling,bl24c04a' does not match 'c00$'
   		'belling,bl24c04a' does not match 'c01$'
   		'belling,bl24c04a' does not match 'cs01$'
   		'belling,bl24c04a' does not match 'c02$'
   		'belling,bl24c04a' does not match 'cs02$'
   		'belling,bl24c04a' does not match 'mac402$'
   		'belling,bl24c04a' does not match 'mac602$'
   		'belling,bl24c04a' does not match 'c04$'
   		'belling,bl24c04a' does not match 'cs04$'
   		'belling,bl24c04a' does not match 'c08$'
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dtb: codec@11 (everest,es8316): Unevaluated properties are not allowed ('interrupt-parent', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8316.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dtb: /i2c@ff3c0000/eeprom@50: failed to match any schema with compatible: ['belling,bl24c04a', 'atmel,24c04']
>> arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dtb: eeprom@50 (belling,bl24c04a): compatible: 'oneOf' conditional failed, one must be fixed:
>> 	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dtb: eeprom@50 (belling,bl24c04a): compatible: 'oneOf' conditional failed, one must be fixed:
   		'belling,bl24c04a' does not match 'c00$'
   		'belling,bl24c04a' does not match 'c01$'
   		'belling,bl24c04a' does not match 'cs01$'
   		'belling,bl24c04a' does not match 'c02$'
   		'belling,bl24c04a' does not match 'cs02$'
   		'belling,bl24c04a' does not match 'mac402$'
   		'belling,bl24c04a' does not match 'mac602$'
   		'belling,bl24c04a' does not match 'c04$'
   		'belling,bl24c04a' does not match 'cs04$'
   		'belling,bl24c04a' does not match 'c08$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
