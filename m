Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439213;
	b=R6TkOGOj3CVHWMaGrbVfFTdhoeI9bcl2t2YTLqpb24CHoeDC3+xeRJnN4CEKyeYaXsJC
	 QhEyOJmejzCvSmWY3ailYtMVU5ofKafqHSHZP5u3MBO/SJ6AgmqFAFCZCW6zijbmozo1d
	 +OLoRoqb1oIiRySigXFS3DT1nYoeXhvGaCKRHo0YcaX6LBd2kGNn/OFH6xW85OFGWPOCu
	 nfWuvCzLdsRsBZqWarxHKoKtcxxi9rpahQFtZ0ORtG9GHEnfu6TRdvTvyCn7tIpEV7FDD
	 MM+fyC9NBEcgk2zKEfBaZCLE8eRKipirnnoiWYlKps6XWCYZ3BbeRFX2zlRs6Sn5EdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439213;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=gPAau1/rWXmyC6HLMGpRPjpO5/jMSyC2Q/EKTVwxQcQ=;
	b=kS6kz/aZUJxtmhA3m20+LuD4fJwPnf67XDWq/9vOnhKY7dPr536sVqaVBIs1EVfTQgni
	 yZKpxGuWMx+B7i/M+/e9sYfBFjJIU0NRxOrSA64PXII99r85Y0SlDwUMBU3crb2i55V4r
	 AqbH7IKOXJvpu54DPvotp8z0fnEe/sRnsvJ543RmyZ51FPE12ChUpxvZsyubzDrHSpovo
	 LCcJh467M1gGiADVyBJR0lPWVXySa2Agafm53nt4pdeOBY3HSWnQzE7oSKEAVA4XC8b0t
	 VnWJ5ycaSQ0Qkktz20Wwj8lZvNjJtZC4e0B8YeKsUNSzULoKGYr4/fr9lMvsvRiCINw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kUsRVZbu;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF66606A326
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Nov 2026 23:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFF66606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kUsRVZbu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794439212; x=1825975212;
  h=date:from:to:cc:subject:message-id;
  bh=SsUUtWAxPzIHniTAA+JoscLVFb7IhQmIImR3anjBSuM=;
  b=kUsRVZbuPYhw28H8s7OIX2VL0/uY4WxXu1vOtgDB9Zgz/njtEnVLNnKB
   wOlZCEsqsHPGh9lKy1uWcrlaLvUeJjjW5t/OjB/xDSMux3IRjOgVAETu1
   BNl9wb6jlz1FX8FrRTnLJxneiVuIkUfET9qn4WLmfWiHLbHhkFtF6lbZZ
   K8IxYws5xoX7NHDMI1x1/yIpMXVb5IpCjLIPP2jpEBI3nG8Gxw+nLu3Ao
   0vU+Ytv+yAz2fZgH9xFSJgRJix5A1lmPYwJn5Xh+7lsTlknnhGMgWLisf
   kVBodxsJa6aPDE1cPc4YvFLPAlwXP0CErn6ycluHIz/pfbNHdTBroEQsb
   w==;
X-CSE-ConnectionGUID: S8mz4xwkSNa5BaGPvLaJgw==
X-CSE-MsgGUID: pz2YVzWZQ6+Ary6QyBhs6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3211409"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3211409"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 15:20:12 -0800
X-CSE-ConnectionGUID: 8HQvrbJYTfuFggsRMoa6jg==
X-CSE-MsgGUID: 4+GmkGVeRZ+svt+x+tZDAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8670761"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 11 Nov 2026 15:20:10 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRHbs-000000000hj-0K5G;
	Wed, 11 Nov 2026 23:20:08 +0000
Date: Thu, 12 Nov 2026 00:19:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sudeep-holla:for-next/vexpress/updates 4/7]
 arch/arm/boot/dts/arm/integratorap.dtb: /fpga-bus/rtc@15000000: failed to
 match any schema with compatible: ['arm,pl030', 'arm,primecell']
