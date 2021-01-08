Content-Type: multipart/mixed; boundary="===============0329423005410290357=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/mips/mm/fault.c:327 __do_page_fault() warn: inconsistent returns 'mm->mmap_lock'.
Date: Sat, 09 Jan 2021 02:22:54 +0800
Message-ID: <202101090244.SMJB8sDA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0329423005410290357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Michel Lespinasse <walken@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Vlastimil Babka <vbabka@suse.cz>
CC: Davidlohr Bueso <dbueso@suse.de>
CC: Daniel Jordan <daniel.m.jordan@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f5e6c330254ae691f6d7befe61c786eb5056007e
commit: da1c55f1b272f4bd54671d459b39ea7b54944ef9 mmap locking API: rename m=
map_sem to mmap_lock
date:   7 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 7 months ago
config: mips-randconfig-m031-20210108 (attached as .config)
compiler: mipsel-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/mips/mm/fault.c:327 __do_page_fault() warn: inconsistent returns 'mm->=
mmap_lock'.

vim +327 arch/mips/mm/fault.c

^1da177e4c3f415 Linus Torvalds     2005-04-16   89  =

^1da177e4c3f415 Linus Torvalds     2005-04-16   90  	/*
^1da177e4c3f415 Linus Torvalds     2005-04-16   91  	 * If we're in an inte=
rrupt or have no user
^1da177e4c3f415 Linus Torvalds     2005-04-16   92  	 * context, we must no=
t take the fault..
^1da177e4c3f415 Linus Torvalds     2005-04-16   93  	 */
70ffdb9393a7264 David Hildenbrand  2015-05-11   94  	if (faulthandler_disab=
led() || !mm)
^1da177e4c3f415 Linus Torvalds     2005-04-16   95  		goto bad_area_nosemap=
hore;
^1da177e4c3f415 Linus Torvalds     2005-04-16   96  =

759496ba6407c69 Johannes Weiner    2013-09-12   97  	if (user_mode(regs))
759496ba6407c69 Johannes Weiner    2013-09-12   98  		flags |=3D FAULT_FLAG=
_USER;
43ca4957a15a120 Kautuk Consul      2011-12-23   99  retry:
89154dd5313f774 Michel Lespinasse  2020-06-08  100  	mmap_read_lock(mm);
^1da177e4c3f415 Linus Torvalds     2005-04-16  101  	vma =3D find_vma(mm, a=
ddress);
^1da177e4c3f415 Linus Torvalds     2005-04-16  102  	if (!vma)
^1da177e4c3f415 Linus Torvalds     2005-04-16  103  		goto bad_area;
^1da177e4c3f415 Linus Torvalds     2005-04-16  104  	if (vma->vm_start <=3D=
 address)
^1da177e4c3f415 Linus Torvalds     2005-04-16  105  		goto good_area;
^1da177e4c3f415 Linus Torvalds     2005-04-16  106  	if (!(vma->vm_flags & =
VM_GROWSDOWN))
^1da177e4c3f415 Linus Torvalds     2005-04-16  107  		goto bad_area;
^1da177e4c3f415 Linus Torvalds     2005-04-16  108  	if (expand_stack(vma, =
address))
^1da177e4c3f415 Linus Torvalds     2005-04-16  109  		goto bad_area;
^1da177e4c3f415 Linus Torvalds     2005-04-16  110  /*
^1da177e4c3f415 Linus Torvalds     2005-04-16  111   * Ok, we have a good v=
m_area for this memory access, so
^1da177e4c3f415 Linus Torvalds     2005-04-16  112   * we can handle it..
^1da177e4c3f415 Linus Torvalds     2005-04-16  113   */
^1da177e4c3f415 Linus Torvalds     2005-04-16  114  good_area:
f43a54a0d9168de Eric W. Biederman  2018-04-15  115  	si_code =3D SEGV_ACCER=
R;
^1da177e4c3f415 Linus Torvalds     2005-04-16  116  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  117  	if (write) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  118  		if (!(vma->vm_flags &=
 VM_WRITE))
