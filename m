Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C272E2908
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Jan 2023 07:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674891985; x=1706427985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nLWnudtxZ5yX8xODXRvtM+DkqtsOOK78xrTHGsZMvbw=;
  b=MbyUyRwE/IveJAzFclk3kj9ebiAQf2hfpdwmOL4UZSBplP3EwPjcGQbN
   J6cY+iZjf/GhZqOLzN08HVnzxtgC9vjH/0FpphDl7b19fvxThVnSUA2oH
   7FzB1GOr8iGRcdGp4kcbeIgA15yDgDWPSPEjFIfAE7Q6ziZIpSLs0Rlv2
   1ZfsZ5NcenIeF8heizG0w3j0Q4+3XbFUNfNpujYLzFfcYOKAYKvdqyOl/
   euyLBVs8E+fsv8zTAd41hEITL3mo1h4+EMYqcRdDosHqsbQcIb4peHsEq
   Ag3K+etM+/VejYd+a3WaBmYyXwVojEX/vpFIKu67Bq4SLXFtkuDHUcbiY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="327289360"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="327289360"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2023 23:46:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="726946182"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="726946182"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Jan 2023 23:46:22 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLfun-0000V7-2t;
	Sat, 28 Jan 2023 07:46:21 +0000
Date: Sat, 28 Jan 2023 15:45:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/v4l2-core/v4l2-ctrls-api.c:993:11: warning: Parameter
 'dims' can be declared as const array [constParameter]
