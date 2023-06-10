Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3259DBE6F
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jun 2023 08:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686384690; x=1717920690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=owRq/WNH7/v8P1vglqqtJJ06cRjMnjgom6rBnEFkcNU=;
  b=P1ybIGccm8uSxyiCZvQpDZck6vPLVXefsIUuCz/euAPMKMpOwTwrLx5p
   wqN6jArSKJd0uWF3aIPvLaNbxrWWtxieSIdcyqgGPWgjKXo+N53URLl1l
   JFGg7GSRh0dnS7BNIn+rkmcoXcqKUfhQ/bbQwisEEjW9gOcS1ETg3aWB5
   xPtqKyiQ9Ok+lc4a11f1lR6+ee2uRGUn2uXSqCjb2A40IxwlujMgwEKAy
   qIQ5FRKPWpDRzhwk5EIpORqG9uiXoX7Rnkz5JBcU7tRmoJ/LcbpRjNB9d
   Ua5g6JrDPl3sW+fAW/o8/orzyNUzQpq1m8nc0LWhwEDlj/+iNK2pWU4DG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="421335898"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="421335898"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 01:11:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="775759397"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="775759397"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Jun 2023 01:11:24 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7tgx-0009tQ-13;
	Sat, 10 Jun 2023 08:11:23 +0000
Date: Sat, 10 Jun 2023 16:11:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [peterz-queue:core/guards 51/58] kernel/events/core.c:12288
 __do_sys_perf_event_open() warn: 'task' is an error pointer or valid
