Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6D179CD
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Nov 2023 10:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NetPIUoV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699783400; x=1731319400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U/SWlWM6AloodYIRMtX5tD/k15WEa+5GbViISA2cSj0=;
  b=NetPIUoVaOldVCZY1ha+SXfh3uQX3ihia/8zZBjtpY/+wE0aUGmnwG7j
   XyMH9KuP93lhfIbras+Ywz/kYjUi0XNzA0I27ckHp+uuycc0hAsIMEy+S
   sPVTR7zTiZpH2OY96YhmL5a3Ri+dggKfcUWwKqCwMdK1flyxfMA50Lhuq
   xgVEK3V+PZxf0xtzbsrj4IwiaUobH/8+9k8dlTxS3jXwo94WQGB0epJ9p
   8JbXErdMgTLHdmiQvYYtps1umYO+KSNiA9algcxD3SdLoJgnC4ACQqCib
   oBBnO2dXoYLcxepq2uioAyw+TitJQwrLXIy24rqZ5N5D+YH7dwFOX2LhR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="476544409"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="476544409"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 02:03:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="11821894"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Nov 2023 02:03:17 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r27JD-000B3W-1a;
	Sun, 12 Nov 2023 10:03:15 +0000
Date: Sun, 12 Nov 2023 18:02:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/events/core.c:5596:9: sparse:    struct perf_buffer *
Message-ID: <202311121752.iWNx9yRK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/events/core.c:5596:9: sparse:    struct perf_buffer *"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Steven Rostedt (VMware)" <rostedt@goodmis.org>

Hi Steven,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1b907d0507354b74a4f2c286380cd6059af79248
commit: 56de4e8f9146680bcd048a29888f7438d5e58c55 perf: Make struct ring_buffer less ambiguous
date:   3 years, 10 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 years, 10 months ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231112/202311121752.iWNx9yRK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311121752.iWNx9yRK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311121752.iWNx9yRK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/events/core.c:571:26: sparse: sparse: function 'perf_pmu_name' with external linkage has definition
   kernel/events/core.c:1384:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1384:15: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:1384:15: sparse:    struct perf_event_context *
   kernel/events/core.c:1397:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1397:28: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:1397:28: sparse:    struct perf_event_context *
   kernel/events/core.c:3221:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3221:18: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:3221:18: sparse:    struct perf_event_context *
   kernel/events/core.c:3222:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3222:23: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:3222:23: sparse:    struct perf_event_context *
   kernel/events/core.c:3264:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3264:25: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:3264:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3265:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3265:25: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:3265:25: sparse:    struct perf_event_context *
   kernel/events/core.c:4340:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4340:25: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:4340:25: sparse:    struct perf_event_context *
   kernel/events/core.c:5596:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5596:9: sparse:    struct perf_buffer [noderef] <asn:4> *
