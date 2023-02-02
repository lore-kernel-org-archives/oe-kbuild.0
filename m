Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11CA8F54
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Feb 2023 18:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675361826; x=1706897826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jEetIJE+SbB0KH/umlgGrDRAH9P6DmavAIX2Hvfj/XI=;
  b=ibecJj8IZXBacLnM05xL2OrhMHHoENiRiyERRL5IhN79+wbCgNoXJdVe
   VrGf/NApoG6LeRZOvhwqi4GhK0sqJeuQDLSudNuLU6XvzCfYecsfXXDye
   yNMjYv0WELSA21tIaVtLMcn/IgwyfIaUekyPWIcaTcGmzGDGEkjDHyakw
   vF+Y+ePLimDrFaoC4e5RlVeq0nSkMTY9TXraLPFbOh2gr1ADRfCSiN5m1
   qwfq3TqlBXm1iPVQPyp0mYA7puMggYTtt/vQufGzi34kCgYB7EHv3pSJU
   Ho+9W7xGFuB9tDskptxTzsiLuz75mGdZIOmzJc8ca4CdqR95rHY8ktdAo
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="393114523"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="393114523"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 10:16:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="665400212"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="665400212"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 Feb 2023 10:16:42 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNe8X-0006iC-2S;
	Thu, 02 Feb 2023 18:16:41 +0000
Date: Fri, 3 Feb 2023 02:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android-4.19-stable 3/27] kernel/fork.c:2279
 copy_process() warn: passing zero to 'ERR_PTR'
Message-ID: <202302030255.sAwoA9uv-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   7b8eb82135b171c1f11d8b0ea6d2cc691021840d
commit: 9d8945c72acacecb685d1a0a104677d4bb2374ae [3/27] BACKPORT: copy_process(): don't use ksys_close() on cleanups
:::::: branch date: 27 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230203/202302030255.sAwoA9uv-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
kernel/fork.c:2279 copy_process() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +2279 kernel/fork.c

