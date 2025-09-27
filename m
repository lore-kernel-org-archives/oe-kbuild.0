Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA201FBEB6
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Sep 2025 09:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758967081; cv=none; b=RJowBOukVHs8HFkjCflD+VN+1zoMO9wv3+rMW6VlIBcpVOFunrdOyADIHZUNpayr3oxEBfU4Qgr/JqAUMN+2AByCMxm61qaf04FM6DKVeJStGlh0rcwY768akGVunHxcXylGt0ggfs39Zcy8W/ACYl8Qawe5W3Xn42MC4pUveLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758967081; c=relaxed/simple;
	bh=dZ+UimYkKIUf9MrQrO/j3hFlsJDRGvAD23tLCh8SrkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bYubQDOUxGajVUzdVvIPLnKrGx+0zhSR+bspWz13nU1s/Y0dHRiuT9KReDEi+W/faF62mCkM7btEF1/sYkEy7xa1IbbwjeYDFlrlamHm+KtmoQHw+04nSypgzLHp7ZlhBbwykQosvvs8jSJs1p99dk+VmZqb7OIdjYfiQloKlIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfL0Wz2R; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfL0Wz2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758967079; x=1790503079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dZ+UimYkKIUf9MrQrO/j3hFlsJDRGvAD23tLCh8SrkU=;
  b=dfL0Wz2RDFKLJeGmfqgOijo6KOpU0wKCcfJ5eiRFANrE3H+sOUQwbrNC
   p2sD4chldwO9ziHBS6FFvqE1rka+GSJGlmGRY95zrR+12qirXvRCMYP3P
   gMAXxg7sichzlCk78QDhbt9nR2tBoUXSFq2biP6vc8WLmERW8jklHFXVi
   sbyL6Syt1HVD5vymCrTWeDqTHZrK9fUAQ/kkYA2kecIv6PE4cOfCwZhmJ
   OWL5wSP8QDBYVOAwwLVcdQrC3zCA7jsAzUIKLumkdkZhdvjOXry59+39J
   mzlczuZipcAbaCFoa0QjtmU6XhYVkEOBEmqOJ8mWMzdWZH5kibsjG32sD
   Q==;
X-CSE-ConnectionGUID: OToFHh5ESee3nFiJD+Dnaw==
X-CSE-MsgGUID: dTya0E15QhuJWQe5TcpCBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="72381675"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="72381675"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 02:57:58 -0700
X-CSE-ConnectionGUID: B7cOLeojTuieI3G7059jcw==
X-CSE-MsgGUID: TVQAc5cWSdiV0Khd4i4y9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="178214965"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 27 Sep 2025 02:57:57 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v2Rgg-000000005TB-3aFR;
	Sat, 27 Sep 2025 09:57:54 +0000
Date: Sat, 27 Sep 2025 11:57:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 14/140]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/smc@290400000: failed to
 match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
Message-ID: <202509271149.NvAz7FUe-lkp@intel.com>
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
:::::: branch date: 6 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250927/202509271149.NvAz7FUe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509271149.NvAz7FUe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509271149.NvAz7FUe-lkp@intel.com/

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
