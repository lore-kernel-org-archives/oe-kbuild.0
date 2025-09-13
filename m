Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E1F2F068F
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Sep 2025 14:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757774128; cv=none; b=kQlnaPOMnSW7i6gQp7l14z4mERtwR+hmfkl0S9Y4C6nrBeUWXW2Mq0jmpvG9ANhzUQ4e19E2bIncf/u/yiAno8c2SpiRk+pCHkt2u4MxvA1+fYSP6MAKLsqPdwnRDYEqHvC/cqoIVIInMjErCteU0hXJcJxfk1193vSxpL0jxMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757774128; c=relaxed/simple;
	bh=5Qc4KycPz48WRBFKVBBtnXxqM6ZCRh95758fgO63WWE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dLdRPWI+HtWxNfvuQ6RdSWjUHxPzk7+i06NWhYYMAeFIdxKP2fJi/ATx9+Z14odpmUHYjXVGdXrcEaUmU4SlNUGp/1mQCqrYNqhVCfwZEhlF5UXlOaSZVz2xb1vnJtUU1VaI3qdExMlzvIZGx+trctzj6VjZ7ZvBfErKuu68Dn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HoMnpM9q; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoMnpM9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757774127; x=1789310127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Qc4KycPz48WRBFKVBBtnXxqM6ZCRh95758fgO63WWE=;
  b=HoMnpM9qVFhRZWHdMwa/BQz8zHTI6Isye74qe/YJvFVh8CYvqgSimGqx
   zGsQ3wio8bzmn9xA4jJELojKPKmfIruLWMeuGc3GYqgktEtb6pJRZbt7Z
   Les8W7wWleadVd9Qw5ujKaLpbbReYSAvGv/QsWBFZjuc2mW9ixzzt0D5C
   MsrPvdhkN/3rcT9QdcNWOi/CGWCBQPsLrVDqu05L9pSCXgHCKH4cSjaJQ
   0CTv/qutAMO4Pvqfvh0rcsNZ5di3TPRTO/FHsv1snw1lE3HIs6EyKWk0y
   bePmavsLBeogUaiioMCZTqiyvXWp+vAtuQP9aoLfJ0ZKK6LpCL5CoVG0w
   g==;
X-CSE-ConnectionGUID: qWXuFSS8QMekPxgCuuJy/Q==
X-CSE-MsgGUID: /cLIczEeSW67qqq6hGSCmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60039410"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60039410"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 07:35:26 -0700
X-CSE-ConnectionGUID: S2NSCmVAQJ2x7f1wsRkk9w==
X-CSE-MsgGUID: gR/mRBBPSBy8EYseTa26Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="178587856"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 13 Sep 2025 07:35:24 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxRLW-0001aW-10;
	Sat, 13 Sep 2025 14:35:22 +0000
Date: Sat, 13 Sep 2025 22:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tty:tty-testing 41/42]
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: serial@0
 (ti,am3352-uart): pinctrl-names:1: 'wakeup' was expected
Message-ID: <202509132206.Kxk7Pfcw-lkp@intel.com>
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
CC: linux-serial@vger.kernel.org
TO: "Markus Schneider-Pargmann" <msp@baylibre.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Kendall Willis <k-willis@ti.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
head:   ed68411e879e9bd512e266d3c46d4b35c5f5fbbc
commit: 49fce0730fd3c028982574c85eb2eb824d6e63f7 [41/42] dt-bindings: serial: 8250_omap: Add wakeup pinctrl state
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm-randconfig-051-20250913 (https://download.01.org/0day-ci/archive/20250913/202509132206.Kxk7Pfcw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509132206.Kxk7Pfcw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509132206.Kxk7Pfcw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am3352-uart', 'ti,omap3-uart'] is too long
   	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
   	'ti,am654-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>> arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: serial@0 (ti,am3352-uart): pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>> arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: serial@0 (ti,am3352-uart): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am3352-uart', 'ti,omap3-uart'] is too long
   	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
   	'ti,am654-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>> arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: serial@0 (ti,am3352-uart): pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>> arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: serial@0 (ti,am3352-uart): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/mmc@0: failed to match any schema with compatible: ['ti,am335-sdhci']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am3352-uart', 'ti,omap3-uart'] is too long
--
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@100000/target-module@f0000/prcm@0/prm@2000: failed to match any schema with compatible: ['ti,am4-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@100000/target-module@f0000/prcm@0/prm@2000: failed to match any schema with compatible: ['ti,am4-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@100000/target-module@f0000/prcm@0/prm@4000: failed to match any schema with compatible: ['ti,am4-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@100000/target-module@f0000/prcm@0/prm@4000: failed to match any schema with compatible: ['ti,am4-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: segment@200000 (simple-pm-bus): $nodename:0: 'segment@200000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
>> arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: serial@0 (ti,am4372-uart): pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>> arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: serial@0 (ti,am4372-uart): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/tps65218@24: failed to match any schema with compatible: ['ti,tps65218']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/ov2659@30: failed to match any schema with compatible: ['ovti,ov2659']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: tsc (ti,am3359-tsc): 'ti,wires' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml#
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: tsc (ti,am3359-tsc): 'ti,x-plate-resistance' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml#
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: tsc (ti,am3359-tsc): 'ti,coordinate-readouts' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml#
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: tsc (ti,am3359-tsc): 'ti,wire-config' is a required property
--
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@100000/target-module@f0000/prcm@0/prm@2000: failed to match any schema with compatible: ['ti,am4-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@100000/target-module@f0000/prcm@0/prm@2000: failed to match any schema with compatible: ['ti,am4-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@100000/target-module@f0000/prcm@0/prm@4000: failed to match any schema with compatible: ['ti,am4-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@100000/target-module@f0000/prcm@0/prm@4000: failed to match any schema with compatible: ['ti,am4-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: segment@200000 (simple-pm-bus): $nodename:0: 'segment@200000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
>> arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: serial@0 (ti,am4372-uart): pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>> arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: serial@0 (ti,am4372-uart): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/tps65218@24: failed to match any schema with compatible: ['ti,tps65218']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/ov2659@30: failed to match any schema with compatible: ['ovti,ov2659']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: tsc (ti,am3359-tsc): 'ti,wires' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml#
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: tsc (ti,am3359-tsc): 'ti,x-plate-resistance' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml#
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: tsc (ti,am3359-tsc): 'ti,coordinate-readouts' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml#
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: tsc (ti,am3359-tsc): 'ti,wire-config' is a required property
--
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@86000/counter@0: failed to match any schema with compatible: ['ti,am4372-counter32k', 'ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: interconnect@48000000 (ti,am4-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000: failed to match any schema with compatible: ['ti,am4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
>> arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: serial@0 (ti,am4372-uart): pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>> arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: serial@0 (ti,am4372-uart): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000/segment@0/target-module@2a000/i2c@0/ov2659@30: failed to match any schema with compatible: ['ovti,ov2659']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: edt-ft5306@38 (edt,edt-ft5306): compatible: ['edt,edt-ft5306', 'edt,edt-ft5x06'] is too long
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: edt-ft5306@38 (edt,edt-ft5306): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000/segment@0/target-module@2a000/i2c@0/edt-ft5306@38: failed to match any schema with compatible: ['edt,edt-ft5306', 'edt,edt-ft5x06']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000/segment@0/target-module@2a000/i2c@0/lis331dlh@18: failed to match any schema with compatible: ['st,lis331dlh']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000/segment@0/target-module@60000/mmc@0: failed to match any schema with compatible: ['ti,am437-sdhci']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
