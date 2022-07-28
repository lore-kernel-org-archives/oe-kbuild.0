Content-Type: multipart/mixed; boundary="===============1968277912732175710=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/kernel/stacktrace.c:163:1: warning: Label 'here' is not used. There is #if in function body so the label might be used in code that is removed by the preprocessor. [unusedLabelConfiguration]
Date: Thu, 28 Jul 2022 14:41:27 +0800
Message-ID: <202207281457.UpGaVUe9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1968277912732175710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/arm/=
kernel/stacktrace.c:163:1: warning: Label 'here' is not used. There is #if =
in function body so the label might be used in code that is removed by the =
preprocessor. [unusedLabelConfiguration]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6e7765cb477a9753670d4351d14de93f1e9dbbd4
commit: c46c2c9b43f4f08f20dc06417fbf7091e4ca6d34 ARM: unwind: set frame.pc =
correctly for current-thread unwinding
date:   5 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 5 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout c46c2c9b43f4f08f20dc06417fbf7091e4ca6d34
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm/kernel/stacktrace.c:163:1: warning: Label 'here' is not used. T=
here is #if in function body so the label might be used in code that is rem=
oved by the preprocessor. [unusedLabelConfiguration]
   here:
   ^
   arch/arm/kernel/stacktrace.c:133:61: warning: Parameter 'tsk' can be dec=
lared with const [constParameter]
   static noinline void __save_stack_trace(struct task_struct *tsk,
                                                               ^

vim +/here +163 arch/arm/kernel/stacktrace.c

f16fb1ecc5a1cb Russell King          2007-04-28  131  =

3683f44c42e991 Russell King          2014-05-03  132  /* This must be noinl=
ine to so that our skip calculation works correctly */
3683f44c42e991 Russell King          2014-05-03  133  static noinline void =
__save_stack_trace(struct task_struct *tsk,
3683f44c42e991 Russell King          2014-05-03  134  	struct stack_trace *=
trace, unsigned int nosched)
f16fb1ecc5a1cb Russell King          2007-04-28  135  {
f16fb1ecc5a1cb Russell King          2007-04-28  136  	struct stack_trace_d=
ata data;
2d7c11bfc91637 Catalin Marinas       2009-02-11  137  	struct stackframe fr=
ame;
f16fb1ecc5a1cb Russell King          2007-04-28  138  =

f16fb1ecc5a1cb Russell King          2007-04-28  139  	data.trace =3D trace;
f16fb1ecc5a1cb Russell King          2007-04-28  140  	data.skip =3D trace-=
>skip;
3683f44c42e991 Russell King          2014-05-03  141  	data.no_sched_functi=
ons =3D nosched;
f76e9154736e9a Nicolas Pitre         2008-04-24  142  =

f76e9154736e9a Nicolas Pitre         2008-04-24  143  	if (tsk !=3D current=
) {
f76e9154736e9a Nicolas Pitre         2008-04-24  144  #ifdef CONFIG_SMP
f76e9154736e9a Nicolas Pitre         2008-04-24  145  		/*
d5996b2ff0e26c Russell King          2011-01-15  146  		 * What guarantees =
do we have here that 'tsk' is not
d5996b2ff0e26c Russell King          2011-01-15  147  		 * running on anoth=
er CPU?  For now, ignore it as we
d5996b2ff0e26c Russell King          2011-01-15  148  		 * can't guarantee =
we won't explode.
f76e9154736e9a Nicolas Pitre         2008-04-24  149  		 */
d5996b2ff0e26c Russell King          2011-01-15  150  		return;
f76e9154736e9a Nicolas Pitre         2008-04-24  151  #else
2d7c11bfc91637 Catalin Marinas       2009-02-11  152  		frame.fp =3D thread=
_saved_fp(tsk);
2d7c11bfc91637 Catalin Marinas       2009-02-11  153  		frame.sp =3D thread=
_saved_sp(tsk);
2d7c11bfc91637 Catalin Marinas       2009-02-11  154  		frame.lr =3D 0;		/*=
 recovered from the stack */
2d7c11bfc91637 Catalin Marinas       2009-02-11  155  		frame.pc =3D thread=
_saved_pc(tsk);
f76e9154736e9a Nicolas Pitre         2008-04-24  156  #endif
f76e9154736e9a Nicolas Pitre         2008-04-24  157  	} else {
3683f44c42e991 Russell King          2014-05-03  158  		/* We don't want th=
is function nor the caller */
3683f44c42e991 Russell King          2014-05-03  159  		data.skip +=3D 2;
2d7c11bfc91637 Catalin Marinas       2009-02-11  160  		frame.fp =3D (unsig=
ned long)__builtin_frame_address(0);
74dbeee0fcded9 Behan Webster         2014-09-27  161  		frame.sp =3D curren=
t_stack_pointer;
2d7c11bfc91637 Catalin Marinas       2009-02-11  162  		frame.lr =3D (unsig=
ned long)__builtin_return_address(0);
c46c2c9b43f4f0 Russell King (Oracle  2022-03-09 @163) here:
c46c2c9b43f4f0 Russell King (Oracle  2022-03-09  164) 		frame.pc =3D (unsig=
ned long)&&here;
f76e9154736e9a Nicolas Pitre         2008-04-24  165  	}
fed240d9c97438 Masami Hiramatsu      2021-10-21  166  #ifdef CONFIG_KRETPRO=
BES
fed240d9c97438 Masami Hiramatsu      2021-10-21  167  	frame.kr_cur =3D NUL=
L;
fed240d9c97438 Masami Hiramatsu      2021-10-21  168  	frame.tsk =3D tsk;
fed240d9c97438 Masami Hiramatsu      2021-10-21  169  #endif
f16fb1ecc5a1cb Russell King          2007-04-28  170  =

2d7c11bfc91637 Catalin Marinas       2009-02-11  171  	walk_stackframe(&fra=
me, save_trace, &data);
f76e9154736e9a Nicolas Pitre         2008-04-24  172  }
f76e9154736e9a Nicolas Pitre         2008-04-24  173  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1968277912732175710==--

