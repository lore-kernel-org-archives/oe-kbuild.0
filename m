Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A685D11190
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Apr 2024 14:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713710283; cv=none; b=EQg0+9hejpjJAl0zCebupUsVMHtzN2p1wHqvzCEvtqNDfUQpwukcYFTq6GBQ9MzQ/kPeVXVHnCEX1Sh9JH/gyPr8AjAaEcQj0Gs2iWFJgQkJZWnMg3m4qiq5b6dBDwP2CbFay9ULpab5QMIWdlvrPN8NL6jOO5cZbnTUBhEP6TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713710283; c=relaxed/simple;
	bh=pRjWyqoRrd/PfWAC72U+363jDcDloH1JyDFBtnxRSE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hQcCPzKOoXJNly2mm7anBkykR8t6AaMBZTBit9V0FvgnWVzQ973es2syEXFZJPqKWG+oAxJ2a11HXZ3NFK0l0F2yP9FBDYYjDRUNazTbvDouYYA3aIN+uytnLrbl6jf/5cf5Q6vFamf4/vDru8F1GVSZbaGnCiQVed37Nv/gX44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5AkLRBY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5AkLRBY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713710280; x=1745246280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pRjWyqoRrd/PfWAC72U+363jDcDloH1JyDFBtnxRSE0=;
  b=L5AkLRBY3Dm8GArGWjIgR09Gfwdt0GzxPK6ow43SfjhvpyucISaU8oJ/
   KwVZPJBL1Zkvf0bnYpf74sEpLx7ozutkbeM5CPdkEx5IRiFUDVvJ9tFWL
   rn4IL0DK1K0VaeE7WjuZ2CNTHAicLObXBgSTl19FbijXKarqNQOIKhCec
   QjJ1v8VaU7ITBSfmGHN2wK7LW0t7+lu4PwKZaDXrCz0+YSRAqma4n789L
   TMnDq6gXIFSn6V4D9hbiZuXJxmFkqt8rW7T1dnONnp574fOPI37H9+nXu
   KhlzOgW4JKdXtGfy5EuOXEUuEm+1CfBmYmvZTz0BQQrC1uI/8k52QZwbt
   Q==;
X-CSE-ConnectionGUID: EOuQLrEVRFmAyj3xXne1pQ==
X-CSE-MsgGUID: CzfIK++TQP+R5CUbUfocyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11050"; a="9131270"
X-IronPort-AV: E=Sophos;i="6.07,218,1708416000"; 
   d="scan'208";a="9131270"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2024 07:38:00 -0700
X-CSE-ConnectionGUID: J/OVqitXTU2ZdECVcIdSJQ==
X-CSE-MsgGUID: JMw/FQRaSUmyfOa0CIftWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,218,1708416000"; 
   d="scan'208";a="28443446"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Apr 2024 07:37:58 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryYKK-000Bxy-0E;
	Sun, 21 Apr 2024 14:37:56 +0000
Date: Sun, 21 Apr 2024 22:37:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-tdx:guest-next 7/7] arch/x86/include/asm/paravirt.h:
 asm/msr.h is included more than once.
Message-ID: <202404212231.BtP0WVvu-lkp@intel.com>
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
TO: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

tree:   https://github.com/intel/tdx.git guest-next
head:   6ccb8342bc93d636c12d7958f58d1b4e855eee14
commit: 6ccb8342bc93d636c12d7958f58d1b4e855eee14 [7/7] x86/tdx: Fix compilation issues
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404212231.BtP0WVvu-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/include/asm/paravirt.h: asm/msr.h is included more than once.

