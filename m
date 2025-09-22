Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18619288538
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Sep 2025 21:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758575404; cv=none; b=DTrZQGjVRmpcJKu4Q7TLSsXCaV6kRhRiUpf6C7O3+Vy36p/k/MSkkZNMWwlNEyNhHuBzkMkgYn3JbVeo09w6NLol61LCYLR6bDqxFgvatCyD9ICSARaoayOnI+pIDdYD9R3eCClrFu4lRaBnny4dEcLyjpE9wQoqhzgIdJ2Vaxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758575404; c=relaxed/simple;
	bh=ODZ93Kt8AvGkbYV2+t7vpETxWpmImUfA06rD9EKTN9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TMk50qTot/Exk+kwolYVMfsFDXQCW/UzBcEuXw8bq1TsVQyh98z+PkmvZi1fSUhxdWBP/8w1B3g62eA73x/qwTlM+y48+lMgLx5ttGa5tIws8gOyY85o3a4YDFk1gf6wl9F1TaOE1K1uJ9yLd3mxTVDz0tC45l9voTY5D3pAZXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=imUFOo7Q; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="imUFOo7Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758575402; x=1790111402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ODZ93Kt8AvGkbYV2+t7vpETxWpmImUfA06rD9EKTN9Q=;
  b=imUFOo7Qs9WE4cUy8J8io/cYHA5QJi6VyjriinmZUfkSvjg4817gCJxS
   tNVZBJ8LGHk47+zxpjXS4W8vy88yBewUKC7/jdtswunGZitxsls/GsuyV
   PJfkqpg9mNmakk9e1ovRqkOdhCop08qUMrUGOgrxNcJSkDu+FybUPJv1F
   6krCMwGhbwJobRPhz9w8oiP5m0kUEA0WOgeCi5hMmjaE3aVuIWHGBorVF
   Huu1CAl9Jsz76Qqdt78XUUPyF68ViKNgjNzPiKTDIWPWnLjHL/hMkZACE
   gtvY8EWUpBKYb9O98nAQHAw/cpt1vVjQhKcG5LliBBI7Gi8MNDV/ORd5/
   Q==;
X-CSE-ConnectionGUID: 8PtPX8gpS+OSxX3dQnhhBg==
X-CSE-MsgGUID: nFc9HR1HTCKNR9XOXRi2hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61013341"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="61013341"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 14:10:02 -0700
X-CSE-ConnectionGUID: LarMvcUbThSkBorHH9eI6w==
X-CSE-MsgGUID: DzpGUsy+Rv+TZTT992AsJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="177359016"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 22 Sep 2025 14:10:00 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v0nnK-000000003wP-0PmG;
	Mon, 22 Sep 2025 21:09:58 +0000
Date: Mon, 22 Sep 2025 23:09:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 14/140]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/smc@290400000: failed to
 match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
Message-ID: <202509222300.kyAvtmlr-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>
CC: Alyssa Rosenzweig <alyssa@rosenzweig.io>
CC: Neal Gompa <neal@gompa.dev>
CC: Sven Peter <sven@kernel.org>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   703a105e4188c8c9e084375a48f08853cf64cfca
commit: 022b9f049ba6026950b7024a122e9ef7cf09ad26 [14/140] arm64: dts: apple: t600x: Add SMC node
:::::: branch date: 33 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250922/202509222300.kyAvtmlr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509222300.kyAvtmlr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509222300.kyAvtmlr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/smc@290400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/smc@290400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
--
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/smc@290400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/smc@290400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
--
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/smc@290400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/smc@290400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
--
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/smc@290400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/smc@290400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
--
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/smc@290400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/smc@290400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
--
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/smc@290400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/smc@290400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
