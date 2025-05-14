Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B8B279788
	for <oe-kbuild@lists.linux.dev>; Wed, 14 May 2025 12:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747226789; cv=none; b=OnnMJ/cBuPMY6PhdP6ahxQ7ttzmflWmevyh9DOq6TfPIg+f6UKCJ6thgXoJdF4xMYl0b2XL85SCI1yjzn0omcJVfMarJ8+SJCczAq5JMC/+ZZ62iXdFcs866QMjRUbHb2VxUU5BIH5RhkMDLACxh0nnrcgGTX+yo4PlSEblEvgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747226789; c=relaxed/simple;
	bh=uijnAmPOKxMZ7IMXF/r2ZXWnESZmY2s3ubyLxPCfIXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e1++2/QfiliTPH7ssGTWLnGEecqanx1p8FSS5xDi77ntvh4Nm7bi2SdVKYt+agYP8kjOq+MpLZhxTQx3T0/JkiQSnnl1txRjsRdc2gtbyr17ECMQk07h8Ksw7Ii5KA3t7OzFYKgDIRe18NGVOKvfcpXnQqbPJEU0UxxvLbT1CfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gr6rjtrM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gr6rjtrM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747226785; x=1778762785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uijnAmPOKxMZ7IMXF/r2ZXWnESZmY2s3ubyLxPCfIXA=;
  b=Gr6rjtrMJLknDBbI8upagDIxoQyzFWkZ+niJHAZugScbHRHsW8U01b+4
   WeLVshcY9ZS4opWpx6i8ntYvlalPNFPx8JXDel3rNuYamZZUxYCbu9N/9
   s67AilkmYUmAMaZUBBOTJyn4B9ckF/Q3JbfWNKx/R6jlxJdpUyso9RWKp
   nFR8oC9tAUmBL8BA9mA2zqRRA0SXdT0TD78rcs000b06Jo1xH4dFHUxWO
   dmM3e6NjE2LbDMvQYofBUoaaFYThQ5H+39JD0k6hkt+1vOEaLfs1zq4+2
   gWden9iDnmgQYQud75WHMhwPcBOAliAk3r29OUc6cCU0kiQIduRqe22fB
   g==;
X-CSE-ConnectionGUID: Am9z2/KEQyODaM6YB5/CHQ==
X-CSE-MsgGUID: vR1XVfrNSq+B0wbTmTI0zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48992223"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="48992223"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 05:46:24 -0700
X-CSE-ConnectionGUID: LQNvqr2aSOKY18a79kHY9A==
X-CSE-MsgGUID: ep6f7FzvSLemC1iF+ONswA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="169118763"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 May 2025 05:46:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFBV6-000H7L-26;
	Wed, 14 May 2025 12:46:20 +0000
Date: Wed, 14 May 2025 20:46:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v15 02/43] dept: implement DEPT(DEPendency Tracker)
Message-ID: <202505142043.S0VWSaqE-lkp@intel.com>
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
In-Reply-To: <20250513100730.12664-3-byungchul@sk.com>
References: <20250513100730.12664-3-byungchul@sk.com>
TO: Byungchul Park <byungchul@sk.com>
TO: linux-kernel@vger.kernel.org
CC: kernel_team@skhynix.com
CC: torvalds@linux-foundation.org
CC: damien.lemoal@opensource.wdc.com
CC: linux-ide@vger.kernel.org
CC: adilger.kernel@dilger.ca
CC: linux-ext4@vger.kernel.org
CC: mingo@redhat.com
CC: peterz@infradead.org
CC: will@kernel.org
CC: tglx@linutronix.de
CC: rostedt@goodmis.org
CC: joel@joelfernandes.org
CC: sashal@kernel.org
CC: daniel.vetter@ffwll.ch
CC: duyuyang@gmail.com
CC: johannes.berg@intel.com
CC: tj@kernel.org
CC: tytso@mit.edu
CC: willy@infradead.org
CC: david@fromorbit.com
CC: amir73il@gmail.com
CC: gregkh@linuxfoundation.org
CC: kernel-team@lge.com
CC: linux-mm@kvack.org
CC: akpm@linux-foundation.org
CC: mhocko@kernel.org
CC: minchan@kernel.org
CC: hannes@cmpxchg.org
CC: vdavydov.dev@gmail.com

Hi Byungchul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3]

url:    https://github.com/intel-lab-lkp/linux/commits/Byungchul-Park/llist-move-llist_-head-node-definition-to-types-h/20250513-181346
base:   82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
patch link:    https://lore.kernel.org/r/20250513100730.12664-3-byungchul%40sk.com
patch subject: [PATCH v15 02/43] dept: implement DEPT(DEPendency Tracker)
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505142043.S0VWSaqE-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> kernel/dependency/dept.c: dept_hash.h is included more than once.
>> kernel/dependency/dept.c: dept_object.h is included more than once.

