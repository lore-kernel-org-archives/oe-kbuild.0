Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0534500964
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 07:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768633608; cv=none; b=rl9HKH8Y6HUk0yu5vqSiHGCPaQDPCbaCB6TRdxiQn+6luc4HbwT1CzesAf+YfEgiyMvdlHzR6VjMK3nASHjHEBlcc3ouOaS+oRda+FgcOGgnfodzjSq/u+NKf8z7k9DlyCxiK5VOniqzjhSzCFjL3cvgmghDX34ApmW3LNH3An8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768633608; c=relaxed/simple;
	bh=24cg+CTPwbb/5hlJ2w2KiHdrhGzeEiucvATocTSZ4fA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BbLvGpEeq6WoGGKuT3I8uR+IUriDpGIIPIyEdRJYZ5Doj4DxVQBI1xO/7Hvq7QgUrLVVA33U/iWKm/ppG+j5aR9u9IzJ0Zmthtz2WRPixb7tmfe37oH9uN6PjvnZvdKImkb57NpiueujvjFBEtIMtkrNcJdulXx3DjcIo8Eemq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQHLHQLN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQHLHQLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768633605; x=1800169605;
  h=date:from:to:cc:subject:message-id;
  bh=24cg+CTPwbb/5hlJ2w2KiHdrhGzeEiucvATocTSZ4fA=;
  b=OQHLHQLN6IQCm/78a1bjeej2jtanDn4qROEOyG1yKrLKg4hy52DHXG/I
   gCBuT7ozgPR8FNkRdIYw3ZCevDW0m7hOtN1mAqyQkj58Hr0QsU1hRR1Xr
   1KfPH8FXtdt/VBwZAX46PROEEeE0wDrw0L8vTXiDmSxOo71N0A6sbvbYE
   AAaQHVOR7B02agResR5cRotYYzFTJAh5IqmXQ9mL8t2jFAtyex4i/VXg3
   FGF9bECSbfZ//o9igSjulc/cWje2yQ1C1dR2l0AV5wxhItgeiuSg2ojQu
   cjqkAx0TGdhNRTtPJg21WmrGoZhm4rdFBhudhLR7oKcysQ6RtrG0pumxG
   A==;
X-CSE-ConnectionGUID: +EGcKmoZTXKPuItkIgH5FA==
X-CSE-MsgGUID: N85IHajLTPGGadIbz0CJfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69851575"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="69851575"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 23:06:45 -0800
X-CSE-ConnectionGUID: giTPt2ILTuiYi0WIfHTV1g==
X-CSE-MsgGUID: d7bhLXELTN6FgITT43Vung==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="204581455"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Jan 2026 23:06:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh0OP-00000000Le0-11OU;
	Sat, 17 Jan 2026 07:06:41 +0000
Date: Sat, 17 Jan 2026 15:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:io_uring-bpf-restrictions 17/18] kernel/fork.c:2547
 copy_process() warn: passing zero to 'ERR_PTR'
Message-ID: <202601171436.W3HbS3Ad-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-bpf-restrictions
head:   d3474bae5b568f9ee17d7000470d138b54d89c79
commit: 10e1438dd6387cc24f8d83728146352b2e34348f [17/18] io_uring: add task fork hook
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: alpha-randconfig-r072-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171436.W3HbS3Ad-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601171436.W3HbS3Ad-lkp@intel.com/

smatch warnings:
kernel/fork.c:2547 copy_process() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +2547 kernel/fork.c

