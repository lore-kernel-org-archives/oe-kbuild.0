Content-Type: multipart/mixed; boundary="===============3329846394837591558=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/mips/kernel/traps.c:128 show_raw_backtrace() error: uninitialized symbol 'addr'.
Date: Fri, 14 Jan 2022 10:08:07 +0800
Message-ID: <202201140946.9Nf2xrVz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3329846394837591558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fb3b0673b7d5b477ed104949450cd511337ba3c6
commit: 45deb5faeb9e02951361ceba5ffee721745661c3 MIPS: uaccess: Remove get_=
fs/set_fs call sites
date:   9 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 9 months ago
config: mips-randconfig-m031-20220113 (https://download.01.org/0day-ci/arch=
ive/20220114/202201140946.9Nf2xrVz-lkp(a)intel.com/config)
compiler: mips64el-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/mips/kernel/traps.c:128 show_raw_backtrace() error: uninitialized symb=
ol 'addr'.
arch/mips/kernel/traps.c:195 show_stacktrace() error: uninitialized symbol =
'stackdata'.
arch/mips/kernel/traps.c:240 show_code() error: uninitialized symbol 'insn1=
6'.
arch/mips/kernel/traps.c:247 show_code() error: uninitialized symbol 'insn3=
2'.
arch/mips/kernel/traps.c:1054 do_bp() error: uninitialized symbol 'opcode'.
arch/mips/kernel/traps.c:1132 do_tr() error: uninitialized symbol 'opcode'.

Old smatch warnings:
arch/mips/kernel/traps.c:1996 nmi_exception_handler() warn: ignoring unreac=
hable code.

vim +/addr +128 arch/mips/kernel/traps.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  112  =

45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  113  static void show_raw_ba=
cktrace(unsigned long reg29, const char *loglvl,
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  114  			       bool user)
e889d78fd5775d Atsushi Nemoto      2006-07-25  115  {
39b8d5254246ac Ralf Baechle        2008-04-28  116  	unsigned long *sp =3D =
(unsigned long *)(reg29 & ~3);
e889d78fd5775d Atsushi Nemoto      2006-07-25  117  	unsigned long addr;
e889d78fd5775d Atsushi Nemoto      2006-07-25  118  =

96f0458a96892d Dmitry Safonov      2020-06-08  119  	printk("%sCall Trace:"=
, loglvl);
e889d78fd5775d Atsushi Nemoto      2006-07-25  120  #ifdef CONFIG_KALLSYMS
96f0458a96892d Dmitry Safonov      2020-06-08  121  	printk("%s\n", loglvl);
e889d78fd5775d Atsushi Nemoto      2006-07-25  122  #endif
87151ae39bf555 Franck Bui-Huu      2006-08-03  123  	while (!kstack_end(sp)=
) {
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  124  		if (__get_addr(&addr,=
 sp++, user)) {
96f0458a96892d Dmitry Safonov      2020-06-08  125  			printk("%s (Bad stac=
k address)", loglvl);
10220c884444a1 Thomas Bogendoerfer 2008-05-12  126  			break;
10220c884444a1 Thomas Bogendoerfer 2008-05-12  127  		}
87151ae39bf555 Franck Bui-Huu      2006-08-03 @128  		if (__kernel_text_add=
ress(addr))
96f0458a96892d Dmitry Safonov      2020-06-08  129  			print_ip_sym(loglvl,=
 addr);
e889d78fd5775d Atsushi Nemoto      2006-07-25  130  	}
96f0458a96892d Dmitry Safonov      2020-06-08  131  	printk("%s\n", loglvl);
e889d78fd5775d Atsushi Nemoto      2006-07-25  132  }
e889d78fd5775d Atsushi Nemoto      2006-07-25  133  =

