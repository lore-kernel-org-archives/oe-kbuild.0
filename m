Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE98C3D7288
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 22:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769121481; cv=none; b=nmAyqPwd/s/7DOrw9fvAoLJNdehUn1qAWiCx+POInQrQkc9ZZ5vCBZMvpbObhVI7ZEVqr63AsvSG//ynBkUQoVrnOruZD3Jwy0i9Mp5OGGaeXrk2sMcv+MXWKO+DCrjEgoKEKSD//vrDAOgxkol8xJoIHKYF6r4CzCVDR0zprJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769121481; c=relaxed/simple;
	bh=K9uZvf4FRvKNV23Vnrs0Y/eUHQhWZu4v1OkIXyV6uhE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aY+ijW7oHUrJxNxcO9Jwa2aOjAViK/KANhh4b3hqdaCWzIlz9G+8rajON+v8o4YGvxbVrz5/NQ6uscU6ppqHliv+Rz3Ka0JpxowsP5znW3np4iNGdVecpp9vg9NEO/ir91UBZVFu1sPFLOjdxfjwa9WyRRm0Bc52pmu2QbrNoKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6LHmYwB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6LHmYwB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769121476; x=1800657476;
  h=date:from:to:cc:subject:message-id;
  bh=K9uZvf4FRvKNV23Vnrs0Y/eUHQhWZu4v1OkIXyV6uhE=;
  b=Z6LHmYwBXjFSk1TIBBWRwJtpJjLd7HPT8EhILiepo+fmEDFnjTRwUjao
   SyLFdYBPsdoBEWUw+T3XcYriH5reF9zCpaEVrjIPFEu/Nk8CHN3pa8B28
   lzKhm9R9k4P3rC3KKQU4igOaKChK6DC4uWd/GWwG6nXa4t2N0tnhvttxB
   lobnyamkm+zrli/QTLolwnZ8orv2VDAcYEzhKBRtoieACz9EXZcwAupt8
   YS6HIT2RvJs7l3Ry8MyozwVuKYtGMFRfUWsUtcNztllWIb4P3xXVjkmjI
   yzzcQpCKGNCvV4DbHT88oDlaqjXo4ebs1aBaX0xaG8NWNw1oTXV+iQueu
   Q==;
X-CSE-ConnectionGUID: Di6KJXZwSdu5JabfEBmlQw==
X-CSE-MsgGUID: NYXv5o4QTK6+sZX17pJcow==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70347025"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="70347025"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 14:37:40 -0800
X-CSE-ConnectionGUID: ePherXMCT76M4WNtA5mzRQ==
X-CSE-MsgGUID: +cQdw4MFSN6PRxt35CSkyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="211303070"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jan 2026 14:37:38 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj3J1-000000000Yl-2ve9;
	Thu, 22 Jan 2026 22:37:35 +0000
Date: Thu, 22 Jan 2026 23:37:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@20
 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of
 the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202601222340.TMkAs7VB-lkp@intel.com>
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
TO: Andreas Kemnade <andreas@kemnade.info>
CC: Stephen Boyd <sboyd@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a66191c590b3b58eaff05d2277971f854772bd5b
commit: 944b074ff105a1541626c9492e32d248d3b1257b dt-bindings: clock: ti: Convert ti-clkctrl.txt to json-schema
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-2055-20260118 (https://download.01.org/0day-ci/archive/20260122/202601222340.TMkAs7VB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601222340.TMkAs7VB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601222340.TMkAs7VB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-gmac-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@300: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@300 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@400 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@500: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@500 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
>> arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@20 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@600 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@700: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@700 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@760 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
