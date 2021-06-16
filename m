Content-Type: multipart/mixed; boundary="===============1446574718102821412=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/events/intel/ds.c:45:16: warning: union member 'intel_x86_pebs_dse::st_reserved1' is never used. [unusedStructMember]
Date: Wed, 16 Jun 2021 17:08:09 +0800
Message-ID: <202106161757.d4kHgmKX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1446574718102821412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kan Liang <kan.liang@linux.intel.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   94f0b2d4a1d0c52035aef425da5e022bd2cb1c71
commit: 61b985e3e775a3a75fda04ce7ef1b1aefc4758bc perf/x86/intel: Add perf c=
ore PMU support for Sapphire Rapids
date:   5 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 5 months ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> arch/x86/mm/tlb.c:1191:8: warning: %ld in format string (no. 1) requires=
 'long' but the argument type is 'unsigned long'. [invalidPrintfArgType_sin=
t]
    len =3D sprintf(buf, "%ldn", tlb_single_page_flush_ceiling);
          ^
--
>> arch/x86/kernel/e820.c:1198:2: warning: int result is returned as long v=
alue. If the return value is long to avoid loss of information, then you ha=
ve loss of information. [truncLongCastReturn]
    return 64*1024*1024;
    ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/x86/mm/tlb.c:1191:8: warning: %ld in format string (no. 1) requires=
 'long' but the argument type is 'unsigned long'. [invalidPrintfArgType_sin=
t]
    len =3D sprintf(buf, "%ldn", tlb_single_page_flush_ceiling);
          ^
--
>> arch/x86/kernel/cpu/topology.c:138:27: warning: Shifting a negative valu=
e is technically undefined behaviour [shiftNegativeLHS]
    core_select_mask =3D (~(-1 << core_plus_mask_width)) >> ht_mask_width;
                             ^
   arch/x86/kernel/cpu/topology.c:139:26: warning: Shifting a negative valu=
e is technically undefined behaviour [shiftNegativeLHS]
    die_select_mask =3D (~(-1 << die_plus_mask_width)) >>
                            ^
--
>> arch/x86/kernel/cpu/cacheinfo.c:199:12: warning: union member 'l3_cache:=
:res' is never used. [unusedStructMember]
     unsigned res:2;
              ^
--
   In file included from arch/x86/events/intel/ds.c:
   arch/x86/events/perf_event.h:87:2: warning: Non-boolean value returned f=
rom function returning bool [returnNonBoolInBooleanFunction]
    return event->hw.flags & PERF_X86_EVENT_TOPDOWN;
    ^
   arch/x86/events/perf_event.h:987:2: warning: Non-boolean value returned =
from function returning bool [returnNonBoolInBooleanFunction]
    return hwc->flags & PERF_X86_EVENT_PAIR;
    ^
   arch/x86/events/intel/ds.c:1614:28: warning: Either the condition 'basic=
=3D=3DNULL' is redundant or there is pointer arithmetic with NULL pointer. =
[nullPointerArithmeticRedundantCheck]
    void *next_record =3D basic + 1;
                              ^
   arch/x86/events/intel/ds.c:1621:12: note: Assuming that condition 'basic=
=3D=3DNULL' is not redundant
    if (basic =3D=3D NULL)
              ^
   arch/x86/events/intel/ds.c:1614:28: note: Null pointer addition
    void *next_record =3D basic + 1;
                              ^
   arch/x86/events/intel/ds.c:41:16: warning: union member 'intel_x86_pebs_=
dse::ld_reserved' is never used. [unusedStructMember]
     unsigned int ld_reserved:24;
                  ^
>> arch/x86/events/intel/ds.c:45:16: warning: union member 'intel_x86_pebs_=
dse::st_reserved1' is never used. [unusedStructMember]
     unsigned int st_reserved1:3;
                  ^
>> arch/x86/events/intel/ds.c:48:16: warning: union member 'intel_x86_pebs_=
dse::st_reserved2' is never used. [unusedStructMember]
     unsigned int st_reserved2:26;
                  ^
>> arch/x86/events/intel/ds.c:54:16: warning: union member 'intel_x86_pebs_=
dse::ld_reserved3' is never used. [unusedStructMember]
     unsigned int ld_reserved3:26;
                  ^

vim +45 arch/x86/events/intel/ds.c

ca037701a02533 arch/x86/kernel/cpu/perf_event_intel_ds.c Peter Zijlstra   2=
010-03-02  30  =

ca037701a02533 arch/x86/kernel/cpu/perf_event_intel_ds.c Peter Zijlstra   2=
010-03-02  31   */
ca037701a02533 arch/x86/kernel/cpu/perf_event_intel_ds.c Peter Zijlstra   2=
010-03-02  32  =

