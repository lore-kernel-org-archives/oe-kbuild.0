Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E8D2904
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jun 2023 17:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686416517; x=1717952517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tm/+s9PfiMq0xIyGH4OfBafT24vpP4Q8wZViKmh2TUY=;
  b=ayfujfVSLLNVZ6coZaly/8t3+DgWpSlHftrFpt59y8+MgYQLNSSDF1kF
   KJE4htU7j0LBFIEmziy7WKVhNiYZASRvXGnNag+kOZTOO7tR64fYlZNsP
   0fVqTA5fOUZ1yqM1IhWHbG3bF0jqm1bpE7GQoxBImkQBa8OjjXFsW6PtS
   XgzHUbFmLJfZH3kku/njBK4D2DeDaZ4tBopjNg8VVkUFKTB1UtR29Imev
   OaFQFz567xB1XXXr608LESILca9VxGHWPY3owEUbMPaFn7bE3ZdgFgolN
   NIAYwe2k4arKWDuaCFC148obSDI1mOnYbw60XO9/9bCeh+0lnO7RA4fXu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="444155631"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="444155631"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 10:01:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="823418369"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="823418369"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2023 10:01:54 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q81yM-000AIG-0S;
	Sat, 10 Jun 2023 17:01:54 +0000
Date: Sun, 11 Jun 2023 01:01:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [peterz-queue:core/guards2 55/58] kernel/events/core.c:1283
 perf_event_ctx_lock_nested() error: uninitialized symbol 'ctx'.
