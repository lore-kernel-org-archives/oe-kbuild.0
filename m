Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DE8191493
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Sep 2025 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758541557; cv=none; b=uF0zNLm1Giue1e+lydaMgvZ/85HYkO2vX2sX5ExqOUxdKGztUoZ2e2LTX6s/yoVexchtdwlTHCa+e9tk8fvSkrq78jJBWjI0l0XczyZBYKJatYhJaHL+1xbYKqWKGL/FZ9g1Z8+di3SzsfCRPuhD9dxlN2QKmfRf9sL0WoZYi7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758541557; c=relaxed/simple;
	bh=Uk/C0C7PhP1cgxMKHfXAWiaBFMS6NOfx+UdJVhHcCBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Li8+7rA1O2Jx1m4UR6kid8MVp/WgO35OKTN1iH5VsSo4NUr3L383N2evZOCLDtqXNUG1td/O50W6HuucSUvmY7JBH2kzwmGSr95pkOwoDZiqzHkx7kEgtrEUcUl6agIOMKhSKrx+SQ3TF5O+SPhSwxK+7yhlVg5z6UFCiGm5sjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jAWYysF2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jAWYysF2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758541556; x=1790077556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uk/C0C7PhP1cgxMKHfXAWiaBFMS6NOfx+UdJVhHcCBQ=;
  b=jAWYysF2h+rtMQV0yVUNez1eyYswBqnpZYwkgjtIjq0+Yppqdy9r03V4
   /cYbui4TMFDX33FvC9EUq28gTrzMk4WLHZp8jZO6zIal1s5fUoi38SDi6
   GE1zozaIoJEg7shg91sp4pPRFnAPfu5rT0VkcmBe9BXWwDeI/BgAgm7Ep
   tDfjBsXXvkn0Q9EOi1QUmL0Pw+pmpRQIxonQ7IG+r+YmuhjQK7JCW0Aan
   S7bMPpZdwTT1h0kPS2wtHf3VC7AmwRceeHK4C5F6SnHU7ldDbcNO7EJY/
   h+LsKxCAanNCqU0sfAiu3sJxqNDYFuo9LrH1dzQhUMHN4mrw50sb8woUR
   w==;
X-CSE-ConnectionGUID: URfwhvU1SfKbmSEyR2xfcQ==
X-CSE-MsgGUID: bNH8OMbZRxOeoybOGwSKNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64606087"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64606087"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 04:45:55 -0700
X-CSE-ConnectionGUID: p6opw/k2R0+rYLFZOoXCmA==
X-CSE-MsgGUID: dvedIIv8SuyW/6Lq0n22oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="175593811"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 22 Sep 2025 04:45:54 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v0ezP-000000003kv-27EU;
	Mon, 22 Sep 2025 11:45:51 +0000
Date: Mon, 22 Sep 2025 13:45:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 19/140]
 arch/arm64/boot/dts/apple/t8112-j415.dtb: pmic@e (apple,stowe-pmic):
 nvmem-layout: Unevaluated properties are not allowed ('#address-cells',
 '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703',
 'boot-stage@f701', 'fault-shadow@867b', 'panic-...
Message-ID: <202509221339.u5OGBfaK-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>
CC: Neal Gompa <neal@gompa.dev>
CC: Sven Peter <sven@kernel.org>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   703a105e4188c8c9e084375a48f08853cf64cfca
commit: 4a2544346f8f515c3e4370b44ffdf62d466b9c7a [19/140] arm64: dts: apple: Add devicetreee for t8112-j415
:::::: branch date: 24 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250922/202509221339.u5OGBfaK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509221339.u5OGBfaK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509221339.u5OGBfaK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112.dtsi:491.25-500.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j415.dtb: pmic@e (apple,stowe-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703', 'boot-stage@f701', 'fault-shadow@867b', 'panic-count@f702,4', 'pm-setting@f801', 'rtc-offset@f900', 'shutdown-flag@f70f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: pmic@e (apple,stowe-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703', 'boot-stage@f701', 'fault-shadow@867b', 'panic-count@f702,4', 'pm-setting@f801', 'rtc-offset@f900', 'shutdown-flag@f70f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: pmic@e (apple,stowe-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: nvmem-layout (fixed-layout): 'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
