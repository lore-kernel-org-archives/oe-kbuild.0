Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C2215CD74
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Nov 2024 09:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732354472; cv=none; b=eidezHUAHGidDXU3yskhP/SuWit/J6NhsiuTWs8bUz9GBp7ud904FFCXsR9kRtA5NRuzFzrQCCwS97Hx7CDUIEEz23VrBYEILxjc4vosFeEjI7B+I9C0iG8vc4nWB8qqfCPnYUJvhwqrkbVgtTxYb1sIAhLQNb0kEIQKubHT/Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732354472; c=relaxed/simple;
	bh=dPWH2MoaIS2F+gVu29KnwCezTGIwL62X9FNYGJ7hOYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MlJz79Gz+YjoyqmqJp0C/fM/WETty6co79zZ9osdbvXe5Oz2A0ud9F3dkBy7Yjpv7L3i2dawVH4h0Uv1LFQGyVSvTho0GV6YoymEDLiUujOz5Fn1K4uEBpph8/x1MYWQuaYfQS0ITnzU/nU5yF1lUwXB2HyaRshhbBIqlwlTcXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WeTjjo1+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WeTjjo1+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732354470; x=1763890470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dPWH2MoaIS2F+gVu29KnwCezTGIwL62X9FNYGJ7hOYQ=;
  b=WeTjjo1+4B/rrvhiUxsc7FIsXoDdTdqQhnsbV3fShq+T9dyiBf134GXI
   ief2KG83HqA+OopGTbg4vVnFW/1lpYYDjCAbfwqMi1HnV8jqc1pgEzFZb
   LituY0usCdJHSybn6eYx2L4c3oE2EXonCb8FxzZFhvPOP80/kngwAQDkv
   2TBcPfkOWqXZf7ZqQ7ZwhRk1wiJvHCh6IFbDFA4Or5BYGvJ22DQ3dMcag
   0yESyBZOIcS1wjae4Xs1fOzFHiKDaPXfEYeKxZstfUKCWaIfMUo5KdcYF
   z1eSU7AM6JF8PVH4wi1rkE0asiPmPixsscFcPn0eQqkvTwMiqnh7LBWQm
   g==;
X-CSE-ConnectionGUID: uxJkXioSTy2OA0kSFZTGEg==
X-CSE-MsgGUID: AAakIZ27RhKsv3xbJcpEiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32754193"
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="32754193"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 01:34:29 -0800
X-CSE-ConnectionGUID: /3FjUp80SUq8A1UVZMkl+w==
X-CSE-MsgGUID: n5f0BLifTOiOT6nmaz+8hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="91216679"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Nov 2024 01:34:29 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEmX4-0004Xr-18;
	Sat, 23 Nov 2024 09:34:26 +0000
Date: Sat, 23 Nov 2024 17:34:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] ARM: dts: microchip: sama5d29_curiosity: Add
 no-1-8-v property to sdmmc0 node
Message-ID: <202411231746.YU59tA8V-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20241122 (https://download.01.org/0day-ci/archive/20241123/202411231746.YU59tA8V-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231746.YU59tA8V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411231746.YU59tA8V-lkp@intel.com/

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