f66686f70a2a61 Atsushi Nemoto      2006-07-29  134  #ifdef CONFIG_KALLSYMS
1df0f0ff7e56f6 Atsushi Nemoto      2006-09-26  135  int raw_show_trace;
f66686f70a2a61 Atsushi Nemoto      2006-07-29  136  static int __init set_r=
aw_show_trace(char *str)
f66686f70a2a61 Atsushi Nemoto      2006-07-29  137  {
f66686f70a2a61 Atsushi Nemoto      2006-07-29  138  	raw_show_trace =3D 1;
f66686f70a2a61 Atsushi Nemoto      2006-07-29  139  	return 1;
f66686f70a2a61 Atsushi Nemoto      2006-07-29  140  }
f66686f70a2a61 Atsushi Nemoto      2006-07-29  141  __setup("raw_show_trace=
", set_raw_show_trace);
1df0f0ff7e56f6 Atsushi Nemoto      2006-09-26  142  #endif
4d157d5eac29d7 Franck Bui-Huu      2006-08-03  143  =

96f0458a96892d Dmitry Safonov      2020-06-08  144  static void show_backtr=
ace(struct task_struct *task, const struct pt_regs *regs,
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  145  			   const char *loglv=
l, bool user)
f66686f70a2a61 Atsushi Nemoto      2006-07-29  146  {
4d157d5eac29d7 Franck Bui-Huu      2006-08-03  147  	unsigned long sp =3D r=
egs->regs[29];
4d157d5eac29d7 Franck Bui-Huu      2006-08-03  148  	unsigned long ra =3D r=
egs->regs[31];
f66686f70a2a61 Atsushi Nemoto      2006-07-29  149  	unsigned long pc =3D r=
egs->cp0_epc;
f66686f70a2a61 Atsushi Nemoto      2006-07-29  150  =

e909be825212da Vincent Wen         2012-07-19  151  	if (!task)
e909be825212da Vincent Wen         2012-07-19  152  		task =3D current;
e909be825212da Vincent Wen         2012-07-19  153  =

81a76d7119f63c James Hogan         2015-12-04  154  	if (raw_show_trace || =
user_mode(regs) || !__kernel_text_address(pc)) {
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  155  		show_raw_backtrace(sp=
, loglvl, user);
f66686f70a2a61 Atsushi Nemoto      2006-07-29  156  		return;
f66686f70a2a61 Atsushi Nemoto      2006-07-29  157  	}
96f0458a96892d Dmitry Safonov      2020-06-08  158  	printk("%sCall Trace:\=
n", loglvl);
4d157d5eac29d7 Franck Bui-Huu      2006-08-03  159  	do {
96f0458a96892d Dmitry Safonov      2020-06-08  160  		print_ip_sym(loglvl, =
pc);
1924600cdb3143 Atsushi Nemoto      2006-09-29  161  		pc =3D unwind_stack(t=
ask, &sp, pc, &ra);
4d157d5eac29d7 Franck Bui-Huu      2006-08-03  162  	} while (pc);
bcf084de5d429c Matt Redfearn       2016-10-19  163  	pr_cont("\n");
f66686f70a2a61 Atsushi Nemoto      2006-07-29  164  }
f66686f70a2a61 Atsushi Nemoto      2006-07-29  165  =

^1da177e4c3f41 Linus Torvalds      2005-04-16  166  /*
^1da177e4c3f41 Linus Torvalds      2005-04-16  167   * This routine abuses =
get_user()/put_user() to reference pointers
^1da177e4c3f41 Linus Torvalds      2005-04-16  168   * with at least a bit =
of error checking ...
^1da177e4c3f41 Linus Torvalds      2005-04-16  169   */
eae23f2c2ac1e4 Ralf Baechle        2007-10-14  170  static void show_stackt=
race(struct task_struct *task,
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  171  	const struct pt_regs *=
regs, const char *loglvl, bool user)
^1da177e4c3f41 Linus Torvalds      2005-04-16  172  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  173  	const int field =3D 2 =
* sizeof(unsigned long);
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  174  	unsigned long stackdat=
a;
^1da177e4c3f41 Linus Torvalds      2005-04-16  175  	int i;
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  176  	unsigned long *sp =3D =
(unsigned long *)regs->regs[29];
^1da177e4c3f41 Linus Torvalds      2005-04-16  177  =

96f0458a96892d Dmitry Safonov      2020-06-08  178  	printk("%sStack :", lo=
glvl);
^1da177e4c3f41 Linus Torvalds      2005-04-16  179  	i =3D 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  180  	while ((unsigned long)=
 sp & (PAGE_SIZE - 1)) {
fe4e09e7012132 Matt Redfearn       2016-10-19  181  		if (i && ((i % (64 / =
field)) =3D=3D 0)) {
fe4e09e7012132 Matt Redfearn       2016-10-19  182  			pr_cont("\n");
96f0458a96892d Dmitry Safonov      2020-06-08  183  			printk("%s       ", =
loglvl);
fe4e09e7012132 Matt Redfearn       2016-10-19  184  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  185  		if (i > 39) {
fe4e09e7012132 Matt Redfearn       2016-10-19  186  			pr_cont(" ...");
^1da177e4c3f41 Linus Torvalds      2005-04-16  187  			break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  188  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  189  =

45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  190  		if (__get_addr(&stack=
data, sp++, user)) {
fe4e09e7012132 Matt Redfearn       2016-10-19  191  			pr_cont(" (Bad stack=
 address)");
^1da177e4c3f41 Linus Torvalds      2005-04-16  192  			break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  193  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  194  =

fe4e09e7012132 Matt Redfearn       2016-10-19 @195  		pr_cont(" %0*lx", fie=
ld, stackdata);
^1da177e4c3f41 Linus Torvalds      2005-04-16  196  		i++;
^1da177e4c3f41 Linus Torvalds      2005-04-16  197  	}
fe4e09e7012132 Matt Redfearn       2016-10-19  198  	pr_cont("\n");
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  199  	show_backtrace(task, r=
egs, loglvl, user);
f66686f70a2a61 Atsushi Nemoto      2006-07-29  200  }
f66686f70a2a61 Atsushi Nemoto      2006-07-29  201  =

9cb8f069deeed7 Dmitry Safonov      2020-06-08  202  void show_stack(struct =
task_struct *task, unsigned long *sp, const char *loglvl)
f66686f70a2a61 Atsushi Nemoto      2006-07-29  203  {
f66686f70a2a61 Atsushi Nemoto      2006-07-29  204  	struct pt_regs regs;
85423636337099 James Hogan         2017-06-29  205  =

85423636337099 James Hogan         2017-06-29  206  	regs.cp0_status =3D KS=
U_KERNEL;
f66686f70a2a61 Atsushi Nemoto      2006-07-29  207  	if (sp) {
f66686f70a2a61 Atsushi Nemoto      2006-07-29  208  		regs.regs[29] =3D (un=
signed long)sp;
f66686f70a2a61 Atsushi Nemoto      2006-07-29  209  		regs.regs[31] =3D 0;
f66686f70a2a61 Atsushi Nemoto      2006-07-29  210  		regs.cp0_epc =3D 0;
f66686f70a2a61 Atsushi Nemoto      2006-07-29  211  	} else {
f66686f70a2a61 Atsushi Nemoto      2006-07-29  212  		if (task && task !=3D=
 current) {
f66686f70a2a61 Atsushi Nemoto      2006-07-29  213  			regs.regs[29] =3D ta=
sk->thread.reg29;
f66686f70a2a61 Atsushi Nemoto      2006-07-29  214  			regs.regs[31] =3D 0;
f66686f70a2a61 Atsushi Nemoto      2006-07-29  215  			regs.cp0_epc =3D tas=
k->thread.reg31;
f66686f70a2a61 Atsushi Nemoto      2006-07-29  216  		} else {
f66686f70a2a61 Atsushi Nemoto      2006-07-29  217  			prepare_frametrace(&=
regs);
f66686f70a2a61 Atsushi Nemoto      2006-07-29  218  		}
f66686f70a2a61 Atsushi Nemoto      2006-07-29  219  	}
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  220  	show_stacktrace(task, =
&regs, loglvl, false);
^1da177e4c3f41 Linus Torvalds      2005-04-16  221  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  222  =

45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  223  static void show_code(v=
oid *pc, bool user)
^1da177e4c3f41 Linus Torvalds      2005-04-16  224  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  225  	long i;
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  226  	unsigned short *pc16 =
=3D NULL;
^1da177e4c3f41 Linus Torvalds      2005-04-16  227  =

41000c5819ee5a Matt Redfearn       2016-10-19  228  	printk("Code:");
^1da177e4c3f41 Linus Torvalds      2005-04-16  229  =

39b8d5254246ac Ralf Baechle        2008-04-28  230  	if ((unsigned long)pc =
& 1)
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  231  		pc16 =3D (u16 *)((uns=
igned long)pc & ~1);
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  232  =

^1da177e4c3f41 Linus Torvalds      2005-04-16  233  	for(i =3D -3 ; i < 6 ;=
 i++) {
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  234  		if (pc16) {
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  235  			u16 insn16;
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  236  =

45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  237  			if (__get_inst16(&in=
sn16, pc16 + i, user))
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  238  				goto bad_address;
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  239  =

45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01 @240  			pr_cont("%c%04x%c", =
(i?' ':'<'), insn16, (i?' ':'>'));
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  241  		} else {
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  242  			u32 insn32;
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  243  =

45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  244  			if (__get_inst32(&in=
sn32, (u32 *)pc + i, user))
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  245  				goto bad_address;
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  246  =

45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01 @247  			pr_cont("%c%08x%c", =
(i?' ':'<'), insn32, (i?' ':'>'));
^1da177e4c3f41 Linus Torvalds      2005-04-16  248  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  249  	}
41000c5819ee5a Matt Redfearn       2016-10-19  250  	pr_cont("\n");
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  251  	return;
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  252  =

45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  253  bad_address:
45deb5faeb9e02 Thomas Bogendoerfer 2021-04-01  254  	pr_cont(" (Bad address=
 in epc)\n\n");
^1da177e4c3f41 Linus Torvalds      2005-04-16  255  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  256  =


:::::: The code at line 128 was first introduced by commit
:::::: 87151ae39bf5556abe83d69af0be9580c32c501b [MIPS] Miscellaneous cleanu=
p in prologue analysis code

:::::: TO: Franck Bui-Huu <vagabon.xyz@gmail.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3329846394837591558==--

