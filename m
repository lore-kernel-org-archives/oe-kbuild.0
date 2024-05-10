Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4527512DD88
	for <oe-kbuild@lists.linux.dev>; Fri, 10 May 2024 05:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715320016; cv=none; b=Vb1HYHS20E1jaudxB1YquY8n7hQw6oghKFhCe3VUhnSUzp7f6DC+fUPkDxS7Bq/bhsCam35j56OjchOJRdgI5hxjKaeSzYSY4j4VcEeJJ3eJrE44/u4Y7mIv2ZHnUJ84+JR001qfXwCIgzGWXDE2/LIfRVsqRVC2fy9PAuV3/Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715320016; c=relaxed/simple;
	bh=VRQdnO4Sjp3rAf7B10VpNT3eaAy6oflJxW1AHTS1ER0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AFuAmk2DY3bCmbhIgI5am9v5YsSMU5IZDWy2SJzDiZF4osInoQQXYPIWFpXKApc5/fp6+m1nVLo0IeBqpJ8u1AqzIy/fd5aPBM86ZAozxmHfMxpwt3KiotCGqrKyIQeoh82IwZgkH0NFj7zIOsLlrooLZbmQ4t4GE0Y4zTyLOl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YH2/6IJT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YH2/6IJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715320010; x=1746856010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VRQdnO4Sjp3rAf7B10VpNT3eaAy6oflJxW1AHTS1ER0=;
  b=YH2/6IJTLTuvQvGL3WKXuRUbc5y6X2kJyw4dCFx7fKI04OJVnQJ9qYoy
   dCb6YMvy2lHMHhPBcTH8c8KU3IOtPKV8SJw730emZlZ4yNUczGTZmLYX2
   aTFs0yoB4K8/RNpIjbmbbgu8BqFWYyI4FYiZAbWfTIhwzXb0thuijcwa5
   fXhn2+p+t/eXuUHGH5/71GabcbmlIZqk+ABFNWWRd1w/dfiC8WgA3Knlv
   7jZXOGrMEzTwqchIKfFNebbFdjmDFdwBPzcYCC8QB+k86hqDPkUtWYcOf
   3Rjom/29sWC3XuoJbkzJvtOGtV2IvUlLPY0W8p9rJKxn6an1DVde1ratI
   g==;
X-CSE-ConnectionGUID: AfW+9I48R3Sy9gOdFCRVsw==
X-CSE-MsgGUID: MpOWYTTuSVqjUTFZf5eErw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11217849"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="11217849"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 22:46:50 -0700
X-CSE-ConnectionGUID: zyfZ0fTfTFm9VFsPKC8ihg==
X-CSE-MsgGUID: droEZ6rWQVa3pz/xkbG8Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="29495004"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 May 2024 22:46:48 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5J5h-0005mZ-2C;
	Fri, 10 May 2024 05:46:45 +0000
Date: Fri, 10 May 2024 13:46:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v14 02/28] dept: Implement Dept(Dependency Tracker)
Message-ID: <202405101349.IqkN1Lle-lkp@intel.com>
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
In-Reply-To: <20240508094726.35754-3-byungchul@sk.com>
References: <20240508094726.35754-3-byungchul@sk.com>
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

[auto build test WARNING on dd5a440a31fae6e459c0d6271dddd62825505361]

url:    https://github.com/intel-lab-lkp/linux/commits/Byungchul-Park/llist-Move-llist_-head-node-definition-to-types-h/20240508-180822
base:   dd5a440a31fae6e459c0d6271dddd62825505361
patch link:    https://lore.kernel.org/r/20240508094726.35754-3-byungchul%40sk.com
patch subject: [PATCH v14 02/28] dept: Implement Dept(Dependency Tracker)
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405101349.IqkN1Lle-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> kernel/dependency/dept.c: dept_hash.h is included more than once.
>> kernel/dependency/dept.c: dept_object.h is included more than once.

