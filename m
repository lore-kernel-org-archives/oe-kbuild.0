Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7AE37CD52
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jun 2026 09:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379462; cv=none; b=ONxGwfa6im4jeyQF+JhsBpuSjGDwcD8ONv7XvszP8Xnd+XiK0GuMLcfK4PRoG4+DHEOmF46gFrsluLB/+0G0NeSX/NLdGxCwGHV9c1JcTq+WwGX/wrQ1ZSsQXIMNpwPrU3DKPzap0jGnsr/Or2p+zAmpu92b/Q5Yfy3HZRsA82o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379462; c=relaxed/simple;
	bh=fvw32XRiZPmGVz4NZ3MjjPlQrWw6LRLlWyIhnx9b9nM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dC5/tWZp1GaHMxV5N6Ae2baa+SYJUfftx3qeW3WkhokgwuBzkJVu8y9+f5G/++K3FE8vWOW8oRqosAVEqxvM/JoWffx1lTZ7qKXNC7aF8cS94LOX+Nt7ihrEqghbOaKHsGldt+skrhdebMlOcZBF4W/n4oJHQ3jXtUbjraxO788=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bhygNNYw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bhygNNYw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782379460; x=1813915460;
  h=date:from:to:cc:subject:message-id;
  bh=fvw32XRiZPmGVz4NZ3MjjPlQrWw6LRLlWyIhnx9b9nM=;
  b=bhygNNYwPVqoVqwQWGCXRIoCdGRY3bWE2gdwJhXK3RuNaxDsnBJoIiJi
   6yvoE60wesujvptcYo8ZH0rCEHxdWowdCS6bDk+K6DZiguDmFZA+3qdoS
   79JYgaRDQo27zRCw+M+HIdG6pIRox00Gd8Ybr7TKOxJTxuOfliZLMO/5l
   uKSAlfFmrrvTiFZzHGA/rRIXL3g8Vj2y7hmblWR5JaoRg6G7g+MzFx9g3
   rEs3e/JIz8YfrAarjq6qtz99CFtlJyfarpaqzqg3DLl6d4aLhq4uHwxbK
   A1AU6AeBfi00l+QMQJpyE7XohLD0tAngvb6MQxsE4HAfGnG2qRS3KJtkS
   w==;
X-CSE-ConnectionGUID: /A0jO35uQWCbS784FG4cjg==
X-CSE-MsgGUID: WIDYjW7/SxyRVKknxXB7dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="82136383"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="82136383"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 02:24:19 -0700
X-CSE-ConnectionGUID: DSPWkE2lTJKbx9cmYKax2g==
X-CSE-MsgGUID: aAU0DKYNQtGlXRzo6hgVmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="246136832"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 25 Jun 2026 02:24:18 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcgJk-000000006TZ-0jud;
	Thu, 25 Jun 2026 09:24:16 +0000
Date: Thu, 25 Jun 2026 11:23:47 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb:
 regulator (motorola,mapphone-cpcap-regulator): regulators:SW5:
 'regulator-name' is a required property
