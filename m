Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF61C310783
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Sep 2025 16:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758557582; cv=none; b=LrOQECd3eSZ2QRiFFPjL74spyuTHfVj5Ozk0rWPnZ4Gb1HU7WXgV4jM6GKYBRkBqBohEx69b3ZSS4jsnl2Zvf8y9U7roKoGDTz/H1citkqR2XmGq3OJjFiIw3Nl9P403irshE/GDw5XWiuOLrxXoPiCq+vOYQ5/zEObzHHWltSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758557582; c=relaxed/simple;
	bh=3vx95bOhlWCcS8pVsxWLjA0gBqh0DI7+kfVXO2nkejs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jAdR+81YrG3EPz2R5/Btx2McBkgcBYtJq04Ar6bPSvllbdwW+CDJC9vlp9DPNVTTawzJNrkxLvBBia5S048WdLaBieRqJmKkHSewVJYJ3wXdymGsJwzTLhiHvlXr2fJwIRVKrj+F93867zZ700PYWb1SUGubCZWn4lmumtVVx7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccIxEk5g; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccIxEk5g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758557580; x=1790093580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3vx95bOhlWCcS8pVsxWLjA0gBqh0DI7+kfVXO2nkejs=;
  b=ccIxEk5gOMIV56Ou7YUtTcZKTHAmwowVrPsmq6EWPUk/1BFAzSqM35Al
   0GpDPimhek+lKNPhtFHjYvvxOIJIjV33gkvyV7gLlmsvoJ+3RmwbwKPPg
   urCduSTpumioohcNDrXoIEHLkKuwh61uiu6wI27y5vjoEAn79e0MCnqPQ
   O6RAw8ci373O9yZM253NGZ1UmImbn9yNVqSsDL808HhMcWc0I0T51SWe2
   bu4o+6TJ9MxPIV7g0ZkZdyvoYVMH+YQz4zPEfzyD45alwtO7CG/H6+Yza
   KsRf42ICODzkpuaKTfS0uspgC+VIagGMvqpmJyFOWNGpvs02dzCJkSWD0
   A==;
X-CSE-ConnectionGUID: gfV6tkvtR2ewehxcGLzc2g==
X-CSE-MsgGUID: SwireiDiSBG2+eQ4Cie97g==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60988513"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="60988513"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 09:12:59 -0700
X-CSE-ConnectionGUID: y4kBI6DMTF2dugZkePoVhQ==
X-CSE-MsgGUID: Pr9GAYNoQRuZcq9tjPi3sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="207462168"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 22 Sep 2025 09:12:57 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v0j9r-000000003sT-38e7;
	Mon, 22 Sep 2025 16:12:55 +0000
Date: Mon, 22 Sep 2025 18:12:44 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 12/140]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000: failed to
 match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
Message-ID: <202509221823.ctawahgH-lkp@intel.com>
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
:::::: branch date: 28 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250922/202509221823.ctawahgH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509221823.ctawahgH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509221823.ctawahgH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: pmic@f (apple,sera-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
--
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: pmic@f (apple,sera-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
--
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: pmic@f (apple,sera-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
--
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: pmic@f (apple,sera-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
--
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: pmic@f (apple,sera-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
