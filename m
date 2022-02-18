Content-Type: multipart/mixed; boundary="===============5402435902694950842=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [peterz-queue:sched/wip.umcg 5/12] kernel/entry/common.c:175 exit_to_user_mode_loop() warn: bitwise AND condition is false here
Date: Fri, 18 Feb 2022 10:46:33 +0800
Message-ID: <202202181013.6M4rclQq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5402435902694950842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sc=
hed/wip.umcg
head:   82bbf7cff6212eb462eea2bcde016c6f8589eae1
commit: a2bab7e6403961abdecfd504569f8917d4d1d27a [5/12] sched: User Mode Co=
ncurency Groups
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: s390-randconfig-m031-20220217 (https://download.01.org/0day-ci/arch=
ive/20220218/202202181013.6M4rclQq-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/entry/common.c:175 exit_to_user_mode_loop() warn: bitwise AND condit=
ion is false here

vim +175 kernel/entry/common.c

a9f3a74a29af095 Thomas Gleixner     2020-07-22  154  =

a9f3a74a29af095 Thomas Gleixner     2020-07-22  155  static unsigned long e=
xit_to_user_mode_loop(struct pt_regs *regs,
a9f3a74a29af095 Thomas Gleixner     2020-07-22  156  					    unsigned long=
 ti_work)
a9f3a74a29af095 Thomas Gleixner     2020-07-22  157  {
a9f3a74a29af095 Thomas Gleixner     2020-07-22  158  	/*
a9f3a74a29af095 Thomas Gleixner     2020-07-22  159  	 * Before returning t=
o user space ensure that all pending work
a9f3a74a29af095 Thomas Gleixner     2020-07-22  160  	 * items have been co=
mpleted.
a9f3a74a29af095 Thomas Gleixner     2020-07-22  161  	 */
a2bab7e6403961a Peter Zijlstra      2021-12-14  162  	do {
a9f3a74a29af095 Thomas Gleixner     2020-07-22  163  		local_irq_enable_exi=
t_to_user(ti_work);
a9f3a74a29af095 Thomas Gleixner     2020-07-22  164  =

a9f3a74a29af095 Thomas Gleixner     2020-07-22  165  		if (ti_work & _TIF_N=
EED_RESCHED)
a9f3a74a29af095 Thomas Gleixner     2020-07-22  166  			schedule();
a9f3a74a29af095 Thomas Gleixner     2020-07-22  167  =

a9f3a74a29af095 Thomas Gleixner     2020-07-22  168  		if (ti_work & _TIF_U=
PROBE)
a9f3a74a29af095 Thomas Gleixner     2020-07-22  169  			uprobe_notify_resum=
e(regs);
a9f3a74a29af095 Thomas Gleixner     2020-07-22  170  =

a9f3a74a29af095 Thomas Gleixner     2020-07-22  171  		if (ti_work & _TIF_P=
ATCH_PENDING)
a9f3a74a29af095 Thomas Gleixner     2020-07-22  172  			klp_update_patch_st=
ate(current);
a9f3a74a29af095 Thomas Gleixner     2020-07-22  173  =

a2bab7e6403961a Peter Zijlstra      2021-12-14  174  		/* must be before ha=
ndle_signal_work(); terminates on sigpending */
a2bab7e6403961a Peter Zijlstra      2021-12-14 @175  		if (ti_work & _TIF_U=
MCG)
a2bab7e6403961a Peter Zijlstra      2021-12-14  176  			umcg_notify_resume(=
regs);
a2bab7e6403961a Peter Zijlstra      2021-12-14  177  =

12db8b690010ccf Jens Axboe          2020-10-26  178  		if (ti_work & (_TIF_=
SIGPENDING | _TIF_NOTIFY_SIGNAL))
12db8b690010ccf Jens Axboe          2020-10-26  179  			handle_signal_work(=
regs, ti_work);
a9f3a74a29af095 Thomas Gleixner     2020-07-22  180  =

a68de80f61f6af3 Sean Christopherson 2021-09-01  181  		if (ti_work & _TIF_N=
OTIFY_RESUME)
a9f3a74a29af095 Thomas Gleixner     2020-07-22  182  			tracehook_notify_re=
sume(regs);
a9f3a74a29af095 Thomas Gleixner     2020-07-22  183  =

a9f3a74a29af095 Thomas Gleixner     2020-07-22  184  		/* Architecture spec=
ific TIF work */
a9f3a74a29af095 Thomas Gleixner     2020-07-22  185  		arch_exit_to_user_mo=
de_work(regs, ti_work);
a9f3a74a29af095 Thomas Gleixner     2020-07-22  186  =

a9f3a74a29af095 Thomas Gleixner     2020-07-22  187  		/*
a9f3a74a29af095 Thomas Gleixner     2020-07-22  188  		 * Disable interrupt=
s and reevaluate the work flags as they
a9f3a74a29af095 Thomas Gleixner     2020-07-22  189  		 * might have change=
d while interrupts and preemption was
a9f3a74a29af095 Thomas Gleixner     2020-07-22  190  		 * enabled above.
a9f3a74a29af095 Thomas Gleixner     2020-07-22  191  		 */
a9f3a74a29af095 Thomas Gleixner     2020-07-22  192  		local_irq_disable_ex=
it_to_user();
47b8ff194c1fd73 Frederic Weisbecker 2021-02-01  193  =

47b8ff194c1fd73 Frederic Weisbecker 2021-02-01  194  		/* Check if any of t=
he above work has queued a deferred wakeup */
f268c3737ecaefc Frederic Weisbecker 2021-05-27  195  		tick_nohz_user_enter=
_prepare();
47b8ff194c1fd73 Frederic Weisbecker 2021-02-01  196  =

6ce895128b3bff7 Mark Rutland        2021-11-29  197  		ti_work =3D read_thr=
ead_flags();
a2bab7e6403961a Peter Zijlstra      2021-12-14  198  	} while (ti_work & EX=
IT_TO_USER_MODE_WORK);
a9f3a74a29af095 Thomas Gleixner     2020-07-22  199  =

a9f3a74a29af095 Thomas Gleixner     2020-07-22  200  	/* Return the latest =
work state for arch_exit_to_user_mode() */
a9f3a74a29af095 Thomas Gleixner     2020-07-22  201  	return ti_work;
a9f3a74a29af095 Thomas Gleixner     2020-07-22  202  }
a9f3a74a29af095 Thomas Gleixner     2020-07-22  203  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5402435902694950842==--