^1da177e4c3f415 Linus Torvalds     2005-04-16  119  			goto bad_area;
759496ba6407c69 Johannes Weiner    2013-09-12  120  		flags |=3D FAULT_FLAG=
_WRITE;
6dd9344cfc41bcc David Daney        2010-02-10  121  	} else {
05857c64ecf8972 Steven J. Hill     2012-09-13  122  		if (cpu_has_rixi) {
6dd9344cfc41bcc David Daney        2010-02-10  123  			if (address =3D=3D r=
egs->cp0_epc && !(vma->vm_flags & VM_EXEC)) {
6dd9344cfc41bcc David Daney        2010-02-10  124  #if 0
6dd9344cfc41bcc David Daney        2010-02-10  125  				pr_notice("Cpu%d[%s=
:%d:%0*lx:%ld:%0*lx] XI violation\n",
6dd9344cfc41bcc David Daney        2010-02-10  126  					  raw_smp_processo=
r_id(),
6dd9344cfc41bcc David Daney        2010-02-10  127  					  current->comm, c=
urrent->pid,
6dd9344cfc41bcc David Daney        2010-02-10  128  					  field, address, =
write,
6dd9344cfc41bcc David Daney        2010-02-10  129  					  field, regs->cp0=
_epc);
6dd9344cfc41bcc David Daney        2010-02-10  130  #endif
6dd9344cfc41bcc David Daney        2010-02-10  131  				goto bad_area;
6dd9344cfc41bcc David Daney        2010-02-10  132  			}
e070dab73523bcb Ralf Baechle       2015-07-23  133  			if (!(vma->vm_flags =
& VM_READ) &&
e070dab73523bcb Ralf Baechle       2015-07-23  134  			    exception_epc(re=
gs) !=3D address) {
6dd9344cfc41bcc David Daney        2010-02-10  135  #if 0
6dd9344cfc41bcc David Daney        2010-02-10  136  				pr_notice("Cpu%d[%s=
:%d:%0*lx:%ld:%0*lx] RI violation\n",
6dd9344cfc41bcc David Daney        2010-02-10  137  					  raw_smp_processo=
r_id(),
6dd9344cfc41bcc David Daney        2010-02-10  138  					  current->comm, c=
urrent->pid,
6dd9344cfc41bcc David Daney        2010-02-10  139  					  field, address, =
write,
6dd9344cfc41bcc David Daney        2010-02-10  140  					  field, regs->cp0=
_epc);
6dd9344cfc41bcc David Daney        2010-02-10  141  #endif
6dd9344cfc41bcc David Daney        2010-02-10  142  				goto bad_area;
6dd9344cfc41bcc David Daney        2010-02-10  143  			}
^1da177e4c3f415 Linus Torvalds     2005-04-16  144  		} else {
5093c5872be3a04 Anshuman Khandual  2020-04-06  145  			if (unlikely(!vma_is=
_accessible(vma)))
^1da177e4c3f415 Linus Torvalds     2005-04-16  146  				goto bad_area;
^1da177e4c3f415 Linus Torvalds     2005-04-16  147  		}
6dd9344cfc41bcc David Daney        2010-02-10  148  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  149  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  150  	/*
^1da177e4c3f415 Linus Torvalds     2005-04-16  151  	 * If for any reason a=
t all we couldn't handle the fault,
^1da177e4c3f415 Linus Torvalds     2005-04-16  152  	 * make sure we exit g=
racefully rather than endlessly redo
^1da177e4c3f415 Linus Torvalds     2005-04-16  153  	 * the fault.
^1da177e4c3f415 Linus Torvalds     2005-04-16  154  	 */
dcddffd41d3f1d3 Kirill A. Shutemov 2016-07-26  155  	fault =3D handle_mm_fa=
ult(vma, address, flags);
43ca4957a15a120 Kautuk Consul      2011-12-23  156  =

4ef873226ceb9c7 Peter Xu           2020-04-01  157  	if (fault_signal_pendi=
ng(fault, regs))
43ca4957a15a120 Kautuk Consul      2011-12-23  158  		return;
43ca4957a15a120 Kautuk Consul      2011-12-23  159  =

