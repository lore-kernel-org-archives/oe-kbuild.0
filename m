Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C787430C153
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Jun 2026 16:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781800645; cv=none; b=uUscBcm1RvSQybYx//1mHh9AszEMdozmikhRmJgy9YF/8tiZuB8SYC91ynhqKTXqhe33swyiyIltLS14EPwWNDoujVUNobp6YeNgKs2fP4zrL88fA2HrYqitlzyigACHgKIWLP5Z8CKUkjDDvRxtC04b55y8c0SAjbMBML08aXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781800645; c=relaxed/simple;
	bh=/vj7Q9uLsmjS31Rap8w0vROsUUs0+QEZpGFV/NEuVws=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uUZHmmefrMjfZPCTzrG8L6L2q6l/1SuBA1cZYSFfrHDrhvt3kPHeGUEZgCCgnqzAyctm1aupKd1GKLBLpe2vMQV2a+IPlPOijhmDL9M35KomqBSgVpI3KEeWeo2jr+7vG/xeP2Ewv0a+9hoEImKOAkv1NUAenHPdVmH0XbcBt5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SyYThzDG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SyYThzDG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781800644; x=1813336644;
  h=date:from:to:cc:subject:message-id;
  bh=/vj7Q9uLsmjS31Rap8w0vROsUUs0+QEZpGFV/NEuVws=;
  b=SyYThzDGHa4vZvbiWNpXrSxaImA+eEWJr7PSgshMr13DvDSgUx6as19A
   e0bG/kZeLJjizE/zPAZoR2hQ99PbaOE28PP0vcd82ilVx5PoCvBiKOHOo
   lIeJjkkf0cDgBCSuevXQOyahBQEENsUZTTwVaGk40lULF1Op1DFqDKsUH
   5a1QoueQPfCyy20VLSw5ISOfd2PXpXhjpMsFCKIQRhMyTXEqGoOxel1wZ
   rCLNOYxiaHstkbYw2cuiyHzy7p3Cs8QjNu8D3nMrw6EHRP6r+FCpO3g0K
   p0jTpSMDaPMpNrRTUyybt5voIJx1e/nI2oiPWHm8uXeNv58MLNkzgSvRd
   Q==;
X-CSE-ConnectionGUID: /oIT1TmcQlWZV/nY1x2oCQ==
X-CSE-MsgGUID: n96PGzCrRXOLJApU/+RPZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82537146"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="82537146"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 09:37:23 -0700
X-CSE-ConnectionGUID: 5Wu3bp+0TRShv0oABAr27w==
X-CSE-MsgGUID: XGX3HmodRHG3FUpXm3ElRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="244255382"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 18 Jun 2026 09:37:22 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1waFk0-000000005XJ-1EQE;
	Thu, 18 Jun 2026 16:37:20 +0000
Date: Thu, 18 Jun 2026 18:37:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb:
 ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): compatible: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202606181850.ryH7t4pH-lkp@intel.com>
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
TO: Conor Dooley <conor.dooley@microchip.com>
CC: Lee Jones <lee@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e771677c937da5808f7b6c1f0e4a97ec1a84f8a8
commit: 1f9793a4d5188cddc0eb69d7840b7c5c57c939a6 dt-bindings: mfd: Document control-scb and sysreg-scb on pic64gx
date:   7 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-2051-20260617 (https://download.01.org/0day-ci/archive/20260618/202606181850.ryH7t4pH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606181850.ryH7t4pH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1f9793a4d518 ("dt-bindings: mfd: Document control-scb and sysreg-scb on pic64gx")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606181850.ryH7t4pH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: flexcom@e182c000 (microchip,sama7d65-flexcom): i2c@600:#size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,sama5d2-flexcom.yaml
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: i2c@600 (microchip,sama7d65-i2c): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/atmel,at91sam-i2c.yaml
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: i2c@600 (microchip,sama7d65-i2c): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7d65-uddrc', 'microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7d65-uddrc', 'microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): compatible: ['microchip,sama7d65-ddr3phy', 'microchip,sama7g5-ddr3phy'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-ddr3phy', 'microchip,sama7g5-ddr3phy'] is too short
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	'syscon' was expected
   	'microchip,mpfs-control-scb' was expected
   	'microchip,mpfs-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
--
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: timer@e2814000 (atmel,sama5d2-tcb): clock-names: ['t0_clk', 't1_clk', 't2_clk', 'slow_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: timer@e2814000 (atmel,sama5d2-tcb): clocks: [[2, 2, 88], [2, 2, 89], [2, 2, 90], [17, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: ['microchip,sama7g5-ddr3phy'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: ['microchip,sama7g5-ddr3phy'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
>> arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7g5-ddr3phy'] is too short
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
--
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: timer@e2814000 (atmel,sama5d2-tcb): clock-names: ['t0_clk', 't1_clk', 't2_clk', 'slow_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: timer@e2814000 (atmel,sama5d2-tcb): clocks: [[2, 2, 88], [2, 2, 89], [2, 2, 90], [16, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: ['microchip,sama7g5-ddr3phy'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: ['microchip,sama7g5-ddr3phy'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
>> arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7g5-ddr3phy'] is too short
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
