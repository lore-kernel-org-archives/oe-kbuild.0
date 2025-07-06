Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE8220B80D
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Jul 2025 12:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751804630; cv=none; b=tsjJi67dRAsV3z10d47xPK3DBmaYOkquxaHnEnTZ8kOI00d1gOuWmxfQcgfoyurGlyVKBlO8o+gfcfhsC5gNnEru3sm05Jj0mIKrm7jOCJCZFGXMUTJYfxYD9MQ3etWcJKxY648EbkCphhg4H06u/IQxI86Iqv3/msxPu+SKDm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751804630; c=relaxed/simple;
	bh=PbH7Y1kf83U0xh/iAI75p6GGJhrwk080EPnvriFFqB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iZvzz0RHVAVtpznRNjbbQKTlAX3fTF2RbDzXXvBmPyfjxGtu8P/3jrp1RFNn/A4YFsO1CCVoA9Ae0X7LRI+Gy3KE5HIUcZjP3jB/Pb3AnSV1Td0pQxKrnulJ1+W1mkLiHpsAUEodvUg3QMn/jWTpfUfY5IaFSbKS8ecjMhGvtps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBv/vixl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBv/vixl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751804627; x=1783340627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PbH7Y1kf83U0xh/iAI75p6GGJhrwk080EPnvriFFqB0=;
  b=lBv/vixlfhzsPANbSvH0jFYjR64tAe5MSeMioUyFDz8xcfWWKgZJ3WVI
   5Pl1/+XpzgbnJgSKtSi5jtY1ONVvVZrlixpIIB7oZzq0r1bsgWldlFoQ3
   2eMO4hEGFB3l0uEyNe6sDeR4aVelg8lEF3Xu1+X6JAb1XIDOZkE94WC4z
   2Hbf6TpQc5+jfqMCQHRt3TZMxbEt2pFDsC4c1anaZCJ8OLivSTYBqcu8Y
   4ETJv2wi2zF+qa4gLKJKoICkJ55z3oS109/6hnS0nWf89Mk9dW9jG1/hv
   e0NmqTUjv6SDjHhKwp+9g7Nly4ATj1VtHOpi9YgWjce0KHgbQu78emaVb
   Q==;
X-CSE-ConnectionGUID: VqaxVykgQSaqNX7lWd0wXw==
X-CSE-MsgGUID: kUrvfRHqSf28F6N//B378w==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="57849029"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="57849029"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 05:23:46 -0700
X-CSE-ConnectionGUID: R4I1bfMVSuibksGb0ksXOQ==
X-CSE-MsgGUID: cDgC7hZlT7a5+dAKf7VUpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="155735983"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Jul 2025 05:23:45 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYOPH-00053X-1p;
	Sun, 06 Jul 2025 12:23:43 +0000
Date: Sun, 6 Jul 2025 20:22:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:visionfive 30/31]
 arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /
 (beagle,beaglev-starlight-jh7100-a1): compatible: 'oneOf' conditional
 failed, one must be fixed:
Message-ID: <202507062020.OZe5c7h5-lkp@intel.com>
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
TO: Emil Renner Berthing <kernel@esmil.dk>

