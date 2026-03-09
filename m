Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF693368BD
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Mar 2026 01:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773018929; cv=none; b=bR0Jvf+1MPsdHJ0hQee3/vJrXoBpR7ATU1KPGaZ8ObkzL/UAsj02wNRSGBQPdL1z5zlQRdFgjL8i4F3+dIqyCj5CIONl3jcM3Idl7G90JVZwm3MWZBo64Oo1KCpK6tEhEUyxMbLNJAIMdF73J8TWAnTbmzs6TCWVS6piVmgKs0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773018929; c=relaxed/simple;
	bh=lLDGcr1Gm3sZ6+NSbxwCRUdGjedr7p2z34hHef6S+Xg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OKIvwRxjDBvCBq6ivUyAv7+pxGC/RzAk7OX66lwBZOfsQgX/QgXCpW677uPbh/+Gbm2rSFGfsA25NztGvRPGs0X82bo8wpqgA0r3iUCrV4IS18dVYc4y0c+wb8eBHZZzl8kRqsvFnY2WdoV4AJrs6w+34KWYzEGc8fj8jldn5F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QP9YZH5l; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QP9YZH5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773018926; x=1804554926;
  h=date:from:to:cc:subject:message-id;
  bh=lLDGcr1Gm3sZ6+NSbxwCRUdGjedr7p2z34hHef6S+Xg=;
  b=QP9YZH5lDuDXtgxQZ3rFzFnsnWyHGGP5lC5oFrSWPsykQDDSOTi2Tl+f
   05nUXkI43fWM3PuoJnqGiI+7mkvQAGSpMsOartvjTuI/YgrSDqUyd1g5u
   KgZ2pMG68xULsPH3VwwHQLcGU4QrHhS/KojZ+ff3NiRG9eUzyBNRDpJix
   rQkneW+Fan6p4/YelbiXjJxitj2Ai78WRn3o2ZjNMH7lcQ0S7pN3JFRoU
   +w12pif5fqeJeCBH2a2rPq7lqTwemjEdWrsv9rjFNnHMBqQt9QtgZY71V
   3ik7PMbRg9ngtl8cO1Y5MNw9NI6ED/VQDBl4XKs1a/31v6k8sBWDtkZV9
   Q==;
X-CSE-ConnectionGUID: kysEH4iVS/K2BOScsdWbLQ==
X-CSE-MsgGUID: g2LoVLmhQEezGxg2TxyqUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77641149"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="77641149"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 18:15:26 -0700
X-CSE-ConnectionGUID: gusduM9eQRSf+lN4OssTOQ==
X-CSE-MsgGUID: 4MOGkw6ISqCwgvws8hqJLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="216584087"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 08 Mar 2026 18:15:25 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzPDP-000000002mv-0BGj;
	Mon, 09 Mar 2026 01:15:23 +0000
Date: Mon, 09 Mar 2026 02:15:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb:
 ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): compatible: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202603090208.MKviPgtR-lkp@intel.com>
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
head:   014441d1e4b2f5be728433b761df3377dee7a487
commit: 1f9793a4d5188cddc0eb69d7840b7c5c57c939a6 dt-bindings: mfd: Document control-scb and sysreg-scb on pic64gx
date:   4 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-2052-20260307 (https://download.01.org/0day-ci/archive/20260309/202603090208.MKviPgtR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603090208.MKviPgtR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603090208.MKviPgtR-lkp@intel.com/

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
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
