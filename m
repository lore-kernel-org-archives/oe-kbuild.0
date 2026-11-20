Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182113;
	b=XZc6tPg+hxV/2A00pICvSMa6bnb/BGlEZKi43BO2Vwtr9V5Ftw7NBVgt1DMug+dHu8fR
	 3Z1L52P85zJ6winl2SsdenV5H4ZjA5346yUglcxUpkQ0kBSePQx232xN2fekcQp4U0NR2
	 wWKiuydQ8aO1rim5fUi26MFFCwduRp0MssAl+DAYVHfBjYCxa/uzQw4wKJ5xwMOcMGx5V
	 3tAsU3UiaFkczfM7q74U1HURtI+5UdpLw72pD/KU/6JBJrKWrRzp63pu2x0tLMiDl76aT
	 8HbwftnnL7JkG9LbXyNgBVZsm5+ok1xWwm+G7bAM5ZyDz0APgbzxNhiarYbR454mSkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182113;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6zrnceWu48lxXDQKNwXy5sGXpcDJd1ZvWMxARCnfupg=;
	b=oHy5sTpSAqfTVGPZtM22B8PUjczepZA3OK0ELhXeYZhUNmwOwedILjOuiZAtt8tsQo6x
	 k0OcZ/eFcnuw+RK4YxgufFtkbgW2EsdNGKoVCEKO69WR5RqweMVmX9TqrlKVAtMsfIoRc
	 Ba2I/LT7FiVCIyMciGqmqqXkfmcykjK82S8MhzBKRbMZzctF+PUAZG9zG/4D7yXCnCh60
	 B3ELR2X1FnjZAtfPkxdx3QH6+HtKMW2vhJh059+DSH2gPnhXtHK3pTcZzRNVbEPKN+0Dm
	 RWSS+m1oVW05UZ4d7TRBC0MsPyHeJMcjVF3qhplu71RDyxbpu944OLCNEu1EPAoHyIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bpWMsPI2;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D0B606A325
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Nov 2026 13:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45D0B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bpWMsPI2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795182112; x=1826718112;
  h=date:from:to:cc:subject:message-id;
  bh=70dui//SMCymiXbITsWrKadbtHt1AZDTnrHFr5swK6w=;
  b=bpWMsPI2N1VfOp8aBgy25U0NztrUHpSTt5NptRpQjnPFKUmERzzB8wx8
   hXZMQi6465Jgk/JkqPyKM+MOtwZBlSGihVnLmqnL8thqvSJkYhZuBER/f
   IF0JuyyQzhN3psEYUrDuj7lMsfstEEkGDVzFB4+03lSQM3ko2qIvnFaLg
   a7X0tFOw5+boTIHAMetcQQ+d12bHlXTPNiwjxuO+VtKFxKW6z9Mq3VaGf
   iAl+RcL6MBF8bgutCoNz9nIGDvCGq48yNXusmPNG4yosjVXGK1q4SMJYZ
   uQOQbV9JsWnXaESWjVKXLNQb6l+ZtERUgShdZBuiWk0qqCYmIosCTzgmn
   w==;
X-CSE-ConnectionGUID: w+20w7tyTNS6ucPQg++R9A==
X-CSE-MsgGUID: fE2ZeRzkRNaSHoM+23MNNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3954472"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3954472"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 05:41:52 -0800
X-CSE-ConnectionGUID: rdAb+cGkTdyw8UJZqHgpXA==
X-CSE-MsgGUID: rea3gfEwTJO+/XLL6Rqcng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10645523"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 20 Nov 2026 05:41:51 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUOs8-0000000042d-2fsm;
	Fri, 20 Nov 2026 13:41:48 +0000
Date: Fri, 20 Nov 2026 14:41:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-nomadik:b4/ux500-powerdomain-dts 30/30]
 arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: msp@80124000
 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
Message-ID: <20261120143954.9pql84Cs-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
TO: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-powerdomain-dts
head:   ed86af5d17be462bf2f1f95bb7c0c1009f4ed4aa
commit: ed86af5d17be462bf2f1f95bb7c0c1009f4ed4aa [30/30] ARM: dts: ux500: Remove DB8500 EPOD regulators
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261120/20261120143954.9pql84Cs-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120143954.9pql84Cs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261120143954.9pql84Cs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: proximity@44 (sharp,gp2ap002s00f): sharp,proximity-far-hysteresis: [0, 0, 0, 64] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: proximity@44 (sharp,gp2ap002s00f): sharp,proximity-far-hysteresis: size is 32, expected 8
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: msp@80124000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: msp@80124000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: msp@80125000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: msp@80125000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: panel@0 (samsung,s6e63m0): Unevaluated properties are not allowed ('interrupt-names', 'interrupt-parent', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/samsung,s6e63m0.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: dma-controller@801C0000 (stericsson,db8500-dma40): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/stericsson,dma40.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: proximity@44 (sharp,gp2ap002a00f): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: msp@80124000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: msp@80124000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: msp@80125000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: msp@80125000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: dma-controller@801C0000 (stericsson,db8500-dma40): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/stericsson,dma40.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc/i2c@80004000/proximity@39: failed to match any schema with compatible: ['sharp,gp2a030s00f']
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: msp@80124000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: msp@80124000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: msp@80125000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: msp@80125000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   	from schema $id: http://devicetree.org/schemas/dma/stericsson,dma40.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: proximity@39 (amstaos,tmd2672): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/light/tsl2772.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: /soc/i2c@80110000/isp@50: failed to match any schema with compatible: ['zinitix,bt404-isp']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: msp@80124000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: msp@80124000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: msp@80125000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: msp@80125000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   	from schema $id: http://devicetree.org/schemas/dma/stericsson,dma40.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: proximity@39 (amstaos,tmd2672): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/light/tsl2772.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: /soc/i2c@80110000/isp@50: failed to match any schema with compatible: ['zinitix,bt404-isp']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: msp@80124000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: msp@80124000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: msp@80125000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: msp@80125000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: proximity@44 (sharp,gp2ap002s00f): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: accel@18 (bosch,bma254): Unevaluated properties are not allowed ('clock-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/iio/accel/bosch,bma255.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: msp@80124000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: msp@80124000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: msp@80125000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: msp@80125000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: proximity@44 (sharp,gp2ap002s00f): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: accel@18 (bosch,bma254): Unevaluated properties are not allowed ('clock-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/iio/accel/bosch,bma255.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: msp@80124000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: msp@80124000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: msp@80125000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: msp@80125000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