>> kernel/events/core.c:5596:9: sparse:    struct perf_buffer *
   kernel/events/core.c:5072:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t [usertype] events @@     got int @@
   kernel/events/core.c:5072:24: sparse:     expected restricted __poll_t [usertype] events
   kernel/events/core.c:5072:24: sparse:     got int
   kernel/events/core.c:5302:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5302:22: sparse:    struct perf_buffer [noderef] <asn:4> *
   kernel/events/core.c:5302:22: sparse:    struct perf_buffer *
   kernel/events/core.c:5438:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5438:14: sparse:    struct perf_buffer [noderef] <asn:4> *
   kernel/events/core.c:5438:14: sparse:    struct perf_buffer *
   kernel/events/core.c:5471:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5471:14: sparse:    struct perf_buffer [noderef] <asn:4> *
   kernel/events/core.c:5471:14: sparse:    struct perf_buffer *
   kernel/events/core.c:5528:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5528:14: sparse:    struct perf_buffer [noderef] <asn:4> *
   kernel/events/core.c:5528:14: sparse:    struct perf_buffer *
   kernel/events/core.c:5614:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5614:14: sparse:    struct perf_buffer [noderef] <asn:4> *
   kernel/events/core.c:5614:14: sparse:    struct perf_buffer *
   kernel/events/core.c:5627:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5627:14: sparse:    struct perf_buffer [noderef] <asn:4> *
   kernel/events/core.c:5627:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6302:6: sparse: sparse: symbol 'perf_pmu_snapshot_aux' was not declared. Should it be static?
   kernel/events/core.c:7091:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:7091:23: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:7091:23: sparse:    struct perf_event_context *
   kernel/events/core.c:7182:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:7182:13: sparse:    struct perf_buffer [noderef] <asn:4> *
   kernel/events/core.c:7182:13: sparse:    struct perf_buffer *
   kernel/events/core.c:7870:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:7870:23: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:7870:23: sparse:    struct perf_event_context *
   kernel/events/core.c:8751:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8751:9: sparse:    struct swevent_hlist [noderef] <asn:4> *
   kernel/events/core.c:8751:9: sparse:    struct swevent_hlist *
   kernel/events/core.c:8790:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8790:17: sparse:    struct swevent_hlist [noderef] <asn:4> *
   kernel/events/core.c:8790:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10142:1: sparse: sparse: symbol 'dev_attr_nr_addr_filters' was not declared. Should it be static?
   kernel/events/core.c:11863:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11863:9: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:11863:9: sparse:    struct perf_event_context *
   kernel/events/core.c:11973:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11973:17: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:11973:17: sparse:    struct perf_event_context *
   kernel/events/core.c:12397:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:12397:17: sparse:    struct swevent_hlist [noderef] <asn:4> *
   kernel/events/core.c:12397:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:155:9: sparse: sparse: context imbalance in 'perf_ctx_lock' - wrong count at exit
   kernel/events/core.c:163:17: sparse: sparse: context imbalance in 'perf_ctx_unlock' - unexpected unlock
   kernel/events/core.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h):
   include/linux/rcupdate.h:669:9: sparse: sparse: context imbalance in 'perf_lock_task_context' - different lock contexts for basic block
   kernel/events/core.c:1431:17: sparse: sparse: context imbalance in 'perf_pin_task_context' - unexpected unlock
   kernel/events/core.c:2651:9: sparse: sparse: context imbalance in '__perf_install_in_context' - wrong count at exit
   kernel/events/core.c:4312:17: sparse: sparse: context imbalance in 'find_get_context' - unexpected unlock
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:204:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got void const *buf @@
   kernel/events/internal.h:204:1: sparse:     expected void const [noderef] <asn:1> *from
   kernel/events/internal.h:204:1: sparse:     got void const *buf
   kernel/events/core.c:8600:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8600:17: sparse:    struct swevent_hlist [noderef] <asn:4> *
   kernel/events/core.c:8600:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:8620:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8620:17: sparse:    struct swevent_hlist [noderef] <asn:4> *
   kernel/events/core.c:8620:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:8740:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8740:16: sparse:    struct swevent_hlist [noderef] <asn:4> *
   kernel/events/core.c:8740:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:8740:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8740:16: sparse:    struct swevent_hlist [noderef] <asn:4> *
   kernel/events/core.c:8740:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:8740:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8740:16: sparse:    struct swevent_hlist [noderef] <asn:4> *
   kernel/events/core.c:8740:16: sparse:    struct swevent_hlist *
--
   kernel/events/ring_buffer.c:22:39: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int i @@     got restricted __poll_t [usertype] @@
   kernel/events/ring_buffer.c:22:39: sparse:     expected int i
   kernel/events/ring_buffer.c:22:39: sparse:     got restricted __poll_t [usertype]
   kernel/events/ring_buffer.c:169:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/ring_buffer.c:169:14: sparse:    struct perf_buffer [noderef] <asn:4> *
>> kernel/events/ring_buffer.c:169:14: sparse:    struct perf_buffer *
   kernel/events/ring_buffer.c:169:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/ring_buffer.c:169:14: sparse:    struct perf_buffer [noderef] <asn:4> *
>> kernel/events/ring_buffer.c:169:14: sparse:    struct perf_buffer *
   kernel/events/ring_buffer.c:169:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/ring_buffer.c:169:14: sparse:    struct perf_buffer [noderef] <asn:4> *
>> kernel/events/ring_buffer.c:169:14: sparse:    struct perf_buffer *

vim +5596 kernel/events/core.c

