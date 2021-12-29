Content-Type: multipart/mixed; boundary="===============0950650696787160728=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luto:sched/lazymm 14/17] kernel/sched/core.c:4982 __change_current_mm() error: uninitialized symbol 'old_active_mm'.
Date: Wed, 29 Dec 2021 14:57:16 +0800
Message-ID: <202112291407.kiWkQbmd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0950650696787160728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andy Lutomirski <luto@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git sche=
d/lazymm
head:   fbea7977edc16ae85f8e2255b084bc2403801327
commit: 8f99be3b9978a71358e03a2bcfd4b230f32714cb [14/17] sched, exec: Facto=
r current mm changes out from exec
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-randconfig-m001-20211228 (https://download.01.org/0day-ci/ar=
chive/20211229/202112291407.kiWkQbmd-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/sched/core.c:4982 __change_current_mm() error: uninitialized symbol =
'old_active_mm'.

vim +/old_active_mm +4982 kernel/sched/core.c

f711f6090a81cb kernel/sched.c      Gautham R Shenoy 2009-04-14  4937  =

8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4938  void =
__change_current_mm(struct mm_struct *mm, bool mm_is_brand_new)
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4939  {
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4940  	stru=
ct task_struct *tsk =3D current;
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4941  	stru=
ct mm_struct *old_active_mm, *mm_to_drop =3D NULL;
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4942  =

8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4943  	BUG_=
ON(!mm);	/* likely to cause corruption if we continue */
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4944  =

8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4945  	/*
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4946  	 * W=
e do not want to schedule, nor should procfs peek at current->mm
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4947  	 * w=
hile we're modifying it.  task_lock() disables preemption and
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4948  	 * l=
ocks against procfs.
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4949  	 */
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4950  	task=
_lock(tsk);
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4951  	/*
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4952  	 * m=
embarrier() requires a full barrier before switching mm.
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4953  	 */
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4954  	smp_=
mb__after_spinlock();
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4955  =

8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4956  	loca=
l_irq_disable();
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4957  =

8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4958  	if (=
tsk->mm) {
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4959  		/* =
We're detaching from an old mm.  Sync stats. */
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4960  		syn=
c_mm_rss(tsk->mm);
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4961  	} el=
se {
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4962  		/*
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4963  		 * =
Switching from kernel mm to user.  Drop the old lazy
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4964  		 * =
mm reference.
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4965  		 */
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4966  		mm_=
to_drop =3D tsk->active_mm;
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4967  	}
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4968  =

8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4969  	tsk-=
>active_mm =3D mm;
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4970  	WRIT=
E_ONCE(tsk->mm, mm);  /* membarrier reads this without locks */
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4971  	memb=
arrier_update_current_mm(mm);
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4972  =

8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4973  	if (=
mm_is_brand_new) {
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4974  		/*
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4975  		 * =
For historical reasons, some architectures want IRQs on
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4976  		 * =
when activate_mm() is called.  If we're going to call
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4977  		 * =
activate_mm(), turn on IRQs but leave preemption
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4978  		 * =
disabled.
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4979  		 */
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4980  		if =
(!IS_ENABLED(CONFIG_ARCH_WANT_IRQS_OFF_ACTIVATE_MM))
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4981  			lo=
cal_irq_enable();
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03 @4982  		act=
ivate_mm(old_active_mm, mm);
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4983  		if =
(IS_ENABLED(CONFIG_ARCH_WANT_IRQS_OFF_ACTIVATE_MM))
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4984  			lo=
cal_irq_enable();
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4985  	} el=
se {
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4986  		swi=
tch_mm_irqs_off(old_active_mm, mm, tsk);
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4987  		loc=
al_irq_enable();
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4988  	}
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4989  =

8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4990  	/* I=
RQs are on now.  Preemption is still disabled by task_lock(). */
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4991  =

8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4992  	memb=
arrier_finish_switch_mm(mm);
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4993  	vmac=
ache_flush(tsk);
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4994  	task=
_unlock(tsk);
8f99be3b9978a7 kernel/sched/core.c Andy Lutomirski  2021-09-03  4995  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0950650696787160728==--

