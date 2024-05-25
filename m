Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A5CE566
	for <oe-kbuild@lists.linux.dev>; Sat, 25 May 2024 06:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716619232; cv=none; b=AIt2aeJQFwuLnzRE+WsY6awiMzrc3l6gC3ZJx3CI5jFyqOg5RK2JH1y+oBuqk7rL6s8qXxr3e6VQpGW8yT72yXsArGlpZGXDx9jBt2YabYxlHktsn7iu57m5GGjK/WVN+r4aoif49zi4AujxIghOnzRaoZzEg1aSYoYB3xm6LFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716619232; c=relaxed/simple;
	bh=hP6p5Kc34PB4G3N6AlxEhogWkbk86XZ7QUwfMs62yRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M7RBWFdjD0KQYE3grORzeG+RnG5y3K66bWlLqSXeM7gJxjsquikM9II24Nuv0SWj4evMbvieYfgFdurIOP9DXfncHaIpTnqMOnO09oH1W7mp6caN68F/vwFSWqKZZChacNcDtmauWhqmM7HbaoVUXaJch+6+IH0R8x6DAQPmLmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jr08i+ha; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jr08i+ha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716619227; x=1748155227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hP6p5Kc34PB4G3N6AlxEhogWkbk86XZ7QUwfMs62yRU=;
  b=jr08i+ha6aJUqjoryedvh0XC3MXfkjINHxm/meha8VmGvQ9vHvsJWmIr
   AfwN3FlbHkHva4PRoZz9/U+mkaCFfxfHUxN2Vw3D5UTcn5I3a/c9UvNNU
   W5Yl8Z1tj1nXMo/Gcm+u1azRsCNsZSmNN8wqg0JDxV40RDk5bKRsS7i8n
   TH7EeKFZksEcMnFYUYnsY5yxG8lSLusnWsNWid+LN4A/vQl95getWd1XE
   eKS6+oMcCEO2y4q8rjGSLKF2Pm+nEZWAp3RwTAUn0XuoGQmVRUmzbgfc4
   sdqUG2lWUBbg1w4GR0XAyHAq7dBEcnCme5MjBLIv99BcHz3eOntMFM18r
   g==;
X-CSE-ConnectionGUID: f9TLUyt+RPCzqBWUB358bg==
X-CSE-MsgGUID: nbS4AU6HRVyupJMC6Egusw==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12938082"
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="12938082"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 23:40:26 -0700
X-CSE-ConnectionGUID: VbuMlJknSD2blllBA4WdNA==
X-CSE-MsgGUID: 1F1jEDDAQees88KJQSDJbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="34243665"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 May 2024 23:40:24 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAl4o-0006cd-11;
	Sat, 25 May 2024 06:40:22 +0000
Date: Sat, 25 May 2024 14:40:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:objtool-diff 2/2] kernel/fork.c: linux/livepatch.h is
 included more than once.
Message-ID: <202405251400.UdnwcgiL-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   745009dc796e56fc87e911138d801679ecd3576e
commit: 745009dc796e56fc87e911138d801679ecd3576e [2/2] test
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405251400.UdnwcgiL-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> kernel/fork.c: linux/livepatch.h is included more than once.
--
>> drivers/input/joydev.c: linux/module.h is included more than once.
--
>> drivers/input/misc/pcspkr.c: linux/module.h is included more than once.