tree:   https://github.com/esmil/linux visionfive
head:   1629e9635614976773c662b5e7d32b95cb1481a4
commit: 9d369a757868024829a3df73cc42aee65b17b844 [30/31] riscv: dts: Add full JH7100, Starlight and VisionFive support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-052-20250706 (https://download.01.org/0day-ci/archive/20250706/202507062020.OZe5c7h5-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507062020.OZe5c7h5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507062020.OZe5c7h5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/starfive/jh7100.dtsi:843.10-844.6: Warning (unit_address_vs_reg): /soc/xrp@f0000000/dsp@0: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:398.40-401.5: Warning (simple_bus_reg): /soc/spdif-transmitter: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:403.34-406.5: Warning (simple_bus_reg): /soc/spdif-receiver: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:408.36-411.5: Warning (simple_bus_reg): /soc/pwmdac-transmitter: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:413.20-416.5: Warning (simple_bus_reg): /soc/dmic: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:418.19-440.5: Warning (simple_bus_reg): /soc/snd-card: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:671.30-675.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:677.28-680.5: Warning (simple_bus_reg): /soc/display-encoder: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: / (beagle,beaglev-starlight-jh7100-a1): compatible: 'oneOf' conditional failed, one must be fixed:
   	'beagle,beaglev-starlight-jh7100-a1' is not one of ['beagle,beaglev-starlight-jh7100-r0', 'starfive,visionfive-v1']
   	'beagle,beaglev-starlight-jh7100-a1' is not one of ['deepcomputing,fml13v01', 'milkv,mars', 'pine64,star64', 'starfive,visionfive-2-v1.2a', 'starfive,visionfive-2-v1.3b']
   	'starfive,jh7110' was expected
   	from schema $id: http://devicetree.org/schemas/riscv/starfive.yaml#
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /: failed to match any schema with compatible: ['beagle,beaglev-starlight-jh7100-a1', 'starfive,jh7100']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: cpu@0 (sifive,u74-mc): Unevaluated properties are not allowed ('starfive,itim' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: cpu@1 (sifive,u74-mc): Unevaluated properties are not allowed ('starfive,itim' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: soc (simple-bus): snd-card: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: soc (simple-bus): dmic: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: soc (simple-bus): pwmdac-transmitter: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: soc (simple-bus): spdif-transmitter: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: soc (simple-bus): display-encoder: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: soc (simple-bus): spdif-receiver: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/dtim@1000000: failed to match any schema with compatible: ['starfive,dtim0']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/itim@1808000: failed to match any schema with compatible: ['starfive,itim0']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/itim@1820000: failed to match any schema with compatible: ['starfive,itim0']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/dma-controller@100b0000: failed to match any schema with compatible: ['starfive,jh7100-axi-dma']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/crypto@100d0000: failed to match any schema with compatible: ['starfive,vic-sec']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/i2sadc0@10400000: failed to match any schema with compatible: ['snps,designware-i2sadc0']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/i2svad@10420000: failed to match any schema with compatible: ['starfive,sf-i2svad']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/pwmdac@10440000: failed to match any schema with compatible: ['starfive,pwmdac']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/i2sdac0@10450000: failed to match any schema with compatible: ['snps,designware-i2sdac0']
--
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/pwmdac-transmitter: failed to match any schema with compatible: ['linux,pwmdac-dit']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/syscon@104a0000: failed to match any schema with compatible: ['starfive,jh7100-sysaudio', 'syscon']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/usb@104c0000: failed to match any schema with compatible: ['starfive,jh7100-usb']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/dma-controller@10500000: failed to match any schema with compatible: ['starfive,jh7100-axi-dma']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/otp@11810000: failed to match any schema with compatible: ['starfive,fu740-otp']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/spi@11860000/nor-flash@0: failed to match any schema with compatible: ['spi-flash']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/spi@11860000/nand-flash@1: failed to match any schema with compatible: ['spi-flash-nand']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/trng@118d0000: failed to match any schema with compatible: ['starfive,vic-rng']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/vpu_enc@118e0000: failed to match any schema with compatible: ['cm,cm521-vpu']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/vpu_dec@118f0000: failed to match any schema with compatible: ['c&m,cm511-vpu']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: vpu_dec@118f0000 (c&m,cm511-vpu): compatible:0: 'c&m,cm511-vpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/coadj12@11900000: failed to match any schema with compatible: ['cm,codaj12-jpu-1']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/nvdla@11940000: failed to match any schema with compatible: ['nvidia,nvdla_os_initial']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['starfive,display-subsystem']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/display-encoder: failed to match any schema with compatible: ['starfive,display-encoder']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/crtc@12000000: failed to match any schema with compatible: ['starfive,jh7100-crtc']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/xrp@f0000000: failed to match any schema with compatible: ['cdns,xrp']
--
   arch/riscv/boot/dts/starfive/jh7100.dtsi:843.10-844.6: Warning (unit_address_vs_reg): /soc/xrp@f0000000/dsp@0: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:398.40-401.5: Warning (simple_bus_reg): /soc/spdif-transmitter: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:403.34-406.5: Warning (simple_bus_reg): /soc/spdif-receiver: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:408.36-411.5: Warning (simple_bus_reg): /soc/pwmdac-transmitter: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:413.20-416.5: Warning (simple_bus_reg): /soc/dmic: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:418.19-440.5: Warning (simple_bus_reg): /soc/snd-card: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:671.30-675.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:677.28-680.5: Warning (simple_bus_reg): /soc/display-encoder: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: cpu@0 (sifive,u74-mc): Unevaluated properties are not allowed ('starfive,itim' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: cpu@1 (sifive,u74-mc): Unevaluated properties are not allowed ('starfive,itim' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: soc (simple-bus): display-encoder: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: soc (simple-bus): pwmdac-transmitter: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: soc (simple-bus): spdif-transmitter: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: soc (simple-bus): spdif-receiver: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: soc (simple-bus): snd-card: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: soc (simple-bus): dmic: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/dtim@1000000: failed to match any schema with compatible: ['starfive,dtim0']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/itim@1808000: failed to match any schema with compatible: ['starfive,itim0']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/itim@1820000: failed to match any schema with compatible: ['starfive,itim0']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/dma-controller@100b0000: failed to match any schema with compatible: ['starfive,jh7100-axi-dma']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/crypto@100d0000: failed to match any schema with compatible: ['starfive,vic-sec']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/i2sadc0@10400000: failed to match any schema with compatible: ['snps,designware-i2sadc0']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/i2svad@10420000: failed to match any schema with compatible: ['starfive,sf-i2svad']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/pwmdac@10440000: failed to match any schema with compatible: ['starfive,pwmdac']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/i2sdac0@10450000: failed to match any schema with compatible: ['snps,designware-i2sdac0']
--
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/pwmdac-transmitter: failed to match any schema with compatible: ['linux,pwmdac-dit']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/syscon@104a0000: failed to match any schema with compatible: ['starfive,jh7100-sysaudio', 'syscon']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/usb@104c0000: failed to match any schema with compatible: ['starfive,jh7100-usb']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/dma-controller@10500000: failed to match any schema with compatible: ['starfive,jh7100-axi-dma']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/otp@11810000: failed to match any schema with compatible: ['starfive,fu740-otp']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/spi@11860000/nor-flash@0: failed to match any schema with compatible: ['spi-flash']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/spi@11860000/nand-flash@1: failed to match any schema with compatible: ['spi-flash-nand']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/trng@118d0000: failed to match any schema with compatible: ['starfive,vic-rng']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/vpu_enc@118e0000: failed to match any schema with compatible: ['cm,cm521-vpu']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/vpu_dec@118f0000: failed to match any schema with compatible: ['c&m,cm511-vpu']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: vpu_dec@118f0000 (c&m,cm511-vpu): compatible:0: 'c&m,cm511-vpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/coadj12@11900000: failed to match any schema with compatible: ['cm,codaj12-jpu-1']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/nvdla@11940000: failed to match any schema with compatible: ['nvidia,nvdla_os_initial']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['starfive,display-subsystem']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/display-encoder: failed to match any schema with compatible: ['starfive,display-encoder']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/crtc@12000000: failed to match any schema with compatible: ['starfive,jh7100-crtc']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/xrp@f0000000: failed to match any schema with compatible: ['cdns,xrp']
--
   arch/riscv/boot/dts/starfive/jh7100.dtsi:843.10-844.6: Warning (unit_address_vs_reg): /soc/xrp@f0000000/dsp@0: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:398.40-401.5: Warning (simple_bus_reg): /soc/spdif-transmitter: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:403.34-406.5: Warning (simple_bus_reg): /soc/spdif-receiver: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:408.36-411.5: Warning (simple_bus_reg): /soc/pwmdac-transmitter: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:413.20-416.5: Warning (simple_bus_reg): /soc/dmic: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:418.19-440.5: Warning (simple_bus_reg): /soc/snd-card: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:671.30-675.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:677.28-680.5: Warning (simple_bus_reg): /soc/display-encoder: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: cpu@0 (sifive,u74-mc): Unevaluated properties are not allowed ('starfive,itim' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: cpu@1 (sifive,u74-mc): Unevaluated properties are not allowed ('starfive,itim' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: soc (simple-bus): pwmdac-transmitter: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: soc (simple-bus): spdif-receiver: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: soc (simple-bus): spdif-transmitter: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: soc (simple-bus): snd-card: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: soc (simple-bus): display-encoder: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: soc (simple-bus): dmic: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/dtim@1000000: failed to match any schema with compatible: ['starfive,dtim0']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/itim@1808000: failed to match any schema with compatible: ['starfive,itim0']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/itim@1820000: failed to match any schema with compatible: ['starfive,itim0']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/dma-controller@100b0000: failed to match any schema with compatible: ['starfive,jh7100-axi-dma']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/crypto@100d0000: failed to match any schema with compatible: ['starfive,vic-sec']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/i2sadc0@10400000: failed to match any schema with compatible: ['snps,designware-i2sadc0']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/i2svad@10420000: failed to match any schema with compatible: ['starfive,sf-i2svad']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/pwmdac@10440000: failed to match any schema with compatible: ['starfive,pwmdac']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/i2sdac0@10450000: failed to match any schema with compatible: ['snps,designware-i2sdac0']
--
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/pwmdac-transmitter: failed to match any schema with compatible: ['linux,pwmdac-dit']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/syscon@104a0000: failed to match any schema with compatible: ['starfive,jh7100-sysaudio', 'syscon']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/usb@104c0000: failed to match any schema with compatible: ['starfive,jh7100-usb']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/dma-controller@10500000: failed to match any schema with compatible: ['starfive,jh7100-axi-dma']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/otp@11810000: failed to match any schema with compatible: ['starfive,fu740-otp']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/spi@11860000/nor-flash@0: failed to match any schema with compatible: ['spi-flash']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/spi@11860000/nand-flash@1: failed to match any schema with compatible: ['spi-flash-nand']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/trng@118d0000: failed to match any schema with compatible: ['starfive,vic-rng']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/vpu_enc@118e0000: failed to match any schema with compatible: ['cm,cm521-vpu']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/vpu_dec@118f0000: failed to match any schema with compatible: ['c&m,cm511-vpu']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: vpu_dec@118f0000 (c&m,cm511-vpu): compatible:0: 'c&m,cm511-vpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/coadj12@11900000: failed to match any schema with compatible: ['cm,codaj12-jpu-1']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/nvdla@11940000: failed to match any schema with compatible: ['nvidia,nvdla_os_initial']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['starfive,display-subsystem']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/display-encoder: failed to match any schema with compatible: ['starfive,display-encoder']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/crtc@12000000: failed to match any schema with compatible: ['starfive,jh7100-crtc']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/xrp@f0000000: failed to match any schema with compatible: ['cdns,xrp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
