Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3100A30506A
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Sep 2025 19:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758742051; cv=none; b=dWMfOKBc87QJaxLf4Vbdvi6JDmpVxJ7iEh7ijX/xDmvCGXtv5NI7jYAhBIneIuEJqkimfD1GEIPQaIsUvKpd83Mb1ilDLb1zoZ+H2/+HxnmY3/kF7HSYJLxq6C0QBOoQpLB5zHjvOwOhCfTkEKgG5AAhdyBiRqn0GaPv48H2LCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758742051; c=relaxed/simple;
	bh=BPH5C4WmnwKgeMC3rYcLEi9AM5ZrSnq/D5oXrnXtLYY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NAIeW1UpRG5ahQytvokZww53LFnvujq0Irz88Q/3THvCZCzom0VbRYe68X3JZcDV5PbL6LexhPKDcGeL2/KxT2gIfVoMItDec3co5o7IxBcHl+B1Bl2E+mspiRDug5a0bsdRHMRssio6ISOT7Y3bHMwWFCkXLT++wA+XK9mJOdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBjYfnVa; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBjYfnVa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758742048; x=1790278048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BPH5C4WmnwKgeMC3rYcLEi9AM5ZrSnq/D5oXrnXtLYY=;
  b=KBjYfnVaVgWTfloikQOb9XMI/7jqTu1L+xI4QTUWo16NA4YHfdM5PCB7
   kEEp9J4D8BcJ3CqWyFhUwpp+eq6w2bUeG4fugOiGcP9wmpk7rf7ZdTRnh
   CwRMt7tDeL+AP6dkqI0OG3aZRuQFoSe97WgH3M6De9Aeq412XVVaDsmmK
   z6FPXcX4FFu/NWo64Gdkjso2FVhOwbtYlA32mPG9xXb+FE1ITF5CKaxUo
   O0Uw7ixtHj6aW7s5sWQOZdBBnCBPeglGz25imI59P9/1cZQPWKup5Agrq
   cjy6DxG3l5rD916i9fpm63s6em9H3UKMcKBz9t496CWSQiV8jwtjyKrP2
   w==;
X-CSE-ConnectionGUID: N7t1lTgoS0+jV1//CEAEJQ==
X-CSE-MsgGUID: KNvR1az6QrGvGzj79QEIHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60963641"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60963641"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 12:27:27 -0700
X-CSE-ConnectionGUID: 5qwjDMVuRbibMRJsUdc1VQ==
X-CSE-MsgGUID: KK2p9lSDSnOgGdjErgk8lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="200802302"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 24 Sep 2025 12:27:26 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v1V9A-000000004dl-0Swv;
	Wed, 24 Sep 2025 19:27:24 +0000
Date: Wed, 24 Sep 2025 21:26:58 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 1/140]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: pmic@f (apple,sera-pmic):
 nvmem-layout: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202509242138.Bn1x42H8-lkp@intel.com>
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
TO: Sven Peter <sven@kernel.org>
CC: Janne Grunau <j@jannau.net>

Hi Sven,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   703a105e4188c8c9e084375a48f08853cf64cfca
commit: 4439580d6a60770726166c428226db0abe216110 [1/140] arm64: dts: apple: Add bit offset to PMIC NVMEM node names
:::::: branch date: 3 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250924/202509242138.Bn1x42H8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509242138.Bn1x42H8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509242138.Bn1x42H8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103.dtsi:414.25-423.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: pmic@f (apple,sera-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: pmic@f (apple,sera-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
--
   arch/arm64/boot/dts/apple/t8103.dtsi:414.25-423.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:425.26-429.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: pmic@f (apple,sera-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: pmic@f (apple,sera-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
--
   arch/arm64/boot/dts/apple/t8103.dtsi:414.25-423.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j313.dtb: pmic@f (apple,sera-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: pmic@f (apple,sera-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
--
   arch/arm64/boot/dts/apple/t8103.dtsi:414.25-423.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j456.dtb: pmic@f (apple,sera-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: pmic@f (apple,sera-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
--
   arch/arm64/boot/dts/apple/t8103.dtsi:414.25-423.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: pmic@f (apple,sera-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: pmic@f (apple,sera-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
--
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
--
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
--
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
--
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
--
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
--
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
--
   arch/arm64/boot/dts/apple/t8112.dtsi:429.25-438.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j413.dtb: pmic@e (apple,stowe-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703', 'boot-stage@f701', 'fault-shadow@867b', 'panic-count@f702,4', 'pm-setting@f801', 'rtc-offset@f900', 'shutdown-flag@f70f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: pmic@e (apple,stowe-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703', 'boot-stage@f701', 'fault-shadow@867b', 'panic-count@f702,4', 'pm-setting@f801', 'rtc-offset@f900', 'shutdown-flag@f70f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: pmic@e (apple,stowe-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: nvmem-layout (fixed-layout): 'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
--
   arch/arm64/boot/dts/apple/t8112.dtsi:429.25-438.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j473.dtb: pmic@e (apple,stowe-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703', 'boot-stage@f701', 'fault-shadow@867b', 'panic-count@f702,4', 'pm-setting@f801', 'rtc-offset@f900', 'shutdown-flag@f70f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: pmic@e (apple,stowe-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703', 'boot-stage@f701', 'fault-shadow@867b', 'panic-count@f702,4', 'pm-setting@f801', 'rtc-offset@f900', 'shutdown-flag@f70f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: pmic@e (apple,stowe-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: nvmem-layout (fixed-layout): 'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
--
   arch/arm64/boot/dts/apple/t8112.dtsi:429.25-438.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:440.26-444.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j493.dtb: pmic@e (apple,stowe-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703', 'boot-stage@f701', 'fault-shadow@867b', 'panic-count@f702,4', 'pm-setting@f801', 'rtc-offset@f900', 'shutdown-flag@f70f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: pmic@e (apple,stowe-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703', 'boot-stage@f701', 'fault-shadow@867b', 'panic-count@f702,4', 'pm-setting@f801', 'rtc-offset@f900', 'shutdown-flag@f70f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: pmic@e (apple,stowe-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: nvmem-layout (fixed-layout): 'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