vim +629 kernel/dependency/dept.c

   599	
   600	#define HASH(id, bits)							\
   601	static struct hlist_head table_##id[1 << (bits)];			\
   602										\
   603	static struct hlist_head *head_##id(struct dept_##id *a)		\
   604	{									\
   605		return table_##id + hash_long(key_##id(a), bits);		\
   606	}									\
   607										\
   608	static struct dept_##id *hash_lookup_##id(struct dept_##id *a)		\
   609	{									\
   610		struct dept_##id *b;						\
   611										\
   612		hlist_for_each_entry_rcu(b, head_##id(a), hash_node)		\
   613			if (cmp_##id(a, b))					\
   614				return b;					\
   615		return NULL;							\
   616	}									\
   617										\
   618	static void hash_add_##id(struct dept_##id *a)				\
   619	{									\
   620		get_##id(a);							\
   621		hlist_add_head_rcu(&a->hash_node, head_##id(a));		\
   622	}									\
   623										\
   624	static void hash_del_##id(struct dept_##id *a)				\
   625	{									\
   626		hlist_del_rcu(&a->hash_node);					\
   627		put_##id(a);							\
   628	}
 > 629	#include "dept_hash.h"
   630	#undef  HASH
   631	
   632	static struct dept_dep *lookup_dep(struct dept_class *fc,
   633					   struct dept_class *tc)
   634	{
   635		struct dept_ecxt onetime_e = { .class = fc };
   636		struct dept_wait onetime_w = { .class = tc };
   637		struct dept_dep  onetime_d = { .ecxt = &onetime_e,
   638					       .wait = &onetime_w };
   639		return hash_lookup_dep(&onetime_d);
   640	}
   641	
   642	static struct dept_class *lookup_class(unsigned long key)
   643	{
   644		struct dept_class onetime_c = { .key = key };
   645	
   646		return hash_lookup_class(&onetime_c);
   647	}
   648	
   649	/*
   650	 * Report
   651	 * =====================================================================
   652	 * DEPT prints useful information to help debuging on detection of
   653	 * problematic dependency.
   654	 */
   655	
   656	static void print_ip_stack(unsigned long ip, struct dept_stack *s)
   657	{
   658		if (ip)
   659			print_ip_sym(KERN_WARNING, ip);
   660	
   661	#ifdef CONFIG_DEPT_DEBUG
   662		if (!s)
   663			pr_warn("stack is NULL.\n");
   664		else if (!s->nr)
   665			pr_warn("stack->nr is 0.\n");
   666		if (s)
   667			pr_warn("stack ref is %d.\n", atomic_read(&s->ref));
   668	#endif
   669	
   670		if (valid_stack(s)) {
   671			pr_warn("stacktrace:\n");
   672			stack_trace_print(s->raw, s->nr, 5);
   673		}
   674	
   675		if (!ip && !valid_stack(s))
   676			pr_warn("(N/A)\n");
   677	}
   678	
   679	#define print_spc(spc, fmt, ...) \
   680		pr_warn("%*c" fmt, (spc) * 3, ' ', ##__VA_ARGS__)
   681	
   682	static void print_diagram(struct dept_dep *d)
   683	{
   684		struct dept_ecxt *e = dep_e(d);
   685		struct dept_wait *w = dep_w(d);
   686		struct dept_class *fc = dep_fc(d);
   687		struct dept_class *tc = dep_tc(d);
   688		unsigned long irqf;
   689		int irq;
   690		bool firstline = true;
   691		int spc = 1;
   692		const char *w_fn = w->wait_fn ?: "(unknown)";
   693		const char *e_fn = e->event_fn ?: "(unknown)";
   694		const char *c_fn = e->ecxt_fn ?: "(unknown)";
   695		const char *fc_n = fc->sched_map ? "<sched>" : (fc->name ?: "(unknown)");
   696		const char *tc_n = tc->sched_map ? "<sched>" : (tc->name ?: "(unknown)");
   697	
   698		irqf = e->enirqf & w->irqf;
   699		for_each_set_bit(irq, &irqf, DEPT_IRQS_NR) {
   700			if (!firstline)
   701				pr_warn("\nor\n\n");
   702			firstline = false;
   703	
   704			print_spc(spc, "[S] %s(%s:%d)\n", c_fn, fc_n, fc->sub_id);
   705			print_spc(spc, "    <%s interrupt>\n", irq_str(irq));
   706			print_spc(spc + 1, "[W] %s(%s:%d)\n", w_fn, tc_n, tc->sub_id);
   707			print_spc(spc, "[E] %s(%s:%d)\n", e_fn, fc_n, fc->sub_id);
   708		}
   709	
   710		if (!irqf) {
   711			print_spc(spc, "[S] %s(%s:%d)\n", c_fn, fc_n, fc->sub_id);
   712			print_spc(spc, "[W] %s(%s:%d)\n", w_fn, tc_n, tc->sub_id);
   713			print_spc(spc, "[E] %s(%s:%d)\n", e_fn, fc_n, fc->sub_id);
   714		}
   715	}
   716	
   717	static void print_dep(struct dept_dep *d)
   718	{
   719		struct dept_ecxt *e = dep_e(d);
   720		struct dept_wait *w = dep_w(d);
   721		struct dept_class *fc = dep_fc(d);
   722		struct dept_class *tc = dep_tc(d);
   723		unsigned long irqf;
   724		int irq;
   725		const char *w_fn = w->wait_fn ?: "(unknown)";
   726		const char *e_fn = e->event_fn ?: "(unknown)";
   727		const char *c_fn = e->ecxt_fn ?: "(unknown)";
   728		const char *fc_n = fc->sched_map ? "<sched>" : (fc->name ?: "(unknown)");
   729		const char *tc_n = tc->sched_map ? "<sched>" : (tc->name ?: "(unknown)");
   730	
   731		irqf = e->enirqf & w->irqf;
   732		for_each_set_bit(irq, &irqf, DEPT_IRQS_NR) {
   733			pr_warn("%s has been enabled:\n", irq_str(irq));
   734			print_ip_stack(e->enirq_ip[irq], e->enirq_stack[irq]);
   735			pr_warn("\n");
   736	
   737			pr_warn("[S] %s(%s:%d):\n", c_fn, fc_n, fc->sub_id);
   738			print_ip_stack(e->ecxt_ip, e->ecxt_stack);
   739			pr_warn("\n");
   740	
   741			pr_warn("[W] %s(%s:%d) in %s context:\n",
   742			       w_fn, tc_n, tc->sub_id, irq_str(irq));
   743			print_ip_stack(w->irq_ip[irq], w->irq_stack[irq]);
   744			pr_warn("\n");
   745	
   746			pr_warn("[E] %s(%s:%d):\n", e_fn, fc_n, fc->sub_id);
   747			print_ip_stack(e->event_ip, e->event_stack);
   748		}
   749	
   750		if (!irqf) {
   751			pr_warn("[S] %s(%s:%d):\n", c_fn, fc_n, fc->sub_id);
   752			print_ip_stack(e->ecxt_ip, e->ecxt_stack);
   753			pr_warn("\n");
   754	
   755			pr_warn("[W] %s(%s:%d):\n", w_fn, tc_n, tc->sub_id);
   756			print_ip_stack(w->wait_ip, w->wait_stack);
   757			pr_warn("\n");
   758	
   759			pr_warn("[E] %s(%s:%d):\n", e_fn, fc_n, fc->sub_id);
   760			print_ip_stack(e->event_ip, e->event_stack);
   761		}
   762	}
   763	
   764	static void save_current_stack(int skip);
   765	
   766	/*
   767	 * Print all classes in a circle.
   768	 */
   769	static void print_circle(struct dept_class *c)
   770	{
   771		struct dept_class *fc = c->bfs_parent;
   772		struct dept_class *tc = c;
   773		int i;
   774	
   775		dept_outworld_enter();
   776		save_current_stack(6);
   777	
   778		pr_warn("===================================================\n");
   779		pr_warn("DEPT: Circular dependency has been detected.\n");
   780		pr_warn("%s %.*s %s\n", init_utsname()->release,
   781			(int)strcspn(init_utsname()->version, " "),
   782			init_utsname()->version,
   783			print_tainted());
   784		pr_warn("---------------------------------------------------\n");
   785		pr_warn("summary\n");
   786		pr_warn("---------------------------------------------------\n");
   787	
   788		if (fc == tc)
   789			pr_warn("*** AA DEADLOCK ***\n\n");
   790		else
   791			pr_warn("*** DEADLOCK ***\n\n");
   792	
   793		i = 0;
   794		do {
   795			struct dept_dep *d = lookup_dep(fc, tc);
   796	
   797			pr_warn("context %c\n", 'A' + (i++));
   798			print_diagram(d);
   799			if (fc != c)
   800				pr_warn("\n");
   801	
   802			tc = fc;
   803			fc = fc->bfs_parent;
   804		} while (tc != c);
   805	
   806		pr_warn("\n");
   807		pr_warn("[S]: start of the event context\n");
   808		pr_warn("[W]: the wait blocked\n");
   809		pr_warn("[E]: the event not reachable\n");
   810	
   811		i = 0;
   812		do {
   813			struct dept_dep *d = lookup_dep(fc, tc);
   814	
   815			pr_warn("---------------------------------------------------\n");
   816			pr_warn("context %c's detail\n", 'A' + i);
   817			pr_warn("---------------------------------------------------\n");
   818			pr_warn("context %c\n", 'A' + (i++));
   819			print_diagram(d);
   820			pr_warn("\n");
   821			print_dep(d);
   822	
   823			tc = fc;
   824			fc = fc->bfs_parent;
   825		} while (tc != c);
   826	
   827		pr_warn("---------------------------------------------------\n");
   828		pr_warn("information that might be helpful\n");
   829		pr_warn("---------------------------------------------------\n");
   830		dump_stack();
   831	
   832		dept_outworld_exit();
   833	}
   834	
   835	/*
   836	 * BFS(Breadth First Search)
   837	 * =====================================================================
   838	 * Whenever a new dependency is added into the graph, search the graph
   839	 * for a new circular dependency.
   840	 */
   841	
   842	struct bfs_ops {
   843		void (*bfs_init)(void *, void *, void **);
   844		void (*extend)(struct list_head *, void *);
   845		void *(*dequeue)(struct list_head *);
   846		enum bfs_ret (*callback)(void *, void *, void **);
   847	};
   848	
   849	static unsigned int bfs_gen;
   850	
   851	/*
   852	 * NOTE: Must be called with dept_lock held.
   853	 */
   854	static void bfs(void *root, struct bfs_ops *ops, void *in, void **out)
   855	{
   856		LIST_HEAD(q);
   857		enum bfs_ret ret;
   858	
   859		if (DEPT_WARN_ON(!ops || !ops->bfs_init || !ops->extend ||
   860					!ops->dequeue || !ops->callback))
   861			return;
   862	
   863		/*
   864		 * Avoid zero bfs_gen.
   865		 */
   866		bfs_gen = bfs_gen + 1 ?: 1;
   867		ops->bfs_init(root, in, out);
   868	
   869		ret = ops->callback(root, in, out);
   870		if (ret != BFS_CONTINUE)
   871			return;
   872	
   873		ops->extend(&q, root);
   874		while (!list_empty(&q)) {
   875			void *node = ops->dequeue(&q);
   876	
   877			if (ret == BFS_DONE)
   878				continue;
   879	
   880			ret = ops->callback(node, in, out);
   881			if (ret == BFS_CONTINUE)
   882				ops->extend(&q, node);
   883		}
   884	}
   885	
   886	/*
   887	 * Main operations
   888	 * =====================================================================
   889	 * Add dependencies - Each new dependency is added into the graph and
   890	 * checked if it forms a circular dependency.
   891	 *
   892	 * Track waits - Waits are queued into the ring buffer for later use to
   893	 * generate appropriate dependencies with cross-event.
   894	 *
   895	 * Track event contexts(ecxt) - Event contexts are pushed into local
   896	 * stack for later use to generate appropriate dependencies with waits.
   897	 */
   898	
   899	static unsigned long cur_enirqf(void);
   900	static int cur_irq(void);
   901	static unsigned int cur_ctxt_id(void);
   902	
   903	static struct dept_iecxt *iecxt(struct dept_class *c, int irq)
   904	{
   905		return &c->iecxt[irq];
   906	}
   907	
   908	static struct dept_iwait *iwait(struct dept_class *c, int irq)
   909	{
   910		return &c->iwait[irq];
   911	}
   912	
   913	static void stale_iecxt(struct dept_iecxt *ie)
   914	{
   915		if (ie->ecxt)
   916			put_ecxt(ie->ecxt);
   917	
   918		WRITE_ONCE(ie->ecxt, NULL);
   919		WRITE_ONCE(ie->staled, true);
   920	}
   921	
   922	static void set_iecxt(struct dept_iecxt *ie, struct dept_ecxt *e)
   923	{
   924		/*
   925		 * ->ecxt will never be updated once getting set until the class
   926		 * gets removed.
   927		 */
   928		if (ie->ecxt)
   929			DEPT_WARN_ON(1);
   930		else
   931			WRITE_ONCE(ie->ecxt, get_ecxt(e));
   932	}
   933	
   934	static void stale_iwait(struct dept_iwait *iw)
   935	{
   936		if (iw->wait)
   937			put_wait(iw->wait);
   938	
   939		WRITE_ONCE(iw->wait, NULL);
   940		WRITE_ONCE(iw->staled, true);
   941	}
   942	
   943	static void set_iwait(struct dept_iwait *iw, struct dept_wait *w)
   944	{
   945		/*
   946		 * ->wait will never be updated once getting set until the class
   947		 * gets removed.
   948		 */
   949		if (iw->wait)
   950			DEPT_WARN_ON(1);
   951		else
   952			WRITE_ONCE(iw->wait, get_wait(w));
   953	
   954		iw->touched = true;
   955	}
   956	
   957	static void touch_iwait(struct dept_iwait *iw)
   958	{
   959		iw->touched = true;
   960	}
   961	
   962	static void untouch_iwait(struct dept_iwait *iw)
   963	{
   964		iw->touched = false;
   965	}
   966	
   967	static struct dept_stack *get_current_stack(void)
   968	{
   969		struct dept_stack *s = dept_task()->stack;
   970	
   971		return s ? get_stack(s) : NULL;
   972	}
   973	
   974	static void prepare_current_stack(void)
   975	{
   976		DEPT_WARN_ON(dept_task()->stack);
   977	
   978		dept_task()->stack = new_stack();
   979	}
   980	
   981	static void save_current_stack(int skip)
   982	{
   983		struct dept_stack *s = dept_task()->stack;
   984	
   985		if (!s)
   986			return;
   987	
   988		if (valid_stack(s))
   989			return;
   990	
   991		s->nr = stack_trace_save(s->raw, DEPT_MAX_STACK_ENTRY, skip);
   992	}
   993	
   994	static void finish_current_stack(void)
   995	{
   996		struct dept_stack *s = dept_task()->stack;
   997	
   998		/*
   999		 * Fill the struct dept_stack with a valid stracktrace if it has
  1000		 * been referred at least once.
  1001		 */
  1002		if (stack_consumed(s))
  1003			save_current_stack(2);
  1004	
  1005		dept_task()->stack = NULL;
  1006	
  1007		/*
  1008		 * Actual deletion will happen at put_stack() if the stack has
  1009		 * been referred.
  1010		 */
  1011		if (s)
  1012			del_stack(s);
  1013	}
  1014	
  1015	/*
  1016	 * FIXME: For now, disable LOCKDEP while DEPT is working.
  1017	 *
  1018	 * Both LOCKDEP and DEPT report it on a deadlock detection using
  1019	 * printk taking the risk of another deadlock that might be caused by
  1020	 * locks of console or printk between inside and outside of them.
  1021	 *
  1022	 * For DEPT, it's no problem since multiple reports are allowed. But it
  1023	 * would be a bad idea for LOCKDEP since it will stop even on a singe
  1024	 * report. So we need to prevent LOCKDEP from its reporting the risk
  1025	 * DEPT would take when reporting something.
  1026	 */
  1027	#include <linux/lockdep.h>
  1028	
  1029	void noinstr dept_off(void)
  1030	{
  1031		dept_task()->recursive++;
  1032		lockdep_off();
  1033	}
  1034	
  1035	void noinstr dept_on(void)
  1036	{
  1037		lockdep_on();
  1038		dept_task()->recursive--;
  1039	}
  1040	
  1041	static unsigned long dept_enter(void)
  1042	{
  1043		unsigned long flags;
  1044	
  1045		flags = arch_local_irq_save();
  1046		dept_off();
  1047		prepare_current_stack();
  1048		return flags;
  1049	}
  1050	
  1051	static void dept_exit(unsigned long flags)
  1052	{
  1053		finish_current_stack();
  1054		dept_on();
  1055		arch_local_irq_restore(flags);
  1056	}
  1057	
  1058	static unsigned long dept_enter_recursive(void)
  1059	{
  1060		unsigned long flags;
  1061	
  1062		flags = arch_local_irq_save();
  1063		return flags;
  1064	}
  1065	
  1066	static void dept_exit_recursive(unsigned long flags)
  1067	{
  1068		arch_local_irq_restore(flags);
  1069	}
  1070	
  1071	/*
  1072	 * NOTE: Must be called with dept_lock held.
  1073	 */
  1074	static struct dept_dep *__add_dep(struct dept_ecxt *e,
  1075					  struct dept_wait *w)
  1076	{
  1077		struct dept_dep *d;
  1078	
  1079		if (DEPT_WARN_ON(!valid_class(e->class)))
  1080			return NULL;
  1081	
  1082		if (DEPT_WARN_ON(!valid_class(w->class)))
  1083			return NULL;
  1084	
  1085		if (lookup_dep(e->class, w->class))
  1086			return NULL;
  1087	
  1088		d = new_dep();
  1089		if (unlikely(!d))
  1090			return NULL;
  1091	
  1092		d->ecxt = get_ecxt(e);
  1093		d->wait = get_wait(w);
  1094	
  1095		/*
  1096		 * Add the dependency into hash and graph.
  1097		 */
  1098		hash_add_dep(d);
  1099		list_add(&d->dep_node, &dep_fc(d)->dep_head);
  1100		list_add(&d->dep_rev_node, &dep_tc(d)->dep_rev_head);
  1101		return d;
  1102	}
  1103	
  1104	static void bfs_init_check_dl(void *node, void *in, void **out)
  1105	{
  1106		struct dept_class *root = (struct dept_class *)node;
  1107		struct dept_dep *new = (struct dept_dep *)in;
  1108	
  1109		root->bfs_gen = bfs_gen;
  1110		dep_tc(new)->bfs_parent = dep_fc(new);
  1111	}
  1112	
  1113	static void bfs_extend_dep(struct list_head *h, void *node)
  1114	{
  1115		struct dept_class *cur = (struct dept_class *)node;
  1116		struct dept_dep *d;
  1117	
  1118		list_for_each_entry(d, &cur->dep_head, dep_node) {
  1119			struct dept_class *next = dep_tc(d);
  1120	
  1121			if (bfs_gen == next->bfs_gen)
  1122				continue;
  1123			next->bfs_parent = cur;
  1124			next->bfs_gen = bfs_gen;
  1125			list_add_tail(&next->bfs_node, h);
  1126		}
  1127	}
  1128	
  1129	static void *bfs_dequeue_dep(struct list_head *h)
  1130	{
  1131		struct dept_class *c;
  1132	
  1133		DEPT_WARN_ON(list_empty(h));
  1134	
  1135		c = list_first_entry(h, struct dept_class, bfs_node);
  1136		list_del(&c->bfs_node);
  1137		return c;
  1138	}
  1139	
  1140	static enum bfs_ret cb_check_dl(void *node, void *in, void **out)
  1141	{
  1142		struct dept_class *cur = (struct dept_class *)node;
  1143		struct dept_dep *new = (struct dept_dep *)in;
  1144	
  1145		if (cur == dep_fc(new)) {
  1146			print_circle(dep_tc(new));
  1147			return BFS_DONE;
  1148		}
  1149	
  1150		return BFS_CONTINUE;
  1151	}
  1152	
  1153	/*
  1154	 * This function is actually in charge of reporting.
  1155	 */
  1156	static void check_dl_bfs(struct dept_dep *d)
  1157	{
  1158		struct bfs_ops ops = {
  1159			.bfs_init = bfs_init_check_dl,
  1160			.extend = bfs_extend_dep,
  1161			.dequeue = bfs_dequeue_dep,
  1162			.callback = cb_check_dl,
  1163		};
  1164	
  1165		bfs((void *)dep_tc(d), &ops, (void *)d, NULL);
  1166	}
  1167	
  1168	static void bfs_init_dep(void *node, void *in, void **out)
  1169	{
  1170		struct dept_class *root = (struct dept_class *)node;
  1171	
  1172		root->bfs_gen = bfs_gen;
  1173	}
  1174	
  1175	static void bfs_extend_dep_rev(struct list_head *h, void *node)
  1176	{
  1177		struct dept_class *cur = (struct dept_class *)node;
  1178		struct dept_dep *d;
  1179	
  1180		list_for_each_entry(d, &cur->dep_rev_head, dep_rev_node) {
  1181			struct dept_class *next = dep_fc(d);
  1182	
  1183			if (bfs_gen == next->bfs_gen)
  1184				continue;
  1185			next->bfs_parent = cur;
  1186			next->bfs_gen = bfs_gen;
  1187			list_add_tail(&next->bfs_node, h);
  1188		}
  1189	}
  1190	
  1191	static enum bfs_ret cb_find_iw(void *node, void *in, void **out)
  1192	{
  1193		struct dept_class *cur = (struct dept_class *)node;
  1194		int irq = *(int *)in;
  1195		struct dept_iwait *iw;
  1196	
  1197		if (DEPT_WARN_ON(!out))
  1198			return BFS_DONE;
  1199	
  1200		iw = iwait(cur, irq);
  1201	
  1202		/*
  1203		 * If any parent's ->wait was set, then the children would've
  1204		 * been touched.
  1205		 */
  1206		if (!iw->touched)
  1207			return BFS_SKIP;
  1208	
  1209		if (!iw->wait)
  1210			return BFS_CONTINUE;
  1211	
  1212		*out = iw;
  1213		return BFS_DONE;
  1214	}
  1215	
  1216	static struct dept_iwait *find_iw_bfs(struct dept_class *c, int irq)
  1217	{
  1218		struct dept_iwait *iw = iwait(c, irq);
  1219		struct dept_iwait *found = NULL;
  1220		struct bfs_ops ops = {
  1221			.bfs_init = bfs_init_dep,
  1222			.extend = bfs_extend_dep_rev,
  1223			.dequeue = bfs_dequeue_dep,
  1224			.callback = cb_find_iw,
  1225		};
  1226	
  1227		bfs((void *)c, &ops, (void *)&irq, (void **)&found);
  1228	
  1229		if (found)
  1230			return found;
  1231	
  1232		untouch_iwait(iw);
  1233		return NULL;
  1234	}
  1235	
  1236	static enum bfs_ret cb_touch_iw_find_ie(void *node, void *in, void **out)
  1237	{
  1238		struct dept_class *cur = (struct dept_class *)node;
  1239		int irq = *(int *)in;
  1240		struct dept_iecxt *ie = iecxt(cur, irq);
  1241		struct dept_iwait *iw = iwait(cur, irq);
  1242	
  1243		if (DEPT_WARN_ON(!out))
  1244			return BFS_DONE;
  1245	
  1246		touch_iwait(iw);
  1247	
  1248		if (!ie->ecxt)
  1249			return BFS_CONTINUE;
  1250		if (!*out)
  1251			*out = ie;
  1252	
  1253		/*
  1254		 * Do touch_iwait() all the way.
  1255		 */
  1256		return BFS_CONTINUE;
  1257	}
  1258	
  1259	static struct dept_iecxt *touch_iw_find_ie_bfs(struct dept_class *c,
  1260						       int irq)
  1261	{
  1262		struct dept_iecxt *found = NULL;
  1263		struct bfs_ops ops = {
  1264			.bfs_init = bfs_init_dep,
  1265			.extend = bfs_extend_dep,
  1266			.dequeue = bfs_dequeue_dep,
  1267			.callback = cb_touch_iw_find_ie,
  1268		};
  1269	
  1270		bfs((void *)c, &ops, (void *)&irq, (void **)&found);
  1271		return found;
  1272	}
  1273	
  1274	/*
  1275	 * Should be called with dept_lock held.
  1276	 */
  1277	static void __add_idep(struct dept_iecxt *ie, struct dept_iwait *iw)
  1278	{
  1279		struct dept_dep *new;
  1280	
  1281		/*
  1282		 * There's nothing to do.
  1283		 */
  1284		if (!ie || !iw || !ie->ecxt || !iw->wait)
  1285			return;
  1286	
  1287		new = __add_dep(ie->ecxt, iw->wait);
  1288	
  1289		/*
  1290		 * Deadlock detected. Let check_dl_bfs() report it.
  1291		 */
  1292		if (new) {
  1293			check_dl_bfs(new);
  1294			stale_iecxt(ie);
  1295			stale_iwait(iw);
  1296		}
  1297	
  1298		/*
  1299		 * If !new, it would be the case of lack of object resource.
  1300		 * Just let it go and get checked by other chances. Retrying is
  1301		 * meaningless in that case.
  1302		 */
  1303	}
  1304	
  1305	static void set_check_iecxt(struct dept_class *c, int irq,
  1306				    struct dept_ecxt *e)
  1307	{
  1308		struct dept_iecxt *ie = iecxt(c, irq);
  1309	
  1310		set_iecxt(ie, e);
  1311		__add_idep(ie, find_iw_bfs(c, irq));
  1312	}
  1313	
  1314	static void set_check_iwait(struct dept_class *c, int irq,
  1315				    struct dept_wait *w)
  1316	{
  1317		struct dept_iwait *iw = iwait(c, irq);
  1318	
  1319		set_iwait(iw, w);
  1320		__add_idep(touch_iw_find_ie_bfs(c, irq), iw);
  1321	}
  1322	
  1323	static void add_iecxt(struct dept_class *c, int irq, struct dept_ecxt *e,
  1324			      bool stack)
  1325	{
  1326		/*
  1327		 * This access is safe since we ensure e->class has set locally.
  1328		 */
  1329		struct dept_task *dt = dept_task();
  1330		struct dept_iecxt *ie = iecxt(c, irq);
  1331	
  1332		if (DEPT_WARN_ON(!valid_class(c)))
  1333			return;
  1334	
  1335		if (unlikely(READ_ONCE(ie->staled)))
  1336			return;
  1337	
  1338		/*
  1339		 * Skip add_iecxt() if ie->ecxt has ever been set at least once.
  1340		 * Which means it has a valid ->ecxt or been staled.
  1341		 */
  1342		if (READ_ONCE(ie->ecxt))
  1343			return;
  1344	
  1345		if (unlikely(!dept_lock()))
  1346			return;
  1347	
  1348		if (unlikely(ie->staled))
  1349			goto unlock;
  1350		if (ie->ecxt)
  1351			goto unlock;
  1352	
  1353		e->enirqf |= (1UL << irq);
  1354	
  1355		/*
  1356		 * Should be NULL since it's the first time that these
  1357		 * enirq_{ip,stack}[irq] have ever set.
  1358		 */
  1359		DEPT_WARN_ON(e->enirq_ip[irq]);
  1360		DEPT_WARN_ON(e->enirq_stack[irq]);
  1361	
  1362		e->enirq_ip[irq] = dt->enirq_ip[irq];
  1363		e->enirq_stack[irq] = stack ? get_current_stack() : NULL;
  1364	
  1365		set_check_iecxt(c, irq, e);
  1366	unlock:
  1367		dept_unlock();
  1368	}
  1369	
  1370	static void add_iwait(struct dept_class *c, int irq, struct dept_wait *w)
  1371	{
  1372		struct dept_iwait *iw = iwait(c, irq);
  1373	
  1374		if (DEPT_WARN_ON(!valid_class(c)))
  1375			return;
  1376	
  1377		if (unlikely(READ_ONCE(iw->staled)))
  1378			return;
  1379	
  1380		/*
  1381		 * Skip add_iwait() if iw->wait has ever been set at least once.
  1382		 * Which means it has a valid ->wait or been staled.
  1383		 */
  1384		if (READ_ONCE(iw->wait))
  1385			return;
  1386	
  1387		if (unlikely(!dept_lock()))
  1388			return;
  1389	
  1390		if (unlikely(iw->staled))
  1391			goto unlock;
  1392		if (iw->wait)
  1393			goto unlock;
  1394	
  1395		w->irqf |= (1UL << irq);
  1396	
  1397		/*
  1398		 * Should be NULL since it's the first time that these
  1399		 * irq_{ip,stack}[irq] have ever set.
  1400		 */
  1401		DEPT_WARN_ON(w->irq_ip[irq]);
  1402		DEPT_WARN_ON(w->irq_stack[irq]);
  1403	
  1404		w->irq_ip[irq] = w->wait_ip;
  1405		w->irq_stack[irq] = get_current_stack();
  1406	
  1407		set_check_iwait(c, irq, w);
  1408	unlock:
  1409		dept_unlock();
  1410	}
  1411	
  1412	static struct dept_wait_hist *hist(int pos)
  1413	{
  1414		struct dept_task *dt = dept_task();
  1415	
  1416		return dt->wait_hist + (pos % DEPT_MAX_WAIT_HIST);
  1417	}
  1418	
  1419	static int hist_pos_next(void)
  1420	{
  1421		struct dept_task *dt = dept_task();
  1422	
  1423		return dt->wait_hist_pos % DEPT_MAX_WAIT_HIST;
  1424	}
  1425	
  1426	static void hist_advance(void)
  1427	{
  1428		struct dept_task *dt = dept_task();
  1429	
  1430		dt->wait_hist_pos++;
  1431		dt->wait_hist_pos %= DEPT_MAX_WAIT_HIST;
  1432	}
  1433	
  1434	static struct dept_wait_hist *new_hist(void)
  1435	{
  1436		struct dept_wait_hist *wh = hist(hist_pos_next());
  1437	
  1438		hist_advance();
  1439		return wh;
  1440	}
  1441	
  1442	static void add_hist(struct dept_wait *w, unsigned int wg, unsigned int ctxt_id)
  1443	{
  1444		struct dept_wait_hist *wh = new_hist();
  1445	
  1446		if (likely(wh->wait))
  1447			put_wait(wh->wait);
  1448	
  1449		wh->wait = get_wait(w);
  1450		wh->wgen = wg;
  1451		wh->ctxt_id = ctxt_id;
  1452	}
  1453	
  1454	/*
  1455	 * Should be called after setting up e's iecxt and w's iwait.
  1456	 */
  1457	static void add_dep(struct dept_ecxt *e, struct dept_wait *w)
  1458	{
  1459		struct dept_class *fc = e->class;
  1460		struct dept_class *tc = w->class;
  1461		struct dept_dep *d;
  1462		int i;
  1463	
  1464		if (lookup_dep(fc, tc))
  1465			return;
  1466	
  1467		if (unlikely(!dept_lock()))
  1468			return;
  1469	
  1470		/*
  1471		 * __add_dep() will lookup_dep() again with lock held.
  1472		 */
  1473		d = __add_dep(e, w);
  1474		if (d) {
  1475			check_dl_bfs(d);
  1476	
  1477			for (i = 0; i < DEPT_IRQS_NR; i++) {
  1478				struct dept_iwait *fiw = iwait(fc, i);
  1479				struct dept_iecxt *found_ie;
  1480				struct dept_iwait *found_iw;
  1481	
  1482				/*
  1483				 * '->touched == false' guarantees there's no
  1484				 * parent that has been set ->wait.
  1485				 */
  1486				if (!fiw->touched)
  1487					continue;
  1488	
  1489				/*
  1490				 * find_iw_bfs() will untouch the iwait if
  1491				 * not found.
  1492				 */
  1493				found_iw = find_iw_bfs(fc, i);
  1494	
  1495				if (!found_iw)
  1496					continue;
  1497	
  1498				found_ie = touch_iw_find_ie_bfs(tc, i);
  1499				__add_idep(found_ie, found_iw);
  1500			}
  1501		}
  1502		dept_unlock();
  1503	}
  1504	
  1505	static atomic_t wgen = ATOMIC_INIT(1);
  1506	
  1507	static int next_wgen(void)
  1508	{
  1509		/*
  1510		 * Avoid zero wgen.
  1511		 */
  1512		return atomic_inc_return(&wgen) ?: atomic_inc_return(&wgen);
  1513	}
  1514	
  1515	static void add_wait(struct dept_class *c, unsigned long ip,
  1516			     const char *w_fn, int sub_l, bool sched_sleep)
  1517	{
  1518		struct dept_task *dt = dept_task();
  1519		struct dept_wait *w;
  1520		unsigned int wg;
  1521		int irq;
  1522		int i;
  1523	
  1524		if (DEPT_WARN_ON(!valid_class(c)))
  1525			return;
  1526	
  1527		w = new_wait();
  1528		if (unlikely(!w))
  1529			return;
  1530	
  1531		WRITE_ONCE(w->class, get_class(c));
  1532		w->wait_ip = ip;
  1533		w->wait_fn = w_fn;
  1534		w->wait_stack = get_current_stack();
  1535		w->sched_sleep = sched_sleep;
  1536	
  1537		irq = cur_irq();
  1538		if (irq < DEPT_IRQS_NR)
  1539			add_iwait(c, irq, w);
  1540	
  1541		/*
  1542		 * Avoid adding dependency between user aware nested ecxt and
  1543		 * wait.
  1544		 */
  1545		for (i = dt->ecxt_held_pos - 1; i >= 0; i--) {
  1546			struct dept_ecxt_held *eh;
  1547	
  1548			eh = dt->ecxt_held + i;
  1549	
  1550			/*
  1551			 * the case of invalid key'ed one
  1552			 */
  1553			if (!eh->ecxt)
  1554				continue;
  1555	
  1556			if (eh->ecxt->class != c || eh->sub_l == sub_l)
  1557				add_dep(eh->ecxt, w);
  1558		}
  1559	
  1560		wg = next_wgen();
  1561		add_hist(w, wg, cur_ctxt_id());
  1562	
  1563		del_wait(w);
  1564	}
  1565	
  1566	static struct dept_ecxt_held *add_ecxt(struct dept_map *m,
  1567			struct dept_class *c, unsigned long ip, const char *c_fn,
  1568			const char *e_fn, int sub_l)
  1569	{
  1570		struct dept_task *dt = dept_task();
  1571		struct dept_ecxt_held *eh;
  1572		struct dept_ecxt *e;
  1573		unsigned long irqf;
  1574		unsigned int wg;
  1575		int irq;
  1576	
  1577		if (DEPT_WARN_ON(!valid_class(c)))
  1578			return NULL;
  1579	
  1580		if (DEPT_WARN_ON_ONCE(dt->ecxt_held_pos >= DEPT_MAX_ECXT_HELD))
  1581			return NULL;
  1582	
  1583		wg = next_wgen();
  1584		if (m->nocheck) {
  1585			eh = dt->ecxt_held + (dt->ecxt_held_pos++);
  1586			eh->ecxt = NULL;
  1587			eh->map = m;
  1588			eh->class = get_class(c);
  1589			eh->wgen = wg;
  1590			eh->sub_l = sub_l;
  1591	
  1592			return eh;
  1593		}
  1594	
  1595		e = new_ecxt();
  1596		if (unlikely(!e))
  1597			return NULL;
  1598	
  1599		e->class = get_class(c);
  1600		e->ecxt_ip = ip;
  1601		e->ecxt_stack = ip ? get_current_stack() : NULL;
  1602		e->event_fn = e_fn;
  1603		e->ecxt_fn = c_fn;
  1604	
  1605		eh = dt->ecxt_held + (dt->ecxt_held_pos++);
  1606		eh->ecxt = get_ecxt(e);
  1607		eh->map = m;
  1608		eh->class = get_class(c);
  1609		eh->wgen = wg;
  1610		eh->sub_l = sub_l;
  1611	
  1612		irqf = cur_enirqf();
  1613		for_each_set_bit(irq, &irqf, DEPT_IRQS_NR)
  1614			add_iecxt(c, irq, e, false);
  1615	
  1616		del_ecxt(e);
  1617		return eh;
  1618	}
  1619	
  1620	static int find_ecxt_pos(struct dept_map *m, struct dept_class *c,
  1621				 bool newfirst)
  1622	{
  1623		struct dept_task *dt = dept_task();
  1624		int i;
  1625	
  1626		if (newfirst) {
  1627			for (i = dt->ecxt_held_pos - 1; i >= 0; i--) {
  1628				struct dept_ecxt_held *eh;
  1629	
  1630				eh = dt->ecxt_held + i;
  1631				if (eh->map == m && eh->class == c)
  1632					return i;
  1633			}
  1634		} else {
  1635			for (i = 0; i < dt->ecxt_held_pos; i++) {
  1636				struct dept_ecxt_held *eh;
  1637	
  1638				eh = dt->ecxt_held + i;
  1639				if (eh->map == m && eh->class == c)
  1640					return i;
  1641			}
  1642		}
  1643		return -1;
  1644	}
  1645	
  1646	static bool pop_ecxt(struct dept_map *m, struct dept_class *c)
  1647	{
  1648		struct dept_task *dt = dept_task();
  1649		int pos;
  1650		int i;
  1651	
  1652		pos = find_ecxt_pos(m, c, true);
  1653		if (pos == -1)
  1654			return false;
  1655	
  1656		if (dt->ecxt_held[pos].class)
  1657			put_class(dt->ecxt_held[pos].class);
  1658	
  1659		if (dt->ecxt_held[pos].ecxt)
  1660			put_ecxt(dt->ecxt_held[pos].ecxt);
  1661	
  1662		dt->ecxt_held_pos--;
  1663	
  1664		for (i = pos; i < dt->ecxt_held_pos; i++)
  1665			dt->ecxt_held[i] = dt->ecxt_held[i + 1];
  1666		return true;
  1667	}
  1668	
  1669	static bool good_hist(struct dept_wait_hist *wh, unsigned int wg)
  1670	{
  1671		return wh->wait != NULL && before(wg, wh->wgen);
  1672	}
  1673	
  1674	/*
  1675	 * Binary-search the ring buffer for the earliest valid wait.
  1676	 */
  1677	static int find_hist_pos(unsigned int wg)
  1678	{
  1679		int oldest;
  1680		int l;
  1681		int r;
  1682		int pos;
  1683	
  1684		oldest = hist_pos_next();
  1685		if (unlikely(good_hist(hist(oldest), wg))) {
  1686			DEPT_INFO_ONCE("Need to expand the ring buffer.\n");
  1687			return oldest;
  1688		}
  1689	
  1690		l = oldest + 1;
  1691		r = oldest + DEPT_MAX_WAIT_HIST - 1;
  1692		for (pos = (l + r) / 2; l <= r; pos = (l + r) / 2) {
  1693			struct dept_wait_hist *p = hist(pos - 1);
  1694			struct dept_wait_hist *wh = hist(pos);
  1695	
  1696			if (!good_hist(p, wg) && good_hist(wh, wg))
  1697				return pos % DEPT_MAX_WAIT_HIST;
  1698			if (good_hist(wh, wg))
  1699				r = pos - 1;
  1700			else
  1701				l = pos + 1;
  1702		}
  1703		return -1;
  1704	}
  1705	
  1706	static void do_event(struct dept_map *m, struct dept_map *real_m,
  1707			struct dept_class *c, unsigned int wg, unsigned long ip,
  1708			const char *e_fn)
  1709	{
  1710		struct dept_task *dt = dept_task();
  1711		struct dept_wait_hist *wh;
  1712		struct dept_ecxt_held *eh;
  1713		unsigned int ctxt_id;
  1714		int end;
  1715		int pos;
  1716		int i;
  1717	
  1718		if (DEPT_WARN_ON(!valid_class(c)))
  1719			return;
  1720	
  1721		if (m->nocheck)
  1722			return;
  1723	
  1724		/*
  1725		 * The event was triggered before wait.
  1726		 */
  1727		if (!wg)
  1728			return;
  1729	
  1730		/*
  1731		 * If an ecxt for this map exists, let the ecxt work for this
  1732		 * event and do not proceed it in do_event().
  1733		 */
  1734		if (find_ecxt_pos(real_m, c, false) != -1)
  1735			return;
  1736		eh = add_ecxt(m, c, 0UL, NULL, e_fn, 0);
  1737	
  1738		if (!eh)
  1739			return;
  1740	
  1741		if (DEPT_WARN_ON(!eh->ecxt))
  1742			goto out;
  1743	
  1744		eh->ecxt->event_ip = ip;
  1745		eh->ecxt->event_stack = get_current_stack();
  1746	
  1747		pos = find_hist_pos(wg);
  1748		if (pos == -1)
  1749			goto out;
  1750	
  1751		ctxt_id = cur_ctxt_id();
  1752		end = hist_pos_next();
  1753		end = end > pos ? end : end + DEPT_MAX_WAIT_HIST;
  1754		for (wh = hist(pos); pos < end; wh = hist(++pos)) {
  1755			if (dt->in_sched && wh->wait->sched_sleep)
  1756				continue;
  1757	
  1758			if (wh->ctxt_id == ctxt_id)
  1759				add_dep(eh->ecxt, wh->wait);
  1760		}
  1761	
  1762		for (i = 0; i < DEPT_IRQS_NR; i++) {
  1763			struct dept_ecxt *e;
  1764	
  1765			if (before(dt->wgen_enirq[i], wg))
  1766				continue;
  1767	
  1768			e = eh->ecxt;
  1769			add_iecxt(e->class, i, e, false);
  1770		}
  1771	out:
  1772		/*
  1773		 * Pop ecxt that temporarily has been added to handle this event.
  1774		 */
  1775		pop_ecxt(m, c);
  1776	}
  1777	
  1778	static void del_dep_rcu(struct rcu_head *rh)
  1779	{
  1780		struct dept_dep *d = container_of(rh, struct dept_dep, rh);
  1781	
  1782		preempt_disable();
  1783		del_dep(d);
  1784		preempt_enable();
  1785	}
  1786	
  1787	/*
  1788	 * NOTE: Must be called with dept_lock held.
  1789	 */
  1790	static void disconnect_class(struct dept_class *c)
  1791	{
  1792		struct dept_dep *d, *n;
  1793		int i;
  1794	
  1795		list_for_each_entry_safe(d, n, &c->dep_head, dep_node) {
  1796			list_del_rcu(&d->dep_node);
  1797			list_del_rcu(&d->dep_rev_node);
  1798			hash_del_dep(d);
  1799			call_rcu(&d->rh, del_dep_rcu);
  1800		}
  1801	
  1802		list_for_each_entry_safe(d, n, &c->dep_rev_head, dep_rev_node) {
  1803			list_del_rcu(&d->dep_node);
  1804			list_del_rcu(&d->dep_rev_node);
  1805			hash_del_dep(d);
  1806			call_rcu(&d->rh, del_dep_rcu);
  1807		}
  1808	
  1809		for (i = 0; i < DEPT_IRQS_NR; i++) {
  1810			stale_iecxt(iecxt(c, i));
  1811			stale_iwait(iwait(c, i));
  1812		}
  1813	}
  1814	
  1815	/*
  1816	 * Context control
  1817	 * =====================================================================
  1818	 * Whether a wait is in {hard,soft}-IRQ context or whether
  1819	 * {hard,soft}-IRQ has been enabled on the way to an event is very
  1820	 * important to check dependency. All those things should be tracked.
  1821	 */
  1822	
  1823	static unsigned long cur_enirqf(void)
  1824	{
  1825		struct dept_task *dt = dept_task();
  1826		int he = dt->hardirqs_enabled;
  1827		int se = dt->softirqs_enabled;
  1828	
  1829		if (he)
  1830			return DEPT_HIRQF | (se ? DEPT_SIRQF : 0UL);
  1831		return 0UL;
  1832	}
  1833	
  1834	static int cur_irq(void)
  1835	{
  1836		if (lockdep_softirq_context(current))
  1837			return DEPT_SIRQ;
  1838		if (lockdep_hardirq_context())
  1839			return DEPT_HIRQ;
  1840		return DEPT_IRQS_NR;
  1841	}
  1842	
  1843	static unsigned int cur_ctxt_id(void)
  1844	{
  1845		struct dept_task *dt = dept_task();
  1846		int irq = cur_irq();
  1847	
  1848		/*
  1849		 * Normal process context
  1850		 */
  1851		if (irq == DEPT_IRQS_NR)
  1852			return 0U;
  1853	
  1854		return dt->irq_id[irq] | (1UL << irq);
  1855	}
  1856	
  1857	static void enirq_transition(int irq)
  1858	{
  1859		struct dept_task *dt = dept_task();
  1860		int i;
  1861	
  1862		/*
  1863		 * IRQ can cut in on the way to the event. Used for cross-event
  1864		 * detection.
  1865		 *
  1866		 *    wait context	event context(ecxt)
  1867		 *    ------------	-------------------
  1868		 *    wait event
  1869		 *       UPDATE wgen
  1870		 *			observe IRQ enabled
  1871		 *			   UPDATE wgen
  1872		 *			   keep the wgen locally
  1873		 *
  1874		 *			on the event
  1875		 *			   check the wgen kept
  1876		 */
  1877	
  1878		dt->wgen_enirq[irq] = next_wgen();
  1879	
  1880		for (i = dt->ecxt_held_pos - 1; i >= 0; i--) {
  1881			struct dept_ecxt_held *eh;
  1882			struct dept_ecxt *e;
  1883	
  1884			eh = dt->ecxt_held + i;
  1885			e = eh->ecxt;
  1886			if (e)
  1887				add_iecxt(e->class, irq, e, true);
  1888		}
  1889	}
  1890	
  1891	static void dept_enirq(unsigned long ip)
  1892	{
  1893		struct dept_task *dt = dept_task();
  1894		unsigned long irqf = cur_enirqf();
  1895		int irq;
  1896		unsigned long flags;
  1897	
  1898		if (unlikely(!dept_working()))
  1899			return;
  1900	
  1901		/*
  1902		 * IRQ ON/OFF transition might happen while Dept is working.
  1903		 * We cannot handle recursive entrance. Just ingnore it.
  1904		 * Only transitions outside of Dept will be considered.
  1905		 */
  1906		if (dt->recursive)
  1907			return;
  1908	
  1909		flags = dept_enter();
  1910	
  1911		for_each_set_bit(irq, &irqf, DEPT_IRQS_NR) {
  1912			dt->enirq_ip[irq] = ip;
  1913			enirq_transition(irq);
  1914		}
  1915	
  1916		dept_exit(flags);
  1917	}
  1918	
  1919	void dept_softirqs_on_ip(unsigned long ip)
  1920	{
  1921		/*
  1922		 * Assumes that it's called with IRQ disabled so that accessing
  1923		 * current's fields is not racy.
  1924		 */
  1925		dept_task()->softirqs_enabled = true;
  1926		dept_enirq(ip);
  1927	}
  1928	
  1929	void dept_hardirqs_on(void)
  1930	{
  1931		/*
  1932		 * Assumes that it's called with IRQ disabled so that accessing
  1933		 * current's fields is not racy.
  1934		 */
  1935		dept_task()->hardirqs_enabled = true;
  1936		dept_enirq(_RET_IP_);
  1937	}
  1938	
  1939	void dept_softirqs_off(void)
  1940	{
  1941		/*
  1942		 * Assumes that it's called with IRQ disabled so that accessing
  1943		 * current's fields is not racy.
  1944		 */
  1945		dept_task()->softirqs_enabled = false;
  1946	}
  1947	
  1948	void dept_hardirqs_off(void)
  1949	{
  1950		/*
  1951		 * Assumes that it's called with IRQ disabled so that accessing
  1952		 * current's fields is not racy.
  1953		 */
  1954		dept_task()->hardirqs_enabled = false;
  1955	}
  1956	
  1957	/*
  1958	 * Ensure it's the outmost softirq context.
  1959	 */
  1960	void dept_softirq_enter(void)
  1961	{
  1962		struct dept_task *dt = dept_task();
  1963	
  1964		dt->irq_id[DEPT_SIRQ] += 1UL << DEPT_IRQS_NR;
  1965	}
  1966	
  1967	/*
  1968	 * Ensure it's the outmost hardirq context.
  1969	 */
  1970	void dept_hardirq_enter(void)
  1971	{
  1972		struct dept_task *dt = dept_task();
  1973	
  1974		dt->irq_id[DEPT_HIRQ] += 1UL << DEPT_IRQS_NR;
  1975	}
  1976	
  1977	void dept_sched_enter(void)
  1978	{
  1979		dept_task()->in_sched = true;
  1980	}
  1981	
  1982	void dept_sched_exit(void)
  1983	{
  1984		dept_task()->in_sched = false;
  1985	}
  1986	
  1987	/*
  1988	 * Exposed APIs
  1989	 * =====================================================================
  1990	 */
  1991	
  1992	static void clean_classes_cache(struct dept_key *k)
  1993	{
  1994		int i;
  1995	
  1996		for (i = 0; i < DEPT_MAX_SUBCLASSES_CACHE; i++) {
  1997			if (!READ_ONCE(k->classes[i]))
  1998				continue;
  1999	
  2000			WRITE_ONCE(k->classes[i], NULL);
  2001		}
  2002	}
  2003	
  2004	/*
  2005	 * Assume we don't have to consider race with the map when
  2006	 * dept_map_init() is called.
  2007	 */
  2008	void dept_map_init(struct dept_map *m, struct dept_key *k, int sub_u,
  2009			   const char *n)
  2010	{
  2011		unsigned long flags;
  2012	
  2013		if (unlikely(!dept_working())) {
  2014			m->nocheck = true;
  2015			return;
  2016		}
  2017	
  2018		if (DEPT_WARN_ON(sub_u < 0)) {
  2019			m->nocheck = true;
  2020			return;
  2021		}
  2022	
  2023		if (DEPT_WARN_ON(sub_u >= DEPT_MAX_SUBCLASSES_USR)) {
  2024			m->nocheck = true;
  2025			return;
  2026		}
  2027	
  2028		/*
  2029		 * Allow recursive entrance.
  2030		 */
  2031		flags = dept_enter_recursive();
  2032	
  2033		clean_classes_cache(&m->map_key);
  2034	
  2035		m->keys = k;
  2036		m->sub_u = sub_u;
  2037		m->name = n;
  2038		m->wgen = 0U;
  2039		m->nocheck = !valid_key(k);
  2040	
  2041		dept_exit_recursive(flags);
  2042	}
  2043	EXPORT_SYMBOL_GPL(dept_map_init);
  2044	
  2045	/*
  2046	 * Assume we don't have to consider race with the map when
  2047	 * dept_map_reinit() is called.
  2048	 */
  2049	void dept_map_reinit(struct dept_map *m, struct dept_key *k, int sub_u,
  2050			     const char *n)
  2051	{
  2052		unsigned long flags;
  2053	
  2054		if (unlikely(!dept_working())) {
  2055			m->nocheck = true;
  2056			return;
  2057		}
  2058	
  2059		/*
  2060		 * Allow recursive entrance.
  2061		 */
  2062		flags = dept_enter_recursive();
  2063	
  2064		if (k) {
  2065			clean_classes_cache(&m->map_key);
  2066			m->keys = k;
  2067			m->nocheck = !valid_key(k);
  2068		}
  2069	
  2070		if (sub_u >= 0 && sub_u < DEPT_MAX_SUBCLASSES_USR)
  2071			m->sub_u = sub_u;
  2072	
  2073		if (n)
  2074			m->name = n;
  2075	
  2076		m->wgen = 0U;
  2077	
  2078		dept_exit_recursive(flags);
  2079	}
  2080	EXPORT_SYMBOL_GPL(dept_map_reinit);
  2081	
  2082	void dept_map_copy(struct dept_map *to, struct dept_map *from)
  2083	{
  2084		if (unlikely(!dept_working())) {
  2085			to->nocheck = true;
  2086			return;
  2087		}
  2088	
  2089		*to = *from;
  2090	
  2091		/*
  2092		 * XXX: 'to' might be in a stack or something. Using the address
  2093		 * in a stack segment as a key is meaningless. Just ignore the
  2094		 * case for now.
  2095		 */
  2096		if (!to->keys) {
  2097			to->nocheck = true;
  2098			return;
  2099		}
  2100	
  2101		/*
  2102		 * Since the class cache can be modified concurrently we could
  2103		 * observe half pointers (64bit arch using 32bit copy insns).
  2104		 * Therefore clear the caches and take the performance hit.
  2105		 *
  2106		 * XXX: Doesn't work well with lockdep_set_class_and_subclass()
  2107		 *      since that relies on cache abuse.
  2108		 */
  2109		clean_classes_cache(&to->map_key);
  2110	}
  2111	
  2112	static LIST_HEAD(classes);
  2113	
  2114	static bool within(const void *addr, void *start, unsigned long size)
  2115	{
  2116		return addr >= start && addr < start + size;
  2117	}
  2118	
  2119	void dept_free_range(void *start, unsigned int sz)
  2120	{
  2121		struct dept_task *dt = dept_task();
  2122		struct dept_class *c, *n;
  2123		unsigned long flags;
  2124	
  2125		if (unlikely(!dept_working()))
  2126			return;
  2127	
  2128		if (dt->recursive) {
  2129			DEPT_STOP("Failed to successfully free Dept objects.\n");
  2130			return;
  2131		}
  2132	
  2133		flags = dept_enter();
  2134	
  2135		/*
  2136		 * dept_free_range() should not fail.
  2137		 *
  2138		 * FIXME: Should be fixed if dept_free_range() causes deadlock
  2139		 * with dept_lock().
  2140		 */
  2141		while (unlikely(!dept_lock()))
  2142			cpu_relax();
  2143	
  2144		list_for_each_entry_safe(c, n, &classes, all_node) {
  2145			if (!within((void *)c->key, start, sz) &&
  2146			    !within(c->name, start, sz))
  2147				continue;
  2148	
  2149			hash_del_class(c);
  2150			disconnect_class(c);
  2151			list_del(&c->all_node);
  2152			invalidate_class(c);
  2153	
  2154			/*
  2155			 * Actual deletion will happen on the rcu callback
  2156			 * that has been added in disconnect_class().
  2157			 */
  2158			del_class(c);
  2159		}
  2160		dept_unlock();
  2161		dept_exit(flags);
  2162	
  2163		/*
  2164		 * Wait until even lockless hash_lookup_class() for the class
  2165		 * returns NULL.
  2166		 */
  2167		might_sleep();
  2168		synchronize_rcu();
  2169	}
  2170	
  2171	static int sub_id(struct dept_map *m, int e)
  2172	{
  2173		return (m ? m->sub_u : 0) + e * DEPT_MAX_SUBCLASSES_USR;
  2174	}
  2175	
  2176	static struct dept_class *check_new_class(struct dept_key *local,
  2177						  struct dept_key *k, int sub_id,
  2178						  const char *n, bool sched_map)
  2179	{
  2180		struct dept_class *c = NULL;
  2181	
  2182		if (DEPT_WARN_ON(sub_id >= DEPT_MAX_SUBCLASSES))
  2183			return NULL;
  2184	
  2185		if (DEPT_WARN_ON(!k))
  2186			return NULL;
  2187	
  2188		/*
  2189		 * XXX: Assume that users prevent the map from using if any of
  2190		 * the cached keys has been invalidated. If not, the cache,
  2191		 * local->classes should not be used because it would be racy
  2192		 * with class deletion.
  2193		 */
  2194		if (local && sub_id < DEPT_MAX_SUBCLASSES_CACHE)
  2195			c = READ_ONCE(local->classes[sub_id]);
  2196	
  2197		if (c)
  2198			return c;
  2199	
  2200		c = lookup_class((unsigned long)k->base + sub_id);
  2201		if (c)
  2202			goto caching;
  2203	
  2204		if (unlikely(!dept_lock()))
  2205			return NULL;
  2206	
  2207		c = lookup_class((unsigned long)k->base + sub_id);
  2208		if (unlikely(c))
  2209			goto unlock;
  2210	
  2211		c = new_class();
  2212		if (unlikely(!c))
  2213			goto unlock;
  2214	
  2215		c->name = n;
  2216		c->sched_map = sched_map;
  2217		c->sub_id = sub_id;
  2218		c->key = (unsigned long)(k->base + sub_id);
  2219		hash_add_class(c);
  2220		list_add(&c->all_node, &classes);
  2221	unlock:
  2222		dept_unlock();
  2223	caching:
  2224		if (local && sub_id < DEPT_MAX_SUBCLASSES_CACHE)
  2225			WRITE_ONCE(local->classes[sub_id], c);
  2226	
  2227		return c;
  2228	}
  2229	
  2230	/*
  2231	 * Called between dept_enter() and dept_exit().
  2232	 */
  2233	static void __dept_wait(struct dept_map *m, unsigned long w_f,
  2234				unsigned long ip, const char *w_fn, int sub_l,
  2235				bool sched_sleep, bool sched_map)
  2236	{
  2237		int e;
  2238	
  2239		/*
  2240		 * Be as conservative as possible. In case of mulitple waits for
  2241		 * a single dept_map, we are going to keep only the last wait's
  2242		 * wgen for simplicity - keeping all wgens seems overengineering.
  2243		 *
  2244		 * Of course, it might cause missing some dependencies that
  2245		 * would rarely, probabily never, happen but it helps avoid
  2246		 * false positive report.
  2247		 */
  2248		for_each_set_bit(e, &w_f, DEPT_MAX_SUBCLASSES_EVT) {
  2249			struct dept_class *c;
  2250			struct dept_key *k;
  2251	
  2252			k = m->keys ?: &m->map_key;
  2253			c = check_new_class(&m->map_key, k,
  2254					    sub_id(m, e), m->name, sched_map);
  2255			if (!c)
  2256				continue;
  2257	
  2258			add_wait(c, ip, w_fn, sub_l, sched_sleep);
  2259		}
  2260	}
  2261	
  2262	/*
  2263	 * Called between dept_enter() and dept_exit().
  2264	 */
  2265	static void __dept_event(struct dept_map *m, struct dept_map *real_m,
  2266			unsigned long e_f, unsigned long ip, const char *e_fn,
  2267			bool sched_map)
  2268	{
  2269		struct dept_class *c;
  2270		struct dept_key *k;
  2271		int e;
  2272	
  2273		e = find_first_bit(&e_f, DEPT_MAX_SUBCLASSES_EVT);
  2274	
  2275		if (DEPT_WARN_ON(e >= DEPT_MAX_SUBCLASSES_EVT))
  2276			return;
  2277	
  2278		/*
  2279		 * An event is an event. If the caller passed more than single
  2280		 * event, then warn it and handle the event corresponding to
  2281		 * the first bit anyway.
  2282		 */
  2283		DEPT_WARN_ON(1UL << e != e_f);
  2284	
  2285		k = m->keys ?: &m->map_key;
  2286		c = check_new_class(&m->map_key, k, sub_id(m, e), m->name, sched_map);
  2287	
  2288		if (c)
  2289			do_event(m, real_m, c, READ_ONCE(m->wgen), ip, e_fn);
  2290	}
  2291	
  2292	void dept_wait(struct dept_map *m, unsigned long w_f,
  2293		       unsigned long ip, const char *w_fn, int sub_l)
  2294	{
  2295		struct dept_task *dt = dept_task();
  2296		unsigned long flags;
  2297	
  2298		if (unlikely(!dept_working()))
  2299			return;
  2300	
  2301		if (dt->recursive)
  2302			return;
  2303	
  2304		if (m->nocheck)
  2305			return;
  2306	
  2307		flags = dept_enter();
  2308	
  2309		__dept_wait(m, w_f, ip, w_fn, sub_l, false, false);
  2310	
  2311		dept_exit(flags);
  2312	}
  2313	EXPORT_SYMBOL_GPL(dept_wait);
  2314	
  2315	void dept_stage_wait(struct dept_map *m, struct dept_key *k,
  2316			     unsigned long ip, const char *w_fn)
  2317	{
  2318		struct dept_task *dt = dept_task();
  2319		unsigned long flags;
  2320	
  2321		if (unlikely(!dept_working()))
  2322			return;
  2323	
  2324		if (m && m->nocheck)
  2325			return;
  2326	
  2327		/*
  2328		 * Either m or k should be passed. Which means Dept relies on
  2329		 * either its own map or the caller's position in the code when
  2330		 * determining its class.
  2331		 */
  2332		if (DEPT_WARN_ON(!m && !k))
  2333			return;
  2334	
  2335		/*
  2336		 * Allow recursive entrance.
  2337		 */
  2338		flags = dept_enter_recursive();
  2339	
  2340		/*
  2341		 * Ensure the outmost dept_stage_wait() works.
  2342		 */
  2343		if (dt->stage_m.keys)
  2344			goto exit;
  2345	
  2346		arch_spin_lock(&dt->stage_lock);
  2347		if (m) {
  2348			dt->stage_m = *m;
  2349			dt->stage_real_m = m;
  2350	
  2351			/*
  2352			 * Ensure dt->stage_m.keys != NULL and it works with the
  2353			 * map's map_key, not stage_m's one when ->keys == NULL.
  2354			 */
  2355			if (!m->keys)
  2356				dt->stage_m.keys = &m->map_key;
  2357		} else {
  2358			dt->stage_m.name = w_fn;
  2359			dt->stage_sched_map = true;
  2360			dt->stage_real_m = &dt->stage_m;
  2361		}
  2362	
  2363		/*
  2364		 * dept_map_reinit() includes WRITE_ONCE(->wgen, 0U) that
  2365		 * effectively disables the map just in case real sleep won't
  2366		 * happen. dept_request_event_wait_commit() will enable it.
  2367		 */
  2368		dept_map_reinit(&dt->stage_m, k, -1, NULL);
  2369	
  2370		dt->stage_w_fn = w_fn;
  2371		dt->stage_ip = ip;
  2372		arch_spin_unlock(&dt->stage_lock);
  2373	exit:
  2374		dept_exit_recursive(flags);
  2375	}
  2376	EXPORT_SYMBOL_GPL(dept_stage_wait);
  2377	
  2378	static void __dept_clean_stage(struct dept_task *dt)
  2379	{
  2380		memset(&dt->stage_m, 0x0, sizeof(struct dept_map));
  2381		dt->stage_real_m = NULL;
  2382		dt->stage_sched_map = false;
  2383		dt->stage_w_fn = NULL;
  2384		dt->stage_ip = 0UL;
  2385	}
  2386	
  2387	void dept_clean_stage(void)
  2388	{
  2389		struct dept_task *dt = dept_task();
  2390		unsigned long flags;
  2391	
  2392		if (unlikely(!dept_working()))
  2393			return;
  2394	
  2395		/*
  2396		 * Allow recursive entrance.
  2397		 */
  2398		flags = dept_enter_recursive();
  2399		arch_spin_lock(&dt->stage_lock);
  2400		__dept_clean_stage(dt);
  2401		arch_spin_unlock(&dt->stage_lock);
  2402		dept_exit_recursive(flags);
  2403	}
  2404	EXPORT_SYMBOL_GPL(dept_clean_stage);
  2405	
  2406	/*
  2407	 * Always called from __schedule().
  2408	 */
  2409	void dept_request_event_wait_commit(void)
  2410	{
  2411		struct dept_task *dt = dept_task();
  2412		unsigned long flags;
  2413		unsigned int wg;
  2414		unsigned long ip;
  2415		const char *w_fn;
  2416		bool sched_map;
  2417	
  2418		if (unlikely(!dept_working()))
  2419			return;
  2420	
  2421		/*
  2422		 * It's impossible that __schedule() is called while Dept is
  2423		 * working that already disabled IRQ at the entrance.
  2424		 */
  2425		if (DEPT_WARN_ON(dt->recursive))
  2426			return;
  2427	
  2428		flags = dept_enter();
  2429	
  2430		arch_spin_lock(&dt->stage_lock);
  2431	
  2432		/*
  2433		 * Checks if current has staged a wait.
  2434		 */
  2435		if (!dt->stage_m.keys) {
  2436			arch_spin_unlock(&dt->stage_lock);
  2437			goto exit;
  2438		}
  2439	
  2440		w_fn = dt->stage_w_fn;
  2441		ip = dt->stage_ip;
  2442		sched_map = dt->stage_sched_map;
  2443	
  2444		wg = next_wgen();
  2445		WRITE_ONCE(dt->stage_m.wgen, wg);
  2446		arch_spin_unlock(&dt->stage_lock);
  2447	
  2448		__dept_wait(&dt->stage_m, 1UL, ip, w_fn, 0, true, sched_map);
  2449	exit:
  2450		dept_exit(flags);
  2451	}
  2452	
  2453	/*
  2454	 * Always called from try_to_wake_up().
  2455	 */
  2456	void dept_ttwu_stage_wait(struct task_struct *requestor, unsigned long ip)
  2457	{
  2458		struct dept_task *dt = dept_task();
  2459		struct dept_task *dt_req = &requestor->dept_task;
  2460		unsigned long flags;
  2461		struct dept_map m;
  2462		struct dept_map *real_m;
  2463		bool sched_map;
  2464	
  2465		if (unlikely(!dept_working()))
  2466			return;
  2467	
  2468		if (dt->recursive)
  2469			return;
  2470	
  2471		flags = dept_enter();
  2472	
  2473		arch_spin_lock(&dt_req->stage_lock);
  2474	
  2475		/*
  2476		 * Serializing is unnecessary as long as it always comes from
  2477		 * try_to_wake_up().
  2478		 */
  2479		m = dt_req->stage_m;
  2480		sched_map = dt_req->stage_sched_map;
  2481		real_m = dt_req->stage_real_m;
  2482		__dept_clean_stage(dt_req);
  2483		arch_spin_unlock(&dt_req->stage_lock);
  2484	
  2485		/*
  2486		 * ->stage_m.keys should not be NULL if it's in use. Should
  2487		 * make sure that it's not NULL when staging a valid map.
  2488		 */
  2489		if (!m.keys)
  2490			goto exit;
  2491	
  2492		__dept_event(&m, real_m, 1UL, ip, "try_to_wake_up", sched_map);
  2493	exit:
  2494		dept_exit(flags);
  2495	}
  2496	
  2497	/*
  2498	 * Modifies the latest ecxt corresponding to m and e_f.
  2499	 */
  2500	void dept_map_ecxt_modify(struct dept_map *m, unsigned long e_f,
  2501				  struct dept_key *new_k, unsigned long new_e_f,
  2502				  unsigned long new_ip, const char *new_c_fn,
  2503				  const char *new_e_fn, int new_sub_l)
  2504	{
  2505		struct dept_task *dt = dept_task();
  2506		struct dept_ecxt_held *eh;
  2507		struct dept_class *c;
  2508		struct dept_key *k;
  2509		unsigned long flags;
  2510		int pos = -1;
  2511		int new_e;
  2512		int e;
  2513	
  2514		if (unlikely(!dept_working()))
  2515			return;
  2516	
  2517		/*
  2518		 * XXX: Couldn't handle re-enterance cases. Ingore it for now.
  2519		 */
  2520		if (dt->recursive)
  2521			return;
  2522	
  2523		/*
  2524		 * Should go ahead no matter whether ->nocheck == true or not
  2525		 * because ->nocheck value can be changed within the ecxt area
  2526		 * delimitated by dept_ecxt_enter() and dept_ecxt_exit().
  2527		 */
  2528	
  2529		flags = dept_enter();
  2530	
  2531		for_each_set_bit(e, &e_f, DEPT_MAX_SUBCLASSES_EVT) {
  2532			k = m->keys ?: &m->map_key;
  2533			c = check_new_class(&m->map_key, k,
  2534					    sub_id(m, e), m->name, false);
  2535			if (!c)
  2536				continue;
  2537	
  2538			/*
  2539			 * When it found an ecxt for any event in e_f, done.
  2540			 */
  2541			pos = find_ecxt_pos(m, c, true);
  2542			if (pos != -1)
  2543				break;
  2544		}
  2545	
  2546		if (unlikely(pos == -1))
  2547			goto exit;
  2548	
  2549		eh = dt->ecxt_held + pos;
  2550		new_sub_l = new_sub_l >= 0 ? new_sub_l : eh->sub_l;
  2551	
  2552		new_e = find_first_bit(&new_e_f, DEPT_MAX_SUBCLASSES_EVT);
  2553	
  2554		if (new_e < DEPT_MAX_SUBCLASSES_EVT)
  2555			/*
  2556			 * Let it work with the first bit anyway.
  2557			 */
  2558			DEPT_WARN_ON(1UL << new_e != new_e_f);
  2559		else
  2560			new_e = e;
  2561	
  2562		pop_ecxt(m, c);
  2563	
  2564		/*
  2565		 * Apply the key to the map.
  2566		 */
  2567		if (new_k)
  2568			dept_map_reinit(m, new_k, -1, NULL);
  2569	
  2570		k = m->keys ?: &m->map_key;
  2571		c = check_new_class(&m->map_key, k, sub_id(m, new_e), m->name, false);
  2572	
  2573		if (c && add_ecxt(m, c, new_ip, new_c_fn, new_e_fn, new_sub_l))
  2574			goto exit;
  2575	
  2576		/*
  2577		 * Successfully pop_ecxt()ed but failed to add_ecxt().
  2578		 */
  2579		dt->missing_ecxt++;
  2580	exit:
  2581		dept_exit(flags);
  2582	}
  2583	EXPORT_SYMBOL_GPL(dept_map_ecxt_modify);
  2584	
  2585	void dept_ecxt_enter(struct dept_map *m, unsigned long e_f, unsigned long ip,
  2586			     const char *c_fn, const char *e_fn, int sub_l)
  2587	{
  2588		struct dept_task *dt = dept_task();
  2589		unsigned long flags;
  2590		struct dept_class *c;
  2591		struct dept_key *k;
  2592		int e;
  2593	
  2594		if (unlikely(!dept_working()))
  2595			return;
  2596	
  2597		if (dt->recursive) {
  2598			dt->missing_ecxt++;
  2599			return;
  2600		}
  2601	
  2602		/*
  2603		 * Should go ahead no matter whether ->nocheck == true or not
  2604		 * because ->nocheck value can be changed within the ecxt area
  2605		 * delimitated by dept_ecxt_enter() and dept_ecxt_exit().
  2606		 */
  2607	
  2608		flags = dept_enter();
  2609	
  2610		e = find_first_bit(&e_f, DEPT_MAX_SUBCLASSES_EVT);
  2611	
  2612		if (e >= DEPT_MAX_SUBCLASSES_EVT)
  2613			goto missing_ecxt;
  2614	
  2615		/*
  2616		 * An event is an event. If the caller passed more than single
  2617		 * event, then warn it and handle the event corresponding to
  2618		 * the first bit anyway.
  2619		 */
  2620		DEPT_WARN_ON(1UL << e != e_f);
  2621	
  2622		k = m->keys ?: &m->map_key;
  2623		c = check_new_class(&m->map_key, k, sub_id(m, e), m->name, false);
  2624	
  2625		if (c && add_ecxt(m, c, ip, c_fn, e_fn, sub_l))
  2626			goto exit;
  2627	missing_ecxt:
  2628		dt->missing_ecxt++;
  2629	exit:
  2630		dept_exit(flags);
  2631	}
  2632	EXPORT_SYMBOL_GPL(dept_ecxt_enter);
  2633	
  2634	bool dept_ecxt_holding(struct dept_map *m, unsigned long e_f)
  2635	{
  2636		struct dept_task *dt = dept_task();
  2637		unsigned long flags;
  2638		bool ret = false;
  2639		int e;
  2640	
  2641		if (unlikely(!dept_working()))
  2642			return false;
  2643	
  2644		if (dt->recursive)
  2645			return false;
  2646	
  2647		flags = dept_enter();
  2648	
  2649		for_each_set_bit(e, &e_f, DEPT_MAX_SUBCLASSES_EVT) {
  2650			struct dept_class *c;
  2651			struct dept_key *k;
  2652	
  2653			k = m->keys ?: &m->map_key;
  2654			c = check_new_class(&m->map_key, k,
  2655					    sub_id(m, e), m->name, false);
  2656			if (!c)
  2657				continue;
  2658	
  2659			if (find_ecxt_pos(m, c, true) != -1) {
  2660				ret = true;
  2661				break;
  2662			}
  2663		}
  2664	
  2665		dept_exit(flags);
  2666	
  2667		return ret;
  2668	}
  2669	EXPORT_SYMBOL_GPL(dept_ecxt_holding);
  2670	
  2671	void dept_request_event(struct dept_map *m)
  2672	{
  2673		unsigned long flags;
  2674		unsigned int wg;
  2675	
  2676		if (unlikely(!dept_working()))
  2677			return;
  2678	
  2679		if (m->nocheck)
  2680			return;
  2681	
  2682		/*
  2683		 * Allow recursive entrance.
  2684		 */
  2685		flags = dept_enter_recursive();
  2686	
  2687		wg = next_wgen();
  2688		WRITE_ONCE(m->wgen, wg);
  2689	
  2690		dept_exit_recursive(flags);
  2691	}
  2692	EXPORT_SYMBOL_GPL(dept_request_event);
  2693	
  2694	void dept_event(struct dept_map *m, unsigned long e_f,
  2695			unsigned long ip, const char *e_fn)
  2696	{
  2697		struct dept_task *dt = dept_task();
  2698		unsigned long flags;
  2699	
  2700		if (unlikely(!dept_working()))
  2701			return;
  2702	
  2703		if (m->nocheck)
  2704			return;
  2705	
  2706		if (dt->recursive) {
  2707			/*
  2708			 * Dept won't work with this even though an event
  2709			 * context has been asked. Don't make it confused at
  2710			 * handling the event. Disable it until the next.
  2711			 */
  2712			WRITE_ONCE(m->wgen, 0U);
  2713			return;
  2714		}
  2715	
  2716		flags = dept_enter();
  2717	
  2718		__dept_event(m, m, e_f, ip, e_fn, false);
  2719	
  2720		/*
  2721		 * Keep the map diabled until the next sleep.
  2722		 */
  2723		WRITE_ONCE(m->wgen, 0U);
  2724	
  2725		dept_exit(flags);
  2726	}
  2727	EXPORT_SYMBOL_GPL(dept_event);
  2728	
  2729	void dept_ecxt_exit(struct dept_map *m, unsigned long e_f,
  2730			    unsigned long ip)
  2731	{
  2732		struct dept_task *dt = dept_task();
  2733		unsigned long flags;
  2734		int e;
  2735	
  2736		if (unlikely(!dept_working()))
  2737			return;
  2738	
  2739		if (dt->recursive) {
  2740			dt->missing_ecxt--;
  2741			return;
  2742		}
  2743	
  2744		/*
  2745		 * Should go ahead no matter whether ->nocheck == true or not
  2746		 * because ->nocheck value can be changed within the ecxt area
  2747		 * delimitated by dept_ecxt_enter() and dept_ecxt_exit().
  2748		 */
  2749	
  2750		flags = dept_enter();
  2751	
  2752		for_each_set_bit(e, &e_f, DEPT_MAX_SUBCLASSES_EVT) {
  2753			struct dept_class *c;
  2754			struct dept_key *k;
  2755	
  2756			k = m->keys ?: &m->map_key;
  2757			c = check_new_class(&m->map_key, k,
  2758					    sub_id(m, e), m->name, false);
  2759			if (!c)
  2760				continue;
  2761	
  2762			/*
  2763			 * When it found an ecxt for any event in e_f, done.
  2764			 */
  2765			if (pop_ecxt(m, c))
  2766				goto exit;
  2767		}
  2768	
  2769		dt->missing_ecxt--;
  2770	exit:
  2771		dept_exit(flags);
  2772	}
  2773	EXPORT_SYMBOL_GPL(dept_ecxt_exit);
  2774	
  2775	void dept_task_exit(struct task_struct *t)
  2776	{
  2777		struct dept_task *dt = &t->dept_task;
  2778		int i;
  2779	
  2780		if (unlikely(!dept_working()))
  2781			return;
  2782	
  2783		raw_local_irq_disable();
  2784	
  2785		if (dt->stack) {
  2786			put_stack(dt->stack);
  2787			dt->stack = NULL;
  2788		}
  2789	
  2790		for (i = 0; i < dt->ecxt_held_pos; i++) {
  2791			if (dt->ecxt_held[i].class) {
  2792				put_class(dt->ecxt_held[i].class);
  2793				dt->ecxt_held[i].class = NULL;
  2794			}
  2795			if (dt->ecxt_held[i].ecxt) {
  2796				put_ecxt(dt->ecxt_held[i].ecxt);
  2797				dt->ecxt_held[i].ecxt = NULL;
  2798			}
  2799		}
  2800	
  2801		for (i = 0; i < DEPT_MAX_WAIT_HIST; i++) {
  2802			if (dt->wait_hist[i].wait) {
  2803				put_wait(dt->wait_hist[i].wait);
  2804				dt->wait_hist[i].wait = NULL;
  2805			}
  2806		}
  2807	
  2808		dt->task_exit = true;
  2809		dept_off();
  2810	
  2811		raw_local_irq_enable();
  2812	}
  2813	
  2814	void dept_task_init(struct task_struct *t)
  2815	{
  2816		memset(&t->dept_task, 0x0, sizeof(struct dept_task));
  2817		t->dept_task.stage_lock = (arch_spinlock_t)__ARCH_SPIN_LOCK_UNLOCKED;
  2818	}
  2819	
  2820	void dept_key_init(struct dept_key *k)
  2821	{
  2822		struct dept_task *dt = dept_task();
  2823		unsigned long flags;
  2824		int sub_id;
  2825	
  2826		if (unlikely(!dept_working()))
  2827			return;
  2828	
  2829		if (dt->recursive) {
  2830			DEPT_STOP("Key initialization fails.\n");
  2831			return;
  2832		}
  2833	
  2834		flags = dept_enter();
  2835	
  2836		clean_classes_cache(k);
  2837	
  2838		/*
  2839		 * dept_key_init() should not fail.
  2840		 *
  2841		 * FIXME: Should be fixed if dept_key_init() causes deadlock
  2842		 * with dept_lock().
  2843		 */
  2844		while (unlikely(!dept_lock()))
  2845			cpu_relax();
  2846	
  2847		for (sub_id = 0; sub_id < DEPT_MAX_SUBCLASSES; sub_id++) {
  2848			struct dept_class *c;
  2849	
  2850			c = lookup_class((unsigned long)k->base + sub_id);
  2851			if (!c)
  2852				continue;
  2853	
  2854			DEPT_STOP("The class(%s/%d) has not been removed.\n",
  2855				  c->name, sub_id);
  2856			break;
  2857		}
  2858	
  2859		dept_unlock();
  2860		dept_exit(flags);
  2861	}
  2862	EXPORT_SYMBOL_GPL(dept_key_init);
  2863	
  2864	void dept_key_destroy(struct dept_key *k)
  2865	{
  2866		struct dept_task *dt = dept_task();
  2867		unsigned long flags;
  2868		int sub_id;
  2869	
  2870		if (unlikely(!dept_working()))
  2871			return;
  2872	
  2873		if (dt->recursive == 1 && dt->task_exit) {
  2874			/*
  2875			 * Need to allow to go ahead in this case where
  2876			 * ->recursive has been set to 1 by dept_off() in
  2877			 * dept_task_exit() and ->task_exit has been set to
  2878			 * true in dept_task_exit().
  2879			 */
  2880		} else if (dt->recursive) {
  2881			DEPT_STOP("Key destroying fails.\n");
  2882			return;
  2883		}
  2884	
  2885		flags = dept_enter();
  2886	
  2887		/*
  2888		 * dept_key_destroy() should not fail.
  2889		 *
  2890		 * FIXME: Should be fixed if dept_key_destroy() causes deadlock
  2891		 * with dept_lock().
  2892		 */
  2893		while (unlikely(!dept_lock()))
  2894			cpu_relax();
  2895	
  2896		for (sub_id = 0; sub_id < DEPT_MAX_SUBCLASSES; sub_id++) {
  2897			struct dept_class *c;
  2898	
  2899			c = lookup_class((unsigned long)k->base + sub_id);
  2900			if (!c)
  2901				continue;
  2902	
  2903			hash_del_class(c);
  2904			disconnect_class(c);
  2905			list_del(&c->all_node);
  2906			invalidate_class(c);
  2907	
  2908			/*
  2909			 * Actual deletion will happen on the rcu callback
  2910			 * that has been added in disconnect_class().
  2911			 */
  2912			del_class(c);
  2913		}
  2914	
  2915		dept_unlock();
  2916		dept_exit(flags);
  2917	
  2918		/*
  2919		 * Wait until even lockless hash_lookup_class() for the class
  2920		 * returns NULL.
  2921		 */
  2922		might_sleep();
  2923		synchronize_rcu();
  2924	}
  2925	EXPORT_SYMBOL_GPL(dept_key_destroy);
  2926	
  2927	static void move_llist(struct llist_head *to, struct llist_head *from)
  2928	{
  2929		struct llist_node *first = llist_del_all(from);
  2930		struct llist_node *last;
  2931	
  2932		if (!first)
  2933			return;
  2934	
  2935		for (last = first; last->next; last = last->next);
  2936		llist_add_batch(first, last, to);
  2937	}
  2938	
  2939	static void migrate_per_cpu_pool(void)
  2940	{
  2941		const int boot_cpu = 0;
  2942		int i;
  2943	
  2944		/*
  2945		 * The boot CPU has been using the temperal local pool so far.
  2946		 * From now on that per_cpu areas have been ready, use the
  2947		 * per_cpu local pool instead.
  2948		 */
  2949		DEPT_WARN_ON(smp_processor_id() != boot_cpu);
  2950		for (i = 0; i < OBJECT_NR; i++) {
  2951			struct llist_head *from;
  2952			struct llist_head *to;
  2953	
  2954			from = &pool[i].boot_pool;
  2955			to = per_cpu_ptr(pool[i].lpool, boot_cpu);
  2956			move_llist(to, from);
  2957		}
  2958	}
  2959	
  2960	#define B2KB(B) ((B) / 1024)
  2961	
  2962	/*
  2963	 * Should be called after setup_per_cpu_areas() and before no non-boot
  2964	 * CPUs have been on.
  2965	 */
  2966	void __init dept_init(void)
  2967	{
  2968		size_t mem_total = 0;
  2969	
  2970		local_irq_disable();
  2971		dept_per_cpu_ready = 1;
  2972		migrate_per_cpu_pool();
  2973		local_irq_enable();
  2974	
  2975	#define HASH(id, bits) BUILD_BUG_ON(1 << (bits) <= 0);
> 2976		#include "dept_hash.h"
  2977	#undef  HASH
  2978	#define OBJECT(id, nr) mem_total += sizeof(struct dept_##id) * nr;
  2979		#include "dept_object.h"
  2980	#undef  OBJECT
  2981	#define HASH(id, bits) mem_total += sizeof(struct hlist_head) * (1 << (bits));
> 2982		#include "dept_hash.h"
  2983	#undef  HASH
  2984	
  2985		pr_info("DEPendency Tracker: Copyright (c) 2020 LG Electronics, Inc., Byungchul Park\n");
  2986		pr_info("... DEPT_MAX_STACK_ENTRY: %d\n", DEPT_MAX_STACK_ENTRY);
  2987		pr_info("... DEPT_MAX_WAIT_HIST  : %d\n", DEPT_MAX_WAIT_HIST);
  2988		pr_info("... DEPT_MAX_ECXT_HELD  : %d\n", DEPT_MAX_ECXT_HELD);
  2989		pr_info("... DEPT_MAX_SUBCLASSES : %d\n", DEPT_MAX_SUBCLASSES);
  2990	#define OBJECT(id, nr)							\
  2991		pr_info("... memory used by %s: %zu KB\n",			\
  2992		       #id, B2KB(sizeof(struct dept_##id) * nr));
  2993		#include "dept_object.h"
  2994	#undef  OBJECT
  2995	#define HASH(id, bits)							\
  2996		pr_info("... hash list head used by %s: %zu KB\n",		\
  2997		       #id, B2KB(sizeof(struct hlist_head) * (1 << (bits))));
> 2998		#include "dept_hash.h"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
