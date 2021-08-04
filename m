Content-Type: multipart/mixed; boundary="===============1305813746785681610=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [peterz-queue:sched/wip-freezer 5/5] kernel/freezer.c:110:7: warning: Local variable frozen shadows outer function [shadowFunction]
Date: Thu, 05 Aug 2021 03:50:35 +0800
Message-ID: <202108050320.gq9VVV1r-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1305813746785681610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sc=
hed/wip-freezer
head:   cdba87e1faac40e0a5c8c8a8e9ef0ae37a2903df
commit: cdba87e1faac40e0a5c8c8a8e9ef0ae37a2903df [5/5] freezer,sched: Rewri=
te core freezer logic
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
compiler: microblaze-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/freezer.c:110:7: warning: Local variable frozen shadows outer fun=
ction [shadowFunction]
    bool frozen =3D false;
         ^
   kernel/freezer.c:57:6: note: Shadowed declaration
   bool frozen(struct task_struct *p)
        ^
   kernel/freezer.c:110:7: note: Shadow variable
    bool frozen =3D false;
         ^

vim +110 kernel/freezer.c

8174f1503f4bf7 Matt Helsley   2008-10-18  104  =

cdba87e1faac40 Peter Zijlstra 2021-06-01  105  /* See set_special_state(); =
serializes against ttwu() */
cdba87e1faac40 Peter Zijlstra 2021-06-01  106  static bool __freeze_task(st=
ruct task_struct *p)
cdba87e1faac40 Peter Zijlstra 2021-06-01  107  {
cdba87e1faac40 Peter Zijlstra 2021-06-01  108  	unsigned long flags;
cdba87e1faac40 Peter Zijlstra 2021-06-01  109  	unsigned int state;
cdba87e1faac40 Peter Zijlstra 2021-06-01 @110  	bool frozen =3D false;
cdba87e1faac40 Peter Zijlstra 2021-06-01  111  =

cdba87e1faac40 Peter Zijlstra 2021-06-01  112  	raw_spin_lock_irqsave(&p->p=
i_lock, flags);
cdba87e1faac40 Peter Zijlstra 2021-06-01  113  	state =3D READ_ONCE(p->__st=
ate);
cdba87e1faac40 Peter Zijlstra 2021-06-01  114  	if (state & (TASK_FREEZABLE=
|__TASK_STOPPED|__TASK_TRACED)) {
cdba87e1faac40 Peter Zijlstra 2021-06-01  115  		/*
cdba87e1faac40 Peter Zijlstra 2021-06-01  116  		 * Only TASK_NORMAL can be=
 augmented with TASK_FREEZABLE,
cdba87e1faac40 Peter Zijlstra 2021-06-01  117  		 * since they can suffer s=
purious wakeups.
cdba87e1faac40 Peter Zijlstra 2021-06-01  118  		 */
cdba87e1faac40 Peter Zijlstra 2021-06-01  119  		if (state & TASK_FREEZABLE)
cdba87e1faac40 Peter Zijlstra 2021-06-01  120  			WARN_ON_ONCE(!(state & TA=
SK_NORMAL));
cdba87e1faac40 Peter Zijlstra 2021-06-01  121  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1305813746785681610==--

