Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0C915BF
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Jul 2023 08:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688805265; x=1720341265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YZC20ycYf9rDE/etp+yFAdjjVpmvcIl6WP9A3lsAr4Y=;
  b=I+Jx4u0CMS/DGBr3xyQLxzEpZgKWFnmxzrLoxe2S6PvPNMzEcjO9QKl6
   rWzCrwehmPqhhYNmDTFV3edq3lOa+7YAFHUqY+C8+k+QnSlUibh54Gtcq
   QLjcwb+OYNzFtCQ3XXf4mtAsP5kjxb1QVWF0t4rHzYGnWIihgJjQAFb73
   +s0+/Czk3dKcJepIqi26TVMpzhMAOKQJBz2U3LOt3oPKFrvdQ1+a4xMnW
   CKBP2DiPoYjt727PVhlCkt7L5xG1lJ+MhEjaiZw+wO8xhWrBSqIXGTtIe
   AM8PvM8DqWYOPQ97QEvS7tEMO3oFsrxpYOgsKlLBAkNW7Awj8qhD2r0y/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="430112440"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="430112440"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2023 01:34:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="714257863"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="714257863"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 08 Jul 2023 01:34:24 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qI3OZ-0002d6-1f;
	Sat, 08 Jul 2023 08:34:23 +0000
Date: Sat, 8 Jul 2023 16:34:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-nonmm-unstable 7/20] kernel/signal.c: linux/file.h is
 included more than once.
Message-ID: <202307081626.VOmT8STW-lkp@intel.com>
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
TO: Vincent Whitchurch <vincent.whitchurch@axis.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   cdd54ce0ffc0c99482337abc8f65f4f7058e1115
commit: 0646c9dc794fe4d3ba48da9dad37300e430e6eff [7/20] signal: print comm and exe name on fatal signals
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307081626.VOmT8STW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307081626.VOmT8STW-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> kernel/signal.c: linux/file.h is included more than once.

vim +23 kernel/signal.c

  > 23	#include <linux/file.h>
    24	#include <linux/fs.h>
    25	#include <linux/mm.h>
    26	#include <linux/proc_fs.h>
    27	#include <linux/tty.h>
  > 28	#include <linux/file.h>
    29	#include <linux/binfmts.h>
    30	#include <linux/coredump.h>
    31	#include <linux/security.h>
    32	#include <linux/syscalls.h>
    33	#include <linux/ptrace.h>
    34	#include <linux/signal.h>
    35	#include <linux/signalfd.h>
    36	#include <linux/ratelimit.h>
    37	#include <linux/task_work.h>
    38	#include <linux/capability.h>
    39	#include <linux/freezer.h>
    40	#include <linux/pid_namespace.h>
    41	#include <linux/nsproxy.h>
    42	#include <linux/user_namespace.h>
    43	#include <linux/uprobes.h>
    44	#include <linux/compat.h>
    45	#include <linux/cn_proc.h>
    46	#include <linux/compiler.h>
    47	#include <linux/posix-timers.h>
    48	#include <linux/cgroup.h>
    49	#include <linux/audit.h>
    50	#include <linux/sysctl.h>
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
