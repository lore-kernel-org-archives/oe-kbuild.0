Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46FDCA5A
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Mar 2025 14:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741012448; cv=none; b=Xz8SpvN96ccG3JMBJDBr1I49dPPmhbznOJpkBPfSikPm0NpFYuvV3PcX/pbZsfR1w+B4pHYznbctnAFhXPxWijX7dXgcVb1Y3xIqqAiTkMKjSyiJ7US4BLpfXp1zK3zQJFY7r0z2KNcVtywpUJj/DiTkWJ/ppa39iG2u3CiF4js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741012448; c=relaxed/simple;
	bh=JQUhCIMcBEu58tngAAoSl64+DiRN0pVTMqQFcaRxrcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YBus8o3iIx8gMrUsnFSRe3OzN1ZKxIKf/XlSU+29urK0RvZpb2S5jkbi6MECg7VSocWith9gF8MesGi11MV2+kRUpy0Lss8i05q6DwlefnbvbPtU0+ssfQce/rP3SlJwo1x5ZsCRd48jrIxA2V70I1pOvHH+fHA4YEUOEzC7ZGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UmU9VdCz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UmU9VdCz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741012443; x=1772548443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JQUhCIMcBEu58tngAAoSl64+DiRN0pVTMqQFcaRxrcU=;
  b=UmU9VdCz5X7tUPN82CnkviM7rGfr9tn5STuDPaEuyBGgEGuETl4rnKgG
   k7+gP8e6sC9EYbOWukcCV9anC/qHK/YKn31QLEH8ZwuvzCJk7upJQZzPN
   PkIXvqJHBc3eASadvILW2xv+EJOsi4NsC84bZptB/J17uOLwl8R9n1MHt
   drSSEqKwD4p7lOKKIN6P4iO7wykWXTeKU8YV7Zxz8x8fOnHOpVzYW3eDN
   S0sXnLlHO+8z/DLICsLYeWwRwpU3ZVFHZiLRIawlwG8VdOcbjAHqW2TYe
   qZvrkxFe3PxxEPNBPBbuieUAPq12nuHur/3ElzJnWv1cE1ymYOi3lZXGS
   w==;
X-CSE-ConnectionGUID: PaeFYb7ySpKnNEp8jgi2sw==
X-CSE-MsgGUID: 7IZjjxS0SGOIsGHEM36TiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52531733"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="52531733"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 06:34:03 -0800
X-CSE-ConnectionGUID: R3pYdXxnSuObSC9/Cv4qgw==
X-CSE-MsgGUID: FuEm9t60SE+KEamVDiPmtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122152171"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 03 Mar 2025 06:34:01 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tp6rn-000Ib9-1B;
	Mon, 03 Mar 2025 14:33:59 +0000
Date: Mon, 3 Mar 2025 22:33:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: usb: generic-xhci: Allow dma-coherent
Message-ID: <202503032231.SotkXhnG-lkp@intel.com>
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
In-Reply-To: <20250226214231.3745400-1-robh@kernel.org>
References: <20250226214231.3745400-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus krzk-dt/for-next westeri-thunderbolt/next linus/master v6.14-rc5 next-20250303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-usb-generic-xhci-Allow-dma-coherent/20250227-054834
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250226214231.3745400-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: usb: generic-xhci: Allow dma-coherent
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20250302 (https://download.01.org/0day-ci/archive/20250303/202503032231.SotkXhnG-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503032231.SotkXhnG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503032231.SotkXhnG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-7k-pinctrl']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: usb@510000: Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: pca9555@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-7k-pinctrl']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: usb@500000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: usb@510000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: lte_reset: $nodename:0: 'lte_reset' does not match '-hog(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: wlan_disable: $nodename:0: 'wlan_disable' does not match '-hog(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: lte_disable: $nodename:0: 'lte_disable' does not match '-hog(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: usb@510000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: cp1: $nodename:0: 'cp1' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1/config-space@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1/config-space@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1/config-space@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-db.dtb: usb@510000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1/config-space@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1/config-space@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: cp0-usb3-0-phy: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
--
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/config-space@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: usb@510000: Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/config-space@f4000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/config-space@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/config-space@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/config-space@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/config-space@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/config-space@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/config-space@f4000000/spi@700680/flash@0: failed to match any schema with compatible: ['st,w25q32']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/config-space@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: usb@510000: Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/config-space@f4000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/config-space@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/config-space@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/config-space@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/config-space@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/config-space@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/config-space@f4000000/spi@700680/flash@0: failed to match any schema with compatible: ['st,w25q32']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0/config-space@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: usb@500000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: usb@510000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1/config-space@f4000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1/config-space@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1/config-space@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1/config-space@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: usb@500000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1/config-space@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1/config-space@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: usb@510000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: pca953x@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: pca9555@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: usb@510000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: pca953x@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: pca9555@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb@510000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: pca953x@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: pca9555@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb@510000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: pca953x@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: pca9555@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb@510000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: pca953x@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: pca9555@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2/config-space@f6000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2/config-space@f6000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2/config-space@f6000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb@510000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2/config-space@f6000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2/config-space@f6000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: pca9555@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2/pcie@f6600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb@510000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: pca953x@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: pca9555@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2/config-space@f6000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2/config-space@f6000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2/config-space@f6000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb@510000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2/config-space@f6000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2/config-space@f6000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: pca9555@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2/pcie@f6600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb@500000: 'phys' is a dependency of 'phy-names'
   	from schema $id: http://devicetree.org/schemas/phy/phy-consumer.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb@510000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb@510000: 'phys' is a dependency of 'phy-names'
   	from schema $id: http://devicetree.org/schemas/phy/phy-consumer.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: pca953x@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges', 'sim-select-hog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode', 'vbus-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@510000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode', 'vbus-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: usb@510000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges', 'm2-full-card-power-off-hog', 'pcie0-0-w-disable-hog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@510000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@41: 'gpio-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@41: '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: rtc@68: Unevaluated properties are not allowed ('reset-gpios' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/config-space@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges', 'm2-full-card-power-off-hog-0', 'm2-full-card-power-off-hog-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/config-space@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/config-space@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@510000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/config-space@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/config-space@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges', 'pwm-tacho-irq-hog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@510000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: cp2: $nodename:0: 'cp2' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges', 'm2-wwan-reset-hog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@500000: Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/pcie@f6600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/pcie@f6620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/pcie@f6640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