vim +93 kernel/fork.c

  > 93	#include <linux/livepatch.h>
    94	#include <linux/thread_info.h>
    95	#include <linux/stackleak.h>
    96	#include <linux/kasan.h>
    97	#include <linux/scs.h>
    98	#include <linux/io_uring.h>
    99	#include <linux/bpf.h>
   100	#include <linux/stackprotector.h>
   101	#include <linux/user_events.h>
   102	#include <linux/iommu.h>
   103	#include <linux/rseq.h>
   104	#include <uapi/linux/pidfd.h>
   105	#include <linux/pidfs.h>
   106	
   107	#include <asm/pgalloc.h>
   108	#include <linux/uaccess.h>
   109	#include <asm/mmu_context.h>
   110	#include <asm/cacheflush.h>
   111	#include <asm/tlbflush.h>
   112	
   113	#include <trace/events/sched.h>
   114	
   115	#define CREATE_TRACE_POINTS
   116	#include <trace/events/task.h>
   117	
   118	/*
   119	 * Minimum number of threads to boot the kernel
   120	 */
   121	#define MIN_THREADS 20
   122	
   123	/*
   124	 * Maximum number of threads
   125	 */
   126	#define MAX_THREADS FUTEX_TID_MASK
   127	
   128	/*
   129	 * Protected counters by write_lock_irq(&tasklist_lock)
   130	 */
   131	unsigned long total_forks;	/* Handle normal Linux uptimes. */
   132	int nr_threads;			/* The idle threads do not count.. */
   133	
   134	static int max_threads;		/* tunable limit on nr_threads */
   135	
   136	#define NAMED_ARRAY_INDEX(x)	[x] = __stringify(x)
   137	
   138	static const char * const resident_page_types[] = {
   139		NAMED_ARRAY_INDEX(MM_FILEPAGES),
   140		NAMED_ARRAY_INDEX(MM_ANONPAGES),
   141		NAMED_ARRAY_INDEX(MM_SWAPENTS),
   142		NAMED_ARRAY_INDEX(MM_SHMEMPAGES),
   143	};
   144	
   145	DEFINE_PER_CPU(unsigned long, process_counts) = 0;
   146	
   147	__cacheline_aligned DEFINE_RWLOCK(tasklist_lock);  /* outer */
   148	
   149	#ifdef CONFIG_PROVE_RCU
   150	int lockdep_tasklist_lock_is_held(void)
   151	{
   152		return lockdep_is_held(&tasklist_lock);
   153	}
   154	EXPORT_SYMBOL_GPL(lockdep_tasklist_lock_is_held);
   155	#endif /* #ifdef CONFIG_PROVE_RCU */
   156	
   157	int nr_processes(void)
   158	{
   159		int cpu;
   160		int total = 0;
   161	
   162		for_each_possible_cpu(cpu)
   163			total += per_cpu(process_counts, cpu);
   164	
   165		return total;
   166	}
   167	
   168	void __weak arch_release_task_struct(struct task_struct *tsk)
   169	{
   170	}
   171	
   172	static struct kmem_cache *task_struct_cachep;
   173	
   174	static inline struct task_struct *alloc_task_struct_node(int node)
   175	{
   176		return kmem_cache_alloc_node(task_struct_cachep, GFP_KERNEL, node);
   177	}
   178	
   179	static inline void free_task_struct(struct task_struct *tsk)
   180	{
   181		kmem_cache_free(task_struct_cachep, tsk);
   182	}
   183	
   184	/*
   185	 * Allocate pages if THREAD_SIZE is >= PAGE_SIZE, otherwise use a
   186	 * kmemcache based allocator.
   187	 */
   188	# if THREAD_SIZE >= PAGE_SIZE || defined(CONFIG_VMAP_STACK)
   189	
   190	#  ifdef CONFIG_VMAP_STACK
   191	/*
   192	 * vmalloc() is a bit slow, and calling vfree() enough times will force a TLB
   193	 * flush.  Try to minimize the number of calls by caching stacks.
   194	 */
   195	#define NR_CACHED_STACKS 2
   196	static DEFINE_PER_CPU(struct vm_struct *, cached_stacks[NR_CACHED_STACKS]);
   197	
   198	struct vm_stack {
   199		struct rcu_head rcu;
   200		struct vm_struct *stack_vm_area;
   201	};
   202	
   203	static bool try_release_thread_stack_to_cache(struct vm_struct *vm)
   204	{
   205		unsigned int i;
   206	
   207		for (i = 0; i < NR_CACHED_STACKS; i++) {
   208			if (this_cpu_cmpxchg(cached_stacks[i], NULL, vm) != NULL)
   209				continue;
   210			return true;
   211		}
   212		return false;
   213	}
   214	
   215	static void thread_stack_free_rcu(struct rcu_head *rh)
   216	{
   217		struct vm_stack *vm_stack = container_of(rh, struct vm_stack, rcu);
   218	
   219		if (try_release_thread_stack_to_cache(vm_stack->stack_vm_area))
   220			return;
   221	
   222		vfree(vm_stack);
   223	}
   224	
   225	static void thread_stack_delayed_free(struct task_struct *tsk)
   226	{
   227		struct vm_stack *vm_stack = tsk->stack;
   228	
   229		vm_stack->stack_vm_area = tsk->stack_vm_area;
   230		call_rcu(&vm_stack->rcu, thread_stack_free_rcu);
   231	}
   232	
   233	static int free_vm_stack_cache(unsigned int cpu)
   234	{
   235		struct vm_struct **cached_vm_stacks = per_cpu_ptr(cached_stacks, cpu);
   236		int i;
   237	
   238		for (i = 0; i < NR_CACHED_STACKS; i++) {
   239			struct vm_struct *vm_stack = cached_vm_stacks[i];
   240	
   241			if (!vm_stack)
   242				continue;
   243	
   244			vfree(vm_stack->addr);
   245			cached_vm_stacks[i] = NULL;
   246		}
   247	
   248		return 0;
   249	}
   250	
   251	static int memcg_charge_kernel_stack(struct vm_struct *vm)
   252	{
   253		int i;
   254		int ret;
   255		int nr_charged = 0;
   256	
   257		BUG_ON(vm->nr_pages != THREAD_SIZE / PAGE_SIZE);
   258	
   259		for (i = 0; i < THREAD_SIZE / PAGE_SIZE; i++) {
   260			ret = memcg_kmem_charge_page(vm->pages[i], GFP_KERNEL, 0);
   261			if (ret)
   262				goto err;
   263			nr_charged++;
   264		}
   265		return 0;
   266	err:
   267		for (i = 0; i < nr_charged; i++)
   268			memcg_kmem_uncharge_page(vm->pages[i], 0);
   269		return ret;
   270	}
   271	
   272	static int alloc_thread_stack_node(struct task_struct *tsk, int node)
   273	{
   274		struct vm_struct *vm;
   275		void *stack;
   276		int i;
   277	
   278		for (i = 0; i < NR_CACHED_STACKS; i++) {
   279			struct vm_struct *s;
   280	
   281			s = this_cpu_xchg(cached_stacks[i], NULL);
   282	
   283			if (!s)
   284				continue;
   285	
   286			/* Reset stack metadata. */
   287			kasan_unpoison_range(s->addr, THREAD_SIZE);
   288	
   289			stack = kasan_reset_tag(s->addr);
   290	
   291			/* Clear stale pointers from reused stack. */
   292			memset(stack, 0, THREAD_SIZE);
   293	
   294			if (memcg_charge_kernel_stack(s)) {
   295				vfree(s->addr);
   296				return -ENOMEM;
   297			}
   298	
   299			tsk->stack_vm_area = s;
   300			tsk->stack = stack;
   301			return 0;
   302		}
   303	
   304		/*
   305		 * Allocated stacks are cached and later reused by new threads,
   306		 * so memcg accounting is performed manually on assigning/releasing
   307		 * stacks to tasks. Drop __GFP_ACCOUNT.
   308		 */
   309		stack = __vmalloc_node_range(THREAD_SIZE, THREAD_ALIGN,
   310					     VMALLOC_START, VMALLOC_END,
   311					     THREADINFO_GFP & ~__GFP_ACCOUNT,
   312					     PAGE_KERNEL,
   313					     0, node, __builtin_return_address(0));
   314		if (!stack)
   315			return -ENOMEM;
   316	
   317		vm = find_vm_area(stack);
   318		if (memcg_charge_kernel_stack(vm)) {
   319			vfree(stack);
   320			return -ENOMEM;
   321		}
   322		/*
   323		 * We can't call find_vm_area() in interrupt context, and
   324		 * free_thread_stack() can be called in interrupt context,
   325		 * so cache the vm_struct.
   326		 */
   327		tsk->stack_vm_area = vm;
   328		stack = kasan_reset_tag(stack);
   329		tsk->stack = stack;
   330		return 0;
   331	}
   332	
   333	static void free_thread_stack(struct task_struct *tsk)
   334	{
   335		if (!try_release_thread_stack_to_cache(tsk->stack_vm_area))
   336			thread_stack_delayed_free(tsk);
   337	
   338		tsk->stack = NULL;
   339		tsk->stack_vm_area = NULL;
   340	}
   341	
   342	#  else /* !CONFIG_VMAP_STACK */
   343	
   344	static void thread_stack_free_rcu(struct rcu_head *rh)
   345	{
   346		__free_pages(virt_to_page(rh), THREAD_SIZE_ORDER);
   347	}
   348	
   349	static void thread_stack_delayed_free(struct task_struct *tsk)
   350	{
   351		struct rcu_head *rh = tsk->stack;
   352	
   353		call_rcu(rh, thread_stack_free_rcu);
   354	}
   355	
   356	static int alloc_thread_stack_node(struct task_struct *tsk, int node)
   357	{
   358		struct page *page = alloc_pages_node(node, THREADINFO_GFP,
   359						     THREAD_SIZE_ORDER);
   360	
   361		if (likely(page)) {
   362			tsk->stack = kasan_reset_tag(page_address(page));
   363			return 0;
   364		}
   365		return -ENOMEM;
   366	}
   367	
   368	static void free_thread_stack(struct task_struct *tsk)
   369	{
   370		thread_stack_delayed_free(tsk);
   371		tsk->stack = NULL;
   372	}
   373	
   374	#  endif /* CONFIG_VMAP_STACK */
   375	# else /* !(THREAD_SIZE >= PAGE_SIZE || defined(CONFIG_VMAP_STACK)) */
   376	
   377	static struct kmem_cache *thread_stack_cache;
   378	
   379	static void thread_stack_free_rcu(struct rcu_head *rh)
   380	{
   381		kmem_cache_free(thread_stack_cache, rh);
   382	}
   383	
   384	static void thread_stack_delayed_free(struct task_struct *tsk)
   385	{
   386		struct rcu_head *rh = tsk->stack;
   387	
   388		call_rcu(rh, thread_stack_free_rcu);
   389	}
   390	
   391	static int alloc_thread_stack_node(struct task_struct *tsk, int node)
   392	{
   393		unsigned long *stack;
   394		stack = kmem_cache_alloc_node(thread_stack_cache, THREADINFO_GFP, node);
   395		stack = kasan_reset_tag(stack);
   396		tsk->stack = stack;
   397		return stack ? 0 : -ENOMEM;
   398	}
   399	
   400	static void free_thread_stack(struct task_struct *tsk)
   401	{
   402		thread_stack_delayed_free(tsk);
   403		tsk->stack = NULL;
   404	}
   405	
   406	void thread_stack_cache_init(void)
   407	{
   408		thread_stack_cache = kmem_cache_create_usercopy("thread_stack",
   409						THREAD_SIZE, THREAD_SIZE, 0, 0,
   410						THREAD_SIZE, NULL);
   411		BUG_ON(thread_stack_cache == NULL);
   412	}
   413	
   414	# endif /* THREAD_SIZE >= PAGE_SIZE || defined(CONFIG_VMAP_STACK) */
   415	
   416	/* SLAB cache for signal_struct structures (tsk->signal) */
   417	static struct kmem_cache *signal_cachep;
   418	
   419	/* SLAB cache for sighand_struct structures (tsk->sighand) */
   420	struct kmem_cache *sighand_cachep;
   421	
   422	/* SLAB cache for files_struct structures (tsk->files) */
   423	struct kmem_cache *files_cachep;
   424	
   425	/* SLAB cache for fs_struct structures (tsk->fs) */
   426	struct kmem_cache *fs_cachep;
   427	
   428	/* SLAB cache for vm_area_struct structures */
   429	static struct kmem_cache *vm_area_cachep;
   430	
   431	/* SLAB cache for mm_struct structures (tsk->mm) */
   432	static struct kmem_cache *mm_cachep;
   433	
   434	#ifdef CONFIG_PER_VMA_LOCK
   435	
   436	/* SLAB cache for vm_area_struct.lock */
   437	static struct kmem_cache *vma_lock_cachep;
   438	
   439	static bool vma_lock_alloc(struct vm_area_struct *vma)
   440	{
   441		vma->vm_lock = kmem_cache_alloc(vma_lock_cachep, GFP_KERNEL);
   442		if (!vma->vm_lock)
   443			return false;
   444	
   445		init_rwsem(&vma->vm_lock->lock);
   446		vma->vm_lock_seq = -1;
   447	
   448		return true;
   449	}
   450	
   451	static inline void vma_lock_free(struct vm_area_struct *vma)
   452	{
   453		kmem_cache_free(vma_lock_cachep, vma->vm_lock);
   454	}
   455	
   456	#else /* CONFIG_PER_VMA_LOCK */
   457	
   458	static inline bool vma_lock_alloc(struct vm_area_struct *vma) { return true; }
   459	static inline void vma_lock_free(struct vm_area_struct *vma) {}
   460	
   461	#endif /* CONFIG_PER_VMA_LOCK */
   462	
   463	struct vm_area_struct *vm_area_alloc(struct mm_struct *mm)
   464	{
   465		struct vm_area_struct *vma;
   466	
   467		vma = kmem_cache_alloc(vm_area_cachep, GFP_KERNEL);
   468		if (!vma)
   469			return NULL;
   470	
   471		vma_init(vma, mm);
   472		if (!vma_lock_alloc(vma)) {
   473			kmem_cache_free(vm_area_cachep, vma);
   474			return NULL;
   475		}
   476	
   477		return vma;
   478	}
   479	
   480	struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
   481	{
   482		struct vm_area_struct *new = kmem_cache_alloc(vm_area_cachep, GFP_KERNEL);
   483	
   484		if (!new)
   485			return NULL;
   486	
   487		ASSERT_EXCLUSIVE_WRITER(orig->vm_flags);
   488		ASSERT_EXCLUSIVE_WRITER(orig->vm_file);
   489		/*
   490		 * orig->shared.rb may be modified concurrently, but the clone
   491		 * will be reinitialized.
   492		 */
   493		data_race(memcpy(new, orig, sizeof(*new)));
   494		if (!vma_lock_alloc(new)) {
   495			kmem_cache_free(vm_area_cachep, new);
   496			return NULL;
   497		}
   498		INIT_LIST_HEAD(&new->anon_vma_chain);
   499		vma_numab_state_init(new);
   500		dup_anon_vma_name(orig, new);
   501	
   502		return new;
   503	}
   504	
   505	void __vm_area_free(struct vm_area_struct *vma)
   506	{
   507		vma_numab_state_free(vma);
   508		free_anon_vma_name(vma);
   509		vma_lock_free(vma);
   510		kmem_cache_free(vm_area_cachep, vma);
   511	}
   512	
   513	#ifdef CONFIG_PER_VMA_LOCK
   514	static void vm_area_free_rcu_cb(struct rcu_head *head)
   515	{
   516		struct vm_area_struct *vma = container_of(head, struct vm_area_struct,
   517							  vm_rcu);
   518	
   519		/* The vma should not be locked while being destroyed. */
   520		VM_BUG_ON_VMA(rwsem_is_locked(&vma->vm_lock->lock), vma);
   521		__vm_area_free(vma);
   522	}
   523	#endif
   524	
   525	void vm_area_free(struct vm_area_struct *vma)
   526	{
   527	#ifdef CONFIG_PER_VMA_LOCK
   528		call_rcu(&vma->vm_rcu, vm_area_free_rcu_cb);
   529	#else
   530		__vm_area_free(vma);
   531	#endif
   532	}
   533	
   534	static void account_kernel_stack(struct task_struct *tsk, int account)
   535	{
   536		if (IS_ENABLED(CONFIG_VMAP_STACK)) {
   537			struct vm_struct *vm = task_stack_vm_area(tsk);
   538			int i;
   539	
   540			for (i = 0; i < THREAD_SIZE / PAGE_SIZE; i++)
   541				mod_lruvec_page_state(vm->pages[i], NR_KERNEL_STACK_KB,
   542						      account * (PAGE_SIZE / 1024));
   543		} else {
   544			void *stack = task_stack_page(tsk);
   545	
   546			/* All stack pages are in the same node. */
   547			mod_lruvec_kmem_state(stack, NR_KERNEL_STACK_KB,
   548					      account * (THREAD_SIZE / 1024));
   549		}
   550	}
   551	
   552	void exit_task_stack_account(struct task_struct *tsk)
   553	{
   554		account_kernel_stack(tsk, -1);
   555	
   556		if (IS_ENABLED(CONFIG_VMAP_STACK)) {
   557			struct vm_struct *vm;
   558			int i;
   559	
   560			vm = task_stack_vm_area(tsk);
   561			for (i = 0; i < THREAD_SIZE / PAGE_SIZE; i++)
   562				memcg_kmem_uncharge_page(vm->pages[i], 0);
   563		}
   564	}
   565	
   566	static void release_task_stack(struct task_struct *tsk)
   567	{
   568		if (WARN_ON(READ_ONCE(tsk->__state) != TASK_DEAD))
   569			return;  /* Better to leak the stack than to free prematurely */
   570	
   571		free_thread_stack(tsk);
   572	}
   573	
   574	#ifdef CONFIG_THREAD_INFO_IN_TASK
   575	void put_task_stack(struct task_struct *tsk)
   576	{
   577		if (refcount_dec_and_test(&tsk->stack_refcount))
   578			release_task_stack(tsk);
   579	}
   580	#endif
   581	
   582	void free_task(struct task_struct *tsk)
   583	{
   584	#ifdef CONFIG_SECCOMP
   585		WARN_ON_ONCE(tsk->seccomp.filter);
   586	#endif
   587		release_user_cpus_ptr(tsk);
   588		scs_release(tsk);
   589	
   590	#ifndef CONFIG_THREAD_INFO_IN_TASK
   591		/*
   592		 * The task is finally done with both the stack and thread_info,
   593		 * so free both.
   594		 */
   595		release_task_stack(tsk);
   596	#else
   597		/*
   598		 * If the task had a separate stack allocation, it should be gone
   599		 * by now.
   600		 */
   601		WARN_ON_ONCE(refcount_read(&tsk->stack_refcount) != 0);
   602	#endif
   603		rt_mutex_debug_task_free(tsk);
   604		ftrace_graph_exit_task(tsk);
   605		arch_release_task_struct(tsk);
   606		if (tsk->flags & PF_KTHREAD)
   607			free_kthread_struct(tsk);
   608		bpf_task_storage_free(tsk);
   609		free_task_struct(tsk);
   610	}
   611	EXPORT_SYMBOL(free_task);
   612	
   613	static void dup_mm_exe_file(struct mm_struct *mm, struct mm_struct *oldmm)
   614	{
   615		struct file *exe_file;
   616	
   617		exe_file = get_mm_exe_file(oldmm);
   618		RCU_INIT_POINTER(mm->exe_file, exe_file);
   619		/*
   620		 * We depend on the oldmm having properly denied write access to the
   621		 * exe_file already.
   622		 */
   623		if (exe_file && deny_write_access(exe_file))
   624			pr_warn_once("deny_write_access() failed in %s\n", __func__);
   625	}
   626	
   627	#ifdef CONFIG_MMU
   628	static __latent_entropy int dup_mmap(struct mm_struct *mm,
   629						struct mm_struct *oldmm)
   630	{
   631		struct vm_area_struct *mpnt, *tmp;
   632		int retval;
   633		unsigned long charge = 0;
   634		LIST_HEAD(uf);
   635		VMA_ITERATOR(vmi, mm, 0);
   636	
   637		uprobe_start_dup_mmap();
   638		if (mmap_write_lock_killable(oldmm)) {
   639			retval = -EINTR;
   640			goto fail_uprobe_end;
   641		}
   642		flush_cache_dup_mm(oldmm);
   643		uprobe_dup_mmap(oldmm, mm);
   644		/*
   645		 * Not linked in yet - no deadlock potential:
   646		 */
   647		mmap_write_lock_nested(mm, SINGLE_DEPTH_NESTING);
   648	
   649		/* No ordering required: file already has been exposed. */
   650		dup_mm_exe_file(mm, oldmm);
   651	
   652		mm->total_vm = oldmm->total_vm;
   653		mm->data_vm = oldmm->data_vm;
   654		mm->exec_vm = oldmm->exec_vm;
   655		mm->stack_vm = oldmm->stack_vm;
   656	
   657		retval = ksm_fork(mm, oldmm);
   658		if (retval)
   659			goto out;
   660		khugepaged_fork(mm, oldmm);
   661	
   662		/* Use __mt_dup() to efficiently build an identical maple tree. */
   663		retval = __mt_dup(&oldmm->mm_mt, &mm->mm_mt, GFP_KERNEL);
   664		if (unlikely(retval))
   665			goto out;
   666	
   667		mt_clear_in_rcu(vmi.mas.tree);
   668		for_each_vma(vmi, mpnt) {
   669			struct file *file;
   670	
   671			vma_start_write(mpnt);
   672			if (mpnt->vm_flags & VM_DONTCOPY) {
   673				retval = vma_iter_clear_gfp(&vmi, mpnt->vm_start,
   674							    mpnt->vm_end, GFP_KERNEL);
   675				if (retval)
   676					goto loop_out;
   677	
   678				vm_stat_account(mm, mpnt->vm_flags, -vma_pages(mpnt));
   679				continue;
   680			}
   681			charge = 0;
   682			/*
   683			 * Don't duplicate many vmas if we've been oom-killed (for
   684			 * example)
   685			 */
   686			if (fatal_signal_pending(current)) {
   687				retval = -EINTR;
   688				goto loop_out;
   689			}
   690			if (mpnt->vm_flags & VM_ACCOUNT) {
   691				unsigned long len = vma_pages(mpnt);
   692	
   693				if (security_vm_enough_memory_mm(oldmm, len)) /* sic */
   694					goto fail_nomem;
   695				charge = len;
   696			}
   697			tmp = vm_area_dup(mpnt);
   698			if (!tmp)
   699				goto fail_nomem;
   700			retval = vma_dup_policy(mpnt, tmp);
   701			if (retval)
   702				goto fail_nomem_policy;
   703			tmp->vm_mm = mm;
   704			retval = dup_userfaultfd(tmp, &uf);
   705			if (retval)
   706				goto fail_nomem_anon_vma_fork;
   707			if (tmp->vm_flags & VM_WIPEONFORK) {
   708				/*
   709				 * VM_WIPEONFORK gets a clean slate in the child.
   710				 * Don't prepare anon_vma until fault since we don't
   711				 * copy page for current vma.
   712				 */
   713				tmp->anon_vma = NULL;
   714			} else if (anon_vma_fork(tmp, mpnt))
   715				goto fail_nomem_anon_vma_fork;
   716			vm_flags_clear(tmp, VM_LOCKED_MASK);
   717			/*
   718			 * Copy/update hugetlb private vma information.
   719			 */
   720			if (is_vm_hugetlb_page(tmp))
   721				hugetlb_dup_vma_private(tmp);
   722	
   723			/*
   724			 * Link the vma into the MT. After using __mt_dup(), memory
   725			 * allocation is not necessary here, so it cannot fail.
   726			 */
   727			vma_iter_bulk_store(&vmi, tmp);
   728	
   729			mm->map_count++;
   730	
   731			if (tmp->vm_ops && tmp->vm_ops->open)
   732				tmp->vm_ops->open(tmp);
   733	
   734			file = tmp->vm_file;
   735			if (file) {
   736				struct address_space *mapping = file->f_mapping;
   737	
   738				get_file(file);
   739				i_mmap_lock_write(mapping);
   740				if (vma_is_shared_maywrite(tmp))
   741					mapping_allow_writable(mapping);
   742				flush_dcache_mmap_lock(mapping);
   743				/* insert tmp into the share list, just after mpnt */
   744				vma_interval_tree_insert_after(tmp, mpnt,
   745						&mapping->i_mmap);
   746				flush_dcache_mmap_unlock(mapping);
   747				i_mmap_unlock_write(mapping);
   748			}
   749	
   750			if (!(tmp->vm_flags & VM_WIPEONFORK))
   751				retval = copy_page_range(tmp, mpnt);
   752	
   753			if (retval) {
   754				mpnt = vma_next(&vmi);
   755				goto loop_out;
   756			}
   757		}
   758		/* a new mm has just been created */
   759		retval = arch_dup_mmap(oldmm, mm);
   760	loop_out:
   761		vma_iter_free(&vmi);
   762		if (!retval) {
   763			mt_set_in_rcu(vmi.mas.tree);
   764		} else if (mpnt) {
   765			/*
   766			 * The entire maple tree has already been duplicated. If the
   767			 * mmap duplication fails, mark the failure point with
   768			 * XA_ZERO_ENTRY. In exit_mmap(), if this marker is encountered,
   769			 * stop releasing VMAs that have not been duplicated after this
   770			 * point.
   771			 */
   772			mas_set_range(&vmi.mas, mpnt->vm_start, mpnt->vm_end - 1);
   773			mas_store(&vmi.mas, XA_ZERO_ENTRY);
   774		}
   775	out:
   776		mmap_write_unlock(mm);
   777		flush_tlb_mm(oldmm);
   778		mmap_write_unlock(oldmm);
   779		dup_userfaultfd_complete(&uf);
   780	fail_uprobe_end:
   781		uprobe_end_dup_mmap();
   782		return retval;
   783	
   784	fail_nomem_anon_vma_fork:
   785		mpol_put(vma_policy(tmp));
   786	fail_nomem_policy:
   787		vm_area_free(tmp);
   788	fail_nomem:
   789		retval = -ENOMEM;
   790		vm_unacct_memory(charge);
   791		goto loop_out;
   792	}
   793	
   794	static inline int mm_alloc_pgd(struct mm_struct *mm)
   795	{
   796		mm->pgd = pgd_alloc(mm);
   797		if (unlikely(!mm->pgd))
   798			return -ENOMEM;
   799		return 0;
   800	}
   801	
   802	static inline void mm_free_pgd(struct mm_struct *mm)
   803	{
   804		pgd_free(mm, mm->pgd);
   805	}
   806	#else
   807	static int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
   808	{
   809		mmap_write_lock(oldmm);
   810		dup_mm_exe_file(mm, oldmm);
   811		mmap_write_unlock(oldmm);
   812		return 0;
   813	}
   814	#define mm_alloc_pgd(mm)	(0)
   815	#define mm_free_pgd(mm)
   816	#endif /* CONFIG_MMU */
   817	
   818	static void check_mm(struct mm_struct *mm)
   819	{
   820		int i;
   821	
   822		BUILD_BUG_ON_MSG(ARRAY_SIZE(resident_page_types) != NR_MM_COUNTERS,
   823				 "Please make sure 'struct resident_page_types[]' is updated as well");
   824	
   825		for (i = 0; i < NR_MM_COUNTERS; i++) {
   826			long x = percpu_counter_sum(&mm->rss_stat[i]);
   827	
   828			if (unlikely(x))
   829				pr_alert("BUG: Bad rss-counter state mm:%p type:%s val:%ld\n",
   830					 mm, resident_page_types[i], x);
   831		}
   832	
   833		if (mm_pgtables_bytes(mm))
   834			pr_alert("BUG: non-zero pgtables_bytes on freeing mm: %ld\n",
   835					mm_pgtables_bytes(mm));
   836	
   837	#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !USE_SPLIT_PMD_PTLOCKS
   838		VM_BUG_ON_MM(mm->pmd_huge_pte, mm);
   839	#endif
   840	}
   841	
   842	#define allocate_mm()	(kmem_cache_alloc(mm_cachep, GFP_KERNEL))
   843	#define free_mm(mm)	(kmem_cache_free(mm_cachep, (mm)))
   844	
   845	static void do_check_lazy_tlb(void *arg)
   846	{
   847		struct mm_struct *mm = arg;
   848	
   849		WARN_ON_ONCE(current->active_mm == mm);
   850	}
   851	
   852	static void do_shoot_lazy_tlb(void *arg)
   853	{
   854		struct mm_struct *mm = arg;
   855	
   856		if (current->active_mm == mm) {
   857			WARN_ON_ONCE(current->mm);
   858			current->active_mm = &init_mm;
   859			switch_mm(mm, &init_mm, current);
   860		}
   861	}
   862	
   863	static void cleanup_lazy_tlbs(struct mm_struct *mm)
   864	{
   865		if (!IS_ENABLED(CONFIG_MMU_LAZY_TLB_SHOOTDOWN)) {
   866			/*
   867			 * In this case, lazy tlb mms are refounted and would not reach
   868			 * __mmdrop until all CPUs have switched away and mmdrop()ed.
   869			 */
   870			return;
   871		}
   872	
   873		/*
   874		 * Lazy mm shootdown does not refcount "lazy tlb mm" usage, rather it
   875		 * requires lazy mm users to switch to another mm when the refcount
   876		 * drops to zero, before the mm is freed. This requires IPIs here to
   877		 * switch kernel threads to init_mm.
   878		 *
   879		 * archs that use IPIs to flush TLBs can piggy-back that lazy tlb mm
   880		 * switch with the final userspace teardown TLB flush which leaves the
   881		 * mm lazy on this CPU but no others, reducing the need for additional
   882		 * IPIs here. There are cases where a final IPI is still required here,
   883		 * such as the final mmdrop being performed on a different CPU than the
   884		 * one exiting, or kernel threads using the mm when userspace exits.
   885		 *
   886		 * IPI overheads have not found to be expensive, but they could be
   887		 * reduced in a number of possible ways, for example (roughly
   888		 * increasing order of complexity):
   889		 * - The last lazy reference created by exit_mm() could instead switch
   890		 *   to init_mm, however it's probable this will run on the same CPU
   891		 *   immediately afterwards, so this may not reduce IPIs much.
   892		 * - A batch of mms requiring IPIs could be gathered and freed at once.
   893		 * - CPUs store active_mm where it can be remotely checked without a
   894		 *   lock, to filter out false-positives in the cpumask.
   895		 * - After mm_users or mm_count reaches zero, switching away from the
   896		 *   mm could clear mm_cpumask to reduce some IPIs, perhaps together
   897		 *   with some batching or delaying of the final IPIs.
   898		 * - A delayed freeing and RCU-like quiescing sequence based on mm
   899		 *   switching to avoid IPIs completely.
   900		 */
   901		on_each_cpu_mask(mm_cpumask(mm), do_shoot_lazy_tlb, (void *)mm, 1);
   902		if (IS_ENABLED(CONFIG_DEBUG_VM_SHOOT_LAZIES))
   903			on_each_cpu(do_check_lazy_tlb, (void *)mm, 1);
   904	}
   905	
   906	/*
   907	 * Called when the last reference to the mm
   908	 * is dropped: either by a lazy thread or by
   909	 * mmput. Free the page directory and the mm.
   910	 */
   911	void __mmdrop(struct mm_struct *mm)
   912	{
   913		BUG_ON(mm == &init_mm);
   914		WARN_ON_ONCE(mm == current->mm);
   915	
   916		/* Ensure no CPUs are using this as their lazy tlb mm */
   917		cleanup_lazy_tlbs(mm);
   918	
   919		WARN_ON_ONCE(mm == current->active_mm);
   920		mm_free_pgd(mm);
   921		destroy_context(mm);
   922		mmu_notifier_subscriptions_destroy(mm);
   923		check_mm(mm);
   924		put_user_ns(mm->user_ns);
   925		mm_pasid_drop(mm);
   926		mm_destroy_cid(mm);
   927		percpu_counter_destroy_many(mm->rss_stat, NR_MM_COUNTERS);
   928	
   929		free_mm(mm);
   930	}
   931	EXPORT_SYMBOL_GPL(__mmdrop);
   932	
   933	static void mmdrop_async_fn(struct work_struct *work)
   934	{
   935		struct mm_struct *mm;
   936	
   937		mm = container_of(work, struct mm_struct, async_put_work);
   938		__mmdrop(mm);
   939	}
   940	
   941	static void mmdrop_async(struct mm_struct *mm)
   942	{
   943		if (unlikely(atomic_dec_and_test(&mm->mm_count))) {
   944			INIT_WORK(&mm->async_put_work, mmdrop_async_fn);
   945			schedule_work(&mm->async_put_work);
   946		}
   947	}
   948	
   949	static inline void free_signal_struct(struct signal_struct *sig)
   950	{
   951		taskstats_tgid_free(sig);
   952		sched_autogroup_exit(sig);
   953		/*
   954		 * __mmdrop is not safe to call from softirq context on x86 due to
   955		 * pgd_dtor so postpone it to the async context
   956		 */
   957		if (sig->oom_mm)
   958			mmdrop_async(sig->oom_mm);
   959		kmem_cache_free(signal_cachep, sig);
   960	}
   961	
   962	static inline void put_signal_struct(struct signal_struct *sig)
   963	{
   964		if (refcount_dec_and_test(&sig->sigcnt))
   965			free_signal_struct(sig);
   966	}
   967	
   968	void __put_task_struct(struct task_struct *tsk)
   969	{
   970		WARN_ON(!tsk->exit_state);
   971		WARN_ON(refcount_read(&tsk->usage));
   972		WARN_ON(tsk == current);
   973	
   974		io_uring_free(tsk);
   975		cgroup_free(tsk);
   976		task_numa_free(tsk, true);
   977		security_task_free(tsk);
   978		exit_creds(tsk);
   979		delayacct_tsk_free(tsk);
   980		put_signal_struct(tsk->signal);
   981		sched_core_free(tsk);
   982		free_task(tsk);
   983	}
   984	EXPORT_SYMBOL_GPL(__put_task_struct);
   985	
   986	void __put_task_struct_rcu_cb(struct rcu_head *rhp)
   987	{
   988		struct task_struct *task = container_of(rhp, struct task_struct, rcu);
   989	
   990		__put_task_struct(task);
   991	}
   992	EXPORT_SYMBOL_GPL(__put_task_struct_rcu_cb);
   993	
   994	void __init __weak arch_task_cache_init(void) { }
   995	
   996	/*
   997	 * set_max_threads
   998	 */
   999	static void set_max_threads(unsigned int max_threads_suggested)
  1000	{
  1001		u64 threads;
  1002		unsigned long nr_pages = totalram_pages();
  1003	
  1004		/*
  1005		 * The number of threads shall be limited such that the thread
  1006		 * structures may only consume a small part of the available memory.
  1007		 */
  1008		if (fls64(nr_pages) + fls64(PAGE_SIZE) > 64)
  1009			threads = MAX_THREADS;
  1010		else
  1011			threads = div64_u64((u64) nr_pages * (u64) PAGE_SIZE,
  1012					    (u64) THREAD_SIZE * 8UL);
  1013	
  1014		if (threads > max_threads_suggested)
  1015			threads = max_threads_suggested;
  1016	
  1017		max_threads = clamp_t(u64, threads, MIN_THREADS, MAX_THREADS);
  1018	}
  1019	
  1020	#ifdef CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT
  1021	/* Initialized by the architecture: */
  1022	int arch_task_struct_size __read_mostly;
  1023	#endif
  1024	
  1025	static void task_struct_whitelist(unsigned long *offset, unsigned long *size)
  1026	{
  1027		/* Fetch thread_struct whitelist for the architecture. */
  1028		arch_thread_struct_whitelist(offset, size);
  1029	
  1030		/*
  1031		 * Handle zero-sized whitelist or empty thread_struct, otherwise
  1032		 * adjust offset to position of thread_struct in task_struct.
  1033		 */
  1034		if (unlikely(*size == 0))
  1035			*offset = 0;
  1036		else
  1037			*offset += offsetof(struct task_struct, thread);
  1038	}
  1039	
  1040	void __init fork_init(void)
  1041	{
  1042		int i;
  1043	#ifndef ARCH_MIN_TASKALIGN
  1044	#define ARCH_MIN_TASKALIGN	0
  1045	#endif
  1046		int align = max_t(int, L1_CACHE_BYTES, ARCH_MIN_TASKALIGN);
  1047		unsigned long useroffset, usersize;
  1048	
  1049		/* create a slab on which task_structs can be allocated */
  1050		task_struct_whitelist(&useroffset, &usersize);
  1051		task_struct_cachep = kmem_cache_create_usercopy("task_struct",
  1052				arch_task_struct_size, align,
  1053				SLAB_PANIC|SLAB_ACCOUNT,
  1054				useroffset, usersize, NULL);
  1055	
  1056		/* do the arch specific task caches init */
  1057		arch_task_cache_init();
  1058	
  1059		set_max_threads(MAX_THREADS);
  1060	
  1061		init_task.signal->rlim[RLIMIT_NPROC].rlim_cur = max_threads/2;
  1062		init_task.signal->rlim[RLIMIT_NPROC].rlim_max = max_threads/2;
  1063		init_task.signal->rlim[RLIMIT_SIGPENDING] =
  1064			init_task.signal->rlim[RLIMIT_NPROC];
  1065	
  1066		for (i = 0; i < UCOUNT_COUNTS; i++)
  1067			init_user_ns.ucount_max[i] = max_threads/2;
  1068	
  1069		set_userns_rlimit_max(&init_user_ns, UCOUNT_RLIMIT_NPROC,      RLIM_INFINITY);
  1070		set_userns_rlimit_max(&init_user_ns, UCOUNT_RLIMIT_MSGQUEUE,   RLIM_INFINITY);
  1071		set_userns_rlimit_max(&init_user_ns, UCOUNT_RLIMIT_SIGPENDING, RLIM_INFINITY);
  1072		set_userns_rlimit_max(&init_user_ns, UCOUNT_RLIMIT_MEMLOCK,    RLIM_INFINITY);
  1073	
  1074	#ifdef CONFIG_VMAP_STACK
  1075		cpuhp_setup_state(CPUHP_BP_PREPARE_DYN, "fork:vm_stack_cache",
  1076				  NULL, free_vm_stack_cache);
  1077	#endif
  1078	
  1079		scs_init();
  1080	
  1081		lockdep_init_task(&init_task);
  1082		uprobes_init();
  1083	}
  1084	
  1085	int __weak arch_dup_task_struct(struct task_struct *dst,
  1086						       struct task_struct *src)
  1087	{
  1088		*dst = *src;
  1089		return 0;
  1090	}
  1091	
  1092	void set_task_stack_end_magic(struct task_struct *tsk)
  1093	{
  1094		unsigned long *stackend;
  1095	
  1096		stackend = end_of_stack(tsk);
  1097		*stackend = STACK_END_MAGIC;	/* for overflow detection */
  1098	}
  1099	
  1100	static struct task_struct *dup_task_struct(struct task_struct *orig, int node)
  1101	{
  1102		struct task_struct *tsk;
  1103		int err;
  1104	
  1105		if (node == NUMA_NO_NODE)
  1106			node = tsk_fork_get_node(orig);
  1107		tsk = alloc_task_struct_node(node);
  1108		if (!tsk)
  1109			return NULL;
  1110	
  1111		err = arch_dup_task_struct(tsk, orig);
  1112		if (err)
  1113			goto free_tsk;
  1114	
  1115		err = alloc_thread_stack_node(tsk, node);
  1116		if (err)
  1117			goto free_tsk;
  1118	
  1119	#ifdef CONFIG_THREAD_INFO_IN_TASK
  1120		refcount_set(&tsk->stack_refcount, 1);
  1121	#endif
  1122		account_kernel_stack(tsk, 1);
  1123	
  1124		err = scs_prepare(tsk, node);
  1125		if (err)
  1126			goto free_stack;
  1127	
  1128	#ifdef CONFIG_SECCOMP
  1129		/*
  1130		 * We must handle setting up seccomp filters once we're under
  1131		 * the sighand lock in case orig has changed between now and
  1132		 * then. Until then, filter must be NULL to avoid messing up
  1133		 * the usage counts on the error path calling free_task.
  1134		 */
  1135		tsk->seccomp.filter = NULL;
  1136	#endif
  1137	
  1138		setup_thread_stack(tsk, orig);
  1139		clear_user_return_notifier(tsk);
  1140		clear_tsk_need_resched(tsk);
  1141		set_task_stack_end_magic(tsk);
  1142		clear_syscall_work_syscall_user_dispatch(tsk);
  1143	
  1144	#ifdef CONFIG_STACKPROTECTOR
  1145		tsk->stack_canary = get_random_canary();
  1146	#endif
  1147		if (orig->cpus_ptr == &orig->cpus_mask)
  1148			tsk->cpus_ptr = &tsk->cpus_mask;
  1149		dup_user_cpus_ptr(tsk, orig, node);
  1150	
  1151		/*
  1152		 * One for the user space visible state that goes away when reaped.
  1153		 * One for the scheduler.
  1154		 */
  1155		refcount_set(&tsk->rcu_users, 2);
  1156		/* One for the rcu users */
  1157		refcount_set(&tsk->usage, 1);
  1158	#ifdef CONFIG_BLK_DEV_IO_TRACE
  1159		tsk->btrace_seq = 0;
  1160	#endif
  1161		tsk->splice_pipe = NULL;
  1162		tsk->task_frag.page = NULL;
  1163		tsk->wake_q.next = NULL;
  1164		tsk->worker_private = NULL;
  1165	
  1166		kcov_task_init(tsk);
  1167		kmsan_task_create(tsk);
  1168		kmap_local_fork(tsk);
  1169	
  1170	#ifdef CONFIG_FAULT_INJECTION
  1171		tsk->fail_nth = 0;
  1172	#endif
  1173	
  1174	#ifdef CONFIG_BLK_CGROUP
  1175		tsk->throttle_disk = NULL;
  1176		tsk->use_memdelay = 0;
  1177	#endif
  1178	
  1179	#ifdef CONFIG_ARCH_HAS_CPU_PASID
  1180		tsk->pasid_activated = 0;
  1181	#endif
  1182	
  1183	#ifdef CONFIG_MEMCG
  1184		tsk->active_memcg = NULL;
  1185	#endif
  1186	
  1187	#ifdef CONFIG_CPU_SUP_INTEL
  1188		tsk->reported_split_lock = 0;
  1189	#endif
  1190	
  1191	#ifdef CONFIG_SCHED_MM_CID
  1192		tsk->mm_cid = -1;
  1193		tsk->last_mm_cid = -1;
  1194		tsk->mm_cid_active = 0;
  1195		tsk->migrate_from_cpu = -1;
  1196	#endif
  1197		return tsk;
  1198	
  1199	free_stack:
  1200		exit_task_stack_account(tsk);
  1201		free_thread_stack(tsk);
  1202	free_tsk:
  1203		free_task_struct(tsk);
  1204		return NULL;
  1205	}
  1206	
  1207	__cacheline_aligned_in_smp DEFINE_SPINLOCK(mmlist_lock);
  1208	
  1209	static unsigned long default_dump_filter = MMF_DUMP_FILTER_DEFAULT;
  1210	
  1211	static int __init coredump_filter_setup(char *s)
  1212	{
  1213		default_dump_filter =
  1214			(simple_strtoul(s, NULL, 0) << MMF_DUMP_FILTER_SHIFT) &
  1215			MMF_DUMP_FILTER_MASK;
  1216		return 1;
  1217	}
  1218	
  1219	__setup("coredump_filter=", coredump_filter_setup);
  1220	
  1221	#include <linux/init_task.h>
  1222	
  1223	static void mm_init_aio(struct mm_struct *mm)
  1224	{
  1225	#ifdef CONFIG_AIO
  1226		spin_lock_init(&mm->ioctx_lock);
  1227		mm->ioctx_table = NULL;
  1228	#endif
  1229	}
  1230	
  1231	static __always_inline void mm_clear_owner(struct mm_struct *mm,
  1232						   struct task_struct *p)
  1233	{
  1234	#ifdef CONFIG_MEMCG
  1235		if (mm->owner == p)
  1236			WRITE_ONCE(mm->owner, NULL);
  1237	#endif
  1238	}
  1239	
  1240	static void mm_init_owner(struct mm_struct *mm, struct task_struct *p)
  1241	{
  1242	#ifdef CONFIG_MEMCG
  1243		mm->owner = p;
  1244	#endif
  1245	}
  1246	
  1247	static void mm_init_uprobes_state(struct mm_struct *mm)
  1248	{
  1249	#ifdef CONFIG_UPROBES
  1250		mm->uprobes_state.xol_area = NULL;
  1251	#endif
  1252	}
  1253	
  1254	static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
  1255		struct user_namespace *user_ns)
  1256	{
  1257		mt_init_flags(&mm->mm_mt, MM_MT_FLAGS);
  1258		mt_set_external_lock(&mm->mm_mt, &mm->mmap_lock);
  1259		atomic_set(&mm->mm_users, 1);
  1260		atomic_set(&mm->mm_count, 1);
  1261		seqcount_init(&mm->write_protect_seq);
  1262		mmap_init_lock(mm);
  1263		INIT_LIST_HEAD(&mm->mmlist);
  1264	#ifdef CONFIG_PER_VMA_LOCK
  1265		mm->mm_lock_seq = 0;
  1266	#endif
  1267		mm_pgtables_bytes_init(mm);
  1268		mm->map_count = 0;
  1269		mm->locked_vm = 0;
  1270		atomic64_set(&mm->pinned_vm, 0);
  1271		memset(&mm->rss_stat, 0, sizeof(mm->rss_stat));
  1272		spin_lock_init(&mm->page_table_lock);
  1273		spin_lock_init(&mm->arg_lock);
  1274		mm_init_cpumask(mm);
  1275		mm_init_aio(mm);
  1276		mm_init_owner(mm, p);
  1277		mm_pasid_init(mm);
  1278		RCU_INIT_POINTER(mm->exe_file, NULL);
  1279		mmu_notifier_subscriptions_init(mm);
  1280		init_tlb_flush_pending(mm);
  1281	#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !USE_SPLIT_PMD_PTLOCKS
  1282		mm->pmd_huge_pte = NULL;
  1283	#endif
  1284		mm_init_uprobes_state(mm);
  1285		hugetlb_count_init(mm);
  1286	
  1287		if (current->mm) {
  1288			mm->flags = mmf_init_flags(current->mm->flags);
  1289			mm->def_flags = current->mm->def_flags & VM_INIT_DEF_MASK;
  1290		} else {
  1291			mm->flags = default_dump_filter;
  1292			mm->def_flags = 0;
  1293		}
  1294	
  1295		if (mm_alloc_pgd(mm))
  1296			goto fail_nopgd;
  1297	
  1298		if (init_new_context(p, mm))
  1299			goto fail_nocontext;
  1300	
  1301		if (mm_alloc_cid(mm))
  1302			goto fail_cid;
  1303	
  1304		if (percpu_counter_init_many(mm->rss_stat, 0, GFP_KERNEL_ACCOUNT,
  1305					     NR_MM_COUNTERS))
  1306			goto fail_pcpu;
  1307	
  1308		mm->user_ns = get_user_ns(user_ns);
  1309		lru_gen_init_mm(mm);
  1310		return mm;
  1311	
  1312	fail_pcpu:
  1313		mm_destroy_cid(mm);
  1314	fail_cid:
  1315		destroy_context(mm);
  1316	fail_nocontext:
  1317		mm_free_pgd(mm);
  1318	fail_nopgd:
  1319		free_mm(mm);
  1320		return NULL;
  1321	}
  1322	
  1323	/*
  1324	 * Allocate and initialize an mm_struct.
  1325	 */
  1326	struct mm_struct *mm_alloc(void)
  1327	{
  1328		struct mm_struct *mm;
  1329	
  1330		mm = allocate_mm();
  1331		if (!mm)
  1332			return NULL;
  1333	
  1334		memset(mm, 0, sizeof(*mm));
  1335		return mm_init(mm, current, current_user_ns());
  1336	}
  1337	
  1338	static inline void __mmput(struct mm_struct *mm)
  1339	{
  1340		VM_BUG_ON(atomic_read(&mm->mm_users));
  1341	
  1342		uprobe_clear_state(mm);
  1343		exit_aio(mm);
  1344		ksm_exit(mm);
  1345		khugepaged_exit(mm); /* must run before exit_mmap */
  1346		exit_mmap(mm);
  1347		mm_put_huge_zero_page(mm);
  1348		set_mm_exe_file(mm, NULL);
  1349		if (!list_empty(&mm->mmlist)) {
  1350			spin_lock(&mmlist_lock);
  1351			list_del(&mm->mmlist);
  1352			spin_unlock(&mmlist_lock);
  1353		}
  1354		if (mm->binfmt)
  1355			module_put(mm->binfmt->module);
  1356		lru_gen_del_mm(mm);
  1357		mmdrop(mm);
  1358	}
  1359	
  1360	/*
  1361	 * Decrement the use count and release all resources for an mm.
  1362	 */
  1363	void mmput(struct mm_struct *mm)
  1364	{
  1365		might_sleep();
  1366	
  1367		if (atomic_dec_and_test(&mm->mm_users))
  1368			__mmput(mm);
  1369	}
  1370	EXPORT_SYMBOL_GPL(mmput);
  1371	
  1372	#ifdef CONFIG_MMU
  1373	static void mmput_async_fn(struct work_struct *work)
  1374	{
  1375		struct mm_struct *mm = container_of(work, struct mm_struct,
  1376						    async_put_work);
  1377	
  1378		__mmput(mm);
  1379	}
  1380	
  1381	void mmput_async(struct mm_struct *mm)
  1382	{
  1383		if (atomic_dec_and_test(&mm->mm_users)) {
  1384			INIT_WORK(&mm->async_put_work, mmput_async_fn);
  1385			schedule_work(&mm->async_put_work);
  1386		}
  1387	}
  1388	EXPORT_SYMBOL_GPL(mmput_async);
  1389	#endif
  1390	
  1391	/**
  1392	 * set_mm_exe_file - change a reference to the mm's executable file
  1393	 * @mm: The mm to change.
  1394	 * @new_exe_file: The new file to use.
  1395	 *
  1396	 * This changes mm's executable file (shown as symlink /proc/[pid]/exe).
  1397	 *
  1398	 * Main users are mmput() and sys_execve(). Callers prevent concurrent
  1399	 * invocations: in mmput() nobody alive left, in execve it happens before
  1400	 * the new mm is made visible to anyone.
  1401	 *
  1402	 * Can only fail if new_exe_file != NULL.
  1403	 */
  1404	int set_mm_exe_file(struct mm_struct *mm, struct file *new_exe_file)
  1405	{
  1406		struct file *old_exe_file;
  1407	
  1408		/*
  1409		 * It is safe to dereference the exe_file without RCU as
  1410		 * this function is only called if nobody else can access
  1411		 * this mm -- see comment above for justification.
  1412		 */
  1413		old_exe_file = rcu_dereference_raw(mm->exe_file);
  1414	
  1415		if (new_exe_file) {
  1416			/*
  1417			 * We expect the caller (i.e., sys_execve) to already denied
  1418			 * write access, so this is unlikely to fail.
  1419			 */
  1420			if (unlikely(deny_write_access(new_exe_file)))
  1421				return -EACCES;
  1422			get_file(new_exe_file);
  1423		}
  1424		rcu_assign_pointer(mm->exe_file, new_exe_file);
  1425		if (old_exe_file) {
  1426			allow_write_access(old_exe_file);
  1427			fput(old_exe_file);
  1428		}
  1429		return 0;
  1430	}
  1431	
  1432	/**
  1433	 * replace_mm_exe_file - replace a reference to the mm's executable file
  1434	 * @mm: The mm to change.
  1435	 * @new_exe_file: The new file to use.
  1436	 *
  1437	 * This changes mm's executable file (shown as symlink /proc/[pid]/exe).
  1438	 *
  1439	 * Main user is sys_prctl(PR_SET_MM_MAP/EXE_FILE).
  1440	 */
  1441	int replace_mm_exe_file(struct mm_struct *mm, struct file *new_exe_file)
  1442	{
  1443		struct vm_area_struct *vma;
  1444		struct file *old_exe_file;
  1445		int ret = 0;
  1446	
  1447		/* Forbid mm->exe_file change if old file still mapped. */
  1448		old_exe_file = get_mm_exe_file(mm);
  1449		if (old_exe_file) {
  1450			VMA_ITERATOR(vmi, mm, 0);
  1451			mmap_read_lock(mm);
  1452			for_each_vma(vmi, vma) {
  1453				if (!vma->vm_file)
  1454					continue;
  1455				if (path_equal(&vma->vm_file->f_path,
  1456					       &old_exe_file->f_path)) {
  1457					ret = -EBUSY;
  1458					break;
  1459				}
  1460			}
  1461			mmap_read_unlock(mm);
  1462			fput(old_exe_file);
  1463			if (ret)
  1464				return ret;
  1465		}
  1466	
  1467		ret = deny_write_access(new_exe_file);
  1468		if (ret)
  1469			return -EACCES;
  1470		get_file(new_exe_file);
  1471	
  1472		/* set the new file */
  1473		mmap_write_lock(mm);
  1474		old_exe_file = rcu_dereference_raw(mm->exe_file);
  1475		rcu_assign_pointer(mm->exe_file, new_exe_file);
  1476		mmap_write_unlock(mm);
  1477	
  1478		if (old_exe_file) {
  1479			allow_write_access(old_exe_file);
  1480			fput(old_exe_file);
  1481		}
  1482		return 0;
  1483	}
  1484	
  1485	/**
  1486	 * get_mm_exe_file - acquire a reference to the mm's executable file
  1487	 * @mm: The mm of interest.
  1488	 *
  1489	 * Returns %NULL if mm has no associated executable file.
  1490	 * User must release file via fput().
  1491	 */
  1492	struct file *get_mm_exe_file(struct mm_struct *mm)
  1493	{
  1494		struct file *exe_file;
  1495	
  1496		rcu_read_lock();
  1497		exe_file = get_file_rcu(&mm->exe_file);
  1498		rcu_read_unlock();
  1499		return exe_file;
  1500	}
  1501	
  1502	/**
  1503	 * get_task_exe_file - acquire a reference to the task's executable file
  1504	 * @task: The task.
  1505	 *
  1506	 * Returns %NULL if task's mm (if any) has no associated executable file or
  1507	 * this is a kernel thread with borrowed mm (see the comment above get_task_mm).
  1508	 * User must release file via fput().
  1509	 */
  1510	struct file *get_task_exe_file(struct task_struct *task)
  1511	{
  1512		struct file *exe_file = NULL;
  1513		struct mm_struct *mm;
  1514	
  1515		task_lock(task);
  1516		mm = task->mm;
  1517		if (mm) {
  1518			if (!(task->flags & PF_KTHREAD))
  1519				exe_file = get_mm_exe_file(mm);
  1520		}
  1521		task_unlock(task);
  1522		return exe_file;
  1523	}
  1524	
  1525	/**
  1526	 * get_task_mm - acquire a reference to the task's mm
  1527	 * @task: The task.
  1528	 *
  1529	 * Returns %NULL if the task has no mm.  Checks PF_KTHREAD (meaning
  1530	 * this kernel workthread has transiently adopted a user mm with use_mm,
  1531	 * to do its AIO) is not set and if so returns a reference to it, after
  1532	 * bumping up the use count.  User must release the mm via mmput()
  1533	 * after use.  Typically used by /proc and ptrace.
  1534	 */
  1535	struct mm_struct *get_task_mm(struct task_struct *task)
  1536	{
  1537		struct mm_struct *mm;
  1538	
  1539		task_lock(task);
  1540		mm = task->mm;
  1541		if (mm) {
  1542			if (task->flags & PF_KTHREAD)
  1543				mm = NULL;
  1544			else
  1545				mmget(mm);
  1546		}
  1547		task_unlock(task);
  1548		return mm;
  1549	}
  1550	EXPORT_SYMBOL_GPL(get_task_mm);
  1551	
  1552	struct mm_struct *mm_access(struct task_struct *task, unsigned int mode)
  1553	{
  1554		struct mm_struct *mm;
  1555		int err;
  1556	
  1557		err =  down_read_killable(&task->signal->exec_update_lock);
  1558		if (err)
  1559			return ERR_PTR(err);
  1560	
  1561		mm = get_task_mm(task);
  1562		if (mm && mm != current->mm &&
  1563				!ptrace_may_access(task, mode)) {
  1564			mmput(mm);
  1565			mm = ERR_PTR(-EACCES);
  1566		}
  1567		up_read(&task->signal->exec_update_lock);
  1568	
  1569		return mm;
  1570	}
  1571	
  1572	static void complete_vfork_done(struct task_struct *tsk)
  1573	{
  1574		struct completion *vfork;
  1575	
  1576		task_lock(tsk);
  1577		vfork = tsk->vfork_done;
  1578		if (likely(vfork)) {
  1579			tsk->vfork_done = NULL;
  1580			complete(vfork);
  1581		}
  1582		task_unlock(tsk);
  1583	}
  1584	
  1585	static int wait_for_vfork_done(struct task_struct *child,
  1586					struct completion *vfork)
  1587	{
  1588		unsigned int state = TASK_KILLABLE|TASK_FREEZABLE;
  1589		int killed;
  1590	
  1591		cgroup_enter_frozen();
  1592		killed = wait_for_completion_state(vfork, state);
  1593		cgroup_leave_frozen(false);
  1594	
  1595		if (killed) {
  1596			task_lock(child);
  1597			child->vfork_done = NULL;
  1598			task_unlock(child);
  1599		}
  1600	
  1601		put_task_struct(child);
  1602		return killed;
  1603	}
  1604	
  1605	/* Please note the differences between mmput and mm_release.
  1606	 * mmput is called whenever we stop holding onto a mm_struct,
  1607	 * error success whatever.
  1608	 *
  1609	 * mm_release is called after a mm_struct has been removed
  1610	 * from the current process.
  1611	 *
  1612	 * This difference is important for error handling, when we
  1613	 * only half set up a mm_struct for a new process and need to restore
  1614	 * the old one.  Because we mmput the new mm_struct before
  1615	 * restoring the old one. . .
  1616	 * Eric Biederman 10 January 1998
  1617	 */
  1618	static void mm_release(struct task_struct *tsk, struct mm_struct *mm)
  1619	{
  1620		uprobe_free_utask(tsk);
  1621	
  1622		/* Get rid of any cached register state */
  1623		deactivate_mm(tsk, mm);
  1624	
  1625		/*
  1626		 * Signal userspace if we're not exiting with a core dump
  1627		 * because we want to leave the value intact for debugging
  1628		 * purposes.
  1629		 */
  1630		if (tsk->clear_child_tid) {
  1631			if (atomic_read(&mm->mm_users) > 1) {
  1632				/*
  1633				 * We don't check the error code - if userspace has
  1634				 * not set up a proper pointer then tough luck.
  1635				 */
  1636				put_user(0, tsk->clear_child_tid);
  1637				do_futex(tsk->clear_child_tid, FUTEX_WAKE,
  1638						1, NULL, NULL, 0, 0);
  1639			}
  1640			tsk->clear_child_tid = NULL;
  1641		}
  1642	
  1643		/*
  1644		 * All done, finally we can wake up parent and return this mm to him.
  1645		 * Also kthread_stop() uses this completion for synchronization.
  1646		 */
  1647		if (tsk->vfork_done)
  1648			complete_vfork_done(tsk);
  1649	}
  1650	
  1651	void exit_mm_release(struct task_struct *tsk, struct mm_struct *mm)
  1652	{
  1653		futex_exit_release(tsk);
  1654		mm_release(tsk, mm);
  1655	}
  1656	
  1657	void exec_mm_release(struct task_struct *tsk, struct mm_struct *mm)
  1658	{
  1659		futex_exec_release(tsk);
  1660		mm_release(tsk, mm);
  1661	}
  1662	
  1663	/**
  1664	 * dup_mm() - duplicates an existing mm structure
  1665	 * @tsk: the task_struct with which the new mm will be associated.
  1666	 * @oldmm: the mm to duplicate.
  1667	 *
  1668	 * Allocates a new mm structure and duplicates the provided @oldmm structure
  1669	 * content into it.
  1670	 *
  1671	 * Return: the duplicated mm or NULL on failure.
  1672	 */
  1673	static struct mm_struct *dup_mm(struct task_struct *tsk,
  1674					struct mm_struct *oldmm)
  1675	{
  1676		struct mm_struct *mm;
  1677		int err;
  1678	
  1679		mm = allocate_mm();
  1680		if (!mm)
  1681			goto fail_nomem;
  1682	
  1683		memcpy(mm, oldmm, sizeof(*mm));
  1684	
  1685		if (!mm_init(mm, tsk, mm->user_ns))
  1686			goto fail_nomem;
  1687	
  1688		err = dup_mmap(mm, oldmm);
  1689		if (err)
  1690			goto free_pt;
  1691	
  1692		mm->hiwater_rss = get_mm_rss(mm);
  1693		mm->hiwater_vm = mm->total_vm;
  1694	
  1695		if (mm->binfmt && !try_module_get(mm->binfmt->module))
  1696			goto free_pt;
  1697	
  1698		return mm;
  1699	
  1700	free_pt:
  1701		/* don't put binfmt in mmput, we haven't got module yet */
  1702		mm->binfmt = NULL;
  1703		mm_init_owner(mm, NULL);
  1704		mmput(mm);
  1705	
  1706	fail_nomem:
  1707		return NULL;
  1708	}
  1709	
  1710	static int copy_mm(unsigned long clone_flags, struct task_struct *tsk)
  1711	{
  1712		struct mm_struct *mm, *oldmm;
  1713	
  1714		tsk->min_flt = tsk->maj_flt = 0;
  1715		tsk->nvcsw = tsk->nivcsw = 0;
  1716	#ifdef CONFIG_DETECT_HUNG_TASK
  1717		tsk->last_switch_count = tsk->nvcsw + tsk->nivcsw;
  1718		tsk->last_switch_time = 0;
  1719	#endif
  1720	
  1721		tsk->mm = NULL;
  1722		tsk->active_mm = NULL;
  1723	
  1724		/*
  1725		 * Are we cloning a kernel thread?
  1726		 *
  1727		 * We need to steal a active VM for that..
  1728		 */
  1729		oldmm = current->mm;
  1730		if (!oldmm)
  1731			return 0;
  1732	
  1733		if (clone_flags & CLONE_VM) {
  1734			mmget(oldmm);
  1735			mm = oldmm;
  1736		} else {
  1737			mm = dup_mm(tsk, current->mm);
  1738			if (!mm)
  1739				return -ENOMEM;
  1740		}
  1741	
  1742		tsk->mm = mm;
  1743		tsk->active_mm = mm;
  1744		sched_mm_cid_fork(tsk);
  1745		return 0;
  1746	}
  1747	
  1748	static int copy_fs(unsigned long clone_flags, struct task_struct *tsk)
  1749	{
  1750		struct fs_struct *fs = current->fs;
  1751		if (clone_flags & CLONE_FS) {
  1752			/* tsk->fs is already what we want */
  1753			spin_lock(&fs->lock);
  1754			/* "users" and "in_exec" locked for check_unsafe_exec() */
  1755			if (fs->in_exec) {
  1756				spin_unlock(&fs->lock);
  1757				return -EAGAIN;
  1758			}
  1759			fs->users++;
  1760			spin_unlock(&fs->lock);
  1761			return 0;
  1762		}
  1763		tsk->fs = copy_fs_struct(fs);
  1764		if (!tsk->fs)
  1765			return -ENOMEM;
  1766		return 0;
  1767	}
  1768	
  1769	static int copy_files(unsigned long clone_flags, struct task_struct *tsk,
  1770			      int no_files)
  1771	{
  1772		struct files_struct *oldf, *newf;
  1773		int error = 0;
  1774	
  1775		/*
  1776		 * A background process may not have any files ...
  1777		 */
  1778		oldf = current->files;
  1779		if (!oldf)
  1780			goto out;
  1781	
  1782		if (no_files) {
  1783			tsk->files = NULL;
  1784			goto out;
  1785		}
  1786	
  1787		if (clone_flags & CLONE_FILES) {
  1788			atomic_inc(&oldf->count);
  1789			goto out;
  1790		}
  1791	
  1792		newf = dup_fd(oldf, NR_OPEN_MAX, &error);
  1793		if (!newf)
  1794			goto out;
  1795	
  1796		tsk->files = newf;
  1797		error = 0;
  1798	out:
  1799		return error;
  1800	}
  1801	
  1802	static int copy_sighand(unsigned long clone_flags, struct task_struct *tsk)
  1803	{
  1804		struct sighand_struct *sig;
  1805	
  1806		if (clone_flags & CLONE_SIGHAND) {
  1807			refcount_inc(&current->sighand->count);
  1808			return 0;
  1809		}
  1810		sig = kmem_cache_alloc(sighand_cachep, GFP_KERNEL);
  1811		RCU_INIT_POINTER(tsk->sighand, sig);
  1812		if (!sig)
  1813			return -ENOMEM;
  1814	
  1815		refcount_set(&sig->count, 1);
  1816		spin_lock_irq(&current->sighand->siglock);
  1817		memcpy(sig->action, current->sighand->action, sizeof(sig->action));
  1818		spin_unlock_irq(&current->sighand->siglock);
  1819	
  1820		/* Reset all signal handler not set to SIG_IGN to SIG_DFL. */
  1821		if (clone_flags & CLONE_CLEAR_SIGHAND)
  1822			flush_signal_handlers(tsk, 0);
  1823	
  1824		return 0;
  1825	}
  1826	
  1827	void __cleanup_sighand(struct sighand_struct *sighand)
  1828	{
  1829		if (refcount_dec_and_test(&sighand->count)) {
  1830			signalfd_cleanup(sighand);
  1831			/*
  1832			 * sighand_cachep is SLAB_TYPESAFE_BY_RCU so we can free it
  1833			 * without an RCU grace period, see __lock_task_sighand().
  1834			 */
  1835			kmem_cache_free(sighand_cachep, sighand);
  1836		}
  1837	}
  1838	
  1839	/*
  1840	 * Initialize POSIX timer handling for a thread group.
  1841	 */
  1842	static void posix_cpu_timers_init_group(struct signal_struct *sig)
  1843	{
  1844		struct posix_cputimers *pct = &sig->posix_cputimers;
  1845		unsigned long cpu_limit;
  1846	
  1847		cpu_limit = READ_ONCE(sig->rlim[RLIMIT_CPU].rlim_cur);
  1848		posix_cputimers_group_init(pct, cpu_limit);
  1849	}
  1850	
  1851	void kpatch_foo(void);
  1852	void kpatch_foo(void)
  1853	{
  1854		if (!jiffies)
  1855			printk("kpatch copy signal\n");
  1856	}
  1857	
  1858	static int copy_signal(unsigned long clone_flags, struct task_struct *tsk)
  1859	{
  1860		struct signal_struct *sig;
  1861	
  1862		kpatch_foo();
  1863	
  1864		if (clone_flags & CLONE_THREAD)
  1865			return 0;
  1866	
  1867		sig = kmem_cache_zalloc(signal_cachep, GFP_KERNEL);
  1868		tsk->signal = sig;
  1869		if (!sig)
  1870			return -ENOMEM;
  1871	
  1872		sig->nr_threads = 1;
  1873		sig->quick_threads = 1;
  1874		atomic_set(&sig->live, 1);
  1875		refcount_set(&sig->sigcnt, 1);
  1876	
  1877		/* list_add(thread_node, thread_head) without INIT_LIST_HEAD() */
  1878		sig->thread_head = (struct list_head)LIST_HEAD_INIT(tsk->thread_node);
  1879		tsk->thread_node = (struct list_head)LIST_HEAD_INIT(sig->thread_head);
  1880	
  1881		init_waitqueue_head(&sig->wait_chldexit);
  1882		sig->curr_target = tsk;
  1883		init_sigpending(&sig->shared_pending);
  1884		INIT_HLIST_HEAD(&sig->multiprocess);
  1885		seqlock_init(&sig->stats_lock);
  1886		prev_cputime_init(&sig->prev_cputime);
  1887	
  1888	#ifdef CONFIG_POSIX_TIMERS
  1889		INIT_LIST_HEAD(&sig->posix_timers);
  1890		hrtimer_init(&sig->real_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
  1891		sig->real_timer.function = it_real_fn;
  1892	#endif
  1893	
  1894		task_lock(current->group_leader);
  1895		memcpy(sig->rlim, current->signal->rlim, sizeof sig->rlim);
  1896		task_unlock(current->group_leader);
  1897	
  1898		posix_cpu_timers_init_group(sig);
  1899	
  1900		tty_audit_fork(sig);
  1901		sched_autogroup_fork(sig);
  1902	
  1903		sig->oom_score_adj = current->signal->oom_score_adj;
  1904		sig->oom_score_adj_min = current->signal->oom_score_adj_min;
  1905	
  1906		mutex_init(&sig->cred_guard_mutex);
  1907		init_rwsem(&sig->exec_update_lock);
  1908	
  1909		return 0;
  1910	}
  1911	
  1912	static void copy_seccomp(struct task_struct *p)
  1913	{
  1914	#ifdef CONFIG_SECCOMP
  1915		/*
  1916		 * Must be called with sighand->lock held, which is common to
  1917		 * all threads in the group. Holding cred_guard_mutex is not
  1918		 * needed because this new task is not yet running and cannot
  1919		 * be racing exec.
  1920		 */
  1921		assert_spin_locked(&current->sighand->siglock);
  1922	
  1923		/* Ref-count the new filter user, and assign it. */
  1924		get_seccomp_filter(current);
  1925		p->seccomp = current->seccomp;
  1926	
  1927		/*
  1928		 * Explicitly enable no_new_privs here in case it got set
  1929		 * between the task_struct being duplicated and holding the
  1930		 * sighand lock. The seccomp state and nnp must be in sync.
  1931		 */
  1932		if (task_no_new_privs(current))
  1933			task_set_no_new_privs(p);
  1934	
  1935		/*
  1936		 * If the parent gained a seccomp mode after copying thread
  1937		 * flags and between before we held the sighand lock, we have
  1938		 * to manually enable the seccomp thread flag here.
  1939		 */
  1940		if (p->seccomp.mode != SECCOMP_MODE_DISABLED)
  1941			set_task_syscall_work(p, SECCOMP);
  1942	#endif
  1943	}
  1944	
  1945	SYSCALL_DEFINE1(set_tid_address, int __user *, tidptr)
  1946	{
  1947		current->clear_child_tid = tidptr;
  1948	
  1949		return task_pid_vnr(current);
  1950	}
  1951	
  1952	static void rt_mutex_init_task(struct task_struct *p)
  1953	{
  1954		raw_spin_lock_init(&p->pi_lock);
  1955	#ifdef CONFIG_RT_MUTEXES
  1956		p->pi_waiters = RB_ROOT_CACHED;
  1957		p->pi_top_task = NULL;
  1958		p->pi_blocked_on = NULL;
  1959	#endif
  1960	}
  1961	
  1962	static inline void init_task_pid_links(struct task_struct *task)
  1963	{
  1964		enum pid_type type;
  1965	
  1966		for (type = PIDTYPE_PID; type < PIDTYPE_MAX; ++type)
  1967			INIT_HLIST_NODE(&task->pid_links[type]);
  1968	}
  1969	
  1970	static inline void
  1971	init_task_pid(struct task_struct *task, enum pid_type type, struct pid *pid)
  1972	{
  1973		if (type == PIDTYPE_PID)
  1974			task->thread_pid = pid;
  1975		else
  1976			task->signal->pids[type] = pid;
  1977	}
  1978	
  1979	static inline void rcu_copy_process(struct task_struct *p)
  1980	{
  1981	#ifdef CONFIG_PREEMPT_RCU
  1982		p->rcu_read_lock_nesting = 0;
  1983		p->rcu_read_unlock_special.s = 0;
  1984		p->rcu_blocked_node = NULL;
  1985		INIT_LIST_HEAD(&p->rcu_node_entry);
  1986	#endif /* #ifdef CONFIG_PREEMPT_RCU */
  1987	#ifdef CONFIG_TASKS_RCU
  1988		p->rcu_tasks_holdout = false;
  1989		INIT_LIST_HEAD(&p->rcu_tasks_holdout_list);
  1990		p->rcu_tasks_idle_cpu = -1;
  1991		INIT_LIST_HEAD(&p->rcu_tasks_exit_list);
  1992	#endif /* #ifdef CONFIG_TASKS_RCU */
  1993	#ifdef CONFIG_TASKS_TRACE_RCU
  1994		p->trc_reader_nesting = 0;
  1995		p->trc_reader_special.s = 0;
  1996		INIT_LIST_HEAD(&p->trc_holdout_list);
  1997		INIT_LIST_HEAD(&p->trc_blkd_node);
  1998	#endif /* #ifdef CONFIG_TASKS_TRACE_RCU */
  1999	}
  2000	
  2001	/**
  2002	 * __pidfd_prepare - allocate a new pidfd_file and reserve a pidfd
  2003	 * @pid:   the struct pid for which to create a pidfd
  2004	 * @flags: flags of the new @pidfd
  2005	 * @ret: Where to return the file for the pidfd.
  2006	 *
  2007	 * Allocate a new file that stashes @pid and reserve a new pidfd number in the
  2008	 * caller's file descriptor table. The pidfd is reserved but not installed yet.
  2009	 *
  2010	 * The helper doesn't perform checks on @pid which makes it useful for pidfds
  2011	 * created via CLONE_PIDFD where @pid has no task attached when the pidfd and
  2012	 * pidfd file are prepared.
  2013	 *
  2014	 * If this function returns successfully the caller is responsible to either
  2015	 * call fd_install() passing the returned pidfd and pidfd file as arguments in
  2016	 * order to install the pidfd into its file descriptor table or they must use
  2017	 * put_unused_fd() and fput() on the returned pidfd and pidfd file
  2018	 * respectively.
  2019	 *
  2020	 * This function is useful when a pidfd must already be reserved but there
  2021	 * might still be points of failure afterwards and the caller wants to ensure
  2022	 * that no pidfd is leaked into its file descriptor table.
  2023	 *
  2024	 * Return: On success, a reserved pidfd is returned from the function and a new
  2025	 *         pidfd file is returned in the last argument to the function. On
  2026	 *         error, a negative error code is returned from the function and the
  2027	 *         last argument remains unchanged.
  2028	 */
  2029	static int __pidfd_prepare(struct pid *pid, unsigned int flags, struct file **ret)
  2030	{
  2031		int pidfd;
  2032		struct file *pidfd_file;
  2033	
  2034		pidfd = get_unused_fd_flags(O_CLOEXEC);
  2035		if (pidfd < 0)
  2036			return pidfd;
  2037	
  2038		pidfd_file = pidfs_alloc_file(pid, flags | O_RDWR);
  2039		if (IS_ERR(pidfd_file)) {
  2040			put_unused_fd(pidfd);
  2041			return PTR_ERR(pidfd_file);
  2042		}
  2043		/*
  2044		 * anon_inode_getfile() ignores everything outside of the
  2045		 * O_ACCMODE | O_NONBLOCK mask, set PIDFD_THREAD manually.
  2046		 */
  2047		pidfd_file->f_flags |= (flags & PIDFD_THREAD);
  2048		*ret = pidfd_file;
  2049		return pidfd;
  2050	}
  2051	
  2052	/**
  2053	 * pidfd_prepare - allocate a new pidfd_file and reserve a pidfd
  2054	 * @pid:   the struct pid for which to create a pidfd
  2055	 * @flags: flags of the new @pidfd
  2056	 * @ret: Where to return the pidfd.
  2057	 *
  2058	 * Allocate a new file that stashes @pid and reserve a new pidfd number in the
  2059	 * caller's file descriptor table. The pidfd is reserved but not installed yet.
  2060	 *
  2061	 * The helper verifies that @pid is still in use, without PIDFD_THREAD the
  2062	 * task identified by @pid must be a thread-group leader.
  2063	 *
  2064	 * If this function returns successfully the caller is responsible to either
  2065	 * call fd_install() passing the returned pidfd and pidfd file as arguments in
  2066	 * order to install the pidfd into its file descriptor table or they must use
  2067	 * put_unused_fd() and fput() on the returned pidfd and pidfd file
  2068	 * respectively.
  2069	 *
  2070	 * This function is useful when a pidfd must already be reserved but there
  2071	 * might still be points of failure afterwards and the caller wants to ensure
  2072	 * that no pidfd is leaked into its file descriptor table.
  2073	 *
  2074	 * Return: On success, a reserved pidfd is returned from the function and a new
  2075	 *         pidfd file is returned in the last argument to the function. On
  2076	 *         error, a negative error code is returned from the function and the
  2077	 *         last argument remains unchanged.
  2078	 */
  2079	int pidfd_prepare(struct pid *pid, unsigned int flags, struct file **ret)
  2080	{
  2081		bool thread = flags & PIDFD_THREAD;
  2082	
  2083		if (!pid || !pid_has_task(pid, thread ? PIDTYPE_PID : PIDTYPE_TGID))
  2084			return -EINVAL;
  2085	
  2086		return __pidfd_prepare(pid, flags, ret);
  2087	}
  2088	
  2089	static void __delayed_free_task(struct rcu_head *rhp)
  2090	{
  2091		struct task_struct *tsk = container_of(rhp, struct task_struct, rcu);
  2092	
  2093		free_task(tsk);
  2094	}
  2095	
  2096	static __always_inline void delayed_free_task(struct task_struct *tsk)
  2097	{
  2098		if (IS_ENABLED(CONFIG_MEMCG))
  2099			call_rcu(&tsk->rcu, __delayed_free_task);
  2100		else
  2101			free_task(tsk);
  2102	}
  2103	
  2104	static void copy_oom_score_adj(u64 clone_flags, struct task_struct *tsk)
  2105	{
  2106		/* Skip if kernel thread */
  2107		if (!tsk->mm)
  2108			return;
  2109	
  2110		/* Skip if spawning a thread or using vfork */
  2111		if ((clone_flags & (CLONE_VM | CLONE_THREAD | CLONE_VFORK)) != CLONE_VM)
  2112			return;
  2113	
  2114		/* We need to synchronize with __set_oom_adj */
  2115		mutex_lock(&oom_adj_mutex);
  2116		set_bit(MMF_MULTIPROCESS, &tsk->mm->flags);
  2117		/* Update the values in case they were changed after copy_signal */
  2118		tsk->signal->oom_score_adj = current->signal->oom_score_adj;
  2119		tsk->signal->oom_score_adj_min = current->signal->oom_score_adj_min;
  2120		mutex_unlock(&oom_adj_mutex);
  2121	}
  2122	
  2123	#ifdef CONFIG_RV
  2124	static void rv_task_fork(struct task_struct *p)
  2125	{
  2126		int i;
  2127	
  2128		for (i = 0; i < RV_PER_TASK_MONITORS; i++)
  2129			p->rv[i].da_mon.monitoring = false;
  2130	}
  2131	#else
  2132	#define rv_task_fork(p) do {} while (0)
  2133	#endif
  2134	
  2135	/*
  2136	 * This creates a new process as a copy of the old one,
  2137	 * but does not actually start it yet.
  2138	 *
  2139	 * It copies the registers, and all the appropriate
  2140	 * parts of the process environment (as per the clone
  2141	 * flags). The actual kick-off is left to the caller.
  2142	 */
  2143	__latent_entropy struct task_struct *copy_process(
  2144						struct pid *pid,
  2145						int trace,
  2146						int node,
  2147						struct kernel_clone_args *args)
  2148	{
  2149		int pidfd = -1, retval;
  2150		struct task_struct *p;
  2151		struct multiprocess_signals delayed;
  2152		struct file *pidfile = NULL;
  2153		const u64 clone_flags = args->flags;
  2154		struct nsproxy *nsp = current->nsproxy;
  2155	
  2156		/*
  2157		 * Don't allow sharing the root directory with processes in a different
  2158		 * namespace
  2159		 */
  2160		if ((clone_flags & (CLONE_NEWNS|CLONE_FS)) == (CLONE_NEWNS|CLONE_FS))
  2161			return ERR_PTR(-EINVAL);
  2162	
  2163		if ((clone_flags & (CLONE_NEWUSER|CLONE_FS)) == (CLONE_NEWUSER|CLONE_FS))
  2164			return ERR_PTR(-EINVAL);
  2165	
  2166		/*
  2167		 * Thread groups must share signals as well, and detached threads
  2168		 * can only be started up within the thread group.
  2169		 */
  2170		if ((clone_flags & CLONE_THREAD) && !(clone_flags & CLONE_SIGHAND))
  2171			return ERR_PTR(-EINVAL);
  2172	
  2173		/*
  2174		 * Shared signal handlers imply shared VM. By way of the above,
  2175		 * thread groups also imply shared VM. Blocking this case allows
  2176		 * for various simplifications in other code.
  2177		 */
  2178		if ((clone_flags & CLONE_SIGHAND) && !(clone_flags & CLONE_VM))
  2179			return ERR_PTR(-EINVAL);
  2180	
  2181		/*
  2182		 * Siblings of global init remain as zombies on exit since they are
  2183		 * not reaped by their parent (swapper). To solve this and to avoid
  2184		 * multi-rooted process trees, prevent global and container-inits
  2185		 * from creating siblings.
  2186		 */
  2187		if ((clone_flags & CLONE_PARENT) &&
  2188					current->signal->flags & SIGNAL_UNKILLABLE)
  2189			return ERR_PTR(-EINVAL);
  2190	
  2191		/*
  2192		 * If the new process will be in a different pid or user namespace
  2193		 * do not allow it to share a thread group with the forking task.
  2194		 */
  2195		if (clone_flags & CLONE_THREAD) {
  2196			if ((clone_flags & (CLONE_NEWUSER | CLONE_NEWPID)) ||
  2197			    (task_active_pid_ns(current) != nsp->pid_ns_for_children))
  2198				return ERR_PTR(-EINVAL);
  2199		}
  2200	
  2201		if (clone_flags & CLONE_PIDFD) {
  2202			/*
  2203			 * - CLONE_DETACHED is blocked so that we can potentially
  2204			 *   reuse it later for CLONE_PIDFD.
  2205			 */
  2206			if (clone_flags & CLONE_DETACHED)
  2207				return ERR_PTR(-EINVAL);
  2208		}
  2209	
  2210		/*
  2211		 * Force any signals received before this point to be delivered
  2212		 * before the fork happens.  Collect up signals sent to multiple
  2213		 * processes that happen during the fork and delay them so that
  2214		 * they appear to happen after the fork.
  2215		 */
  2216		sigemptyset(&delayed.signal);
  2217		INIT_HLIST_NODE(&delayed.node);
  2218	
  2219		spin_lock_irq(&current->sighand->siglock);
  2220		if (!(clone_flags & CLONE_THREAD))
  2221			hlist_add_head(&delayed.node, &current->signal->multiprocess);
  2222		recalc_sigpending();
  2223		spin_unlock_irq(&current->sighand->siglock);
  2224		retval = -ERESTARTNOINTR;
  2225		if (task_sigpending(current))
  2226			goto fork_out;
  2227	
  2228		retval = -ENOMEM;
  2229		p = dup_task_struct(current, node);
  2230		if (!p)
  2231			goto fork_out;
  2232		p->flags &= ~PF_KTHREAD;
  2233		if (args->kthread)
  2234			p->flags |= PF_KTHREAD;
  2235		if (args->user_worker) {
  2236			/*
  2237			 * Mark us a user worker, and block any signal that isn't
  2238			 * fatal or STOP
  2239			 */
  2240			p->flags |= PF_USER_WORKER;
  2241			siginitsetinv(&p->blocked, sigmask(SIGKILL)|sigmask(SIGSTOP));
  2242		}
  2243		if (args->io_thread)
  2244			p->flags |= PF_IO_WORKER;
  2245	
  2246		if (args->name)
  2247			strscpy_pad(p->comm, args->name, sizeof(p->comm));
  2248	
  2249		p->set_child_tid = (clone_flags & CLONE_CHILD_SETTID) ? args->child_tid : NULL;
  2250		/*
  2251		 * Clear TID on mm_release()?
  2252		 */
  2253		p->clear_child_tid = (clone_flags & CLONE_CHILD_CLEARTID) ? args->child_tid : NULL;
  2254	
  2255		ftrace_graph_init_task(p);
  2256	
  2257		rt_mutex_init_task(p);
  2258	
  2259		lockdep_assert_irqs_enabled();
  2260	#ifdef CONFIG_PROVE_LOCKING
  2261		DEBUG_LOCKS_WARN_ON(!p->softirqs_enabled);
  2262	#endif
  2263		retval = copy_creds(p, clone_flags);
  2264		if (retval < 0)
  2265			goto bad_fork_free;
  2266	
  2267		retval = -EAGAIN;
  2268		if (is_rlimit_overlimit(task_ucounts(p), UCOUNT_RLIMIT_NPROC, rlimit(RLIMIT_NPROC))) {
  2269			if (p->real_cred->user != INIT_USER &&
  2270			    !capable(CAP_SYS_RESOURCE) && !capable(CAP_SYS_ADMIN))
  2271				goto bad_fork_cleanup_count;
  2272		}
  2273		current->flags &= ~PF_NPROC_EXCEEDED;
  2274	
  2275		/*
  2276		 * If multiple threads are within copy_process(), then this check
  2277		 * triggers too late. This doesn't hurt, the check is only there
  2278		 * to stop root fork bombs.
  2279		 */
  2280		retval = -EAGAIN;
  2281		if (data_race(nr_threads >= max_threads))
  2282			goto bad_fork_cleanup_count;
  2283	
  2284		delayacct_tsk_init(p);	/* Must remain after dup_task_struct() */
  2285		p->flags &= ~(PF_SUPERPRIV | PF_WQ_WORKER | PF_IDLE | PF_NO_SETAFFINITY);
  2286		p->flags |= PF_FORKNOEXEC;
  2287		INIT_LIST_HEAD(&p->children);
  2288		INIT_LIST_HEAD(&p->sibling);
  2289		rcu_copy_process(p);
  2290		p->vfork_done = NULL;
  2291		spin_lock_init(&p->alloc_lock);
  2292	
  2293		init_sigpending(&p->pending);
  2294	
  2295		p->utime = p->stime = p->gtime = 0;
  2296	#ifdef CONFIG_ARCH_HAS_SCALED_CPUTIME
  2297		p->utimescaled = p->stimescaled = 0;
  2298	#endif
  2299		prev_cputime_init(&p->prev_cputime);
  2300	
  2301	#ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
  2302		seqcount_init(&p->vtime.seqcount);
  2303		p->vtime.starttime = 0;
  2304		p->vtime.state = VTIME_INACTIVE;
  2305	#endif
  2306	
  2307	#ifdef CONFIG_IO_URING
  2308		p->io_uring = NULL;
  2309	#endif
  2310	
  2311		p->default_timer_slack_ns = current->timer_slack_ns;
  2312	
  2313	#ifdef CONFIG_PSI
  2314		p->psi_flags = 0;
  2315	#endif
  2316	
  2317		task_io_accounting_init(&p->ioac);
  2318		acct_clear_integrals(p);
  2319	
  2320		posix_cputimers_init(&p->posix_cputimers);
  2321	
  2322		p->io_context = NULL;
  2323		audit_set_context(p, NULL);
  2324		cgroup_fork(p);
  2325		if (args->kthread) {
  2326			if (!set_kthread_struct(p))
  2327				goto bad_fork_cleanup_delayacct;
  2328		}
  2329	#ifdef CONFIG_NUMA
  2330		p->mempolicy = mpol_dup(p->mempolicy);
  2331		if (IS_ERR(p->mempolicy)) {
  2332			retval = PTR_ERR(p->mempolicy);
  2333			p->mempolicy = NULL;
  2334			goto bad_fork_cleanup_delayacct;
  2335		}
  2336	#endif
  2337	#ifdef CONFIG_CPUSETS
  2338		p->cpuset_mem_spread_rotor = NUMA_NO_NODE;
  2339		p->cpuset_slab_spread_rotor = NUMA_NO_NODE;
  2340		seqcount_spinlock_init(&p->mems_allowed_seq, &p->alloc_lock);
  2341	#endif
  2342	#ifdef CONFIG_TRACE_IRQFLAGS
  2343		memset(&p->irqtrace, 0, sizeof(p->irqtrace));
  2344		p->irqtrace.hardirq_disable_ip	= _THIS_IP_;
  2345		p->irqtrace.softirq_enable_ip	= _THIS_IP_;
  2346		p->softirqs_enabled		= 1;
  2347		p->softirq_context		= 0;
  2348	#endif
  2349	
  2350		p->pagefault_disabled = 0;
  2351	
  2352	#ifdef CONFIG_LOCKDEP
  2353		lockdep_init_task(p);
  2354	#endif
  2355	
  2356	#ifdef CONFIG_DEBUG_MUTEXES
  2357		p->blocked_on = NULL; /* not blocked yet */
  2358	#endif
  2359	#ifdef CONFIG_BCACHE
  2360		p->sequential_io	= 0;
  2361		p->sequential_io_avg	= 0;
  2362	#endif
  2363	#ifdef CONFIG_BPF_SYSCALL
  2364		RCU_INIT_POINTER(p->bpf_storage, NULL);
  2365		p->bpf_ctx = NULL;
  2366	#endif
  2367	
  2368		/* Perform scheduler related setup. Assign this task to a CPU. */
  2369		retval = sched_fork(clone_flags, p);
  2370		if (retval)
  2371			goto bad_fork_cleanup_policy;
  2372	
  2373		retval = perf_event_init_task(p, clone_flags);
  2374		if (retval)
  2375			goto bad_fork_cleanup_policy;
  2376		retval = audit_alloc(p);
  2377		if (retval)
  2378			goto bad_fork_cleanup_perf;
  2379		/* copy all the process information */
  2380		shm_init_task(p);
  2381		retval = security_task_alloc(p, clone_flags);
  2382		if (retval)
  2383			goto bad_fork_cleanup_audit;
  2384		retval = copy_semundo(clone_flags, p);
  2385		if (retval)
  2386			goto bad_fork_cleanup_security;
  2387		retval = copy_files(clone_flags, p, args->no_files);
  2388		if (retval)
  2389			goto bad_fork_cleanup_semundo;
  2390		retval = copy_fs(clone_flags, p);
  2391		if (retval)
  2392			goto bad_fork_cleanup_files;
  2393		retval = copy_sighand(clone_flags, p);
  2394		if (retval)
  2395			goto bad_fork_cleanup_fs;
  2396		retval = copy_signal(clone_flags, p);
  2397		if (retval)
  2398			goto bad_fork_cleanup_sighand;
  2399		retval = copy_mm(clone_flags, p);
  2400		if (retval)
  2401			goto bad_fork_cleanup_signal;
  2402		retval = copy_namespaces(clone_flags, p);
  2403		if (retval)
  2404			goto bad_fork_cleanup_mm;
  2405		retval = copy_io(clone_flags, p);
  2406		if (retval)
  2407			goto bad_fork_cleanup_namespaces;
  2408		retval = copy_thread(p, args);
  2409		if (retval)
  2410			goto bad_fork_cleanup_io;
  2411	
  2412		stackleak_task_init(p);
  2413	
  2414		if (pid != &init_struct_pid) {
  2415			pid = alloc_pid(p->nsproxy->pid_ns_for_children, args->set_tid,
  2416					args->set_tid_size);
  2417			if (IS_ERR(pid)) {
  2418				retval = PTR_ERR(pid);
  2419				goto bad_fork_cleanup_thread;
  2420			}
  2421		}
  2422	
  2423		/*
  2424		 * This has to happen after we've potentially unshared the file
  2425		 * descriptor table (so that the pidfd doesn't leak into the child
  2426		 * if the fd table isn't shared).
  2427		 */
  2428		if (clone_flags & CLONE_PIDFD) {
  2429			int flags = (clone_flags & CLONE_THREAD) ? PIDFD_THREAD : 0;
  2430	
  2431			/* Note that no task has been attached to @pid yet. */
  2432			retval = __pidfd_prepare(pid, flags, &pidfile);
  2433			if (retval < 0)
  2434				goto bad_fork_free_pid;
  2435			pidfd = retval;
  2436	
  2437			retval = put_user(pidfd, args->pidfd);
  2438			if (retval)
  2439				goto bad_fork_put_pidfd;
  2440		}
  2441	
  2442	#ifdef CONFIG_BLOCK
  2443		p->plug = NULL;
  2444	#endif
  2445		futex_init_task(p);
  2446	
  2447		/*
  2448		 * sigaltstack should be cleared when sharing the same VM
  2449		 */
  2450		if ((clone_flags & (CLONE_VM|CLONE_VFORK)) == CLONE_VM)
  2451			sas_ss_reset(p);
  2452	
  2453		/*
  2454		 * Syscall tracing and stepping should be turned off in the
  2455		 * child regardless of CLONE_PTRACE.
  2456		 */
  2457		user_disable_single_step(p);
  2458		clear_task_syscall_work(p, SYSCALL_TRACE);
  2459	#if defined(CONFIG_GENERIC_ENTRY) || defined(TIF_SYSCALL_EMU)
  2460		clear_task_syscall_work(p, SYSCALL_EMU);
  2461	#endif
  2462		clear_tsk_latency_tracing(p);
  2463	
  2464		/* ok, now we should be set up.. */
  2465		p->pid = pid_nr(pid);
  2466		if (clone_flags & CLONE_THREAD) {
  2467			p->group_leader = current->group_leader;
  2468			p->tgid = current->tgid;
  2469		} else {
  2470			p->group_leader = p;
  2471			p->tgid = p->pid;
  2472		}
  2473	
  2474		p->nr_dirtied = 0;
  2475		p->nr_dirtied_pause = 128 >> (PAGE_SHIFT - 10);
  2476		p->dirty_paused_when = 0;
  2477	
  2478		p->pdeath_signal = 0;
  2479		p->task_works = NULL;
  2480		clear_posix_cputimers_work(p);
  2481	
  2482	#ifdef CONFIG_KRETPROBES
  2483		p->kretprobe_instances.first = NULL;
  2484	#endif
  2485	#ifdef CONFIG_RETHOOK
  2486		p->rethooks.first = NULL;
  2487	#endif
  2488	
  2489		/*
  2490		 * Ensure that the cgroup subsystem policies allow the new process to be
  2491		 * forked. It should be noted that the new process's css_set can be changed
  2492		 * between here and cgroup_post_fork() if an organisation operation is in
  2493		 * progress.
  2494		 */
  2495		retval = cgroup_can_fork(p, args);
  2496		if (retval)
  2497			goto bad_fork_put_pidfd;
  2498	
  2499		/*
  2500		 * Now that the cgroups are pinned, re-clone the parent cgroup and put
  2501		 * the new task on the correct runqueue. All this *before* the task
  2502		 * becomes visible.
  2503		 *
  2504		 * This isn't part of ->can_fork() because while the re-cloning is
  2505		 * cgroup specific, it unconditionally needs to place the task on a
  2506		 * runqueue.
  2507		 */
  2508		sched_cgroup_fork(p, args);
  2509	
  2510		/*
  2511		 * From this point on we must avoid any synchronous user-space
  2512		 * communication until we take the tasklist-lock. In particular, we do
  2513		 * not want user-space to be able to predict the process start-time by
  2514		 * stalling fork(2) after we recorded the start_time but before it is
  2515		 * visible to the system.
  2516		 */
  2517	
  2518		p->start_time = ktime_get_ns();
  2519		p->start_boottime = ktime_get_boottime_ns();
  2520	
  2521		/*
  2522		 * Make it visible to the rest of the system, but dont wake it up yet.
  2523		 * Need tasklist lock for parent etc handling!
  2524		 */
  2525		write_lock_irq(&tasklist_lock);
  2526	
  2527		/* CLONE_PARENT re-uses the old parent */
  2528		if (clone_flags & (CLONE_PARENT|CLONE_THREAD)) {
  2529			p->real_parent = current->real_parent;
  2530			p->parent_exec_id = current->parent_exec_id;
  2531			if (clone_flags & CLONE_THREAD)
  2532				p->exit_signal = -1;
  2533			else
  2534				p->exit_signal = current->group_leader->exit_signal;
  2535		} else {
  2536			p->real_parent = current;
  2537			p->parent_exec_id = current->self_exec_id;
  2538			p->exit_signal = args->exit_signal;
  2539		}
  2540	
  2541		klp_copy_process(p);
  2542	
  2543		sched_core_fork(p);
  2544	
  2545		spin_lock(&current->sighand->siglock);
  2546	
  2547		rv_task_fork(p);
  2548	
  2549		rseq_fork(p, clone_flags);
  2550	
  2551		/* Don't start children in a dying pid namespace */
  2552		if (unlikely(!(ns_of_pid(pid)->pid_allocated & PIDNS_ADDING))) {
  2553			retval = -ENOMEM;
  2554			goto bad_fork_cancel_cgroup;
  2555		}
  2556	
  2557		/* Let kill terminate clone/fork in the middle */
  2558		if (fatal_signal_pending(current)) {
  2559			retval = -EINTR;
  2560			goto bad_fork_cancel_cgroup;
  2561		}
  2562	
  2563		/* No more failure paths after this point. */
  2564	
  2565		/*
  2566		 * Copy seccomp details explicitly here, in case they were changed
  2567		 * before holding sighand lock.
  2568		 */
  2569		copy_seccomp(p);
  2570	
  2571		init_task_pid_links(p);
  2572		if (likely(p->pid)) {
  2573			ptrace_init_task(p, (clone_flags & CLONE_PTRACE) || trace);
  2574	
  2575			init_task_pid(p, PIDTYPE_PID, pid);
  2576			if (thread_group_leader(p)) {
  2577				init_task_pid(p, PIDTYPE_TGID, pid);
  2578				init_task_pid(p, PIDTYPE_PGID, task_pgrp(current));
  2579				init_task_pid(p, PIDTYPE_SID, task_session(current));
  2580	
  2581				if (is_child_reaper(pid)) {
  2582					ns_of_pid(pid)->child_reaper = p;
  2583					p->signal->flags |= SIGNAL_UNKILLABLE;
  2584				}
  2585				p->signal->shared_pending.signal = delayed.signal;
  2586				p->signal->tty = tty_kref_get(current->signal->tty);
  2587				/*
  2588				 * Inherit has_child_subreaper flag under the same
  2589				 * tasklist_lock with adding child to the process tree
  2590				 * for propagate_has_child_subreaper optimization.
  2591				 */
  2592				p->signal->has_child_subreaper = p->real_parent->signal->has_child_subreaper ||
  2593								 p->real_parent->signal->is_child_subreaper;
  2594				list_add_tail(&p->sibling, &p->real_parent->children);
  2595				list_add_tail_rcu(&p->tasks, &init_task.tasks);
  2596				attach_pid(p, PIDTYPE_TGID);
  2597				attach_pid(p, PIDTYPE_PGID);
  2598				attach_pid(p, PIDTYPE_SID);
  2599				__this_cpu_inc(process_counts);
  2600			} else {
  2601				current->signal->nr_threads++;
  2602				current->signal->quick_threads++;
  2603				atomic_inc(&current->signal->live);
  2604				refcount_inc(&current->signal->sigcnt);
  2605				task_join_group_stop(p);
  2606				list_add_tail_rcu(&p->thread_node,
  2607						  &p->signal->thread_head);
  2608			}
  2609			attach_pid(p, PIDTYPE_PID);
  2610			nr_threads++;
  2611		}
  2612		total_forks++;
  2613		hlist_del_init(&delayed.node);
  2614		spin_unlock(&current->sighand->siglock);
  2615		syscall_tracepoint_update(p);
  2616		write_unlock_irq(&tasklist_lock);
  2617	
  2618		if (pidfile)
  2619			fd_install(pidfd, pidfile);
  2620	
  2621		proc_fork_connector(p);
  2622		sched_post_fork(p);
  2623		cgroup_post_fork(p, args);
  2624		perf_event_fork(p);
  2625	
  2626		trace_task_newtask(p, clone_flags);
  2627		uprobe_copy_process(p, clone_flags);
  2628		user_events_fork(p, clone_flags);
  2629	
  2630		copy_oom_score_adj(clone_flags, p);
  2631	
  2632		return p;
  2633	
  2634	bad_fork_cancel_cgroup:
  2635		sched_core_free(p);
  2636		spin_unlock(&current->sighand->siglock);
  2637		write_unlock_irq(&tasklist_lock);
  2638		cgroup_cancel_fork(p, args);
  2639	bad_fork_put_pidfd:
  2640		if (clone_flags & CLONE_PIDFD) {
  2641			fput(pidfile);
  2642			put_unused_fd(pidfd);
  2643		}
  2644	bad_fork_free_pid:
  2645		if (pid != &init_struct_pid)
  2646			free_pid(pid);
  2647	bad_fork_cleanup_thread:
  2648		exit_thread(p);
  2649	bad_fork_cleanup_io:
  2650		if (p->io_context)
  2651			exit_io_context(p);
  2652	bad_fork_cleanup_namespaces:
  2653		exit_task_namespaces(p);
  2654	bad_fork_cleanup_mm:
  2655		if (p->mm) {
  2656			mm_clear_owner(p->mm, p);
  2657			mmput(p->mm);
  2658		}
  2659	bad_fork_cleanup_signal:
  2660		if (!(clone_flags & CLONE_THREAD))
  2661			free_signal_struct(p->signal);
  2662	bad_fork_cleanup_sighand:
  2663		__cleanup_sighand(p->sighand);
  2664	bad_fork_cleanup_fs:
  2665		exit_fs(p); /* blocking */
  2666	bad_fork_cleanup_files:
  2667		exit_files(p); /* blocking */
  2668	bad_fork_cleanup_semundo:
  2669		exit_sem(p);
  2670	bad_fork_cleanup_security:
  2671		security_task_free(p);
  2672	bad_fork_cleanup_audit:
  2673		audit_free(p);
  2674	bad_fork_cleanup_perf:
  2675		perf_event_free_task(p);
  2676	bad_fork_cleanup_policy:
  2677		lockdep_free_task(p);
  2678	#ifdef CONFIG_NUMA
  2679		mpol_put(p->mempolicy);
  2680	#endif
  2681	bad_fork_cleanup_delayacct:
  2682		delayacct_tsk_free(p);
  2683	bad_fork_cleanup_count:
  2684		dec_rlimit_ucounts(task_ucounts(p), UCOUNT_RLIMIT_NPROC, 1);
  2685		exit_creds(p);
  2686	bad_fork_free:
  2687		WRITE_ONCE(p->__state, TASK_DEAD);
  2688		exit_task_stack_account(p);
  2689		put_task_stack(p);
  2690		delayed_free_task(p);
  2691	fork_out:
  2692		spin_lock_irq(&current->sighand->siglock);
  2693		hlist_del_init(&delayed.node);
  2694		spin_unlock_irq(&current->sighand->siglock);
  2695		return ERR_PTR(retval);
  2696	}
  2697	
  2698	static inline void init_idle_pids(struct task_struct *idle)
  2699	{
  2700		enum pid_type type;
  2701	
  2702		for (type = PIDTYPE_PID; type < PIDTYPE_MAX; ++type) {
  2703			INIT_HLIST_NODE(&idle->pid_links[type]); /* not really needed */
  2704			init_task_pid(idle, type, &init_struct_pid);
  2705		}
  2706	}
  2707	
  2708	static int idle_dummy(void *dummy)
  2709	{
  2710		/* This function is never called */
  2711		return 0;
  2712	}
  2713	
  2714	struct task_struct * __init fork_idle(int cpu)
  2715	{
  2716		struct task_struct *task;
  2717		struct kernel_clone_args args = {
  2718			.flags		= CLONE_VM,
  2719			.fn		= &idle_dummy,
  2720			.fn_arg		= NULL,
  2721			.kthread	= 1,
  2722			.idle		= 1,
  2723		};
  2724	
  2725		task = copy_process(&init_struct_pid, 0, cpu_to_node(cpu), &args);
  2726		if (!IS_ERR(task)) {
  2727			init_idle_pids(task);
  2728			init_idle(task, cpu);
  2729		}
  2730	
  2731		return task;
  2732	}
  2733	
  2734	/*
  2735	 * This is like kernel_clone(), but shaved down and tailored to just
  2736	 * creating io_uring workers. It returns a created task, or an error pointer.
  2737	 * The returned task is inactive, and the caller must fire it up through
  2738	 * wake_up_new_task(p). All signals are blocked in the created task.
  2739	 */
  2740	struct task_struct *create_io_thread(int (*fn)(void *), void *arg, int node)
  2741	{
  2742		unsigned long flags = CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|
  2743					CLONE_IO;
  2744		struct kernel_clone_args args = {
  2745			.flags		= ((lower_32_bits(flags) | CLONE_VM |
  2746					    CLONE_UNTRACED) & ~CSIGNAL),
  2747			.exit_signal	= (lower_32_bits(flags) & CSIGNAL),
  2748			.fn		= fn,
  2749			.fn_arg		= arg,
  2750			.io_thread	= 1,
  2751			.user_worker	= 1,
  2752		};
  2753	
  2754		return copy_process(NULL, 0, node, &args);
  2755	}
  2756	
  2757	/*
  2758	 *  Ok, this is the main fork-routine.
  2759	 *
  2760	 * It copies the process, and if successful kick-starts
  2761	 * it and waits for it to finish using the VM if required.
  2762	 *
  2763	 * args->exit_signal is expected to be checked for sanity by the caller.
  2764	 */
> 2765	#include <linux/livepatch.h>
  2766	pid_t kernel_clone(struct kernel_clone_args *args)
  2767	{
  2768		u64 clone_flags = args->flags;
  2769		struct completion vfork;
  2770		struct pid *pid;
  2771		struct task_struct *p;
  2772		int trace = 0;
  2773		pid_t nr;
  2774		int *newpid;
  2775		static int ctr = 0;
  2776	
  2777		/*
  2778		 * For legacy clone() calls, CLONE_PIDFD uses the parent_tid argument
  2779		 * to return the pidfd. Hence, CLONE_PIDFD and CLONE_PARENT_SETTID are
  2780		 * mutually exclusive. With clone3() CLONE_PIDFD has grown a separate
  2781		 * field in struct clone_args and it still doesn't make sense to have
  2782		 * them both point at the same memory location. Performing this check
  2783		 * here has the advantage that we don't need to have a separate helper
  2784		 * to check for legacy clone().
  2785		 */
  2786		if ((clone_flags & CLONE_PIDFD) &&
  2787		    (clone_flags & CLONE_PARENT_SETTID) &&
  2788		    (args->pidfd == args->parent_tid))
  2789			return -EINVAL;
  2790	
  2791		/*
  2792		 * Determine whether and which event to report to ptracer.  When
  2793		 * called from kernel_thread or CLONE_UNTRACED is explicitly
  2794		 * requested, no event is reported; otherwise, report if the event
  2795		 * for the type of forking is enabled.
  2796		 */
  2797		if (!(clone_flags & CLONE_UNTRACED)) {
  2798			if (clone_flags & CLONE_VFORK)
  2799				trace = PTRACE_EVENT_VFORK;
  2800			else if (args->exit_signal != SIGCHLD)
  2801				trace = PTRACE_EVENT_CLONE;
  2802			else
  2803				trace = PTRACE_EVENT_FORK;
  2804	
  2805			if (likely(!ptrace_event_enabled(current, trace)))
  2806				trace = 0;
  2807		}
  2808	
  2809		p = copy_process(NULL, trace, NUMA_NO_NODE, args);
  2810		add_latent_entropy();
  2811	
  2812		if (IS_ERR(p))
  2813			return PTR_ERR(p);
  2814	
  2815		newpid = klp_shadow_get_or_alloc(p, 0, sizeof(*newpid), GFP_KERNEL,
  2816						 NULL, NULL);
  2817		if (newpid)
  2818			*newpid = ctr++;
  2819	
  2820		/*
  2821		 * Do this prior waking up the new thread - the thread pointer
  2822		 * might get invalid after that point, if the thread exits quickly.
  2823		 */
  2824		trace_sched_process_fork(current, p);
  2825	
  2826		pid = get_task_pid(p, PIDTYPE_PID);
  2827		nr = pid_vnr(pid);
  2828	
  2829		if (clone_flags & CLONE_PARENT_SETTID)
  2830			put_user(nr, args->parent_tid);
  2831	
  2832		if (clone_flags & CLONE_VFORK) {
  2833			p->vfork_done = &vfork;
  2834			init_completion(&vfork);
  2835			get_task_struct(p);
  2836		}
  2837	
  2838		if (IS_ENABLED(CONFIG_LRU_GEN_WALKS_MMU) && !(clone_flags & CLONE_VM)) {
  2839			/* lock the task to synchronize with memcg migration */
  2840			task_lock(p);
  2841			lru_gen_add_mm(p->mm);
  2842			task_unlock(p);
  2843		}
  2844	
  2845		wake_up_new_task(p);
  2846	
  2847		/* forking complete and child started to run, tell ptracer */
  2848		if (unlikely(trace))
  2849			ptrace_event_pid(trace, pid);
  2850	
  2851		if (clone_flags & CLONE_VFORK) {
  2852			if (!wait_for_vfork_done(p, &vfork))
  2853				ptrace_event_pid(PTRACE_EVENT_VFORK_DONE, pid);
  2854		}
  2855	
  2856		put_pid(pid);
  2857		return nr;
  2858	}
  2859	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
