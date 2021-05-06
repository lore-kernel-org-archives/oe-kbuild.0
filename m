Content-Type: multipart/mixed; boundary="===============7757084925858032361=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/8] sched/fair: Maintain the identity of idle-core
Date: Fri, 07 May 2021 04:24:54 +0800
Message-ID: <202105070458.b5Z0ZR1h-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7757084925858032361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210506164543.90688-3-srikar@linux.vnet.ibm.com>
References: <20210506164543.90688-3-srikar@linux.vnet.ibm.com>
TO: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
TO: Ingo Molnar <mingo@kernel.org>
TO: Peter Zijlstra <peterz@infradead.org>
CC: LKML <linux-kernel@vger.kernel.org>
CC: Mel Gorman <mgorman@suse.de>
CC: Rik van Riel <riel@surriel.com>
CC: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Valentin Schneider <valentin.schneider@arm.com>
CC: Vincent Guittot <vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>

Hi Srikar,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on v5.12]
[cannot apply to tip/sched/core tip/master linus/master next-20210506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Srikar-Dronamraju/sched-fa=
ir-wake_affine-improvements/20210507-004927
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
1fe5501ba1abf2b7e78295df73675423bd6899a0
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:10894:62: warning: Same value in both branches of te=
rnary operator. [duplicateValueTernary]
    update_load_avg(cfs_rq, se, sched_feat(ATTACH_AGE_LOAD) ? 0 : SKIP_AGE_=
LOAD);
                                                                ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/sched/fair.c:6113:2: warning: Non-boolean value returned from fun=
ction returning bool [returnNonBoolInBooleanFunction]
    return def;
    ^
   kernel/sched/fair.c:6199:16: warning: Local variable task_util shadows o=
uter function [shadowFunction]
    unsigned long task_util, best_cap =3D 0;
                  ^
   kernel/sched/fair.c:3881:29: note: Shadowed declaration
   static inline unsigned long task_util(struct task_struct *p)
                               ^
   kernel/sched/fair.c:6199:16: note: Shadow variable
    unsigned long task_util, best_cap =3D 0;
                  ^
   kernel/sched/fair.c:6239:16: warning: Local variable task_util shadows o=
uter function [shadowFunction]
    unsigned long task_util;
                  ^
   kernel/sched/fair.c:3881:29: note: Shadowed declaration
   static inline unsigned long task_util(struct task_struct *p)
                               ^
   kernel/sched/fair.c:6239:16: note: Shadow variable
    unsigned long task_util;
                  ^
   kernel/sched/fair.c:6528:17: warning: Local variable cpu_util shadows ou=
ter function [shadowFunction]
     unsigned long cpu_util, util_cfs =3D cpu_util_next(cpu, p, dst_cpu);
                   ^
   kernel/sched/fair.c:5450:29: note: Shadowed declaration
   static inline unsigned long cpu_util(int cpu);
                               ^
   kernel/sched/fair.c:6528:17: note: Shadow variable
     unsigned long cpu_util, util_cfs =3D cpu_util_next(cpu, p, dst_cpu);
                   ^
   kernel/sched/fair.c:6789:7: warning: Local variable min_vruntime shadows=
 outer function [shadowFunction]
     u64 min_vruntime;
         ^
   kernel/sched/fair.c:525:19: note: Shadowed declaration
   static inline u64 min_vruntime(u64 min_vruntime, u64 vruntime)
                     ^
   kernel/sched/fair.c:6789:7: note: Shadow variable
     u64 min_vruntime;
         ^
   kernel/sched/fair.c:9998:6: warning: Local variable update_next_balance =
shadows outer function [shadowFunction]
    int update_next_balance =3D 0;
        ^
   kernel/sched/fair.c:9870:1: note: Shadowed declaration
   update_next_balance(struct sched_domain *sd, unsigned long *next_balance)
   ^
   kernel/sched/fair.c:9998:6: note: Shadow variable
    int update_next_balance =3D 0;
        ^

vim +6113 kernel/sched/fair.c

10e2f1acd0106c0 Peter Zijlstra    2016-05-09  6110  =

c6513fba6f118be Srikar Dronamraju 2021-05-06  6111  static inline bool get_=
idle_core(int cpu, int def)
9fe1f127b913318 Mel Gorman        2021-01-27  6112  {
9fe1f127b913318 Mel Gorman        2021-01-27 @6113  	return def;
9fe1f127b913318 Mel Gorman        2021-01-27  6114  }
10e2f1acd0106c0 Peter Zijlstra    2016-05-09  6115  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7757084925858032361==--