vim +599 kernel/dependency/dept.c

   569	
   570	#define HASH(id, bits)							\
   571	static struct hlist_head table_##id[1 << (bits)];			\
   572										\
   573	static struct hlist_head *head_##id(struct dept_##id *a)		\
   574	{									\
   575		return table_##id + hash_long(key_##id(a), bits);		\
   576	}									\
   577										\
   578	static struct dept_##id *hash_lookup_##id(struct dept_##id *a)		\
   579	{									\
   580		struct dept_##id *b;						\
   581										\
   582		hlist_for_each_entry_rcu(b, head_##id(a), hash_node)		\
   583			if (cmp_##id(a, b))					\
   584				return b;					\
   585		return NULL;							\
   586	}									\
   587										\
   588	static void hash_add_##id(struct dept_##id *a)				\
   589	{									\
   590		get_##id(a);							\
   591		hlist_add_head_rcu(&a->hash_node, head_##id(a));		\
   592	}									\
   593										\
   594	static void hash_del_##id(struct dept_##id *a)				\
   595	{									\
   596		hlist_del_rcu(&a->hash_node);					\
   597		put_##id(a);							\
   598	}
 > 599	#include "dept_hash.h"
   600	#undef  HASH
   601	
   602	static struct dept_dep *lookup_dep(struct dept_class *fc,
   603					   struct dept_class *tc)
   604	{
   605		struct dept_ecxt onetime_e = { .class = fc };
   606		struct dept_wait onetime_w = { .class = tc };
   607		struct dept_dep  onetime_d = { .ecxt = &onetime_e,
   608					       .wait = &onetime_w };
   609		return hash_lookup_dep(&onetime_d);
   610	}
   611	
   612	static struct dept_class *lookup_class(unsigned long key)
   613	{
   614		struct dept_class onetime_c = { .key = key };
   615	
   616		return hash_lookup_class(&onetime_c);
   617	}
   618	
   619	/*
   620	 * Report
   621	 * =====================================================================
   622	 * DEPT prints useful information to help debuging on detection of
   623	 * problematic dependency.
   624	 */
   625	
   626	static void print_ip_stack(unsigned long ip, struct dept_stack *s)
   627	{
   628		if (ip)
   629			print_ip_sym(KERN_WARNING, ip);
   630	
   631		if (valid_stack(s)) {
   632			pr_warn("stacktrace:\n");
   633			stack_trace_print(s->raw, s->nr, 5);
   634		}
   635	
   636		if (!ip && !valid_stack(s))
   637			pr_warn("(N/A)\n");
   638	}
   639	
   640	#define print_spc(spc, fmt, ...) \
   641		pr_warn("%*c" fmt, (spc) * 4, ' ', ##__VA_ARGS__)
   642	
   643	static void print_diagram(struct dept_dep *d)
   644	{
   645		struct dept_ecxt *e = dep_e(d);
   646		struct dept_wait *w = dep_w(d);
   647		struct dept_class *fc = dep_fc(d);
   648		struct dept_class *tc = dep_tc(d);
   649		unsigned long irqf;
   650		int irq;
   651		bool firstline = true;
   652		int spc = 1;
   653		const char *w_fn = w->wait_fn ?: "(unknown)";
   654		const char *e_fn = e->event_fn ?: "(unknown)";
   655		const char *c_fn = e->ecxt_fn ?: "(unknown)";
   656		const char *fc_n = fc->sched_map ? "<sched>" : (fc->name ?: "(unknown)");
   657		const char *tc_n = tc->sched_map ? "<sched>" : (tc->name ?: "(unknown)");
   658	
   659		irqf = e->enirqf & w->irqf;
   660		for_each_set_bit(irq, &irqf, DEPT_IRQS_NR) {
   661			if (!firstline)
   662				pr_warn("\nor\n\n");
   663			firstline = false;
   664	
   665			print_spc(spc, "[S] %s(%s:%d)\n", c_fn, fc_n, fc->sub_id);
   666			print_spc(spc, "    <%s interrupt>\n", irq_str(irq));
   667			print_spc(spc + 1, "[W] %s(%s:%d)\n", w_fn, tc_n, tc->sub_id);
   668			print_spc(spc, "[E] %s(%s:%d)\n", e_fn, fc_n, fc->sub_id);
   669		}
   670	
   671		if (!irqf) {
   672			print_spc(spc, "[S] %s(%s:%d)\n", c_fn, fc_n, fc->sub_id);
   673			print_spc(spc, "[W] %s(%s:%d)\n", w_fn, tc_n, tc->sub_id);
   674			print_spc(spc, "[E] %s(%s:%d)\n", e_fn, fc_n, fc->sub_id);
   675		}
   676	}
   677	
   678	static void print_dep(struct dept_dep *d)
   679	{
   680		struct dept_ecxt *e = dep_e(d);
   681		struct dept_wait *w = dep_w(d);
   682		struct dept_class *fc = dep_fc(d);
   683		struct dept_class *tc = dep_tc(d);
   684		unsigned long irqf;
   685		int irq;
   686		const char *w_fn = w->wait_fn ?: "(unknown)";
   687		const char *e_fn = e->event_fn ?: "(unknown)";
   688		const char *c_fn = e->ecxt_fn ?: "(unknown)";
   689		const char *fc_n = fc->sched_map ? "<sched>" : (fc->name ?: "(unknown)");
   690		const char *tc_n = tc->sched_map ? "<sched>" : (tc->name ?: "(unknown)");
   691	
   692		irqf = e->enirqf & w->irqf;
   693		for_each_set_bit(irq, &irqf, DEPT_IRQS_NR) {
   694			pr_warn("%s has been enabled:\n", irq_str(irq));
   695			print_ip_stack(e->enirq_ip[irq], e->enirq_stack[irq]);
   696			pr_warn("\n");
   697	
   698			pr_warn("[S] %s(%s:%d):\n", c_fn, fc_n, fc->sub_id);
   699			print_ip_stack(e->ecxt_ip, e->ecxt_stack);
   700			pr_warn("\n");
   701	
   702			pr_warn("[W] %s(%s:%d) in %s context:\n",
   703			       w_fn, tc_n, tc->sub_id, irq_str(irq));
   704			print_ip_stack(w->irq_ip[irq], w->irq_stack[irq]);
   705			pr_warn("\n");
   706	
   707			pr_warn("[E] %s(%s:%d):\n", e_fn, fc_n, fc->sub_id);
   708			print_ip_stack(e->event_ip, e->event_stack);
   709		}
   710	
   711		if (!irqf) {
   712			pr_warn("[S] %s(%s:%d):\n", c_fn, fc_n, fc->sub_id);
   713			print_ip_stack(e->ecxt_ip, e->ecxt_stack);
   714			pr_warn("\n");
   715	
   716			pr_warn("[W] %s(%s:%d):\n", w_fn, tc_n, tc->sub_id);
   717			print_ip_stack(w->wait_ip, w->wait_stack);
   718			pr_warn("\n");
   719	
   720			pr_warn("[E] %s(%s:%d):\n", e_fn, fc_n, fc->sub_id);
   721			print_ip_stack(e->event_ip, e->event_stack);
   722		}
   723	}
   724	
   725	static void save_current_stack(int skip);
   726	
   727	/*
   728	 * Print all classes in a circle.
   729	 */
   730	static void print_circle(struct dept_class *c)
   731	{
   732		struct dept_class *fc = c->bfs_parent;
   733		struct dept_class *tc = c;
   734		int i;
   735	
   736		dept_outworld_enter();
   737		save_current_stack(6);
   738	
   739		pr_warn("===================================================\n");
   740		pr_warn("DEPT: Circular dependency has been detected.\n");
   741		pr_warn("%s %.*s %s\n", init_utsname()->release,
   742			(int)strcspn(init_utsname()->version, " "),
   743			init_utsname()->version,
   744			print_tainted());
   745		pr_warn("---------------------------------------------------\n");
   746		pr_warn("summary\n");
   747		pr_warn("---------------------------------------------------\n");
   748	
   749		if (fc == tc)
   750			pr_warn("*** AA DEADLOCK ***\n\n");
   751		else
   752			pr_warn("*** DEADLOCK ***\n\n");
   753	
   754		i = 0;
   755		do {
   756			struct dept_dep *d = lookup_dep(fc, tc);
   757	
   758			pr_warn("context %c\n", 'A' + (i++));
   759			print_diagram(d);
   760			if (fc != c)
   761				pr_warn("\n");
   762	
   763			tc = fc;
   764			fc = fc->bfs_parent;
   765		} while (tc != c);
   766	
   767		pr_warn("\n");
   768		pr_warn("[S]: start of the event context\n");
   769		pr_warn("[W]: the wait blocked\n");
   770		pr_warn("[E]: the event not reachable\n");
   771	
   772		i = 0;
   773		do {
   774			struct dept_dep *d = lookup_dep(fc, tc);
   775	
   776			pr_warn("---------------------------------------------------\n");
   777			pr_warn("context %c's detail\n", 'A' + i);
   778			pr_warn("---------------------------------------------------\n");
   779			pr_warn("context %c\n", 'A' + (i++));
   780			print_diagram(d);
   781			pr_warn("\n");
   782			print_dep(d);
   783	
   784			tc = fc;
   785			fc = fc->bfs_parent;
   786		} while (tc != c);
   787	
   788		pr_warn("---------------------------------------------------\n");
   789		pr_warn("information that might be helpful\n");
   790		pr_warn("---------------------------------------------------\n");
   791		dump_stack();
   792	
   793		dept_outworld_exit();
   794	}
   795	
   796	/*
   797	 * BFS(Breadth First Search)
   798	 * =====================================================================
   799	 * Whenever a new dependency is added into the graph, search the graph
   800	 * for a new circular dependency.
   801	 */
   802	
   803	static void enqueue(struct list_head *h, struct dept_dep *d)
   804	{
   805		list_add_tail(&d->bfs_node, h);
   806	}
   807	
   808	static struct dept_dep *dequeue(struct list_head *h)
   809	{
   810		struct dept_dep *d;
   811	
   812		d = list_first_entry(h, struct dept_dep, bfs_node);
   813		list_del(&d->bfs_node);
   814		return d;
   815	}
   816	
   817	static bool empty(struct list_head *h)
   818	{
   819		return list_empty(h);
   820	}
   821	
   822	static void extend_queue(struct list_head *h, struct dept_class *cur)
   823	{
   824		struct dept_dep *d;
   825	
   826		list_for_each_entry(d, &cur->dep_head, dep_node) {
   827			struct dept_class *next = dep_tc(d);
   828	
   829			if (cur->bfs_gen == next->bfs_gen)
   830				continue;
   831			next->bfs_gen = cur->bfs_gen;
   832			next->bfs_dist = cur->bfs_dist + 1;
   833			next->bfs_parent = cur;
   834			enqueue(h, d);
   835		}
   836	}
   837	
   838	static void extend_queue_rev(struct list_head *h, struct dept_class *cur)
   839	{
   840		struct dept_dep *d;
   841	
   842		list_for_each_entry(d, &cur->dep_rev_head, dep_rev_node) {
   843			struct dept_class *next = dep_fc(d);
   844	
   845			if (cur->bfs_gen == next->bfs_gen)
   846				continue;
   847			next->bfs_gen = cur->bfs_gen;
   848			next->bfs_dist = cur->bfs_dist + 1;
   849			next->bfs_parent = cur;
   850			enqueue(h, d);
   851		}
   852	}
   853	
   854	typedef enum bfs_ret bfs_f(struct dept_dep *d, void *in, void **out);
   855	static unsigned int bfs_gen;
   856	
   857	/*
   858	 * NOTE: Must be called with dept_lock held.
   859	 */
   860	static void bfs(struct dept_class *c, bfs_f *cb, void *in, void **out)
   861	{
   862		LIST_HEAD(q);
   863		enum bfs_ret ret;
   864	
   865		if (DEPT_WARN_ON(!cb))
   866			return;
   867	
   868		/*
   869		 * Avoid zero bfs_gen.
   870		 */
   871		bfs_gen = bfs_gen + 1 ?: 1;
   872	
   873		c->bfs_gen = bfs_gen;
   874		c->bfs_dist = 0;
   875		c->bfs_parent = c;
   876	
   877		ret = cb(NULL, in, out);
   878		if (ret == BFS_DONE)
   879			return;
   880		if (ret == BFS_SKIP)
   881			return;
   882		if (ret == BFS_CONTINUE)
   883			extend_queue(&q, c);
   884		if (ret == BFS_CONTINUE_REV)
   885			extend_queue_rev(&q, c);
   886	
   887		while (!empty(&q)) {
   888			struct dept_dep *d = dequeue(&q);
   889	
   890			ret = cb(d, in, out);
   891			if (ret == BFS_DONE)
   892				break;
   893			if (ret == BFS_SKIP)
   894				continue;
   895			if (ret == BFS_CONTINUE)
   896				extend_queue(&q, dep_tc(d));
   897			if (ret == BFS_CONTINUE_REV)
   898				extend_queue_rev(&q, dep_fc(d));
   899		}
   900	
   901		while (!empty(&q))
   902			dequeue(&q);
   903	}
   904	
   905	/*
   906	 * Main operations
   907	 * =====================================================================
   908	 * Add dependencies - Each new dependency is added into the graph and
   909	 * checked if it forms a circular dependency.
   910	 *
   911	 * Track waits - Waits are queued into the ring buffer for later use to
   912	 * generate appropriate dependencies with cross-event.
   913	 *
   914	 * Track event contexts(ecxt) - Event contexts are pushed into local
   915	 * stack for later use to generate appropriate dependencies with waits.
   916	 */
   917	
   918	static unsigned long cur_enirqf(void);
   919	static int cur_irq(void);
   920	static unsigned int cur_ctxt_id(void);
   921	
   922	static struct dept_iecxt *iecxt(struct dept_class *c, int irq)
   923	{
   924		return &c->iecxt[irq];
   925	}
   926	
   927	static struct dept_iwait *iwait(struct dept_class *c, int irq)
   928	{
   929		return &c->iwait[irq];
   930	}
   931	
   932	static void stale_iecxt(struct dept_iecxt *ie)
   933	{
   934		if (ie->ecxt)
   935			put_ecxt(ie->ecxt);
   936	
   937		WRITE_ONCE(ie->ecxt, NULL);
   938		WRITE_ONCE(ie->staled, true);
   939	}
   940	
   941	static void set_iecxt(struct dept_iecxt *ie, struct dept_ecxt *e)
   942	{
   943		/*
   944		 * ->ecxt will never be updated once getting set until the class
   945		 * gets removed.
   946		 */
   947		if (ie->ecxt)
   948			DEPT_WARN_ON(1);
   949		else
   950			WRITE_ONCE(ie->ecxt, get_ecxt(e));
   951	}
   952	
   953	static void stale_iwait(struct dept_iwait *iw)
   954	{
   955		if (iw->wait)
   956			put_wait(iw->wait);
   957	
   958		WRITE_ONCE(iw->wait, NULL);
   959		WRITE_ONCE(iw->staled, true);
   960	}
   961	
   962	static void set_iwait(struct dept_iwait *iw, struct dept_wait *w)
   963	{
   964		/*
   965		 * ->wait will never be updated once getting set until the class
   966		 * gets removed.
   967		 */
   968		if (iw->wait)
   969			DEPT_WARN_ON(1);
   970		else
   971			WRITE_ONCE(iw->wait, get_wait(w));
   972	
   973		iw->touched = true;
   974	}
   975	
   976	static void touch_iwait(struct dept_iwait *iw)
   977	{
   978		iw->touched = true;
   979	}
   980	
   981	static void untouch_iwait(struct dept_iwait *iw)
   982	{
   983		iw->touched = false;
   984	}
   985	
   986	static struct dept_stack *get_current_stack(void)
   987	{
   988		struct dept_stack *s = dept_task()->stack;
   989	
   990		return s ? get_stack(s) : NULL;
   991	}
   992	
   993	static void prepare_current_stack(void)
   994	{
   995		struct dept_stack *s = dept_task()->stack;
   996	
   997		/*
   998		 * The dept_stack is already ready.
   999		 */
  1000		if (s && !stack_consumed(s)) {
  1001			s->nr = 0;
  1002			return;
  1003		}
  1004	
  1005		if (s)
  1006			put_stack(s);
  1007	
  1008		s = dept_task()->stack = new_stack();
  1009		if (!s)
  1010			return;
  1011	
  1012		get_stack(s);
  1013		del_stack(s);
  1014	}
  1015	
  1016	static void save_current_stack(int skip)
  1017	{
  1018		struct dept_stack *s = dept_task()->stack;
  1019	
  1020		if (!s)
  1021			return;
  1022		if (valid_stack(s))
  1023			return;
  1024	
  1025		s->nr = stack_trace_save(s->raw, DEPT_MAX_STACK_ENTRY, skip);
  1026	}
  1027	
  1028	static void finish_current_stack(void)
  1029	{
  1030		struct dept_stack *s = dept_task()->stack;
  1031	
  1032		if (stack_consumed(s))
  1033			save_current_stack(2);
  1034	}
  1035	
  1036	/*
  1037	 * FIXME: For now, disable LOCKDEP while DEPT is working.
  1038	 *
  1039	 * Both LOCKDEP and DEPT report it on a deadlock detection using
  1040	 * printk taking the risk of another deadlock that might be caused by
  1041	 * locks of console or printk between inside and outside of them.
  1042	 *
  1043	 * For DEPT, it's no problem since multiple reports are allowed. But it
  1044	 * would be a bad idea for LOCKDEP since it will stop even on a singe
  1045	 * report. So we need to prevent LOCKDEP from its reporting the risk
  1046	 * DEPT would take when reporting something.
  1047	 */
  1048	#include <linux/lockdep.h>
  1049	
  1050	void noinstr dept_off(void)
  1051	{
  1052		dept_task()->recursive++;
  1053		lockdep_off();
  1054	}
  1055	
  1056	void noinstr dept_on(void)
  1057	{
  1058		dept_task()->recursive--;
  1059		lockdep_on();
  1060	}
  1061	
  1062	static unsigned long dept_enter(void)
  1063	{
  1064		unsigned long flags;
  1065	
  1066		flags = arch_local_irq_save();
  1067		dept_off();
  1068		prepare_current_stack();
  1069		return flags;
  1070	}
  1071	
  1072	static void dept_exit(unsigned long flags)
  1073	{
  1074		finish_current_stack();
  1075		dept_on();
  1076		arch_local_irq_restore(flags);
  1077	}
  1078	
  1079	static unsigned long dept_enter_recursive(void)
  1080	{
  1081		unsigned long flags;
  1082	
  1083		flags = arch_local_irq_save();
  1084		return flags;
  1085	}
  1086	
  1087	static void dept_exit_recursive(unsigned long flags)
  1088	{
  1089		arch_local_irq_restore(flags);
  1090	}
  1091	
  1092	/*
  1093	 * NOTE: Must be called with dept_lock held.
  1094	 */
  1095	static struct dept_dep *__add_dep(struct dept_ecxt *e,
  1096					  struct dept_wait *w)
  1097	{
  1098		struct dept_dep *d;
  1099	
  1100		if (DEPT_WARN_ON(!valid_class(e->class)))
  1101			return NULL;
  1102	
  1103		if (DEPT_WARN_ON(!valid_class(w->class)))
  1104			return NULL;
  1105	
  1106		if (lookup_dep(e->class, w->class))
  1107			return NULL;
  1108	
  1109		d = new_dep();
  1110		if (unlikely(!d))
  1111			return NULL;
  1112	
  1113		d->ecxt = get_ecxt(e);
  1114		d->wait = get_wait(w);
  1115	
  1116		/*
  1117		 * Add the dependency into hash and graph.
  1118		 */
  1119		hash_add_dep(d);
  1120		list_add(&d->dep_node, &dep_fc(d)->dep_head);
  1121		list_add(&d->dep_rev_node, &dep_tc(d)->dep_rev_head);
  1122		return d;
  1123	}
  1124	
  1125	static enum bfs_ret cb_check_dl(struct dept_dep *d,
  1126					void *in, void **out)
  1127	{
  1128		struct dept_dep *new = (struct dept_dep *)in;
  1129	
  1130		/*
  1131		 * initial condition for this BFS search
  1132		 */
  1133		if (!d) {
  1134			dep_tc(new)->bfs_parent = dep_fc(new);
  1135	
  1136			if (dep_tc(new) != dep_fc(new))
  1137				return BFS_CONTINUE;
  1138	
  1139			/*
  1140			 * AA circle does not make additional deadlock. We don't
  1141			 * have to continue this BFS search.
  1142			 */
  1143			print_circle(dep_tc(new));
  1144			return BFS_DONE;
  1145		}
  1146	
  1147		/*
  1148		 * Allow multiple reports.
  1149		 */
  1150		if (dep_tc(d) == dep_fc(new))
  1151			print_circle(dep_tc(new));
  1152	
  1153		return BFS_CONTINUE;
  1154	}
  1155	
  1156	/*
  1157	 * This function is actually in charge of reporting.
  1158	 */
  1159	static void check_dl_bfs(struct dept_dep *d)
  1160	{
  1161		bfs(dep_tc(d), cb_check_dl, (void *)d, NULL);
  1162	}
  1163	
  1164	static enum bfs_ret cb_find_iw(struct dept_dep *d, void *in, void **out)
  1165	{
  1166		int irq = *(int *)in;
  1167		struct dept_class *fc;
  1168		struct dept_iwait *iw;
  1169	
  1170		if (DEPT_WARN_ON(!out))
  1171			return BFS_DONE;
  1172	
  1173		/*
  1174		 * initial condition for this BFS search
  1175		 */
  1176		if (!d)
  1177			return BFS_CONTINUE_REV;
  1178	
  1179		fc = dep_fc(d);
  1180		iw = iwait(fc, irq);
  1181	
  1182		/*
  1183		 * If any parent's ->wait was set, then the children would've
  1184		 * been touched.
  1185		 */
  1186		if (!iw->touched)
  1187			return BFS_SKIP;
  1188	
  1189		if (!iw->wait)
  1190			return BFS_CONTINUE_REV;
  1191	
  1192		*out = iw;
  1193		return BFS_DONE;
  1194	}
  1195	
  1196	static struct dept_iwait *find_iw_bfs(struct dept_class *c, int irq)
  1197	{
  1198		struct dept_iwait *iw = iwait(c, irq);
  1199		struct dept_iwait *found = NULL;
  1200	
  1201		if (iw->wait)
  1202			return iw;
  1203	
  1204		/*
  1205		 * '->touched == false' guarantees there's no parent that has
  1206		 * been set ->wait.
  1207		 */
  1208		if (!iw->touched)
  1209			return NULL;
  1210	
  1211		bfs(c, cb_find_iw, (void *)&irq, (void **)&found);
  1212	
  1213		if (found)
  1214			return found;
  1215	
  1216		untouch_iwait(iw);
  1217		return NULL;
  1218	}
  1219	
  1220	static enum bfs_ret cb_touch_iw_find_ie(struct dept_dep *d, void *in,
  1221						void **out)
  1222	{
  1223		int irq = *(int *)in;
  1224		struct dept_class *tc;
  1225		struct dept_iecxt *ie;
  1226		struct dept_iwait *iw;
  1227	
  1228		if (DEPT_WARN_ON(!out))
  1229			return BFS_DONE;
  1230	
  1231		/*
  1232		 * initial condition for this BFS search
  1233		 */
  1234		if (!d)
  1235			return BFS_CONTINUE;
  1236	
  1237		tc = dep_tc(d);
  1238		ie = iecxt(tc, irq);
  1239		iw = iwait(tc, irq);
  1240	
  1241		touch_iwait(iw);
  1242	
  1243		if (!ie->ecxt)
  1244			return BFS_CONTINUE;
  1245	
  1246		if (!*out)
  1247			*out = ie;
  1248	
  1249		return BFS_CONTINUE;
  1250	}
  1251	
  1252	static struct dept_iecxt *touch_iw_find_ie_bfs(struct dept_class *c,
  1253						       int irq)
  1254	{
  1255		struct dept_iecxt *ie = iecxt(c, irq);
  1256		struct dept_iwait *iw = iwait(c, irq);
  1257		struct dept_iecxt *found = ie->ecxt ? ie : NULL;
  1258	
  1259		touch_iwait(iw);
  1260		bfs(c, cb_touch_iw_find_ie, (void *)&irq, (void **)&found);
  1261		return found;
  1262	}
  1263	
  1264	/*
  1265	 * Should be called with dept_lock held.
  1266	 */
  1267	static void __add_idep(struct dept_iecxt *ie, struct dept_iwait *iw)
  1268	{
  1269		struct dept_dep *new;
  1270	
  1271		/*
  1272		 * There's nothing to do.
  1273		 */
  1274		if (!ie || !iw || !ie->ecxt || !iw->wait)
  1275			return;
  1276	
  1277		new = __add_dep(ie->ecxt, iw->wait);
  1278	
  1279		/*
  1280		 * Deadlock detected. Let check_dl_bfs() report it.
  1281		 */
  1282		if (new) {
  1283			check_dl_bfs(new);
  1284			stale_iecxt(ie);
  1285			stale_iwait(iw);
  1286		}
  1287	
  1288		/*
  1289		 * If !new, it would be the case of lack of object resource.
  1290		 * Just let it go and get checked by other chances. Retrying is
  1291		 * meaningless in that case.
  1292		 */
  1293	}
  1294	
  1295	static void set_check_iecxt(struct dept_class *c, int irq,
  1296				    struct dept_ecxt *e)
  1297	{
  1298		struct dept_iecxt *ie = iecxt(c, irq);
  1299	
  1300		set_iecxt(ie, e);
  1301		__add_idep(ie, find_iw_bfs(c, irq));
  1302	}
  1303	
  1304	static void set_check_iwait(struct dept_class *c, int irq,
  1305				    struct dept_wait *w)
  1306	{
  1307		struct dept_iwait *iw = iwait(c, irq);
  1308	
  1309		set_iwait(iw, w);
  1310		__add_idep(touch_iw_find_ie_bfs(c, irq), iw);
  1311	}
  1312	
  1313	static void add_iecxt(struct dept_class *c, int irq, struct dept_ecxt *e,
  1314			      bool stack)
  1315	{
  1316		/*
  1317		 * This access is safe since we ensure e->class has set locally.
  1318		 */
  1319		struct dept_task *dt = dept_task();
  1320		struct dept_iecxt *ie = iecxt(c, irq);
  1321	
  1322		if (DEPT_WARN_ON(!valid_class(c)))
  1323			return;
  1324	
  1325		if (unlikely(READ_ONCE(ie->staled)))
  1326			return;
  1327	
  1328		/*
  1329		 * Skip add_iecxt() if ie->ecxt has ever been set at least once.
  1330		 * Which means it has a valid ->ecxt or been staled.
  1331		 */
  1332		if (READ_ONCE(ie->ecxt))
  1333			return;
  1334	
  1335		if (unlikely(!dept_lock()))
  1336			return;
  1337	
  1338		if (unlikely(ie->staled))
  1339			goto unlock;
  1340		if (ie->ecxt)
  1341			goto unlock;
  1342	
  1343		e->enirqf |= (1UL << irq);
  1344	
  1345		/*
  1346		 * Should be NULL since it's the first time that these
  1347		 * enirq_{ip,stack}[irq] have ever set.
  1348		 */
  1349		DEPT_WARN_ON(e->enirq_ip[irq]);
  1350		DEPT_WARN_ON(e->enirq_stack[irq]);
  1351	
  1352		e->enirq_ip[irq] = dt->enirq_ip[irq];
  1353		e->enirq_stack[irq] = stack ? get_current_stack() : NULL;
  1354	
  1355		set_check_iecxt(c, irq, e);
  1356	unlock:
  1357		dept_unlock();
  1358	}
  1359	
  1360	static void add_iwait(struct dept_class *c, int irq, struct dept_wait *w)
  1361	{
  1362		struct dept_iwait *iw = iwait(c, irq);
  1363	
  1364		if (DEPT_WARN_ON(!valid_class(c)))
  1365			return;
  1366	
  1367		if (unlikely(READ_ONCE(iw->staled)))
  1368			return;
  1369	
  1370		/*
  1371		 * Skip add_iwait() if iw->wait has ever been set at least once.
  1372		 * Which means it has a valid ->wait or been staled.
  1373		 */
  1374		if (READ_ONCE(iw->wait))
  1375			return;
  1376	
  1377		if (unlikely(!dept_lock()))
  1378			return;
  1379	
  1380		if (unlikely(iw->staled))
  1381			goto unlock;
  1382		if (iw->wait)
  1383			goto unlock;
  1384	
  1385		w->irqf |= (1UL << irq);
  1386	
  1387		/*
  1388		 * Should be NULL since it's the first time that these
  1389		 * irq_{ip,stack}[irq] have ever set.
  1390		 */
  1391		DEPT_WARN_ON(w->irq_ip[irq]);
  1392		DEPT_WARN_ON(w->irq_stack[irq]);
  1393	
  1394		w->irq_ip[irq] = w->wait_ip;
  1395		w->irq_stack[irq] = get_current_stack();
  1396	
  1397		set_check_iwait(c, irq, w);
  1398	unlock:
  1399		dept_unlock();
  1400	}
  1401	
  1402	static struct dept_wait_hist *hist(int pos)
  1403	{
  1404		struct dept_task *dt = dept_task();
  1405	
  1406		return dt->wait_hist + (pos % DEPT_MAX_WAIT_HIST);
  1407	}
  1408	
  1409	static int hist_pos_next(void)
  1410	{
  1411		struct dept_task *dt = dept_task();
  1412	
  1413		return dt->wait_hist_pos % DEPT_MAX_WAIT_HIST;
  1414	}
  1415	
  1416	static void hist_advance(void)
  1417	{
  1418		struct dept_task *dt = dept_task();
  1419	
  1420		dt->wait_hist_pos++;
  1421		dt->wait_hist_pos %= DEPT_MAX_WAIT_HIST;
  1422	}
  1423	
  1424	static struct dept_wait_hist *new_hist(void)
  1425	{
  1426		struct dept_wait_hist *wh = hist(hist_pos_next());
  1427	
  1428		hist_advance();
  1429		return wh;
  1430	}
  1431	
  1432	static void add_hist(struct dept_wait *w, unsigned int wg, unsigned int ctxt_id)
  1433	{
  1434		struct dept_wait_hist *wh = new_hist();
  1435	
  1436		if (likely(wh->wait))
  1437			put_wait(wh->wait);
  1438	
  1439		wh->wait = get_wait(w);
  1440		wh->wgen = wg;
  1441		wh->ctxt_id = ctxt_id;
  1442	}
  1443	
  1444	/*
  1445	 * Should be called after setting up e's iecxt and w's iwait.
  1446	 */
  1447	static void add_dep(struct dept_ecxt *e, struct dept_wait *w)
  1448	{
  1449		struct dept_class *fc = e->class;
  1450		struct dept_class *tc = w->class;
  1451		struct dept_dep *d;
  1452		int i;
  1453	
  1454		if (lookup_dep(fc, tc))
  1455			return;
  1456	
  1457		if (unlikely(!dept_lock()))
  1458			return;
  1459	
  1460		/*
  1461		 * __add_dep() will lookup_dep() again with lock held.
  1462		 */
  1463		d = __add_dep(e, w);
  1464		if (d) {
  1465			check_dl_bfs(d);
  1466	
  1467			for (i = 0; i < DEPT_IRQS_NR; i++) {
  1468				struct dept_iwait *fiw = iwait(fc, i);
  1469				struct dept_iecxt *found_ie;
  1470				struct dept_iwait *found_iw;
  1471	
  1472				/*
  1473				 * '->touched == false' guarantees there's no
  1474				 * parent that has been set ->wait.
  1475				 */
  1476				if (!fiw->touched)
  1477					continue;
  1478	
  1479				/*
  1480				 * find_iw_bfs() will untouch the iwait if
  1481				 * not found.
  1482				 */
  1483				found_iw = find_iw_bfs(fc, i);
  1484	
  1485				if (!found_iw)
  1486					continue;
  1487	
  1488				found_ie = touch_iw_find_ie_bfs(tc, i);
  1489				__add_idep(found_ie, found_iw);
  1490			}
  1491		}
  1492		dept_unlock();
  1493	}
  1494	
  1495	static atomic_t wgen = ATOMIC_INIT(1);
  1496	
  1497	static void add_wait(struct dept_class *c, unsigned long ip,
  1498			     const char *w_fn, int sub_l, bool sched_sleep)
  1499	{
  1500		struct dept_task *dt = dept_task();
  1501		struct dept_wait *w;
  1502		unsigned int wg = 0U;
  1503		int irq;
  1504		int i;
  1505	
  1506		if (DEPT_WARN_ON(!valid_class(c)))
  1507			return;
  1508	
  1509		w = new_wait();
  1510		if (unlikely(!w))
  1511			return;
  1512	
  1513		WRITE_ONCE(w->class, get_class(c));
  1514		w->wait_ip = ip;
  1515		w->wait_fn = w_fn;
  1516		w->wait_stack = get_current_stack();
  1517		w->sched_sleep = sched_sleep;
  1518	
  1519		irq = cur_irq();
  1520		if (irq < DEPT_IRQS_NR)
  1521			add_iwait(c, irq, w);
  1522	
  1523		/*
  1524		 * Avoid adding dependency between user aware nested ecxt and
  1525		 * wait.
  1526		 */
  1527		for (i = dt->ecxt_held_pos - 1; i >= 0; i--) {
  1528			struct dept_ecxt_held *eh;
  1529	
  1530			eh = dt->ecxt_held + i;
  1531	
  1532			/*
  1533			 * the case of invalid key'ed one
  1534			 */
  1535			if (!eh->ecxt)
  1536				continue;
  1537	
  1538			if (eh->ecxt->class != c || eh->sub_l == sub_l)
  1539				add_dep(eh->ecxt, w);
  1540		}
  1541	
  1542		if (!wait_consumed(w) && !rich_stack) {
  1543			if (w->wait_stack)
  1544				put_stack(w->wait_stack);
  1545			w->wait_stack = NULL;
  1546		}
  1547	
  1548		/*
  1549		 * Avoid zero wgen.
  1550		 */
  1551		wg = atomic_inc_return(&wgen) ?: atomic_inc_return(&wgen);
  1552		add_hist(w, wg, cur_ctxt_id());
  1553	
  1554		del_wait(w);
  1555	}
  1556	
  1557	static bool add_ecxt(struct dept_map *m, struct dept_class *c,
  1558			     unsigned long ip, const char *c_fn,
  1559			     const char *e_fn, int sub_l)
  1560	{
  1561		struct dept_task *dt = dept_task();
  1562		struct dept_ecxt_held *eh;
  1563		struct dept_ecxt *e;
  1564		unsigned long irqf;
  1565		int irq;
  1566	
  1567		if (DEPT_WARN_ON(!valid_class(c)))
  1568			return false;
  1569	
  1570		if (DEPT_WARN_ON_ONCE(dt->ecxt_held_pos >= DEPT_MAX_ECXT_HELD))
  1571			return false;
  1572	
  1573		if (m->nocheck) {
  1574			eh = dt->ecxt_held + (dt->ecxt_held_pos++);
  1575			eh->ecxt = NULL;
  1576			eh->map = m;
  1577			eh->class = get_class(c);
  1578			eh->wgen = atomic_read(&wgen);
  1579			eh->sub_l = sub_l;
  1580	
  1581			return true;
  1582		}
  1583	
  1584		e = new_ecxt();
  1585		if (unlikely(!e))
  1586			return false;
  1587	
  1588		e->class = get_class(c);
  1589		e->ecxt_ip = ip;
  1590		e->ecxt_stack = ip && rich_stack ? get_current_stack() : NULL;
  1591		e->event_fn = e_fn;
  1592		e->ecxt_fn = c_fn;
  1593	
  1594		eh = dt->ecxt_held + (dt->ecxt_held_pos++);
  1595		eh->ecxt = get_ecxt(e);
  1596		eh->map = m;
  1597		eh->class = get_class(c);
  1598		eh->wgen = atomic_read(&wgen);
  1599		eh->sub_l = sub_l;
  1600	
  1601		irqf = cur_enirqf();
  1602		for_each_set_bit(irq, &irqf, DEPT_IRQS_NR)
  1603			add_iecxt(c, irq, e, false);
  1604	
  1605		del_ecxt(e);
  1606		return true;
  1607	}
  1608	
  1609	static int find_ecxt_pos(struct dept_map *m, struct dept_class *c,
  1610				 bool newfirst)
  1611	{
  1612		struct dept_task *dt = dept_task();
  1613		int i;
  1614	
  1615		if (newfirst) {
  1616			for (i = dt->ecxt_held_pos - 1; i >= 0; i--) {
  1617				struct dept_ecxt_held *eh;
  1618	
  1619				eh = dt->ecxt_held + i;
  1620				if (eh->map == m && eh->class == c)
  1621					return i;
  1622			}
  1623		} else {
  1624			for (i = 0; i < dt->ecxt_held_pos; i++) {
  1625				struct dept_ecxt_held *eh;
  1626	
  1627				eh = dt->ecxt_held + i;
  1628				if (eh->map == m && eh->class == c)
  1629					return i;
  1630			}
  1631		}
  1632		return -1;
  1633	}
  1634	
  1635	static bool pop_ecxt(struct dept_map *m, struct dept_class *c)
  1636	{
  1637		struct dept_task *dt = dept_task();
  1638		int pos;
  1639		int i;
  1640	
  1641		pos = find_ecxt_pos(m, c, true);
  1642		if (pos == -1)
  1643			return false;
  1644	
  1645		if (dt->ecxt_held[pos].class)
  1646			put_class(dt->ecxt_held[pos].class);
  1647	
  1648		if (dt->ecxt_held[pos].ecxt)
  1649			put_ecxt(dt->ecxt_held[pos].ecxt);
  1650	
  1651		dt->ecxt_held_pos--;
  1652	
  1653		for (i = pos; i < dt->ecxt_held_pos; i++)
  1654			dt->ecxt_held[i] = dt->ecxt_held[i + 1];
  1655		return true;
  1656	}
  1657	
  1658	static bool good_hist(struct dept_wait_hist *wh, unsigned int wg)
  1659	{
  1660		return wh->wait != NULL && before(wg, wh->wgen);
  1661	}
  1662	
  1663	/*
  1664	 * Binary-search the ring buffer for the earliest valid wait.
  1665	 */
  1666	static int find_hist_pos(unsigned int wg)
  1667	{
  1668		int oldest;
  1669		int l;
  1670		int r;
  1671		int pos;
  1672	
  1673		oldest = hist_pos_next();
  1674		if (unlikely(good_hist(hist(oldest), wg))) {
  1675			DEPT_INFO_ONCE("Need to expand the ring buffer.\n");
  1676			return oldest;
  1677		}
  1678	
  1679		l = oldest + 1;
  1680		r = oldest + DEPT_MAX_WAIT_HIST - 1;
  1681		for (pos = (l + r) / 2; l <= r; pos = (l + r) / 2) {
  1682			struct dept_wait_hist *p = hist(pos - 1);
  1683			struct dept_wait_hist *wh = hist(pos);
  1684	
  1685			if (!good_hist(p, wg) && good_hist(wh, wg))
  1686				return pos % DEPT_MAX_WAIT_HIST;
  1687			if (good_hist(wh, wg))
  1688				r = pos - 1;
  1689			else
  1690				l = pos + 1;
  1691		}
  1692		return -1;
  1693	}
  1694	
  1695	static void do_event(struct dept_map *m, struct dept_class *c,
  1696			     unsigned int wg, unsigned long ip)
  1697	{
  1698		struct dept_task *dt = dept_task();
  1699		struct dept_wait_hist *wh;
  1700		struct dept_ecxt_held *eh;
  1701		unsigned int ctxt_id;
  1702		int end;
  1703		int pos;
  1704		int i;
  1705	
  1706		if (DEPT_WARN_ON(!valid_class(c)))
  1707			return;
  1708	
  1709		if (m->nocheck)
  1710			return;
  1711	
  1712		/*
  1713		 * The event was triggered before wait.
  1714		 */
  1715		if (!wg)
  1716			return;
  1717	
  1718		pos = find_ecxt_pos(m, c, false);
  1719		if (pos == -1)
  1720			return;
  1721	
  1722		eh = dt->ecxt_held + pos;
  1723	
  1724		if (DEPT_WARN_ON(!eh->ecxt))
  1725			return;
  1726	
  1727		eh->ecxt->event_ip = ip;
  1728		eh->ecxt->event_stack = get_current_stack();
  1729	
  1730		/*
  1731		 * The ecxt already has done what it needs.
  1732		 */
  1733		if (!before(wg, eh->wgen))
  1734			return;
  1735	
  1736		pos = find_hist_pos(wg);
  1737		if (pos == -1)
  1738			return;
  1739	
  1740		ctxt_id = cur_ctxt_id();
  1741		end = hist_pos_next();
  1742		end = end > pos ? end : end + DEPT_MAX_WAIT_HIST;
  1743		for (wh = hist(pos); pos < end; wh = hist(++pos)) {
  1744			if (after(wh->wgen, eh->wgen))
  1745				break;
  1746	
  1747			if (dt->in_sched && wh->wait->sched_sleep)
  1748				continue;
  1749	
  1750			if (wh->ctxt_id == ctxt_id)
  1751				add_dep(eh->ecxt, wh->wait);
  1752		}
  1753	
  1754		for (i = 0; i < DEPT_IRQS_NR; i++) {
  1755			struct dept_ecxt *e;
  1756	
  1757			if (before(dt->wgen_enirq[i], wg))
  1758				continue;
  1759	
  1760			e = eh->ecxt;
  1761			add_iecxt(e->class, i, e, false);
  1762		}
  1763	}
  1764	
  1765	static void del_dep_rcu(struct rcu_head *rh)
  1766	{
  1767		struct dept_dep *d = container_of(rh, struct dept_dep, rh);
  1768	
  1769		preempt_disable();
  1770		del_dep(d);
  1771		preempt_enable();
  1772	}
  1773	
  1774	/*
  1775	 * NOTE: Must be called with dept_lock held.
  1776	 */
  1777	static void disconnect_class(struct dept_class *c)
  1778	{
  1779		struct dept_dep *d, *n;
  1780		int i;
  1781	
  1782		list_for_each_entry_safe(d, n, &c->dep_head, dep_node) {
  1783			list_del_rcu(&d->dep_node);
  1784			list_del_rcu(&d->dep_rev_node);
  1785			hash_del_dep(d);
  1786			call_rcu(&d->rh, del_dep_rcu);
  1787		}
  1788	
  1789		list_for_each_entry_safe(d, n, &c->dep_rev_head, dep_rev_node) {
  1790			list_del_rcu(&d->dep_node);
  1791			list_del_rcu(&d->dep_rev_node);
  1792			hash_del_dep(d);
  1793			call_rcu(&d->rh, del_dep_rcu);
  1794		}
  1795	
  1796		for (i = 0; i < DEPT_IRQS_NR; i++) {
  1797			stale_iecxt(iecxt(c, i));
  1798			stale_iwait(iwait(c, i));
  1799		}
  1800	}
  1801	
  1802	/*
  1803	 * Context control
  1804	 * =====================================================================
  1805	 * Whether a wait is in {hard,soft}-IRQ context or whether
  1806	 * {hard,soft}-IRQ has been enabled on the way to an event is very
  1807	 * important to check dependency. All those things should be tracked.
  1808	 */
  1809	
  1810	static unsigned long cur_enirqf(void)
  1811	{
  1812		struct dept_task *dt = dept_task();
  1813		int he = dt->hardirqs_enabled;
  1814		int se = dt->softirqs_enabled;
  1815	
  1816		if (he)
  1817			return DEPT_HIRQF | (se ? DEPT_SIRQF : 0UL);
  1818		return 0UL;
  1819	}
  1820	
  1821	static int cur_irq(void)
  1822	{
  1823		if (lockdep_softirq_context(current))
  1824			return DEPT_SIRQ;
  1825		if (lockdep_hardirq_context())
  1826			return DEPT_HIRQ;
  1827		return DEPT_IRQS_NR;
  1828	}
  1829	
  1830	static unsigned int cur_ctxt_id(void)
  1831	{
  1832		struct dept_task *dt = dept_task();
  1833		int irq = cur_irq();
  1834	
  1835		/*
  1836		 * Normal process context
  1837		 */
  1838		if (irq == DEPT_IRQS_NR)
  1839			return 0U;
  1840	
  1841		return dt->irq_id[irq] | (1UL << irq);
  1842	}
  1843	
  1844	static void enirq_transition(int irq)
  1845	{
  1846		struct dept_task *dt = dept_task();
  1847		int i;
  1848	
  1849		/*
  1850		 * IRQ can cut in on the way to the event. Used for cross-event
  1851		 * detection.
  1852		 *
  1853		 *    wait context	event context(ecxt)
  1854		 *    ------------	-------------------
  1855		 *    wait event
  1856		 *       UPDATE wgen
  1857		 *			observe IRQ enabled
  1858		 *			   UPDATE wgen
  1859		 *			   keep the wgen locally
  1860		 *
  1861		 *			on the event
  1862		 *			   check the wgen kept
  1863		 */
  1864	
  1865		/*
  1866		 * Avoid zero wgen.
  1867		 */
  1868		dt->wgen_enirq[irq] = atomic_inc_return(&wgen) ?:
  1869				      atomic_inc_return(&wgen);
  1870	
  1871		for (i = dt->ecxt_held_pos - 1; i >= 0; i--) {
  1872			struct dept_ecxt_held *eh;
  1873			struct dept_ecxt *e;
  1874	
  1875			eh = dt->ecxt_held + i;
  1876			e = eh->ecxt;
  1877			if (e)
  1878				add_iecxt(e->class, irq, e, true);
  1879		}
  1880	}
  1881	
  1882	static void dept_enirq(unsigned long ip)
  1883	{
  1884		struct dept_task *dt = dept_task();
  1885		unsigned long irqf = cur_enirqf();
  1886		int irq;
  1887		unsigned long flags;
  1888	
  1889		if (unlikely(!dept_working()))
  1890			return;
  1891	
  1892		/*
  1893		 * IRQ ON/OFF transition might happen while Dept is working.
  1894		 * We cannot handle recursive entrance. Just ingnore it.
  1895		 * Only transitions outside of Dept will be considered.
  1896		 */
  1897		if (dt->recursive)
  1898			return;
  1899	
  1900		flags = dept_enter();
  1901	
  1902		for_each_set_bit(irq, &irqf, DEPT_IRQS_NR) {
  1903			dt->enirq_ip[irq] = ip;
  1904			enirq_transition(irq);
  1905		}
  1906	
  1907		dept_exit(flags);
  1908	}
  1909	
  1910	void dept_softirqs_on_ip(unsigned long ip)
  1911	{
  1912		/*
  1913		 * Assumes that it's called with IRQ disabled so that accessing
  1914		 * current's fields is not racy.
  1915		 */
  1916		dept_task()->softirqs_enabled = true;
  1917		dept_enirq(ip);
  1918	}
  1919	
  1920	void dept_hardirqs_on(void)
  1921	{
  1922		/*
  1923		 * Assumes that it's called with IRQ disabled so that accessing
  1924		 * current's fields is not racy.
  1925		 */
  1926		dept_task()->hardirqs_enabled = true;
  1927		dept_enirq(_RET_IP_);
  1928	}
  1929	
  1930	void dept_softirqs_off(void)
  1931	{
  1932		/*
  1933		 * Assumes that it's called with IRQ disabled so that accessing
  1934		 * current's fields is not racy.
  1935		 */
  1936		dept_task()->softirqs_enabled = false;
  1937	}
  1938	
  1939	void dept_hardirqs_off(void)
  1940	{
  1941		/*
  1942		 * Assumes that it's called with IRQ disabled so that accessing
  1943		 * current's fields is not racy.
  1944		 */
  1945		dept_task()->hardirqs_enabled = false;
  1946	}
  1947	
  1948	/*
  1949	 * Ensure it's the outmost softirq context.
  1950	 */
  1951	void dept_softirq_enter(void)
  1952	{
  1953		struct dept_task *dt = dept_task();
  1954	
  1955		dt->irq_id[DEPT_SIRQ] += 1UL << DEPT_IRQS_NR;
  1956	}
  1957	
  1958	/*
  1959	 * Ensure it's the outmost hardirq context.
  1960	 */
  1961	void dept_hardirq_enter(void)
  1962	{
  1963		struct dept_task *dt = dept_task();
  1964	
  1965		dt->irq_id[DEPT_HIRQ] += 1UL << DEPT_IRQS_NR;
  1966	}
  1967	
  1968	void dept_sched_enter(void)
  1969	{
  1970		dept_task()->in_sched = true;
  1971	}
  1972	
  1973	void dept_sched_exit(void)
  1974	{
  1975		dept_task()->in_sched = false;
  1976	}
  1977	
  1978	/*
  1979	 * Exposed APIs
  1980	 * =====================================================================
  1981	 */
  1982	
  1983	static void clean_classes_cache(struct dept_key *k)
  1984	{
  1985		int i;
  1986	
  1987		for (i = 0; i < DEPT_MAX_SUBCLASSES_CACHE; i++) {
  1988			if (!READ_ONCE(k->classes[i]))
  1989				continue;
  1990	
  1991			WRITE_ONCE(k->classes[i], NULL);
  1992		}
  1993	}
  1994	
  1995	void dept_map_init(struct dept_map *m, struct dept_key *k, int sub_u,
  1996			   const char *n)
  1997	{
  1998		unsigned long flags;
  1999	
  2000		if (unlikely(!dept_working())) {
  2001			m->nocheck = true;
  2002			return;
  2003		}
  2004	
  2005		if (DEPT_WARN_ON(sub_u < 0)) {
  2006			m->nocheck = true;
  2007			return;
  2008		}
  2009	
  2010		if (DEPT_WARN_ON(sub_u >= DEPT_MAX_SUBCLASSES_USR)) {
  2011			m->nocheck = true;
  2012			return;
  2013		}
  2014	
  2015		/*
  2016		 * Allow recursive entrance.
  2017		 */
  2018		flags = dept_enter_recursive();
  2019	
  2020		clean_classes_cache(&m->map_key);
  2021	
  2022		m->keys = k;
  2023		m->sub_u = sub_u;
  2024		m->name = n;
  2025		m->wgen = 0U;
  2026		m->nocheck = !valid_key(k);
  2027	
  2028		dept_exit_recursive(flags);
  2029	}
  2030	EXPORT_SYMBOL_GPL(dept_map_init);
  2031	
  2032	void dept_map_reinit(struct dept_map *m, struct dept_key *k, int sub_u,
  2033			     const char *n)
  2034	{
  2035		unsigned long flags;
  2036	
  2037		if (unlikely(!dept_working())) {
  2038			m->nocheck = true;
  2039			return;
  2040		}
  2041	
  2042		/*
  2043		 * Allow recursive entrance.
  2044		 */
  2045		flags = dept_enter_recursive();
  2046	
  2047		if (k) {
  2048			clean_classes_cache(&m->map_key);
  2049			m->keys = k;
  2050			m->nocheck = !valid_key(k);
  2051		}
  2052	
  2053		if (sub_u >= 0 && sub_u < DEPT_MAX_SUBCLASSES_USR)
  2054			m->sub_u = sub_u;
  2055	
  2056		if (n)
  2057			m->name = n;
  2058	
  2059		m->wgen = 0U;
  2060	
  2061		dept_exit_recursive(flags);
  2062	}
  2063	EXPORT_SYMBOL_GPL(dept_map_reinit);
  2064	
  2065	void dept_map_copy(struct dept_map *to, struct dept_map *from)
  2066	{
  2067		if (unlikely(!dept_working())) {
  2068			to->nocheck = true;
  2069			return;
  2070		}
  2071	
  2072		*to = *from;
  2073	
  2074		/*
  2075		 * XXX: 'to' might be in a stack or something. Using the address
  2076		 * in a stack segment as a key is meaningless. Just ignore the
  2077		 * case for now.
  2078		 */
  2079		if (!to->keys) {
  2080			to->nocheck = true;
  2081			return;
  2082		}
  2083	
  2084		/*
  2085		 * Since the class cache can be modified concurrently we could
  2086		 * observe half pointers (64bit arch using 32bit copy insns).
  2087		 * Therefore clear the caches and take the performance hit.
  2088		 *
  2089		 * XXX: Doesn't work well with lockdep_set_class_and_subclass()
  2090		 *      since that relies on cache abuse.
  2091		 */
  2092		clean_classes_cache(&to->map_key);
  2093	}
  2094	
  2095	static LIST_HEAD(classes);
  2096	
  2097	static bool within(const void *addr, void *start, unsigned long size)
  2098	{
  2099		return addr >= start && addr < start + size;
  2100	}
  2101	
  2102	void dept_free_range(void *start, unsigned int sz)
  2103	{
  2104		struct dept_task *dt = dept_task();
  2105		struct dept_class *c, *n;
  2106		unsigned long flags;
  2107	
  2108		if (unlikely(!dept_working()))
  2109			return;
  2110	
  2111		if (dt->recursive) {
  2112			DEPT_STOP("Failed to successfully free Dept objects.\n");
  2113			return;
  2114		}
  2115	
  2116		flags = dept_enter();
  2117	
  2118		/*
  2119		 * dept_free_range() should not fail.
  2120		 *
  2121		 * FIXME: Should be fixed if dept_free_range() causes deadlock
  2122		 * with dept_lock().
  2123		 */
  2124		while (unlikely(!dept_lock()))
  2125			cpu_relax();
  2126	
  2127		list_for_each_entry_safe(c, n, &classes, all_node) {
  2128			if (!within((void *)c->key, start, sz) &&
  2129			    !within(c->name, start, sz))
  2130				continue;
  2131	
  2132			hash_del_class(c);
  2133			disconnect_class(c);
  2134			list_del(&c->all_node);
  2135			invalidate_class(c);
  2136	
  2137			/*
  2138			 * Actual deletion will happen on the rcu callback
  2139			 * that has been added in disconnect_class().
  2140			 */
  2141			del_class(c);
  2142		}
  2143		dept_unlock();
  2144		dept_exit(flags);
  2145	
  2146		/*
  2147		 * Wait until even lockless hash_lookup_class() for the class
  2148		 * returns NULL.
  2149		 */
  2150		might_sleep();
  2151		synchronize_rcu();
  2152	}
  2153	
  2154	static int sub_id(struct dept_map *m, int e)
  2155	{
  2156		return (m ? m->sub_u : 0) + e * DEPT_MAX_SUBCLASSES_USR;
  2157	}
  2158	
  2159	static struct dept_class *check_new_class(struct dept_key *local,
  2160						  struct dept_key *k, int sub_id,
  2161						  const char *n, bool sched_map)
  2162	{
  2163		struct dept_class *c = NULL;
  2164	
  2165		if (DEPT_WARN_ON(sub_id >= DEPT_MAX_SUBCLASSES))
  2166			return NULL;
  2167	
  2168		if (DEPT_WARN_ON(!k))
  2169			return NULL;
  2170	
  2171		/*
  2172		 * XXX: Assume that users prevent the map from using if any of
  2173		 * the cached keys has been invalidated. If not, the cache,
  2174		 * local->classes should not be used because it would be racy
  2175		 * with class deletion.
  2176		 */
  2177		if (local && sub_id < DEPT_MAX_SUBCLASSES_CACHE)
  2178			c = READ_ONCE(local->classes[sub_id]);
  2179	
  2180		if (c)
  2181			return c;
  2182	
  2183		c = lookup_class((unsigned long)k->base + sub_id);
  2184		if (c)
  2185			goto caching;
  2186	
  2187		if (unlikely(!dept_lock()))
  2188			return NULL;
  2189	
  2190		c = lookup_class((unsigned long)k->base + sub_id);
  2191		if (unlikely(c))
  2192			goto unlock;
  2193	
  2194		c = new_class();
  2195		if (unlikely(!c))
  2196			goto unlock;
  2197	
  2198		c->name = n;
  2199		c->sched_map = sched_map;
  2200		c->sub_id = sub_id;
  2201		c->key = (unsigned long)(k->base + sub_id);
  2202		hash_add_class(c);
  2203		list_add(&c->all_node, &classes);
  2204	unlock:
  2205		dept_unlock();
  2206	caching:
  2207		if (local && sub_id < DEPT_MAX_SUBCLASSES_CACHE)
  2208			WRITE_ONCE(local->classes[sub_id], c);
  2209	
  2210		return c;
  2211	}
  2212	
  2213	/*
  2214	 * Called between dept_enter() and dept_exit().
  2215	 */
  2216	static void __dept_wait(struct dept_map *m, unsigned long w_f,
  2217				unsigned long ip, const char *w_fn, int sub_l,
  2218				bool sched_sleep, bool sched_map)
  2219	{
  2220		int e;
  2221	
  2222		/*
  2223		 * Be as conservative as possible. In case of mulitple waits for
  2224		 * a single dept_map, we are going to keep only the last wait's
  2225		 * wgen for simplicity - keeping all wgens seems overengineering.
  2226		 *
  2227		 * Of course, it might cause missing some dependencies that
  2228		 * would rarely, probabily never, happen but it helps avoid
  2229		 * false positive report.
  2230		 */
  2231		for_each_set_bit(e, &w_f, DEPT_MAX_SUBCLASSES_EVT) {
  2232			struct dept_class *c;
  2233			struct dept_key *k;
  2234	
  2235			k = m->keys ?: &m->map_key;
  2236			c = check_new_class(&m->map_key, k,
  2237					    sub_id(m, e), m->name, sched_map);
  2238			if (!c)
  2239				continue;
  2240	
  2241			add_wait(c, ip, w_fn, sub_l, sched_sleep);
  2242		}
  2243	}
  2244	
  2245	/*
  2246	 * Called between dept_enter() and dept_exit().
  2247	 */
  2248	static void __dept_event(struct dept_map *m, unsigned long e_f,
  2249				 unsigned long ip, const char *e_fn,
  2250				 bool sched_map)
  2251	{
  2252		struct dept_class *c;
  2253		struct dept_key *k;
  2254		int e;
  2255	
  2256		e = find_first_bit(&e_f, DEPT_MAX_SUBCLASSES_EVT);
  2257	
  2258		if (DEPT_WARN_ON(e >= DEPT_MAX_SUBCLASSES_EVT))
  2259			return;
  2260	
  2261		/*
  2262		 * An event is an event. If the caller passed more than single
  2263		 * event, then warn it and handle the event corresponding to
  2264		 * the first bit anyway.
  2265		 */
  2266		DEPT_WARN_ON(1UL << e != e_f);
  2267	
  2268		k = m->keys ?: &m->map_key;
  2269		c = check_new_class(&m->map_key, k, sub_id(m, e), m->name, sched_map);
  2270	
  2271		if (c && add_ecxt(m, c, 0UL, NULL, e_fn, 0)) {
  2272			do_event(m, c, READ_ONCE(m->wgen), ip);
  2273			pop_ecxt(m, c);
  2274		}
  2275	}
  2276	
  2277	void dept_wait(struct dept_map *m, unsigned long w_f,
  2278		       unsigned long ip, const char *w_fn, int sub_l)
  2279	{
  2280		struct dept_task *dt = dept_task();
  2281		unsigned long flags;
  2282	
  2283		if (unlikely(!dept_working()))
  2284			return;
  2285	
  2286		if (dt->recursive)
  2287			return;
  2288	
  2289		if (m->nocheck)
  2290			return;
  2291	
  2292		flags = dept_enter();
  2293	
  2294		__dept_wait(m, w_f, ip, w_fn, sub_l, false, false);
  2295	
  2296		dept_exit(flags);
  2297	}
  2298	EXPORT_SYMBOL_GPL(dept_wait);
  2299	
  2300	void dept_stage_wait(struct dept_map *m, struct dept_key *k,
  2301			     unsigned long ip, const char *w_fn)
  2302	{
  2303		struct dept_task *dt = dept_task();
  2304		unsigned long flags;
  2305	
  2306		if (unlikely(!dept_working()))
  2307			return;
  2308	
  2309		if (m && m->nocheck)
  2310			return;
  2311	
  2312		/*
  2313		 * Either m or k should be passed. Which means Dept relies on
  2314		 * either its own map or the caller's position in the code when
  2315		 * determining its class.
  2316		 */
  2317		if (DEPT_WARN_ON(!m && !k))
  2318			return;
  2319	
  2320		/*
  2321		 * Allow recursive entrance.
  2322		 */
  2323		flags = dept_enter_recursive();
  2324	
  2325		/*
  2326		 * Ensure the outmost dept_stage_wait() works.
  2327		 */
  2328		if (dt->stage_m.keys)
  2329			goto exit;
  2330	
  2331		if (m) {
  2332			dt->stage_m = *m;
  2333	
  2334			/*
  2335			 * Ensure dt->stage_m.keys != NULL and it works with the
  2336			 * map's map_key, not stage_m's one when ->keys == NULL.
  2337			 */
  2338			if (!m->keys)
  2339				dt->stage_m.keys = &m->map_key;
  2340		} else {
  2341			dt->stage_m.name = w_fn;
  2342			dt->stage_sched_map = true;
  2343		}
  2344	
  2345		/*
  2346		 * dept_map_reinit() includes WRITE_ONCE(->wgen, 0U) that
  2347		 * effectively disables the map just in case real sleep won't
  2348		 * happen. dept_request_event_wait_commit() will enable it.
  2349		 */
  2350		dept_map_reinit(&dt->stage_m, k, -1, NULL);
  2351	
  2352		dt->stage_w_fn = w_fn;
  2353		dt->stage_ip = ip;
  2354	exit:
  2355		dept_exit_recursive(flags);
  2356	}
  2357	EXPORT_SYMBOL_GPL(dept_stage_wait);
  2358	
  2359	static void __dept_clean_stage(struct dept_task *dt)
  2360	{
  2361		memset(&dt->stage_m, 0x0, sizeof(struct dept_map));
  2362		dt->stage_sched_map = false;
  2363		dt->stage_w_fn = NULL;
  2364		dt->stage_ip = 0UL;
  2365	}
  2366	
  2367	void dept_clean_stage(void)
  2368	{
  2369		struct dept_task *dt = dept_task();
  2370		unsigned long flags;
  2371	
  2372		if (unlikely(!dept_working()))
  2373			return;
  2374	
  2375		/*
  2376		 * Allow recursive entrance.
  2377		 */
  2378		flags = dept_enter_recursive();
  2379		__dept_clean_stage(dt);
  2380		dept_exit_recursive(flags);
  2381	}
  2382	EXPORT_SYMBOL_GPL(dept_clean_stage);
  2383	
  2384	/*
  2385	 * Always called from __schedule().
  2386	 */
  2387	void dept_request_event_wait_commit(void)
  2388	{
  2389		struct dept_task *dt = dept_task();
  2390		unsigned long flags;
  2391		unsigned int wg;
  2392		unsigned long ip;
  2393		const char *w_fn;
  2394		bool sched_map;
  2395	
  2396		if (unlikely(!dept_working()))
  2397			return;
  2398	
  2399		/*
  2400		 * It's impossible that __schedule() is called while Dept is
  2401		 * working that already disabled IRQ at the entrance.
  2402		 */
  2403		if (DEPT_WARN_ON(dt->recursive))
  2404			return;
  2405	
  2406		flags = dept_enter();
  2407	
  2408		/*
  2409		 * Checks if current has staged a wait.
  2410		 */
  2411		if (!dt->stage_m.keys)
  2412			goto exit;
  2413	
  2414		w_fn = dt->stage_w_fn;
  2415		ip = dt->stage_ip;
  2416		sched_map = dt->stage_sched_map;
  2417	
  2418		/*
  2419		 * Avoid zero wgen.
  2420		 */
  2421		wg = atomic_inc_return(&wgen) ?: atomic_inc_return(&wgen);
  2422		WRITE_ONCE(dt->stage_m.wgen, wg);
  2423	
  2424		__dept_wait(&dt->stage_m, 1UL, ip, w_fn, 0, true, sched_map);
  2425	exit:
  2426		dept_exit(flags);
  2427	}
  2428	
  2429	/*
  2430	 * Always called from try_to_wake_up().
  2431	 */
  2432	void dept_stage_event(struct task_struct *requestor, unsigned long ip)
  2433	{
  2434		struct dept_task *dt = dept_task();
  2435		struct dept_task *dt_req = &requestor->dept_task;
  2436		unsigned long flags;
  2437		struct dept_map m;
  2438		bool sched_map;
  2439	
  2440		if (unlikely(!dept_working()))
  2441			return;
  2442	
  2443		if (dt->recursive)
  2444			return;
  2445	
  2446		flags = dept_enter();
  2447	
  2448		/*
  2449		 * Serializing is unnecessary as long as it always comes from
  2450		 * try_to_wake_up().
  2451		 */
  2452		m = dt_req->stage_m;
  2453		sched_map = dt_req->stage_sched_map;
  2454		__dept_clean_stage(dt_req);
  2455	
  2456		/*
  2457		 * ->stage_m.keys should not be NULL if it's in use. Should
  2458		 * make sure that it's not NULL when staging a valid map.
  2459		 */
  2460		if (!m.keys)
  2461			goto exit;
  2462	
  2463		__dept_event(&m, 1UL, ip, "try_to_wake_up", sched_map);
  2464	exit:
  2465		dept_exit(flags);
  2466	}
  2467	
  2468	/*
  2469	 * Modifies the latest ecxt corresponding to m and e_f.
  2470	 */
  2471	void dept_map_ecxt_modify(struct dept_map *m, unsigned long e_f,
  2472				  struct dept_key *new_k, unsigned long new_e_f,
  2473				  unsigned long new_ip, const char *new_c_fn,
  2474				  const char *new_e_fn, int new_sub_l)
  2475	{
  2476		struct dept_task *dt = dept_task();
  2477		struct dept_ecxt_held *eh;
  2478		struct dept_class *c;
  2479		struct dept_key *k;
  2480		unsigned long flags;
  2481		int pos = -1;
  2482		int new_e;
  2483		int e;
  2484	
  2485		if (unlikely(!dept_working()))
  2486			return;
  2487	
  2488		/*
  2489		 * XXX: Couldn't handle re-enterance cases. Ingore it for now.
  2490		 */
  2491		if (dt->recursive)
  2492			return;
  2493	
  2494		/*
  2495		 * Should go ahead no matter whether ->nocheck == true or not
  2496		 * because ->nocheck value can be changed within the ecxt area
  2497		 * delimitated by dept_ecxt_enter() and dept_ecxt_exit().
  2498		 */
  2499	
  2500		flags = dept_enter();
  2501	
  2502		for_each_set_bit(e, &e_f, DEPT_MAX_SUBCLASSES_EVT) {
  2503			k = m->keys ?: &m->map_key;
  2504			c = check_new_class(&m->map_key, k,
  2505					    sub_id(m, e), m->name, false);
  2506			if (!c)
  2507				continue;
  2508	
  2509			/*
  2510			 * When it found an ecxt for any event in e_f, done.
  2511			 */
  2512			pos = find_ecxt_pos(m, c, true);
  2513			if (pos != -1)
  2514				break;
  2515		}
  2516	
  2517		if (unlikely(pos == -1))
  2518			goto exit;
  2519	
  2520		eh = dt->ecxt_held + pos;
  2521		new_sub_l = new_sub_l >= 0 ? new_sub_l : eh->sub_l;
  2522	
  2523		new_e = find_first_bit(&new_e_f, DEPT_MAX_SUBCLASSES_EVT);
  2524	
  2525		if (new_e < DEPT_MAX_SUBCLASSES_EVT)
  2526			/*
  2527			 * Let it work with the first bit anyway.
  2528			 */
  2529			DEPT_WARN_ON(1UL << new_e != new_e_f);
  2530		else
  2531			new_e = e;
  2532	
  2533		pop_ecxt(m, c);
  2534	
  2535		/*
  2536		 * Apply the key to the map.
  2537		 */
  2538		if (new_k)
  2539			dept_map_reinit(m, new_k, -1, NULL);
  2540	
  2541		k = m->keys ?: &m->map_key;
  2542		c = check_new_class(&m->map_key, k, sub_id(m, new_e), m->name, false);
  2543	
  2544		if (c && add_ecxt(m, c, new_ip, new_c_fn, new_e_fn, new_sub_l))
  2545			goto exit;
  2546	
  2547		/*
  2548		 * Successfully pop_ecxt()ed but failed to add_ecxt().
  2549		 */
  2550		dt->missing_ecxt++;
  2551	exit:
  2552		dept_exit(flags);
  2553	}
  2554	EXPORT_SYMBOL_GPL(dept_map_ecxt_modify);
  2555	
  2556	void dept_ecxt_enter(struct dept_map *m, unsigned long e_f, unsigned long ip,
  2557			     const char *c_fn, const char *e_fn, int sub_l)
  2558	{
  2559		struct dept_task *dt = dept_task();
  2560		unsigned long flags;
  2561		struct dept_class *c;
  2562		struct dept_key *k;
  2563		int e;
  2564	
  2565		if (unlikely(!dept_working()))
  2566			return;
  2567	
  2568		if (dt->recursive) {
  2569			dt->missing_ecxt++;
  2570			return;
  2571		}
  2572	
  2573		/*
  2574		 * Should go ahead no matter whether ->nocheck == true or not
  2575		 * because ->nocheck value can be changed within the ecxt area
  2576		 * delimitated by dept_ecxt_enter() and dept_ecxt_exit().
  2577		 */
  2578	
  2579		flags = dept_enter();
  2580	
  2581		e = find_first_bit(&e_f, DEPT_MAX_SUBCLASSES_EVT);
  2582	
  2583		if (e >= DEPT_MAX_SUBCLASSES_EVT)
  2584			goto missing_ecxt;
  2585	
  2586		/*
  2587		 * An event is an event. If the caller passed more than single
  2588		 * event, then warn it and handle the event corresponding to
  2589		 * the first bit anyway.
  2590		 */
  2591		DEPT_WARN_ON(1UL << e != e_f);
  2592	
  2593		k = m->keys ?: &m->map_key;
  2594		c = check_new_class(&m->map_key, k, sub_id(m, e), m->name, false);
  2595	
  2596		if (c && add_ecxt(m, c, ip, c_fn, e_fn, sub_l))
  2597			goto exit;
  2598	missing_ecxt:
  2599		dt->missing_ecxt++;
  2600	exit:
  2601		dept_exit(flags);
  2602	}
  2603	EXPORT_SYMBOL_GPL(dept_ecxt_enter);
  2604	
  2605	bool dept_ecxt_holding(struct dept_map *m, unsigned long e_f)
  2606	{
  2607		struct dept_task *dt = dept_task();
  2608		unsigned long flags;
  2609		bool ret = false;
  2610		int e;
  2611	
  2612		if (unlikely(!dept_working()))
  2613			return false;
  2614	
  2615		if (dt->recursive)
  2616			return false;
  2617	
  2618		flags = dept_enter();
  2619	
  2620		for_each_set_bit(e, &e_f, DEPT_MAX_SUBCLASSES_EVT) {
  2621			struct dept_class *c;
  2622			struct dept_key *k;
  2623	
  2624			k = m->keys ?: &m->map_key;
  2625			c = check_new_class(&m->map_key, k,
  2626					    sub_id(m, e), m->name, false);
  2627			if (!c)
  2628				continue;
  2629	
  2630			if (find_ecxt_pos(m, c, true) != -1) {
  2631				ret = true;
  2632				break;
  2633			}
  2634		}
  2635	
  2636		dept_exit(flags);
  2637	
  2638		return ret;
  2639	}
  2640	EXPORT_SYMBOL_GPL(dept_ecxt_holding);
  2641	
  2642	void dept_request_event(struct dept_map *m)
  2643	{
  2644		unsigned long flags;
  2645		unsigned int wg;
  2646	
  2647		if (unlikely(!dept_working()))
  2648			return;
  2649	
  2650		if (m->nocheck)
  2651			return;
  2652	
  2653		/*
  2654		 * Allow recursive entrance.
  2655		 */
  2656		flags = dept_enter_recursive();
  2657	
  2658		/*
  2659		 * Avoid zero wgen.
  2660		 */
  2661		wg = atomic_inc_return(&wgen) ?: atomic_inc_return(&wgen);
  2662		WRITE_ONCE(m->wgen, wg);
  2663	
  2664		dept_exit_recursive(flags);
  2665	}
  2666	EXPORT_SYMBOL_GPL(dept_request_event);
  2667	
  2668	void dept_event(struct dept_map *m, unsigned long e_f,
  2669			unsigned long ip, const char *e_fn)
  2670	{
  2671		struct dept_task *dt = dept_task();
  2672		unsigned long flags;
  2673	
  2674		if (unlikely(!dept_working()))
  2675			return;
  2676	
  2677		if (m->nocheck)
  2678			return;
  2679	
  2680		if (dt->recursive) {
  2681			/*
  2682			 * Dept won't work with this even though an event
  2683			 * context has been asked. Don't make it confused at
  2684			 * handling the event. Disable it until the next.
  2685			 */
  2686			WRITE_ONCE(m->wgen, 0U);
  2687			return;
  2688		}
  2689	
  2690		flags = dept_enter();
  2691	
  2692		__dept_event(m, e_f, ip, e_fn, false);
  2693	
  2694		/*
  2695		 * Keep the map diabled until the next sleep.
  2696		 */
  2697		WRITE_ONCE(m->wgen, 0U);
  2698	
  2699		dept_exit(flags);
  2700	}
  2701	EXPORT_SYMBOL_GPL(dept_event);
  2702	
  2703	void dept_ecxt_exit(struct dept_map *m, unsigned long e_f,
  2704			    unsigned long ip)
  2705	{
  2706		struct dept_task *dt = dept_task();
  2707		unsigned long flags;
  2708		int e;
  2709	
  2710		if (unlikely(!dept_working()))
  2711			return;
  2712	
  2713		if (dt->recursive) {
  2714			dt->missing_ecxt--;
  2715			return;
  2716		}
  2717	
  2718		/*
  2719		 * Should go ahead no matter whether ->nocheck == true or not
  2720		 * because ->nocheck value can be changed within the ecxt area
  2721		 * delimitated by dept_ecxt_enter() and dept_ecxt_exit().
  2722		 */
  2723	
  2724		flags = dept_enter();
  2725	
  2726		for_each_set_bit(e, &e_f, DEPT_MAX_SUBCLASSES_EVT) {
  2727			struct dept_class *c;
  2728			struct dept_key *k;
  2729	
  2730			k = m->keys ?: &m->map_key;
  2731			c = check_new_class(&m->map_key, k,
  2732					    sub_id(m, e), m->name, false);
  2733			if (!c)
  2734				continue;
  2735	
  2736			/*
  2737			 * When it found an ecxt for any event in e_f, done.
  2738			 */
  2739			if (pop_ecxt(m, c))
  2740				goto exit;
  2741		}
  2742	
  2743		dt->missing_ecxt--;
  2744	exit:
  2745		dept_exit(flags);
  2746	}
  2747	EXPORT_SYMBOL_GPL(dept_ecxt_exit);
  2748	
  2749	void dept_task_exit(struct task_struct *t)
  2750	{
  2751		struct dept_task *dt = &t->dept_task;
  2752		int i;
  2753	
  2754		if (unlikely(!dept_working()))
  2755			return;
  2756	
  2757		raw_local_irq_disable();
  2758	
  2759		if (dt->stack)
  2760			put_stack(dt->stack);
  2761	
  2762		for (i = 0; i < dt->ecxt_held_pos; i++) {
  2763			if (dt->ecxt_held[i].class)
  2764				put_class(dt->ecxt_held[i].class);
  2765			if (dt->ecxt_held[i].ecxt)
  2766				put_ecxt(dt->ecxt_held[i].ecxt);
  2767		}
  2768	
  2769		for (i = 0; i < DEPT_MAX_WAIT_HIST; i++)
  2770			if (dt->wait_hist[i].wait)
  2771				put_wait(dt->wait_hist[i].wait);
  2772	
  2773		dt->task_exit = true;
  2774		dept_off();
  2775	
  2776		raw_local_irq_enable();
  2777	}
  2778	
  2779	void dept_task_init(struct task_struct *t)
  2780	{
  2781		memset(&t->dept_task, 0x0, sizeof(struct dept_task));
  2782	}
  2783	
  2784	void dept_key_init(struct dept_key *k)
  2785	{
  2786		struct dept_task *dt = dept_task();
  2787		unsigned long flags;
  2788		int sub_id;
  2789	
  2790		if (unlikely(!dept_working()))
  2791			return;
  2792	
  2793		if (dt->recursive) {
  2794			DEPT_STOP("Key initialization fails.\n");
  2795			return;
  2796		}
  2797	
  2798		flags = dept_enter();
  2799	
  2800		clean_classes_cache(k);
  2801	
  2802		/*
  2803		 * dept_key_init() should not fail.
  2804		 *
  2805		 * FIXME: Should be fixed if dept_key_init() causes deadlock
  2806		 * with dept_lock().
  2807		 */
  2808		while (unlikely(!dept_lock()))
  2809			cpu_relax();
  2810	
  2811		for (sub_id = 0; sub_id < DEPT_MAX_SUBCLASSES; sub_id++) {
  2812			struct dept_class *c;
  2813	
  2814			c = lookup_class((unsigned long)k->base + sub_id);
  2815			if (!c)
  2816				continue;
  2817	
  2818			DEPT_STOP("The class(%s/%d) has not been removed.\n",
  2819				  c->name, sub_id);
  2820			break;
  2821		}
  2822	
  2823		dept_unlock();
  2824		dept_exit(flags);
  2825	}
  2826	EXPORT_SYMBOL_GPL(dept_key_init);
  2827	
  2828	void dept_key_destroy(struct dept_key *k)
  2829	{
  2830		struct dept_task *dt = dept_task();
  2831		unsigned long flags;
  2832		int sub_id;
  2833	
  2834		if (unlikely(!dept_working()))
  2835			return;
  2836	
  2837		if (dt->recursive == 1 && dt->task_exit) {
  2838			/*
  2839			 * Need to allow to go ahead in this case where
  2840			 * ->recursive has been set to 1 by dept_off() in
  2841			 * dept_task_exit() and ->task_exit has been set to
  2842			 * true in dept_task_exit().
  2843			 */
  2844		} else if (dt->recursive) {
  2845			DEPT_STOP("Key destroying fails.\n");
  2846			return;
  2847		}
  2848	
  2849		flags = dept_enter();
  2850	
  2851		/*
  2852		 * dept_key_destroy() should not fail.
  2853		 *
  2854		 * FIXME: Should be fixed if dept_key_destroy() causes deadlock
  2855		 * with dept_lock().
  2856		 */
  2857		while (unlikely(!dept_lock()))
  2858			cpu_relax();
  2859	
  2860		for (sub_id = 0; sub_id < DEPT_MAX_SUBCLASSES; sub_id++) {
  2861			struct dept_class *c;
  2862	
  2863			c = lookup_class((unsigned long)k->base + sub_id);
  2864			if (!c)
  2865				continue;
  2866	
  2867			hash_del_class(c);
  2868			disconnect_class(c);
  2869			list_del(&c->all_node);
  2870			invalidate_class(c);
  2871	
  2872			/*
  2873			 * Actual deletion will happen on the rcu callback
  2874			 * that has been added in disconnect_class().
  2875			 */
  2876			del_class(c);
  2877		}
  2878	
  2879		dept_unlock();
  2880		dept_exit(flags);
  2881	
  2882		/*
  2883		 * Wait until even lockless hash_lookup_class() for the class
  2884		 * returns NULL.
  2885		 */
  2886		might_sleep();
  2887		synchronize_rcu();
  2888	}
  2889	EXPORT_SYMBOL_GPL(dept_key_destroy);
  2890	
  2891	static void move_llist(struct llist_head *to, struct llist_head *from)
  2892	{
  2893		struct llist_node *first = llist_del_all(from);
  2894		struct llist_node *last;
  2895	
  2896		if (!first)
  2897			return;
  2898	
  2899		for (last = first; last->next; last = last->next);
  2900		llist_add_batch(first, last, to);
  2901	}
  2902	
  2903	static void migrate_per_cpu_pool(void)
  2904	{
  2905		const int boot_cpu = 0;
  2906		int i;
  2907	
  2908		/*
  2909		 * The boot CPU has been using the temperal local pool so far.
  2910		 * From now on that per_cpu areas have been ready, use the
  2911		 * per_cpu local pool instead.
  2912		 */
  2913		DEPT_WARN_ON(smp_processor_id() != boot_cpu);
  2914		for (i = 0; i < OBJECT_NR; i++) {
  2915			struct llist_head *from;
  2916			struct llist_head *to;
  2917	
  2918			from = &pool[i].boot_pool;
  2919			to = per_cpu_ptr(pool[i].lpool, boot_cpu);
  2920			move_llist(to, from);
  2921		}
  2922	}
  2923	
  2924	#define B2KB(B) ((B) / 1024)
  2925	
  2926	/*
  2927	 * Should be called after setup_per_cpu_areas() and before no non-boot
  2928	 * CPUs have been on.
  2929	 */
  2930	void __init dept_init(void)
  2931	{
  2932		size_t mem_total = 0;
  2933	
  2934		local_irq_disable();
  2935		dept_per_cpu_ready = 1;
  2936		migrate_per_cpu_pool();
  2937		local_irq_enable();
  2938	
  2939	#define HASH(id, bits) BUILD_BUG_ON(1 << (bits) <= 0);
> 2940		#include "dept_hash.h"
  2941	#undef  HASH
  2942	#define OBJECT(id, nr) mem_total += sizeof(struct dept_##id) * nr;
  2943		#include "dept_object.h"
  2944	#undef  OBJECT
  2945	#define HASH(id, bits) mem_total += sizeof(struct hlist_head) * (1 << (bits));
> 2946		#include "dept_hash.h"
  2947	#undef  HASH
  2948	
  2949		pr_info("DEPendency Tracker: Copyright (c) 2020 LG Electronics, Inc., Byungchul Park\n");
  2950		pr_info("... DEPT_MAX_STACK_ENTRY: %d\n", DEPT_MAX_STACK_ENTRY);
  2951		pr_info("... DEPT_MAX_WAIT_HIST  : %d\n", DEPT_MAX_WAIT_HIST);
  2952		pr_info("... DEPT_MAX_ECXT_HELD  : %d\n", DEPT_MAX_ECXT_HELD);
  2953		pr_info("... DEPT_MAX_SUBCLASSES : %d\n", DEPT_MAX_SUBCLASSES);
  2954	#define OBJECT(id, nr)							\
  2955		pr_info("... memory used by %s: %zu KB\n",			\
  2956		       #id, B2KB(sizeof(struct dept_##id) * nr));
  2957		#include "dept_object.h"
  2958	#undef  OBJECT
  2959	#define HASH(id, bits)							\
  2960		pr_info("... hash list head used by %s: %zu KB\n",		\
  2961		       #id, B2KB(sizeof(struct hlist_head) * (1 << (bits))));
> 2962		#include "dept_hash.h"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
