Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750774C85
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Jun 2025 13:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749906063; cv=none; b=cSvQEk4Ncg9Zq1wvFa4j9+Onq0of6ihWya8p0mDaZshnG7Wh+Ovi8FvJ63Veg+C9Q5jpy2Fbpajjx6872+DtlBXWMTw25dT+JechxZyAjxvIPqzqQlczQaDR/a/uUdRibVGOOsxSAdyVsYqC0CRc42qfclZIxoxUamLZihgyDss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749906063; c=relaxed/simple;
	bh=fj4Q2J/2zUifXCLU4iGnhv/Abpl75uHsN/ZHpl016po=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ht7IPq8kmcnzcS02MSwnXVU+S95/lkqFnNE3DX1fYaUaIL/Qg6FxP9fLFplvY7HYbKhda9j+9+KOJpHnW2ShQXyGZDItIaoaGE7nUmqUzodegfSRHfHJEddwVN+q7Xks/N99T8APaW5IQhZ712h/sqDx7xhtFsADjzrNP1OxqSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QfheI5TW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QfheI5TW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749906059; x=1781442059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fj4Q2J/2zUifXCLU4iGnhv/Abpl75uHsN/ZHpl016po=;
  b=QfheI5TWXMSurYNXBfGSZrebfdWFntMgmftYThzxoqqoX9FE05lj1S8A
   elvdj6++dnAcefqB/UcKGfUp8RAGfgXwW71Fed/uObi/0Od/4x4+c7go3
   G/9u781+vJ5drsuECtymKErpnLlYwAugltoyeDi9Td3S9yNeffjA99gnE
   XGFJyeDNk7Y3mNf2O54loVk7tbrXnbaPLKj31nftqfsTlvCM6hPxBkBJW
   yChwB14N+WG2GE4qXrnR5vqU88EfULLTH5nVe87muKQQQ0/tAsziVz7zr
   l7psr7W+qO7TvEaLHIkqMi8yCslSvkRmIHXn7QrxC11ZkXn/Jafeu92Xh
   A==;
X-CSE-ConnectionGUID: It2omShKQs+Sbd4F/9QNUQ==
X-CSE-MsgGUID: E554JdtKSwCKt/1fYcz+6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="52028209"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="52028209"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 06:00:58 -0700
X-CSE-ConnectionGUID: tRfXd98MSuG29ST/iWHxgA==
X-CSE-MsgGUID: bPQDd9EERSOlnasqIovY7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="153212449"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Jun 2025 06:00:48 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQQV3-000DWc-2p;
	Sat, 14 Jun 2025 13:00:45 +0000
