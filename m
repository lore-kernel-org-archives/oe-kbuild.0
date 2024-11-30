Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6CC158D92
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 23:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733009788; cv=none; b=M3x2aSlAXGSrg69M8BGoMOz73VIiEidp7a/9UkJhKIFpKUvpIr7HIAzfv4CwDAHUs/5JD6RrZSxdMdg69yeBruUcQThHuZouQwAaI8s/xAIdrQgTHazvMEPxuFW8IaJJ7kcA6afmS2UPBWcfISy1CbKuevc7U0QKOG2AUX8trbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733009788; c=relaxed/simple;
	bh=m4k044LWBjDdpCqV8wtwcbzX5tsIHKBOZtmo4H2t6V0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HaiCN1AZaKOqsLPiVlRTy8/HNyT1S9+Z+yFaCu18r6+l8eDwmVtmeJcn9wVRB5kTiDJ3RkGemCm4zUnq7JMGZVgiqwESpoHF6Fh/gr+kOhdfejW4n748wK/KkOzVqjGGr88oe/8gPTP0IRgub+SUKK/nj+eb9QRxJ79csPNcKVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LM1DLdrT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LM1DLdrT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733009786; x=1764545786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m4k044LWBjDdpCqV8wtwcbzX5tsIHKBOZtmo4H2t6V0=;
  b=LM1DLdrTeSHx+zlvq5OifejUh5lzxOL0RYAXwEPSMj5bAurgiXJu3rDj
   2aBJ73JSGGXdSaIyhl4yOEfTx3D6p3llZWwxqJ9pCl2/f4bsRfxZrzrIY
   Vm+BhoFGD+dr5Z/s9KmMc5t1w6I7hZr+31wDY2TDyk3NN+xeFehmnFaBa
   nCzUSrTqolImddcISftcmAzmMb/nlNLqSApSusJBWkO7zfac/sFTHx0p3
   7uoKnOFHIOCeTWwG3QeT8zUvFoeRWlrkSODBHrc6ZKDX/2Z75B90lChUv
   EPPdZIObDWPXdOx/wwex+Bu5nJdwAbzuaETNlMT7Qy5ARnL+yQ4DjD8g3
   Q==;
X-CSE-ConnectionGUID: v7gdG9sOQQed4jcTrn/6XA==
X-CSE-MsgGUID: qmqfEr1HT+q9Wp4NbzixSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="44576230"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="44576230"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 15:36:25 -0800
X-CSE-ConnectionGUID: lNStWmG+TYeJZsOsUcDFGQ==
X-CSE-MsgGUID: MwxU9w74SE2KkTWumWX9lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="97527543"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 30 Nov 2024 15:36:25 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHX0f-00013N-2z;
	Sat, 30 Nov 2024 23:36:21 +0000
Date: Sun, 1 Dec 2024 07:35:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] ARM: dts: microchip: sama5d27_wlsom1_ek: Add
 no-1-8-v property to sdmmc0 node
Message-ID: <202412010651.lZkVA6i8-lkp@intel.com>
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
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm-randconfig-051-20241122 (https://download.01.org/0day-ci/archive/20241201/202412010651.lZkVA6i8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412010651.lZkVA6i8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412010651.lZkVA6i8-lkp@intel.com/

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
