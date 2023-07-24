Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090D7100CB
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Jul 2023 18:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690223210; x=1721759210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9puS5sqv8AQ7QkwyBjZ9mB+ULZOIf5CDn7b3FQ+hpGQ=;
  b=cD/0i5XHsN01amyXii9mxV+VitThRpyiHgHqIqQNcpMILnKQWW6aaKds
   fAEOkCI3GPjW/9WyS7uLu4JK2Yu/9n41k9VtCs4SdmKDFOp+ABpY55mCq
   sQe9CtQEHD2FQcL11M9zuZzuFQm4gjzBb2Wg5cK7weytKdCITAxoSxtb5
   QyxPLEVDzM5eIeXsNdNS8Kteo2nSrPKIFLdEVrAee9jbXwyCHcgS9dx4X
   bFSNbu2PqPXBGhtRYKAAe8sibAAaBotQ4vIA/WmMSTMVu3TCt1R3MkZcK
   iQybhJKN8SRozfYqZjXGgKTW8300xAEIG81CtgsBFdH9rxM24f8lJW0+2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="398428894"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="398428894"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 11:26:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="839555149"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="839555149"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 24 Jul 2023 11:26:27 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO0GI-0009wu-1c;
	Mon, 24 Jul 2023 18:26:26 +0000
Date: Tue, 25 Jul 2023 02:26:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1467/4083] kernel/bpf/memalloc.c:189
 add_obj_to_free_list() error: uninitialized symbol 'flags'.
Message-ID: <202307250228.JWdhM4m7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>

