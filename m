Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF88F2D46DD
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 06:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770792271; cv=none; b=GDaYt3uqtm7Ptigjze23fPwclmApz7RzvoEsQSUc6/fzUgs0AJk0gcyzBvxhXb0n8Fev6CNvSi5i9uC9JwvW6fbK1V63z1eff9TNy72qU9V8lkK4EozhfMys4r3AJ4PMEk5lLKdhzoN0jolTqcqJw1Kr7cg+x+rrVy4fODbNR7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770792271; c=relaxed/simple;
	bh=h76Ys3fMXrPAhOlfP1z57hUPq/HUa+7IYgarSfLyGyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZRLlPa45q8P/5i3uL+nN3t7wNYClRY+jMDIV3biqxz0VtwQVzHbPQPa6byAe0IS19D1S75A7yC17S1KX+SWC7F+3kHls3biWbBpsNLtOVOpAgBIeQIgQ9Y6njlM4SyPWBHsP0viKsoXGoh1DwK4KUacaVOmbvTibAfTf3VctP1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFYSo+9T; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFYSo+9T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770792266; x=1802328266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h76Ys3fMXrPAhOlfP1z57hUPq/HUa+7IYgarSfLyGyA=;
  b=fFYSo+9TT7OCxmtzglylFoNo3qUQ8088ud0Q31/ntLPCYnl38TTKgJNn
   HgHLgZV1P1QMgypWiZHGZexv16vghuNxht4T5qB9edS7ihdwUvqjDa4ME
   5KUuEB1MAcnQkCXyZp5I/0zPJ9Qm1VKSqUSQQQPzloi9bm8vs+osnU2zo
   p6SIsgBxJpFgIHpAKTWfHeEJyLhKi8zgS02592MyzccuvpVcQlEDzidVm
   /G9PFoAVFI9EWK0SMVRbgq2mwkKem80tiYPjlx/GjyApRY9KPb6XPXt64
   1WZUOY8VdMgOF/M7TjkkPVB1Qd66SXL8eqRYskH+lZAwBYUng7NZC3GcZ
   g==;
X-CSE-ConnectionGUID: j3ZHVCdbQrGrd9NOivl14w==
X-CSE-MsgGUID: WWcu2N2ITTK1VT+spNuKlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71975207"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71975207"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 22:44:25 -0800
X-CSE-ConnectionGUID: SvC0fujkQuOrR4umd31KQw==
X-CSE-MsgGUID: 5OLqHGNQS2eQIoBO69HlsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212246455"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 10 Feb 2026 22:44:23 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq3xV-00000000125-1nUs;
	Wed, 11 Feb 2026 06:44:21 +0000
Date: Wed, 11 Feb 2026 07:43:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v12 1/3] dt-bindings: net: nuvoton: Add schema
 for Nuvoton MA35 family GMAC
Message-ID: <202602110748.iRrH1HrH-lkp@intel.com>
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
In-Reply-To: <20260210052226.3005666-2-a0987203069@gmail.com>
References: <20260210052226.3005666-2-a0987203069@gmail.com>
TO: Joey Lu <a0987203069@gmail.com>
TO: andrew+netdev@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: mcoquelin.stm32@gmail.com
TO: richardcochran@gmail.com
CC: alexandre.torgue@foss.st.com
CC: joabreu@synopsys.com
CC: ychuang3@nuvoton.com
CC: schung@nuvoton.com
CC: yclu4@nuvoton.com
CC: peppe.cavallaro@st.com
CC: linux-arm-kernel@lists.infradead.org
CC: netdev@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: openbmc@lists.ozlabs.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: Joey Lu <a0987203069@gmail.com>

