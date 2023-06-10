Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5B48831
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jun 2023 08:34:49 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-30af86a966eso1747838f8f.2
        for <oe-kbuild@lists.linux.dev>; Sat, 10 Jun 2023 01:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686386087; x=1688978087;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vgzm38bgwKaccYd2pH61GfS8xL4I9stV0ahygvJLoi0=;
        b=PvuffLD+CavYrWTC5MxpSoF/OfIwe2jyDFr5JikDtvRUOArRdrUyHmr7JYobj7wWcs
         OR1VORUaJXCL+GxHwE6zQzTh5Lv+MsHNwY2uxR+HfJeyogIzNczRSS5s9ldUxAdmF4Kr
         Ehvwvji1LgBAO+ec3lsK/MbpSas8y/jtIzNTcztDYcq001F6JfZwQbW7GCNORCRRot/Y
         kzhNrOCbQ2AZe9bMz5vp0kVyJlrJjxgs8VjNSr3SEp9Ut1GxjrkiNvlrhfT+eucgb4jo
         UEzBr+Lo6autcb2jfFhdhgK3PcngAmaszJhcxdb+pQCXtzLfVeXAnCaX1BhKGW0BbVM3
         NGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686386087; x=1688978087;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vgzm38bgwKaccYd2pH61GfS8xL4I9stV0ahygvJLoi0=;
        b=WHe/adLqM30k7JpwXJ328H6MEFNwFYd75Yj2ctyHs1ZjGZl38VW3nE+grnNZRNfa5z
         2zDzIb6RFco6VkhbuoYTCa1ufocr25B00RMJkaiAc9mDYSqSjpsVtkhmb181wLWhYjIP
         qBnZVWO2alW26CZL++uwaKjxRrVblfdnulEb7i6G3llsLFsqNrcEtTwmxy9yl1HVkArj
         mHrrAat9VQh9hqmfgRNJ0DIl1HzRL/5c09alottHGxd6VnU9gLdWSKVmRt3l6Y2MC9HF
         8ARJiURY96bN6JgbFK1jpzBVg9ekArtq2DD11+o+JV120fEmv4hZ+DoHOCamG3DV/ZQ3
         RzmA==
X-Gm-Message-State: AC+VfDxjNqz0Fyo1n1rh49VZYt4mC6AxGUaqubDcj5WdhkkTsLUjXIIT
	+oKsx6EttfXG4GTPGgEx2sUrHP42zqkzqW0J8BA=
X-Google-Smtp-Source: ACHHUZ7LksgFm0lTtdzKVGz6lTFYyAOFF/56fuWpUxneIouaVRcPcqSDgP19JVl9UY06KCF8hpyoBA==
X-Received: by 2002:adf:f1c3:0:b0:30a:d7a7:3db4 with SMTP id z3-20020adff1c3000000b0030ad7a73db4mr290962wro.12.1686386086483;
        Sat, 10 Jun 2023 01:34:46 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e10-20020a056000194a00b0030497b3224bsm6496380wry.64.2023.06.10.01.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 01:34:44 -0700 (PDT)
Date: Sat, 10 Jun 2023 11:34:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:core/guards 51/58] kernel/events/core.c:12288
 __do_sys_perf_event_open() warn: 'task' is an error pointer or valid
Message-ID: <7e99e673-715a-4949-acdb-607ea28a2175@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards
head:   dd132e83d180b932488bcf612576529e6163a1ea
commit: d5731952629b9736380a608a894b2fcc8593ddb8 [51/58] perf: Simplify sys_perf_event_open()
config: arm64-randconfig-m031-20230608 (https://download.01.org/0day-ci/archive/20230610/202306101640.qZLhyHcE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202306101640.qZLhyHcE-lkp@intel.com/

smatch warnings:
kernel/events/core.c:12288 __do_sys_perf_event_open() warn: 'task' is an error pointer or valid
kernel/events/core.c:12328 __do_sys_perf_event_open() error: 'task' dereferencing possible ERR_PTR()

vim +/task +12288 kernel/events/core.c

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

This should be:

	 if (IS_ERR(task))
		return PTR_ERR(task);

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