0f4814065ff8c2 Markus Metzger            2009-04-03  1970  
3c90e6e99b08f0 Srivatsa Vaddagiri        2007-11-09  1971  	/* Perform scheduler related setup. Assign this task to a CPU. */
aab03e05e8f7e2 Dario Faggioli            2013-11-28  1972  	retval = sched_fork(clone_flags, p);
aab03e05e8f7e2 Dario Faggioli            2013-11-28  1973  	if (retval)
aab03e05e8f7e2 Dario Faggioli            2013-11-28  1974  		goto bad_fork_cleanup_policy;
6ab423e0eaca82 Peter Zijlstra            2009-05-25  1975  
cdd6c482c9ff9c Ingo Molnar               2009-09-21  1976  	retval = perf_event_init_task(p);
6ab423e0eaca82 Peter Zijlstra            2009-05-25  1977  	if (retval)
6ab423e0eaca82 Peter Zijlstra            2009-05-25  1978  		goto bad_fork_cleanup_policy;
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  1979  	retval = audit_alloc(p);
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  1980  	if (retval)
6c72e3501d0d62 Peter Zijlstra            2014-10-02  1981  		goto bad_fork_cleanup_perf;
^1da177e4c3f41 Linus Torvalds            2005-04-16  1982  	/* copy all the process information */
ab602f79915939 Jack Miller               2014-08-08  1983  	shm_init_task(p);
e4e55b47ed9ae2 Tetsuo Handa              2017-03-24  1984  	retval = security_task_alloc(p, clone_flags);
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  1985  	if (retval)
^1da177e4c3f41 Linus Torvalds            2005-04-16  1986  		goto bad_fork_cleanup_audit;
e4e55b47ed9ae2 Tetsuo Handa              2017-03-24  1987  	retval = copy_semundo(clone_flags, p);
e4e55b47ed9ae2 Tetsuo Handa              2017-03-24  1988  	if (retval)
e4e55b47ed9ae2 Tetsuo Handa              2017-03-24  1989  		goto bad_fork_cleanup_security;
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  1990  	retval = copy_files(clone_flags, p);
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  1991  	if (retval)
^1da177e4c3f41 Linus Torvalds            2005-04-16  1992  		goto bad_fork_cleanup_semundo;
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  1993  	retval = copy_fs(clone_flags, p);
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  1994  	if (retval)
^1da177e4c3f41 Linus Torvalds            2005-04-16  1995  		goto bad_fork_cleanup_files;
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  1996  	retval = copy_sighand(clone_flags, p);
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  1997  	if (retval)
^1da177e4c3f41 Linus Torvalds            2005-04-16  1998  		goto bad_fork_cleanup_fs;
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  1999  	retval = copy_signal(clone_flags, p);
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2000  	if (retval)
^1da177e4c3f41 Linus Torvalds            2005-04-16  2001  		goto bad_fork_cleanup_sighand;
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2002  	retval = copy_mm(clone_flags, p);
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2003  	if (retval)
^1da177e4c3f41 Linus Torvalds            2005-04-16  2004  		goto bad_fork_cleanup_signal;
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2005  	retval = copy_namespaces(clone_flags, p);
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2006  	if (retval)
d84f4f992cbd76 David Howells             2008-11-14  2007  		goto bad_fork_cleanup_mm;
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2008  	retval = copy_io(clone_flags, p);
fb0a685cb95a02 Daniel Rebelo de Oliveira 2011-07-26  2009  	if (retval)
fd0928df98b957 Jens Axboe                2008-01-24  2010  		goto bad_fork_cleanup_namespaces;
3033f14ab78c32 Josh Triplett             2015-06-25  2011  	retval = copy_thread_tls(clone_flags, stack_start, stack_size, p, tls);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2012  	if (retval)
fd0928df98b957 Jens Axboe                2008-01-24  2013  		goto bad_fork_cleanup_io;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2014  
425fb2b4bf5dde Pavel Emelyanov           2007-10-18  2015  	if (pid != &init_struct_pid) {
c2b1df2eb42978 Andy Lutomirski           2013-08-22  2016  		pid = alloc_pid(p->nsproxy->pid_ns_for_children);
35f71bc0a09a45 Michal Hocko              2015-04-16  2017  		if (IS_ERR(pid)) {
35f71bc0a09a45 Michal Hocko              2015-04-16  2018  			retval = PTR_ERR(pid);
0740aa5f637568 Jiri Slaby                2016-05-20  2019  			goto bad_fork_cleanup_thread;
425fb2b4bf5dde Pavel Emelyanov           2007-10-18  2020  		}
35f71bc0a09a45 Michal Hocko              2015-04-16  2021  	}
425fb2b4bf5dde Pavel Emelyanov           2007-10-18  2022  
66faab946ab578 Christian Brauner         2019-03-27  2023  	/*
66faab946ab578 Christian Brauner         2019-03-27  2024  	 * This has to happen after we've potentially unshared the file
66faab946ab578 Christian Brauner         2019-03-27  2025  	 * descriptor table (so that the pidfd doesn't leak into the child
66faab946ab578 Christian Brauner         2019-03-27  2026  	 * if the fd table isn't shared).
66faab946ab578 Christian Brauner         2019-03-27  2027  	 */
66faab946ab578 Christian Brauner         2019-03-27  2028  	if (clone_flags & CLONE_PIDFD) {
9d8945c72acace Al Viro                   2019-06-26  2029  		retval = get_unused_fd_flags(O_RDWR | O_CLOEXEC);
66faab946ab578 Christian Brauner         2019-03-27  2030  		if (retval < 0)
66faab946ab578 Christian Brauner         2019-03-27  2031  			goto bad_fork_free_pid;
66faab946ab578 Christian Brauner         2019-03-27  2032  
66faab946ab578 Christian Brauner         2019-03-27  2033  		pidfd = retval;
9d8945c72acace Al Viro                   2019-06-26  2034  
9d8945c72acace Al Viro                   2019-06-26  2035  		pidfile = anon_inode_getfile("[pidfd]", &pidfd_fops, pid,
9d8945c72acace Al Viro                   2019-06-26  2036  					      O_RDWR | O_CLOEXEC);
9d8945c72acace Al Viro                   2019-06-26  2037  		if (IS_ERR(pidfile)) {
9d8945c72acace Al Viro                   2019-06-26  2038  			put_unused_fd(pidfd);
9d8945c72acace Al Viro                   2019-06-26  2039  			goto bad_fork_free_pid;
9d8945c72acace Al Viro                   2019-06-26  2040  		}
9d8945c72acace Al Viro                   2019-06-26  2041  		get_pid(pid);	/* held by pidfile now */
9d8945c72acace Al Viro                   2019-06-26  2042  
66faab946ab578 Christian Brauner         2019-03-27  2043  		retval = put_user(pidfd, parent_tidptr);
66faab946ab578 Christian Brauner         2019-03-27  2044  		if (retval)
66faab946ab578 Christian Brauner         2019-03-27  2045  			goto bad_fork_put_pidfd;
66faab946ab578 Christian Brauner         2019-03-27  2046  	}
66faab946ab578 Christian Brauner         2019-03-27  2047  
73c101011926c5 Jens Axboe                2011-03-08  2048  #ifdef CONFIG_BLOCK
73c101011926c5 Jens Axboe                2011-03-08  2049  	p->plug = NULL;
73c101011926c5 Jens Axboe                2011-03-08  2050  #endif
3fe0ed7bd7329e Thomas Gleixner           2019-11-06  2051  	futex_init_task(p);
3fe0ed7bd7329e Thomas Gleixner           2019-11-06  2052  
f9a3879abf2f1a GOTO Masanori             2006-03-13  2053  	/*
f9a3879abf2f1a GOTO Masanori             2006-03-13  2054  	 * sigaltstack should be cleared when sharing the same VM
f9a3879abf2f1a GOTO Masanori             2006-03-13  2055  	 */
f9a3879abf2f1a GOTO Masanori             2006-03-13  2056  	if ((clone_flags & (CLONE_VM|CLONE_VFORK)) == CLONE_VM)
2a74213838104a Stas Sergeev              2016-04-14  2057  		sas_ss_reset(p);
f9a3879abf2f1a GOTO Masanori             2006-03-13  2058  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2059  	/*
6580807da14c42 Oleg Nesterov             2009-12-15  2060  	 * Syscall tracing and stepping should be turned off in the
6580807da14c42 Oleg Nesterov             2009-12-15  2061  	 * child regardless of CLONE_PTRACE.
^1da177e4c3f41 Linus Torvalds            2005-04-16  2062  	 */
6580807da14c42 Oleg Nesterov             2009-12-15  2063  	user_disable_single_step(p);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2064  	clear_tsk_thread_flag(p, TIF_SYSCALL_TRACE);
ed75e8d58010fd Laurent Vivier            2005-09-03  2065  #ifdef TIF_SYSCALL_EMU
ed75e8d58010fd Laurent Vivier            2005-09-03  2066  	clear_tsk_thread_flag(p, TIF_SYSCALL_EMU);
ed75e8d58010fd Laurent Vivier            2005-09-03  2067  #endif
9745512ce79de6 Arjan van de Ven          2008-01-25  2068  	clear_all_latency_tracing(p);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2069  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2070  	/* ok, now we should be set up.. */
18c830df771f2b Oleg Nesterov             2013-07-03  2071  	p->pid = pid_nr(pid);
18c830df771f2b Oleg Nesterov             2013-07-03  2072  	if (clone_flags & CLONE_THREAD) {
18c830df771f2b Oleg Nesterov             2013-07-03  2073  		p->group_leader = current->group_leader;
18c830df771f2b Oleg Nesterov             2013-07-03  2074  		p->tgid = current->tgid;
18c830df771f2b Oleg Nesterov             2013-07-03  2075  	} else {
18c830df771f2b Oleg Nesterov             2013-07-03  2076  		p->group_leader = p;
18c830df771f2b Oleg Nesterov             2013-07-03  2077  		p->tgid = p->pid;
18c830df771f2b Oleg Nesterov             2013-07-03  2078  	}
5f8aadd8b9966d Oleg Nesterov             2012-03-14  2079  
9d823e8f6b1b7b Wu Fengguang              2011-06-11  2080  	p->nr_dirtied = 0;
9d823e8f6b1b7b Wu Fengguang              2011-06-11  2081  	p->nr_dirtied_pause = 128 >> (PAGE_SHIFT - 10);
83712358ba0a14 Wu Fengguang              2011-06-11  2082  	p->dirty_paused_when = 0;
9d823e8f6b1b7b Wu Fengguang              2011-06-11  2083  
bb8cbbfee68518 Oleg Nesterov             2013-11-13  2084  	p->pdeath_signal = 0;
47e65328a7b1cd Oleg Nesterov             2006-03-28  2085  	INIT_LIST_HEAD(&p->thread_group);
158e1645e07f3e Al Viro                   2012-06-27  2086  	p->task_works = NULL;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2087  
780de9dd2720de Ingo Molnar               2017-02-02  2088  	cgroup_threadgroup_change_begin(current);
7e47682ea555e7 Aleksa Sarai              2015-06-09  2089  	/*
7e47682ea555e7 Aleksa Sarai              2015-06-09  2090  	 * Ensure that the cgroup subsystem policies allow the new process to be
7e47682ea555e7 Aleksa Sarai              2015-06-09  2091  	 * forked. It should be noted the the new process's css_set can be changed
7e47682ea555e7 Aleksa Sarai              2015-06-09  2092  	 * between here and cgroup_post_fork() if an organisation operation is in
7e47682ea555e7 Aleksa Sarai              2015-06-09  2093  	 * progress.
7e47682ea555e7 Aleksa Sarai              2015-06-09  2094  	 */
b53202e6308939 Oleg Nesterov             2015-12-03  2095  	retval = cgroup_can_fork(p);
7e47682ea555e7 Aleksa Sarai              2015-06-09  2096  	if (retval)
5013eebdf49374 Christian Brauner         2019-05-10  2097  		goto bad_fork_cgroup_threadgroup_change_end;
7e47682ea555e7 Aleksa Sarai              2015-06-09  2098  
bc999b5099d700 David Herrmann            2019-01-08  2099  	/*
bc999b5099d700 David Herrmann            2019-01-08  2100  	 * From this point on we must avoid any synchronous user-space
bc999b5099d700 David Herrmann            2019-01-08  2101  	 * communication until we take the tasklist-lock. In particular, we do
bc999b5099d700 David Herrmann            2019-01-08  2102  	 * not want user-space to be able to predict the process start-time by
bc999b5099d700 David Herrmann            2019-01-08  2103  	 * stalling fork(2) after we recorded the start_time but before it is
bc999b5099d700 David Herrmann            2019-01-08  2104  	 * visible to the system.
bc999b5099d700 David Herrmann            2019-01-08  2105  	 */
bc999b5099d700 David Herrmann            2019-01-08  2106  
bc999b5099d700 David Herrmann            2019-01-08  2107  	p->start_time = ktime_get_ns();
bc999b5099d700 David Herrmann            2019-01-08  2108  	p->real_start_time = ktime_get_boot_ns();
bc999b5099d700 David Herrmann            2019-01-08  2109  
18c830df771f2b Oleg Nesterov             2013-07-03  2110  	/*
18c830df771f2b Oleg Nesterov             2013-07-03  2111  	 * Make it visible to the rest of the system, but dont wake it up yet.
18c830df771f2b Oleg Nesterov             2013-07-03  2112  	 * Need tasklist lock for parent etc handling!
18c830df771f2b Oleg Nesterov             2013-07-03  2113  	 */
^1da177e4c3f41 Linus Torvalds            2005-04-16  2114  	write_lock_irq(&tasklist_lock);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2115  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2116  	/* CLONE_PARENT re-uses the old parent */
2d5516cbb9daf7 Oleg Nesterov             2009-03-02  2117  	if (clone_flags & (CLONE_PARENT|CLONE_THREAD)) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2118  		p->real_parent = current->real_parent;
2d5516cbb9daf7 Oleg Nesterov             2009-03-02  2119  		p->parent_exec_id = current->parent_exec_id;
b177d2d915cea2 Eddy Wu                   2020-11-07  2120  		if (clone_flags & CLONE_THREAD)
b177d2d915cea2 Eddy Wu                   2020-11-07  2121  			p->exit_signal = -1;
b177d2d915cea2 Eddy Wu                   2020-11-07  2122  		else
b177d2d915cea2 Eddy Wu                   2020-11-07  2123  			p->exit_signal = current->group_leader->exit_signal;
2d5516cbb9daf7 Oleg Nesterov             2009-03-02  2124  	} else {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2125  		p->real_parent = current;
2d5516cbb9daf7 Oleg Nesterov             2009-03-02  2126  		p->parent_exec_id = current->self_exec_id;
b177d2d915cea2 Eddy Wu                   2020-11-07  2127  		p->exit_signal = (clone_flags & CSIGNAL);
2d5516cbb9daf7 Oleg Nesterov             2009-03-02  2128  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2129  
d83a7cb375eec2 Josh Poimboeuf            2017-02-13  2130  	klp_copy_process(p);
d83a7cb375eec2 Josh Poimboeuf            2017-02-13  2131  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2132  	spin_lock(&current->sighand->siglock);
4a2c7a7837da1b Oleg Nesterov             2006-03-28  2133  
dbd952127d11bb Kees Cook                 2014-06-27  2134  	/*
dbd952127d11bb Kees Cook                 2014-06-27  2135  	 * Copy seccomp details explicitly here, in case they were changed
dbd952127d11bb Kees Cook                 2014-06-27  2136  	 * before holding sighand lock.
dbd952127d11bb Kees Cook                 2014-06-27  2137  	 */
dbd952127d11bb Kees Cook                 2014-06-27  2138  	copy_seccomp(p);
dbd952127d11bb Kees Cook                 2014-06-27  2139  
d7822b1e24f2df Mathieu Desnoyers         2018-06-02  2140  	rseq_fork(p, clone_flags);
d7822b1e24f2df Mathieu Desnoyers         2018-06-02  2141  
4ca1d3ee46130e Eric W. Biederman         2018-07-13  2142  	/* Don't start children in a dying pid namespace */
e8cfbc245e2488 Gargi Sharma              2017-11-17  2143  	if (unlikely(!(ns_of_pid(pid)->pid_allocated & PIDNS_ADDING))) {
3fd37226216620 Kirill Tkhai              2017-05-12  2144  		retval = -ENOMEM;
3fd37226216620 Kirill Tkhai              2017-05-12  2145  		goto bad_fork_cancel_cgroup;
3fd37226216620 Kirill Tkhai              2017-05-12  2146  	}
4a2c7a7837da1b Oleg Nesterov             2006-03-28  2147  
7673bf553b2732 Eric W. Biederman         2018-07-23  2148  	/* Let kill terminate clone/fork in the middle */
7673bf553b2732 Eric W. Biederman         2018-07-23  2149  	if (fatal_signal_pending(current)) {
7673bf553b2732 Eric W. Biederman         2018-07-23  2150  		retval = -EINTR;
7673bf553b2732 Eric W. Biederman         2018-07-23  2151  		goto bad_fork_cancel_cgroup;
7673bf553b2732 Eric W. Biederman         2018-07-23  2152  	}
7673bf553b2732 Eric W. Biederman         2018-07-23  2153  
9d8945c72acace Al Viro                   2019-06-26  2154  	/* past the last point of failure */
9d8945c72acace Al Viro                   2019-06-26  2155  	if (pidfile)
9d8945c72acace Al Viro                   2019-06-26  2156  		fd_install(pidfd, pidfile);
4a2c7a7837da1b Oleg Nesterov             2006-03-28  2157  
2c4704756cab7c Eric W. Biederman         2017-09-26  2158  	init_task_pid_links(p);
73b9ebfe126a4a Oleg Nesterov             2006-03-28  2159  	if (likely(p->pid)) {
4b9d33e6d83cc0 Tejun Heo                 2011-06-17  2160  		ptrace_init_task(p, (clone_flags & CLONE_PTRACE) || trace);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2161  
8190773985141f Oleg Nesterov             2013-07-03  2162  		init_task_pid(p, PIDTYPE_PID, pid);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2163  		if (thread_group_leader(p)) {
6883f81aac6f44 Eric W. Biederman         2017-06-04  2164  			init_task_pid(p, PIDTYPE_TGID, pid);
8190773985141f Oleg Nesterov             2013-07-03  2165  			init_task_pid(p, PIDTYPE_PGID, task_pgrp(current));
8190773985141f Oleg Nesterov             2013-07-03  2166  			init_task_pid(p, PIDTYPE_SID, task_session(current));
8190773985141f Oleg Nesterov             2013-07-03  2167  
1c4042c29bd2e8 Eric W. Biederman         2010-07-12  2168  			if (is_child_reaper(pid)) {
17cf22c33e1f1b Eric W. Biederman         2010-03-02  2169  				ns_of_pid(pid)->child_reaper = p;
1c4042c29bd2e8 Eric W. Biederman         2010-07-12  2170  				p->signal->flags |= SIGNAL_UNKILLABLE;
1c4042c29bd2e8 Eric W. Biederman         2010-07-12  2171  			}
c3ad2c3b02e953 Eric W. Biederman         2018-07-23  2172  			p->signal->shared_pending.signal = delayed.signal;
9c9f4ded90a59e Alan Cox                  2008-10-13  2173  			p->signal->tty = tty_kref_get(current->signal->tty);
749860ce242798 Pavel Tikhomirov          2017-01-30  2174  			/*
749860ce242798 Pavel Tikhomirov          2017-01-30  2175  			 * Inherit has_child_subreaper flag under the same
749860ce242798 Pavel Tikhomirov          2017-01-30  2176  			 * tasklist_lock with adding child to the process tree
749860ce242798 Pavel Tikhomirov          2017-01-30  2177  			 * for propagate_has_child_subreaper optimization.
749860ce242798 Pavel Tikhomirov          2017-01-30  2178  			 */
749860ce242798 Pavel Tikhomirov          2017-01-30  2179  			p->signal->has_child_subreaper = p->real_parent->signal->has_child_subreaper ||
749860ce242798 Pavel Tikhomirov          2017-01-30  2180  							 p->real_parent->signal->is_child_subreaper;
9cd80bbb07fcd6 Oleg Nesterov             2009-12-17  2181  			list_add_tail(&p->sibling, &p->real_parent->children);
5e85d4abe3f43b Eric W. Biederman         2006-04-18  2182  			list_add_tail_rcu(&p->tasks, &init_task.tasks);
6883f81aac6f44 Eric W. Biederman         2017-06-04  2183  			attach_pid(p, PIDTYPE_TGID);
8190773985141f Oleg Nesterov             2013-07-03  2184  			attach_pid(p, PIDTYPE_PGID);
8190773985141f Oleg Nesterov             2013-07-03  2185  			attach_pid(p, PIDTYPE_SID);
909ea96468096b Christoph Lameter         2010-12-08  2186  			__this_cpu_inc(process_counts);
80628ca06c5d42 Oleg Nesterov             2013-07-03  2187  		} else {
80628ca06c5d42 Oleg Nesterov             2013-07-03  2188  			current->signal->nr_threads++;
80628ca06c5d42 Oleg Nesterov             2013-07-03  2189  			atomic_inc(&current->signal->live);
80628ca06c5d42 Oleg Nesterov             2013-07-03  2190  			atomic_inc(&current->signal->sigcnt);
924de3b8c9410c Eric W. Biederman         2018-07-23  2191  			task_join_group_stop(p);
80628ca06c5d42 Oleg Nesterov             2013-07-03  2192  			list_add_tail_rcu(&p->thread_group,
80628ca06c5d42 Oleg Nesterov             2013-07-03  2193  					  &p->group_leader->thread_group);
0c740d0afc3bff Oleg Nesterov             2014-01-21  2194  			list_add_tail_rcu(&p->thread_node,
0c740d0afc3bff Oleg Nesterov             2014-01-21  2195  					  &p->signal->thread_head);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2196  		}
8190773985141f Oleg Nesterov             2013-07-03  2197  		attach_pid(p, PIDTYPE_PID);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2198  		nr_threads++;
73b9ebfe126a4a Oleg Nesterov             2006-03-28  2199  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2200  	total_forks++;
c3ad2c3b02e953 Eric W. Biederman         2018-07-23  2201  	hlist_del_init(&delayed.node);
3f17da699431ec Oleg Nesterov             2006-02-15  2202  	spin_unlock(&current->sighand->siglock);
4af4206be2bd19 Oleg Nesterov             2014-04-13  2203  	syscall_tracepoint_update(p);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2204  	write_unlock_irq(&tasklist_lock);
4af4206be2bd19 Oleg Nesterov             2014-04-13  2205  
c13cf856cbe16a Andrew Morton             2005-11-28  2206  	proc_fork_connector(p);
b53202e6308939 Oleg Nesterov             2015-12-03  2207  	cgroup_post_fork(p);
780de9dd2720de Ingo Molnar               2017-02-02  2208  	cgroup_threadgroup_change_end(current);
cdd6c482c9ff9c Ingo Molnar               2009-09-21  2209  	perf_event_fork(p);
43d2b113241d67 KAMEZAWA Hiroyuki         2012-01-10  2210  
43d2b113241d67 KAMEZAWA Hiroyuki         2012-01-10  2211  	trace_task_newtask(p, clone_flags);
3ab679661721b1 Oleg Nesterov             2013-10-16  2212  	uprobe_copy_process(p, clone_flags);
43d2b113241d67 KAMEZAWA Hiroyuki         2012-01-10  2213  
a3d0ceee716047 Suren Baghdasaryan        2020-10-13  2214  	copy_oom_score_adj(clone_flags, p);
a3d0ceee716047 Suren Baghdasaryan        2020-10-13  2215  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2216  	return p;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2217  
7e47682ea555e7 Aleksa Sarai              2015-06-09  2218  bad_fork_cancel_cgroup:
3fd37226216620 Kirill Tkhai              2017-05-12  2219  	spin_unlock(&current->sighand->siglock);
3fd37226216620 Kirill Tkhai              2017-05-12  2220  	write_unlock_irq(&tasklist_lock);
b53202e6308939 Oleg Nesterov             2015-12-03  2221  	cgroup_cancel_fork(p);
5013eebdf49374 Christian Brauner         2019-05-10  2222  bad_fork_cgroup_threadgroup_change_end:
5013eebdf49374 Christian Brauner         2019-05-10  2223  	cgroup_threadgroup_change_end(current);
66faab946ab578 Christian Brauner         2019-03-27  2224  bad_fork_put_pidfd:
9d8945c72acace Al Viro                   2019-06-26  2225  	if (clone_flags & CLONE_PIDFD) {
9d8945c72acace Al Viro                   2019-06-26  2226  		fput(pidfile);
9d8945c72acace Al Viro                   2019-06-26  2227  		put_unused_fd(pidfd);
9d8945c72acace Al Viro                   2019-06-26  2228  	}
425fb2b4bf5dde Pavel Emelyanov           2007-10-18  2229  bad_fork_free_pid:
425fb2b4bf5dde Pavel Emelyanov           2007-10-18  2230  	if (pid != &init_struct_pid)
425fb2b4bf5dde Pavel Emelyanov           2007-10-18  2231  		free_pid(pid);
0740aa5f637568 Jiri Slaby                2016-05-20  2232  bad_fork_cleanup_thread:
0740aa5f637568 Jiri Slaby                2016-05-20  2233  	exit_thread(p);
fd0928df98b957 Jens Axboe                2008-01-24  2234  bad_fork_cleanup_io:
b69f2292063d2c Louis Rilling             2009-12-04  2235  	if (p->io_context)
b69f2292063d2c Louis Rilling             2009-12-04  2236  		exit_io_context(p);
ab516013ad9ca4 Serge E. Hallyn           2006-10-02  2237  bad_fork_cleanup_namespaces:
444f378b237a0f Linus Torvalds            2007-01-30  2238  	exit_task_namespaces(p);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2239  bad_fork_cleanup_mm:
8bae43985571a2 Andrea Arcangeli          2019-05-14  2240  	if (p->mm) {
8bae43985571a2 Andrea Arcangeli          2019-05-14  2241  		mm_clear_owner(p->mm, p);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2242  		mmput(p->mm);
8bae43985571a2 Andrea Arcangeli          2019-05-14  2243  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2244  bad_fork_cleanup_signal:
4ab6c08336535f Oleg Nesterov             2009-08-26  2245  	if (!(clone_flags & CLONE_THREAD))
1c5354de90c900 Mike Galbraith            2011-01-05  2246  		free_signal_struct(p->signal);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2247  bad_fork_cleanup_sighand:
a7e5328a06a2be Oleg Nesterov             2006-03-28  2248  	__cleanup_sighand(p->sighand);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2249  bad_fork_cleanup_fs:
^1da177e4c3f41 Linus Torvalds            2005-04-16  2250  	exit_fs(p); /* blocking */
^1da177e4c3f41 Linus Torvalds            2005-04-16  2251  bad_fork_cleanup_files:
^1da177e4c3f41 Linus Torvalds            2005-04-16  2252  	exit_files(p); /* blocking */
^1da177e4c3f41 Linus Torvalds            2005-04-16  2253  bad_fork_cleanup_semundo:
^1da177e4c3f41 Linus Torvalds            2005-04-16  2254  	exit_sem(p);
e4e55b47ed9ae2 Tetsuo Handa              2017-03-24  2255  bad_fork_cleanup_security:
e4e55b47ed9ae2 Tetsuo Handa              2017-03-24  2256  	security_task_free(p);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2257  bad_fork_cleanup_audit:
^1da177e4c3f41 Linus Torvalds            2005-04-16  2258  	audit_free(p);
6c72e3501d0d62 Peter Zijlstra            2014-10-02  2259  bad_fork_cleanup_perf:
cdd6c482c9ff9c Ingo Molnar               2009-09-21  2260  	perf_event_free_task(p);
6c72e3501d0d62 Peter Zijlstra            2014-10-02  2261  bad_fork_cleanup_policy:
b09be676e0ff25 Byungchul Park            2017-08-07  2262  	lockdep_free_task(p);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2263  #ifdef CONFIG_NUMA
f0be3d32b05d3f Lee Schermerhorn          2008-04-28  2264  	mpol_put(p->mempolicy);
e8604cb43690b7 Li Zefan                  2014-03-28  2265  bad_fork_cleanup_threadgroup_lock:
^1da177e4c3f41 Linus Torvalds            2005-04-16  2266  #endif
35df17c57cecb0 Shailabh Nagar            2006-08-31  2267  	delayacct_tsk_free(p);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2268  bad_fork_cleanup_count:
d84f4f992cbd76 David Howells             2008-11-14  2269  	atomic_dec(&p->cred->user->processes);
e0e817392b9acf David Howells             2009-09-02  2270  	exit_creds(p);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2271  bad_fork_free:
405c0759712f57 Andy Lutomirski           2016-10-31  2272  	p->state = TASK_DEAD;
68f24b08ee892d Andy Lutomirski           2016-09-15  2273  	put_task_stack(p);
8bae43985571a2 Andrea Arcangeli          2019-05-14  2274  	delayed_free_task(p);
fe7d37d1fbf8ff Oleg Nesterov             2006-01-08  2275  fork_out:
c3ad2c3b02e953 Eric W. Biederman         2018-07-23  2276  	spin_lock_irq(&current->sighand->siglock);
c3ad2c3b02e953 Eric W. Biederman         2018-07-23  2277  	hlist_del_init(&delayed.node);
c3ad2c3b02e953 Eric W. Biederman         2018-07-23  2278  	spin_unlock_irq(&current->sighand->siglock);
fe7d37d1fbf8ff Oleg Nesterov             2006-01-08 @2279  	return ERR_PTR(retval);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2280  }
^1da177e4c3f41 Linus Torvalds            2005-04-16  2281  

:::::: The code at line 2279 was first introduced by commit
:::::: fe7d37d1fbf8ffe78abd72728b24fb0c64f7af55 [PATCH] copy_process: error path cleanup

:::::: TO: Oleg Nesterov <oleg@tv-sign.ru>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
