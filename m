Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D153CEB9A
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 14:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775830034; cv=none; b=SJWOHqV3/bpIVD3yPt5VsqjIa7dEKeI0xrncKgTddcKOK0XRPfXbxcWPH/UW4ZScmzOA97FqJEVLlM0QqK+rnb7RDl5zS6d8bNKoB9Gc5sHYbEFciO4+AKdb/BqzG+19+9apYQV8UiAXT0j0tepw/R4E/2Cuy5t9TvpS9FZLqBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775830034; c=relaxed/simple;
	bh=BZN3wb+7t+xblcN+Q3daIXaGLFP2tvaZK3OMZfbF4gk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=srh5WXEBhsKglFyoCDOMJ5lGXWX0sUOzmCcpf+pfPxnr5V66GlZ7hSc3ct8hKa7c0KCog9FyTvNEEpzHnh0YhX9Ru7mfWJOg1wv2Jh1IyzuM2WbTTYgKsI8cLMgYS6Ae9HtQa1zynmqSK8aXV8KUQb48zaw9Hhepg6qH7rk0eUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j/VzDbeI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j/VzDbeI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775830032; x=1807366032;
  h=date:from:to:cc:subject:message-id;
  bh=BZN3wb+7t+xblcN+Q3daIXaGLFP2tvaZK3OMZfbF4gk=;
  b=j/VzDbeIkeIr6E6zr1DSKwzG0m/27kNKfsn0WziCcbKlHBQRHDjCHOMO
   3iDoPl0VtcS6IfijLt/mzJR0gDR+4hFN5Er1dZh2MWc03hSiptxxV5FYq
   WkIylTg6J7dUbrsXszw2T7qIQ90d21A++sYCwwrIl/E213qhqC3lmK1I3
   sRDVUYS6AZYlI6lyBoNbedMkN3G373Zm6CI7qChrRv65i23Y+u8fN1LDn
   xkLHtIKfFsS1TqnMJKZkcCg2l1ipf6rxr+7FOEfnpkFvOs9SElQZhiQe4
   ZSXjIx+B2G7NAX22IcXYgxjAu8tHJAIK4FzauVRmXVyqw82pfi+WfMUuk
   g==;
X-CSE-ConnectionGUID: GFNAMQd0SfeoizWKnN777A==
X-CSE-MsgGUID: hyIJWqzQT6CznKOk9o7Dew==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87476300"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="87476300"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 07:07:11 -0700
X-CSE-ConnectionGUID: jhu7s6O5S0uqrfWSrda52w==
X-CSE-MsgGUID: fGMOV8HVR6G7DS6yNahGFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="225937224"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 10 Apr 2026 07:07:10 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBCVo-00000000AuH-0g7H;
	Fri, 10 Apr 2026 14:07:08 +0000
Date: Fri, 10 Apr 2026 16:06:47 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-pinctrl:ib-mux-pinctrl 2/5]
 arch/mips/boot/dts/ingenic/qi_lb60.dtb: pin-controller@10010000
 (ingenic,jz4740-pinctrl): $nodename:0: 'pin-controller@10010000' does not
 match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
