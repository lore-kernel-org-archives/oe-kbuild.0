Content-Type: multipart/mixed; boundary="===============2945400504789145391=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [peterz-queue:sched/wip.umcg 6/6] include/linux/entry-common.h:245 irqentry_irq_disable() warn: bitwise AND condition is false here
Date: Sat, 22 Jan 2022 07:58:51 +0800
Message-ID: <202201220722.NKB2tIJb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2945400504789145391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sc=
hed/wip.umcg
head:   90712a68ed7dfc7f7f099167c58f0f45c1b81da8
commit: 90712a68ed7dfc7f7f099167c58f0f45c1b81da8 [6/6] sched: User Mode Con=
curency Groups
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-m001-20220117 (https://download.01.org/0day-ci/ar=
chive/20220122/202201220722.NKB2tIJb-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
include/linux/entry-common.h:245 irqentry_irq_disable() warn: bitwise AND c=
ondition is false here
include/linux/entry-common.h:232 irqentry_irq_enable() warn: bitwise AND co=
ndition is false here

vim +245 include/linux/entry-common.h

a9f3a74a29af09 Thomas Gleixner 2020-07-22  221  =

f695568dc39e5b Peter Zijlstra  2022-01-20  222  /**
f695568dc39e5b Peter Zijlstra  2022-01-20  223   * irqentry_irq_enable - Co=
nditionally enable IRQs from exceptions
f695568dc39e5b Peter Zijlstra  2022-01-20  224   *
f695568dc39e5b Peter Zijlstra  2022-01-20  225   * Common code for exceptio=
ns to (re)enable IRQs, typically done to allow
f695568dc39e5b Peter Zijlstra  2022-01-20  226   * from-user exceptions to =
schedule (since they run on the task stack).
f695568dc39e5b Peter Zijlstra  2022-01-20  227   */
f695568dc39e5b Peter Zijlstra  2022-01-20  228  static inline void irqentry=
_irq_enable(struct pt_regs *regs)
f695568dc39e5b Peter Zijlstra  2022-01-20  229  {
90712a68ed7dfc Peter Zijlstra  2021-12-14  230  	if (!regs_irqs_disabled(re=
gs)) {
f695568dc39e5b Peter Zijlstra  2022-01-20  231  		local_irq_enable();
90712a68ed7dfc Peter Zijlstra  2021-12-14 @232  		if (user_mode(regs) && (c=
urrent->flags & PF_UMCG_WORKER))
90712a68ed7dfc Peter Zijlstra  2021-12-14  233  			umcg_sys_enter(regs, -1);
90712a68ed7dfc Peter Zijlstra  2021-12-14  234  	}
f695568dc39e5b Peter Zijlstra  2022-01-20  235  }
f695568dc39e5b Peter Zijlstra  2022-01-20  236  =

f695568dc39e5b Peter Zijlstra  2022-01-20  237  /**
f695568dc39e5b Peter Zijlstra  2022-01-20  238   * irqentry_irq_disable - C=
onditionally disable IRQs from exceptions
f695568dc39e5b Peter Zijlstra  2022-01-20  239   *
f695568dc39e5b Peter Zijlstra  2022-01-20  240   * Counterpart of irqentry_=
irq_enable().
f695568dc39e5b Peter Zijlstra  2022-01-20  241   */
f695568dc39e5b Peter Zijlstra  2022-01-20  242  static inline void irqentry=
_irq_disable(struct pt_regs *regs)
f695568dc39e5b Peter Zijlstra  2022-01-20  243  {
90712a68ed7dfc Peter Zijlstra  2021-12-14  244  	if (!regs_irqs_disabled(re=
gs)) {
90712a68ed7dfc Peter Zijlstra  2021-12-14 @245  		if (user_mode(regs) && (c=
urrent->flags & PF_UMCG_WORKER))
90712a68ed7dfc Peter Zijlstra  2021-12-14  246  			umcg_sys_exit(regs);
f695568dc39e5b Peter Zijlstra  2022-01-20  247  		local_irq_disable();
f695568dc39e5b Peter Zijlstra  2022-01-20  248  	}
90712a68ed7dfc Peter Zijlstra  2021-12-14  249  }
f695568dc39e5b Peter Zijlstra  2022-01-20  250  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2945400504789145391==--

