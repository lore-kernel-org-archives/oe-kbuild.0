Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E60B21CC68
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 01:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764208596; cv=none; b=lRIV7bb7Etk7idLOmrzOjSzEeJ/87iMoUtVVk7u7vWKjB7mhcJ5lTRfbtaKsdI7Riwp0vYOOQ12npnlZQ4eLTY/0Bs94ae78yQs0h/tvPyKAf8wU7SKLTyGgBQwDRtgqLO36D4GFGTIImMzPtAh+wt3EQb9lNVlB8AYkQiSy8Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764208596; c=relaxed/simple;
	bh=1q3sUi+PskvEB57cnc4uOXUq0UWtIx4Ug209pZk+uq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hF3p/yMbnrphxAS0N3fCn0gpaqaB/VI8/NTwlhaxvZljdab1ADvnb7lysxW+2IJ4twXLhUujRJRFT9f4tzM87/3J/2DlI0Ur5MJqyTE0SaJg3YS1fxkCyDWmu27BDwp5jIluvimVi8iAKG5PevcAaRd7G+lCd0fXm8/bH4vh0II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcN06B/W; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcN06B/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764208594; x=1795744594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1q3sUi+PskvEB57cnc4uOXUq0UWtIx4Ug209pZk+uq0=;
  b=bcN06B/WKpdO6+GLq1KiFGMztZeIVjHkDmVnJKR68D2TpKRwsWNGodMc
   TO7gc8/WPYlNGe7MyZExW1LlG1x9TB+F47X/aMXZBj21psTe4umrMOhRk
   oSDKR5PJ1QDSyJWcFWIuDqTJPXPJ0bjYBSyQofR4iDixViY9rtZ2ED56X
   V+Qpwwa1XD1woNbLXgB+3OB2HWk2w7MF//BevIgnLa/P5dU5CXwOOUdwr
   aRw1za/xhsqRHLmlbsapFKd32pDc2/OEaXh9eCdCOwA4SyLmMPuX6nVUf
   sA9bUd673zTGGm/kpoBeqdDfJXSjRp4Sc59nxSXaqh7CYyS55eVlXtu0x
   g==;
X-CSE-ConnectionGUID: cAi19LqfQqucS3UUx/qYxw==
X-CSE-MsgGUID: e8Rx73fySGeubu4UbpwsPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="53820835"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="53820835"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 17:56:34 -0800
X-CSE-ConnectionGUID: BDz7MYm/SeOnJIVLLeXDvw==
X-CSE-MsgGUID: 7+YbuTN+S1ypvAW1ATRL0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="197581333"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 26 Nov 2025 17:56:33 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vORFG-000000001a1-2MEk;
	Thu, 27 Nov 2025 01:56:30 +0000
Date: Thu, 27 Nov 2025 02:56:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lee-mfd:for-mfd-next 37/44]
 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000
 (microchip,sama7d65-ddr3phy): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202511270232.OZTu0YyA-lkp@intel.com>
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
CC: Lee Jones <lee@kernel.org>
TO: Conor Dooley <conor.dooley@microchip.com>
CC: Lee Jones <lee@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   44c603f35cad3f3b0f58fece99502d81620da9b2
commit: 1f9793a4d5188cddc0eb69d7840b7c5c57c939a6 [37/44] dt-bindings: mfd: Document control-scb and sysreg-scb on pic64gx
:::::: branch date: 2 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-2051-20251124 (https://download.01.org/0day-ci/archive/20251127/202511270232.OZTu0YyA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270232.OZTu0YyA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511270232.OZTu0YyA-lkp@intel.com/

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
