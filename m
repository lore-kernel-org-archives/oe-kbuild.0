Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D151E3DD7
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Oct 2025 08:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759480067; cv=none; b=agQvTtmgeTIF0ZHqfIuov8bb6qWaJlcmrKWHThL8MImIh36w2Siw73bD6yYJ4cBiO2QEEQ0xQ0RqFGtIx3A89F3gR2btQIE7rIiU07l+PDDb0UCFJaIqp7c6Bx93dFTuKGQBxgehzBfp59MlCQ0yc1U9rtja2j94SIi0rhfKCUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759480067; c=relaxed/simple;
	bh=9EnvQAIJFFgj3st6XfWg0mDhfz4dRmiyQDrvFPup6+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C9I34FBJczKYXUQ3hdQk+M0Xtsfba2DBIUgzhTukHNCUOof0sqbIyYCAxacZZKQGtU8/Z7VakIYpXcHiq18yJR6hQ/L8g3GTplBeRMGDb+s0fWrUuHQxiD5ZldmW/uH6zILPHcUWmCUllRiqxdDNRZuNN9lJIw7GfSePCS9jHxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzkQRwhS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzkQRwhS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759480066; x=1791016066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9EnvQAIJFFgj3st6XfWg0mDhfz4dRmiyQDrvFPup6+M=;
  b=KzkQRwhSMyuwtamqecWwPXrZwKpHDXqk6Ash884C/0+R4GUU3jfqIVXv
   x9oV69bwW4h04xxZ3ZOw+ImtpGFcyCNPmHke88nBc0uM/PxlwB8gIy1J1
   p9zl+atIOIem7ZTqHqVATjhU9qxD3Se7vyX+ZKP4GTynR2qVppI585KcW
   epkt7hy+rEM9NV4UzV5LLEd/PlPpOfTPnYeN/5nnhryJbRfHqbebJWiun
   Cvsp+vun/nwMQF0gCqo8WrmRPFeCfzEXDsEA1k2LmjqL2Tf0w0whPw+7N
   RqQzmf0dNU53eEO/Co7mEXP/ZALs76EOsAuNioRA25Nc8j2pEiZA70DjU
   A==;
X-CSE-ConnectionGUID: l0dvo6QwQ+uXRs0PeaHmbg==
X-CSE-MsgGUID: Z1JRzC2gTGunynbPYTG+0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61474467"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="61474467"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 01:27:45 -0700
X-CSE-ConnectionGUID: dG+REaZhQlSetb1WhrZyNA==
X-CSE-MsgGUID: gQqII1KBTHCkv/ZQ5MxAeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="184527761"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Oct 2025 01:27:43 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4b8f-0004Pn-1I;
	Fri, 03 Oct 2025 08:27:41 +0000
Date: Fri, 3 Oct 2025 16:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm:clearfog 13/13] arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb:
 gpio-expander@20 (nxp,pca9555): 'm2-ful-card-power-off' does not match any
 of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
Message-ID: <202510031624.30m7O6vf-lkp@intel.com>
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
config: arm64-randconfig-052-20251003 (https://download.01.org/0day-ci/archive/20251003/202510031624.30m7O6vf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510031624.30m7O6vf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510031624.30m7O6vf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'vbus-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: spi@700680 (marvell,armada-380-spi): Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/marvell,orion-spi.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: gpio-expander@20 (nxp,pca9555): 'm2-ful-card-power-off' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: m2-ful-card-power-off: $nodename:0: 'm2-ful-card-power-off' does not match '-hog(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
--
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'vbus-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: spi@700680 (marvell,armada-380-spi): Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/marvell,orion-spi.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: gpio-expander@20 (nxp,pca9555): 'm2-ful-card-power-off' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: m2-ful-card-power-off: $nodename:0: 'm2-ful-card-power-off' does not match '-hog(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
