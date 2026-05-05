Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF86D3BFE38
	for <oe-kbuild@lists.linux.dev>; Tue,  5 May 2026 20:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778013007; cv=none; b=aZt6LG1lDiwdoPj96HURDr8yPSWsYpnhhhOaLlFOMqk2uRQugx9VJ1g0GPDYbzgOjRz9NfbeW2F/L+01fjZt6ZOmoQlAkNd3BipjnWE37WicClFNjYXUoaWj5xaBahgGGBiTBJkAlpcvuAS1dqr6jbYRZ1yOFpV9uaSHsHlyj1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778013007; c=relaxed/simple;
	bh=H2LtuJV7s6H+KP3XEnzz4dw9+tTEXxRoS/xSjCpnbqs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RKWxdRPMxzORYTezWvve4I2JrOGKOJsDzk87FkU+yKt45Acj5DrCY6L/BkvE64yneMI2OBfY+IDti8VykElRMmksm6M8kIl6aJk8MaLb3BkL6Ge9mebdlWuXOr8NKxavyrtknt7KvhvSrrOG7WpKXWDdAVa3t39PB34jpl69nP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jW5o0SqY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jW5o0SqY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778013005; x=1809549005;
  h=date:from:to:cc:subject:message-id;
  bh=H2LtuJV7s6H+KP3XEnzz4dw9+tTEXxRoS/xSjCpnbqs=;
  b=jW5o0SqY/RObgzz0Rxqkwiz6zMO0ZnMIdYHCP5s5c2UpNqpmKBrlBs2E
   isrctv8C3EAde/OZmecksuwlXJukq34EhFfImTXzl/vX5mwDV3qVo46NM
   FhRFZHYUBiEVUycFRwck4RKpwjbZLHRGEzUjsffosDrc6V9/hSUkxDaul
   UiIuV1ry4wwUNRHmLaK7KikTFN7L55j3Uvda0X+GYHv4KN/G9291Gf/m+
   2vocv0okt5wbjWykbRzvqnOAwv0+QD6e9mX7KQcXNnqiidJeSbF9se4or
   7AYkNLUCaY8y/Sceq8ob7aZlOqusc3SMC5KP8rYL2vUDIV71pxqIk0Jkl
   A==;
X-CSE-ConnectionGUID: z1lKipglTFiwAMp2UtVtuw==
X-CSE-MsgGUID: 95fQYHtIR1KWNz4cPGVVgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78757707"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="78757707"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 13:30:04 -0700
X-CSE-ConnectionGUID: /XsDx2E1TXKuj5gOhjacTA==
X-CSE-MsgGUID: iOz/Gi6bQRGAjwYKzECJNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="233259306"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 05 May 2026 13:30:04 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKMP3-000000006JZ-2r7Y;
	Tue, 05 May 2026 20:30:01 +0000
Date: Tue, 05 May 2026 22:29:12 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt6797-evb.dtb:
 pinctrl@10005000 (mediatek,mt6797-pinctrl): 'i2c0-pins', 'i2c1-pins',
 'i2c2-pins', 'i2c3-pins', 'i2c4-pins', 'i2c5-pins', 'i2c6-pins', 'i2c7-pins',
 'uart0-pins', 'uart1-pins' do not match any of the regexes: '-...
Message-ID: <202605052221.aVLy45ow-lkp@intel.com>
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
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>
CC: Fei Shao <fshao@chromium.org>

Hi AngeloGioacchino,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9207d47f966be9f4d52e7e0119ac2b7a7e366f3e
commit: e3c84c9408bbaead850daf5e5f515ea025821b57 arm64: dts: mediatek: mt6797: Fix pinctrl node names
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260505/202605052221.aVLy45ow-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605052221.aVLy45ow-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e3c84c9408bb ("arm64: dts: mediatek: mt6797: Fix pinctrl node names")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605052221.aVLy45ow-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: pinctrl@10005000 (mediatek,mt6797-pinctrl): 'i2c0-pins', 'i2c1-pins', 'i2c2-pins', 'i2c3-pins', 'i2c4-pins', 'i2c5-pins', 'i2c6-pins', 'i2c7-pins', 'uart0-pins', 'uart1-pins' do not match any of the regexes: '-[0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt6797-scpsys']
   arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: intpol-controller@10200620 (mediatek,mt6797-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml
--
>> arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: pinctrl@10005000 (mediatek,mt6797-pinctrl): 'i2c0-pins', 'i2c1-pins', 'i2c2-pins', 'i2c3-pins', 'i2c4-pins', 'i2c5-pins', 'i2c6-pins', 'i2c7-pins', 'uart0-pins', 'uart1-pins' do not match any of the regexes: '-[0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt6797-scpsys']
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: intpol-controller@10200620 (mediatek,mt6797-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: i2c@11008000 (mediatek,mt6797-i2c): Unevaluated properties are not allowed ('id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: i2c@1100e000 (mediatek,mt6797-i2c): Unevaluated properties are not allowed ('id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: i2c@11010000 (mediatek,mt6797-i2c): Unevaluated properties are not allowed ('id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