Message-ID: <202604101543.pDZIiRme-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-gpio@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: Linus Walleij <linusw@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-mux-pinctrl
head:   62f97854fd4bf56e5eb15970787aa4125ea912cd
commit: f2e398e6c147cec7cda3d01762499dbbcc925f63 [2/5] dt-bindings: pinctrl: Add generic pinctrl for board-level mux chips
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: mips-randconfig-2051-20260410 (https://download.01.org/0day-ci/archive/20260410/202604101543.pDZIiRme-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 9.5.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101543.pDZIiRme-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604101543.pDZIiRme-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/ingenic/qi_lb60.dts:21.9-24.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: / (qi,lb60): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 33554432]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: cpu@0 (ingenic,xburst-mxu1.0): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: jz4740-cgu@10000000 (ingenic,jz4740-cgu): $nodename:0: 'jz4740-cgu@10000000' does not match '^clock-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/qi_lb60.dtb: pin-controller@10010000 (ingenic,jz4740-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: mmc: mmc-gpios: {'pins': ['PD0', 'PD2'], 'bias-disable': True} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: serial@10030000 (ingenic,jz4740-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: serial@10030000 (ingenic,jz4740-uart): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: nand-controller@1 (ingenic,jz4740-nand): Unevaluated properties are not allowed ('rb-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ingenic,nand.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: /ecc-controller@13010100: failed to match any schema with compatible: ['ingenic,jz4740-ecc']
--
   arch/mips/boot/dts/ingenic/gcw0.dtb: timer@10002000 (ingenic,jz4770-tcu): timer@e0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-ost'] is too short
   	'ingenic,jz4770-ost' is not one of ['ingenic,jz4725b-ost', 'ingenic,jz4760b-ost']
   	'ingenic,jz4760-ost' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: timer@10002000 (ingenic,jz4770-tcu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-tcu', 'simple-mfd'] is too short
   	'ingenic,jz4770-tcu' is not one of ['ingenic,jz4740-tcu', 'ingenic,jz4725b-tcu', 'ingenic,jz4760-tcu', 'ingenic,x1000-tcu']
   	'ingenic,jz4760-tcu' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: pin-controller@10010000 (ingenic,jz4770-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: serial@10030000 (ingenic,jz4770-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-uart'] is too short
   	'ingenic,jz4770-uart' is not one of ['ingenic,jz4740-uart', 'ingenic,jz4750-uart', 'ingenic,jz4760-uart', 'ingenic,jz4780-uart', 'ingenic,x1000-uart']
   	'ingenic,jz4725b-uart' was expected
   	'ingenic,jz4755-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: serial@10031000 (ingenic,jz4770-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-uart'] is too short
   	'ingenic,jz4770-uart' is not one of ['ingenic,jz4740-uart', 'ingenic,jz4750-uart', 'ingenic,jz4760-uart', 'ingenic,jz4780-uart', 'ingenic,x1000-uart']
--
   	['ingenic,jz4780-tcu', 'ingenic,jz4770-tcu', 'simple-mfd'] is too long
   	'ingenic,jz4780-tcu' is not one of ['ingenic,jz4740-tcu', 'ingenic,jz4725b-tcu', 'ingenic,jz4760-tcu', 'ingenic,x1000-tcu']
   	'simple-mfd' was expected
   	'ingenic,jz4760-tcu' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: rtc@10003000 (ingenic,jz4780-rtc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4780-rtc'] is too short
   	'ingenic,jz4780-rtc' is not one of ['ingenic,jz4740-rtc', 'ingenic,jz4760-rtc']
   	'ingenic,jz4725b-rtc' was expected
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: pin-controller@10010000 (ingenic,jz4780-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: serial@10030000 (ingenic,jz4780-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: serial@10030000 (ingenic,jz4780-uart): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: serial@10031000 (ingenic,jz4780-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: serial@10031000 (ingenic,jz4780-uart): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: serial@10032000 (ingenic,jz4780-uart): 'dmas' is a required property
--
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: /timer@10002000/watchdog@0: failed to match any schema with compatible: ['ingenic,x1000-watchdog', 'ingenic,jz4780-watchdog']
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: rtc@10003000 (ingenic,x1000-rtc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1000-rtc', 'ingenic,jz4780-rtc'] is too long
   	'ingenic,x1000-rtc' is not one of ['ingenic,jz4740-rtc', 'ingenic,jz4760-rtc']
   	'ingenic,jz4725b-rtc' was expected
   	'ingenic,x1000-rtc' is not one of ['ingenic,jz4770-rtc', 'ingenic,jz4780-rtc']
   	'ingenic,jz4740-rtc' was expected
   	'ingenic,jz4760-rtc' was expected
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: /rtc@10003000: failed to match any schema with compatible: ['ingenic,x1000-rtc', 'ingenic,jz4780-rtc']
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: pin-controller@10010000 (ingenic,x1000-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: serial@10032000 (ingenic,x1000-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: serial@10032000 (ingenic,x1000-uart): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: spi@10043000 (ingenic,x1000-spi): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/ingenic,spi.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: expander@0 (nxp,sc16is752): $nodename:0: 'expander@0' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/nxp,sc16is7xx.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: expander@0 (nxp,sc16is752): Unevaluated properties are not allowed ('sc16is752' was unexpected)
--
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /timer@10002000/pwm@40: failed to match any schema with compatible: ['ingenic,x1830-pwm', 'ingenic,jz4740-pwm']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: rtc@10003000 (ingenic,x1830-rtc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-rtc', 'ingenic,jz4780-rtc'] is too long
   	'ingenic,x1830-rtc' is not one of ['ingenic,jz4740-rtc', 'ingenic,jz4760-rtc']
   	'ingenic,jz4725b-rtc' was expected
   	'ingenic,x1830-rtc' is not one of ['ingenic,jz4770-rtc', 'ingenic,jz4780-rtc']
   	'ingenic,jz4740-rtc' was expected
   	'ingenic,jz4760-rtc' was expected
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /rtc@10003000: failed to match any schema with compatible: ['ingenic,x1830-rtc', 'ingenic,jz4780-rtc']
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: pin-controller@10010000 (ingenic,x1830-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: serial@10030000 (ingenic,x1830-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-uart', 'ingenic,x1000-uart'] is too long
   	'ingenic,x1830-uart' is not one of ['ingenic,jz4740-uart', 'ingenic,jz4750-uart', 'ingenic,jz4760-uart', 'ingenic,jz4780-uart', 'ingenic,x1000-uart']
   	'ingenic,x1830-uart' is not one of ['ingenic,jz4770-uart', 'ingenic,jz4775-uart']
   	'ingenic,jz4725b-uart' was expected
   	'ingenic,jz4755-uart' was expected
   	'ingenic,jz4760-uart' was expected
   	'ingenic,jz4740-uart' was expected
   	'ingenic,jz4750-uart' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
