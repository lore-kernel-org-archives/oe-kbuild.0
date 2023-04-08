Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4507E79C2
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Apr 2023 21:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680990199; x=1712526199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/MLdYDb17G0rILNkvxZGNtdTYr7DU6GBEr1A8T7Hxh0=;
  b=ZedKN00AGUq6GwhzeU/nLqmYhk2VBl4dEm3hKKIAyQWzsfc5nh2e9gUS
   ZOwYizba/4I/oTXm861zfeRwXU1nFHObRp0FoAk7n4mgSw1OIWb4CAo2l
   kOunvPiCBD4E8GvNpga2Je7ZPiztcdHrh6PNbcxWpiadV2epa8ukbh9Ao
   i0onlQMh8yraulvD0kt/qca/Nk70wvQzEbwOTNFDwUFsE7C3+7uacAf6S
   p3e9GS+ssqXmVeaR1gviOsaRwGr+LAqyKDnKzv9Fws8o2FOpneRcFnhQ+
   bmSvEDSJ2dOF0PyWp4/cJ4U/Hwv6Ofvx+Vejx5Qk2PK58itQuHZ7EkzDZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="345827426"
X-IronPort-AV: E=Sophos;i="5.98,330,1673942400"; 
   d="scan'208";a="345827426"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 14:43:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="681342656"
X-IronPort-AV: E=Sophos;i="5.98,330,1673942400"; 
   d="scan'208";a="681342656"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 08 Apr 2023 14:43:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plGL3-000U89-0I;
	Sat, 08 Apr 2023 21:43:13 +0000
Date: Sun, 9 Apr 2023 05:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/rcu/tree_exp.h:807:9: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202304090509.0x3n6e16-lkp@intel.com>
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
head:   68047c48b2288803c441df9f3e61d0d26bed87df
commit: 93a4fa622eb061f75f87f0cf9609ab4e69c67d01 LoongArch: Add STACKTRACE support
date:   8 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 months ago
config: loongarch-randconfig-s053-20230409 (https://download.01.org/0day-ci/archive/20230409/202304090509.0x3n6e16-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=93a4fa622eb061f75f87f0cf9609ab4e69c67d01
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 93a4fa622eb061f75f87f0cf9609ab4e69c67d01
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/perf/ kernel/rcu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304090509.0x3n6e16-lkp@intel.com/

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
   kernel/rcu/tree_nocb.h:377:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:377:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:377:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:377:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:377:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:377:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:377:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:377:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:377:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:377:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:377:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:377:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:377:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:377:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:377:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:377:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:377:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:377:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:377:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:377:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:377:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:377:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:377:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:377:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:154:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:154:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:154:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:154:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:154:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:154:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:154:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:154:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:154:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:154:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:154:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:154:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:154:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:154:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:154:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:154:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:154:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:154:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:154:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:154:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:154:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:154:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:154:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:154:9: sparse:     got int [noderef] __percpu *

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
https://github.com/intel/lkp-tests
