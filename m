Content-Type: multipart/mixed; boundary="===============4194346060475155741=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kernel/rethook.c:92 arch_rethook_trampoline_callback() warn: potential memory corrupting cast 4 vs 2 bytes
Date: Tue, 03 May 2022 01:12:55 +0800
Message-ID: <202205030130.Hu3m7xuS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4194346060475155741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Masami Hiramatsu <mhiramat@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   672c0c5173427e6b3e2a9bbb7be51ceeec78093a
commit: 0ef6f5c09371f17e142814e6996d6dfb8741925b x86,rethook: Fix arch_reth=
ook_trampoline() to generate a complete pt_regs
date:   5 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-m031-20220502 (https://download.01.org/0day-ci/arch=
ive/20220503/202205030130.Hu3m7xuS-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/x86/kernel/rethook.c:92 arch_rethook_trampoline_callback() warn: poten=
tial memory corrupting cast 4 vs 2 bytes

vim +92 arch/x86/kernel/rethook.c

f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  63  =

f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  64  /*
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  65   * Called from arch_rethoo=
k_trampoline
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  66   */
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  67  __used __visible void arch=
_rethook_trampoline_callback(struct pt_regs *regs)
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  68  {
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  69  	unsigned long *frame_poin=
ter;
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  70  =

f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  71  	/* fixup registers */
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  72  	regs->cs =3D __KERNEL_CS;
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  73  #ifdef CONFIG_X86_32
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  74  	regs->gs =3D 0;
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  75  #endif
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  76  	regs->ip =3D (unsigned lo=
ng)&arch_rethook_trampoline;
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  77  	regs->orig_ax =3D ~0UL;
0ef6f5c09371f17 Peter Zijlstra   2022-03-26  78  	regs->sp +=3D 2*sizeof(lo=
ng);
0ef6f5c09371f17 Peter Zijlstra   2022-03-26  79  	frame_pointer =3D (long *=
)(regs + 1);
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  80  =

f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  81  	/*
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  82  	 * The return address at =
'frame_pointer' is recovered by the
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  83  	 * arch_rethook_fixup_ret=
urn() which called from this
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  84  	 * rethook_trampoline_han=
dler().
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  85  	 */
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  86  	rethook_trampoline_handle=
r(regs, (unsigned long)frame_pointer);
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  87  =

f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  88  	/*
0ef6f5c09371f17 Peter Zijlstra   2022-03-26  89  	 * Copy FLAGS to 'pt_regs=
::ss' so that arch_rethook_trapmoline()
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  90  	 * can do RET right after=
 POPF.
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  91  	 */
0ef6f5c09371f17 Peter Zijlstra   2022-03-26 @92  	*(unsigned long *)&regs->=
ss =3D regs->flags;
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  93  }
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  94  NOKPROBE_SYMBOL(arch_retho=
ok_trampoline_callback);
f3a112c0c40dd96 Masami Hiramatsu 2022-03-26  95  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4194346060475155741==--

