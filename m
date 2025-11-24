Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AD225F99F
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Nov 2025 23:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764028359; cv=none; b=IkdbMd7aH34OL+WuwP3l98JPY1ZpsGm8VJEGZGwG/KadNdFM2jbEsAWL9iZh5xvJwCNNXPEO7QFcA+hrPbjovr0LoBm35k6EdeATqO5l++qscdDUrBntzO1aNll9j+NRr4laNIRrvpLNzdirHQtOsPd2MDAbajmjEVrU0Ug8FtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764028359; c=relaxed/simple;
	bh=WfTI3gFPyRB1ZGCh0XB75bT/SNkWoHdgQ7ErLh4mlrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=psZGVWcCwR9HUIa+dx/ZjOMzTpQB4YGlBa+i37V5b7ZHaTScC1kpFdbepdly73Pp0JbzkCnMoxYEIzDLKsn7k1zgDpYyvpXFCWElb7x4EnVfHwjOnm6tKxBE66hpBH+2yRi8nPMDnOmA1LrWYRxRDI8ZUHwVkCSi1kY+8mm78FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B7y9pCHO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7y9pCHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764028355; x=1795564355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WfTI3gFPyRB1ZGCh0XB75bT/SNkWoHdgQ7ErLh4mlrM=;
  b=B7y9pCHOHnT51D+PbSIJSX9R3wgNEelVTpbBGkXWZptp6jNiLNagjfOi
   9/Nehi8Ytv0GCEAcGxCwOfNTUhYEX80ZrBzhnXUa7evMKF1U5vBZeHlkw
   8EsJbSz8H5Y8pEQcUObLmfF+zDMLQnQjvAjHQShv0G3Jw5K24xWEoq59A
   Ir+5GQhEinWzufqvsGM49zlP8wH5cDhZfHo6iKjnVMp4XQD2GNn/zQ1HR
   98i0jN1QqBUIG5kQLUyg5U0bReBmmBj2V+mwxJI00JVoYIo6kYzqv8KLP
   QLQTzUqoLiSsIkjxtwVOTnhkU/shVd15ltSLTQPI9xdV+hLdf6+a04BLm
   w==;
X-CSE-ConnectionGUID: OuTnbtWsSe23Np9qF+87nA==
X-CSE-MsgGUID: 8z4r0hCmTiGd2F73e8jcfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="77151329"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="77151329"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 15:52:34 -0800
X-CSE-ConnectionGUID: FJ9HtfToRFCnOD5xiEJEQw==
X-CSE-MsgGUID: AQifNtDGSc29EC03zovLAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="197599513"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 24 Nov 2025 15:52:35 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNgMC-000000000Lp-1cUX;
	Mon, 24 Nov 2025 23:52:32 +0000
Date: Tue, 25 Nov 2025 00:52:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/img/boston.dtb: Warning (interrupt_map): Failed
 prerequisite 'interrupt_provider'
