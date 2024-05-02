Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F399921A1C
	for <oe-kbuild@lists.linux.dev>; Thu,  2 May 2024 07:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714635041; cv=none; b=ntoCiW9XYGryOxA455qwVH8VwDZ4UCTQ3CExV3MKaWTdvh4JxBe+IiVFvoll1iCxTavIy/khetAHCTXh+kc++Pe0ta0OXFRQjpht69bg43rthXE6bYmXHZXSrRqb95Ewrwe83Sr7wr5SiW8Ry+yJDPIUF3do/m7lJ3K/alZ/0/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714635041; c=relaxed/simple;
	bh=turALDA93dNTfVFRN9ckfAYKAYZ9Y8cCa2/VE1DkexQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U3lWIOxXtIZt/UTxK0TS7yYSyq8Q5qVZZG5ahBO4sSQ2PCq71XOGBY4VHmRzhBAGBdHlh7g+1EdMBScHZP558s7KZhHugK7NJ2OZJPjzmJZY0xNg0ohmLN/xRVEa2td51pPB6YE2w9KpuHbL5OdATc0VDyQIwdln6/RDUMCfTZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JqMBYABg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JqMBYABg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714635036; x=1746171036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=turALDA93dNTfVFRN9ckfAYKAYZ9Y8cCa2/VE1DkexQ=;
  b=JqMBYABg92+lR753uJyLazO4Xtr39DzIdjcCkfcb6k+6eY5afVn98aoH
   iRucv6sVJ8qxmCzurFzBd60la0kHutf0ScdtRvYU7O4QwPrVhA4sVPxf2
   rprFVBc8wsYbbd5774T+t0bK3xpTcnqu0XiPbZGjmBo5p4xyO8PvPAVDu
   v9oUQn14Ko4pYR+8dTep0VO6bDtqOBM7cmLVQbOpEkvdzz0uOcbenaPtM
   ijWRbh/Z137PJQmGgGMxnIIkEg61NH+VZjd4kmBluBmBWikxJCQuobP0P
   VHnOu7/8eFLDqZj58uTCW3MkUfZsGMEpHWWWNpijX1pEnxpaKLNIQ5VfZ
   Q==;
X-CSE-ConnectionGUID: 2AOh2AbGSjWT3dcNYRZ7tw==
X-CSE-MsgGUID: 0IX/M6jnRtC6SImb6912Hw==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="21538067"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="21538067"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 00:30:33 -0700
X-CSE-ConnectionGUID: ZMvyIHccRmWaaJOLn6a3Xg==
X-CSE-MsgGUID: JNI+WnhISGOKiweepsCX4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="31513642"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 May 2024 00:30:32 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2Qth-000AVC-22;
	Thu, 02 May 2024 07:30:29 +0000
Date: Thu, 2 May 2024 15:30:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [nbdd0121:thin-lto 4/4] rust/helpers/helpers_combined.c: helpers.h
 is included more than once.
Message-ID: <202405021511.dplt7agj-lkp@intel.com>
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
commit: 98d45a070a161cc285a5aa8f2ab05159ff318146 [4/4] WIP
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405021511.dplt7agj-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
   rust/helpers/helpers_combined.c: linux/export.h is included more than once.
>> rust/helpers/helpers_combined.c: helpers.h is included more than once.

