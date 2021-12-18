Content-Type: multipart/mixed; boundary="===============5678642771276578354=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 6656/8462] arch/arm64/kernel/perf_event.c:299:2: warning: Non-boolean value returned from function returning bool [returnNonBoolInBooleanFunction]
Date: Sat, 18 Dec 2021 18:20:40 +0800
Message-ID: <202112181839.GfSBYsmg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5678642771276578354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Rob Herring <robh@kernel.org>
CC: Will Deacon <will@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   c122052c3cb861b3e61a01d2c2ab9069e470663e
commit: 83a7a4d643d33a8b74a42229346b7ed7139fcef9 [6656/8462] arm64: perf: E=
nable PMU counter userspace access for perf event
:::::: branch date: 21 hours ago
:::::: commit date: 4 days ago
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm64/kernel/perf_event.c:299:2: warning: Non-boolean value returne=
d from function returning bool [returnNonBoolInBooleanFunction]
    return event->attr.config1 & 0x2;
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
--===============5678642771276578354==--

