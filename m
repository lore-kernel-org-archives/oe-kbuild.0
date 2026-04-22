Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895D51F3D56
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Apr 2026 18:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776883510; cv=none; b=JMCYmQ+6YTMnpPM2Pj/nn5ZysMM5jPTX+uJeXh/Clsz+5wb/o+P3fT8EOaNf9hyucC4zpk7QkSmhIOKAb6U7cToXra5gBtwbqslxBO7kPYqq1Hi7pmOngb/fTDvyqTxB+4rtrpD8iUOJfMzPTkTc8XPiSBo11B4ecyjw+4i37o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776883510; c=relaxed/simple;
	bh=dJsdEa5b016ZfBW+tTUkplrt/CTP1VMvLrYVjDdpp2o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rn61lZg5OaLjvHA9/IufkSv7kwB1aKFAbyHcSnRX0QBQA/z3l2l2fpZ0RGk9SSW0IiP5eNqcOXCmX5j/zk+d0tRAK7E4UUDdCo0rOJC0Qfq5XzBWVf0BuapLfsmsymbezCpKtrCvZBEsRiH26SERfu6b7k9Rr2U0tIR2lEoc+z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMDwwqbJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMDwwqbJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776883509; x=1808419509;
  h=date:from:to:cc:subject:message-id;
  bh=dJsdEa5b016ZfBW+tTUkplrt/CTP1VMvLrYVjDdpp2o=;
  b=gMDwwqbJfL4W0FG8hQxeNfjlh1/K4aXOFcQ5x/I3KZiPlTyBBsZip5Nb
   pccOPfGYWsxLPoMWPKMinn/RzLB878dIQvRPMJBMFahl3iVi93Oc0QkBi
   HLy+890F0gjnMcjMi3Mz5nxRm5TnaYV+YB95TM6hY0GIVyVZJ+AXP3V5J
   8juSsutcnXlXdWKQDeZ2ZOyvsmuvLy9Bs1/6+58pvtE6Z7B+jl7KLLwi9
   6IvhriJwW17Pj4GDS1JKR/aY7LwlAbRvziWkMlyaJbaiC6fjmMgMVvw+Z
   /GQOvzaN31suto1ruvQmaFjXswK4um0aPwBYBbFRSs5P5jsMFizmCJjhx
   w==;
X-CSE-ConnectionGUID: ZJF8SwtzQoSglxxRAMcLOA==
X-CSE-MsgGUID: vtLABV9BQFuXzu2g+DecZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88151092"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="88151092"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 11:45:08 -0700
X-CSE-ConnectionGUID: flOphm1rS3mjAmiNeeWSXA==
X-CSE-MsgGUID: M1K6C0l9TzK9MtLMJY3O5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="231390711"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Apr 2026 11:45:07 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFcZM-000000000uT-3fLz;
	Wed, 22 Apr 2026 18:45:04 +0000
Date: Thu, 23 Apr 2026 02:44:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: error:
 vmlinux.a(drivers/net/ethernet/broadcom/tg3.o):(function tg3_get_invariants:
 .text+0x395e): relocation R_RISCV_HI20 out of range: -555864 is not in
 [-524288, 524287]; references '.Lswitch.table.tg3_get_invariants'
Message-ID: <202604230200.GwA2ZY1G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: llvm@lists.linux.dev
BCC: lkp@intel.com

CC: linux-kernel@vger.kernel.org
TO: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6596a02b207886e9e00bb0161c7fd59fea53c081
commit: 84ffc79bfbf70c779e60218563f2f3ad45288671 kbuild: Add '-fno-builtin-wcslen'
date:   1 year ago
:::::: branch date: 18 hours ago
:::::: commit date: 1 year ago
config: riscv-randconfig-002-20260422 (https://download.01.org/0day-ci/archive/20260423/202604230200.GwA2ZY1G-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604230200.GwA2ZY1G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 84ffc79bfbf7 ("kbuild: Add '-fno-builtin-wcslen'")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604230200.GwA2ZY1G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(drivers/net/ethernet/broadcom/tg3.o):(function tg3_get_invariants: .text+0x395e): relocation R_RISCV_HI20 out of range: -555864 is not in [-524288, 524287]; references '.Lswitch.table.tg3_get_invariants'
   >>> referenced by tg3.c
   >>> defined in vmlinux.a(drivers/net/ethernet/broadcom/tg3.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
