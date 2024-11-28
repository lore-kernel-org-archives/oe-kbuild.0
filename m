Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFC7DDAB
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Nov 2024 00:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732752675; cv=none; b=J37UY2H4Sv27f1y655kLVDxeJQl8kKoYAVUBQUnxv4OiWO27WnliyXBpcSvDsqUyYSE7qap5jqzlMKFtWrOW5m0CWvfqk/y4mvWjrlt3C/ssmDdotmB+kFQMsTjkEtQllhbzNLEoFEIfUj5VbjhEVHTOHCwmXu7ctcTi4eqY3YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732752675; c=relaxed/simple;
	bh=WGadcEam9hk9JianpH7yGHiQzUU8KSJDfkK5F62W8h4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ENVo4QfF0TpJGVLo9CH3/EvN4+hy9iczHeTsqz7UFynAmaiowBcPZxbH4cREAvsonaHJKjLAT7oGCR1zOXsHhtTdT6IBtx8tVXWu1F4fDWCkKAVIOFSu40jMrpnOtspfyIpsDUGMpGeXdpyY3xtCml8D1KQtJQUIcir48ble9lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jTjm1XQh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jTjm1XQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732752673; x=1764288673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WGadcEam9hk9JianpH7yGHiQzUU8KSJDfkK5F62W8h4=;
  b=jTjm1XQhGulsZ+Cd0qjfmoHHsMY+8sq8edAqVPeHyRvV/jduluANHsJt
   uLx3wveuZAu0VEAWqQ+WUAiwR3DyTQ1fudmSdeVjDztDs9E9rc2Kug4fZ
   29G6fakUkYVPW9JAp6+MMh2llpvyaUj7tdEtNbgyn1nPPTdVjMY+aC/TD
   CJ9KZln1CVsw5hPbG7eYIyTeb9r7cLy6vbZ18Efhe4yPKDMdODsIPU/tO
   4/Ut4Dgp4JI8GAinQsYrnLDLeShFELpTtetI4GBP6P8Iph+zxbU8cVG80
   s/MZt8Gy0coq9itjjZiVklILP4KTDOtRaUpVAhXU3A5JUgTRP7bx4nK9L
   g==;
X-CSE-ConnectionGUID: LL+ZbeTAQQum3h+DaCTfCQ==
X-CSE-MsgGUID: ExX+RAjOTKumsdbkog5HEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32346666"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="32346666"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 16:11:12 -0800
X-CSE-ConnectionGUID: vI9BlrklTJSiGF3LeAAFuA==
X-CSE-MsgGUID: x6wSdUubQiGJdPlgkqML1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="92477500"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Nov 2024 16:11:11 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGS7g-0008T1-28;
	Thu, 28 Nov 2024 00:11:08 +0000
Date: Thu, 28 Nov 2024 08:10:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] ARM: dts: microchip: sama5d27_wlsom1_ek: Add
 no-1-8-v property to sdmmc0 node
Message-ID: <202411280720.nEtMmZ9J-lkp@intel.com>
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
In-Reply-To: <20241119160107.598411-3-cristian.birsan@microchip.com>
References: <20241119160107.598411-3-cristian.birsan@microchip.com>
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
patch link:    https://lore.kernel.org/r/20241119160107.598411-3-cristian.birsan%40microchip.com
patch subject: [PATCH 2/2] ARM: dts: microchip: sama5d27_wlsom1_ek: Add no-1-8-v property to sdmmc0 node
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-051-20241122 (https://download.01.org/0day-ci/archive/20241128/202411280720.nEtMmZ9J-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280720.nEtMmZ9J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411280720.nEtMmZ9J-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: ehci@500000: Unevaluated properties are not allowed ('clock-names', 'phy_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,sama5d3-ebi']
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: nand-controller: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: nand-controller: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,sama5d3-nand-controller']
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: sdio-host@a0000000: $nodename:0: 'sdio-host@a0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: sdio-host@a0000000: Unevaluated properties are not allowed ('bus-width', 'no-1-8-v' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: sdio-host@b0000000: $nodename:0: 'sdio-host@b0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: sdio-host@b0000000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-width', 'mmc-pwrseq', 'no-1-8-v', 'non-removable', 'wifi@0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: hlcdc@f0000000: 'hlcdc-display-controller', 'hlcdc-pwm' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/ramc@f000c000: failed to match any schema with compatible: ['atmel,sama5d3-ddramc']
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/dma-controller@f0010000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/dma-controller@f0004000: failed to match any schema with compatible: ['atmel,sama5d4-dma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
