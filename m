Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1A92475CB
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Oct 2025 07:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759478024; cv=none; b=QwKiu3K4v9wCJ9vJT3YfPktZxDm8OeEhsyb1hyaUyppyJbTrBhUQquxdO4kNg24pwYbxs4xi7Sa0n+w2Y0BhMZzGIbZ4kH1g7TmX5DyrB+IbSVS5CpAEiEZ3KU8AyDIKURXv7a2hfLFRm468nX4c0CTAo6V67gg7kfwMd+f2hdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759478024; c=relaxed/simple;
	bh=5ps+UcDpYWw/3DJH1UA6N40mQdd2LULwNS7cH2ki7TU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PjHr5j5YyuCeAL+/tHVI0Gm6+qS8sbz7YQInOpcVY2TsePQzHUS1OcSj2SQDnqL2gIbQ/jZS0hr6KLfv41Q7XGYqfhFbIVMlrvckm0RjdcrKNLpPzhIPUte4VUwMcwrYkxK+Yr0R3bLptVJSci5V7EJJ0nPWoGhKYy6B7SWxUHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uys3U8br; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uys3U8br"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759478023; x=1791014023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ps+UcDpYWw/3DJH1UA6N40mQdd2LULwNS7cH2ki7TU=;
  b=Uys3U8brGBEdw4lQUJG2KAEpueRjKU4GHeNNO0rIig/r6gwsWt3zywMN
   MUn/5WpMEr15Na0i8lD5dnLlr2rp4r6cDICborpSp/OefJlr5g5ZQJajz
   hU74jo3Bv9bA9aeyBS4/l9cmMSMXhFSwdByPBi2ZmXdZqK6hUYftqw0e5
   L0TY5PRRmANDTIi6lWgl8ifLz7vfcefHhMGpv3nl3IfZ/ogSDKfmt/Jzt
   a95wfQQ/Au38QCsbUhycWjIx117JELfecNV/bapU0JsrZceEEzVXbOy6I
   aCdxP2QInQu46x0xhQLLP4/plSTinR1h3ljH7BxUOdmVPm52uXWyPkota
   w==;
X-CSE-ConnectionGUID: KNW7eFIRSkC7fI2DTbafhA==
X-CSE-MsgGUID: 96iI7cJBQ2qXitdOwZEHIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="65609620"
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; 
   d="scan'208";a="65609620"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 00:53:42 -0700
X-CSE-ConnectionGUID: EyfYCErkSdGZyI67YLEJIg==
X-CSE-MsgGUID: yt74oTNfQ3WHXt+U5stdTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; 
   d="scan'208";a="178355343"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Oct 2025 00:53:41 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4abi-0004ON-0x;
	Fri, 03 Oct 2025 07:53:38 +0000
Date: Fri, 3 Oct 2025 15:52:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm:clearfog 13/13] arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb:
 m2-ful-card-power-off: $nodename:0: 'm2-ful-card-power-off' does not match
 '-hog(-[0-9]+)?$'
Message-ID: <202510031538.tGCInMW6-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git clearfog
head:   0c321d2afb01ca78544750d2c840a22f91251682
commit: 0c321d2afb01ca78544750d2c840a22f91251682 [13/13] arm64: dts: add SolidRun CN9130 Clearfog Base dts
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20251003 (https://download.01.org/0day-ci/archive/20251003/202510031538.tGCInMW6-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510031538.tGCInMW6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510031538.tGCInMW6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'vbus-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: spi@700680 (marvell,armada-380-spi): Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/marvell,orion-spi.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: gpio-expander@20 (nxp,pca9555): 'm2-ful-card-power-off' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: m2-ful-card-power-off: $nodename:0: 'm2-ful-card-power-off' does not match '-hog(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
