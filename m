Content-Type: multipart/mixed; boundary="===============2529545930200261107=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mingo-tip:sched/headers 1894/2574] arch/x86/entry/vsyscall/vsyscall_64.c:323:24: warning: no previous prototype for 'get_gate_vma'
Date: Mon, 21 Feb 2022 20:05:23 +0800
Message-ID: <202202212034.5GVd81Lx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2529545930200261107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ingo Molnar <mingo@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/h=
eaders
head:   39e8a0edc8fae20758051dadf7846849edc18b88
commit: 1f12f6a0d14f4f4ed1ec45d029e4c3fda626df57 [1894/2574] headers/deps: =
mm: Optimize <linux/mm_api.h>, remove the <linux/mm_api_gate_area.h> header
:::::: branch date: 20 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-s022-20220221 (https://download.01.org/0day-ci/ar=
chive/20220221/202202212034.5GVd81Lx-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/com=
mit/?id=3D1f12f6a0d14f4f4ed1ec45d029e4c3fda626df57
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/=
git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 1f12f6a0d14f4f4ed1ec45d029e4c3fda626df57
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash arch/x86/entry/vsyscall/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/entry/vsyscall/vsyscall_64.c:323:24: warning: no previous proto=
type for 'get_gate_vma' [-Wmissing-prototypes]
     323 | struct vm_area_struct *get_gate_vma(struct mm_struct *mm)
         |                        ^~~~~~~~~~~~
>> arch/x86/entry/vsyscall/vsyscall_64.c:334:5: warning: no previous protot=
ype for 'in_gate_area' [-Wmissing-prototypes]
     334 | int in_gate_area(struct mm_struct *mm, unsigned long addr)
         |     ^~~~~~~~~~~~
>> arch/x86/entry/vsyscall/vsyscall_64.c:349:5: warning: no previous protot=
ype for 'in_gate_area_no_mm' [-Wmissing-prototypes]
     349 | int in_gate_area_no_mm(unsigned long addr)
         |     ^~~~~~~~~~~~~~~~~~


vim +/get_gate_vma +323 arch/x86/entry/vsyscall/vsyscall_64.c

b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  322  =

b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23 @323  struct vm_area_struct *get_gate_vma(struct mm_struct *mm)
b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  324  {
c338867d0e4224 arch/x86/entry/vsyscall/vsyscall_64.c Brian Gerst           =
  2015-06-22  325  #ifdef CONFIG_COMPAT
ff170cd0595398 arch/x86/entry/vsyscall/vsyscall_64.c Gabriel Krisman Bertaz=
i 2020-10-03  326  	if (!mm || !(mm->context.flags & MM_CONTEXT_HAS_VSYSCAL=
L))
b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  327  		return NULL;
b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  328  #endif
87983c66bc02c9 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-10-29  329  	if (vsyscall_mode =3D=3D NONE)
87983c66bc02c9 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-10-29  330  		return NULL;
b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  331  	return &gate_vma;
b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  332  }
b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  333  =

b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23 @334  int in_gate_area(struct mm_struct *mm, unsigned long add=
r)
b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  335  {
b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  336  	struct vm_area_struct *vma =3D get_gate_vma(mm);
b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  337  =

b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  338  	if (!vma)
b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  339  		return 0;
b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  340  =

b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  341  	return (addr >=3D vma->vm_start) && (addr < vma->vm_end=
);
b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  342  }
b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  343  =

b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  344  /*
b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  345   * Use this when you have no reliable mm, typically from=
 interrupt
b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  346   * context. It is less reliable than using a task's mm a=
nd may give
b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  347   * false positives.
b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  348   */
b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23 @349  int in_gate_area_no_mm(unsigned long addr)
b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  350  {
87983c66bc02c9 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-10-29  351  	return vsyscall_mode !=3D NONE && (addr & PAGE_MASK) =
=3D=3D VSYSCALL_ADDR;
b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  352  }
b93590901a01a6 arch/x86/kernel/vsyscall_64.c         Andy Lutomirski       =
  2014-09-23  353  =


:::::: The code at line 323 was first introduced by commit
:::::: b93590901a01a6d036b3b7c856bcc5724fdb9911 x86_64/vsyscall: Move all o=
f the gate_area code to vsyscall_64.c

:::::: TO: Andy Lutomirski <luto@amacapital.net>
:::::: CC: Ingo Molnar <mingo@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2529545930200261107==--