Message-ID: <202611120008.PihMcDmF-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Sudeep Holla <sudeep.holla@kernel.org>
CC: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git for-next/vexpress/updates
head:   ce28870a8e600baf04d045a394e637f5e246ada3
commit: e7c38fdf57c42088e6e3a994b73f0cdd72289bb7 [4/7] ARM: dts: arm: Use standard node names
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261112/202611120008.PihMcDmF-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611120008.PihMcDmF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611120008.PihMcDmF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/arm/integratorap.dts:176.3-197.5: Warning (interrupt_map): /pci@62000000:interrupt-map: Missing property '#address-cells' in node /pic@14000000, using 0 as fallback
   arch/arm/boot/dts/arm/integratorap.dts:176.3-197.5: Warning (interrupt_map): /pci@62000000:interrupt-map: Missing property '#address-cells' in node /pic@14000000, using 0 as fallback
   arch/arm/boot/dts/arm/integratorap.dts:50.10-53.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/arm/integratorap.dts:50.10-53.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/arm/integratorap.dtb: / (arm,integrator-ap): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/arm/integratorap.dtb: /ebi@12000000: failed to match any schema with compatible: ['arm,external-bus-interface']
   arch/arm/boot/dts/arm/integratorap.dtb: /timer@13000000: failed to match any schema with compatible: ['arm,integrator-timer']
   arch/arm/boot/dts/arm/integratorap.dtb: /timer@13000100: failed to match any schema with compatible: ['arm,integrator-timer']
   arch/arm/boot/dts/arm/integratorap.dtb: /timer@13000200: failed to match any schema with compatible: ['arm,integrator-timer']
>> arch/arm/boot/dts/arm/integratorap.dtb: /fpga-bus/rtc@15000000: failed to match any schema with compatible: ['arm,pl030', 'arm,primecell']
>> arch/arm/boot/dts/arm/integratorap.dtb: /fpga-bus/serial@16000000: failed to match any schema with compatible: ['arm,pl010', 'arm,primecell']
   arch/arm/boot/dts/arm/integratorap.dtb: /fpga-bus/serial@17000000: failed to match any schema with compatible: ['arm,pl010', 'arm,primecell']
   arch/arm/boot/dts/arm/integratorap.dtb: kmi@18000000 (arm,pl050): 'arm,primecell-periphid' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/serio/arm,pl050.yaml
   arch/arm/boot/dts/arm/integratorap.dtb: kmi@19000000 (arm,pl050): 'arm,primecell-periphid' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/serio/arm,pl050.yaml
   arch/arm/boot/dts/arm/integratorap.dtb: syscon@1a000000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/arm/integratorap.dtb: aliases: 'arm,timer-primary', 'arm,timer-secondary' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/arm/integratorap.dtb: clock-14745600 (fixed-clock): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/arm/integratorap.dts:176.3-197.5: Warning (interrupt_map): /pci@62000000:interrupt-map: Missing property '#address-cells' in node /pic@14000000, using 0 as fallback
   arch/arm/boot/dts/arm/integratorap.dts:176.3-197.5: Warning (interrupt_map): /pci@62000000:interrupt-map: Missing property '#address-cells' in node /pic@14000000, using 0 as fallback
   arch/arm/boot/dts/arm/integratorap.dts:50.10-53.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/arm/integratorap.dts:50.10-53.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: / (arm,integrator-ap): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: /ebi@12000000: failed to match any schema with compatible: ['arm,external-bus-interface']
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: /timer@13000000: failed to match any schema with compatible: ['arm,integrator-timer']
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: /timer@13000100: failed to match any schema with compatible: ['arm,integrator-timer']
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: /timer@13000200: failed to match any schema with compatible: ['arm,integrator-timer']
>> arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: /fpga-bus/rtc@15000000: failed to match any schema with compatible: ['arm,pl030', 'arm,primecell']
>> arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: /fpga-bus/serial@16000000: failed to match any schema with compatible: ['arm,pl010', 'arm,primecell']
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: /fpga-bus/serial@17000000: failed to match any schema with compatible: ['arm,pl010', 'arm,primecell']
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: kmi@18000000 (arm,pl050): 'arm,primecell-periphid' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/serio/arm,pl050.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: kmi@19000000 (arm,pl050): 'arm,primecell-periphid' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/serio/arm,pl050.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: syscon@1a000000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: aliases: 'arm,timer-primary', 'arm,timer-secondary' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: clock-14745600 (fixed-clock): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: bus@c0000000 (simple-bus): vga: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: bus@c0000000 (simple-bus): gpio_keys: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: bus@c0000000 (simple-bus): clock-uart: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: gpio_keys (gpio-keys): '#address-cells', '#size-cells', 'button@0', 'button@1', 'button@2', 'button@3', 'button@4', 'button@5' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: /bus@c0000000/bus@c0000000/rtc@600000: failed to match any schema with compatible: ['arm,pl030', 'arm,primecell']
>> arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: display@1000000 (arm,pl110): 'dma-ranges' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/arm,pl11x.yaml
>> arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: display@1000000 (arm,pl110): port: '#address-cells', '#size-cells', 'endpoint@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/arm,pl11x.yaml
--
   arch/arm/boot/dts/arm/versatile-ab.dts:22.9-25.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/versatile-ab.dts:406.22-414.7: Warning (unit_address_vs_reg): /amba-bus/fpga-bus@10000000/sysreg@0/display@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/versatile-ab.dtb: / (arm,versatile-ab): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/arm/versatile-ab.dtb: /core-module@10000000: failed to match any schema with compatible: ['arm,core-module-versatile', 'syscon', 'simple-mfd']
