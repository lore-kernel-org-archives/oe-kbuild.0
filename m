Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE471FD5
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jun 2023 09:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686388590; x=1717924590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pBlbsZp4lpx3HD/qEZtEmhrtA5+rzhh1sIAuSsVxqyg=;
  b=EpbVvqdFqcoUwIrvd6p/SEsj3pVgNITXqdf1zDlV6UXW+RpJe3usRchd
   PE7fRmDHbpCDpaMG9kEY2GnEu0bIGgNJnU+vH1aFu7qAAlUZqT5E9AKFB
   UAbcHjBbgI4QLvMN6ddJNLRzykCnMN5tjcO0LkG8jo1yR50hTAR5oGWaY
   hywGKIW/UxDZKl48apdxelYBZjF4kh+/VJdPcqhfs7pGVTpc//di02V5q
   lVzthbg6vSoQIu6ye5MjHQi/149CFZfXj48XjiesxduLxdG9hhte9c6uq
   iDL38sf93n+8yLtD8KwJBfve0/P5Ti8HEkbqK+hfUpjZUzILXGLtKNBUw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="361111303"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="361111303"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 02:16:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="800470083"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="800470083"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Jun 2023 02:16:27 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7uhu-0009wp-1O;
	Sat, 10 Jun 2023 09:16:26 +0000
Date: Sat, 10 Jun 2023 17:15:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [peterz-queue:core/guards 57/58] kernel/events/core.c:7980
 perf_pmu_output_stop() warn: statement has no effect 3
Message-ID: <202306101732.Ym5hZexW-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards
head:   dd132e83d180b932488bcf612576529e6163a1ea
commit: a814a98b2c087f7cdb2b6c08d227b25eacecb08c [57/58] perf: Simplify perf_pmu_output_stop()
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arm64-randconfig-m031-20230608 (https://download.01.org/0day-ci/archive/20230610/202306101732.Ym5hZexW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306101732.Ym5hZexW-lkp@intel.com/

smatch warnings:
kernel/events/core.c:7980 perf_pmu_output_stop() warn: statement has no effect 3

vim +7980 kernel/events/core.c

95ff4ca26c492f Alexander Shishkin 2015-12-02  7973  
95ff4ca26c492f Alexander Shishkin 2015-12-02  7974  static void perf_pmu_output_stop(struct perf_event *event)
95ff4ca26c492f Alexander Shishkin 2015-12-02  7975  {
95ff4ca26c492f Alexander Shishkin 2015-12-02  7976  	struct perf_event *iter;
95ff4ca26c492f Alexander Shishkin 2015-12-02  7977  	int err, cpu;
95ff4ca26c492f Alexander Shishkin 2015-12-02  7978  
95ff4ca26c492f Alexander Shishkin 2015-12-02  7979  restart:
a814a98b2c087f Peter Zijlstra     2023-06-09 @7980  	guard(rcu)();
95ff4ca26c492f Alexander Shishkin 2015-12-02  7981  	list_for_each_entry_rcu(iter, &event->rb->event_list, rb_entry) {
95ff4ca26c492f Alexander Shishkin 2015-12-02  7982  		/*
95ff4ca26c492f Alexander Shishkin 2015-12-02  7983  		 * For per-CPU events, we need to make sure that neither they
95ff4ca26c492f Alexander Shishkin 2015-12-02  7984  		 * nor their children are running; for cpu==-1 events it's
95ff4ca26c492f Alexander Shishkin 2015-12-02  7985  		 * sufficient to stop the event itself if it's active, since
95ff4ca26c492f Alexander Shishkin 2015-12-02  7986  		 * it can't have children.
95ff4ca26c492f Alexander Shishkin 2015-12-02  7987  		 */
95ff4ca26c492f Alexander Shishkin 2015-12-02  7988  		cpu = iter->cpu;
95ff4ca26c492f Alexander Shishkin 2015-12-02  7989  		if (cpu == -1)
95ff4ca26c492f Alexander Shishkin 2015-12-02  7990  			cpu = READ_ONCE(iter->oncpu);
95ff4ca26c492f Alexander Shishkin 2015-12-02  7991  
95ff4ca26c492f Alexander Shishkin 2015-12-02  7992  		if (cpu == -1)
95ff4ca26c492f Alexander Shishkin 2015-12-02  7993  			continue;
95ff4ca26c492f Alexander Shishkin 2015-12-02  7994  
95ff4ca26c492f Alexander Shishkin 2015-12-02  7995  		err = cpu_function_call(cpu, __perf_pmu_output_stop, event);
a814a98b2c087f Peter Zijlstra     2023-06-09  7996  		if (err == -EAGAIN)
95ff4ca26c492f Alexander Shishkin 2015-12-02  7997  			goto restart;
95ff4ca26c492f Alexander Shishkin 2015-12-02  7998  	}
95ff4ca26c492f Alexander Shishkin 2015-12-02  7999  }
52d857a8784a09 Jiri Olsa          2013-05-06  8000  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