Date: Sat, 14 Jun 2025 21:00:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] dt-bindings: crypto: Convert ti,omap2-aes to DT schema
Message-ID: <202506142044.2ORCIiOX-lkp@intel.com>
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
In-Reply-To: <20250611231047.1400566-1-robh@kernel.org>
References: <20250611231047.1400566-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: Herbert Xu <herbert@gondor.apana.org.au>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Aaro Koskinen <aaro.koskinen@iki.fi>
TO: Andreas Kemnade <andreas@kemnade.info>
TO: Kevin Hilman <khilman@baylibre.com>
TO: Roger Quadros <rogerq@kernel.org>
TO: Tony Lindgren <tony@atomide.com>
CC: linux-crypto@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master krzk-dt/for-next linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-crypto-Convert-ti-omap2-aes-to-DT-schema/20250612-071245
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20250611231047.1400566-1-robh%40kernel.org
patch subject: [PATCH v2] dt-bindings: crypto: Convert ti,omap2-aes to DT schema
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-054-20250612 (https://download.01.org/0day-ci/archive/20250614/202506142044.2ORCIiOX-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506142044.2ORCIiOX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506142044.2ORCIiOX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap24xx-clocks.dtsi:502.37-509.4: Warning (unique_unit_address_if_enabled): /ocp/l4@48000000/prcm@8000/clocks/usb_l4_div_ick@240: duplicate unit-address (also used in node /ocp/l4@48000000/prcm@8000/clocks/vlynq_mux_fck@240)
   arch/arm/boot/dts/ti/omap/omap24xx-clocks.dtsi:8.35-14.4: Warning (unique_unit_address_if_enabled): /ocp/l4@48000000/scm@0/scm_conf@270/clocks/mcbsp1_mux_fck@4: duplicate unit-address (also used in node /ocp/l4@48000000/scm@0/scm_conf@270/clocks/mcbsp2_mux_fck@4)
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: cpus: #address-cells: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: cpu (arm,arm1136jf-s): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap2-mpu']
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: ocp (simple-bus): $nodename:0: 'ocp' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: aes@480a6000 (ti,omap2-aes): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: /ocp/1w@480b2000: failed to match any schema with compatible: ['ti,omap2420-1w']
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: /ocp/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap2420-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: /ocp/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap2420-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: /ocp/dss@48050000: failed to match any schema with compatible: ['ti,omap2-dss']
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: /ocp/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap2-dispc']
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: /ocp/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap2-rfbi']
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: /ocp/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap2-venc']
--
   arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: cpus: #address-cells: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: cpu (arm,arm1136jf-s): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap2-mpu']
   arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: ocp (simple-bus): i2c0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: ocp (simple-bus): $nodename:0: 'ocp' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: aes@480a6000 (ti,omap2-aes): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: /ocp/1w@480b2000: failed to match any schema with compatible: ['ti,omap2420-1w']
   arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: /ocp/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap2420-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: /ocp/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap2420-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: /ocp/i2c@48070000/pmic@72: failed to match any schema with compatible: ['menelaus']
   arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: /ocp/dss@48050000: failed to match any schema with compatible: ['ti,omap2-dss']
   arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: /ocp/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap2-dispc']
   arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: /ocp/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap2-rfbi']
--
   arch/arm/boot/dts/ti/omap/omap2420-n810.dtb: cpus: #address-cells: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-n810.dtb: cpu (arm,arm1136jf-s): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-n810.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap2420-n810.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap2-mpu']
   arch/arm/boot/dts/ti/omap/omap2420-n810.dtb: ocp (simple-bus): i2c0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-n810.dtb: ocp (simple-bus): $nodename:0: 'ocp' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm/boot/dts/ti/omap/omap2420-n810.dtb: aes@480a6000 (ti,omap2-aes): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-n810.dtb: /ocp/1w@480b2000: failed to match any schema with compatible: ['ti,omap2420-1w']
   arch/arm/boot/dts/ti/omap/omap2420-n810.dtb: /ocp/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap2420-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap2420-n810.dtb: /ocp/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap2420-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap2420-n810.dtb: /ocp/i2c@48070000/pmic@72: failed to match any schema with compatible: ['menelaus']
   arch/arm/boot/dts/ti/omap/omap2420-n810.dtb: aic33@18 (ti,tlv320aic33): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
--
   arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: cpus: #address-cells: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: cpu (arm,arm1136jf-s): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap2-mpu']
   arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: ocp (simple-bus): i2c0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: ocp (simple-bus): $nodename:0: 'ocp' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: aes@480a6000 (ti,omap2-aes): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: /ocp/1w@480b2000: failed to match any schema with compatible: ['ti,omap2420-1w']
   arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: /ocp/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap2420-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: /ocp/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap2420-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: /ocp/i2c@48070000/pmic@72: failed to match any schema with compatible: ['menelaus']
   arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: /ocp/dss@48050000: failed to match any schema with compatible: ['ti,omap2-dss']
   arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: /ocp/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap2-dispc']
   arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: /ocp/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap2-rfbi']
--
   arch/arm/boot/dts/ti/omap/omap2430-clocks.dtsi:9.36-14.4: Warning (unique_unit_address_if_enabled): /ocp/l4_wkup@49000000/scm@2000/scm_conf@270/clocks/mcbsp3_mux_fck@78: duplicate unit-address (also used in node /ocp/l4_wkup@49000000/scm@2000/scm_conf@270/clocks/mcbsp5_mux_fck@78)
   arch/arm/boot/dts/ti/omap/omap2430-clocks.dtsi:22.36-28.4: Warning (unique_unit_address_if_enabled): /ocp/l4_wkup@49000000/scm@2000/scm_conf@270/clocks/mcbsp4_mux_fck@78: duplicate unit-address (also used in node /ocp/l4_wkup@49000000/scm@2000/scm_conf@270/clocks/mcbsp5_mux_fck@78)
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: cpus: #address-cells: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: cpu (arm,arm1136jf-s): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap2-mpu']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: ocp (simple-bus): $nodename:0: 'ocp' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: aes@480a6000 (ti,omap2-aes): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/1w@480b2000: failed to match any schema with compatible: ['ti,omap2420-1w']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap2430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap2430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/i2c@48072000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/i2c@48072000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
--
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/regulator-abb-mpu@4ae07ddc: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/regulator-abb-ivahd@4ae07e34: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/regulator-abb-dspeve@4ae07e30: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/regulator-abb-gpu@4ae07de4: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/crossbar@4a002a48: failed to match any schema with compatible: ['ti,irq-crossbar']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/am571x-idk.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
>> arch/arm/boot/dts/ti/omap/am571x-idk.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/regulator-abb-mpu@4ae07ddc: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/regulator-abb-ivahd@4ae07e34: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/regulator-abb-dspeve@4ae07e30: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/regulator-abb-gpu@4ae07de4: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/crossbar@4a002a48: failed to match any schema with compatible: ['ti,irq-crossbar']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/am572x-idk.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
>> arch/arm/boot/dts/ti/omap/am572x-idk.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/regulator-abb-mpu@4ae07ddc: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/regulator-abb-ivahd@4ae07e34: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/regulator-abb-dspeve@4ae07e30: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/regulator-abb-gpu@4ae07de4: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/crossbar@4a002a48: failed to match any schema with compatible: ['ti,irq-crossbar']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/regulator-abb-mpu@4ae07ddc: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/regulator-abb-ivahd@4ae07e34: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/regulator-abb-dspeve@4ae07e30: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/regulator-abb-gpu@4ae07de4: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/crossbar@4a002a48: failed to match any schema with compatible: ['ti,irq-crossbar']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/regulator-abb-mpu@4ae07ddc: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/regulator-abb-ivahd@4ae07e34: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/regulator-abb-dspeve@4ae07e30: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/regulator-abb-gpu@4ae07de4: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/crossbar@4a002a48: failed to match any schema with compatible: ['ti,irq-crossbar']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/regulator-abb-mpu@4ae07ddc: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/regulator-abb-ivahd@4ae07e34: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/regulator-abb-dspeve@4ae07e30: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/regulator-abb-gpu@4ae07de4: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/crossbar@4a002a48: failed to match any schema with compatible: ['ti,irq-crossbar']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
>> arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/regulator-abb-mpu@4ae07ddc: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/regulator-abb-ivahd@4ae07e34: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/regulator-abb-dspeve@4ae07e30: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/regulator-abb-gpu@4ae07de4: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/crossbar@4a002a48: failed to match any schema with compatible: ['ti,irq-crossbar']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
>> arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/regulator-abb-mpu@4ae07ddc: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/regulator-abb-ivahd@4ae07e34: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/regulator-abb-dspeve@4ae07e30: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/regulator-abb-gpu@4ae07de4: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/crossbar@4a002a48: failed to match any schema with compatible: ['ti,irq-crossbar']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
>> arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/regulator-abb-mpu@4ae07ddc: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/regulator-abb-ivahd@4ae07e34: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/regulator-abb-dspeve@4ae07e30: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/regulator-abb-gpu@4ae07de4: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/crossbar@4a002a48: failed to match any schema with compatible: ['ti,irq-crossbar']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/am574x-idk.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
>> arch/arm/boot/dts/ti/omap/am574x-idk.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/regulator-abb-mpu@4ae07ddc: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/regulator-abb-ivahd@4ae07e34: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/regulator-abb-dspeve@4ae07e30: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/regulator-abb-gpu@4ae07de4: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/crossbar@4a002a48: failed to match any schema with compatible: ['ti,irq-crossbar']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/dra7-evm.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
>> arch/arm/boot/dts/ti/omap/dra7-evm.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/regulator-abb-mpu@4ae07ddc: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/regulator-abb-ivahd@4ae07e34: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/regulator-abb-dspeve@4ae07e30: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/regulator-abb-gpu@4ae07de4: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/crossbar@4a002a48: failed to match any schema with compatible: ['ti,irq-crossbar']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/dra72-evm.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
>> arch/arm/boot/dts/ti/omap/dra72-evm.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/regulator-abb-mpu@4ae07ddc: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/regulator-abb-ivahd@4ae07e34: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/regulator-abb-dspeve@4ae07e30: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/regulator-abb-gpu@4ae07de4: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/crossbar@4a002a48: failed to match any schema with compatible: ['ti,irq-crossbar']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
>> arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/regulator-abb-mpu@4ae07ddc: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/regulator-abb-ivahd@4ae07e34: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/regulator-abb-dspeve@4ae07e30: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/regulator-abb-gpu@4ae07de4: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/crossbar@4a002a48: failed to match any schema with compatible: ['ti,irq-crossbar']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/dra71-evm.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
>> arch/arm/boot/dts/ti/omap/dra71-evm.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/regulator-abb-mpu@4ae07ddc: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/regulator-abb-ivahd@4ae07e34: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/regulator-abb-dspeve@4ae07e30: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/regulator-abb-gpu@4ae07de4: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/crossbar@4a002a48: failed to match any schema with compatible: ['ti,irq-crossbar']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/dra76-evm.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
>> arch/arm/boot/dts/ti/omap/dra76-evm.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/regulator-abb-mpu@4ae07ddc: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/regulator-abb-ivahd@4ae07e34: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/regulator-abb-dspeve@4ae07e30: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/regulator-abb-gpu@4ae07de4: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/crossbar@4a002a48: failed to match any schema with compatible: ['ti,irq-crossbar']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
>> arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/regulator-abb-mpu@4ae07ddc: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/regulator-abb-ivahd@4ae07e34: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/regulator-abb-dspeve@4ae07e30: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/regulator-abb-gpu@4ae07de4: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/crossbar@4a002a48: failed to match any schema with compatible: ['ti,irq-crossbar']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
>> arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/regulator-abb-mpu@4ae07ddc: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/regulator-abb-ivahd@4ae07e34: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/regulator-abb-dspeve@4ae07e30: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/regulator-abb-gpu@4ae07de4: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/crossbar@4a002a48: failed to match any schema with compatible: ['ti,irq-crossbar']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
>> arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/regulator-abb-mpu@4ae07ddc: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/regulator-abb-ivahd@4ae07e34: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/regulator-abb-dspeve@4ae07e30: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/regulator-abb-gpu@4ae07de4: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/crossbar@4a002a48: failed to match any schema with compatible: ['ti,irq-crossbar']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
>> arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