>> arch/arm/boot/dts/arm/versatile-ab.dtb: /amba-bus/interrupt-controller@10003000: failed to match any schema with compatible: ['arm,versatile-sic']
   arch/arm/boot/dts/arm/versatile-ab.dtb: dma-controller@10130000 (arm,pl081): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
   arch/arm/boot/dts/arm/versatile-ab.dtb: dma-controller@10130000 (arm,pl081): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
   arch/arm/boot/dts/arm/versatile-ab.dtb: dma-controller@10130000 (arm,pl081): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
>> arch/arm/boot/dts/arm/versatile-ab.dtb: display@10120000 (arm,pl110): port: '#address-cells', '#size-cells', 'endpoint@0', 'endpoint@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/arm,pl11x.yaml
>> arch/arm/boot/dts/arm/versatile-ab.dtb: /amba-bus/rtc@101e8000: failed to match any schema with compatible: ['arm,pl030', 'arm,primecell']
>> arch/arm/boot/dts/arm/versatile-ab.dtb: /amba-bus/fpga-bus@10000000: failed to match any schema with compatible: ['arm,versatile-fpga', 'simple-bus']
   arch/arm/boot/dts/arm/versatile-ab.dtb: sysreg@0 (arm,versatile-sysreg): 'display@0' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,versatile-sysreg.yaml
--
   arch/arm/boot/dts/arm/versatile-ab.dts:22.9-25.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/versatile-ab.dts:406.22-414.7: Warning (unit_address_vs_reg): /amba-bus/fpga-bus@10000000/sysreg@0/display@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/versatile-ab-ib2.dtb: / (arm,versatile-ab): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/arm/versatile-ab-ib2.dtb: /core-module@10000000: failed to match any schema with compatible: ['arm,core-module-versatile', 'syscon', 'simple-mfd']
>> arch/arm/boot/dts/arm/versatile-ab-ib2.dtb: /amba-bus/interrupt-controller@10003000: failed to match any schema with compatible: ['arm,versatile-sic']
   arch/arm/boot/dts/arm/versatile-ab-ib2.dtb: dma-controller@10130000 (arm,pl081): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
   arch/arm/boot/dts/arm/versatile-ab-ib2.dtb: dma-controller@10130000 (arm,pl081): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
   arch/arm/boot/dts/arm/versatile-ab-ib2.dtb: dma-controller@10130000 (arm,pl081): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
