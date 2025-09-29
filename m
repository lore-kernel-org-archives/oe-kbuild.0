Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9A2335C7
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Sep 2025 08:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759134319; cv=none; b=Yr/MJ5C8mJt3NFOURPE42UVFtlbvRLZWW6gew4OQmVopqF85OKVxw/UXlIpMkKo5IoW6s9OLsgoGz/MrBVPoMMxSY5fcstKzEOZ4szQKepm7+riU73LGLcYks7kaUAs55blr4Dj9tmN3dfXfkBxtwcYWwsDw3gnJVP2jlYU+h5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759134319; c=relaxed/simple;
	bh=5rn/yFSHDK+v7AhNs93ykBFTBJQTJRArJFe3n3t7iHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lipfoD/WiWt45ZFNdyT3QAluFZNJsp5bZlvFg7y95VJGZj3mUTDhRN6CXCU9O+ztBZ/qMEQ0tVCjNKw9lhzdwN0UtM9mgYNY2CC6x7wc5gMPbo6pUu15v4AIsIlA3TTvdDa2IsFhd8Yn8G4z4wUtn4Uof26dgcTpIndKaT88+Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZuU5MmGY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZuU5MmGY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759134317; x=1790670317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5rn/yFSHDK+v7AhNs93ykBFTBJQTJRArJFe3n3t7iHs=;
  b=ZuU5MmGYuqM43xzeIAndhLxuEuX8FyQFRSVeZVmaC2pxWHtv4KnEWUfR
   LZZQaxEUfi7oTJgVtD/zqDoFah4XvMw23lx8dUche+ZMM4RMFVzBgVkp7
   rvnC7A39lvAfVVR7MU90rKLqBXzFjeH+d0rwU/8OgTXF3T7qU/rsn8tq7
   UbfkNZowzcWaRRxV8HQNocDIU4FJiHBENZFH4XrjCyez1xuRy1pIQ0mTd
   JVpfC0byLV80HQUZew4DkEX+VwHNk6VVeA552biYFKwGFkKc7xAx4CHGP
   ZhinfxBYypAbVXoF0Cojqd+BKA89ILQJv/1p8zNQ5vKu/2lT2SSwwXXgx
   Q==;
X-CSE-ConnectionGUID: PbBrOznJRh2wNCzMvv4SPw==
X-CSE-MsgGUID: +wmdpyotSyyRPtWbCieKdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65188335"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65188335"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 01:25:14 -0700
X-CSE-ConnectionGUID: t7WtLyVoSnKKcaL1GE2VRw==
X-CSE-MsgGUID: rX+wrofoTXipPCVE2IPwog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; 
   d="scan'208";a="178560246"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Sep 2025 01:25:13 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v39C3-00003X-1F;
	Mon, 29 Sep 2025 08:25:11 +0000
Date: Mon, 29 Sep 2025 16:25:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC net-next 5/5] dt-bindings: net: dsa: mv88e6xxx: add
 mv88e6xxx-avb-mode property
Message-ID: <202509291529.sChS0qQa-lkp@intel.com>
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
config: arm64-randconfig-052-20250929 (https://download.01.org/0day-ci/archive/20250929/202509291529.sChS0qQa-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250929/202509291529.sChS0qQa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509291529.sChS0qQa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/mdio@32004/switch0@10: failed to match any schema with compatible: ['marvell,turris-mox-mv88e6190', 'marvell,mv88e6190']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/mdio@32004/switch0@2: failed to match any schema with compatible: ['marvell,turris-mox-mv88e6085', 'marvell,mv88e6085']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/mdio@32004/switch1@11: failed to match any schema with compatible: ['marvell,turris-mox-mv88e6190', 'marvell,mv88e6190']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/mdio@32004/switch1@2: failed to match any schema with compatible: ['marvell,turris-mox-mv88e6085', 'marvell,mv88e6085']
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/mdio@32004/switch2@12: failed to match any schema with compatible: ['marvell,turris-mox-mv88e6190', 'marvell,mv88e6190']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/mdio@32004/switch2@2: failed to match any schema with compatible: ['marvell,turris-mox-mv88e6085', 'marvell,mv88e6085']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: usb@5e000 (marvell,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware', 'cznic,turris-mox-rwtm']
--
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts:158.10-187.4: Warning (avoid_unnecessary_addr_size): /cp0-bus/bus@f2000000/spi@700680/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap806-thermal']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/bus@f2000000/mdio@12a200/ethernet-switch@3: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-7k-pinctrl']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
--
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/mdio@12a200/ethernet-switch@4: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'vbus-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
