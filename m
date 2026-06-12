Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2693750C9
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 20:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781295313; cv=none; b=s+xcqwBDdRXu35tlGZEHrom+POEQeie/K4jufs36Bu8n43gv73PsvD9gBDsV/qI1x8DXOZWibv7j93iToCNNkupVrkP/CW+r/jcUV4N7ucR8JFd6nwTkje/6nl29ryI06/wjpci8FCSErZkl00ZEQJGuJM40fg4rCbDJ5OBIm28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781295313; c=relaxed/simple;
	bh=bLZ02VywPSPFxmK09739UyMtUTCROWSv7KF96s7IGFo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q8L4fZ+soSUSUCa8HrCRCHjRBoaRWRXab8p2XcT8Aj+KkRPYIFzFbZVqnpugP6VrrBZy9nGN0SoBYD3nCmbtuItsIrIMU5PtVLJxiR3VpxqvQ5CTYnmksJk2hOH6SIbGUYQWFppcGda0y70P3sBhZXowc+Z94ooSHOLmYDUCsxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDiYWlfk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDiYWlfk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781295311; x=1812831311;
  h=date:from:to:cc:subject:message-id;
  bh=bLZ02VywPSPFxmK09739UyMtUTCROWSv7KF96s7IGFo=;
  b=oDiYWlfkIthbo69G0Te9SOscW2KDba3b4EESwNvTYA0DlVkHGQnEu+mm
   PO+1TOV+Z71KPk3LUOvE/7xN127PvGIl1OslFynIzaX4+eRv9Fiuxehnf
   6Epu/xC8c44i7I/mnM7a4DQSb+yfwxD6gI/lqKhQflkN0ye4UTBVrzSy2
   dkaNVLtOKiiYjl/Z29csdeQ7Ot8HEfJgl86Aug72REZguYK59t2nZGlZd
   83Nsv+ceZ6r29+yvx3h/pESlkTfiunGAlvYReg+3+RmhteRrCkhG4tbrY
   lv4g6fZWy3f42kZQ4d9eaazqpKstVA7Llyw+DLqQnYZyxzB1nT7VxNRbl
   w==;
X-CSE-ConnectionGUID: ZOJ9pzHxSCWYR3lHm4GfnA==
X-CSE-MsgGUID: yOL1rDRcQ7OAUUCeKgQZGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="69679414"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="69679414"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 13:15:10 -0700
X-CSE-ConnectionGUID: A6zII9NtTuOwTLjBCx70ow==
X-CSE-MsgGUID: MgLP1CDYSlamOU6WamR74w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="248799723"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jun 2026 13:15:10 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY8HT-000000004JT-3rM9;
	Fri, 12 Jun 2026 20:15:07 +0000
Date: Fri, 12 Jun 2026 22:14:24 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12966/13336]
 ../../../lib/interval_tree_test.c:315:17: error: implicit declaration of
 function 'pr_warn'
Message-ID: <202606122249.neYsYssG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Samuel Moelius <sam.moelius@trailofbits.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: da58d4edb02fe347b676a3be230fd16da68c4fc8 [12966/13336] lib: interval_tree_test: validate benchmark parameters
:::::: branch date: 2 hours ago
:::::: commit date: 2 days ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260612/202606122249.neYsYssG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606122249.neYsYssG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606122249.neYsYssG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from interval_tree_test.c:11:
   ../../../lib/interval_tree_test.c: In function 'interval_tree_test_init':
>> ../../../lib/interval_tree_test.c:315:17: error: implicit declaration of function 'pr_warn' [-Wimplicit-function-declaration]
     315 |                 pr_warn("nnodes must be positive\n");
         |                 ^~~~~~~
   ../../../lib/interval_tree_test.c:335:17: error: implicit declaration of function 'kmalloc_objs'; did you mean 'kzalloc_obj'? [-Wimplicit-function-declaration]
     335 |         nodes = kmalloc_objs(struct interval_tree_node, nnodes);
         |                 ^~~~~~~~~~~~
         |                 kzalloc_obj
   ../../../lib/interval_tree_test.c:335:30: error: expected expression before 'struct'
     335 |         nodes = kmalloc_objs(struct interval_tree_node, nnodes);
         |                              ^~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