a8b0ca17b80e92f Peter Zijlstra     2011-06-27  160  	perf_sw_event(PERF_COU=
NT_SW_PAGE_FAULTS, 1, regs, address);
83c54070ee1a2d0 Nick Piggin        2007-07-19  161  	if (unlikely(fault & V=
M_FAULT_ERROR)) {
83c54070ee1a2d0 Nick Piggin        2007-07-19  162  		if (fault & VM_FAULT_=
OOM)
^1da177e4c3f415 Linus Torvalds     2005-04-16  163  			goto out_of_memory;
33692f27597fcab Linus Torvalds     2015-01-29  164  		else if (fault & VM_F=
AULT_SIGSEGV)
33692f27597fcab Linus Torvalds     2015-01-29  165  			goto bad_area;
83c54070ee1a2d0 Nick Piggin        2007-07-19  166  		else if (fault & VM_F=
AULT_SIGBUS)
83c54070ee1a2d0 Nick Piggin        2007-07-19  167  			goto do_sigbus;
^1da177e4c3f415 Linus Torvalds     2005-04-16  168  		BUG();
^1da177e4c3f415 Linus Torvalds     2005-04-16  169  	}
43ca4957a15a120 Kautuk Consul      2011-12-23  170  	if (flags & FAULT_FLAG=
_ALLOW_RETRY) {
7f788d2d5308581 Dengcheng Zhu      2010-10-12  171  		if (fault & VM_FAULT_=
MAJOR) {
43ca4957a15a120 Kautuk Consul      2011-12-23  172  			perf_sw_event(PERF_C=
OUNT_SW_PAGE_FAULTS_MAJ, 1,
43ca4957a15a120 Kautuk Consul      2011-12-23  173  						  regs, address);
83c54070ee1a2d0 Nick Piggin        2007-07-19  174  			tsk->maj_flt++;
7f788d2d5308581 Dengcheng Zhu      2010-10-12  175  		} else {
43ca4957a15a120 Kautuk Consul      2011-12-23  176  			perf_sw_event(PERF_C=
OUNT_SW_PAGE_FAULTS_MIN, 1,
43ca4957a15a120 Kautuk Consul      2011-12-23  177  						  regs, address);
83c54070ee1a2d0 Nick Piggin        2007-07-19  178  			tsk->min_flt++;
7f788d2d5308581 Dengcheng Zhu      2010-10-12  179  		}
43ca4957a15a120 Kautuk Consul      2011-12-23  180  		if (fault & VM_FAULT_=
RETRY) {
45cac65b0fcd287 Shaohua Li         2012-10-08  181  			flags |=3D FAULT_FLA=
G_TRIED;
43ca4957a15a120 Kautuk Consul      2011-12-23  182  =

43ca4957a15a120 Kautuk Consul      2011-12-23  183  			/*
43ca4957a15a120 Kautuk Consul      2011-12-23  184  			 * No need to up_rea=
d(&mm->mmap_sem) as we would
43ca4957a15a120 Kautuk Consul      2011-12-23  185  			 * have already rele=
ased it in __lock_page_or_retry
43ca4957a15a120 Kautuk Consul      2011-12-23  186  			 * in mm/filemap.c.
43ca4957a15a120 Kautuk Consul      2011-12-23  187  			 */
43ca4957a15a120 Kautuk Consul      2011-12-23  188  =

43ca4957a15a120 Kautuk Consul      2011-12-23  189  			goto retry;
43ca4957a15a120 Kautuk Consul      2011-12-23  190  		}
43ca4957a15a120 Kautuk Consul      2011-12-23  191  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  192  =

89154dd5313f774 Michel Lespinasse  2020-06-08  193  	mmap_read_unlock(mm);
^1da177e4c3f415 Linus Torvalds     2005-04-16  194  	return;
^1da177e4c3f415 Linus Torvalds     2005-04-16  195  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  196  /*
^1da177e4c3f415 Linus Torvalds     2005-04-16  197   * Something tried to a=
ccess memory that isn't in our memory map..
^1da177e4c3f415 Linus Torvalds     2005-04-16  198   * Fix it, but check if=
 it's kernel or user first..
^1da177e4c3f415 Linus Torvalds     2005-04-16  199   */
^1da177e4c3f415 Linus Torvalds     2005-04-16  200  bad_area:
89154dd5313f774 Michel Lespinasse  2020-06-08  201  	mmap_read_unlock(mm);
^1da177e4c3f415 Linus Torvalds     2005-04-16  202  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  203  bad_area_nosemaphore:
^1da177e4c3f415 Linus Torvalds     2005-04-16  204  	/* User mode accesses =
just cause a SIGSEGV */
^1da177e4c3f415 Linus Torvalds     2005-04-16  205  	if (user_mode(regs)) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  206  		tsk->thread.cp0_badva=
ddr =3D address;
^1da177e4c3f415 Linus Torvalds     2005-04-16  207  		tsk->thread.error_cod=
e =3D write;
d79d853df126553 Markos Chandras    2015-01-21  208  		if (show_unhandled_si=
gnals &&
d79d853df126553 Markos Chandras    2015-01-21  209  		    unhandled_signal(=
tsk, SIGSEGV) &&
d79d853df126553 Markos Chandras    2015-01-21  210  		    __ratelimit(&rate=
limit_state)) {
2a872a5dcec7052 Matt Redfearn      2016-11-09  211  			pr_info("do_page_fau=
lt(): sending SIGSEGV to %s for invalid %s %0*lx\n",
^1da177e4c3f415 Linus Torvalds     2005-04-16  212  				tsk->comm,
^1da177e4c3f415 Linus Torvalds     2005-04-16  213  				write ? "write acce=
ss to" : "read access from",
d79d853df126553 Markos Chandras    2015-01-21  214  				field, address);
d79d853df126553 Markos Chandras    2015-01-21  215  			pr_info("epc =3D %0*=
lx in", field,
d79d853df126553 Markos Chandras    2015-01-21  216  				(unsigned long) reg=
s->cp0_epc);
2a872a5dcec7052 Matt Redfearn      2016-11-09  217  			print_vma_addr(KERN_=
CONT " ", regs->cp0_epc);
2a872a5dcec7052 Matt Redfearn      2016-11-09  218  			pr_cont("\n");
d79d853df126553 Markos Chandras    2015-01-21  219  			pr_info("ra  =3D %0*=
lx in", field,
d79d853df126553 Markos Chandras    2015-01-21  220  				(unsigned long) reg=
s->regs[31]);
2a872a5dcec7052 Matt Redfearn      2016-11-09  221  			print_vma_addr(KERN_=
CONT " ", regs->regs[31]);
2a872a5dcec7052 Matt Redfearn      2016-11-09  222  			pr_cont("\n");
d79d853df126553 Markos Chandras    2015-01-21  223  		}
e3b28831c18c6c9 Ralf Baechle       2015-07-28  224  		current->thread.trap_=
nr =3D (regs->cp0_cause >> 2) & 0x1f;
2e1661d2673667d Eric W. Biederman  2019-05-23  225  		force_sig_fault(SIGSE=
GV, si_code, (void __user *)address);
^1da177e4c3f415 Linus Torvalds     2005-04-16  226  		return;
^1da177e4c3f415 Linus Torvalds     2005-04-16  227  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  228  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  229  no_context:
^1da177e4c3f415 Linus Torvalds     2005-04-16  230  	/* Are we prepared to =
handle this kernel fault?	 */
^1da177e4c3f415 Linus Torvalds     2005-04-16  231  	if (fixup_exception(re=
gs)) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  232  		current->thread.cp0_b=
aduaddr =3D address;
^1da177e4c3f415 Linus Torvalds     2005-04-16  233  		return;
^1da177e4c3f415 Linus Torvalds     2005-04-16  234  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  235  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  236  	/*
^1da177e4c3f415 Linus Torvalds     2005-04-16  237  	 * Oops. The kernel tr=
ied to access some bad page. We'll have to
^1da177e4c3f415 Linus Torvalds     2005-04-16  238  	 * terminate things wi=
th extreme prejudice.
^1da177e4c3f415 Linus Torvalds     2005-04-16  239  	 */
^1da177e4c3f415 Linus Torvalds     2005-04-16  240  	bust_spinlocks(1);
^1da177e4c3f415 Linus Torvalds     2005-04-16  241  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  242  	printk(KERN_ALERT "CPU=
 %d Unable to handle kernel paging request at "
^1da177e4c3f415 Linus Torvalds     2005-04-16  243  	       "virtual addres=
s %0*lx, epc =3D=3D %0*lx, ra =3D=3D %0*lx\n",
d6f703602fee8f8 Ralf Baechle       2007-03-29  244  	       raw_smp_process=
or_id(), field, address, field, regs->cp0_epc,
^1da177e4c3f415 Linus Torvalds     2005-04-16  245  	       field,  regs->r=
egs[31]);
^1da177e4c3f415 Linus Torvalds     2005-04-16  246  	die("Oops", regs);
^1da177e4c3f415 Linus Torvalds     2005-04-16  247  =

c7c1e3846bac1e4 Ralf Baechle       2009-01-12  248  out_of_memory:
^1da177e4c3f415 Linus Torvalds     2005-04-16  249  	/*
c7c1e3846bac1e4 Ralf Baechle       2009-01-12  250  	 * We ran out of memor=
y, call the OOM killer, and return the userspace
c7c1e3846bac1e4 Ralf Baechle       2009-01-12  251  	 * (which will retry t=
he fault, or kill us if we got oom-killed).
^1da177e4c3f415 Linus Torvalds     2005-04-16  252  	 */
89154dd5313f774 Michel Lespinasse  2020-06-08  253  	mmap_read_unlock(mm);
871341023c771ad Johannes Weiner    2013-09-12  254  	if (!user_mode(regs))
871341023c771ad Johannes Weiner    2013-09-12  255  		goto no_context;
c7c1e3846bac1e4 Ralf Baechle       2009-01-12  256  	pagefault_out_of_memor=
y();
c7c1e3846bac1e4 Ralf Baechle       2009-01-12  257  	return;
^1da177e4c3f415 Linus Torvalds     2005-04-16  258  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  259  do_sigbus:
89154dd5313f774 Michel Lespinasse  2020-06-08  260  	mmap_read_unlock(mm);
^1da177e4c3f415 Linus Torvalds     2005-04-16  261  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  262  	/* Kernel mode? Handle=
 exceptions or die */
^1da177e4c3f415 Linus Torvalds     2005-04-16  263  	if (!user_mode(regs))
^1da177e4c3f415 Linus Torvalds     2005-04-16  264  		goto no_context;
72f941af88a543e Paul Burton        2017-03-30  265  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  266  	/*
^1da177e4c3f415 Linus Torvalds     2005-04-16  267  	 * Send a sigbus, rega=
rdless of whether we were in kernel
^1da177e4c3f415 Linus Torvalds     2005-04-16  268  	 * or user mode.
^1da177e4c3f415 Linus Torvalds     2005-04-16  269  	 */
41c594ab65fc895 Ralf Baechle       2006-04-05  270  #if 0
41c594ab65fc895 Ralf Baechle       2006-04-05  271  	printk("do_page_fault(=
) #3: sending SIGBUS to %s for "
41c594ab65fc895 Ralf Baechle       2006-04-05  272  	       "invalid %s\n%0=
*lx (epc =3D=3D %0*lx, ra =3D=3D %0*lx)\n",
41c594ab65fc895 Ralf Baechle       2006-04-05  273  	       tsk->comm,
41c594ab65fc895 Ralf Baechle       2006-04-05  274  	       write ? "write =
access to" : "read access from",
41c594ab65fc895 Ralf Baechle       2006-04-05  275  	       field, address,
41c594ab65fc895 Ralf Baechle       2006-04-05  276  	       field, (unsigne=
d long) regs->cp0_epc,
41c594ab65fc895 Ralf Baechle       2006-04-05  277  	       field, (unsigne=
d long) regs->regs[31]);
41c594ab65fc895 Ralf Baechle       2006-04-05  278  #endif
e3b28831c18c6c9 Ralf Baechle       2015-07-28  279  	current->thread.trap_n=
r =3D (regs->cp0_cause >> 2) & 0x1f;
^1da177e4c3f415 Linus Torvalds     2005-04-16  280  	tsk->thread.cp0_badvad=
dr =3D address;
2e1661d2673667d Eric W. Biederman  2019-05-23  281  	force_sig_fault(SIGBUS=
, BUS_ADRERR, (void __user *)address);
^1da177e4c3f415 Linus Torvalds     2005-04-16  282  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  283  	return;
2ca2ebfd952d033 David Daney        2009-09-02  284  #ifndef CONFIG_64BIT
^1da177e4c3f415 Linus Torvalds     2005-04-16  285  vmalloc_fault:
^1da177e4c3f415 Linus Torvalds     2005-04-16  286  	{
^1da177e4c3f415 Linus Torvalds     2005-04-16  287  		/*
^1da177e4c3f415 Linus Torvalds     2005-04-16  288  		 * Synchronize this t=
ask's top level page-table
^1da177e4c3f415 Linus Torvalds     2005-04-16  289  		 * with the 'referenc=
e' page table.
^1da177e4c3f415 Linus Torvalds     2005-04-16  290  		 *
^1da177e4c3f415 Linus Torvalds     2005-04-16  291  		 * Do _not_ use "tsk"=
 here. We might be inside
^1da177e4c3f415 Linus Torvalds     2005-04-16  292  		 * an interrupt in th=
e middle of a task switch..
^1da177e4c3f415 Linus Torvalds     2005-04-16  293  		 */
31168f033e3751d Mike Rapoport      2019-11-21  294  		int offset =3D pgd_in=
dex(address);
^1da177e4c3f415 Linus Torvalds     2005-04-16  295  		pgd_t *pgd, *pgd_k;
2bee1b58484f036 Mike Rapoport      2019-11-21  296  		p4d_t *p4d, *p4d_k;
c6e8b587718c486 Ralf Baechle       2005-02-10  297  		pud_t *pud, *pud_k;
^1da177e4c3f415 Linus Torvalds     2005-04-16  298  		pmd_t *pmd, *pmd_k;
^1da177e4c3f415 Linus Torvalds     2005-04-16  299  		pte_t *pte_k;
^1da177e4c3f415 Linus Torvalds     2005-04-16  300  =

d6f703602fee8f8 Ralf Baechle       2007-03-29  301  		pgd =3D (pgd_t *) pgd=
_current[raw_smp_processor_id()] + offset;
^1da177e4c3f415 Linus Torvalds     2005-04-16  302  		pgd_k =3D init_mm.pgd=
 + offset;
^1da177e4c3f415 Linus Torvalds     2005-04-16  303  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  304  		if (!pgd_present(*pgd=
_k))
^1da177e4c3f415 Linus Torvalds     2005-04-16  305  			goto no_context;
^1da177e4c3f415 Linus Torvalds     2005-04-16  306  		set_pgd(pgd, *pgd_k);
^1da177e4c3f415 Linus Torvalds     2005-04-16  307  =

2bee1b58484f036 Mike Rapoport      2019-11-21  308  		p4d =3D p4d_offset(pg=
d, address);
2bee1b58484f036 Mike Rapoport      2019-11-21  309  		p4d_k =3D p4d_offset(=
pgd_k, address);
2bee1b58484f036 Mike Rapoport      2019-11-21  310  		if (!p4d_present(*p4d=
_k))
2bee1b58484f036 Mike Rapoport      2019-11-21  311  			goto no_context;
2bee1b58484f036 Mike Rapoport      2019-11-21  312  =

2bee1b58484f036 Mike Rapoport      2019-11-21  313  		pud =3D pud_offset(p4=
d, address);
2bee1b58484f036 Mike Rapoport      2019-11-21  314  		pud_k =3D pud_offset(=
p4d_k, address);
c6e8b587718c486 Ralf Baechle       2005-02-10  315  		if (!pud_present(*pud=
_k))
c6e8b587718c486 Ralf Baechle       2005-02-10  316  			goto no_context;
c6e8b587718c486 Ralf Baechle       2005-02-10  317  =

c6e8b587718c486 Ralf Baechle       2005-02-10  318  		pmd =3D pmd_offset(pu=
d, address);
c6e8b587718c486 Ralf Baechle       2005-02-10  319  		pmd_k =3D pmd_offset(=
pud_k, address);
^1da177e4c3f415 Linus Torvalds     2005-04-16  320  		if (!pmd_present(*pmd=
_k))
^1da177e4c3f415 Linus Torvalds     2005-04-16  321  			goto no_context;
^1da177e4c3f415 Linus Torvalds     2005-04-16  322  		set_pmd(pmd, *pmd_k);
^1da177e4c3f415 Linus Torvalds     2005-04-16  323  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  324  		pte_k =3D pte_offset_=
kernel(pmd_k, address);
^1da177e4c3f415 Linus Torvalds     2005-04-16  325  		if (!pte_present(*pte=
_k))
^1da177e4c3f415 Linus Torvalds     2005-04-16  326  			goto no_context;
^1da177e4c3f415 Linus Torvalds     2005-04-16 @327  		return;
^1da177e4c3f415 Linus Torvalds     2005-04-16  328  	}
2ca2ebfd952d033 David Daney        2009-09-02  329  #endif
^1da177e4c3f415 Linus Torvalds     2005-04-16  330  }
c3fc5cd5c5a5f47 Ralf Baechle       2013-05-29  331  =


:::::: The code at line 327 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0329423005410290357==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0329423005410290357==--