Message-ID: <202306110010.cY1I7MpN-lkp@intel.com>
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
head:   2f378348009384ec621ed31458cad708cdfe1840
commit: 45831cf2ac62c2cbae28cedce5a7622d36175df0 [55/58] perf: Misc cleanups
:::::: branch date: 5 hours ago
:::::: commit date: 8 hours ago
config: arm64-randconfig-m031-20230608 (https://download.01.org/0day-ci/archive/20230611/202306110010.cY1I7MpN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306110010.cY1I7MpN-lkp@intel.com/

smatch warnings:
kernel/events/core.c:1283 perf_event_ctx_lock_nested() error: uninitialized symbol 'ctx'.

vim +/ctx +1283 kernel/events/core.c

a63eaf34ae60bd kernel/perf_counter.c Paul Mackerras     2009-05-22  1204  
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1205  /*
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1206   * Because of perf_event::ctx migration in sys_perf_event_open::move_group and
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1207   * perf_pmu_migrate_context() we need some magic.
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1208   *
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1209   * Those places that change perf_event::ctx will hold both
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1210   * perf_event_ctx::mutex of the 'old' and 'new' ctx value.
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1211   *
8b10c5e2b59ef2 kernel/events/core.c  Peter Zijlstra     2015-05-01  1212   * Lock ordering is by mutex address. There are two other sites where
8b10c5e2b59ef2 kernel/events/core.c  Peter Zijlstra     2015-05-01  1213   * perf_event_context::mutex nests and those are:
8b10c5e2b59ef2 kernel/events/core.c  Peter Zijlstra     2015-05-01  1214   *
8b10c5e2b59ef2 kernel/events/core.c  Peter Zijlstra     2015-05-01  1215   *  - perf_event_exit_task_context()	[ child , 0 ]
8ba289b8d4e4db kernel/events/core.c  Peter Zijlstra     2016-01-26  1216   *      perf_event_exit_event()
8b10c5e2b59ef2 kernel/events/core.c  Peter Zijlstra     2015-05-01  1217   *        put_event()			[ parent, 1 ]
8b10c5e2b59ef2 kernel/events/core.c  Peter Zijlstra     2015-05-01  1218   *
8b10c5e2b59ef2 kernel/events/core.c  Peter Zijlstra     2015-05-01  1219   *  - perf_event_init_context()		[ parent, 0 ]
8b10c5e2b59ef2 kernel/events/core.c  Peter Zijlstra     2015-05-01  1220   *      inherit_task_group()
8b10c5e2b59ef2 kernel/events/core.c  Peter Zijlstra     2015-05-01  1221   *        inherit_group()
8b10c5e2b59ef2 kernel/events/core.c  Peter Zijlstra     2015-05-01  1222   *          inherit_event()
8b10c5e2b59ef2 kernel/events/core.c  Peter Zijlstra     2015-05-01  1223   *            perf_event_alloc()
8b10c5e2b59ef2 kernel/events/core.c  Peter Zijlstra     2015-05-01  1224   *              perf_init_event()
8b10c5e2b59ef2 kernel/events/core.c  Peter Zijlstra     2015-05-01  1225   *                perf_try_init_event()	[ child , 1 ]
8b10c5e2b59ef2 kernel/events/core.c  Peter Zijlstra     2015-05-01  1226   *
8b10c5e2b59ef2 kernel/events/core.c  Peter Zijlstra     2015-05-01  1227   * While it appears there is an obvious deadlock here -- the parent and child
8b10c5e2b59ef2 kernel/events/core.c  Peter Zijlstra     2015-05-01  1228   * nesting levels are inverted between the two. This is in fact safe because
8b10c5e2b59ef2 kernel/events/core.c  Peter Zijlstra     2015-05-01  1229   * life-time rules separate them. That is an exiting task cannot fork, and a
8b10c5e2b59ef2 kernel/events/core.c  Peter Zijlstra     2015-05-01  1230   * spawning task cannot (yet) exit.
8b10c5e2b59ef2 kernel/events/core.c  Peter Zijlstra     2015-05-01  1231   *
c034f48e99907d kernel/events/core.c  Randy Dunlap       2021-02-25  1232   * But remember that these are parent<->child context relations, and
8b10c5e2b59ef2 kernel/events/core.c  Peter Zijlstra     2015-05-01  1233   * migration does not affect children, therefore these two orderings should not
8b10c5e2b59ef2 kernel/events/core.c  Peter Zijlstra     2015-05-01  1234   * interact.
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1235   *
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1236   * The change in perf_event::ctx does not affect children (as claimed above)
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1237   * because the sys_perf_event_open() case will install a new event and break
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1238   * the ctx parent<->child relation, and perf_pmu_migrate_context() is only
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1239   * concerned with cpuctx and that doesn't have children.
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1240   *
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1241   * The places that change perf_event::ctx will issue:
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1242   *
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1243   *   perf_remove_from_context();
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1244   *   synchronize_rcu();
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1245   *   perf_install_in_context();
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1246   *
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1247   * to affect the change. The remove_from_context() + synchronize_rcu() should
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1248   * quiesce the event, after which we can install it in the new location. This
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1249   * means that only external vectors (perf_fops, prctl) can perturb the event
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1250   * while in transit. Therefore all such accessors should also acquire
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1251   * perf_event_context::mutex to serialize against this.
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1252   *
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1253   * However; because event->ctx can change while we're waiting to acquire
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1254   * ctx->mutex we must be careful and use the below perf_event_ctx_lock()
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1255   * function.
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1256   *
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1257   * Lock order:
f7cfd871ae0c50 kernel/events/core.c  Eric W. Biederman  2020-12-03  1258   *    exec_update_lock
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1259   *	task_struct::perf_event_mutex
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1260   *	  perf_event_context::mutex
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1261   *	    perf_event::child_mutex;
07c4a776135ea6 kernel/events/core.c  Peter Zijlstra     2016-01-26  1262   *	      perf_event_context::lock
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1263   *	    perf_event::mmap_mutex
c1e8d7c6a7a682 kernel/events/core.c  Michel Lespinasse  2020-06-08  1264   *	    mmap_lock
18736eef12137c kernel/events/core.c  Alexander Shishkin 2019-02-15  1265   *	      perf_addr_filters_head::lock
82d94856fa221b kernel/events/core.c  Peter Zijlstra     2018-01-09  1266   *
82d94856fa221b kernel/events/core.c  Peter Zijlstra     2018-01-09  1267   *    cpu_hotplug_lock
82d94856fa221b kernel/events/core.c  Peter Zijlstra     2018-01-09  1268   *      pmus_lock
82d94856fa221b kernel/events/core.c  Peter Zijlstra     2018-01-09  1269   *	  cpuctx->mutex / perf_event_context::mutex
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1270   */
a83fe28e2e4539 kernel/events/core.c  Peter Zijlstra     2015-01-29  1271  static struct perf_event_context *
a83fe28e2e4539 kernel/events/core.c  Peter Zijlstra     2015-01-29  1272  perf_event_ctx_lock_nested(struct perf_event *event, int nesting)
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1273  {
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1274  	struct perf_event_context *ctx;
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1275  
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1276  again:
45831cf2ac62c2 kernel/events/core.c  Peter Zijlstra     2023-06-09  1277  	scoped_guard (rcu) {
6aa7de059173a9 kernel/events/core.c  Mark Rutland       2017-10-23  1278  		ctx = READ_ONCE(event->ctx);
45831cf2ac62c2 kernel/events/core.c  Peter Zijlstra     2023-06-09  1279  		if (!refcount_inc_not_zero(&ctx->refcount))
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1280  			goto again;
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1281  	}
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1282  
a83fe28e2e4539 kernel/events/core.c  Peter Zijlstra     2015-01-29 @1283  	mutex_lock_nested(&ctx->mutex, nesting);
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1284  	if (event->ctx != ctx) {
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1285  		mutex_unlock(&ctx->mutex);
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1286  		put_ctx(ctx);
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1287  		goto again;
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1288  	}
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1289  
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1290  	return ctx;
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1291  }
f63a8daa5812af kernel/events/core.c  Peter Zijlstra     2015-01-23  1292  

:::::: The code at line 1283 was first introduced by commit
:::::: a83fe28e2e45392464858a96745db26ac73670c8 perf: Fix put_event() ctx lock

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
