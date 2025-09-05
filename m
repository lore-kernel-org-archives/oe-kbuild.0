Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59F6350D79
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Sep 2025 13:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757079022; cv=none; b=knaeEpUYcN4JtdBHSviHxk63Qjlow0UQTEywN820+lXpmL+ajCTivDJJbndHez3VQACIiHIzMpBaIskybFDFklcowr6doS1G7sW/T/P0F8mHP/ZX/p8ZBCPJFLFbeQLfsGRQh9VFnZC0hh4xSD3tokdi7bPah7XPlr1hoTNa2JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757079022; c=relaxed/simple;
	bh=ei17vhWkXyDaKg5yLR294QAeJkM74YjcZ44sXU+dkmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P0/nHswIpj6ekx/gBIlzsUXrSOUqGMoBNVkuHxJErqgVNqIhcf0bPiUg1M/PIeN3+V/xd3ailJFQHpvcV86HX7FMd+cNN2B9W/fKPG0rDZ3a3D+nAdKwr96iii1fmn2AljJMeF7RrwHiwZCTV/pInOmuLb0tETF0EDRwEix28dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bg49xIiu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bg49xIiu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757079021; x=1788615021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ei17vhWkXyDaKg5yLR294QAeJkM74YjcZ44sXU+dkmk=;
  b=Bg49xIiukfxkjaBoyCIiUWC5Iew8UWLtygrGt6UedHDAOiF0ydWBoxwy
   pgOnHSS5OVv91dxqBsgsx3t43HyzzQfH3ERHeaM+0YSh5HsLCF+hvOAoq
   mjjfjdKKn7sjmr2s8AdnfA2X39/WRgUTf2NxL7A9KS0WbaE5wU2+eTnKh
   Abfd+dSwbe7vZthWdBB6PO5pKEGJByjfkCVGTKDa1xcJZFffV+ASNI6cw
   SrE2g3KC1SWP0caOr42QeNuS2fS3zolIGWmgTPs9Ve9OmXgCvgLriOGri
   xZJ1H9L43N+O6JnTlc5NVQvrJ22u5gzDKj6OJFpGLijbGDoUXVDhLSRWi
   g==;
X-CSE-ConnectionGUID: Gel12AORRSCaB3meCgpwiA==
X-CSE-MsgGUID: ZinBH23ASaeu2BPsCho9vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70525640"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="70525640"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 06:30:21 -0700
X-CSE-ConnectionGUID: HRYwZDa9TBO32yqT2gsmWA==
X-CSE-MsgGUID: QBCGcoAZS7qlmcSoq/S5fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="172276047"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Sep 2025 06:30:18 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuWW8-0000SH-1u;
	Fri, 05 Sep 2025 13:30:16 +0000
Date: Fri, 5 Sep 2025 21:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:n/dts-interrupts 14/16]
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: tda19988@70 (nxp,tda998x):
 Unevaluated properties are not allowed ('clocks' was unexpected)
Message-ID: <202509052102.KRqqCLGs-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux n/dts-interrupts
head:   8fbd44daea64c5f8d51f4aa28eccf4848162cbf8
commit: f08c1a34a89859a2e70b4b1b0899053ed1605d22 [14/16] dt-bindings: display: bridge: Reference DAI common schema
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-052-20250905 (https://download.01.org/0day-ci/archive/20250905/202509052102.KRqqCLGs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509052102.KRqqCLGs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509052102.KRqqCLGs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml#
   arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: ethernet-phy@0 (ethernet-phy-id001c.c915): compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml#
   arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: ethernet-phy@0 (ethernet-phy-id001c.c915): compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml#
   arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: ethernet-phy@0 (ethernet-phy-id001c.c915): compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
