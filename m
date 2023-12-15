Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73280A38
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Dec 2023 01:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7gSgk3O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702604518; x=1734140518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wL4Eoyse4tVBYo71qWXhYf0FrlyGLbF97OodMGxwqD0=;
  b=S7gSgk3OeOvq29hAHEHnbkz3iN9p7vZi2PUEU5188qSNzpv3ShorhYBq
   nwqNwrR2FIGd1+ngY0wptksQF3syjHe3sLWe4tYti64ykXvYuRi1uuSOv
   k+izvwifq8maCs+vB62JKpwTP9Zh8HTDqz7sdYldy8k3b2cWR2je2NEqG
   MgkRCBk0lX2CT+9ZXFmn4LBXsGGZr49Ypl/17+UrXZp/3a7oYRgib7Jo9
   f9iORSjeyQqJpy036gpUUY2yElIIppJAj2L+Rg0GWS/e2Z2T8G3swrIFe
   nbHUo7QYbRO83brVpM4joe7lF2dHMRoAyWh1sxpGY42LfEUqk/e2iGW3v
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="398004223"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="398004223"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:41:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="724271068"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="724271068"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Dec 2023 17:41:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDxD2-000MxV-0o;
	Fri, 15 Dec 2023 01:41:48 +0000
Date: Fri, 15 Dec 2023 09:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/seccomp.c:1405:1: sparse: sparse: Using plain integer as NULL
 pointer
Message-ID: <202312150951.Boq5rGVZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>

Hi Masahiro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c7402612e2e61b76177f22e6e7f705adcbecc6fe
commit: b1fbfcb4a20949df08dd995927cdc5ad220c128d kbuild: make single target builds even faster
date:   4 years, 1 month ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 years, 1 month ago
config: s390-randconfig-r111-20231116 (https://download.01.org/0day-ci/archive/20231215/202312150951.Boq5rGVZ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231215/202312150951.Boq5rGVZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312150951.Boq5rGVZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/seccomp.c:1405:1: sparse: sparse: Using plain integer as NULL pointer
>> kernel/seccomp.c:1405:1: sparse: sparse: Using plain integer as NULL pointer
--
>> ipc/msg.c:612:1: sparse: sparse: Using plain integer as NULL pointer
>> ipc/msg.c:612:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:625:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:625:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:746:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:746:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:759:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:759:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:939:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:939:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:1230:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:1230:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/msg.c:170:26: sparse: sparse: context imbalance in 'newque' - unexpected unlock
   ipc/msg.c:253:13: sparse: sparse: context imbalance in 'freeque' - unexpected unlock
   ipc/msg.c:451:9: sparse: sparse: context imbalance in 'msgctl_down' - different lock contexts for basic block
--
>> ipc/sem.c:2231:1: sparse: sparse: Using plain integer as NULL pointer
>> ipc/sem.c:2231:1: sparse: sparse: Using plain integer as NULL pointer
>> ipc/sem.c:2231:1: sparse: sparse: Using plain integer as NULL pointer
>> ipc/sem.c:2231:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/sem.c:2251:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/sem.c:2251:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/sem.c:2251:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/sem.c:2251:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/sem.c:2259:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/sem.c:2259:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/sem.c:557:9: sparse: sparse: context imbalance in 'newary' - unexpected unlock
   ipc/sem.c:1167:17: sparse: sparse: context imbalance in 'freeary' - unexpected unlock
   ipc/sem.c:1629:9: sparse: sparse: context imbalance in 'semctl_down' - different lock contexts for basic block
   ipc/sem.c:1888:24: sparse: sparse: context imbalance in 'find_alloc_undo' - wrong count at exit
   ipc/sem.c: note: in included file (through include/linux/workqueue.h, include/linux/rhashtable-types.h, include/linux/ipc.h, ...):
   include/linux/rcupdate.h:651:9: sparse: sparse: context imbalance in 'do_semtimedop' - unexpected unlock
--
>> ipc/shm.c:1194:1: sparse: sparse: Using plain integer as NULL pointer
>> ipc/shm.c:1194:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:1207:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:1207:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:1335:6: sparse: sparse: symbol 'compat_ksys_shmctl' was not declared. Should it be static?
   ipc/shm.c:1391:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:1391:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:1404:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:1404:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:1591:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:1591:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:1733:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:1733:1: sparse: sparse: Using plain integer as NULL pointer
   ipc/shm.c:120:17: sparse: sparse: context imbalance in 'do_shm_rmid' - unexpected unlock
   ipc/shm.c:248:17: sparse: sparse: context imbalance in '__shm_open' - unexpected unlock
   ipc/shm.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/list.h:139:25: sparse: sparse: context imbalance in 'shm_destroy' - unexpected unlock
   ipc/shm.c:346:17: sparse: sparse: context imbalance in 'shm_close' - unexpected unlock
   ipc/shm.c:352:12: sparse: sparse: context imbalance in 'shm_try_destroy_orphaned' - different lock contexts for basic block
   ipc/shm.c:415:9: sparse: sparse: context imbalance in 'exit_shm' - different lock contexts for basic block
   ipc/shm.c:683:17: sparse: sparse: context imbalance in 'newseg' - unexpected unlock
   ipc/shm.c:937:9: sparse: sparse: context imbalance in 'shmctl_down' - different lock contexts for basic block
   ipc/shm.c:1581:17: sparse: sparse: context imbalance in 'do_shmat' - unexpected unlock
--
>> ipc/syscall.c:110:1: sparse: sparse: Using plain integer as NULL pointer
>> ipc/syscall.c:110:1: sparse: sparse: Using plain integer as NULL pointer

vim +1405 kernel/seccomp.c

48dc92b9fc3926 Kees Cook      2014-06-25  1404  
48dc92b9fc3926 Kees Cook      2014-06-25 @1405  SYSCALL_DEFINE3(seccomp, unsigned int, op, unsigned int, flags,
a5662e4d81c4d4 Tycho Andersen 2018-12-09  1406  			 void __user *, uargs)
48dc92b9fc3926 Kees Cook      2014-06-25  1407  {
48dc92b9fc3926 Kees Cook      2014-06-25  1408  	return do_seccomp(op, flags, uargs);
48dc92b9fc3926 Kees Cook      2014-06-25  1409  }
48dc92b9fc3926 Kees Cook      2014-06-25  1410  

:::::: The code at line 1405 was first introduced by commit
:::::: 48dc92b9fc3926844257316e75ba11eb5c742b2c seccomp: add "seccomp" syscall

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
