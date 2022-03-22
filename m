Content-Type: multipart/mixed; boundary="===============1262015173832783009=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11211/14215] arch/arm/kernel/unwind.c:451:48: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Tue, 22 Mar 2022 23:56:21 +0800
Message-ID: <202203222317.DyMO0EE9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1262015173832783009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Ard Biesheuvel <ardb@kernel.org>
CC: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f8833a2b23562be2dae91775127c8014c44d8566
commit: f6b8e3526feb025d0259c18d6dc6b8c2e2cfedf0 [11211/14215] ARM: unwind:=
 only permit stack switch when unwinding call_with_stack()
:::::: branch date: 6 hours ago
:::::: commit date: 11 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm/kernel/unwind.c:451:48: warning: Boolean result is used in bitw=
ise operation. Clarify expression with parentheses. [clarifyCondition]
    if (prel31_to_addr(&idx->addr_offset) =3D=3D (u32)&call_with_stack) {
                                                  ^

vim +451 arch/arm/kernel/unwind.c

bff595c15c92b9 Catalin Marinas  2009-02-16  377  =

bff595c15c92b9 Catalin Marinas  2009-02-16  378  /*
bff595c15c92b9 Catalin Marinas  2009-02-16  379   * Unwind a single frame s=
tarting with *sp for the symbol at *pc. It
bff595c15c92b9 Catalin Marinas  2009-02-16  380   * updates the *pc and *sp=
 with the new values.
bff595c15c92b9 Catalin Marinas  2009-02-16  381   */
bff595c15c92b9 Catalin Marinas  2009-02-16  382  int unwind_frame(struct st=
ackframe *frame)
bff595c15c92b9 Catalin Marinas  2009-02-16  383  {
de66a979012dbc Uwe Kleine-K=C3=B6nig 2011-12-05  384  	const struct unwind_=
idx *idx;
bff595c15c92b9 Catalin Marinas  2009-02-16  385  	struct unwind_ctrl_block =
ctrl;
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  386  	unsigned long sp_low;
bff595c15c92b9 Catalin Marinas  2009-02-16  387  =

a51345770e5195 Anurag Aggarwal  2014-02-24  388  	/* store the highest addr=
ess on the stack to avoid crossing it*/
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  389  	sp_low =3D frame->sp;
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  390  	ctrl.sp_high =3D ALIGN(sp=
_low - THREAD_SIZE, THREAD_ALIGN)
a1c510d0adc604 Ard Biesheuvel   2021-09-23  391  		       + THREAD_SIZE;
bff595c15c92b9 Catalin Marinas  2009-02-16  392  =

bff595c15c92b9 Catalin Marinas  2009-02-16  393  	pr_debug("%s(pc =3D %08lx=
 lr =3D %08lx sp =3D %08lx)\n", __func__,
bff595c15c92b9 Catalin Marinas  2009-02-16  394  		 frame->pc, frame->lr, f=
rame->sp);
bff595c15c92b9 Catalin Marinas  2009-02-16  395  =

bff595c15c92b9 Catalin Marinas  2009-02-16  396  	idx =3D unwind_find_idx(f=
rame->pc);
bff595c15c92b9 Catalin Marinas  2009-02-16  397  	if (!idx) {
81679376470ef4 Ard Biesheuvel   2022-03-02  398  		if (frame->pc && kernel_=
text_address(frame->pc))
8b521cb2947d88 Joe Perches      2014-09-16  399  			pr_warn("unwind: Index =
not found %08lx\n", frame->pc);
bff595c15c92b9 Catalin Marinas  2009-02-16  400  		return -URC_FAILURE;
bff595c15c92b9 Catalin Marinas  2009-02-16  401  	}
bff595c15c92b9 Catalin Marinas  2009-02-16  402  =

bff595c15c92b9 Catalin Marinas  2009-02-16  403  	ctrl.vrs[FP] =3D frame->f=
p;
bff595c15c92b9 Catalin Marinas  2009-02-16  404  	ctrl.vrs[SP] =3D frame->s=
p;
bff595c15c92b9 Catalin Marinas  2009-02-16  405  	ctrl.vrs[LR] =3D frame->l=
r;
bff595c15c92b9 Catalin Marinas  2009-02-16  406  	ctrl.vrs[PC] =3D 0;
bff595c15c92b9 Catalin Marinas  2009-02-16  407  =

bff595c15c92b9 Catalin Marinas  2009-02-16  408  	if (idx->insn =3D=3D 1)
bff595c15c92b9 Catalin Marinas  2009-02-16  409  		/* can't unwind */
bff595c15c92b9 Catalin Marinas  2009-02-16  410  		return -URC_FAILURE;
532319b9c418fc Ard Biesheuvel   2021-10-04  411  	else if (frame->pc =3D=3D=
 prel31_to_addr(&idx->addr_offset)) {
532319b9c418fc Ard Biesheuvel   2021-10-04  412  		/*
532319b9c418fc Ard Biesheuvel   2021-10-04  413  		 * Unwinding is tricky w=
hen we're halfway through the prologue,
532319b9c418fc Ard Biesheuvel   2021-10-04  414  		 * since the stack frame=
 that the unwinder expects may not be
532319b9c418fc Ard Biesheuvel   2021-10-04  415  		 * fully set up yet. How=
ever, one thing we do know for sure is
532319b9c418fc Ard Biesheuvel   2021-10-04  416  		 * that if we are unwind=
ing from the very first instruction of
532319b9c418fc Ard Biesheuvel   2021-10-04  417  		 * a function, we are st=
ill effectively in the stack frame of
532319b9c418fc Ard Biesheuvel   2021-10-04  418  		 * the caller, and the u=
nwind info has no relevance yet.
532319b9c418fc Ard Biesheuvel   2021-10-04  419  		 */
532319b9c418fc Ard Biesheuvel   2021-10-04  420  		if (frame->pc =3D=3D fra=
me->lr)
532319b9c418fc Ard Biesheuvel   2021-10-04  421  			return -URC_FAILURE;
532319b9c418fc Ard Biesheuvel   2021-10-04  422  		frame->pc =3D frame->lr;
532319b9c418fc Ard Biesheuvel   2021-10-04  423  		return URC_OK;
532319b9c418fc Ard Biesheuvel   2021-10-04  424  	} else if ((idx->insn & 0=
x80000000) =3D=3D 0)
bff595c15c92b9 Catalin Marinas  2009-02-16  425  		/* prel31 to the unwind =
table */
bff595c15c92b9 Catalin Marinas  2009-02-16  426  		ctrl.insn =3D (unsigned =
long *)prel31_to_addr(&idx->insn);
bff595c15c92b9 Catalin Marinas  2009-02-16  427  	else if ((idx->insn & 0xf=
f000000) =3D=3D 0x80000000)
bff595c15c92b9 Catalin Marinas  2009-02-16  428  		/* only personality rout=
ine 0 supported in the index */
bff595c15c92b9 Catalin Marinas  2009-02-16  429  		ctrl.insn =3D &idx->insn;
bff595c15c92b9 Catalin Marinas  2009-02-16  430  	else {
8b521cb2947d88 Joe Perches      2014-09-16  431  		pr_warn("unwind: Unsuppo=
rted personality routine %08lx in the index at %p\n",
bff595c15c92b9 Catalin Marinas  2009-02-16  432  			idx->insn, idx);
bff595c15c92b9 Catalin Marinas  2009-02-16  433  		return -URC_FAILURE;
bff595c15c92b9 Catalin Marinas  2009-02-16  434  	}
bff595c15c92b9 Catalin Marinas  2009-02-16  435  =

bff595c15c92b9 Catalin Marinas  2009-02-16  436  	/* check the personality =
routine */
bff595c15c92b9 Catalin Marinas  2009-02-16  437  	if ((*ctrl.insn & 0xff000=
000) =3D=3D 0x80000000) {
bff595c15c92b9 Catalin Marinas  2009-02-16  438  		ctrl.byte =3D 2;
bff595c15c92b9 Catalin Marinas  2009-02-16  439  		ctrl.entries =3D 1;
bff595c15c92b9 Catalin Marinas  2009-02-16  440  	} else if ((*ctrl.insn & =
0xff000000) =3D=3D 0x81000000) {
bff595c15c92b9 Catalin Marinas  2009-02-16  441  		ctrl.byte =3D 1;
bff595c15c92b9 Catalin Marinas  2009-02-16  442  		ctrl.entries =3D 1 + ((*=
ctrl.insn & 0x00ff0000) >> 16);
bff595c15c92b9 Catalin Marinas  2009-02-16  443  	} else {
8b521cb2947d88 Joe Perches      2014-09-16  444  		pr_warn("unwind: Unsuppo=
rted personality routine %08lx at %p\n",
bff595c15c92b9 Catalin Marinas  2009-02-16  445  			*ctrl.insn, ctrl.insn);
bff595c15c92b9 Catalin Marinas  2009-02-16  446  		return -URC_FAILURE;
bff595c15c92b9 Catalin Marinas  2009-02-16  447  	}
bff595c15c92b9 Catalin Marinas  2009-02-16  448  =

a51345770e5195 Anurag Aggarwal  2014-02-24  449  	ctrl.check_each_pop =3D 0;
a51345770e5195 Anurag Aggarwal  2014-02-24  450  =

f6b8e3526feb02 Ard Biesheuvel   2022-03-11 @451  	if (prel31_to_addr(&idx->=
addr_offset) =3D=3D (u32)&call_with_stack) {
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  452  		/*
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  453  		 * call_with_stack() is =
the only place where we permit SP to
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  454  		 * jump from one stack t=
o another, and since we know it is
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  455  		 * guaranteed to happen,=
 set up the SP bounds accordingly.
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  456  		 */
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  457  		sp_low =3D frame->fp;
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  458  		ctrl.sp_high =3D ALIGN(f=
rame->fp, THREAD_SIZE);
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  459  	}
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  460  =

bff595c15c92b9 Catalin Marinas  2009-02-16  461  	while (ctrl.entries > 0) {
a51345770e5195 Anurag Aggarwal  2014-02-24  462  		int urc;
a51345770e5195 Anurag Aggarwal  2014-02-24  463  		if ((ctrl.sp_high - ctrl=
.vrs[SP]) < sizeof(ctrl.vrs))
a51345770e5195 Anurag Aggarwal  2014-02-24  464  			ctrl.check_each_pop =3D=
 1;
a51345770e5195 Anurag Aggarwal  2014-02-24  465  		urc =3D unwind_exec_insn=
(&ctrl);
bff595c15c92b9 Catalin Marinas  2009-02-16  466  		if (urc < 0)
bff595c15c92b9 Catalin Marinas  2009-02-16  467  			return urc;
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  468  		if (ctrl.vrs[SP] < sp_lo=
w || ctrl.vrs[SP] > ctrl.sp_high)
c894ed6956f126 Catalin Marinas  2009-06-19  469  			return -URC_FAILURE;
bff595c15c92b9 Catalin Marinas  2009-02-16  470  	}
bff595c15c92b9 Catalin Marinas  2009-02-16  471  =

bff595c15c92b9 Catalin Marinas  2009-02-16  472  	if (ctrl.vrs[PC] =3D=3D 0)
bff595c15c92b9 Catalin Marinas  2009-02-16  473  		ctrl.vrs[PC] =3D ctrl.vr=
s[LR];
bff595c15c92b9 Catalin Marinas  2009-02-16  474  =

c894ed6956f126 Catalin Marinas  2009-06-19  475  	/* check for infinite loo=
p */
8d54a275938968 Russell King     2019-12-22  476  	if (frame->pc =3D=3D ctrl=
.vrs[PC] && frame->sp =3D=3D ctrl.vrs[SP])
c894ed6956f126 Catalin Marinas  2009-06-19  477  		return -URC_FAILURE;
c894ed6956f126 Catalin Marinas  2009-06-19  478  =

bff595c15c92b9 Catalin Marinas  2009-02-16  479  	frame->fp =3D ctrl.vrs[FP=
];
bff595c15c92b9 Catalin Marinas  2009-02-16  480  	frame->sp =3D ctrl.vrs[SP=
];
bff595c15c92b9 Catalin Marinas  2009-02-16  481  	frame->lr =3D ctrl.vrs[LR=
];
bff595c15c92b9 Catalin Marinas  2009-02-16  482  	frame->pc =3D ctrl.vrs[PC=
];
538b9265c063f0 Ard Biesheuvel   2022-01-24  483  	frame->lr_addr =3D ctrl.l=
r_addr;
bff595c15c92b9 Catalin Marinas  2009-02-16  484  =

bff595c15c92b9 Catalin Marinas  2009-02-16  485  	return URC_OK;
bff595c15c92b9 Catalin Marinas  2009-02-16  486  }
bff595c15c92b9 Catalin Marinas  2009-02-16  487  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1262015173832783009==--

