Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD1645DF67
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Aug 2026 12:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786709265; cv=none; b=UUZkfp5fWoGxOiGnqmXFDayGJ+5e4rBH9EGYJQu4oPuOLuYiipE+93sT0Y6j4sOfuEL17VVV0ioVPzWxgb81hONWAs1tUsyAo/aMWoF59l/TebKyWm0lSmpzFFstsS8h/mnc7Jo+078wA9dQ4pYCQ/O/a/liJrRSLSGve1nu9xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786709265; c=relaxed/simple;
	bh=FFfBOZTMV8w3X2PSMKQ4UlLlSfbhIYsJ5CtDeoVdQmo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AksVgKt9VGrT4+lw3AFfGNrmm6eO4nxiC6NWEQy8ohtOFIewCaCSQZKczL9irzb97UdTAXZQP8K9LS5hUZCVrswH00ZBWjlY0WpERAJ6bGHCGqMNc+AmlZRkFSFk1wNv2udOjpO0inQd1J+FuouO+t+srkYUdLOqKiiWYy91Ak0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApWQQRlB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApWQQRlB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786709264; x=1818245264;
  h=date:from:to:cc:subject:message-id;
  bh=FFfBOZTMV8w3X2PSMKQ4UlLlSfbhIYsJ5CtDeoVdQmo=;
  b=ApWQQRlBWyk6mDH08ZzvxV83OPollnp7M+Dt6CuRjX9Vr6e7GwFNVB88
   hYg5R2/6scVKk74oJse4h1q1s3uzynLlH3CLQOdNe7TvjNRUnfyUxIL4q
   PLhLaC8WW5lIX2vW36eo9vlV2BM06rZMprxveOa/wiff4zW5iAF0iw5/e
   Mxvs66jGnLgiE7YTMUX4Jmm+uqUJcWj2LxlianQV+F3J8cfMpO0da5ABU
   Hjgiz/SbP+psqrPV5S9KUvYzU3y43XznysMnfnUy1nwhsqmhqD/Wtbk6R
   JWIam1BEH0I3G3IeP3yG4kIK7pJcI1jVgsGA3yC6q8vlXyC31ZTTbMiNs
   g==;
X-CSE-ConnectionGUID: nFW/HHCYQkSqaWzuFDPK/Q==
X-CSE-MsgGUID: GhzwMjpET6umYPCGu6LSjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="90962395"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="90962395"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 05:07:42 -0700
X-CSE-ConnectionGUID: wqXdrz+zTcevBMtp2T2KAQ==
X-CSE-MsgGUID: xxxLgEglRmOwV1pBLL/UzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="287691814"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 14 Aug 2026 05:07:40 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuqhG-000000006FF-2blE;
	Fri, 14 Aug 2026 12:07:38 +0000
Date: Fri, 14 Aug 2026 14:06:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: spi@700680
 (marvell,armada-380-spi): Unevaluated properties are not allowed
 ('spi-max-frequency' was unexpected)
Message-ID: <202608141436.hcE6JgO0-lkp@intel.com>
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
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2f1baf1fc8929e6c48370be543ad028ac7ad4131
commit: 7105fdd54a14bee49371b39374a61b3c967d74cb spi: dt-bindings: Convert marvell,orion-spi to DT schema
date:   1 year, 1 month ago
:::::: branch date: 13 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260814/202608141436.hcE6JgO0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608141436.hcE6JgO0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7105fdd54a14 ("spi: dt-bindings: Convert marvell,orion-spi to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608141436.hcE6JgO0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'vbus-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: spi@700680 (marvell,armada-380-spi): Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/marvell,orion-spi.yaml
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: spi@700680 (marvell,armada-380-spi): Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/marvell,orion-spi.yaml
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@41 (nxp,pca9536): 'gpio-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@41 (nxp,pca9536): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: rtc@68 (st,m41t83): Unevaluated properties are not allowed ('reset-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/st,m41t80.yaml
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1-bus/bus@f4000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: ethernet-phy@0: marvell,reg-init: b'\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\xf0\x00\x00\x00\n\x17' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
