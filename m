Content-Type: multipart/mixed; boundary="===============0586939819403109466=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/um/include/asm/thread_info.h:47:9: sparse: sparse: context imbalance in 'RCU_in_HARDIRQ' - wrong count at exit
Date: Mon, 10 May 2021 22:22:37 +0800
Message-ID: <202105102227.2lH6jlAI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0586939819403109466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Boqun Feng <boqun.feng@gmail.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6efb943b8616ec53a5e444193dccf1af9ad627b5
commit: 9271a40d2a1429113160ccc4c16150921600bcc1 lockdep/selftest: Add wait=
 context selftests
date:   4 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 4 months ago
config: um-randconfig-s031-20210510 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9271a40d2a1429113160ccc4c16150921600bcc1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9271a40d2a1429113160ccc4c16150921600bcc1
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D=
1 ARCH=3Dum =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   lib/locking-selftest.c:298:1: sparse: sparse: context imbalance in 'AA_s=
pin' - wrong count at exit
   lib/locking-selftest.c:300:1: sparse: sparse: context imbalance in 'AA_w=
lock' - wrong count at exit
   lib/locking-selftest.c:302:1: sparse: sparse: context imbalance in 'AA_r=
lock' - wrong count at exit
   lib/locking-selftest.c:321:13: sparse: sparse: context imbalance in 'rlo=
ck_AA1' - wrong count at exit
   lib/locking-selftest.c:327:13: sparse: sparse: context imbalance in 'rlo=
ck_AA1B' - wrong count at exit
   lib/locking-selftest.c:347:13: sparse: sparse: context imbalance in 'rlo=
ck_AA2' - wrong count at exit
   lib/locking-selftest.c:359:13: sparse: sparse: context imbalance in 'rlo=
ck_AA3' - wrong count at exit
   lib/locking-selftest.c:722:1: sparse: sparse: context imbalance in 'doub=
le_unlock_spin' - unexpected unlock
   lib/locking-selftest.c:724:1: sparse: sparse: context imbalance in 'doub=
le_unlock_wlock' - unexpected unlock
   lib/locking-selftest.c:726:1: sparse: sparse: context imbalance in 'doub=
le_unlock_rlock' - unexpected unlock
   lib/locking-selftest.c:753:1: sparse: sparse: context imbalance in 'init=
_held_spin' - wrong count at exit
   lib/locking-selftest.c:755:1: sparse: sparse: context imbalance in 'init=
_held_wlock' - wrong count at exit
   lib/locking-selftest.c:757:1: sparse: sparse: context imbalance in 'init=
_held_rlock' - wrong count at exit
   lib/locking-selftest.c:2456:13: sparse: sparse: context imbalance in 'rc=
u_exit' - unexpected unlock
   lib/locking-selftest.c:2465:13: sparse: sparse: context imbalance in 'rc=
u_bh_exit' - unexpected unlock
   lib/locking-selftest.c:2474:13: sparse: sparse: context imbalance in 'rc=
u_sched_exit' - unexpected unlock
   lib/locking-selftest.c:2493:13: sparse: sparse: context imbalance in 'ra=
w_spinlock_exit' - unexpected unlock
   lib/locking-selftest.c:2502:13: sparse: sparse: context imbalance in 'sp=
inlock_exit' - unexpected unlock
   lib/locking-selftest.c: note: in included file (through include/linux/th=
read_info.h, include/asm-generic/preempt.h, arch/um/include/generated/asm/p=
reempt.h, ...):
>> arch/um/include/asm/thread_info.h:47:9: sparse: sparse: context imbalanc=
e in 'RCU_in_HARDIRQ' - wrong count at exit
>> arch/um/include/asm/thread_info.h:47:9: sparse: sparse: context imbalanc=
e in 'RCU_in_NOTTHREADED_HARDIRQ' - wrong count at exit
>> arch/um/include/asm/thread_info.h:47:9: sparse: sparse: context imbalanc=
e in 'RCU_in_SOFTIRQ' - wrong count at exit
   lib/locking-selftest.c:2573:1: sparse: sparse: context imbalance in 'RCU=