Message-ID: <202606251141.UqcxUDCu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Svyatoslav Ryhel <clamor95@gmail.com>
CC: Mark Brown <broonie@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0839c8963b7b28d25350bd5ea69bacde794124ab
commit: 5a8ffc5dca9c096fe9c8879fa3a2faff723fbb8a regulator: dt-bindings: cpcap-regulator: convert to DT schema
date:   4 months ago
:::::: branch date: 8 days ago
:::::: commit date: 4 months ago
config: arm-randconfig-2051-20260616 (https://download.01.org/0day-ci/archive/20260625/202606251141.UqcxUDCu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606251141.UqcxUDCu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5a8ffc5dca9c ("regulator: dt-bindings: cpcap-regulator: convert to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606251141.UqcxUDCu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: tmp105@48 (ti,tmp105): Unevaluated properties are not allowed ('interrupt-names', 'wakeup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/led-controller@38: failed to match any schema with compatible: ['ti,lm3532']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: touchscreen@4a (atmel,maxtouch): interrupts-extended: [[114, 23, 8], [111, 352]] is too long
   	from schema $id: http://devicetree.org/schemas/input/atmel,maxtouch.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: touchscreen@4a (atmel,maxtouch): Unevaluated properties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/atmel,maxtouch.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0: failed to match any schema with compatible: ['motorola,cpcap', 'st,6556002']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0: failed to match any schema with compatible: ['motorola,cpcap', 'st,6556002']
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:SW5: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VCAM: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VCSI: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VDAC: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VDIG: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VFUSE: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VHVIO: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VSDIO: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VPLL: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VRF1: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VRF2: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VRFREF: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VWLAN1: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VWLAN2: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VSIM: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VSIMCARD: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VVIB: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VUSB: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VAUDIO: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/button: failed to match any schema with compatible: ['motorola,cpcap-pwrbutton']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-red: failed to match any schema with compatible: ['motorola,cpcap-led-red']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-green: failed to match any schema with compatible: ['motorola,cpcap-led-green']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-blue: failed to match any schema with compatible: ['motorola,cpcap-led-blue']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-adl: failed to match any schema with compatible: ['motorola,cpcap-led-adl']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-cp: failed to match any schema with compatible: ['motorola,cpcap-led-cp']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
--
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: tmp105@48 (ti,tmp105): Unevaluated properties are not allowed ('interrupt-names', 'wakeup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/led-controller@38: failed to match any schema with compatible: ['ti,lm3532']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: touchscreen@4a (atmel,maxtouch): interrupts-extended: [[114, 23, 8], [111, 352]] is too long
   	from schema $id: http://devicetree.org/schemas/input/atmel,maxtouch.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: touchscreen@4a (atmel,maxtouch): Unevaluated properties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/atmel,maxtouch.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0: failed to match any schema with compatible: ['motorola,cpcap', 'st,6556002']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0: failed to match any schema with compatible: ['motorola,cpcap', 'st,6556002']
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:SW5: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VCAM: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VCSI: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VDAC: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VDIG: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VFUSE: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VHVIO: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VSDIO: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VPLL: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VRF1: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VRF2: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VRFREF: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VWLAN1: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VWLAN2: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VSIM: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VSIMCARD: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VVIB: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VUSB: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VAUDIO: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/button: failed to match any schema with compatible: ['motorola,cpcap-pwrbutton']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-red: failed to match any schema with compatible: ['motorola,cpcap-led-red']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-green: failed to match any schema with compatible: ['motorola,cpcap-led-green']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-blue: failed to match any schema with compatible: ['motorola,cpcap-led-blue']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-adl: failed to match any schema with compatible: ['motorola,cpcap-led-adl']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-cp: failed to match any schema with compatible: ['motorola,cpcap-led-cp']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
--
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: tmp105@48 (ti,tmp105): False schema does not allow [[112, 18, 2], [109, 334]]
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: tmp105@48 (ti,tmp105): interrupts-extended: [[112, 18, 2], [109, 334]] is too long
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: tmp105@48 (ti,tmp105): Unevaluated properties are not allowed ('interrupt-names', 'wakeup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/led-controller@38: failed to match any schema with compatible: ['ti,lm3532']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0: failed to match any schema with compatible: ['motorola,cpcap', 'st,6556002']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0: failed to match any schema with compatible: ['motorola,cpcap', 'st,6556002']
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:SW5: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VCAM: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VCSI: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VDAC: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VDIG: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VFUSE: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VHVIO: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VSDIO: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VPLL: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VRF1: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VRF2: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VRFREF: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VWLAN1: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VWLAN2: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VSIM: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VSIMCARD: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VVIB: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VUSB: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VAUDIO: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/button: failed to match any schema with compatible: ['motorola,cpcap-pwrbutton']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-red: failed to match any schema with compatible: ['motorola,cpcap-led-red']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-green: failed to match any schema with compatible: ['motorola,cpcap-led-green']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-blue: failed to match any schema with compatible: ['motorola,cpcap-led-blue']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-adl: failed to match any schema with compatible: ['motorola,cpcap-led-adl']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-cp: failed to match any schema with compatible: ['motorola,cpcap-led-cp']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
--
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: tmp105@48 (ti,tmp105): False schema does not allow [[112, 18, 2], [109, 334]]
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: tmp105@48 (ti,tmp105): interrupts-extended: [[112, 18, 2], [109, 334]] is too long
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: tmp105@48 (ti,tmp105): Unevaluated properties are not allowed ('interrupt-names', 'wakeup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0: failed to match any schema with compatible: ['motorola,cpcap', 'st,6556002']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0: failed to match any schema with compatible: ['motorola,cpcap', 'st,6556002']
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:SW5: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VCAM: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VCSI: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VDAC: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VDIG: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VFUSE: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VHVIO: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VSDIO: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VPLL: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VRF1: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VRF2: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VRFREF: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VWLAN1: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VWLAN2: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VSIM: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VSIMCARD: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VVIB: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VUSB: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: regulator (motorola,mapphone-cpcap-regulator): regulators:VAUDIO: 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/button: failed to match any schema with compatible: ['motorola,cpcap-pwrbutton']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-red: failed to match any schema with compatible: ['motorola,cpcap-led-red']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-green: failed to match any schema with compatible: ['motorola,cpcap-led-green']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-blue: failed to match any schema with compatible: ['motorola,cpcap-led-blue']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-adl: failed to match any schema with compatible: ['motorola,cpcap-led-adl']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-cp: failed to match any schema with compatible: ['motorola,cpcap-led-cp']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
