Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768E61BD9D2
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Feb 2025 09:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266792; cv=none; b=BCQvRdCfU9mUW3tt9K2/pUgdNJAf5Gu5sC6kvPBoKqY+Z+mrOmy0OgKuqU3Cf6U3EVEe8qnB787bcMSLj4r3a0fsBb78WOuqrKsCMjOjYonCiK772NcRDIMGhJC+eJMUMA1MyPNUukdy3dvSnW5aqLswJZEli9uuDAiGE+tNNyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266792; c=relaxed/simple;
	bh=VJBVWIAlOvQJkTO29c+2RuU5ETkfP18hNSjIiJMOUHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cm5Ea8maHOVg7y2Olj1mLmIjSoqh5FsZpR7fTAuWkSU5itFu5MqeaykSB3sMLFLlGxEQlSIjwl2MzwJ42/HZyewMpOzsseOvZvazICZi2puNGUwum5p0RGYMrSiYgzQ7Fy9s4odg5zKx2G+QddnZyMOb7Y9aNP7B++jpy7MC8YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/F6Coua; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/F6Coua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739266790; x=1770802790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VJBVWIAlOvQJkTO29c+2RuU5ETkfP18hNSjIiJMOUHw=;
  b=V/F6CouahgdOwMzpX/abyBKJBCvgcsX6h1Dbob1mrYyv6I/x3xLq0FCV
   TXzSI96N6WqzyP97DCKCFqDtVeGfZdkcJnvNlnOfOoE82CQXJXjYVys86
   vQjS6NKvtkKNBJ3o5KZ37WxInjsGUH03sv4a1PyDGygyyD3MDnuuoFrT7
   xmv+Keqwp6EXNYPgHAU8r7crSNEpUA/b3lXDpHInII7bHzb3M0fs5jU+N
   7B0tKtMqaJLHrmRepoimnxsxMJOqrOFSMMhb3s5J5xq30Ws4bVPYz4wDa
   qkHYe2wRsob8asB/btjjuUg/s9t4kgep/rUve13di72H0qf0oPB/7P6vL
   Q==;
X-CSE-ConnectionGUID: sY9ryRMVSS+KdGWOSu4m7w==
X-CSE-MsgGUID: sWmXWqQ2SAujEHE38jZ+Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="57415129"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="57415129"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 01:39:48 -0800
X-CSE-ConnectionGUID: jPaHoa32RrSP0Q9O894DBg==
X-CSE-MsgGUID: b9oW0/RzQnWGlsfZezOv9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112926696"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Feb 2025 01:39:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thmk4-0013yv-0H;
	Tue, 11 Feb 2025 09:39:44 +0000
Date: Tue, 11 Feb 2025 17:39:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:visionfive 32/33]
 arch/riscv/boot/dts/starfive/jh7100-common.dtsi:129.10-133.5: Warning
 (unit_address_vs_reg): /soc/display-encoder/ports/port@0: node has a unit
 name, but no reg or ranges property
