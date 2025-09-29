Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4D528EB
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Sep 2025 01:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759108633; cv=none; b=jTZDULMHOzkpdxQSuH/l56BwLETaQUVO64sEhbKxPUdn6qBpKEAr8O9lNIVqPmoW+IcimjDAmqZ4NpPtwDoapstI+sya1n4hycSh1ddy4Zv/lw4BaeAapHKYcteZizfnFVvGe+SwFqmf3qd2NmEhtjv4tYGfdMHF08qTHLYZdRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759108633; c=relaxed/simple;
	bh=qkTX9Am1O76psfBsMXE2OZ+hXwXTewy1xoYML3U8XOs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QBvfZ3/8E8Siby/VGmyqKVIYiWwtqPnOi+J8GLx4bacPnwOkMRuawpkUjFh9mAFEg3EkPnEet0URjykIiMmEXur0Mfqb0S1ybSOC2doyt2dTG8oUSn3L8orWJQ1ly9k2XCiFsAhIKdqcJzPH74jokjnQA9msC1Ah6HHSRSZBFBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jmc9R81q; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmc9R81q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759108631; x=1790644631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qkTX9Am1O76psfBsMXE2OZ+hXwXTewy1xoYML3U8XOs=;
  b=jmc9R81q7SVeByGeMPk8X2wH0ny8fhN0LMQfLTteDH6vpbCo44LAEXFA
   PdAYyBJkzTc/Os5MBnFFwvU+flZs7iklaJyvlTQk/h020i4KiSw4ObONB
   dhnFD0guF6VmDLzs90uVzdCRizIryNWGlk6+bM0c013Kvl/RtHeW18fNC
   mPg0gQSIMQihP13Xe2k+aMAs+4UL3ALRG/eYJLfKurCWCHUnOyNsTCdxi
   QkEFl5xnEkg2pZp10MJ6oJE/Hduiq7sPY2qLtkbUQwwlFBMNRE9lZNKfM
   kfk1T9aXc+KRbVCjBuKbaZXc2xM4dvjX9bOguvLpFJl5quM9cVk8u60UE
   w==;
X-CSE-ConnectionGUID: kwePaMzrRZmGTdRJjq4GEw==
X-CSE-MsgGUID: fAs5XnH/QqmLoLb3aQMigg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65163058"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65163058"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 18:17:10 -0700
X-CSE-ConnectionGUID: xmMbxZCySn+mvJUYpOG2iA==
X-CSE-MsgGUID: uTvntKXkSGq2l7dO+5okxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="178151415"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 28 Sep 2025 18:17:09 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v32Vm-000877-1F;
	Mon, 29 Sep 2025 01:17:06 +0000
Date: Mon, 29 Sep 2025 09:16:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC net-next 5/5] dt-bindings: net: dsa: mv88e6xxx: add
 mv88e6xxx-avb-mode property
Message-ID: <202509290933.3U8uFIji-lkp@intel.com>
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
In-Reply-To: <20250927070724.734933-6-lukeh@padl.com>
References: <20250927070724.734933-6-lukeh@padl.com>
TO: Luke Howard <lukeh@padl.com>

Hi Luke,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Luke-Howard/net-dsa-mv88e6xxx-add-num_tx_queues-to-chip-info-structure/20250927-155031
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250927070724.734933-6-lukeh%40padl.com
patch subject: [RFC net-next 5/5] dt-bindings: net: dsa: mv88e6xxx: add mv88e6xxx-avb-mode property
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-053-20250929 (https://download.01.org/0day-ci/archive/20250929/202509290933.3U8uFIji-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250929/202509290933.3U8uFIji-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509290933.3U8uFIji-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: pinctrl@13800 (marvell,armada3710-nb-pinctrl): reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/mdio@32004/switch@0: failed to match any schema with compatible: ['marvell,mv88e6190']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
--
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: pinctrl@13800 (marvell,armada3710-nb-pinctrl): reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/mdio@32004/ethernet-switch@1: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: usb@5e000 (marvell,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
--
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: pinctrl@13800 (marvell,armada3710-nb-pinctrl): reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/mdio@32004/ethernet-switch@1: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: usb@5e000 (marvell,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: mmc@d8000 (marvell,armada-3700-sdhci): Unevaluated properties are not allowed ('marvell,xenon-emmc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
--
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: pinctrl@13800 (marvell,armada3710-nb-pinctrl): reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/mdio@32004/ethernet-switch@3: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: usb@5e000 (marvell,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: mmc@d8000 (marvell,armada-3700-sdhci): Unevaluated properties are not allowed ('marvell,xenon-emmc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
--
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: pinctrl@13800 (marvell,armada3710-nb-pinctrl): reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/mdio@32004/ethernet-switch@1: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: usb@5e000 (marvell,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: regulator (regulator-gpio): 'gpios' is a required property
--
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: pinctrl@13800 (marvell,armada3710-nb-pinctrl): reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/mdio@32004/switch0@10: failed to match any schema with compatible: ['marvell,turris-mox-mv88e6190', 'marvell,mv88e6190']
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/mdio@32004/switch0@2: failed to match any schema with compatible: ['marvell,turris-mox-mv88e6085', 'marvell,mv88e6085']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/mdio@32004/switch1@11: failed to match any schema with compatible: ['marvell,turris-mox-mv88e6190', 'marvell,mv88e6190']
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/mdio@32004/switch1@2: failed to match any schema with compatible: ['marvell,turris-mox-mv88e6085', 'marvell,mv88e6085']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/mdio@32004/switch2@12: failed to match any schema with compatible: ['marvell,turris-mox-mv88e6190', 'marvell,mv88e6190']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/mdio@32004/switch2@2: failed to match any schema with compatible: ['marvell,turris-mox-mv88e6085', 'marvell,mv88e6085']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: usb@5e000 (marvell,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/mdio@12a200/ethernet-switch@4: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/spi@700680/flash@0: failed to match any schema with compatible: ['st,w25q32']
--
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/bus@f2000000/mdio@12a200/ethernet-switch@6: failed to match any schema with compatible: ['marvell,mv88e6190']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: usb@500000 (marvell,armada-8k-xhci): 'phys' is a dependency of 'phy-names'
   	from schema $id: http://devicetree.org/schemas/phy/phy-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: usb@510000 (marvell,armada-8k-xhci): 'phys' is a dependency of 'phy-names'
--
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp2-bus/bus@f6000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/bus@f2000000/mdio@12a200/ethernet-switch@4: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
