Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23736AAE
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Mar 2023 21:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679867814; x=1711403814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pw9pcXSZkzZSm3Gw8fQA2UC4k6sDoXxMzmREK6VoP7k=;
  b=B7TawRcY9/RKY0IRNk86RGNz6U8uDEqQZoPalD1D54v98sJNoEzTZGhZ
   IU6usFNc07NnVg7tGbC8TcX8GNhAUHVqJWz7nip2UM2zPTyAcHHTa6JW5
   FkexDKvK3bxvE6wyBSO+aTz3dOofYuf4kJyQxhh76GUsOEZicORXoyjn/
   QiXimPMWGwlDpaC+GRfN5dx2QyjRGgkxCat0d2WuyIGsva77sbgj2SHWd
   V7z+cxBY80/VzuBplWNBi5yEv+hJNlBOD1Tqz5awViianYRE/HmhmbfJo
   RwSnXpD4FV1t11Oqjc8HpYXo6v/GuNqn9dFz0CDm7dvjtVGrsg+WLhsGV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="367875663"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; 
   d="scan'208";a="367875663"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 14:56:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="1012887314"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; 
   d="scan'208";a="1012887314"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Mar 2023 14:56:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgYM8-000HNP-0t;
	Sun, 26 Mar 2023 21:56:52 +0000
Date: Mon, 27 Mar 2023 05:56:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [peterz-queue:sched/eevdf 18/18] kernel/sched/fair.c:828
 __print_se() warn: argument 5 to %lx specifier is cast from pointer
Message-ID: <202303270521.gVX8m0fJ-lkp@intel.com>
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
head:   757a8ca40738a90f69ec65470ddae5f4d5e5256c
commit: 757a8ca40738a90f69ec65470ddae5f4d5e5256c [18/18] sched/eevdf: Debug / validation crud
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230327/202303270521.gVX8m0fJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303270521.gVX8m0fJ-lkp@intel.com/

smatch warnings:
kernel/sched/fair.c:828 __print_se() warn: argument 5 to %lx specifier is cast from pointer
kernel/sched/fair.c:882 validate_cfs_rq() warn: argument 3 to %lx specifier is cast from pointer

vim +828 kernel/sched/fair.c

