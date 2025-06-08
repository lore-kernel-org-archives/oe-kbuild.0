Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C731624DD
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Jun 2025 23:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749424035; cv=none; b=FHxIkldVDo2yhozeWaEptAZZCe/WltF0s5Zn2D/oE3VYz6Bwz+Zh1dANMXbS5P2kQsmBLfhapJ7Zkk9dwzTtMfMJrjuFr+KCtdEuvAvH37bUeuySkv6eZrzrRT+Rh1dGt+F3HPgb2OYFYwZEsYenUlgujVMqrcvTGYGVU0sK2NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749424035; c=relaxed/simple;
	bh=dSZCxhbfhZuzMEwa0pOp0cpgthWJOx3bMaLqD58few4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jESKXVy8HNoNPRkLA/yO60o+tQjddcIQo7PlwiVpfGBrc7UTscik1F1CNQlQPRidRkM0CqrN0o497fEM2YYhUDbrv+3liXU+h5bSKY9jSkRXgrzeINs9AhnEJladEEodjcvNR2bcqj6SgzbfEsBjcB4CUKDmOghmoyE7PFTQkCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g85gHVeH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g85gHVeH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749424033; x=1780960033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dSZCxhbfhZuzMEwa0pOp0cpgthWJOx3bMaLqD58few4=;
  b=g85gHVeHPIP4mzL3pTt0XC/m1cv423sJ9i0d7R0lMZjQxBSIKIPrVG1S
   sJl2T2KFe8ba010RLSZsOyk+dd+NecpgxAVWfAmUwEKlpFgVDENenmX+D
   wZgVsinBPxw2+aj2XcgIXB53TSLUFb3nKeyJc8VUhrkTRF9qEOwSKtuvl
   9ZamnD2OaQSVk58i4WZvasP6jUII0fUl82F/cdeLde2SF1IoSixGl5oMQ
   558UX7Lz878iZz4VHJhJV1GBokXHqBU2BDaDfkUuDpDWaGEplxG3Sn9lD
   SqtTXq0BpyDDJexgJDBP0MPVv/oyHzEGFrQuRHjz6MLduemmRWb7LchvM
   A==;
X-CSE-ConnectionGUID: HrPn0fOzSG65/4E94GGHVQ==
X-CSE-MsgGUID: JNRAXyraSmeI6VQsbovJJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51493042"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="51493042"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 16:07:13 -0700
X-CSE-ConnectionGUID: X8mGIZEqSHqEPA/fAhCN2g==
X-CSE-MsgGUID: qFb6rjEGShOBL9GPmEb/Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="146345184"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Jun 2025 16:07:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOP6b-0006cN-1L;
	Sun, 08 Jun 2025 23:07:09 +0000
Date: Mon, 9 Jun 2025 07:06:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/1] dt-bindings: pinctrl: convert nxp,lpc1850-scu.txt
 to yaml format
Message-ID: <202506090655.Cwd7tl1K-lkp@intel.com>
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
In-Reply-To: <20250606160359.1356555-1-Frank.Li@nxp.com>
References: <20250606160359.1356555-1-Frank.Li@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>
TO: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
TO: open list <linux-kernel@vger.kernel.org>
CC: imx@lists.linux.dev

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next robh/for-next krzk-dt/for-next pinctrl-samsung/for-next linus/master v6.15 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-pinctrl-convert-nxp-lpc1850-scu-txt-to-yaml-format/20250607-000501
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20250606160359.1356555-1-Frank.Li%40nxp.com
patch subject: [PATCH v2 1/1] dt-bindings: pinctrl: convert nxp,lpc1850-scu.txt to yaml format
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20250607 (https://download.01.org/0day-ci/archive/20250609/202506090655.Cwd7tl1K-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506090655.Cwd7tl1K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506090655.Cwd7tl1K-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,lpc1788-rtc.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /soc/rtc@40046000: failed to match any schema with compatible: ['nxp,lpc1850-rtc', 'nxp,lpc1788-rtc']
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /soc/clock-controller@40050000: failed to match any schema with compatible: ['nxp,lpc1850-cgu']
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /soc/clock-controller@40051000: failed to match any schema with compatible: ['nxp,lpc1850-ccu']
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /soc/clock-controller@40052000: failed to match any schema with compatible: ['nxp,lpc1850-ccu']
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /soc/reset-controller@40053000: failed to match any schema with compatible: ['nxp,lpc1850-rgu']
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: serial@40081000 (nxp,lpc1850-uart): clocks: [[4, 1280], [2, 1288]] is too long
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: serial@40082000 (nxp,lpc1850-uart): clocks: [[4, 1024], [2, 1296]] is too long
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: pinctrl@40086000 (nxp,lpc1850-scu): ssp-pins: 'ssp1_cs', 'ssp1_miso_mosi', 'ssp1_sck' do not match any of the regexes: '^pinctrl-[0-9]+$', '_cfg$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/nxp,lpc1850-scu.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: serial@400c1000 (nxp,lpc1850-uart): clocks: [[4, 768], [2, 1544]] is too long
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: serial@400c1000 (nxp,lpc1850-uart): Unevaluated properties are not allowed ('clock-names', 'clocks', 'dma-names', 'dmas' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: serial@400c2000 (nxp,lpc1850-uart): clocks: [[4, 512], [2, 1552]] is too long
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: serial@400c2000 (nxp,lpc1850-uart): Unevaluated properties are not allowed ('clock-names', 'clocks', 'dma-names', 'dmas' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /soc/gpio@400f4000: failed to match any schema with compatible: ['nxp,lpc1850-gpio']
--
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: /soc/clock-controller@40050000: failed to match any schema with compatible: ['nxp,lpc1850-cgu']
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: /soc/clock-controller@40051000: failed to match any schema with compatible: ['nxp,lpc1850-ccu']
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: /soc/clock-controller@40052000: failed to match any schema with compatible: ['nxp,lpc1850-ccu']
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: /soc/reset-controller@40053000: failed to match any schema with compatible: ['nxp,lpc1850-rgu']
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: serial@40081000 (nxp,lpc1850-uart): clocks: [[5, 1280], [2, 1288]] is too long
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: serial@40081000 (nxp,lpc1850-uart): Unevaluated properties are not allowed ('clock-names', 'clocks', 'dma-names', 'dmas' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: serial@40082000 (nxp,lpc1850-uart): clocks: [[5, 1024], [2, 1296]] is too long
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: pinctrl@40086000 (nxp,lpc1850-scu): ssp0-pins: 'ssp0_sck_miso_mosi', 'ssp0_ssel' do not match any of the regexes: '^pinctrl-[0-9]+$', '_cfg$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/nxp,lpc1850-scu.yaml#
>> arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: pinctrl@40086000 (nxp,lpc1850-scu): usb0-pins: 'usb0_pwr_enable', 'usb0_pwr_fault' do not match any of the regexes: '^pinctrl-[0-9]+$', '_cfg$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/nxp,lpc1850-scu.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: serial@400c1000 (nxp,lpc1850-uart): clocks: [[5, 768], [2, 1544]] is too long
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: serial@400c2000 (nxp,lpc1850-uart): clocks: [[5, 512], [2, 1552]] is too long
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: serial@400c2000 (nxp,lpc1850-uart): Unevaluated properties are not allowed ('clock-names', 'clocks', 'dma-names', 'dmas' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: /soc/gpio@400f4000: failed to match any schema with compatible: ['nxp,lpc1850-gpio']
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: sram@10000000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
