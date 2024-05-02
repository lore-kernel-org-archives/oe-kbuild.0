Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B60D29A0
	for <oe-kbuild@lists.linux.dev>; Thu,  2 May 2024 04:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714623866; cv=none; b=Hw42xbJoWEnFeXS3klt0lB/zc0xNoBXT2qttrQYZu6b/F0QgSTSZLs0ODF6/xqXzixBjwkBuvomBUG2EaQwg6sz1rCK2m/+OBBTPsZsHmPsNNNLEse2j4o0WrQjnuqDyGZTzgsN5DW7GlSfltZxf9Lk3xpW3MDs80KgYj05kJ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714623866; c=relaxed/simple;
	bh=Q7VWYowwKjC1CmoYNdSHxX2jXLIbRtWn1tzNaTdtaLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lPf0lLdSUmHClRKpq1y6Q9T8Pb9njBAYaIf74d7i4fl3smlsJBv1cMRLTTGIMp31hzad8F0/k04vnfReqS1AS9H113fVYrvaMlfQv95PIA2GjI7FsGjPvZRX187lp+mzFbWqeXWtSudrXeRnxMxoCiaNtVgOR+e6cojVnlSPWv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h2GS1Y61; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h2GS1Y61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714623865; x=1746159865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q7VWYowwKjC1CmoYNdSHxX2jXLIbRtWn1tzNaTdtaLM=;
  b=h2GS1Y61Q/pv4FW8B3aBu7pJdNEg6m8cByTdQEj4CuDpfD87hqihp1iV
   M8Y7cxW4z2gEnvCzHhkbLSx+CxmKOhkZsrf/8rwOAzDO7zVJ5oDMrBvS+
   vt+Q8p6r1DkhtVLx99tLflTItxKLC67wvC2NGYiMRtJ18Dt7qgHtFeSNs
   oYyfDflnPBpYWZSCOB+6UHyyFkvPmYl9N487bqCVAlojr5yDoMgxRuUB3
   IGw6UJ28di7xf0AZEct3qUS8rjEEtvEfp57xsYQ4D0odM/2bvdlMboRJj
   ki6Pxhk1fHb5XetxL/ytIPxRGoEeA5DcV+SEAAl3WjG1q2vNs9L/CM5Iy
   w==;
X-CSE-ConnectionGUID: MUOUteX0Syan371v2StvRw==
X-CSE-MsgGUID: 1cDmoZLlRNCtSGVcqqY7FQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="21779816"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="21779816"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 21:24:19 -0700
X-CSE-ConnectionGUID: 3TtdcwbvSV2yQgtxZxteyg==
X-CSE-MsgGUID: av/MFIirTM2Ieebo+QY47A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="27504643"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 May 2024 21:24:18 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2NzU-000ANk-06;
	Thu, 02 May 2024 04:24:16 +0000
Date: Thu, 2 May 2024 12:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [nbdd0121:thin-lto 3/4] rust/helpers/helpers_combined.c:
 linux/export.h is included more than once.
Message-ID: <202405021222.RhKDre45-lkp@intel.com>
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
TO: Gary Guo <gary@garyguo.net>

tree:   https://github.com/nbdd0121/linux thin-lto
head:   98d45a070a161cc285a5aa8f2ab05159ff318146
commit: bf2d01fbb08533e84608386fe310bdd2cbe058af [3/4] kbuild: rust: auto generate rust helper exports
:::::: branch date: 9 hours ago
:::::: commit date: 12 hours ago
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405021222.RhKDre45-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> rust/helpers/helpers_combined.c: linux/export.h is included more than once.

vim +36 rust/helpers/helpers_combined.c

    35	
  > 36	#include <linux/export.h>
    37	#include <linux/errname.h>
    38	
    39	const char *rust_helper_errname(int err)
    40	{
    41		return errname(err);
    42	}
    43	// SPDX-License-Identifier: GPL-2.0
    44	
    45	#include <linux/err.h>
  > 46	#include <linux/export.h>
    47	
    48	__force void *rust_helper_ERR_PTR(long err)
    49	{
    50		return ERR_PTR(err);
    51	}
    52	
    53	bool rust_helper_IS_ERR(__force const void *ptr)
    54	{
    55		return IS_ERR(ptr);
    56	}
    57	
    58	long rust_helper_PTR_ERR(__force const void *ptr)
    59	{
    60		return PTR_ERR(ptr);
    61	}
    62	// SPDX-License-Identifier: GPL-2.0
    63	
    64	#include <kunit/test-bug.h>
  > 65	#include <linux/export.h>
    66	
    67	struct kunit *rust_helper_kunit_get_current_test(void)
    68	{
    69		return kunit_get_current_test();
    70	}
    71	// SPDX-License-Identifier: GPL-2.0
    72	
  > 73	#include <linux/export.h>
    74	#include <linux/mutex.h>
    75	
    76	void rust_helper_mutex_lock(struct mutex *lock)
    77	{
    78		mutex_lock(lock);
    79	}
    80	// SPDX-License-Identifier: GPL-2.0
    81	
  > 82	#include <linux/export.h>
    83	#include <linux/refcount.h>
    84	
    85	refcount_t rust_helper_REFCOUNT_INIT(int n)
    86	{
    87		return (refcount_t)REFCOUNT_INIT(n);
    88	}
    89	
    90	void rust_helper_refcount_inc(refcount_t *r)
    91	{
    92		refcount_inc(r);
    93	}
    94	
    95	bool rust_helper_refcount_dec_and_test(refcount_t *r)
    96	{
    97		return refcount_dec_and_test(r);
    98	}
    99	// SPDX-License-Identifier: GPL-2.0
   100	
 > 101	#include <linux/export.h>
   102	#include <linux/sched/signal.h>
   103	
   104	int rust_helper_signal_pending(struct task_struct *t)
   105	{
   106		return signal_pending(t);
   107	}
   108	// SPDX-License-Identifier: GPL-2.0
   109	
 > 110	#include <linux/export.h>
   111	#include <linux/spinlock.h>
   112	
   113	void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
   114					  struct lock_class_key *key)
   115	{
   116	#ifdef CONFIG_DEBUG_SPINLOCK
   117		__raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
   118	#else
   119		spin_lock_init(lock);
   120	#endif
   121	}
   122	
   123	void rust_helper_spin_lock(spinlock_t *lock)
   124	{
   125		spin_lock(lock);
   126	}
   127	
   128	void rust_helper_spin_unlock(spinlock_t *lock)
   129	{
   130		spin_unlock(lock);
   131	}
   132	// SPDX-License-Identifier: GPL-2.0
   133	
 > 134	#include <linux/export.h>
   135	#include <linux/sched/task.h>
   136	
   137	struct task_struct *rust_helper_get_current(void)
   138	{
   139		return current;
   140	}
   141	
   142	void rust_helper_get_task_struct(struct task_struct *t)
   143	{
   144		get_task_struct(t);
   145	}
   146	
   147	void rust_helper_put_task_struct(struct task_struct *t)
   148	{
   149		put_task_struct(t);
   150	}
   151	// SPDX-License-Identifier: GPL-2.0
   152	
 > 153	#include <linux/export.h>
   154	#include <linux/wait.h>
   155	
   156	void rust_helper_init_wait(struct wait_queue_entry *wq_entry)
   157	{
   158		init_wait(wq_entry);
   159	}
   160	// SPDX-License-Identifier: GPL-2.0
   161	
 > 162	#include <linux/export.h>
   163	#include <linux/workqueue.h>
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
