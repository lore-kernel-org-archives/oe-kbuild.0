Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B8E185B72
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Apr 2025 10:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745058323; cv=none; b=EGelA8RhZlaMBTV3wck6imOq/liM8DCCdst3BUnQGD41pbdNSbX7w2iyjBeQBBOVp37UbYVQatw/59K6hCuUlnwXB7oIM/P1oUhgJom0fZwlHrGH0YgUnF5UVOWYL9Q4fF3kW9t52V/bftPqm/NgYgSAs5eM/toJeVvAG9gqB0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745058323; c=relaxed/simple;
	bh=6JKHyOtRrSh8mrY3zh2OvqoXejNr0ehg3/MZCqFKR80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FmnXZSj5GdvEp8ZvQGVvGa6lZe9Gtpa6q74ye2vxYalWoTg2KbIxCBAK6/5/00M/Rs05d0Z+c1DPSghU2QtUOA+A+WOnwsdxrkgB3JHuJFK0LH0P6GsTJXTzB5VXM3Z8fpAgSNP61EbpUSiNaToo9UUT4ChEK1OE8mC6xmYmdqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m2+pCdMp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2+pCdMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745058321; x=1776594321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6JKHyOtRrSh8mrY3zh2OvqoXejNr0ehg3/MZCqFKR80=;
  b=m2+pCdMpLhzkmdLzFmFKvUWpMN81aFBuSXp+zIMtA5w0roZ5YAeAPrcK
   NpU+dqtVha33FScRwstZMuJRUlAkO5IWfCg1rbE2Bae1vCOZp2l5zrCCh
   kp1tBLYzmERX3QGCcPqdnw38jhlIbMHjPWkKj5mOx+tl9DFTTxh7XZtLs
   W4dXBI0U+WmcNyMrd6trj0JTpolvkvuKd1b7azUI8jSyGOBvjv9C/UmqB
   OcEIDunDDtgDw5EiGxpsD4wkRntpOKdwQxk5V4f/XXmuwOyfLNB/Uga8W
   UIj1N1threRlMdi2NEsG7TXSTnniaRW3Mg4GdyVKEV81uMX83Yd3uyCDr
   w==;
X-CSE-ConnectionGUID: noF10PPkSZyaAuKzyOXtxg==
X-CSE-MsgGUID: /+H+yXoaRUqTkNhGDjXcFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="50469752"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="50469752"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 03:25:19 -0700
X-CSE-ConnectionGUID: ZmCLhfFAQb+ZfNL91SaKOA==
X-CSE-MsgGUID: uHbkSZBAR4CaQiZN0i0Hjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="168514549"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Apr 2025 03:25:18 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u65Nr-0003nB-2l;
	Sat, 19 Apr 2025 10:25:15 +0000
Date: Sat, 19 Apr 2025 18:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xinli-intel-fred-public:intel-lkp 22/34]
 arch/x86/include/asm/paravirt_types.h: linux/types.h is included more than
 once.
Message-ID: <202504191818.ufuG50Ek-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Xin3 Li <xin3.li@intel.com>

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   e19223f38a0e0c88c327290f641ee60685834932
commit: 21c7541326f136986c2377fe1fd4b38e82cc499a [22/34] x86/msr: Move get_pv_msr_action() to <asm/paravirt.h>
:::::: branch date: 26 hours ago
:::::: commit date: 2 days ago
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504191818.ufuG50Ek-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/include/asm/paravirt_types.h: linux/types.h is included more than once.

