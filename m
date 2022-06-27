Content-Type: multipart/mixed; boundary="===============0033874435155453294=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/sched/core.c:5714:2: warning: Comparing pointers that point to different objects [comparePointers]
Date: Tue, 28 Jun 2022 00:55:31 +0800
Message-ID: <202206280026.ndgvWMiG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0033874435155453294==
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
head:   03c765b0e3b4cb5063276b086c76f7a612856a9a
commit: 546a3fee174969ff323d70ff27b1ef181f0d7ceb sched: Reverse sched_class=
 layout
date:   6 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 6 weeks ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
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

457d1f465778ccb kernel/sched/core.c Chen Yu         2020-04-21  5679  =

^1da177e4c3f415 kernel/sched.c      Linus Torvalds  2005-04-16  5680  /*
dd41f596cda0d7d kernel/sched.c      Ingo Molnar     2007-07-09  5681   * Pi=
ck up the highest-prio task:
^1da177e4c3f415 kernel/sched.c      Linus Torvalds  2005-04-16  5682   */
dd41f596cda0d7d kernel/sched.c      Ingo Molnar     2007-07-09  5683  stati=
c inline struct task_struct *
539f65125d20aac kernel/sched/core.c Peter Zijlstra  2020-11-17  5684  __pic=
k_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
dd41f596cda0d7d kernel/sched.c      Ingo Molnar     2007-07-09  5685  {
49ee576809d8374 kernel/sched/core.c Peter Zijlstra  2017-01-19  5686  	cons=
t struct sched_class *class;
dd41f596cda0d7d kernel/sched.c      Ingo Molnar     2007-07-09  5687  	stru=
ct task_struct *p;
dd41f596cda0d7d kernel/sched.c      Ingo Molnar     2007-07-09  5688  =

dd41f596cda0d7d kernel/sched.c      Ingo Molnar     2007-07-09  5689  	/*
0ba87bb27d66b78 kernel/sched/core.c Peter Zijlstra  2017-03-01  5690  	 * O=
ptimization: we know that if all tasks are in the fair class we can
0ba87bb27d66b78 kernel/sched/core.c Peter Zijlstra  2017-03-01  5691  	 * c=
all that function directly, but only if the @prev task wasn't of a
b19a888c1e9bdf1 kernel/sched/core.c Tal Zussman     2020-11-12  5692  	 * h=
igher scheduling class, because otherwise those lose the
0ba87bb27d66b78 kernel/sched/core.c Peter Zijlstra  2017-03-01  5693  	 * o=
pportunity to pull in more work from other CPUs.
dd41f596cda0d7d kernel/sched.c      Ingo Molnar     2007-07-09  5694  	 */
546a3fee174969f kernel/sched/core.c Peter Zijlstra  2022-05-17  5695  	if (=
likely(!sched_class_above(prev->sched_class, &fair_sched_class) &&
0ba87bb27d66b78 kernel/sched/core.c Peter Zijlstra  2017-03-01  5696  		   =
rq->nr_running =3D=3D rq->cfs.h_nr_running)) {
0ba87bb27d66b78 kernel/sched/core.c Peter Zijlstra  2017-03-01  5697  =

5d7d605642b28a5 kernel/sched/core.c Peter Zijlstra  2019-11-08  5698  		p =
=3D pick_next_task_fair(rq, prev, rf);
6ccdc84b81a0a6c kernel/sched/core.c Peter Zijlstra  2014-04-24  5699  		if =
(unlikely(p =3D=3D RETRY_TASK))
67692435c411e5c kernel/sched/core.c Peter Zijlstra  2019-05-29  5700  			go=
to restart;
6ccdc84b81a0a6c kernel/sched/core.c Peter Zijlstra  2014-04-24  5701  =

1699949d3314e5d kernel/sched/core.c Masahiro Yamada 2021-05-19  5702  		/* =
Assume the next prioritized class is idle_sched_class */
5d7d605642b28a5 kernel/sched/core.c Peter Zijlstra  2019-11-08  5703  		if =
(!p) {
f488e1057bb97b8 kernel/sched/core.c Peter Zijlstra  2019-11-08  5704  			pu=
t_prev_task(rq, prev);
98c2f700edb413e kernel/sched/core.c Peter Zijlstra  2019-11-08  5705  			p =
=3D pick_next_task_idle(rq);
f488e1057bb97b8 kernel/sched/core.c Peter Zijlstra  2019-11-08  5706  		}
6ccdc84b81a0a6c kernel/sched/core.c Peter Zijlstra  2014-04-24  5707  =

dd41f596cda0d7d kernel/sched.c      Ingo Molnar     2007-07-09  5708  		ret=
urn p;
^1da177e4c3f415 kernel/sched.c      Linus Torvalds  2005-04-16  5709  	}
^1da177e4c3f415 kernel/sched.c      Linus Torvalds  2005-04-16  5710  =

67692435c411e5c kernel/sched/core.c Peter Zijlstra  2019-05-29  5711  resta=
rt:
457d1f465778ccb kernel/sched/core.c Chen Yu         2020-04-21  5712  	put_=
prev_task_balance(rq, prev, rf);
67692435c411e5c kernel/sched/core.c Peter Zijlstra  2019-05-29  5713  =

34f971f6f7988be kernel/sched.c      Peter Zijlstra  2010-09-22 @5714  	for_=
each_class(class) {
98c2f700edb413e kernel/sched/core.c Peter Zijlstra  2019-11-08  5715  		p =
=3D class->pick_next_task(rq);
67692435c411e5c kernel/sched/core.c Peter Zijlstra  2019-05-29  5716  		if =
(p)
dd41f596cda0d7d kernel/sched.c      Ingo Molnar     2007-07-09  5717  			re=
turn p;
dd41f596cda0d7d kernel/sched.c      Ingo Molnar     2007-07-09  5718  	}
34f971f6f7988be kernel/sched.c      Peter Zijlstra  2010-09-22  5719  =

bc9ffef31bf5981 kernel/sched/core.c Peter Zijlstra  2021-08-24  5720  	BUG(=
); /* The idle class should always have a runnable task. */
dd41f596cda0d7d kernel/sched.c      Ingo Molnar     2007-07-09  5721  }
^1da177e4c3f415 kernel/sched.c      Linus Torvalds  2005-04-16  5722  =


:::::: The code at line 5714 was first introduced by commit
:::::: 34f971f6f7988be4d014eec3e3526bee6d007ffa sched: Create special class=
 for stop/migrate work

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0033874435155453294==--

