Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7E738E8C6
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 11:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787486080; cv=none; b=YMGZK7bkCtkpzdl7Fp/QuQ3EyuoUja2+vw0TEGbqeF9gKrRGgUPNGoCGbMUYJRbdZ7cQFL2j4XrXOGw9SFrkhD0oYVDB2Z/Uk8UplLdnbuRn2ZFQtsUG8opTx0ZcRSd+Pdm0W4PEES51M4R3+ufuAQYlIUlNqAmYshcLLH2hC68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787486080; c=relaxed/simple;
	bh=P2sz2+O7sW87H/8bM6cyRPh7cChTLmyF4FvQWSWElN0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L/r6DRvzJgZ0pTDY+Cd79wrY1le1+f2ttDIxsG2c/dTmwiI1AZtkdVpKoc3xr1xzG1mmqxbwv5r1c1/CK8O3W8X1+u+VJypCMyEHm577gJFVdHwE4cKnErzwUwMTfMfFc2EMZKsf6zuFs/grrFk73tQ1XHrb3oYmdcCKmAB/Baw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AzX5u73G; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AzX5u73G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787486078; x=1819022078;
  h=date:from:to:cc:subject:message-id;
  bh=P2sz2+O7sW87H/8bM6cyRPh7cChTLmyF4FvQWSWElN0=;
  b=AzX5u73GYhZKQJsFKrXL5xGybuNlkWyc2gwmqz6pyRWj1NYdlR9Su5dK
   YZsgOU29LzNn1ERYA/IKkJTtMEPZafS+0wx5cqzoay6RGdqdBbeqHcYGx
   1HyCu1XkmkrOcms5/bwjxKaRNfOOeih4M6F+KS9PIFfQWNnudyEWQcJzO
   BAFerg6nY7qYqg9zsCtoi7hRVFoXLLHCoBhuBvszYclbBj+tfpCGVMxwr
   5Nw8ykU4iIaJ68pGotzdF4xwJBf2bvE+KkvybF7RaU/TC0R/n65TAPQ3y
   7zrII0a3J8xEy4/vUZAuY4XWADBY96dUd/mTxY+ZPdKelcKmMC3YYVHja
   g==;
X-CSE-ConnectionGUID: IIfIdPDcSOSbvmMs0H3CBw==
X-CSE-MsgGUID: 7lRVpriiR6uLrJxzE0xp7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87882900"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87882900"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 04:54:38 -0700
X-CSE-ConnectionGUID: ektW4d7VSSeMpmD8sAV4TA==
X-CSE-MsgGUID: 408sD9ONRtGIufXgpS6i7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="266803246"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 23 Aug 2026 04:54:37 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wy6mY-0000000000l-2FL0;
	Sun, 23 Aug 2026 11:54:34 +0000
Date: Sun, 23 Aug 2026 13:54:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/st/stih418-b2264.dtb: spifsm@9022000
 (st,spi-fsm): 'oneOf' conditional failed, one must be fixed:
Message-ID: <202608231356.6esfMpD7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Akhila YS <akhilayalmati@gmail.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2709dd5ae32f0828f386327c76bba9f39f63a1c6
commit: 90541270967837c996631faa94e43d465e2a20c7 dt-bindings: mtd: st,spi-fsm: convert to DT schema
date:   7 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-2054-20260819 (https://download.01.org/0day-ci/archive/20260823/202608231356.6esfMpD7-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project daa9d09970fed49996f42a8f7000b584f295991d)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608231356.6esfMpD7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 905412709678 ("dt-bindings: mtd: st,spi-fsm: convert to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608231356.6esfMpD7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/sdhci@9060000: failed to match any schema with compatible: ['st,sdhci-stih407', 'st,sdhci']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/sdhci@9060000: failed to match any schema with compatible: ['st,sdhci-stih407', 'st,sdhci']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/sdhci@9080000: failed to match any schema with compatible: ['st,sdhci-stih407', 'st,sdhci']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/sdhci@9080000: failed to match any schema with compatible: ['st,sdhci-stih407', 'st,sdhci']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/lpc@8787000: failed to match any schema with compatible: ['st,stih407-lpc']
   arch/arm/boot/dts/st/stih418-b2264.dtb: lpc@8787000 (st,stih407-lpc): st,lpc-mode: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/lpc@8788000: failed to match any schema with compatible: ['st,stih407-lpc']
   arch/arm/boot/dts/st/stih418-b2264.dtb: lpc@8788000 (st,stih407-lpc): st,lpc-mode: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/stih418-b2264.dtb: spifsm@9022000 (st,spi-fsm): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/st,spi-fsm.yaml
>> arch/arm/boot/dts/st/stih418-b2264.dtb: spifsm@9022000 (st,spi-fsm): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/st,spi-fsm.yaml
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/dwc3@8f94000: failed to match any schema with compatible: ['st,stih407-dwc3']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/pwm@9810000: failed to match any schema with compatible: ['st,sti-pwm']
   arch/arm/boot/dts/st/stih418-b2264.dtb: pwm@9810000 (st,sti-pwm): st,pwm-num-chan: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/pwm@9510000: failed to match any schema with compatible: ['st,sti-pwm']
   arch/arm/boot/dts/st/stih418-b2264.dtb: pwm@9510000 (st,sti-pwm): st,pwm-num-chan: b'\x00\x00\x00\x04' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/dwmac@9630000: failed to match any schema with compatible: ['st,stih407-dwmac', 'snps,dwmac', 'snps,dwmac-3.710']
   arch/arm/boot/dts/st/stih418-b2264.dtb: dwmac@9630000 (st,stih407-dwmac): st,tx-retime-src: b'clkgen\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
