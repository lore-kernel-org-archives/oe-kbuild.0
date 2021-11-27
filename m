Content-Type: multipart/mixed; boundary="===============1629706403976713555=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/powerpc/kernel/hw_breakpoint_constraints.c:142 wp_get_instr_detail() warn: bitwise AND condition is false here
Date: Sun, 28 Nov 2021 05:39:35 +0800
Message-ID: <202111280501.ZblF5Ko8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1629706403976713555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: a61ec782a754229b24aae2d6c2109510d6420ae6 powerpc/breakpoint: Cleanup
date:   5 weeks ago
:::::: branch date: 25 hours ago
:::::: commit date: 5 weeks ago
config: powerpc-randconfig-m031-20211101 (https://download.01.org/0day-ci/a=
rchive/20211128/202111280501.ZblF5Ko8-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/powerpc/kernel/hw_breakpoint_constraints.c:142 wp_get_instr_detail() w=
arn: bitwise AND condition is false here

vim +142 arch/powerpc/kernel/hw_breakpoint_constraints.c

edc8dd99b29e4d Ravi Bangoria    2020-09-02  129  =

edc8dd99b29e4d Ravi Bangoria    2020-09-02  130  void wp_get_instr_detail(s=
truct pt_regs *regs, struct ppc_inst *instr,
edc8dd99b29e4d Ravi Bangoria    2020-09-02  131  			 int *type, int *size, =
unsigned long *ea)
edc8dd99b29e4d Ravi Bangoria    2020-09-02  132  {
edc8dd99b29e4d Ravi Bangoria    2020-09-02  133  	struct instruction_op op;
edc8dd99b29e4d Ravi Bangoria    2020-09-02  134  =

bad956b8fe1a8b Christophe Leroy 2021-03-10  135  	if (__get_user_instr(*ins=
tr, (void __user *)regs->nip))
edc8dd99b29e4d Ravi Bangoria    2020-09-02  136  		return;
edc8dd99b29e4d Ravi Bangoria    2020-09-02  137  =

edc8dd99b29e4d Ravi Bangoria    2020-09-02  138  	analyse_instr(&op, regs, =
*instr);
edc8dd99b29e4d Ravi Bangoria    2020-09-02  139  	*type =3D GETTYPE(op.type=
);
edc8dd99b29e4d Ravi Bangoria    2020-09-02  140  	*ea =3D op.ea;
a61ec782a75422 Christophe Leroy 2021-09-22  141  =

edc8dd99b29e4d Ravi Bangoria    2020-09-02 @142  	if (!(regs->msr & MSR_64B=
IT))

:::::: The code at line 142 was first introduced by commit
:::::: edc8dd99b29e4d705c45e2a3a6c01b096ee056db powerpc/watchpoint: Move DA=
WR detection logic outside of hw_breakpoint.c

:::::: TO: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1629706403976713555==--

