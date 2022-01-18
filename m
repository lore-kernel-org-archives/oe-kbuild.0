Content-Type: multipart/mixed; boundary="===============2230503517479853335=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [vincent-guittot:test/scheduler 5/6] kernel/sched/fair.c:7013:14: warning: Shifting a negative value is technically undefined behaviour [shiftNegativeLHS]
Date: Tue, 18 Jan 2022 22:16:48 +0800
Message-ID: <202201182247.TAdMfOHi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2230503517479853335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vincent Guittot <vincent.guittot@linaro.org>

tree:   https://git.linaro.org/people/vincent.guittot/kernel.git test/sched=
uler
head:   a9981ba7105af116b85299ba3d40c34cbd92ac1e
commit: 9f75154f3ecc844d4032e69ba0f6657aa227b542 [5/6] sched/fair: Take int=
o account latency nice at wakeup
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   kernel/sched/fair.c:11334:62: warning: Same value in both branches of te=
rnary operator. [duplicateValueTernary]
    update_load_avg(cfs_rq, se, sched_feat(ATTACH_AGE_LOAD) ? 0 : SKIP_AGE_=
LOAD);
                                                                ^
>> kernel/sched/fair.c:7013:14: warning: Shifting a negative value is techn=
ically undefined behaviour [shiftNegativeLHS]
             -1 << NICE_0_LATENCY_SHIFT,
                ^
   kernel/sched/fair.c:6350:16: warning: Local variable task_util shadows o=
uter function [shadowFunction]
    unsigned long task_util, best_cap =3D 0;
                  ^
   kernel/sched/fair.c:3908:29: note: Shadowed declaration
   static inline unsigned long task_util(struct task_struct *p)
                               ^
   kernel/sched/fair.c:6350:16: note: Shadow variable
    unsigned long task_util, best_cap =3D 0;
                  ^
   kernel/sched/fair.c:6391:16: warning: Local variable task_util shadows o=
uter function [shadowFunction]
    unsigned long task_util;
                  ^
   kernel/sched/fair.c:3908:29: note: Shadowed declaration
   static inline unsigned long task_util(struct task_struct *p)
                               ^
   kernel/sched/fair.c:6391:16: note: Shadow variable
    unsigned long task_util;
                  ^
   kernel/sched/fair.c:6937:7: warning: Local variable min_vruntime shadows=
 outer function [shadowFunction]
     u64 min_vruntime;
         ^
   kernel/sched/fair.c:529:19: note: Shadowed declaration
   static inline u64 min_vruntime(u64 min_vruntime, u64 vruntime)
                     ^
   kernel/sched/fair.c:6937:7: note: Shadow variable
     u64 min_vruntime;
         ^
   kernel/sched/fair.c:10290:6: warning: Local variable update_next_balance=
 shadows outer function [shadowFunction]
    int update_next_balance =3D 0;
        ^
   kernel/sched/fair.c:10144:1: note: Shadowed declaration
   update_next_balance(struct sched_domain *sd, unsigned long *next_balance)
   ^
   kernel/sched/fair.c:10290:6: note: Shadow variable
    int update_next_balance =3D 0;
        ^

vim +7013 kernel/sched/fair.c

e7693a362ec84b kernel/sched_fair.c Gregory Haskins 2008-01-25  6997  =

9f75154f3ecc84 kernel/sched/fair.c Vincent Guittot 2021-11-09  6998  static=
 long wakeup_latency_gran(int latency_weight)
9f75154f3ecc84 kernel/sched/fair.c Vincent Guittot 2021-11-09  6999  {
9f75154f3ecc84 kernel/sched/fair.c Vincent Guittot 2021-11-09  7000  	long =
thresh =3D sysctl_sched_latency;
9f75154f3ecc84 kernel/sched/fair.c Vincent Guittot 2021-11-09  7001  =

9f75154f3ecc84 kernel/sched/fair.c Vincent Guittot 2021-11-09  7002  	if (!=
latency_weight)
9f75154f3ecc84 kernel/sched/fair.c Vincent Guittot 2021-11-09  7003  		retu=
rn 0;
9f75154f3ecc84 kernel/sched/fair.c Vincent Guittot 2021-11-09  7004  =

9f75154f3ecc84 kernel/sched/fair.c Vincent Guittot 2021-11-09  7005        =
  if (sched_feat(GENTLE_FAIR_SLEEPERS))
9f75154f3ecc84 kernel/sched/fair.c Vincent Guittot 2021-11-09  7006        =
                 thresh >>=3D 1;
9f75154f3ecc84 kernel/sched/fair.c Vincent Guittot 2021-11-09  7007  =

9f75154f3ecc84 kernel/sched/fair.c Vincent Guittot 2021-11-09  7008  	/*
9f75154f3ecc84 kernel/sched/fair.c Vincent Guittot 2021-11-09  7009  	 * Cl=
amp the delta to stay in the scheduler period range
9f75154f3ecc84 kernel/sched/fair.c Vincent Guittot 2021-11-09  7010  	 * [-=
sysctl_sched_latency:sysctl_sched_latency]
9f75154f3ecc84 kernel/sched/fair.c Vincent Guittot 2021-11-09  7011  	 */
9f75154f3ecc84 kernel/sched/fair.c Vincent Guittot 2021-11-09  7012  	laten=
cy_weight =3D clamp_t(long, latency_weight,
9f75154f3ecc84 kernel/sched/fair.c Vincent Guittot 2021-11-09 @7013  				  =
    -1 << NICE_0_LATENCY_SHIFT,
9f75154f3ecc84 kernel/sched/fair.c Vincent Guittot 2021-11-09  7014  				  =
    1 << NICE_0_LATENCY_SHIFT);
9f75154f3ecc84 kernel/sched/fair.c Vincent Guittot 2021-11-09  7015  =

9f75154f3ecc84 kernel/sched/fair.c Vincent Guittot 2021-11-09  7016  	retur=
n (thresh * latency_weight) >> NICE_0_LATENCY_SHIFT;
9f75154f3ecc84 kernel/sched/fair.c Vincent Guittot 2021-11-09  7017  }
9f75154f3ecc84 kernel/sched/fair.c Vincent Guittot 2021-11-09  7018  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2230503517479853335==--

