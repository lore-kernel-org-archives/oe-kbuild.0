Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B742D5950
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 11:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768647954; cv=none; b=aM5k9wa8rfoXTUrOANWBZV1uLzvYhOftrVP6hVEem2j+KvOM4QO/u60NEsqzWCw5bExANnjssHfgfNbKgC6guW2cXE3a464hDgrbGEeUGh2Mfgzi8lniSUH5Wz1Vh70HDZ4SB6NccGTk0xw3mNegz8r+q2qPC8ZFyS4fKK9rPc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768647954; c=relaxed/simple;
	bh=jzHE13bS4ZO7s47Yht1wm4xZQmHnc8lUdfIC+5lF6uM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GxmV/Kd/dokiU/ogJEH7UGn8jcoh9+9jwmj+DkjQFfAuIWcHkeQZm0nZE4UyLQeTWv1TMDsqRZV8f5OoPMokB1EnJuYgKiTDaCnt2t8fLFiBwCd6n+6dzrBzb26cCPc75C6hrbeZ4zmp54bX/I0VpUaAlTDL7wPEPARNgkHXXwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B92dpODv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B92dpODv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768647953; x=1800183953;
  h=date:from:to:cc:subject:message-id;
  bh=jzHE13bS4ZO7s47Yht1wm4xZQmHnc8lUdfIC+5lF6uM=;
  b=B92dpODvGAT1r3tomdQnBksBzbP7PXq8E3DfL+zBx2Eav0uHrA+i8Pyk
   o67Q+Ynf8s8ra4I2a4jIosGayX8P2W+x85M/ympwFfvIE29AOVe146EYB
   mnR9BVH5ABJ/WHfuojlnUfjwDk5ss2C3FW9Q9AEoIOBhaNceVM/FTgXxO
   IMoh3pqFJ3bksLF+YW4CtZpgNqbw2V0VKBr1gDeQw0OUW11mimG1OrXg4
   4KzlR8MncpW+ogRoh5UaEdc/hZf2GDmcgeyB7TlJekM4ivYDJLxG0bupt
   o8Wj6ZSjGlNusj83J3MhwTuRzqvPaaxO/Vapwx7NnMbVykKExEQaUwEl1
   g==;
X-CSE-ConnectionGUID: ke02CVjySZC/FKl8BL0lqg==
X-CSE-MsgGUID: sqP7o43TQ7S6leFaieFIAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73790864"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="73790864"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 03:05:53 -0800
X-CSE-ConnectionGUID: Jrh5EtXeQy2yGJC+4xogLw==
X-CSE-MsgGUID: Fm2J8pFfTjCrdnd7B8o/iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="209950986"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jan 2026 03:05:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh47q-00000000Lmi-0Pq6;
	Sat, 17 Jan 2026 11:05:50 +0000
Date: Sat, 17 Jan 2026 19:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [glemco:staging_rv_hybrid_automata 25/25]
 kernel/trace/rv/monitors/laxity/laxity.c:246:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601171935.Z85I6Ycu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/trace/rv/monitors/laxity/laxity.c:246:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Gabriele Monaco <gmonaco@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_hybrid_automata
head:   dca0c2a21291cb0013e3f4b51a9acc26e6a89b6f
commit: dca0c2a21291cb0013e3f4b51a9acc26e6a89b6f [25/25] rv: Add dl_server specific monitors
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: microblaze-randconfig-r112-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171935.Z85I6Ycu-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171935.Z85I6Ycu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601171935.Z85I6Ycu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/rv/monitors/laxity/laxity.c:246:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/laxity/laxity.c:246:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> kernel/trace/rv/monitors/laxity/laxity.c:246:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/laxity/laxity.c:246:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   kernel/trace/rv/monitors/laxity/laxity.c:247:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/laxity/laxity.c:247:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   kernel/trace/rv/monitors/laxity/laxity.c:248:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/laxity/laxity.c:248:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +246 kernel/trace/rv/monitors/laxity/laxity.c

dca0c2a21291cb Gabriele Monaco 2025-10-29  245  
dca0c2a21291cb Gabriele Monaco 2025-10-29 @246  MODULE_LICENSE("GPL");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