Message-ID: <202306101640.qZLhyHcE-lkp@intel.com>
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
commit: d5731952629b9736380a608a894b2fcc8593ddb8 [51/58] perf: Simplify sys_perf_event_open()
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arm64-randconfig-m031-20230608 (https://download.01.org/0day-ci/archive/20230610/202306101640.qZLhyHcE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306101640.qZLhyHcE-lkp@intel.com/

smatch warnings:
kernel/events/core.c:12288 __do_sys_perf_event_open() warn: 'task' is an error pointer or valid
kernel/events/core.c:12328 __do_sys_perf_event_open() error: 'task' dereferencing possible ERR_PTR()
kernel/events/core.c:12288 __do_sys_perf_event_open() warn: 'task' is an error pointer or valid
kernel/events/core.c:12328 __do_sys_perf_event_open() error: 'task' dereferencing possible ERR_PTR()

vim +/task +12288 kernel/events/core.c

b068fc04de10ff kernel/events/core.c  Marco Elver             2021-07-05  12187  
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  12188  /**
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  12189   * sys_perf_event_open - open a performance event, associate it to a task/cpu
9f66a3810fe0d4 kernel/perf_counter.c Ingo Molnar             2008-12-10  12190   *
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  12191   * @attr_uptr:	event_id type attributes for monitoring/sampling
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  12192   * @pid:		target pid
9f66a3810fe0d4 kernel/perf_counter.c Ingo Molnar             2008-12-10  12193   * @cpu:		target cpu
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  12194   * @group_fd:		group leader event fd
a1ddf5249f2c50 kernel/events/core.c  Haocheng Xie            2021-05-27  12195   * @flags:		perf event open flags
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  12196   */
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  12197  SYSCALL_DEFINE5(perf_event_open,
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  12198  		struct perf_event_attr __user *, attr_uptr,
2743a5b0fa6f30 kernel/perf_counter.c Paul Mackerras          2009-03-04  12199  		pid_t, pid, int, cpu, int, group_fd, unsigned long, flags)
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  12200  {
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  12201  	struct perf_event *group_leader = NULL, *output_event = NULL;
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12202  	struct perf_event *sibling;
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  12203  	struct perf_event_attr attr;
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  12204  	struct file *event_file = NULL;
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12205  	struct task_struct *task __free(put_task) = NULL;
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12206  	struct fd group __free(fdput) = fdnull;
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  12207  	struct pmu *pmu;
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  12208  	int move_group = 0;
a21b0b354d4ac3 kernel/events/core.c  Yann Droneaud           2014-01-05  12209  	int f_flags = O_RDWR;
79dff51e900fd2 kernel/events/core.c  Matt Fleming            2015-01-23  12210  	int cgroup_fd = -1;
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12211  	int err;
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  12212  
2743a5b0fa6f30 kernel/perf_counter.c Paul Mackerras          2009-03-04  12213  	/* for future expandability... */
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  12214  	if (flags & ~PERF_FLAG_ALL)
2743a5b0fa6f30 kernel/perf_counter.c Paul Mackerras          2009-03-04  12215  		return -EINVAL;
2743a5b0fa6f30 kernel/perf_counter.c Paul Mackerras          2009-03-04  12216  
0a041ebca49562 kernel/events/core.c  Namhyung Kim            2022-12-20  12217  	err = perf_copy_attr(attr_uptr, &attr);
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  12218) 	if (err)
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  12219) 		return err;
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  12220) 
0a041ebca49562 kernel/events/core.c  Namhyung Kim            2022-12-20  12221  	/* Do we allow access to perf_event_open(2) ? */
0a041ebca49562 kernel/events/core.c  Namhyung Kim            2022-12-20  12222  	err = security_perf_event_open(&attr, PERF_SECURITY_OPEN);
dc86cabe4b2424 kernel/perf_counter.c Ingo Molnar             2009-09-03  12223  	if (err)
dc86cabe4b2424 kernel/perf_counter.c Ingo Molnar             2009-09-03  12224  		return err;
eab656ae04b9d3 kernel/perf_counter.c Thomas Gleixner         2008-12-08  12225  
0764771dab80d7 kernel/perf_counter.c Peter Zijlstra          2009-06-11  12226  	if (!attr.exclude_kernel) {
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  12227) 		err = perf_allow_kernel(&attr);
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  12228) 		if (err)
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  12229) 			return err;
0764771dab80d7 kernel/perf_counter.c Peter Zijlstra          2009-06-11  12230  	}
0764771dab80d7 kernel/perf_counter.c Peter Zijlstra          2009-06-11  12231  
e422267322cd31 kernel/events/core.c  Hari Bathini            2017-03-08  12232  	if (attr.namespaces) {
18aa18566218d4 kernel/events/core.c  Alexey Budankov         2020-04-02  12233  		if (!perfmon_capable())
e422267322cd31 kernel/events/core.c  Hari Bathini            2017-03-08  12234  			return -EACCES;
e422267322cd31 kernel/events/core.c  Hari Bathini            2017-03-08  12235  	}
e422267322cd31 kernel/events/core.c  Hari Bathini            2017-03-08  12236  
df58ab24bf26b1 kernel/perf_counter.c Peter Zijlstra          2009-06-11  12237  	if (attr.freq) {
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  12238  		if (attr.sample_freq > sysctl_perf_event_sample_rate)
df58ab24bf26b1 kernel/perf_counter.c Peter Zijlstra          2009-06-11  12239  			return -EINVAL;
0819b2e30ccb93 kernel/events/core.c  Peter Zijlstra          2014-05-15  12240  	} else {
0819b2e30ccb93 kernel/events/core.c  Peter Zijlstra          2014-05-15  12241  		if (attr.sample_period & (1ULL << 63))
0819b2e30ccb93 kernel/events/core.c  Peter Zijlstra          2014-05-15  12242  			return -EINVAL;
df58ab24bf26b1 kernel/perf_counter.c Peter Zijlstra          2009-06-11  12243  	}
df58ab24bf26b1 kernel/perf_counter.c Peter Zijlstra          2009-06-11  12244  
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang               2017-08-28  12245  	/* Only privileged users can get physical addresses */
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  12246) 	if ((attr.sample_type & PERF_SAMPLE_PHYS_ADDR)) {
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  12247) 		err = perf_allow_kernel(&attr);
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  12248) 		if (err)
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  12249) 			return err;
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  12250) 	}
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang               2017-08-28  12251  
b0c8fdc7fdb775 kernel/events/core.c  David Howells           2019-08-19  12252  	/* REGS_INTR can leak data, lockdown must prevent this */
08ef1af4de5fe7 kernel/events/core.c  Ondrej Mosnacek         2021-02-24  12253  	if (attr.sample_type & PERF_SAMPLE_REGS_INTR) {
08ef1af4de5fe7 kernel/events/core.c  Ondrej Mosnacek         2021-02-24  12254  		err = security_locked_down(LOCKDOWN_PERF);
08ef1af4de5fe7 kernel/events/core.c  Ondrej Mosnacek         2021-02-24  12255  		if (err)
b0c8fdc7fdb775 kernel/events/core.c  David Howells           2019-08-19  12256  			return err;
08ef1af4de5fe7 kernel/events/core.c  Ondrej Mosnacek         2021-02-24  12257  	}
b0c8fdc7fdb775 kernel/events/core.c  David Howells           2019-08-19  12258  
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  12259  	/*
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  12260  	 * In cgroup mode, the pid argument is used to pass the fd
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  12261  	 * opened to the cgroup directory in cgroupfs. The cpu argument
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  12262  	 * designates the cpu on which to monitor threads from that
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  12263  	 * cgroup.
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  12264  	 */
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  12265  	if ((flags & PERF_FLAG_PID_CGROUP) && (pid == -1 || cpu == -1))
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  12266  		return -EINVAL;
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  12267  
a21b0b354d4ac3 kernel/events/core.c  Yann Droneaud           2014-01-05  12268  	if (flags & PERF_FLAG_FD_CLOEXEC)
a21b0b354d4ac3 kernel/events/core.c  Yann Droneaud           2014-01-05  12269  		f_flags |= O_CLOEXEC;
a21b0b354d4ac3 kernel/events/core.c  Yann Droneaud           2014-01-05  12270  
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12271  	CLASS(get_unused_fd, fd)(f_flags);
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12272  	if (fd < 0)
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12273  		return fd;
ea635c64e00706 kernel/perf_event.c   Al Viro                 2010-05-26  12274  
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  12275  	if (group_fd != -1) {
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12276  		group = fdget(group_fd);
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12277  		if (!is_perf_fd(group))
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12278  			return -EBADF;
2903ff019b346a kernel/events/core.c  Al Viro                 2012-08-28  12279  		group_leader = group.file->private_data;
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  12280  		if (flags & PERF_FLAG_FD_OUTPUT)
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  12281  			output_event = group_leader;
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  12282  		if (flags & PERF_FLAG_FD_NO_GROUP)
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  12283  			group_leader = NULL;
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  12284  	}
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  12285  
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  12286  	if (pid != -1 && !(flags & PERF_FLAG_PID_CGROUP)) {
c6be5a5cb62592 kernel/perf_event.c   Peter Zijlstra          2010-10-14  12287  		task = find_lively_task_by_vpid(pid);
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09 @12288  		if (!task)
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12289  			return -ESRCH;
c6be5a5cb62592 kernel/perf_event.c   Peter Zijlstra          2010-10-14  12290  	}
c6be5a5cb62592 kernel/perf_event.c   Peter Zijlstra          2010-10-14  12291  
1f4ee5038f0c1e kernel/events/core.c  Peter Zijlstra          2014-05-06  12292  	if (task && group_leader &&
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12293  	    group_leader->attr.inherit != attr.inherit)
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12294  		return -EINVAL;
1f4ee5038f0c1e kernel/events/core.c  Peter Zijlstra          2014-05-06  12295  
79dff51e900fd2 kernel/events/core.c  Matt Fleming            2015-01-23  12296  	if (flags & PERF_FLAG_PID_CGROUP)
79dff51e900fd2 kernel/events/core.c  Matt Fleming            2015-01-23  12297  		cgroup_fd = pid;
79dff51e900fd2 kernel/events/core.c  Matt Fleming            2015-01-23  12298  
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12299  	struct perf_event *event __free(free_event) =
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12300  		perf_event_alloc(&attr, cpu, task, group_leader, NULL,
79dff51e900fd2 kernel/events/core.c  Matt Fleming            2015-01-23  12301  				 NULL, NULL, cgroup_fd);
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12302  	if (IS_ERR(event))
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12303  		return PTR_ERR(event);
d14b12d7adbf21 kernel/perf_event.c   Stephane Eranian        2010-09-17  12304  
53b25335dd6098 kernel/events/core.c  Vince Weaver            2014-05-16  12305  	if (is_sampling_event(event)) {
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12306  		if (event->pmu->capabilities & PERF_PMU_CAP_NO_INTERRUPT)
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12307  			return -EOPNOTSUPP;
53b25335dd6098 kernel/events/core.c  Vince Weaver            2014-05-16  12308  	}
53b25335dd6098 kernel/events/core.c  Vince Weaver            2014-05-16  12309  
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  12310  	/*
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  12311  	 * Special case software events and allow them to be part of
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  12312  	 * any hardware group.
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  12313  	 */
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  12314  	pmu = event->pmu;
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  12315  
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  12316  	if (attr.use_clockid) {
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  12317  		err = perf_event_set_clock(event, attr.clockid);
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  12318  		if (err)
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12319  			return err;
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  12320  	}
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  12321  
4ff6a8debf48a7 kernel/events/core.c  David Carrillo-Cisneros 2016-08-17  12322  	if (pmu->task_ctx_nr == perf_sw_context)
4ff6a8debf48a7 kernel/events/core.c  David Carrillo-Cisneros 2016-08-17  12323  		event->event_caps |= PERF_EV_CAP_SOFTWARE;
4ff6a8debf48a7 kernel/events/core.c  David Carrillo-Cisneros 2016-08-17  12324  
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12325  	do {
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12326  		struct rw_semaphore *exec_update_lock __free(up_read) = NULL;
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12327  		if (task) {
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08 @12328  			err = down_read_interruptible(&task->signal->exec_update_lock);
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12329  			if (err)
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12330  				return err;
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12331  
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12332  			exec_update_lock = &task->signal->exec_update_lock;
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12333  
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  12334  			/*
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12335  			 * We must hold exec_update_lock across this and any potential
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12336  			 * perf_install_in_context() call for this new event to
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12337  			 * serialize against exec() altering our credentials (and the
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12338  			 * perf_event_exit_task() that could imply).
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  12339  			 */
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12340  			if (!perf_check_permission(&attr, task))
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12341  				return -EACCES;
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  12342  		}
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  12343  
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  12344  		/*
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  12345  		 * Get the target context (task or percpu):
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  12346  		 */
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12347  		CLASS(find_get_ctx, ctx)(task, event);
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12348  		if (IS_ERR(ctx))
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12349  			return PTR_ERR(ctx);
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  12350  
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12351  		guard(mutex)(&ctx->mutex);
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12352  
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12353  		if (ctx->task == TASK_TOMBSTONE)
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12354  			return -ESRCH;
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  12355  
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12356  		if (!task) {
ccff286d85098b kernel/perf_counter.c Ingo Molnar             2008-12-11  12357  			/*
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12358  			 * Check if the @cpu we're creating an event for is
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12359  			 * online.
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12360  			 *
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12361  			 * We use the perf_cpu_context::ctx::mutex to serialize
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12362  			 * against the hotplug notifiers. See
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12363  			 * perf_event_{init,exit}_cpu().
04289bb9891882 kernel/perf_counter.c Ingo Molnar             2008-12-11  12364  			 */
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12365  			struct perf_cpu_context *cpuctx =
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12366  				per_cpu_ptr(&perf_cpu_context, event->cpu);
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12367  
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12368  			if (!cpuctx->online)
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12369  				return -ENODEV;
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12370  		}
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12371  
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  12372  		if (group_leader) {
dc86cabe4b2424 kernel/perf_counter.c Ingo Molnar             2009-09-03  12373  			err = -EINVAL;
04289bb9891882 kernel/perf_counter.c Ingo Molnar             2008-12-11  12374  
04289bb9891882 kernel/perf_counter.c Ingo Molnar             2008-12-11  12375  			/*
ccff286d85098b kernel/perf_counter.c Ingo Molnar             2008-12-11  12376  			 * Do not allow a recursive hierarchy (this new sibling
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12377  			 * becoming part of another group-sibling)
04289bb9891882 kernel/perf_counter.c Ingo Molnar             2008-12-11  12378  			 */
ccff286d85098b kernel/perf_counter.c Ingo Molnar             2008-12-11  12379  			if (group_leader->group_leader != group_leader)
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12380  				return -EINVAL;
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  12381  
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  12382  			/* All events in a group should have the same clock */
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  12383  			if (group_leader->clock != event->clock)
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12384  				return -EINVAL;
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  12385  
04289bb9891882 kernel/perf_counter.c Ingo Molnar             2008-12-11  12386  			/*
64aee2a965cf29 kernel/events/core.c  Mark Rutland            2017-06-22  12387  			 * Make sure we're both events for the same CPU;
64aee2a965cf29 kernel/events/core.c  Mark Rutland            2017-06-22  12388  			 * grouping events for different CPUs is broken; since
64aee2a965cf29 kernel/events/core.c  Mark Rutland            2017-06-22  12389  			 * you can never concurrently schedule them anyhow.
04289bb9891882 kernel/perf_counter.c Ingo Molnar             2008-12-11  12390  			 */
64aee2a965cf29 kernel/events/core.c  Mark Rutland            2017-06-22  12391  			if (group_leader->cpu != event->cpu)
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12392  				return -EINVAL;
c3c87e770458aa kernel/events/core.c  Peter Zijlstra          2015-01-23  12393  
c3c87e770458aa kernel/events/core.c  Peter Zijlstra          2015-01-23  12394  			/*
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12395  			 * Make sure we're both on the same context; either
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12396  			 * task or cpu.
c3c87e770458aa kernel/events/core.c  Peter Zijlstra          2015-01-23  12397  			 */
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12398  			if (group_leader->ctx != ctx)
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12399  				return -EINVAL;
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  12400  
3b6f9e5cb21964 kernel/perf_counter.c Paul Mackerras          2009-01-14  12401  			/*
3b6f9e5cb21964 kernel/perf_counter.c Paul Mackerras          2009-01-14  12402  			 * Only a group leader can be exclusive or pinned
3b6f9e5cb21964 kernel/perf_counter.c Paul Mackerras          2009-01-14  12403  			 */
0d48696f87e361 kernel/perf_counter.c Peter Zijlstra          2009-06-02  12404  			if (attr.exclusive || attr.pinned)
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12405  				return -EINVAL;
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  12406  
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12407  			if (is_software_event(event) &&
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12408  			    !in_software_context(group_leader)) {
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  12409  				/*
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12410  				 * If the event is a sw event, but the
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12411  				 * group_leader is on hw context.
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12412  				 *
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12413  				 * Allow the addition of software events to hw
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12414  				 * groups, this is safe because software events
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12415  				 * never fail to schedule.
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12416  				 *
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12417  				 * Note the comment that goes with struct
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12418  				 * perf_event_pmu_context.
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  12419  				 */
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12420  				pmu = group_leader->pmu_ctx->pmu;
bf480f93856673 kernel/events/core.c  Ravi Bangoria           2022-11-22  12421  			} else if (!is_software_event(event)) {
bf480f93856673 kernel/events/core.c  Ravi Bangoria           2022-11-22  12422  				if (is_software_event(group_leader) &&
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12423  				    (group_leader->group_caps & PERF_EV_CAP_SOFTWARE)) {
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  12424  					/*
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12425  					 * In case the group is a pure software
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12426  					 * group, and we try to add a hardware
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12427  					 * event, move the whole group to the
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12428  					 * hardware context.
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  12429  					 */
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12430  					move_group = 1;
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  12431  				}
8a58ddae23796c kernel/events/core.c  Alexander Shishkin      2019-07-01  12432  
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12433  				/*
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12434  				 * Don't allow group of multiple hw events from
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12435  				 * different pmus
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12436  				 */
bf480f93856673 kernel/events/core.c  Ravi Bangoria           2022-11-22  12437  				if (!in_software_context(group_leader) &&
bf480f93856673 kernel/events/core.c  Ravi Bangoria           2022-11-22  12438  				    group_leader->pmu_ctx->pmu != pmu)
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12439  					return -EINVAL;
8a58ddae23796c kernel/events/core.c  Alexander Shishkin      2019-07-01  12440  			}
8a58ddae23796c kernel/events/core.c  Alexander Shishkin      2019-07-01  12441  		}
3ac6487e584a1e kernel/events/core.c  Peter Zijlstra          2022-05-20  12442  
3ac6487e584a1e kernel/events/core.c  Peter Zijlstra          2022-05-20  12443  		/*
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12444  		 * Now that we're certain of the pmu; find the pmu_ctx.
3ac6487e584a1e kernel/events/core.c  Peter Zijlstra          2022-05-20  12445  		 */
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12446  		struct perf_event_pmu_context *pmu_ctx __free(put_pmu_ctx) =
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12447  			find_get_pmu_context(pmu, ctx, event);
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12448  		if (!pmu_ctx)
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12449  			return -ENOMEM;
f63a8daa5812af kernel/events/core.c  Peter Zijlstra          2015-01-23  12450  
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12451  		if (output_event) {
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12452  			err = perf_event_set_output(event, output_event);
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12453  			if (err)
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12454  				return err;
84c4e620d35f49 kernel/events/core.c  Peter Zijlstra          2016-02-24  12455  		}
84c4e620d35f49 kernel/events/core.c  Peter Zijlstra          2016-02-24  12456  
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12457  		if (!perf_event_validate_size(event))
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12458  			return -E2BIG;
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  12459  
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12460  		if (perf_need_aux_event(event) &&
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12461  		    !perf_get_aux_event(event, group_leader))
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12462  			return -EINVAL;
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  12463  
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  12464  		/*
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  12465  		 * Must be under the same ctx::mutex as perf_install_in_context(),
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  12466  		 * because we need to serialize with concurrent event creation.
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  12467  		 */
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12468  		if (!exclusive_event_installable(event, ctx))
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12469  			return -EBUSY;
f63a8daa5812af kernel/events/core.c  Peter Zijlstra          2015-01-23  12470  
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  12471  		WARN_ON_ONCE(ctx->parent_ctx);
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  12472  
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12473  		event_file = anon_inode_getfile("[perf_event]", &perf_fops,
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12474  						event, f_flags);
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12475  		if (IS_ERR(event_file))
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12476  			return PTR_ERR(event_file);
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12477  
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12478  		/*
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12479  		 * The event is now owned by event_file and will be cleaned up
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12480  		 * through perf_fops::release(). Similarly the fd will be linked
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12481  		 * to event_file and should not be put_unused_fd().
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12482  		 */
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12483  
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  12484  		/*
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  12485  		 * This is the point on no return; we cannot fail hereafter. This is
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  12486  		 * where we start modifying current state.
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  12487  		 */
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  12488  
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  12489  		if (move_group) {
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12490  			/*
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12491  			 * Moves the events from one pmu to another, hence we need
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12492  			 * to update the pmu_ctx, but through all this the ctx
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12493  			 * stays the same.
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12494  			 */
45a0e07abf4933 kernel/events/core.c  Peter Zijlstra          2016-01-26  12495  			perf_remove_from_context(group_leader, 0);
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12496  			put_pmu_ctx(group_leader->pmu_ctx);
0231bb53367584 kernel/events/core.c  Jiri Olsa               2013-02-01  12497  
edb39592a5877b kernel/events/core.c  Peter Zijlstra          2018-03-15  12498  			for_each_sibling_event(sibling, group_leader) {
45a0e07abf4933 kernel/events/core.c  Peter Zijlstra          2016-01-26  12499  				perf_remove_from_context(sibling, 0);
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  12500  				put_pmu_ctx(sibling->pmu_ctx);
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  12501  			}
9b51f66dcb09ac kernel/perf_counter.c Ingo Molnar             2008-12-12  12502  
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  12503) 			/*
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  12504) 			 * Install the group siblings before the group leader.
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  12505) 			 *
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  12506) 			 * Because a group leader will try and install the entire group
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  12507) 			 * (through the sibling list, which is still in-tact), we can
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  12508) 			 * end up with siblings installed in the wrong context.
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  12509) 			 *
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  12510) 			 * By installing siblings first we NO-OP because they're not
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  12511) 			 * reachable through the group lists.
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  12512) 			 */
edb39592a5877b kernel/events/core.c  Peter Zijlstra          2018-03-15  12513  			for_each_sibling_event(sibling, group_leader) {
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12514  				sibling->pmu_ctx = get_pmu_ctx(pmu_ctx);
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  12515) 				perf_event__state_init(sibling);
9fc81d87420d0d kernel/events/core.c  Jiri Olsa               2014-12-10  12516  				perf_install_in_context(ctx, sibling, sibling->cpu);
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  12517  			}
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  12518) 
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  12519) 			/*
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  12520) 			 * Removing from the context ends up with disabled
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  12521) 			 * event. What we want here is event in the initial
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  12522) 			 * startup state, ready to be add into new context.
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  12523) 			 */
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12524  			group_leader->pmu_ctx = get_pmu_ctx(pmu_ctx);
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  12525) 			perf_event__state_init(group_leader);
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  12526) 			perf_install_in_context(ctx, group_leader, group_leader->cpu);
bed5b25ad9c8a2 kernel/events/core.c  Alexander Shishkin      2015-01-30  12527  		}
bed5b25ad9c8a2 kernel/events/core.c  Alexander Shishkin      2015-01-30  12528  
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  12529  		/*
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  12530  		 * Precalculate sample_data sizes; do while holding ctx::mutex such
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  12531  		 * that we're serialized against further additions and before
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  12532  		 * perf_install_in_context() which is the point the event is active and
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  12533  		 * can use these values.
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  12534  		 */
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  12535  		perf_event__header_size(event);
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  12536  		perf_event__id_header_size(event);
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  12537  
78cd2c748f4597 kernel/events/core.c  Peter Zijlstra          2016-01-25  12538  		event->owner = current;
78cd2c748f4597 kernel/events/core.c  Peter Zijlstra          2016-01-25  12539  
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12540  		event->pmu_ctx = no_free_ptr(pmu_ctx);
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12541  		perf_install_in_context(get_ctx(ctx), event, event->cpu);
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12542  	} while (0);
9b51f66dcb09ac kernel/perf_counter.c Ingo Molnar             2008-12-12  12543  
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12544  	scoped_guard (mutex, &current->perf_event_mutex)
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  12545  		list_add_tail(&event->owner_entry, &current->perf_event_list);
082ff5a2767a06 kernel/perf_counter.c Peter Zijlstra          2009-05-23  12546  
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12547  	fd_install(fd, event_file);
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  12548  
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12549  	no_free_ptr(event);
d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12550  	return no_free_fd(fd);
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  12551  }
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  12552  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