>> arch/arm/boot/dts/arm/versatile-ab-ib2.dtb: display@10120000 (arm,pl110): port: '#address-cells', '#size-cells', 'endpoint@0', 'endpoint@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/arm,pl11x.yaml
>> arch/arm/boot/dts/arm/versatile-ab-ib2.dtb: /amba-bus/rtc@101e8000: failed to match any schema with compatible: ['arm,pl030', 'arm,primecell']
>> arch/arm/boot/dts/arm/versatile-ab-ib2.dtb: /amba-bus/fpga-bus@10000000: failed to match any schema with compatible: ['arm,versatile-fpga', 'simple-bus']
   arch/arm/boot/dts/arm/versatile-ab-ib2.dtb: sysreg@0 (arm,versatile-sysreg): 'display@0' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,versatile-sysreg.yaml
--
   arch/arm/boot/dts/arm/versatile-pb.dts:59.4-77.29: Warning (interrupt_map): /amba-bus/pci@10001000:interrupt-map: Missing property '#address-cells' in node /amba-bus/interrupt-controller@10003000, using 0 as fallback
   arch/arm/boot/dts/arm/versatile-pb.dts:59.4-77.29: Warning (interrupt_map): /amba-bus/pci@10001000:interrupt-map: Missing property '#address-cells' in node /amba-bus/interrupt-controller@10003000, using 0 as fallback
   arch/arm/boot/dts/arm/versatile-pb.dts:59.4-77.29: Warning (interrupt_map): /amba-bus/pci@10001000:interrupt-map: Missing property '#address-cells' in node /amba-bus/interrupt-controller@10003000, using 0 as fallback
   arch/arm/boot/dts/arm/versatile-pb.dts:59.4-77.29: Warning (interrupt_map): /amba-bus/pci@10001000:interrupt-map: Missing property '#address-cells' in node /amba-bus/interrupt-controller@10003000, using 0 as fallback
   arch/arm/boot/dts/arm/versatile-pb.dts:59.4-77.29: Warning (interrupt_map): /amba-bus/pci@10001000:interrupt-map: Missing property '#address-cells' in node /amba-bus/interrupt-controller@10003000, using 0 as fallback
   arch/arm/boot/dts/arm/versatile-pb.dts:59.4-77.29: Warning (interrupt_map): /amba-bus/pci@10001000:interrupt-map: Missing property '#address-cells' in node /amba-bus/interrupt-controller@10003000, using 0 as fallback
   arch/arm/boot/dts/arm/versatile-pb.dts:59.4-77.29: Warning (interrupt_map): /amba-bus/pci@10001000:interrupt-map: Missing property '#address-cells' in node /amba-bus/interrupt-controller@10003000, using 0 as fallback
   arch/arm/boot/dts/arm/versatile-pb.dtb: / (arm,versatile-pb): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/arm/versatile-pb.dtb: /core-module@10000000: failed to match any schema with compatible: ['arm,core-module-versatile', 'syscon', 'simple-mfd']
>> arch/arm/boot/dts/arm/versatile-pb.dtb: /amba-bus/interrupt-controller@10003000: failed to match any schema with compatible: ['arm,versatile-sic']
   arch/arm/boot/dts/arm/versatile-pb.dtb: dma-controller@10130000 (arm,pl081): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
   arch/arm/boot/dts/arm/versatile-pb.dtb: dma-controller@10130000 (arm,pl081): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
   arch/arm/boot/dts/arm/versatile-pb.dtb: dma-controller@10130000 (arm,pl081): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
>> arch/arm/boot/dts/arm/versatile-pb.dtb: display@10120000 (arm,pl110): port: '#address-cells', '#size-cells', 'endpoint@0', 'endpoint@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/arm,pl11x.yaml
>> arch/arm/boot/dts/arm/versatile-pb.dtb: /amba-bus/rtc@101e8000: failed to match any schema with compatible: ['arm,pl030', 'arm,primecell']
>> arch/arm/boot/dts/arm/versatile-pb.dtb: /amba-bus/fpga-bus@10000000: failed to match any schema with compatible: ['arm,versatile-fpga', 'simple-bus']
   arch/arm/boot/dts/arm/versatile-pb.dtb: sysreg@0 (arm,versatile-sysreg): 'display@0' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,versatile-sysreg.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
