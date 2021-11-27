Content-Type: multipart/mixed; boundary="===============4592288320060530411=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/events/perf_event.h:88:2: warning: Non-boolean value returned from function returning bool [returnNonBoolInBooleanFunction]
Date: Sat, 27 Nov 2021 10:02:03 +0800
Message-ID: <202111270942.HG1hBOHa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4592288320060530411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kan Liang <kan.liang@linux.intel.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: d9977c43bff895ed49a9d25e1f382b0a98bb271f perf/x86: Register hybrid =
PMUs
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/x86/mm/pat/set_memory.c:391:52: warning: Same expression on both si=
des of '||' because 'r1_start<=3Dr2_end&&r1_end>=3Dr2_start' and 'r2_start<=
=3Dr1_end&&r2_end>=3Dr1_start' represent the same value. [knownConditionTru=
eFalse]
    return (r1_start <=3D r2_end && r1_end >=3D r2_start) ||
                                                      ^
>> arch/x86/events/perf_event.h:88:2: warning: Non-boolean value returned f=
rom function returning bool [returnNonBoolInBooleanFunction]
    return event->hw.flags & PERF_X86_EVENT_TOPDOWN;
    ^
   arch/x86/events/perf_event.h:1064:2: warning: Non-boolean value returned=
 from function returning bool [returnNonBoolInBooleanFunction]
    return hwc->flags & PERF_X86_EVENT_PAIR;
    ^
>> arch/x86/events/core.c:2120:26: warning: Local variable hybrid_pmu shado=
ws outer function [shadowFunction]
     struct x86_hybrid_pmu *hybrid_pmu;
                            ^
   arch/x86/events/perf_event.h:660:47: note: Shadowed declaration
   static __always_inline struct x86_hybrid_pmu *hybrid_pmu(struct pmu *pmu)
                                                 ^
   arch/x86/events/core.c:2120:26: note: Shadow variable
     struct x86_hybrid_pmu *hybrid_pmu;
                            ^
>> arch/x86/kernel/apic/io_apic.c:1047:44: warning: Uninitialized variable:=
 irq [uninitvar]
      irq =3D alloc_isa_irq_from_domain(domain, irq,
                                              ^
   arch/x86/kernel/apic/io_apic.c:1060:9: warning: Uninitialized variable: =
irq [uninitvar]
    return irq;
           ^

vim +88 arch/x86/events/perf_event.h

7b2c05a15d29d05 Kan Liang 2020-07-23  85  =

7b2c05a15d29d05 Kan Liang 2020-07-23  86  static inline bool is_topdown_cou=
nt(struct perf_event *event)
7b2c05a15d29d05 Kan Liang 2020-07-23  87  {
7b2c05a15d29d05 Kan Liang 2020-07-23 @88  	return event->hw.flags & PERF_X8=
6_EVENT_TOPDOWN;
7b2c05a15d29d05 Kan Liang 2020-07-23  89  }
7b2c05a15d29d05 Kan Liang 2020-07-23  90  =


:::::: The code at line 88 was first introduced by commit
:::::: 7b2c05a15d29d0570a0d21da1e4fd5cbc85cbf13 perf/x86/intel: Generic sup=
port for hardware TopDown metrics

:::::: TO: Kan Liang <kan.liang@linux.intel.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4592288320060530411==--

