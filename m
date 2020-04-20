Content-Type: multipart/mixed; boundary="===============1602222458737932391=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [peterz-queue:sched/core 11/11] kernel/sched/core.c:3910:28: warning: Unused variable: class [unusedVariable]
Date: Mon, 20 Apr 2020 21:54:26 +0800
Message-ID: <202004202109.xMcjfPXT%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1602222458737932391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Chen Yu <yu.c.chen@intel.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sc=
hed/core
head:   e7ddba6556cbcfd3fc0ae8d80168f344b2ce3535
commit: e7ddba6556cbcfd3fc0ae8d80168f344b2ce3535 [11/11] sched: Extract the=
 task putting code from pick_next_task()
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   kernel/sched/core.c:485:3: warning: Either the condition '!task' is redu=
ndant or there is possible null pointer dereference: task. [nullPointerRedu=
ndantCheck]
     task->wake_q.next =3D NULL;
     ^
   kernel/sched/core.c:482:10: note: Assuming that condition '!task' is not=
 redundant
     BUG_ON(!task);
            ^
   kernel/sched/core.c:481:22: note: Assignment 'task=3Dcontainer_of(node,s=
truct task_struct,wake_q)', assigned value is 0
     task =3D container_of(node, struct task_struct, wake_q);
                        ^
   kernel/sched/core.c:485:3: note: Null pointer dereference
     task->wake_q.next =3D NULL;
     ^
>> kernel/sched/core.c:3910:28: warning: Unused variable: class [unusedVari=
able]
    const struct sched_class *class;
                              ^

# https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?=
id=3De7ddba6556cbcfd3fc0ae8d80168f344b2ce3535
git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git=
/peterz/queue.git
git remote update peterz-queue
git checkout e7ddba6556cbcfd3fc0ae8d80168f344b2ce3535
vim +3910 kernel/sched/core.c

^1da177e4c3f41 kernel/sched.c      Linus Torvalds 2005-04-16  3906  =

e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20  3907  static =
void finish_prev_task(struct rq *rq, struct task_struct *prev,
e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20  3908  			    =
 struct rq_flags *rf)
e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20  3909  {
e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20 @3910  	const =
struct sched_class *class;
e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20  3911  #ifdef =
CONFIG_SMP
e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20  3912  	/*
e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20  3913  	 * We =
must do the balancing pass before put_next_task(), such
e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20  3914  	 * tha=
t when we release the rq->lock the task is in the same
e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20  3915  	 * sta=
te as before we took rq->lock.
e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20  3916  	 *
e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20  3917  	 * We =
can terminate the balance pass as soon as we know there is
e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20  3918  	 * a r=
unnable task of @class priority or higher.
e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20  3919  	 */
e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20  3920  	for_cl=
ass_range(class, prev->sched_class, &idle_sched_class) {
e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20  3921  		if (c=
lass->balance(rq, prev, rf))
e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20  3922  			brea=
k;
e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20  3923  	}
e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20  3924  #endif
e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20  3925  =

e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20  3926  	put_pr=
ev_task(rq, prev);
e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20  3927  }
e7ddba6556cbcf kernel/sched/core.c Chen Yu        2020-04-20  3928  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1602222458737932391==--