_in_RCU' - wrong count at exit
   lib/locking-selftest.c:2573:1: sparse: sparse: context imbalance in 'RCU=
_in_RCU_BH' - wrong count at exit
   lib/locking-selftest.c:2573:1: sparse: sparse: context imbalance in 'RCU=
_in_RCU_CALLBACK' - wrong count at exit
   lib/locking-selftest.c:2573:1: sparse: sparse: context imbalance in 'RCU=
_in_RCU_SCHED' - wrong count at exit
   lib/locking-selftest.c:2573:1: sparse: sparse: context imbalance in 'RCU=
_in_RAW_SPINLOCK' - wrong count at exit
   lib/locking-selftest.c:2573:1: sparse: sparse: context imbalance in 'RCU=
_in_SPINLOCK' - wrong count at exit
   lib/locking-selftest.c:2573:1: sparse: sparse: context imbalance in 'RCU=
_in_MUTEX' - wrong count at exit
>> arch/um/include/asm/thread_info.h:47:9: sparse: sparse: context imbalanc=
e in 'RAW_SPINLOCK_in_HARDIRQ' - wrong count at exit
>> arch/um/include/asm/thread_info.h:47:9: sparse: sparse: context imbalanc=
e in 'RAW_SPINLOCK_in_NOTTHREADED_HARDIRQ' - wrong count at exit
>> arch/um/include/asm/thread_info.h:47:9: sparse: sparse: context imbalanc=
e in 'RAW_SPINLOCK_in_SOFTIRQ' - wrong count at exit
   lib/locking-selftest.c:2574:1: sparse: sparse: context imbalance in 'RAW=
_SPINLOCK_in_RCU' - wrong count at exit
   lib/locking-selftest.c:2574:1: sparse: sparse: context imbalance in 'RAW=
_SPINLOCK_in_RCU_BH' - wrong count at exit
   lib/locking-selftest.c:2574:1: sparse: sparse: context imbalance in 'RAW=
_SPINLOCK_in_RCU_CALLBACK' - wrong count at exit
   lib/locking-selftest.c:2574:1: sparse: sparse: context imbalance in 'RAW=
_SPINLOCK_in_RCU_SCHED' - wrong count at exit
   lib/locking-selftest.c:2574:1: sparse: sparse: context imbalance in 'RAW=
_SPINLOCK_in_RAW_SPINLOCK' - wrong count at exit
   lib/locking-selftest.c:2574:1: sparse: sparse: context imbalance in 'RAW=
_SPINLOCK_in_SPINLOCK' - wrong count at exit
   lib/locking-selftest.c:2574:1: sparse: sparse: context imbalance in 'RAW=
_SPINLOCK_in_MUTEX' - wrong count at exit
>> arch/um/include/asm/thread_info.h:47:9: sparse: sparse: context imbalanc=
e in 'SPINLOCK_in_HARDIRQ' - wrong count at exit
>> arch/um/include/asm/thread_info.h:47:9: sparse: sparse: context imbalanc=
e in 'SPINLOCK_in_NOTTHREADED_HARDIRQ' - wrong count at exit
>> arch/um/include/asm/thread_info.h:47:9: sparse: sparse: context imbalanc=
e in 'SPINLOCK_in_SOFTIRQ' - wrong count at exit
   lib/locking-selftest.c:2575:1: sparse: sparse: context imbalance in 'SPI=
NLOCK_in_RCU' - wrong count at exit
   lib/locking-selftest.c:2575:1: sparse: sparse: context imbalance in 'SPI=
NLOCK_in_RCU_BH' - wrong count at exit
   lib/locking-selftest.c:2575:1: sparse: sparse: context imbalance in 'SPI=
