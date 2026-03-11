Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2AE13DDAE
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 10:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773225956; cv=none; b=jB+iRXxuGA3nDvrTD011cFQNwhAWi2KrjLDeMUlKmhZ9vE89cTCofEVStlP2j8+rrJntrXXIAcvm9cmv9l2QZA4CPRsND+mHqAYNui0ATG/JxEuaAu0ODgG2ODjQfgBBRKV6OuU1+ZprkytGFvVsiD+Qod/CqOE5klAxOyNF6vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773225956; c=relaxed/simple;
	bh=UKsLsFfO6vdHFODlBq8YMhhFNyiuVIUBmp5fNfe0NgM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eD8xP0v5Z37ToaDEoOLo5aAQfD0u550B839An+SwmfgoQqvFGc+UCdsEZFVHG6kZG4E8pYNDYQLKRFwDY9/dJLCFfKtP3+DzZcCt6NiS7EIleZi24fttgtgbET3MPjThw/RJ3WCepgaC+i6ulM1yFftHm5sg1QD3KXLhbPTKNFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WXrSIG/8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXrSIG/8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773225954; x=1804761954;
  h=date:from:to:cc:subject:message-id;
  bh=UKsLsFfO6vdHFODlBq8YMhhFNyiuVIUBmp5fNfe0NgM=;
  b=WXrSIG/8a2cL+FwDovEaX7xJvDYOF6X02Al54vrsJlgeMDznZbyNB50C
   Mi8yJ+tuF5xmNIx4MOBvWinhfuuCiSg67ykOl9EMe4Se2A53ami4Tdox6
   9NDRwAe2N3rfrEfKv7g3UyioTz2DtPJdPZ89elhHtmbJ7iLUPMUNSO/X7
   UxMcC6NO3657sIe7hLrt1VT8Q0LtUUBG6e54AGa+WhtnRd5M6fp/ioIBN
   Z6i1ABw9qKRbQrmFzDr9/244qLVOosyyGXnaiUCpiQZsnTkvwozHXcn/C
   Lpg2XXwUtTv/PTJRcqyCOk82xnkz+izXF4KZjlt9x9vxwh4KxRArgy5o0
   Q==;
X-CSE-ConnectionGUID: FF4ClD3kSvqOpkmveO3ZDw==
X-CSE-MsgGUID: CkaMvnINTDCa1LAQfSZ0bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="84613453"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="84613453"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 03:45:53 -0700
X-CSE-ConnectionGUID: qFlup5pDQCqAalXaWHvt9A==
X-CSE-MsgGUID: OF/ExiaSQk+sgcp7UuO2hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="250926772"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 11 Mar 2026 03:45:53 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0H4Y-000000003J3-3lor;
	Wed, 11 Mar 2026 10:45:50 +0000
Date: Wed, 11 Mar 2026 11:45:01 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 374/621]
 Documentation/devicetree/bindings/pinctrl/st,spear300-pinmux.yaml:
 st,pinmux-mode: missing type definition
Message-ID: <202603111114.tfvXZg9f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   c8198e311a98fefcf9efff078bf3930ff94b60d2
commit: f1ab4a75cff33a444c9371294fbeed29e4b52888 [374/621] dt-bindings: pinctrl: Convert st,spear300-pinmux to DT schema
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arc-randconfig-2051-20260311 (https://download.01.org/0day-ci/archive/20260311/202603111114.tfvXZg9f-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111114.tfvXZg9f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603111114.tfvXZg9f-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,has-div: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,has-mul: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,has-initda: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,has-mmu: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,reset-addr: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,fast-tlb-miss-addr: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,exception-addr: missing type definition
   Documentation/devicetree/bindings/mmc/cavium,octeon-6130-mmc.yaml: cavium,bus-max-width: missing type definition
   Documentation/devicetree/bindings/memory-controllers/atmel,ebi.yaml: atmel,smc-page-mode: missing type definition
   Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-devbus.yaml: devbus,bus-width: missing type definition
>> Documentation/devicetree/bindings/pinctrl/st,spear300-pinmux.yaml: st,pinmux-mode: missing type definition
>> Documentation/devicetree/bindings/pinctrl/st,spear300-pinmux.yaml: st,pins: missing type definition
   Documentation/devicetree/bindings/pinctrl/atmel,sama5d2-pinctrl.yaml: atmel,drive-strength: missing type definition
   Documentation/devicetree/bindings/pinctrl/sirf,prima2-pinctrl.yaml: sirf,function: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: gpio-ext: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: timers: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,short-detection-threshold-volt: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,current-limit-mA: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: isel: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: fdim: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: mal-tx-channel: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
