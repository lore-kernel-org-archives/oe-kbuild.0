Content-Type: multipart/mixed; boundary="===============3349347124970894685=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/base/arch_numa.c:58:2: warning: Returning an integer in a function with pointer return type is not portable.
Date: Sat, 27 Feb 2021 10:08:18 +0800
Message-ID: <202102271014.dFKw9YGQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3349347124970894685==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Atish Patra <atish.patra@wdc.com>
CC: Palmer Dabbelt <palmerdabbelt@google.com>
CC: Greentime Hu <greentime.hu@sifive.com>
CC: Anup Patel <anup@brainfault.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3fb6d0e00efc958d01c2f109c8453033a2d96796
commit: 4f0e8eef772ee4438f304b2178bc28c958b6c13d riscv: Add numa support fo=
r riscv64 platform
date:   6 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 weeks ago
compiler: riscv32-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/base/arch_numa.c:58:2: warning: Returning an integer in a functi=
on with pointer return type is not portable. [CastIntegerToAddressAtReturn]
    return node_to_cpumask_map[node];
    ^

vim +58 drivers/base/arch_numa.c

a194c5f2d2b3a0 arch/arm64/mm/numa.c Zhengyuan Liu       2020-09-21  48  =

a194c5f2d2b3a0 arch/arm64/mm/numa.c Zhengyuan Liu       2020-09-21  49  	if=
 (node =3D=3D NUMA_NO_NODE)
a194c5f2d2b3a0 arch/arm64/mm/numa.c Zhengyuan Liu       2020-09-21  50  		r=
eturn cpu_all_mask;
a194c5f2d2b3a0 arch/arm64/mm/numa.c Zhengyuan Liu       2020-09-21  51  =

a194c5f2d2b3a0 arch/arm64/mm/numa.c Zhengyuan Liu       2020-09-21  52  	if=
 (WARN_ON(node < 0 || node >=3D nr_node_ids))
1a2db300348b79 arch/arm64/mm/numa.c Ganapatrao Kulkarni 2016-04-08  53  		r=
eturn cpu_none_mask;
1a2db300348b79 arch/arm64/mm/numa.c Ganapatrao Kulkarni 2016-04-08  54  =

1a2db300348b79 arch/arm64/mm/numa.c Ganapatrao Kulkarni 2016-04-08  55  	if=
 (WARN_ON(node_to_cpumask_map[node] =3D=3D NULL))
1a2db300348b79 arch/arm64/mm/numa.c Ganapatrao Kulkarni 2016-04-08  56  		r=
eturn cpu_online_mask;
1a2db300348b79 arch/arm64/mm/numa.c Ganapatrao Kulkarni 2016-04-08  57  =

1a2db300348b79 arch/arm64/mm/numa.c Ganapatrao Kulkarni 2016-04-08 @58  	re=
turn node_to_cpumask_map[node];
1a2db300348b79 arch/arm64/mm/numa.c Ganapatrao Kulkarni 2016-04-08  59  }
1a2db300348b79 arch/arm64/mm/numa.c Ganapatrao Kulkarni 2016-04-08  60  EXP=
ORT_SYMBOL(cpumask_of_node);
1a2db300348b79 arch/arm64/mm/numa.c Ganapatrao Kulkarni 2016-04-08  61  =


:::::: The code at line 58 was first introduced by commit
:::::: 1a2db300348b799479d2d22b84d51b27ad0458c7 arm64, numa: Add NUMA suppo=
rt for arm64 platforms.

:::::: TO: Ganapatrao Kulkarni <gkulkarni@caviumnetworks.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3349347124970894685==--