vim +4 rust/helpers/helpers_combined.c

     2	
     3	#include <linux/bug.h>
   > 4	#include "helpers.h"
     5	
     6	__rust_helper __noreturn void rust_helper_BUG(void)
     7	{
     8		BUG();
     9	}
    10	// SPDX-License-Identifier: GPL-2.0
    11	
    12	#include <linux/build_bug.h>
    13	
    14	/*
    15	 * `bindgen` binds the C `size_t` type as the Rust `usize` type, so we can
    16	 * use it in contexts where Rust expects a `usize` like slice (array) indices.
    17	 * `usize` is defined to be the same as C's `uintptr_t` type (can hold any
    18	 * pointer) but not necessarily the same as `size_t` (can hold the size of any
    19	 * single object). Most modern platforms use the same concrete integer type for
    20	 * both of them, but in case we find ourselves on a platform where
    21	 * that's not true, fail early instead of risking ABI or
    22	 * integer-overflow issues.
    23	 *
    24	 * If your platform fails this assertion, it means that you are in
    25	 * danger of integer-overflow bugs (even if you attempt to add
    26	 * `--no-size_t-is-usize`). It may be easiest to change the kernel ABI on
    27	 * your platform such that `size_t` matches `uintptr_t` (i.e., to increase
    28	 * `size_t`, because `uintptr_t` has to be at least as big as `size_t`).
    29	 */
    30	static_assert(
    31		sizeof(size_t) == sizeof(uintptr_t) &&
    32		__alignof__(size_t) == __alignof__(uintptr_t),
    33		"Rust code expects C `size_t` to match Rust `usize`"
    34	);
    35	// SPDX-License-Identifier: GPL-2.0
    36	
    37	#include <linux/export.h>
    38	#include <linux/errname.h>
  > 39	#include "helpers.h"
    40	
    41	__rust_helper const char *rust_helper_errname(int err)
    42	{
    43		return errname(err);
    44	}
    45	// SPDX-License-Identifier: GPL-2.0
    46	
    47	#include <linux/err.h>
    48	#include <linux/export.h>
  > 49	#include "helpers.h"
    50	
    51	__rust_helper __force void *rust_helper_ERR_PTR(long err)
    52	{
    53		return ERR_PTR(err);
    54	}
    55	
    56	__rust_helper bool rust_helper_IS_ERR(__force const void *ptr)
    57	{
    58		return IS_ERR(ptr);
    59	}
    60	
    61	__rust_helper long rust_helper_PTR_ERR(__force const void *ptr)
    62	{
    63		return PTR_ERR(ptr);
    64	}
    65	// SPDX-License-Identifier: GPL-2.0
    66	
    67	#include <kunit/test-bug.h>
    68	#include <linux/export.h>
  > 69	#include "helpers.h"
    70	
    71	__rust_helper struct kunit *rust_helper_kunit_get_current_test(void)
    72	{
    73		return kunit_get_current_test();
    74	}
    75	// SPDX-License-Identifier: GPL-2.0
    76	
    77	#include <linux/export.h>
    78	#include <linux/mutex.h>
  > 79	#include "helpers.h"
    80	
    81	__rust_helper void rust_helper_mutex_lock(struct mutex *lock)
    82	{
    83		mutex_lock(lock);
    84	}
    85	// SPDX-License-Identifier: GPL-2.0
    86	
    87	#include <linux/export.h>
    88	#include <linux/refcount.h>
  > 89	#include "helpers.h"
    90	
    91	__rust_helper refcount_t rust_helper_REFCOUNT_INIT(int n)
    92	{
    93		return (refcount_t)REFCOUNT_INIT(n);
    94	}
    95	
    96	__rust_helper void rust_helper_refcount_inc(refcount_t *r)
    97	{
    98		refcount_inc(r);
    99	}
   100	
   101	__rust_helper bool rust_helper_refcount_dec_and_test(refcount_t *r)
   102	{
   103		return refcount_dec_and_test(r);
   104	}
   105	// SPDX-License-Identifier: GPL-2.0
   106	
   107	#include <linux/export.h>
   108	#include <linux/sched/signal.h>
 > 109	#include "helpers.h"
   110	
   111	__rust_helper int rust_helper_signal_pending(struct task_struct *t)
   112	{
   113		return signal_pending(t);
   114	}
   115	// SPDX-License-Identifier: GPL-2.0
   116	
   117	#include <linux/export.h>
   118	#include <linux/spinlock.h>
 > 119	#include "helpers.h"
   120	
   121	__rust_helper void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
   122					  struct lock_class_key *key)
   123	{
   124	#ifdef CONFIG_DEBUG_SPINLOCK
   125		__raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
   126	#else
   127		spin_lock_init(lock);
   128	#endif
   129	}
   130	
   131	__rust_helper void rust_helper_spin_lock(spinlock_t *lock)
   132	{
   133		spin_lock(lock);
   134	}
   135	
   136	__rust_helper void rust_helper_spin_unlock(spinlock_t *lock)
   137	{
   138		spin_unlock(lock);
   139	}
   140	// SPDX-License-Identifier: GPL-2.0
   141	
   142	#include <linux/export.h>
   143	#include <linux/sched/task.h>
 > 144	#include "helpers.h"
   145	
   146	__rust_helper struct task_struct *rust_helper_get_current(void)
   147	{
   148		return current;
   149	}
   150	
   151	__rust_helper void rust_helper_get_task_struct(struct task_struct *t)
   152	{
   153		get_task_struct(t);
   154	}
   155	
   156	__rust_helper void rust_helper_put_task_struct(struct task_struct *t)
   157	{
   158		put_task_struct(t);
   159	}
   160	// SPDX-License-Identifier: GPL-2.0
   161	
   162	#include <linux/export.h>
   163	#include <linux/wait.h>
 > 164	#include "helpers.h"
   165	
   166	__rust_helper void rust_helper_init_wait(struct wait_queue_entry *wq_entry)
   167	{
   168		init_wait(wq_entry);
   169	}
   170	// SPDX-License-Identifier: GPL-2.0
   171	
   172	#include <linux/export.h>
   173	#include <linux/workqueue.h>
 > 174	#include "helpers.h"
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
