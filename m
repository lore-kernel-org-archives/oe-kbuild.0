Content-Type: multipart/mixed; boundary="===============4259994308281261924=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/powerpc/xmon/xmon.c:1881 excprint() warn: variable dereferenced before check 'current' (see line 1853)
Date: Thu, 10 Feb 2022 22:38:27 +0800
Message-ID: <202202102202.fnnSR9Qy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4259994308281261924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f4bc5bbb5fef3cf421ba3485d6d383c27ec473ed
commit: 336868afbaae2d153fc20268a21747c31e5071b8 powerpc: smp: remove hack =
to obtain offset of task_struct::cpu
date:   4 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
config: powerpc-randconfig-m031-20220209 (https://download.01.org/0day-ci/a=
rchive/20220210/202202102202.fnnSR9Qy-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/powerpc/xmon/xmon.c:1881 excprint() warn: variable dereferenced before=
 check 'current' (see line 1853)

Old smatch warnings:
arch/powerpc/include/asm/mmu.h:233 early_mmu_has_feature() warn: bitwise AN=
D condition is false here
arch/powerpc/xmon/xmon.c:3268 show_task() warn: unsigned 'p_state' is never=
 less than zero.

vim +/current +1881 arch/powerpc/xmon/xmon.c

^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  184=
7  =

9f1067c2d98ac1 arch/powerpc/xmon/xmon.c Michael Ellerman    2008-05-08  184=
8  static void excprint(struct pt_regs *fp)
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  184=
9  {
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  185=
0  	unsigned long trap;
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  185=
1  =

^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  185=
2  #ifdef CONFIG_SMP
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16 @185=
3  	printf("cpu 0x%x: ", smp_processor_id());
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  185=
4  #endif /* CONFIG_SMP */
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  185=
5  =

^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  185=
6  	trap =3D TRAP(fp);
e70d8f55268ba9 arch/powerpc/xmon/xmon.c Mathieu Malaterre   2018-03-25  185=
7  	printf("Vector: %lx %s at [%px]\n", fp->trap, getvecname(trap), fp);
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  185=
8  	printf("    pc: ");
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  185=
9  	xmon_print_symbol(fp->nip, ": ", "\n");
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  186=
0  =

e70d8f55268ba9 arch/powerpc/xmon/xmon.c Mathieu Malaterre   2018-03-25  186=
1  	printf("    lr: ");
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  186=
2  	xmon_print_symbol(fp->link, ": ", "\n");
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  186=
3  =

^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  186=
4  	printf("    sp: %lx\n", fp->gpr[1]);
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  186=
5  	printf("   msr: %lx\n", fp->msr);
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  186=
6  =

7153d4bf0b3734 arch/powerpc/xmon/xmon.c Xiongwei Song       2021-04-14  186=
7  	if (trap =3D=3D INTERRUPT_DATA_STORAGE ||
7153d4bf0b3734 arch/powerpc/xmon/xmon.c Xiongwei Song       2021-04-14  186=
8  	    trap =3D=3D INTERRUPT_DATA_SEGMENT ||
7153d4bf0b3734 arch/powerpc/xmon/xmon.c Xiongwei Song       2021-04-14  186=
9  	    trap =3D=3D INTERRUPT_ALIGNMENT ||
7153d4bf0b3734 arch/powerpc/xmon/xmon.c Xiongwei Song       2021-04-14  187=
0  	    trap =3D=3D INTERRUPT_MACHINE_CHECK) {
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  187=
1  		printf("   dar: %lx\n", fp->dar);
7153d4bf0b3734 arch/powerpc/xmon/xmon.c Xiongwei Song       2021-04-14  187=
2  		if (trap !=3D INTERRUPT_DATA_SEGMENT)
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  187=
3  			printf(" dsisr: %lx\n", fp->dsisr);
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  187=
4  	}
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  187=
5  =

e70d8f55268ba9 arch/powerpc/xmon/xmon.c Mathieu Malaterre   2018-03-25  187=
6  	printf("  current =3D 0x%px\n", current);
f78541dcec327b arch/powerpc/xmon/xmon.c Paul Mackerras      2005-10-28  187=
7  #ifdef CONFIG_PPC64
3130a7bb6eb595 arch/powerpc/xmon/xmon.c Nicholas Piggin     2018-05-10  187=
8  	printf("  paca    =3D 0x%px\t irqmask: 0x%02x\t irq_happened: 0x%02x\n",
4e26bc4a4ed683 arch/powerpc/xmon/xmon.c Madhavan Srinivasan 2017-12-20  187=
9  	       local_paca, local_paca->irq_soft_mask, local_paca->irq_happened);
f78541dcec327b arch/powerpc/xmon/xmon.c Paul Mackerras      2005-10-28  188=
0  #endif
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16 @188=
1  	if (current) {
e70d8f55268ba9 arch/powerpc/xmon/xmon.c Mathieu Malaterre   2018-03-25  188=
2  		printf("    pid   =3D %d, comm =3D %s\n",
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  188=
3  		       current->pid, current->comm);
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  188=
4  	}
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  188=
5  =

7153d4bf0b3734 arch/powerpc/xmon/xmon.c Xiongwei Song       2021-04-14  188=
6  	if (trap =3D=3D INTERRUPT_PROGRAM)
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  188=
7  		print_bug_trap(fp);
eb925d64604991 arch/powerpc/xmon/xmon.c Rashmica Gupta      2015-11-25  188=
8  =

eb925d64604991 arch/powerpc/xmon/xmon.c Rashmica Gupta      2015-11-25  188=
9  	printf(linux_banner);
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  189=
0  }
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds      2005-04-16  189=
1  =


:::::: The code at line 1881 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4259994308281261924==--

