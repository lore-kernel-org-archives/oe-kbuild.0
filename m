Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FA1136330
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Aug 2024 23:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722899203; cv=none; b=bzsWmg4xrwH5Be9xq5aXnofk1giR/wOlGFE2PQ+925y/e7A9O0aiP6E6EiNDKJgPQTQ93j5Cnwu8qF2JPlI/D+W+XY4+WAvDKNOf5ub+l+Ykxu6MRU9RLqhE+wDt5l304SFdgrgrTY7aIJiIv/oBp1Lmtk7DXiEa5khGJex1xoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722899203; c=relaxed/simple;
	bh=776dLOTybkItG8AKF7FqHNYSaKNn/wDUaCH1WOCk2nE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QT55Bn5Z6rKrqKtDOjHAw4GCFB88K54V2mZqUEitdBtOotlaJDPHf0W4LjeCxwWwtIUXjGZ1INF+OC8xoQiLSO8Hsj3rA+RIMwbVL+HEaGGkbwkSkdOqCXZKnoRJ0ceoKiY6rK5MmtTtmm8+T0EUIzmzxCiUD2/UkjdDVQPAX7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MzFQRHEL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzFQRHEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722899197; x=1754435197;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=776dLOTybkItG8AKF7FqHNYSaKNn/wDUaCH1WOCk2nE=;
  b=MzFQRHELmsu/m5L17xCSh7ckss4x/QYsnrVlDeUQ0bm0Layt00SYDJ1K
   3V1MpctkmxDCC0XUh1zhFkOcAi/wuKd0sTwydPqT+5YHXTPOLZsC0CHNe
   neZOyPRtEjugnGc1sg1DvsoTHVcEeC6bWlWEPYtXPMEAv34UznkmuEpSV
   UI416oC8s5BgnpMXacGvHLUATeeN5honCCf5SoIOYOHlXJqiWEyhlYYrd
   1X0GJ10mzVhUabTBBpRRUZszn90eBW6Ltb+zkG/Uc1bbSErN1WJYb9uUS
   vobcdyuC0FKz+tcbbFm0JK/RtiUGoc4kHuorj4216mQ823RwOex7EdQlB
   w==;
X-CSE-ConnectionGUID: i29aFq3WRuCXqeUq10GohA==
X-CSE-MsgGUID: Mc6PbJk1QO+8HGSTzZAXrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20705300"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="20705300"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 16:06:35 -0700
X-CSE-ConnectionGUID: Zx5Rr8oTRjWNNUYPgZIgzQ==
X-CSE-MsgGUID: ADaNrLyqSK2tduTOUYjazA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="56249790"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Aug 2024 16:06:31 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb6ma-0003rI-2g;
	Mon, 05 Aug 2024 23:06:28 +0000
Date: Tue, 6 Aug 2024 07:06:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-msiof-2024-08-05 1/1]
 arch/arm64/boot/dts/renesas/r8a77960.dtsi:1436.24-1453.5: Warning
 (avoid_unnecessary_addr_size): /soc/spi@e6e90000: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202408060633.9MLDIhBB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-msiof-2024-08-05
