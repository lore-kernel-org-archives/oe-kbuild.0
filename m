Content-Type: multipart/mixed; boundary="===============3112621329925163007=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/kernel/return_address.c:44:1: warning: Label 'here' is not used. There is #if in function body so the label might be used in code that is removed by the preprocessor. [unusedLabelConfiguration]
Date: Sat, 02 Apr 2022 14:40:21 +0800
Message-ID: <202204021433.QkAKKxLS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3112621329925163007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   88e6c0207623874922712e162e25d9dafd39661e
commit: c46c2c9b43f4f08f20dc06417fbf7091e4ca6d34 ARM: unwind: set frame.pc =
correctly for current-thread unwinding
date:   3 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 weeks ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm/kernel/return_address.c:44:1: warning: Label 'here' is not used=
. There is #if in function body so the label might be used in code that is =
removed by the preprocessor. [unusedLabelConfiguration]
   here:
   ^
--
>> arch/arm/mm/ioremap.c:72:46: warning: Parameter 'vaddr' can be declared =
with const [constParameter]
   struct static_vm *find_static_vm_vaddr(void *vaddr)
                                                ^
>> arch/arm/mm/ioremap.c:85:11: warning: Uninitialized variables: svm.vm, s=
vm.list [uninitvar]
      return svm;
             ^
   arch/arm/mm/ioremap.c:81:16: note: Assuming condition is false
     if (vm->addr > vaddr)
                  ^
   arch/arm/mm/ioremap.c:81:16: note: Assuming condition is false
     if (vm->addr > vaddr)
                  ^
   arch/arm/mm/ioremap.c:85:11: note: Uninitialized variables: svm.vm, svm.=
list
      return svm;
             ^
--
>> arch/arm/kernel/stacktrace.c:163:1: warning: Label 'here' is not used. T=
here is #if in function body so the label might be used in code that is rem=
oved by the preprocessor. [unusedLabelConfiguration]
   here:
   ^
>> arch/arm/kernel/stacktrace.c:133:61: warning: Parameter 'tsk' can be dec=
lared with const [constParameter]
   static noinline void __save_stack_trace(struct task_struct *tsk,
                                                               ^
--
>> arch/arm/kernel/setup.c:744:2: warning: There is an unknown macro here s=
omewhere. Configuration is required. If for_each_machine_desc is a macro th=
en please configure it. [unknownMacro]
    for_each_machine_desc(p)
    ^
>> arch/arm/kernel/traps.c:497:1: warning: There is an unknown macro here s=
omewhere. Configuration is required. If NOKPROBE_SYMBOL is a macro then ple=
ase configure it. [unknownMacro]
   NOKPROBE_SYMBOL(do_undefinstr)
   ^
>> arch/arm/mm/dma-mapping.c:999:2: warning: There is an unknown macro here=
 somewhere. Configuration is required. If for_each_sg is a macro then pleas=
e configure it. [unknownMacro]
    for_each_sg(sg, s, i, j)
    ^

vim +/here +44 arch/arm/kernel/return_address.c

4bf1fa5a34aa2d Uwe Kleine-K=C3=B6nig      2009-07-21  32  =

4bf1fa5a34aa2d Uwe Kleine-K=C3=B6nig      2009-07-21  33  void *return_addr=
ess(unsigned int level)
4bf1fa5a34aa2d Uwe Kleine-K=C3=B6nig      2009-07-21  34  {
4bf1fa5a34aa2d Uwe Kleine-K=C3=B6nig      2009-07-21  35  	struct return_ad=
dress_data data;
4bf1fa5a34aa2d Uwe Kleine-K=C3=B6nig      2009-07-21  36  	struct stackfram=
e frame;
4bf1fa5a34aa2d Uwe Kleine-K=C3=B6nig      2009-07-21  37  =

01223f365074d6 Keun-O Park           2013-03-18  38  	data.level =3D level =
+ 2;
01223f365074d6 Keun-O Park           2013-03-18  39  	data.addr =3D NULL;
4bf1fa5a34aa2d Uwe Kleine-K=C3=B6nig      2009-07-21  40  =

4bf1fa5a34aa2d Uwe Kleine-K=C3=B6nig      2009-07-21  41  	frame.fp =3D (un=
signed long)__builtin_frame_address(0);
a556ee1247b997 Behan Webster         2014-09-27  42  	frame.sp =3D current_=
stack_pointer;
4bf1fa5a34aa2d Uwe Kleine-K=C3=B6nig      2009-07-21  43  	frame.lr =3D (un=
signed long)__builtin_return_address(0);
c46c2c9b43f4f0 Russell King (Oracle  2022-03-09 @44) here:
c46c2c9b43f4f0 Russell King (Oracle  2022-03-09  45) 	frame.pc =3D (unsigne=
d long)&&here;
fed240d9c97438 Masami Hiramatsu      2021-10-21  46  #ifdef CONFIG_KRETPROB=
ES
fed240d9c97438 Masami Hiramatsu      2021-10-21  47  	frame.kr_cur =3D NULL;
fed240d9c97438 Masami Hiramatsu      2021-10-21  48  	frame.tsk =3D current;
fed240d9c97438 Masami Hiramatsu      2021-10-21  49  #endif
4bf1fa5a34aa2d Uwe Kleine-K=C3=B6nig      2009-07-21  50  =

4bf1fa5a34aa2d Uwe Kleine-K=C3=B6nig      2009-07-21  51  	walk_stackframe(=
&frame, save_return_addr, &data);
4bf1fa5a34aa2d Uwe Kleine-K=C3=B6nig      2009-07-21  52  =

4bf1fa5a34aa2d Uwe Kleine-K=C3=B6nig      2009-07-21  53  	if (!data.level)
4bf1fa5a34aa2d Uwe Kleine-K=C3=B6nig      2009-07-21  54  		return data.add=
r;
4bf1fa5a34aa2d Uwe Kleine-K=C3=B6nig      2009-07-21  55  	else
4bf1fa5a34aa2d Uwe Kleine-K=C3=B6nig      2009-07-21  56  		return NULL;
4bf1fa5a34aa2d Uwe Kleine-K=C3=B6nig      2009-07-21  57  }
4bf1fa5a34aa2d Uwe Kleine-K=C3=B6nig      2009-07-21  58  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3112621329925163007==--

