Content-Type: multipart/mixed; boundary="===============7507063376959379428=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm64/kernel/stacktrace.c:178:26: warning: Either the condition 'regs' is redundant or there is possible null pointer dereference: regs.
Date: Fri, 19 Feb 2021 06:50:42 +0800
Message-ID: <202102190640.i9WJLr7E-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7507063376959379428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mark Brown <broonie@kernel.org>
CC: Will Deacon <will@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f40ddce88593482919761f74910f42f4b84c004b
commit: 9e0f085c2b33ebe13bcec53cbacce505fe78fde7 arm64: Move console stack =
display code to stacktrace.c
date:   5 months ago
:::::: branch date: 4 days ago
:::::: commit date: 5 months ago
compiler: aarch64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm64/kernel/stacktrace.c:178:26: warning: Either the condition 're=
gs' is redundant or there is possible null pointer dereference: regs. [null=
PointerRedundantCheck]
     } else if (frame.fp =3D=3D regs->regs[29]) {
                            ^
   arch/arm64/kernel/stacktrace.c:148:6: note: Assuming that condition 'reg=
s' is not redundant
    if (regs) {
        ^
   arch/arm64/kernel/stacktrace.c:178:26: note: Null pointer dereference
     } else if (frame.fp =3D=3D regs->regs[29]) {
                            ^

vim +/regs +178 arch/arm64/kernel/stacktrace.c

9e0f085c2b33eb Mark Brown 2020-09-21  139  =

9e0f085c2b33eb Mark Brown 2020-09-21  140  void dump_backtrace(struct pt_re=
gs *regs, struct task_struct *tsk,
9e0f085c2b33eb Mark Brown 2020-09-21  141  		    const char *loglvl)
9e0f085c2b33eb Mark Brown 2020-09-21  142  {
9e0f085c2b33eb Mark Brown 2020-09-21  143  	struct stackframe frame;
9e0f085c2b33eb Mark Brown 2020-09-21  144  	int skip =3D 0;
9e0f085c2b33eb Mark Brown 2020-09-21  145  =

9e0f085c2b33eb Mark Brown 2020-09-21  146  	pr_debug("%s(regs =3D %p tsk =
=3D %p)\n", __func__, regs, tsk);
9e0f085c2b33eb Mark Brown 2020-09-21  147  =

9e0f085c2b33eb Mark Brown 2020-09-21  148  	if (regs) {
9e0f085c2b33eb Mark Brown 2020-09-21  149  		if (user_mode(regs))
9e0f085c2b33eb Mark Brown 2020-09-21  150  			return;
9e0f085c2b33eb Mark Brown 2020-09-21  151  		skip =3D 1;
9e0f085c2b33eb Mark Brown 2020-09-21  152  	}
9e0f085c2b33eb Mark Brown 2020-09-21  153  =

9e0f085c2b33eb Mark Brown 2020-09-21  154  	if (!tsk)
9e0f085c2b33eb Mark Brown 2020-09-21  155  		tsk =3D current;
9e0f085c2b33eb Mark Brown 2020-09-21  156  =

9e0f085c2b33eb Mark Brown 2020-09-21  157  	if (!try_get_task_stack(tsk))
9e0f085c2b33eb Mark Brown 2020-09-21  158  		return;
9e0f085c2b33eb Mark Brown 2020-09-21  159  =

9e0f085c2b33eb Mark Brown 2020-09-21  160  	if (tsk =3D=3D current) {
9e0f085c2b33eb Mark Brown 2020-09-21  161  		start_backtrace(&frame,
9e0f085c2b33eb Mark Brown 2020-09-21  162  				(unsigned long)__builtin_fra=
me_address(0),
9e0f085c2b33eb Mark Brown 2020-09-21  163  				(unsigned long)dump_backtrac=
e);
9e0f085c2b33eb Mark Brown 2020-09-21  164  	} else {
9e0f085c2b33eb Mark Brown 2020-09-21  165  		/*
9e0f085c2b33eb Mark Brown 2020-09-21  166  		 * task blocked in __switch_to
9e0f085c2b33eb Mark Brown 2020-09-21  167  		 */
9e0f085c2b33eb Mark Brown 2020-09-21  168  		start_backtrace(&frame,
9e0f085c2b33eb Mark Brown 2020-09-21  169  				thread_saved_fp(tsk),
9e0f085c2b33eb Mark Brown 2020-09-21  170  				thread_saved_pc(tsk));
9e0f085c2b33eb Mark Brown 2020-09-21  171  	}
9e0f085c2b33eb Mark Brown 2020-09-21  172  =

9e0f085c2b33eb Mark Brown 2020-09-21  173  	printk("%sCall trace:\n", loglv=
l);
9e0f085c2b33eb Mark Brown 2020-09-21  174  	do {
9e0f085c2b33eb Mark Brown 2020-09-21  175  		/* skip until specified stack =
frame */
9e0f085c2b33eb Mark Brown 2020-09-21  176  		if (!skip) {
9e0f085c2b33eb Mark Brown 2020-09-21  177  			dump_backtrace_entry(frame.pc=
, loglvl);
9e0f085c2b33eb Mark Brown 2020-09-21 @178  		} else if (frame.fp =3D=3D reg=
s->regs[29]) {
9e0f085c2b33eb Mark Brown 2020-09-21  179  			skip =3D 0;
9e0f085c2b33eb Mark Brown 2020-09-21  180  			/*
9e0f085c2b33eb Mark Brown 2020-09-21  181  			 * Mostly, this is the case w=
here this function is
9e0f085c2b33eb Mark Brown 2020-09-21  182  			 * called in panic/abort. As =
exception handler's
9e0f085c2b33eb Mark Brown 2020-09-21  183  			 * stack frame does not conta=
in the corresponding pc
9e0f085c2b33eb Mark Brown 2020-09-21  184  			 * at which an exception has =
taken place, use regs->pc
9e0f085c2b33eb Mark Brown 2020-09-21  185  			 * instead.
9e0f085c2b33eb Mark Brown 2020-09-21  186  			 */
9e0f085c2b33eb Mark Brown 2020-09-21  187  			dump_backtrace_entry(regs->pc=
, loglvl);
9e0f085c2b33eb Mark Brown 2020-09-21  188  		}
9e0f085c2b33eb Mark Brown 2020-09-21  189  	} while (!unwind_frame(tsk, &fr=
ame));
9e0f085c2b33eb Mark Brown 2020-09-21  190  =

9e0f085c2b33eb Mark Brown 2020-09-21  191  	put_task_stack(tsk);
9e0f085c2b33eb Mark Brown 2020-09-21  192  }
9e0f085c2b33eb Mark Brown 2020-09-21  193  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7507063376959379428==--

