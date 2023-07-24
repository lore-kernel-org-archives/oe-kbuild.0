Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FBD101C0
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Jul 2023 20:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690229956; x=1721765956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3seePaTjczlPBdAh80+z8lsT8qW2+alDUp3t26XKz2s=;
  b=LfNRJ9E0okzgRru59DTA0cE0WAtBUet4tjjCwy2nrP0+7Mun3HSlJk7Z
   TOhz9IDnMSSK4hKmu0tKzu3Y2uYSAG+HAJ5nJ779Ut9C3DVVD91D7oke/
   8khl7OFDITy76NDeP0okKsByCAl8f8lJf+kt5ADASl54VZb+3t73uUkQg
   wFX6nSm/ZLp9gGRpWy/ldbXHUBIhyBJc0jZsuzElqb3eNskWsceBRUhsX
   530o5FI/2azFpNxi8NEM5xeUlPsNdIlXFDpcxfZuTGQqNrZBxr+e57453
   Mav85EQhsIu5JxuHSeDrPvd/E+o0AtHQ0xk3Y9BG9V9Na8pGkDR5VyMzC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="366431540"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="366431540"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 13:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="760930138"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="760930138"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 24 Jul 2023 13:19:14 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO21R-000A0w-0Q;
	Mon, 24 Jul 2023 20:19:13 +0000
Date: Tue, 25 Jul 2023 04:19:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1474/4083] kernel/bpf/memalloc.c:387
 check_free_by_rcu() error: uninitialized symbol 'flags'.
Message-ID: <202307250409.bLWpbSqq-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4d2c646ac07cf4a35ef1c4a935a1a4fd6c6b1a36
commit: 5af6807bdb10d1af9d412d7d6c177ba8440adffb [1474/4083] bpf: Introduce bpf_mem_free_rcu() similar to kfree_rcu().
:::::: branch date: 16 hours ago
:::::: commit date: 12 days ago
config: x86_64-randconfig-m001-20230723 (https://download.01.org/0day-ci/archive/20230725/202307250409.bLWpbSqq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307250409.bLWpbSqq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307250409.bLWpbSqq-lkp@intel.com/

smatch warnings:
kernel/bpf/memalloc.c:387 check_free_by_rcu() error: uninitialized symbol 'flags'.

vim +/flags +387 kernel/bpf/memalloc.c

5af6807bdb10d1 Alexei Starovoitov 2023-07-05  375  
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  376  static void check_free_by_rcu(struct bpf_mem_cache *c)
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  377  {
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  378  	struct llist_node *llnode, *t;
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  379  	unsigned long flags;
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  380  
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  381  	/* drain free_llist_extra_rcu */
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  382  	if (unlikely(!llist_empty(&c->free_llist_extra_rcu))) {
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  383  		inc_active(c, &flags);
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  384  		llist_for_each_safe(llnode, t, llist_del_all(&c->free_llist_extra_rcu))
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  385  			if (__llist_add(llnode, &c->free_by_rcu))
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  386  				c->free_by_rcu_tail = llnode;
5af6807bdb10d1 Alexei Starovoitov 2023-07-05 @387  		dec_active(c, flags);
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  388  	}
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  389  
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  390  	if (llist_empty(&c->free_by_rcu))
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  391  		return;
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  392  
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  393  	if (atomic_xchg(&c->call_rcu_in_progress, 1)) {
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  394  		/*
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  395  		 * Instead of kmalloc-ing new rcu_head and triggering 10k
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  396  		 * call_rcu() to hit rcutree.qhimark and force RCU to notice
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  397  		 * the overload just ask RCU to hurry up. There could be many
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  398  		 * objects in free_by_rcu list.
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  399  		 * This hint reduces memory consumption for an artificial
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  400  		 * benchmark from 2 Gbyte to 150 Mbyte.
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  401  		 */
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  402  		rcu_request_urgent_qs_task(current);
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  403  		return;
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  404  	}
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  405  
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  406  	WARN_ON_ONCE(!llist_empty(&c->waiting_for_gp));
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  407  
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  408  	inc_active(c, &flags);
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  409  	WRITE_ONCE(c->waiting_for_gp.first, __llist_del_all(&c->free_by_rcu));
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  410  	c->waiting_for_gp_tail = c->free_by_rcu_tail;
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  411  	dec_active(c, flags);
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  412  
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  413  	if (unlikely(READ_ONCE(c->draining))) {
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  414  		free_all(llist_del_all(&c->waiting_for_gp), !!c->percpu_size);
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  415  		atomic_set(&c->call_rcu_in_progress, 0);
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  416  	} else {
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  417  		call_rcu_hurry(&c->rcu, __free_by_rcu);
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  418  	}
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  419  }
5af6807bdb10d1 Alexei Starovoitov 2023-07-05  420  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