head:   4788392137119fd248a12a7873872ba36357f5db
commit: 4788392137119fd248a12a7873872ba36357f5db [1/1] msiof
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-051-20240805 (https://download.01.org/0day-ci/archive/20240806/202408060633.9MLDIhBB-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408060633.9MLDIhBB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408060633.9MLDIhBB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: spi@e6e90000: compatible:0: 'anyOf' conditional failed, one must be fixed:
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(emev2|r(7s|8a|9a)[a-z0-9]+|rcar|rmobile|rz[a-z0-9]*|sh(7[a-z0-9]+)?|mobile)-[a-z0-9-]+$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(condor|falcon|gr-peach|gray-hawk|salvator|sk-rz|smar(c(2)?)?|spider|white-hawk)(.*)?$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,em-(gio|sti|uart)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,fsi2-(r8a7740|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,hspi-r8a777[89]$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' is not one of ['renesas,imr-lx4', 'renesas,mtu2-r7s72100']
   	'renesas,msiof_sound-r8a7796' is not one of ['renesas,smp-sram']
--
   	'renesas,msiof_sound-gen3' does not match '^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,em-(gio|sti|uart)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,fsi2-(r8a7740|sh73a0)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,hspi-r8a777[89]$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$'
   	'renesas,msiof_sound-gen3' is not one of ['renesas,imr-lx4', 'renesas,mtu2-r7s72100']
   	'renesas,msiof_sound-gen3' is not one of ['renesas,smp-sram']
   	'renesas,msiof_sound-gen3' does not match '^(?!renesas,.+-.+).+$'
   	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas-soc.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: /soc/spi@e6e90000: failed to match any schema with compatible: ['renesas,msiof_sound-r8a7796', 'renesas,msiof_sound-gen3']
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: /soc/spi@e6e90000: failed to match any schema with compatible: ['renesas,msiof_sound-r8a7796', 'renesas,msiof_sound-gen3']
--
   arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: spi@e6e90000: compatible:0: 'anyOf' conditional failed, one must be fixed:
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(emev2|r(7s|8a|9a)[a-z0-9]+|rcar|rmobile|rz[a-z0-9]*|sh(7[a-z0-9]+)?|mobile)-[a-z0-9-]+$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(condor|falcon|gr-peach|gray-hawk|salvator|sk-rz|smar(c(2)?)?|spider|white-hawk)(.*)?$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,em-(gio|sti|uart)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,fsi2-(r8a7740|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,hspi-r8a777[89]$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' is not one of ['renesas,imr-lx4', 'renesas,mtu2-r7s72100']
   	'renesas,msiof_sound-r8a7796' is not one of ['renesas,smp-sram']
--
   	'renesas,msiof_sound-gen3' does not match '^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,em-(gio|sti|uart)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,fsi2-(r8a7740|sh73a0)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,hspi-r8a777[89]$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$'
   	'renesas,msiof_sound-gen3' is not one of ['renesas,imr-lx4', 'renesas,mtu2-r7s72100']
   	'renesas,msiof_sound-gen3' is not one of ['renesas,smp-sram']
   	'renesas,msiof_sound-gen3' does not match '^(?!renesas,.+-.+).+$'
   	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas-soc.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: /soc/spi@e6e90000: failed to match any schema with compatible: ['renesas,msiof_sound-r8a7796', 'renesas,msiof_sound-gen3']
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: /soc/spi@e6e90000: failed to match any schema with compatible: ['renesas,msiof_sound-r8a7796', 'renesas,msiof_sound-gen3']
--
   arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts:48.18-54.4: Warning (spi_bus_reg): /soc/spi@e6e90000/port: missing or empty reg property
>> arch/arm64/boot/dts/renesas/r8a77960.dtsi:1436.24-1453.5: Warning (avoid_unnecessary_addr_size): /soc/spi@e6e90000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts:33.8-42.4: Warning (avoid_unnecessary_addr_size): /dummy: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: spi@e6e90000: compatible:0: 'anyOf' conditional failed, one must be fixed:
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(emev2|r(7s|8a|9a)[a-z0-9]+|rcar|rmobile|rz[a-z0-9]*|sh(7[a-z0-9]+)?|mobile)-[a-z0-9-]+$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(condor|falcon|gr-peach|gray-hawk|salvator|sk-rz|smar(c(2)?)?|spider|white-hawk)(.*)?$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,em-(gio|sti|uart)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,fsi2-(r8a7740|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,hspi-r8a777[89]$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' is not one of ['renesas,imr-lx4', 'renesas,mtu2-r7s72100']
   	'renesas,msiof_sound-r8a7796' is not one of ['renesas,smp-sram']
--
   	'renesas,msiof_sound-gen3' does not match '^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,em-(gio|sti|uart)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,fsi2-(r8a7740|sh73a0)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,hspi-r8a777[89]$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$'
   	'renesas,msiof_sound-gen3' is not one of ['renesas,imr-lx4', 'renesas,mtu2-r7s72100']
   	'renesas,msiof_sound-gen3' is not one of ['renesas,smp-sram']
   	'renesas,msiof_sound-gen3' does not match '^(?!renesas,.+-.+).+$'
   	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas-soc.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: /soc/spi@e6e90000: failed to match any schema with compatible: ['renesas,msiof_sound-r8a7796', 'renesas,msiof_sound-gen3']
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: /soc/spi@e6e90000: failed to match any schema with compatible: ['renesas,msiof_sound-r8a7796', 'renesas,msiof_sound-gen3']
--
   arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts:48.18-54.4: Warning (spi_bus_reg): /soc/spi@e6e90000/port: missing or empty reg property
>> arch/arm64/boot/dts/renesas/r8a77960.dtsi:1436.24-1453.5: Warning (avoid_unnecessary_addr_size): /soc/spi@e6e90000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts:33.8-42.4: Warning (avoid_unnecessary_addr_size): /dummy: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: spi@e6e90000: compatible:0: 'anyOf' conditional failed, one must be fixed:
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(emev2|r(7s|8a|9a)[a-z0-9]+|rcar|rmobile|rz[a-z0-9]*|sh(7[a-z0-9]+)?|mobile)-[a-z0-9-]+$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(condor|falcon|gr-peach|gray-hawk|salvator|sk-rz|smar(c(2)?)?|spider|white-hawk)(.*)?$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,em-(gio|sti|uart)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,fsi2-(r8a7740|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,hspi-r8a777[89]$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' is not one of ['renesas,imr-lx4', 'renesas,mtu2-r7s72100']
   	'renesas,msiof_sound-r8a7796' is not one of ['renesas,smp-sram']
--
   	'renesas,msiof_sound-gen3' does not match '^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,em-(gio|sti|uart)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,fsi2-(r8a7740|sh73a0)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,hspi-r8a777[89]$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$'
   	'renesas,msiof_sound-gen3' is not one of ['renesas,imr-lx4', 'renesas,mtu2-r7s72100']
   	'renesas,msiof_sound-gen3' is not one of ['renesas,smp-sram']
   	'renesas,msiof_sound-gen3' does not match '^(?!renesas,.+-.+).+$'
   	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas-soc.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: /soc/spi@e6e90000: failed to match any schema with compatible: ['renesas,msiof_sound-r8a7796', 'renesas,msiof_sound-gen3']
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: /soc/spi@e6e90000: failed to match any schema with compatible: ['renesas,msiof_sound-r8a7796', 'renesas,msiof_sound-gen3']
--
   arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: spi@e6e90000: compatible:0: 'anyOf' conditional failed, one must be fixed:
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(emev2|r(7s|8a|9a)[a-z0-9]+|rcar|rmobile|rz[a-z0-9]*|sh(7[a-z0-9]+)?|mobile)-[a-z0-9-]+$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(condor|falcon|gr-peach|gray-hawk|salvator|sk-rz|smar(c(2)?)?|spider|white-hawk)(.*)?$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,em-(gio|sti|uart)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,fsi2-(r8a7740|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,hspi-r8a777[89]$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' is not one of ['renesas,imr-lx4', 'renesas,mtu2-r7s72100']
   	'renesas,msiof_sound-r8a7796' is not one of ['renesas,smp-sram']
--
   	'renesas,msiof_sound-gen3' does not match '^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,em-(gio|sti|uart)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,fsi2-(r8a7740|sh73a0)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,hspi-r8a777[89]$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$'
   	'renesas,msiof_sound-gen3' is not one of ['renesas,imr-lx4', 'renesas,mtu2-r7s72100']
   	'renesas,msiof_sound-gen3' is not one of ['renesas,smp-sram']
   	'renesas,msiof_sound-gen3' does not match '^(?!renesas,.+-.+).+$'
   	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas-soc.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: /soc/spi@e6e90000: failed to match any schema with compatible: ['renesas,msiof_sound-r8a7796', 'renesas,msiof_sound-gen3']
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: /soc/spi@e6e90000: failed to match any schema with compatible: ['renesas,msiof_sound-r8a7796', 'renesas,msiof_sound-gen3']
--
   arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: spi@e6e90000: compatible:0: 'anyOf' conditional failed, one must be fixed:
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(emev2|r(7s|8a|9a)[a-z0-9]+|rcar|rmobile|rz[a-z0-9]*|sh(7[a-z0-9]+)?|mobile)-[a-z0-9-]+$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(condor|falcon|gr-peach|gray-hawk|salvator|sk-rz|smar(c(2)?)?|spider|white-hawk)(.*)?$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,em-(gio|sti|uart)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,fsi2-(r8a7740|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,hspi-r8a777[89]$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' is not one of ['renesas,imr-lx4', 'renesas,mtu2-r7s72100']
   	'renesas,msiof_sound-r8a7796' is not one of ['renesas,smp-sram']
--
   	'renesas,msiof_sound-gen3' does not match '^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,em-(gio|sti|uart)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,fsi2-(r8a7740|sh73a0)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,hspi-r8a777[89]$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$'
   	'renesas,msiof_sound-gen3' is not one of ['renesas,imr-lx4', 'renesas,mtu2-r7s72100']
   	'renesas,msiof_sound-gen3' is not one of ['renesas,smp-sram']
   	'renesas,msiof_sound-gen3' does not match '^(?!renesas,.+-.+).+$'
   	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas-soc.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: /soc/spi@e6e90000: failed to match any schema with compatible: ['renesas,msiof_sound-r8a7796', 'renesas,msiof_sound-gen3']
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: /soc/spi@e6e90000: failed to match any schema with compatible: ['renesas,msiof_sound-r8a7796', 'renesas,msiof_sound-gen3']

vim +1436 arch/arm64/boot/dts/renesas/r8a77960.dtsi

1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24    11  
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24    12  / {
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24    13  	compatible = "renesas,r8a7796";
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24    14  	#address-cells = <2>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24    15  	#size-cells = <2>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24    16  
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    17  	/*
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    18  	 * The external audio clocks are configured as 0 Hz fixed frequency
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    19  	 * clocks by default.
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    20  	 * Boards that provide audio clocks should override them.
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    21  	 */
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    22  	audio_clk_a: audio_clk_a {
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    23  		compatible = "fixed-clock";
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    24  		#clock-cells = <0>;
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    25  		clock-frequency = <0>;
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    26  	};
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    27  
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    28  	audio_clk_b: audio_clk_b {
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    29  		compatible = "fixed-clock";
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    30  		#clock-cells = <0>;
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    31  		clock-frequency = <0>;
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    32  	};
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    33  
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    34  	audio_clk_c: audio_clk_c {
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    35  		compatible = "fixed-clock";
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    36  		#clock-cells = <0>;
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    37  		clock-frequency = <0>;
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    38  	};
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    39  
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    40  	/* External CAN clock - to be overridden by boards that provide it */
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    41  	can_clk: can {
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    42  		compatible = "fixed-clock";
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    43  		#clock-cells = <0>;
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12    44  		clock-frequency = <0>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24    45  	};
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24    46  
7744b393c95ac4 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2021-11-24    47  	cluster0_opp: opp-table-0 {
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    48  		compatible = "operating-points-v2";
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    49  		opp-shared;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    50  
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    51  		opp-500000000 {
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    52  			opp-hz = /bits/ 64 <500000000>;
659b38203f04f5 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2021-04-29    53  			opp-microvolt = <830000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    54  			clock-latency-ns = <300000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    55  		};
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    56  		opp-1000000000 {
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    57  			opp-hz = /bits/ 64 <1000000000>;
659b38203f04f5 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2021-04-29    58  			opp-microvolt = <830000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    59  			clock-latency-ns = <300000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    60  		};
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    61  		opp-1500000000 {
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    62  			opp-hz = /bits/ 64 <1500000000>;
659b38203f04f5 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2021-04-29    63  			opp-microvolt = <830000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    64  			clock-latency-ns = <300000>;
44b615ac9fab16 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2021-05-27    65  			opp-suspend;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    66  		};
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    67  		opp-1600000000 {
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    68  			opp-hz = /bits/ 64 <1600000000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    69  			opp-microvolt = <900000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    70  			clock-latency-ns = <300000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    71  		};
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    72  		opp-1700000000 {
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    73  			opp-hz = /bits/ 64 <1700000000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    74  			opp-microvolt = <900000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    75  			clock-latency-ns = <300000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    76  		};
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    77  		opp-1800000000 {
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    78  			opp-hz = /bits/ 64 <1800000000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    79  			opp-microvolt = <960000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    80  			clock-latency-ns = <300000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    81  			turbo-mode;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    82  		};
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    83  	};
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    84  
7744b393c95ac4 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2021-11-24    85  	cluster1_opp: opp-table-1 {
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    86  		compatible = "operating-points-v2";
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    87  		opp-shared;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    88  
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    89  		opp-800000000 {
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    90  			opp-hz = /bits/ 64 <800000000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    91  			opp-microvolt = <820000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    92  			clock-latency-ns = <300000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    93  		};
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    94  		opp-1000000000 {
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    95  			opp-hz = /bits/ 64 <1000000000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    96  			opp-microvolt = <820000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    97  			clock-latency-ns = <300000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    98  		};
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23    99  		opp-1200000000 {
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   100  			opp-hz = /bits/ 64 <1200000000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   101  			opp-microvolt = <820000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   102  			clock-latency-ns = <300000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   103  		};
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   104  		opp-1300000000 {
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   105  			opp-hz = /bits/ 64 <1300000000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   106  			opp-microvolt = <820000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   107  			clock-latency-ns = <300000>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   108  			turbo-mode;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   109  		};
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   110  	};
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   111  
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   112  	cpus {
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   113  		#address-cells = <1>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   114  		#size-cells = <0>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   115  
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   116  		cpu-map {
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   117  			cluster0 {
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   118  				core0 {
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   119  					cpu = <&a57_0>;
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   120  				};
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   121  				core1 {
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   122  					cpu = <&a57_1>;
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   123  				};
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   124  			};
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   125  
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   126  			cluster1 {
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   127  				core0 {
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   128  					cpu = <&a53_0>;
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   129  				};
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   130  				core1 {
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   131  					cpu = <&a53_1>;
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   132  				};
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   133  				core2 {
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   134  					cpu = <&a53_2>;
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   135  				};
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   136  				core3 {
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   137  					cpu = <&a53_3>;
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   138  				};
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   139  			};
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   140  		};
b380ae0db60391 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   141  
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   142  		a57_0: cpu@0 {
31af04cd60d316 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Rob Herring        2019-01-14   143  			compatible = "arm,cortex-a57";
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   144  			reg = <0x0>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   145  			device_type = "cpu";
56aebae0003f89 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-05-31   146  			power-domains = <&sysc R8A7796_PD_CA57_CPU0>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   147  			next-level-cache = <&L2_CA57>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   148  			enable-method = "psci";
824a88b5671fc8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Khiem Nguyen       2019-01-18   149  			cpu-idle-states = <&CPU_SLEEP_0>;
9fed1b89c0cdc1 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2019-05-23   150  			dynamic-power-coefficient = <854>;
da7e3113344fda arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2018-01-03   151  			clocks = <&cpg CPG_CORE R8A7796_CLK_Z>;
da7e3113344fda arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2018-01-03   152  			operating-points-v2 = <&cluster0_opp>;
2250d856b279d9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   153  			capacity-dmips-mhz = <1024>;
479e5d70a9cee6 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Niklas Söderlund   2018-01-04   154  			#cooling-cells = <2>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   155  		};
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   156  
7328be4a03b10c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2017-03-07   157  		a57_1: cpu@1 {
31af04cd60d316 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Rob Herring        2019-01-14   158  			compatible = "arm,cortex-a57";
7328be4a03b10c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2017-03-07   159  			reg = <0x1>;
7328be4a03b10c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2017-03-07   160  			device_type = "cpu";
7328be4a03b10c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2017-03-07   161  			power-domains = <&sysc R8A7796_PD_CA57_CPU1>;
7328be4a03b10c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2017-03-07   162  			next-level-cache = <&L2_CA57>;
7328be4a03b10c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2017-03-07   163  			enable-method = "psci";
824a88b5671fc8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Khiem Nguyen       2019-01-18   164  			cpu-idle-states = <&CPU_SLEEP_0>;
da7e3113344fda arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2018-01-03   165  			clocks = <&cpg CPG_CORE R8A7796_CLK_Z>;
da7e3113344fda arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2018-01-03   166  			operating-points-v2 = <&cluster0_opp>;
2250d856b279d9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   167  			capacity-dmips-mhz = <1024>;
479e5d70a9cee6 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Niklas Söderlund   2018-01-04   168  			#cooling-cells = <2>;
7328be4a03b10c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2017-03-07   169  		};
7328be4a03b10c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2017-03-07   170  
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   171  		a53_0: cpu@100 {
31af04cd60d316 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Rob Herring        2019-01-14   172  			compatible = "arm,cortex-a53";
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   173  			reg = <0x100>;
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   174  			device_type = "cpu";
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   175  			power-domains = <&sysc R8A7796_PD_CA53_CPU0>;
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   176  			next-level-cache = <&L2_CA53>;
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   177  			enable-method = "psci";
3cbcfececc364d arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2019-01-18   178  			cpu-idle-states = <&CPU_SLEEP_1>;
81022ecd2720a5 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2019-05-23   179  			#cooling-cells = <2>;
9fed1b89c0cdc1 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2019-05-23   180  			dynamic-power-coefficient = <277>;
da7e3113344fda arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2018-01-03   181  			clocks = <&cpg CPG_CORE R8A7796_CLK_Z2>;
da7e3113344fda arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2018-01-03   182  			operating-points-v2 = <&cluster1_opp>;
2250d856b279d9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   183  			capacity-dmips-mhz = <535>;
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   184  		};
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   185  
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   186  		a53_1: cpu@101 {
31af04cd60d316 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Rob Herring        2019-01-14   187  			compatible = "arm,cortex-a53";
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   188  			reg = <0x101>;
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   189  			device_type = "cpu";
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   190  			power-domains = <&sysc R8A7796_PD_CA53_CPU1>;
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   191  			next-level-cache = <&L2_CA53>;
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   192  			enable-method = "psci";
3cbcfececc364d arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2019-01-18   193  			cpu-idle-states = <&CPU_SLEEP_1>;
da7e3113344fda arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2018-01-03   194  			clocks = <&cpg CPG_CORE R8A7796_CLK_Z2>;
da7e3113344fda arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2018-01-03   195  			operating-points-v2 = <&cluster1_opp>;
2250d856b279d9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   196  			capacity-dmips-mhz = <535>;
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   197  		};
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   198  
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   199  		a53_2: cpu@102 {
31af04cd60d316 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Rob Herring        2019-01-14   200  			compatible = "arm,cortex-a53";
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   201  			reg = <0x102>;
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   202  			device_type = "cpu";
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   203  			power-domains = <&sysc R8A7796_PD_CA53_CPU2>;
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   204  			next-level-cache = <&L2_CA53>;
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   205  			enable-method = "psci";
3cbcfececc364d arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2019-01-18   206  			cpu-idle-states = <&CPU_SLEEP_1>;
da7e3113344fda arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2018-01-03   207  			clocks = <&cpg CPG_CORE R8A7796_CLK_Z2>;
da7e3113344fda arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2018-01-03   208  			operating-points-v2 = <&cluster1_opp>;
2250d856b279d9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   209  			capacity-dmips-mhz = <535>;
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   210  		};
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   211  
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   212  		a53_3: cpu@103 {
31af04cd60d316 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Rob Herring        2019-01-14   213  			compatible = "arm,cortex-a53";
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   214  			reg = <0x103>;
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   215  			device_type = "cpu";
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   216  			power-domains = <&sysc R8A7796_PD_CA53_CPU3>;
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   217  			next-level-cache = <&L2_CA53>;
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   218  			enable-method = "psci";
3cbcfececc364d arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2019-01-18   219  			cpu-idle-states = <&CPU_SLEEP_1>;
da7e3113344fda arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2018-01-03   220  			clocks = <&cpg CPG_CORE R8A7796_CLK_Z2>;
da7e3113344fda arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2018-01-03   221  			operating-points-v2 = <&cluster1_opp>;
2250d856b279d9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Gaku Inami         2018-11-08   222  			capacity-dmips-mhz = <535>;
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   223  		};
b4dc3b4b1a65fe arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   224  
57a4fd420c6e8a arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-03   225  		L2_CA57: cache-controller-0 {
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   226  			compatible = "cache";
56aebae0003f89 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-05-31   227  			power-domains = <&sysc R8A7796_PD_CA57_SCU>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   228  			cache-unified;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   229  			cache-level = <2>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   230  		};
a681e6d63285b8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   231  
a681e6d63285b8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   232  		L2_CA53: cache-controller-1 {
a681e6d63285b8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   233  			compatible = "cache";
a681e6d63285b8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   234  			power-domains = <&sysc R8A7796_PD_CA53_SCU>;
a681e6d63285b8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   235  			cache-unified;
a681e6d63285b8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   236  			cache-level = <2>;
a681e6d63285b8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-07   237  		};
824a88b5671fc8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Khiem Nguyen       2019-01-18   238  
824a88b5671fc8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Khiem Nguyen       2019-01-18   239  		idle-states {
824a88b5671fc8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Khiem Nguyen       2019-01-18   240  			entry-method = "psci";
824a88b5671fc8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Khiem Nguyen       2019-01-18   241  
824a88b5671fc8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Khiem Nguyen       2019-01-18   242  			CPU_SLEEP_0: cpu-sleep-0 {
824a88b5671fc8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Khiem Nguyen       2019-01-18   243  				compatible = "arm,idle-state";
824a88b5671fc8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Khiem Nguyen       2019-01-18   244  				arm,psci-suspend-param = <0x0010000>;
824a88b5671fc8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Khiem Nguyen       2019-01-18   245  				local-timer-stop;
824a88b5671fc8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Khiem Nguyen       2019-01-18   246  				entry-latency-us = <400>;
824a88b5671fc8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Khiem Nguyen       2019-01-18   247  				exit-latency-us = <500>;
824a88b5671fc8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Khiem Nguyen       2019-01-18   248  				min-residency-us = <4000>;
824a88b5671fc8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Khiem Nguyen       2019-01-18   249  			};
3cbcfececc364d arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2019-01-18   250  
3cbcfececc364d arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2019-01-18   251  			CPU_SLEEP_1: cpu-sleep-1 {
3cbcfececc364d arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2019-01-18   252  				compatible = "arm,idle-state";
3cbcfececc364d arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2019-01-18   253  				arm,psci-suspend-param = <0x0010000>;
3cbcfececc364d arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2019-01-18   254  				local-timer-stop;
3cbcfececc364d arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2019-01-18   255  				entry-latency-us = <700>;
3cbcfececc364d arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2019-01-18   256  				exit-latency-us = <700>;
3cbcfececc364d arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2019-01-18   257  				min-residency-us = <5000>;
3cbcfececc364d arch/arm64/boot/dts/renesas/r8a7796.dtsi  Dien Pham          2019-01-18   258  			};
824a88b5671fc8 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Khiem Nguyen       2019-01-18   259  		};
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   260  	};
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   261  
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   262  	extal_clk: extal {
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   263  		compatible = "fixed-clock";
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   264  		#clock-cells = <0>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   265  		/* This value must be overridden by the board */
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   266  		clock-frequency = <0>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   267  	};
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   268  
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   269  	extalr_clk: extalr {
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   270  		compatible = "fixed-clock";
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   271  		#clock-cells = <0>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   272  		/* This value must be overridden by the board */
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   273  		clock-frequency = <0>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   274  	};
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   275  
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12   276  	/* External PCIe clock - can be overridden by the board */
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12   277  	pcie_bus_clk: pcie_bus {
bab732f84aac51 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-04-28   278  		compatible = "fixed-clock";
bab732f84aac51 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-04-28   279  		#clock-cells = <0>;
bab732f84aac51 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-04-28   280  		clock-frequency = <0>;
bab732f84aac51 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-04-28   281  	};
bab732f84aac51 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-04-28   282  
9b9b8fd7e7c057 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12   283  	pmu_a53 {
9b9b8fd7e7c057 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12   284  		compatible = "arm,cortex-a53-pmu";
9b9b8fd7e7c057 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12   285  		interrupts-extended = <&gic GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
9b9b8fd7e7c057 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12   286  				      <&gic GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
9b9b8fd7e7c057 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12   287  				      <&gic GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
9b9b8fd7e7c057 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12   288  				      <&gic GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
9b9b8fd7e7c057 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12   289  		interrupt-affinity = <&a53_0>, <&a53_1>, <&a53_2>, <&a53_3>;
9b9b8fd7e7c057 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12   290  	};
9b9b8fd7e7c057 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12   291  
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   292  	pmu_a57 {
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   293  		compatible = "arm,cortex-a57-pmu";
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   294  		interrupts-extended = <&gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   295  				      <&gic GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   296  		interrupt-affinity = <&a57_0>, <&a57_1>;
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   297  	};
6ef5e21294dfd2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   298  
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12   299  	psci {
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12   300  		compatible = "arm,psci-1.0", "arm,psci-0.2";
9d51ffc55dc176 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-12-12   301  		method = "smc";
8a6de045395409 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Chris Paterson     2016-11-24   302  	};
8a6de045395409 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Chris Paterson     2016-11-24   303  
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   304  	/* External SCIF clock - to be overridden by boards that provide it */
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   305  	scif_clk: scif {
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   306  		compatible = "fixed-clock";
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   307  		#clock-cells = <0>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   308  		clock-frequency = <0>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   309  	};
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   310  
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   311  	soc {
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   312  		compatible = "simple-bus";
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   313  		interrupt-parent = <&gic>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   314  		#address-cells = <2>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   315  		#size-cells = <2>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   316  		ranges;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   317  
0b65a9ad25b3f6 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2018-07-11   318  		rwdt: watchdog@e6020000 {
c8ce8007e5c067 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-06-27   319  			compatible = "renesas,r8a7796-wdt",
c8ce8007e5c067 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-06-27   320  				     "renesas,rcar-gen3-wdt";
c8ce8007e5c067 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-06-27   321  			reg = <0 0xe6020000 0 0x0c>;
2bc0aa18ee9f34 arch/arm64/boot/dts/renesas/r8a77960.dtsi Wolfram Sang       2022-03-22   322  			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
c8ce8007e5c067 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-06-27   323  			clocks = <&cpg CPG_MOD 402>;
c8ce8007e5c067 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-06-27   324  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   325  			resets = <&cpg 402>;
c8ce8007e5c067 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-06-27   326  			status = "disabled";
c8ce8007e5c067 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-06-27   327  		};
c8ce8007e5c067 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-06-27   328  
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   329  		gpio0: gpio@e6050000 {
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   330  			compatible = "renesas,gpio-r8a7796",
c8ee880415894e arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-10-13   331  				     "renesas,rcar-gen3-gpio";
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   332  			reg = <0 0xe6050000 0 0x50>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   333  			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   334  			#gpio-cells = <2>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   335  			gpio-controller;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   336  			gpio-ranges = <&pfc 0 0 16>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   337  			#interrupt-cells = <2>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   338  			interrupt-controller;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   339  			clocks = <&cpg CPG_MOD 912>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   340  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   341  			resets = <&cpg 912>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   342  		};
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   343  
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   344  		gpio1: gpio@e6051000 {
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   345  			compatible = "renesas,gpio-r8a7796",
c8ee880415894e arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-10-13   346  				     "renesas,rcar-gen3-gpio";
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   347  			reg = <0 0xe6051000 0 0x50>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   348  			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   349  			#gpio-cells = <2>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   350  			gpio-controller;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   351  			gpio-ranges = <&pfc 0 32 29>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   352  			#interrupt-cells = <2>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   353  			interrupt-controller;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   354  			clocks = <&cpg CPG_MOD 911>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   355  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   356  			resets = <&cpg 911>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   357  		};
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   358  
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   359  		gpio2: gpio@e6052000 {
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   360  			compatible = "renesas,gpio-r8a7796",
c8ee880415894e arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-10-13   361  				     "renesas,rcar-gen3-gpio";
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   362  			reg = <0 0xe6052000 0 0x50>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   363  			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   364  			#gpio-cells = <2>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   365  			gpio-controller;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   366  			gpio-ranges = <&pfc 0 64 15>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   367  			#interrupt-cells = <2>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   368  			interrupt-controller;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   369  			clocks = <&cpg CPG_MOD 910>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   370  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   371  			resets = <&cpg 910>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   372  		};
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   373  
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   374  		gpio3: gpio@e6053000 {
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   375  			compatible = "renesas,gpio-r8a7796",
c8ee880415894e arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-10-13   376  				     "renesas,rcar-gen3-gpio";
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   377  			reg = <0 0xe6053000 0 0x50>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   378  			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   379  			#gpio-cells = <2>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   380  			gpio-controller;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   381  			gpio-ranges = <&pfc 0 96 16>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   382  			#interrupt-cells = <2>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   383  			interrupt-controller;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   384  			clocks = <&cpg CPG_MOD 909>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   385  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   386  			resets = <&cpg 909>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   387  		};
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   388  
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   389  		gpio4: gpio@e6054000 {
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   390  			compatible = "renesas,gpio-r8a7796",
c8ee880415894e arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-10-13   391  				     "renesas,rcar-gen3-gpio";
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   392  			reg = <0 0xe6054000 0 0x50>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   393  			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   394  			#gpio-cells = <2>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   395  			gpio-controller;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   396  			gpio-ranges = <&pfc 0 128 18>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   397  			#interrupt-cells = <2>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   398  			interrupt-controller;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   399  			clocks = <&cpg CPG_MOD 908>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   400  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   401  			resets = <&cpg 908>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   402  		};
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   403  
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   404  		gpio5: gpio@e6055000 {
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   405  			compatible = "renesas,gpio-r8a7796",
c8ee880415894e arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-10-13   406  				     "renesas,rcar-gen3-gpio";
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   407  			reg = <0 0xe6055000 0 0x50>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   408  			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   409  			#gpio-cells = <2>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   410  			gpio-controller;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   411  			gpio-ranges = <&pfc 0 160 26>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   412  			#interrupt-cells = <2>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   413  			interrupt-controller;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   414  			clocks = <&cpg CPG_MOD 907>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   415  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   416  			resets = <&cpg 907>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   417  		};
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   418  
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   419  		gpio6: gpio@e6055400 {
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   420  			compatible = "renesas,gpio-r8a7796",
c8ee880415894e arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-10-13   421  				     "renesas,rcar-gen3-gpio";
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   422  			reg = <0 0xe6055400 0 0x50>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   423  			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   424  			#gpio-cells = <2>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   425  			gpio-controller;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   426  			gpio-ranges = <&pfc 0 192 32>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   427  			#interrupt-cells = <2>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   428  			interrupt-controller;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   429  			clocks = <&cpg CPG_MOD 906>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   430  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   431  			resets = <&cpg 906>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   432  		};
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   433  
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   434  		gpio7: gpio@e6055800 {
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   435  			compatible = "renesas,gpio-r8a7796",
c8ee880415894e arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2017-10-13   436  				     "renesas,rcar-gen3-gpio";
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   437  			reg = <0 0xe6055800 0 0x50>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   438  			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   439  			#gpio-cells = <2>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   440  			gpio-controller;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   441  			gpio-ranges = <&pfc 0 224 4>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   442  			#interrupt-cells = <2>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   443  			interrupt-controller;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   444  			clocks = <&cpg CPG_MOD 905>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   445  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   446  			resets = <&cpg 905>;
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   447  		};
fa765e5ef49d57 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-17   448  
a2053990f3275e arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2020-08-21   449  		pfc: pinctrl@e6060000 {
50809470486ae2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-18   450  			compatible = "renesas,pfc-r8a7796";
50809470486ae2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-18   451  			reg = <0 0xe6060000 0 0x50c>;
50809470486ae2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-18   452  		};
50809470486ae2 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Takeshi Kihara     2016-08-18   453  
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   454  		cmt0: timer@e60f0000 {
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   455  			compatible = "renesas,r8a7796-cmt0",
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   456  				     "renesas,rcar-gen3-cmt0";
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   457  			reg = <0 0xe60f0000 0 0x1004>;
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   458  			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   459  				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   460  			clocks = <&cpg CPG_MOD 303>;
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   461  			clock-names = "fck";
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   462  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   463  			resets = <&cpg 303>;
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   464  			status = "disabled";
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   465  		};
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   466  
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   467  		cmt1: timer@e6130000 {
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   468  			compatible = "renesas,r8a7796-cmt1",
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   469  				     "renesas,rcar-gen3-cmt1";
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   470  			reg = <0 0xe6130000 0 0x1004>;
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   471  			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   472  				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   473  				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   474  				     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   475  				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   476  				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   477  				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   478  				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   479  			clocks = <&cpg CPG_MOD 302>;
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   480  			clock-names = "fck";
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   481  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   482  			resets = <&cpg 302>;
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   483  			status = "disabled";
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   484  		};
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   485  
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   486  		cmt2: timer@e6140000 {
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   487  			compatible = "renesas,r8a7796-cmt1",
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   488  				     "renesas,rcar-gen3-cmt1";
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   489  			reg = <0 0xe6140000 0 0x1004>;
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   490  			interrupts = <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   491  				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   492  				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   493  				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   494  				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   495  				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   496  				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   497  				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>;
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   498  			clocks = <&cpg CPG_MOD 301>;
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   499  			clock-names = "fck";
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   500  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   501  			resets = <&cpg 301>;
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   502  			status = "disabled";
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   503  		};
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   504  
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   505  		cmt3: timer@e6148000 {
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   506  			compatible = "renesas,r8a7796-cmt1",
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   507  				     "renesas,rcar-gen3-cmt1";
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   508  			reg = <0 0xe6148000 0 0x1004>;
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   509  			interrupts = <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   510  				     <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   511  				     <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   512  				     <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   513  				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   514  				     <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   515  				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   516  				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>;
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   517  			clocks = <&cpg CPG_MOD 300>;
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   518  			clock-names = "fck";
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   519  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   520  			resets = <&cpg 300>;
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   521  			status = "disabled";
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   522  		};
8942ce2bfaa162 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Biju Das           2018-10-26   523  
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   524  		cpg: clock-controller@e6150000 {
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   525  			compatible = "renesas,r8a7796-cpg-mssr";
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   526  			reg = <0 0xe6150000 0 0x1000>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   527  			clocks = <&extal_clk>, <&extalr_clk>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   528  			clock-names = "extal", "extalr";
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   529  			#clock-cells = <2>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   530  			#power-domain-cells = <0>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   531  			#reset-cells = <1>;
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   532  		};
1561f20760ec96 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-05-24   533  
65f922c78f9693 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-05-27   534  		rst: reset-controller@e6160000 {
65f922c78f9693 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-05-27   535  			compatible = "renesas,r8a7796-rst";
65f922c78f9693 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-05-27   536  			reg = <0 0xe6160000 0 0x0200>;
65f922c78f9693 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-05-27   537  		};
65f922c78f9693 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-05-27   538  
56aebae0003f89 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-05-31   539  		sysc: system-controller@e6180000 {
56aebae0003f89 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-05-31   540  			compatible = "renesas,r8a7796-sysc";
56aebae0003f89 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-05-31   541  			reg = <0 0xe6180000 0 0x0400>;
56aebae0003f89 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-05-31   542  			#power-domain-cells = <1>;
56aebae0003f89 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-05-31   543  		};
56aebae0003f89 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-05-31   544  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   545  		tsc: thermal@e6198000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   546  			compatible = "renesas,r8a7796-thermal";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   547  			reg = <0 0xe6198000 0 0x100>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   548  			      <0 0xe61a0000 0 0x100>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   549  			      <0 0xe61a8000 0 0x100>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   550  			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   551  				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   552  				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   553  			clocks = <&cpg CPG_MOD 522>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   554  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   555  			resets = <&cpg 522>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   556  			#thermal-sensor-cells = <1>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   557  		};
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   558  
fdceea3c2ade76 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-10-06   559  		intc_ex: interrupt-controller@e61c0000 {
fdceea3c2ade76 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-10-06   560  			compatible = "renesas,intc-ex-r8a7796", "renesas,irqc";
fdceea3c2ade76 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-10-06   561  			#interrupt-cells = <2>;
fdceea3c2ade76 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-10-06   562  			interrupt-controller;
fdceea3c2ade76 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-10-06   563  			reg = <0 0xe61c0000 0 0x200>;
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   564  			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   565  				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   566  				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   567  				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   568  				     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   569  				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
fdceea3c2ade76 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-10-06   570  			clocks = <&cpg CPG_MOD 407>;
fdceea3c2ade76 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-10-06   571  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
fdceea3c2ade76 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-10-06   572  			resets = <&cpg 407>;
fdceea3c2ade76 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-10-06   573  		};
fdceea3c2ade76 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-10-06   574  
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   575  		tmu0: timer@e61e0000 {
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   576  			compatible = "renesas,tmu-r8a7796", "renesas,tmu";
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   577  			reg = <0 0xe61e0000 0 0x30>;
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   578  			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   579  				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   580  				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
c53866cb27fb3a arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2024-01-15   581  			interrupt-names = "tuni0", "tuni1", "tuni2";
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   582  			clocks = <&cpg CPG_MOD 125>;
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   583  			clock-names = "fck";
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   584  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   585  			resets = <&cpg 125>;
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   586  			status = "disabled";
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   587  		};
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   588  
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   589  		tmu1: timer@e6fc0000 {
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   590  			compatible = "renesas,tmu-r8a7796", "renesas,tmu";
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   591  			reg = <0 0xe6fc0000 0 0x30>;
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   592  			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   593  				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
c53866cb27fb3a arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2024-01-15   594  				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
c53866cb27fb3a arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2024-01-15   595  				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
c53866cb27fb3a arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2024-01-15   596  			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   597  			clocks = <&cpg CPG_MOD 124>;
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   598  			clock-names = "fck";
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   599  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   600  			resets = <&cpg 124>;
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   601  			status = "disabled";
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   602  		};
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   603  
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   604  		tmu2: timer@e6fd0000 {
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   605  			compatible = "renesas,tmu-r8a7796", "renesas,tmu";
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   606  			reg = <0 0xe6fd0000 0 0x30>;
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   607  			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   608  				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
c53866cb27fb3a arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2024-01-15   609  				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
c53866cb27fb3a arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2024-01-15   610  				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
c53866cb27fb3a arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2024-01-15   611  			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   612  			clocks = <&cpg CPG_MOD 123>;
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   613  			clock-names = "fck";
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   614  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   615  			resets = <&cpg 123>;
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   616  			status = "disabled";
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   617  		};
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   618  
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   619  		tmu3: timer@e6fe0000 {
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   620  			compatible = "renesas,tmu-r8a7796", "renesas,tmu";
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   621  			reg = <0 0xe6fe0000 0 0x30>;
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   622  			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   623  				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   624  				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
c53866cb27fb3a arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2024-01-15   625  			interrupt-names = "tuni0", "tuni1", "tuni2";
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   626  			clocks = <&cpg CPG_MOD 122>;
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   627  			clock-names = "fck";
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   628  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   629  			resets = <&cpg 122>;
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   630  			status = "disabled";
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   631  		};
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   632  
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   633  		tmu4: timer@ffc00000 {
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   634  			compatible = "renesas,tmu-r8a7796", "renesas,tmu";
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   635  			reg = <0 0xffc00000 0 0x30>;
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   636  			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   637  				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   638  				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
c53866cb27fb3a arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2024-01-15   639  			interrupt-names = "tuni0", "tuni1", "tuni2";
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   640  			clocks = <&cpg CPG_MOD 121>;
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   641  			clock-names = "fck";
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   642  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   643  			resets = <&cpg 121>;
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   644  			status = "disabled";
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   645  		};
4e4c17c6c3907d arch/arm64/boot/dts/renesas/r8a77960.dtsi Niklas Söderlund   2020-12-10   646  
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   647  		i2c0: i2c@e6500000 {
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   648  			#address-cells = <1>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   649  			#size-cells = <0>;
5553e219622950 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-12-13   650  			compatible = "renesas,i2c-r8a7796",
5553e219622950 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-12-13   651  				     "renesas,rcar-gen3-i2c";
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   652  			reg = <0 0xe6500000 0 0x40>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   653  			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   654  			clocks = <&cpg CPG_MOD 931>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   655  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   656  			resets = <&cpg 931>;
c758f4e333ee74 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   657  			dmas = <&dmac1 0x91>, <&dmac1 0x90>,
c758f4e333ee74 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   658  			       <&dmac2 0x91>, <&dmac2 0x90>;
c758f4e333ee74 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   659  			dma-names = "tx", "rx", "tx", "rx";
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   660  			i2c-scl-internal-delay-ns = <110>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   661  			status = "disabled";
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   662  		};
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   663  
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   664  		i2c1: i2c@e6508000 {
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   665  			#address-cells = <1>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   666  			#size-cells = <0>;
5553e219622950 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-12-13   667  			compatible = "renesas,i2c-r8a7796",
5553e219622950 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-12-13   668  				     "renesas,rcar-gen3-i2c";
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   669  			reg = <0 0xe6508000 0 0x40>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   670  			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   671  			clocks = <&cpg CPG_MOD 930>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   672  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   673  			resets = <&cpg 930>;
c758f4e333ee74 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   674  			dmas = <&dmac1 0x93>, <&dmac1 0x92>,
c758f4e333ee74 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   675  			       <&dmac2 0x93>, <&dmac2 0x92>;
c758f4e333ee74 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   676  			dma-names = "tx", "rx", "tx", "rx";
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   677  			i2c-scl-internal-delay-ns = <6>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   678  			status = "disabled";
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   679  		};
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   680  
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   681  		i2c2: i2c@e6510000 {
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   682  			#address-cells = <1>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   683  			#size-cells = <0>;
5553e219622950 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-12-13   684  			compatible = "renesas,i2c-r8a7796",
5553e219622950 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-12-13   685  				     "renesas,rcar-gen3-i2c";
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   686  			reg = <0 0xe6510000 0 0x40>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   687  			interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   688  			clocks = <&cpg CPG_MOD 929>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   689  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   690  			resets = <&cpg 929>;
c758f4e333ee74 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   691  			dmas = <&dmac1 0x95>, <&dmac1 0x94>,
c758f4e333ee74 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   692  			       <&dmac2 0x95>, <&dmac2 0x94>;
c758f4e333ee74 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   693  			dma-names = "tx", "rx", "tx", "rx";
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   694  			i2c-scl-internal-delay-ns = <6>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   695  			status = "disabled";
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   696  		};
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   697  
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   698  		i2c3: i2c@e66d0000 {
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   699  			#address-cells = <1>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   700  			#size-cells = <0>;
5553e219622950 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-12-13   701  			compatible = "renesas,i2c-r8a7796",
5553e219622950 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-12-13   702  				     "renesas,rcar-gen3-i2c";
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   703  			reg = <0 0xe66d0000 0 0x40>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   704  			interrupts = <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   705  			clocks = <&cpg CPG_MOD 928>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   706  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   707  			resets = <&cpg 928>;
c758f4e333ee74 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   708  			dmas = <&dmac0 0x97>, <&dmac0 0x96>;
c758f4e333ee74 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   709  			dma-names = "tx", "rx";
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   710  			i2c-scl-internal-delay-ns = <110>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   711  			status = "disabled";
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   712  		};
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   713  
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   714  		i2c4: i2c@e66d8000 {
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   715  			#address-cells = <1>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   716  			#size-cells = <0>;
5553e219622950 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-12-13   717  			compatible = "renesas,i2c-r8a7796",
5553e219622950 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-12-13   718  				     "renesas,rcar-gen3-i2c";
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   719  			reg = <0 0xe66d8000 0 0x40>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   720  			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   721  			clocks = <&cpg CPG_MOD 927>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   722  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   723  			resets = <&cpg 927>;
c758f4e333ee74 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   724  			dmas = <&dmac0 0x99>, <&dmac0 0x98>;
c758f4e333ee74 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   725  			dma-names = "tx", "rx";
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   726  			i2c-scl-internal-delay-ns = <110>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   727  			status = "disabled";
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   728  		};
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   729  
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   730  		i2c5: i2c@e66e0000 {
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   731  			#address-cells = <1>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   732  			#size-cells = <0>;
5553e219622950 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-12-13   733  			compatible = "renesas,i2c-r8a7796",
5553e219622950 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-12-13   734  				     "renesas,rcar-gen3-i2c";
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   735  			reg = <0 0xe66e0000 0 0x40>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   736  			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   737  			clocks = <&cpg CPG_MOD 919>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   738  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   739  			resets = <&cpg 919>;
c758f4e333ee74 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   740  			dmas = <&dmac0 0x9b>, <&dmac0 0x9a>;
c758f4e333ee74 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   741  			dma-names = "tx", "rx";
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   742  			i2c-scl-internal-delay-ns = <110>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   743  			status = "disabled";
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   744  		};
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   745  
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   746  		i2c6: i2c@e66e8000 {
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   747  			#address-cells = <1>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   748  			#size-cells = <0>;
5553e219622950 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-12-13   749  			compatible = "renesas,i2c-r8a7796",
5553e219622950 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2016-12-13   750  				     "renesas,rcar-gen3-i2c";
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   751  			reg = <0 0xe66e8000 0 0x40>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   752  			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   753  			clocks = <&cpg CPG_MOD 918>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   754  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   755  			resets = <&cpg 918>;
c758f4e333ee74 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   756  			dmas = <&dmac0 0x9d>, <&dmac0 0x9c>;
c758f4e333ee74 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   757  			dma-names = "tx", "rx";
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   758  			i2c-scl-internal-delay-ns = <6>;
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   759  			status = "disabled";
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   760  		};
fcb008a75702c9 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-10-26   761  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   762  		i2c_dvfs: i2c@e60b0000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   763  			#address-cells = <1>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   764  			#size-cells = <0>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   765  			compatible = "renesas,iic-r8a7796",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   766  				     "renesas,rcar-gen3-iic",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   767  				     "renesas,rmobile-iic";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   768  			reg = <0 0xe60b0000 0 0x425>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   769  			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   770  			clocks = <&cpg CPG_MOD 926>;
909c1625241515 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Chris Paterson     2016-11-24   771  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   772  			resets = <&cpg 926>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   773  			dmas = <&dmac0 0x11>, <&dmac0 0x10>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   774  			dma-names = "tx", "rx";
7e1c23b94ed7f0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-01-25   775  			status = "disabled";
8e8b9eaef8fb05 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Laurent Pinchart   2016-09-06   776  		};
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   777  
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   778  		hscif0: serial@e6540000 {
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   779  			compatible = "renesas,hscif-r8a7796",
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   780  				     "renesas,rcar-gen3-hscif",
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   781  				     "renesas,hscif";
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   782  			reg = <0 0xe6540000 0 0x60>;
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   783  			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   784  			clocks = <&cpg CPG_MOD 520>,
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   785  				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   786  				 <&scif_clk>;
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   787  			clock-names = "fck", "brg_int", "scif_clk";
6d50bb8935042c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   788  			dmas = <&dmac1 0x31>, <&dmac1 0x30>,
6d50bb8935042c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   789  			       <&dmac2 0x31>, <&dmac2 0x30>;
6d50bb8935042c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   790  			dma-names = "tx", "rx", "tx", "rx";
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   791  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   792  			resets = <&cpg 520>;
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   793  			status = "disabled";
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   794  		};
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   795  
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   796  		hscif1: serial@e6550000 {
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   797  			compatible = "renesas,hscif-r8a7796",
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   798  				     "renesas,rcar-gen3-hscif",
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   799  				     "renesas,hscif";
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   800  			reg = <0 0xe6550000 0 0x60>;
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   801  			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   802  			clocks = <&cpg CPG_MOD 519>,
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   803  				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   804  				 <&scif_clk>;
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   805  			clock-names = "fck", "brg_int", "scif_clk";
6d50bb8935042c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   806  			dmas = <&dmac1 0x33>, <&dmac1 0x32>,
6d50bb8935042c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   807  			       <&dmac2 0x33>, <&dmac2 0x32>;
6d50bb8935042c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   808  			dma-names = "tx", "rx", "tx", "rx";
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   809  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   810  			resets = <&cpg 519>;
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   811  			status = "disabled";
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   812  		};
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   813  
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   814  		hscif2: serial@e6560000 {
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   815  			compatible = "renesas,hscif-r8a7796",
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   816  				     "renesas,rcar-gen3-hscif",
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   817  				     "renesas,hscif";
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   818  			reg = <0 0xe6560000 0 0x60>;
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   819  			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   820  			clocks = <&cpg CPG_MOD 518>,
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   821  				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   822  				 <&scif_clk>;
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   823  			clock-names = "fck", "brg_int", "scif_clk";
6d50bb8935042c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   824  			dmas = <&dmac1 0x35>, <&dmac1 0x34>,
6d50bb8935042c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   825  			       <&dmac2 0x35>, <&dmac2 0x34>;
6d50bb8935042c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   826  			dma-names = "tx", "rx", "tx", "rx";
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   827  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   828  			resets = <&cpg 518>;
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   829  			status = "disabled";
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   830  		};
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   831  
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   832  		hscif3: serial@e66a0000 {
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   833  			compatible = "renesas,hscif-r8a7796",
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   834  				     "renesas,rcar-gen3-hscif",
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   835  				     "renesas,hscif";
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   836  			reg = <0 0xe66a0000 0 0x60>;
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   837  			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   838  			clocks = <&cpg CPG_MOD 517>,
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   839  				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   840  				 <&scif_clk>;
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   841  			clock-names = "fck", "brg_int", "scif_clk";
6d50bb8935042c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   842  			dmas = <&dmac0 0x37>, <&dmac0 0x36>;
6d50bb8935042c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   843  			dma-names = "tx", "rx";
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   844  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   845  			resets = <&cpg 517>;
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   846  			status = "disabled";
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   847  		};
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   848  
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   849  		hscif4: serial@e66b0000 {
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   850  			compatible = "renesas,hscif-r8a7796",
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   851  				     "renesas,rcar-gen3-hscif",
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   852  				     "renesas,hscif";
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   853  			reg = <0 0xe66b0000 0 0x60>;
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   854  			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   855  			clocks = <&cpg CPG_MOD 516>,
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   856  				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   857  				 <&scif_clk>;
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   858  			clock-names = "fck", "brg_int", "scif_clk";
6d50bb8935042c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   859  			dmas = <&dmac0 0x39>, <&dmac0 0x38>;
6d50bb8935042c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   860  			dma-names = "tx", "rx";
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   861  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   862  			resets = <&cpg 516>;
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   863  			status = "disabled";
68cd161072605c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   864  		};
8e8b9eaef8fb05 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Laurent Pinchart   2016-09-06   865  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   866  		hsusb: usb@e6590000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   867  			compatible = "renesas,usbhs-r8a7796",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   868  				     "renesas,rcar-gen3-usbhs";
e67898dc2d2b4b arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2018-10-16   869  			reg = <0 0xe6590000 0 0x200>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   870  			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
737e05bf034e9c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2018-09-21   871  			clocks = <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   872  			dmas = <&usb_dmac0 0>, <&usb_dmac0 1>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   873  			       <&usb_dmac1 0>, <&usb_dmac1 1>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   874  			dma-names = "ch0", "ch1", "ch2", "ch3";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   875  			renesas,buswait = <11>;
7794bd7ed709ab arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2019-05-23   876  			phys = <&usb2_phy0 3>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   877  			phy-names = "usb";
19d76f3ec8fc6f arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   878  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
737e05bf034e9c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2018-09-21   879  			resets = <&cpg 704>, <&cpg 703>;
19d76f3ec8fc6f arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   880  			status = "disabled";
19d76f3ec8fc6f arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   881  		};
19d76f3ec8fc6f arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   882  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   883  		usb_dmac0: dma-controller@e65a0000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   884  			compatible = "renesas,r8a7796-usb-dmac",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   885  				     "renesas,usb-dmac";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   886  			reg = <0 0xe65a0000 0 0x100>;
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   887  			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   888  				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   889  			interrupt-names = "ch0", "ch1";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   890  			clocks = <&cpg CPG_MOD 330>;
19d76f3ec8fc6f arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   891  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   892  			resets = <&cpg 330>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   893  			#dma-cells = <1>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   894  			dma-channels = <2>;
19d76f3ec8fc6f arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   895  		};
19d76f3ec8fc6f arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-12-07   896  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   897  		usb_dmac1: dma-controller@e65b0000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   898  			compatible = "renesas,r8a7796-usb-dmac",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   899  				     "renesas,usb-dmac";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   900  			reg = <0 0xe65b0000 0 0x100>;
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   901  			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   902  				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   903  			interrupt-names = "ch0", "ch1";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   904  			clocks = <&cpg CPG_MOD 331>;
80fab06e258da7 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-11-21   905  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   906  			resets = <&cpg 331>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   907  			#dma-cells = <1>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   908  			dma-channels = <2>;
80fab06e258da7 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-11-21   909  		};
80fab06e258da7 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-11-21   910  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   911  		usb3_phy0: usb-phy@e65ee000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   912  			compatible = "renesas,r8a7796-usb3-phy",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   913  				     "renesas,rcar-gen3-usb3-phy";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   914  			reg = <0 0xe65ee000 0 0x90>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   915  			clocks = <&cpg CPG_MOD 328>, <&usb3s0_clk>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   916  				 <&usb_extal_clk>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   917  			clock-names = "usb3-if", "usb3s_clk", "usb_extal";
80fab06e258da7 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-11-21   918  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   919  			resets = <&cpg 328>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23   920  			#phy-cells = <0>;
80fab06e258da7 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-11-21   921  			status = "disabled";
80fab06e258da7 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-11-21   922  		};
80fab06e258da7 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2016-11-21   923  
a582013b7b1a6f arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2020-01-24   924  		arm_cc630p: crypto@e6601000 {
a582013b7b1a6f arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2020-01-24   925  			compatible = "arm,cryptocell-630p-ree";
a582013b7b1a6f arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2020-01-24   926  			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
a582013b7b1a6f arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2020-01-24   927  			reg = <0x0 0xe6601000 0 0x1000>;
a582013b7b1a6f arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2020-01-24   928  			clocks = <&cpg CPG_MOD 229>;
a582013b7b1a6f arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2020-01-24   929  			resets = <&cpg 229>;
a582013b7b1a6f arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2020-01-24   930  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
a582013b7b1a6f arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2020-01-24   931  		};
a582013b7b1a6f arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2020-01-24   932  
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   933  		dmac0: dma-controller@e6700000 {
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   934  			compatible = "renesas,dmac-r8a7796",
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   935  				     "renesas,rcar-dmac";
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   936  			reg = <0 0xe6700000 0 0x10000>;
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   937  			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   938  				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   939  				     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   940  				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   941  				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   942  				     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   943  				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   944  				     <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   945  				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   946  				     <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   947  				     <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   948  				     <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   949  				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   950  				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   951  				     <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   952  				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   953  				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   954  			interrupt-names = "error",
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   955  					"ch0", "ch1", "ch2", "ch3",
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   956  					"ch4", "ch5", "ch6", "ch7",
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   957  					"ch8", "ch9", "ch10", "ch11",
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   958  					"ch12", "ch13", "ch14", "ch15";
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   959  			clocks = <&cpg CPG_MOD 219>;
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   960  			clock-names = "fck";
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   961  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16   962  			resets = <&cpg 219>;
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   963  			#dma-cells = <1>;
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   964  			dma-channels = <16>;
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10   965  			iommus = <&ipmmu_ds0 0>, <&ipmmu_ds0 1>,
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10   966  			       <&ipmmu_ds0 2>, <&ipmmu_ds0 3>,
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10   967  			       <&ipmmu_ds0 4>, <&ipmmu_ds0 5>,
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10   968  			       <&ipmmu_ds0 6>, <&ipmmu_ds0 7>,
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10   969  			       <&ipmmu_ds0 8>, <&ipmmu_ds0 9>,
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10   970  			       <&ipmmu_ds0 10>, <&ipmmu_ds0 11>,
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10   971  			       <&ipmmu_ds0 12>, <&ipmmu_ds0 13>,
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10   972  			       <&ipmmu_ds0 14>, <&ipmmu_ds0 15>;
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   973  		};
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   974  
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   975  		dmac1: dma-controller@e7300000 {
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   976  			compatible = "renesas,dmac-r8a7796",
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   977  				     "renesas,rcar-dmac";
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   978  			reg = <0 0xe7300000 0 0x10000>;
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   979  			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   980  				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   981  				     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   982  				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   983  				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   984  				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   985  				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   986  				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   987  				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   988  				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   989  				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   990  				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   991  				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   992  				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   993  				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   994  				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13   995  				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   996  			interrupt-names = "error",
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   997  					"ch0", "ch1", "ch2", "ch3",
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   998  					"ch4", "ch5", "ch6", "ch7",
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14   999  					"ch8", "ch9", "ch10", "ch11",
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1000  					"ch12", "ch13", "ch14", "ch15";
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1001  			clocks = <&cpg CPG_MOD 218>;
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1002  			clock-names = "fck";
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1003  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16  1004  			resets = <&cpg 218>;
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1005  			#dma-cells = <1>;
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1006  			dma-channels = <16>;
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10  1007  			iommus = <&ipmmu_ds1 0>, <&ipmmu_ds1 1>,
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10  1008  			       <&ipmmu_ds1 2>, <&ipmmu_ds1 3>,
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10  1009  			       <&ipmmu_ds1 4>, <&ipmmu_ds1 5>,
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10  1010  			       <&ipmmu_ds1 6>, <&ipmmu_ds1 7>,
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10  1011  			       <&ipmmu_ds1 8>, <&ipmmu_ds1 9>,
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10  1012  			       <&ipmmu_ds1 10>, <&ipmmu_ds1 11>,
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10  1013  			       <&ipmmu_ds1 12>, <&ipmmu_ds1 13>,
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10  1014  			       <&ipmmu_ds1 14>, <&ipmmu_ds1 15>;
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1015  		};
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1016  
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1017  		dmac2: dma-controller@e7310000 {
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1018  			compatible = "renesas,dmac-r8a7796",
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1019  				     "renesas,rcar-dmac";
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1020  			reg = <0 0xe7310000 0 0x10000>;
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13  1021  			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13  1022  				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13  1023  				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13  1024  				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13  1025  				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13  1026  				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13  1027  				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13  1028  				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13  1029  				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13  1030  				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13  1031  				     <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13  1032  				     <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13  1033  				     <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13  1034  				     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13  1035  				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13  1036  				     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
0aab5b914b4160 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2019-12-13  1037  				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>;
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1038  			interrupt-names = "error",
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1039  					"ch0", "ch1", "ch2", "ch3",
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1040  					"ch4", "ch5", "ch6", "ch7",
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1041  					"ch8", "ch9", "ch10", "ch11",
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1042  					"ch12", "ch13", "ch14", "ch15";
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1043  			clocks = <&cpg CPG_MOD 217>;
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1044  			clock-names = "fck";
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1045  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bec0948e810fff arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-03-16  1046  			resets = <&cpg 217>;
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1047  			#dma-cells = <1>;
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1048  			dma-channels = <16>;
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10  1049  			iommus = <&ipmmu_ds1 16>, <&ipmmu_ds1 17>,
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10  1050  			       <&ipmmu_ds1 18>, <&ipmmu_ds1 19>,
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10  1051  			       <&ipmmu_ds1 20>, <&ipmmu_ds1 21>,
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10  1052  			       <&ipmmu_ds1 22>, <&ipmmu_ds1 23>,
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10  1053  			       <&ipmmu_ds1 24>, <&ipmmu_ds1 25>,
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10  1054  			       <&ipmmu_ds1 26>, <&ipmmu_ds1 27>,
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10  1055  			       <&ipmmu_ds1 28>, <&ipmmu_ds1 29>,
24120522e6ebd3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Magnus Damm        2017-11-10  1056  			       <&ipmmu_ds1 30>, <&ipmmu_ds1 31>;
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1057  		};
935085209343a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Ulrich Hecht       2016-09-14  1058  
cf8ae446bbcbf5 arch/arm64/boot/dts/renesas/r8a77960.dtsi Yoshihiro Shimoda  2020-04-21  1059  		ipmmu_ds0: iommu@e6740000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1060  			compatible = "renesas,ipmmu-r8a7796";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1061  			reg = <0 0xe6740000 0 0x1000>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1062  			renesas,ipmmu-main = <&ipmmu_mm 0>;
c7176fe76bff31 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Kuninori Morimoto  2017-05-12  1063  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1064  			#iommu-cells = <1>;
c7176fe76bff31 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Kuninori Morimoto  2017-05-12  1065  		};
c7176fe76bff31 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Kuninori Morimoto  2017-05-12  1066  
cf8ae446bbcbf5 arch/arm64/boot/dts/renesas/r8a77960.dtsi Yoshihiro Shimoda  2020-04-21  1067  		ipmmu_ds1: iommu@e7740000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1068  			compatible = "renesas,ipmmu-r8a7796";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1069  			reg = <0 0xe7740000 0 0x1000>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1070  			renesas,ipmmu-main = <&ipmmu_mm 1>;
c7176fe76bff31 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Kuninori Morimoto  2017-05-12  1071  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1072  			#iommu-cells = <1>;
c7176fe76bff31 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Kuninori Morimoto  2017-05-12  1073  		};
c7176fe76bff31 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Kuninori Morimoto  2017-05-12  1074  
cf8ae446bbcbf5 arch/arm64/boot/dts/renesas/r8a77960.dtsi Yoshihiro Shimoda  2020-04-21  1075  		ipmmu_hc: iommu@e6570000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1076  			compatible = "renesas,ipmmu-r8a7796";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1077  			reg = <0 0xe6570000 0 0x1000>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1078  			renesas,ipmmu-main = <&ipmmu_mm 2>;
834bda65b70fb1 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-08-03  1079  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1080  			#iommu-cells = <1>;
834bda65b70fb1 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-08-03  1081  		};
834bda65b70fb1 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-08-03  1082  
cf8ae446bbcbf5 arch/arm64/boot/dts/renesas/r8a77960.dtsi Yoshihiro Shimoda  2020-04-21  1083  		ipmmu_ir: iommu@ff8b0000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1084  			compatible = "renesas,ipmmu-r8a7796";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1085  			reg = <0 0xff8b0000 0 0x1000>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1086  			renesas,ipmmu-main = <&ipmmu_mm 3>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1087  			power-domains = <&sysc R8A7796_PD_A3IR>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1088  			#iommu-cells = <1>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1089  		};
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1090  
cf8ae446bbcbf5 arch/arm64/boot/dts/renesas/r8a77960.dtsi Yoshihiro Shimoda  2020-04-21  1091  		ipmmu_mm: iommu@e67b0000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1092  			compatible = "renesas,ipmmu-r8a7796";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1093  			reg = <0 0xe67b0000 0 0x1000>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1094  			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1095  				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
834bda65b70fb1 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-08-03  1096  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1097  			#iommu-cells = <1>;
834bda65b70fb1 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-08-03  1098  		};
834bda65b70fb1 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-08-03  1099  
cf8ae446bbcbf5 arch/arm64/boot/dts/renesas/r8a77960.dtsi Yoshihiro Shimoda  2020-04-21  1100  		ipmmu_mp: iommu@ec670000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1101  			compatible = "renesas,ipmmu-r8a7796";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1102  			reg = <0 0xec670000 0 0x1000>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1103  			renesas,ipmmu-main = <&ipmmu_mm 4>;
b9535853777fdf arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-08-03  1104  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1105  			#iommu-cells = <1>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1106  		};
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1107  
cf8ae446bbcbf5 arch/arm64/boot/dts/renesas/r8a77960.dtsi Yoshihiro Shimoda  2020-04-21  1108  		ipmmu_pv0: iommu@fd800000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1109  			compatible = "renesas,ipmmu-r8a7796";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1110  			reg = <0 0xfd800000 0 0x1000>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1111  			renesas,ipmmu-main = <&ipmmu_mm 5>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1112  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1113  			#iommu-cells = <1>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1114  		};
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1115  
cf8ae446bbcbf5 arch/arm64/boot/dts/renesas/r8a77960.dtsi Yoshihiro Shimoda  2020-04-21  1116  		ipmmu_pv1: iommu@fd950000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1117  			compatible = "renesas,ipmmu-r8a7796";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1118  			reg = <0 0xfd950000 0 0x1000>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1119  			renesas,ipmmu-main = <&ipmmu_mm 6>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1120  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1121  			#iommu-cells = <1>;
8faafa718887a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-04-28  1122  		};
8faafa718887a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-04-28  1123  
cf8ae446bbcbf5 arch/arm64/boot/dts/renesas/r8a77960.dtsi Yoshihiro Shimoda  2020-04-21  1124  		ipmmu_rt: iommu@ffc80000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1125  			compatible = "renesas,ipmmu-r8a7796";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1126  			reg = <0 0xffc80000 0 0x1000>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1127  			renesas,ipmmu-main = <&ipmmu_mm 7>;
488153d9fb3aa3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-12-07  1128  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1129  			#iommu-cells = <1>;
488153d9fb3aa3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-12-07  1130  		};
488153d9fb3aa3 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-12-07  1131  
cf8ae446bbcbf5 arch/arm64/boot/dts/renesas/r8a77960.dtsi Yoshihiro Shimoda  2020-04-21  1132  		ipmmu_vc0: iommu@fe6b0000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1133  			compatible = "renesas,ipmmu-r8a7796";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1134  			reg = <0 0xfe6b0000 0 0x1000>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1135  			renesas,ipmmu-main = <&ipmmu_mm 8>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1136  			power-domains = <&sysc R8A7796_PD_A3VC>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1137  			#iommu-cells = <1>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1138  		};
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1139  
cf8ae446bbcbf5 arch/arm64/boot/dts/renesas/r8a77960.dtsi Yoshihiro Shimoda  2020-04-21  1140  		ipmmu_vi0: iommu@febd0000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1141  			compatible = "renesas,ipmmu-r8a7796";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1142  			reg = <0 0xfebd0000 0 0x1000>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1143  			renesas,ipmmu-main = <&ipmmu_mm 9>;
7b39ccbb4be708 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-08-03  1144  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1145  			#iommu-cells = <1>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1146  		};
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1147  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1148  		avb: ethernet@e6800000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1149  			compatible = "renesas,etheravb-r8a7796",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1150  				     "renesas,etheravb-rcar-gen3";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1151  			reg = <0 0xe6800000 0 0x800>, <0 0xe6a00000 0 0x10000>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1152  			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1153  				     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1154  				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1155  				     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1156  				     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1157  				     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1158  				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1159  				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1160  				     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1161  				     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1162  				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1163  				     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1164  				     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1165  				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1166  				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1167  				     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1168  				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1169  				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1170  				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1171  				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1172  				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1173  				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1174  				     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1175  				     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1176  				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1177  			interrupt-names = "ch0", "ch1", "ch2", "ch3",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1178  					  "ch4", "ch5", "ch6", "ch7",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1179  					  "ch8", "ch9", "ch10", "ch11",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1180  					  "ch12", "ch13", "ch14", "ch15",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1181  					  "ch16", "ch17", "ch18", "ch19",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1182  					  "ch20", "ch21", "ch22", "ch23",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1183  					  "ch24";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1184  			clocks = <&cpg CPG_MOD 812>;
56ed0b3b10fd28 arch/arm64/boot/dts/renesas/r8a77960.dtsi Adam Ford          2021-02-24  1185  			clock-names = "fck";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1186  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1187  			resets = <&cpg 812>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1188  			phy-mode = "rgmii";
9b81018185965a arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2020-08-19  1189  			rx-internal-delay-ps = <0>;
9b81018185965a arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2020-08-19  1190  			tx-internal-delay-ps = <0>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1191  			iommus = <&ipmmu_ds0 16>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1192  			#address-cells = <1>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1193  			#size-cells = <0>;
7b39ccbb4be708 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-08-03  1194  			status = "disabled";
8faafa718887a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-04-28  1195  		};
8faafa718887a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-04-28  1196  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1197  		can0: can@e6c30000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1198  			compatible = "renesas,can-r8a7796",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1199  				     "renesas,rcar-gen3-can";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1200  			reg = <0 0xe6c30000 0 0x1000>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1201  			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1202  			clocks = <&cpg CPG_MOD 916>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1203  			       <&cpg CPG_CORE R8A7796_CLK_CANFD>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1204  			       <&can_clk>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1205  			clock-names = "clkp1", "clkp2", "can_clk";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1206  			assigned-clocks = <&cpg CPG_CORE R8A7796_CLK_CANFD>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1207  			assigned-clock-rates = <40000000>;
2affee619d48d1 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-09-21  1208  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1209  			resets = <&cpg 916>;
2affee619d48d1 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-09-21  1210  			status = "disabled";
2affee619d48d1 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-09-21  1211  		};
2affee619d48d1 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-09-21  1212  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1213  		can1: can@e6c38000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1214  			compatible = "renesas,can-r8a7796",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1215  				     "renesas,rcar-gen3-can";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1216  			reg = <0 0xe6c38000 0 0x1000>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1217  			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1218  			clocks = <&cpg CPG_MOD 915>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1219  			       <&cpg CPG_CORE R8A7796_CLK_CANFD>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1220  			       <&can_clk>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1221  			clock-names = "clkp1", "clkp2", "can_clk";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1222  			assigned-clocks = <&cpg CPG_CORE R8A7796_CLK_CANFD>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1223  			assigned-clock-rates = <40000000>;
3e95050a3d334c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-08-03  1224  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1225  			resets = <&cpg 915>;
3e95050a3d334c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-08-03  1226  			status = "disabled";
8faafa718887a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-04-28  1227  		};
8faafa718887a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-04-28  1228  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1229  		canfd: can@e66c0000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1230  			compatible = "renesas,r8a7796-canfd",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1231  				     "renesas,rcar-gen3-canfd";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1232  			reg = <0 0xe66c0000 0 0x8000>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1233  			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1234  				   <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
6af663af3c4630 arch/arm64/boot/dts/renesas/r8a77960.dtsi Geert Uytterhoeven 2022-05-02  1235  			interrupt-names = "ch_int", "g_int";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1236  			clocks = <&cpg CPG_MOD 914>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1237  			       <&cpg CPG_CORE R8A7796_CLK_CANFD>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1238  			       <&can_clk>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1239  			clock-names = "fck", "canfd", "can_clk";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1240  			assigned-clocks = <&cpg CPG_CORE R8A7796_CLK_CANFD>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1241  			assigned-clock-rates = <40000000>;
3e95050a3d334c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-08-03  1242  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1243  			resets = <&cpg 914>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1244  			status = "disabled";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1245  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1246  			channel0 {
3e95050a3d334c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-08-03  1247  				status = "disabled";
8faafa718887a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-04-28  1248  			};
8faafa718887a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-04-28  1249  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1250  			channel1 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1251  				status = "disabled";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1252  			};
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1253  		};
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1254  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1255  		pwm0: pwm@e6e30000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1256  			compatible = "renesas,pwm-r8a7796", "renesas,pwm-rcar";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1257  			reg = <0 0xe6e30000 0 8>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1258  			#pwm-cells = <2>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1259  			clocks = <&cpg CPG_MOD 523>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1260  			resets = <&cpg 523>;
bf68012373546f arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-08-03  1261  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bf68012373546f arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-08-03  1262  			status = "disabled";
8faafa718887a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-04-28  1263  		};
8faafa718887a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-04-28  1264  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1265  		pwm1: pwm@e6e31000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1266  			compatible = "renesas,pwm-r8a7796", "renesas,pwm-rcar";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1267  			reg = <0 0xe6e31000 0 8>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1268  			#pwm-cells = <2>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1269  			clocks = <&cpg CPG_MOD 523>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1270  			resets = <&cpg 523>;
3e95050a3d334c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-08-03  1271  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3e95050a3d334c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-08-03  1272  			status = "disabled";
8faafa718887a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-04-28  1273  		};
8faafa718887a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-04-28  1274  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1275  		pwm2: pwm@e6e32000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1276  			compatible = "renesas,pwm-r8a7796", "renesas,pwm-rcar";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1277  			reg = <0 0xe6e32000 0 8>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1278  			#pwm-cells = <2>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1279  			clocks = <&cpg CPG_MOD 523>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1280  			resets = <&cpg 523>;
3e95050a3d334c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-08-03  1281  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3e95050a3d334c arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-08-03  1282  			status = "disabled";
8faafa718887a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-04-28  1283  		};
8faafa718887a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-04-28  1284  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1285  		pwm3: pwm@e6e33000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1286  			compatible = "renesas,pwm-r8a7796", "renesas,pwm-rcar";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1287  			reg = <0 0xe6e33000 0 8>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1288  			#pwm-cells = <2>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1289  			clocks = <&cpg CPG_MOD 523>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1290  			resets = <&cpg 523>;
bf68012373546f arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-08-03  1291  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
bf68012373546f arch/arm64/boot/dts/renesas/r8a7796.dtsi  Yoshihiro Shimoda  2017-08-03  1292  			status = "disabled";
8faafa718887a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-04-28  1293  		};
8faafa718887a0 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2017-04-28  1294  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1295  		pwm4: pwm@e6e34000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1296  			compatible = "renesas,pwm-r8a7796", "renesas,pwm-rcar";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1297  			reg = <0 0xe6e34000 0 8>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1298  			#pwm-cells = <2>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1299  			clocks = <&cpg CPG_MOD 523>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1300  			resets = <&cpg 523>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1301  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1302  			status = "disabled";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1303  		};
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1304  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1305  		pwm5: pwm@e6e35000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1306  			compatible = "renesas,pwm-r8a7796", "renesas,pwm-rcar";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1307  			reg = <0 0xe6e35000 0 8>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1308  			#pwm-cells = <2>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1309  			clocks = <&cpg CPG_MOD 523>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1310  			resets = <&cpg 523>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1311  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1312  			status = "disabled";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1313  		};
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1314  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1315  		pwm6: pwm@e6e36000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1316  			compatible = "renesas,pwm-r8a7796", "renesas,pwm-rcar";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1317  			reg = <0 0xe6e36000 0 8>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1318  			#pwm-cells = <2>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1319  			clocks = <&cpg CPG_MOD 523>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1320  			resets = <&cpg 523>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1321  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1322  			status = "disabled";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1323  		};
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1324  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1325  		scif0: serial@e6e60000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1326  			compatible = "renesas,scif-r8a7796",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1327  				     "renesas,rcar-gen3-scif", "renesas,scif";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1328  			reg = <0 0xe6e60000 0 64>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1329  			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1330  			clocks = <&cpg CPG_MOD 207>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1331  				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1332  				 <&scif_clk>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1333  			clock-names = "fck", "brg_int", "scif_clk";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1334  			dmas = <&dmac1 0x51>, <&dmac1 0x50>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1335  			       <&dmac2 0x51>, <&dmac2 0x50>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1336  			dma-names = "tx", "rx", "tx", "rx";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1337  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1338  			resets = <&cpg 207>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1339  			status = "disabled";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1340  		};
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1341  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1342  		scif1: serial@e6e68000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1343  			compatible = "renesas,scif-r8a7796",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1344  				     "renesas,rcar-gen3-scif", "renesas,scif";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1345  			reg = <0 0xe6e68000 0 64>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1346  			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1347  			clocks = <&cpg CPG_MOD 206>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1348  				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1349  				 <&scif_clk>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1350  			clock-names = "fck", "brg_int", "scif_clk";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1351  			dmas = <&dmac1 0x53>, <&dmac1 0x52>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1352  			       <&dmac2 0x53>, <&dmac2 0x52>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1353  			dma-names = "tx", "rx", "tx", "rx";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1354  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1355  			resets = <&cpg 206>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1356  			status = "disabled";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1357  		};
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1358  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1359  		scif2: serial@e6e88000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1360  			compatible = "renesas,scif-r8a7796",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1361  				     "renesas,rcar-gen3-scif", "renesas,scif";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1362  			reg = <0 0xe6e88000 0 64>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1363  			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1364  			clocks = <&cpg CPG_MOD 310>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1365  				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1366  				 <&scif_clk>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1367  			clock-names = "fck", "brg_int", "scif_clk";
97f26702bc95b5 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2019-01-10  1368  			dmas = <&dmac1 0x13>, <&dmac1 0x12>,
97f26702bc95b5 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2019-01-10  1369  			       <&dmac2 0x13>, <&dmac2 0x12>;
97f26702bc95b5 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Geert Uytterhoeven 2019-01-10  1370  			dma-names = "tx", "rx", "tx", "rx";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1371  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1372  			resets = <&cpg 310>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1373  			status = "disabled";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1374  		};
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1375  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1376  		scif3: serial@e6c50000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1377  			compatible = "renesas,scif-r8a7796",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1378  				     "renesas,rcar-gen3-scif", "renesas,scif";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1379  			reg = <0 0xe6c50000 0 64>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1380  			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1381  			clocks = <&cpg CPG_MOD 204>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1382  				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1383  				 <&scif_clk>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1384  			clock-names = "fck", "brg_int", "scif_clk";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1385  			dmas = <&dmac0 0x57>, <&dmac0 0x56>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1386  			dma-names = "tx", "rx";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1387  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1388  			resets = <&cpg 204>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1389  			status = "disabled";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1390  		};
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1391  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1392  		scif4: serial@e6c40000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1393  			compatible = "renesas,scif-r8a7796",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1394  				     "renesas,rcar-gen3-scif", "renesas,scif";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1395  			reg = <0 0xe6c40000 0 64>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1396  			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1397  			clocks = <&cpg CPG_MOD 203>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1398  				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1399  				 <&scif_clk>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1400  			clock-names = "fck", "brg_int", "scif_clk";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1401  			dmas = <&dmac0 0x59>, <&dmac0 0x58>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1402  			dma-names = "tx", "rx";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1403  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1404  			resets = <&cpg 203>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1405  			status = "disabled";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1406  		};
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1407  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1408  		scif5: serial@e6f30000 {
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1409  			compatible = "renesas,scif-r8a7796",
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1410  				     "renesas,rcar-gen3-scif", "renesas,scif";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1411  			reg = <0 0xe6f30000 0 64>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1412  			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1413  			clocks = <&cpg CPG_MOD 202>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1414  				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1415  				 <&scif_clk>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1416  			clock-names = "fck", "brg_int", "scif_clk";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1417  			dmas = <&dmac1 0x5b>, <&dmac1 0x5a>,
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1418  			       <&dmac2 0x5b>, <&dmac2 0x5a>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1419  			dma-names = "tx", "rx", "tx", "rx";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1420  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1421  			resets = <&cpg 202>;
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1422  			status = "disabled";
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1423  		};
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23  1424  
8067f6f421dc82 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Cao Van Dong       2019-04-25  1425  		tpu: pwm@e6e80000 {
8067f6f421dc82 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Cao Van Dong       2019-04-25  1426  			compatible = "renesas,tpu-r8a7796", "renesas,tpu";
8067f6f421dc82 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Cao Van Dong       2019-04-25  1427  			reg = <0 0xe6e80000 0 0x148>;
8067f6f421dc82 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Cao Van Dong       2019-04-25  1428  			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
8067f6f421dc82 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Cao Van Dong       2019-04-25  1429  			clocks = <&cpg CPG_MOD 304>;
8067f6f421dc82 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Cao Van Dong       2019-04-25  1430  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
8067f6f421dc82 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Cao Van Dong       2019-04-25  1431  			resets = <&cpg 304>;
8067f6f421dc82 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Cao Van Dong       2019-04-25  1432  			#pwm-cells = <3>;
8067f6f421dc82 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Cao Van Dong       2019-04-25  1433  			status = "disabled";
8067f6f421dc82 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Cao Van Dong       2019-04-25  1434  		};
8067f6f421dc82 arch/arm64/boot/dts/renesas/r8a7796.dtsi  Cao Van Dong       2019-04-25  1435  
3684a030bd0fde arch/arm64/boot/dts/renesas/r8a7796.dtsi  Simon Horman       2018-03-23 @1436  		msiof0: spi@e6e90000 {

:::::: The code at line 1436 was first introduced by commit
:::::: 3684a030bd0fded121bbce9af0d2126fe894d700 arm64: dts: renesas: r8a7796: sort subnodes of the soc node

:::::: TO: Simon Horman <horms+renesas@verge.net.au>
:::::: CC: Simon Horman <horms+renesas@verge.net.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