906010b2134e14 kernel/perf_event.c  Peter Zijlstra          2009-09-21  5549  
10c6db110d0eb4 kernel/events/core.c Peter Zijlstra          2011-11-26  5550  static void ring_buffer_attach(struct perf_event *event,
56de4e8f914668 kernel/events/core.c Steven Rostedt (VMware  2019-12-13  5551) 			       struct perf_buffer *rb)
10c6db110d0eb4 kernel/events/core.c Peter Zijlstra          2011-11-26  5552  {
56de4e8f914668 kernel/events/core.c Steven Rostedt (VMware  2019-12-13  5553) 	struct perf_buffer *old_rb = NULL;
10c6db110d0eb4 kernel/events/core.c Peter Zijlstra          2011-11-26  5554  	unsigned long flags;
10c6db110d0eb4 kernel/events/core.c Peter Zijlstra          2011-11-26  5555  
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5556  	if (event->rb) {
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5557  		/*
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5558  		 * Should be impossible, we set this when removing
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5559  		 * event->rb_entry and wait/clear when adding event->rb_entry.
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5560  		 */
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5561  		WARN_ON_ONCE(event->rcu_pending);
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5562  
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5563  		old_rb = event->rb;
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5564  		spin_lock_irqsave(&old_rb->event_lock, flags);
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5565  		list_del_rcu(&event->rb_entry);
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5566  		spin_unlock_irqrestore(&old_rb->event_lock, flags);
2f993cf093643b kernel/events/core.c Oleg Nesterov           2015-05-30  5567  
2f993cf093643b kernel/events/core.c Oleg Nesterov           2015-05-30  5568  		event->rcu_batches = get_state_synchronize_rcu();
2f993cf093643b kernel/events/core.c Oleg Nesterov           2015-05-30  5569  		event->rcu_pending = 1;
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5570  	}
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5571  
2f993cf093643b kernel/events/core.c Oleg Nesterov           2015-05-30  5572  	if (rb) {
2f993cf093643b kernel/events/core.c Oleg Nesterov           2015-05-30  5573  		if (event->rcu_pending) {
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5574  			cond_synchronize_rcu(event->rcu_batches);
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5575  			event->rcu_pending = 0;
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5576  		}
10c6db110d0eb4 kernel/events/core.c Peter Zijlstra          2011-11-26  5577  
10c6db110d0eb4 kernel/events/core.c Peter Zijlstra          2011-11-26  5578  		spin_lock_irqsave(&rb->event_lock, flags);
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5579  		list_add_rcu(&event->rb_entry, &rb->event_list);
10c6db110d0eb4 kernel/events/core.c Peter Zijlstra          2011-11-26  5580  		spin_unlock_irqrestore(&rb->event_lock, flags);
10c6db110d0eb4 kernel/events/core.c Peter Zijlstra          2011-11-26  5581  	}
10c6db110d0eb4 kernel/events/core.c Peter Zijlstra          2011-11-26  5582  
767ae08678c2c7 kernel/events/core.c Alexander Shishkin      2016-09-06  5583  	/*
767ae08678c2c7 kernel/events/core.c Alexander Shishkin      2016-09-06  5584  	 * Avoid racing with perf_mmap_close(AUX): stop the event
767ae08678c2c7 kernel/events/core.c Alexander Shishkin      2016-09-06  5585  	 * before swizzling the event::rb pointer; if it's getting
767ae08678c2c7 kernel/events/core.c Alexander Shishkin      2016-09-06  5586  	 * unmapped, its aux_mmap_count will be 0 and it won't
767ae08678c2c7 kernel/events/core.c Alexander Shishkin      2016-09-06  5587  	 * restart. See the comment in __perf_pmu_output_stop().
767ae08678c2c7 kernel/events/core.c Alexander Shishkin      2016-09-06  5588  	 *
767ae08678c2c7 kernel/events/core.c Alexander Shishkin      2016-09-06  5589  	 * Data will inevitably be lost when set_output is done in
767ae08678c2c7 kernel/events/core.c Alexander Shishkin      2016-09-06  5590  	 * mid-air, but then again, whoever does it like this is
767ae08678c2c7 kernel/events/core.c Alexander Shishkin      2016-09-06  5591  	 * not in for the data anyway.
767ae08678c2c7 kernel/events/core.c Alexander Shishkin      2016-09-06  5592  	 */
767ae08678c2c7 kernel/events/core.c Alexander Shishkin      2016-09-06  5593  	if (has_aux(event))
767ae08678c2c7 kernel/events/core.c Alexander Shishkin      2016-09-06  5594  		perf_event_stop(event, 0);
767ae08678c2c7 kernel/events/core.c Alexander Shishkin      2016-09-06  5595  
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14 @5596  	rcu_assign_pointer(event->rb, rb);
10c6db110d0eb4 kernel/events/core.c Peter Zijlstra          2011-11-26  5597  
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5598  	if (old_rb) {
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5599  		ring_buffer_put(old_rb);
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5600  		/*
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5601  		 * Since we detached before setting the new rb, so that we
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5602  		 * could attach the new rb, we could have missed a wakeup.
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5603  		 * Provide it now.
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5604  		 */
10c6db110d0eb4 kernel/events/core.c Peter Zijlstra          2011-11-26  5605  		wake_up_all(&event->waitq);
b69cf53640da2b kernel/events/core.c Peter Zijlstra          2014-03-14  5606  	}
10c6db110d0eb4 kernel/events/core.c Peter Zijlstra          2011-11-26  5607  }
10c6db110d0eb4 kernel/events/core.c Peter Zijlstra          2011-11-26  5608  

:::::: The code at line 5596 was first introduced by commit
:::::: b69cf53640da2b86439596118cfa95233154ee76 perf: Fix a race between ring_buffer_detach() and ring_buffer_attach()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
