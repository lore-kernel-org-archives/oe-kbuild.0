Content-Type: multipart/mixed; boundary="===============8590686465476213046=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/powerpc/kernel/signal_64.c:807 sys_rt_sigreturn() warn: argument 5 to %016lx specifier is cast from pointer
Date: Mon, 23 Nov 2020 18:23:07 +0800
Message-ID: <202011231800.GLWJGcBR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8590686465476213046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Michal Suchanek <msuchanek@suse.de>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   418baf2c28f3473039f2f7377760bd8f6897ae18
commit: 0a7601b6ffddec11d7cc0bc3264daf0159f5e1a6 powerpc/64: make buildable=
 without CONFIG_COMPAT
date:   8 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 8 months ago
config: powerpc64-randconfig-m031-20201123 (attached as .config)
compiler: powerpc64le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/powerpc/kernel/signal_64.c:807 sys_rt_sigreturn() warn: argument 5 to =
%016lx specifier is cast from pointer
arch/powerpc/kernel/signal_64.c:807 sys_rt_sigreturn() warn: argument 5 to =
%08lx specifier is cast from pointer
arch/powerpc/kernel/signal_64.c:919 handle_rt_signal64() warn: argument 5 t=
o %016lx specifier is cast from pointer
arch/powerpc/kernel/signal_64.c:919 handle_rt_signal64() warn: argument 5 t=
o %08lx specifier is cast from pointer

vim +807 arch/powerpc/kernel/signal_64.c

^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  714  =

^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  715  	/* Always make any pending restarted system calls return -EIN=
TR */
f56141e3e2d9aab arch/powerpc/kernel/signal_64.c Andy Lutomirski        2015=
-02-12  716  	current->restart_block.fn =3D do_no_restart_syscall;
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  717  =

96d4f267e40f950 arch/powerpc/kernel/signal_64.c Linus Torvalds         2019=
-01-03  718  	if (!access_ok(uc, sizeof(*uc)))
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  719  		goto badframe;
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  720  =

^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  721  	if (__copy_from_user(&set, &uc->uc_sigmask, sizeof(set)))
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  722  		goto badframe;
17440f171e28e86 arch/powerpc/kernel/signal_64.c Al Viro                2012=
-04-27  723  	set_current_blocked(&set);
78a3e8889b4b6b9 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-08-23  724  =

2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  725  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
78a3e8889b4b6b9 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-08-23  726  	/*
78a3e8889b4b6b9 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-08-23  727  	 * If there is a transactional state then throw it away.
78a3e8889b4b6b9 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-08-23  728  	 * The purpose of a sigreturn is to destroy all traces of the
78a3e8889b4b6b9 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-08-23  729  	 * signal frame, this includes any transactional state created
78a3e8889b4b6b9 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-08-23  730  	 * within in. We only check for suspended as we can never be
78a3e8889b4b6b9 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-08-23  731  	 * active in the kernel, we are active, there is nothing bett=
er to
78a3e8889b4b6b9 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-08-23  732  	 * do than go ahead and Bad Thing later.
78a3e8889b4b6b9 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-08-23  733  	 * The cause is not important as there will never be a
78a3e8889b4b6b9 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-08-23  734  	 * recheckpoint so it's not user visible.
78a3e8889b4b6b9 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-08-23  735  	 */
78a3e8889b4b6b9 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-08-23  736  	if (MSR_TM_SUSPENDED(mfmsr()))
78a3e8889b4b6b9 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-08-23  737  		tm_reclaim_current(0);
78a3e8889b4b6b9 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-08-23  738  =

