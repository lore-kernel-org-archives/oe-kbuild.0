Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515D123B0
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Aug 2025 01:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755912896; cv=none; b=pkeUDIi74XV4l7butceLz/dnw4JUWn0wVQIKTOtfnlVfpvig34uMqxgdFAl4d8AnaOtKzGv/7m1H29H9qUpdLB1VuwTvx7ZJ8EUmufArkGUvxz877d+lZ32jrE0e8kL0J5yQEcvvOW184llepSuKhrofRF1TQgucfNL97EH7h00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755912896; c=relaxed/simple;
	bh=bF7de+Ln0BeYLHvngoGpUS4S9sQCmLXoN9M364++rIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pul6fPx2BeV5CgcJ/fweOaV7iC4el/PbZQhfZ6WC9p7p/qTkbulFGj5Rd/0IT9ae5qP02YhCr2oXEkqtmN8fI8F36ieT2A2jY2NFZA68pgq549HnuYiQFJBc2mEExz97DFRd98FwWcd3oB8uJ4V7EfD1dTLwY4oY/AIIN10MFAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9fTp2Wg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9fTp2Wg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755912891; x=1787448891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bF7de+Ln0BeYLHvngoGpUS4S9sQCmLXoN9M364++rIg=;
  b=F9fTp2WgrXbHHH0u48D9NKA6VEhtUwfKIZ8l3TupI1Cgt57z5yg9Z8Df
   Lvu0S+6jNxXnWnBLZwLkO3G2z2hGW7mPkhOIEtyMsDIstqri3C7YFSoK4
   VDBnQUmvrX7VrUE0Y/pdCH0eE/H78x5I9ozTWkmGIT/evp8fNqD3JBskK
   sB3jZQA9PTz/wqetlCNpv0cp2bEWDskTTY+Lm8U+jJs43OlU+GHi/Dnj4
   5RoHRDxzD8DeVFg1vRmMl1qgP9OdDXQPPMt7ZKJMckZDuF+RX5Kyy04Z3
   pAHwWwbkCLcpTGBb2zmMmUPuOlLstxdamSqZvCu2lEjemnrF8MDq+nJdF
   A==;
X-CSE-ConnectionGUID: rXR3OBcURCeDe5YVuCbkcg==
X-CSE-MsgGUID: dgpkw4JiSj+ZMazkzSpw7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="75677338"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="75677338"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 18:34:51 -0700
X-CSE-ConnectionGUID: vYu4pT52Tpq+7qChJz+IDQ==
X-CSE-MsgGUID: U8kfI2MWS1i2E9cvoaDJbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173100977"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Aug 2025 18:34:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upd9T-000M0R-0H;
	Sat, 23 Aug 2025 01:34:40 +0000
Date: Sat, 23 Aug 2025 09:34:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/b4-dts-interrupt-address-cells-imx 11/25]
 arch/arm64/boot/dts/marvell/armada-7040-db.dtb: interrupt-controller@1e0000
 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not
 match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202508230947.lacrh6pM-lkp@intel.com>
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

tree:   https://github.com/krzk/linux b4/b4-dts-interrupt-address-cells-imx
head:   5d6e74ff406dda331465e4b1f91f5962937aae37
commit: 3a604624477a51f227d0cdec695c493f35f22f5a [11/25] arm64: dts: marvell: armada-cp11x: Add default ICU address cells
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arm64-randconfig-051-20250823 (https://download.01.org/0day-ci/archive/20250823/202508230947.lacrh6pM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508230947.lacrh6pM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508230947.lacrh6pM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap806-thermal']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-7k-pinctrl']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts:158.10-187.4: Warning (avoid_unnecessary_addr_size): /cp0-bus/bus@f2000000/spi@700680/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap806-thermal']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-7k-pinctrl']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:257.24-276.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap806-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
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
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:257.24-276.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap806-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:257.24-276.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap806-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap806-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: thermal-zones: ap-cpu1-thermal:cooling-maps: 'fan-map' does not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: pca953x@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb-phy-1 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb-phy-2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb-phy-3 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: pca953x@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb-phy-1 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb-phy-2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb-phy-3 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: pca953x@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb-phy-1 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb-phy-2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb-phy-3 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb-phy-4 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb-phy-5 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2-bus/bus@f6000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2-bus/bus@f6000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2-bus/bus@f6000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: pca953x@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb-phy-1 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb-phy-2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb-phy-3 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb-phy-4 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb-phy-5 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2-bus/bus@f6000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2-bus/bus@f6000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2-bus/bus@f6000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
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
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: usb@500000 (marvell,armada-8k-xhci): 'phys' is a dependency of 'phy-names'
   	from schema $id: http://devicetree.org/schemas/phy/phy-consumer.yaml#
--
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: usb-phy-1 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
--
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: pca953x@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: regulator-1 (regulator-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb-phy-1 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb-phy-2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb-phy-3 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:257.24-276.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'vbus-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:257.24-276.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'vbus-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:257.24-276.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: spi@700680 (marvell,armada-380-spi): Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/marvell,orion-spi.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@41 (nxp,pca9536): 'gpio-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@41 (nxp,pca9536): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: rtc@68 (st,m41t83): Unevaluated properties are not allowed ('reset-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/st,m41t80.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:257.24-276.6: Warning (unit_address_vs_reg): /cp2-bus/bus@f6000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
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
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: interrupt-controller@1e0000 (marvell,cp110-icu): interrupt-controller@10: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2-bus/bus@f6000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2-bus/bus@f6000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2-bus/bus@f6000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
