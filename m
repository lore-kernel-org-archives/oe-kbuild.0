Content-Type: multipart/mixed; boundary="===============4947095015825475185=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tip:locking/core 2/2] kernel/locking/rtmutex.c:756 rt_mutex_adjust_prio_chain() error: we previously assumed 'orig_waiter' could be null (see line 644)
Date: Sat, 28 Aug 2021 14:52:10 +0800
Message-ID: <202108281450.8DnNrKzv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4947095015825475185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
CC: x86(a)kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking=
/core
head:   a055fcc132d4c25b96d1115aea514258810dc6fc
commit: a055fcc132d4c25b96d1115aea514258810dc6fc [2/2] locking/rtmutex: Ret=
urn success on deadlock for ww_mutex waiters
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: i386-randconfig-m021-20210827 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/locking/rtmutex.c:756 rt_mutex_adjust_prio_chain() error: we previou=
sly assumed 'orig_waiter' could be null (see line 644)

vim +/orig_waiter +756 kernel/locking/rtmutex.c

82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 503  =

23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 504  /*
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 505   * Adjust the priority chain. Also used for deadlock detection.
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 506   * Decreases task's usage by one - may thus free the task.
0c1061733aa030 kernel/rtmutex.c         Juri Lelli              2013-05-15 =
 507   *
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 508   * @task:	the task owning the mutex (owner) for which a chain walk is
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 509   *		probably needed
e6beaa363d56d7 kernel/locking/rtmutex.c Tom(JeHyeon  Yeon       2015-03-18 =
 510)  * @chwalk:	do we have to carry out deadlock detection?
0c1061733aa030 kernel/rtmutex.c         Juri Lelli              2013-05-15 =
 511   * @orig_lock:	the mutex (can be NULL if we are walking the chain to =
recheck
0c1061733aa030 kernel/rtmutex.c         Juri Lelli              2013-05-15 =
 512   *		things for a task that has just got its priority adjusted, and
0c1061733aa030 kernel/rtmutex.c         Juri Lelli              2013-05-15 =
 513   *		is waiting on a mutex)
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 514   * @next_lock:	the mutex on which the owner of @orig_lock was blocked=
 before
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 515   *		we dropped its pi_lock. Is never dereferenced, only used for
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 516   *		comparison to detect lock chain changes.
0c1061733aa030 kernel/rtmutex.c         Juri Lelli              2013-05-15 =
 517   * @orig_waiter: rt_mutex_waiter struct for the task that has just do=
nated
0c1061733aa030 kernel/rtmutex.c         Juri Lelli              2013-05-15 =
 518   *		its priority to the mutex owner (can be NULL in the case
0c1061733aa030 kernel/rtmutex.c         Juri Lelli              2013-05-15 =
 519   *		depicted above or if the top waiter is gone away and we are
0c1061733aa030 kernel/rtmutex.c         Juri Lelli              2013-05-15 =
 520   *		actually deboosting the owner)
0c1061733aa030 kernel/rtmutex.c         Juri Lelli              2013-05-15 =
 521   * @top_task:	the current top waiter
0c1061733aa030 kernel/rtmutex.c         Juri Lelli              2013-05-15 =
 522   *
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 523   * Returns 0 or -EDEADLK.
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 524   *
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 525   * Chain walk basics and protection scope
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 526   *
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 527   * [R] refcount on task
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 528   * [P] task->pi_lock held
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 529   * [L] rtmutex->wait_lock held
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 530   *
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 531   * Step	Description				Protected by
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 532   *	function arguments:
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 533   *	@task					[R]
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 534   *	@orig_lock if !=3D NULL			@top_task is blocked on it
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 535   *	@next_lock				Unprotected. Cannot be
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 536   *						dereferenced. Only used for
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 537   *						comparison.
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 538   *	@orig_waiter if !=3D NULL			@top_task is blocked on it
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 539   *	@top_task				current, or in case of proxy
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 540   *						locking protected by calling
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 541   *						code
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 542   *	again:
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 543   *	  loop_sanity_check();
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 544   *	retry:
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 545   * [1]	  lock(task->pi_lock);			[R] acquire [P]
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 546   * [2]	  waiter =3D task->pi_blocked_on;		[P]
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 547   * [3]	  check_exit_conditions_1();		[P]
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 548   * [4]	  lock =3D waiter->lock;			[P]
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 549   * [5]	  if (!try_lock(lock->wait_lock)) {	[P] try to acquire [L]
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 550   *	    unlock(task->pi_lock);		release [P]
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 551   *	    goto retry;
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 552   *	  }
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 553   * [6]	  check_exit_conditions_2();		[P] + [L]
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 554   * [7]	  requeue_lock_waiter(lock, waiter);	[P] + [L]
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 555   * [8]	  unlock(task->pi_lock);		release [P]
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 556   *	  put_task_struct(task);		release [R]
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 557   * [9]	  check_exit_conditions_3();		[L]
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 558   * [10]	  task =3D owner(lock);			[L]
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 559   *	  get_task_struct(task);		[L] acquire [R]
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 560   *	  lock(task->pi_lock);			[L] acquire [P]
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 561   * [11]	  requeue_pi_waiter(tsk, waiters(lock));[P] + [L]
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 562   * [12]	  check_exit_conditions_4();		[P] + [L]
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 563   * [13]	  unlock(task->pi_lock);		release [P]
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 564   *	  unlock(lock->wait_lock);		release [L]
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 565   *	  goto again;
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 566   */
d7a2edb890c0bf kernel/locking/rtmutex.c Thomas Gleixner         2021-03-26 =
 567  static int __sched rt_mutex_adjust_prio_chain(struct task_struct *tas=
k,
8930ed80f970a9 kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 568  					      enum rtmutex_chainwalk chwalk,
830e6acc8a1caf kernel/locking/rtmutex.c Peter Zijlstra          2021-08-15 =
 569  					      struct rt_mutex_base *orig_lock,
830e6acc8a1caf kernel/locking/rtmutex.c Peter Zijlstra          2021-08-15 =
 570  					      struct rt_mutex_base *next_lock,
95e02ca9bb5324 kernel/rtmutex.c         Thomas Gleixner         2006-06-27 =
 571  					      struct rt_mutex_waiter *orig_waiter,
9a11b49a805665 kernel/rtmutex.c         Ingo Molnar             2006-07-03 =
 572  					      struct task_struct *top_task)
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 573  {
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 574  	struct rt_mutex_waiter *waiter, *top_waiter =3D orig_waiter;
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 575  	struct rt_mutex_waiter *prerequeue_top_waiter;
8930ed80f970a9 kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 576  	int ret =3D 0, depth =3D 0;
830e6acc8a1caf kernel/locking/rtmutex.c Peter Zijlstra          2021-08-15 =
 577  	struct rt_mutex_base *lock;
8930ed80f970a9 kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 578  	bool detect_deadlock;
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 579  	bool requeue =3D true;
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 580  =

8930ed80f970a9 kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 581  	detect_deadlock =3D rt_mutex_cond_detect_deadlock(orig_waiter, chwal=
k);
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 582  =

23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 583  	/*
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 584  	 * The (de)boosting is a step by step approach with a lot of
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 585  	 * pitfalls. We want this to be preemptible and we want hold a
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 586  	 * maximum of two locks per step. So we have to check
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 587  	 * carefully whether things change under us.
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 588  	 */
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 589   again:
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 590  	/*
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 591  	 * We limit the lock chain length for each invocation.
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 592  	 */
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 593  	if (++depth > max_lock_depth) {
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 594  		static int prev_max;
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 595  =

23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 596  		/*
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 597  		 * Print this only once. If the admin changes the limit,
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 598  		 * print a new message when reaching the limit again.
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 599  		 */
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 600  		if (prev_max !=3D max_lock_depth) {
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 601  			prev_max =3D max_lock_depth;
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 602  			printk(KERN_WARNING "Maximum lock depth %d reached "
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 603  			       "task: %s (%d)\n", max_lock_depth,
ba25f9dcc4ea6e kernel/rtmutex.c         Pavel Emelyanov         2007-10-18 =
 604  			       top_task->comm, task_pid_nr(top_task));
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 605  		}
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 606  		put_task_struct(task);
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 607  =

3d5c9340d19497 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 608  		return -EDEADLK;
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 609  	}
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 610  =

3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 611  	/*
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 612  	 * We are fully preemptible here and only hold the refcount on
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 613  	 * @task. So everything can have changed under us since the
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 614  	 * caller or our own code below (goto retry/again) dropped all
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 615  	 * locks.
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 616  	 */
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 617   retry:
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 618  	/*
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 619  	 * [1] Task cannot go away as we did a get_task() before !
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 620  	 */
b4abf91047cf05 kernel/locking/rtmutex.c Thomas Gleixner         2016-01-13 =
 621  	raw_spin_lock_irq(&task->pi_lock);
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 622  =

3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 623  	/*
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 624  	 * [2] Get the waiter on which @task is blocked on.
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 625  	 */
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 626  	waiter =3D task->pi_blocked_on;
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 627  =

3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 628  	/*
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 629  	 * [3] check_exit_conditions_1() protected by task->pi_lock.
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 630  	 */
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 631  =

23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 632  	/*
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 633  	 * Check whether the end of the boosting chain has been
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 634  	 * reached or the state of the chain has changed while we
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 635  	 * dropped the locks.
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 636  	 */
8161239a8bcce9 kernel/rtmutex.c         Lai Jiangshan           2011-01-14 =
 637  	if (!waiter)
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 638  		goto out_unlock_pi;
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 639  =

1a539a87280b30 kernel/rtmutex.c         Thomas Gleixner         2007-06-08 =
 640  	/*
1a539a87280b30 kernel/rtmutex.c         Thomas Gleixner         2007-06-08 =
 641  	 * Check the orig_waiter state. After we dropped the locks,
8161239a8bcce9 kernel/rtmutex.c         Lai Jiangshan           2011-01-14 =
 642  	 * the previous owner of the lock might have released the lock.
1a539a87280b30 kernel/rtmutex.c         Thomas Gleixner         2007-06-08 =
 643  	 */
8161239a8bcce9 kernel/rtmutex.c         Lai Jiangshan           2011-01-14 =
@644  	if (orig_waiter && !rt_mutex_owner(orig_lock))
1a539a87280b30 kernel/rtmutex.c         Thomas Gleixner         2007-06-08 =
 645  		goto out_unlock_pi;
1a539a87280b30 kernel/rtmutex.c         Thomas Gleixner         2007-06-08 =
 646  =

82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 647  	/*
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 648  	 * We dropped all locks after taking a refcount on @task, so
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 649  	 * the task might have moved on in the lock chain or even left
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 650  	 * the chain completely and blocks now on an unrelated lock or
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 651  	 * on @orig_lock.
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 652  	 *
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 653  	 * We stored the lock on which @task was blocked in @next_lock,
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 654  	 * so we can detect the chain change.
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 655  	 */
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 656  	if (next_lock !=3D waiter->lock)
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 657  		goto out_unlock_pi;
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 658  =

6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 659  	/*
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 660  	 * There could be 'spurious' loops in the lock graph due to ww_mutex,
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 661  	 * consider:
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 662  	 *
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 663  	 *   P1: A, ww_A, ww_B
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 664  	 *   P2: ww_B, ww_A
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 665  	 *   P3: A
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 666  	 *
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 667  	 * P3 should not return -EDEADLK because it gets trapped in the cycle
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 668  	 * created by P1 and P2 (which will resolve -- and runs into
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 669  	 * max_lock_depth above). Therefore disable detect_deadlock such that
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 670  	 * the below termination condition can trigger once all relevant tas=
ks
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 671  	 * are boosted.
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 672  	 *
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 673  	 * Even when we start with ww_mutex we can disable deadlock detectio=
n,
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 674  	 * since we would supress a ww_mutex induced deadlock at [6] anyway.
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 675  	 * Supressing it here however is not sufficient since we might still
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 676  	 * hit [6] due to adjustment driven iteration.
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 677  	 *
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 678  	 * NOTE: if someone were to create a deadlock between 2 ww_classes w=
e'd
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 679  	 * utterly fail to report it; lockdep should.
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 680  	 */
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 681  	if (IS_ENABLED(CONFIG_PREEMPT_RT) && waiter->ww_ctx && detect_deadlo=
ck)
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 682  		detect_deadlock =3D false;
6467822b8cc96e kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 683  =

1a539a87280b30 kernel/rtmutex.c         Thomas Gleixner         2007-06-08 =
 684  	/*
1a539a87280b30 kernel/rtmutex.c         Thomas Gleixner         2007-06-08 =
 685  	 * Drop out, when the task has no waiters. Note,
1a539a87280b30 kernel/rtmutex.c         Thomas Gleixner         2007-06-08 =
 686  	 * top_waiter can be NULL, when we are in the deboosting
1a539a87280b30 kernel/rtmutex.c         Thomas Gleixner         2007-06-08 =
 687  	 * mode!
1a539a87280b30 kernel/rtmutex.c         Thomas Gleixner         2007-06-08 =
 688  	 */
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 689  	if (top_waiter) {
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 690  		if (!task_has_pi_waiters(task))
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 691  			goto out_unlock_pi;
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 692  		/*
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 693  		 * If deadlock detection is off, we stop here if we
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 694  		 * are not the top pi waiter of the task. If deadlock
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 695  		 * detection is enabled we continue, but stop the
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 696  		 * requeueing in the chain walk.
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 697  		 */
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 698  		if (top_waiter !=3D task_top_pi_waiter(task)) {
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 699  			if (!detect_deadlock)
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 700  				goto out_unlock_pi;
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 701  			else
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 702  				requeue =3D false;
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 703  		}
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 704  	}
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 705  =

23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 706  	/*
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 707  	 * If the waiter priority is the same as the task priority
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 708  	 * then there is no further priority adjustment necessary.  If
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 709  	 * deadlock detection is off, we stop the chain walk. If its
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 710  	 * enabled we continue, but stop the requeueing in the chain
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 711  	 * walk.
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 712  	 */
19830e55247cdd kernel/locking/rtmutex.c Peter Zijlstra          2017-03-23 =
 713  	if (rt_mutex_waiter_equal(waiter, task_to_waiter(task))) {
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 714  		if (!detect_deadlock)
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 715  			goto out_unlock_pi;
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 716  		else
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 717  			requeue =3D false;
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 718  	}
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 719  =

3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 720  	/*
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 721  	 * [4] Get the next lock
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 722  	 */
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 723  	lock =3D waiter->lock;
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 724  	/*
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 725  	 * [5] We need to trylock here as we are holding task->pi_lock,
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 726  	 * which is the reverse lock order versus the other rtmutex
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 727  	 * operations.
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 728  	 */
d209d74d52ab39 kernel/rtmutex.c         Thomas Gleixner         2009-11-17 =
 729  	if (!raw_spin_trylock(&lock->wait_lock)) {
b4abf91047cf05 kernel/locking/rtmutex.c Thomas Gleixner         2016-01-13 =
 730  		raw_spin_unlock_irq(&task->pi_lock);
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 731  		cpu_relax();
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 732  		goto retry;
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 733  	}
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 734  =

397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 735  	/*
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 736  	 * [6] check_exit_conditions_2() protected by task->pi_lock and
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 737  	 * lock->wait_lock.
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 738  	 *
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 739  	 * Deadlock detection. If the lock is the same as the original
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 740  	 * lock which caused us to walk the lock chain or if the
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 741  	 * current lock is owned by the task which initiated the chain
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 742  	 * walk, we detected a deadlock.
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 743  	 */
95e02ca9bb5324 kernel/rtmutex.c         Thomas Gleixner         2006-06-27 =
 744  	if (lock =3D=3D orig_lock || rt_mutex_owner(lock) =3D=3D top_task) {
3d5c9340d19497 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 745  		ret =3D -EDEADLK;
a055fcc132d4c2 kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 746  =

a055fcc132d4c2 kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 747  		/*
a055fcc132d4c2 kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 748  		 * When the deadlock is due to ww_mutex; also see above. Don't
a055fcc132d4c2 kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 749  		 * report the deadlock and instead let the ww_mutex wound/die
a055fcc132d4c2 kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 750  		 * logic pick which of the contending threads gets -EDEADLK.
a055fcc132d4c2 kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 751  		 *
a055fcc132d4c2 kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 752  		 * NOTE: assumes the cycle only contains a single ww_class; any
a055fcc132d4c2 kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 753  		 * other configuration and we fail to report; also, see
a055fcc132d4c2 kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 754  		 * lockdep.
a055fcc132d4c2 kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 755  		 */
a055fcc132d4c2 kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
@756  		if (IS_ENABLED(CONFIG_PREEMPT_RT) && orig_waiter->ww_ctx)
a055fcc132d4c2 kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 757  			ret =3D 0;
a055fcc132d4c2 kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 758  =

a055fcc132d4c2 kernel/locking/rtmutex.c Peter Zijlstra          2021-08-26 =
 759  		raw_spin_unlock(&lock->wait_lock);
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 760  		goto out_unlock_pi;
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 761  	}
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 762  =

67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 763  	/*
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 764  	 * If we just follow the lock chain for deadlock detection, no
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 765  	 * need to do all the requeue operations. To avoid a truckload
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 766  	 * of conditionals around the various places below, just do the
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 767  	 * minimum chain walk checks.
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 768  	 */
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 769  	if (!requeue) {
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 770  		/*
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 771  		 * No requeue[7] here. Just release @task [8]
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 772  		 */
b4abf91047cf05 kernel/locking/rtmutex.c Thomas Gleixner         2016-01-13 =
 773  		raw_spin_unlock(&task->pi_lock);
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 774  		put_task_struct(task);
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 775  =

67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 776  		/*
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 777  		 * [9] check_exit_conditions_3 protected by lock->wait_lock.
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 778  		 * If there is no owner of the lock, end of chain.
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 779  		 */
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 780  		if (!rt_mutex_owner(lock)) {
b4abf91047cf05 kernel/locking/rtmutex.c Thomas Gleixner         2016-01-13 =
 781  			raw_spin_unlock_irq(&lock->wait_lock);
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 782  			return 0;
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 783  		}
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 784  =

67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 785  		/* [10] Grab the next task, i.e. owner of @lock */
7b3c92b85a65c2 kernel/locking/rtmutex.c Matthew Wilcox (Oracle  2019-07-04 =
 786) 		task =3D get_task_struct(rt_mutex_owner(lock));
b4abf91047cf05 kernel/locking/rtmutex.c Thomas Gleixner         2016-01-13 =
 787  		raw_spin_lock(&task->pi_lock);
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 788  =

67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 789  		/*
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 790  		 * No requeue [11] here. We just do deadlock detection.
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 791  		 *
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 792  		 * [12] Store whether owner is blocked
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 793  		 * itself. Decision is made after dropping the locks
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 794  		 */
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 795  		next_lock =3D task_blocked_on_lock(task);
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 796  		/*
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 797  		 * Get the top waiter for the next iteration
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 798  		 */
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 799  		top_waiter =3D rt_mutex_top_waiter(lock);
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 800  =

67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 801  		/* [13] Drop locks */
b4abf91047cf05 kernel/locking/rtmutex.c Thomas Gleixner         2016-01-13 =
 802  		raw_spin_unlock(&task->pi_lock);
b4abf91047cf05 kernel/locking/rtmutex.c Thomas Gleixner         2016-01-13 =
 803  		raw_spin_unlock_irq(&lock->wait_lock);
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 804  =

67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 805  		/* If owner is not blocked, end of chain. */
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 806  		if (!next_lock)
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 807  			goto out_put_task;
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 808  		goto again;
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 809  	}
67792e2cabadba kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 810  =

a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 811  	/*
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 812  	 * Store the current top waiter before doing the requeue
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 813  	 * operation on @lock. We need it for the boost/deboost
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 814  	 * decision below.
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 815  	 */
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 816  	prerequeue_top_waiter =3D rt_mutex_top_waiter(lock);
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 817  =

9f40a51a35a0e1 kernel/locking/rtmutex.c Davidlohr Bueso         2015-05-19 =
 818  	/* [7] Requeue the waiter in the lock waiter tree. */
fb00aca474405f kernel/locking/rtmutex.c Peter Zijlstra          2013-11-07 =
 819  	rt_mutex_dequeue(lock, waiter);
e0aad5b44ff5d2 kernel/locking/rtmutex.c Peter Zijlstra          2017-03-23 =
 820  =

e0aad5b44ff5d2 kernel/locking/rtmutex.c Peter Zijlstra          2017-03-23 =
 821  	/*
e0aad5b44ff5d2 kernel/locking/rtmutex.c Peter Zijlstra          2017-03-23 =
 822  	 * Update the waiter prio fields now that we're dequeued.
e0aad5b44ff5d2 kernel/locking/rtmutex.c Peter Zijlstra          2017-03-23 =
 823  	 *
e0aad5b44ff5d2 kernel/locking/rtmutex.c Peter Zijlstra          2017-03-23 =
 824  	 * These values can have changed through either:
e0aad5b44ff5d2 kernel/locking/rtmutex.c Peter Zijlstra          2017-03-23 =
 825  	 *
e0aad5b44ff5d2 kernel/locking/rtmutex.c Peter Zijlstra          2017-03-23 =
 826  	 *   sys_sched_set_scheduler() / sys_sched_setattr()
e0aad5b44ff5d2 kernel/locking/rtmutex.c Peter Zijlstra          2017-03-23 =
 827  	 *
e0aad5b44ff5d2 kernel/locking/rtmutex.c Peter Zijlstra          2017-03-23 =
 828  	 * or
e0aad5b44ff5d2 kernel/locking/rtmutex.c Peter Zijlstra          2017-03-23 =
 829  	 *
e0aad5b44ff5d2 kernel/locking/rtmutex.c Peter Zijlstra          2017-03-23 =
 830  	 *   DL CBS enforcement advancing the effective deadline.
e0aad5b44ff5d2 kernel/locking/rtmutex.c Peter Zijlstra          2017-03-23 =
 831  	 *
e0aad5b44ff5d2 kernel/locking/rtmutex.c Peter Zijlstra          2017-03-23 =
 832  	 * Even though pi_waiters also uses these fields, and that tree is o=
nly
e0aad5b44ff5d2 kernel/locking/rtmutex.c Peter Zijlstra          2017-03-23 =
 833  	 * updated in [11], we can do this here, since we hold [L], which
e0aad5b44ff5d2 kernel/locking/rtmutex.c Peter Zijlstra          2017-03-23 =
 834  	 * serializes all pi_waiters access and rb_erase() does not care abo=
ut
e0aad5b44ff5d2 kernel/locking/rtmutex.c Peter Zijlstra          2017-03-23 =
 835  	 * the values of the node being removed.
e0aad5b44ff5d2 kernel/locking/rtmutex.c Peter Zijlstra          2017-03-23 =
 836  	 */
715f7f9ece4685 kernel/locking/rtmutex.c Peter Zijlstra          2021-08-15 =
 837  	waiter_update_prio(waiter, task);
e0aad5b44ff5d2 kernel/locking/rtmutex.c Peter Zijlstra          2017-03-23 =
 838  =

fb00aca474405f kernel/locking/rtmutex.c Peter Zijlstra          2013-11-07 =
 839  	rt_mutex_enqueue(lock, waiter);
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 840  =

3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 841  	/* [8] Release the task */
b4abf91047cf05 kernel/locking/rtmutex.c Thomas Gleixner         2016-01-13 =
 842  	raw_spin_unlock(&task->pi_lock);
2ffa5a5cd2fe79 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-07 =
 843  	put_task_struct(task);
2ffa5a5cd2fe79 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-07 =
 844  =

a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 845  	/*
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 846  	 * [9] check_exit_conditions_3 protected by lock->wait_lock.
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 847  	 *
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 848  	 * We must abort the chain walk if there is no lock owner even
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 849  	 * in the dead lock detection case, as we have nothing to
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 850  	 * follow here. This is the end of the chain we are walking.
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 851  	 */
8161239a8bcce9 kernel/rtmutex.c         Lai Jiangshan           2011-01-14 =
 852  	if (!rt_mutex_owner(lock)) {
8161239a8bcce9 kernel/rtmutex.c         Lai Jiangshan           2011-01-14 =
 853  		/*
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 854  		 * If the requeue [7] above changed the top waiter,
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 855  		 * then we need to wake the new top waiter up to try
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 856  		 * to get the lock.
8161239a8bcce9 kernel/rtmutex.c         Lai Jiangshan           2011-01-14 =
 857  		 */
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 858  		if (prerequeue_top_waiter !=3D rt_mutex_top_waiter(lock))
c014ef69b3acdb kernel/locking/rtmutex.c Thomas Gleixner         2021-08-15 =
 859  			wake_up_state(waiter->task, waiter->wake_state);
b4abf91047cf05 kernel/locking/rtmutex.c Thomas Gleixner         2016-01-13 =
 860  		raw_spin_unlock_irq(&lock->wait_lock);
2ffa5a5cd2fe79 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-07 =
 861  		return 0;
8161239a8bcce9 kernel/rtmutex.c         Lai Jiangshan           2011-01-14 =
 862  	}
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 863  =

3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 864  	/* [10] Grab the next task, i.e. the owner of @lock */
7b3c92b85a65c2 kernel/locking/rtmutex.c Matthew Wilcox (Oracle  2019-07-04 =
 865) 	task =3D get_task_struct(rt_mutex_owner(lock));
b4abf91047cf05 kernel/locking/rtmutex.c Thomas Gleixner         2016-01-13 =
 866  	raw_spin_lock(&task->pi_lock);
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 867  =

3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 868  	/* [11] requeue the pi waiters if necessary */
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 869  	if (waiter =3D=3D rt_mutex_top_waiter(lock)) {
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 870  		/*
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 871  		 * The waiter became the new top (highest priority)
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 872  		 * waiter on the lock. Replace the previous top waiter
9f40a51a35a0e1 kernel/locking/rtmutex.c Davidlohr Bueso         2015-05-19 =
 873  		 * in the owner tasks pi waiters tree with this waiter
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 874  		 * and adjust the priority of the owner.
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 875  		 */
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 876  		rt_mutex_dequeue_pi(task, prerequeue_top_waiter);
fb00aca474405f kernel/locking/rtmutex.c Peter Zijlstra          2013-11-07 =
 877  		rt_mutex_enqueue_pi(task, waiter);
acd58620e415ae kernel/locking/rtmutex.c Peter Zijlstra          2017-03-23 =
 878  		rt_mutex_adjust_prio(task);
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 879  =

a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 880  	} else if (prerequeue_top_waiter =3D=3D waiter) {
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 881  		/*
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 882  		 * The waiter was the top waiter on the lock, but is
e2db7592be8e83 kernel/locking/rtmutex.c Ingo Molnar             2021-03-22 =
 883  		 * no longer the top priority waiter. Replace waiter in
9f40a51a35a0e1 kernel/locking/rtmutex.c Davidlohr Bueso         2015-05-19 =
 884  		 * the owner tasks pi waiters tree with the new top
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 885  		 * (highest priority) waiter and adjust the priority
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 886  		 * of the owner.
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 887  		 * The new top waiter is stored in @waiter so that
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 888  		 * @waiter =3D=3D @top_waiter evaluates to true below and
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 889  		 * we continue to deboost the rest of the chain.
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 890  		 */
fb00aca474405f kernel/locking/rtmutex.c Peter Zijlstra          2013-11-07 =
 891  		rt_mutex_dequeue_pi(task, waiter);
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 892  		waiter =3D rt_mutex_top_waiter(lock);
fb00aca474405f kernel/locking/rtmutex.c Peter Zijlstra          2013-11-07 =
 893  		rt_mutex_enqueue_pi(task, waiter);
acd58620e415ae kernel/locking/rtmutex.c Peter Zijlstra          2017-03-23 =
 894  		rt_mutex_adjust_prio(task);
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 895  	} else {
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 896  		/*
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 897  		 * Nothing changed. No need to do any priority
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 898  		 * adjustment.
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 899  		 */
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 900  	}
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 901  =

82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 902  	/*
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 903  	 * [12] check_exit_conditions_4() protected by task->pi_lock
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 904  	 * and lock->wait_lock. The actual decisions are made after we
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 905  	 * dropped the locks.
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 906  	 *
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 907  	 * Check whether the task which owns the current lock is pi
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 908  	 * blocked itself. If yes we store a pointer to the lock for
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 909  	 * the lock chain change detection above. After we dropped
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 910  	 * task->pi_lock next_lock cannot be dereferenced anymore.
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 911  	 */
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 912  	next_lock =3D task_blocked_on_lock(task);
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 913  	/*
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 914  	 * Store the top waiter of @lock for the end of chain walk
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 915  	 * decision below.
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 916  	 */
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 917  	top_waiter =3D rt_mutex_top_waiter(lock);
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 918  =

3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 919  	/* [13] Drop the locks */
b4abf91047cf05 kernel/locking/rtmutex.c Thomas Gleixner         2016-01-13 =
 920  	raw_spin_unlock(&task->pi_lock);
b4abf91047cf05 kernel/locking/rtmutex.c Thomas Gleixner         2016-01-13 =
 921  	raw_spin_unlock_irq(&lock->wait_lock);
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 922  =

82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 923  	/*
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 924  	 * Make the actual exit decisions [12], based on the stored
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 925  	 * values.
3eb65aeadf7019 kernel/locking/rtmutex.c Thomas Gleixner         2014-06-09 =
 926  	 *
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 927  	 * We reached the end of the lock chain. Stop right here. No
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 928  	 * point to go back just to figure that out.
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 929  	 */
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 930  	if (!next_lock)
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 931  		goto out_put_task;
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner         2014-06-05 =
 932  =

a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 933  	/*
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 934  	 * If the current waiter is not the top waiter on the lock,
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 935  	 * then we can stop the chain walk here if we are not in full
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 936  	 * deadlock detection mode.
a57594a13a446d kernel/locking/rtmutex.c Thomas Gleixner         2014-05-22 =
 937  	 */
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 938  	if (!detect_deadlock && waiter !=3D top_waiter)
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 939  		goto out_put_task;
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 940  =

23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 941  	goto again;
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 942  =

23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 943   out_unlock_pi:
b4abf91047cf05 kernel/locking/rtmutex.c Thomas Gleixner         2016-01-13 =
 944  	raw_spin_unlock_irq(&task->pi_lock);
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 945   out_put_task:
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 946  	put_task_struct(task);
36c8b586896f60 kernel/rtmutex.c         Ingo Molnar             2006-07-03 =
 947  =

23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 948  	return ret;
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 949  }
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar             2006-06-27 =
 950  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4947095015825475185==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICLPEKWEAAy5jb25maWcAjDxJd9w20vf8in7OJTkk0WLrc948HUAQ7EaaIGiA7EUXPFlue/TG
