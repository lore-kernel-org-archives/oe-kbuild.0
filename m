Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0660934D394
	for <oe-kbuild@lists.linux.dev>; Sat, 23 May 2026 10:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779532064; cv=none; b=jnJIhPpE/XhqYhTaOq3WZJ+eUNyVqSzcwwTPo7t1YvOVjaJpyPzCydLvJc0z6rXlX3w9i3UO0I8VWyGGKnRwmogP+YQydOvJ4kYTogUcDPQllZh+GgBabcj81c3sqHIqdlebYydFjKSx/VE+LQWfcv5XWFT8N+gLyp5Lj3QM31o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779532064; c=relaxed/simple;
	bh=cg4Ud0PoNyA0DMqPOXNB6LWm6UBvmvwYIlTlMq6WOeM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KNbTqFlzyQf+iCBsVOEmTGrb7eZYoyCPIoSnn7tf44zCDmKBUpg82zF+acsd3k11Tss69tr1XeU9moFq/jf3kELsNB/64Jkle0IVGXhskJKiDJiGBQgNHsWnEOK7Fqw3LSqNBG7GKGfvltRf7pLJca6DyERCOiAKFaTrdEpudlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=na9Avs6j; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="na9Avs6j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779532063; x=1811068063;
  h=date:from:to:cc:subject:message-id;
  bh=cg4Ud0PoNyA0DMqPOXNB6LWm6UBvmvwYIlTlMq6WOeM=;
  b=na9Avs6j1NFEpsuX1pRT1TYiV2YkIB8BxI899xhNqS7sGrbMUt8cGtX3
   N8pOI4jr+y1wh/PAg//GGxt3Ey/C6KXK1ZGfhRjnJgoa5brPe2ppTgLVM
   UHc0kk5yvyQAd91b4FS6KVpMs+QXWibDZaPDIuJmWnRGpxzuSIHnog2Xa
   3M8VAaQ7jKEmbbjKiRdCcJ0NGXMvl+p1yhTv5AobLvmsPRJz4989cvfFb
   sf5JjizORTvsoKxD2ZHVxKm1ic2R9ZSPb5Q5sUkd11Y8XOahB5w5xmfqb
   L2moq4xbmI0fpa2G8HnGHRi29q16cn4h9U4hCBrmIJR8IZdfuoUdokAg1
   Q==;
X-CSE-ConnectionGUID: ssHAnYR/Ti+H3cBcaYPa6g==
X-CSE-MsgGUID: bUD5LqjURySPkEQlTRHSVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="67967293"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="67967293"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 03:27:42 -0700
X-CSE-ConnectionGUID: 1FtqOlEoRj6rfj4i1jbHeA==
X-CSE-MsgGUID: aHPcKPIFRzugPKuFGlEMwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="238104755"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 23 May 2026 03:27:41 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQjZz-00000000BZr-2eE8;
	Sat, 23 May 2026 10:27:39 +0000
Date: Sat, 23 May 2026 12:27:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/canyonlands.dtb: gpio@ef600b00
 (ibm,ppc4xx-gpio): '#gpio-cells' is a required property
Message-ID: <202605231235.JMdJeCsw-lkp@intel.com>
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
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   79bd2dded182b1d458b18e62684b7f82ffc682e5
commit: f03a7f20b23c1abb1066f791806bbca406362324 dt-bindings: gpio: Create a trivial GPIO schema
date:   10 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 10 months ago
config: powerpc-randconfig-2051-20260521 (https://download.01.org/0day-ci/archive/20260523/202605231235.JMdJeCsw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605231235.JMdJeCsw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f03a7f20b23c ("dt-bindings: gpio: Create a trivial GPIO schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605231235.JMdJeCsw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/ebc/ndfc@3,0: failed to match any schema with compatible: ['ibm,ndfc']
   arch/powerpc/boot/dts/canyonlands.dtb: serial@ef600300 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/canyonlands.dtb: serial@ef600400 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/i2c@ef600700: failed to match any schema with compatible: ['ibm,iic-460ex', 'ibm,iic']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/i2c@ef600700: failed to match any schema with compatible: ['ibm,iic-460ex', 'ibm,iic']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/i2c@ef600800: failed to match any schema with compatible: ['ibm,iic-460ex', 'ibm,iic']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/i2c@ef600800: failed to match any schema with compatible: ['ibm,iic-460ex', 'ibm,iic']
>> arch/powerpc/boot/dts/canyonlands.dtb: gpio@ef600b00 (ibm,ppc4xx-gpio): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml
   arch/powerpc/boot/dts/canyonlands.dtb: gpio@ef600b00 (ibm,ppc4xx-gpio): '#gpio-cells' is a dependency of 'gpio-controller'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/emac-zmii@ef600d00: failed to match any schema with compatible: ['ibm,zmii-460ex', 'ibm,zmii']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/emac-zmii@ef600d00: failed to match any schema with compatible: ['ibm,zmii-460ex', 'ibm,zmii']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/emac-rgmii@ef601500: failed to match any schema with compatible: ['ibm,rgmii-460ex', 'ibm,rgmii']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/emac-rgmii@ef601500: failed to match any schema with compatible: ['ibm,rgmii-460ex', 'ibm,rgmii']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/emac-tah@ef601350: failed to match any schema with compatible: ['ibm,tah-460ex', 'ibm,tah']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/emac-tah@ef601350: failed to match any schema with compatible: ['ibm,tah-460ex', 'ibm,tah']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/emac-tah@ef601450: failed to match any schema with compatible: ['ibm,tah-460ex', 'ibm,tah']
--
   arch/powerpc/boot/dts/wii.dtb: /hollywood/sd@d070000: failed to match any schema with compatible: ['nintendo,hollywood-sdhci', 'sdhci']
   arch/powerpc/boot/dts/wii.dtb: /hollywood/sd@d070000: failed to match any schema with compatible: ['nintendo,hollywood-sdhci', 'sdhci']
   arch/powerpc/boot/dts/wii.dtb: /hollywood/sdio@d080000: failed to match any schema with compatible: ['nintendo,hollywood-sdhci', 'sdhci']
   arch/powerpc/boot/dts/wii.dtb: /hollywood/sdio@d080000: failed to match any schema with compatible: ['nintendo,hollywood-sdhci', 'sdhci']
   arch/powerpc/boot/dts/wii.dtb: /hollywood/ipc@d000000: failed to match any schema with compatible: ['nintendo,hollywood-ipc']
   arch/powerpc/boot/dts/wii.dtb: pic1@d800030 (nintendo,hollywood-pic): '#interrupt-cells', 'interrupt-controller', 'interrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml
   arch/powerpc/boot/dts/wii.dtb: pic1@d800030 (nintendo,hollywood-pic): 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml
   arch/powerpc/boot/dts/wii.dtb: /hollywood/srnprot@d800060: failed to match any schema with compatible: ['nintendo,hollywood-srnprot']
>> arch/powerpc/boot/dts/wii.dtb: gpio@d8000c0 (nintendo,hollywood-gpio): '#interrupt-cells', 'interrupt-controller', 'interrupt-parent', 'interrupts' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml
   arch/powerpc/boot/dts/wii.dtb: /hollywood/control@d800100: failed to match any schema with compatible: ['nintendo,hollywood-control']
   arch/powerpc/boot/dts/wii.dtb: /hollywood/disk@d806000: failed to match any schema with compatible: ['nintendo,hollywood-di']
   arch/powerpc/boot/dts/wii.dtb: gpio-leds (gpio-leds): 'drive-slot' does not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
   arch/powerpc/boot/dts/wii.dtb: gpio-keys (gpio-keys): 'eject', 'power' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
