Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1883EAC6B
	for <oe-kbuild@lists.linux.dev>; Fri, 15 May 2026 22:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778884432; cv=none; b=jYpHNAGw90uw62esRKOTxbO0PmXN7mCb6SpYVf07YcKUczrkW4gw7bjl+ENtBq0Kipb7227FcnFbNHOjbjFfTe9m9t98Si1eWm3R75xJuoJA0n03+jA93G+jmYepRum9Y+wqDiWS1vvNE9lcEF8ZovJJ5kx84TSLQk1VM/OOFUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778884432; c=relaxed/simple;
	bh=yRCWoSRqBZ+h1FK0WJjQXvPsKwGFySF1iyXutkkF1J0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qEWY9oKx1wexl7aj/klZ1N1C1+yXaI/h4q9HfY8igSZvCaGF4jOt9JfnI8NBXqLXY7EsNlbGqP762wTC/DoEWJ8QYWM0D1bnIEvukRyE3zbW6zcMNWIR1aLbiTj4E8CMb4vnXj/JyFw2XVmBrreLQMzwWrXEknGWj95RfaHh8JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XKCO1H0O; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKCO1H0O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778884431; x=1810420431;
  h=date:from:to:cc:subject:message-id;
  bh=yRCWoSRqBZ+h1FK0WJjQXvPsKwGFySF1iyXutkkF1J0=;
  b=XKCO1H0On1MDdn7z6NKC48/uFZT5XmbsIurfJlN4mfTNoN6asxPLEszL
   ieOaLXiVt/7glL+YWg3KH0V60VDGVxyHMNud3HVmlECXNyeoTuNwc5e2x
   VrccqQ4oD2QjFmOtTcsVo5UM2wKSi/TiaExd3z3s2hsqD58/QSh7U1654
   X/FhLtoWvIbW3/Dru8Pot4eWr4nPjJKrOvH0c9cbmiZelXkLeIe+1g5Kr
   Pl15DcFrA+CHP2Z/9/+4h95KLTwDOUqwKDpOH9hs6UCOI+djMvDTKr3Zz
   AbQanCZcqr3ygO4TFfgPL0w+PJ25VMjZPa+fHOmmIK2W6Qq0Wk9nHJU+J
   A==;
X-CSE-ConnectionGUID: cEbMZ1osSwSjnFU8PloboA==
X-CSE-MsgGUID: KlUmdDmdQnmS409puCLQSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="80014838"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="80014838"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 15:33:50 -0700
X-CSE-ConnectionGUID: hqQWwtLLQbixjbRXAHrLSQ==
X-CSE-MsgGUID: rGCUei4qRkeZoYpAcm08yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="236173580"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2026 15:33:17 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO15n-0000000097X-13U1;
	Fri, 15 May 2026 22:33:15 +0000
Date: Sat, 16 May 2026 00:32:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/renesas/r8a7790-lager.dtb: i2c-mux1
 (i2c-demux-pinctrl): i2c-parent:0: [99, 100] is too long
Message-ID: <202605160054.EO9Vljlb-lkp@intel.com>
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
TO: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e1914add2799225a87502051415fc5c32aeb02ae
commit: 26f3ac8848354f493dc6e8fb687c7c7e1a7488af dt-bindings: PCI: Add binding for Toshiba TC9563 PCIe switch
date:   6 months ago
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
config: arm-randconfig-2051-20260513 (https://download.01.org/0day-ci/archive/20260516/202605160054.EO9Vljlb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160054.EO9Vljlb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 26f3ac884835 ("dt-bindings: PCI: Add binding for Toshiba TC9563 PCIe switch")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605160054.EO9Vljlb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/renesas/r8a7790-lager.dtb: /soc/spi@e6e10000/pmic@0: failed to match any schema with compatible: ['renesas,r2a11302ft']
>> arch/arm/boot/dts/renesas/r8a7790-lager.dtb: i2c-mux1 (i2c-demux-pinctrl): i2c-parent:0: [99, 100] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
>> arch/arm/boot/dts/renesas/r8a7790-lager.dtb: i2c-mux2 (i2c-demux-pinctrl): i2c-parent:0: [101, 102, 103] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
>> arch/arm/boot/dts/renesas/r8a7790-lager.dtb: i2c-mux3 (i2c-demux-pinctrl): i2c-parent:0: [104, 105, 106] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
>> arch/arm/boot/dts/renesas/r8a7790-lager.dtb: i2c-mux4 (i2c-demux-pinctrl): i2c-parent:0: [115, 116] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
--
   arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: /soc/spi@e6e20000/pmic@0: failed to match any schema with compatible: ['renesas,r2a11302ft']
>> arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: i2c-mux1 (i2c-demux-pinctrl): i2c-parent:0: [82, 83] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
>> arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: i2c-mux2 (i2c-demux-pinctrl): i2c-parent:0: [84, 85] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
>> arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: i2c-mux3 (i2c-demux-pinctrl): i2c-parent:0: [96, 97] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
--
>> arch/arm/boot/dts/renesas/r8a7791-porter.dtb: i2c-mux1 (i2c-demux-pinctrl): i2c-parent:0: [63, 64] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
--
>> arch/arm/boot/dts/renesas/r8a7793-gose.dtb: i2c-mux1 (i2c-demux-pinctrl): i2c-parent:0: [74, 75] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
   arch/arm/boot/dts/renesas/r8a7793-gose.dtb: composite-in@20 (adi,adv7180cp): ports:port@3:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/i2c/adi,adv7180.yaml
>> arch/arm/boot/dts/renesas/r8a7793-gose.dtb: i2c-mux2 (i2c-demux-pinctrl): i2c-parent:0: [86, 87] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
--
>> arch/arm/boot/dts/renesas/r8a7794-alt.dtb: i2c-mux1 (i2c-demux-pinctrl): i2c-parent:0: [56, 57] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
>> arch/arm/boot/dts/renesas/r8a7794-alt.dtb: i2c-mux2 (i2c-demux-pinctrl): i2c-parent:0: [59, 60] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
--
>> arch/arm/boot/dts/renesas/r8a7794-silk.dtb: i2c-mux1 (i2c-demux-pinctrl): i2c-parent:0: [61, 62] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
