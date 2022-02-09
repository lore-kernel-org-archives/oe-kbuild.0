Content-Type: multipart/mixed; boundary="===============0493455175019498645=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ardb:for-kernelci 7/12] arch/arm/kernel/unwind.c:479:17: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Wed, 09 Feb 2022 22:07:35 +0800
Message-ID: <202202092219.hg82rJZh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0493455175019498645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-ke=
rnelci
head:   116ce3ad4decad6e8870097b1e8b37e461426919
commit: 538b9265c063f081ca6b1228d242575a1db60711 [7/12] ARM: unwind: track =
location of LR value in stack frame
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: arm-randconfig-c002-20220209 (https://download.01.org/0day-ci/archi=
ve/20220209/202202092219.hg82rJZh-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9=
ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/co=
mmit/?id=3D538b9265c063f081ca6b1228d242575a1db60711
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/a=
rdb/linux.git
        git fetch --no-tags ardb for-kernelci
        git checkout 538b9265c063f081ca6b1228d242575a1db60711
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   crypto/ecc.c:998:6: note: Assuming the condition is false
           if (vli_is_zero(input, ndigits)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:998:2: note: Taking false branch
           if (vli_is_zero(input, ndigits)) {
           ^
   crypto/ecc.c:1007:2: note: Calling 'vli_clear'
           vli_clear(v, ndigits);
           ^~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:126:2: note: Loop condition is false. Execution continues o=
n line 126
           for (i =3D 0; i < ndigits; i++)
           ^
   crypto/ecc.c:128:1: note: Returning without writing to '*vli'
   }
   ^
   crypto/ecc.c:1007:2: note: Returning from 'vli_clear'
           vli_clear(v, ndigits);
           ^~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:1009:9: note: Assuming the condition is true
           while ((cmp_result =3D vli_cmp(a, b, ndigits)) !=3D 0) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:1009:2: note: Loop condition is true.  Entering loop body
           while ((cmp_result =3D vli_cmp(a, b, ndigits)) !=3D 0) {
           ^
   crypto/ecc.c:1012:7: note: Assuming the condition is false
                   if (EVEN(a)) {
                       ^
   crypto/ecc.c:985:20: note: expanded from macro 'EVEN'
   #define EVEN(vli) (!(vli[0] & 1))
                      ^~~~~~~~~~~~~
   crypto/ecc.c:1012:3: note: Taking false branch
                   if (EVEN@) {
                   ^
   crypto/ecc.c:1021:14: note: Assuming the condition is false
                   } else if (EVEN(b)) {
                              ^
   crypto/ecc.c:985:20: note: expanded from macro 'EVEN'
   #define EVEN(vli) (!(vli[0] & 1))
                      ^~~~~~~~~~~~~
   crypto/ecc.c:1021:10: note: Taking false branch
                   } else if (EVEN(b)) {
                          ^
   crypto/ecc.c:1030:14: note: Assuming 'cmp_result' is <=3D 0
                   } else if (cmp_result > 0) {
                              ^~~~~~~~~~~~~~
   crypto/ecc.c:1030:10: note: Taking false branch
                   } else if (cmp_result > 0) {
                          ^
   crypto/ecc.c:1048:8: note: Assuming the condition is false
                           if (vli_cmp(v, u, ndigits) < 0)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:1048:4: note: Taking false branch
                           if (vli_cmp(v, u, ndigits) < 0)
                           ^
   crypto/ecc.c:1051:4: note: Calling 'vli_sub'
                           vli_sub(v, v, u, ndigits);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:316:2: note: Loop condition is false. Execution continues o=
n line 326
           for (i =3D 0; i < ndigits; i++) {
           ^
   crypto/ecc.c:326:2: note: Returning without writing to '*result'
           return borrow;
           ^
   crypto/ecc.c:1051:4: note: Returning from 'vli_sub'
                           vli_sub(v, v, u, ndigits);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:1052:9: note: The left operand of '&' is a garbage value
                           if (!EVEN(v))
                                ^
   crypto/ecc.c:985:29: note: expanded from macro 'EVEN'
   #define EVEN(vli) (!(vli[0] & 1))
                        ~~~~~~ ^
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   arch/arm/kernel/traps.c:67:16: warning: Value stored to 'end' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long end =3D frame + 4 + sizeof(struct pt_regs);
                         ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/traps.c:67:16: note: Value stored to 'end' during its in=
itialization is never read
           unsigned long end =3D frame + 4 + sizeof(struct pt_regs);
                         ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/traps.c:198:4: warning: Value stored to 'p' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           p +=3D sprintf(p, "bad PC value");
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/traps.c:198:4: note: Value stored to 'p' is never read
                           p +=3D sprintf(p, "bad PC value");
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (11 with check filters).
   1 warning generated.
   arch/arm/kernel/atags_compat.c:200:2: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(tag->u.cmdline.cmdline, params->commandline);
           ^~~~~~
   arch/arm/kernel/atags_compat.c:200:2: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
           strcpy(tag->u.cmdline.cmdline, params->commandline);
           ^~~~~~
   4 warnings generated.
>> arch/arm/kernel/unwind.c:479:17: warning: Assigned value is garbage or u=
ndefined [clang-analyzer-core.uninitialized.Assign]
           frame->lr_addr =3D ctrl.lr_addr;
                          ^
   arch/arm/kernel/unwind.c:489:2: note: Taking false branch
           pr_debug("%s(regs =3D %p tsk =3D %p)\n", __func__, regs, tsk);
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   arch/arm/kernel/unwind.c:491:6: note: Assuming 'tsk' is non-null
           if (!tsk)
               ^~~~
   arch/arm/kernel/unwind.c:491:2: note: Taking false branch
           if (!tsk)
           ^
   arch/arm/kernel/unwind.c:494:6: note: Assuming 'regs' is null
           if (regs) {
               ^~~~
   arch/arm/kernel/unwind.c:494:2: note: Taking false branch
           if (regs) {
           ^
   arch/arm/kernel/unwind.c:499:13: note: Assuming the condition is false
           } else if (tsk =3D=3D current) {
                      ^~~~~~~~~~~~~~
   arch/arm/kernel/unwind.c:499:9: note: Taking false branch
           } else if (tsk =3D=3D current) {
                  ^
   arch/arm/kernel/unwind.c:516:2: note: Loop condition is true.  Entering =
loop body
           while (1) {
           ^
   arch/arm/kernel/unwind.c:520:9: note: Calling 'unwind_frame'
                   urc =3D unwind_frame(&frame);
                         ^~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/unwind.c:398:2: note: Taking false branch
           pr_debug("%s(pc =3D %08lx lr =3D %08lx sp =3D %08lx)\n", __func_=
_,
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   arch/arm/kernel/unwind.c:401:8: note: Calling 'unwind_find_idx'
           idx =3D unwind_find_idx(frame->pc);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/unwind.c:175:2: note: Taking false branch
           pr_debug("%s(%08lx)\n", __func__, addr);
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   arch/arm/kernel/unwind.c:177:6: note: Assuming the condition is true
           if (core_kernel_text(addr)) {
               ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/unwind.c:177:2: note: Taking true branch
           if (core_kernel_text(addr)) {
           ^
   arch/arm/kernel/unwind.c:178:16: note: Assuming '__origin_unwind_idx' is=
 non-null
                   if (unlikely(!__origin_unwind_idx))
                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   arch/arm/kernel/unwind.c:178:3: note: Taking false branch
                   if (unlikely(!__origin_unwind_idx))
                   ^
   arch/arm/kernel/unwind.c:184:9: note: Calling 'search_index'
                   idx =3D search_index(addr, __start_unwind_idx,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/unwind.c:109:2: note: Taking false branch
           pr_debug("%s(%08lx, %p, %p, %p)\n",
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   arch/arm/kernel/unwind.c:116:6: note: Assuming 'addr' is < 'start'
           if (addr < (unsigned long)start)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/unwind.c:116:2: note: Taking true branch
           if (addr < (unsigned long)start)
           ^
   arch/arm/kernel/unwind.c:126:2: note: Loop condition is false. Execution=
 continues on line 144
           while (start < stop - 1) {
           ^
   arch/arm/kernel/unwind.c:144:13: note: Assuming 'addr_prel31' is >=3D fi=
eld 'addr_offset'
           if (likely(start->addr_offset <=3D addr_prel31))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   arch/arm/kernel/unwind.c:144:2: note: Taking true branch
           if (likely(start->addr_offset <=3D addr_prel31))

vim +479 arch/arm/kernel/unwind.c

bff595c15c92b9 Catalin Marinas  2009-02-16  383  =

bff595c15c92b9 Catalin Marinas  2009-02-16  384  /*
bff595c15c92b9 Catalin Marinas  2009-02-16  385   * Unwind a single frame s=
tarting with *sp for the symbol@*pc. It
bff595c15c92b9 Catalin Marinas  2009-02-16  386   * updates the *pc and *sp=
 with the new values.
bff595c15c92b9 Catalin Marinas  2009-02-16  387   */
bff595c15c92b9 Catalin Marinas  2009-02-16  388  int unwind_frame(struct st=
ackframe *frame)
bff595c15c92b9 Catalin Marinas  2009-02-16  389  {
de66a979012dbc Uwe Kleine-K=C3=B6nig 2011-12-05  390  	const struct unwind_=
idx *idx;
bff595c15c92b9 Catalin Marinas  2009-02-16  391  	struct unwind_ctrl_block =
ctrl;
bff595c15c92b9 Catalin Marinas  2009-02-16  392  =

a51345770e5195 Anurag Aggarwal  2014-02-24  393  	/* store the highest addr=
ess on the stack to avoid crossing it*/
b6506981f880de Ard Biesheuvel   2021-10-05  394  	ctrl.sp_low =3D frame->sp;
a1c510d0adc604 Ard Biesheuvel   2021-09-23  395  	ctrl.sp_high =3D ALIGN(ct=
rl.sp_low - THREAD_SIZE, THREAD_ALIGN)
a1c510d0adc604 Ard Biesheuvel   2021-09-23  396  		       + THREAD_SIZE;
bff595c15c92b9 Catalin Marinas  2009-02-16  397  =

bff595c15c92b9 Catalin Marinas  2009-02-16  398  	pr_debug("%s(pc =3D %08lx=
 lr =3D %08lx sp =3D %08lx)\n", __func__,
bff595c15c92b9 Catalin Marinas  2009-02-16  399  		 frame->pc, frame->lr, f=
rame->sp);
bff595c15c92b9 Catalin Marinas  2009-02-16  400  =

bff595c15c92b9 Catalin Marinas  2009-02-16  401  	idx =3D unwind_find_idx(f=
rame->pc);
bff595c15c92b9 Catalin Marinas  2009-02-16  402  	if (!idx) {
8b521cb2947d88 Joe Perches      2014-09-16  403  		pr_warn("unwind: Index n=
ot found %08lx\n", frame->pc);
bff595c15c92b9 Catalin Marinas  2009-02-16  404  		return -URC_FAILURE;
bff595c15c92b9 Catalin Marinas  2009-02-16  405  	}
bff595c15c92b9 Catalin Marinas  2009-02-16  406  =

bff595c15c92b9 Catalin Marinas  2009-02-16  407  	ctrl.vrs[FP] =3D frame->f=
p;
bff595c15c92b9 Catalin Marinas  2009-02-16  408  	ctrl.vrs[SP] =3D frame->s=
p;
bff595c15c92b9 Catalin Marinas  2009-02-16  409  	ctrl.vrs[LR] =3D frame->l=
r;
bff595c15c92b9 Catalin Marinas  2009-02-16  410  	ctrl.vrs[PC] =3D 0;
bff595c15c92b9 Catalin Marinas  2009-02-16  411  =

bff595c15c92b9 Catalin Marinas  2009-02-16  412  	if (idx->insn =3D=3D 1)
bff595c15c92b9 Catalin Marinas  2009-02-16  413  		/* can't unwind */
bff595c15c92b9 Catalin Marinas  2009-02-16  414  		return -URC_FAILURE;
532319b9c418fc Ard Biesheuvel   2021-10-04  415  	else if (frame->pc =3D=3D=
 prel31_to_addr(&idx->addr_offset)) {
532319b9c418fc Ard Biesheuvel   2021-10-04  416  		/*
532319b9c418fc Ard Biesheuvel   2021-10-04  417  		 * Unwinding is tricky w=
hen we're halfway through the prologue,
532319b9c418fc Ard Biesheuvel   2021-10-04  418  		 * since the stack frame=
 that the unwinder expects may not be
532319b9c418fc Ard Biesheuvel   2021-10-04  419  		 * fully set up yet. How=
ever, one thing we do know for sure is
532319b9c418fc Ard Biesheuvel   2021-10-04  420  		 * that if we are unwind=
ing from the very first instruction of
532319b9c418fc Ard Biesheuvel   2021-10-04  421  		 * a function, we are st=
ill effectively in the stack frame of
532319b9c418fc Ard Biesheuvel   2021-10-04  422  		 * the caller, and the u=
nwind info has no relevance yet.
532319b9c418fc Ard Biesheuvel   2021-10-04  423  		 */
532319b9c418fc Ard Biesheuvel   2021-10-04  424  		if (frame->pc =3D=3D fra=
me->lr)
532319b9c418fc Ard Biesheuvel   2021-10-04  425  			return -URC_FAILURE;
532319b9c418fc Ard Biesheuvel   2021-10-04  426  		frame->sp_low =3D frame-=
>sp;
532319b9c418fc Ard Biesheuvel   2021-10-04  427  		frame->pc =3D frame->lr;
532319b9c418fc Ard Biesheuvel   2021-10-04  428  		return URC_OK;
532319b9c418fc Ard Biesheuvel   2021-10-04  429  	} else if ((idx->insn & 0=
x80000000) =3D=3D 0)
bff595c15c92b9 Catalin Marinas  2009-02-16  430  		/* prel31 to the unwind =
table */
bff595c15c92b9 Catalin Marinas  2009-02-16  431  		ctrl.insn =3D (unsigned =
long *)prel31_to_addr(&idx->insn);
bff595c15c92b9 Catalin Marinas  2009-02-16  432  	else if ((idx->insn & 0xf=
f000000) =3D=3D 0x80000000)
bff595c15c92b9 Catalin Marinas  2009-02-16  433  		/* only personality rout=
ine 0 supported in the index */
bff595c15c92b9 Catalin Marinas  2009-02-16  434  		ctrl.insn =3D &idx->insn;
bff595c15c92b9 Catalin Marinas  2009-02-16  435  	else {
8b521cb2947d88 Joe Perches      2014-09-16  436  		pr_warn("unwind: Unsuppo=
rted personality routine %08lx in the index at %p\n",
bff595c15c92b9 Catalin Marinas  2009-02-16  437  			idx->insn, idx);
bff595c15c92b9 Catalin Marinas  2009-02-16  438  		return -URC_FAILURE;
bff595c15c92b9 Catalin Marinas  2009-02-16  439  	}
bff595c15c92b9 Catalin Marinas  2009-02-16  440  =

bff595c15c92b9 Catalin Marinas  2009-02-16  441  	/* check the personality =
routine */
bff595c15c92b9 Catalin Marinas  2009-02-16  442  	if ((*ctrl.insn & 0xff000=
000) =3D=3D 0x80000000) {
bff595c15c92b9 Catalin Marinas  2009-02-16  443  		ctrl.byte =3D 2;
bff595c15c92b9 Catalin Marinas  2009-02-16  444  		ctrl.entries =3D 1;
bff595c15c92b9 Catalin Marinas  2009-02-16  445  	} else if ((*ctrl.insn & =
0xff000000) =3D=3D 0x81000000) {
bff595c15c92b9 Catalin Marinas  2009-02-16  446  		ctrl.byte =3D 1;
bff595c15c92b9 Catalin Marinas  2009-02-16  447  		ctrl.entries =3D 1 + ((*=
ctrl.insn & 0x00ff0000) >> 16);
bff595c15c92b9 Catalin Marinas  2009-02-16  448  	} else {
8b521cb2947d88 Joe Perches      2014-09-16  449  		pr_warn("unwind: Unsuppo=
rted personality routine %08lx at %p\n",
bff595c15c92b9 Catalin Marinas  2009-02-16  450  			*ctrl.insn, ctrl.insn);
bff595c15c92b9 Catalin Marinas  2009-02-16  451  		return -URC_FAILURE;
bff595c15c92b9 Catalin Marinas  2009-02-16  452  	}
bff595c15c92b9 Catalin Marinas  2009-02-16  453  =

a51345770e5195 Anurag Aggarwal  2014-02-24  454  	ctrl.check_each_pop =3D 0;
a51345770e5195 Anurag Aggarwal  2014-02-24  455  =

bff595c15c92b9 Catalin Marinas  2009-02-16  456  	while (ctrl.entries > 0) {
a51345770e5195 Anurag Aggarwal  2014-02-24  457  		int urc;
a51345770e5195 Anurag Aggarwal  2014-02-24  458  		if ((ctrl.sp_high - ctrl=
.vrs[SP]) < sizeof(ctrl.vrs))
a51345770e5195 Anurag Aggarwal  2014-02-24  459  			ctrl.check_each_pop =3D=
 1;
a51345770e5195 Anurag Aggarwal  2014-02-24  460  		urc =3D unwind_exec_insn=
(&ctrl);
bff595c15c92b9 Catalin Marinas  2009-02-16  461  		if (urc < 0)
bff595c15c92b9 Catalin Marinas  2009-02-16  462  			return urc;
b6506981f880de Ard Biesheuvel   2021-10-05  463  		if (ctrl.vrs[SP] < ctrl.=
sp_low || ctrl.vrs[SP] > ctrl.sp_high)
c894ed6956f126 Catalin Marinas  2009-06-19  464  			return -URC_FAILURE;
bff595c15c92b9 Catalin Marinas  2009-02-16  465  	}
bff595c15c92b9 Catalin Marinas  2009-02-16  466  =

bff595c15c92b9 Catalin Marinas  2009-02-16  467  	if (ctrl.vrs[PC] =3D=3D 0)
bff595c15c92b9 Catalin Marinas  2009-02-16  468  		ctrl.vrs[PC] =3D ctrl.vr=
s[LR];
bff595c15c92b9 Catalin Marinas  2009-02-16  469  =

c894ed6956f126 Catalin Marinas  2009-06-19  470  	/* check for infinite loo=
p */
8d54a275938968 Russell King     2019-12-22  471  	if (frame->pc =3D=3D ctrl=
.vrs[PC] && frame->sp =3D=3D ctrl.vrs[SP])
c894ed6956f126 Catalin Marinas  2009-06-19  472  		return -URC_FAILURE;
c894ed6956f126 Catalin Marinas  2009-06-19  473  =

bff595c15c92b9 Catalin Marinas  2009-02-16  474  	frame->fp =3D ctrl.vrs[FP=
];
bff595c15c92b9 Catalin Marinas  2009-02-16  475  	frame->sp =3D ctrl.vrs[SP=
];
bff595c15c92b9 Catalin Marinas  2009-02-16  476  	frame->lr =3D ctrl.vrs[LR=
];
bff595c15c92b9 Catalin Marinas  2009-02-16  477  	frame->pc =3D ctrl.vrs[PC=
];
4ab6827081c63b Ard Biesheuvel   2021-10-05  478  	frame->sp_low =3D ctrl.sp=
_low;
538b9265c063f0 Ard Biesheuvel   2022-01-24 @479  	frame->lr_addr =3D ctrl.l=
r_addr;
bff595c15c92b9 Catalin Marinas  2009-02-16  480  =

bff595c15c92b9 Catalin Marinas  2009-02-16  481  	return URC_OK;
bff595c15c92b9 Catalin Marinas  2009-02-16  482  }
bff595c15c92b9 Catalin Marinas  2009-02-16  483  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0493455175019498645==--

