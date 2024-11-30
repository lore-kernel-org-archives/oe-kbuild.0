Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B1F224D4
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 06:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732947696; cv=none; b=AD2pB7SSd0+BqQ04gRhfzcXjpiM/n2IH0rKbgRlXVPJcXntqw1WgO7VVy7G5VXGVrr1mjHi3CvJSSWdSakUf7wbf13Wu3MuKobFJ5bjWEIfMD8c4Ll24cLRiJk95lASZEm2uDHL/ZrpvGd/cwknCdHeDwIB3dT/IjoculaO/maU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732947696; c=relaxed/simple;
	bh=SCNmrZRdIe/8+eDR3AilZM5B2Lido/diF+DrH5km3F0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u2qdx+O9FHVZfuX4HZH7X30sZGGu8SEACczBxSNo/kvN9/nFifcvaMAcSPO6AfYNQxHBxMZ+XmwFrV29AtrqFuO+gBIlpl3sJgiXVxsWLsawZAXXGdrexU/cunpSjjwiLt89cuwT2c3yXGlYPg3d5H5e/HYqyQJoXGojteJBz5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhMefuy7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhMefuy7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732947694; x=1764483694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SCNmrZRdIe/8+eDR3AilZM5B2Lido/diF+DrH5km3F0=;
  b=YhMefuy73T7QokqJgLZY4OKh+Co/jN5FHOa7E9j1Rjfw7UsstV+OJb2T
   rwgM2fPcZQpDacjz6tDzzqhQeLd5VAZ+Pha8AKU89xGUb45RAQVZSLO2F
   b22KsErU0/lBVcX1QOQmiSmgKYjcnmu3Le6Pm0fH++FcfRDtlgudN+tjt
   b91H02i/Tny/WahQzKjFinM4iLWl29M5e6P515e1ZKPjpiwZpMY6IZhCH
   X4FAYr4hMw7EVqmaFm/0D30AoPg+kZj2XGUMplMEy2Ix+CGF2Ogx2kLvG
   uPtNEIhX9AS2/4rFBh+lb4UmZjDDviOPV1jcmDGLpnttm6/XVduWmKkwI
   g==;
X-CSE-ConnectionGUID: 9xCirB9MTcKcSUwOVswwKg==
X-CSE-MsgGUID: HHlrNi6xQ7WmncvzEEn1hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33224547"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="33224547"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 22:21:33 -0800
X-CSE-ConnectionGUID: r0Qd8NjlSkSwB8+Hg8SGwQ==
X-CSE-MsgGUID: cptag4TgQI6fD/oZsHZulA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="93023923"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 29 Nov 2024 22:21:33 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHGrC-00008N-1X;
	Sat, 30 Nov 2024 06:21:30 +0000
Date: Sat, 30 Nov 2024 14:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] ARM: dts: microchip: sama5d29_curiosity: Add
 no-1-8-v property to sdmmc0 node
Message-ID: <202411301244.DGKPJ8AH-lkp@intel.com>
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
In-Reply-To: <20241119160107.598411-2-cristian.birsan@microchip.com>
References: <20241119160107.598411-2-cristian.birsan@microchip.com>
TO: cristian.birsan@microchip.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: nicolas.ferre@microchip.com
TO: alexandre.belloni@bootlin.com
TO: claudiu.beznea@tuxon.dev
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Cristian Birsan <cristian.birsan@microchip.com>
CC: Mihai Sain <mihai.sain@microchip.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 158f238aa69d91ad74e535c73f552bd4b025109c]

url:    https://github.com/intel-lab-lkp/linux/commits/cristian-birsan-microchip-com/ARM-dts-microchip-sama5d29_curiosity-Add-no-1-8-v-property-to-sdmmc0-node/20241121-134919
base:   158f238aa69d91ad74e535c73f552bd4b025109c
patch link:    https://lore.kernel.org/r/20241119160107.598411-2-cristian.birsan%40microchip.com
patch subject: [PATCH 1/2] ARM: dts: microchip: sama5d29_curiosity: Add no-1-8-v property to sdmmc0 node
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm-randconfig-051-20241122 (https://download.01.org/0day-ci/archive/20241130/202411301244.DGKPJ8AH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411301244.DGKPJ8AH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411301244.DGKPJ8AH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: ehci@500000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,sama5d3-ebi']
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: nand-controller: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: nand-controller: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,sama5d3-nand-controller']
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: sdio-host@a0000000: $nodename:0: 'sdio-host@a0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: sdio-host@a0000000: Unevaluated properties are not allowed ('bus-width', 'disable-wp', 'no-1-8-v' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: sdio-host@b0000000: $nodename:0: 'sdio-host@b0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: sdio-host@b0000000: Unevaluated properties are not allowed ('bus-width', 'disable-wp' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: hlcdc@f0000000: 'hlcdc-display-controller', 'hlcdc-pwm' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/ramc@f000c000: failed to match any schema with compatible: ['atmel,sama5d3-ddramc']
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/dma-controller@f0010000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/dma-controller@f0004000: failed to match any schema with compatible: ['atmel,sama5d4-dma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