Hi Alexei,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4d2c646ac07cf4a35ef1c4a935a1a4fd6c6b1a36
commit: 18e027b1c7c6dd858b36305468251a5e4a6bcdf7 [1467/4083] bpf: Factor out inc/dec of active flag into helpers.
:::::: branch date: 14 hours ago
:::::: commit date: 12 days ago
config: x86_64-randconfig-m001-20230723 (https://download.01.org/0day-ci/archive/20230725/202307250228.JWdhM4m7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307250228.JWdhM4m7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307250228.JWdhM4m7-lkp@intel.com/

smatch warnings:
kernel/bpf/memalloc.c:189 add_obj_to_free_list() error: uninitialized symbol 'flags'.
kernel/bpf/memalloc.c:319 free_bulk() error: uninitialized symbol 'flags'.

vim +/flags +189 kernel/bpf/memalloc.c

05ae68656a8e9d Alexei Starovoitov 2023-07-05  181  
18e027b1c7c6dd Alexei Starovoitov 2023-07-05  182  static void add_obj_to_free_list(struct bpf_mem_cache *c, void *obj)
18e027b1c7c6dd Alexei Starovoitov 2023-07-05  183  {
18e027b1c7c6dd Alexei Starovoitov 2023-07-05  184  	unsigned long flags;
18e027b1c7c6dd Alexei Starovoitov 2023-07-05  185  
18e027b1c7c6dd Alexei Starovoitov 2023-07-05  186  	inc_active(c, &flags);
18e027b1c7c6dd Alexei Starovoitov 2023-07-05  187  	__llist_add(obj, &c->free_llist);
18e027b1c7c6dd Alexei Starovoitov 2023-07-05  188  	c->free_cnt++;
18e027b1c7c6dd Alexei Starovoitov 2023-07-05 @189  	dec_active(c, flags);
18e027b1c7c6dd Alexei Starovoitov 2023-07-05  190  }
18e027b1c7c6dd Alexei Starovoitov 2023-07-05  191  
7c8199e24fa09d Alexei Starovoitov 2022-09-02  192  /* Mostly runs from irq_work except __init phase. */
7c8199e24fa09d Alexei Starovoitov 2022-09-02  193  static void alloc_bulk(struct bpf_mem_cache *c, int cnt, int node)
7c8199e24fa09d Alexei Starovoitov 2022-09-02  194  {
7c8199e24fa09d Alexei Starovoitov 2022-09-02  195  	struct mem_cgroup *memcg = NULL, *old_memcg;
7c8199e24fa09d Alexei Starovoitov 2022-09-02  196  	void *obj;
7c8199e24fa09d Alexei Starovoitov 2022-09-02  197  	int i;
7c8199e24fa09d Alexei Starovoitov 2022-09-02  198  
7c8199e24fa09d Alexei Starovoitov 2022-09-02  199  	memcg = get_memcg(c);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  200  	old_memcg = set_active_memcg(memcg);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  201  	for (i = 0; i < cnt; i++) {
0893d6007db5cf Hou Tao            2022-12-09  202  		/*
12c8d0f4c8702f Alexei Starovoitov 2023-07-05  203  		 * free_by_rcu_ttrace is only manipulated by irq work refill_work().
0893d6007db5cf Hou Tao            2022-12-09  204  		 * IRQ works on the same CPU are called sequentially, so it is
0893d6007db5cf Hou Tao            2022-12-09  205  		 * safe to use __llist_del_first() here. If alloc_bulk() is
0893d6007db5cf Hou Tao            2022-12-09  206  		 * invoked by the initial prefill, there will be no running
0893d6007db5cf Hou Tao            2022-12-09  207  		 * refill_work(), so __llist_del_first() is fine as well.
0893d6007db5cf Hou Tao            2022-12-09  208  		 *
12c8d0f4c8702f Alexei Starovoitov 2023-07-05  209  		 * In most cases, objects on free_by_rcu_ttrace are from the same CPU.
0893d6007db5cf Hou Tao            2022-12-09  210  		 * If some objects come from other CPUs, it doesn't incur any
0893d6007db5cf Hou Tao            2022-12-09  211  		 * harm because NUMA_NO_NODE means the preference for current
0893d6007db5cf Hou Tao            2022-12-09  212  		 * numa node and it is not a guarantee.
0893d6007db5cf Hou Tao            2022-12-09  213  		 */
12c8d0f4c8702f Alexei Starovoitov 2023-07-05  214  		obj = __llist_del_first(&c->free_by_rcu_ttrace);
0893d6007db5cf Hou Tao            2022-12-09  215  		if (!obj) {
e65a5c6edbc6ca Martin KaFai Lau   2023-03-22  216  			/* Allocate, but don't deplete atomic reserves that typical
e65a5c6edbc6ca Martin KaFai Lau   2023-03-22  217  			 * GFP_ATOMIC would do. irq_work runs on this cpu and kmalloc
e65a5c6edbc6ca Martin KaFai Lau   2023-03-22  218  			 * will allocate from the current numa node which is what we
e65a5c6edbc6ca Martin KaFai Lau   2023-03-22  219  			 * want here.
e65a5c6edbc6ca Martin KaFai Lau   2023-03-22  220  			 */
e65a5c6edbc6ca Martin KaFai Lau   2023-03-22  221  			obj = __alloc(c, node, GFP_NOWAIT | __GFP_NOWARN | __GFP_ACCOUNT);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  222  			if (!obj)
7c8199e24fa09d Alexei Starovoitov 2022-09-02  223  				break;
0893d6007db5cf Hou Tao            2022-12-09  224  		}
05ae68656a8e9d Alexei Starovoitov 2023-07-05  225  		add_obj_to_free_list(c, obj);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  226  	}
7c8199e24fa09d Alexei Starovoitov 2022-09-02  227  	set_active_memcg(old_memcg);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  228  	mem_cgroup_put(memcg);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  229  }
7c8199e24fa09d Alexei Starovoitov 2022-09-02  230  
aa7881fcfe9d32 Hou Tao            2023-06-06  231  static void free_one(void *obj, bool percpu)
7c8199e24fa09d Alexei Starovoitov 2022-09-02  232  {
aa7881fcfe9d32 Hou Tao            2023-06-06  233  	if (percpu) {
4ab67149f3c6e9 Alexei Starovoitov 2022-09-02  234  		free_percpu(((void **)obj)[1]);
bfc03c15bebf5e Alexei Starovoitov 2022-09-02  235  		kfree(obj);
4ab67149f3c6e9 Alexei Starovoitov 2022-09-02  236  		return;
4ab67149f3c6e9 Alexei Starovoitov 2022-09-02  237  	}
4ab67149f3c6e9 Alexei Starovoitov 2022-09-02  238  
7c8199e24fa09d Alexei Starovoitov 2022-09-02  239  	kfree(obj);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  240  }
7c8199e24fa09d Alexei Starovoitov 2022-09-02  241  
9de3e81521b4d9 Alexei Starovoitov 2023-07-05  242  static int free_all(struct llist_node *llnode, bool percpu)
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  243  {
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  244  	struct llist_node *pos, *t;
9de3e81521b4d9 Alexei Starovoitov 2023-07-05  245  	int cnt = 0;
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  246  
9de3e81521b4d9 Alexei Starovoitov 2023-07-05  247  	llist_for_each_safe(pos, t, llnode) {
aa7881fcfe9d32 Hou Tao            2023-06-06  248  		free_one(pos, percpu);
9de3e81521b4d9 Alexei Starovoitov 2023-07-05  249  		cnt++;
9de3e81521b4d9 Alexei Starovoitov 2023-07-05  250  	}
9de3e81521b4d9 Alexei Starovoitov 2023-07-05  251  	return cnt;
aa7881fcfe9d32 Hou Tao            2023-06-06  252  }
aa7881fcfe9d32 Hou Tao            2023-06-06  253  
aa7881fcfe9d32 Hou Tao            2023-06-06  254  static void __free_rcu(struct rcu_head *head)
aa7881fcfe9d32 Hou Tao            2023-06-06  255  {
12c8d0f4c8702f Alexei Starovoitov 2023-07-05  256  	struct bpf_mem_cache *c = container_of(head, struct bpf_mem_cache, rcu_ttrace);
aa7881fcfe9d32 Hou Tao            2023-06-06  257  
12c8d0f4c8702f Alexei Starovoitov 2023-07-05  258  	free_all(llist_del_all(&c->waiting_for_gp_ttrace), !!c->percpu_size);
12c8d0f4c8702f Alexei Starovoitov 2023-07-05  259  	atomic_set(&c->call_rcu_ttrace_in_progress, 0);
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  260  }
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  261  
dccb4a9013a68d Alexei Starovoitov 2022-09-02  262  static void __free_rcu_tasks_trace(struct rcu_head *head)
dccb4a9013a68d Alexei Starovoitov 2022-09-02  263  {
59be91e5e70a1a Hou Tao            2022-10-14  264  	/* If RCU Tasks Trace grace period implies RCU grace period,
59be91e5e70a1a Hou Tao            2022-10-14  265  	 * there is no need to invoke call_rcu().
59be91e5e70a1a Hou Tao            2022-10-14  266  	 */
59be91e5e70a1a Hou Tao            2022-10-14  267  	if (rcu_trace_implies_rcu_gp())
59be91e5e70a1a Hou Tao            2022-10-14  268  		__free_rcu(head);
59be91e5e70a1a Hou Tao            2022-10-14  269  	else
59be91e5e70a1a Hou Tao            2022-10-14  270  		call_rcu(head, __free_rcu);
dccb4a9013a68d Alexei Starovoitov 2022-09-02  271  }
dccb4a9013a68d Alexei Starovoitov 2022-09-02  272  
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  273  static void enque_to_free(struct bpf_mem_cache *c, void *obj)
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  274  {
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  275  	struct llist_node *llnode = obj;
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  276  
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  277  	/* bpf_mem_cache is a per-cpu object. Freeing happens in irq_work.
12c8d0f4c8702f Alexei Starovoitov 2023-07-05  278  	 * Nothing races to add to free_by_rcu_ttrace list.
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  279  	 */
12c8d0f4c8702f Alexei Starovoitov 2023-07-05  280  	__llist_add(llnode, &c->free_by_rcu_ttrace);
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  281  }
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  282  
12c8d0f4c8702f Alexei Starovoitov 2023-07-05  283  static void do_call_rcu_ttrace(struct bpf_mem_cache *c)
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  284  {
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  285  	struct llist_node *llnode, *t;
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  286  
12c8d0f4c8702f Alexei Starovoitov 2023-07-05  287  	if (atomic_xchg(&c->call_rcu_ttrace_in_progress, 1))
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  288  		return;
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  289  
12c8d0f4c8702f Alexei Starovoitov 2023-07-05  290  	WARN_ON_ONCE(!llist_empty(&c->waiting_for_gp_ttrace));
12c8d0f4c8702f Alexei Starovoitov 2023-07-05  291  	llist_for_each_safe(llnode, t, __llist_del_all(&c->free_by_rcu_ttrace))
12c8d0f4c8702f Alexei Starovoitov 2023-07-05  292  		/* There is no concurrent __llist_add(waiting_for_gp_ttrace) access.
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  293  		 * It doesn't race with llist_del_all either.
12c8d0f4c8702f Alexei Starovoitov 2023-07-05  294  		 * But there could be two concurrent llist_del_all(waiting_for_gp_ttrace):
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  295  		 * from __free_rcu() and from drain_mem_cache().
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  296  		 */
12c8d0f4c8702f Alexei Starovoitov 2023-07-05  297  		__llist_add(llnode, &c->waiting_for_gp_ttrace);
dccb4a9013a68d Alexei Starovoitov 2022-09-02  298  	/* Use call_rcu_tasks_trace() to wait for sleepable progs to finish.
59be91e5e70a1a Hou Tao            2022-10-14  299  	 * If RCU Tasks Trace grace period implies RCU grace period, free
59be91e5e70a1a Hou Tao            2022-10-14  300  	 * these elements directly, else use call_rcu() to wait for normal
59be91e5e70a1a Hou Tao            2022-10-14  301  	 * progs to finish and finally do free_one() on each element.
dccb4a9013a68d Alexei Starovoitov 2022-09-02  302  	 */
12c8d0f4c8702f Alexei Starovoitov 2023-07-05  303  	call_rcu_tasks_trace(&c->rcu_ttrace, __free_rcu_tasks_trace);
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  304  }
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  305  
7c8199e24fa09d Alexei Starovoitov 2022-09-02  306  static void free_bulk(struct bpf_mem_cache *c)
7c8199e24fa09d Alexei Starovoitov 2022-09-02  307  {
7c8199e24fa09d Alexei Starovoitov 2022-09-02  308  	struct llist_node *llnode, *t;
7c8199e24fa09d Alexei Starovoitov 2022-09-02  309  	unsigned long flags;
7c8199e24fa09d Alexei Starovoitov 2022-09-02  310  	int cnt;
7c8199e24fa09d Alexei Starovoitov 2022-09-02  311  
7c8199e24fa09d Alexei Starovoitov 2022-09-02  312  	do {
18e027b1c7c6dd Alexei Starovoitov 2023-07-05  313  		inc_active(c, &flags);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  314  		llnode = __llist_del_first(&c->free_llist);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  315  		if (llnode)
7c8199e24fa09d Alexei Starovoitov 2022-09-02  316  			cnt = --c->free_cnt;
7c8199e24fa09d Alexei Starovoitov 2022-09-02  317  		else
7c8199e24fa09d Alexei Starovoitov 2022-09-02  318  			cnt = 0;
18e027b1c7c6dd Alexei Starovoitov 2023-07-05 @319  		dec_active(c, flags);
c31b38cb948ee7 Hou Tao            2022-09-19  320  		if (llnode)
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  321  			enque_to_free(c, llnode);
7c266178aa51dd Alexei Starovoitov 2022-09-02  322  	} while (cnt > (c->high_watermark + c->low_watermark) / 2);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  323  
7c8199e24fa09d Alexei Starovoitov 2022-09-02  324  	/* and drain free_llist_extra */
7c8199e24fa09d Alexei Starovoitov 2022-09-02  325  	llist_for_each_safe(llnode, t, llist_del_all(&c->free_llist_extra))
8d5a8011b35d38 Alexei Starovoitov 2022-09-02  326  		enque_to_free(c, llnode);
12c8d0f4c8702f Alexei Starovoitov 2023-07-05  327  	do_call_rcu_ttrace(c);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  328  }
7c8199e24fa09d Alexei Starovoitov 2022-09-02  329  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