e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  739  	/*
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  740  	 * Disable MSR[TS] bit also, so, if there is an exception in =
the
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  741  	 * code below (as a page fault in copy_ckvsx_to_user()), it d=
oes
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  742  	 * not recheckpoint this task if there was a context switch i=
nside
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  743  	 * the exception.
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  744  	 *
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  745  	 * A major page fault can indirectly call schedule(). A resch=
edule
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  746  	 * process in the middle of an exception can have a side effe=
ct
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  747  	 * (Changing the CPU MSR[TS] state), since schedule() is call=
ed
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  748  	 * with the CPU MSR[TS] disable and returns with MSR[TS]=3DSu=
spended
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  749  	 * (switch_to() calls tm_recheckpoint() for the 'new' process=
). In
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  750  	 * this case, the process continues to be the same in the CPU=
, but
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  751  	 * the CPU state just changed.
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  752  	 *
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  753  	 * This can cause a TM Bad Thing, since the MSR in the stack =
will
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  754  	 * have the MSR[TS]=3D0, and this is what will be used to RFI=
D.
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  755  	 *
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  756  	 * Clearing MSR[TS] state here will avoid a recheckpoint if t=
here
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  757  	 * is any process reschedule in kernel space. The MSR[TS] sta=
te
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  758  	 * does not need to be saved also, since it will be replaced =
with
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  759  	 * the MSR[TS] that came from user context later, at
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  760  	 * restore_tm_sigcontexts.
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  761  	 */
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  762  	regs->msr &=3D ~MSR_TS_MASK;
e620d45065c7b5b arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-16  763  =

2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  764  	if (__get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR]))
2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  765  		goto badframe;
87b4e5393af77f5 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-06-09  766  	if (MSR_TM_ACTIVE(msr)) {
2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  767  		/* We recheckpoint on return. */
2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  768  		struct ucontext __user *uc_transact;
f16d80b75a096c5 arch/powerpc/kernel/signal_64.c Michael Neuling        2019=
-07-19  769  =

f16d80b75a096c5 arch/powerpc/kernel/signal_64.c Michael Neuling        2019=
-07-19  770  		/* Trying to start TM on non TM system */
f16d80b75a096c5 arch/powerpc/kernel/signal_64.c Michael Neuling        2019=
-07-19  771  		if (!cpu_has_feature(CPU_FTR_TM))
f16d80b75a096c5 arch/powerpc/kernel/signal_64.c Michael Neuling        2019=
-07-19  772  			goto badframe;
f16d80b75a096c5 arch/powerpc/kernel/signal_64.c Michael Neuling        2019=
-07-19  773  =

2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  774  		if (__get_user(uc_transact, &uc->uc_link))
2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  775  			goto badframe;
d11994314b2bfe0 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-09-23  776  		if (restore_tm_sigcontexts(current, &uc->uc_mcontext,
2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  777  					   &uc_transact->uc_mcontext))
2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  778  			goto badframe;
897bc3df8c5aebb arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-09  779  	} else
2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  780  #endif
897bc3df8c5aebb arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-09  781  	{
6f5b9f018f4c768 arch/powerpc/kernel/signal_64.c Breno Leitao           2018=
-11-26  782  		/*
897bc3df8c5aebb arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-09  783  		 * Fall through, for non-TM restore
897bc3df8c5aebb arch/powerpc/kernel/signal_64.c Breno Leitao           2019=
-01-09  784  		 *
6f5b9f018f4c768 arch/powerpc/kernel/signal_64.c Breno Leitao           2018=
-11-26  785  		 * Unset MSR[TS] on the thread regs since MSR from user
6f5b9f018f4c768 arch/powerpc/kernel/signal_64.c Breno Leitao           2018=
-11-26  786  		 * context does not have MSR active, and recheckpoint was
6f5b9f018f4c768 arch/powerpc/kernel/signal_64.c Breno Leitao           2018=
-11-26  787  		 * not called since restore_tm_sigcontexts() was not called
6f5b9f018f4c768 arch/powerpc/kernel/signal_64.c Breno Leitao           2018=
-11-26  788  		 * also.
6f5b9f018f4c768 arch/powerpc/kernel/signal_64.c Breno Leitao           2018=
-11-26  789  		 *
6f5b9f018f4c768 arch/powerpc/kernel/signal_64.c Breno Leitao           2018=
-11-26  790  		 * If not unsetting it, the code can RFID to userspace with
6f5b9f018f4c768 arch/powerpc/kernel/signal_64.c Breno Leitao           2018=
-11-26  791  		 * MSR[TS] set, but without CPU in the proper state,
6f5b9f018f4c768 arch/powerpc/kernel/signal_64.c Breno Leitao           2018=
-11-26  792  		 * causing a TM bad thing.
6f5b9f018f4c768 arch/powerpc/kernel/signal_64.c Breno Leitao           2018=
-11-26  793  		 */
6f5b9f018f4c768 arch/powerpc/kernel/signal_64.c Breno Leitao           2018=
-11-26  794  		current->thread.regs->msr &=3D ~MSR_TS_MASK;
d11994314b2bfe0 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-09-23  795  		if (restore_sigcontext(current, NULL, 1, &uc->uc_mcontext))
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  796  			goto badframe;
6f5b9f018f4c768 arch/powerpc/kernel/signal_64.c Breno Leitao           2018=
-11-26  797  	}
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  798  =