f20093eef5f784 arch/x86/kernel/cpu/perf_event_intel_ds.c Stephane Eranian 2=
013-01-24  33  union intel_x86_pebs_dse {
f20093eef5f784 arch/x86/kernel/cpu/perf_event_intel_ds.c Stephane Eranian 2=
013-01-24  34  	u64 val;
f20093eef5f784 arch/x86/kernel/cpu/perf_event_intel_ds.c Stephane Eranian 2=
013-01-24  35  	struct {
f20093eef5f784 arch/x86/kernel/cpu/perf_event_intel_ds.c Stephane Eranian 2=
013-01-24  36  		unsigned int ld_dse:4;
f20093eef5f784 arch/x86/kernel/cpu/perf_event_intel_ds.c Stephane Eranian 2=
013-01-24  37  		unsigned int ld_stlb_miss:1;
f20093eef5f784 arch/x86/kernel/cpu/perf_event_intel_ds.c Stephane Eranian 2=
013-01-24  38  		unsigned int ld_locked:1;
61b985e3e775a3 arch/x86/events/intel/ds.c                Kan Liang        2=
021-01-28  39  		unsigned int ld_data_blk:1;
61b985e3e775a3 arch/x86/events/intel/ds.c                Kan Liang        2=
021-01-28  40  		unsigned int ld_addr_blk:1;
61b985e3e775a3 arch/x86/events/intel/ds.c                Kan Liang        2=
021-01-28  41  		unsigned int ld_reserved:24;
f20093eef5f784 arch/x86/kernel/cpu/perf_event_intel_ds.c Stephane Eranian 2=
013-01-24  42  	};
f20093eef5f784 arch/x86/kernel/cpu/perf_event_intel_ds.c Stephane Eranian 2=
013-01-24  43  	struct {
f20093eef5f784 arch/x86/kernel/cpu/perf_event_intel_ds.c Stephane Eranian 2=
013-01-24  44  		unsigned int st_l1d_hit:1;
f20093eef5f784 arch/x86/kernel/cpu/perf_event_intel_ds.c Stephane Eranian 2=
013-01-24 @45  		unsigned int st_reserved1:3;
f20093eef5f784 arch/x86/kernel/cpu/perf_event_intel_ds.c Stephane Eranian 2=
013-01-24  46  		unsigned int st_stlb_miss:1;
f20093eef5f784 arch/x86/kernel/cpu/perf_event_intel_ds.c Stephane Eranian 2=
013-01-24  47  		unsigned int st_locked:1;
f20093eef5f784 arch/x86/kernel/cpu/perf_event_intel_ds.c Stephane Eranian 2=
013-01-24 @48  		unsigned int st_reserved2:26;
f20093eef5f784 arch/x86/kernel/cpu/perf_event_intel_ds.c Stephane Eranian 2=
013-01-24  49  	};
61b985e3e775a3 arch/x86/events/intel/ds.c                Kan Liang        2=
021-01-28  50  	struct {
61b985e3e775a3 arch/x86/events/intel/ds.c                Kan Liang        2=
021-01-28  51  		unsigned int st_lat_dse:4;
61b985e3e775a3 arch/x86/events/intel/ds.c                Kan Liang        2=
021-01-28  52  		unsigned int st_lat_stlb_miss:1;
61b985e3e775a3 arch/x86/events/intel/ds.c                Kan Liang        2=
021-01-28  53  		unsigned int st_lat_locked:1;
61b985e3e775a3 arch/x86/events/intel/ds.c                Kan Liang        2=
021-01-28 @54  		unsigned int ld_reserved3:26;
61b985e3e775a3 arch/x86/events/intel/ds.c                Kan Liang        2=
021-01-28  55  	};
f20093eef5f784 arch/x86/kernel/cpu/perf_event_intel_ds.c Stephane Eranian 2=
013-01-24  56  };
f20093eef5f784 arch/x86/kernel/cpu/perf_event_intel_ds.c Stephane Eranian 2=
013-01-24  57  =

f20093eef5f784 arch/x86/kernel/cpu/perf_event_intel_ds.c Stephane Eranian 2=
013-01-24  58  =


:::::: The code at line 45 was first introduced by commit
:::::: f20093eef5f7843a25adfc0512617d4b1ff1aa6e perf/x86: Add memory profil=
ing via PEBS Load Latency

:::::: TO: Stephane Eranian <eranian@google.com>
:::::: CC: Arnaldo Carvalho de Melo <acme@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1446574718102821412==--

