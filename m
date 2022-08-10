Content-Type: multipart/mixed; boundary="===============7773446791697712034=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/riscv/kernel/traps.c:48 die() warn: variable dereferenced before check 'regs' (see line 46)
Date: Thu, 11 Aug 2022 05:43:45 +0800
Message-ID: <202208110538.uaLOQmBs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7773446791697712034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Xianting Tian <xianting.tian@linux.alibaba.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Guo Ren <guoren@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f41445645ab5d172e6090d00c332c335d8dba337
commit: 3f1901110a89b0e2e13adb2ac8d1a7102879ea98 RISC-V: Add fast call path=
 of crash_kexec()
date:   3 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-m031-20220810 (https://download.01.org/0day-ci/arc=
hive/20220811/202208110538.uaLOQmBs-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/riscv/kernel/traps.c:48 die() warn: variable dereferenced before check=
 'regs' (see line 46)

vim +/regs +48 arch/riscv/kernel/traps.c

76d2a0493a17d4 Palmer Dabbelt    2017-07-10  30  =

76d2a0493a17d4 Palmer Dabbelt    2017-07-10  31  void die(struct pt_regs *r=
egs, const char *str)
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  32  {
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  33  	static int die_counter;
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  34  	int ret;
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  35  =

76d2a0493a17d4 Palmer Dabbelt    2017-07-10  36  	oops_enter();
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  37  =

76d2a0493a17d4 Palmer Dabbelt    2017-07-10  38  	spin_lock_irq(&die_lock);
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  39  	console_verbose();
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  40  	bust_spinlocks(1);
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  41  =

76d2a0493a17d4 Palmer Dabbelt    2017-07-10  42  	pr_emerg("%s [#%d]\n", st=
r, ++die_counter);
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  43  	print_modules();
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  44  	show_regs(regs);
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  45  =

a4c3733d32a72f Christoph Hellwig 2019-10-28 @46  	ret =3D notify_die(DIE_OO=
PS, str, regs, 0, regs->cause, SIGSEGV);
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  47  =

3f1901110a89b0 Xianting Tian     2022-06-06 @48  	if (regs && kexec_should_=
crash(current))
3f1901110a89b0 Xianting Tian     2022-06-06  49  		crash_kexec(regs);
3f1901110a89b0 Xianting Tian     2022-06-06  50  =

76d2a0493a17d4 Palmer Dabbelt    2017-07-10  51  	bust_spinlocks(0);
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  52  	add_taint(TAINT_DIE, LOCK=
DEP_NOW_UNRELIABLE);
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  53  	spin_unlock_irq(&die_lock=
);
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  54  	oops_exit();
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  55  =

76d2a0493a17d4 Palmer Dabbelt    2017-07-10  56  	if (in_interrupt())
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  57  		panic("Fatal exception i=
n interrupt");
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  58  	if (panic_on_oops)
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  59  		panic("Fatal exception");
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  60  	if (ret !=3D NOTIFY_STOP)
0e25498f8cd43c Eric W. Biederman 2021-06-28  61  		make_task_dead(SIGSEGV);
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  62  }
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  63  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7773446791697712034==--

