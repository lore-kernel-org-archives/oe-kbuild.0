Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440561925AC
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Mar 2025 23:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741390792; cv=none; b=nxYvJmmNI9INc+YjUNvUCMI8xZJukm3fRQ+KzDOd5aQOe1ziChfHvcUOA5WA28U813D1WauTHspzT/W1g/5NpxK5u0iQIKLMb6e02Oh7g2GLHSCIogWYl/fgICL3XK32CJRq9G77FrQqyWAiFH+CVwxyeu6pkvVNzxzH2zcYpj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741390792; c=relaxed/simple;
	bh=x3zzfwQGSyVJk/PztjRQx5UhyoP0cFrekQEo4bLjh4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uRM3djUF2Tv7bOFuhnYewEKNMrl8rW4yLbPIB9s7HL6PB24yM/pwTHQKCc3Q7gBAqurD8N3wPO7SHeQiSDm5wui3YNWML9I2ZIK6jl2LhlxS9DZe/kPLDdjAAReqKHsOPl8ytBtfP4fIQq0Pya9OQXZ8C8NYj5BJwmohjj3uX4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lABBOvVd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lABBOvVd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741390790; x=1772926790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x3zzfwQGSyVJk/PztjRQx5UhyoP0cFrekQEo4bLjh4k=;
  b=lABBOvVdbFZPnmkZ/BJXfClkp9vGCHmxPxvf+h+C/yUqUqlg5gVxCst/
   qacHgpGn0CFwYlc69OVdAKwgd0azeLNfYWgytj2t9t3vOQHUU5i2b0vMM
   UhpPvT++NWhQIIfYK6ekTYpcSaK/IAb7UKXrmF5QU0/63FjJ3rtBT7wR4
   ZJqtttqIS/6BH7hzrmwh0MymoBuHwUgR/dLGwukO561J0a9pMxoGDTDz2
   LG7sD+yviH7lpe4XTWxjWQFQqm48LfK6kmrlmn3pf4mDcIz9/0f1dIkFW
   mYamt6SqpHXWNwd6ciKt1Ablr5g89sDh73ztUrPBBkEMTT9Un/FuZW26u
   g==;
X-CSE-ConnectionGUID: wOOfMYzNR3KgFLyQ60R1hg==
X-CSE-MsgGUID: rzQMf1nRStek1txrg7riXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="30030639"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; 
   d="scan'208";a="30030639"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 15:39:49 -0800
X-CSE-ConnectionGUID: c4rycTFTRsKIBmFSXGixeA==
X-CSE-MsgGUID: Vst9wluTR4iepRcuoixAZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="156669169"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 07 Mar 2025 15:39:48 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqhI9-0001CJ-2O;
	Fri, 07 Mar 2025 23:39:45 +0000
Date: Sat, 8 Mar 2025 07:39:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] ARM: dts: microchip: sama5d29_curiosity: Add
 nvmem-layout in QSPI to describe EUI48 MAC address region
Message-ID: <202503080702.njsURrSa-lkp@intel.com>
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
In-Reply-To: <20250305100134.1171124-2-manikandan.m@microchip.com>
References: <20250305100134.1171124-2-manikandan.m@microchip.com>
TO: Manikandan Muralidharan <manikandan.m@microchip.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: nicolas.ferre@microchip.com
TO: alexandre.belloni@bootlin.com
TO: claudiu.beznea@tuxon.dev
TO: tudor.ambarus@linaro.org
TO: pratyush@kernel.org
TO: mwalle@kernel.org
TO: miquel.raynal@bootlin.com
TO: richard@nod.at
TO: vigneshr@ti.com
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-kernel@vger.kernel.org
TO: linux-mtd@lists.infradead.org
CC: manikandan.m@microchip.com

Hi Manikandan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/spi-nor/next]
[also build test WARNING on robh/for-next abelloni/rtc-next linus/master v6.14-rc5 next-20250306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manikandan-Muralidharan/ARM-dts-microchip-sama5d29_curiosity-Add-nvmem-layout-in-QSPI-to-describe-EUI48-MAC-address-region/20250305-180433
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
patch link:    https://lore.kernel.org/r/20250305100134.1171124-2-manikandan.m%40microchip.com
patch subject: [PATCH 2/2] ARM: dts: microchip: sama5d29_curiosity: Add nvmem-layout in QSPI to describe EUI48 MAC address region
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-051-20250306 (https://download.01.org/0day-ci/archive/20250308/202503080702.njsURrSa-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 14170b16028c087ca154878f5ed93d3089a965c6)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503080702.njsURrSa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503080702.njsURrSa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: sdio-host@a0000000: Unevaluated properties are not allowed ('bus-width', 'disable-wp', 'no-1-8-v' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: sdio-host@b0000000: $nodename:0: 'sdio-host@b0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: sdio-host@b0000000: Unevaluated properties are not allowed ('bus-width', 'disable-wp' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: hlcdc@f0000000: 'hlcdc-display-controller', 'hlcdc-pwm' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/ramc@f000c000: failed to match any schema with compatible: ['atmel,sama5d3-ddramc']
>> arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: flash@0: Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/ssc@f8004000: failed to match any schema with compatible: ['atmel,at91sam9g45-ssc']
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/hsmc@f8014000: failed to match any schema with compatible: ['atmel,sama5d2-smc', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/hsmc@f8014000/ecc-engine@f8014070: failed to match any schema with compatible: ['atmel,sama5d2-pmecc']
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: pwm@f802c000: Unevaluated properties are not allowed ('clocks', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pwm/atmel,at91sam-pwm.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/sfr@f8030000: failed to match any schema with compatible: ['atmel,sama5d2-sfr', 'syscon']
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/timer@f8048030: failed to match any schema with compatible: ['atmel,at91sam9260-pit']
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: watchdog@f8048040: Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/atmel,sama5d4-wdt.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
