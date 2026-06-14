Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C954C204C3B
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jun 2026 10:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781432892; cv=none; b=asfVXiBapgyYcn9KpCwogcS7jnDuvOBtfvj9jjzWuUidmkRSMeAlDBHwKtgAVnHShzVGajJIinmKR6278TsX+lIP1lIK6ul1mHBR6lZX1SxUBaFLiFsOdvLgpjqooBEjE+d+KI0c2Pk+Zi4Kb8vFUykbnvd/FGK4GS1GAWwL0L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781432892; c=relaxed/simple;
	bh=tDi7qEOYTCLqYbVuBF4c0065Vu1C18HnyLxi6SYc7d0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DdwdpydhWCNwYBe3MQf38twg2wYHhvr0hpfjBG2BEHXDdIJfQBDIpmO0SPQ0RLbQgl15EuP3HxP3r8/QwyGnMQ28xRhGC3acPYy6z+IoX2MeUMYj4l47eodxnwNpc23Fi0KHoE/y+lBYuhHXfOIt8B2V3Zw4a/1gsdQ35cHsv3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alJb5ZI4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alJb5ZI4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781432890; x=1812968890;
  h=date:from:to:cc:subject:message-id;
  bh=tDi7qEOYTCLqYbVuBF4c0065Vu1C18HnyLxi6SYc7d0=;
  b=alJb5ZI4/eI8xcyRv0P3DT6g87m3nEpngRGPhKY8ZDch2h45HIfpiwPQ
   COc50QX6xeZn8WY5e3ddwqLQQCCByigIOgvMQoNj9SSe+eMEhHz65bPPY
   bNY+rC+2+FZe3JoQvHnYAab93Zi69NewjY3m0/z3V6qaty2gGHssif2ex
   ODBEBZjj+tN0/4MKcKO17L9zJ28OIRAQejkiH+yTOOeqypNXY5DCSVB8T
   OGnRWRrFV0uzlYCGBiaGyrMIG6eRwwpBvEpHDOpe/X64Vf3F0newoM84e
   KKr/MNxBtaJ40Ebxdsfxdp6LXMofkava4/fGEbpgLBoDkIwGWtQZ0ur0X
   w==;
X-CSE-ConnectionGUID: sYm7gzIoSXSmfDUB6pOqwA==
X-CSE-MsgGUID: ONABRx7yQpifKLeyko04LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="99775178"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="99775178"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 03:28:08 -0700
X-CSE-ConnectionGUID: 81caXnaQTCa9qjALB/jXNw==
X-CSE-MsgGUID: ZjDzeGteQE2iUgaqxLlq5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="244311637"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jun 2026 03:28:07 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYi4T-00000000Qkm-0VvQ;
	Sun, 14 Jun 2026 10:28:05 +0000
Date: Sun, 14 Jun 2026 18:27:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/sched/build_policy.o: warning: objtool:
 pick_next_pushable_task+0x78: unreachable instruction
Message-ID: <202606141837.przY5VpB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b07ea76fd28989bde5993532d7a943a6f90e246
commit: 15125a229abc2404a264ce493e64a9ffa7850f6e sched/smp: Use the SMP version of the RT scheduling class
date:   1 year ago
:::::: branch date: 19 hours ago
:::::: commit date: 1 year ago
config: loongarch-randconfig-r064-20260608 (https://download.01.org/0day-ci/archive/20260614/202606141837.przY5VpB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606141837.przY5VpB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 15125a229abc ("sched/smp: Use the SMP version of the RT scheduling class")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606141837.przY5VpB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/build_policy.o: warning: objtool: pick_next_pushable_task+0x78: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
