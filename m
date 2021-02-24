Content-Type: multipart/mixed; boundary="===============9168452391943155833=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/riscv/mm/fault.c:275 do_page_fault() warn: inconsistent returns '&mm->mmap_lock'.
Date: Wed, 24 Feb 2021 16:10:23 +0800
Message-ID: <202102241611.FKYFxbaP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9168452391943155833==
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
head:   c03c21ba6f4e95e406a1a7b4c34ef334b977c194
commit: da1c55f1b272f4bd54671d459b39ea7b54944ef9 mmap locking API: rename m=
map_sem to mmap_lock
date:   9 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 9 months ago
config: riscv-randconfig-m031-20210224 (attached as .config)
compiler: riscv64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/riscv/mm/fault.c:275 do_page_fault() warn: inconsistent returns '&mm->=
mmap_lock'.

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
d8ed45c5dcd455 Michel Lespinasse 2020-06-08   72  	mmap_read_lock(mm);
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

d8ed45c5dcd455 Michel Lespinasse 2020-06-08  158  	mmap_read_unlock(mm);
07037db5d479f9 Palmer Dabbelt    2017-07-10  159  	return;
07037db5d479f9 Palmer Dabbelt    2017-07-10  160  =

07037db5d479f9 Palmer Dabbelt    2017-07-10  161  	/*
07037db5d479f9 Palmer Dabbelt    2017-07-10  162  	 * Something tried to ac=
cess memory that isn't in our memory map.
07037db5d479f9 Palmer Dabbelt    2017-07-10  163  	 * Fix it, but check if =
it's kernel or user first.
07037db5d479f9 Palmer Dabbelt    2017-07-10  164  	 */
07037db5d479f9 Palmer Dabbelt    2017-07-10  165  bad_area:
d8ed45c5dcd455 Michel Lespinasse 2020-06-08  166  	mmap_read_unlock(mm);
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
d8ed45c5dcd455 Michel Lespinasse 2020-06-08  194  	mmap_read_unlock(mm);
07037db5d479f9 Palmer Dabbelt    2017-07-10  195  	if (!user_mode(regs))
07037db5d479f9 Palmer Dabbelt    2017-07-10  196  		goto no_context;
07037db5d479f9 Palmer Dabbelt    2017-07-10  197  	pagefault_out_of_memory(=
);
07037db5d479f9 Palmer Dabbelt    2017-07-10  198  	return;
07037db5d479f9 Palmer Dabbelt    2017-07-10  199  =

07037db5d479f9 Palmer Dabbelt    2017-07-10  200  do_sigbus:
d8ed45c5dcd455 Michel Lespinasse 2020-06-08  201  	mmap_read_unlock(mm);
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

--===============9168452391943155833==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============9168452391943155833==--

