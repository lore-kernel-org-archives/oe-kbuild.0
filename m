Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8406F4AE12F
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Oct 2026 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791211243; cv=none; b=fp4IyFxOLRo+B/KPSgGeXdwgEr8pcni8s5O3+hOLaPfNq3tRbbNBBKk0TMfcJQGNPIDTbOdD77+21yCC6YhOzUsfIljiinpE0ENKISm0kZyjsVU2U1wEx/inlIDI1HJ6Quxjj1ufv+KkFg+XenNxeQnVfCa7jINATRv8IMxOf3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791211243; c=relaxed/simple;
	bh=yupYKZvis9t51WlSv+jv/T5t75HThSK4HyBT7c3lolc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CXLCrTWobJCIxn2vNQTi1pLmjuwQgRGk5Yy3vODQRBf8MAWwu6WnAPrFFoJAyU8OVfQn86joEQ/FpWqRbeVMngkjfmVKHsiPDhzcep6UN6w1GObC08ssFDqYRzwwPHDqRG/+tPrn8ia1VGudXeLAg9+8FZf8p4H0wtHS3gwd//c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caP2cTE6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caP2cTE6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791211231; x=1822747231;
  h=date:from:to:cc:subject:message-id;
  bh=yupYKZvis9t51WlSv+jv/T5t75HThSK4HyBT7c3lolc=;
  b=caP2cTE6En/CN0hmLg7iv4dZdVv2ErC7M9j9O/z/HS+DoAynnF4mROQB
   HbJuseu9tkfW1TaD7mIwJlv+n2LbasP6vh9ebAZS5C71f9oqWxGt39UrE
   NXGgewK5mCyNmxktqdqSvCEtLhDqHxZxy3PxOvZ4HdXu9AhcZrfLt8yfq
   6uuw3Vg96Vmpf7giCGwYCnIY/WNzsvO/5uxlo4khIrajiYyEzf+nU83HZ
   fAvnoURIdgA9CpooTU66haoY/qGhsYAw99yKiqn2eCGwcCLPCfAHtI4dE
   9CgnRE+Dp8YFxoeW2fKEwPJRzhTHA6ZWTgNEfFJQ2WFvYhO6IO/U/KPec
   A==;
X-CSE-ConnectionGUID: PGpTWOtoQzyiAzOmyp57WA==
X-CSE-MsgGUID: C2iFMZY9R/6r0NA+veLD7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91990357"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="91990357"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 07:40:27 -0700
X-CSE-ConnectionGUID: UPQavUgBSt6lIl91brPQbw==
X-CSE-MsgGUID: DqyBqGgsSyCTNbmk4wbMNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="853563"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 05 Oct 2026 07:40:27 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDjrc-000000000A7-1q9F;
	Mon, 05 Oct 2026 14:40:24 +0000
Date: Mon, 05 Oct 2026 16:39:51 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gclement-mvebu:mvebu/dt 11/11]
 arch/arm/boot/dts/marvell/armada-388-helios4.dtb:
 /soc/internal-regs/i2c@11000/gpio-expander@20: failed to match any schema
 with compatible: ['onnn,pca9655']
Message-ID: <202610051617.UTrXN1ig-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Rosen Penev <rosenp@gmail.com>
CC: Gregory CLEMENT <gregory.clement@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git mvebu/dt
head:   6dfda79476538a9aad1d2dac45453e62c6939522
commit: 6dfda79476538a9aad1d2dac45453e62c6939522 [11/11] ARM: dts: marvell: armada-388: use onnn,pca9655 compatible
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-2400-20260930 (https://download.01.org/0day-ci/archive/20261005/202610051617.UTrXN1ig-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1f84168f595dab2e23aab4181997da0a7f486dc7)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051617.UTrXN1ig-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610051617.UTrXN1ig-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml
>> arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/i2c@11000/gpio-expander@20: failed to match any schema with compatible: ['onnn,pca9655']
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: i2c@11100 (marvell,mv78230-a0-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too long
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-i2c' was expected
--
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml
>> arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/i2c@11000/gpio-expander@20: failed to match any schema with compatible: ['onnn,pca9655']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: i2c@11100 (marvell,mv78230-a0-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too long
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-i2c' was expected
--
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml
>> arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: /soc/internal-regs/i2c@11000/gpio-expander@20: failed to match any schema with compatible: ['onnn,pca9655']
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: i2c@11100 (marvell,mv78230-a0-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too long
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-i2c' was expected
--
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml
>> arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/i2c@11000/gpio-expander@20: failed to match any schema with compatible: ['onnn,pca9655']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: i2c@11100 (marvell,mv78230-a0-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too long
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-i2c' was expected

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
