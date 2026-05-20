Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09220364E84
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 08:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779267261; cv=none; b=Yo0CNzpcnb+7dkaaZN+nYo7V1tfg15HwPHHbFIlj3dG/8BF6uIZpzZEtgSrcRqAglgBFgr/deT86o+c5kQmrwp0pWxWVU5z2V9M+30EvPZCTSrUp485xdcVuTTPp3URyybTRs26+GopnmYpq13C7TDblMZB23s4c7kCMqbHPxAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779267261; c=relaxed/simple;
	bh=6i0JV8K2jULDFi7OVgYXeSxuD8K9eheR6GLABNhD+y4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iGDy2eNNB8MCotgXiamwj0cISkfVYXvPr+ZOstmMFohV5wm+YVSag0Bed8vEKS5ErMpJ6wBlgLcXsnJ9/VVWUfcVZ6EqfguodnfryMIn1EQWk8SD/rQvUduJHp6NmNieaqK7bcT9zMBJdZiNZUvm6RWwTC1MFymygPPZs+elqDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GdbAMtid; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GdbAMtid"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779267260; x=1810803260;
  h=date:from:to:cc:subject:message-id;
  bh=6i0JV8K2jULDFi7OVgYXeSxuD8K9eheR6GLABNhD+y4=;
  b=GdbAMtid8hqEb/UolZNkfPxE4estzxfaVCxu+o3YVFXyQ4Rlq4VMEb41
   +Pfpxl1HDkGfz5cUc40Bs3iSP305hEAln1cXBJX895SYAfv+NY6dwUWTa
   nmxpd71d9oR1/qQ/vKDfpCN6Q0TGConneelNSO8T8KfKIAgsn21dv1PFW
   y3r12CfSiJFBsJaE6K2qdCLg2EYqtVhD+hkdzIr3pDDRATefPjKqxeeyW
   7HHOwP7G38iegEa76lz6XlFmrEPRyqjZ8+Ku6y9XChQDAk/h4YobXRbBF
   oCYL5Qux8Uf4WRRkCmNF5/vGJ2vrm+hmIdLlCi4Lgguj5YUBmd6xggpnL
   g==;
X-CSE-ConnectionGUID: er/yHzsCTmmEUMo1tAmPfQ==
X-CSE-MsgGUID: QQo/Vic3Rd66kAqyucfmdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80123885"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="80123885"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 01:54:19 -0700
X-CSE-ConnectionGUID: Xg2MfWpKRzOZmCZ1FOo/6Q==
X-CSE-MsgGUID: IONnLv9ZSxi3GAUuMKTc5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="245091782"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 20 May 2026 01:54:18 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPcgk-000000002rf-3Dta;
	Wed, 20 May 2026 08:54:04 +0000
Date: Wed, 20 May 2026 16:53:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: error: undefined symbol: mem_cgroup_dmem_uncharge
Message-ID: <202605201625.uzCWM4Cw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Eric-Chanudet/mm-memcontrol-add-dmem-charge-uncharge-functions/20260520-000345, commit: 8c23ade377046c937570c234116eb210372657dd"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Eric Chanudet <echanude@redhat.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Eric-Chanudet/mm-memcontrol-add-dmem-charge-uncharge-functions/20260520-000345
head:   8c23ade377046c937570c234116eb210372657dd
commit: 8c23ade377046c937570c234116eb210372657dd cgroup/dmem: add dmem.memcg control file for double-charging to memcg
date:   17 hours ago
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: s390-randconfig-002-20260520 (https://download.01.org/0day-ci/archive/20260520/202605201625.uzCWM4Cw-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201625.uzCWM4Cw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605201625.uzCWM4Cw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: mem_cgroup_dmem_uncharge
   >>> referenced by dmem.c:674 (kernel/cgroup/dmem.c:674)
   >>>               kernel/cgroup/dmem.o:(dmem_cgroup_uncharge) in archive vmlinux.a
   >>> referenced by dmem.c:766 (kernel/cgroup/dmem.c:766)
   >>>               kernel/cgroup/dmem.o:(dmem_cgroup_try_charge) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: mem_cgroup_dmem_charge
   >>> referenced by dmem.c:737 (kernel/cgroup/dmem.c:737)
   >>>               kernel/cgroup/dmem.o:(dmem_cgroup_try_charge) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
