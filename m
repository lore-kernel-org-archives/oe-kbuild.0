Content-Type: multipart/mixed; boundary="===============0808736152241759204=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 14900/14955] arch/riscv/mm/fault.c:275 do_page_fault() warn: inconsistent returns 'mm->mmap_lock'.
Date: Thu, 04 Jun 2020 07:23:49 +0800
Message-ID: <202006040746.vrZYVRLs%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0808736152241759204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "Michel, Lespinasse," <walken@google.com>
CC: Vlastimil Babka <vbabka@suse.cz>
CC: Davidlohr Bueso <dbueso@suse.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   0e21d4620dd047da7952f44a2e1ac777ded2d57e
commit: 4601e502817fe919dab54c779f7a037eb4e92c78 [14900/14955] mmap locking=
 API: rename mmap_sem to mmap_lock
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-m031-20200603 (attached as .config)
compiler: riscv64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/riscv/mm/fault.c:275 do_page_fault() warn: inconsistent returns 'mm->m=
map_lock'.

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D4601e502817fe919dab54c779f7a037eb4e92c78
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout 4601e502817fe919dab54c779f7a037eb4e92c78
vim +275 arch/riscv/mm/fault.c

ffaee2728f9b27 Paul Walmsley     2019-10-17   22  =

07037db5d479f9 Palmer Dabbelt    2017-07-10   23  /*
07037db5d479f9 Palmer Dabbelt    2017-07-10   24   * This routine handles p=
age faults.  It determines the address and the
07037db5d479f9 Palmer Dabbelt    2017-07-10   25   * problem, and then pass=
es it off to one of the appropriate routines.
07037db5d479f9 Palmer Dabbelt    2017-07-10   26   */
07037db5d479f9 Palmer Dabbelt    2017-07-10   27  asmlinkage void do_page_f=
ault(struct pt_regs *regs)
07037db5d479f9 Palmer Dabbelt    2017-07-10   28  {
07037db5d479f9 Palmer Dabbelt    2017-07-10   29  	struct task_struct *tsk;
07037db5d479f9 Palmer Dabbelt    2017-07-10   30  	struct vm_area_struct *v=
ma;
07037db5d479f9 Palmer Dabbelt    2017-07-10   31  	struct mm_struct *mm;
07037db5d479f9 Palmer Dabbelt    2017-07-10   32  	unsigned long addr, caus=
e;
dde1607248328c Peter Xu          2020-04-01   33  	unsigned int flags =3D F=
AULT_FLAG_DEFAULT;
50a7ca3c6fc869 Souptick Joarder  2018-08-17   34  	int code =3D SEGV_MAPERR;
50a7ca3c6fc869 Souptick Joarder  2018-08-17   35  	vm_fault_t fault;
07037db5d479f9 Palmer Dabbelt    2017-07-10   36  =

a4c3733d32a72f Christoph Hellwig 2019-10-28   37  	cause =3D regs->cause;
a4c3733d32a72f Christoph Hellwig 2019-10-28   38  	addr =3D regs->badaddr;
07037db5d479f9 Palmer Dabbelt    2017-07-10   39  =

07037db5d479f9 Palmer Dabbelt    2017-07-10   40  	tsk =3D current;
07037db5d479f9 Palmer Dabbelt    2017-07-10   41  	mm =3D tsk->mm;
07037db5d479f9 Palmer Dabbelt    2017-07-10   42  =

07037db5d479f9 Palmer Dabbelt    2017-07-10   43  	/*
07037db5d479f9 Palmer Dabbelt    2017-07-10   44  	 * Fault-in kernel-space=
 virtual memory on-demand.
07037db5d479f9 Palmer Dabbelt    2017-07-10   45  	 * The 'reference' page =
table is init_mm.pgd.
07037db5d479f9 Palmer Dabbelt    2017-07-10   46  	 *
07037db5d479f9 Palmer Dabbelt    2017-07-10   47  	 * NOTE! We MUST NOT tak=
e any locks for this case. We may
07037db5d479f9 Palmer Dabbelt    2017-07-10   48  	 * be in an interrupt or=
 a critical region, and should
07037db5d479f9 Palmer Dabbelt    2017-07-10   49  	 * only copy the informa=
tion from the master page table,
07037db5d479f9 Palmer Dabbelt    2017-07-10   50  	 * nothing more.
07037db5d479f9 Palmer Dabbelt    2017-07-10   51  	 */
07037db5d479f9 Palmer Dabbelt    2017-07-10   52  	if (unlikely((addr >=3D =
VMALLOC_START) && (addr <=3D VMALLOC_END)))
07037db5d479f9 Palmer Dabbelt    2017-07-10   53  		goto vmalloc_fault;
07037db5d479f9 Palmer Dabbelt    2017-07-10   54  =

07037db5d479f9 Palmer Dabbelt    2017-07-10   55  	/* Enable interrupts if =
they were enabled in the parent context. */
a4c3733d32a72f Christoph Hellwig 2019-10-28   56  	if (likely(regs->status =
& SR_PIE))
07037db5d479f9 Palmer Dabbelt    2017-07-10   57  		local_irq_enable();
07037db5d479f9 Palmer Dabbelt    2017-07-10   58  =

07037db5d479f9 Palmer Dabbelt    2017-07-10   59  	/*
07037db5d479f9 Palmer Dabbelt    2017-07-10   60  	 * If we're in an interr=
upt, have no user context, or are running
07037db5d479f9 Palmer Dabbelt    2017-07-10   61  	 * in an atomic region, =
then we must not take the fault.
07037db5d479f9 Palmer Dabbelt    2017-07-10   62  	 */
07037db5d479f9 Palmer Dabbelt    2017-07-10   63  	if (unlikely(faulthandle=
r_disabled() || !mm))
07037db5d479f9 Palmer Dabbelt    2017-07-10   64  		goto no_context;
07037db5d479f9 Palmer Dabbelt    2017-07-10   65  =

07037db5d479f9 Palmer Dabbelt    2017-07-10   66  	if (user_mode(regs))
07037db5d479f9 Palmer Dabbelt    2017-07-10   67  		flags |=3D FAULT_FLAG_U=
SER;
07037db5d479f9 Palmer Dabbelt    2017-07-10   68  =

07037db5d479f9 Palmer Dabbelt    2017-07-10   69  	perf_sw_event(PERF_COUNT=
_SW_PAGE_FAULTS, 1, regs, addr);
07037db5d479f9 Palmer Dabbelt    2017-07-10   70  =

07037db5d479f9 Palmer Dabbelt    2017-07-10   71  retry:
00b0a4590383ec Michel Lespinasse 2020-05-30   72  	mmap_read_lock(mm);
07037db5d479f9 Palmer Dabbelt    2017-07-10   73  	vma =3D find_vma(mm, add=
r);
07037db5d479f9 Palmer Dabbelt    2017-07-10   74  	if (unlikely(!vma))
07037db5d479f9 Palmer Dabbelt    2017-07-10   75  		goto bad_area;
07037db5d479f9 Palmer Dabbelt    2017-07-10   76  	if (likely(vma->vm_start=
 <=3D addr))
07037db5d479f9 Palmer Dabbelt    2017-07-10   77  		goto good_area;
07037db5d479f9 Palmer Dabbelt    2017-07-10   78  	if (unlikely(!(vma->vm_f=
lags & VM_GROWSDOWN)))
07037db5d479f9 Palmer Dabbelt    2017-07-10   79  		goto bad_area;
07037db5d479f9 Palmer Dabbelt    2017-07-10   80  	if (unlikely(expand_stac=
k(vma, addr)))
07037db5d479f9 Palmer Dabbelt    2017-07-10   81  		goto bad_area;
07037db5d479f9 Palmer Dabbelt    2017-07-10   82  =

07037db5d479f9 Palmer Dabbelt    2017-07-10   83  	/*
07037db5d479f9 Palmer Dabbelt    2017-07-10   84  	 * Ok, we have a good vm=
_area for this memory access, so
07037db5d479f9 Palmer Dabbelt    2017-07-10   85  	 * we can handle it.
07037db5d479f9 Palmer Dabbelt    2017-07-10   86  	 */
07037db5d479f9 Palmer Dabbelt    2017-07-10   87  good_area:
07037db5d479f9 Palmer Dabbelt    2017-07-10   88  	code =3D SEGV_ACCERR;
07037db5d479f9 Palmer Dabbelt    2017-07-10   89  =

07037db5d479f9 Palmer Dabbelt    2017-07-10   90  	switch (cause) {
07037db5d479f9 Palmer Dabbelt    2017-07-10   91  	case EXC_INST_PAGE_FAULT:
07037db5d479f9 Palmer Dabbelt    2017-07-10   92  		if (!(vma->vm_flags & V=
M_EXEC))
07037db5d479f9 Palmer Dabbelt    2017-07-10   93  			goto bad_area;
07037db5d479f9 Palmer Dabbelt    2017-07-10   94  		break;
07037db5d479f9 Palmer Dabbelt    2017-07-10   95  	case EXC_LOAD_PAGE_FAULT:
07037db5d479f9 Palmer Dabbelt    2017-07-10   96  		if (!(vma->vm_flags & V=
M_READ))
07037db5d479f9 Palmer Dabbelt    2017-07-10   97  			goto bad_area;
07037db5d479f9 Palmer Dabbelt    2017-07-10   98  		break;
07037db5d479f9 Palmer Dabbelt    2017-07-10   99  	case EXC_STORE_PAGE_FAUL=
T:
07037db5d479f9 Palmer Dabbelt    2017-07-10  100  		if (!(vma->vm_flags & V=
M_WRITE))
07037db5d479f9 Palmer Dabbelt    2017-07-10  101  			goto bad_area;
07037db5d479f9 Palmer Dabbelt    2017-07-10  102  		flags |=3D FAULT_FLAG_W=
RITE;
07037db5d479f9 Palmer Dabbelt    2017-07-10  103  		break;
07037db5d479f9 Palmer Dabbelt    2017-07-10  104  	default:
07037db5d479f9 Palmer Dabbelt    2017-07-10  105  		panic("%s: unhandled ca=
use %lu", __func__, cause);
07037db5d479f9 Palmer Dabbelt    2017-07-10  106  	}
07037db5d479f9 Palmer Dabbelt    2017-07-10  107  =

07037db5d479f9 Palmer Dabbelt    2017-07-10  108  	/*
07037db5d479f9 Palmer Dabbelt    2017-07-10  109  	 * If for any reason at =
all we could not handle the fault,
07037db5d479f9 Palmer Dabbelt    2017-07-10  110  	 * make sure we exit gra=
cefully rather than endlessly redo
07037db5d479f9 Palmer Dabbelt    2017-07-10  111  	 * the fault.
07037db5d479f9 Palmer Dabbelt    2017-07-10  112  	 */
07037db5d479f9 Palmer Dabbelt    2017-07-10  113  	fault =3D handle_mm_faul=
t(vma, addr, flags);
07037db5d479f9 Palmer Dabbelt    2017-07-10  114  =

07037db5d479f9 Palmer Dabbelt    2017-07-10  115  	/*
07037db5d479f9 Palmer Dabbelt    2017-07-10  116  	 * If we need to retry b=
ut a fatal signal is pending, handle the
07037db5d479f9 Palmer Dabbelt    2017-07-10  117  	 * signal first. We do n=
ot need to release the mmap_sem because it
07037db5d479f9 Palmer Dabbelt    2017-07-10  118  	 * would already be rele=
ased in __lock_page_or_retry in mm/filemap.c.
07037db5d479f9 Palmer Dabbelt    2017-07-10  119  	 */
4ef873226ceb9c Peter Xu          2020-04-01  120  	if (fault_signal_pending=
(fault, regs))
07037db5d479f9 Palmer Dabbelt    2017-07-10  121  		return;
07037db5d479f9 Palmer Dabbelt    2017-07-10  122  =

07037db5d479f9 Palmer Dabbelt    2017-07-10  123  	if (unlikely(fault & VM_=
FAULT_ERROR)) {
07037db5d479f9 Palmer Dabbelt    2017-07-10  124  		if (fault & VM_FAULT_OO=
M)
07037db5d479f9 Palmer Dabbelt    2017-07-10  125  			goto out_of_memory;
07037db5d479f9 Palmer Dabbelt    2017-07-10  126  		else if (fault & VM_FAU=
LT_SIGBUS)
07037db5d479f9 Palmer Dabbelt    2017-07-10  127  			goto do_sigbus;
07037db5d479f9 Palmer Dabbelt    2017-07-10  128  		BUG();
07037db5d479f9 Palmer Dabbelt    2017-07-10  129  	}
07037db5d479f9 Palmer Dabbelt    2017-07-10  130  =

07037db5d479f9 Palmer Dabbelt    2017-07-10  131  	/*
07037db5d479f9 Palmer Dabbelt    2017-07-10  132  	 * Major/minor page faul=
t accounting is only done on the
07037db5d479f9 Palmer Dabbelt    2017-07-10  133  	 * initial attempt. If w=
e go through a retry, it is extremely
07037db5d479f9 Palmer Dabbelt    2017-07-10  134  	 * likely that the page =
will be found in page cache at that point.
07037db5d479f9 Palmer Dabbelt    2017-07-10  135  	 */
07037db5d479f9 Palmer Dabbelt    2017-07-10  136  	if (flags & FAULT_FLAG_A=
LLOW_RETRY) {
07037db5d479f9 Palmer Dabbelt    2017-07-10  137  		if (fault & VM_FAULT_MA=
JOR) {
07037db5d479f9 Palmer Dabbelt    2017-07-10  138  			tsk->maj_flt++;
07037db5d479f9 Palmer Dabbelt    2017-07-10  139  			perf_sw_event(PERF_COU=
NT_SW_PAGE_FAULTS_MAJ,
07037db5d479f9 Palmer Dabbelt    2017-07-10  140  				      1, regs, addr);
07037db5d479f9 Palmer Dabbelt    2017-07-10  141  		} else {
07037db5d479f9 Palmer Dabbelt    2017-07-10  142  			tsk->min_flt++;
07037db5d479f9 Palmer Dabbelt    2017-07-10  143  			perf_sw_event(PERF_COU=
NT_SW_PAGE_FAULTS_MIN,
07037db5d479f9 Palmer Dabbelt    2017-07-10  144  				      1, regs, addr);
07037db5d479f9 Palmer Dabbelt    2017-07-10  145  		}
07037db5d479f9 Palmer Dabbelt    2017-07-10  146  		if (fault & VM_FAULT_RE=
TRY) {
07037db5d479f9 Palmer Dabbelt    2017-07-10  147  			flags |=3D FAULT_FLAG_=
TRIED;
07037db5d479f9 Palmer Dabbelt    2017-07-10  148  =

07037db5d479f9 Palmer Dabbelt    2017-07-10  149  			/*
07037db5d479f9 Palmer Dabbelt    2017-07-10  150  			 * No need to up_read(=
&mm->mmap_sem) as we would
07037db5d479f9 Palmer Dabbelt    2017-07-10  151  			 * have already releas=
ed it in __lock_page_or_retry
07037db5d479f9 Palmer Dabbelt    2017-07-10  152  			 * in mm/filemap.c.
07037db5d479f9 Palmer Dabbelt    2017-07-10  153  			 */
07037db5d479f9 Palmer Dabbelt    2017-07-10  154  			goto retry;
07037db5d479f9 Palmer Dabbelt    2017-07-10  155  		}
07037db5d479f9 Palmer Dabbelt    2017-07-10  156  	}
07037db5d479f9 Palmer Dabbelt    2017-07-10  157  =

00b0a4590383ec Michel Lespinasse 2020-05-30  158  	mmap_read_unlock(mm);
07037db5d479f9 Palmer Dabbelt    2017-07-10  159  	return;
07037db5d479f9 Palmer Dabbelt    2017-07-10  160  =

07037db5d479f9 Palmer Dabbelt    2017-07-10  161  	/*
07037db5d479f9 Palmer Dabbelt    2017-07-10  162  	 * Something tried to ac=
cess memory that isn't in our memory map.
07037db5d479f9 Palmer Dabbelt    2017-07-10  163  	 * Fix it, but check if =
it's kernel or user first.
07037db5d479f9 Palmer Dabbelt    2017-07-10  164  	 */
07037db5d479f9 Palmer Dabbelt    2017-07-10  165  bad_area:
00b0a4590383ec Michel Lespinasse 2020-05-30  166  	mmap_read_unlock(mm);
07037db5d479f9 Palmer Dabbelt    2017-07-10  167  	/* User mode accesses ju=
st cause a SIGSEGV */
07037db5d479f9 Palmer Dabbelt    2017-07-10  168  	if (user_mode(regs)) {
6f25a967646aa3 Eric W. Biederman 2019-02-05  169  		do_trap(regs, SIGSEGV, =
code, addr);
07037db5d479f9 Palmer Dabbelt    2017-07-10  170  		return;
07037db5d479f9 Palmer Dabbelt    2017-07-10  171  	}
07037db5d479f9 Palmer Dabbelt    2017-07-10  172  =

07037db5d479f9 Palmer Dabbelt    2017-07-10  173  no_context:
07037db5d479f9 Palmer Dabbelt    2017-07-10  174  	/* Are we prepared to ha=
ndle this kernel fault? */
07037db5d479f9 Palmer Dabbelt    2017-07-10  175  	if (fixup_exception(regs=
))
07037db5d479f9 Palmer Dabbelt    2017-07-10  176  		return;
07037db5d479f9 Palmer Dabbelt    2017-07-10  177  =

07037db5d479f9 Palmer Dabbelt    2017-07-10  178  	/*
07037db5d479f9 Palmer Dabbelt    2017-07-10  179  	 * Oops. The kernel trie=
d to access some bad page. We'll have to
07037db5d479f9 Palmer Dabbelt    2017-07-10  180  	 * terminate things with=
 extreme prejudice.
07037db5d479f9 Palmer Dabbelt    2017-07-10  181  	 */
07037db5d479f9 Palmer Dabbelt    2017-07-10  182  	bust_spinlocks(1);
07037db5d479f9 Palmer Dabbelt    2017-07-10  183  	pr_alert("Unable to hand=
le kernel %s at virtual address " REG_FMT "\n",
07037db5d479f9 Palmer Dabbelt    2017-07-10  184  		(addr < PAGE_SIZE) ? "N=
ULL pointer dereference" :
07037db5d479f9 Palmer Dabbelt    2017-07-10  185  		"paging request", addr);
07037db5d479f9 Palmer Dabbelt    2017-07-10  186  	die(regs, "Oops");
07037db5d479f9 Palmer Dabbelt    2017-07-10  187  	do_exit(SIGKILL);
07037db5d479f9 Palmer Dabbelt    2017-07-10  188  =

07037db5d479f9 Palmer Dabbelt    2017-07-10  189  	/*
07037db5d479f9 Palmer Dabbelt    2017-07-10  190  	 * We ran out of memory,=
 call the OOM killer, and return the userspace
07037db5d479f9 Palmer Dabbelt    2017-07-10  191  	 * (which will retry the=
 fault, or kill us if we got oom-killed).
07037db5d479f9 Palmer Dabbelt    2017-07-10  192  	 */
07037db5d479f9 Palmer Dabbelt    2017-07-10  193  out_of_memory:
00b0a4590383ec Michel Lespinasse 2020-05-30  194  	mmap_read_unlock(mm);
07037db5d479f9 Palmer Dabbelt    2017-07-10  195  	if (!user_mode(regs))
07037db5d479f9 Palmer Dabbelt    2017-07-10  196  		goto no_context;
07037db5d479f9 Palmer Dabbelt    2017-07-10  197  	pagefault_out_of_memory(=
);
07037db5d479f9 Palmer Dabbelt    2017-07-10  198  	return;
07037db5d479f9 Palmer Dabbelt    2017-07-10  199  =

07037db5d479f9 Palmer Dabbelt    2017-07-10  200  do_sigbus:
00b0a4590383ec Michel Lespinasse 2020-05-30  201  	mmap_read_unlock(mm);
07037db5d479f9 Palmer Dabbelt    2017-07-10  202  	/* Kernel mode? Handle e=
xceptions or die */
07037db5d479f9 Palmer Dabbelt    2017-07-10  203  	if (!user_mode(regs))
07037db5d479f9 Palmer Dabbelt    2017-07-10  204  		goto no_context;
6f25a967646aa3 Eric W. Biederman 2019-02-05  205  	do_trap(regs, SIGBUS, BU=
S_ADRERR, addr);
07037db5d479f9 Palmer Dabbelt    2017-07-10  206  	return;
07037db5d479f9 Palmer Dabbelt    2017-07-10  207  =

07037db5d479f9 Palmer Dabbelt    2017-07-10  208  vmalloc_fault:
07037db5d479f9 Palmer Dabbelt    2017-07-10  209  	{
07037db5d479f9 Palmer Dabbelt    2017-07-10  210  		pgd_t *pgd, *pgd_k;
07037db5d479f9 Palmer Dabbelt    2017-07-10  211  		pud_t *pud, *pud_k;
07037db5d479f9 Palmer Dabbelt    2017-07-10  212  		p4d_t *p4d, *p4d_k;
07037db5d479f9 Palmer Dabbelt    2017-07-10  213  		pmd_t *pmd, *pmd_k;
07037db5d479f9 Palmer Dabbelt    2017-07-10  214  		pte_t *pte_k;
07037db5d479f9 Palmer Dabbelt    2017-07-10  215  		int index;
07037db5d479f9 Palmer Dabbelt    2017-07-10  216  =

8fef9900d43feb Andreas Schwab    2019-05-07  217  		/* User mode accesses j=
ust cause a SIGSEGV */
07037db5d479f9 Palmer Dabbelt    2017-07-10  218  		if (user_mode(regs))
6f25a967646aa3 Eric W. Biederman 2019-02-05  219  			return do_trap(regs, S=
IGSEGV, code, addr);
07037db5d479f9 Palmer Dabbelt    2017-07-10  220  =

07037db5d479f9 Palmer Dabbelt    2017-07-10  221  		/*
07037db5d479f9 Palmer Dabbelt    2017-07-10  222  		 * Synchronize this tas=
k's top level page-table
07037db5d479f9 Palmer Dabbelt    2017-07-10  223  		 * with the 'reference'=
 page table.
07037db5d479f9 Palmer Dabbelt    2017-07-10  224  		 *
07037db5d479f9 Palmer Dabbelt    2017-07-10  225  		 * Do _not_ use "tsk->a=
ctive_mm->pgd" here.
07037db5d479f9 Palmer Dabbelt    2017-07-10  226  		 * We might be inside a=
n interrupt in the middle
07037db5d479f9 Palmer Dabbelt    2017-07-10  227  		 * of a task switch.
07037db5d479f9 Palmer Dabbelt    2017-07-10  228  		 */
07037db5d479f9 Palmer Dabbelt    2017-07-10  229  		index =3D pgd_index(add=
r);
a3182c91ef4e7d Anup Patel        2019-04-25  230  		pgd =3D (pgd_t *)pfn_to=
_virt(csr_read(CSR_SATP)) + index;
07037db5d479f9 Palmer Dabbelt    2017-07-10  231  		pgd_k =3D init_mm.pgd +=
 index;
07037db5d479f9 Palmer Dabbelt    2017-07-10  232  =

07037db5d479f9 Palmer Dabbelt    2017-07-10  233  		if (!pgd_present(*pgd_k=
))
07037db5d479f9 Palmer Dabbelt    2017-07-10  234  			goto no_context;
07037db5d479f9 Palmer Dabbelt    2017-07-10  235  		set_pgd(pgd, *pgd_k);
07037db5d479f9 Palmer Dabbelt    2017-07-10  236  =

07037db5d479f9 Palmer Dabbelt    2017-07-10  237  		p4d =3D p4d_offset(pgd,=
 addr);
07037db5d479f9 Palmer Dabbelt    2017-07-10  238  		p4d_k =3D p4d_offset(pg=
d_k, addr);
07037db5d479f9 Palmer Dabbelt    2017-07-10  239  		if (!p4d_present(*p4d_k=
))
07037db5d479f9 Palmer Dabbelt    2017-07-10  240  			goto no_context;
07037db5d479f9 Palmer Dabbelt    2017-07-10  241  =

07037db5d479f9 Palmer Dabbelt    2017-07-10  242  		pud =3D pud_offset(p4d,=
 addr);
07037db5d479f9 Palmer Dabbelt    2017-07-10  243  		pud_k =3D pud_offset(p4=
d_k, addr);
07037db5d479f9 Palmer Dabbelt    2017-07-10  244  		if (!pud_present(*pud_k=
))
07037db5d479f9 Palmer Dabbelt    2017-07-10  245  			goto no_context;
07037db5d479f9 Palmer Dabbelt    2017-07-10  246  =

07037db5d479f9 Palmer Dabbelt    2017-07-10  247  		/*
07037db5d479f9 Palmer Dabbelt    2017-07-10  248  		 * Since the vmalloc ar=
ea is global, it is unnecessary
07037db5d479f9 Palmer Dabbelt    2017-07-10  249  		 * to copy individual P=
TEs
07037db5d479f9 Palmer Dabbelt    2017-07-10  250  		 */
07037db5d479f9 Palmer Dabbelt    2017-07-10  251  		pmd =3D pmd_offset(pud,=
 addr);
07037db5d479f9 Palmer Dabbelt    2017-07-10  252  		pmd_k =3D pmd_offset(pu=
d_k, addr);
07037db5d479f9 Palmer Dabbelt    2017-07-10  253  		if (!pmd_present(*pmd_k=
))
07037db5d479f9 Palmer Dabbelt    2017-07-10  254  			goto no_context;
07037db5d479f9 Palmer Dabbelt    2017-07-10  255  		set_pmd(pmd, *pmd_k);
07037db5d479f9 Palmer Dabbelt    2017-07-10  256  =

07037db5d479f9 Palmer Dabbelt    2017-07-10  257  		/*
07037db5d479f9 Palmer Dabbelt    2017-07-10  258  		 * Make sure the actual=
 PTE exists as well to
07037db5d479f9 Palmer Dabbelt    2017-07-10  259  		 * catch kernel vmalloc=
-area accesses to non-mapped
07037db5d479f9 Palmer Dabbelt    2017-07-10  260  		 * addresses. If we don=
't do this, this will just
07037db5d479f9 Palmer Dabbelt    2017-07-10  261  		 * silently loop foreve=
r.
07037db5d479f9 Palmer Dabbelt    2017-07-10  262  		 */
07037db5d479f9 Palmer Dabbelt    2017-07-10  263  		pte_k =3D pte_offset_ke=
rnel(pmd_k, addr);
07037db5d479f9 Palmer Dabbelt    2017-07-10  264  		if (!pte_present(*pte_k=
))
07037db5d479f9 Palmer Dabbelt    2017-07-10  265  			goto no_context;
bf587caae305ae ShihPo Hung       2019-06-17  266  =

bf587caae305ae ShihPo Hung       2019-06-17  267  		/*
bf587caae305ae ShihPo Hung       2019-06-17  268  		 * The kernel assumes t=
hat TLBs don't cache invalid
bf587caae305ae ShihPo Hung       2019-06-17  269  		 * entries, but in RISC=
-V, SFENCE.VMA specifies an
bf587caae305ae ShihPo Hung       2019-06-17  270  		 * ordering constraint,=
 not a cache flush; it is
bf587caae305ae ShihPo Hung       2019-06-17  271  		 * necessary even after=
 writing invalid entries.
bf587caae305ae ShihPo Hung       2019-06-17  272  		 */
bf587caae305ae ShihPo Hung       2019-06-17  273  		local_flush_tlb_page(ad=
dr);
bf587caae305ae ShihPo Hung       2019-06-17  274  =

07037db5d479f9 Palmer Dabbelt    2017-07-10 @275  		return;

:::::: The code at line 275 was first introduced by commit
:::::: 07037db5d479f90377c998259a4f9a469c404edf RISC-V: Paging and MMU

:::::: TO: Palmer Dabbelt <palmer@dabbelt.com>
:::::: CC: Palmer Dabbelt <palmer@dabbelt.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0808736152241759204==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
dQUvT06uCy9MQ92Y/A8UqmXIkK8BAA==
--===============0808736152241759204==--