d741bf41d7c7db Peter Zijlstra             2020-08-29  2317  
7e47682ea555e7 Aleksa Sarai               2015-06-09  2318  	/*
7e47682ea555e7 Aleksa Sarai               2015-06-09  2319  	 * Ensure that the cgroup subsystem policies allow the new process to be
7b7b8a2c9560ef Randy Dunlap               2020-10-15  2320  	 * forked. It should be noted that the new process's css_set can be changed
7e47682ea555e7 Aleksa Sarai               2015-06-09  2321  	 * between here and cgroup_post_fork() if an organisation operation is in
7e47682ea555e7 Aleksa Sarai               2015-06-09  2322  	 * progress.
7e47682ea555e7 Aleksa Sarai               2015-06-09  2323  	 */
ef2c41cf38a755 Christian Brauner          2020-02-05  2324  	retval = cgroup_can_fork(p, args);
7e47682ea555e7 Aleksa Sarai               2015-06-09  2325  	if (retval)
5a5cf5cb30d781 Christian Brauner          2020-02-05  2326  		goto bad_fork_put_pidfd;
7e47682ea555e7 Aleksa Sarai               2015-06-09  2327  
b1e8206582f9d6 Peter Zijlstra             2022-02-14  2328  	/*
b1e8206582f9d6 Peter Zijlstra             2022-02-14  2329  	 * Now that the cgroups are pinned, re-clone the parent cgroup and put
b1e8206582f9d6 Peter Zijlstra             2022-02-14  2330  	 * the new task on the correct runqueue. All this *before* the task
b1e8206582f9d6 Peter Zijlstra             2022-02-14  2331  	 * becomes visible.
b1e8206582f9d6 Peter Zijlstra             2022-02-14  2332  	 *
b1e8206582f9d6 Peter Zijlstra             2022-02-14  2333  	 * This isn't part of ->can_fork() because while the re-cloning is
b1e8206582f9d6 Peter Zijlstra             2022-02-14  2334  	 * cgroup specific, it unconditionally needs to place the task on a
b1e8206582f9d6 Peter Zijlstra             2022-02-14  2335  	 * runqueue.
b1e8206582f9d6 Peter Zijlstra             2022-02-14  2336  	 */
304b3f2bc07ba7 Tejun Heo                  2024-06-18  2337  	retval = sched_cgroup_fork(p, args);
304b3f2bc07ba7 Tejun Heo                  2024-06-18  2338  	if (retval)
304b3f2bc07ba7 Tejun Heo                  2024-06-18  2339  		goto bad_fork_cancel_cgroup;
b1e8206582f9d6 Peter Zijlstra             2022-02-14  2340  
7c4f75a21f6364 Sebastian Andrzej Siewior  2025-04-16  2341  	/*
7c4f75a21f6364 Sebastian Andrzej Siewior  2025-04-16  2342  	 * Allocate a default futex hash for the user process once the first
7c4f75a21f6364 Sebastian Andrzej Siewior  2025-04-16  2343  	 * thread spawns.
7c4f75a21f6364 Sebastian Andrzej Siewior  2025-04-16  2344  	 */
7c4f75a21f6364 Sebastian Andrzej Siewior  2025-04-16  2345  	if (need_futex_hash_allocate_default(clone_flags)) {
7c4f75a21f6364 Sebastian Andrzej Siewior  2025-04-16  2346  		retval = futex_hash_allocate_default();
7c4f75a21f6364 Sebastian Andrzej Siewior  2025-04-16  2347  		if (retval)
4ec3c15462b9f4 Sebastian Andrzej Siewior  2025-09-18  2348  			goto bad_fork_cancel_cgroup;
7c4f75a21f6364 Sebastian Andrzej Siewior  2025-04-16  2349  		/*
7c4f75a21f6364 Sebastian Andrzej Siewior  2025-04-16  2350  		 * If we fail beyond this point we don't free the allocated
7c4f75a21f6364 Sebastian Andrzej Siewior  2025-04-16  2351  		 * futex hash map. We assume that another thread will be created
7c4f75a21f6364 Sebastian Andrzej Siewior  2025-04-16  2352  		 * and makes use of it. The hash map will be freed once the main
7c4f75a21f6364 Sebastian Andrzej Siewior  2025-04-16  2353  		 * thread terminates.
7c4f75a21f6364 Sebastian Andrzej Siewior  2025-04-16  2354  		 */
7c4f75a21f6364 Sebastian Andrzej Siewior  2025-04-16  2355  	}
7b55851367136b David Rheinsberg           2019-01-08  2356  	/*
7b55851367136b David Rheinsberg           2019-01-08  2357  	 * From this point on we must avoid any synchronous user-space
7b55851367136b David Rheinsberg           2019-01-08  2358  	 * communication until we take the tasklist-lock. In particular, we do
7b55851367136b David Rheinsberg           2019-01-08  2359  	 * not want user-space to be able to predict the process start-time by
7b55851367136b David Rheinsberg           2019-01-08  2360  	 * stalling fork(2) after we recorded the start_time but before it is
7b55851367136b David Rheinsberg           2019-01-08  2361  	 * visible to the system.
7b55851367136b David Rheinsberg           2019-01-08  2362  	 */
7b55851367136b David Rheinsberg           2019-01-08  2363  
7b55851367136b David Rheinsberg           2019-01-08  2364  	p->start_time = ktime_get_ns();
cf25e24db61cc9 Peter Zijlstra             2019-11-07  2365  	p->start_boottime = ktime_get_boottime_ns();
7b55851367136b David Rheinsberg           2019-01-08  2366  
18c830df771f2b Oleg Nesterov              2013-07-03  2367  	/*
18c830df771f2b Oleg Nesterov              2013-07-03  2368  	 * Make it visible to the rest of the system, but dont wake it up yet.
18c830df771f2b Oleg Nesterov              2013-07-03  2369  	 * Need tasklist lock for parent etc handling!
18c830df771f2b Oleg Nesterov              2013-07-03  2370  	 */
^1da177e4c3f41 Linus Torvalds             2005-04-16  2371  	write_lock_irq(&tasklist_lock);
^1da177e4c3f41 Linus Torvalds             2005-04-16  2372  
^1da177e4c3f41 Linus Torvalds             2005-04-16  2373  	/* CLONE_PARENT re-uses the old parent */
2d5516cbb9daf7 Oleg Nesterov              2009-03-02  2374  	if (clone_flags & (CLONE_PARENT|CLONE_THREAD)) {
^1da177e4c3f41 Linus Torvalds             2005-04-16  2375  		p->real_parent = current->real_parent;
2d5516cbb9daf7 Oleg Nesterov              2009-03-02  2376  		p->parent_exec_id = current->parent_exec_id;
b4e00444cab4c3 Eddy Wu                    2020-11-07  2377  		if (clone_flags & CLONE_THREAD)
b4e00444cab4c3 Eddy Wu                    2020-11-07  2378  			p->exit_signal = -1;
b4e00444cab4c3 Eddy Wu                    2020-11-07  2379  		else
b4e00444cab4c3 Eddy Wu                    2020-11-07  2380  			p->exit_signal = current->group_leader->exit_signal;
2d5516cbb9daf7 Oleg Nesterov              2009-03-02  2381  	} else {
^1da177e4c3f41 Linus Torvalds             2005-04-16  2382  		p->real_parent = current;
2d5516cbb9daf7 Oleg Nesterov              2009-03-02  2383  		p->parent_exec_id = current->self_exec_id;
b4e00444cab4c3 Eddy Wu                    2020-11-07  2384  		p->exit_signal = args->exit_signal;
2d5516cbb9daf7 Oleg Nesterov              2009-03-02  2385  	}
^1da177e4c3f41 Linus Torvalds             2005-04-16  2386  
d83a7cb375eec2 Josh Poimboeuf             2017-02-13  2387  	klp_copy_process(p);
d83a7cb375eec2 Josh Poimboeuf             2017-02-13  2388  
85dd3f61203c5c Peter Zijlstra             2021-03-29  2389  	sched_core_fork(p);
85dd3f61203c5c Peter Zijlstra             2021-03-29  2390  
^1da177e4c3f41 Linus Torvalds             2005-04-16  2391  	spin_lock(&current->sighand->siglock);
4a2c7a7837da1b Oleg Nesterov              2006-03-28  2392  
792575348ff70e Daniel Bristot de Oliveira 2022-07-29  2393  	rv_task_fork(p);
792575348ff70e Daniel Bristot de Oliveira 2022-07-29  2394  
d7822b1e24f2df Mathieu Desnoyers          2018-06-02  2395  	rseq_fork(p, clone_flags);
d7822b1e24f2df Mathieu Desnoyers          2018-06-02  2396  
4ca1d3ee46130e Eric W. Biederman          2018-07-13  2397  	/* Don't start children in a dying pid namespace */
e8cfbc245e2488 Gargi Sharma               2017-11-17  2398  	if (unlikely(!(ns_of_pid(pid)->pid_allocated & PIDNS_ADDING))) {
3fd37226216620 Kirill Tkhai               2017-05-12  2399  		retval = -ENOMEM;
304b3f2bc07ba7 Tejun Heo                  2024-06-18  2400  		goto bad_fork_core_free;
3fd37226216620 Kirill Tkhai               2017-05-12  2401  	}
4a2c7a7837da1b Oleg Nesterov              2006-03-28  2402  
7673bf553b2732 Eric W. Biederman          2018-07-23  2403  	/* Let kill terminate clone/fork in the middle */
7673bf553b2732 Eric W. Biederman          2018-07-23  2404  	if (fatal_signal_pending(current)) {
7673bf553b2732 Eric W. Biederman          2018-07-23  2405  		retval = -EINTR;
304b3f2bc07ba7 Tejun Heo                  2024-06-18  2406  		goto bad_fork_core_free;
7673bf553b2732 Eric W. Biederman          2018-07-23  2407  	}
7673bf553b2732 Eric W. Biederman          2018-07-23  2408  
a1140cb215fa13 Kuniyuki Iwashima          2022-08-23  2409  	/* No more failure paths after this point. */
a1140cb215fa13 Kuniyuki Iwashima          2022-08-23  2410  
a1140cb215fa13 Kuniyuki Iwashima          2022-08-23  2411  	/*
a1140cb215fa13 Kuniyuki Iwashima          2022-08-23  2412  	 * Copy seccomp details explicitly here, in case they were changed
a1140cb215fa13 Kuniyuki Iwashima          2022-08-23  2413  	 * before holding sighand lock.
a1140cb215fa13 Kuniyuki Iwashima          2022-08-23  2414  	 */
a1140cb215fa13 Kuniyuki Iwashima          2022-08-23  2415  	copy_seccomp(p);
a1140cb215fa13 Kuniyuki Iwashima          2022-08-23  2416  
2c4704756cab7c Eric W. Biederman          2017-09-26  2417  	init_task_pid_links(p);
73b9ebfe126a4a Oleg Nesterov              2006-03-28  2418  	if (likely(p->pid)) {
4b9d33e6d83cc0 Tejun Heo                  2011-06-17  2419  		ptrace_init_task(p, (clone_flags & CLONE_PTRACE) || trace);
^1da177e4c3f41 Linus Torvalds             2005-04-16  2420  
8190773985141f Oleg Nesterov              2013-07-03  2421  		init_task_pid(p, PIDTYPE_PID, pid);
^1da177e4c3f41 Linus Torvalds             2005-04-16  2422  		if (thread_group_leader(p)) {
6883f81aac6f44 Eric W. Biederman          2017-06-04  2423  			init_task_pid(p, PIDTYPE_TGID, pid);
8190773985141f Oleg Nesterov              2013-07-03  2424  			init_task_pid(p, PIDTYPE_PGID, task_pgrp(current));
8190773985141f Oleg Nesterov              2013-07-03  2425  			init_task_pid(p, PIDTYPE_SID, task_session(current));
8190773985141f Oleg Nesterov              2013-07-03  2426  
1c4042c29bd2e8 Eric W. Biederman          2010-07-12  2427  			if (is_child_reaper(pid)) {
17cf22c33e1f1b Eric W. Biederman          2010-03-02  2428  				ns_of_pid(pid)->child_reaper = p;
1c4042c29bd2e8 Eric W. Biederman          2010-07-12  2429  				p->signal->flags |= SIGNAL_UNKILLABLE;
1c4042c29bd2e8 Eric W. Biederman          2010-07-12  2430  			}
c3ad2c3b02e953 Eric W. Biederman          2018-07-23  2431  			p->signal->shared_pending.signal = delayed.signal;
9c9f4ded90a59e Alan Cox                   2008-10-13  2432  			p->signal->tty = tty_kref_get(current->signal->tty);
749860ce242798 Pavel Tikhomirov           2017-01-30  2433  			/*
749860ce242798 Pavel Tikhomirov           2017-01-30  2434  			 * Inherit has_child_subreaper flag under the same
749860ce242798 Pavel Tikhomirov           2017-01-30  2435  			 * tasklist_lock with adding child to the process tree
749860ce242798 Pavel Tikhomirov           2017-01-30  2436  			 * for propagate_has_child_subreaper optimization.
749860ce242798 Pavel Tikhomirov           2017-01-30  2437  			 */
749860ce242798 Pavel Tikhomirov           2017-01-30  2438  			p->signal->has_child_subreaper = p->real_parent->signal->has_child_subreaper ||
749860ce242798 Pavel Tikhomirov           2017-01-30  2439  							 p->real_parent->signal->is_child_subreaper;
9cd80bbb07fcd6 Oleg Nesterov              2009-12-17  2440  			list_add_tail(&p->sibling, &p->real_parent->children);
5e85d4abe3f43b Eric W. Biederman          2006-04-18  2441  			list_add_tail_rcu(&p->tasks, &init_task.tasks);
6883f81aac6f44 Eric W. Biederman          2017-06-04  2442  			attach_pid(p, PIDTYPE_TGID);
8190773985141f Oleg Nesterov              2013-07-03  2443  			attach_pid(p, PIDTYPE_PGID);
8190773985141f Oleg Nesterov              2013-07-03  2444  			attach_pid(p, PIDTYPE_SID);
909ea96468096b Christoph Lameter          2010-12-08  2445  			__this_cpu_inc(process_counts);
80628ca06c5d42 Oleg Nesterov              2013-07-03  2446  		} else {
80628ca06c5d42 Oleg Nesterov              2013-07-03  2447  			current->signal->nr_threads++;
d80f7d7b2c75c5 Eric W. Biederman          2022-06-21  2448  			current->signal->quick_threads++;
80628ca06c5d42 Oleg Nesterov              2013-07-03  2449  			atomic_inc(&current->signal->live);
60d4de3ff7f775 Elena Reshetova            2019-01-18  2450  			refcount_inc(&current->signal->sigcnt);
924de3b8c9410c Eric W. Biederman          2018-07-23  2451  			task_join_group_stop(p);
0c740d0afc3bff Oleg Nesterov              2014-01-21  2452  			list_add_tail_rcu(&p->thread_node,
0c740d0afc3bff Oleg Nesterov              2014-01-21  2453  					  &p->signal->thread_head);
^1da177e4c3f41 Linus Torvalds             2005-04-16  2454  		}
8190773985141f Oleg Nesterov              2013-07-03  2455  		attach_pid(p, PIDTYPE_PID);
^1da177e4c3f41 Linus Torvalds             2005-04-16  2456  		nr_threads++;
73b9ebfe126a4a Oleg Nesterov              2006-03-28  2457  	}
^1da177e4c3f41 Linus Torvalds             2005-04-16  2458  	total_forks++;
c3ad2c3b02e953 Eric W. Biederman          2018-07-23  2459  	hlist_del_init(&delayed.node);
3f17da699431ec Oleg Nesterov              2006-02-15  2460  	spin_unlock(&current->sighand->siglock);
4af4206be2bd19 Oleg Nesterov              2014-04-13  2461  	syscall_tracepoint_update(p);
^1da177e4c3f41 Linus Torvalds             2005-04-16  2462  	write_unlock_irq(&tasklist_lock);
4af4206be2bd19 Oleg Nesterov              2014-04-13  2463  
ddc204b517e60a Waiman Long                2022-02-08  2464  	if (pidfile)
ddc204b517e60a Waiman Long                2022-02-08  2465  		fd_install(pidfd, pidfile);
ddc204b517e60a Waiman Long                2022-02-08  2466  
c13cf856cbe16a Andrew Morton              2005-11-28  2467  	proc_fork_connector(p);
b1e8206582f9d6 Peter Zijlstra             2022-02-14  2468  	sched_post_fork(p);
ef2c41cf38a755 Christian Brauner          2020-02-05  2469  	cgroup_post_fork(p, args);
cdd6c482c9ff9c Ingo Molnar                2009-09-21  2470  	perf_event_fork(p);
43d2b113241d67 KAMEZAWA Hiroyuki          2012-01-10  2471  
43d2b113241d67 KAMEZAWA Hiroyuki          2012-01-10  2472  	trace_task_newtask(p, clone_flags);
3ab679661721b1 Oleg Nesterov              2013-10-16  2473  	uprobe_copy_process(p, clone_flags);
fd593511cdfc0b Beau Belgrave              2023-03-28  2474  	user_events_fork(p, clone_flags);
43d2b113241d67 KAMEZAWA Hiroyuki          2012-01-10  2475  
67197a4f28d28d Suren Baghdasaryan         2020-10-13  2476  	copy_oom_score_adj(clone_flags, p);
67197a4f28d28d Suren Baghdasaryan         2020-10-13  2477  
^1da177e4c3f41 Linus Torvalds             2005-04-16  2478  	return p;
^1da177e4c3f41 Linus Torvalds             2005-04-16  2479  
304b3f2bc07ba7 Tejun Heo                  2024-06-18  2480  bad_fork_core_free:
85dd3f61203c5c Peter Zijlstra             2021-03-29  2481  	sched_core_free(p);
3fd37226216620 Kirill Tkhai               2017-05-12  2482  	spin_unlock(&current->sighand->siglock);
3fd37226216620 Kirill Tkhai               2017-05-12  2483  	write_unlock_irq(&tasklist_lock);
304b3f2bc07ba7 Tejun Heo                  2024-06-18  2484  bad_fork_cancel_cgroup:
ef2c41cf38a755 Christian Brauner          2020-02-05  2485  	cgroup_cancel_fork(p, args);
b3e5838252665e Christian Brauner          2019-03-27  2486  bad_fork_put_pidfd:
6fd2fe494b17bf Al Viro                    2019-06-26  2487  	if (clone_flags & CLONE_PIDFD) {
6fd2fe494b17bf Al Viro                    2019-06-26  2488  		fput(pidfile);
6fd2fe494b17bf Al Viro                    2019-06-26  2489  		put_unused_fd(pidfd);
6fd2fe494b17bf Al Viro                    2019-06-26  2490  	}
425fb2b4bf5dde Pavel Emelyanov            2007-10-18  2491  bad_fork_free_pid:
425fb2b4bf5dde Pavel Emelyanov            2007-10-18  2492  	if (pid != &init_struct_pid)
425fb2b4bf5dde Pavel Emelyanov            2007-10-18  2493  		free_pid(pid);
0740aa5f637568 Jiri Slaby                 2016-05-20  2494  bad_fork_cleanup_thread:
0740aa5f637568 Jiri Slaby                 2016-05-20  2495  	exit_thread(p);
fd0928df98b957 Jens Axboe                 2008-01-24  2496  bad_fork_cleanup_io:
b69f2292063d2c Louis Rilling              2009-12-04  2497  	if (p->io_context)
b69f2292063d2c Louis Rilling              2009-12-04  2498  		exit_io_context(p);
ab516013ad9ca4 Serge Hallyn               2006-10-02  2499  bad_fork_cleanup_namespaces:
4b06b70c8244b4 Christian Brauner          2025-10-29  2500  	exit_nsproxy_namespaces(p);
^1da177e4c3f41 Linus Torvalds             2005-04-16  2501  bad_fork_cleanup_mm:
c3f3ce049f7d97 Andrea Arcangeli           2019-05-14  2502  	if (p->mm) {
b0c3d51b54f8a4 Thomas Gleixner            2025-11-19  2503  		sched_mm_cid_exit(p);
c3f3ce049f7d97 Andrea Arcangeli           2019-05-14  2504  		mm_clear_owner(p->mm, p);
^1da177e4c3f41 Linus Torvalds             2005-04-16  2505  		mmput(p->mm);
c3f3ce049f7d97 Andrea Arcangeli           2019-05-14  2506  	}
^1da177e4c3f41 Linus Torvalds             2005-04-16  2507  bad_fork_cleanup_signal:
4ab6c08336535f Oleg Nesterov              2009-08-26  2508  	if (!(clone_flags & CLONE_THREAD))
1c5354de90c900 Mike Galbraith             2011-01-05  2509  		free_signal_struct(p->signal);
^1da177e4c3f41 Linus Torvalds             2005-04-16  2510  bad_fork_cleanup_sighand:
a7e5328a06a2be Oleg Nesterov              2006-03-28  2511  	__cleanup_sighand(p->sighand);
^1da177e4c3f41 Linus Torvalds             2005-04-16  2512  bad_fork_cleanup_fs:
^1da177e4c3f41 Linus Torvalds             2005-04-16  2513  	exit_fs(p); /* blocking */
^1da177e4c3f41 Linus Torvalds             2005-04-16  2514  bad_fork_cleanup_files:
^1da177e4c3f41 Linus Torvalds             2005-04-16  2515  	exit_files(p); /* blocking */
^1da177e4c3f41 Linus Torvalds             2005-04-16  2516  bad_fork_cleanup_semundo:
^1da177e4c3f41 Linus Torvalds             2005-04-16  2517  	exit_sem(p);
e4e55b47ed9ae2 Tetsuo Handa               2017-03-24  2518  bad_fork_cleanup_security:
e4e55b47ed9ae2 Tetsuo Handa               2017-03-24  2519  	security_task_free(p);
^1da177e4c3f41 Linus Torvalds             2005-04-16  2520  bad_fork_cleanup_audit:
^1da177e4c3f41 Linus Torvalds             2005-04-16  2521  	audit_free(p);
6c72e3501d0d62 Peter Zijlstra             2014-10-02  2522  bad_fork_cleanup_perf:
cdd6c482c9ff9c Ingo Molnar                2009-09-21  2523  	perf_event_free_task(p);
304b3f2bc07ba7 Tejun Heo                  2024-06-18  2524  bad_fork_sched_cancel_fork:
304b3f2bc07ba7 Tejun Heo                  2024-06-18  2525  	sched_cancel_fork(p);
6c72e3501d0d62 Peter Zijlstra             2014-10-02  2526  bad_fork_cleanup_policy:
b09be676e0ff25 Byungchul Park             2017-08-07  2527  	lockdep_free_task(p);
^1da177e4c3f41 Linus Torvalds             2005-04-16  2528  #ifdef CONFIG_NUMA
f0be3d32b05d3f Lee Schermerhorn           2008-04-28  2529  	mpol_put(p->mempolicy);
^1da177e4c3f41 Linus Torvalds             2005-04-16  2530  #endif
ff8288ff475e47 Eric W. Biederman          2021-12-20  2531  bad_fork_cleanup_delayacct:
10e1438dd6387c Jens Axboe                 2026-01-16  2532  	io_uring_free(p);
35df17c57cecb0 Shailabh Nagar             2006-08-31  2533  	delayacct_tsk_free(p);
^1da177e4c3f41 Linus Torvalds             2005-04-16  2534  bad_fork_cleanup_count:
21d1c5e386bc75 Alexey Gladkov             2021-04-22  2535  	dec_rlimit_ucounts(task_ucounts(p), UCOUNT_RLIMIT_NPROC, 1);
3a18f809184bc5 Christian Brauner          2025-10-29  2536  	exit_cred_namespaces(p);
e0e817392b9acf David Howells              2009-09-02  2537  	exit_creds(p);
^1da177e4c3f41 Linus Torvalds             2005-04-16  2538  bad_fork_free:
2f064a59a11ff9 Peter Zijlstra             2021-06-11  2539  	WRITE_ONCE(p->__state, TASK_DEAD);
1a03d3f13ffe5d Sebastian Andrzej Siewior  2022-02-17  2540  	exit_task_stack_account(p);
68f24b08ee892d Andy Lutomirski            2016-09-15  2541  	put_task_stack(p);
c3f3ce049f7d97 Andrea Arcangeli           2019-05-14  2542  	delayed_free_task(p);
fe7d37d1fbf8ff Oleg Nesterov              2006-01-08  2543  fork_out:
c3ad2c3b02e953 Eric W. Biederman          2018-07-23  2544  	spin_lock_irq(&current->sighand->siglock);
c3ad2c3b02e953 Eric W. Biederman          2018-07-23  2545  	hlist_del_init(&delayed.node);
c3ad2c3b02e953 Eric W. Biederman          2018-07-23  2546  	spin_unlock_irq(&current->sighand->siglock);
fe7d37d1fbf8ff Oleg Nesterov              2006-01-08 @2547  	return ERR_PTR(retval);
^1da177e4c3f41 Linus Torvalds             2005-04-16  2548  }
^1da177e4c3f41 Linus Torvalds             2005-04-16  2549  

:::::: The code at line 2547 was first introduced by commit
:::::: fe7d37d1fbf8ffe78abd72728b24fb0c64f7af55 [PATCH] copy_process: error path cleanup

:::::: TO: Oleg Nesterov <oleg@tv-sign.ru>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