vim +8 arch/x86/include/asm/paravirt_types.h

     6	
     7	#ifndef __ASSEMBLER__
   > 8	#include <linux/types.h>
     9	
    10	#include <asm/desc_defs.h>
    11	#include <asm/pgtable_types.h>
    12	#include <asm/nospec-branch.h>
    13	
    14	struct page;
    15	struct thread_struct;
    16	struct desc_ptr;
    17	struct tss_struct;
    18	struct mm_struct;
    19	struct desc_struct;
    20	struct task_struct;
    21	struct cpumask;
    22	struct flush_tlb_info;
    23	struct mmu_gather;
    24	struct vm_area_struct;
    25	
    26	/*
    27	 * Wrapper type for pointers to code which uses the non-standard
    28	 * calling convention.  See PV_CALL_SAVE_REGS_THUNK below.
    29	 */
    30	struct paravirt_callee_save {
    31		void *func;
    32	};
    33	
    34	/* general info */
    35	struct pv_info {
    36	#ifdef CONFIG_PARAVIRT_XXL
    37		u16 extra_user_64bit_cs;  /* __USER_CS if none */
    38	#endif
    39	
    40		const char *name;
    41	};
    42	
    43	#ifdef CONFIG_PARAVIRT_XXL
    44	struct pv_lazy_ops {
    45		/* Set deferred update mode, used for batching operations. */
    46		void (*enter)(void);
    47		void (*leave)(void);
    48		void (*flush)(void);
    49	} __no_randomize_layout;
    50	#endif
    51	
    52	struct pv_cpu_ops {
    53		/* hooks for various privileged instructions */
    54		void (*io_delay)(void);
    55	
    56	#ifdef CONFIG_PARAVIRT_XXL
    57		unsigned long (*get_debugreg)(int regno);
    58		void (*set_debugreg)(int regno, unsigned long value);
    59	
    60		unsigned long (*read_cr0)(void);
    61		void (*write_cr0)(unsigned long);
    62	
    63		void (*write_cr4)(unsigned long);
    64	
    65		/* Segment descriptor handling */
    66		void (*load_tr_desc)(void);
    67		void (*load_gdt)(const struct desc_ptr *);
    68		void (*load_idt)(const struct desc_ptr *);
    69		void (*set_ldt)(const void *desc, unsigned entries);
    70		unsigned long (*store_tr)(void);
    71		void (*load_tls)(struct thread_struct *t, unsigned int cpu);
    72		void (*load_gs_index)(unsigned int idx);
    73		void (*write_ldt_entry)(struct desc_struct *ldt, int entrynum,
    74					const void *desc);
    75		void (*write_gdt_entry)(struct desc_struct *,
    76					int entrynum, const void *desc, int size);
    77		void (*write_idt_entry)(gate_desc *,
    78					int entrynum, const gate_desc *gate);
    79		void (*alloc_ldt)(struct desc_struct *ldt, unsigned entries);
    80		void (*free_ldt)(struct desc_struct *ldt, unsigned entries);
    81	
    82		void (*load_sp0)(unsigned long sp0);
    83	
    84	#ifdef CONFIG_X86_IOPL_IOPERM
    85		void (*invalidate_io_bitmap)(void);
    86		void (*update_io_bitmap)(void);
    87	#endif
    88	
    89		/* cpuid emulation, mostly so that caps bits can be disabled */
    90		void (*cpuid)(unsigned int *eax, unsigned int *ebx,
    91			      unsigned int *ecx, unsigned int *edx);
    92	
    93		void (*start_context_switch)(struct task_struct *prev);
    94		void (*end_context_switch)(struct task_struct *next);
    95	#endif
    96	} __no_randomize_layout;
    97	
    98	struct pv_irq_ops {
    99	#ifdef CONFIG_PARAVIRT_XXL
   100		/*
   101		 * Get/set interrupt state.  save_fl is expected to use X86_EFLAGS_IF;
   102		 * all other bits returned from save_fl are undefined.
   103		 *
   104		 * NOTE: These functions callers expect the callee to preserve
   105		 * more registers than the standard C calling convention.
   106		 */
   107		struct paravirt_callee_save save_fl;
   108		struct paravirt_callee_save irq_disable;
   109		struct paravirt_callee_save irq_enable;
   110	#endif
   111		void (*safe_halt)(void);
   112		void (*halt)(void);
   113	} __no_randomize_layout;
   114	
   115	struct pv_mmu_ops {
   116		/* TLB operations */
   117		void (*flush_tlb_user)(void);
   118		void (*flush_tlb_kernel)(void);
   119		void (*flush_tlb_one_user)(unsigned long addr);
   120		void (*flush_tlb_multi)(const struct cpumask *cpus,
   121					const struct flush_tlb_info *info);
   122	
   123		/* Hook for intercepting the destruction of an mm_struct. */
   124		void (*exit_mmap)(struct mm_struct *mm);
   125		void (*notify_page_enc_status_changed)(unsigned long pfn, int npages, bool enc);
   126	
   127	#ifdef CONFIG_PARAVIRT_XXL
   128		struct paravirt_callee_save read_cr2;
   129		void (*write_cr2)(unsigned long);
   130	
   131		unsigned long (*read_cr3)(void);
   132		void (*write_cr3)(unsigned long);
   133	
   134		/* Hook for intercepting the creation/use of an mm_struct. */
   135		void (*enter_mmap)(struct mm_struct *mm);
   136	
   137		/* Hooks for allocating and freeing a pagetable top-level */
   138		int  (*pgd_alloc)(struct mm_struct *mm);
   139		void (*pgd_free)(struct mm_struct *mm, pgd_t *pgd);
   140	
   141		/*
   142		 * Hooks for allocating/releasing pagetable pages when they're
   143		 * attached to a pagetable
   144		 */
   145		void (*alloc_pte)(struct mm_struct *mm, unsigned long pfn);
   146		void (*alloc_pmd)(struct mm_struct *mm, unsigned long pfn);
   147		void (*alloc_pud)(struct mm_struct *mm, unsigned long pfn);
   148		void (*alloc_p4d)(struct mm_struct *mm, unsigned long pfn);
   149		void (*release_pte)(unsigned long pfn);
   150		void (*release_pmd)(unsigned long pfn);
   151		void (*release_pud)(unsigned long pfn);
   152		void (*release_p4d)(unsigned long pfn);
   153	
   154		/* Pagetable manipulation functions */
   155		void (*set_pte)(pte_t *ptep, pte_t pteval);
   156		void (*set_pmd)(pmd_t *pmdp, pmd_t pmdval);
   157	
   158		pte_t (*ptep_modify_prot_start)(struct vm_area_struct *vma, unsigned long addr,
   159						pte_t *ptep);
   160		void (*ptep_modify_prot_commit)(struct vm_area_struct *vma, unsigned long addr,
   161						pte_t *ptep, pte_t pte);
   162	
   163		struct paravirt_callee_save pte_val;
   164		struct paravirt_callee_save make_pte;
   165	
   166		struct paravirt_callee_save pgd_val;
   167		struct paravirt_callee_save make_pgd;
   168	
   169		void (*set_pud)(pud_t *pudp, pud_t pudval);
   170	
   171		struct paravirt_callee_save pmd_val;
   172		struct paravirt_callee_save make_pmd;
   173	
   174		struct paravirt_callee_save pud_val;
   175		struct paravirt_callee_save make_pud;
   176	
   177		void (*set_p4d)(p4d_t *p4dp, p4d_t p4dval);
   178	
   179	#if CONFIG_PGTABLE_LEVELS >= 5
   180		struct paravirt_callee_save p4d_val;
   181		struct paravirt_callee_save make_p4d;
   182	
   183		void (*set_pgd)(pgd_t *pgdp, pgd_t pgdval);
   184	#endif	/* CONFIG_PGTABLE_LEVELS >= 5 */
   185	
   186		struct pv_lazy_ops lazy_mode;
   187	
   188		/* dom0 ops */
   189	
   190		/* Sometimes the physical address is a pfn, and sometimes its
   191		   an mfn.  We can tell which is which from the index. */
   192		void (*set_fixmap)(unsigned /* enum fixed_addresses */ idx,
   193				   phys_addr_t phys, pgprot_t flags);
   194	#endif
   195	} __no_randomize_layout;
   196	
   197	struct arch_spinlock;
   198	#ifdef CONFIG_SMP
   199	#include <asm/spinlock_types.h>
   200	#endif
   201	
   202	struct qspinlock;
   203	
   204	struct pv_lock_ops {
   205		void (*queued_spin_lock_slowpath)(struct qspinlock *lock, u32 val);
   206		struct paravirt_callee_save queued_spin_unlock;
   207	
   208		void (*wait)(u8 *ptr, u8 val);
   209		void (*kick)(int cpu);
   210	
   211		struct paravirt_callee_save vcpu_is_preempted;
   212	} __no_randomize_layout;
   213	
   214	/* This contains all the paravirt structures: we get a convenient
   215	 * number for each function using the offset which we use to indicate
   216	 * what to patch. */
   217	struct paravirt_patch_template {
   218		struct pv_cpu_ops	cpu;
   219		struct pv_irq_ops	irq;
   220		struct pv_mmu_ops	mmu;
   221		struct pv_lock_ops	lock;
   222	} __no_randomize_layout;
   223	
   224	extern struct pv_info pv_info;
   225	extern struct paravirt_patch_template pv_ops;
   226	
   227	#define paravirt_ptr(op)	[paravirt_opptr] "m" (pv_ops.op)
   228	
   229	/*
   230	 * This generates an indirect call based on the operation type number.
   231	 *
   232	 * Since alternatives run after enabling CET/IBT -- the latter setting/clearing
   233	 * capabilities and the former requiring all capabilities being finalized --
   234	 * these indirect calls are subject to IBT and the paravirt stubs should have
   235	 * ENDBR on.
   236	 *
   237	 * OTOH since this is effectively a __nocfi indirect call, the paravirt stubs
   238	 * don't need to bother with CFI prefixes.
   239	 */
   240	#define PARAVIRT_CALL					\
   241		ANNOTATE_RETPOLINE_SAFE				\
   242		"call *%[paravirt_opptr];"
   243	
   244	/*
   245	 * These macros are intended to wrap calls through one of the paravirt
   246	 * ops structs, so that they can be later identified and patched at
   247	 * runtime.
   248	 *
   249	 * Normally, a call to a pv_op function is a simple indirect call:
   250	 * (pv_op_struct.operations)(args...).
   251	 *
   252	 * Unfortunately, this is a relatively slow operation for modern CPUs,
   253	 * because it cannot necessarily determine what the destination
   254	 * address is.  In this case, the address is a runtime constant, so at
   255	 * the very least we can patch the call to a simple direct call, or,
   256	 * ideally, patch an inline implementation into the callsite.  (Direct
   257	 * calls are essentially free, because the call and return addresses
   258	 * are completely predictable.)
   259	 *
   260	 * For i386, these macros rely on the standard gcc "regparm(3)" calling
   261	 * convention, in which the first three arguments are placed in %eax,
   262	 * %edx, %ecx (in that order), and the remaining arguments are placed
   263	 * on the stack.  All caller-save registers (eax,edx,ecx) are expected
   264	 * to be modified (either clobbered or used for return values).
   265	 * X86_64, on the other hand, already specifies a register-based calling
   266	 * conventions, returning at %rax, with parameters going in %rdi, %rsi,
   267	 * %rdx, and %rcx. Note that for this reason, x86_64 does not need any
   268	 * special handling for dealing with 4 arguments, unlike i386.
   269	 * However, x86_64 also has to clobber all caller saved registers, which
   270	 * unfortunately, are quite a bit (r8 - r11)
   271	 *
   272	 * Unfortunately there's no way to get gcc to generate the args setup
   273	 * for the call, and then allow the call itself to be generated by an
   274	 * inline asm.  Because of this, we must do the complete arg setup and
   275	 * return value handling from within these macros.  This is fairly
   276	 * cumbersome.
   277	 *
   278	 * There are 5 sets of PVOP_* macros for dealing with 0-4 arguments.
   279	 * It could be extended to more arguments, but there would be little
   280	 * to be gained from that.  For each number of arguments, there are
   281	 * two VCALL and CALL variants for void and non-void functions.
   282	 *
   283	 * When there is a return value, the invoker of the macro must specify
   284	 * the return type.  The macro then uses sizeof() on that type to
   285	 * determine whether it's a 32 or 64 bit value and places the return
   286	 * in the right register(s) (just %eax for 32-bit, and %edx:%eax for
   287	 * 64-bit). For x86_64 machines, it just returns in %rax regardless of
   288	 * the return value size.
   289	 *
   290	 * 64-bit arguments are passed as a pair of adjacent 32-bit arguments;
   291	 * i386 also passes 64-bit arguments as a pair of adjacent 32-bit arguments
   292	 * in low,high order
   293	 *
   294	 * Small structures are passed and returned in registers.  The macro
   295	 * calling convention can't directly deal with this, so the wrapper
   296	 * functions must do it.
   297	 *
   298	 * These PVOP_* macros are only defined within this header.  This
   299	 * means that all uses must be wrapped in inline functions.  This also
   300	 * makes sure the incoming and outgoing types are always correct.
   301	 */
   302	#ifdef CONFIG_X86_32
   303	#define PVOP_CALL_ARGS							\
   304		unsigned long __eax = __eax, __edx = __edx, __ecx = __ecx;
   305	
   306	#define PVOP_CALL_ARG1(x)		"a" ((unsigned long)(x))
   307	#define PVOP_CALL_ARG2(x)		"d" ((unsigned long)(x))
   308	#define PVOP_CALL_ARG3(x)		"c" ((unsigned long)(x))
   309	
   310	#define PVOP_VCALL_CLOBBERS		"=a" (__eax), "=d" (__edx),	\
   311						"=c" (__ecx)
   312	#define PVOP_CALL_CLOBBERS		PVOP_VCALL_CLOBBERS
   313	
   314	#define PVOP_VCALLEE_CLOBBERS		"=a" (__eax), "=d" (__edx)
   315	#define PVOP_CALLEE_CLOBBERS		PVOP_VCALLEE_CLOBBERS
   316	
   317	#define EXTRA_CLOBBERS
   318	#define VEXTRA_CLOBBERS
   319	#else  /* CONFIG_X86_64 */
   320	/* [re]ax isn't an arg, but the return val */
   321	#define PVOP_CALL_ARGS						\
   322		unsigned long __edi = __edi, __esi = __esi,		\
   323			__edx = __edx, __ecx = __ecx, __eax = __eax;
   324	
   325	#define PVOP_CALL_ARG1(x)		"D" ((unsigned long)(x))
   326	#define PVOP_CALL_ARG2(x)		"S" ((unsigned long)(x))
   327	#define PVOP_CALL_ARG3(x)		"d" ((unsigned long)(x))
   328	#define PVOP_CALL_ARG4(x)		"c" ((unsigned long)(x))
   329	
   330	#define PVOP_VCALL_CLOBBERS	"=D" (__edi),				\
   331					"=S" (__esi), "=d" (__edx),		\
   332					"=c" (__ecx)
   333	#define PVOP_CALL_CLOBBERS	PVOP_VCALL_CLOBBERS, "=a" (__eax)
   334	
   335	/*
   336	 * void functions are still allowed [re]ax for scratch.
   337	 *
   338	 * The ZERO_CALL_USED REGS feature may end up zeroing out callee-saved
   339	 * registers. Make sure we model this with the appropriate clobbers.
   340	 */
   341	#ifdef CONFIG_ZERO_CALL_USED_REGS
   342	#define PVOP_VCALLEE_CLOBBERS	"=a" (__eax), PVOP_VCALL_CLOBBERS
   343	#else
   344	#define PVOP_VCALLEE_CLOBBERS	"=a" (__eax)
   345	#endif
   346	#define PVOP_CALLEE_CLOBBERS	PVOP_VCALLEE_CLOBBERS
   347	
   348	#define EXTRA_CLOBBERS	 , "r8", "r9", "r10", "r11"
   349	#define VEXTRA_CLOBBERS	 , "rax", "r8", "r9", "r10", "r11"
   350	#endif	/* CONFIG_X86_32 */
   351	
   352	#ifdef CONFIG_PARAVIRT_DEBUG
   353	#define PVOP_TEST_NULL(op)	BUG_ON(pv_ops.op == NULL)
   354	#else
   355	#define PVOP_TEST_NULL(op)	((void)pv_ops.op)
   356	#endif
   357	
   358	#define PVOP_RETVAL(rettype)						\
   359		({	unsigned long __mask = ~0UL;				\
   360			BUILD_BUG_ON(sizeof(rettype) > sizeof(unsigned long));	\
   361			switch (sizeof(rettype)) {				\
   362			case 1: __mask =       0xffUL; break;			\
   363			case 2: __mask =     0xffffUL; break;			\
   364			case 4: __mask = 0xffffffffUL; break;			\
   365			default: break;						\
   366			}							\
   367			__mask & __eax;						\
   368		})
   369	
   370	/*
   371	 * Use alternative patching for paravirt calls:
   372	 * - For replacing an indirect call with a direct one, use the "normal"
   373	 *   ALTERNATIVE() macro with the indirect call as the initial code sequence,
   374	 *   which will be replaced with the related direct call by using the
   375	 *   ALT_FLAG_DIRECT_CALL special case and the "always on" feature.
   376	 * - In case the replacement is either a direct call or a short code sequence
   377	 *   depending on a feature bit, the ALTERNATIVE_2() macro is being used.
   378	 *   The indirect call is the initial code sequence again, while the special
   379	 *   code sequence is selected with the specified feature bit. In case the
   380	 *   feature is not active, the direct call is used as above via the
   381	 *   ALT_FLAG_DIRECT_CALL special case and the "always on" feature.
   382	 */
   383	#define ____PVOP_CALL(ret, op, call_clbr, extra_clbr, ...)	\
   384		({								\
   385			PVOP_CALL_ARGS;						\
   386			PVOP_TEST_NULL(op);					\
   387			asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR,	\
   388					ALT_CALL_ALWAYS)			\
   389				     : call_clbr, ASM_CALL_CONSTRAINT		\
   390				     : paravirt_ptr(op),			\
   391				       ##__VA_ARGS__				\
   392				     : "memory", "cc" extra_clbr);		\
   393			ret;							\
   394		})
   395	
   396	#define ____PVOP_ALT_CALL(ret, op, alt, cond, call_clbr,		\
   397				  extra_clbr, ...)				\
   398		({								\
   399			PVOP_CALL_ARGS;						\
   400			PVOP_TEST_NULL(op);					\
   401			asm volatile(ALTERNATIVE_2(PARAVIRT_CALL,		\
   402					 ALT_CALL_INSTR, ALT_CALL_ALWAYS,	\
   403					 alt, cond)				\
   404				     : call_clbr, ASM_CALL_CONSTRAINT		\
   405				     : paravirt_ptr(op),			\
   406				       ##__VA_ARGS__				\
   407				     : "memory", "cc" extra_clbr);		\
   408			ret;							\
   409		})
   410	
   411	#define __PVOP_CALL(rettype, op, ...)					\
   412		____PVOP_CALL(PVOP_RETVAL(rettype), op,				\
   413			      PVOP_CALL_CLOBBERS, EXTRA_CLOBBERS, ##__VA_ARGS__)
   414	
   415	#define __PVOP_ALT_CALL(rettype, op, alt, cond, ...)			\
   416		____PVOP_ALT_CALL(PVOP_RETVAL(rettype), op, alt, cond,		\
   417				  PVOP_CALL_CLOBBERS, EXTRA_CLOBBERS,		\
   418				  ##__VA_ARGS__)
   419	
   420	#define __PVOP_CALLEESAVE(rettype, op, ...)				\
   421		____PVOP_CALL(PVOP_RETVAL(rettype), op.func,			\
   422			      PVOP_CALLEE_CLOBBERS, , ##__VA_ARGS__)
   423	
   424	#define __PVOP_ALT_CALLEESAVE(rettype, op, alt, cond, ...)		\
   425		____PVOP_ALT_CALL(PVOP_RETVAL(rettype), op.func, alt, cond,	\
   426				  PVOP_CALLEE_CLOBBERS, , ##__VA_ARGS__)
   427	
   428	
   429	#define __PVOP_VCALL(op, ...)						\
   430		(void)____PVOP_CALL(, op, PVOP_VCALL_CLOBBERS,			\
   431			       VEXTRA_CLOBBERS, ##__VA_ARGS__)
   432	
   433	#define __PVOP_ALT_VCALL(op, alt, cond, ...)				\
   434		(void)____PVOP_ALT_CALL(, op, alt, cond,			\
   435					PVOP_VCALL_CLOBBERS, VEXTRA_CLOBBERS,	\
   436					##__VA_ARGS__)
   437	
   438	#define __PVOP_VCALLEESAVE(op, ...)					\
   439		(void)____PVOP_CALL(, op.func,					\
   440				    PVOP_VCALLEE_CLOBBERS, , ##__VA_ARGS__)
   441	
   442	#define __PVOP_ALT_VCALLEESAVE(op, alt, cond, ...)			\
   443		(void)____PVOP_ALT_CALL(, op.func, alt, cond,			\
   444					PVOP_VCALLEE_CLOBBERS, , ##__VA_ARGS__)
   445	
   446	
   447	#define PVOP_CALL0(rettype, op)						\
   448		__PVOP_CALL(rettype, op)
   449	#define PVOP_VCALL0(op)							\
   450		__PVOP_VCALL(op)
   451	#define PVOP_ALT_CALL0(rettype, op, alt, cond)				\
   452		__PVOP_ALT_CALL(rettype, op, alt, cond)
   453	#define PVOP_ALT_VCALL0(op, alt, cond)					\
   454		__PVOP_ALT_VCALL(op, alt, cond)
   455	
   456	#define PVOP_CALLEE0(rettype, op)					\
   457		__PVOP_CALLEESAVE(rettype, op)
   458	#define PVOP_VCALLEE0(op)						\
   459		__PVOP_VCALLEESAVE(op)
   460	#define PVOP_ALT_CALLEE0(rettype, op, alt, cond)			\
   461		__PVOP_ALT_CALLEESAVE(rettype, op, alt, cond)
   462	#define PVOP_ALT_VCALLEE0(op, alt, cond)				\
   463		__PVOP_ALT_VCALLEESAVE(op, alt, cond)
   464	
   465	
   466	#define PVOP_CALL1(rettype, op, arg1)					\
   467		__PVOP_CALL(rettype, op, PVOP_CALL_ARG1(arg1))
   468	#define PVOP_VCALL1(op, arg1)						\
   469		__PVOP_VCALL(op, PVOP_CALL_ARG1(arg1))
   470	#define PVOP_ALT_VCALL1(op, arg1, alt, cond)				\
   471		__PVOP_ALT_VCALL(op, alt, cond, PVOP_CALL_ARG1(arg1))
   472	
   473	#define PVOP_CALLEE1(rettype, op, arg1)					\
   474		__PVOP_CALLEESAVE(rettype, op, PVOP_CALL_ARG1(arg1))
   475	#define PVOP_VCALLEE1(op, arg1)						\
   476		__PVOP_VCALLEESAVE(op, PVOP_CALL_ARG1(arg1))
   477	#define PVOP_ALT_CALLEE1(rettype, op, arg1, alt, cond)			\
   478		__PVOP_ALT_CALLEESAVE(rettype, op, alt, cond, PVOP_CALL_ARG1(arg1))
   479	#define PVOP_ALT_VCALLEE1(op, arg1, alt, cond)				\
   480		__PVOP_ALT_VCALLEESAVE(op, alt, cond, PVOP_CALL_ARG1(arg1))
   481	
   482	
   483	#define PVOP_CALL2(rettype, op, arg1, arg2)				\
   484		__PVOP_CALL(rettype, op, PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2))
   485	#define PVOP_VCALL2(op, arg1, arg2)					\
   486		__PVOP_VCALL(op, PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2))
   487	
   488	#define PVOP_CALL3(rettype, op, arg1, arg2, arg3)			\
   489		__PVOP_CALL(rettype, op, PVOP_CALL_ARG1(arg1),			\
   490			    PVOP_CALL_ARG2(arg2), PVOP_CALL_ARG3(arg3))
   491	#define PVOP_VCALL3(op, arg1, arg2, arg3)				\
   492		__PVOP_VCALL(op, PVOP_CALL_ARG1(arg1),				\
   493			     PVOP_CALL_ARG2(arg2), PVOP_CALL_ARG3(arg3))
   494	
   495	#define PVOP_CALL4(rettype, op, arg1, arg2, arg3, arg4)			\
   496		__PVOP_CALL(rettype, op,					\
   497			    PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2),		\
   498			    PVOP_CALL_ARG3(arg3), PVOP_CALL_ARG4(arg4))
   499	#define PVOP_VCALL4(op, arg1, arg2, arg3, arg4)				\
   500		__PVOP_VCALL(op, PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2),	\
   501			     PVOP_CALL_ARG3(arg3), PVOP_CALL_ARG4(arg4))
   502	
   503	unsigned long paravirt_ret0(void);
   504	#ifdef CONFIG_PARAVIRT_XXL
   505	u64 _paravirt_ident_64(u64);
   506	unsigned long pv_native_save_fl(void);
   507	void pv_native_irq_disable(void);
   508	void pv_native_irq_enable(void);
   509	unsigned long pv_native_read_cr2(void);
   510	#endif
   511	
   512	#define paravirt_nop	((void *)nop_func)
   513	
   514	#endif	/* __ASSEMBLER__ */
   515	
   516	#define ALT_NOT_XEN	ALT_NOT(X86_FEATURE_XENPV)
   517	
   518	#endif	/* CONFIG_PARAVIRT */
   519	
   520	#ifndef __ASSEMBLER__
 > 521	#include <linux/types.h>
   522	enum pv_msr_action {
   523		PV_MSR_NATIVE,
   524		PV_MSR_PV,
   525		PV_MSR_IGNORE,
   526	};
   527	#endif
   528	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
