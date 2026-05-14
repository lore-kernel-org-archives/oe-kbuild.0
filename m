Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C37931E84A
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 16:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778777763; cv=none; b=PCXqAEJywNKWpyRKpwdNad2cDUB7ibfJu6mYBUR6yN+qJMshJfmdJic+vi5D0b1hr5Bawjv81kNJrd8zlKpoiyUQDp1VtUYfXALOqiBREpnqfBaSyIsiqzT3M804nO5Zqr+/+GiElxTgdQwsxiHJ6ukb8BRdSqnFQYxArJHsETs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778777763; c=relaxed/simple;
	bh=npPL5MdL7urWH+KDPAD6clnX/ziuhKW/WDI5giePUIA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZMwxblZsobRUuDs66Y+lEBpVsSB/8HuAWx+uH5B24MTKy8cjFQUaLFk963nnUaoQ2KY13mVQjiC8tWXL74xKLBfUdRI1O3HBbm31mcHgcy2BpKTzZkpmEkaX3M+sDXzJO1QgNhEludVPLTX19app5Yy7aL+Zhu5s5aVdBA4baN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SI0rBItN; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SI0rBItN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778777762; x=1810313762;
  h=date:from:to:cc:subject:message-id;
  bh=npPL5MdL7urWH+KDPAD6clnX/ziuhKW/WDI5giePUIA=;
  b=SI0rBItN6X0y9HhGJkN2Dh+qXpyPDmkClO3bAJ2EGZpF6mmUAPsL6aO4
   hSdJ/XWrNxzfJU4JUuXv8lmHlIONeNxVyrUTyaAVyFx/Towqg0LcSwJZN
   bALeeGHy0GIJpoLE9VUQnXKF+QQhIw1GKmqMwkDai1ZycILXg+9lQ3RZ4
   eL9SsxotMnW2eWGc2oCQqZ5xJs6s+QlW1xfnjwDoOOfWX8TVq8cNlSsw5
   Bsk8O6UCE6wkpUprRlsRfP9TeNWozzvDGESP8GHsDKVUpxj/6GWlpiMiV
   z036mRrGi3mFZ9jU5nHhKWaqnq+MJWw0Eh8F5SLyD+kUzX2H+Q757FDed
   A==;
X-CSE-ConnectionGUID: w5YDaHGbQ/KJEObFmk0e0A==
X-CSE-MsgGUID: 7i3LDY1kRxiU/z1qKBRzbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79583038"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79583038"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 09:56:01 -0700
X-CSE-ConnectionGUID: v1TIQFaOSQC7iKA8UZlPRg==
X-CSE-MsgGUID: XZdCG+itRH2LfcVkfCJF3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="238536940"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 14 May 2026 09:56:00 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNZLp-000000008qX-3bOL;
	Thu, 14 May 2026 16:55:57 +0000
Date: Thu, 14 May 2026 18:55:29 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb:
 pinctrl (marvell,armada-8k-cpm-pinctrl): 'copper-eth-phy-reset' does not
 match any of the regexes: '-pins(-.+)?$', '^pinctrl-[0-9]+$'
Message-ID: <202605141805.oLnOl2In-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e1914add2799225a87502051415fc5c32aeb02ae
commit: 45a8d350e72cc98e91bce2c20d4f26a8d9ccfffa dt-bindings: arm: Convert Marvell CP110 System Controller to DT schema
date:   6 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-2053-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141805.oLnOl2In-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141805.oLnOl2In-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 45a8d350e72c ("dt-bindings: arm: Convert Marvell CP110 System Controller to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605141805.oLnOl2In-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:257.24-276.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: pinctrl (marvell,armada-8k-cpm-pinctrl): 'copper-eth-phy-reset' does not match any of the regexes: '-pins(-.+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/marvell,armada-7k-pinctrl.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: pinctrl (marvell,armada-8k-cps-pinctrl): 'nand-rb' does not match any of the regexes: '-pins(-.+)?$', '^pinctrl-[0-9]+$'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
