Content-Type: multipart/mixed; boundary="===============6358304243121688325=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/cpumask.h:407 cpumask_test_and_clear_cpu() warn: signedness bug returning '(-128)'
Date: Fri, 16 Sep 2022 23:35:12 +0800
Message-ID: <202209162348.W0VjIOBw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6358304243121688325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Yury Norov <yury.norov@gmail.com>

Hi Yury,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6879c2d3b96039ff1668b4328a4d0dd3ea952cff
commit: cb32c285cc10e428589194e30233d673e7c23c72 cpumask: change return typ=
es to bool where appropriate
date:   9 weeks ago
:::::: branch date: 79 minutes ago
:::::: commit date: 9 weeks ago
config: m68k-randconfig-m031-20220914 (https://download.01.org/0day-ci/arch=
ive/20220916/202209162348.W0VjIOBw-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
include/linux/cpumask.h:407 cpumask_test_and_clear_cpu() warn: signedness b=
ug returning '(-128)'

vim +407 include/linux/cpumask.h

2d3854a37e8b76 Rusty Russell  2008-11-05  395  =

54fdade1c33323 Xiao Guangrong 2009-09-22  396  /**
54fdade1c33323 Xiao Guangrong 2009-09-22  397   * cpumask_test_and_clear_cp=
u - atomically test and clear a cpu in a cpumask
54fdade1c33323 Xiao Guangrong 2009-09-22  398   * @cpu: cpu number (< nr_cp=
u_ids)
54fdade1c33323 Xiao Guangrong 2009-09-22  399   * @cpumask: the cpumask poi=
nter
54fdade1c33323 Xiao Guangrong 2009-09-22  400   *
cb32c285cc10e4 Yury Norov     2022-07-01  401   * Returns true if @cpu is s=
et in old bitmap of @cpumask, else returns false
c777ad69185de9 Alex Shi       2012-05-28  402   *
54fdade1c33323 Xiao Guangrong 2009-09-22  403   * test_and_clear_bit wrappe=
r for cpumasks.
54fdade1c33323 Xiao Guangrong 2009-09-22  404   */
cb32c285cc10e4 Yury Norov     2022-07-01  405  static __always_inline bool =
cpumask_test_and_clear_cpu(int cpu, struct cpumask *cpumask)
54fdade1c33323 Xiao Guangrong 2009-09-22  406  {
54fdade1c33323 Xiao Guangrong 2009-09-22 @407  	return test_and_clear_bit(c=
pumask_check(cpu), cpumask_bits(cpumask));
54fdade1c33323 Xiao Guangrong 2009-09-22  408  }
54fdade1c33323 Xiao Guangrong 2009-09-22  409  =


:::::: The code@line 407 was first introduced by commit
:::::: 54fdade1c3332391948ec43530c02c4794a38172 generic-ipi: make struct ca=
ll_function_data lockless

:::::: TO: Xiao Guangrong <xiaoguangrong@cn.fujitsu.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6358304243121688325==--

