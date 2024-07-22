Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725944655D
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jul 2024 23:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721690890; cv=none; b=ncHLO11sEwO7NBLmn4YG7bn+TlS/DHKutNzggMZO/ICqYm8e49UlfZkIGhtoKcCuFhhiUoC93LsgHzd5ACZySb0lMqMfihVlJ628Ke1NLvVRZUCZBY5tQJ+mrydi53v2vF+Mn4kDiW68DfKtT35K7pckKr6qw0bLip8lxfieBUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721690890; c=relaxed/simple;
	bh=R5MwoNqHeo+Q8BcdTJ1OMPQa7vfa7aSB26IQgEfIvOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i2EZcB682Zz0aaPneqHG//fkf8AniIrRvngr7Jypx8quRJhlAhBYKubtuyutISq23AtCudUSF1+vAtjTAGtFTeJgj69f3Sg6BClR1uUFz91xrwpxLnfQ7TRK5e7pdNoGSEPB0GQTwYBCa2Q2pF4KqFP2w+RCx3PeipUMn6xLI5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vd66TTky; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vd66TTky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721690887; x=1753226887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R5MwoNqHeo+Q8BcdTJ1OMPQa7vfa7aSB26IQgEfIvOY=;
  b=Vd66TTkyG7dV9QJm5RCfJLGKaxouwP5VWVGN2Q63ManRfZ5uiYgG6ob9
   VQME4qu+81YFX+GBijxWp8r2iiyDjY+odtgXoF8HbIIcNQySv99XmFDHy
   3eFSLSQ2wdNwAmRr8aO5m8q7QsQ08oiAxQobUHlXBDdYAP9h+te2N85Mi
   higxR+Uf7YvDkXN7e5KAet8BMZ2mK/KYp5CW7nirUgrdU2PPO3FRGh5RG
   5s4QsWbPqM95RiK2BJF7oUHMD3TaDcaPFd7ifXyjOyhBeZQFMSKSaibRr
   3e75pC/3atZL6iyeYvBNjyH61hW8Nxb5FbB6ZGLkQuFlVWAMiluVyd+ny
   w==;
X-CSE-ConnectionGUID: hVpjbgBeSF+QOYGz+PNByw==
X-CSE-MsgGUID: XrAG/RUfRjmIZl3QU6fYrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19420621"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="19420621"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 16:28:07 -0700
X-CSE-ConnectionGUID: ZhHWYZm4TRqk+5VSA5Z4CA==
X-CSE-MsgGUID: 2yzi6ERmQNG9EcHWrCTLVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="82667800"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Jul 2024 16:28:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sW2Rn-000lTE-1V;
	Mon, 22 Jul 2024 23:28:03 +0000
Date: Tue, 23 Jul 2024 07:27:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:visionfive 29/30]
 arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202407230720.I7dsM4a7-lkp@intel.com>
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
CC: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Stephen L Arnold <nerdboy@gentoo.org>
CC: Drew Fustini <drew@beagleboard.org>
CC: Jianlong Huang <jianlong.huang@starfivetech.com>
CC: Jonas Hahnfeld <hahnjo@hahnjo.de>

