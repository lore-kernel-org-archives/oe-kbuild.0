Content-Type: multipart/mixed; boundary="===============6398118733646723420=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: inconsistent indenting
Date: Mon, 08 Aug 2022 21:09:00 +0800
Message-ID: <202208082112.MlknSfX1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6398118733646723420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Palmer Dabbelt <palmerdabbelt@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4e23eeebb2e57f5a28b36221aa776b5a1122dde5
commit: 9efbb355831014ca004d241db8ede182c019b9bf locking/atomic: riscv: mov=
e to ARCH_ATOMIC
date:   1 year, 2 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 1 year, 2 months ago
config: riscv-randconfig-m031-20220808 (https://download.01.org/0day-ci/arc=
hive/20220808/202208082112.MlknSfX1-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: in=
consistent indenting
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: in=
consistent indenting

Old smatch warnings:
drivers/firmware/efi/efi.c:930 efi_mem_reserve_persistent() error: we previ=
ously assumed 'efi_memreserve_root' could be null (see line 923)

vim +204 arch/riscv/include/asm/atomic.h

fab957c11efe2f Palmer Dabbelt 2017-07-10  198  =

5ce6c1f3535fa8 Andrea Parri   2018-03-09  199  /* This is required to provi=
de a full barrier on success. */
9efbb355831014 Mark Rutland   2021-05-25  200  static __always_inline int a=
rch_atomic_fetch_add_unless(atomic_t *v, int a, int u)
fab957c11efe2f Palmer Dabbelt 2017-07-10  201  {
fab957c11efe2f Palmer Dabbelt 2017-07-10  202         int prev, rc;
fab957c11efe2f Palmer Dabbelt 2017-07-10  203  =

fab957c11efe2f Palmer Dabbelt 2017-07-10 @204  	__asm__ __volatile__ (
5ce6c1f3535fa8 Andrea Parri   2018-03-09  205  		"0:	lr.w     %[p],  %[c]\n"
5ce6c1f3535fa8 Andrea Parri   2018-03-09  206  		"	beq      %[p],  %[u], 1f=
\n"
5ce6c1f3535fa8 Andrea Parri   2018-03-09  207  		"	add      %[rc], %[p], %[=
a]\n"
5ce6c1f3535fa8 Andrea Parri   2018-03-09  208  		"	sc.w.rl  %[rc], %[rc], %=
[c]\n"
5ce6c1f3535fa8 Andrea Parri   2018-03-09  209  		"	bnez     %[rc], 0b\n"
5ce6c1f3535fa8 Andrea Parri   2018-03-09  210  		"	fence    rw, rw\n"
5ce6c1f3535fa8 Andrea Parri   2018-03-09  211  		"1:\n"
fab957c11efe2f Palmer Dabbelt 2017-07-10  212  		: [p]"=3D&r" (prev), [rc]"=
=3D&r" (rc), [c]"+A" (v->counter)
fab957c11efe2f Palmer Dabbelt 2017-07-10  213  		: [a]"r" (a), [u]"r" (u)
fab957c11efe2f Palmer Dabbelt 2017-07-10  214  		: "memory");
fab957c11efe2f Palmer Dabbelt 2017-07-10  215  	return prev;
fab957c11efe2f Palmer Dabbelt 2017-07-10  216  }
9efbb355831014 Mark Rutland   2021-05-25  217  #define arch_atomic_fetch_ad=
d_unless arch_atomic_fetch_add_unless
fab957c11efe2f Palmer Dabbelt 2017-07-10  218  =


:::::: The code at line 204 was first introduced by commit
:::::: fab957c11efe2f405e08b9f0d080524bc2631428 RISC-V: Atomic and Locking =
Code

:::::: TO: Palmer Dabbelt <palmer@dabbelt.com>
:::::: CC: Palmer Dabbelt <palmer@dabbelt.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6398118733646723420==--

