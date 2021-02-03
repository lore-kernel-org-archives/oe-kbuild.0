Content-Type: multipart/mixed; boundary="===============4017057739553549820=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/ia64/mm/discontig.c:278:2: warning: Assignment of function parameter has no effect outside the function.
Date: Wed, 03 Feb 2021 14:04:24 +0800
Message-ID: <202102031403.lgJTonLj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4017057739553549820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>

Hi Masahiro,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3aaf0a27ffc29b19a62314edd684b9bc6346f9a8
commit: f566e1fbadb686e28f1c307e356114b2865ef588 kbuild: make multiple dire=
ctory targets work
date:   12 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 12 months ago
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/ia64/mm/discontig.c:278:2: warning: Assignment of function paramete=
r has no effect outside the function. [uselessAssignmentArg]
    pernode +=3D L1_CACHE_ALIGN(sizeof(pg_data_t));
    ^
>> arch/ia64/kernel/mca.c:918:25: warning: Same expression on both sides of=
 '-'. [duplicateExpression]
    copy_reg(&ms->pmsa_gr[1-1], ms->pmsa_nat_bits, &regs->r1, nat);
                           ^
   arch/ia64/kernel/mca.c:933:19: warning: Same expression on both sides of=
 '-'. [duplicateExpression]
    copy_reg(&bank[16-16], ms->pmsa_nat_bits, &regs->r16, nat);
                     ^

vim +278 arch/ia64/mm/discontig.c

52594762a39dfb Tejun Heo      2009-10-02  252  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  253  /**
564601a5d12f93 bob.picco      2005-06-30  254   * fill_pernode - initialize=
 pernode data.
564601a5d12f93 bob.picco      2005-06-30  255   * @node: the node id.
564601a5d12f93 bob.picco      2005-06-30  256   * @pernode: physical addres=
s of pernode data
564601a5d12f93 bob.picco      2005-06-30  257   * @pernodesize: size of the=
 pernode data
^1da177e4c3f41 Linus Torvalds 2005-04-16  258   */
564601a5d12f93 bob.picco      2005-06-30  259  static void __init fill_pern=
ode(int node, unsigned long pernode,
564601a5d12f93 bob.picco      2005-06-30  260  	unsigned long pernodesize)
^1da177e4c3f41 Linus Torvalds 2005-04-16  261  {
564601a5d12f93 bob.picco      2005-06-30  262  	void *cpu_data;
8d7e35174d02ce Tony Luck      2005-07-06  263  	int cpus =3D early_nr_cpus_=
node(node);
^1da177e4c3f41 Linus Torvalds 2005-04-16  264  =

564601a5d12f93 bob.picco      2005-06-30  265  	mem_data[node].pernode_addr=
 =3D pernode;
564601a5d12f93 bob.picco      2005-06-30  266  	mem_data[node].pernode_size=
 =3D pernodesize;
564601a5d12f93 bob.picco      2005-06-30  267  	memset(__va(pernode), 0, pe=
rnodesize);
^1da177e4c3f41 Linus Torvalds 2005-04-16  268  =

564601a5d12f93 bob.picco      2005-06-30  269  	cpu_data =3D (void *)pernod=
e;
564601a5d12f93 bob.picco      2005-06-30  270  	pernode +=3D PERCPU_PAGE_SI=
ZE * cpus;
564601a5d12f93 bob.picco      2005-06-30  271  	pernode +=3D node * L1_CACH=
E_BYTES;
564601a5d12f93 bob.picco      2005-06-30  272  =

ae5a2c1c9b2bc3 Yasunori Goto  2006-06-27  273  	pgdat_list[node] =3D __va(p=
ernode);
564601a5d12f93 bob.picco      2005-06-30  274  	pernode +=3D L1_CACHE_ALIGN=
(sizeof(pg_data_t));
564601a5d12f93 bob.picco      2005-06-30  275  =

564601a5d12f93 bob.picco      2005-06-30  276  	mem_data[node].node_data =
=3D __va(pernode);
564601a5d12f93 bob.picco      2005-06-30  277  	pernode +=3D L1_CACHE_ALIGN=
(sizeof(struct ia64_node_data));
564601a5d12f93 bob.picco      2005-06-30 @278  	pernode +=3D L1_CACHE_ALIGN=
(sizeof(pg_data_t));
564601a5d12f93 bob.picco      2005-06-30  279  =

8d7e35174d02ce Tony Luck      2005-07-06  280  	cpu_data =3D per_cpu_node_s=
etup(cpu_data, node);
^1da177e4c3f41 Linus Torvalds 2005-04-16  281  =

564601a5d12f93 bob.picco      2005-06-30  282  	return;
564601a5d12f93 bob.picco      2005-06-30  283  }
8d7e35174d02ce Tony Luck      2005-07-06  284  =


:::::: The code at line 278 was first introduced by commit
:::::: 564601a5d12f93fdde04c6bc5b097b95e7752a46 [IA64] memory-less-nodes re=
post

:::::: TO: bob.picco <bob.picco@hp.com>
:::::: CC: Tony Luck <tony.luck@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4017057739553549820==--