tree:   https://github.com/esmil/linux visionfive
head:   37087c6cd7f818990c3c37d2e3cb01b05fc8bb69
commit: e07b775c4065d00802feea619ae15c70139babb9 [29/30] riscv: dts: Add full JH7100, Starlight and VisionFive support
:::::: branch date: 23 hours ago
:::::: commit date: 24 hours ago
config: riscv-randconfig-051-20240723 (https://download.01.org/0day-ci/archive/20240723/202407230720.I7dsM4a7-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407230720.I7dsM4a7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407230720.I7dsM4a7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/starfive/jh7100.dtsi:843.10-844.6: Warning (unit_address_vs_reg): /soc/xrp@f0000000/dsp@0: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:398.40-401.5: Warning (simple_bus_reg): /soc/spdif-transmitter: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:403.34-406.5: Warning (simple_bus_reg): /soc/spdif-receiver: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:408.36-411.5: Warning (simple_bus_reg): /soc/pwmdac-transmitter: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:413.20-416.5: Warning (simple_bus_reg): /soc/dmic: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:418.19-440.5: Warning (simple_bus_reg): /soc/snd-card: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:671.30-675.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:677.28-680.5: Warning (simple_bus_reg): /soc/display-encoder: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	'beagle,beaglev-starlight-jh7100-a1' is not one of ['beagle,beaglev-starlight-jh7100-r0', 'starfive,visionfive-v1']
   	'beagle,beaglev-starlight-jh7100-a1' is not one of ['milkv,mars', 'starfive,visionfive-2-v1.2a', 'starfive,visionfive-2-v1.3b']
   	'starfive,jh7110' was expected
   	from schema $id: http://devicetree.org/schemas/riscv/starfive.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /: failed to match any schema with compatible: ['beagle,beaglev-starlight-jh7100-a1', 'starfive,jh7100']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: cpu@0: Unevaluated properties are not allowed ('starfive,itim' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: cpu@1: Unevaluated properties are not allowed ('starfive,itim' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: soc: display-encoder: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: soc: dmic: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: soc: snd-card: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: soc: spdif-receiver: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: soc: spdif-transmitter: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: soc: pwmdac-transmitter: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: soc: display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/dtim@1000000: failed to match any schema with compatible: ['starfive,dtim0']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/itim@1808000: failed to match any schema with compatible: ['starfive,itim0']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/itim@1820000: failed to match any schema with compatible: ['starfive,itim0']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/dma-controller@100b0000: failed to match any schema with compatible: ['starfive,jh7100-axi-dma']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/crypto@100d0000: failed to match any schema with compatible: ['starfive,vic-sec']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/i2sadc0@10400000: failed to match any schema with compatible: ['snps,designware-i2sadc0']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/i2svad@10420000: failed to match any schema with compatible: ['starfive,sf-i2svad']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/pwmdac@10440000: failed to match any schema with compatible: ['starfive,pwmdac']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/i2sdac0@10450000: failed to match any schema with compatible: ['snps,designware-i2sdac0']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/i2sdac1@10460000: failed to match any schema with compatible: ['snps,designware-i2sdac1']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/i2sdac16k@10470000: failed to match any schema with compatible: ['snps,designware-i2sdac16k']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/spdif-receiver: failed to match any schema with compatible: ['linux,spdif-dir']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/pwmdac-transmitter: failed to match any schema with compatible: ['linux,pwmdac-dit']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/syscon@104a0000: failed to match any schema with compatible: ['starfive,jh7100-sysaudio', 'syscon']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/usb@104c0000: failed to match any schema with compatible: ['starfive,jh7100-usb']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/dma-controller@10500000: failed to match any schema with compatible: ['starfive,jh7100-axi-dma']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/otp@11810000: failed to match any schema with compatible: ['starfive,fu740-otp']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/spi@11860000/nor-flash@0: failed to match any schema with compatible: ['spi-flash']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/spi@11860000/nand-flash@1: failed to match any schema with compatible: ['spi-flash-nand']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/trng@118d0000: failed to match any schema with compatible: ['starfive,vic-rng']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/vpu_enc@118e0000: failed to match any schema with compatible: ['cm,cm521-vpu']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: vpu_dec@118f0000: compatible:0: 'c&m,cm511-vpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/vpu_dec@118f0000: failed to match any schema with compatible: ['c&m,cm511-vpu']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/coadj12@11900000: failed to match any schema with compatible: ['cm,codaj12-jpu-1']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/nvdla@11940000: failed to match any schema with compatible: ['nvidia,nvdla_os_initial']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['starfive,display-subsystem']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/display-encoder: failed to match any schema with compatible: ['starfive,display-encoder']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/crtc@12000000: failed to match any schema with compatible: ['starfive,jh7100-crtc']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /soc/xrp@f0000000: failed to match any schema with compatible: ['cdns,xrp']
--
   arch/riscv/boot/dts/starfive/jh7100.dtsi:843.10-844.6: Warning (unit_address_vs_reg): /soc/xrp@f0000000/dsp@0: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:398.40-401.5: Warning (simple_bus_reg): /soc/spdif-transmitter: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:403.34-406.5: Warning (simple_bus_reg): /soc/spdif-receiver: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:408.36-411.5: Warning (simple_bus_reg): /soc/pwmdac-transmitter: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:413.20-416.5: Warning (simple_bus_reg): /soc/dmic: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:418.19-440.5: Warning (simple_bus_reg): /soc/snd-card: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:671.30-675.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:677.28-680.5: Warning (simple_bus_reg): /soc/display-encoder: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: cpu@0: Unevaluated properties are not allowed ('starfive,itim' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: cpu@1: Unevaluated properties are not allowed ('starfive,itim' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: soc: spdif-receiver: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: soc: display-encoder: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: soc: display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: soc: snd-card: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: soc: pwmdac-transmitter: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: soc: spdif-transmitter: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: soc: dmic: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/dtim@1000000: failed to match any schema with compatible: ['starfive,dtim0']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/itim@1808000: failed to match any schema with compatible: ['starfive,itim0']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/itim@1820000: failed to match any schema with compatible: ['starfive,itim0']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/dma-controller@100b0000: failed to match any schema with compatible: ['starfive,jh7100-axi-dma']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/crypto@100d0000: failed to match any schema with compatible: ['starfive,vic-sec']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/i2sadc0@10400000: failed to match any schema with compatible: ['snps,designware-i2sadc0']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/i2svad@10420000: failed to match any schema with compatible: ['starfive,sf-i2svad']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/pwmdac@10440000: failed to match any schema with compatible: ['starfive,pwmdac']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/i2sdac0@10450000: failed to match any schema with compatible: ['snps,designware-i2sdac0']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/i2sdac1@10460000: failed to match any schema with compatible: ['snps,designware-i2sdac1']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/i2sdac16k@10470000: failed to match any schema with compatible: ['snps,designware-i2sdac16k']
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/spdif-receiver: failed to match any schema with compatible: ['linux,spdif-dir']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/pwmdac-transmitter: failed to match any schema with compatible: ['linux,pwmdac-dit']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/syscon@104a0000: failed to match any schema with compatible: ['starfive,jh7100-sysaudio', 'syscon']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/usb@104c0000: failed to match any schema with compatible: ['starfive,jh7100-usb']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/dma-controller@10500000: failed to match any schema with compatible: ['starfive,jh7100-axi-dma']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/otp@11810000: failed to match any schema with compatible: ['starfive,fu740-otp']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/spi@11860000/nor-flash@0: failed to match any schema with compatible: ['spi-flash']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/spi@11860000/nand-flash@1: failed to match any schema with compatible: ['spi-flash-nand']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/trng@118d0000: failed to match any schema with compatible: ['starfive,vic-rng']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/vpu_enc@118e0000: failed to match any schema with compatible: ['cm,cm521-vpu']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: vpu_dec@118f0000: compatible:0: 'c&m,cm511-vpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/vpu_dec@118f0000: failed to match any schema with compatible: ['c&m,cm511-vpu']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/coadj12@11900000: failed to match any schema with compatible: ['cm,codaj12-jpu-1']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/nvdla@11940000: failed to match any schema with compatible: ['nvidia,nvdla_os_initial']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['starfive,display-subsystem']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/display-encoder: failed to match any schema with compatible: ['starfive,display-encoder']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/crtc@12000000: failed to match any schema with compatible: ['starfive,jh7100-crtc']
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: /soc/xrp@f0000000: failed to match any schema with compatible: ['cdns,xrp']
--
   arch/riscv/boot/dts/starfive/jh7100.dtsi:843.10-844.6: Warning (unit_address_vs_reg): /soc/xrp@f0000000/dsp@0: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:398.40-401.5: Warning (simple_bus_reg): /soc/spdif-transmitter: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:403.34-406.5: Warning (simple_bus_reg): /soc/spdif-receiver: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:408.36-411.5: Warning (simple_bus_reg): /soc/pwmdac-transmitter: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:413.20-416.5: Warning (simple_bus_reg): /soc/dmic: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:418.19-440.5: Warning (simple_bus_reg): /soc/snd-card: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:671.30-675.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/riscv/boot/dts/starfive/jh7100.dtsi:677.28-680.5: Warning (simple_bus_reg): /soc/display-encoder: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: cpu@0: Unevaluated properties are not allowed ('starfive,itim' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: cpu@1: Unevaluated properties are not allowed ('starfive,itim' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: soc: pwmdac-transmitter: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: soc: display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: soc: spdif-receiver: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: soc: snd-card: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: soc: dmic: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: soc: display-encoder: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: soc: spdif-transmitter: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/dtim@1000000: failed to match any schema with compatible: ['starfive,dtim0']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/itim@1808000: failed to match any schema with compatible: ['starfive,itim0']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/itim@1820000: failed to match any schema with compatible: ['starfive,itim0']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/dma-controller@100b0000: failed to match any schema with compatible: ['starfive,jh7100-axi-dma']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/crypto@100d0000: failed to match any schema with compatible: ['starfive,vic-sec']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/i2sadc0@10400000: failed to match any schema with compatible: ['snps,designware-i2sadc0']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/i2svad@10420000: failed to match any schema with compatible: ['starfive,sf-i2svad']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/pwmdac@10440000: failed to match any schema with compatible: ['starfive,pwmdac']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/i2sdac0@10450000: failed to match any schema with compatible: ['snps,designware-i2sdac0']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/i2sdac1@10460000: failed to match any schema with compatible: ['snps,designware-i2sdac1']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/i2sdac16k@10470000: failed to match any schema with compatible: ['snps,designware-i2sdac16k']
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/spdif-receiver: failed to match any schema with compatible: ['linux,spdif-dir']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/pwmdac-transmitter: failed to match any schema with compatible: ['linux,pwmdac-dit']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/syscon@104a0000: failed to match any schema with compatible: ['starfive,jh7100-sysaudio', 'syscon']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/usb@104c0000: failed to match any schema with compatible: ['starfive,jh7100-usb']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/dma-controller@10500000: failed to match any schema with compatible: ['starfive,jh7100-axi-dma']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/otp@11810000: failed to match any schema with compatible: ['starfive,fu740-otp']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/spi@11860000/nor-flash@0: failed to match any schema with compatible: ['spi-flash']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/spi@11860000/nand-flash@1: failed to match any schema with compatible: ['spi-flash-nand']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/trng@118d0000: failed to match any schema with compatible: ['starfive,vic-rng']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/vpu_enc@118e0000: failed to match any schema with compatible: ['cm,cm521-vpu']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: vpu_dec@118f0000: compatible:0: 'c&m,cm511-vpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/vpu_dec@118f0000: failed to match any schema with compatible: ['c&m,cm511-vpu']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/coadj12@11900000: failed to match any schema with compatible: ['cm,codaj12-jpu-1']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/nvdla@11940000: failed to match any schema with compatible: ['nvidia,nvdla_os_initial']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['starfive,display-subsystem']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/display-encoder: failed to match any schema with compatible: ['starfive,display-encoder']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/crtc@12000000: failed to match any schema with compatible: ['starfive,jh7100-crtc']
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: /soc/xrp@f0000000: failed to match any schema with compatible: ['cdns,xrp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
