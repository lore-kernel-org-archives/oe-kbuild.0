Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC3519F
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Aug 2023 04:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691814724; x=1723350724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=05BJOTBgnXBl/4BFTGznMlHV+1Rs5z+k44PO4NsM2yM=;
  b=DHMknL9E5M74mWKF3Hw8CWpSLgELqND67jWQQ4DNOwiv/kGGeh/EHE+A
   RSX5NMGUkZPOPgx+10L3ELON1vtV4Xa+P+s4SFxl2MR+YRimh8CsKUrVu
   ESCyP7IKlerZOxFzCSA15RNEn3G3mVtmpFIeg2q8oSP2g9Lcig+Eyhsj4
   h5S2xfK+EQYPvhj4KRJDHjMYnXu2ZkeUsAlUcNYUr51mvj7qIInUDefIl
   hYvgCYNcK0xNhVADAFQEEvZwc71JlE4TWIrq9tFNSzYVBmjkCp3eTA2Li
   sfzuwHjJzvIqWfwxG+QGL9nyNRSlFfIXy+Iwa5cfCv4kwmffXWqzb0hUu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438135753"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="438135753"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 21:32:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="906639304"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="906639304"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Aug 2023 21:32:02 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUgID-0008GG-2i;
	Sat, 12 Aug 2023 04:32:01 +0000
Date: Sat, 12 Aug 2023 12:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/rcu/tree_exp.h:807:9: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202308121209.rPZbIkm2-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Qing Zhang <zhangqing@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f8de32cc060ba3f63171aaa0e8764d22d8c37978
commit: 93a4fa622eb061f75f87f0cf9609ab4e69c67d01 LoongArch: Add STACKTRACE support
date:   1 year ago
:::::: branch date: 2 hours ago
:::::: commit date: 1 year ago
config: loongarch-randconfig-r093-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121209.rPZbIkm2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121209.rPZbIkm2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308121209.rPZbIkm2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/rcu/tree.c: note: in included file:
>> kernel/rcu/tree_exp.h:807:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:807:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:807:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/rcu/tree_exp.h:807:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:807:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:807:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/rcu/tree_exp.h:807:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:807:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:807:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/rcu/tree_exp.h:807:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:807:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:807:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/rcu/tree_exp.h:807:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:807:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:807:9: sparse:     got int [noderef] __percpu *
>> kernel/rcu/tree_exp.h:807:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:807:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:807:9: sparse:     got int [noderef] __percpu *
>> kernel/rcu/tree_exp.h:807:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:807:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:807:9: sparse:     got int [noderef] __percpu *
>> kernel/rcu/tree_exp.h:807:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:807:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:807:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c: note: in included file:
   kernel/rcu/tree_plugin.h:720:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:720:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:720:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:720:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:720:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:720:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:720:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:720:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:720:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:720:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:720:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:720:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:720:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:720:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:720:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:720:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:720:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:720:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:720:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:720:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:720:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:720:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:720:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:720:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:1242:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1242:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1242:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:1242:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1242:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1242:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:1242:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1242:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1242:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:1242:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1242:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1242:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:1242:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1242:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1242:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:1242:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1242:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1242:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:1242:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1242:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1242:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:1242:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1242:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1242:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c: note: in included file:
   kernel/rcu/tree_nocb.h:1473:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:1473:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1473:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:1473:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:1473:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1473:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:1473:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:1473:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1473:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:1473:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:1473:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1473:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:1473:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:1473:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1473:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:1473:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:1473:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1473:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:1473:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:1473:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1473:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:1473:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:1473:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1473:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c: note: in included file:
   kernel/rcu/tree_stall.h:224:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:224:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:224:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_stall.h:224:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:224:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:224:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_stall.h:224:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:224:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:224:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_stall.h:224:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:224:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:224:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_stall.h:224:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:224:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:224:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:224:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:224:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:224:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:224:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:224:9: sparse:     expected void *ptr
   kernel/rcu/tree_stall.h:224:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_stall.h:224:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_stall.h:224:9: sparse:     expected void *ptr

vim +807 kernel/rcu/tree_exp.h

45975c7d21a1c0 Paul E. McKenney 2018-07-02  786  
d87cda5094585b Paul E. McKenney 2019-01-11  787  /*
d87cda5094585b Paul E. McKenney 2019-01-11  788   * Scan the current list of tasks blocked within RCU read-side critical
d87cda5094585b Paul E. McKenney 2019-01-11  789   * sections, printing out the tid of each that is blocking the current
d87cda5094585b Paul E. McKenney 2019-01-11  790   * expedited grace period.
d87cda5094585b Paul E. McKenney 2019-01-11  791   */
d87cda5094585b Paul E. McKenney 2019-01-11  792  static int rcu_print_task_exp_stall(struct rcu_node *rnp)
d87cda5094585b Paul E. McKenney 2019-01-11  793  {
314eeb43e5f228 Paul E. McKenney 2020-01-03  794  	unsigned long flags;
d87cda5094585b Paul E. McKenney 2019-01-11  795  	int ndetected = 0;
314eeb43e5f228 Paul E. McKenney 2020-01-03  796  	struct task_struct *t;
d87cda5094585b Paul E. McKenney 2019-01-11  797  
314eeb43e5f228 Paul E. McKenney 2020-01-03  798  	if (!READ_ONCE(rnp->exp_tasks))
d87cda5094585b Paul E. McKenney 2019-01-11  799  		return 0;
314eeb43e5f228 Paul E. McKenney 2020-01-03  800  	raw_spin_lock_irqsave_rcu_node(rnp, flags);
d87cda5094585b Paul E. McKenney 2019-01-11  801  	t = list_entry(rnp->exp_tasks->prev,
d87cda5094585b Paul E. McKenney 2019-01-11  802  		       struct task_struct, rcu_node_entry);
d87cda5094585b Paul E. McKenney 2019-01-11  803  	list_for_each_entry_continue(t, &rnp->blkd_tasks, rcu_node_entry) {
d87cda5094585b Paul E. McKenney 2019-01-11  804  		pr_cont(" P%d", t->pid);
d87cda5094585b Paul E. McKenney 2019-01-11  805  		ndetected++;
d87cda5094585b Paul E. McKenney 2019-01-11  806  	}
314eeb43e5f228 Paul E. McKenney 2020-01-03 @807  	raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
d87cda5094585b Paul E. McKenney 2019-01-11  808  	return ndetected;
d87cda5094585b Paul E. McKenney 2019-01-11  809  }
d87cda5094585b Paul E. McKenney 2019-01-11  810  

:::::: The code at line 807 was first introduced by commit
:::::: 314eeb43e5f22856b281c91c966e51e5782a3498 rcu: Add *_ONCE() and data_race() to rcu_node ->exp_tasks plus locking

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
