Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D874C1878
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jun 2023 03:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686369431; x=1717905431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zTD5fO3V9ZJAawGIx5+E5itUUqWR76xLwcypldl43Wk=;
  b=Fg036Ea71gO54wQkCslV0wM4PHbN8jGnu3JQY3ryYtVpEs9JFF9ijT26
   uQXIMWoruq/ryq4T7vZjol6EbZknHsISkv1GAfWwB8zOASKc5fLtMgpYW
   cOvSEsFO7Dmy8/Xz0IzmyX5mdTuTNFhZivTNdHg2LzSqnOFvr05iLN/o2
   lO9D4EtIe9tfE3nuG+YbRj8FBRSaub2hBaj8exV9wvrqP8Svva2m0Mxot
   nPg861FYgpTva0Kn5dVvcsdjAbTTxo5UdyZPItJsWbWoO8euE18fo9igC
   ZiXLaFnRud/JVLR/22KgtyKJh2z4oaf3il6C4UGuG3iRH/PCJjKL4/2mM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="423606781"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="423606781"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 20:57:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="743697570"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="743697570"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Jun 2023 20:57:10 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7piu-0009gC-36;
	Sat, 10 Jun 2023 03:57:08 +0000
Date: Sat, 10 Jun 2023 11:57:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [peterz-queue:core/guards 57/58] kernel/events/core.c:7980:9:
 sparse: sparse: typename in expression
Message-ID: <202306101137.W1hI1zRj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/events/core.c:7980:9: sparse: sparse: typename in expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards
head:   dd132e83d180b932488bcf612576529e6163a1ea
commit: a814a98b2c087f7cdb2b6c08d227b25eacecb08c [57/58] perf: Simplify perf_pmu_output_stop()
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: sh-randconfig-s052-20230609 (https://download.01.org/0day-ci/archive/20230610/202306101137.W1hI1zRj-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=a814a98b2c087f7cdb2b6c08d227b25eacecb08c
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue core/guards
        git checkout a814a98b2c087f7cdb2b6c08d227b25eacecb08c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sh SHELL=/bin/bash kernel/events/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306101137.W1hI1zRj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/events/core.c:7980:9: sparse: sparse: typename in expression
   kernel/events/core.c:7980:9: sparse: sparse: Expected ; at end of statement
   kernel/events/core.c:7980:9: sparse: sparse: got __UNIQUE_ID_guard514
   kernel/events/core.c:1391:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1391:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1391:15: sparse:    struct perf_event_context *
   kernel/events/core.c:1404:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1404:28: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1404:28: sparse:    struct perf_event_context *
   kernel/events/core.c:3459:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3459:20: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3459:20: sparse:    struct perf_event_context *
   kernel/events/core.c:3463:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3463:18: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3463:18: sparse:    struct perf_event_context *
   kernel/events/core.c:3464:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3464:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3464:23: sparse:    struct perf_event_context *
   kernel/events/core.c:3513:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3513:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3513:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3514:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3514:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3514:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3911:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3911:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3911:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4287:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4287:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4287:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4738:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4738:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4738:25: sparse:    struct perf_event_context *
   kernel/events/core.c:6109:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6109:9: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6109:9: sparse:    struct perf_buffer *
   kernel/events/core.c:5835:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5835:22: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:5835:22: sparse:    struct perf_buffer *
   kernel/events/core.c:5959:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5959:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:5959:14: sparse:    struct perf_buffer *
   kernel/events/core.c:5989:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5989:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:5989:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6043:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6043:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6043:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6130:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6130:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6130:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6146:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6146:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6146:14: sparse:    struct perf_buffer *
   kernel/events/core.c:7980:9: sparse: sparse: undefined identifier 'class_rcu_t'
   kernel/events/core.c:7873:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:7873:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:7873:15: sparse:    struct perf_event_context *
   kernel/events/core.c:7952:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:7952:13: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:7952:13: sparse:    struct perf_buffer *
   kernel/events/core.c:8754:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8754:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:8754:15: sparse:    struct perf_event_context *
   kernel/events/core.c:9789:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9789:9: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9789:9: sparse:    struct swevent_hlist *
   kernel/events/core.c:9826:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9826:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9826:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10098:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10098:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:10098:23: sparse:    struct perf_event_context *
   kernel/events/core.c:12824:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:12824:17: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:12824:17: sparse:    struct perf_event_context *
   kernel/events/core.c:12914:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:12914:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:12914:15: sparse:    struct perf_event_context *
   kernel/events/core.c:12926:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:12926:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:12926:9: sparse:    struct perf_event_context *
   kernel/events/core.c:13341:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13341:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:13341:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:9643:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9643:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9643:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:9663:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9663:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9663:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:9778:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9778:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9778:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:9778:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9778:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9778:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:9778:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9778:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9778:16: sparse:    struct swevent_hlist *

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