NLOCK_in_RCU_CALLBACK' - wrong count at exit
   lib/locking-selftest.c:2575:1: sparse: sparse: context imbalance in 'SPI=
NLOCK_in_RCU_SCHED' - wrong count at exit
   lib/locking-selftest.c:2575:1: sparse: sparse: context imbalance in 'SPI=
NLOCK_in_RAW_SPINLOCK' - wrong count at exit
   lib/locking-selftest.c:2575:1: sparse: sparse: context imbalance in 'SPI=
NLOCK_in_SPINLOCK' - wrong count at exit
   lib/locking-selftest.c:2575:1: sparse: sparse: context imbalance in 'SPI=
NLOCK_in_MUTEX' - wrong count at exit
   lib/locking-selftest.c:2576:1: sparse: sparse: context imbalance in 'MUT=
EX_in_RCU' - wrong count at exit
   lib/locking-selftest.c:2576:1: sparse: sparse: context imbalance in 'MUT=
EX_in_RCU_BH' - wrong count at exit
   lib/locking-selftest.c:2576:1: sparse: sparse: context imbalance in 'MUT=
EX_in_RCU_SCHED' - wrong count at exit
   lib/locking-selftest.c:2576:1: sparse: sparse: context imbalance in 'MUT=
EX_in_RAW_SPINLOCK' - wrong count at exit
   lib/locking-selftest.c:2576:1: sparse: sparse: context imbalance in 'MUT=
EX_in_SPINLOCK' - wrong count at exit

vim +/RCU_in_HARDIRQ +47 arch/um/include/asm/thread_info.h

^1da177e4c3f41 include/asm-um/thread_info.h      Linus Torvalds            =
     2005-04-16  42  =

^1da177e4c3f41 include/asm-um/thread_info.h      Linus Torvalds            =
     2005-04-16  43  /* how to get the thread information struct from C */
^1da177e4c3f41 include/asm-um/thread_info.h      Linus Torvalds            =
     2005-04-16  44  static inline struct thread_info *current_thread_info(=
void)
^1da177e4c3f41 include/asm-um/thread_info.h      Linus Torvalds            =
     2005-04-16  45  {
^1da177e4c3f41 include/asm-um/thread_info.h      Linus Torvalds            =
     2005-04-16  46  	struct thread_info *ti;
b3461034d7d464 include/asm-um/thread_info.h      Paolo 'Blaisorblade' Giarr=
usso 2005-05-28 @47  	unsigned long mask =3D THREAD_SIZE - 1;
534e3adbd22efa arch/um/include/asm/thread_info.h Richard Weinberger        =
     2011-04-27  48  	void *p;
534e3adbd22efa arch/um/include/asm/thread_info.h Richard Weinberger        =
     2011-04-27  49  =

534e3adbd22efa arch/um/include/asm/thread_info.h Richard Weinberger        =
     2011-04-27  50  	asm volatile ("" : "=3Dr" (p) : "0" (&ti));
534e3adbd22efa arch/um/include/asm/thread_info.h Richard Weinberger        =
     2011-04-27  51  	ti =3D (struct thread_info *) (((unsigned long)p) & ~=
mask);
^1da177e4c3f41 include/asm-um/thread_info.h      Linus Torvalds            =
     2005-04-16  52  	return ti;
^1da177e4c3f41 include/asm-um/thread_info.h      Linus Torvalds            =
     2005-04-16  53  }
^1da177e4c3f41 include/asm-um/thread_info.h      Linus Torvalds            =
     2005-04-16  54  =


:::::: The code at line 47 was first introduced by commit
:::::: b3461034d7d46455060c8476910be22b6b0fc313 [PATCH] uml: stack dump fix

:::::: TO: Paolo 'Blaisorblade' Giarrusso <blaisorblade@yahoo.it>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0586939819403109466==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
G5jVVh2pxx7PaZZbn7JB/h8+UqEITJwAAA==
--===============0586939819403109466==--

