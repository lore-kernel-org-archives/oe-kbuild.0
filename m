Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3483242AB
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Aug 2026 19:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787339268; cv=none; b=erRu6ezRmtpDuBdNg7h9/XeIoBjg253bWVmG1iF1MjNO9fFmGQfBsZyF43S5NEoJ7gA+Z/fJRYWL2rySQpFGygb8jQ/z0lMpv7SwnzgaMmWRSsVev5HSzDrHwr+B/UXhNuuSK06NDaQ5YSYVtIVExfw9LV212SN61w4FSKhq7uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787339268; c=relaxed/simple;
	bh=OKXG41dEkvDzloh2DV3kGBg+9nozonCDOJ9uiNki1j0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fISdtOQLqxGyBk89d6n3yFdAZcvv5rGcaLkyGBdp6J7i2oCDQY/Mtp1A1M9AnEYDGqLU9IAC277Eb1v/AgkiJzht5/5NWQ5L06faizku6iT6ULF4zJL0zXc+h2RjBhmqRbLVwUKJZddYKzE9RxcL9gwoYghKsKIwvkottfzbKCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SgXmHy/k; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SgXmHy/k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787339267; x=1818875267;
  h=date:from:to:cc:subject:message-id;
  bh=OKXG41dEkvDzloh2DV3kGBg+9nozonCDOJ9uiNki1j0=;
  b=SgXmHy/kpZtLcC1TyroLzyLD0YIX44PJjUPd9ceCoZjZquCOxbS+uVTS
   zYOTGZ8+i3lGKdwDQ2V1wO3x7+K4pMG0qVie7U0bQKxk5bxh668AEEodR
   1zgK7/AoIs4j2v7s14WusQCjMx6NYtThK9GRT+UrOsAKF8OWAiZjO8Qr+
   vN5u+eMTNe+TWVpIK+4R94VBjp3xapQf5ddTb1rOIOEBoFB1nSqeYI4TN
   MA8X954QB+pHfDClPi5zp5hjyysCfUPYNTTM8CYAmmEuRwdYATBsK6tFo
   cK4gw80iBnZEAx6Ak9y5B6ykyQlRyyRxgdSJH1sJPV70PGkH7a39OBL0Y
   g==;
X-CSE-ConnectionGUID: RLfirsmxS5aOml23OLJToQ==
X-CSE-MsgGUID: T7HyrRNpQ5avHzQxIHVCBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87765189"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87765189"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 12:07:46 -0700
X-CSE-ConnectionGUID: BMA8wZQLQhimroP/zyK32g==
X-CSE-MsgGUID: vmgEJvcIQ1Cc0Z1Ot7AQdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="264656223"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 21 Aug 2026 12:07:45 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxUad-000000007jl-07ky;
	Fri, 21 Aug 2026 19:07:43 +0000
Date: Fri, 21 Aug 2026 21:07:02 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb:
 pinconf@8a21000 (pinconf-single): $nodename:0: 'pinconf@8a21000' does not
 match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
Message-ID: <202608212132.SIIZHJdh-lkp@intel.com>
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
TO: Frank Li <Frank.Li@nxp.com>
CC: Linus Walleij <linusw@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   531ed942bb0df04f6747983fecdedce76a22d07f
commit: 9e5e1de61db29277d107bd6985c57629df449610 dt-bindings: pinctrl: Add generic pinctrl for board-level mux chips
date:   4 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-2054-20260820 (https://download.01.org/0day-ci/archive/20260821/202608212132.SIIZHJdh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608212132.SIIZHJdh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9e5e1de61db2 ("dt-bindings: pinctrl: Add generic pinctrl for board-level mux chips")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608212132.SIIZHJdh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/clock-reset-controller@8a22000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-crg', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/clock-reset-controller@8a22000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/system-controller@8000000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-sysctrl', 'syscon']
>> arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: pinconf@8a21000 (pinconf-single): $nodename:0: 'pinconf@8a21000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: spi@8b1a000 (arm,pl022): Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: gpio@8b29000 (arm,pl061): gpio-ranges:1: [11, 71, 1] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9840000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9840000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9841000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9841000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ir@8001000: failed to match any schema with compatible: ['hisilicon,hix5hd2-ir']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
