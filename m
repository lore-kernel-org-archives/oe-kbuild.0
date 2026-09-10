Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7757248664A
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Sep 2026 15:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054777; cv=none; b=gER8k8Clwz7VY3BaBW3wBDgfA+MZMDUDTe4dzmS3anhhaZCJmGfFxJXXPQCrlA//LD0X6pJBGH2UKXwzhH0dDjfnnsiC9pel2KqtyJQkO+WMj/uop/WMRM3VyF8sA0lWFkR+gNICXscdkz6jWhICdgV/7QwdiB43OYrUqTGCVHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054777; c=relaxed/simple;
	bh=/PPUPgj/r0fHL+v+3Q7lywiRRobH0F6Z3WgEy65SDug=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OJzUWco8tmORxkLKpxO077CWDvOra6Z86om7IIAgg76mNGopw0dR0JguYRIjdWIeK6bwv6H2joBpFnGBqB/euVQFJOXZatIikb4mpY5SSeMd4zBuKMd8H4Obl05zQpa+z0bwPGvWqbR/EE0EsvYaqFcURB795pJBFoNXvksOMr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8yP9hAh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8yP9hAh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789054775; x=1820590775;
  h=date:from:to:cc:subject:message-id;
  bh=/PPUPgj/r0fHL+v+3Q7lywiRRobH0F6Z3WgEy65SDug=;
  b=a8yP9hAh01EjMrsQmbQba8Df0lL4DqiGeUcfEv6sqPGiAvf0CoqLce87
   It8maC4HZvBfAVu/lx12MaLslyWsp0U1KGB6UHqqkk0C36pYU76Sw0qfg
   rL4UuocOxA1ME2SjZmIY+Gs5D3Ehs6plA7CoURwDA+j8RjNyUYx/X7DkZ
   GjCpN9M9fogoH4lbRWQfW0dszNfVq42d8+xKSDoElcf9h2lU3VqdbWG9A
   TcA2EWxM0Bpp2s/DUXLzTAhS3ENmO+ObJlCPhyy4bz+XPHLmwVc4dHDgn
   sdGjQOkuFmWftPcV5IMxgt6N2xKthJonPnDRhiRr5gWrOORnw6Yb7ca8x
   w==;
X-CSE-ConnectionGUID: jiEvGq+aSPyh3FMufQtFnw==
X-CSE-MsgGUID: EHBSMAhFR0SN7bSHW8fZkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89271589"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89271589"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:39:32 -0700
X-CSE-ConnectionGUID: xEFXp61/Qke4t0mnNhBKgQ==
X-CSE-MsgGUID: 8qqUIEa1R7ODo3No2V1PYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="267395191"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 10 Sep 2026 08:39:31 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gs4-000000000Q5-41Pp;
	Thu, 10 Sep 2026 15:39:28 +0000
Date: Thu, 10 Sep 2026 17:39:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [spacemit-com:wip/k3-pm-v2 3/4]
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: /power-controller: failed to
 match any schema with compatible: ['spacemit,k1-power-controller']
Message-ID: <202609091929.AFKCcMAw-lkp@intel.com>
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
TO: Yixun Lan <dlan@kernel.org>

tree:   https://github.com/spacemit-com/linux wip/k3-pm-v2
head:   b2caa215b14c0a531345dd369c9ef55870dd73f8
commit: b1fb26544ee5aad9f116599e72a5625591799eba [3/4] dts: riscv: spacemit: Add power domain nodes
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: riscv-randconfig-2052-20260909 (https://download.01.org/0day-ci/archive/20260909/202609091929.AFKCcMAw-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609091929.AFKCcMAw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609091929.AFKCcMAw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: /power-controller: failed to match any schema with compatible: ['spacemit,k1-power-controller']
--
>> arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dtb: /power-controller: failed to match any schema with compatible: ['spacemit,k1-power-controller']
--
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: /power-controller: failed to match any schema with compatible: ['spacemit,k1-power-controller']
--
>> arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: /power-controller: failed to match any schema with compatible: ['spacemit,k1-power-controller']
--
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /power-controller: failed to match any schema with compatible: ['spacemit,k1-power-controller']
--
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /power-controller: failed to match any schema with compatible: ['spacemit,k1-power-controller']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
