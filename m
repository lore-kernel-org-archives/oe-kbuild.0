Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997597;
	b=q5fbrkf0SalqVaCyjumiDJg6AQjoNiw+KBrJ7A46Heg4UqBiX8tdO3kojSjdirtJV2E+
	 Z1meH0GW8Y0HLu1YJvcdf4e05GuvpM3vDy56+JlFi2sWcIqJMRqRtmWKiUYukUfY3cLP4
	 vSBbG7eI1+3RVrr65ZT0leQruOiBRyo9A3vC9IcgJx7B3mfnxMX8ufjVYMAAE5PFKlPnv
	 etqnH9v8GedalZdwc3MWy1s44ynczhd6MUdyYbvnNX/iiqtTsgLx5IGZyq73+Qe8ZfnK4
	 WphDAqRHfAra+BTaUA6+VJKis3orUBSvJB05ZOmbkg8qDI9ANlEQgQtOm8MA0L3wz1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997597;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=NEdJ9bICLw6X4WO/GzPzdkWBShriOIYevWzimPgrK7c=;
	b=RWcS31ztfaoNQ3z6l6UpjBqZsX+lBMnLo3p5mijtDQZEucUs3jj2rHGjfBq7rHyH/NDE
	 kswpNtCt7QUPMj1rpwhYns6f+Myy8hY4fQFTMHOS67ylwFsTmOVJR5XRVpX8+ymIyxWaw
	 +VK2eFzZ8zHrdZAZUSgwvLWUQp86LA25EdqGdW4RammGda+m2ngaWWOH0h6gkAUG0impM
	 yPUSaUoYPCzKjbRSGC/HbsNJrs5OO5ad8rnh1w2AQto7qLUMUlxi2AHEyVvk8gRoxbDGl
	 2O2owDH2lEK806kFOoYKV9JMzkwuj11S9AuebaG2QZxID+iMAFY3yONZv3tqcaJhwEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dPMQ88ph;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBA8606A335
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 10:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CBA8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dPMQ88ph
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794997596; x=1826533596;
  h=date:from:to:cc:subject:message-id;
  bh=JU13s9nxH4xMdqIIis0iRE7h7zQlszuTT3TbAaXu3Sc=;
  b=dPMQ88phJucjxtGRjJNyXWhpxLZCdl15ESUQcVd8PSyW+ZONCg9/flSr
   623pbqAYqR+UEhLwlvYF5NW2wH70tpnWNgXvrppx/T7+1ZtnXy0eqH4uc
   OGc0AADpw8MiC51QQbjP4eSTvbDR+ZOS/7ZiQ/kan0xwxeXmkZa9h7PFV
   7AM9j274l4vHZf4seqCWJUZv1utj4kOeHwXAZrJ4sRbm256b23kIfHhJ2
   0VbrowUSSg7tztmLBa+R0+z0g877rq57Qx1a1/Dc6zL4FQYxcEZBpl2Cd
   mqI/WKSCjvuhtLAE38a5JqcC03FguNvtHntCun1K07S7dHexxBaZ9OflH
   Q==;
X-CSE-ConnectionGUID: DGvLENJvTuOzbPf4H4yyyg==
X-CSE-MsgGUID: zJa+CYgnTZqBK8oeMCiXpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3701196"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3701196"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 02:26:36 -0800
X-CSE-ConnectionGUID: Bi5avmk8QEi+p5r26DLXmw==
X-CSE-MsgGUID: knRluQvxTd6Hp5G6Kx8saA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10351140"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 18 Nov 2026 02:26:35 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTcs4-000000003Ne-3obK;
	Wed, 18 Nov 2026 10:26:32 +0000
Date: Wed, 18 Nov 2026 11:26:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-nomadik:b4/ux500-powerdomain-dts 30/30]
 arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: msp@80124000
 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
Message-ID: <20261118112233.oAYP1NkI-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261118/20261118112233.oAYP1NkI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118112233.oAYP1NkI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261118112233.oAYP1NkI-lkp@intel.com/

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