vim +8 arch/x86/include/asm/paravirt.h

   > 8	#include <asm/msr.h>
     9	
    10	#ifndef __ASSEMBLY__
    11	struct mm_struct;
    12	#endif
    13	
    14	#ifdef CONFIG_PARAVIRT
    15	#include <asm/pgtable_types.h>
    16	#include <asm/asm.h>
    17	#include <asm/nospec-branch.h>
    18	
    19	#ifndef __ASSEMBLY__
    20	#include <linux/bug.h>
    21	#include <linux/types.h>
    22	#include <linux/cpumask.h>
    23	#include <linux/static_call_types.h>
    24	#include <asm/frame.h>
    25	
    26	struct mm_struct;
    27	
    28	u64 dummy_steal_clock(int cpu);
    29	u64 dummy_sched_clock(void);
    30	
    31	DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
    32	DECLARE_STATIC_CALL(pv_sched_clock, dummy_sched_clock);
    33	
    34	void paravirt_set_sched_clock(u64 (*func)(void));
    35	
    36	static __always_inline u64 paravirt_sched_clock(void)
    37	{
    38		return static_call(pv_sched_clock)();
    39	}
    40	
    41	struct static_key;
    42	extern struct static_key paravirt_steal_enabled;
    43	extern struct static_key paravirt_steal_rq_enabled;
    44	
    45	__visible void __native_queued_spin_unlock(struct qspinlock *lock);
    46	bool pv_is_native_spin_unlock(void);
    47	__visible bool __native_vcpu_is_preempted(long cpu);
    48	bool pv_is_native_vcpu_is_preempted(void);
    49	
    50	static inline u64 paravirt_steal_clock(int cpu)
    51	{
    52		return static_call(pv_steal_clock)(cpu);
    53	}
    54	
    55	#ifdef CONFIG_PARAVIRT_SPINLOCKS
    56	void __init paravirt_set_cap(void);
    57	#endif
    58	
    59	/* The paravirtualized I/O functions */
    60	static inline void slow_down_io(void)
    61	{
    62		PVOP_VCALL0(cpu.io_delay);
    63	#ifdef REALLY_SLOW_IO
    64		PVOP_VCALL0(cpu.io_delay);
    65		PVOP_VCALL0(cpu.io_delay);
    66		PVOP_VCALL0(cpu.io_delay);
    67	#endif
    68	}
    69	
    70	void native_flush_tlb_local(void);
    71	void native_flush_tlb_global(void);
    72	void native_flush_tlb_one_user(unsigned long addr);
    73	void native_flush_tlb_multi(const struct cpumask *cpumask,
    74				     const struct flush_tlb_info *info);
    75	
    76	static inline void __flush_tlb_local(void)
    77	{
    78		PVOP_VCALL0(mmu.flush_tlb_user);
    79	}
    80	
    81	static inline void __flush_tlb_global(void)
    82	{
    83		PVOP_VCALL0(mmu.flush_tlb_kernel);
    84	}
    85	
    86	static inline void __flush_tlb_one_user(unsigned long addr)
    87	{
    88		PVOP_VCALL1(mmu.flush_tlb_one_user, addr);
    89	}
    90	
    91	static inline void __flush_tlb_multi(const struct cpumask *cpumask,
    92					      const struct flush_tlb_info *info)
    93	{
    94		PVOP_VCALL2(mmu.flush_tlb_multi, cpumask, info);
    95	}
    96	
    97	static inline void paravirt_tlb_remove_table(struct mmu_gather *tlb, void *table)
    98	{
    99		PVOP_VCALL2(mmu.tlb_remove_table, tlb, table);
   100	}
   101	
   102	static inline void paravirt_arch_exit_mmap(struct mm_struct *mm)
   103	{
   104		PVOP_VCALL1(mmu.exit_mmap, mm);
   105	}
   106	
   107	static inline void notify_page_enc_status_changed(unsigned long pfn,
   108							  int npages, bool enc)
   109	{
   110		PVOP_VCALL3(mmu.notify_page_enc_status_changed, pfn, npages, enc);
   111	}
   112	
   113	static inline void paravirt_write_msr(unsigned msr,
   114					      unsigned low, unsigned high)
   115	{
   116		PVOP_VCALL3(cpu.write_msr, msr, low, high);
   117	}
   118	
   119	static inline void wrmsrl(unsigned msr, u64 val)
   120	{
   121		paravirt_write_msr(msr, (u32)val, (u32)(val>>32));
   122	}
   123	
   124	#ifdef CONFIG_PARAVIRT_XXL
   125	static inline void load_sp0(unsigned long sp0)
   126	{
   127		PVOP_VCALL1(cpu.load_sp0, sp0);
   128	}
   129	
   130	/* The paravirtualized CPUID instruction. */
   131	static inline void __cpuid(unsigned int *eax, unsigned int *ebx,
   132				   unsigned int *ecx, unsigned int *edx)
   133	{
   134		PVOP_VCALL4(cpu.cpuid, eax, ebx, ecx, edx);
   135	}
   136	
   137	/*
   138	 * These special macros can be used to get or set a debugging register
   139	 */
   140	static __always_inline unsigned long paravirt_get_debugreg(int reg)
   141	{
   142		return PVOP_CALL1(unsigned long, cpu.get_debugreg, reg);
   143	}
   144	#define get_debugreg(var, reg) var = paravirt_get_debugreg(reg)
   145	static __always_inline void set_debugreg(unsigned long val, int reg)
   146	{
   147		PVOP_VCALL2(cpu.set_debugreg, reg, val);
   148	}
   149	
   150	static inline unsigned long read_cr0(void)
   151	{
   152		return PVOP_CALL0(unsigned long, cpu.read_cr0);
   153	}
   154	
   155	static inline void write_cr0(unsigned long x)
   156	{
   157		PVOP_VCALL1(cpu.write_cr0, x);
   158	}
   159	
   160	static __always_inline unsigned long read_cr2(void)
   161	{
   162		return PVOP_ALT_CALLEE0(unsigned long, mmu.read_cr2,
   163					"mov %%cr2, %%rax;", ALT_NOT_XEN);
   164	}
   165	
   166	static __always_inline void write_cr2(unsigned long x)
   167	{
   168		PVOP_VCALL1(mmu.write_cr2, x);
   169	}
   170	
   171	static inline unsigned long __read_cr3(void)
   172	{
   173		return PVOP_ALT_CALL0(unsigned long, mmu.read_cr3,
   174				      "mov %%cr3, %%rax;", ALT_NOT_XEN);
   175	}
   176	
   177	static inline void write_cr3(unsigned long x)
   178	{
   179		PVOP_ALT_VCALL1(mmu.write_cr3, x, "mov %%rdi, %%cr3", ALT_NOT_XEN);
   180	}
   181	
   182	static inline void __write_cr4(unsigned long x)
   183	{
   184		PVOP_VCALL1(cpu.write_cr4, x);
   185	}
   186	
   187	static __always_inline void arch_safe_halt(void)
   188	{
   189		PVOP_VCALL0(irq.safe_halt);
   190	}
   191	
   192	static inline void halt(void)
   193	{
   194		PVOP_VCALL0(irq.halt);
   195	}
   196	
   197	extern noinstr void pv_native_wbinvd(void);
   198	
   199	static __always_inline void wbinvd(void)
   200	{
   201		PVOP_ALT_VCALL0(cpu.wbinvd, "wbinvd", ALT_NOT_XEN);
   202	}
   203	
   204	static inline u64 paravirt_read_msr(unsigned msr)
   205	{
   206		return PVOP_CALL1(u64, cpu.read_msr, msr);
   207	}
   208	
   209	static inline u64 paravirt_read_msr_safe(unsigned msr, int *err)
   210	{
   211		return PVOP_CALL2(u64, cpu.read_msr_safe, msr, err);
   212	}
   213	
   214	static inline int paravirt_write_msr_safe(unsigned msr,
   215						  unsigned low, unsigned high)
   216	{
   217		return PVOP_CALL3(int, cpu.write_msr_safe, msr, low, high);
   218	}
   219	
   220	#define rdmsr(msr, val1, val2)			\
   221	do {						\
   222		u64 _l = paravirt_read_msr(msr);	\
   223		val1 = (u32)_l;				\
   224		val2 = _l >> 32;			\
   225	} while (0)
   226	
   227	#define wrmsr(msr, val1, val2)			\
   228	do {						\
   229		paravirt_write_msr(msr, val1, val2);	\
   230	} while (0)
   231	
   232	#define rdmsrl(msr, val)			\
   233	do {						\
   234		val = paravirt_read_msr(msr);		\
   235	} while (0)
   236	
   237	#define wrmsr_safe(msr, a, b)	paravirt_write_msr_safe(msr, a, b)
   238	
   239	/* rdmsr with exception handling */
   240	#define rdmsr_safe(msr, a, b)				\
   241	({							\
   242		int _err;					\
   243		u64 _l = paravirt_read_msr_safe(msr, &_err);	\
   244		(*a) = (u32)_l;					\
   245		(*b) = _l >> 32;				\
   246		_err;						\
   247	})
   248	
   249	static inline int rdmsrl_safe(unsigned msr, unsigned long long *p)
   250	{
   251		int err;
   252	
   253		*p = paravirt_read_msr_safe(msr, &err);
   254		return err;
   255	}
   256	
   257	static inline unsigned long long paravirt_read_pmc(int counter)
   258	{
   259		return PVOP_CALL1(u64, cpu.read_pmc, counter);
   260	}
   261	
   262	#define rdpmc(counter, low, high)		\
   263	do {						\
   264		u64 _l = paravirt_read_pmc(counter);	\
   265		low = (u32)_l;				\
   266		high = _l >> 32;			\
   267	} while (0)
   268	
   269	#define rdpmcl(counter, val) ((val) = paravirt_read_pmc(counter))
   270	
   271	static inline void paravirt_alloc_ldt(struct desc_struct *ldt, unsigned entries)
   272	{
   273		PVOP_VCALL2(cpu.alloc_ldt, ldt, entries);
   274	}
   275	
   276	static inline void paravirt_free_ldt(struct desc_struct *ldt, unsigned entries)
   277	{
   278		PVOP_VCALL2(cpu.free_ldt, ldt, entries);
   279	}
   280	
   281	static inline void load_TR_desc(void)
   282	{
   283		PVOP_VCALL0(cpu.load_tr_desc);
   284	}
   285	static inline void load_gdt(const struct desc_ptr *dtr)
   286	{
   287		PVOP_VCALL1(cpu.load_gdt, dtr);
   288	}
   289	static inline void load_idt(const struct desc_ptr *dtr)
   290	{
   291		PVOP_VCALL1(cpu.load_idt, dtr);
   292	}
   293	static inline void set_ldt(const void *addr, unsigned entries)
   294	{
   295		PVOP_VCALL2(cpu.set_ldt, addr, entries);
   296	}
   297	static inline unsigned long paravirt_store_tr(void)
   298	{
   299		return PVOP_CALL0(unsigned long, cpu.store_tr);
   300	}
   301	
   302	#define store_tr(tr)	((tr) = paravirt_store_tr())
   303	static inline void load_TLS(struct thread_struct *t, unsigned cpu)
   304	{
   305		PVOP_VCALL2(cpu.load_tls, t, cpu);
   306	}
   307	
   308	static inline void load_gs_index(unsigned int gs)
   309	{
   310		PVOP_VCALL1(cpu.load_gs_index, gs);
   311	}
   312	
   313	static inline void write_ldt_entry(struct desc_struct *dt, int entry,
   314					   const void *desc)
   315	{
   316		PVOP_VCALL3(cpu.write_ldt_entry, dt, entry, desc);
   317	}
   318	
   319	static inline void write_gdt_entry(struct desc_struct *dt, int entry,
   320					   void *desc, int type)
   321	{
   322		PVOP_VCALL4(cpu.write_gdt_entry, dt, entry, desc, type);
   323	}
   324	
   325	static inline void write_idt_entry(gate_desc *dt, int entry, const gate_desc *g)
   326	{
   327		PVOP_VCALL3(cpu.write_idt_entry, dt, entry, g);
   328	}
   329	
   330	#ifdef CONFIG_X86_IOPL_IOPERM
   331	static inline void tss_invalidate_io_bitmap(void)
   332	{
   333		PVOP_VCALL0(cpu.invalidate_io_bitmap);
   334	}
   335	
   336	static inline void tss_update_io_bitmap(void)
   337	{
   338		PVOP_VCALL0(cpu.update_io_bitmap);
   339	}
   340	#endif
   341	
   342	static inline void paravirt_enter_mmap(struct mm_struct *next)
   343	{
   344		PVOP_VCALL1(mmu.enter_mmap, next);
   345	}
   346	
   347	static inline int paravirt_pgd_alloc(struct mm_struct *mm)
   348	{
   349		return PVOP_CALL1(int, mmu.pgd_alloc, mm);
   350	}
   351	
   352	static inline void paravirt_pgd_free(struct mm_struct *mm, pgd_t *pgd)
   353	{
   354		PVOP_VCALL2(mmu.pgd_free, mm, pgd);
   355	}
   356	
   357	static inline void paravirt_alloc_pte(struct mm_struct *mm, unsigned long pfn)
   358	{
   359		PVOP_VCALL2(mmu.alloc_pte, mm, pfn);
   360	}
   361	static inline void paravirt_release_pte(unsigned long pfn)
   362	{
   363		PVOP_VCALL1(mmu.release_pte, pfn);
   364	}
   365	
   366	static inline void paravirt_alloc_pmd(struct mm_struct *mm, unsigned long pfn)
   367	{
   368		PVOP_VCALL2(mmu.alloc_pmd, mm, pfn);
   369	}
   370	
   371	static inline void paravirt_release_pmd(unsigned long pfn)
   372	{
   373		PVOP_VCALL1(mmu.release_pmd, pfn);
   374	}
   375	
   376	static inline void paravirt_alloc_pud(struct mm_struct *mm, unsigned long pfn)
   377	{
   378		PVOP_VCALL2(mmu.alloc_pud, mm, pfn);
   379	}
   380	static inline void paravirt_release_pud(unsigned long pfn)
   381	{
   382		PVOP_VCALL1(mmu.release_pud, pfn);
   383	}
   384	
   385	static inline void paravirt_alloc_p4d(struct mm_struct *mm, unsigned long pfn)
   386	{
   387		PVOP_VCALL2(mmu.alloc_p4d, mm, pfn);
   388	}
   389	
   390	static inline void paravirt_release_p4d(unsigned long pfn)
   391	{
   392		PVOP_VCALL1(mmu.release_p4d, pfn);
   393	}
   394	
   395	static inline pte_t __pte(pteval_t val)
   396	{
   397		return (pte_t) { PVOP_ALT_CALLEE1(pteval_t, mmu.make_pte, val,
   398						  "mov %%rdi, %%rax", ALT_NOT_XEN) };
   399	}
   400	
   401	static inline pteval_t pte_val(pte_t pte)
   402	{
   403		return PVOP_ALT_CALLEE1(pteval_t, mmu.pte_val, pte.pte,
   404					"mov %%rdi, %%rax", ALT_NOT_XEN);
   405	}
   406	
   407	static inline pgd_t __pgd(pgdval_t val)
   408	{
   409		return (pgd_t) { PVOP_ALT_CALLEE1(pgdval_t, mmu.make_pgd, val,
   410						  "mov %%rdi, %%rax", ALT_NOT_XEN) };
   411	}
   412	
   413	static inline pgdval_t pgd_val(pgd_t pgd)
   414	{
   415		return PVOP_ALT_CALLEE1(pgdval_t, mmu.pgd_val, pgd.pgd,
   416					"mov %%rdi, %%rax", ALT_NOT_XEN);
   417	}
   418	
   419	#define  __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION
   420	static inline pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr,
   421						   pte_t *ptep)
   422	{
   423		pteval_t ret;
   424	
   425		ret = PVOP_CALL3(pteval_t, mmu.ptep_modify_prot_start, vma, addr, ptep);
   426	
   427		return (pte_t) { .pte = ret };
   428	}
   429	
   430	static inline void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr,
   431						   pte_t *ptep, pte_t old_pte, pte_t pte)
   432	{
   433	
   434		PVOP_VCALL4(mmu.ptep_modify_prot_commit, vma, addr, ptep, pte.pte);
   435	}
   436	
   437	static inline void set_pte(pte_t *ptep, pte_t pte)
   438	{
   439		PVOP_VCALL2(mmu.set_pte, ptep, pte.pte);
   440	}
   441	
   442	static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
   443	{
   444		PVOP_VCALL2(mmu.set_pmd, pmdp, native_pmd_val(pmd));
   445	}
   446	
   447	static inline pmd_t __pmd(pmdval_t val)
   448	{
   449		return (pmd_t) { PVOP_ALT_CALLEE1(pmdval_t, mmu.make_pmd, val,
   450						  "mov %%rdi, %%rax", ALT_NOT_XEN) };
   451	}
   452	
   453	static inline pmdval_t pmd_val(pmd_t pmd)
   454	{
   455		return PVOP_ALT_CALLEE1(pmdval_t, mmu.pmd_val, pmd.pmd,
   456					"mov %%rdi, %%rax", ALT_NOT_XEN);
   457	}
   458	
   459	static inline void set_pud(pud_t *pudp, pud_t pud)
   460	{
   461		PVOP_VCALL2(mmu.set_pud, pudp, native_pud_val(pud));
   462	}
   463	
   464	static inline pud_t __pud(pudval_t val)
   465	{
   466		pudval_t ret;
   467	
   468		ret = PVOP_ALT_CALLEE1(pudval_t, mmu.make_pud, val,
   469				       "mov %%rdi, %%rax", ALT_NOT_XEN);
   470	
   471		return (pud_t) { ret };
   472	}
   473	
   474	static inline pudval_t pud_val(pud_t pud)
   475	{
   476		return PVOP_ALT_CALLEE1(pudval_t, mmu.pud_val, pud.pud,
   477					"mov %%rdi, %%rax", ALT_NOT_XEN);
   478	}
   479	
   480	static inline void pud_clear(pud_t *pudp)
   481	{
   482		set_pud(pudp, native_make_pud(0));
   483	}
   484	
   485	static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
   486	{
   487		p4dval_t val = native_p4d_val(p4d);
   488	
   489		PVOP_VCALL2(mmu.set_p4d, p4dp, val);
   490	}
   491	
   492	#if CONFIG_PGTABLE_LEVELS >= 5
   493	
   494	static inline p4d_t __p4d(p4dval_t val)
   495	{
   496		p4dval_t ret = PVOP_ALT_CALLEE1(p4dval_t, mmu.make_p4d, val,
   497						"mov %%rdi, %%rax", ALT_NOT_XEN);
   498	
   499		return (p4d_t) { ret };
   500	}
   501	
   502	static inline p4dval_t p4d_val(p4d_t p4d)
   503	{
   504		return PVOP_ALT_CALLEE1(p4dval_t, mmu.p4d_val, p4d.p4d,
   505					"mov %%rdi, %%rax", ALT_NOT_XEN);
   506	}
   507	
   508	static inline void __set_pgd(pgd_t *pgdp, pgd_t pgd)
   509	{
   510		PVOP_VCALL2(mmu.set_pgd, pgdp, native_pgd_val(pgd));
   511	}
   512	
   513	#define set_pgd(pgdp, pgdval) do {					\
   514		if (pgtable_l5_enabled())						\
   515			__set_pgd(pgdp, pgdval);				\
   516		else								\
   517			set_p4d((p4d_t *)(pgdp), (p4d_t) { (pgdval).pgd });	\
   518	} while (0)
   519	
   520	#define pgd_clear(pgdp) do {						\
   521		if (pgtable_l5_enabled())					\
   522			set_pgd(pgdp, native_make_pgd(0));			\
   523	} while (0)
   524	
   525	#endif  /* CONFIG_PGTABLE_LEVELS == 5 */
   526	
   527	static inline void p4d_clear(p4d_t *p4dp)
   528	{
   529		set_p4d(p4dp, native_make_p4d(0));
   530	}
   531	
   532	static inline void set_pte_atomic(pte_t *ptep, pte_t pte)
   533	{
   534		set_pte(ptep, pte);
   535	}
   536	
   537	static inline void pte_clear(struct mm_struct *mm, unsigned long addr,
   538				     pte_t *ptep)
   539	{
   540		set_pte(ptep, native_make_pte(0));
   541	}
   542	
   543	static inline void pmd_clear(pmd_t *pmdp)
   544	{
   545		set_pmd(pmdp, native_make_pmd(0));
   546	}
   547	
   548	#define  __HAVE_ARCH_START_CONTEXT_SWITCH
   549	static inline void arch_start_context_switch(struct task_struct *prev)
   550	{
   551		PVOP_VCALL1(cpu.start_context_switch, prev);
   552	}
   553	
   554	static inline void arch_end_context_switch(struct task_struct *next)
   555	{
   556		PVOP_VCALL1(cpu.end_context_switch, next);
   557	}
   558	
   559	#define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
   560	static inline void arch_enter_lazy_mmu_mode(void)
   561	{
   562		PVOP_VCALL0(mmu.lazy_mode.enter);
   563	}
   564	
   565	static inline void arch_leave_lazy_mmu_mode(void)
   566	{
   567		PVOP_VCALL0(mmu.lazy_mode.leave);
   568	}
   569	
   570	static inline void arch_flush_lazy_mmu_mode(void)
   571	{
   572		PVOP_VCALL0(mmu.lazy_mode.flush);
   573	}
   574	
   575	static inline void __set_fixmap(unsigned /* enum fixed_addresses */ idx,
   576					phys_addr_t phys, pgprot_t flags)
   577	{
   578		pv_ops.mmu.set_fixmap(idx, phys, flags);
   579	}
   580	#endif
   581	
   582	#if defined(CONFIG_SMP) && defined(CONFIG_PARAVIRT_SPINLOCKS)
   583	
   584	static __always_inline void pv_queued_spin_lock_slowpath(struct qspinlock *lock,
   585								u32 val)
   586	{
   587		PVOP_VCALL2(lock.queued_spin_lock_slowpath, lock, val);
   588	}
   589	
   590	static __always_inline void pv_queued_spin_unlock(struct qspinlock *lock)
   591	{
   592		PVOP_ALT_VCALLEE1(lock.queued_spin_unlock, lock,
   593				  "movb $0, (%%" _ASM_ARG1 ");",
   594				  ALT_NOT(X86_FEATURE_PVUNLOCK));
   595	}
   596	
   597	static __always_inline void pv_wait(u8 *ptr, u8 val)
   598	{
   599		PVOP_VCALL2(lock.wait, ptr, val);
   600	}
   601	
   602	static __always_inline void pv_kick(int cpu)
   603	{
   604		PVOP_VCALL1(lock.kick, cpu);
   605	}
   606	
   607	static __always_inline bool pv_vcpu_is_preempted(long cpu)
   608	{
   609		return PVOP_ALT_CALLEE1(bool, lock.vcpu_is_preempted, cpu,
   610					"xor %%" _ASM_AX ", %%" _ASM_AX ";",
   611					ALT_NOT(X86_FEATURE_VCPUPREEMPT));
   612	}
   613	
   614	void __raw_callee_save___native_queued_spin_unlock(struct qspinlock *lock);
   615	bool __raw_callee_save___native_vcpu_is_preempted(long cpu);
   616	
   617	#endif /* SMP && PARAVIRT_SPINLOCKS */
   618	
   619	#ifdef CONFIG_X86_32
   620	/* save and restore all caller-save registers, except return value */
   621	#define PV_SAVE_ALL_CALLER_REGS		"pushl %ecx;"
   622	#define PV_RESTORE_ALL_CALLER_REGS	"popl  %ecx;"
   623	#else
   624	/* save and restore all caller-save registers, except return value */
   625	#define PV_SAVE_ALL_CALLER_REGS						\
   626		"push %rcx;"							\
   627		"push %rdx;"							\
   628		"push %rsi;"							\
   629		"push %rdi;"							\
   630		"push %r8;"							\
   631		"push %r9;"							\
   632		"push %r10;"							\
   633		"push %r11;"
   634	#define PV_RESTORE_ALL_CALLER_REGS					\
   635		"pop %r11;"							\
   636		"pop %r10;"							\
   637		"pop %r9;"							\
   638		"pop %r8;"							\
   639		"pop %rdi;"							\
   640		"pop %rsi;"							\
   641		"pop %rdx;"							\
   642		"pop %rcx;"
   643	#endif
   644	
   645	/*
   646	 * Generate a thunk around a function which saves all caller-save
   647	 * registers except for the return value.  This allows C functions to
   648	 * be called from assembler code where fewer than normal registers are
   649	 * available.  It may also help code generation around calls from C
   650	 * code if the common case doesn't use many registers.
   651	 *
   652	 * When a callee is wrapped in a thunk, the caller can assume that all
   653	 * arg regs and all scratch registers are preserved across the
   654	 * call. The return value in rax/eax will not be saved, even for void
   655	 * functions.
   656	 */
   657	#define PV_THUNK_NAME(func) "__raw_callee_save_" #func
   658	#define __PV_CALLEE_SAVE_REGS_THUNK(func, section)			\
   659		extern typeof(func) __raw_callee_save_##func;			\
   660										\
   661		asm(".pushsection " section ", \"ax\";"				\
   662		    ".globl " PV_THUNK_NAME(func) ";"				\
   663		    ".type " PV_THUNK_NAME(func) ", @function;"			\
   664		    ASM_FUNC_ALIGN						\
   665		    PV_THUNK_NAME(func) ":"					\
   666		    ASM_ENDBR							\
   667		    FRAME_BEGIN							\
   668		    PV_SAVE_ALL_CALLER_REGS					\
   669		    "call " #func ";"						\
   670		    PV_RESTORE_ALL_CALLER_REGS					\
   671		    FRAME_END							\
   672		    ASM_RET							\
   673		    ".size " PV_THUNK_NAME(func) ", .-" PV_THUNK_NAME(func) ";"	\
   674		    ".popsection")
   675	
   676	#define PV_CALLEE_SAVE_REGS_THUNK(func)			\
   677		__PV_CALLEE_SAVE_REGS_THUNK(func, ".text")
   678	
   679	/* Get a reference to a callee-save function */
   680	#define PV_CALLEE_SAVE(func)						\
   681		((struct paravirt_callee_save) { __raw_callee_save_##func })
   682	
   683	/* Promise that "func" already uses the right calling convention */
   684	#define __PV_IS_CALLEE_SAVE(func)			\
   685		((struct paravirt_callee_save) { func })
   686	
   687	#ifdef CONFIG_PARAVIRT_XXL
   688	static __always_inline unsigned long arch_local_save_flags(void)
   689	{
   690		return PVOP_ALT_CALLEE0(unsigned long, irq.save_fl, "pushf; pop %%rax;",
   691					ALT_NOT_XEN);
   692	}
   693	
   694	static __always_inline void arch_local_irq_disable(void)
   695	{
   696		PVOP_ALT_VCALLEE0(irq.irq_disable, "cli;", ALT_NOT_XEN);
   697	}
   698	
   699	static __always_inline void arch_local_irq_enable(void)
   700	{
   701		PVOP_ALT_VCALLEE0(irq.irq_enable, "sti;", ALT_NOT_XEN);
   702	}
   703	
   704	static __always_inline unsigned long arch_local_irq_save(void)
   705	{
   706		unsigned long f;
   707	
   708		f = arch_local_save_flags();
   709		arch_local_irq_disable();
   710		return f;
   711	}
   712	#endif
   713	
   714	
   715	/* Make sure as little as possible of this mess escapes. */
   716	#undef PARAVIRT_CALL
   717	#undef __PVOP_CALL
   718	#undef __PVOP_VCALL
   719	#undef PVOP_VCALL0
   720	#undef PVOP_CALL0
   721	#undef PVOP_VCALL1
   722	#undef PVOP_CALL1
   723	#undef PVOP_VCALL2
   724	#undef PVOP_CALL2
   725	#undef PVOP_VCALL3
   726	#undef PVOP_CALL3
   727	#undef PVOP_VCALL4
   728	#undef PVOP_CALL4
   729	
   730	extern void default_banner(void);
   731	void native_pv_lock_init(void) __init;
   732	
   733	#else  /* __ASSEMBLY__ */
   734	
   735	#ifdef CONFIG_X86_64
   736	#ifdef CONFIG_PARAVIRT_XXL
   737	#ifdef CONFIG_DEBUG_ENTRY
   738	
   739	#define PARA_INDIRECT(addr)	*addr(%rip)
   740	
   741	.macro PARA_IRQ_save_fl
   742		ANNOTATE_RETPOLINE_SAFE;
   743		call PARA_INDIRECT(pv_ops+PV_IRQ_save_fl);
   744	.endm
   745	
   746	#define SAVE_FLAGS ALTERNATIVE_2 "PARA_IRQ_save_fl;",			\
   747					 "ALT_CALL_INSTR;", ALT_CALL_ALWAYS,	\
   748					 "pushf; pop %rax;", ALT_NOT_XEN
   749	#endif
   750	#endif /* CONFIG_PARAVIRT_XXL */
   751	#endif	/* CONFIG_X86_64 */
   752	
   753	#endif /* __ASSEMBLY__ */
   754	#else  /* CONFIG_PARAVIRT */
   755	# define default_banner x86_init_noop
   756	
   757	#ifndef __ASSEMBLY__
   758	static inline void native_pv_lock_init(void)
   759	{
   760	}
   761	#endif
   762	#endif /* !CONFIG_PARAVIRT */
   763	
   764	#ifndef __ASSEMBLY__
   765	
   766	struct mm_struct;
   767	
   768	#ifndef CONFIG_PARAVIRT_XXL
   769	static inline void paravirt_enter_mmap(struct mm_struct *mm)
   770	{
   771	}
   772	#endif
   773	
   774	#ifndef CONFIG_PARAVIRT
   775	
 > 776	#include <asm/msr.h>
   777	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
