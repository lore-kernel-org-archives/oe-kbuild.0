Content-Type: multipart/mixed; boundary="===============0034732978516590565=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm64/kernel/perf_event.c:299:2: warning: Non-boolean value returned from function returning bool [returnNonBoolInBooleanFunction]
Date: Sat, 22 Jan 2022 14:49:35 +0800
Message-ID: <202201221432.s4zEgFoL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0034732978516590565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Rob Herring <robh@kernel.org>
CC: Will Deacon <will@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9b57f458985742bd1c585f4c7f36d04634ce1143
commit: 83a7a4d643d33a8b74a42229346b7ed7139fcef9 arm64: perf: Enable PMU co=
unter userspace access for perf event
date:   6 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 6 weeks ago
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm64/kernel/ptrace.c:1570:24: warning: Shifting a negative value i=
s technically undefined behaviour [shiftNegativeLHS]
    return (abs(num) - 1) >> 1;
                          ^
--
>> arch/arm64/kernel/perf_event.c:299:2: warning: Non-boolean value returne=
d from function returning bool [returnNonBoolInBooleanFunction]
    return event->attr.config1 & 0x2;
    ^
--
>> arch/arm64/kernel/traps.c:868:0: warning: There is an unknown macro here=
 somewhere. Configuration is required. If DEFINE_PER_CPU is a macro then pl=
ease configure it. [unknownMacro]
   =

   ^

vim +299 arch/arm64/kernel/perf_event.c

57d74123954dfe Will Deacon 2015-12-22  296  =

83a7a4d643d33a Rob Herring 2021-12-08  297  static inline bool armv8pmu_eve=
nt_want_user_access(struct perf_event *event)
83a7a4d643d33a Rob Herring 2021-12-08  298  {
83a7a4d643d33a Rob Herring 2021-12-08 @299  	return event->attr.config1 & 0=
x2;
83a7a4d643d33a Rob Herring 2021-12-08  300  }
83a7a4d643d33a Rob Herring 2021-12-08  301  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0034732978516590565==--

