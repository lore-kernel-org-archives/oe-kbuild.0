Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A832926ED29
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Nov 2025 22:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762467856; cv=none; b=qJvwCyJ3mmrx5qld6QPMOH8tMnwLedoUwgoygLTkq5aA2rFOnkkbpiGR0DppQx4qfxA3swtOBZTb1fenUAaH34IblgI8OLvZMoFRGrGC37zctAlOIp/GkQG35SpfeEYTxjluY7HRNP06UvWrFDJlw2a9cKgN8zINZOYlQXBGfMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762467856; c=relaxed/simple;
	bh=hkcq6Ve6B3aS/dVC3zznu+zKbsI9rzRIGCKadXhUU68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=inb2E0WSOxkQQngtpvQUKUFKYJFF01hqf/Gr9RpaoIvvVyfohU4XqtQMUWVhv/r14tIz0qoKtm97ME0/yCjMU/761zvg88+HBhAC/Ah2YTWRYuP5V62keXp1O4lVR+n/sqm8VhXe8fcQLclU9vJEixQ6YktOaoayZF8iGN2TfAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U902Zk8W; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U902Zk8W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762467855; x=1794003855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hkcq6Ve6B3aS/dVC3zznu+zKbsI9rzRIGCKadXhUU68=;
  b=U902Zk8WQQuAkuq5ZYLdeWL4GKLLyKMt3Cosx6HWgCFpBgQH9pd2Okoj
   FE901LSwabPUtlP8VGwgMW5BbrTPokf7jT622JWzTMU8nXkDOYuZdZ8zs
   VfMhniSdZG7tFYPTlHSwhR8F9IJhQO1u2tCCgG9M5IzQAFGh3In3y+MMf
   dWsN+f5fBkPjDOxjKPoXtPppTci4XVv73a1Gv8+EDEUen/R9Xn05rSaap
   Oa65X3zq7va7oCULcx7YrbFj4b0DQ7BymDhuM2991mPnbMZh2YiFIoLAF
   oAm0gBqQ5PW2Tcx786+EavPQtaHAw1QPT8Rh8G9GRBHhgvOGe/4Wk+fmu
   g==;
X-CSE-ConnectionGUID: yDBY2MiKQSyEFqwXEBiVuw==
X-CSE-MsgGUID: 1ky7GPYeT328m9QqrLsseA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64316379"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="64316379"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 14:24:14 -0800
X-CSE-ConnectionGUID: CUGtAKapTmm8IWoSK52elA==
X-CSE-MsgGUID: +u/TI73sScqS6OlH/z7z0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="187600188"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 06 Nov 2025 14:24:12 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vH8Om-0000000037k-40SC;
	Thu, 06 Nov 2025 22:24:08 +0000
Date: Thu, 6 Nov 2025 23:23:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:renesas-lts/v6.18-rc3-2025-10-30-x5h-ironhide 14/21]
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: scp@c1000000 (mmio-sram):
 'scp-shmem@60000', 'scp-shmem@60300' do not match any of the regexes:
 '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
Message-ID: <202511062314.qw37jaGx-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
CC: Hai Pham <hai.pham.ud@renesas.com>

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc3-2025-10-30-x5h-ironhide
head:   80827640973fc37984dca63282497d3787866053
commit: e15df229e2d08b776a90738770455a006aa8b9b4 [14/21] arm64: renesas: r8a78000: enable to use SCP
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-2052-20251106 (https://download.01.org/0day-ci/archive/20251106/202511062314.qw37jaGx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema version: 2025.9.dev13+gc72762e0c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511062314.qw37jaGx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511062314.qw37jaGx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: scp@c1000000 (mmio-sram): 'scp-shmem@60000', 'scp-shmem@60300' do not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: scp@c1000000 (mmio-sram): $nodename:0: 'scp@c1000000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
