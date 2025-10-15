Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B9A338F26
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Oct 2025 16:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760547566; cv=none; b=ginb+cuiGY1tKAjaIWK/XcLwACqEziaySPQWT6lp/IHhTsouGk74yw+o0Jr6jyb0MP+yqfO4BhTZVNTsNqf/8opWW0ui58VVkGJogOwnwkn9WOkCbxxFs73wCpYUjV8dPzh8oNOjyVsFowpJ3kVfyUMET02M+tCfXW+gR/fsZX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760547566; c=relaxed/simple;
	bh=6Bxt4Ylm+f0Wk3CQlLaOqc8iC7JDCc95CqXBeSGr8+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fuNCHQ/HtNefb80boVXqsfOrO3CYEBua4U/pW59NVsunLCVGf9sltP7Wxrdiv8vtzxdvMreJBw7hEL1U+xZOiTuKluKRGupl1hmu+K7p4trPtGk7aY13xTB3tOxiQCeoRLPkYpsBNtN8idleXafrTRbedipUm/5J0Peyr0i+CmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+ijAM4W; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+ijAM4W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760547565; x=1792083565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Bxt4Ylm+f0Wk3CQlLaOqc8iC7JDCc95CqXBeSGr8+M=;
  b=c+ijAM4WzPCnqFRQNgSnIiWX6do/OhKFz7gFHp1K3MbjY0jOWHlSOClq
   KZDdoWkp7QjL9EP3TeW7WV/+ngojo7l1cYkgOGJo4VVQ+vQlIXGAsmGcv
   NAUEa2CyhVf3Q2duc03nFIUfk69qvCZ5tbgCr/QchJvvkDfdrWTvoluRw
   05zh/zaLgLErV+Gc/8zGJrCbcbqeWFmXeBDkbTH0/480qDeWmwjio2NnT
   U+27cCdUHUVlUA2lLdq89ZKsuBenRAsszP3Yv+GUZgzBfDHQE8820fhzQ
   PUr6OgSMD+PnZIpxDBmWseJlSpvz44NmP2CT0wNyXJOYeEF4cVh4ZoMsp
   g==;
X-CSE-ConnectionGUID: 4m0Zu5VDR36Xkr8HP/i+mg==
X-CSE-MsgGUID: E4Ju69zZRyW3usAW83ef1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62658521"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62658521"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 09:59:24 -0700
X-CSE-ConnectionGUID: R/RbXaIsSzu6qLzN4hgaxg==
X-CSE-MsgGUID: r7z3G4GETNGoM3EZS2YkRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="182688661"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 15 Oct 2025 09:59:22 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v94qO-00043T-0W;
	Wed, 15 Oct 2025 16:59:20 +0000
Date: Thu, 16 Oct 2025 00:59:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: arm: Convert Marvell CP110 System
 Controller to DT schema
Message-ID: <202510160010.eXpDz1oH-lkp@intel.com>
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
In-Reply-To: <20251014153021.3783485-1-robh@kernel.org>
References: <20251014153021.3783485-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linusw-pinctrl/devel linusw-pinctrl/for-next krzk/for-next krzk-mem-ctrl/for-next linus/master v6.18-rc1]
[cannot apply to clk/clk-next krzk-dt/for-next next-20251015]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-arm-Convert-Marvell-CP110-System-Controller-to-DT-schema/20251014-235819
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251014153021.3783485-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: arm: Convert Marvell CP110 System Controller to DT schema
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arm64-randconfig-052-20251015 (https://download.01.org/0day-ci/archive/20251016/202510160010.eXpDz1oH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160010.eXpDz1oH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510160010.eXpDz1oH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: pinctrl (marvell,armada-8k-cpm-pinctrl): 'copper-eth-phy-reset' does not match any of the regexes: '-pins(-.+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/marvell,armada-7k-pinctrl.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: phy@120000 (marvell,comphy-cp110): phy@2: 'connector' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
--
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-db.dtb: pinctrl (marvell,armada-8k-cps-pinctrl): 'nand-rb' does not match any of the regexes: '-pins(-.+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/marvell,armada-7k-pinctrl.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: cp0-usb3-0-phy (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: cp1-usb3-0-phy (usb-nop-xceiv): '#phy-cells' is a required property
--
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: phy@120000 (marvell,comphy-cp110): phy@2: 'connector' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: pinctrl (marvell,armada-8k-cps-pinctrl): 'nand-rb' does not match any of the regexes: '-pins(-.+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/marvell,armada-7k-pinctrl.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1-bus/bus@f4000000/spi@700680/flash@0: failed to match any schema with compatible: ['st,w25q32']
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: pinctrl (marvell,cp115-standalone-pinctrl): 'nand-rb' does not match any of the regexes: '-pins(-.+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/marvell,armada-7k-pinctrl.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: pca953x@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: usb-phy-1 (usb-nop-xceiv): '#phy-cells' is a required property
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: pinctrl (marvell,cp115-standalone-pinctrl): 'nand-rb' does not match any of the regexes: '-pins(-.+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/marvell,armada-7k-pinctrl.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: pca953x@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb-phy-1 (usb-nop-xceiv): '#phy-cells' is a required property
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: pinctrl (marvell,cp115-standalone-pinctrl): 'nand-rb' does not match any of the regexes: '-pins(-.+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/marvell,armada-7k-pinctrl.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: pca953x@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb-phy-1 (usb-nop-xceiv): '#phy-cells' is a required property
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: pinctrl (marvell,cp115-standalone-pinctrl): 'nand-rb' does not match any of the regexes: '-pins(-.+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/marvell,armada-7k-pinctrl.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb@500000 (marvell,armada-8k-xhci): 'phys' is a dependency of 'phy-names'
   	from schema $id: http://devicetree.org/schemas/phy/phy-consumer.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb@510000 (marvell,armada-8k-xhci): 'phys' is a dependency of 'phy-names'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