7cce246557bf379 arch/powerpc/kernel/signal_64.c Al Viro                2012=
-12-23  799  	if (restore_altstack(&uc->uc_stack))
7cce246557bf379 arch/powerpc/kernel/signal_64.c Al Viro                2012=
-12-23  800  		goto badframe;
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  801  =

401d1f029bebb71 arch/powerpc/kernel/signal_64.c David Woodhouse        2005=
-11-15  802  	set_thread_flag(TIF_RESTOREALL);
401d1f029bebb71 arch/powerpc/kernel/signal_64.c David Woodhouse        2005=
-11-15  803  	return 0;
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  804  =

^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  805  badframe:
76462232c21dc01 arch/powerpc/kernel/signal_64.c Christian Dietrich     2011=
-06-04  806  	if (show_unhandled_signals)
76462232c21dc01 arch/powerpc/kernel/signal_64.c Christian Dietrich     2011=
-06-04 @807  		printk_ratelimited(regs->msr & MSR_64BIT ? fmt64 : fmt32,
d0c3d534a4388a4 arch/powerpc/kernel/signal_64.c Olof Johansson         2007=
-10-12  808  				   current->comm, current->pid, "rt_sigreturn",
d0c3d534a4388a4 arch/powerpc/kernel/signal_64.c Olof Johansson         2007=
-10-12  809  				   (long)uc, regs->nip, regs->link);
d0c3d534a4388a4 arch/powerpc/kernel/signal_64.c Olof Johansson         2007=
-10-12  810  =

3cf5d076fb4d489 arch/powerpc/kernel/signal_64.c Eric W. Biederman      2019=
-05-23  811  	force_sig(SIGSEGV);
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  812  	return 0;
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  813  }
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  814  =

d11994314b2bfe0 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-09-23  815  int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
d11994314b2bfe0 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-09-23  816  		struct task_struct *tsk)
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  817  {
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  818  	struct rt_sigframe __user *frame;
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  819  	unsigned long newsp =3D 0;
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  820  	long err =3D 0;
d11994314b2bfe0 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-09-23  821  	struct pt_regs *regs =3D tsk->thread.regs;
2464cc4c345699a arch/powerpc/kernel/signal_64.c Gustavo Luiz Duarte    2020=
-02-11  822  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
2464cc4c345699a arch/powerpc/kernel/signal_64.c Gustavo Luiz Duarte    2020=
-02-11  823  	/* Save the thread's msr before get_tm_stackpointer() changes=
 it */
2464cc4c345699a arch/powerpc/kernel/signal_64.c Gustavo Luiz Duarte    2020=
-02-11  824  	unsigned long msr =3D regs->msr;
2464cc4c345699a arch/powerpc/kernel/signal_64.c Gustavo Luiz Duarte    2020=
-02-11  825  #endif
d11994314b2bfe0 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-09-23  826  =

d11994314b2bfe0 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-09-23  827  	BUG_ON(tsk !=3D current);
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  828  =

d11994314b2bfe0 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-09-23  829  	frame =3D get_sigframe(ksig, get_tm_stackpointer(tsk), sizeof=
(*frame), 0);
a3f61dc0a533533 arch/powerpc/kernel/signal_64.c Benjamin Herrenschmidt 2007=
-06-04  830  	if (unlikely(frame =3D=3D NULL))
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  831  		goto badframe;
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  832  =

^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  833  	err |=3D __put_user(&frame->info, &frame->pinfo);
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  834  	err |=3D __put_user(&frame->uc, &frame->puc);
129b69df9c90747 arch/powerpc/kernel/signal_64.c Richard Weinberger     2014=
-03-02  835  	err |=3D copy_siginfo_to_user(&frame->info, &ksig->info);
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  836  	if (err)
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  837  		goto badframe;
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  838  =

^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  839  	/* Create the ucontext.  */
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  840  	err |=3D __put_user(0, &frame->uc.uc_flags);
7cce246557bf379 arch/powerpc/kernel/signal_64.c Al Viro                2012=
-12-23  841  	err |=3D __save_altstack(&frame->uc.uc_stack, regs->gpr[1]);
2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  842  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
2464cc4c345699a arch/powerpc/kernel/signal_64.c Gustavo Luiz Duarte    2020=
-02-11  843  	if (MSR_TM_ACTIVE(msr)) {
2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  844  		/* The ucontext_t passed to userland points to the second
2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  845  		 * ucontext_t (for transactional state) with its uc_link ptr.
2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  846  		 */
2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  847  		err |=3D __put_user(&frame->uc_transact, &frame->uc.uc_link);
2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  848  		err |=3D setup_tm_sigcontexts(&frame->uc.uc_mcontext,
2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  849  					    &frame->uc_transact.uc_mcontext,
d11994314b2bfe0 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-09-23  850  					    tsk, ksig->sig, NULL,
2464cc4c345699a arch/powerpc/kernel/signal_64.c Gustavo Luiz Duarte    2020=
-02-11  851  					    (unsigned long)ksig->ka.sa.sa_handler,
2464cc4c345699a arch/powerpc/kernel/signal_64.c Gustavo Luiz Duarte    2020=
-02-11  852  					    msr);
2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  853  	} else
2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  854  #endif
2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  855  	{
2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  856  		err |=3D __put_user(0, &frame->uc.uc_link);
d11994314b2bfe0 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-09-23  857  		err |=3D setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig-=
>sig,
129b69df9c90747 arch/powerpc/kernel/signal_64.c Richard Weinberger     2014=
-03-02  858  					NULL, (unsigned long)ksig->ka.sa.sa_handler,
2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  859  					1);
2b0a576d15e0e14 arch/powerpc/kernel/signal_64.c Michael Neuling        2013=
-02-13  860  	}
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  861  	err |=3D __copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*s=
et));
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  862  	if (err)
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  863  		goto badframe;
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  864  =

