Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7F9261574
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Sep 2025 20:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757796985; cv=none; b=sUFT8J33guIpKMqJcEIj7aubXMFxA9d5JZpkUEntol8FuztUCdV/yUCNHFjydxnsOXT14joncPJV11Acn+R09M88Ab7VVC6Ov0PUyxDrXKzwRiQGPzkfIU2leUshO6zZjS0Cv52J741GE1eF2aVbkUB4epHBmb6K6A9Xbun1EQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757796985; c=relaxed/simple;
	bh=S/SPdqLeatY+V6g1gxyOy1xQlQmwqDzMfW/EEhH2Yhs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PotO2zNXV7ifZzw3ggHe8K0fEMYq/Bg0nqqEG9e5gX/hakgRrZhP3ds+hQR2ODKLd5+0P4ft8nWhhsObrNSEgf5cTn7pFVSCJMj/CLlhCJEa0T+ry8J2DWNf0BZIFBJ0NSDSA18TUEVEaDIR6dDo3g0JkOaHJbnFMZG2xpR/BaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZIH+LKPP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZIH+LKPP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757796983; x=1789332983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S/SPdqLeatY+V6g1gxyOy1xQlQmwqDzMfW/EEhH2Yhs=;
  b=ZIH+LKPPwNwJhHziihdcQPcZQV2vPdgJNoOxWmaJW5eLTZJamcMd8GOP
   yAez9/883TnFRoIrIE11qaZtxOHu8AwOV7PpNf9G9R+E4yDFEyD76ix4/
   99oLlDhm3gnKk+vD9pLkPOVKu4grxqW3BQoqeqlvL4TTdxOlYT4EIy7Tg
   TKJ4B8JV0vISevQhouhIz2+8Or95Dp+nrRf1qyOJ3SmpWGt+E7uLc8U2C
   bfusWilAb4ALXW5XJUjI/QdQdiuFwK1uUTUEr678dVEn0YzsRcBW55Myu
   kPSw1tPeyWRThwZYRQx7DfzjRHG9BHnwRMXeQFIRUtIZ9zXISUbLo0seE
   Q==;
X-CSE-ConnectionGUID: l+HVBMrORR+3m1oHy1PZVg==
X-CSE-MsgGUID: Jk64rowzSBaiHJRCgMvDtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="71206487"
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="71206487"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 13:56:22 -0700
X-CSE-ConnectionGUID: ZNFLkA4oRCCQnmk/LPM11w==
X-CSE-MsgGUID: PV9nbEF0RF6fvcNYlLSFiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="178637669"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 13 Sep 2025 13:56:20 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxXIA-0001qu-1T;
	Sat, 13 Sep 2025 20:56:18 +0000
Date: Sun, 14 Sep 2025 04:55:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gclement-mvebu:mvebu/dt64 2/6]
 arch/arm64/boot/dts/marvell/armada-3720-db.dtb: pcie@d0070000
 (marvell,armada-3700-pcie): interrupt-controller: '#address-cells' does not
 match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202509140416.ngLUxTdK-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Gregory CLEMENT <gregory.clement@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git mvebu/dt64
head:   1cc3d6c8640e4a75dab4077121b8cafd15eab8b0
commit: bc2d616d58ab3810ce755e250885cc66dc707209 [2/6] arm64: dts: marvell: armada-37xx: Add default PCI interrup controller address cells
:::::: branch date: 32 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-054-20250913 (https://download.01.org/0day-ci/archive/20250914/202509140416.ngLUxTdK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509140416.ngLUxTdK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509140416.ngLUxTdK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@5e000 (marvell,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
>> arch/arm64/boot/dts/marvell/armada-3720-db.dtb: pcie@d0070000 (marvell,armada-3700-pcie): interrupt-controller: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada-3700-pcie.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-db.dtb: pcie@d0070000 (marvell,armada-3700-pcie): Unevaluated properties are not allowed ('interrupt-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada-3700-pcie.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb3-phy (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
--
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
>> arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: pcie@d0070000 (marvell,armada-3700-pcie): interrupt-controller: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada-3700-pcie.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
--
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: usb@5e000 (marvell,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: pcie@d0070000 (marvell,armada-3700-pcie): interrupt-controller: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada-3700-pcie.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: pcie@d0070000 (marvell,armada-3700-pcie): Unevaluated properties are not allowed ('interrupt-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada-3700-pcie.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
--
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
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: pcie@d0070000 (marvell,armada-3700-pcie): interrupt-controller: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada-3700-pcie.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: pcie@d0070000 (marvell,armada-3700-pcie): Unevaluated properties are not allowed ('interrupt-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada-3700-pcie.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
--
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
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: pcie@d0070000 (marvell,armada-3700-pcie): interrupt-controller: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada-3700-pcie.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: pcie@d0070000 (marvell,armada-3700-pcie): Unevaluated properties are not allowed ('interrupt-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada-3700-pcie.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: usb3-phy (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: gpio-leds (gpio-leds): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
--
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: usb@5e000 (marvell,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: pcie@d0070000 (marvell,armada-3700-pcie): interrupt-controller: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada-3700-pcie.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: pcie@d0070000 (marvell,armada-3700-pcie): Unevaluated properties are not allowed ('interrupt-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada-3700-pcie.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
--
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: usb@5e000 (marvell,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: mmc@d8000 (marvell,armada-3700-sdhci): Unevaluated properties are not allowed ('marvell,xenon-emmc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: pcie@d0070000 (marvell,armada-3700-pcie): interrupt-controller: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada-3700-pcie.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: pcie@d0070000 (marvell,armada-3700-pcie): Unevaluated properties are not allowed ('interrupt-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada-3700-pcie.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
--
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: ethernet-switch@1 (marvell,mv88e6085): Unevaluated properties are not allowed ('dsa,member', 'ethernet-ports' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: usb@5e000 (marvell,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: pcie@d0070000 (marvell,armada-3700-pcie): interrupt-controller: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada-3700-pcie.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: regulator (regulator-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml#
--
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: usb@5e000 (marvell,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: pcie@d0070000 (marvell,armada-3700-pcie): interrupt-controller: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada-3700-pcie.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware', 'cznic,turris-mox-rwtm']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware', 'cznic,turris-mox-rwtm']
--
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
>> arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: pcie@d0070000 (marvell,armada-3700-pcie): interrupt-controller: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada-3700-pcie.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
