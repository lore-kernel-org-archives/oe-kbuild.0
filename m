Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F941524F
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Dec 2023 05:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVKgyvg8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703222847; x=1734758847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O1zY8LJSt/qaJPU8zje5IaLjeHGYn9U9/VLEIgxQkkQ=;
  b=lVKgyvg8EVm2S+Py0h3lWA0AmY0CdlIeoOrPfeUOXvBt4dfewfINnYUJ
   ls2d5BjTRRW4iXdJCtxo5nqRufgGUudNtn36BYP+s7TWU4sOyjtXKIRep
   2kVGPI2hBHomVmy9RXE3Ye9+UFWr1ZJSyOyTymtmk1Msi+OHz2rrwjUfI
   i4SFSaz/OfwU4NVOlzD1fTELUgKfWT3smCew3BOHafueDfoXdV820FBr9
   yIYkTG6jvRnV7B6YaVWR1WDx9RDVcXu9fxK0dzHoZtiDcWuXzjzfa7BPT
   nsfAsiMa8SeTnXHdILTvLRSm+uYqzZznBbtOXjY4e3vFsHWwomRQp/Smv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="399901225"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="399901225"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 21:27:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="867547811"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="867547811"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2023 21:27:25 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGY4B-00096r-2f;
	Fri, 22 Dec 2023 05:27:23 +0000
Date: Fri, 22 Dec 2023 13:27:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9800/9925] include/linux/sched.h: linux/cache.h
 is included more than once.
Message-ID: <202312221348.6vs4L8y0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   857647efa9be89a13cf8963c7e167fab062b28bb
commit: cbc17801d0f5ebbbbf5cb222c0754d2a6c9135bd [9800/9925] Kill sched.h dependency on rcupdate.h
:::::: branch date: 19 hours ago
:::::: commit date: 29 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312221348.6vs4L8y0-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/sched.h: linux/cache.h is included more than once.

vim +16 include/linux/sched.h

    11	
    12	#include <asm/current.h>
    13	#include <asm/processor.h>
    14	#include <linux/thread_info.h>
    15	#include <linux/preempt.h>
  > 16	#include <linux/cache.h>
    17	#include <linux/cpumask.h>
    18	
  > 19	#include <linux/cache.h>
    20	#include <linux/irqflags_types.h>
    21	#include <linux/smp_types.h>
    22	#include <linux/pid_types.h>
    23	#include <linux/sem_types.h>
    24	#include <linux/shm.h>
    25	#include <linux/kmsan_types.h>
    26	#include <linux/mutex_types.h>
    27	#include <linux/plist_types.h>
    28	#include <linux/hrtimer_types.h>
    29	#include <linux/timer_types.h>
    30	#include <linux/seccomp_types.h>
    31	#include <linux/nodemask_types.h>
    32	#include <linux/refcount_types.h>
    33	#include <linux/resource.h>
    34	#include <linux/latencytop.h>
    35	#include <linux/sched/prio.h>
    36	#include <linux/sched/types.h>
    37	#include <linux/signal_types.h>
    38	#include <linux/syscall_user_dispatch_types.h>
    39	#include <linux/mm_types_task.h>
    40	#include <linux/task_io_accounting.h>
    41	#include <linux/posix-timers_types.h>
    42	#include <linux/restart_block.h>
    43	#include <uapi/linux/rseq.h>
    44	#include <linux/seqlock_types.h>
    45	#include <linux/kcsan.h>
    46	#include <linux/rv.h>
    47	#include <linux/livepatch_sched.h>
    48	#include <linux/uidgid_types.h>
    49	#include <asm/kmap_size.h>
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