757a8ca40738a9 Peter Zijlstra 2023-03-24  809  
757a8ca40738a9 Peter Zijlstra 2023-03-24  810  static void __print_se(struct cfs_rq *cfs_rq, struct sched_entity *se, int level,
757a8ca40738a9 Peter Zijlstra 2023-03-24  811  		       struct validate_data *data)
757a8ca40738a9 Peter Zijlstra 2023-03-24  812  {
757a8ca40738a9 Peter Zijlstra 2023-03-24  813  	static const char indent[] = "                                           ";
757a8ca40738a9 Peter Zijlstra 2023-03-24  814  	unsigned long weight = scale_load_down(se->load.weight);
757a8ca40738a9 Peter Zijlstra 2023-03-24  815  	struct task_struct *p = NULL;
757a8ca40738a9 Peter Zijlstra 2023-03-24  816  
757a8ca40738a9 Peter Zijlstra 2023-03-24  817  	s64 v = se->vruntime - cfs_rq->min_vruntime;
757a8ca40738a9 Peter Zijlstra 2023-03-24  818  	s64 d = se->deadline - cfs_rq->min_vruntime;
757a8ca40738a9 Peter Zijlstra 2023-03-24  819  
757a8ca40738a9 Peter Zijlstra 2023-03-24  820  	data->avg_vruntime += v * weight;
757a8ca40738a9 Peter Zijlstra 2023-03-24  821  	data->avg_load += weight;
757a8ca40738a9 Peter Zijlstra 2023-03-24  822  
757a8ca40738a9 Peter Zijlstra 2023-03-24  823  	data->min_deadline = min(data->min_deadline, d);
757a8ca40738a9 Peter Zijlstra 2023-03-24  824  
757a8ca40738a9 Peter Zijlstra 2023-03-24  825  	if (entity_is_task(se))
757a8ca40738a9 Peter Zijlstra 2023-03-24  826  		p = task_of(se);
757a8ca40738a9 Peter Zijlstra 2023-03-24  827  
757a8ca40738a9 Peter Zijlstra 2023-03-24 @828  	trace_printk("%.*s%lx w: %ld ve: %Ld lag: %Ld vd: %Ld vmd: %Ld %s (%d/%s)\n",
757a8ca40738a9 Peter Zijlstra 2023-03-24  829  		     level*2, indent, (unsigned long)se,
757a8ca40738a9 Peter Zijlstra 2023-03-24  830  		     weight,
757a8ca40738a9 Peter Zijlstra 2023-03-24  831  		     v, data->va - se->vruntime, d,
757a8ca40738a9 Peter Zijlstra 2023-03-24  832  		     se->min_deadline - cfs_rq->min_vruntime,
757a8ca40738a9 Peter Zijlstra 2023-03-24  833  		     entity_eligible(cfs_rq, se) ? "E" : "N",
757a8ca40738a9 Peter Zijlstra 2023-03-24  834  		     p ? p->pid : -1,
757a8ca40738a9 Peter Zijlstra 2023-03-24  835  		     p ? p->comm : "(null)");
757a8ca40738a9 Peter Zijlstra 2023-03-24  836  }
757a8ca40738a9 Peter Zijlstra 2023-03-24  837  
757a8ca40738a9 Peter Zijlstra 2023-03-24  838  static void __print_node(struct cfs_rq *cfs_rq, struct rb_node *node, int level,
757a8ca40738a9 Peter Zijlstra 2023-03-24  839  			 struct validate_data *data)
757a8ca40738a9 Peter Zijlstra 2023-03-24  840  {
757a8ca40738a9 Peter Zijlstra 2023-03-24  841  	if (!node)
757a8ca40738a9 Peter Zijlstra 2023-03-24  842  		return;
757a8ca40738a9 Peter Zijlstra 2023-03-24  843  
757a8ca40738a9 Peter Zijlstra 2023-03-24  844  	__print_se(cfs_rq, __node_2_se(node), level, data);
757a8ca40738a9 Peter Zijlstra 2023-03-24  845  	__print_node(cfs_rq, node->rb_left, level+1, data);
757a8ca40738a9 Peter Zijlstra 2023-03-24  846  	__print_node(cfs_rq, node->rb_right, level+1, data);
757a8ca40738a9 Peter Zijlstra 2023-03-24  847  }
757a8ca40738a9 Peter Zijlstra 2023-03-24  848  
757a8ca40738a9 Peter Zijlstra 2023-03-24  849  static struct sched_entity *pick_eevdf(struct cfs_rq *cfs_rq);
757a8ca40738a9 Peter Zijlstra 2023-03-24  850  
757a8ca40738a9 Peter Zijlstra 2023-03-24  851  static void validate_cfs_rq(struct cfs_rq *cfs_rq, bool pick)
757a8ca40738a9 Peter Zijlstra 2023-03-24  852  {
757a8ca40738a9 Peter Zijlstra 2023-03-24  853  	struct sched_entity *curr = cfs_rq->curr;
757a8ca40738a9 Peter Zijlstra 2023-03-24  854  	struct rb_node *root = cfs_rq->tasks_timeline.rb_root.rb_node;
757a8ca40738a9 Peter Zijlstra 2023-03-24  855  	struct validate_data _data = {
757a8ca40738a9 Peter Zijlstra 2023-03-24  856  		.va = avg_vruntime(cfs_rq),
757a8ca40738a9 Peter Zijlstra 2023-03-24  857  		.min_deadline = (~0ULL) >> 1,
757a8ca40738a9 Peter Zijlstra 2023-03-24  858  	}, *data = &_data;
757a8ca40738a9 Peter Zijlstra 2023-03-24  859  
757a8ca40738a9 Peter Zijlstra 2023-03-24  860  	trace_printk("---\n");
757a8ca40738a9 Peter Zijlstra 2023-03-24  861  
757a8ca40738a9 Peter Zijlstra 2023-03-24  862  	__print_node(cfs_rq, root, 0, data);
757a8ca40738a9 Peter Zijlstra 2023-03-24  863  
757a8ca40738a9 Peter Zijlstra 2023-03-24  864  	trace_printk("min_deadline: %Ld avg_vruntime: %Ld / %Ld = %Ld\n",
757a8ca40738a9 Peter Zijlstra 2023-03-24  865  		     data->min_deadline,
757a8ca40738a9 Peter Zijlstra 2023-03-24  866  		     data->avg_vruntime, data->avg_load,
757a8ca40738a9 Peter Zijlstra 2023-03-24  867  		     data->avg_load ? div_s64(data->avg_vruntime, data->avg_load) : 0);
757a8ca40738a9 Peter Zijlstra 2023-03-24  868  
757a8ca40738a9 Peter Zijlstra 2023-03-24  869  	if (WARN_ON_ONCE(cfs_rq->avg_vruntime != data->avg_vruntime))
757a8ca40738a9 Peter Zijlstra 2023-03-24  870  		cfs_rq->avg_vruntime = data->avg_vruntime;
757a8ca40738a9 Peter Zijlstra 2023-03-24  871  
757a8ca40738a9 Peter Zijlstra 2023-03-24  872  	if (WARN_ON_ONCE(cfs_rq->avg_load != data->avg_load))
757a8ca40738a9 Peter Zijlstra 2023-03-24  873  		cfs_rq->avg_load = data->avg_load;
757a8ca40738a9 Peter Zijlstra 2023-03-24  874  
757a8ca40738a9 Peter Zijlstra 2023-03-24  875  	data->min_deadline += cfs_rq->min_vruntime;
757a8ca40738a9 Peter Zijlstra 2023-03-24  876  	WARN_ON_ONCE(cfs_rq->avg_load && __node_2_se(root)->min_deadline != data->min_deadline);
757a8ca40738a9 Peter Zijlstra 2023-03-24  877  
757a8ca40738a9 Peter Zijlstra 2023-03-24  878  	if (curr && curr->on_rq)
757a8ca40738a9 Peter Zijlstra 2023-03-24  879  		__print_se(cfs_rq, curr, 0, data);
757a8ca40738a9 Peter Zijlstra 2023-03-24  880  
757a8ca40738a9 Peter Zijlstra 2023-03-24  881  	if (pick)
757a8ca40738a9 Peter Zijlstra 2023-03-24 @882  		trace_printk("pick: %lx\n", (unsigned long)pick_eevdf(cfs_rq));
757a8ca40738a9 Peter Zijlstra 2023-03-24  883  }
757a8ca40738a9 Peter Zijlstra 2023-03-24  884  #else
757a8ca40738a9 Peter Zijlstra 2023-03-24  885  static inline void validate_cfs_rq(struct cfs_rq *cfs_rq, bool pick) { }
757a8ca40738a9 Peter Zijlstra 2023-03-24  886  #endif
757a8ca40738a9 Peter Zijlstra 2023-03-24  887  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
