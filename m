Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15181748D
	for <oe-kbuild@lists.linux.dev>; Mon,  5 May 2025 03:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746415965; cv=none; b=begyDYkiyY+qvjT/1ZnBSgJcVespzuUb29C2yXkXzudUC/yfTsrfanyikuuuUiXWkCS+MfYBd18u1K2el6y/OdtEm7LEtdzYsVqMTAfgHd5DvhYV3z5wFpAjqVWvRZ2Y5nbfQv3RYl0ye9A5pDN+4zzJlmJk4TI9oQT/aMFRT0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746415965; c=relaxed/simple;
	bh=pwldpDwUsyWmUeAMXBJJRueLQWxZlgRs/FttPiJCIxY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DnvfPuPaXOdup7MEbDVBLRP2BZJYLp0Dm/HWbGWGYY6+k9KsP96c37sHOlg6O0xbMy6VQfjF3uEdzBs/NLPXplLHlKaxURtChAgp9CDVxHwSK2RHmCAVmD8dfq1kB3w9Ap8BZrh9vRsJcOXYn36G85zjnbXCbMuJIVC2/RUPq5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h3I8O6Ev; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h3I8O6Ev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746415963; x=1777951963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pwldpDwUsyWmUeAMXBJJRueLQWxZlgRs/FttPiJCIxY=;
  b=h3I8O6EvSN2kAeg1KwDCHQ3M8yTJI9OsCMGW6OCTrci04CavPARXg0nJ
   +i5LXEwLNTtov7ekXmPARji003sltTT2RSdkFItfLDv78wzC1Qg3LGrn0
   tY2skHQ/D7VhftqqmOxXqrz85l9CLP2Du0PmgDHOjgDhNVA+eP/zv3anm
   EASVRLKb4BEI02cxvbLBINDZMTOGdXgCqqbXZvG7j3wrWe3t36uhhMOId
   LofMXD/zIYv/2djpzAwkP8pplHTEj+b/IJ2cbZd7dmbcnovzMVHp2zEDS
   MbhmyWGfWRjTP8z2Ng82NMIHXwcqp0ZVxo13Vd08dIdEqKEnnU4doAorX
   g==;
X-CSE-ConnectionGUID: OuB4Xg7XRKa20MT73JG1Nw==
X-CSE-MsgGUID: sENv4E2WSWmkTJ5iXTUQJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="73407568"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="73407568"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2025 20:32:42 -0700
X-CSE-ConnectionGUID: SkdznYB5T1CD2iGHpovK9g==
X-CSE-MsgGUID: jcdes9gxQSqGccRE7mSGZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="136078782"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 May 2025 20:32:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uBmZL-0005Q9-1T;
	Mon, 05 May 2025 03:32:39 +0000
Date: Mon, 5 May 2025 11:31:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 6/78] arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: pinmux@800000
 (qcom,ipq8064-pinctrl): Unevaluated properties are not allowed
 ('#address-cells' was unexpected)
Message-ID: <202505032238.3eCtMi4D-lkp@intel.com>
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
TO: Ansuel Smith <ansuelsmth@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   da2f3a9f5091c2c6ee04ce79f7031338e6decac3
commit: 9c0bc176a7c5bfcd4a355ac4dc9adb4ac878d86b [6/78] ARM: dts: qcom: fix dtc warning for missing #address-cells for ipq8064
:::::: branch date: 2 days ago
:::::: commit date: 2 months ago
config: arm-randconfig-051-20250503 (https://download.01.org/0day-ci/archive/20250503/202505032238.3eCtMi4D-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505032238.3eCtMi4D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505032238.3eCtMi4D-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:274.9-277.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: / (qcom,ipq8064-ap148): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: rpm@108000 (qcom,rpm-ipq8064): 'clock-controller', 'clock-names', 'clocks' do not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: pinmux@800000 (qcom,ipq8064-pinctrl): Unevaluated properties are not allowed ('#address-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,ipq8064-pinctrl.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: syscon@3000000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: amba (simple-bus): $nodename:0: 'amba' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: syscon@1bb00000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: leds (gpio-leds): led-0:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'usbdev' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'usbdev' does not match '^cpu[0-9]*$'
--
   arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:274.9-277.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:643.24-666.5: Warning (unique_unit_address_if_enabled): /soc/usb@110f8800: duplicate unit-address (also used in node /soc/phy@110f8800)
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: / (mikrotik,rb3011): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: rpm@108000 (qcom,rpm-ipq8064): 'clock-controller', 'clock-names', 'clocks' do not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: pinmux@800000 (qcom,ipq8064-pinctrl): Unevaluated properties are not allowed ('#address-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,ipq8064-pinctrl.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: syscon@3000000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: usb@110f8800 (qcom,ipq8064-dwc3): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: usb@110f8800 (qcom,ipq8064-dwc3): 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: amba (simple-bus): $nodename:0: 'amba' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