Message-ID: <202502111712.IfLvuM0j-lkp@intel.com>
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
head:   dcb5a245dbe2203ae35f6b1b5cb28929f758008c
commit: 1e7604c724509e9de68705412bc1fbd82d2219eb [32/33] riscv: dts: Add full JH7100, Starlight and VisionFive support
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: riscv-randconfig-051-20250211 (https://download.01.org/0day-ci/archive/20250211/202502111712.IfLvuM0j-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502111712.IfLvuM0j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502111712.IfLvuM0j-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/starfive/jh7100-common.dtsi:129.10-133.5: Warning (unit_address_vs_reg): /soc/display-encoder/ports/port@0: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/starfive/jh7100-common.dtsi:135.10-139.5: Warning (unit_address_vs_reg): /soc/display-encoder/ports/port@1: node has a unit name, but no reg or ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:843.10-844.6: Warning (unit_address_vs_reg): /soc/xrp@f0000000/dsp@0: node has a unit name, but no reg or ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:398.40-401.5: Warning (simple_bus_reg): /soc/spdif-transmitter: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:403.34-406.5: Warning (simple_bus_reg): /soc/spdif-receiver: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:408.36-411.5: Warning (simple_bus_reg): /soc/pwmdac-transmitter: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:413.20-416.5: Warning (simple_bus_reg): /soc/dmic: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:418.19-440.5: Warning (simple_bus_reg): /soc/snd-card: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:671.30-675.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:677.28-680.5: Warning (simple_bus_reg): /soc/display-encoder: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	'beagle,beaglev-starlight-jh7100-a1' is not one of ['beagle,beaglev-starlight-jh7100-r0', 'starfive,visionfive-v1']
   	'beagle,beaglev-starlight-jh7100-a1' is not one of ['deepcomputing,fml13v01', 'milkv,mars', 'pine64,star64', 'starfive,visionfive-2-v1.2a', 'starfive,visionfive-2-v1.3b']
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
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: soc: spdif-transmitter: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: soc: pwmdac-transmitter: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: soc: display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: soc: spdif-receiver: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight-a1.dtb: soc: snd-card: 'ranges' is a required property
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
>> arch/riscv/boot/dts/starfive/jh7100-common.dtsi:129.10-133.5: Warning (unit_address_vs_reg): /soc/display-encoder/ports/port@0: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/starfive/jh7100-common.dtsi:135.10-139.5: Warning (unit_address_vs_reg): /soc/display-encoder/ports/port@1: node has a unit name, but no reg or ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:843.10-844.6: Warning (unit_address_vs_reg): /soc/xrp@f0000000/dsp@0: node has a unit name, but no reg or ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:398.40-401.5: Warning (simple_bus_reg): /soc/spdif-transmitter: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:403.34-406.5: Warning (simple_bus_reg): /soc/spdif-receiver: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:408.36-411.5: Warning (simple_bus_reg): /soc/pwmdac-transmitter: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:413.20-416.5: Warning (simple_bus_reg): /soc/dmic: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:418.19-440.5: Warning (simple_bus_reg): /soc/snd-card: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:671.30-675.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:677.28-680.5: Warning (simple_bus_reg): /soc/display-encoder: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: cpu@0: Unevaluated properties are not allowed ('starfive,itim' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: cpu@1: Unevaluated properties are not allowed ('starfive,itim' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: soc: display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: soc: pwmdac-transmitter: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: soc: spdif-transmitter: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: soc: spdif-receiver: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: soc: snd-card: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: soc: dmic: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: soc: display-encoder: 'ranges' is a required property
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
>> arch/riscv/boot/dts/starfive/jh7100-common.dtsi:129.10-133.5: Warning (unit_address_vs_reg): /soc/display-encoder/ports/port@0: node has a unit name, but no reg or ranges property
   arch/riscv/boot/dts/starfive/jh7100-common.dtsi:135.10-139.5: Warning (unit_address_vs_reg): /soc/display-encoder/ports/port@1: node has a unit name, but no reg or ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:843.10-844.6: Warning (unit_address_vs_reg): /soc/xrp@f0000000/dsp@0: node has a unit name, but no reg or ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:398.40-401.5: Warning (simple_bus_reg): /soc/spdif-transmitter: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:403.34-406.5: Warning (simple_bus_reg): /soc/spdif-receiver: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:408.36-411.5: Warning (simple_bus_reg): /soc/pwmdac-transmitter: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:413.20-416.5: Warning (simple_bus_reg): /soc/dmic: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:418.19-440.5: Warning (simple_bus_reg): /soc/snd-card: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:671.30-675.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:677.28-680.5: Warning (simple_bus_reg): /soc/display-encoder: missing or empty reg/ranges property
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: cpu@0: Unevaluated properties are not allowed ('starfive,itim' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: cpu@1: Unevaluated properties are not allowed ('starfive,itim' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: soc: display-encoder: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: soc: pwmdac-transmitter: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: soc: dmic: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: soc: display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: soc: spdif-receiver: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: soc: spdif-transmitter: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: soc: snd-card: 'ranges' is a required property
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

vim +129 arch/riscv/boot/dts/starfive/jh7100-common.dtsi

1e7604c724509e Emil Renner Berthing 2021-10-31  123  
1e7604c724509e Emil Renner Berthing 2021-10-31  124  &encoder {
1e7604c724509e Emil Renner Berthing 2021-10-31  125  	encoder-type = <2>; // 2-TMDS, 3-LVDS, 6-DSI, 8-DPI
1e7604c724509e Emil Renner Berthing 2021-10-31  126  	status = "okay";
1e7604c724509e Emil Renner Berthing 2021-10-31  127  
1e7604c724509e Emil Renner Berthing 2021-10-31  128  	ports {
1e7604c724509e Emil Renner Berthing 2021-10-31 @129  		port@0 {
1e7604c724509e Emil Renner Berthing 2021-10-31  130  			hdmi_out: endpoint {
1e7604c724509e Emil Renner Berthing 2021-10-31  131  				remote-endpoint = <&tda998x_0_input>;
1e7604c724509e Emil Renner Berthing 2021-10-31  132  			};
1e7604c724509e Emil Renner Berthing 2021-10-31  133  		};
1e7604c724509e Emil Renner Berthing 2021-10-31  134  
1e7604c724509e Emil Renner Berthing 2021-10-31  135  		port@1 {
1e7604c724509e Emil Renner Berthing 2021-10-31  136  			hdmi_input0: endpoint {
1e7604c724509e Emil Renner Berthing 2021-10-31  137  				remote-endpoint = <&crtc_0_out>;
1e7604c724509e Emil Renner Berthing 2021-10-31  138  			};
1e7604c724509e Emil Renner Berthing 2021-10-31  139  		};
1e7604c724509e Emil Renner Berthing 2021-10-31  140  
1e7604c724509e Emil Renner Berthing 2021-10-31  141  	};
1e7604c724509e Emil Renner Berthing 2021-10-31  142  };
1e7604c724509e Emil Renner Berthing 2021-10-31  143  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
