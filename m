Content-Type: multipart/mixed; boundary="===============4888379789109349766=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4120/10053] arch/arm/kernel/unwind.c:479:17: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Thu, 03 Mar 2022 11:53:18 +0800
Message-ID: <202203031130.80OTiwEw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4888379789109349766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   adaedcf826dccf01b69d9a1f1997c9446c6b2c54
commit: 538b9265c063f081ca6b1228d242575a1db60711 [4120/10053] ARM: unwind: =
track location of LR value in stack frame
:::::: branch date: 17 hours ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20220302 (https://download.01.org/0day-ci/archi=
ve/20220303/202203031130.80OTiwEw-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D538b9265c063f081ca6b1228d242575a1db60711
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 538b9265c063f081ca6b1228d242575a1db60711
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/rcupdate.h:319:11: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                           ^
   kernel/nsproxy.c:316:48: note: Loop condition is false.  Exiting loop
           nsset->nsproxy =3D create_new_namespaces(0, me, current_user_ns(=
), me->fs);
                                                         ^
   include/linux/cred.h:395:28: note: expanded from macro 'current_user_ns'
   #define current_user_ns()       (current_cred_xxx(user_ns))
                                    ^
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:588:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:397:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:317:2: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
           do {                                                            \
           ^
   kernel/nsproxy.c:317:2: note: Taking false branch
           if (IS_ERR(nsset->nsproxy))
           ^
   kernel/nsproxy.c:320:6: note: Assuming the condition is true
           if (flags & CLONE_NEWUSER)
               ^~~~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:320:2: note: Taking true branch
           if (flags & CLONE_NEWUSER)
           ^
   kernel/nsproxy.c:324:6: note: Assuming field 'cred' is non-null
           if (!nsset->cred)
               ^~~~~~~~~~~~
   kernel/nsproxy.c:324:2: note: Taking false branch
           if (!nsset->cred)
           ^
   kernel/nsproxy.c:328:6: note: 'flags' is not equal to CLONE_NEWNS
           if (flags =3D=3D CLONE_NEWNS) {
               ^~~~~
   kernel/nsproxy.c:328:2: note: Taking false branch
           if (flags =3D=3D CLONE_NEWNS) {
           ^
   kernel/nsproxy.c:330:13: note: Assuming the condition is false
           } else if (flags & CLONE_NEWNS) {
                      ^~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:330:9: note: Taking false branch
           } else if (flags & CLONE_NEWNS) {
                  ^
   kernel/nsproxy.c:337:2: note: Returning zero, which participates in a co=
ndition later
           return 0;
           ^~~~~~~~
   kernel/nsproxy.c:551:8: note: Returning from 'prepare_nsset'
           err =3D prepare_nsset(flags, &nsset);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:552:6: note: 'err' is 0
           if (err)
               ^~~
   kernel/nsproxy.c:552:2: note: Taking false branch
           if (err)
           ^
   kernel/nsproxy.c:555:6: note: Assuming the condition is true
           if (proc_ns_file(file))
               ^~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:555:2: note: Taking true branch
           if (proc_ns_file(file))
           ^
   kernel/nsproxy.c:556:29: note: Passing null pointer value via 2nd parame=
ter 'ns'
                   err =3D validate_ns(&nsset, ns);
                                             ^~
   kernel/nsproxy.c:556:9: note: Calling 'validate_ns'
                   err =3D validate_ns(&nsset, ns);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:346:9: note: Access to field 'ops' results in a derefer=
ence of a null pointer (loaded from variable 'ns')
           return ns->ops->install(nsset, ns);
                  ^~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
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
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
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

bff595c15c92b9c Catalin Marinas  2009-02-16  383  =

bff595c15c92b9c Catalin Marinas  2009-02-16  384  /*
bff595c15c92b9c Catalin Marinas  2009-02-16  385   * Unwind a single frame =
starting with *sp for the symbol@*pc. It
bff595c15c92b9c Catalin Marinas  2009-02-16  386   * updates the *pc and *s=
p with the new values.
bff595c15c92b9c Catalin Marinas  2009-02-16  387   */
bff595c15c92b9c Catalin Marinas  2009-02-16  388  int unwind_frame(struct s=
tackframe *frame)
bff595c15c92b9c Catalin Marinas  2009-02-16  389  {
de66a979012dbc6 Uwe Kleine-K=C3=B6nig 2011-12-05  390  	const struct unwind=
_idx *idx;
bff595c15c92b9c Catalin Marinas  2009-02-16  391  	struct unwind_ctrl_block=
 ctrl;
bff595c15c92b9c Catalin Marinas  2009-02-16  392  =

a51345770e51955 Anurag Aggarwal  2014-02-24  393  	/* store the highest add=
ress on the stack to avoid crossing it*/
b6506981f880de8 Ard Biesheuvel   2021-10-05  394  	ctrl.sp_low =3D frame->s=
p;
a1c510d0adc604b Ard Biesheuvel   2021-09-23  395  	ctrl.sp_high =3D ALIGN(c=
trl.sp_low - THREAD_SIZE, THREAD_ALIGN)
a1c510d0adc604b Ard Biesheuvel   2021-09-23  396  		       + THREAD_SIZE;
bff595c15c92b9c Catalin Marinas  2009-02-16  397  =

bff595c15c92b9c Catalin Marinas  2009-02-16  398  	pr_debug("%s(pc =3D %08l=
x lr =3D %08lx sp =3D %08lx)\n", __func__,
bff595c15c92b9c Catalin Marinas  2009-02-16  399  		 frame->pc, frame->lr, =
frame->sp);
bff595c15c92b9c Catalin Marinas  2009-02-16  400  =

bff595c15c92b9c Catalin Marinas  2009-02-16  401  	idx =3D unwind_find_idx(=
frame->pc);
bff595c15c92b9c Catalin Marinas  2009-02-16  402  	if (!idx) {
8b521cb2947d881 Joe Perches      2014-09-16  403  		pr_warn("unwind: Index =
not found %08lx\n", frame->pc);
bff595c15c92b9c Catalin Marinas  2009-02-16  404  		return -URC_FAILURE;
bff595c15c92b9c Catalin Marinas  2009-02-16  405  	}
bff595c15c92b9c Catalin Marinas  2009-02-16  406  =

bff595c15c92b9c Catalin Marinas  2009-02-16  407  	ctrl.vrs[FP] =3D frame->=
fp;
bff595c15c92b9c Catalin Marinas  2009-02-16  408  	ctrl.vrs[SP] =3D frame->=
sp;
bff595c15c92b9c Catalin Marinas  2009-02-16  409  	ctrl.vrs[LR] =3D frame->=
lr;
bff595c15c92b9c Catalin Marinas  2009-02-16  410  	ctrl.vrs[PC] =3D 0;
bff595c15c92b9c Catalin Marinas  2009-02-16  411  =

bff595c15c92b9c Catalin Marinas  2009-02-16  412  	if (idx->insn =3D=3D 1)
bff595c15c92b9c Catalin Marinas  2009-02-16  413  		/* can't unwind */
bff595c15c92b9c Catalin Marinas  2009-02-16  414  		return -URC_FAILURE;
532319b9c418fc2 Ard Biesheuvel   2021-10-04  415  	else if (frame->pc =3D=
=3D prel31_to_addr(&idx->addr_offset)) {
532319b9c418fc2 Ard Biesheuvel   2021-10-04  416  		/*
532319b9c418fc2 Ard Biesheuvel   2021-10-04  417  		 * Unwinding is tricky =
when we're halfway through the prologue,
532319b9c418fc2 Ard Biesheuvel   2021-10-04  418  		 * since the stack fram=
e that the unwinder expects may not be
532319b9c418fc2 Ard Biesheuvel   2021-10-04  419  		 * fully set up yet. Ho=
wever, one thing we do know for sure is
532319b9c418fc2 Ard Biesheuvel   2021-10-04  420  		 * that if we are unwin=
ding from the very first instruction of
532319b9c418fc2 Ard Biesheuvel   2021-10-04  421  		 * a function, we are s=
till effectively in the stack frame of
532319b9c418fc2 Ard Biesheuvel   2021-10-04  422  		 * the caller, and the =
unwind info has no relevance yet.
532319b9c418fc2 Ard Biesheuvel   2021-10-04  423  		 */
532319b9c418fc2 Ard Biesheuvel   2021-10-04  424  		if (frame->pc =3D=3D fr=
ame->lr)
532319b9c418fc2 Ard Biesheuvel   2021-10-04  425  			return -URC_FAILURE;
532319b9c418fc2 Ard Biesheuvel   2021-10-04  426  		frame->sp_low =3D frame=
->sp;
532319b9c418fc2 Ard Biesheuvel   2021-10-04  427  		frame->pc =3D frame->lr;
532319b9c418fc2 Ard Biesheuvel   2021-10-04  428  		return URC_OK;
532319b9c418fc2 Ard Biesheuvel   2021-10-04  429  	} else if ((idx->insn & =
0x80000000) =3D=3D 0)
bff595c15c92b9c Catalin Marinas  2009-02-16  430  		/* prel31 to the unwind=
 table */
bff595c15c92b9c Catalin Marinas  2009-02-16  431  		ctrl.insn =3D (unsigned=
 long *)prel31_to_addr(&idx->insn);
bff595c15c92b9c Catalin Marinas  2009-02-16  432  	else if ((idx->insn & 0x=
ff000000) =3D=3D 0x80000000)
bff595c15c92b9c Catalin Marinas  2009-02-16  433  		/* only personality rou=
tine 0 supported in the index */
bff595c15c92b9c Catalin Marinas  2009-02-16  434  		ctrl.insn =3D &idx->ins=
n;
bff595c15c92b9c Catalin Marinas  2009-02-16  435  	else {
8b521cb2947d881 Joe Perches      2014-09-16  436  		pr_warn("unwind: Unsupp=
orted personality routine %08lx in the index at %p\n",
bff595c15c92b9c Catalin Marinas  2009-02-16  437  			idx->insn, idx);
bff595c15c92b9c Catalin Marinas  2009-02-16  438  		return -URC_FAILURE;
bff595c15c92b9c Catalin Marinas  2009-02-16  439  	}
bff595c15c92b9c Catalin Marinas  2009-02-16  440  =

bff595c15c92b9c Catalin Marinas  2009-02-16  441  	/* check the personality=
 routine */
bff595c15c92b9c Catalin Marinas  2009-02-16  442  	if ((*ctrl.insn & 0xff00=
0000) =3D=3D 0x80000000) {
bff595c15c92b9c Catalin Marinas  2009-02-16  443  		ctrl.byte =3D 2;
bff595c15c92b9c Catalin Marinas  2009-02-16  444  		ctrl.entries =3D 1;
bff595c15c92b9c Catalin Marinas  2009-02-16  445  	} else if ((*ctrl.insn &=
 0xff000000) =3D=3D 0x81000000) {
bff595c15c92b9c Catalin Marinas  2009-02-16  446  		ctrl.byte =3D 1;
bff595c15c92b9c Catalin Marinas  2009-02-16  447  		ctrl.entries =3D 1 + ((=
*ctrl.insn & 0x00ff0000) >> 16);
bff595c15c92b9c Catalin Marinas  2009-02-16  448  	} else {
8b521cb2947d881 Joe Perches      2014-09-16  449  		pr_warn("unwind: Unsupp=
orted personality routine %08lx at %p\n",
bff595c15c92b9c Catalin Marinas  2009-02-16  450  			*ctrl.insn, ctrl.insn);
bff595c15c92b9c Catalin Marinas  2009-02-16  451  		return -URC_FAILURE;
bff595c15c92b9c Catalin Marinas  2009-02-16  452  	}
bff595c15c92b9c Catalin Marinas  2009-02-16  453  =

a51345770e51955 Anurag Aggarwal  2014-02-24  454  	ctrl.check_each_pop =3D =
0;
a51345770e51955 Anurag Aggarwal  2014-02-24  455  =

bff595c15c92b9c Catalin Marinas  2009-02-16  456  	while (ctrl.entries > 0)=
 {
a51345770e51955 Anurag Aggarwal  2014-02-24  457  		int urc;
a51345770e51955 Anurag Aggarwal  2014-02-24  458  		if ((ctrl.sp_high - ctr=
l.vrs[SP]) < sizeof(ctrl.vrs))
a51345770e51955 Anurag Aggarwal  2014-02-24  459  			ctrl.check_each_pop =
=3D 1;
a51345770e51955 Anurag Aggarwal  2014-02-24  460  		urc =3D unwind_exec_ins=
n(&ctrl);
bff595c15c92b9c Catalin Marinas  2009-02-16  461  		if (urc < 0)
bff595c15c92b9c Catalin Marinas  2009-02-16  462  			return urc;
b6506981f880de8 Ard Biesheuvel   2021-10-05  463  		if (ctrl.vrs[SP] < ctrl=
.sp_low || ctrl.vrs[SP] > ctrl.sp_high)
c894ed6956f126d Catalin Marinas  2009-06-19  464  			return -URC_FAILURE;
bff595c15c92b9c Catalin Marinas  2009-02-16  465  	}
bff595c15c92b9c Catalin Marinas  2009-02-16  466  =

bff595c15c92b9c Catalin Marinas  2009-02-16  467  	if (ctrl.vrs[PC] =3D=3D =
0)
bff595c15c92b9c Catalin Marinas  2009-02-16  468  		ctrl.vrs[PC] =3D ctrl.v=
rs[LR];
bff595c15c92b9c Catalin Marinas  2009-02-16  469  =

c894ed6956f126d Catalin Marinas  2009-06-19  470  	/* check for infinite lo=
op */
8d54a2759389689 Russell King     2019-12-22  471  	if (frame->pc =3D=3D ctr=
l.vrs[PC] && frame->sp =3D=3D ctrl.vrs[SP])
c894ed6956f126d Catalin Marinas  2009-06-19  472  		return -URC_FAILURE;
c894ed6956f126d Catalin Marinas  2009-06-19  473  =

bff595c15c92b9c Catalin Marinas  2009-02-16  474  	frame->fp =3D ctrl.vrs[F=
P];
bff595c15c92b9c Catalin Marinas  2009-02-16  475  	frame->sp =3D ctrl.vrs[S=
P];
bff595c15c92b9c Catalin Marinas  2009-02-16  476  	frame->lr =3D ctrl.vrs[L=
R];
bff595c15c92b9c Catalin Marinas  2009-02-16  477  	frame->pc =3D ctrl.vrs[P=
C];
4ab6827081c63b8 Ard Biesheuvel   2021-10-05  478  	frame->sp_low =3D ctrl.s=
p_low;
538b9265c063f08 Ard Biesheuvel   2022-01-24 @479  	frame->lr_addr =3D ctrl.=
lr_addr;
bff595c15c92b9c Catalin Marinas  2009-02-16  480  =

bff595c15c92b9c Catalin Marinas  2009-02-16  481  	return URC_OK;
bff595c15c92b9c Catalin Marinas  2009-02-16  482  }
bff595c15c92b9c Catalin Marinas  2009-02-16  483  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4888379789109349766==--

