Content-Type: multipart/mixed; boundary="===============6675134385507973292=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: arch/x86/kernel/vm86_32.c:156:1: warning: Label 'Efault_end' is not used. [unusedLabel]
Date: Thu, 23 Apr 2020 18:28:28 +0800
Message-ID: <202004231808.KwkpucQN%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6675134385507973292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Al Viro <viro@zeniv.linux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c578ddb39e565139897124e74e5a43e56538cb33
commit: a37d01ead405e3aa14d72d284721fe46422b3b63 x86: switch save_v86_state=
() to unsafe_put_user()
date:   5 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 5 weeks ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> arch/x86/kernel/vm86_32.c:156:1: warning: Label 'Efault_end' is not used=
. [unusedLabel]
   Efault_end:
   ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Da37d01ead405e3aa14d72d284721fe46422b3b63
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout a37d01ead405e3aa14d72d284721fe46422b3b63
vim +/Efault_end +156 arch/x86/kernel/vm86_32.c

^1da177e4c3f41 arch/i386/kernel/vm86.c   Linus Torvalds      2005-04-16   9=
5  =

5ed92a8ab71f88 arch/x86/kernel/vm86_32.c Brian Gerst         2015-07-29   9=
6  void save_v86_state(struct kernel_vm86_regs *regs, int retval)
^1da177e4c3f41 arch/i386/kernel/vm86.c   Linus Torvalds      2005-04-16   9=
7  {
ed0b2edb61ba4e arch/x86/kernel/vm86_32.c Brian Gerst         2015-07-19   9=
8  	struct task_struct *tsk =3D current;
ed0b2edb61ba4e arch/x86/kernel/vm86_32.c Brian Gerst         2015-07-19   9=
9  	struct vm86plus_struct __user *user;
9fda6a0681e070 arch/x86/kernel/vm86_32.c Brian Gerst         2015-07-29  10=
0  	struct vm86 *vm86 =3D current->thread.vm86;
^1da177e4c3f41 arch/i386/kernel/vm86.c   Linus Torvalds      2005-04-16  10=
1  =

^1da177e4c3f41 arch/i386/kernel/vm86.c   Linus Torvalds      2005-04-16  10=
2  	/*
^1da177e4c3f41 arch/i386/kernel/vm86.c   Linus Torvalds      2005-04-16  10=
3  	 * This gets called from entry.S with interrupts disabled, but
^1da177e4c3f41 arch/i386/kernel/vm86.c   Linus Torvalds      2005-04-16  10=
4  	 * from process context. Enable interrupts here, before trying
^1da177e4c3f41 arch/i386/kernel/vm86.c   Linus Torvalds      2005-04-16  10=
5  	 * to access user space.
^1da177e4c3f41 arch/i386/kernel/vm86.c   Linus Torvalds      2005-04-16  10=
6  	 */
^1da177e4c3f41 arch/i386/kernel/vm86.c   Linus Torvalds      2005-04-16  10=
7  	local_irq_enable();
^1da177e4c3f41 arch/i386/kernel/vm86.c   Linus Torvalds      2005-04-16  10=
8  =

1342635638cba9 arch/x86/kernel/vm86_32.c Brian Gerst         2015-07-29  10=
9  	if (!vm86 || !vm86->user_vm86) {
1342635638cba9 arch/x86/kernel/vm86_32.c Brian Gerst         2015-07-29  11=
0  		pr_alert("no user_vm86: BAD\n");
^1da177e4c3f41 arch/i386/kernel/vm86.c   Linus Torvalds      2005-04-16  11=
1  		do_exit(SIGSEGV);
^1da177e4c3f41 arch/i386/kernel/vm86.c   Linus Torvalds      2005-04-16  11=
2  	}
decd275e62d5ee arch/x86/kernel/vm86_32.c Brian Gerst         2015-07-29  11=
3  	set_flags(regs->pt.flags, VEFLAGS, X86_EFLAGS_VIF | vm86->veflags_mask);
1342635638cba9 arch/x86/kernel/vm86_32.c Brian Gerst         2015-07-29  11=
4  	user =3D vm86->user_vm86;
ed0b2edb61ba4e arch/x86/kernel/vm86_32.c Brian Gerst         2015-07-19  11=
5  =

a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  11=
6  	if (!user_access_begin(user, vm86->vm86plus.is_vm86pus ?
ed0b2edb61ba4e arch/x86/kernel/vm86_32.c Brian Gerst         2015-07-19  11=
7  		       sizeof(struct vm86plus_struct) :
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  11=
8  		       sizeof(struct vm86_struct)))
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  11=
9  		goto Efault;
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  12=
0  =

a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  12=
1  	unsafe_put_user(regs->pt.bx, &user->regs.ebx, Efault_end);
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  12=
2  	unsafe_put_user(regs->pt.cx, &user->regs.ecx, Efault_end);
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  12=
3  	unsafe_put_user(regs->pt.dx, &user->regs.edx, Efault_end);
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  12=
4  	unsafe_put_user(regs->pt.si, &user->regs.esi, Efault_end);
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  12=
5  	unsafe_put_user(regs->pt.di, &user->regs.edi, Efault_end);
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  12=
6  	unsafe_put_user(regs->pt.bp, &user->regs.ebp, Efault_end);
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  12=
7  	unsafe_put_user(regs->pt.ax, &user->regs.eax, Efault_end);
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  12=
8  	unsafe_put_user(regs->pt.ip, &user->regs.eip, Efault_end);
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  12=
9  	unsafe_put_user(regs->pt.cs, &user->regs.cs, Efault_end);
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  13=
0  	unsafe_put_user(regs->pt.flags, &user->regs.eflags, Efault_end);
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  13=
1  	unsafe_put_user(regs->pt.sp, &user->regs.esp, Efault_end);
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  13=
2  	unsafe_put_user(regs->pt.ss, &user->regs.ss, Efault_end);
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  13=
3  	unsafe_put_user(regs->es, &user->regs.es, Efault_end);
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  13=
4  	unsafe_put_user(regs->ds, &user->regs.ds, Efault_end);
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  13=
5  	unsafe_put_user(regs->fs, &user->regs.fs, Efault_end);
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  13=
6  	unsafe_put_user(regs->gs, &user->regs.gs, Efault_end);
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  13=
7  	unsafe_put_user(vm86->screen_bitmap, &user->screen_bitmap, Efault_end);
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  13=
8  =

a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  13=
9  	user_access_end();
^1da177e4c3f41 arch/i386/kernel/vm86.c   Linus Torvalds      2005-04-16  14=
0  =

da51da189a24bb arch/x86/kernel/vm86_32.c Andy Lutomirski     2017-11-02  14=
1  	preempt_disable();
9fda6a0681e070 arch/x86/kernel/vm86_32.c Brian Gerst         2015-07-29  14=
2  	tsk->thread.sp0 =3D vm86->saved_sp0;
ed0b2edb61ba4e arch/x86/kernel/vm86_32.c Brian Gerst         2015-07-19  14=
3  	tsk->thread.sysenter_cs =3D __KERNEL_CS;
252e1a0526304f arch/x86/kernel/vm86_32.c Joerg Roedel        2018-07-18  14=
4  	update_task_stack(tsk);
bd7dc5a6afac71 arch/x86/kernel/vm86_32.c Andy Lutomirski     2017-11-02  14=
5  	refresh_sysenter_cs(&tsk->thread);
9fda6a0681e070 arch/x86/kernel/vm86_32.c Brian Gerst         2015-07-29  14=
6  	vm86->saved_sp0 =3D 0;
da51da189a24bb arch/x86/kernel/vm86_32.c Andy Lutomirski     2017-11-02  14=
7  	preempt_enable();
^1da177e4c3f41 arch/i386/kernel/vm86.c   Linus Torvalds      2005-04-16  14=
8  =

5ed92a8ab71f88 arch/x86/kernel/vm86_32.c Brian Gerst         2015-07-29  14=
9  	memcpy(&regs->pt, &vm86->regs32, sizeof(struct pt_regs));
49d26b6eaa8e97 arch/i386/kernel/vm86.c   Jeremy Fitzhardinge 2006-12-07  15=
0  =

5ed92a8ab71f88 arch/x86/kernel/vm86_32.c Brian Gerst         2015-07-29  15=
1  	lazy_load_gs(vm86->regs32.gs);
49d26b6eaa8e97 arch/i386/kernel/vm86.c   Jeremy Fitzhardinge 2006-12-07  15=
2  =

5ed92a8ab71f88 arch/x86/kernel/vm86_32.c Brian Gerst         2015-07-29  15=
3  	regs->pt.ax =3D retval;
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  15=
4  	return;
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  15=
5  =

a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15 @15=
6  Efault_end:
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  15=
7  	user_access_end();
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  15=
8  Efault:
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  15=
9  	pr_alert("could not access userspace vm86 info\n");
a37d01ead405e3 arch/x86/kernel/vm86_32.c Al Viro             2020-02-15  16=
0  	do_exit(SIGSEGV);
^1da177e4c3f41 arch/i386/kernel/vm86.c   Linus Torvalds      2005-04-16  16=
1  }
^1da177e4c3f41 arch/i386/kernel/vm86.c   Linus Torvalds      2005-04-16  16=
2  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6675134385507973292==--

