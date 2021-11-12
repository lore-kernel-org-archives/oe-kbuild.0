Content-Type: multipart/mixed; boundary="===============2690267800407337104=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm64/kvm/sys_regs.c:2786:23: warning: Uninitialized variable: clidr [uninitvar]
Date: Sat, 13 Nov 2021 06:27:55 +0800
Message-ID: <202111130641.EbnrMrab-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2690267800407337104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5833291ab6de9c3e2374336b51c814e515e8f3a5
commit: 63b3f96e1a989846a5a521d4fbef4bc86406929d kvm: Select SCHED_INFO ins=
tead of TASK_DELAY_ACCT
date:   6 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 6 months ago
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm64/kvm/sys_regs.c:2786:23: warning: Uninitialized variable: clid=
r [uninitvar]
    get_clidr_el1(NULL, &clidr); /* Ugly... */
                         ^
>> arch/arm64/kvm/sys_regs.c:2787:17: warning: Uninitialized struct member:=
 clidr.val [uninitStructMember]
    cache_levels =3D clidr.val;
                   ^

vim +2786 arch/arm64/kvm/sys_regs.c

7c8c5e6a9101ea Marc Zyngier 2012-12-10  2758  =

7c8c5e6a9101ea Marc Zyngier 2012-12-10  2759  void kvm_sys_reg_table_init(v=
oid)
7c8c5e6a9101ea Marc Zyngier 2012-12-10  2760  {
7c8c5e6a9101ea Marc Zyngier 2012-12-10  2761  	unsigned int i;
7c8c5e6a9101ea Marc Zyngier 2012-12-10  2762  	struct sys_reg_desc clidr;
7c8c5e6a9101ea Marc Zyngier 2012-12-10  2763  =

7c8c5e6a9101ea Marc Zyngier 2012-12-10  2764  	/* Make sure tables are uniq=
ue and in order. */
bb44a8dbea259b Marc Zyngier 2020-01-27  2765  	BUG_ON(check_sysreg_table(sy=
s_reg_descs, ARRAY_SIZE(sys_reg_descs), false));
bb44a8dbea259b Marc Zyngier 2020-01-27  2766  	BUG_ON(check_sysreg_table(cp=
14_regs, ARRAY_SIZE(cp14_regs), true));
bb44a8dbea259b Marc Zyngier 2020-01-27  2767  	BUG_ON(check_sysreg_table(cp=
14_64_regs, ARRAY_SIZE(cp14_64_regs), true));
bb44a8dbea259b Marc Zyngier 2020-01-27  2768  	BUG_ON(check_sysreg_table(cp=
15_regs, ARRAY_SIZE(cp15_regs), true));
bb44a8dbea259b Marc Zyngier 2020-01-27  2769  	BUG_ON(check_sysreg_table(cp=
15_64_regs, ARRAY_SIZE(cp15_64_regs), true));
bb44a8dbea259b Marc Zyngier 2020-01-27  2770  	BUG_ON(check_sysreg_table(in=
variant_sys_regs, ARRAY_SIZE(invariant_sys_regs), false));
7c8c5e6a9101ea Marc Zyngier 2012-12-10  2771  =

7c8c5e6a9101ea Marc Zyngier 2012-12-10  2772  	/* We abuse the reset functi=
on to overwrite the table itself. */
7c8c5e6a9101ea Marc Zyngier 2012-12-10  2773  	for (i =3D 0; i < ARRAY_SIZE=
(invariant_sys_regs); i++)
7c8c5e6a9101ea Marc Zyngier 2012-12-10  2774  		invariant_sys_regs[i].reset=
(NULL, &invariant_sys_regs[i]);
7c8c5e6a9101ea Marc Zyngier 2012-12-10  2775  =

7c8c5e6a9101ea Marc Zyngier 2012-12-10  2776  	/*
7c8c5e6a9101ea Marc Zyngier 2012-12-10  2777  	 * CLIDR format is awkward, =
so clean it up.  See ARM B4.1.20:
7c8c5e6a9101ea Marc Zyngier 2012-12-10  2778  	 *
7c8c5e6a9101ea Marc Zyngier 2012-12-10  2779  	 *   If software reads the C=
ache Type fields from Ctype1
7c8c5e6a9101ea Marc Zyngier 2012-12-10  2780  	 *   upwards, once it has se=
en a value of 0b000, no caches
7c8c5e6a9101ea Marc Zyngier 2012-12-10  2781  	 *   exist at further-out le=
vels of the hierarchy. So, for
7c8c5e6a9101ea Marc Zyngier 2012-12-10  2782  	 *   example, if Ctype3 is t=
he first Cache Type field with a
7c8c5e6a9101ea Marc Zyngier 2012-12-10  2783  	 *   value of 0b000, the val=
ues of Ctype4 to Ctype7 must be
7c8c5e6a9101ea Marc Zyngier 2012-12-10  2784  	 *   ignored.
7c8c5e6a9101ea Marc Zyngier 2012-12-10  2785  	 */
7c8c5e6a9101ea Marc Zyngier 2012-12-10 @2786  	get_clidr_el1(NULL, &clidr);=
 /* Ugly... */
7c8c5e6a9101ea Marc Zyngier 2012-12-10 @2787  	cache_levels =3D clidr.val;

:::::: The code@line 2786 was first introduced by commit
:::::: 7c8c5e6a9101ea57a1c2c9faff0917e79251a21e arm64: KVM: system register=
 handling

:::::: TO: Marc Zyngier <marc.zyngier@arm.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2690267800407337104==--

