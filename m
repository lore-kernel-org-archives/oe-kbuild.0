Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49471188CC6
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Nov 2024 07:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732694362; cv=none; b=cUDH1acM4obmTcmvjruxW5srb19cSJIiSJ2qcZ76eMZTrKF0U0qkBK1gnWFHyVBnCE7zMyPlYibPumCYchgC/4yFjUHI70AyDhZudnBx7l6Ivhtr0O8m2upC+RZjFcN2/2/a+SdDw/ab+l2UkJaWwGTbEvhjhaIXeYAEAXsnjH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732694362; c=relaxed/simple;
	bh=+P+VIPHiollQZiILhnkZYT1c+D3GVg1JZYyQS0mP++I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=seqox1QSKik5rcy6DIRDltrGNCiYq0XQ30RSOtTT5g8+ACouNEPz2wPanYzLNllF+KbGO2Fq94Sb4c97Wib6oOXMOfoYcJKOl2L6895ZVSMOR5Fdeh/KFmhna0U9qCGKJztPotC4YfNL0kfXVhyDFD7YBhJbjqfIsCHxm+3JvQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H41cPUgt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H41cPUgt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732694361; x=1764230361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+P+VIPHiollQZiILhnkZYT1c+D3GVg1JZYyQS0mP++I=;
  b=H41cPUgtx0DvuI8TAfWje70azdrJLqlQdpB791goHpgzueUwnFk6owad
   wUtiCfuNUrWPsAsFegPuaKhMXH2dh/OAiBW1bmpJ3Kj1neiBSgMVq/5et
   +ZmXYSgZ0CmeQiO6zVoWT/GJZcxinW/NBIWedMLGi3tJ++NqqXCC9wdnE
   UZuJbPCgVaNu6kp9w/RyAo2gZ2R7i6fxViPgv/MW5+X86otQlnqnol9DC
   0LPPe0DNFkzhtLHM7EAZ/UZBtor9994YEmmOl6fd/o4CveR9B/UWXMPUN
   h1xgly3LSGZn2qIvutT86TiHLduVdchNNNqWXpZEiIdkccunjl14MjMYI
   A==;
X-CSE-ConnectionGUID: Uyj8gqw3QQi1gZixetktTw==
X-CSE-MsgGUID: n7y2gJbZT+mejBelYSu/kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32628565"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="32628565"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 23:58:23 -0800
X-CSE-ConnectionGUID: y0GwLnD+SxeJRyd6hZ9P9Q==
X-CSE-MsgGUID: 74QeqRkXRui+5aMeuYXrhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="92320723"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Nov 2024 23:58:20 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGCwE-0007p1-0b;
	Wed, 27 Nov 2024 07:58:18 +0000
Date: Wed, 27 Nov 2024 15:57:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] ARM: dts: microchip: sama5d29_curiosity: Add
 no-1-8-v property to sdmmc0 node
Message-ID: <202411271521.CwzIHnLE-lkp@intel.com>
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
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-051-20241122 (https://download.01.org/0day-ci/archive/20241127/202411271521.CwzIHnLE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411271521.CwzIHnLE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411271521.CwzIHnLE-lkp@intel.com/

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