cc657f53928997c arch/powerpc/kernel/signal_64.c Paul Mackerras         2005=
-11-14  865  	/* Make sure signal handler doesn't get spurious FP exception=
s */
d11994314b2bfe0 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-09-23  866  	tsk->thread.fp_state.fpscr =3D 0;
cc657f53928997c arch/powerpc/kernel/signal_64.c Paul Mackerras         2005=
-11-14  867  =

^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  868  	/* Set up to return from userspace. */
d11994314b2bfe0 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-09-23  869  	if (vdso64_rt_sigtramp && tsk->mm->context.vdso_base) {
d11994314b2bfe0 arch/powerpc/kernel/signal_64.c Cyril Bur              2016=
-09-23  870  		regs->link =3D tsk->mm->context.vdso_base + vdso64_rt_sigtra=
mp;
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  871  	} else {
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  872  		err |=3D setup_trampoline(__NR_rt_sigreturn, &frame->tramp[0=
]);
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  873  		if (err)
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  874  			goto badframe;
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  875  		regs->link =3D (unsigned long) &frame->tramp[0];
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  876  	}
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  877  =

^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  878  	/* Allocate a dummy caller frame for the signal handler. */
a3f61dc0a533533 arch/powerpc/kernel/signal_64.c Benjamin Herrenschmidt 2007=
-06-04  879  	newsp =3D ((unsigned long)frame) - __SIGNAL_FRAMESIZE;
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  880  	err |=3D put_user(regs->gpr[1], (unsigned long __user *)newsp=
);
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  881  =