kvy1pJn4308VwAUAwfbk4KirCnvtKPDnn35ekNeXp4fbl/u7269fvy++HB4Px9uXw6fF5/uvh38s
crmoZLNgOW9+B+Ly/vH17z/uL99fLd79fv7297PfjndXi/Xh+Hj4uqBPj5/vv7xC8/unx59+/onK
quBLQ6nZMKW5rEzDds31my93d7/9ufglP3y8v31c/Pn7JXRzcfGr++uN14xrs6T0+nsPWo5dXf95
dnl2NtCWpFoOqAFMtO2iascuANSTXVy+O7vo4WWOpFmRj6QASpN6iDNvtpRUpuTVeuzBAxrdkIbT
ALeCyRAtzFI2MongFTRlE1QlTa1kwUtmisqQplEjCVcfzFYqbxJZy8u84YKZhmTQREvVjNhmpRiB
tVeFhH+ARGNTOLyfF0vLCl8Xz4eX12/jcfKKN4ZVG0MU7AUXvLm+vADyfo5S1Dizhulmcf+8eHx6
wR761i2puVnBkExZEm+7JSVlv69v3qTAhrT+TtmVGU3KxqNfkQ0za6YqVprlDa9Hch+TAeYijSpv
BEljdjdzLeQc4m0acaMbj9HC2Q476U/V38mYACd8Cr+7Od1anka/PYXGhSROOWcFacvG8op3Nj14
JXVTEcGu3/zy+PR4+PXN2K/ekjrRod7rDa898ekA+H/alP621VLznREfWtayRE9b0tCVsVi/FVVS
ayOYkGqPIkXoKsW9mpU887RJC3oxOmKioH+LwLmRsozIR6iVMhDYxfPrx+fvzy+Hh1HKlqxiilMr
zyDsmacFfJReyW0aw4qC0YbjhIrCCCfXEV3NqpxXVmmkOxF8qUBtgUB6a1Q5oDSclFFMQw/ppnTl
yx5CcikIr0KY5iJFZFacKdzI/cy8SKPgkGEbQTs0UqWpcHpqY+dvhMxZOFIhFWV5pwBhFzzeqonS
rNuVgUP8nnOWtctCh5JxePy0ePocHehooSRda9nCmI4Fc+mNaHnGJ7GC8z3VeENKnpOGmZLoxtA9
LROsYdX9ZsJ/Pdr2xzasavRJpMmUJDklvppOkQk4MZL/1SbphNSmrXHKkaA4QaV1a6ertDU+kfE6
STMcjV3uukXDFJsdK2PN/cPh+JwSMzDJayMrBnLky/ENiIbiMrcGexgG7C5geF6ypEq06ITSWPHl
CnmxW4LtseOVycQG01YX0W4xAJm/LFfYNcHP1IKQajz3YW5d4+S8EddWteKbQUHLopglrRUrgSuS
vB9OytPJijFRN7BFVUon9+iNLNuqIWof6HOHPNGMSmjlN9F0BZJNpWITVgBW+qO5ff7X4gW2fnEL
035+uX15Xtze3T29Pr7cP36JmAN5j1A7hFMSwyioCCznjej0pukcVThlYGCANH0IyNfoIurUOjX3
JELz4ZhyrtGly32W+h8WOKgVWBrXsuw1vN0gRduFTggK7LUB3DgR+GHYDuTEExwdUNg2EQiXaZt2
+iGBmoDanKXgjSI0MSfYxbJEN1T4ZgsxFQOu0GxJs5L7qgpxBalkaz3ZCdCUjBTXAaKSNMPtC5RQ
OClj/WqRJeUk3OTBKq3dH56dWg+sLqkPdh60vn4Y3WT0h0H2V7xori/OfDiesyA7D39+McoQrxqI
TkjBoj7OLwP901a6ix+ccKH673lG3/3z8On16+G4+Hy4fXk9Hp4tuFtsAhvYvS2pGpOhTYR+20qQ
2jRlZoqy1SvPBi6VbGvPXtVkyZzoM8/+gwdHl9FPs4b/eWFDue56i3s3W8UblhG6nmDsqkdoQbgy
SQwtwGySKt/yvPGmr5qIfPQ8HbzmeUr2O6zKbVASNypAwm6YSrWrwVf1zTtyEA7SYRKd5WzDaUo9
d3hoiOorNXemivl2zpbFbQTXNKkJh9mAi5WKBCRdDzSkCXYFYwpw3kDTpmazYnRdS2B3NMbgNHr+
iONpjC57vhhtyV7DieYMjA24mixPzhlMItknxkRWg2217pzymMT+JgI6dl6dFyOpfBIIAmg+CARk
HACOGBuxhqQyTRmEqvA7jFAzKdHMhsqJUiNrMID8hqEzbblAKkEqGkZWEZmGPxJzgEheqnpFKtAH
ylPcQ4AXKCOen1/FNGCNKKutt2+1cOxuUl2vYZZg7nCaIzY2YlHnAiwtB5HxlIxesgYjKjPxsB23
TMAFrCv3HXXn1w4OYaCM49+mEp79B6nwd5eVxcTRGV2ncMlp74RAqFO0ZZk4k6Jt2M5bBf4EHeJt
XS2D1fNlRUo/h2ZX6ANsxOAD9CpQzoTLwMeSplWRY9VT5hsOU+/22ttF6C8jSnH/xNZIshd6CjHB
QQ1Quy0o1hhC+zNCTrDeV5FKfFiDhjm6cRIww4raM/KGocIzPhBsBpGmVX0Wmjwx6JnlOUsN7xgd
Jmji6K6m52dve3vd5Wvrw/Hz0/Hh9vHusGD/PjyCl0jAZFP0EyEsGZ2/sMdonhYJu2I2wsbjSYfn
fxyxH3Aj3HC9ffcWoss2cyN7mkiKmoAPEUaFuiRZyoBAByGZTJORDE5RgZPRudv+HACHthf9SKNA
tqWYw2K+BFzdgOPbogBHyjowiRSGXSH6bDVRDSehdmmYsGYPM9C84LT33b1wCTPDaZGxatGawCAK
DRO9PfHu/ZW59HKk8Ns3YLpRLbXKNmdU5r6wgc9cg9tsjUFz/ebw9fPlxW94Z+AndddgUo1u6zpI
R4OPSdfOh57ghPDz+ChoAn1FVYF55C4Lcf3+FJ7srs+v0gQ9B/2gn4As6G7IDmlicj+B3CMChnW9
kn1vmUyR02kT0Gs8U5jrydG/iJqjlkEuQSW1S+CAC0ByTL0EjohzlOAAOrfNhbcQqowENkrqUVbX
QFcKc02r1r/cCOgsLyfJ3Hx4xlTlMnFg+jTPfGNoSXSrMR05h7ZBgt0YUppVCwa4zALeBF412teq
Xa+WiTADhUlUT48UYH8ZUeWeYnbQN0H10gU6JaggsCtDqNTdvmhSMcenuLGMOtm1erU+Pt0dnp+f
jouX799c8O0FRD2L+5PEiReMNK1iznsNUaK2qUiPNWSZF9zGRZ7z2YAZ5lXaB8BuHJuAj6RSVh4p
Mr508wrasV0DR4LHfMqDQEpQKXhZUGs9S0LE2E8i1vBMvi4gbuYzMx1OtMvVQyRWtr5t7XiBKx4Y
K+fiS8FBMYHrjelHnHQqdlrtga3BuQBnddkGd1RwGmTDVRAD9bDZiGUg0DWvbCY3nOxqg5JeYtgJ
Wp0GtmANljCag8sV1y3mIYEhyyb0werNKjm7E5mqmLSP7YdOxNv3V3qXPC1EpRHvTiCamdgPcULM
jHQ11yHoDfDQBec/QJ/Gp5m7x6ZvwcR6Zkrr/5uBv0/DqWq1TMuDYAXYeSarxJGJLa/wooVeBcfV
QS/TwaoAg1GlMUsGlny5Oz+BNeXM8dC94rvZTd5wQi9NOoS1yJkNQ795phV4TWJGSUySi72OUhUu
gRJQBl2a68onKc/ncWCMl5VAp9SPDkflh4EBlfU+xKFjXIOhcOkH3YpIwfOKi1ZYDV0Qwcv99dvB
xyKgxtA4mCAAxmYbsZuYDd8DxFwzhtqsZDSVOcfhQJG6mXt+dAe2Rxk4fz0GlPgUuNov/VTr0Avs
FWnVFAH+XaUFAyc2NUQraBJ+syJy598frmrm1JqKYAxCdvSaVBNc3+QiZVMq68Bo9OLBhcnYEoa4
SCPxrvPqbYzro4PLuJUHccZHC9/TtSBBpzYK1g+BfypPY1kU6yEMqSfcLRNAxRQ44y7vkim5ZpVL
5eAFbsSIlE0AmA8u2ZLQ4D6mQzremZkk4h2rhC5ARTkKkEimGfuGeCOrV+DoTCYEY/4FDH390Llb
XjT58PR4//J0DO5vvLC1l9EqjMOnFIrU5Sk8xUuamR6shyO3lh+H4GpmksGR2j0GofYjrPAXkp1f
Zf6lsHXQdA1+bBSlASvUJf7DbJZrvKCQoNWyVKaQv1+PNwmOb5BNoOsg4y44BdXiLtJHNdwDZxli
pAi0xwiWWHyFyrkgEy7UKpyZdXwA5N264v0qOIMzN6+AeRtkzDZC1yV4gZfp27oRjWnLkyQXp3u4
mPQQEZx7EaENoGRRYGr+7O+3Z+6/aCGxPNGauLoy3XCaynlbX7EAZQiNQX2RRNhlA4x5tLUgva+N
RRSedPASObfsPWksTWjZdTDpumGTSaMhhIBDakyKqdZmbFNs0yj/Xgd+YejFG37DZuHdIgadfDZD
hqvG9J7V1T3xuc9nEOZHWwGWXENsiDqEhFc+Fh1ngWysIkgU64EbOomynGJp9M7u7+zde4o0tW8J
uq5sbswgFmkvbXVjzs/OUoJ0Yy7enfldAOQyJI16SXdzDd2EFnCl8Jrd73rNdmzmakgRvTJ5K1Il
YvVqrznaRpAIhUJ0HsoQli1Q0oRM7k4NryYw4RuelU1w2FZ+HrUfxbqDMMpFKKiyqct22d0Nd0DU
pRhcCR8d7KbLpPrY9Ppd+mmT63TNHhU55gFwwKQiljkv9qbMm6BEpDdUJ5IXYd5qVaNCwJyYS52g
ahi0h7PMT/85HBdg9G6/HB4Ojy+2N0Jrvnj6hsXBfjrE5X08x6hLBHV3m4F/1KH0mtc2rZ5iA2F0
yZgndz3ERBkOgKNgWFz6+kSYLVkzG7InRwrG6HPSQf/5Bq/D8vncgLAVS9NdGCY96Ta303IVZDM9
hrdfPaTzh0coLb083faD812MDTetmzbJe4cpNTxPDzf51fs1VuQ0OK5y3cb5OQE2ounqJrFJ7edB
LaTLebu5WedLT1PDltLu1NI3DgHYdHd4w0a67muq3AxT5tNShNxkYYptjNwwpXjOUhlLpGG0LxOc
DEpSjGsxGWnAku59B8fB26ZJanuLbXi173bIEY4+Uxrf3dRdX74P6DawHBktoyBVBGlIPllRDjIy
Nzsb2yoG/KV11NUYqsZ+dYTm+WR/B2S0WF6LmBFDrRzOfByDLJfgEeBdzOw+r8Clhm0LBxySml1R
foSmrW4kqAcNateix7v+IVff7Su6Lm29VCSPF3sKN9EQblYUWVem/E83LQnRORiLWFz6veIyDCed
LGR6wpqr5E2kv3QI9VcynzRULG9RN+IN2Rb9MVmVqSKKUTuQmnlHG8LDW3KfPJI9pF2uWDpRPZIw
iDV/RILXHRPNHglG3aRKY/ojgL8L37uAoAiCBmDDoOY62zVmS+ewdPUjbI4VwXME1tsVcSLFhusA
Rt/F29Y6iEGQABQJhNRWufZWLLVeNJByGmPULvUViTcSc4iRyN5kJQluk9ColqXcmu4Ssy/qXBTH
w/+/Hh7vvi+e726/ujzA6Bh1Kih5N51uPXTMP309eI+ZJrPtIWYpN6YkeXAVGiAFqwL9EyAbNuPT
+UR9uj8pJQ7VXw34rt2wjCFys/FBTPZjr81VHr8+94DFL6BmFoeXu99/9bcbdc9SYog3U5aCaCHc
zxMkOVdspl7WEciyTvqAFkkqLxeLIJxQCHEDhLB+XiEURwqcO4DRKrs4g5P50HKVsn54F5y13pDd
5TAm6vy+AJxco6YYXSQ67ibj/TI7ef4OGoT6ruS7ROuKNe/enZ17QiVyUwU1ETZ43esiXb06wwCO
Oe4fb4/fF+zh9ett5Ol30YvNVo19TehD9Q72A2/VpYuk7RDF/fHhP7fHwyI/3v87qFNheWBl4Ods
NF1wJazRcZFM8vSoBm8iK9Bs+675iBgtfbE1tOjKv/wp+PA+PEvOB3h5WbJhWon5tBC1g3D72mUA
dcUZ7rHD4cvxdvG536RPdpP8etwZgh492d7gQNYbL+rB28IWuOxmUoUCZCkrAJ7OZvfu3MtX4oX6
ipybisewi3dXMRSi6FYPQWZftnJ7vPvn/cvhDkPV3z4dvsE6UHlNIk2XPQgTwL23E6Tm+/oLiIHC
pwhrV0SQWNlfrahB+Wd+esy9+DRrtteYRyu6546jeDs8xuEDfs79GYOytrKZByxXpei4TrNU9l0k
uPwmw8d0kb/EYfkYuSeKQtZxiYSDYnlBCiHrNLzrBnMDRaoOs2grVzcE4RN69jalHz0xA7LAnRsf
1tkeVxBKRkhUq+jS8mUr28SrJoj9nRl1772iXbP1MhBRYnqkq8idEmjWJ0JnkM6aGDHZdDdz99LW
1U2Z7Yo3LHyGMNS5aJPvK4J6z752ci2SdJV0lVgR8vIi4/YRj5k8TtQC00Dde9r46MA1BAnFBAuW
t3QM1lmrgM4VLCZPFV8FzzZcbU0Gu+DKsCOc4Dtg6hGt7XQiIutmAke2qoLFw3kFVZ5x+WOCiTDY
wISOrTB31Tu2RaqTxPh9saPqtghzkanDTumDFNYvMe3IhGgNRKEr1uUlbCIsicZXJimSjimdELmn
HVTUO7paxpPpNEnHk3gHEVF07dyt4wwul+1MvRY+0HVvKft33YnN0IyiZ3AC1ZWyBbrTYWajRdsa
T6gEdoq6ntRujfo4hPua2sPgdsl0SXKQHysb6T5MMJdAGwhAN/gX2wjHl3KpLdlypO24zxYyxSya
eJYWS5pETm7zJFjE4F7tVvbSBE4Vq+9CVhlPHHHYBxpwFS8AFE9/6cQoFq96XC3zFpOEaL6wpF1N
BEfLosGlgYqR224DEnrYNu6T+qmVBDWhEQHb4QvSlIEIWw1Zs87DDzUdLSXm4GF+4Mnl3hh4z6n5
souSLycIEtnBwWFGbY5HmlrPeIOxdkzRXSL6BYJpkj6/e6qMHVidg2boXvur7c4Xl1lU3NydbrJ5
CjUuDt+aXl70VzehxUIt7leJx55QV4UPXhxV+3pSATs6X7GK716VdjY4xeVzb1VC8e7K40FSbJF3
TGavgMFaXg1l+UsqN799vH0+fFr8y9XLfzs+fb6PkxlI1m37qaOzZP13QqK7nlMjBZuBX1xBB5lX
yYrxH7jefVcKzhnfjvi6yj6w0PhkYLx47bRArBbcU32Dr44nqLZKgl2LATlWK4y+T7qozDXXig6f
HAmzLRNKnjIEHRIFWKEn1GnzuPGAxxdfp0YZCGe+5RGTzXyWoyNzCTTBtcaPPwyP5gwXlnGDzbTO
PN6Gr67f/PH88f7xj4enT8AsHw9DFhsEWcBWg+rOQcEEj2x8qOfyjhnwXu/bp8LxDVHW1aEOP9cG
DIAVpkgdIspG5Yp9CKtlx8eeoGNQ6EMUPs7L9DIJDL70Mb7ka9hS8WZ/AmWa8+B2tye4AS5IHUuP
B8sjm6YMDPYUB9u0jXvvL36ts5W6vkCibRYtHgBGfEjuFcdX4aA595ORuoenFGxezedWM/RCZRjz
BsiZKje3ZNSd4dWZPWSs4a5JWiSRwH0yqVf6UWWJu5u+Pb7co35aNN+/dS+Vuw7sgxsXxXQXtykh
0rnUI+m4fZiM8cFjXjUa0V+o+ICpxPAMAIaZFS5DsM29u2/GyPFRtZfggHZcuqqKHFwY++2ohwRy
vc/8qKkHZ8UHP3UFP01/UpYgmQsMpzLmaqpzXwt0p4IF8FYpT1y38VLZJfyU8D5rY22Ha+y8P3/2
INVg5GeQ1keYwQ3pEvstoDxVnT+PiRurbbrpBD6Y5wpnBEamRDmq8DljblW3VcUpV6p/RWgyVvQ3
LuFXbTxaW91htgo699c81lRYPmJ/H+5eX24/fj3Yr70tbKHii8dRGa8K0aBT7bF5WYQ5tI5IU8V9
N6sD4zvvkQuxZRczDyw0Nws7RXF4eDp+X4jxUmJaQXKqRq0vfhOkaknwSZSx8s3hUu9fXWPPaR3a
xJ9zc0kQ/CTP0jdh3aT8r2z4h9WVq3VUXTLSHw59xLqxbGxLit+OGwmxQRQv2BpCxVCQAhuS+IoT
taky0zumo9CDJ50sznVvSGR3nzFmRHUqz9t/n8RGTe7jQLm6/i9nX9Yjt5Ek/L6/orEPH2aA9eci
617ADzyrUsWrmawqtl6IttRjN0ZSC93tseffb0ZmksxMRrC0a8CSKiKY9xERGcdqsd/gm37iymP4
KpgY9NTHRFP8JS1LAmW7h1nEO/EV8oC02Rlw9vUEYKnnJz4RLQz4L9vxg48Vbqb1kStHWvMw7mFy
3SHfDCpr8Gjrlbxm66TuUy4Q0KCeCJfqwa9QOkGoM9uSowcK4GWk0lXJmn0zNdSsWRxA0oTfDW4z
yjPgEoDrvofqqiZRWgNTC3WC5eVopngS1UnT28rqE4Y+RPrPCrMX4ofgIw610q7LY6h4ev/z5fWf
Qj6anj9iH54Sy0kMfncxC4w9KO7A1v4lDszcgehPxqWdEe50aZ3L8x/FQvNPyQP+ZVzJCBoJGmiI
FbbigFUq+gFEAMN99arRxE16GmC8pyCqCjMWnPzdxceocioDsDSWpCoDgjqocbyctooQpBRSzKnY
uvmZeBaFKppzUST2RfFQiPOyPDHCZkR9eGlwm1rApuV5DjdWi1cA09IFRxon5DcaySpCUyqxQ3dN
oL10FV1UTZanRJxjhaAbUAfXGxSAFfMCelV82ULt4p+HOb58oInOoXkz95dRj//lPz/98evzp/+0
S8/jNS7Ki5nd2Mv0stFrHVRF+OuyJFJRT8A0v4vdeGlG7zdzU7uZndsNMrl2G3JW4R6KEssy3PBA
Ip0FbaI4ayZDImDdpsYmRqKLWPCBHXjfNQ9VMvlaLcOZfsAxVGU6hi2xTSShnBoaz5PDpsuut+qT
ZMc8wO3Q1RqosvmCxATJNx5cY1OJVUd9BvEN4SbLA9SuBLZM1VTwdsA5Sx+sm0t+Wx0fpIZEXLp5
ZfGCgmJ4TXFBw+6yOMKaxYJrGIgm8nT08voE96Pg3d+fXqkg0GMl481qdlkjYcwgWjIZJ29KOgn0
OkOblfgpNKUsOb6zCwi3UxSSiaIIwG9OcIJkZencKh6b0mJUvUXX3KBbV6bgz6jb9MInk8mq/56Z
S7MLiouArYC7RkMvq7psH2ZJYlAvzOBhKMn7XqHnPq8TMC6gScQgCCohts6dKkAi2jAzG3Ojpof1
X5v//cDiJ7c1sCSJHlgSP44MSaIHl7o/NvTQDcMy12vZ7TiJvj29/9DQCFI4+ESlQpoNwcO3rNFq
b5VpnG3V9EwzJz6OiDMa9lVEsKl1jC8kcX+hZv+NbVLbgF8GwcQCMgsICzJAhrW/2eFLPfMbNLB2
Y2oralP7Lg9+93fHDrnofFGW9r2isRfRPP1c70RL1QQ5sZk1OkrxMAySS+SY76qscbfwPSuE1gjt
Dpca67hBkV/Mfqt1ZhamVx4p4GSZpUMRP310ooPMcLMFpX5QCZbGBmdNZQn+UVlR51IcY/1q/bXV
mKAK0e+ro5DV8athk5XXKsC8TViSJDBmayNY4Ajrikz/Q4bUYxAswZTNDUp1yFmaniBSOILh6eNm
yiPh/o+nP56EMP6z1j1bbt+auotCS5/dg48NFu5rwKY8slgjCVWb1AHC88U4cT1Ucqr3U+ra9Bjt
gTwNHT5Ig+9nmtgk9xnWsSbEPA3G0eDTxgpeYwpsAt2zSQ2CccMY/B4dc2BYsQ/F36iD9vBlXWOf
5ffEE9EwUKdQtnUysNGxPCXTrt2n99h4gxc6ycNLivR+SuQWEpwSrPDZuTwekQmoGNJ00QIFn1QA
OuOZKiAKLPIVYvyhbtsvj29vz/94/jRl4MXF5LLtAIKnfIZdbT2+iVgRJ63bCkDJM5Xa8kCQXrHP
zkvshB0K5ZfKHsAeupmCU3hOnUDd+MBDV8247GYRST0tJAcvTTBwcHqQSAS53uDTAA3bMqwFllr+
3HGEHWlxASaUvITsKdbDnjjNAvnEiTahrJLiwq+MauIF0R9aMi+IT6S+J68IJZfk7The5ZHTmk7V
UnGbkhTZEtJfgETlUGma+9o0oIVfHTet4CREyPnmGEpYfqRVfkXEMfVJBapwuPrrJI1ME9jaDLRR
pzJSvGVMDk9AdaukXTAxttmv1vxcP7BLNYF1OhoIpTtwrqQaYoRzcBU1raLC+0kqAd7USZDT5gZS
sQlGJio/kK1Ev3t/ent3bJpkW0/NIcEDU0n2ry6rLi8LRvH9k+IdhKm8N9ZWkNdBjN4yUWA40kIi
pzq42oAwym3AwSH44O2XexvEeNlUfQgbAbiLn/71/AnxZgHiy6QNl1aBRg5RAHkWofwa4MRqc8mj
IIvAkhH0k+hDEBClWYJVdagjInoYYE+XAIyjq4glKa7yrORVSTU2mg66yqE1hG12u6KwEbbZJD7a
bhdOgQAC000MTNXDwNMmKNCgv4DPO2Ss8huNy92uTXCN+GPVrlu35CoJTsgom0viQwABMNwPk5y7
DULwecRwzbBcGDtvs8BDxNlLgCTpW080XaOhEZN+Z+3Mh7rPem7tHaJRWCRLkwysjMXB+hUBdhE3
ty2vRDMgbPE/Hj89Odv2yJae1zoTGlX+2pvMpAa7u6XX800rGhpw5iHZgB3cMYLAbgJMrgLac85j
AONh9iRBA5bVfL3DQ//JY0GWTIyqXhJI1XkUBjMfypUw6ca532rGIDmDYdeirMlUzFFCnzo9h40b
DxeTg1RcmHWFPxEI5CnCVtmV1Ulm+W31EAi3akDFL8dZTYLsTCAaxC7GJZ8eQJD2LK5TCuaefGYH
Axl8GvWHMFBJBuHDpHmzWPmoSUNPHSXgN6UjUXdlYXpfDURglym6KeNOyKg6h9iSfAdCsKnqTcqB
SLrPzVUvBqAORtqY1WBeOi0Ygj0Jjio7Z0Et9meBPoBb1DKwsnSxqpEe9c+KFUf7gWQImwxcHQdG
KJNpGTC5SAFaU2JNcA/r6ggMboA/QyMAGWR9dBcxWiqJy8vXp7s/n1+fvjy9vWmv0Lc78IsXsLvH
O8gKevfp5dv768uXu8cvv728Pr//bmQIGsrOEzNvywDOEtMXYgAjljRmSbw3WcEZFbuY3sPeRRal
m0lzQAnZKCx54kaUH5uQ5TSSNwGJOzYkCpIHUTgWcj6N6DGgK06aJY1NrjK6O2DJPVN+frzmSO4V
dGqOyibxR4kjTptU2ZQVJ9vfxBmNVGtgmjLAmq8jOAFDNiRp2DRGB0tPLDMiu6jfzqLVQFZUZ9vB
RsEPFams2ju6hH01MfHV4MncRAHDnyKjpDoKAQvVZqaGzaX4IeTxA2vMyDUALCJmXRIK1El+AytS
Ys8QXM0q5jgthh/jzLoXtfz3+HqXPj99gYwPX7/+8U0rme7+Jr75+91nef8ajAyU1NTpdr9dBJMa
GPFQIHBwoHpEcDrAa7d16A5Jk6LKdVl6sV4u3eZIIMHIjHjmR9iHvhxU4su8vjjTBhCbKRqhk8mR
YFWvOXoNNvkKCtREWzSBWCDOQmorXd4UiFS+TK91sUaB2BAp1G46Sk7j9+tjijJ3P7juBh0ND8QR
mtg7k6WGTrY3+xhJeoitIIwhHQKYUo6gA4SCTqx8NVKLBeqd3HREAZPX8mKqFZPm2JRl1uvYeq0K
pT5QHo0gCo2m2+rXMG7wu7tkIXCQhCZAkkCwE/xbvZPqssRnRlJJDyOkbJ38wkxu6PzQ6WDt8NZC
6oUdHp7RoHwCG3ArNJ+GGOHsrLIkTgZH46I9hM7CJAOe7YeIx3xYJGFXNfg5JiPRECpEpiLOuKMy
cxPLYGDNGTudAAX25VICUTC3XFbiylXAiZVD4wKOegjJKrVvvD0a4EsrNtIkCKpLQ0ylxIG/Oz3e
QPFDE6MIk9qHP3CttI4d4ugjlJORgGleGRIffh42pzVAaSP+pG4qIIBE2b1t96SO+Ont+bdvVwjV
AtVJkyD+x/fvL6/vZriXOTLlYvHyq2jd8xdAP5HFzFCpbj1+foIY1xI9dh2S245lmQMcBXEiZkBq
ZGRHyVH4sPW9BCHpZfebNQ+OWPisDDOWfPv8/eX5m9tWCPwuQ1Kg1VsfDkW9/fn8/un3H1gD/Kqf
MBo36K1RPl2awQ62WUediVFQx+NFMqjWrN/Sv7aLmCm+i8+Uw4fu10+fHl8/3/36+vz5N9tz7gGe
+vEJjDdbf4+bMOz8xZ7IahhUzFHKjzF/nj/p2+6udG3xz8oh/JhkTqAkA6y9WY2s9Jcmr2wRtId1
OUgTaBOFMFHEQUZmNJY1DmGmICbPYL4whFj68iLW7uvY/PQqZ8Fy2epB0nsjhgStxoUulR99JUaf
xq9ksJJhPIbWowSC6VB5aJAejR/0XsZWG3s2ZxpGSvdx0FgFMrLsxXYF00jlmWxi0aHX+ryaXdDX
p0HdVyfOpAJcxttV33Z1AkEvsPnLu/uSGznFLbcMKCFQwq8qR3pJ403VBFR+8p4t7FN+QTquc1PK
Ag2u0UBfzhlkwQpZxhpmOsvXycEKPaR+S47ahXEzXoWGXb0JKM9NAbUvr76flhdFIVZJF1xygxWT
/kIQGEQu49RekYBM5Y0gYzyhZyGx/YewhKMIOSohyrYh7JyEDAkm5RDlEj038yOT/m5fHQCiP9EI
GXhwel1bkfNccUP8VaiIM0M9h8LcXfCrE5vU8n2SwBwyN2MIzup0xAzNlLhz2GoU1mUz66v4Idfr
8OwxOjJ/f3x9cy4zoA7qrXSBRkdT4A0/dTuVJCDLdPqtRSDWjcxeglBNPK37BsoWnsU/BQMDTsoq
4WTz+vjtTQUcvMse/217UYuawuwkjo9JC2VAAqJrEicEISv6X4MaDAmwKfw2ED3F8ogo8A/rNIYi
DaMADnkDjQp5TtQpx7esJj0a/NUh74w0kphcuXWQ/1yX+c/pl8c3wYL8/vzdYGXMuU0NBQAAPiRx
EjkHGcDFBul6sNUYUQJYpUjHGSdAh0EFR0sYFKdOZtjuPLtwB+vPYlc2FupnHgLzsZbKGKqEhr7v
TB6rNMqTjwXzgBmz9uhzwzL3MzEP9M4oaVwQ8oRgXWemVkkGj9+/g9VE/xjwj5dXRfX4CVIFOPNf
wmna9rYp3B5HyJvguKQaYB3qiOxDT1bimlCTBJSw0t+YGF4xJ9tNK3ptL1YWHSXQaV/CQ39ucKPT
brFq5yh4FPrgSE6YNgFJkTTvT19IdLZaLQ5E0jXoOKHFVDjyJV92WoYBvtRd4ZrUmGUI+Wyy9nqh
8MYCUQ9LT1/+8ROILo/P354+34ky9R2IiUSyxjxar4kcdAIN6W/nBzSPjpW/PPlrIjufJlntss0K
i68r5403/jqzFwnPxEDYoOoIIPuQaWKXDHJ/NGUDyUng1cH0hNdYwdFx7Wzt+bvJxeLDxaxv4fj5
7Z8/ld9+imCgJ9o/e6jK6LBEZ+72pCiVvZBx7G0OEOddWl4uRQIYFKhyFT9015o1+GdDwr6vdvt7
NOUSbNL4LdwqB2epWgfotdNtVBfb458/CzbhUcjTX2RH7/6hzsFRheCOp6woTiAE6+y+M+li+lhT
Y0npq0YKvl4vMZflgSJvWWSvSzWqlZ1NfUDMWMEY7ZL6GXu+JCYQa9U2dhpQOg/sIZ+wEfnz2ydk
JcEfgg9HWykWRHmca2LM+KmUqS6RVo5IxW2Y3o0/QCujsfyywObVJYZEVzeWwvhJGDZyH9AXhhCb
5Gp0RzCJIrF7fxP71dCpuTUJIqR/AgqKpmOQ53ZkEJxA8JEROiOaLHRNg/tILkgLh0cYOElkP7IK
buf/p/7278QddfdVBWhA+UpJZi/ue8Ehl5qHNOyAbhf8H+44l07JGijNUFbSB1cIZhOuuafiV/B9
50T2GIISQhFdZDiYbMIBm+QnJy1Rz+JXmvXUz3Aj728iCCM5h2ZieAhtOIdsAuiumZGW0bm+JEGY
hNrY11+4OAiLg/B+gDpk5ySkz1FZ8ozQJTM1WyJ6mZrVCJEStC6E0gUETsG6NVbwXAE8leEHC9Cf
BibMUoOI347PmICo6E5YRhM39ZEKk2unNOoBXx1AZ/uH9VBSoh8/690Gpgj5oGVfFQZ2ykQ6NEG7
2233G6xZgpfBvDt6dFHK/oxtKuwMXUU1GPZIS6Cpw3L1+vL+8unlixmPpajsZFQ6hp5lxK7D6hXn
LIMfSBt7ktTMeBsrwcHsJyPM6frv4bGDc2ALWbX0W5yR/4izLX0ZmZDdJ/2RUBleSZq8/LKb1i2D
4JVAN9vEuA5xY+1hmG7gebubab3FDRtA3W5vg+FGRnl84YDRBzeBKL6gSWaaQG46eCkfK1R2NlC2
5QTTV3WjZzW3Z0xxxZc8Md7I9CcA7Tnj6QjCJ4guCL5RwS3gUeLfFjwNQsECcRdqXc0S5ISSsFBB
fUgay6RiBMMLLRfn+nn+a7X8vmIYy87Igutv0GonoS96HsEc14FrnBoG8aTg4loWFw5fZpeFb0Zr
jtf+uu3iqjSOTgNom6OYCMuqJT7n+YM+40e9XJhDAH38mesYFA2hBmhYmsuFgQyzmN/90uerhWcY
ehRi9Djk9hanurRZNltxrDqWYXZmQRXz/W7hB6ZxCeOZv18slmPpCuIvDDWiHs5GYNZry2WgR4VH
b7vFROWeQFa+X7RWS/Nos1xjnnox9zY7S6sGbiHV8Yz7Kgs+pRHDINjPaqltFLCmKEl8fFC4di3o
CuQJTD4u92+7k5eZgaplGSvajsdpghlGQYDDrm64Zdl/ZJyJP07JA2Xd7uvbfTzdJESsPNGNoO58
b72YHDyCJQRd04T9V3BxAPory0ZnAK9x6xyFV3kaMeMfhc+DdrPbrpGS98uo3dAf7pdtuzJ8LjWY
xU232x+rxB4zjU0Sb7FYoeeD031j7MKtt5hsMZ0O56/Htzv27e399Q8I/fZ29/b74+vT57t3eAOA
cu6+gMDyWZw0z9/hn6bQ34CqFm3L/6Fc7Piyn+cCCJwgczpXlteo4tnzBOeUB2yXE5GPBoKmxSku
6pX6kqNiQxIdbT0CLPkgi0razWfYFYQkMuIdr5BjEAZF0AXYR2dwijS4xUsVFMxOy6VA8uUS3/Ka
YNLuXqNpXjhKfQmenFo3Ntl4Muh0XhrGFXXAYrHjmtoQSoDK/qWDJJqQ0axvPH0BDg4fXTrlfGW7
dINUyt6/ibX2z/+6e3/8/vRfd1H8k9grfzdiufa8mpUjKzrWCooJSMMnhpQ8fHBAiyGchmVPhnsN
O7yBQPwbrCrsp0GJycrDATdQlGgOXj7yRb5X7snRafqt+ObMmHyans6RDGuNgFXGLwzDIaUVAc9Y
KP6ybtPxE0yeGtDS7MvJVqyQdaWqw3W6Tp//wx7BawZ+PRZDIzE496hw8r11ktVMTVZ7CJeKjJ5y
IFrdIgqL1p+hCRN/BqmX6FJc9uI/uf3omo4VmWpPYEUZ+5YQ0HoCMT00PgCDqRn0MfC2K9zaTxEE
kdt+C82irWifwb4qADyrS6tG7eL2y9J3KepEJfyAlJo5/2UNKctHqxtNpERtFZMY4y8tsjzgp9F9
YqxH2j41zQNYhhbNZAUD4X5ujAXBfjVHkF9m5yC/nPOZtRZXIALgd4OqH7TE/GFulusoJwISqGNO
tM8n3tMEpyUviCK5Ur7uA82ULZvSzA9F1SxvEfg3CNgyn+kqBHxpqvuZ8T6n/BjN7kghnOPaCXU2
nCGOHsOdLFUbH2pcauixeP80x1NdyKNFKhfhZixrKqS0OOLTmabxYq7hcd4uvb03MzipMn8nmaz+
cprDEuGjFLIA249ZfOChGUgVZ1IF7kWZ55N7gn1kVZdUlYc/xo40HGz/omZuuTXJzMHAH/L1MtqJ
Uwi3KdXjMVP+vVxqoLScOaTvs6Cbm3TA37jwkpSIbqn6wXIhzcysm2i5X/81cz7BMOy3eBg4xWry
ajkzRtd46+2x90ZVvTR+c2e5yidXl0uwWxBRA9RGT+eHVanxZjiNY5JxVooySnyvWlzQnGWE6iX+
woUJA4b60dgOoHg4ltzS6AuQCrlhJoQQwN4JVWbEtFEykZEN0srtsb0A/FiVMTH6UgViW9LqwK2j
qfyfz++/C+y3n3ia3n17fH/+19PoTm8KxLK04Ii/LvU4NIqGRETJBR90ib0va3ZPd0IcR5G38Ykj
QA2NYMAmzbNpOMt8fG9ILOp4YoYD6jnO3BD68lgGyw9qCwQbYjGBeFPIlGi13liwUUVsQqUTzIOl
1p7kN5gq+7GHBq2YldrroYYmyjumkjAZVQAUcooRmxHQlXv8GTgwN/cNV7qyrMDiHFFUa+lEwrHV
FlbIR+mZY0l/IPTgnbfcr+7+lj6/Pl3F/3+fSvMpqxOIxmAVqGFdSa2qgUK0CD9VBwoq4uJIUPIH
9OCZ7cCwJMBNvin5UZud2z7QXZKf81KMf9gYIXZEk3RgDNsjcfKQURaxI4GPmlbQlqMY6NThTElF
yb3MHj2Tx4C4EWRE+oQyiAwiCO6Ja8IqEnVpKQwYJxHOfqHgIc8xzr8eKKOlIOKur8/YL/EvXmZ4
bc0Zb6CAdxc5aXXJeUd8fUkazJpGv48VzitRlpeEfHJk5DoWolGBblYITjuuSePEzWcWD2CpKOk6
FG6Ab0nAJgWNg/2mYpiRJB8DwjMTkOIi4uLsIfEsbrZbf42fBkAQ5GHAeRATdpdAchSX4UdiDmQd
xEUK3RN7118s6DjBxBUBKLH4Ssz0OoGUw5M0KZekEH3olpFtOptkS7QC7Wm2jNYEezoS7HCfsUtZ
U0JA81AdyxKLLGa0NIiDqkksnbEGgda9hoVxo4BDYh+MSeMtPSqhSP9RFkRg9BUdLcYtY5HYr7c+
bRKdTq5vb5RQcqV+P2j4rU7kwUczHZSFsgzWxc+dB2F2GlyxW8GGJ4QJPZlFHlEnqyi9aw/hrdaK
a6JomOV+Hty7yf2Q7+oI7yIs5dI5iDJqs2a40AIIahdlHjU9N9ZJWJdB7OylcIVvlTDK4WLCD2JQ
qaKIiFo6DTuUBb5roTCC6X4QIrnMGkp9SIUxHTsMdqZWfwtMN258MxqmmlcqFdR5+OjCzjm6HLTk
aJbXC5MNEeauR+PjNaDxiRvRFypgc98yVtd2vrWI7/Z/YQoZ6yseWb1xjwvkE5kyztpgh0QIqmw4
9vGetF0SEW4bMc4IGJXG9jEsebqzE/oe+cp9JIszH8/Ewc9F7Pr4T8sTTHGWWGYLYeLfbHvyUVsd
j4MsIV1RQdzfQtwSEP28czfotKT0/IE1/GzbQshzM80vH7zdjRPjUJYHN1aJRh3PwTVhKIrt/HXb
4ih4K7Y6hmsAExld0qEjWA52wDW0An4hEii11CfudTFiVmTtN1Z/zoBvLlPrteIDbq9lfBXUlySz
3bQueUzpqE6ECpmfHqhY1n1FopagKK01mmftqqMeELJ2PbGFMLH8OotOr7eHy14iJ77brfD7BlCE
L49CiRrx0Osn/lGUStkPuNM32Y5F5O8+bHA1qkC2/kpgcbQY7e0KdbiYLBpxSKK7KH+oLR0d/PYW
xBJIkyArblRXBI2ubDwwFQgXJPluufNvXBQQlb9mNnPJfWIBX9rDjQ0h/lmXRZnjp1Fht50Jvi/5
352Uu+V+gRyTQUtdT0XiT8LMul9XhMBqtvzCYpv5lErZGBenjQ/LE7Pbe+yow0uUVd44pXRayaQ4
sMKxCBTsfETEIn9IIKRCym6wylVS8ED8C5069Sxi1nifBUvqpfw+I3lMUWabFB2FviezS/QNOYPR
UW6xx/dRsIXAvk7UugmeDB52H4HRGZXqrc5vro86tsam3ixQp0LziwQENYuLCQhl0c5b7gkVCKCa
Et+t9c7b7G81ooCXanTGawjxX6MoHuSCsbKiH3C4k10JEfkySe7xIstMSN7if4un59RrEETng3Vw
Y0lzJs5x2/5g7y+W3q2vbOMjxvfELSFQ3v7GRPOcR8iRxfNo70VE6JukYhEVEwrK23seIYwBcnXr
0OdlBO7+La7I4Y2816whaHKpPL45vefCPpSq6iFPAvxyhyWU4Pq1CBITELq7gqGm6kYjHoqyElKp
bQccdW12cHb49NsmOZ4b68RWkBtf2V+wLqoEfwUJGDmRU6bJ0PD3RpkX+7oRP7v6yIi8X4CFeM0R
azAbXqPYK/voeCkpSHddUwtuIFiiQoBRuLKSNgvXdtNwtGaUw6OmCVpGH8GaJsvEfNycxJbVjv5E
7zlA+IQxRBrHhAkIq4hrRQZtDEHkwbmL44MTmXVkBSX7DNzvfr/OCed8IUZoYy4Tr6Nwccx/fogW
NsEaraISy1UVYYKDi+NnHuqUHBONPqCioMFnEpAnIZQSukRAV8kh4Gd8mgBfN9nOsYxH8PjJCnjg
7XcE5wJ48T/FTgL6yPH7FnCsOuKH5FVdRMavURudu3xAnO98D7ukrO+ao808HGeCPwIW7PLihyIQ
i08F/ALAJAq6+ckaV6pIDMlUC+ye/G5/6o7EwoiCOtt7W3xaxaebE36UBvV67eNKuCvLNj5hRiNK
9BZ4O69Rsdy0mDBmj39uS8ASQNS13UTrRUv4gZil4tpfQie7Ws7YB4Zgokidp4BM8YPUbM1EjRiw
Gl/8gOgi7B3DLG+iWGLV1afuHcD5FO6arfYb3KNF4Jb7FYm7shS7zt1m1twOvwN2PAF+Qh6TOicy
x1brFcS1od5Rq5rxHE13aDYH0TKJiyWpG8Jss0d2jdjdEBgQv19gIIhntPya7TB/WKtViZCInZMr
Fwt94eGJ7gH312IOR8VDEDh/DkeXuVjS33lrGrdZ0mVullR0su1+psy972G6E2tEMSWWOMMimbWG
U2rFkQIN2m7WUAeu5rxu/BZl66zPprKqvGMJE0mF2yKFCowMKGp5EkjyvU8E4tVYPosl3K8Bu/WX
wSyW0MaoTuyS2XpnsOIGn6kX+osvMcC2bUshrzvMy9qaLG5JI+Jnt0ffps2P7OCW0dXzby4KW+i5
Zp5P6HgBRXBbAkUxYteM8JY12/DxIQ4mrOfHWLQebwqgPK/GlNtmsfKtOSnsx7D7poAbc86TVAoZ
dfAQEZeBIhDX05po35g55EolN+j57rqIGZetJiTCWohszlU3Du6NzL4GVy8Fi2ufEkZ8aFqCXq9u
9VoEsT4wWpWDohbnZvQjWEfcpNoSn9bzggmbM2iGnGaE0h+ZAR4TqQYv09hF7Nv3P95JH8BJOhAJ
kKlDsIGWyDQVd2hu54FSGC6TKp6sSK4KkwdNzVqNGeJafnkUo46lAdMfgcGfCn6BwiHbwbklsVzI
qknRtb94C381T/Pwy3azs0k+lA8q+6AFTS5Ie5KLCqlqjDeV2EB9cEoewhLCWpvvUBompCic9TUI
qvXaPk4pIkyNOpI0pxBvwn3jLQg51aIhhB6DxveIZ6yBJtY5V+vNDmd9B8rsdCICXgwkbhYbnELm
CE1uFNVEwWZF+H2YRLuVd2Mq1Nq/0bd8tySEQYtmeYMmD9rtco2bn41ExDk/ElS1uG/maYrk2hDS
wUAD6XjhNrxRnVbL35i4MotTxo+dDE5+q8SmvAbXABcwR6pzcXNFsXtOWe2P3RTHGm4uMy6U3O+a
8hwdBWSesm1utikKKs8j2I+BKIzwe3ic5ObUVYJ1x+XN8Zgk7wFxQvKGRafxOOwhXVAEWXnAEEvL
g3uEx5hIb6AZ+llUhjWuhRxIDqmPSYQjvmZGfBgLLPYBWuvhzMT5kZfY29pAJGXxIGqQQeAsTq6Q
VrxGkE0eR0h7mHKmoRB2TiUX6S99BHkN6pqVWBvy4CDtNtDei0s+SsoaUwjZNGFgJiUbcZCPFO/6
lcXiB/LNx2NSHM8B2p44xG65cbKCPBEwpNDmXIcQczNtEWTABa/rIQjgC87EwmirAHsFNkY8O4lF
Ie5NrOSKw/c6vv208BHdoX4+I2FbR2gJ91fGZrdZylmwCV32pgGfamMdq9+SoRezHAWGL5GJYhWI
3qbzzYg8BoVgsLGQCAbRKRQ/0LK1on2CU4HkxDBHZb6adAOOX8XvGX0ZgeKQ4dvdygoFZ6O3uy2m
HJgQ7a1XtQmWSFKGEFqpDmy8cUZYiFowu54dKMrCg663y9uGbGJP0DXLLXqyWtRnwUyxNmK4K4BJ
Gp59b+Hh7MuEzse2tEkF2qaySDoWFbult6N6Y5KtFzh/adE/7KImDzzUCGJKePBM9zcb3zS8cmIN
IwQqgg7RFkmBK8emhKubla1u17b6geriYL9Y+9QugYeaitC1m3THIK/4EfdYMOmSxHmkNnGHIAsw
DdGUqE8ogU5W0kZLxyDURGsB/2aXDmUZs1vNOYq7P6moqo4PAij+XG0I9s4kZhkTW+WH6MRJfJOM
b/jDdoNz/VY3z8XHm7N2alLf87fEeCvWAsWU1MKSh3p3dR2xSUryCBQikuftFh6+VYRstHZSz1vo
nHse9u5hESVZGvAuZ9WKLIcf/M0SU4laVPIHtVhY3m7OWdfwW7cJK5KWlcRonLaej6OE8CYzSOED
lcRNlzbrdrHBv5b/riFO7AxecMEEFkIBLJfrFrpHNE/eO+RyiZvdtm3duxanFYI1qmk2iaRxQJlX
JbcCwdtrx1tud0u8ufC9Oouo+ZScTVCIw+YHmrLM54phhP/fpEGSB/4h0h/Z9kAX5xHMmUcep7J9
tYT8QHHiuOzfcKiGQfh9wfX1e4UiKxszDq2L/gAJZMjbUY4VGrhyQuWT15XU8T+AnTHKhU/nBoKN
rtYg2c2UKPf2j012wB9+ZNjlv1nje0t8uMTsyuu0JNH+YtHOsCOKYjWHXM8htziyzruG4yjOsiSI
KRx3M/da6Mbzl5iXg02Upw0nizjXqZCUlj/AXPF2t1mTt0ZT8c16sb11VH1Mmo3vE7P30YnKYTGB
ZcbCmnWXdE3wtXV5zDWLTpTP7rnlnmPVLYP2WIEztaKJoZdYnbPVxJlfAnERSqKsWLgKkpsJ3gCS
LpZTiLuoJdyPdchLl97zJhDfhSwXE8hq0pV0ifkMKtR65RawXvcPDcfH188ySSH7ubxzAwXaPUFi
tjsU8mfHdouV7wLFn3YwdwWOmp0fbb2FS14FNTwrWHF4JTxiFcf2kUKLhSfQlu2uhNcB9uipcNpj
WH1nV8b9XOXYtT+oI4w6qGTdQwf1k93wSuP0XD0hmMWc1WiOOfCCPLEj4veQruDr9Q6BZ9bCGMBJ
fvYWJ5wpH4jSfOe+y+rnTGyNDFE5sIdB9Uj6++Pr46d3yNTqRq9umgfLuhdjVc4Fa/e7rmoejNNY
GXyRQB1O3V8P8dSzWAZqPUMI+GDIe8OfXp8fv0yTbWjNTxLUGYhQ9gwLxM5fL9zFpcFdnFQ1uIIm
8Uz2NvMDJ9K/ifI26/Ui6C6BAFGvFCZ9CmpiTD9tEkUqrAbZ/hwNyGk22ExNbiKSNqhxTMTtZd/D
i1p6o/BfVhi2FpPI8mQgQdubtE1SxKi/jEkW8CoRU3KBsvA2xldxalAovPl14+92Lf5NVpkv2iYm
Z/EEAQk4xkhRKrT+y7efgF70SK5SGd12GnZXfS/E0KW3WLgH5YBBY5gpAhiRzJJCHISxYgiCYRo9
h8Lm2gzgzCr8wDHrBY3kLGUX7CuF6IulC8ggfsI9UoBC3C6AR1HRVpNOKTA5VEKE2TAOIqQdWMpF
0xg7PPYE6+j5NV5snzCp42CuQ2GUb5btdBVrONklfV9+aIKD3lRu7Q7F7bHVH6B71MDBmoaranps
mERhcI5rcQ7/4nlr3wzyitAiLXPJwWfR9ZyzKbR3RsU7Yjxsgh+pVLAYc+iaiLKl0SkXy7qab7Sk
YUWaJa1stbv+IvCQkomq2YEJjt5ME9Uvwsq2PTHAeB+HxHvW7eueaFFTZ33eNhtVqODYsbJ50bi8
bANlWZ2ZzJMEy+CszFIGQoRsaStyQH0au2OcGZqiwVygaYwHxaI7cCuwX1F+LCk3ZEiv06B+SbpX
YEAU2jEuDIwcDfG9G2Fk5KRUmOGTIWkNsE7Fux64IQm1rcCyamZ7VpUyXrLs6oBrJ79gVc7gXS7O
zLdZCYV7TmautAzFJEbGo5cWGVSRyhNIPYeDFOyUbQaXVwBxL0zquQZNdIxL7MFQtaO8JnWZplbh
4Uzdx6uQLIq4zBEQnMHAz+eJkfpnxPa+ABOEE31oRITBCnXdHCkOSRljrXO96UwEGVJ0JIrEGkRf
WUeSFjx/ajs8UVVBcCdcg8jL4sHWYmjHLhmS9BMiOUw3MGF+BAbWeVB0qwVqwzuiVzbXFNX+Cn8F
YRXE8ANLRfQ4Ixs9HEXX4GLmbIh22+XmL3XEjWeKEFM0ZKhYLLw8QU06L1bKVUGn5cRx9irUZ1vs
zEN0TMBsAVanpRGMxP8VofBNssjNQTcgxe2WPYSEw5pEOn4/w8hNJcRBS6G3UH3m4r6szob+wsRA
bH6Q62RPlN2kHyHmqfaDJUSPBZiQ0+rkgMfQArQU2yHPonWQCMRMqmaJPorvkgtRai5tTVVqpz++
vD9///L0lxgBaLhMZ4u1XvADoVIYiLKzLCkO5gGoCp2kOh3h4k+6MV3WRKul+f7SI6oo2K9X3rQm
hfjLUsBplBjQmaryrI2qTJ1vfbaRuTGwyz8mGUT4B2GeqIPn6iIdlkLw5beX1+f337++OeOZHcqQ
NXafAVhFqd1fBVQ2Q73Kwy54qGxQk4R/vBnTqE+2O9E4Af/95e3dyK+LJYBW1TJvvSS8uHr8BreD
GPDtDD6Pt0RuaI2GmHdz+C4nmFDAs4kqyURSKVIUMqd3VsVYiz2bql3XdNfIXZOF1FPTDVWRTcQe
wR/m5aJifL3e01Mh8Jsl4aen0PsNcbEI9IUIYqlxjhGEXCZwfk11V7KuKGe9GkGehP9+e3/6ever
WHd9fvK/fRUL8Mu/756+/vr0+fPT57ufNdVPL99+gsTlf7eLjMSOcq4qAMcJZ4dC5g9wNesOmmfB
BeUUbbJBC0KXRLncAlly8Bco8wi4PLn4brmujbeBKqWxsbuSxCGAJo22iVp6NusTGlBJrZEcng2t
ER6iCai0Z3+Ja/KbkJoE6md1kjx+fvz+bp0g5rCxEjx6zvbNJye08jcevZp1XlK6F2VYNun548eu
FCw20Z8mKLng53O7Rw0rZC44t0UXBilsSydEsux2+f67uhd0n42VbPGE0V9C0u/wEIhQRcqZe4Kj
p7U1Kc05tDsgl7J9PUiQztuGEMuUepB/d7qsIYMMGYNsJIH75wbJhPcyejnp2NJYZlFccIBAJhtH
LIyvBgJn4S/RLZKcAaMlaIhg+aZdIhikqrwKFki3zIYl+aDIFydh/vgG22CM5T/1l5HJrqTax1Bi
DLBeNTd2bUTFKZZRWBK0KomWikZllytYizAonK6E5wYEyOzBrUpH88RHecSDX16Mv/2qwesPSmdQ
rzrTmlWmgJIpVRTazR9nYFMrlxsk7G6rDjRJkxl1JRqAZfl20WUZldlbKaZCuxwATgrXmlvOIxte
qqPGrVeczZQjJqAh4BMYehLN4pG3Exf9wrfr0nppazTy1g4VBrBGMJEZS1NQJ5JNaMFXnqh/uA4M
2MeH4j6vusO99VgtF6dMzTBuEYPJnr4kQJNHoQTo+5TSem85O0n876iF5GwMaQzwVONyFLJk47cL
ZwjtU3UASREVg6uQu6CEauoyszuuI3zYw59je+bIjeV0lIneRnFPPY1zZnDqbz0rL8FfniHh5Tgu
R5l/xXwGqypLpSd+TgOUaFzRVJpcyQoV7yswZssqSawliBh4klI8up4MKvkGimr3BpJpqvURp/fw
0LTfnr49vT6+v7xOhZymEg1/+fTP6SITqM5b73ad1CMMXM23x1+/PN3pUEHgxlkkzbWsTzJ6FHSO
N0FeQdKF9xfR9Kc7wQ8Ixufz8/vzC3BDsra3/0/VA7vN6JONO10MFYqDY3Gz86vl0lzkUxLCN8oh
vOTXHyEriYzQ00E1imAF6IeRuYVJs05RDehScaFCFhVxxuaCLVl7Q6K8MnW07lLhYOeR70th9b2O
1NDzC5ITQb5XmRNtWOSkoh+A3QVTcEq0tM9jkVOSdFRcjAqVp68vr/+++/r4/buQbCSLP+GO5Xfb
VdvKG85Q9VeDLYgLzOOqcWBIBG4Jj69BhQe9kmh4Kad6mDbw18K0hTF7jkpIiqAmhBmJPWbX2Gm8
DGZ5iRxoHu42fGuZVakZDPJgHftisZUhFntOEfXvszawbJ1KxHKIymJSx6XdrddU2e7V109Kl2qr
5l6VRM++Op7E5vlJY8GSxVkfdou8xQqEqG61w4TXgYQBjbdxeqkx4mOn1enWA8MBm1qNfu5AWbPb
uoMXHZee535+ZQVkpnFqunJvE4n6Dalntv+DzkBCn/76Lk7j6b7RTuOTJajhcC7Qiz+IC4y7UmMg
+NHM7YPa3YtJbRLuY8K0MqoC9eTSHSYN1RntJ5itu+2qKN2tt+6yayoW+Ttv4UqTzqip0yiNb4ym
TG8STPoXxmKZeOR+kGh/N9lEYSy64eXXCz0FyuuGxmfVcm+H23LHfbvxF5OaFWKNvbdIfB2tm/Vu
ORlLvlnvNu4QX4+MQ9b4qDQZa4WSJvYuvQCurQlBBl4rYdl0Qpw1OqP4VIPcUCFb1EhkHStxDl+v
qlkk6w+UWaJEURE53NSIx9HSJ6KkqrOkjIMLOCATb1qTkRqEgxsjKK5Wb4MpafuVAhk/3c2pdro3
3enRcrkj4iyp0WC85OSV2tbghLc0LwmkByqQCA9v9QzXUw0lIyXIIi7Pr+9/CF51hh0JDoc6OQSN
aR+s+i84w3Nlrm20tP6bqzWCVw9kpIlOzfvpz2et9hrFO/MjpXORASdKIjrRQBRzf4WGALZJdpan
n4nzrjgTPdIQzM1IwA+Wcg/pn9lv/uXxX6YtqihHi5sQyG4c/wHOlb7JBUO3TAcDG7EjERBOLAZB
maDwDM8f+9ONM4YjyseObJNiJ1qKl7pcUAiPaOBy6SwyE9VFNRpV0aLa4VWuFy1e5Xb3P4xdS3fb
uJL+K971ZuYMCb7ARS8okpLYJiWGpGQ5Gx3ftPu0z4nj3MS505lfP1UAH3gUqCy6211fqfAGCmA9
PBdgTvilxaVHBhbUWPxE3Rr0CTLfDNEoRGYPV66LC/Ga9UHCGI2Z32RNDP8cXGHZVeZ6yFkaUYbv
KlczxAELXAViHsIaN5mbpf1qraQ2f6NSkokwrulK/H4Pe1yhPqBJbh1brKnQIEIFnWX3p7atH+2u
kPSVWLFtkUlW+tAZL2NZkV83GT7oUpZdcJzxlEVSjjLZhfpyxcV/ai2yZP6pUtHoWqfi49osdrF5
2WMW0E6o4Z7D+XasLVzoB56GEf2damLKH5hHKqATAy6+WNk6VLq6WjW676Azm36s29yW3m96qtlA
pr8/iNwabnwSu/nAkgsZ8XaupvRWt6qJXsCJtCSiEddvmKrGTu2AKwcMn/7qNGFV36I8yqJp5BCT
TvVImoC65QlLbLr+WrOIEZ2mfCWaxAxBHPlU3dCCxI8Z9Q6lVM4PoySxxRblUObDcWSJo5iqkrxe
2AiMXOhHF1uqAFKPBlhE9AYCSRCRv4hcZURcT8iiQqlDb1V5XA7688xuNkFIRQuZGKQvH9VQgTA/
safmLjvtSnmihNp4zgyj1evKguiGyKMnajfA7kJtHRPDKe99T/2OMndIkaap6qu2f2jUkDvif0EL
L0zS+DFVPkhKHwqZv5tw8EEnvB4jowR+qFo0z/TQ1xwnNYTytF8YGgyaQv8WIapPdI6YqhACqQMI
fBrw1YWmACkzjB5naID+cCTcUHhCn1L1dQ5HDwAU0357CkfirF2Y0CYLM89+uFV/UNNuceRJzKgX
6JnjUl232UH59GQJueeYDnK1nHvfu8mzzRo/2q8oInOVQJ0p+8blLjC1bOPMpzKzoJ/UWtuHS0tM
txz+lVXdNW+7I9UfE946Qp9MfCLkqtktJk8vH58sMhw+RNWKsq5hB22oaskD3Rklc2KrontMVLxS
J3zR9aKtXbp46mXbHYVEQRL1VLXG2A+OQHazgD7fN4UteFdHPu8bEmAeCYASl5FkRlDFC7Yez23C
9tU+9oO13aHaNFlJVAHobXmhZFb49eLBFTx+GaKINPRWJqCYV0TJ2gv7RP0jDxlVG1iKnc/I3EIT
S10dStCdbJn1Md+DVpV1BCSO4cgFEBUcAT00jQnqFgEqmJJ7rITWNmih5EXEMkOA+ZFDasjYLanM
0fyQxa66AkTfcuaFhOF5HO+4Kg+jlCuVIfZionYC8YljWQAxJ9c2QOmN4gIfnxIoqYAExN4HSExu
fgIIUkdF4tiRrFLjIR/0NY6UmJ+ysilV2bwNPKqyQ26Eq5iBtmcBvzXW5WHL/E2T27uFydklsBEG
VEmw45I3wHnSNTH5O7RmWv1ZEhCTu0no9dKQoQEVmFPCONHXGOaXpDoKJhMWLDA1nEAl5ipQHR2V
RiygLrAaR0jtMAIglqF0pSGqhkAoAodZ9TgMuXzqrXrXU9jMmg+wlqm3VZUjoccSoIR766vs0OZN
4rJJm3g+XobrfZfdl4e1jVR8rkyVzmuFL4TdMzQZbw0sdlxAWEL0/aasr+22pJq+abNr17tyyy5a
THsN6DDGim5wzbdbR86yWZdr+5R52ZqWVh369tRdq7ZvicZXXRAx+uoGUOyt3gmAg3sxcZesuraP
Qo+Yz1VfxxwUPXqZsMiL4/Ujk6XkRiCB5Z1XdymdmQLusP9WT6ooICPkGUcj0Wx5AnpkbwLGvGRV
TZQslJ4hzxVOn8ZBGIb08chjTh/HLeOO8PcKS3rj3tlWTRiwdTFtEydxOKzvNe2lBI1ifcV8iML+
D9/j2fqu0g9tUeTxWi/DuRp6IaVqABIFcUIqDqe8SGmvSpWDecRAXIq29BmpWH+s41uX0/ahwYvH
eqs3Q0/aRk/4fvCJuQNkSiMBcvAPVVsAwn/Wi8nJuU+4EZn7WFOCkkdoVCVcC0OPOM4BYL4DiPEJ
n2hY0+dh0qwg1KEusU2QkntWPwx94kh/s0hoYkfGMkUF8xkvuCMTwsLWJ5ytP8UBR0I/REHH8PX9
/JAxj9DskX6h76mHLGCrMoc8IXbKYd/kEbFWhqb1PWppIp0YbEEnzgOgh/Q+jMh6hZs28kk1DnOt
5u3p5gMW8MU8pkMKjRwDZiMiyxg4C9an0wMPkiSgjKlVDu4XlHyEUn/tsUtwMOKJRQBkxwhkfYID
Sw0HmDOgk8oVOzJZKFwxS/bbX2Aq95Sf1swjbarslk5mVdZsHzC0t+9d5xvX769rjonz0kO3a+OL
6IwN954eBRs19ExL+jeSMJ8R+v8TTZo4+iEbKoxFr8ZxHLGyKbtdecB4YeMHaXwnzB6vTf+7ZzIf
t7aAh64SceKvQ1e1RAFFuc1O9XDdHc9QkbK9PlR9SbVDZdziE2m/zxzuYNRPRA5TkSFhpSd02XZl
zUoSMDoyXXVvJhVeqqF9B2tPExfZoKI8b7vyA8VjjRfqspUajG2CdPvtyThxnjozgm+9MVPoY4al
9+fP6E/w7VULBTfXUU50MUvyOiMfpkG5nGtzFl8xl1oi1t7jF/umVco2xPfH/FoMPdURy5IC1iD0
Ljcqiyx0p4/2LauyzIpt4NaJeV1Wh3Hsonz/C1xDjoETjnVlbmxzIEFqPKbeVO0uiM5ciezSYzzk
Y99XGyPqGJmMdpM3mcqukJcJJZgwI6qw2KS5Z5wiw6gbZJlxjuDvt3XWa8G7VX5M6X7NG+rNS2Mz
zJAkZprALDEp/vrx5RN62NhZtqfFti0sv29BAx03oHRcBCfLE/NH+GWOzPc8gUzz3hazUhick4/x
4kfZwHjikVWUqSnQW9EITmPx7Ou8yM2fQ9dFqUc+FQp4ssG2ir20zHMHEkeWBgOZ0HY5os24j5Eu
5DOqmqigxPErl+Y5qdCNuCgz4hpAuZFSP3FEohhhV7ZyAdcH+jaL4C4bSnQH66870oNN9FruBxc1
gJ5C1D+DqIARqllALYvJjCEI7qsYNGbR02r74bJ3bbO+yqlHQgShnCngiSJN7ogfTll3TwYjmJnr
FkQ4TMYRc0bSmA8XMzcXyYC7/YMaf0BH8z2iP90obsrGFJNMIhjmK02XrmWvVM8IuCWdxhemthH1
piW0DeWDKnCRis381R/Z4SNspEdXlmHkuYeTvKZuDQhy3jZcfflYiJFZmCDHZGxOuQ+YtlIjVTpf
/LSpelTahc5pP4KFIXWvW8HAHbnXRwaeetRngxllEVEvnqZ0SqAFpx8ABD7EAfmyNYFpYnTQ9HFI
rUn5UQQxom+w4hwzUQVb3ADMxh2GS+ne3rtyoNznEJoN/9RjbqQ5bRRmBufuIUpdcQQR+BByMqyc
BEcrL5Vm+vII4j33uDnNu0M0xI7HHMT7MndHwBAMVZjEF4tH5WgiNQXLTDJsGwX9/pHDsmJmLfuh
aZ3ipbeiJkfLKZIVuY5KByqzDLTAJDNXjwLr5mT+pM3qJqNCSKNdn+9Fev4PYQXoeD2mwv1rRUkG
Tn1zWODU2Hhm80JjDWBroLXBSnGSI3K8BirCnT22OI7ZP0sd3aAwsFU1bGaiY22MLLDXB5rzwfBQ
h17guWc0MMReaDMocjFXeBIYoYLFBGqCKLCmFR3lV2fJg4inK4PxobmsnBIuv1xRp9moRZsYi1Oj
TdRjGauApaLmfZjULDSH+KGJfMdH1QkmbRQliEePXoygcbsUHpLfOUZQOiGaP0EjfjqjhMJgNXR8
ZyNolH4u6kv7/YktVyTWQP9Qx1dllQmuAK4Vtshh9rYuMbjnXJoT9bIod1XUDX1is926K/aQF2ng
CMIpr2U5i+1LlMLxAXN2CUVMq3Yn/LjataWnPWtqXuVrF+JJAvnJdSY6A38sHNvqglHqj/WQqbEd
FwaM1HqScZn7U6O+oS48+BYnnuIWLrI6oH/uuCMmncaFHXmDCy/13LGV61ym04nNVERByqnGj/d5
qs3j+8ArVSrhR+3icnzCVbkI52p7oKeshiSi3501zCc/x2gszCc7QCA+LXibHaIgIndwg4mrTjsL
pgf+W+jyOkz9QiLnKPDoMan6Og289RqhfQRL/IySDydhrPr2K4h9Hikg6GWJT/4MEcfACM+ZW+tE
KDPrDarlMewoBMA4oc/ghWu6FP4CW0SqchrPdJOkJbh8+TUmHocp1Z8Cih2jjyBPqccSnQdvjg7Z
Kb2+BJQEzmLhLstu9rG0vv4FLk6ayqo8rQ996NiXmjYK/Rtj1HIe0f0LiBozQUU+JCkj1zHejH1y
vdouozoWUSqCweKY2PI6fqM3MfhGeGO2UddjBd3yy81jqt2ePpY+qdMpTGfYBmNylxUQd8xqAZJe
8ArPQ0PJ7bK+BR2+exQx4tQEyiKEHdng8QZ+o8XiSr5aJbz6e+SksL27VCz241vdDUwsvHXwdkNz
Jp/wFxbq0q6g9Q5uAzcGddFEbQiEezF5zADEWXhxlItgQn10WXjQjsqHpUUJV67wJMbQptWBRZgy
j2jLdMunp8x0h79V5TjyA3J7VbwJXeKN8Pk0E25dtHjrQq3ovo4gZwuHacSgI+r1qsvtVIAYxJR+
C6wrMpxBh6FX82MB6rYqqOquh3KGqFd3sXgnBuVFHenxTH/VRP5xviESkykov1WA7PB4VEpTpaJB
QEvJVZkauErcb4r14i9NS5ZeSddMG+jyprH7QPTpucrLXqNlQwWj2RzVPFUgozyURoP21SXaF9Sx
PNbF4BfVo/MCypabkYrhJ5gTy5GkvurcWdhwXpzOx0EPfIY9UWKmIkodwhEaujJrPmat1nljtK+r
TFqs1G137Nr6tMNa64VUu1N2oG5egA0D8KuSoMenQJ5G42XYO3frZc4aJ1pRswdKu2yOl2txLrTR
HY5Ktp28nJfsSGlKjNmO9E5/IJnpGOWBTpgjeUbcFDmSYSRrLerwhG6K7izyD/RlXebD73PYwT9f
nqangfefX9XwMmOdsgajCTuKheGpj7vrcFYYjEZhFqYBE3udb7atyzA4lKuFReeCpviCLlyEnlAr
OIfds1o//fBcFSVuQGdr7I7CgbZeEnecX/58fgvrly8//rl7+4pvLUonSjnnsFaO04WmvyoqdByw
EgZMT5EmGbLivBIERPLIR5mmOghF7bArqfd4UVJTNgwjk5jpkhATBhzXGiTl8JdTxPbhoGXvEcQM
s92onU11kzIHlcQSVieaPQ+7z4cTjqnsHxkh7fPz0/dnrJ8YzL+f3kXE1WcRp/VPu5Du+d8/nr+/
32Xyqby8tLALNOUBpqqQp00RonLq8pltTARxjOF999fL5/fnb1D203foss/Pn97x7/e737YCuHtV
f/ybahIl24spq4kVY3ChHY97XckVlRVZO8gTX6PjVypP07tEmYJK7boi3v/4E0uQbnQ7CfJpZX9Z
sW6eqTifOmVQftNxT9GPRPL1fqMpIbJ6cImuxF+0Wi+bAFoFdQIqqKJeYln3ZXkozTZ3GR75Byrs
l6hylqqm7VL4UGZREodmp47k62XQrUnHGmVZkngxFeli+vk25jEzpcoPNUsVxH6xOW2ZcVItdGLz
EnTYNY6qGemCFI1crdWOlNdkdX2k972h3WkbXlgvU0VahNEWyMg472Q238iFR4gpTtu25ElhI7KC
VZMb/Qb/PqupURUiHuY0ALMRd9v+9zi0CmCay/9ERn3T+Oqnn2BqJFRJevry6eXz56dvPwkLOHly
D0MmgtBKk9JOxAKVvHdPP97f/nvesv718+63DCiSYEv+zTztUHMTRkrSDvTHny9vcMh+esPAgv91
9/Xb26fn798xCDeGzX59+ccwCJVChnN2KsjweSNeZEmo3vhmcsr1UCEjUGZx6Ef0x1OFhbzWS7zp
2yBUDWUkOe+DQHVimKhREEbmDEBqHbCMqF99DpiXVTkLKOtOyXQqMj8Ima0TwF0xSaiX3AUOUvtn
55YlfdNSm71kEBe0zbC9ApN6mP/aoIpR7Yp+ZjRnCmxi8RSUd5SssS/6lVMEaEMYx8LsaEkOSO0p
CTn9Mr5wxGS8qgXnoaXPjWRq3W8Grnrcz8QotucBkEkfSone957PElNUU/MY6hxbAB4Svu/ZvSCB
tV4Q7/6Jw4hqWqJt5JNPJwoeWesFyIkWRWkkPzDuhRbzQ5p65nElqTFF9a2ZcG4vAWMWGXbhlPFY
U+LF3H3Spra9MYmuc9ikjIv8wiLYg8gN25jMStnPX5xrJPF1h3AF4O5FL5ZAQmyFElj/YRBanS7I
qWNJRaQZ9ISnAU83lrx7ztWXr3EQ9z1nY+Rsrc/m/lH67OUVNp7/PL8+f3m/wwxgVued2iIOvUD9
IKcCPLDLsWUux9j/SJZPb8AD2x1+VieLxX0tidi+t/ZMpwQZpLjo7t5/fIEj2BCLmgv6F/ujx/4U
EtjglwrAy/dPz3BCf3l+w6x9z5+/2vLmvk4CNe7euDQilqTEvKGNF8YWDyJnUuEx7YLtropcWE+v
z9+eQNoXODqUlKn6PGmH6oCX/Nqs6L6KRNA9s57NhZEfEBbYtzYaQU3NEpAacbqIxH1EIJxaGx9Q
Az8l+hXoZHiJBY4iuw7Hs8cyh8nYxMHi0K3PIBxZTUYqJ0Zf0N2bBsAJpXcdz9F6HQCOzJ4SVGLL
E3T3yB7PsRZrcflRYg2GoJIFpwQ1YZFvy00SdiGocUiUlpB1SLDPLAmcU9Ma6Q5zlYkhXe/q1DC3
nulJQBtmTQx+wMmvqeMJ28cxC61dZEgbTw+MrgABbQm3cPgrBwrgrfHJZQYGj4z+sOC+b10agHz2
fFre2aiqhfu+b6ldnRd4bR5YA344Hg+eT0JN1Bzr3q5CV2R5w9ZWueRwN7r7IwoP1uzto/s4s45F
QSWOeKCHZb5b03qAJdpktFfvqBfl5BOiwMqBl/ecUHKiPAmagNSl6NNDHCw10Chnw0khifhql2b3
SbCiIBUPaeJbEx6pMSeo3Euu57xRD0atfqKC289P3/92HoEFGmVYBzXa1sbEnouWRmFM9plezJwZ
wdASDHm73o9jRsqzfqy8QSCWyVSf3+03VQ013utPh+V5Pf/x/f3t9eX/nu+Gs1R2rLcMwY+pSNva
+tYisQEuzpypdxED5UwzEzdBNZuKLTfxnWjKeeIAxfOe65cC1E3UFbjpK3qb05gG5l0uThGAOowh
LDbqAdZgwghM7pJ82k9DYfow+J7vGJ5LzjzG6Y665JHnOUbukodOrLnU8MOop0uUaGJ/SJJoHoY9
9wJng1FRd/kIWJOH9hVQ2La556lnjIXpjiEmemvwxlowuoBy7EKHfFCOf2EOcS5iapFpjrWqnLLU
8xxLoq+YHzlXRDWkPulhqjJ1sOsPzhEPPL/b0mV/aPzCh84MnV0tODbQxpA+qohNTOxuw9vb5++Y
IhC25OfPb1/vvjz/791f396+vMMviV3TftcVPLtvT1//fvlEZl3MdpQ/2HmXXbNOSbM3EsTz9K49
9b/7sXIOANg/VEO+L7sj/Rml0JNLy0sz0JYjbbkJK2R5+H2Do/zuXz/++gtz4Jpn4HZzzZsCQ5Qu
tQXa4ThU20eVpE6ObdU1Ivc2DBLl+QgCRCqGc9kTX7exSPhnW9V1Jz+X60B+bB9BeGYBVZPtyk1d
6T/pH3taFgKkLARoWdtjV1a7w7U8wOzTTENEk4b9iDjaDP8hfwnFDHW5+lvRCu2TDxCLclt2XVlc
Va81oO/L/LTR24SmGXW12+vtwVwYwF232icXAIaqFq2H2/9uUga0ifL3lAebUPRwOKquM/NLL2jb
0DcQ/OHjpuyY57DMBIasoz8jINRXNXQg/cVWzI9+cIKwykjjWoBOOE+XrQuZkaCth1C1k8Uh2Om/
OLblwUoQj+MKW1dwcbjdoGDQAivaux/Qrjo7sSoxn0GVCVdyL0po5wWcFu4cTlhoBnopHVUNB2F4
9B1uERJ1QT393I1IdobF6EQr5zw7u3vuUB5hhVfOuXT/2NFbLWBB4fBGwiKPx+J4pKNQITzwmDkb
OnSg8rvnr/GRXF9RTqE57PiwfbvgXUnnw8GeHd1ktd5u+vy0pQ57XChFrU16DMS5uwxhpGqCWOaY
KcJYC6OzEi27KWFOHo5NaVQI848yMrAGrsJH2NnO5pITdxVHk/v/p+zJmhu3mfwrqjxsJVWbikiK
Er1beeAlETGvIUAd88JyxsrEFR9THqe+z9+vXzRAUjgacvZlPOpu4kajG+iDb8flxvyi2ni4CoYe
noIXJndf/np8+Prn2+K/FmWaTZZOVopjjpMWPqMdo9o9wJWr7XLpr3y2xIRJQVFRPwp2WzVZl4Cz
fRAuPylWVADlLPLG1yMZTOAAfX8FLMsaf1WZ3+x3O38V+DF2fQp4LPUswOOKBuub7W6Je1aMfeJr
73br7HRxjIJwo3e4YVXg+6HCmedTzxxiC3/LMj/UrGguOOlGizTkQqLZ6V/As2MXUurosHK1WJGm
QR2+C0r4LB7KPEPH8EJH4yLuMDvOC4mZH1OpPwO3kSXeAYFEw1gr43LxwbC/n93z8DFfB8vr7RY0
N47v2ygM8dxM88hcvAQsHOanfsE6Qyco9e9Df7kpMen/QpRka2+5wernUs4xrWsMxadcfYb6gM9M
3xdZpZkzls2uQTmapc1MJdCmr7XYFbTW1p7Mcs/lfYvFFaqZDv9xSczFurzesULDdvFBsSsrtLw9
/Nspo/do4UK/nb883D2Kii1rG6CPVyxPtUhYApqmvXCcQeZH4rv+qFcsQIOaiU5AxQ59MkoHIGq6
LLC0p9YXPVdCcDNoMWB5eUtwkUuiWdPypjkq5HpHktdW00Gf7E56J9OC8F8ng7ARyVjMMUybfofm
JS+EoVUal3omPfGN0Nsd36St7+kXKgLKR4YR8MROlqFDpBV0p5aL17gsCHi+sHZN3RGKHf1AkFfU
GqO81BOXSFiOxwCTyMbsc/75NselXsBume+4CpSrvUpIh+nQArtVU48KSNl0pOmpDi2akuW3Wj8E
xFgyWs17rlqUGRbKQtTD1lHQ6WuH91JsKXO8bk+uEe9TkVNeL+YQl3w167A9yQ+0qUlq9PbUySCP
GjFJY9UiWoCYtUd/ixP0WAQcO5C6iGu9jNu8plwbZmZ1ZWokWxTAPDMrLPO62WM2dQLJx2HkUwh0
yH5zIPiPtlUEvAmurmMAdn2VlHkbZ76F2t2slhKoHg7kUOR5Sd1MRWhPFV9qxlBXfPo6c4yq+DQF
JFSgwo9l11gbrCJp19Bmi11ZCnxT8+MjN7hU1ZeMTAtQgdeMmICO7HRQ08H+0Ipr4xoiRvL9pBxe
CtBiFVzB58NRM3P7tzmLy1ONySICzRkuP7f19oxA41pNxczygHMDT5QgFFytGhYrddWTOo8xLt2D
T0At4+XqH5fxSUTTdVwTCJqOcAnYie5A3UMVU4Ft0jRm+pjxI8qaRMpVjb7eme2jeUUMnysdz49A
R80i3xkEEjYqYnlcmeuYA/kW4tIK6gEiKPq6LU1u3VXEYHPg2xtToig2M8hahlLlHeTO1Aeoijv2
W3MSNV5iKStQqzB+7jZ6IZw1Uz4C5oiygrNG15nIiq6nTKbdvpSmQq2KexADh5YG5pj2/vZz3rnY
6CHmJ7NxnBCiuwEC8Ej4XtVBUKo+FxPEYI6C+JRxcfDK6pYRqoeix+yJhcBXtsa0V1z88X1PfanG
hNs57TwqaoOfgyVutypgpJDeVVoWerVAaZjup3gt4B0iRWLdR2qCN9ihcUEOu6bJyFHVYsyqzI9m
59uRHqOFnjVFSvTrdL3n1mMDAPmaqRqDEByvxDmhQfuyJUOii++yhLp2ZZwHPFfn+Fkd06FI9anQ
i5dxfLWS47rmh0qaD3V+mDxdLa1LN/WDubTcuISDzhgHHG77CWVmVVteA6kJE7zX4FkaYXaqYwjh
KVzc3GQNw4IXjRjO/5usT1mJNATQGaEiXHp+5OyhjkvHVhqnioq5EmliaWJPsPC97DnrrjMZtv1X
X0XLyb9srJfvb4v04nWWmWqlmPH15rhcivk01sIRlmCBHrqAzke07s8koB28ifF+Dsxov8AyBmuA
cq0tQ7CwdOwSt7REoIV6N6ehm2Pve8uitdapSCTtrY82Ystni39jd0mk1/E9G9FMI/COQfVg1joG
uU8Uu/L6iPde4NutoGXkedj8zQjeZ9d+ljQp1Yvsoni9Dm82WKlQHsTPdu4WIBAeUGZ++nldyuvl
Rfp49x21rxIrPcUOYcFbOvAz7/QWHzJrMJmeFFbmReYH6P8sRMdZ08FbzP35G7yRL16eFzSlZPH7
32+LpLwFDjXQbPF09z55ZN49fn9Z/H5ePJ/P9+f7/+WFnrWSivPjt8UfL6+Lp5fX8+Lh+Y8Xs08T
JTYm5Onu68PzV9t2S6zALNVi6woY6BZSGb5ASWtFd5DQ/dWVxQkgLrsx1fBZ7wi+KtFuB2LBWbKa
XvEqFZ0QCybrUnOVSQRv07UPd3G2yy2mK1AZxIrrmtIe7Pbx7o3P0tNi9/j3eVHevZ9fpxmuxOLk
S/vp5f6sudKKdUeaoalLTJ4WNR7SQN/uAJHj+o5VLbnxgmKSj/jU4h+ywFiVt2YwF0Zm0zX9jDuk
mOmpmKACjO3z2BICRvhwZfYvRFdmaaapqMGfZwypjg7M5X4Uw7J811kNB96+0S+h5g0Gg+xiNj2l
G/TJSOxaEdjBYq4COjXy6qfTxOAlxKRLQUC4XkTc3Qb82DI4v8TJO1VH8WkRrDCzOYXkUHAdsshj
c/9PeIi9APfMeZlf2cpTfS0/Q4+uxsibzaHCn9UVyrxqc5fQNZJsWUb40DbomOz5kdehGNLGnxzN
Q28I1EZxdiNkMqzcCTkw4ih+G3k+agau04TBEa1gJ56/HX06uLrUYzG3FYLb/ETbuB7aLEaLHvE4
rqQERzQJ4cs+xUeqShnXfgMfR8J1iaMzVUM3H+1TQRStlnjhx945f3W8rxz9bEs/UN0HFVTDyDoK
IxT3KY171074xM8n0NY+YBxt2kbHEC2dxtvciRjamCvGhmA6c6O86+ID6fh+phQv4lQljYvlMfLR
5hWmT7/FKRYJQeU7B8d4N61+F66iqprUOT6D8Fnq+O4I9xhD5WJxB0KLpKk/YMKU9t5y6ZpR9sHW
7ttsE22Xm8BVwvED9iOkrem5EI40XVt2nG15RUyrex3rCAsphPCsZz123ytbtaf5zrxs2DVMT3Em
wKaONB0E6WmTrgNTZElPIsWRo16SGVeCQnmDw2B841I7AO+XXAOHe1y1FgEfqi1XLGPK0iLuds65
J1zhTvY7S9hAU2EIxaOL6zTfk6QTEZFNGaU5xF1HHKmXxfe5U6DKC5ozqV1tyZH1nSVVEAp36Vss
rBegT/wT43jJP4sBPPr6FIH6zv/6oXdMzAkqKEnhP0GImrWoJKv1cmWsEVLfDnw+hIMCNW+wirih
/MwxuxUz2y4YtkD75/v3hy93j1KQtx/OheBeaHNfN60AH9OcYNGMhWYBwv5eyxQ9yZfBmFJSuW90
NEIrUKoqTzZs3NbGCI+4PWTaQN95zQLAMjg3FAMdjyOhk4MwVfAR7KixDnVfDUm/3YJ1ra+0dOb4
TU0xZUuMzvn14duf51c+Ppe7KH2GtrCWbM463cgYaojazA6Q+OWFDm2PMfjf6Cr03v4aYIF9lVK3
QCoubpz7FhK8onFxAZnwr2Vl+rqusjAM1u4e8sPO9ze++d0IhiA5zvYIGodnhRi85rZ3Hww7H/W0
UBbHkfCtbAk48rbMmjRdJ+2r6mReR+hbCl00OhtJuADVNlQ+iavLBi6PTBA/bMpEB06r14TmcPpY
3yOk26FJTG66HWq78hwB5XYT+4SaPGI7dDU/v0xgBTaA4+Y0cVuLWjM9kiCWVubEyf9u7Ut5mI/d
3f3X89vi2+sZgg68fD/fQzizPx6+/v16h1zQw4uTccqwwqyQg2TvXIcdeCHklcG27PGVy9Hqdl+n
IEZurTeOCwaqcFSuEMkZeHdgp2sKDe+en3HvMJA4zPPAcdWwm648XbcsGQSIRLfCDrYCpHa1ihRG
Bq79ba+Y3ZAlu9YuBqCyeS5hf6QZu2Yec8MhT9LYJerB0+l8cmr84eP1OJXDTm2usV0B4BugxWqV
yD7VFFv+a0jTnQEZ07fppYrcOdHRrq/IAkohhIyzUgqxSL21uDyZ9x17/3b+OZVJOL49nv99fv0l
Oyu/FvRfD29f/rRfNmWZVX8cWhKI4zUMfLtZQDCnk3Ny4/9vK8zmxxCq8Pnu7byoXu5RTxvZmqwd
4pKZ7wZYUxwlaouHCySju5m57AA1ZXKGVy5kTio9Y1p76Gj+iatLFXZQj1jLdxgy9JVNeouAxjfH
X6MJQyGuXh+rtxNAPIrI8n66Sn+h2S9A+fHbHnw8iZYKiGaF/jY7A82EgwiFyKB7naQt2RZNK8op
DgnVJCvRP7Kt4KEF/4IaGRJFNZzbNsWQ4u+1QJImG1cSLI7dizCwlbncVYoepFFHk3papPoU9bzn
ZM3X1FIfajCEBdvEnib6B+mnQn3kBFBBP1kj09CCJLErDySnqJhmClnlFST9xhgxvLmPxlEjRLw1
C18CDDZYWXcVnDg60qZssANJ0CUdKKE1aPjFAXS6eicuo2RUhRwxcBafxXWw9MOb2GhRTIM1pM19
0qEHf+kFBmmSVuvAj6yGC3iI3zrLnnXLpbfyPNQDBAjy0gv9ZaC5gguE8KlAgRq7vYBx/6YJv15h
GsSMvVFjxczQpRoBS0DHtBY6EHJNYM0a4S67D0GjJxSUNUOuv5U11gAO3Z1ow+XRbC0HhsfjZL5i
43zPHkoAoz41E3btWyVFoRo3dQIafiGXIUHdLma0loZHQKcUZyxm6s3BjNPj5giw9Ktxr4gsTj1/
RZcRHghANuaAMVyBuuTl0luTZFwxtMaHBeGNuWbGnDAGlKUxZFswoWUa3nhHc4XOOVqfrD0S/tsa
kYb5KO+VRc3ZTM0JA7enNap9CzShgbctA+/GbNyI8EWrDf4kXvN/f3x4/utH7ychfXS7ZDF6Kv39
fA+Cj23YtvjxYkf4k8HhErj8qqzGyzybzk6XRz6PxuhBrjOjKzVJN1FiLkoKhl4n1W5QzpXIumlZ
jF0YzQYB+puVOeVINk5Z7a4KPIeTgyxvZ9/oybgyED+RvbxyeVI/KvTvO/DGvLIrOhaFeu6zeXbZ
68PXr/bxM1peUasvk0kWI5UjV4RG1vCDr2iwyxONjCuVt86qKoaJRBpJkXNhMTGebTWK66bVGmna
Yu+EGknMNd49YSdzIY1oPVWa3tPRXE/wdjELD9/eIKL698WbnIrLhqrPbzLk+ajPLX6EGXu7e+Xq
3k/WIphnpotrSgyPY7SfIhGBc9jbuEYf8zWiOmeT0SleBviEOXfzPJwQmNg5dczhXg7P8JSShJTE
QUH4vzWXG2tsAeX8PBn4eQBGjzTtesVsU6Asq9KOpXDTpgP4mbBaR15kYwyBEkBFygXZEw6c3Fh/
eH37svxBJeBI1hSp/tUIdH9lXaUDsN5zwdjiAxyzeHjm6+yPuymuiPINVw23UN0Wu5uaCdquSc3a
BII30PEdJNAQKt3TxTIZmoJwuYlc5qF0ZOEbaeIkCT/njsADF6K8+XxzpWFxcoz0SP4zRmSZvFp6
RsHf/ErpQKCeHwp8bSQgHDHFqYpCNG7URMFFi/WNHlpIQTm8khUKkSNeX2SAmdJ5m2AapoF+Fz+h
CC09I1yog+aDYRyJ0Ox4I8mRE4RYI9p0G+FCsUaxXAd23wQmWAf2YAiM85MIQVQrj0X4pAjMcMjw
I2kiQ5Lz2jSfAh9NtTDtMjvd1gVjJ9uapvhabrmRhnIl7maJv7tMNFsu/QRourGpIr7V1DDTCjyM
8KbxL66u57zi6vMGKXIfLH1sOXO4lu1shkdGXLK55xnf4pHFSyEIn87EkGm/CbAlKzCY0q2xFaSR
Ao7uAsCsrm0CQbBxfYoniVP5jbdGp+dmgwbTu0zfCiYWZyqryJ42ydtQxsh3nu9d3ehV2m7UELTi
aPL52V9nYwrueeZA3LaPIWtkAh9bKxI+FAcjwZje0mvHglidNynKVSVOln51u3XHtZH3XDe4vdq3
tGoousAgsju+SvBA5SpBiHBSOOmicNjGFdEdynWCj47ZdXTtEOcEGz8KHcVvVh+Xv4nQCM1aKehS
8FdL7Hw3c0Ir8DXOZtitt2Exmr1z5hsRi9bY0ROxAGULgAmvDVxFq7WvZmS4nDSraInAuzZMl8iO
hkW7xJog74euNGG8JMJOWhl8xMJ8PtWfqnaSJl+efwZF7gOBErzK6xQzKplPL8b/p0XSvPAVEeQL
QYhkt8ggbaTBzBxUg8pAux+0cQqshDQyq+JLosT5wwvU9kqQCbWq2A4KCDmG8nqnBQUE2Jxtvojr
Oi+pjh29BRVIozlWwrV/B0bvO8M8Y/riMMRHAh8qLwlbCjbElaabyhcqwqFrPLR2Cy71DhOQtjw6
cdJ0Y1w9Q9bi7RSReQqofqh2leZocUHh/YO+GbmgRqg2aSMh/sRBuYaFDkhpVDvPb/r4cH5+0xaU
yCA3MPdQcLhpcDeVl/Rbxf9w/kKUCOZW2Ku1/MxYmRwyVM0+H6NNutoBZG6XmpGA5uUWGoxppiNJ
kWs+IipU6NB5hbRPoi3HrvHp1RiNqei4P16sK0cYWFPqcQCy1WrDpf75en+uesSg3YUkNWj+BVLB
rKaE6GalBfPWt3qObI73sWFq405Y6rcx39uXdoqfE/LXpQHuGpjyX0MdLN+2hiqnFEw93nWsiA06
4X74wRihISk549DWiorBJR6FQrzRod3TutUTLZBLL9KYYn7NgGkF881r0ulOEhyVQVo0icINuyBH
oJlhTMHRvEsbxxWFqDolmDuNRlPnDDVHhs+7nlKzo9WWH+mOD4q94mKk93SLhe7bbzmK8DXcC2sF
NV7/Vr36FHR1IyjV9gg4zukEqpLJMycQP4GUHHKXUpLmuOsNhjVja8K6hp9oaRnv8WydvFh9PUgI
vKzgxoD7rMV4/B7cvvhwMNWqbj96EWo0UPJlY0iYZsIvQVSzuZEwiJ5CR/d3sC2P09NsC/Hw5fXl
+8sfb4vi/dv59ef94qvIxGnH7JoiJ2q/5V2+Og4jvGekRINcSHQCWQdHJjanp7nekqmEXZefkl6b
zBE05BR7uOL8Ms80Ww0Jsc8IEy2v28VpQT5DCutf/eUqukLGdU2VcmlVWRGaXs2dONIRGv8TMtjr
/4isSglaoE4nbErNfItTN9lNpMYlH8G1+GptxAW9lJehfg8aHlwHrHIlipJdFVu4fXUbaY/fIzzy
wxAFDtQu5Fb+hav3J6vhLsGAsnhH9PAxbUdo5UN7HfpgGXk3Ps4TOJLX7/xu4wcJPq9dtPFcZUZe
FOWu+mjoul3ds/U6dCS0AZR2kyrv3Emz+P42ulvrWXfjL1/Oj+fXl6fzm3ZVEHMpx1v7S+0OawQ6
crQZRcnin+8eX76KQO0PXx/e7h7hkYvXb1a2iby1XtPGMuSeqrlWpFrphP794ef7h9fzlzeRNQyt
nm0Cs34Bgpsj/FVqxBu5vcxGftSEMZvXt7svnOwZEjB/OFCb1VrlxR9/LGV7UTv/I9H0/fntz/P3
B63om0i97xK/V2pVzjJkoIHz279eXv8SPX//z/n1vxfk6dv5XjQsRbsS3gSBWv4/LGFctm98GfMv
z69f3xdixcHiJqlaQb6JwpXaIwEYk6wawMnubl7LrvLlW9r5+8sj2Et8OF8+9XxvqRb90bdzXB1k
014WoAxtHOKaxMj8Biti47g97l9fHu51nbEwngyVlSyp7dKTJu7wELYly4ddVm38lSPYNulycMcc
baQR9r2jw7bdxaBOKHbmNeHKHOX6ygUGobe3mqIuIUO8qzx/vbodUNF2JEqy9TpYbVZmeSJG8WqZ
aLqbitrgHVdIwsCRPmEm2GRWtRDK2VOfpBR44C8d8BDpvsCgWc00AkWmV+CryAVfW/A2zfj+sUew
i6NITRQ3guk6g/R7FjmHe56PwPOWn4ShDS88b7lGOg5hwH30vlghgIcUq0QBX+PwwAymPmNCZ8B4
QcI2myDEzEYVguhmb40TI/VJ0/YneAl5PlcWfZ96aw9rJEcYzzQWRZvxbzdmChad6CBsPBqG5qIR
mgv4Y9R5zTTXi2rUfVxfiURZimEwwDJS/R9p19LkNpKj/0rFnGYitrdJiqKkwxwokpJokSKLSalk
XxjustquWFfJW4/Z8f76BTL5AJJgdXfsxS4BYGYymQ8kEvjgjcqQk2ju1YIZbbvjBa4bVZFLJ48u
wYn4sp3QTsx90nG7ZByjx7JCOqQM3KJEB6Xhm3acDoV0VGAVSmGtHZcE3NrvX6XxNonbQFCLyf2W
OiruiuOG3THXvY6s5AzjPZv7sHdkdPV/56kjhVQrU58ij5/TDA3I+PU2pO2bNMliHc7JvZN2ObpW
Y6kKId/ET32biQHQdxtyWjkvA5L4vjfBd5tmVKbNXU7O8PCjWefFhpy9j+Fd0klZRl2UVmjVusMp
GNZScwbJenc8xBgcm9F4iXPOW1Am4S2nnNOwyEct2KawuX6EbRroQrVhlFS7mLwHEpoeQeEnJ/Oi
wzweh9b0+tCpUXfrY11PGPtMmPo2F8+iiL7dZGFpMIaJ8gLkrm2y8Z99R3NsRjQ5STPAq8qiqTb7
NGNxaZvjh7RWx7Z+aUFvBWrEtiHfaFtCfxTRPqmbjYVIXRqQGbHN3Qs1u6KeBKEuJ75fHcHu6IyG
3TrH06o0zOIkLMN46NxO1dNYmNCGGO3rQ+jXLj3sUd6KCKNkY7PZhBE67qX86koQlF6CSR0PGuaD
x3RwEbOZTNZjOhK+RSb3eC+diX0qDiI9P8f3NWqf4V+gJ0pmLiOjnRJV6WnA6Z+cp7HHTwlHJG7v
xg614zhec5rMZGDk8uSQFdLuYdhFuK+rMCVWc0M/rWs2RnOVTg95ZPLFpnDnTQK7L9nkgCZMpzIy
t5CwUJdHqZNa/F9hvnecW1dSb/WnbiOJyNBsQ4vW9dAWi7XjQ7ylstfTZUd5yeznqPiE2XQnZdvR
tCrDQ6gx0TtO31kIXyy9MpCxaqxK2kPNHdciGMG6IuZvHVbTrUMXGR3eBN8fJA91GlLP+Tw7U7xJ
eyyW8npruNWEyb6dIgheDJRDEr0ntj7XdxHsJ9BXdS55bBuxaFfHGFqHgYnWCO6DPfXt7DtVlUdE
UE1LSdFs2xwdkS/Md2BMBRMSibYjpRus3HgpExWs9QcAVahkEHfRDjTbpC9sIigQNrfwUJzfq7PI
yqhJiNanjhWs16RoWm3HnBlttSnKKtlOoYR3wrDkltnE7W5fW1XMmndUgk4u3IKmuEV9V7qsCE9J
E2UU2rulQPlJGdJreXMry6UH2pBSxxhIvl/v/4tGx2ASxury++X5gnapL5eXh6/8sjyNJsY9Fq7K
pR2o2Rny/lxFxMiS7x1/KcKrkbcZu/xyJpzp59Zq1nG1T/D7pat0jjYEqWxkze2rBsIUAw+5iO9P
tAx4C9nyRYSiOEoWjuRWbAmtuAGFchWmM2wiaeEkYujaAv9vk4PYE1kR7Q7hNiTnNMLFI5b01Cma
i/LreOEuz+eJntmkZzj25fmEaqCbs82baCstpa2PzCk6kgPMHZzmDm1IN5kR6vr2fH8ZuxhCDaqK
mnTpUX9AoCanWqCus7inDosXAr0i7iWsfXXgr9+ZL1Yz+m0LNJt1QSLfesUt37Er6jKSVvvOnckU
MbTLlDoFV2VuykMLV10TBUzY1o78eH29/Hi+3gvOmgmC37cRFyMajFwOAy8UZar48fjyVSi9zBUJ
lNc/tasFc0/U1IMYEqJZ2ilqy3Mq2BwkjAs1l/Dil+UtpkoQnIDxWDTqRlVEN39XP19eL483xdNN
9O3hxz9uXjBQ8feHewIUYMzfj9+vX4Gsrtwfr7N3C2yTFfD5+vnL/fVx6kGRb65GzuWvm+fL5eX+
8/fLze31Ob2dKuSPRE0s2X/m56kCRjzNTJ4w+Owme3i9GO767eE7Bp/1nSQFHaZ1coZeR8UJ04Vk
mR0L2Nb550vXxd++ff4O/TTZkSJ/UJBRzevWovPD94enf08VJHH7/Ax/asgM6hmafzZVctvV3P68
2V5B8OlKp1bLAg3u1AJkNMUhTvLwQFzEqFCZVLg2IYYec1OjIqhzKVBpJB84IodBsqoMaaJEVkyo
FBxc7ZcYQWkM79sfQ1tOckalvSsg+ffr/fWpgzePx2PIiDchKOcT8JitxEaFoIqwEJqWMxGj33L7
Q/HMXwV2M4fDQXPHzmwtG/Qf158vJGf9QWI2o74KLb2sD3N37ghlVvVytZhJDkStgMrncx7k0DI6
GD5x5x5kYPwjuo2Iq5PD/lAxR3u8RUP3LsS9FFN7UFsw/GhB74hBoqc10VoSRXfKKXrraSxxESaj
OKhjTpHHkL9HGy9KcXIbJwraTdtCxjV/UkQs8gx/ma5WhfOuF/GoiOrydbBzpGG0D8hdSVpp5s3j
n/OyINdtHWlFSeds5jM1vSVNXIt0XEWtc5rIY/laku3lYHHZffk6D90lT/yZhxbIE2X5IrTBOo9g
9hjrJy17oNq1Eo51vbDOU2e5HFtSu+Uv9JbkhigOZy7pbRijVewENmFlEVz2xptzpparwAs3Y/+P
sYjcufuziln+U014T5j3yP4cfdi7iAdDjXXRzBNj8PI8XPh0GWsJvMyOyIYNEgOOFwKkpS8CngBn
NZ+7xg/+0aLaBBLckZ8jGChzRgiYj5iKQg1FQ41iQJpNZJtX9R5O8aJdETjrcM5cMv4/nkuN9nzD
24Q6pJNt4azcypqzC9eTL1mRJUJ5oB9UELByvZVrlepNPrpaskf9he1kFThBkxozTFiFoOHJpnEm
ObVaLBZWSxfBsrHbajm/E8bK5Q9TYBZ0EFsu2O+VZ7mmLVb+aqrxq5V4nxSv/ICVmuqzfEghUqPI
hXHntsRhPz6ckqwoE/jwdRJNGKXSpc9Ds3bnhRhHlx5C73y268jqyPMXkrzmcMONJq0m0nJrnqTm
oAaEIbSPlOBamN+GJpmCkOP5ri08C2Snd7Q3BWIH5FEJGg2zaiDJ98RVBjgruoofwuPCoPsMC0Cs
lc68iA0c0MQqAW8v2aFqPQicpUsGQkejTnIdzVeO59pk13NnyxHRWSrXGRXhekvFYgZbcuCqwAss
MhTgzm3aYsXVUUNdzvzJ91PLYLkcP2LQl+QbMiMwcxPRMIjsHNTl0UAGRp1F/tyX/VCQrSLP8SVj
3WkTuA6fkqe0xItw2JftiloL1jm0oXj/qu/o5vn69AoH2y/ctAsaXpXAvpPJcI3jh1uLw4/vcKy0
jkZhvJwF8nzd5ZHvzeUqhrL+tPMo22Zsl8G/5kcafbs8auBvE9TIS6+zEJTqXXtrLC24WiL5VLQi
VMFLAqqmmd+2EqhpTDuJIrWkK0Ea3nLdo8zVwqGpLFQUzxxLQTE0UxlRL5A49lAcBDCrcJXikW5b
zib0kFKZkt/hvlPF6dNydZa/l/0hTLjpw5cu3BTdR6Pr4+P1iZpEZAF6gslVf+tvOqT3IFdRnrLv
ThxVGc/Y5FTZ1USaQc9SquxrMhZsyc7IJXfHNdXbxnWwx2rrTWQeG08Wrx0mrQu1mRIwOz6beS4r
hHMnYE7H81ng8N9L/tv3LCVp7osroWawY+F8vvIQ9IrmhmipFmFWWVXMJ9z9gBV4fjWp5M2DJVPy
8Ld9IkPqSvCNH9iLuRRvrxlMY50vArtvFhOBwZo10W2LhWO/P6ibU8riTEzxAMv10mGNiTBwLpTO
33FZ1Mgip0jl+x67zgKdzA0m0sejvhaIN3t54M2oAgIa1dxlyB5IWXryy4Hi5C9ERBXkrDwOl5zi
KzhLz8ZiZPz5fMEVH6At2BG7pQU0JMls6qaHSHzBOxOsX4W+vD0+/mztucO00/PW2Fo11P7IcEN4
xjQz4blgyxpjk7gEj1pjEP2eL//9dnm6/9kHSPwvQiTGsfq1zLLuEsLcXm0xvuDz6/X51/jh5fX5
4bc3DBDhO/bKwjeyLsAmijBgIN8+v1x+yUDs8uUmu15/3PwdmvCPm9/7Jr6QJvJqN3BykU9qwFmw
hCB/tZruuT/oKbbofv35fH25v/64QFvGioc2mTkTJ0vkuTO25BqSdRbWZrdALuNcKW/lcHmg+WIX
rfOtGzBdBn/buoymsb1ncw6VB0cvKjfQ+POEbiNGl8eZMx/pHHx/236simaGHrWjrU+z0CvoHTYi
bHbsYerU25lnm2OsqT3+jEZtuXz+/vqN6BYd9fn1pjKQ508Pr+ySJdwkvm9Fp2mSvDugHd9xZYhr
w/LokBarJkzaWtPWt8eHLw+vP8nw7FqVezN6Wot3NV0dd3gk5AdfIHnOBJz3rlaeJx2gd/WRnkBV
unA4WBRSbDNt90J2481iCwvLKyK9Pl4+v7w9Xx4vcKh5g84Q5p5s5W15gTOeaP5CVgA0jx8EUjew
7M1pO53EuZcK86pQywXNJttR7DnVUq0Ztc/PgbyfpodTk0a5D8vGtJLPhGS1CkVg3gZ63rILGcpg
OixhWM1tJ2qm8iBW8uHhnU9Lpzt+jsaE3QrU4abIwMw+fP32Kq7O6DQZZvJ+G8Yf4kbNRJtQGB/R
OMVHTzZzZLfPDPQih1pgy1itZvSra8qKKeNqMfPobFzv3AWFI8LfdDRGOcgvuRaYz+Qcl8BggOQR
wpbP+e+AWsW3pReWDjdjGRq8mONs5NF1qwLPtfuXnFD18UdlsH25zNjDeZ6IO4Is1yNt/qBC16OK
XFVWzpwtPG2xBvidK7zVXMSLy07wSX2akRuWZFjJR0ZIpEmBXYcibKHxWkJR1vDlSatKaLbGsmdL
pOtSgCn87dMbh3o/m9HgIphUx1OqvLlA4rNzILOFqI7UzHfZKUCTRCfxriNr+AgMjFITlqxrNWni
QIO8hVgDcPz5jPTIUc3dpccSVpyiQ4ZfQrZOaOZsIhQ9ybPAEW+jDGtBuvaUBS6dZ5/gC3oezzvH
FxgDifH569Pl1VzbCDvvfrmi8Kv6N7+R2Turlbj2tBeOebgl6PyEKF5Paga/PAu3sLaRF8vzaDb3
aLLWdrnWz8oqV1ffe2xRI+ujN/JovvRn02YoS07epDqpKp+5dFnl9JEVjXOn4uk/hnm4C+E/Nbct
aR3oiPStzSgY0vK88BNh3maj7Yqggq2Oc//94Wk0gMhGKfD5VmtSU6L7zti9r4Ndv/kFI7mfvsCh
9unCm6jTXFXHsu49Efj3RURmwupbJhfd7sRPoL5qlMvPT1/fvsPfP64vDxp7QNif9Q7iN2WhxH7/
M6Wxo9qP6yuoEw+Cr8PcpPXrFGHlLqlhFg0Xvm3b8Jf25RKQxIusqPTNDkcILl3dkDC3CS4LH63L
zD4JTLyV+MbwIV4pxH5ertxuF5sozjxiTuvPlxdUxoSFbF06gZNvuRZcTmU6jLMdLK9SAGtcKraj
7Ur6AdKoxO6gq1WZufTsYn7bU7ylyqsGMGe8DDUPXP5RNWVydWrZUysHsmcLWTcyC6ROvCvtf3Of
vv6u9JyALOqfyhAUu2BE4Et/R7TwI0Yfc9CRnxDQQdKT1Wxl76V062PPtSPm+u+HRzy44ez88vBi
rm9G40frcTwRTBpjUFBaJ82Jzri1yzBvS0TQobCeG8QfcWQ8b1VtxLtUdV5xNeoMbaG/4Tkyb1Gp
sOFET9l8ljnnSbSVP+iIvwzZYZt6EMRjwrLxB8WabeDy+AONdOLk1suvE2KO45zFfKEReDUBzA3r
YJo3Omd0ERXHUkRmzLPzygm4vmlo4nmlzuHwwWximiJPLWC5rrQO17Bj0ZGmf3vE8RXNLe5yzkBs
pA4a6jrUMvDSKU/s6O5u3NKYCvhhtlFOsjLFISmsc4y9zDC9pCmir2tg15HcGl3mnbyEIQ/RTjd1
PslvgT63YnQY8s04IZMTiDoh1cymcVTAjjaBxDewuzA/1ic675P2NDEKU3V7c//t4ccYdQ44GLJB
YsPhfdOIhiiMHu6fLcNo35jk08MOpy/4a2i1nB6pTcSclkVU0zy1sNonNXFZp9ETyDEdvb1jMQma
k0e7skF4mfMEYrSWqlMhe5FZj3cfb9Tbby/aq3zomRZz0c7KrVP6bnMky4Ni97GJwoPJ9IKZuycy
8ayjvNkXh1DnLrdLY2VpEOSmLqrKuKZaVRl2/H57jJBKQWmVfJyZUJidCrsanAZpfl7mt5NAbCiW
p2eMYU4xPHz6lcpz2HjLQ65zr5NxS1nYK5wVwZgu2xyFvNKwLHfFIWnyOA8CcdChWBElWYF3xFXM
w9qRqeNeTDr4iceJREoUCWTpfKge3SyR2q8MeE2+LuwaB7adq3PYH9nAJI9jVAF0xsRl4Xo8wi/P
iC6vd9dHYxgnK8FQ3ztiZDqFsk0QOsEf1TyAVnXLyyGuipREzreEZp0iToYdp8u5YpYbq4AO7+Nv
vz1gnqb/+PY/7R//evpi/vrbVPFYeQ9bPOEp1KJqdZp5SILVdP4e62e/hQ3boiZXUqqf3d3N6/Pn
e60w2uu0qknR8APjb+sCnQjoFBoYmLSIoFkgw9yw0thgIKriWMGkB4oqRHWECA2JvORCNrDmiXDt
ZqzzxNodbWJ/69kcq6Inb3VpNlVN1JErGa9xaISYY7pnD/mauruX8afqHsLQDW771lGJJQ6vUSw7
eabJt1UvPELjsSWikwhm0km1HnVThcAM8aetOr1YHka7czEVaKDFDGQRsdaZ5m2qJPmUDFzb1a/E
iWpUYBFlC4s2ger04WJDOVPPxRuiVvSBNJs8GXVFS8d3facwLWK/J2OOW9qzw4088nqBQ1p0GZ5B
nWoOsymzbf+EPGE2in9qlepkurAcNgcrTzURyUNVj3LiEYbx3BrTQ1UmScxZoFzldhPUOsG4IOnE
kfQuWvCnFAdIyf0xBDEvYNCchxssmt57FC+LacPDeLtYeUQFb4nK9R12t4L0ibA1ZGF4Nl0DpIp7
BSBvipIChKQ0rBl/NT2m10DO0twALxOCUTyiusrsla2KxjAcLRtmFgrQddp1/Ob2GMaN7CM8GDSj
g1QinIH04zFFnhgivuF4BQpkWR+rZLwA3yYiCg2D4NZocVq9itkgMiB1Vp66wS7HIxiNJ8/DdziO
ap2JRndGsJYlzV2B3sc6NyHDFg/RtFLDFqYwokLJi5LCsPCQfNXkXHvNhh1/WlJzDutaKgT4s4YG
vLUENOSmMCwjBkvUMVUSHSsrkeIg4tsF+naBFqsrzqrKn8R00sy9BlrRyM3kanEde/yXfUSH+vK1
7n162EsVqnMN1416MgiLUae9gI6lTw+bQnxc6v9e6oMWEFnnEas7C26UZ7W1iAxNuoWq21d7tCnS
R+l5+qX1lNnaH6eXqY4HOKDBd/g4CaFtZK2PYIihgv6phaqrZNPAQTXdsFoPaTZ+x2F596Z6C6un
ivHUYERsBWrf6SjNGoErYAElPMxpgZAce4MO3q0OoMBjmMhHm082IcwyUH0EBW8CqAYk8NXFybVR
JhEKCcu2CakhdHmOh2LDd3Ko3B6LWs7yojkIvakxGPSqvJGVai0Z1aRHw2NdbJTf0D41NEbaQFOt
wRwBSbrxNSkX6MMF9FUWfmSje6DBQIrTCvakBv6THhoEwuwuhDPKpsiyghl1iDCeymQoYiKUJ9AN
Rck6uo2xuP9GcyhBp+La12aOJWt2y6hDcT5tVLd4kSFjdpPRIyOJXarqYluFsgGxk5rOpdNJFOsP
2GlZKkKYaBmcAWwrGqjvVECEJtraR5ro3jQ9G/9SFfmv8SnWu+1os01VsQoCxxpkH4osTWSMpU/w
hLiUHONNt8F27ZDrNjd7hfp1E9a/Jmf8F/QYsXXAY0M6V/Cc1daTEZKGAzC6jBQRKNYlpszxZ4th
EWvLf+SU7pm0QLgWldT//Nvb6+9LYow41MLO1Ck6772ZsfG8XN6+XG9+l95Y75bMko6EPU97pWlo
IqVLiibiK4IiBrtOUVksUP6yuKIISuaJFLSsKtrpGUI12n1SHWhDLAt/nZf8O2jCsHtMXWq8u+Hv
jltYTtfi18yTfBM3UZUw+Dzz36CedPaxcRcPmrAyqbYMpB/XFCpMvTStdYTx1EYabiw9ItE7mUxq
8zex/XFnPQ+/y+zIt4N1MtLDNGlKF1zbbbK2lw+bXlmyKK1S4ozod7D9JjaCxcDFxC+9dsK46pjn
YTUid8OBrT4dRxxMtpCkIRsmgjnizTQGkBVaq5C+nJH9xPKOG1qFCX3YhcI6nR4bESzH4tBQcBhT
O3726GhGGdIr+ztPGimzGzODXsdHA01ewmH1sLUDJydE9en8vSqpHOJ4RCXJuNRLjb5dz/k0lc2l
l8g+iZfZA7uQKvwk16ZqyR2j5/t7NK+sNbLdp0QoN8nXCZyYY4G1qcJtnhzqptUksIBZr3edrTmV
pwcYs0wPy0ezdldOrSO3h7NvlQikQCaNc9O3dUkXI6AxsD1E/+73uj1ChiFetfqn63i+83+VPdly
G7uOv+LK00xVzrneI0+VH6julsSj3tyLlrx0KbaSqE68lC3fezJfPwDYCxewk3nIIgBcmwRAAARd
shgP3d2W0vwnigC+1hjyckDaPQDkItDLDs4TRTC5HLYy785SdLgGWEKTzNsRe4zd3BjuIHe0HdlY
1/QJ+E16bU64EvyY+i5/eNh//bE77j84hOQ8cMZu5qprgcDQDPG/MoRJ7axqBVEiglMQ3bNuVGRO
LR1sRBPuSfyaRE/yWXIWLThHrLNiaekBHdLabfh7dW79NvIpKohHUhHSiBFRkIYPJy7wgcfUI2Sw
JJ4J1cN1cMTlFnpHhBpcFCOR2fdQlphBHTT2vD9jmYPh32agJCYg3DONS+I53v6JozUabF/p1NLg
pkUe2L+buc46AACSHWHNspiaF20UeTcMmZIKEKH1AF9R5GeuK+Q/XkX5gmedgdTXPf5Sx0ltSRAQ
3/FbD93pHxccmkCqdSQwJ2mzsF7aNKnqPBCeLOqE9xktCenIhQHKR5YNeHQ95rByth4lhwh/o3/l
Ov0lTXti5gmyUHi1cL8SdpPznzDV31uGHwOjPLw9TyZXN3+cfdDR3XGxgeOiWbDHfLrQkrqYmE9X
njKTq1MvxriVYuG4q1wWia+bk2tvk9dnngFMrs+9mAtvbZcGEzFxfLiPRcSn6rCI+AxEBtHNBXdL
3STR7yBZhX1jv9FTA5i90i9BIEaWGS6qZuKZrLPzq1PvbAGSuzCBNPRGMd/UGQ92VlWH4G7g63jn
a3YI31rs8NfmmDvwJ1997H0jfWAXvpJsgmuDwNqHy0xOmsKcKILV9izhC+KgTAvOc93hgwiORoFZ
m4KnVVQXGYMpMlFJ84mSHrctZBxL7splRzIXUayHkPTwIoqWLlhCB1VGVKcxmdaSUyeNoWNHf7pl
q7pYSvaRaKSoq9lELxXGvD21TmVg+bqHa+u6W1ClOtnfv79i9PHwdHpbD0oq3Wa1Rbv1HT5mrI5r
hvIeFaUEXQ+OckBYwGGZFyLTtibOu6YcFFGoGn7UGm7CRZNBE4IMDXq7iCQPgwyEY4UYFJTWjoGP
YpcUClkVknUZcxaPDuaRi33lreI7TpSLivu+lPB/IYowSmECanp8O9+S2hMIZXAcTrg2GWefBcUT
/TEqJklTB0G5kgGVTGCNLKI4161NLJr6fPvhX29fDk//en/bvz4+P+z/+L7/8WJEkfVDLBMrWa5L
UmVJtuVzxfY0Is8F9MKT/KyjijMR5tLz+EJHhBe0xinweZ4yqiT/MqLWGujgGehfccnvvYES2ANS
e+KpHN9mD8SUjKnAEIKxoo2oQ2k+sOMZYrTigrI728SwM4TG/WB0tx8wQ8fD83+ePv7cPe4+/nje
Pbwcnj6+7b7uoZ7Dw8fD03H/DTnHxy8vXz8oZrLcvz7tf5x8370+7OnKx8BUVJTK/vH59efJ4emA
N7gP/7trU4b0w5P4qCDGU6dZqi1bQmAqZtwPfeez1JxBRYNBVxoJywY9/ejQ/mH0yZtsrtn1dJMV
ynGrcTBRbtPAytqlYEmUBPnWhm705GIKlN/ZkELI8BpYWZBp7y8SB0XbnnJQvf58OT6f3D+/7k+e
X0/UjtVeOyBimNO5SvvPgc9deCRCFuiSlstA5gudv1gItwie3FigS1roJv4BxhJq9iar496eCF/n
l3nuUi/1MKeuBjQduaQg/sWcqbeFuwXIp/7IU/cndRWQYhedz87OJ0kdO4i0jnmgkdu7hef0L3ci
Vnj6h1kUdbUAoe7AsavOeEqZhN26zd+//Djc//H3/ufJPS3hb6+7l+8/nZVblMKpPHSXTxS4fYgC
IrRHCuCSuxnQo4vQeOO97Xty7sCAra6i86urs5suvk+8H7/jtcn73XH/cBI90dDwIup/DsfvJ+Lt
7fn+QKhwd9w5Yw2CxGljzsCCBahm4vw0z+KtmVeg36pzWcKqMHzk7TiiO7kaG/1CAJNddZ9pSjmc
UBl4c7s7DZgGgtl0ZBVV7p4ImDUd6ZncW1hcrB1YNpuya3nKX3Nq8Rs2+qHb5dF2XQh3p6eLfrqd
TRCCrl/VCbfY8DkDJ15jsXv77pvURLgrecEBNzj/NnClKLvbv/u3o9tCEVycuyUV2H0vUEePsQdA
w8THHCPabFiWP43FMjrnPqDCjHwkaK46Ow3lzOWGbFPenZKElwzsiulTImFr0JUf7ozZcaskPNMN
Rt2mW4gzl6PAFr665mivzjgODQjO6NDzpwu3qgrUpGk2d5pe56oJpUEcXr6bLyR1TMTdlwBTj5u4
4FR61w7oSusZf+btvqfA9+Cky3YDoV5uTsygcw3L2VM09LVTpXUnqoXOfiX/Wp7rTnJU5Oq2Ggtv
yjI6b64m1xwvTtgnxloJus5wzlzJquCOU8BCX9GLauoDPz++4G1vQw3vJ4Ocdi6z/Zw5sMmlq7fE
ny852IKTDLaTWd163j09PD+epO+PX/avXbJArqciLWUT5EXqLuewmGJ8S1o7XSEMyz0VhuMVhOEE
FSIc4F8Snx2P8C5nvnWwqNY1nObdIVQX7AH12F679lIUZhAog4ZtwN6gsUlbpd9bVZSSEppN0QNa
edwOHePhAww1Xb8LadYPMT8OX153cGR7fX4/Hp4Y4YhJvTi2RPAicFk5ZQFTwqS75coWbmlYnNr5
o8UVCY/qdcTxGgZVkkOHnkF3cg3UZAyrOBsjGWveq9oMo9PUTY6ol2b2WlhwT/zC8TZJIjTQkXUP
3Y5DrRoyr6dxS1PWU5Nsc3V60wRR0RoGo/Y6w0CQL4Ny0uSFXCGWXlZmKD610WR8+U8qfQ4U1gxo
co6WuTxScUUUr9WaJvsFjenrvtIx4I3eysS3MVX6gPvv+/u/D0/ftAuP5EBvqqIuW8toYYS2ufjy
9sMHCxttKrwrN0yHU96hUKE4l6c314ZtK0tDUWzt7vCWMFUz7J5giQG7PHEXzvobc9J1eSpT7AN8
u7Sa3fYJ/HzsQdlJyH4yxAG0sGYK51MQAQVnpotlGomiobBF86a0oPh6LihQglaFT2trM9xdoAeF
Kw3ybTMr6Aa1vph0kjhKPdg0qpq6krq3tUPNZBrCXwXM8lTqRo6sCKUhbmHWkggO+skUesmMQJnY
Rey2kQfSvvjToSwwhbwCH29mqKC1d9WkPiSiwDAK2M0gvNOs6i37PYMI4MgL8tMAnV2bFK6eD52p
6sYsdWFpzHga4e83myTAXaLpln1EVie4ZGoXxVp4xSBSTKW36Wte8TMlWKA5yIHFuue2QMtKY5+x
yHbs8nxY6WGWaJMzoPQ4MROqYhlNOMYnogyPDVbzWQkrC8oHtyFUq1mDc9FuTpibRs32T49mG8gJ
zNFvPjfqwl//mRSk2Ux4v3qLpgwF7IvcLYEU15d2M7A5EqYpgFYL2LZj7WH2j5HWpsFfTMWe92CH
eWjmn/XMKBqCAkZdsKH3a3CcX5d56C6ubiFGIFtAk8yMQ4wORWfhxIOCFkdQOguZBpp6LcoyCyTw
oVUEk10ITagjLwMep6c1UCAM72oM3odwfFJw8BhT+/QSWwO8HS/sD3MDsEAnRkAeFcCeO4Qy1uy/
7t5/HDE10/Hw7f35/e3kUTkwdq/73QmmHv8fTR+Gwii9m0TFnJ46CAw5hlMJXtk41VhPhy7RkkFl
eRal0w1VcUzLqFEa3hoTJ7gXrpBExKBQYYTw7URzfCMCk6t4A86QAr7LqHwv57FafBrbzGHmy2WT
zWbkhTIwTWF86fBOF5JxZtiq8DcrY7pVEbfB3V318eemElqUvCzuUPHWmkhyacTRY8IOvHEPSoOx
VGH5dltrFZaZu+HmUYXB99ks1Ne4Xqa5OPcgKtIe9Ft0GZox+kBHHTr5R99rBMJreDArKtS+/www
0Ey/v9femAmWa6G/ck+gMMqzyoKpMyOoOvgSZr/aSxCx6oNpmegsJdH0WXaqN0FfXg9Px79VSrbH
/ds3NzyCFNBl015kMIEYnGf51YMl5QVpprXEZ8N1d4kKHG7ibB6D9hj3zqpPXoq7WkbV7WW/NtpT
ilPDpRZ5gbGvbffCKBb8lcxwm4pEjsVyGhS+TB6g100zPJ1FRQHkxoO+WAz+rPAVrDLSv493zntT
1eHH/o/j4bE9FbwR6b2Cv7pfSLXVGhMcGF7CrIPIsGto2E5sRXxIgEZZgnbLi9CeJFyLYtZUsM7J
h8KFv9vU/FMANhVn4czFAhcLiiLqWjOlc9LAnELgTUEhc/6iZwHfq4G6U7qtoB3o4NSdg5jEbD4J
LxqKSIRkCBIlF3SwADQ+XStT2A86b1OjgvMlngLwFlkiqkATlDaGutdkabx1Z3CWURKeOlVFSIA0
15ec40kNNc+knSVilcDhD3NdCM44prejIo7xeWG6wzMcaH93sdLSJtPm4b5jReH+y/u3bxh3IJ/e
jq/vmOFez+Yh5pLuKBZ3mngYgH3wg7LK3Z7+c8ZRqRR0fA1teroSw73wYe/BpNAOvmQmvovStgKT
bSL0WBNdguk5RurBEBBfqBQJiSWsZL08/uYMSt15tJ6Wok0cgJqHsQQJp1emiIFns/bRQKtwCuMI
S6sqDxTXrAdVLuSscnsQylXzOSr4YClFUqew8YCxTD0X1LoOZXzAuEJHoHWOoHtFjLt9ws1rX56M
ZETCmn5+a+2bi0hdvnBXDl4/dZwIbahPX68mwFFkRpsKX8IzQ4lUdYgnBZHlsVA2W6eGTZAMhZks
s9RKvzDUhzkmRhh7kYWiEr4zWb+QFfF6Y3NQHdLbbSq8dqD1kn437a3nwTCkwFSPJ9BRtaHu4HtC
IeN62pF5QvKQwucCoJ3dfmI4bcXAW91Z7DBeFqN0whoVIk2CBAs8hxEqSkOVZYQxWakqVkmTzyti
nk77nnA6p5inZllUtWDWbosYmXgYN6b4wDA3bw9aSYSCq7QXxxIPRHjWdnRtpb6XGkUr3cwDj1WL
n2Yh5wvrtNx/WPoEmLdiphJeuJ/ORbbcdimQzbiuCoXF0FvYdiA1BkYUhqYhRxMdM5JruvAgyFi0
4MBC7E8DrLu4czgP0Z9kzy9vH0/wgbH3F6UDLHZP3/RzBHQ3wMDFzEj1YoAxNVOt+XAUko5xdTWc
8DHusM77V5215Z/NKhdpnA3wCe1EJ6Q2OCO3l7jt5ekw3UVotYordKZ/EIdCM8/0DWlk1NDv0NhT
pupvFjWskQoO+fraU+pSj+on9nJyyk3SQPjrObJo7Sla34EuCxptmGlOHZKYaix6zo/x9aSC+UHV
fHhH/ZKRd4oHWtdEFdA8IxGMmLSu0nJ1m9sXp20ZRbmSfsovgyFig0z/r7eXwxOGjcEQHt+P+3/2
8J/98f7PP//8b+3tAcx7RFViHgfXvJAXwCO4NEcKUYi1qiKFeeQdNYTGEdocCO15dRVtIod9ljAs
LGbDPeTrtcKAxMvWFEBvt7QujZuxCkods6xSFHQe5Q4AnQjl7dmVDaYjZtlir22skoGtLYJIbsZI
yLai6C6dhmQR1LEoGjgl1F1t5zZzbKm9MktUGdoTyjiKclcutl9ZRTy0BjVe+aCpAwaCofM+DWr4
Kp2Lw3gzeeYtP9iQ/h8Lut/PNJMgImaxmOt5Xgx4kyaSMQi0WM7I0huV9GJ0NIYVBKeCMopC2NzK
rzOiWSyVTucRYH8rxfxhd9ydoEZ+j25Z4/GH9ktJjzutVU1+gS895iZCqis+lsty4MykbzakOoNe
i/kbnTRnBg/1DMluNShg/tJKWu+TqdikoGbPFIoDBTXDloLal7lKX3Wa6wIK0HPtHXywswDGv1I1
IsxoN1TB+XuBCBVGMsj0cu/8TMc7SwyB0R2bRaB7WMKYHYsz3rWaYzFYTQwClfcODmaYV8TjJoUu
L0DExkpppMwSlDKf5wxAkAbbKuOYEMUwafZZR9qkWa6moLg1FcnexjSOnRciX/A0nS111k2xH9ms
ZbVAg7+tznJkbXI5tELb5C1ZQrlR6fpIEVokmP2KVgNSknXMriRoC6pabIYWmGISgz4aO60RvWJM
9EY4C35F/PAlDCNwJy0voiiBzV3c8Z1z6msBXCoGN023sV9lCOf7RSDPLm4uyZ3kOXeVAt9b1nN5
EaAR9SaUZR4L8yqhQqp5GnnJ2aBTRvtf05HX0tvFjss7PV2sm2kBB2qaTC1XelsKExcbUlLBC0xr
Ap9aWiYhm0794pM39RSp0vztthcyBF2Omb+Ry3UtRS7DWegMFflbwdRXL3wX/xR+NcP32DCJdFKx
GTJdulC/1sWim9l0jGKaBYuSmfjfeAugr6xkxtodN8bGSzRKqxs3Q1EWf9kabKP+As8/k2tOOFr6
jsNpXX3IpYlEEW87PxY+gzGET0yum9apROevOudLeeoKp3NPAUrIvAmngSuqMKFeXLPR68QoMVm2
LVaGAAzoMIZH4JsLI75imSl/XXO6mRiZDTSEx0nVU9R+j19PY5vbbalM/kM803rCAnLhKgRGDRgI
zThs6DOPhWOpeSLXQM6nkc8pJzMeJLxdqNO1et3Cdfq0Oou5aHXXcLV/O6Kyj4ft4Pnf+9fdN+0h
REoIPawclR+6taPaYFPBU7Bo0zInS8lTWBLEnhzHnVaMXtasAAn1l/KTGQF/CU/GVRdVKk8+Q27k
fVUZPLvW/O6RUqRBtuqkmB5pBloDRhJU6oDexecPCtsy9Dw2pUwjGE5awm7ykyQyRXcj/zgMUYyX
D+XqmvfATgdNERbtiPo9xRs2I3g9MMlLRat0JVAZG6tMJRH049UZ+/pyfKPpF4u9RDQ9i2iD7gL2
UEr6nhZCaE27wqvMAuzDhi1VGeRbp/QSEFXGJ0MmAhUVPPLVA5HOfK1qESM6uK492gFhN47aZeI7
c7afokAbS+X13qkJ92W0IqwM+bv/arcsOY9FN2C0OT9aJVaJ4/ayZgTPTJ7ME6rifDboNgqCceAU
lwA8xuAmGLs8xSgFLlbLbHcmi2Qt2IgT9XWtvL1QLXCyOOx5tLb72td6Br7MhrFgfSzvViHtOmLg
XnrguH8jBUmIlJ4eDPxGViOVkD/tFzV0Md2/olOf1tEUzH1J+UHaBC3W3kyykW2CmQ4E7M+RrVlR
XL0nMLqrxHMMU8sDeSR6WUtnD/s0B0LSgbVdD5x6rOu9GLUO3bC/eQti21hsgdWtOmHH2ktGFQ0n
K4UKVPs/8M7cNgueAgA=
--===============4947095015825475185==--

