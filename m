Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E207E
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Aug 2023 23:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692919695; x=1724455695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VYKPbaOwIsdDVfu/TVKvBNWAHVD0/Dm9l9zDWl9JkeQ=;
  b=aM0+f+utmSmtctZWfYqN334fd4eDgdQY59Fs/CHLvZuVvgOYEB0LOUEi
   L2hDe4x6naXMR/TbEHD+OZ4Pse0lplSTW2iZvl1h9QvX6eqI/3NmoPF3q
   qyZ/pfJ8zQIwqEg0mjVToup3SmqaFSKawBnIEHR8xyh8kkAjPjAyc/lPY
   W1y4RdCH9xcbof88U9qt5s5DanFYDJ9/PY7zZVFtKbYbnmFYw2tAFdnn8
   UDzoq2Is8hoINVCSU3NZWQKd9wd51ooCIbuxMDh6jwK1WCjlQUEkVzETf
   4y+sH4okBKeq6/FYUs7TuLe92K8dFvDOAQMl4wv5gpRF9xPwcypD7ConN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="460943632"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="460943632"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 16:28:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="880950922"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2023 16:28:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZJkK-00032e-1X;
	Thu, 24 Aug 2023 23:28:12 +0000
Date: Fri, 25 Aug 2023 07:27:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android13-5.10 2/3] test_set_error_stamp: rm
 /kbuild/obj/consumer/i386-randconfig-063-20230825/.reduce_errors/block-blk-mq-sched.h:error:invalid-use-of-undefined-type-struct-elevator_queue
Message-ID: <202308250714.0po4itop-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: test_set_error_stamp: rm /kbuild/obj/consumer/i386-randconfig-063-20230825/.reduce_errors/block-blk-mq-sched.h:error:invalid-use-of-undefined-type-struct-elevator_queue"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   096e6c86b6160c7f99a75da296e6147b47bc8a43
commit: 3dc6e416a159a0bf3336e4c3469531fbbd128146 [2/3] ANDROID: force struct blk_mq_alloc_data to be defined in KMI
:::::: branch date: 31 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-063-20230825 (https://download.01.org/0day-ci/archive/20230825/202308250714.0po4itop-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250714.0po4itop-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308250714.0po4itop-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from block/blk-mq.h:6,
                    from block/blk.h:11,
                    from block/vendor_hooks.c:6:
   block/blk-mq-tag.h:42:43: warning: 'struct blk_mq_alloc_data' declared inside parameter list will not be visible outside of this definition or declaration
      42 | extern unsigned int blk_mq_get_tag(struct blk_mq_alloc_data *data);
         |                                           ^~~~~~~~~~~~~~~~~
   block/blk-mq.h: In function 'blk_mq_plug':
   block/blk-mq.h:281:31: error: 'struct task_struct' has no member named 'plug'
     281 |                 return current->plug;
         |                               ^~
   In file included from block/blk.h:12:
   block/blk-mq-sched.h: At top level:
   block/blk-mq-sched.h:27:55: warning: 'struct elevator_type' declared inside parameter list will not be visible outside of this definition or declaration
      27 | int blk_mq_init_sched(struct request_queue *q, struct elevator_type *e);
         |                                                       ^~~~~~~~~~~~~
   block/blk-mq-sched.h: In function 'blk_mq_sched_allow_merge':
>> block/blk-mq-sched.h:47:19: error: invalid use of undefined type 'struct elevator_queue'
      47 |         if (e && e->type->ops.allow_merge)
         |                   ^~
   block/blk-mq-sched.h:48:25: error: invalid use of undefined type 'struct elevator_queue'
      48 |                 return e->type->ops.allow_merge(q, rq, bio);
         |                         ^~
   block/blk-mq-sched.h: In function 'blk_mq_sched_completed_request':
   block/blk-mq-sched.h:57:19: error: invalid use of undefined type 'struct elevator_queue'
      57 |         if (e && e->type->ops.completed_request)
         |                   ^~
   block/blk-mq-sched.h:58:18: error: invalid use of undefined type 'struct elevator_queue'
      58 |                 e->type->ops.completed_request(rq, now);
         |                  ^~
   block/blk-mq-sched.h: In function 'blk_mq_sched_requeue_request':
   block/blk-mq-sched.h:66:51: error: invalid use of undefined type 'struct elevator_queue'
      66 |         if ((rq->rq_flags & RQF_ELVPRIV) && e && e->type->ops.requeue_request)
         |                                                   ^~
   block/blk-mq-sched.h:67:18: error: invalid use of undefined type 'struct elevator_queue'
      67 |                 e->type->ops.requeue_request(rq);
         |                  ^~
   block/blk-mq-sched.h: In function 'blk_mq_sched_has_work':
   block/blk-mq-sched.h:74:19: error: invalid use of undefined type 'struct elevator_queue'
      74 |         if (e && e->type->ops.has_work)
         |                   ^~
   block/blk-mq-sched.h:75:25: error: invalid use of undefined type 'struct elevator_queue'
      75 |                 return e->type->ops.has_work(hctx);
         |                         ^~
   block/blk.h: At top level:
   block/blk.h:206:38: warning: 'struct elevator_type' declared inside parameter list will not be visible outside of this definition or declaration
     206 |                               struct elevator_type *new_e);
         |                                      ^~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/block.h:29,
                    from block/vendor_hooks.c:14:
   include/trace/trace_events.h:27:23: warning: 'str__block__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for ARCH_HAS_NONLEAF_PMD_YOUNG
   Depends on [n]: PGTABLE_LEVELS [=2]>2
   Selected by [y]:
   - X86 [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
