Content-Type: multipart/mixed; boundary="===============7302787143249432936=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/sched/core.c:5714:2: warning: Comparing pointers that point to different objects [comparePointers]
Date: Thu, 14 Jul 2022 07:15:20 +0800
Message-ID: <202207140730.g24ZXSDM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7302787143249432936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: kernel/sc=
hed/core.c:5714:2: warning: Comparing pointers that point to different obje=
cts [comparePointers]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4a57a8400075bc5287c5c877702c68aeae2a033d
commit: 546a3fee174969ff323d70ff27b1ef181f0d7ceb sched: Reverse sched_class=
 layout
date:   8 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 weeks ago
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 546a3fee174969ff323d70ff27b1ef181f0d7ceb
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/sched/core.c:5714:2: warning: Comparing pointers that point to di=
fferent objects [comparePointers]
    for_each_class(class) {
    ^
   kernel/sched/sched.h:2190:27: note: Variable declared here.
   extern struct sched_class __sched_class_highest[];
                             ^
   kernel/sched/core.c:5714:2: note: Array decayed to pointer here.
    for_each_class(class) {
    ^
   kernel/sched/sched.h:2191:27: note: Variable declared here.
   extern struct sched_class __sched_class_lowest[];
                             ^
   kernel/sched/core.c:5714:2: note: Array decayed to pointer here.
    for_each_class(class) {
    ^
   kernel/sched/core.c:5714:2: note: Comparing pointers that point to diffe=
rent objects
    for_each_class(class) {
    ^
   kernel/sched/sched.h:2004:67: warning: Parameter 'p' can be declared wit=
h const [constParameter]
   static inline int task_current(struct rq *rq, struct task_struct *p)
                                                                     ^
   kernel/sched/core.c:2760:4: warning: Address of local auto-variable assi=
gned to a function parameter. [autoVariables]
      p->migration_pending =3D &my_pending;
      ^
   kernel/sched/core.c:9130:3: warning: Comparing pointers that point to di=
fferent objects [comparePointers]
     for_each_class(class) {
     ^
   kernel/sched/sched.h:2190:27: note: Variable declared here.
   extern struct sched_class __sched_class_highest[];
                             ^
   kernel/sched/core.c:9130:3: note: Array decayed to pointer here.
     for_each_class(class) {
     ^
   kernel/sched/sched.h:2191:27: note: Variable declared here.
   extern struct sched_class __sched_class_lowest[];
                             ^
   kernel/sched/core.c:9130:3: note: Array decayed to pointer here.
     for_each_class(class) {
     ^
   kernel/sched/core.c:9130:3: note: Comparing pointers that point to diffe=
rent objects
     for_each_class(class) {
     ^
   kernel/sched/core.c:9142:3: warning: Comparing pointers that point to di=
fferent objects [comparePointers]
     for_each_class(class) {
     ^
   kernel/sched/sched.h:2190:27: note: Variable declared here.
   extern struct sched_class __sched_class_highest[];
                             ^
   kernel/sched/core.c:9142:3: note: Array decayed to pointer here.
     for_each_class(class) {
     ^
   kernel/sched/sched.h:2191:27: note: Variable declared here.
   extern struct sched_class __sched_class_lowest[];
                             ^
   kernel/sched/core.c:9142:3: note: Array decayed to pointer here.
     for_each_class(class) {
     ^
   kernel/sched/core.c:9142:3: note: Comparing pointers that point to diffe=
rent objects
     for_each_class(class) {
     ^

vim +5714 kernel/sched/core.c

457d1f465778cc kernel/sched/core.c Chen Yu         2020-04-21  5679  =

^1da177e4c3f41 kernel/sched.c      Linus Torvalds  2005-04-16  5680  /*
dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5681   * Pic=
k up the highest-prio task:
^1da177e4c3f41 kernel/sched.c      Linus Torvalds  2005-04-16  5682   */
dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5683  static=
 inline struct task_struct *
539f65125d20aa kernel/sched/core.c Peter Zijlstra  2020-11-17  5684  __pick=
_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5685  {
49ee576809d837 kernel/sched/core.c Peter Zijlstra  2017-01-19  5686  	const=
 struct sched_class *class;
dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5687  	struc=
t task_struct *p;
dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5688  =

dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5689  	/*
0ba87bb27d66b7 kernel/sched/core.c Peter Zijlstra  2017-03-01  5690  	 * Op=
timization: we know that if all tasks are in the fair class we can
0ba87bb27d66b7 kernel/sched/core.c Peter Zijlstra  2017-03-01  5691  	 * ca=
ll that function directly, but only if the @prev task wasn't of a
b19a888c1e9bdf kernel/sched/core.c Tal Zussman     2020-11-12  5692  	 * hi=
gher scheduling class, because otherwise those lose the
0ba87bb27d66b7 kernel/sched/core.c Peter Zijlstra  2017-03-01  5693  	 * op=
portunity to pull in more work from other CPUs.
dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5694  	 */
546a3fee174969 kernel/sched/core.c Peter Zijlstra  2022-05-17  5695  	if (l=
ikely(!sched_class_above(prev->sched_class, &fair_sched_class) &&
0ba87bb27d66b7 kernel/sched/core.c Peter Zijlstra  2017-03-01  5696  		   r=
q->nr_running =3D=3D rq->cfs.h_nr_running)) {
0ba87bb27d66b7 kernel/sched/core.c Peter Zijlstra  2017-03-01  5697  =

5d7d605642b28a kernel/sched/core.c Peter Zijlstra  2019-11-08  5698  		p =
=3D pick_next_task_fair(rq, prev, rf);
6ccdc84b81a0a6 kernel/sched/core.c Peter Zijlstra  2014-04-24  5699  		if (=
unlikely(p =3D=3D RETRY_TASK))
67692435c411e5 kernel/sched/core.c Peter Zijlstra  2019-05-29  5700  			got=
o restart;
6ccdc84b81a0a6 kernel/sched/core.c Peter Zijlstra  2014-04-24  5701  =

1699949d3314e5 kernel/sched/core.c Masahiro Yamada 2021-05-19  5702  		/* A=
ssume the next prioritized class is idle_sched_class */
5d7d605642b28a kernel/sched/core.c Peter Zijlstra  2019-11-08  5703  		if (=
!p) {
f488e1057bb97b kernel/sched/core.c Peter Zijlstra  2019-11-08  5704  			put=
_prev_task(rq, prev);
98c2f700edb413 kernel/sched/core.c Peter Zijlstra  2019-11-08  5705  			p =
=3D pick_next_task_idle(rq);
f488e1057bb97b kernel/sched/core.c Peter Zijlstra  2019-11-08  5706  		}
6ccdc84b81a0a6 kernel/sched/core.c Peter Zijlstra  2014-04-24  5707  =

dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5708  		retu=
rn p;
^1da177e4c3f41 kernel/sched.c      Linus Torvalds  2005-04-16  5709  	}
^1da177e4c3f41 kernel/sched.c      Linus Torvalds  2005-04-16  5710  =

67692435c411e5 kernel/sched/core.c Peter Zijlstra  2019-05-29  5711  restar=
t:
457d1f465778cc kernel/sched/core.c Chen Yu         2020-04-21  5712  	put_p=
rev_task_balance(rq, prev, rf);
67692435c411e5 kernel/sched/core.c Peter Zijlstra  2019-05-29  5713  =

34f971f6f7988b kernel/sched.c      Peter Zijlstra  2010-09-22 @5714  	for_e=
ach_class(class) {
98c2f700edb413 kernel/sched/core.c Peter Zijlstra  2019-11-08  5715  		p =
=3D class->pick_next_task(rq);
67692435c411e5 kernel/sched/core.c Peter Zijlstra  2019-05-29  5716  		if (=
p)
dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5717  			ret=
urn p;
dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5718  	}
34f971f6f7988b kernel/sched.c      Peter Zijlstra  2010-09-22  5719  =

bc9ffef31bf598 kernel/sched/core.c Peter Zijlstra  2021-08-24  5720  	BUG()=
; /* The idle class should always have a runnable task. */
dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5721  }
^1da177e4c3f41 kernel/sched.c      Linus Torvalds  2005-04-16  5722  =


:::::: The code at line 5714 was first introduced by commit
:::::: 34f971f6f7988be4d014eec3e3526bee6d007ffa sched: Create special class=
 for stop/migrate work

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7302787143249432936==--

