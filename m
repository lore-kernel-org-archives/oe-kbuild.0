Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B4520ED
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Jul 2025 19:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751655995; cv=none; b=pM6cTvh/K3RbSt4J0xXBJArPgs0NW7eAEWW578s7VphNUnvMxK8Ul4ktlU5VoHoc2D/AyPdV+y7aGqIdEKMz9wWz9MZ/ww5c1jLe07YKg6OErhct+VfeTUwFq6pf5AAw8CECrw8QW0hQmk+ah/mKIdaPZ+Kd/+2mY8jQb/F/ZKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751655995; c=relaxed/simple;
	bh=CaNbcyTqf/7l4n49KeSKTDPC7dhE+zucHzfRzCw3/FY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pswosxdCgP3xLwzhx4GJsKq8n4tlLlgeVGF5AA81RjVuusH7ei/MCOJvXKd1YydF/rEer95V+moqr6zMIvsuV8ewFRfOf0U0sq99yBCDop5NkPQhWoEOzMMOmCsFe0hUq3Qf1CTrna371SSTUPjRu8Xl9Unb02bHZxrfVLSM2dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BkCDou2I; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BkCDou2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751655993; x=1783191993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CaNbcyTqf/7l4n49KeSKTDPC7dhE+zucHzfRzCw3/FY=;
  b=BkCDou2Ir+N6HBcXOyNL5asPABAoF+JUTxGe2HZ14Y7ed1SVMz5ko5lL
   p1kb4+gUq2HAB8AORVOu2K86IXdRAqRlSTi+RPqWzke2L/7pM0YTcQmfw
   YD05IqVF6xJht3myjGjmLa3tEvKR26RxXmhMOPZhX7T4kxMzAuef/YJV9
   YSAXQ/l0atXj4r7/uXThy3maPKILFiZPFED3I0Bz8+YZp6WX1DCELdHiH
   k+Bvzl24HFsN98/tHOjs2noCcczqCWlmoL50RVS8VXOacThTfeAg744VX
   KMUhgvk8eu3n6BS/GkohiQ4hMTbwW7sbcJMGQMQ1Onzw1s9zOL3HTpu7J
   g==;
X-CSE-ConnectionGUID: oUy9BeWZTWiclRclUl5BJQ==
X-CSE-MsgGUID: 96ohVbYcS7CeLLEGtK0Z6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="71424285"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="71424285"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 12:06:31 -0700
X-CSE-ConnectionGUID: 4NEZ9EveSfKZS0OOxOz1Xg==
X-CSE-MsgGUID: m8JV1UA6R9G0kzKyvMojMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="154111458"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Jul 2025 12:06:30 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXljw-00040T-08;
	Fri, 04 Jul 2025 19:06:28 +0000
Date: Sat, 5 Jul 2025 03:05:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-spi:for-6.17 6/7]
 arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: spi@700680
 (marvell,armada-380-spi): Unevaluated properties are not allowed
 ('spi-max-frequency' was unexpected)
Message-ID: <202507050217.6RPZd8Xu-lkp@intel.com>
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
CC: linux-spi@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-6.17
head:   51106b830ad9dc0a2cf932e27a921e01de2df876
commit: 7105fdd54a14bee49371b39374a61b3c967d74cb [6/7] spi: dt-bindings: Convert marvell,orion-spi to DT schema
:::::: branch date: 27 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-052-20250704 (https://download.01.org/0day-ci/archive/20250705/202507050217.6RPZd8Xu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507050217.6RPZd8Xu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507050217.6RPZd8Xu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'vbus-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: spi@700680 (marvell,armada-380-spi): Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/marvell,orion-spi.yaml#
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'vbus-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: spi@700680 (marvell,armada-380-spi): Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/marvell,orion-spi.yaml#
--
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
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: spi@700680 (marvell,armada-380-spi): Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/marvell,orion-spi.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@41 (nxp,pca9536): 'gpio-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@41 (nxp,pca9536): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: rtc@68 (st,m41t83): Unevaluated properties are not allowed ('reset-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/st,m41t80.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1-bus/bus@f4000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
