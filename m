Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8991D3D411B
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Aug 2026 07:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787126173; cv=none; b=Gs9Yiogo3SOBlQbM2luMkuZ5Hb9+EORm2ROrhgZTSuEFeBQegZlPFC+7knbrg6Ydvdotai4Tum3qtcTYFlleeWGzwA9cheXebfs8tbDUb0sDSjePdrGShrNsjUtRH9yAbL908aK8tNXSa60nheS4sUPzaapav9kN6hvblnJ/6nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787126173; c=relaxed/simple;
	bh=Q4Ap5e5ZTuJjnOFYVhSk5hXZlnVbas7ik2KlfQE9zZk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fL8GgyJ9R4FE+u0LvjiJ+u+MjRHgisRz1uO0y9tFGRVt2WndQ/QSX6nUHdKtwzB7yKfKgBFXGa2fq1X6Pa/Jr3Qxw63ufl5LUILKw6tP53VGzrC8ZX+LcQ8NRdYG5UY9s7O9xaTtVDRVRole2djaHNCFKREkFyiJObP2YYgpxFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VkAcfVvh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VkAcfVvh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787126172; x=1818662172;
  h=date:from:to:cc:subject:message-id;
  bh=Q4Ap5e5ZTuJjnOFYVhSk5hXZlnVbas7ik2KlfQE9zZk=;
  b=VkAcfVvhAEGE+JXuiV9q7S4kAm15oigBJbvfgER2ZBVzDRqZ8NKHY3De
   jJ/vk6h86N0Ak2DpdBI6kSVCjBlW6x70f7mnAhtwgGiwO5Jt4ikSJQxj8
   YbxAv7lcGwMsYOECWB2Rxj4SVau0wYnUfbgO83r+JaykSyoxk8Xj/Ooi1
   jUWLHEENVYmQSXImjZL9nY19h4FUZGBcLHb53NFuBDmEEcWBTtbT+avEv
   NFSzQSb1bFzwR7K8im/ddiwQtc153pP0q/5ydD8ldgTrIVievPglVi/ph
   0Ys118i6wPZNrQMi/3wxRYb+zVvwOauJQvDhn3MKmoETIaRfZj7uXozst
   A==;
X-CSE-ConnectionGUID: f9YhMD30Q8iOG/n+LnMjOg==
X-CSE-MsgGUID: SiBWQRv5TS2KnylgLek87w==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87752494"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87752494"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 00:56:10 -0700
X-CSE-ConnectionGUID: jNaCPLTwQFWqYksgOglP4Q==
X-CSE-MsgGUID: tY74gniCTyudL07y7aNn4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="288984586"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 19 Aug 2026 00:56:09 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwb9a-000000007Mb-48W7;
	Wed, 19 Aug 2026 07:56:06 +0000
Date: Wed, 19 Aug 2026 09:55:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dtb:
 /pinctrl: failed to match any schema with compatible:
 ['rockchip,rv1106-pinctrl']