Hi Joey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Lu/dt-bindings-net-nuvoton-Add-schema-for-Nuvoton-MA35-family-GMAC/20260210-132802
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260210052226.3005666-2-a0987203069%40gmail.com
patch subject: [PATCH net-next v12 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arm-randconfig-2051-20260210 (https://download.01.org/0day-ci/archive/20260211/202602110748.iRrH1HrH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110748.iRrH1HrH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602110748.iRrH1HrH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: ethernet@c9410000 (amlogic,meson8b-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: ethernet@c9410000 (amlogic,meson8b-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: ethernet@c9410000 (amlogic,meson8b-dwmac): clocks: [[7, 36], [7, 95], [7, 95], [7, 5]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: ethernet@c9410000 (amlogic,meson8b-dwmac): compatible:0: 'amlogic,meson8b-dwmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: ethernet@c9410000 (amlogic,meson8b-dwmac): compatible: ['amlogic,meson8b-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: ethernet@c9410000 (amlogic,meson8b-dwmac): reg: [[3376480256, 65536], [3239084352, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: ethernet@c9410000 (amlogic,meson8b-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
>> arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: ethernet@c9410000 (amlogic,meson8b-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: ethernet@c9410000 (amlogic,meson8b-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: ethernet@c9410000 (amlogic,meson8b-dwmac): clocks: [[7, 36], [7, 95], [7, 95], [7, 5]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: ethernet@c9410000 (amlogic,meson8b-dwmac): compatible:0: 'amlogic,meson8b-dwmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: ethernet@c9410000 (amlogic,meson8b-dwmac): compatible: ['amlogic,meson8b-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: ethernet@c9410000 (amlogic,meson8b-dwmac): reg: [[3376480256, 65536], [3239084352, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: ethernet@c9410000 (amlogic,meson8b-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
>> arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: ethernet@c9410000 (amlogic,meson8b-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: ethernet@c9410000 (amlogic,meson8b-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: ethernet@c9410000 (amlogic,meson8b-dwmac): clocks: [[7, 36], [7, 95], [7, 95], [7, 5]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: ethernet@c9410000 (amlogic,meson8b-dwmac): compatible:0: 'amlogic,meson8b-dwmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: ethernet@c9410000 (amlogic,meson8b-dwmac): compatible: ['amlogic,meson8b-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: ethernet@c9410000 (amlogic,meson8b-dwmac): reg: [[3376480256, 65536], [3239084352, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: ethernet@c9410000 (amlogic,meson8b-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'rxc-skew-ps', 'rxd0-skew-ps', 'rxd1-skew-ps', 'rxd2-skew-ps', 'rxd3-skew-ps', 'rxdv-skew-ps', 'txc-skew-ps', 'txen-skew-ps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: flash@0 (micron,n25q256a): Unevaluated properties are not allowed ('partition@qspi-boot', 'partition@qspi-rootfs' were unexpected)
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'mdio0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/i2c@ffc04000/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'mdio0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/i2c@ffc04000/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'mdio0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/i2c@ffc04000/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'mdio0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: flash@0 (jedec,spi-nor): 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'mdio0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('partition@raw', 'u-boot,dm-pre-reloc' were unexpected)
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'mdio0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: flash@0 (jedec,spi-nor): 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'mdio0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/i2c@ffc04000/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'mdio0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/i2c@ffc04000/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'mdio0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/i2c@ffc04000/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'mdio0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/i2c@ffc04000/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'mdio0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/i2c@ffc04000/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'mdio0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('partition@raw', 'u-boot,dm-pre-reloc' were unexpected)
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'mdio0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: flash@0 (jedec,spi-nor): 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'mdio0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/i2c@ffc04000/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'mdio0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/i2c@ffc04000/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: spi@fff00000 (snps,dw-apb-ssi): Unevaluated properties are not allowed ('label' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: ethernet@ff700000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: ethernet@ff700000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: stmpe811@41 (st,stmpe811): 'blocks', 'id', 'irq-gpio', 'stmpe_touchscreen' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: stmpe811@41 (st,stmpe811): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'rxc-skew-ps', 'rxd0-skew-ps', 'rxd1-skew-ps', 'rxd2-skew-ps', 'rxd3-skew-ps', 'rxdv-skew-ps', 'txc-skew-ps', 'txen-skew-ps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: flash@0 (micron,mt25qu02g): Unevaluated properties are not allowed ('partition@qspi-boot', 'partition@qspi-rootfs' were unexpected)
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'rxc-skew-ps', 'rxd0-skew-ps', 'rxd1-skew-ps', 'rxd2-skew-ps', 'rxd3-skew-ps', 'rxdv-skew-ps', 'txc-skew-ps', 'txd0-skew-ps', 'txd1-skew-ps', 'txd2-skew-ps', 'txd3-skew-ps', 'txen-skew-ps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('txd0-skew-ps', 'txd1-skew-ps', 'txd2-skew-ps', 'txd3-skew-ps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: adxl345@53 (adi,adxl345): 'interrupt-names' is a dependency of 'interrupts'
   	from schema $id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'rxd0-skew-ps', 'rxd1-skew-ps', 'rxd2-skew-ps', 'rxd3-skew-ps', 'rxdv-skew-ps', 'txen-skew-ps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: sysmgr@ffd08000 (altr,sys-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'rxc-skew-ps', 'rxd0-skew-ps', 'rxd1-skew-ps', 'rxd2-skew-ps', 'rxd3-skew-ps', 'rxdv-skew-ps', 'txc-skew-ps', 'txen-skew-ps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: accelerometer@53 (adi,adxl345): 'interrupt-names' is a dependency of 'interrupts'
   	from schema $id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: sysmgr@ffd08000 (altr,sys-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'mdio0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: sysmgr@ffd08000 (altr,sys-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: ethernet@ff702000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon', 'mdio0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: flash@0 (micron,n25q128): compatible: 'oneOf' conditional failed, one must be fixed:
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: ethernet@ff700000 (altr,socfpga-stmmac): phy-mode:0: 'gmii' is not one of ['rmii', 'rgmii', 'rgmii-id', 'rgmii-txid', 'rgmii-rxid']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: ethernet@ff700000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: ethernet@ff700000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: ethernet@ff702000 (altr,socfpga-stmmac): clocks: [[40]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: ethernet@ff702000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: sysmgr@ffd08000 (altr,sys-mgr): compatible: 'oneOf' conditional failed, one must be fixed:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
