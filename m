Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795129464;
	b=I1z7mrnUita5CrWF0pqTN1fhx/FxXlHx55GaIihmlzQS1ncJujvDMYoChOuyxBP8ouDx
	 /fpzL5RI8ut/bq5HCuAWLK4jkR5XQgYL82tDSC25wEY8/gEIh/VnorZFqjiz18f1y4/iU
	 2MlW25/fuQ2l+shOQD+asG6LNohhOvD16kY3Ukn+4Da0p/WctyvQCm6MF4eZ1Txb/LUDj
	 0wWFTmgNff3FxDP9DD83aigglVI+I8d28jDznXJzbaairMmv4tf+WiYQfpQkqhSYaCD3b
	 CiYfXHp09XU5t+ABQ3QPWjEdxt9xKMhJLtejASfTkRk/S2104eTGjExZJGWqxGDcJgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129464;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/B1Qx2h89RnXPyMDQEbpC7js3hS2aTLZrSsnqrdMq4k=;
	b=P7LVH5B8KIUEIZtw+CqSCRwTV7/x9xGiZMHOp7mmhL3Kj1efRNvoW7g2JZXIftQCH/KU
	 lsnYYRfP7htjJ3EAbQZF8eNPrlT+aXYAv2ERjKGjqllqf9I5CjYqqqOojqQ8jiEDZcRfZ
	 Vjggux+QY3tTfi+6bQTyIPZSB1BVmEXkF9bB+ACXbBLu4EqCakzxFsik2oRQP3poLKAEz
	 E1a+s333TIdXztqTvw1WsxBpRMczBBlnQtPxxFnBqqS1pcyR3Jn+2FplDs0ktDW6S6ogK
	 r7i5Ozlib+jJbxTihhyv+Osupu8CRGuhxcW5pYvCD3vGimEDCMBzsSEywFX6sIe9FCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SIDdpeXn;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A521606A320
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 23:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A521606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SIDdpeXn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795129462; x=1826665462;
  h=date:from:to:cc:subject:message-id;
  bh=PyVFMEX263x25HN27mDgNtZn0WuvY6V+95Sv+t9wefk=;
  b=SIDdpeXn4p5OmrZPLXAlUZo9uUbvga0IPV9vSRD78rAOtr3yt3X/CTxT
   i8zg5hpTXmOWjeX9F1EHzbzc81Wf50qMfRzxERFhZr3demzt8/DTR3VBE
   7geTwxpahsGBZZe4vKhFn0RTCtmbcY7aKVadpsBI19DVCL1lrS754p9kv
   9XyKC0Qp7+kxb+9fXAA08qnFsgV3UzgAdXug6vn19H7WlFLA9b0Q5qaiJ
   rrTtz6m6dNGAcFyc1C10WbCkNI4Xl/hbDbbLitNDtKJ5/qv4Fkxzl9F4L
   w20eBjS2ceONCM6xuR/pS5ELBM4Ys0By7gvD5J05biYe615WDzwFuRqmC
   w==;
X-CSE-ConnectionGUID: IgAtqv/qTmeIFQsAiao3BA==
X-CSE-MsgGUID: 3bI5aHl3RviehxeOTrSQdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3915955"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3915955"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 15:04:22 -0800
X-CSE-ConnectionGUID: KcrVra/jSS68cZfeXR7A9g==
X-CSE-MsgGUID: RaHSgNwrR5yuUEwZI2V/Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10436412"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 19 Nov 2026 15:04:21 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUBAw-000000003rb-33Aa;
	Thu, 19 Nov 2026 23:04:18 +0000
Date: Fri, 20 Nov 2026 00:04:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-nomadik:b4/ux500-powerdomain-dts 30/30]
 arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: msp@80124000
 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
Message-ID: <20261120000224.EkQsARvu-lkp@intel.com>
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
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261120/20261120000224.EkQsARvu-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120000224.EkQsARvu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261120000224.EkQsARvu-lkp@intel.com/

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
