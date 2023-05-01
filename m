Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC45F28F3
	for <oe-kbuild@lists.linux.dev>; Mon,  1 May 2023 15:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682955009; x=1714491009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=reKf4SqJEKHr/2Nnwxv1BvH1RhYm0ReLb5uFzxDcGHI=;
  b=KxL5HN+w9MFyW3RTl2/vqb93PWD5OGqB0s0B8sNhKwK0BnA18xrcCYR2
   TPvie9MfIsZNCBnWV+Cwj8cOBchHQmmI9iYbOO2uz9wF3T+a2tpSQj9zb
   sIg5zSEJ2IhP6TnIw5pFsxleaupbC6YNa4zob+kLvYX+BMLWK5L4JD14v
   ZOGnHWPFwe2UrPMMdIuvVBFG00DN5D4haAPZlZSIwg2/Q0C4egV/+Bjzw
   Zd95qmMwof5mUEzLvAJdvORZ68k/Z7PZPzxqsh/hQgIzJgkVQataRpbG1
   GbzXhUK4YCsEVgI+w+0u0TrmyJ+PNkOv9wlxFjCHj2dqUSDsxucCLFZ3U
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="332513638"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200"; 
   d="scan'208";a="332513638"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 08:30:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="689925898"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200"; 
   d="scan'208";a="689925898"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 May 2023 08:30:07 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptVTb-0000WD-0q;
	Mon, 01 May 2023 15:30:07 +0000
Date: Mon, 1 May 2023 23:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [peterz-queue:sched/eevdf 31/31] kernel/sched/fair.c:857
 __print_se() warn: argument 5 to %lx specifier is cast from pointer
Message-ID: <202305012330.vPmrChgf-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/eevdf
head:   901af44e4826aab18936ec361e737300b3135923
commit: 901af44e4826aab18936ec361e737300b3135923 [31/31] sched/eevdf: Debug / validation crud
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230501/202305012330.vPmrChgf-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305012330.vPmrChgf-lkp@intel.com/

smatch warnings:
kernel/sched/fair.c:857 __print_se() warn: argument 5 to %lx specifier is cast from pointer
kernel/sched/fair.c:911 validate_cfs_rq() warn: argument 3 to %lx specifier is cast from pointer

vim +857 kernel/sched/fair.c

