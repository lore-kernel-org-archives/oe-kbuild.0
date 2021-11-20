Content-Type: multipart/mixed; boundary="===============6110745783190683985=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/events/intel/uncore.c:847:4: warning: %u in format string (no. 1) requires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType_uint]
Date: Sat, 20 Nov 2021 21:51:37 +0800
Message-ID: <202111202115.uSvWnxj7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6110745783190683985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kan Liang <kan.liang@linux.intel.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a90af8f15bdc9449ee2d24e1d73fa3f7e8633f81
commit: d6c754130435ab786711bed75d04a2388a6b4da8 perf/x86/intel/uncore: Gen=
eric support for the MSR type of uncore blocks
date:   8 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 8 months ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from arch/x86/events/intel/uncore.c:
   arch/x86/events/perf_event.h:87:2: warning: Non-boolean value returned f=
rom function returning bool [returnNonBoolInBooleanFunction]
    return event->hw.flags & PERF_X86_EVENT_TOPDOWN;
    ^
   arch/x86/events/perf_event.h:987:2: warning: Non-boolean value returned =
from function returning bool [returnNonBoolInBooleanFunction]
    return hwc->flags & PERF_X86_EVENT_PAIR;
    ^
>> arch/x86/events/intel/uncore.c:847:4: warning: %u in format string (no. =
1) requires 'unsigned int' but the argument type is 'signed int'. [invalidP=
rintfArgType_uint]
      sprintf(pmu->name, "uncore_type_%u", type->type_id);
      ^
   arch/x86/events/intel/uncore.c:849:4: warning: %u in format string (no. =
1) requires 'unsigned int' but the argument type is 'signed int'. [invalidP=
rintfArgType_uint]
      sprintf(pmu->name, "uncore_type_%u_%d",
      ^
>> arch/x86/events/intel/uncore.c:849:4: warning: %d in format string (no. =
2) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfAr=
gType_sint]
      sprintf(pmu->name, "uncore_type_%u_%d",
      ^

vim +847 arch/x86/events/intel/uncore.c

314d9f63f38509 arch/x86/kernel/cpu/perf_event_intel_uncore.c Yan, Zheng 201=
2-09-10  836  =

d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  837  static void uncore_get_pmu_name(struct intel_uncore_pmu *pmu)
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  838  {
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  839  	struct intel_uncore_type *type =3D pmu->type;
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  840  =

d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  841  	/*
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  842  	 * No uncore block name in discovery table.
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  843  	 * Use uncore_type_&typeid_&boxid as name.
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  844  	 */
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  845  	if (!type->name) {
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  846  		if (type->num_boxes =3D=3D 1)
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17 @847  			sprintf(pmu->name, "uncore_type_%u", type->type_id);
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  848  		else {
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17 @849  			sprintf(pmu->name, "uncore_type_%u_%d",
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  850  				type->type_id, type->box_ids[pmu->pmu_idx]);
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  851  		}
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  852  		return;
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  853  	}
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  854  =

d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  855  	if (type->num_boxes =3D=3D 1) {
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  856  		if (strlen(type->name) > 0)
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  857  			sprintf(pmu->name, "uncore_%s", type->name);
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  858  		else
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  859  			sprintf(pmu->name, "uncore");
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  860  	} else
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  861  		sprintf(pmu->name, "uncore_%s_%d", type->name, pmu->pmu_idx=
);
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  862  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6110745783190683985==--

