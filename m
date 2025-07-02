Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F17B2877FD
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Jul 2025 13:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462840; cv=none; b=ZVKNtwrVotpCyoCYazrKjUBHVp5duRzgdFWUMC7K5dsX3/o9tRgrTAJVlK3xHhsxl1Gap12h7TxIa7Xml3gJ9twB9lthSZCFxaTpO6pSGuDsqrGLlmADNZaK4Cxj2r5x593g1pJMgcYcdqwbRDtyu81kaFS3eJuuLQNxRdDbDMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462840; c=relaxed/simple;
	bh=x5prCr+nnVfoseRjp2DIWob4Y9fiuHgq2dr1TtrF7dY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A3Y383A87557EKM42InTGW5gEAx/lOvBfuEZW0jtNTe12WHEcc+vom5Q5LRsOYfVmO656fIU6Z3uiqZiKWvUwfJYSHAmarYE8UUVO3wNCqdRmDR02yqQbH2Vfo9eG5kgYSF81+aCJLM/dnXgf6FV+ohCcDLtG/LMqHebyah2S4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/m3qiI9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/m3qiI9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751462838; x=1782998838;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=x5prCr+nnVfoseRjp2DIWob4Y9fiuHgq2dr1TtrF7dY=;
  b=c/m3qiI9+444mjP+h0Hf8bht5c80rhxGkz5+ykWUPfojftaMcbnzeN6M
   l1kE2lCCtAwCuxYbO8f5NKsdjtslLyGciKQdIBRMbUvQvaLP2JSgQqbWA
   I60jUql0eN3hgJwF7imZKwIYFUMmf2/q0xVM4ZelHQ/GgD38qsqTucPTf
   pls7utNJ0/gn6PSCWa16Dg4XBUHc5GGDvFSf423zQzPbmjo+uIDw+3s6D
   FNJ3TTbIK54GVaaJ6G4VewS44GXAF2Fhvjrx/W5PXlAnBRbuJO17vMkVi
   uk5MDtIK6lcRX/kASrqB/zWKHD3/uBfCRifESum3vf0VDpK0YEubzwohW
   A==;
X-CSE-ConnectionGUID: SW//ZTk0StaQaYe2c4QsQQ==
X-CSE-MsgGUID: CRhFerNrTq+3D4csqRKlsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71183810"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="71183810"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 06:27:17 -0700
X-CSE-ConnectionGUID: xBEaRxwKQJKaSRvYjZ4h7g==
X-CSE-MsgGUID: 7dHzgpMHSIeyjuqxI9qq/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154818450"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Jul 2025 06:27:15 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWxUX-0000fL-2Z;
	Wed, 02 Jul 2025 13:27:13 +0000
Date: Wed, 2 Jul 2025 21:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: gpio: Create a trivial GPIO schema
Message-ID: <202507022120.RTQoBE2T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250701225355.2977294-1-robh@kernel.org>
References: <20250701225355.2977294-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Marek Behún" <kabel@kernel.org>
TO: Keguang Zhang <keguang.zhang@gmail.com>
TO: Heiko Stuebner <heiko@sntech.de>
TO: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-mips@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.16-rc4 next-20250702]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-gpio-Create-a-trivial-GPIO-schema/20250702-065536
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20250701225355.2977294-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: gpio: Create a trivial GPIO schema
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: powerpc-randconfig-051-20250702 (https://download.01.org/0day-ci/archive/20250702/202507022120.RTQoBE2T-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507022120.RTQoBE2T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507022120.RTQoBE2T-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/ebc/ndfc@3,0: failed to match any schema with compatible: ['ibm,ndfc']
   arch/powerpc/boot/dts/canyonlands.dtb: serial@ef600300 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: serial@ef600400 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/i2c@ef600700: failed to match any schema with compatible: ['ibm,iic-460ex', 'ibm,iic']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/i2c@ef600700: failed to match any schema with compatible: ['ibm,iic-460ex', 'ibm,iic']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/i2c@ef600800: failed to match any schema with compatible: ['ibm,iic-460ex', 'ibm,iic']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/i2c@ef600800: failed to match any schema with compatible: ['ibm,iic-460ex', 'ibm,iic']
>> arch/powerpc/boot/dts/canyonlands.dtb: gpio@ef600b00 (ibm,ppc4xx-gpio): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: gpio@ef600b00 (ibm,ppc4xx-gpio): '#gpio-cells' is a dependency of 'gpio-controller'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml#
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
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/wii.dtb: pic1@d800030 (nintendo,hollywood-pic): 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/wii.dtb: /hollywood/srnprot@d800060: failed to match any schema with compatible: ['nintendo,hollywood-srnprot']
>> arch/powerpc/boot/dts/wii.dtb: gpio@d8000c0 (nintendo,hollywood-gpio): '#interrupt-cells', 'interrupt-controller', 'interrupt-parent', 'interrupts' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/powerpc/boot/dts/wii.dtb: /hollywood/control@d800100: failed to match any schema with compatible: ['nintendo,hollywood-control']
   arch/powerpc/boot/dts/wii.dtb: /hollywood/disk@d806000: failed to match any schema with compatible: ['nintendo,hollywood-di']
   arch/powerpc/boot/dts/wii.dtb: gpio-leds (gpio-leds): 'drive-slot' does not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/powerpc/boot/dts/wii.dtb: gpio-keys (gpio-keys): 'eject', 'power' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