Message-ID: <202511250054.2zavwk3H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
commit: 61a6ba233fe1198e9eacc9ca1d1cbdb27f70cee5 dt-bindings: Unify "fsl,liodn" type definitions
date:   12 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 12 months ago
config: mips-randconfig-2052-20251125 (https://download.01.org/0day-ci/archive/20251125/202511250054.2zavwk3H-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.5.0
dtschema version: 2025.9.dev20+g7033eb7ce
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250054.2zavwk3H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511250054.2zavwk3H-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/img/boston.dts:128.17-178.5: Warning (interrupt_provider): /pci@14000000/pci2_root@0,0: '#interrupt-cells' found, but node is not an interrupt provider
   arch/mips/boot/dts/img/boston.dts:136.23-177.6: Warning (interrupt_provider): /pci@14000000/pci2_root@0,0/eg20t_bridge@1,0,0: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/mips/boot/dts/img/boston.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
>> arch/mips/boot/dts/img/boston.dtb: /: failed to match any schema with compatible: ['img,boston']
   arch/mips/boot/dts/img/boston.dtb: / (img,boston): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/img/boston.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['img,mips']
>> arch/mips/boot/dts/img/boston.dtb: /system-controller@17ffd000: failed to match any schema with compatible: ['img,boston-platform-regs', 'syscon']
>> arch/mips/boot/dts/img/boston.dtb: /system-controller@17ffd000/clock: failed to match any schema with compatible: ['img,boston-clock']
   arch/mips/boot/dts/img/boston.dtb: uart@17ffe000 (ns16550a): $nodename:0: 'uart@17ffe000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
--
   arch/mips/boot/dts/img/pistachio_marduk.dts:29.9-32.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/img/pistachio.dtsi:866.37-869.5: Warning (simple_bus_reg): /clk@18148000/reset-controller: missing or empty reg/ranges property
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: /: failed to match any schema with compatible: ['img,pistachio-marduk', 'img,pistachio']
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: /: failed to match any schema with compatible: ['img,pistachio-marduk', 'img,pistachio']
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: / (img,pistachio-marduk): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: cpu@0 (mti,interaptiv): 'clock-latency', 'clock-names', 'operating-points' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: /i2c@18100000: failed to match any schema with compatible: ['img,scb-i2c']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /i2c@18100200: failed to match any schema with compatible: ['img,scb-i2c']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /i2c@18100400: failed to match any schema with compatible: ['img,scb-i2c']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /i2c@18100600: failed to match any schema with compatible: ['img,scb-i2c']
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: /i2s-in@18100800: failed to match any schema with compatible: ['img,i2s-in']
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: /i2s-out@18100a00: failed to match any schema with compatible: ['img,i2s-out']
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: /parallel-audio-out@18100c00: failed to match any schema with compatible: ['img,parallel-out']
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: /spdif-out@18100d00: failed to match any schema with compatible: ['img,spdif-out']
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: /spdif-in@18100e00: failed to match any schema with compatible: ['img,spdif-in']
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: /internal-dac: failed to match any schema with compatible: ['img,pistachio-internal-dac']
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: /spi@18100f00: failed to match any schema with compatible: ['img,spfi']
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: /spi@18101000: failed to match any schema with compatible: ['img,spfi']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: flash@0 (spansion,s25fl016k): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spansion,s25fl016k', 'jedec,spi-nor'] is too long
   	'spansion,s25fl016k' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'spansion,s25fl016k' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: /spi@18101000/flash@0: failed to match any schema with compatible: ['spansion,s25fl016k', 'jedec,spi-nor']
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: /pwm@18101300: failed to match any schema with compatible: ['img,pistachio-pwm']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: uart@18101400 (snps,dw-apb-uart): $nodename:0: 'uart@18101400' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: uart@18101500 (snps,dw-apb-uart): $nodename:0: 'uart@18101500' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: /pinctrl@18101c00: failed to match any schema with compatible: ['img,pistachio-system-pinctrl']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /timer@18102000: failed to match any schema with compatible: ['img,pistachio-gptimer']
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: /ir@18102200: failed to match any schema with compatible: ['img,ir-rev1']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: usb@18120000 (snps,dwc2): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: usb@18120000 (snps,dwc2): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: mmc@18142000 (img,pistachio-dw-mshc): clock-names:0: 'biu' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: mmc@18142000 (img,pistachio-dw-mshc): clock-names:1: 'ciu' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: sram@1b000000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: sram@1b000000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: sram@1b000000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: /dma-controller@18143000: failed to match any schema with compatible: ['img,pistachio-mdc-dma']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /clk@18144000: failed to match any schema with compatible: ['img,pistachio-clk', 'syscon']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /clk@18144800: failed to match any schema with compatible: ['img,pistachio-clk-periph']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: clk@18148000 (img,pistachio-cr-periph): reset-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: clk@18148000 (img,pistachio-cr-periph): $nodename:0: 'clk@18148000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: clk@18148000 (img,pistachio-cr-periph): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: clk@18148000 (img,pistachio-cr-periph): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: clk@18148000 (img,pistachio-cr-periph): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /clk@18148000: failed to match any schema with compatible: ['img,pistachio-cr-periph', 'syscon', 'simple-bus']
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: /clk@18148000/reset-controller: failed to match any schema with compatible: ['img,pistachio-reset']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /clk@18149000: failed to match any schema with compatible: ['img,pistachio-cr-top', 'syscon']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /hash@18149600: failed to match any schema with compatible: ['img,hash-accelerator']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /usb-phy: failed to match any schema with compatible: ['img,pistachio-usb-phy']
--
>> arch/mips/boot/dts/mscc/jaguar2_pcb110.dtb: /: failed to match any schema with compatible: ['mscc,jr2-pcb110', 'mscc,jr2']
>> arch/mips/boot/dts/mscc/jaguar2_pcb110.dtb: /: failed to match any schema with compatible: ['mscc,jr2-pcb110', 'mscc,jr2']
   arch/mips/boot/dts/mscc/jaguar2_pcb110.dtb: interrupt-controller@70000070 (mscc,jaguar2-icpu-intr): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mscc,ocelot-icpu-intr.yaml
   arch/mips/boot/dts/mscc/jaguar2_pcb110.dtb: i2c0-imux (i2c-mux-pinctrl): $nodename:0: 'i2c0-imux' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pinctrl.yaml
   arch/mips/boot/dts/mscc/jaguar2_pcb110.dtb: i2c0-imux (i2c-mux-pinctrl): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pinctrl.yaml
   arch/mips/boot/dts/mscc/jaguar2_pcb110.dtb: i2c0-emux (i2c-mux-gpio): $nodename:0: 'i2c0-emux' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-gpio.yaml
   arch/mips/boot/dts/mscc/jaguar2_pcb110.dtb: i2c0-emux (i2c-mux-gpio): mux-gpios: [[7, 51, 0], [7, 52, 0], [7, 53, 0], [7, 58, 0], [7, 59, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-gpio.yaml
--
>> arch/mips/boot/dts/mscc/jaguar2_pcb111.dtb: /: failed to match any schema with compatible: ['mscc,jr2-pcb111', 'mscc,jr2']
>> arch/mips/boot/dts/mscc/jaguar2_pcb111.dtb: /: failed to match any schema with compatible: ['mscc,jr2-pcb111', 'mscc,jr2']
   arch/mips/boot/dts/mscc/jaguar2_pcb111.dtb: interrupt-controller@70000070 (mscc,jaguar2-icpu-intr): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mscc,ocelot-icpu-intr.yaml
   arch/mips/boot/dts/mscc/jaguar2_pcb111.dtb: i2c0-imux (i2c-mux-pinctrl): $nodename:0: 'i2c0-imux' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pinctrl.yaml
   arch/mips/boot/dts/mscc/jaguar2_pcb111.dtb: i2c0-imux (i2c-mux-pinctrl): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3', 'i2c@4' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pinctrl.yaml
--
>> arch/mips/boot/dts/mscc/jaguar2_pcb118.dtb: /: failed to match any schema with compatible: ['mscc,jr2-pcb118', 'mscc,jr2']
>> arch/mips/boot/dts/mscc/jaguar2_pcb118.dtb: /: failed to match any schema with compatible: ['mscc,jr2-pcb118', 'mscc,jr2']
   arch/mips/boot/dts/mscc/jaguar2_pcb118.dtb: interrupt-controller@70000070 (mscc,jaguar2-icpu-intr): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mscc,ocelot-icpu-intr.yaml
   arch/mips/boot/dts/mscc/jaguar2_pcb118.dtb: i2c0-imux (i2c-mux-pinctrl): $nodename:0: 'i2c0-imux' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pinctrl.yaml
   arch/mips/boot/dts/mscc/jaguar2_pcb118.dtb: i2c0-imux (i2c-mux-pinctrl): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pinctrl.yaml
--
>> arch/mips/boot/dts/mscc/luton_pcb091.dtb: /: failed to match any schema with compatible: ['mscc,luton-pcb091', 'mscc,luton']
>> arch/mips/boot/dts/mscc/luton_pcb091.dtb: /: failed to match any schema with compatible: ['mscc,luton-pcb091', 'mscc,luton']
   arch/mips/boot/dts/mscc/luton_pcb091.dtb: interrupt-controller@10000084 (mscc,luton-icpu-intr): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mscc,ocelot-icpu-intr.yaml
--
>> arch/mips/boot/dts/mscc/ocelot_pcb120.dtb: /: failed to match any schema with compatible: ['mscc,ocelot-pcb120', 'mscc,ocelot']
>> arch/mips/boot/dts/mscc/ocelot_pcb120.dtb: /: failed to match any schema with compatible: ['mscc,ocelot-pcb120', 'mscc,ocelot']
   arch/mips/boot/dts/mscc/ocelot_pcb120.dtb: / (mscc,ocelot-pcb120): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/mscc/ocelot_pcb120.dtb: interrupt-controller@70 (mscc,ocelot-icpu-intr): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mscc,ocelot-icpu-intr.yaml
   arch/mips/boot/dts/mscc/ocelot_pcb120.dtb: switch@1010000 (mscc,vsc7514-switch): ethernet-ports:port@4: Unevaluated properties are not allowed ('phys' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mscc,vsc7514-switch.yaml
   arch/mips/boot/dts/mscc/ocelot_pcb120.dtb: switch@1010000 (mscc,vsc7514-switch): ethernet-ports:port@5: Unevaluated properties are not allowed ('phys' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mscc,vsc7514-switch.yaml
   arch/mips/boot/dts/mscc/ocelot_pcb120.dtb: switch@1010000 (mscc,vsc7514-switch): ethernet-ports:port@6: Unevaluated properties are not allowed ('phys' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mscc,vsc7514-switch.yaml
   arch/mips/boot/dts/mscc/ocelot_pcb120.dtb: switch@1010000 (mscc,vsc7514-switch): ethernet-ports:port@9: Unevaluated properties are not allowed ('phys' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mscc,vsc7514-switch.yaml
   arch/mips/boot/dts/mscc/ocelot_pcb120.dtb: switch@1010000 (mscc,vsc7514-switch): interrupt-names:2: 'fdma' was expected
   	from schema $id: http://devicetree.org/schemas/net/mscc,vsc7514-switch.yaml
   arch/mips/boot/dts/mscc/ocelot_pcb120.dtb: switch@1010000 (mscc,vsc7514-switch): interrupt-names: ['ptp_rdy', 'xtr', 'inj', 'fdma'] is too long
   	from schema $id: http://devicetree.org/schemas/net/mscc,vsc7514-switch.yaml
   arch/mips/boot/dts/mscc/ocelot_pcb120.dtb: switch@1010000 (mscc,vsc7514-switch): interrupts: [[18], [21], [22], [16]] is too long
   	from schema $id: http://devicetree.org/schemas/net/mscc,vsc7514-switch.yaml
>> arch/mips/boot/dts/mscc/ocelot_pcb120.dtb: switch@1010000 (mscc,vsc7514-switch): Unevaluated properties are not allowed ('ethernet-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mscc,vsc7514-switch.yaml
>> arch/mips/boot/dts/mscc/ocelot_pcb120.dtb: /ahb@70000000/reset@1070008: failed to match any schema with compatible: ['mscc,ocelot-chip-reset']
>> arch/mips/boot/dts/mscc/ocelot_pcb120.dtb: /ahb@70000000/syscon@10d0000: failed to match any schema with compatible: ['mscc,ocelot-hsio', 'syscon', 'simple-mfd']
--
>> arch/mips/boot/dts/mscc/ocelot_pcb123.dtb: /: failed to match any schema with compatible: ['mscc,ocelot-pcb123', 'mscc,ocelot']
>> arch/mips/boot/dts/mscc/ocelot_pcb123.dtb: /: failed to match any schema with compatible: ['mscc,ocelot-pcb123', 'mscc,ocelot']
   arch/mips/boot/dts/mscc/ocelot_pcb123.dtb: / (mscc,ocelot-pcb123): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/mscc/ocelot_pcb123.dtb: interrupt-controller@70 (mscc,ocelot-icpu-intr): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mscc,ocelot-icpu-intr.yaml
   arch/mips/boot/dts/mscc/ocelot_pcb123.dtb: flash@0 (macronix,mx25l25635f): compatible: 'oneOf' conditional failed, one must be fixed:
   	['macronix,mx25l25635f', 'jedec,spi-nor'] is too long
   	'macronix,mx25l25635f' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'macronix,mx25l25635f' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
>> arch/mips/boot/dts/mscc/ocelot_pcb123.dtb: /ahb@70000000/spi@101000/flash@0: failed to match any schema with compatible: ['macronix,mx25l25635f', 'jedec,spi-nor']
   arch/mips/boot/dts/mscc/ocelot_pcb123.dtb: switch@1010000 (mscc,vsc7514-switch): interrupt-names:2: 'fdma' was expected
   	from schema $id: http://devicetree.org/schemas/net/mscc,vsc7514-switch.yaml
   arch/mips/boot/dts/mscc/ocelot_pcb123.dtb: switch@1010000 (mscc,vsc7514-switch): interrupt-names: ['ptp_rdy', 'xtr', 'inj', 'fdma'] is too long
   	from schema $id: http://devicetree.org/schemas/net/mscc,vsc7514-switch.yaml
   arch/mips/boot/dts/mscc/ocelot_pcb123.dtb: switch@1010000 (mscc,vsc7514-switch): interrupts: [[18], [21], [22], [16]] is too long
   	from schema $id: http://devicetree.org/schemas/net/mscc,vsc7514-switch.yaml
>> arch/mips/boot/dts/mscc/ocelot_pcb123.dtb: /ahb@70000000/reset@1070008: failed to match any schema with compatible: ['mscc,ocelot-chip-reset']
>> arch/mips/boot/dts/mscc/ocelot_pcb123.dtb: /ahb@70000000/syscon@10d0000: failed to match any schema with compatible: ['mscc,ocelot-hsio', 'syscon', 'simple-mfd']
--
>> arch/mips/boot/dts/mscc/serval_pcb105.dtb: /: failed to match any schema with compatible: ['mscc,serval-pcb105', 'mscc,serval']
>> arch/mips/boot/dts/mscc/serval_pcb105.dtb: /: failed to match any schema with compatible: ['mscc,serval-pcb105', 'mscc,serval']
   arch/mips/boot/dts/mscc/serval_pcb105.dtb: interrupt-controller@70000070 (mscc,serval-icpu-intr): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mscc,ocelot-icpu-intr.yaml
   arch/mips/boot/dts/mscc/serval_pcb105.dtb: i2c0-imux (i2c-mux-pinctrl): $nodename:0: 'i2c0-imux' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pinctrl.yaml
   arch/mips/boot/dts/mscc/serval_pcb105.dtb: i2c0-imux (i2c-mux-pinctrl): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c_sfp0@0', 'i2c_sfp1@1', 'i2c_sfp2@2', 'i2c_sfp3@3', 'i2c_sfp4@4', 'i2c_sfp5@5' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pinctrl.yaml
--
>> arch/mips/boot/dts/mscc/serval_pcb106.dtb: /: failed to match any schema with compatible: ['mscc,serval-pcb106', 'mscc,serval']
>> arch/mips/boot/dts/mscc/serval_pcb106.dtb: /: failed to match any schema with compatible: ['mscc,serval-pcb106', 'mscc,serval']
   arch/mips/boot/dts/mscc/serval_pcb106.dtb: interrupt-controller@70000070 (mscc,serval-icpu-intr): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mscc,ocelot-icpu-intr.yaml
   arch/mips/boot/dts/mscc/serval_pcb106.dtb: i2c0-imux (i2c-mux-pinctrl): $nodename:0: 'i2c0-imux' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pinctrl.yaml
   arch/mips/boot/dts/mscc/serval_pcb106.dtb: i2c0-imux (i2c-mux-pinctrl): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c_sfp0@0', 'i2c_sfp1@1', 'i2c_sfp2@2', 'i2c_sfp3@3', 'i2c_sfp4@4', 'i2c_sfp5@5' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pinctrl.yaml
--
   arch/mips/boot/dts/xilfpga/nexys4ddr.dts:17.9-20.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   xlnx,rx-ping-pong: size (4) error for type flag
   xlnx,tx-ping-pong: size (4) error for type flag
>> arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: /: failed to match any schema with compatible: ['digilent,nexys4ddr']
>> arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: / (digilent,nexys4ddr): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: / (digilent,nexys4ddr): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: /interrupt-controller@10200000: failed to match any schema with compatible: ['xlnx,xps-intc-1.00.a']
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: gpio@10600000 (xlnx,xps-gpio-1.00.a): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/xlnx,gpio-xilinx.yaml
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000 (xlnx,xps-ethernetlite-3.00.a): 'device_type', 'mdio', 'xlnx,duplex', 'xlnx,include-global-buffers', 'xlnx,include-internal-loopback', 'xlnx,include-mdio', 'xlnx,instance', 'xlnx,s-axi-id-width', 'xlnx,use-internal' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/xlnx,emaclite.yaml
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000 (xlnx,xps-ethernetlite-3.00.a): xlnx,rx-ping-pong: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/net/xlnx,emaclite.yaml
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000 (xlnx,xps-ethernetlite-3.00.a): xlnx,tx-ping-pong: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/net/xlnx,emaclite.yaml
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: i2c@10a00000 (xlnx,xps-iic-2.00.a): Unevaluated properties are not allowed ('xlnx,clk-freq', 'xlnx,family', 'xlnx,gpo-width', 'xlnx,iic-freq', 'xlnx,scl-inertial-delay', 'xlnx,sda-inertial-delay', 'xlnx,ten-bit-adr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml
>> arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: /i2c@10a00000/ad7420@4b: failed to match any schema with compatible: ['adi,adt7420']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