Message-ID: <202301281506.Z0DdjLGb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/media/v4l2-core/v4l2-ctrls-api.c:993:11: warning: Parameter 'dims' can be declared as const array [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Hans Verkuil <hverkuil@xs4all.nl>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5af6ce7049365952f7f023155234fe091693ead1
commit: 0975274557d15ab9a01c0944f27065e6708a797c media: v4l2-ctrls: add v4l2_ctrl_modify_dimensions
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 0975274557d15ab9a01c0944f27065e6708a797c
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
>> kernel/sched/fair.c:10527:16: warning: Local variable 'next_balance' shadows outer variable [shadowVariable]
    unsigned long next_balance = jiffies + 60*HZ;
                  ^
   kernel/sched/fair.c:5906:16: note: Shadowed declaration
    unsigned long next_balance;     /* in jiffy units */
                  ^
   kernel/sched/fair.c:10527:16: note: Shadow variable
    unsigned long next_balance = jiffies + 60*HZ;
                  ^
   kernel/sched/fair.c:10924:16: warning: Local variable 'next_balance' shadows outer variable [shadowVariable]
    unsigned long next_balance = now + 60*HZ;
                  ^
   kernel/sched/fair.c:5906:16: note: Shadowed declaration
    unsigned long next_balance;     /* in jiffy units */
                  ^
   kernel/sched/fair.c:10924:16: note: Shadow variable
    unsigned long next_balance = now + 60*HZ;
                  ^
   kernel/sched/fair.c:11107:16: warning: Local variable 'next_balance' shadows outer variable [shadowVariable]
    unsigned long next_balance = jiffies + HZ;
                  ^
   kernel/sched/fair.c:5906:16: note: Shadowed declaration
    unsigned long next_balance;     /* in jiffy units */
                  ^
   kernel/sched/fair.c:11107:16: note: Shadow variable
    unsigned long next_balance = jiffies + HZ;
                  ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/spi/spidev.c:578:13: warning: Uninitialized variable: iter->devt [uninitvar]
     if (iter->devt == inode->i_rdev) {
               ^
--
                 ^
   kernel/sched/fair.c:7461:1: warning: Label 'done' is not used. There is #if in function body so the label might be used in code that is removed by the preprocessor. [unusedLabelConfiguration]
   done: __maybe_unused;
   ^
   kernel/sched/sched.h:2058:67: warning: Parameter 'p' can be declared as pointer to const [constParameter]
   static inline int task_current(struct rq *rq, struct task_struct *p)
                                                                     ^
   kernel/sched/fair.c:5149:25: warning: Uninitialized variables: cfs_rq.load, cfs_rq.nr_running, cfs_rq.h_nr_running, cfs_rq.idle_nr_running, cfs_rq.idle_h_nr_running, cfs_rq.exec_clock, cfs_rq.min_vruntime, cfs_rq.min_vruntime_copy, cfs_rq.tasks_timeline, cfs_rq.curr, cfs_rq.next, cfs_rq.last, cfs_rq.skip [uninitvar]
     struct rq *rq = rq_of(cfs_rq);
                           ^
   kernel/sched/fair.c:5149:25: warning: Uninitialized variables: cfs_rq.load, cfs_rq.nr_running, cfs_rq.h_nr_running, cfs_rq.idle_nr_running, cfs_rq.idle_h_nr_running, cfs_rq.exec_clock, cfs_rq.min_vruntime, cfs_rq.min_vruntime_copy, cfs_rq.tasks_timeline, cfs_rq.curr, cfs_rq.next, cfs_rq.last, cfs_rq.skip, cfs_rq.rq, cfs_rq.on_list, cfs_rq.leaf_cfs_rq_list, cfs_rq.tg, cfs_rq.idle, cfs_rq.runtime_enabled, cfs_rq.runtime_remaining, cfs_rq.throttled_pelt_idle, cfs_rq.throttled_pelt_idle_copy, cfs_rq.throttled_clock, cfs_rq.throttled_clock_pelt, cfs_rq.throttled_clock_pelt_time, cfs_rq.throttled, cfs_rq.throttle_count, cfs_rq.throttled_list [uninitvar]
     struct rq *rq = rq_of(cfs_rq);
                           ^
   kernel/sched/fair.c:6481:16: warning: Local variable 'task_util' shadows outer function [shadowFunction]
    unsigned long task_util, best_cap = 0;
                  ^
   kernel/sched/fair.c:4093:29: note: Shadowed declaration
   static inline unsigned long task_util(struct task_struct *p)
                               ^
   kernel/sched/fair.c:6481:16: note: Shadow variable
    unsigned long task_util, best_cap = 0;
                  ^
   kernel/sched/fair.c:6522:16: warning: Local variable 'task_util' shadows outer function [shadowFunction]
    unsigned long task_util;
                  ^
   kernel/sched/fair.c:4093:29: note: Shadowed declaration
   static inline unsigned long task_util(struct task_struct *p)
                               ^
   kernel/sched/fair.c:6522:16: note: Shadow variable
    unsigned long task_util;
                  ^
   kernel/sched/fair.c:10528:6: warning: Local variable 'update_next_balance' shadows outer function [shadowFunction]
    int update_next_balance = 0;
        ^
   kernel/sched/fair.c:10382:1: note: Shadowed declaration
   update_next_balance(struct sched_domain *sd, unsigned long *next_balance)
   ^
   kernel/sched/fair.c:10528:6: note: Shadow variable
    int update_next_balance = 0;
        ^
   kernel/sched/fair.c:10926:6: warning: Local variable 'update_next_balance' shadows outer function [shadowFunction]
    int update_next_balance = 0;
        ^
   kernel/sched/fair.c:10382:1: note: Shadowed declaration
   update_next_balance(struct sched_domain *sd, unsigned long *next_balance)
   ^
   kernel/sched/fair.c:10926:6: note: Shadow variable
    int update_next_balance = 0;
        ^
   kernel/sched/fair.c:9079:58: warning: Parameter 'p' can be declared as pointer to const [constParameter]
   static int idle_cpu_without(int cpu, struct task_struct *p)
                                                            ^
   kernel/sched/fair.c:5149:25: warning: Uninitialized variables: cfs_rq.load, cfs_rq.nr_running, cfs_rq.h_nr_running, cfs_rq.idle_nr_running, cfs_rq.idle_h_nr_running, cfs_rq.exec_clock, cfs_rq.min_vruntime, cfs_rq.min_vruntime_copy, cfs_rq.tasks_timeline, cfs_rq.curr, cfs_rq.next, cfs_rq.last, cfs_rq.skip, cfs_rq.avg, cfs_rq.last_update_time_copy, cfs_rq.removed [uninitvar]
     struct rq *rq = rq_of(cfs_rq);
                           ^
   kernel/sched/fair.c:6540:25: warning: Uninitialized variable: task_util [uninitvar]
        asym_fits_capacity(task_util, target))
                           ^
   kernel/sched/fair.c:6529:28: note: Assuming condition is false
    if (static_branch_unlikely(&sched_asym_cpucapacity)) {
                              ^
   kernel/sched/fair.c:6540:25: note: Uninitialized variable: task_util
        asym_fits_capacity(task_util, target))
                           ^
>> drivers/media/v4l2-core/v4l2-ctrls-api.c:993:11: warning: Parameter 'dims' can be declared as const array [constParameter]
         u32 dims[V4L2_CTRL_MAX_DIMS])
             ^

