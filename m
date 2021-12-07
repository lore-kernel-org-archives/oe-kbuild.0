Content-Type: multipart/mixed; boundary="===============6523040817695213471=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arc/kernel/signal.c:79 save_arcv2_regs() warn: maybe return -EFAULT instead of the bytes remaining?
Date: Tue, 07 Dec 2021 16:58:46 +0800
Message-ID: <202112071619.EELmRDVg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6523040817695213471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vineet Gupta <vgupta@synopsys.com>
CC: linux-snps-arc(a)lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: 96f1b00138cb8f04c742c82d0a7c460b2202e887 ARCv2: save ABI registers =
across signal handling
date:   6 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 6 months ago
config: arc-randconfig-m031-20211207 (https://download.01.org/0day-ci/archi=
ve/20211207/202112071619.EELmRDVg-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/arc/kernel/signal.c:79 save_arcv2_regs() warn: maybe return -EFAULT in=
stead of the bytes remaining?
arch/arc/kernel/signal.c:96 restore_arcv2_regs() warn: maybe return -EFAULT=
 instead of the bytes remaining?

Old smatch warnings:
arch/arc/kernel/signal.c:198 sys_rt_sigreturn() error: uninitialized symbol=
 'sp'.
arch/arc/include/asm/thread_info.h:65 current_thread_info() error: uninitia=
lized symbol 'sp'.
arch/arc/kernel/signal.c:297 setup_rt_frame() warn: ignoring unreachable co=
de.
arch/arc/kernel/signal.c:312 setup_rt_frame() warn: ignoring unreachable co=
de.

vim +79 arch/arc/kernel/signal.c

c3581039b6c51a Vineet Gupta 2013-01-18  63  =

96f1b00138cb8f Vineet Gupta 2021-06-08  64  static int save_arcv2_regs(stru=
ct sigcontext *mctx, struct pt_regs *regs)
96f1b00138cb8f Vineet Gupta 2021-06-08  65  {
96f1b00138cb8f Vineet Gupta 2021-06-08  66  	int err =3D 0;
96f1b00138cb8f Vineet Gupta 2021-06-08  67  #ifndef CONFIG_ISA_ARCOMPACT
96f1b00138cb8f Vineet Gupta 2021-06-08  68  	struct user_regs_arcv2 v2abi;
96f1b00138cb8f Vineet Gupta 2021-06-08  69  =

96f1b00138cb8f Vineet Gupta 2021-06-08  70  	v2abi.r30 =3D regs->r30;
96f1b00138cb8f Vineet Gupta 2021-06-08  71  #ifdef CONFIG_ARC_HAS_ACCL_REGS
96f1b00138cb8f Vineet Gupta 2021-06-08  72  	v2abi.r58 =3D regs->r58;
96f1b00138cb8f Vineet Gupta 2021-06-08  73  	v2abi.r59 =3D regs->r59;
96f1b00138cb8f Vineet Gupta 2021-06-08  74  #else
96f1b00138cb8f Vineet Gupta 2021-06-08  75  	v2abi.r58 =3D v2abi.r59 =3D 0;
96f1b00138cb8f Vineet Gupta 2021-06-08  76  #endif
96f1b00138cb8f Vineet Gupta 2021-06-08  77  	err =3D __copy_to_user(&mctx->=
v2abi, &v2abi, sizeof(v2abi));
96f1b00138cb8f Vineet Gupta 2021-06-08  78  #endif
96f1b00138cb8f Vineet Gupta 2021-06-08 @79  	return err;
96f1b00138cb8f Vineet Gupta 2021-06-08  80  }
96f1b00138cb8f Vineet Gupta 2021-06-08  81  =

96f1b00138cb8f Vineet Gupta 2021-06-08  82  static int restore_arcv2_regs(s=
truct sigcontext *mctx, struct pt_regs *regs)
96f1b00138cb8f Vineet Gupta 2021-06-08  83  {
96f1b00138cb8f Vineet Gupta 2021-06-08  84  	int err =3D 0;
96f1b00138cb8f Vineet Gupta 2021-06-08  85  #ifndef CONFIG_ISA_ARCOMPACT
96f1b00138cb8f Vineet Gupta 2021-06-08  86  	struct user_regs_arcv2 v2abi;
96f1b00138cb8f Vineet Gupta 2021-06-08  87  =

96f1b00138cb8f Vineet Gupta 2021-06-08  88  	err =3D __copy_from_user(&v2ab=
i, &mctx->v2abi, sizeof(v2abi));
96f1b00138cb8f Vineet Gupta 2021-06-08  89  =

96f1b00138cb8f Vineet Gupta 2021-06-08  90  	regs->r30 =3D v2abi.r30;
96f1b00138cb8f Vineet Gupta 2021-06-08  91  #ifdef CONFIG_ARC_HAS_ACCL_REGS
96f1b00138cb8f Vineet Gupta 2021-06-08  92  	regs->r58 =3D v2abi.r58;
96f1b00138cb8f Vineet Gupta 2021-06-08  93  	regs->r59 =3D v2abi.r59;
96f1b00138cb8f Vineet Gupta 2021-06-08  94  #endif
96f1b00138cb8f Vineet Gupta 2021-06-08  95  #endif
96f1b00138cb8f Vineet Gupta 2021-06-08 @96  	return err;
96f1b00138cb8f Vineet Gupta 2021-06-08  97  }
96f1b00138cb8f Vineet Gupta 2021-06-08  98  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6523040817695213471==--

