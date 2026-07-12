Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C15E371895
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Jul 2026 07:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783840286; cv=none; b=sVtEy9jN3s53XdvSCs6IxYLVWTbf8dOwOcE1fGzkuxkHjujP5XApfxFY0wTAsJHg5rH9DWkNA1uMM4Thhk5pPEcG5w6xU7d6XY3OceJXQBMBCKB+J9hBrQLhLh6S8KrenUMk1Z/K5vZJZbtPZV7egAk3mhpp55sLLbkZcjhAIeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783840286; c=relaxed/simple;
	bh=7XwSo2JqubpV53GznL3ypBzvdOQ3cFtM3XVR+GKo4xs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CamqiTTVGJjhkSSaVfsCzPLWlITBInCnKAI8EByt5Heymaq1LpnP+vYRLwsp3KwPfMRebnl/Vq2h2+7dQvIacd/C9FrX62Ukgqs8BTVuihj47Dod5Z+whUtcGkV4/ySg77j4WNxM2cQcaj22heLc9bjvW+qRIY9TWxZUXdLsK+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPpyjMeF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPpyjMeF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783840284; x=1815376284;
  h=date:from:to:cc:subject:message-id;
  bh=7XwSo2JqubpV53GznL3ypBzvdOQ3cFtM3XVR+GKo4xs=;
  b=ZPpyjMeFdpunte2o6R+bJmJ7Hfo5ck6u96q6Cuya8EqAVkhV2R+vC8KF
   FlclnjI7WTp5CgC1O0B0VRTHKQUAJcG+ONSeh9E9itwESAT07iLqkWwLZ
   QxQHr0EZsbfiwIXstFIYX796282llkzvynf9bBqaMbqNyJA6A1CVQo/Q8
   p4mI1XIVvsneWt+rZ2/oXufBVHzSU5TIjXmh5p3Ucg/E3g0BGudQNkZmO
   9OKY1bS9F1O8DG4Sb33Ux8JMz7kfKMhWKiT75FbcJ2KtAU4MC1jB3sxBo
   sAWqeb+lpZX4x6QIPgzVs0KX8WtOqkzMVz1uDDHsWbezDuUOw2T7cJTJG
   w==;
X-CSE-ConnectionGUID: dAGrJuTESO216KXIyi8uJg==
X-CSE-MsgGUID: 6oxyqCgwT4+pn4VO+SDH3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87026424"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="87026424"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 00:11:23 -0700
X-CSE-ConnectionGUID: 58H+Yt7qT6iAWeEqL+2egA==
X-CSE-MsgGUID: xyQgXacfTXeoOS7XN2mIJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="278511776"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jul 2026 00:11:22 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wioLQ-00000000KlS-1hZO;
	Sun, 12 Jul 2026 07:11:20 +0000
Date: Sun, 12 Jul 2026 15:10:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/airoha/airoha_ppe.c:97
 airoha_ppe_set_cpu_port() warn: subtract is higher precedence than shift
Message-ID: <202607121439.G4KYSMKG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Simon Horman <horms@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd3210c47e8d3ac6b4e9141fc68acc03b38c0ba3
commit: f44218cd5e6a3d98b137344b808ee154117ce765 net: airoha: Reset PPE cpu port configuration in airoha_ppe_hw_init()
date:   4 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 4 months ago
config: microblaze-randconfig-r071-20260711 (https://download.01.org/0day-ci/archive/20260712/202607121439.G4KYSMKG-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f44218cd5e6a ("net: airoha: Reset PPE cpu port configuration in airoha_ppe_hw_init()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607121439.G4KYSMKG-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/airoha/airoha_ppe.c:97 airoha_ppe_set_cpu_port() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_ppe.c:97 airoha_ppe_set_cpu_port() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_ppe.c:97 airoha_ppe_set_cpu_port() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_ppe.c:97 airoha_ppe_set_cpu_port() warn: subtract is higher precedence than shift

vim +97 drivers/net/ethernet/airoha/airoha_ppe.c

00a7678310fe3d3 Lorenzo Bianconi 2025-02-28   87  
f44218cd5e6a3d9 Lorenzo Bianconi 2026-03-17   88  void airoha_ppe_set_cpu_port(struct airoha_gdm_port *port, u8 ppe_id)
f44218cd5e6a3d9 Lorenzo Bianconi 2026-03-17   89  {
f44218cd5e6a3d9 Lorenzo Bianconi 2026-03-17   90  	struct airoha_qdma *qdma = port->qdma;
f44218cd5e6a3d9 Lorenzo Bianconi 2026-03-17   91  	u8 fport = airoha_get_fe_port(port);
f44218cd5e6a3d9 Lorenzo Bianconi 2026-03-17   92  	struct airoha_eth *eth = qdma->eth;
f44218cd5e6a3d9 Lorenzo Bianconi 2026-03-17   93  	u8 qdma_id = qdma - &eth->qdma[0];
f44218cd5e6a3d9 Lorenzo Bianconi 2026-03-17   94  	u32 fe_cpu_port;
f44218cd5e6a3d9 Lorenzo Bianconi 2026-03-17   95  
f44218cd5e6a3d9 Lorenzo Bianconi 2026-03-17   96  	fe_cpu_port = qdma_id ? FE_PSE_PORT_CDM2 : FE_PSE_PORT_CDM1;
f44218cd5e6a3d9 Lorenzo Bianconi 2026-03-17  @97  	airoha_fe_rmw(eth, REG_PPE_DFT_CPORT(ppe_id, fport),
f44218cd5e6a3d9 Lorenzo Bianconi 2026-03-17   98  		      DFT_CPORT_MASK(fport),
f44218cd5e6a3d9 Lorenzo Bianconi 2026-03-17   99  		      __field_prep(DFT_CPORT_MASK(fport), fe_cpu_port));
f44218cd5e6a3d9 Lorenzo Bianconi 2026-03-17  100  }
f44218cd5e6a3d9 Lorenzo Bianconi 2026-03-17  101  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