vim +/dims +993 drivers/media/v4l2-core/v4l2-ctrls-api.c

0975274557d15a Hans Verkuil 2022-07-11   991  
0975274557d15a Hans Verkuil 2022-07-11   992  int __v4l2_ctrl_modify_dimensions(struct v4l2_ctrl *ctrl,
0975274557d15a Hans Verkuil 2022-07-11  @993  				  u32 dims[V4L2_CTRL_MAX_DIMS])
0975274557d15a Hans Verkuil 2022-07-11   994  {
0975274557d15a Hans Verkuil 2022-07-11   995  	unsigned int elems = 1;
0975274557d15a Hans Verkuil 2022-07-11   996  	unsigned int i;
0975274557d15a Hans Verkuil 2022-07-11   997  	void *p_array;
0975274557d15a Hans Verkuil 2022-07-11   998  
0975274557d15a Hans Verkuil 2022-07-11   999  	lockdep_assert_held(ctrl->handler->lock);
0975274557d15a Hans Verkuil 2022-07-11  1000  
0975274557d15a Hans Verkuil 2022-07-11  1001  	if (!ctrl->is_array || ctrl->is_dyn_array)
0975274557d15a Hans Verkuil 2022-07-11  1002  		return -EINVAL;
0975274557d15a Hans Verkuil 2022-07-11  1003  
0975274557d15a Hans Verkuil 2022-07-11  1004  	for (i = 0; i < ctrl->nr_of_dims; i++)
0975274557d15a Hans Verkuil 2022-07-11  1005  		elems *= dims[i];
0975274557d15a Hans Verkuil 2022-07-11  1006  	if (elems == 0)
0975274557d15a Hans Verkuil 2022-07-11  1007  		return -EINVAL;
0975274557d15a Hans Verkuil 2022-07-11  1008  	p_array = kvzalloc(2 * elems * ctrl->elem_size, GFP_KERNEL);
0975274557d15a Hans Verkuil 2022-07-11  1009  	if (!p_array)
0975274557d15a Hans Verkuil 2022-07-11  1010  		return -ENOMEM;
0975274557d15a Hans Verkuil 2022-07-11  1011  	kvfree(ctrl->p_array);
0975274557d15a Hans Verkuil 2022-07-11  1012  	ctrl->p_array_alloc_elems = elems;
0975274557d15a Hans Verkuil 2022-07-11  1013  	ctrl->elems = elems;
0975274557d15a Hans Verkuil 2022-07-11  1014  	ctrl->new_elems = elems;
0975274557d15a Hans Verkuil 2022-07-11  1015  	ctrl->p_array = p_array;
0975274557d15a Hans Verkuil 2022-07-11  1016  	ctrl->p_new.p = p_array;
0975274557d15a Hans Verkuil 2022-07-11  1017  	ctrl->p_cur.p = p_array + elems * ctrl->elem_size;
0975274557d15a Hans Verkuil 2022-07-11  1018  	for (i = 0; i < ctrl->nr_of_dims; i++)
0975274557d15a Hans Verkuil 2022-07-11  1019  		ctrl->dims[i] = dims[i];
0975274557d15a Hans Verkuil 2022-07-11  1020  	for (i = 0; i < elems; i++)
0975274557d15a Hans Verkuil 2022-07-11  1021  		ctrl->type_ops->init(ctrl, i, ctrl->p_cur);
0975274557d15a Hans Verkuil 2022-07-11  1022  	cur_to_new(ctrl);
0975274557d15a Hans Verkuil 2022-07-11  1023  	send_event(NULL, ctrl, V4L2_EVENT_CTRL_CH_VALUE);
0975274557d15a Hans Verkuil 2022-07-11  1024  	return 0;
0975274557d15a Hans Verkuil 2022-07-11  1025  }
0975274557d15a Hans Verkuil 2022-07-11  1026  EXPORT_SYMBOL(__v4l2_ctrl_modify_dimensions);
71c689dc2e732d Hans Verkuil 2021-04-27  1027  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