Message-ID: <202608190939.yBWzXzEf-lkp@intel.com>
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
TO: Simon Glass <sjg@chromium.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Simon-Glass/dt-bindings-clock-rockchip-Add-RV1106-CRU-support/20260807-100151
head:   b884d8509a8ae2fcbf2d57b746503d6ae8d573fe
commit: b884d8509a8ae2fcbf2d57b746503d6ae8d573fe ARM: dts: rockchip: Add Luckfox Pico Mini B
date:   12 days ago
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: arm-randconfig-2053-20260817 (https://download.01.org/0day-ci/archive/20260819/202608190939.yBWzXzEf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190939.yBWzXzEf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608190939.yBWzXzEf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/rockchip/rv1106.dtsi:144.38-154.5: Warning (simple_bus_reg): /soc/interrupt-controller@ff1f0000: simple-bus unit address format error, expected "ff1f1000"
>> arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dtb: /pinctrl: failed to match any schema with compatible: ['rockchip,rv1106-pinctrl']
>> arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dtb: gpio@ff380000 (rockchip,gpio-bank): 'rockchip,grf' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/rockchip,gpio-bank.yaml
>> arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dtb: gpio@ff530000 (rockchip,gpio-bank): 'rockchip,grf' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/rockchip,gpio-bank.yaml
>> arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dtb: gpio@ff550000 (rockchip,gpio-bank): 'rockchip,grf' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/rockchip,gpio-bank.yaml
>> arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dtb: gpio@ff560000 (rockchip,gpio-bank): 'rockchip,grf' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/rockchip,gpio-bank.yaml
   arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dtb: adc@ff3c0000 (rockchip,rv1106-saradc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rv1106-saradc', 'rockchip,rk3588-saradc'] is too long
   	'rockchip,saradc' was expected
   	'rockchip,rk3066-tsadc' was expected
   	'rockchip,rk3399-saradc' was expected
   	'rockchip,rk3528-saradc' was expected
   	'rockchip,rk3506-saradc' was expected
   	'rockchip,rk3562-saradc' was expected
   	'rockchip,rk3588-saradc' was expected
--
   arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dtb: /soc/serial@ff4e0000: failed to match any schema with compatible: ['rockchip,rv1106-uart', 'snps,dw-apb-uart']
   arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dtb: serial@ff4f0000 (rockchip,rv1106-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rv1106-uart', 'snps,dw-apb-uart'] is too short
   	['rockchip,rv1106-uart', 'snps,dw-apb-uart'] is too long
   	'renesas,r9a06g032-uart' was expected
   	'rockchip,rv1106-uart' is not one of ['anlogic,dr1v90-uart', 'brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart', 'rockchip,px30-uart', 'rockchip,rk1808-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3128-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rk3506-uart', 'rockchip,rk3528-uart', 'rockchip,rk3562-uart', 'rockchip,rk3568-uart', 'rockchip,rk3576-uart', 'rockchip,rk3588-uart', 'rockchip,rv1103b-uart', 'rockchip,rv1108-uart', 'rockchip,rv1126-uart', 'sophgo,sg2044-uart', 'starfive,jh7100-hsuart', 'starfive,jh7100-uart', 'starfive,jh7110-uart', 'ultrarisc,dp1000-uart']
   	'snps,dw-apb-uart' was expected
   	'renesas,rzn1-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dtb: /soc/serial@ff4f0000: failed to match any schema with compatible: ['rockchip,rv1106-uart', 'snps,dw-apb-uart']
>> arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dtb: watchdog@ff5a0000 (rockchip,rv1106-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rv1106-wdt', 'snps,dw-wdt'] is too long
   	'snps,dw-wdt' was expected
   	'rockchip,rv1106-wdt' is not one of ['rockchip,px30-wdt', 'rockchip,rk3066-wdt', 'rockchip,rk3128-wdt', 'rockchip,rk3188-wdt', 'rockchip,rk3228-wdt', 'rockchip,rk3288-wdt', 'rockchip,rk3308-wdt', 'rockchip,rk3328-wdt', 'rockchip,rk3368-wdt', 'rockchip,rk3399-wdt', 'rockchip,rk3506-wdt', 'rockchip,rk3528-wdt', 'rockchip,rk3562-wdt', 'rockchip,rk3568-wdt', 'rockchip,rk3576-wdt', 'rockchip,rk3588-wdt', 'rockchip,rv1103b-wdt', 'rockchip,rv1108-wdt', 'rockchip,rv1126-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/snps,dw-wdt.yaml
>> arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dtb: /soc/watchdog@ff5a0000: failed to match any schema with compatible: ['rockchip,rv1106-wdt', 'snps,dw-wdt']
>> arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dtb: mmc@ffa90000 (rockchip,rv1106-dw-mshc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rv1106-dw-mshc', 'rockchip,rk3288-dw-mshc'] is too long
   	'rockchip,rk2928-dw-mshc' was expected
   	'rockchip,rk3288-dw-mshc' was expected
   	'rockchip,rv1106-dw-mshc' is not one of ['rockchip,px30-dw-mshc', 'rockchip,rk1808-dw-mshc', 'rockchip,rk3036-dw-mshc', 'rockchip,rk3128-dw-mshc', 'rockchip,rk3228-dw-mshc', 'rockchip,rk3308-dw-mshc', 'rockchip,rk3328-dw-mshc', 'rockchip,rk3368-dw-mshc', 'rockchip,rk3399-dw-mshc', 'rockchip,rk3506-dw-mshc', 'rockchip,rk3528-dw-mshc', 'rockchip,rk3562-dw-mshc', 'rockchip,rk3568-dw-mshc', 'rockchip,rk3588-dw-mshc', 'rockchip,rv1108-dw-mshc', 'rockchip,rv1126-dw-mshc']
   	'rockchip,rv1106-dw-mshc' is not one of ['rockchip,rv1103b-dw-mshc']
   	'rockchip,rk3576-dw-mshc' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml
>> arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dtb: /soc/mmc@ffa90000: failed to match any schema with compatible: ['rockchip,rv1106-dw-mshc', 'rockchip,rk3288-dw-mshc']
>> arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dtb: mmc@ffaa0000 (rockchip,rv1106-dw-mshc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rv1106-dw-mshc', 'rockchip,rk3288-dw-mshc'] is too long
   	'rockchip,rk2928-dw-mshc' was expected
   	'rockchip,rk3288-dw-mshc' was expected
   	'rockchip,rv1106-dw-mshc' is not one of ['rockchip,px30-dw-mshc', 'rockchip,rk1808-dw-mshc', 'rockchip,rk3036-dw-mshc', 'rockchip,rk3128-dw-mshc', 'rockchip,rk3228-dw-mshc', 'rockchip,rk3308-dw-mshc', 'rockchip,rk3328-dw-mshc', 'rockchip,rk3368-dw-mshc', 'rockchip,rk3399-dw-mshc', 'rockchip,rk3506-dw-mshc', 'rockchip,rk3528-dw-mshc', 'rockchip,rk3562-dw-mshc', 'rockchip,rk3568-dw-mshc', 'rockchip,rk3588-dw-mshc', 'rockchip,rv1108-dw-mshc', 'rockchip,rv1126-dw-mshc']
   	'rockchip,rv1106-dw-mshc' is not one of ['rockchip,rv1103b-dw-mshc']
   	'rockchip,rk3576-dw-mshc' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml
>> arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dtb: /soc/mmc@ffaa0000: failed to match any schema with compatible: ['rockchip,rv1106-dw-mshc', 'rockchip,rk3288-dw-mshc']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