^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  882  	/* Set up "regs" so we "return" to the signal handler. */
d606b92aedb0542 arch/powerpc/kernel/signal_64.c Rusty Russell          2013=
-11-20  883  	if (is_elf2_task()) {
129b69df9c90747 arch/powerpc/kernel/signal_64.c Richard Weinberger     2014=
-03-02  884  		regs->nip =3D (unsigned long) ksig->ka.sa.sa_handler;
d606b92aedb0542 arch/powerpc/kernel/signal_64.c Rusty Russell          2013=
-11-20  885  		regs->gpr[12] =3D regs->nip;
d606b92aedb0542 arch/powerpc/kernel/signal_64.c Rusty Russell          2013=
-11-20  886  	} else {
d606b92aedb0542 arch/powerpc/kernel/signal_64.c Rusty Russell          2013=
-11-20  887  		/* Handler is *really* a pointer to the function descriptor =
for
d606b92aedb0542 arch/powerpc/kernel/signal_64.c Rusty Russell          2013=
-11-20  888  		 * the signal routine.  The first entry in the function
d606b92aedb0542 arch/powerpc/kernel/signal_64.c Rusty Russell          2013=
-11-20  889  		 * descriptor is the entry address of signal and the second
d606b92aedb0542 arch/powerpc/kernel/signal_64.c Rusty Russell          2013=
-11-20  890  		 * entry is the TOC value we need to use.
d606b92aedb0542 arch/powerpc/kernel/signal_64.c Rusty Russell          2013=
-11-20  891  		 */
d606b92aedb0542 arch/powerpc/kernel/signal_64.c Rusty Russell          2013=
-11-20  892  		func_descr_t __user *funct_desc_ptr =3D
129b69df9c90747 arch/powerpc/kernel/signal_64.c Richard Weinberger     2014=
-03-02  893  			(func_descr_t __user *) ksig->ka.sa.sa_handler;
d606b92aedb0542 arch/powerpc/kernel/signal_64.c Rusty Russell          2013=
-11-20  894  =

^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  895  		err |=3D get_user(regs->nip, &funct_desc_ptr->entry);
d606b92aedb0542 arch/powerpc/kernel/signal_64.c Rusty Russell          2013=
-11-20  896  		err |=3D get_user(regs->gpr[2], &funct_desc_ptr->toc);
d606b92aedb0542 arch/powerpc/kernel/signal_64.c Rusty Russell          2013=
-11-20  897  	}
d606b92aedb0542 arch/powerpc/kernel/signal_64.c Rusty Russell          2013=
-11-20  898  =

e871c6bbf66c1b4 arch/powerpc/kernel/signal_64.c Anton Blanchard        2013=
-09-23  899  	/* enter the signal handler in native-endian mode */
fab5db97e44f764 arch/powerpc/kernel/signal_64.c Paul Mackerras         2006=
-06-07  900  	regs->msr &=3D ~MSR_LE;
e871c6bbf66c1b4 arch/powerpc/kernel/signal_64.c Anton Blanchard        2013=
-09-23  901  	regs->msr |=3D (MSR_KERNEL & MSR_LE);
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  902  	regs->gpr[1] =3D newsp;
129b69df9c90747 arch/powerpc/kernel/signal_64.c Richard Weinberger     2014=
-03-02  903  	regs->gpr[3] =3D ksig->sig;
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  904  	regs->result =3D 0;
129b69df9c90747 arch/powerpc/kernel/signal_64.c Richard Weinberger     2014=
-03-02  905  	if (ksig->ka.sa.sa_flags & SA_SIGINFO) {
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  906  		err |=3D get_user(regs->gpr[4], (unsigned long __user *)&fra=
me->pinfo);
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  907  		err |=3D get_user(regs->gpr[5], (unsigned long __user *)&fra=
me->puc);
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  908  		regs->gpr[6] =3D (unsigned long) frame;
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  909  	} else {
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  910  		regs->gpr[4] =3D (unsigned long)&frame->uc.uc_mcontext;
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  911  	}
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  912  	if (err)
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  913  		goto badframe;
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  914  =

129b69df9c90747 arch/powerpc/kernel/signal_64.c Richard Weinberger     2014=
-03-02  915  	return 0;
^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  916  =

^1da177e4c3f415 arch/ppc64/kernel/signal.c      Linus Torvalds         2005=
-04-16  917  badframe:
76462232c21dc01 arch/powerpc/kernel/signal_64.c Christian Dietrich     2011=
-06-04  918  	if (show_unhandled_signals)
76462232c21dc01 arch/powerpc/kernel/signal_64.c Christian Dietrich     2011=
-06-04 @919  		printk_ratelimited(regs->msr & MSR_64BIT ? fmt64 : fmt32,

:::::: The code at line 807 was first introduced by commit
:::::: 76462232c21dc011462522387ddad0598a4f11e4 arch/powerpc: use printk_ra=
telimited instead of printk_ratelimit

:::::: TO: Christian Dietrich <christian.dietrich@informatik.uni-erlangen=
.de>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8590686465476213046==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8590686465476213046==--

