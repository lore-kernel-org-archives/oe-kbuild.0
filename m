Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AA91DC9B3
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Aug 2025 11:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754652084; cv=none; b=D6HyGQ4WOte25iO+vhDjtKS63I+7BFNwiPNNFVn8Y1tyDuEMoRfeBsX1p1+ZQkqnOZY9/r5RprtIs6mOqVhL1r/yU6p0SL7l0Kwi8UK7N5bM8PGzoDDo6vZ63vd2Req6bRadW1N/OhgpxfOON3kiks8i+BMW/bw2cRdAW4X5bTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754652084; c=relaxed/simple;
	bh=sb9GxgJyWypEsvuoMv5Fd+1BmBu8qpjlwP6q0cp2Oy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BMbtFPh7FF/6IolJHWAE2pGlFlbl+9eBZFuVQ3aZZ5mx3fjCpQ/nsTSLL1krOdqRFQi1XT90vpQwsVvgdyl8dL2mGwFsYs9Jp05ZrefiHso2kl3ejWpL7jum2WX7tHewrGGA7huY/Ayp0Amy87C9WHidWTRnN0DmuuqSYVko7wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZNu+4BI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZNu+4BI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754652083; x=1786188083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sb9GxgJyWypEsvuoMv5Fd+1BmBu8qpjlwP6q0cp2Oy0=;
  b=XZNu+4BIcWeBVmTJFLldYjRXu9oTldzIO9u6009EmYyltebnO4AIsW7t
   hJomToKct1ZcovXzcWe/AulvpfFn16Pf01CGWz5N2rk5x7qWr1jxjRMkj
   i4NhOOYQ6S9wsbGSgdPRDmDckS/CB4Wrl2sErpWyKRk89mK8sLxW0b/2r
   D5mXMmytc0bHjaXHMCIj6+jCqWBR/WGdel2HFTZ0ico+xCO3bm+vo3GbP
   LQ4QYAaHWMRRxm0AUiNr3BUqaJkO2Gl9M71n19QqKF21tzCmOp/61TYPH
   EH3HXp3eDby1eql4+w6iIcJolr++PJj/Oy1zcXZR7Y0Ux1GfOp3D0A9sY
   Q==;
X-CSE-ConnectionGUID: YFTXyw4gQ6ObT7XSHFGDtA==
X-CSE-MsgGUID: 5dA3DAZcT+2nWY8QYSkPmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67697993"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="67697993"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 04:21:22 -0700
X-CSE-ConnectionGUID: 7+3QvTiOQz+lcxT94OFMvw==
X-CSE-MsgGUID: gegJoF4DTN6a0pgSIbLQuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="169441853"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 08 Aug 2025 04:21:21 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukL9j-0003ta-1l;
	Fri, 08 Aug 2025 11:21:08 +0000
Date: Fri, 8 Aug 2025 19:19:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: arm: Convert ti,keystone to DT schema
Message-ID: <202508081955.Wzfnnkab-lkp@intel.com>
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
In-Reply-To: <20250806212824.1635084-1-robh@kernel.org>
References: <20250806212824.1635084-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Nishanth Menon <nm@ti.com>
TO: Santosh Shilimkar <ssantosh@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.16 next-20250807]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-arm-Convert-ti-keystone-to-DT-schema/20250807-053112
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250806212824.1635084-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: arm: Convert ti,keystone to DT schema
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250808/202508081955.Wzfnnkab-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508081955.Wzfnnkab-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508081955.Wzfnnkab-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: usbphy (simple-bus): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: usb-phy@0 (usb-nop-xceiv): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: usb-phy@0 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: usb-phy@1 (usb-nop-xceiv): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: usb-phy@1 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: soc@0 (ti,keystone): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,keystone', 'simple-bus'] is too short
   	'ti,keystone' is not one of ['ti,k2g-evm', 'ti,k2g-ice']
   	'ti,keystone' is not one of ['ti,k2e-evm']
   	'ti,keystone' is not one of ['ti,k2l-evm']
   	'ti,keystone' is not one of ['ti,k2hk-evm']
   	'ti,k2g' was expected
   	'ti,k2e' was expected
   	'ti,k2l' was expected
   	'ti,k2hk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/ti,keystone.yaml#
--
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: usbphy (simple-bus): #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: usbphy (simple-bus): $nodename:0: 'usbphy' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: usbphy (simple-bus): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: usb-phy@0 (usb-nop-xceiv): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: usb-phy@1 (usb-nop-xceiv): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: soc@0 (ti,keystone): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,keystone', 'simple-bus'] is too short
   	'ti,keystone' is not one of ['ti,k2g-evm', 'ti,k2g-ice']
   	'ti,keystone' is not one of ['ti,k2e-evm']
   	'ti,keystone' is not one of ['ti,k2l-evm']
   	'ti,keystone' is not one of ['ti,k2hk-evm']
   	'ti,k2g' was expected
   	'ti,k2e' was expected
   	'ti,k2l' was expected
   	'ti,k2hk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/ti,keystone.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
