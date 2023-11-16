Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2422D78C
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Nov 2023 13:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XOBNF+1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700139827; x=1731675827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jQ8LrsGBkeW6iH0kG1DuEH2AyzUOe1LEa1R4cycjzmU=;
  b=XOBNF+1s1pNZKOX8A1ivHeaSG5HSLjzdAJ6+S2IpQrtrSXsjWI0oGeyE
   lIlCtppE7GlSpy3Z3WIt2ngIuAY5jXiwtuYOVyW8eiAchQFLkSmlvoURh
   xykmmGxuiX5jzpMNT00V4oAuw9ZfxECU8OLagC+ZvyMwvz2XPKM8blCiP
   qEoIKdRpZnQ9sMpzWNWPf7bphS9yBapZCC6C1qPVdsK++t4CqvhSZiDPB
   w0GovyB3sAC/jgxrfPz0XvhjPaCl5RnUE0yeEHqEdkYdWse06Nm5OwjRx
   YngyMyog2GFHwuPj5CE74Y5LwUBT5Vxbe+71KnVu+BQYOTtFf/TKPh2Uu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="381481087"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="381481087"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 05:03:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="6527133"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 16 Nov 2023 05:03:46 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3c23-0001g7-1D;
	Thu, 16 Nov 2023 13:03:43 +0000
Date: Thu, 16 Nov 2023 21:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/rcu/tree_exp.h:808:17: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202311162049.FrgwcH0n-lkp@intel.com>
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
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 80c7889de7a8246e44a9632a2b7d15b41ab3fe41 LoongArch: Support PREEMPT_DYNAMIC with static keys
date:   8 days ago
:::::: branch date: 32 hours ago
:::::: commit date: 8 days ago
config: loongarch-randconfig-r112-20231116 (https://download.01.org/0day-ci/archive/20231116/202311162049.FrgwcH0n-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311162049.FrgwcH0n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311162049.FrgwcH0n-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/rcu/tree.c: note: in included file:
>> kernel/rcu/tree_exp.h:808:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:808:17: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:808:17: sparse:     got unsigned int [noderef] __percpu *
>> kernel/rcu/tree_exp.h:808:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:808:17: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:808:17: sparse:     got unsigned int [noderef] __percpu *
>> kernel/rcu/tree_exp.h:808:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:808:17: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:808:17: sparse:     got unsigned int [noderef] __percpu *
>> kernel/rcu/tree_exp.h:808:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:808:17: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:808:17: sparse:     got unsigned int [noderef] __percpu *
>> kernel/rcu/tree_exp.h:808:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:808:17: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:808:17: sparse:     got int [noderef] __percpu *
>> kernel/rcu/tree_exp.h:808:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:808:17: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:808:17: sparse:     got int [noderef] __percpu *
>> kernel/rcu/tree_exp.h:808:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:808:17: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:808:17: sparse:     got int [noderef] __percpu *
>> kernel/rcu/tree_exp.h:808:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:808:17: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:808:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_exp.h:817:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:817:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:817:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_exp.h:817:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:817:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:817:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_exp.h:817:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:817:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:817:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_exp.h:817:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:817:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:817:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_exp.h:817:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:817:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:817:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_exp.h:817:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:817:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:817:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_exp.h:817:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:817:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:817:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_exp.h:817:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:817:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:817:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c: note: in included file:
   kernel/rcu/tree_plugin.h:723:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:723:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:723:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:723:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:723:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:723:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:723:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:723:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:723:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:723:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:723:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:723:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:723:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:723:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:723:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:723:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:723:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:723:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:723:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:723:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:723:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:723:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:723:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:723:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:1262:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1262:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1262:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:1262:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1262:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1262:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:1262:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1262:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1262:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:1262:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1262:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1262:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:1262:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1262:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1262:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:1262:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1262:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1262:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:1262:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1262:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1262:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:1262:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1262:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1262:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c: note: in included file:
   kernel/rcu/tree_nocb.h:1743:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:1743:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1743:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:1743:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:1743:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1743:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:1743:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:1743:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1743:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:1743:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:1743:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1743:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:1743:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:1743:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1743:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:1743:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:1743:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1743:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:1743:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:1743:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1743:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:1743:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:1743:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1743:9: sparse:     got int [noderef] __percpu *

vim +808 kernel/rcu/tree_exp.h

45975c7d21a1c0 Paul E. McKenney 2018-07-02  794  
d87cda5094585b Paul E. McKenney 2019-01-11  795  /*
d87cda5094585b Paul E. McKenney 2019-01-11  796   * Scan the current list of tasks blocked within RCU read-side critical
d87cda5094585b Paul E. McKenney 2019-01-11  797   * sections, printing out the tid of each that is blocking the current
d87cda5094585b Paul E. McKenney 2019-01-11  798   * expedited grace period.
d87cda5094585b Paul E. McKenney 2019-01-11  799   */
d87cda5094585b Paul E. McKenney 2019-01-11  800  static int rcu_print_task_exp_stall(struct rcu_node *rnp)
d87cda5094585b Paul E. McKenney 2019-01-11  801  {
314eeb43e5f228 Paul E. McKenney 2020-01-03  802  	unsigned long flags;
d87cda5094585b Paul E. McKenney 2019-01-11  803  	int ndetected = 0;
314eeb43e5f228 Paul E. McKenney 2020-01-03  804  	struct task_struct *t;
d87cda5094585b Paul E. McKenney 2019-01-11  805  
314eeb43e5f228 Paul E. McKenney 2020-01-03  806  	raw_spin_lock_irqsave_rcu_node(rnp, flags);
3c1566bca3f834 Zqiang           2022-12-24  807  	if (!rnp->exp_tasks) {
3c1566bca3f834 Zqiang           2022-12-24 @808  		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
3c1566bca3f834 Zqiang           2022-12-24  809  		return 0;
3c1566bca3f834 Zqiang           2022-12-24  810  	}
d87cda5094585b Paul E. McKenney 2019-01-11  811  	t = list_entry(rnp->exp_tasks->prev,
d87cda5094585b Paul E. McKenney 2019-01-11  812  		       struct task_struct, rcu_node_entry);
d87cda5094585b Paul E. McKenney 2019-01-11  813  	list_for_each_entry_continue(t, &rnp->blkd_tasks, rcu_node_entry) {
d87cda5094585b Paul E. McKenney 2019-01-11  814  		pr_cont(" P%d", t->pid);
d87cda5094585b Paul E. McKenney 2019-01-11  815  		ndetected++;
d87cda5094585b Paul E. McKenney 2019-01-11  816  	}
314eeb43e5f228 Paul E. McKenney 2020-01-03  817  	raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
d87cda5094585b Paul E. McKenney 2019-01-11  818  	return ndetected;
d87cda5094585b Paul E. McKenney 2019-01-11  819  }
d87cda5094585b Paul E. McKenney 2019-01-11  820  

:::::: The code at line 808 was first introduced by commit
:::::: 3c1566bca3f8349f12b75d0a2d5e4a20ad6262ec rcu: Protect rcu_print_task_exp_stall() ->exp_tasks access

:::::: TO: Zqiang <qiang1.zhang@intel.com>
:::::: CC: Joel Fernandes (Google) <joel@joelfernandes.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
