Content-Type: multipart/mixed; boundary="===============6100774252088836743=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/coredump.c:399:15: warning: Redundant initialization for 'core_waiters'. The initialized value is overwritten before it is read. [redundantInitialization]
Date: Fri, 17 Jun 2022 17:50:56 +0800
Message-ID: <202206171716.V1BXtxCY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6100774252088836743==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/coredu=
mp.c:399:15: warning: Redundant initialization for 'core_waiters'. The init=
ialized value is overwritten before it is read. [redundantInitialization]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Eric W. Biederman" <ebiederm@xmission.com>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   47700948a4abb4a5ae13ef943ff682a7f327547a
commit: 0258b5fd7c7124b87e185a1a9322d2c66b1876b7 coredump: Limit coredumps =
to a single thread group
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
compiler: mips-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 0258b5fd7c7124b87e185a1a9322d2c66b1876b7
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/coredump.c:399:15: warning: Redundant initialization for 'core_waiter=
s'. The initialized value is overwritten before it is read. [redundantIniti=
alization]
    core_waiters =3D zap_threads(tsk, core_state, exit_code);
                 ^
   fs/coredump.c:393:19: note: core_waiters is initialized
    int core_waiters =3D -EBUSY;
                     ^
   fs/coredump.c:399:15: note: core_waiters is overwritten
    core_waiters =3D zap_threads(tsk, core_state, exit_code);
                 ^

vim +/core_waiters +399 fs/coredump.c

10c28d937e2cca5 Alex Kelly        2012-09-26  389  =

10c28d937e2cca5 Alex Kelly        2012-09-26  390  static int coredump_wait=
(int exit_code, struct core_state *core_state)
10c28d937e2cca5 Alex Kelly        2012-09-26  391  {
10c28d937e2cca5 Alex Kelly        2012-09-26  392  	struct task_struct *tsk=
 =3D current;
10c28d937e2cca5 Alex Kelly        2012-09-26  393  	int core_waiters =3D -E=
BUSY;
10c28d937e2cca5 Alex Kelly        2012-09-26  394  =

10c28d937e2cca5 Alex Kelly        2012-09-26  395  	init_completion(&core_s=
tate->startup);
10c28d937e2cca5 Alex Kelly        2012-09-26  396  	core_state->dumper.task=
 =3D tsk;
10c28d937e2cca5 Alex Kelly        2012-09-26  397  	core_state->dumper.next=
 =3D NULL;
10c28d937e2cca5 Alex Kelly        2012-09-26  398  =

0258b5fd7c7124b Eric W. Biederman 2021-09-22 @399  	core_waiters =3D zap_th=
reads(tsk, core_state, exit_code);
10c28d937e2cca5 Alex Kelly        2012-09-26  400  	if (core_waiters > 0) {
10c28d937e2cca5 Alex Kelly        2012-09-26  401  		struct core_thread *pt=
r;
10c28d937e2cca5 Alex Kelly        2012-09-26  402  =

70d78fe7c8b640b Andrey Ryabinin   2016-11-10  403  		freezer_do_not_count();
10c28d937e2cca5 Alex Kelly        2012-09-26  404  		wait_for_completion(&c=
ore_state->startup);
70d78fe7c8b640b Andrey Ryabinin   2016-11-10  405  		freezer_count();
10c28d937e2cca5 Alex Kelly        2012-09-26  406  		/*
10c28d937e2cca5 Alex Kelly        2012-09-26  407  		 * Wait for all the th=
reads to become inactive, so that
10c28d937e2cca5 Alex Kelly        2012-09-26  408  		 * all the thread cont=
ext (extended register state, like
10c28d937e2cca5 Alex Kelly        2012-09-26  409  		 * fpu etc) gets copie=
d to the memory.
10c28d937e2cca5 Alex Kelly        2012-09-26  410  		 */
10c28d937e2cca5 Alex Kelly        2012-09-26  411  		ptr =3D core_state->du=
mper.next;
10c28d937e2cca5 Alex Kelly        2012-09-26  412  		while (ptr !=3D NULL) {
10c28d937e2cca5 Alex Kelly        2012-09-26  413  			wait_task_inactive(pt=
r->task, 0);
10c28d937e2cca5 Alex Kelly        2012-09-26  414  			ptr =3D ptr->next;
10c28d937e2cca5 Alex Kelly        2012-09-26  415  		}
10c28d937e2cca5 Alex Kelly        2012-09-26  416  	}
10c28d937e2cca5 Alex Kelly        2012-09-26  417  =

10c28d937e2cca5 Alex Kelly        2012-09-26  418  	return core_waiters;
10c28d937e2cca5 Alex Kelly        2012-09-26  419  }
10c28d937e2cca5 Alex Kelly        2012-09-26  420  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6100774252088836743==--