901af44e4826aa Peter Zijlstra 2023-03-24  838  
901af44e4826aa Peter Zijlstra 2023-03-24  839  static void __print_se(struct cfs_rq *cfs_rq, struct sched_entity *se, int level,
901af44e4826aa Peter Zijlstra 2023-03-24  840  		       struct validate_data *data)
901af44e4826aa Peter Zijlstra 2023-03-24  841  {
901af44e4826aa Peter Zijlstra 2023-03-24  842  	static const char indent[] = "                                           ";
901af44e4826aa Peter Zijlstra 2023-03-24  843  	unsigned long weight = scale_load_down(se->load.weight);
901af44e4826aa Peter Zijlstra 2023-03-24  844  	struct task_struct *p = NULL;
901af44e4826aa Peter Zijlstra 2023-03-24  845  
901af44e4826aa Peter Zijlstra 2023-03-24  846  	s64 v = se->vruntime - cfs_rq->min_vruntime;
901af44e4826aa Peter Zijlstra 2023-03-24  847  	s64 d = se->deadline - cfs_rq->min_vruntime;
901af44e4826aa Peter Zijlstra 2023-03-24  848  
901af44e4826aa Peter Zijlstra 2023-03-24  849  	data->avg_vruntime += v * weight;
901af44e4826aa Peter Zijlstra 2023-03-24  850  	data->avg_load += weight;
901af44e4826aa Peter Zijlstra 2023-03-24  851  
901af44e4826aa Peter Zijlstra 2023-03-24  852  	data->min_deadline = min(data->min_deadline, d);
901af44e4826aa Peter Zijlstra 2023-03-24  853  
901af44e4826aa Peter Zijlstra 2023-03-24  854  	if (entity_is_task(se))
901af44e4826aa Peter Zijlstra 2023-03-24  855  		p = task_of(se);
901af44e4826aa Peter Zijlstra 2023-03-24  856  
901af44e4826aa Peter Zijlstra 2023-03-24 @857  	trace_printk("%.*s%lx w: %ld ve: %Ld lag: %Ld vd: %Ld vmd: %Ld %s (%d/%s)\n",
901af44e4826aa Peter Zijlstra 2023-03-24  858  		     level*2, indent, (unsigned long)se,
901af44e4826aa Peter Zijlstra 2023-03-24  859  		     weight,
901af44e4826aa Peter Zijlstra 2023-03-24  860  		     v, data->va - se->vruntime, d,
901af44e4826aa Peter Zijlstra 2023-03-24  861  		     se->min_deadline - cfs_rq->min_vruntime,
901af44e4826aa Peter Zijlstra 2023-03-24  862  		     entity_eligible(cfs_rq, se) ? "E" : "N",
901af44e4826aa Peter Zijlstra 2023-03-24  863  		     p ? p->pid : -1,
901af44e4826aa Peter Zijlstra 2023-03-24  864  		     p ? p->comm : "(null)");
901af44e4826aa Peter Zijlstra 2023-03-24  865  }
901af44e4826aa Peter Zijlstra 2023-03-24  866  
901af44e4826aa Peter Zijlstra 2023-03-24  867  static void __print_node(struct cfs_rq *cfs_rq, struct rb_node *node, int level,
901af44e4826aa Peter Zijlstra 2023-03-24  868  			 struct validate_data *data)
901af44e4826aa Peter Zijlstra 2023-03-24  869  {
901af44e4826aa Peter Zijlstra 2023-03-24  870  	if (!node)
901af44e4826aa Peter Zijlstra 2023-03-24  871  		return;
901af44e4826aa Peter Zijlstra 2023-03-24  872  
901af44e4826aa Peter Zijlstra 2023-03-24  873  	__print_se(cfs_rq, __node_2_se(node), level, data);
901af44e4826aa Peter Zijlstra 2023-03-24  874  	__print_node(cfs_rq, node->rb_left, level+1, data);
901af44e4826aa Peter Zijlstra 2023-03-24  875  	__print_node(cfs_rq, node->rb_right, level+1, data);
901af44e4826aa Peter Zijlstra 2023-03-24  876  }
901af44e4826aa Peter Zijlstra 2023-03-24  877  
901af44e4826aa Peter Zijlstra 2023-03-24  878  static struct sched_entity *pick_eevdf(struct cfs_rq *cfs_rq);
901af44e4826aa Peter Zijlstra 2023-03-24  879  
901af44e4826aa Peter Zijlstra 2023-03-24  880  static void validate_cfs_rq(struct cfs_rq *cfs_rq, bool pick)
901af44e4826aa Peter Zijlstra 2023-03-24  881  {
901af44e4826aa Peter Zijlstra 2023-03-24  882  	struct sched_entity *curr = cfs_rq->curr;
901af44e4826aa Peter Zijlstra 2023-03-24  883  	struct rb_node *root = cfs_rq->tasks_timeline.rb_root.rb_node;
901af44e4826aa Peter Zijlstra 2023-03-24  884  	struct validate_data _data = {
901af44e4826aa Peter Zijlstra 2023-03-24  885  		.va = avg_vruntime(cfs_rq),
901af44e4826aa Peter Zijlstra 2023-03-24  886  		.min_deadline = (~0ULL) >> 1,
901af44e4826aa Peter Zijlstra 2023-03-24  887  	}, *data = &_data;
901af44e4826aa Peter Zijlstra 2023-03-24  888  
901af44e4826aa Peter Zijlstra 2023-03-24  889  	trace_printk("---\n");
901af44e4826aa Peter Zijlstra 2023-03-24  890  
901af44e4826aa Peter Zijlstra 2023-03-24  891  	__print_node(cfs_rq, root, 0, data);
901af44e4826aa Peter Zijlstra 2023-03-24  892  
901af44e4826aa Peter Zijlstra 2023-03-24  893  	trace_printk("min_deadline: %Ld avg_vruntime: %Ld / %Ld = %Ld\n",
901af44e4826aa Peter Zijlstra 2023-03-24  894  		     data->min_deadline,
901af44e4826aa Peter Zijlstra 2023-03-24  895  		     data->avg_vruntime, data->avg_load,
901af44e4826aa Peter Zijlstra 2023-03-24  896  		     data->avg_load ? div_s64(data->avg_vruntime, data->avg_load) : 0);
901af44e4826aa Peter Zijlstra 2023-03-24  897  
901af44e4826aa Peter Zijlstra 2023-03-24  898  	if (WARN_ON_ONCE(cfs_rq->avg_vruntime != data->avg_vruntime))
901af44e4826aa Peter Zijlstra 2023-03-24  899  		cfs_rq->avg_vruntime = data->avg_vruntime;
901af44e4826aa Peter Zijlstra 2023-03-24  900  
901af44e4826aa Peter Zijlstra 2023-03-24  901  	if (WARN_ON_ONCE(cfs_rq->avg_load != data->avg_load))
901af44e4826aa Peter Zijlstra 2023-03-24  902  		cfs_rq->avg_load = data->avg_load;
901af44e4826aa Peter Zijlstra 2023-03-24  903  
901af44e4826aa Peter Zijlstra 2023-03-24  904  	data->min_deadline += cfs_rq->min_vruntime;
901af44e4826aa Peter Zijlstra 2023-03-24  905  	WARN_ON_ONCE(cfs_rq->avg_load && __node_2_se(root)->min_deadline != data->min_deadline);
901af44e4826aa Peter Zijlstra 2023-03-24  906  
901af44e4826aa Peter Zijlstra 2023-03-24  907  	if (curr && curr->on_rq)
901af44e4826aa Peter Zijlstra 2023-03-24  908  		__print_se(cfs_rq, curr, 0, data);
901af44e4826aa Peter Zijlstra 2023-03-24  909  
901af44e4826aa Peter Zijlstra 2023-03-24  910  	if (pick)
901af44e4826aa Peter Zijlstra 2023-03-24 @911  		trace_printk("pick: %lx\n", (unsigned long)pick_eevdf(cfs_rq));
901af44e4826aa Peter Zijlstra 2023-03-24  912  }
901af44e4826aa Peter Zijlstra 2023-03-24  913  #else
901af44e4826aa Peter Zijlstra 2023-03-24  914  static inline void validate_cfs_rq(struct cfs_rq *cfs_rq, bool pick) { }
901af44e4826aa Peter Zijlstra 2023-03-24  915  #endif
901af44e4826aa Peter Zijlstra 2023-03-24  916  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
