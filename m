Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A719B1F61A
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Sep 2023 18:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695665680; x=1727201680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=frED5VEQwLSoWcvLoXyCaFc4Mux2v/rxCAlY0lBr0+o=;
  b=Ix3amXSCAoSDAFy0OzT2X7VxXkfA0FUC0E1nX2ebwGpcZvFD41ntqill
   ypebaWac5ZBGOlQeR0B+dZn2zb6f5IipJQXfROQ38JCHJbl2j0wWgCEGs
   eiZcBSRmewqxuA8zJ9kc/Kn4KajKM8563CGQ40o6WJq1RC+6NL7XfqTws
   5ObkYmwRtKRnFR7bofuSw23JQWHOa6pU9C/DNCjGSWmDTz3Lq30yocQvs
   huTlGnDe2Zz3vhZ7Fhbg7PMGQHw/mT1RVvt0ja+h8OQu3smV3FjxJURj3
   l/UB2ugkkazcEYBayToroR9VkCSLGn56IzPK0RHJfjMd2IvYEeMwf1FCH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="380198236"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="380198236"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 11:14:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="891790918"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="891790918"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 25 Sep 2023 11:13:36 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkq6O-0001tt-1p;
	Mon, 25 Sep 2023 18:14:36 +0000
Date: Tue, 26 Sep 2023 02:14:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [peterz-queue:core/guards2 15/38] kernel/events/core.c:4380
 perf_event_remove_on_exec() warn: inconsistent returns 'scope'.
Message-ID: <202309260227.xyuYPJy8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards2
head:   d131dfd46333faf6f8bafdc688402f8e1847b4c6
commit: a2c3318d6d464d3d728b524c0475d62a6c263b3a [15/38] perf: Simplify perf_event_*_on_exec()
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: i386-randconfig-141-20230924 (https://download.01.org/0day-ci/archive/20230926/202309260227.xyuYPJy8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230926/202309260227.xyuYPJy8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309260227.xyuYPJy8-lkp@intel.com/

smatch warnings:
kernel/events/core.c:4380 perf_event_remove_on_exec() warn: inconsistent returns 'scope'.

vim +/scope +4380 kernel/events/core.c

57e7986ed14241 kernel/perf_counter.c Paul Mackerras 2009-06-30  4343  
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4344  static void perf_remove_from_owner(struct perf_event *event);
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4345  static void perf_event_exit_event(struct perf_event *event,
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4346  				  struct perf_event_context *ctx);
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4347  
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4348  /*
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4349   * Removes all events from the current task that have been marked
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4350   * remove-on-exec, and feeds their values back to parent events.
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4351   */
bd27568117664b kernel/events/core.c  Peter Zijlstra 2022-10-08  4352  static void perf_event_remove_on_exec(struct perf_event_context *ctx)
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4353  {
bd27568117664b kernel/events/core.c  Peter Zijlstra 2022-10-08  4354  	struct perf_event_context *clone_ctx = NULL;
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4355  	struct perf_event *event, *next;
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4356  	bool modified = false;
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4357  
a2c3318d6d464d kernel/events/core.c  Peter Zijlstra 2023-06-09  4358  	scoped_guard (mutex, &ctx->mutex) {
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4359  		if (WARN_ON_ONCE(ctx->task != current))
a2c3318d6d464d kernel/events/core.c  Peter Zijlstra 2023-06-09  4360  			return;
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4361  
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4362  		list_for_each_entry_safe(event, next, &ctx->event_list, event_entry) {
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4363  			if (!event->attr.remove_on_exec)
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4364  				continue;
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4365  
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4366  			if (!is_kernel_event(event))
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4367  				perf_remove_from_owner(event);
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4368  
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4369  			modified = true;
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4370  
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4371  			perf_event_exit_event(event, ctx);
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4372  		}
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4373  
a2c3318d6d464d kernel/events/core.c  Peter Zijlstra 2023-06-09  4374  		guard(raw_spinlock_irqsave)(&ctx->lock);
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4375  		if (modified)
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4376  			clone_ctx = unclone_ctx(ctx);
a2c3318d6d464d kernel/events/core.c  Peter Zijlstra 2023-06-09  4377  	}
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4378  
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4379  	if (clone_ctx)
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08 @4380  		put_ctx(clone_ctx);
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4381  }
2e498d0a74e5b8 kernel/events/core.c  Marco Elver    2021-04-08  4382  

:::::: The code at line 4380 was first introduced by commit
:::::: 2e498d0a74e5b88a6689ae1b811f247f91ff188e perf: Add support for event removal on exec

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
