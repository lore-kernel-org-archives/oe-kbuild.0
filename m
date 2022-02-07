Content-Type: multipart/mixed; boundary="===============7509418830974615945=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [frederic-dynticks:isolation/split-v3 8/8] kernel/sched/isolation.c:61:4: warning: Returning an integer in a function with pointer return type is not portable. [CastIntegerToAddressAtReturn]
Date: Mon, 07 Feb 2022 20:13:59 +0800
Message-ID: <202202072036.mZXl2wmj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7509418830974615945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Frederic Weisbecker <frederic@kernel.org>
CC: Juri Lelli <juri.lelli@redhat.com>
CC: Phil Auld <pauld@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynt=
icks.git isolation/split-v3
head:   1050d7e05a8ce89066befd77dcdc68400230d888
commit: 1050d7e05a8ce89066befd77dcdc68400230d888 [8/8] sched/isolation: Spl=
it housekeeping cpumask per isolation features
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/sched/isolation.c:61:4: warning: Returning an integer in a functi=
on with pointer return type is not portable. [CastIntegerToAddressAtReturn]
      return housekeeping.cpumasks[type];
      ^
>> net/core/net-sysfs.c:814:8: warning: snprintf format string requires 2 p=
arameters but only 1 is given. [wrongPrintfScanfArgNum]
    len =3D snprintf(buf, PAGE_SIZE, "%*pbn", cpumask_pr_args(mask));
          ^

vim +61 kernel/sched/isolation.c

7e56a1cf4b28f5 Frederic Weisbecker 2017-10-27  56  =

a07c6ead0e6641 Frederic Weisbecker 2021-10-05  57  const struct cpumask *ho=
usekeeping_cpumask(enum hk_type type)
7e56a1cf4b28f5 Frederic Weisbecker 2017-10-27  58  {
dfcb245e284812 Ingo Molnar         2018-12-03  59  	if (static_branch_unlik=
ely(&housekeeping_overridden))
1050d7e05a8ce8 Frederic Weisbecker 2021-10-11  60  		if (housekeeping.flags=
 & BIT(type))
1050d7e05a8ce8 Frederic Weisbecker 2021-10-11 @61  			return housekeeping.c=
pumasks[type];
7e56a1cf4b28f5 Frederic Weisbecker 2017-10-27  62  	return cpu_possible_mas=
k;
7e56a1cf4b28f5 Frederic Weisbecker 2017-10-27  63  }
7e56a1cf4b28f5 Frederic Weisbecker 2017-10-27  64  EXPORT_SYMBOL_GPL(housek=
eeping_cpumask);
7e56a1cf4b28f5 Frederic Weisbecker 2017-10-27  65  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7509418830974615945==--

