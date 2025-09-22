Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BEA2D47E2
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Sep 2025 02:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758509453; cv=none; b=Za3i9cC9nwt27Tlycp7Er7rDkAivMGjivFhhOCturz+oSfuoMf/t2FA4PKIWbg0GqVBO8qPyQu99TXAXtO93sIaVbEPJi7itonm3aexrNiQWU9Fyr4LgEZulv3cxZRkcuKtwegDq26cKiTQh0gOnoJgUOd0PNYDZbBGbz/jL4KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758509453; c=relaxed/simple;
	bh=G9JAdHFtxesNBWjykcENs0/iWiM+3MpNegk/oO1X3F8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EIGsrkEygP1YtRldC7zAK6VgOgLsj+YdSzQ6ib0j+7s6KsMEJ/Il4ckn6WpklTJNbMWFQxpmtp7e/AtDDNue6Jan+6xUf0j3Dfl5cnEviO9IdDm54q6E2Ek6ko/3cQ1WP5nrYOkkeNqDbaJxttiPY6ZvSlM358860g+MMGzAHLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ne67EV9F; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ne67EV9F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758509451; x=1790045451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G9JAdHFtxesNBWjykcENs0/iWiM+3MpNegk/oO1X3F8=;
  b=Ne67EV9F576HZAxDWBI0A83d4uCryXBuFUhmW2PHdX4IgVS3gL+eZAyU
   EshBlEEuIB07LrpvkBAtEU08vifvr+/V8XrI/9bvnoOd/ykgWNoOSZe4J
   VPxoLeEj1MphpkQLYYh9emi+bhvHAQwFRm7+TqyLYWWx+SYAqfeU2MzaE
   CCgJwtvlmh/0d1yonEQFJ/KsL6BXTlieeG6DnR2rjO0ILjwVcJyqDkAXl
   RL3z6dMZUR6LlEJytnVOAIv2bY4b+zA35QUv5I8BJFvmr4ICocg0Ushc6
   Oc5JC2LcjVVaO9hw1wYvMo/BHT02qb33LVvn8lsQOrErqrls8TTFsPBL/
   g==;
X-CSE-ConnectionGUID: Ik5xlXKKRN+YFULEGAESAw==
X-CSE-MsgGUID: v30x4biOQaWESq7QpdXfRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="64590411"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="64590411"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 19:50:50 -0700
X-CSE-ConnectionGUID: XkNLMlUIQxeXfpV2Wk4wnA==
X-CSE-MsgGUID: WACg+YBMSNuqfe51k6g2aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="175962196"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 21 Sep 2025 19:50:49 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v0Wdb-000000003dN-2D4t;
	Mon, 22 Sep 2025 02:50:47 +0000
Date: Mon, 22 Sep 2025 04:50:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 12/140]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000/gpio: failed to
 match any schema with compatible: ['apple,smc-gpio']
Message-ID: <202509220408.u4BwVqgM-lkp@intel.com>
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
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Sven Peter <sven@kernel.org>
CC: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: Alyssa Rosenzweig <alyssa@rosenzweig.io>
CC: Neal Gompa <neal@gompa.dev>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   703a105e4188c8c9e084375a48f08853cf64cfca
commit: f469cb72754928cee7ed0b024a7f25f1885620a7 [12/140] arm64: dts: apple: t8103: Add SMC node
:::::: branch date: 15 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250922/202509220408.u4BwVqgM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509220408.u4BwVqgM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509220408.u4BwVqgM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: pmic@f (apple,sera-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
--
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: pmic@f (apple,sera-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
--
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: pmic@f (apple,sera-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
