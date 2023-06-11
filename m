Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EBD441D
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jun 2023 14:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686495377; x=1718031377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M1aoGu/3Z2Tf66qFjeuUbqN8jWc2fkCy8H0r80txom0=;
  b=WslnTRqZawZCeyIzkSfhtAvVAU+XZSsrv32Ia3FrTTHOVOnO+9L4Q2L4
   9o/dz0zinGFJQL0/k8mXokuKD5Wv8wVn7kVOUouRlNJVJQMsfnOxJdz6A
   jyjiR2QwuwHRk17tx9CL7ldNbPyX0NAuAcLanZdlqWl9cbxaOUykqDwoF
   tAkedxkVb7RZ3EcMzcmrS4gcDHaTk6MjX+w1SJ315dNn5UsUSscH/sztG
   8l0ZL7lMM1UWP06BYRn5QgxkNdugSyM21O927Vs4U64WQc2ERTU+abCGZ
   NCe7eyKi30tDx8B19KK+SZw9B6B05F+OPVAs1SjPnCAp1PWBO+fvRBr5h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="342556698"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="342556698"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2023 07:56:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="776061904"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="776061904"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Jun 2023 07:56:05 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8MU8-000Atk-1v;
	Sun, 11 Jun 2023 14:56:04 +0000
Date: Sun, 11 Jun 2023 22:55:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [paulmck-rcu:dev.2023.06.08a 26/40] kernel/rcu/rcuscale.c:301:20:
 error: use of undeclared identifier 'get_rcu_tasks_gp_kthread'; did you mean
 'get_rcu_tasks_trace_gp_kthread'?
Message-ID: <202306112227.m4YhzxSU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "commit 755f1c5eb416be95e2c7401673c4543709dcfad1 was found in branch paulmck-rcu/dev.2023.06.08a, not in new branch paulmck-rcu/dev.2023.06.09a"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.06.08a
head:   0bf38cfa30b818fefa8b44615cb4f1659af201bb
commit: 755f1c5eb416be95e2c7401673c4543709dcfad1 [26/40] rcuscale: Measure RCU Tasks Trace grace-period kthread CPU time
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-a014-20230611 (https://download.01.org/0day-ci/archive/20230611/202306112227.m4YhzxSU-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?id=755f1c5eb416be95e2c7401673c4543709dcfad1
        git remote add paulmck-rcu https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
        git fetch --no-tags paulmck-rcu dev.2023.06.08a
        git checkout 755f1c5eb416be95e2c7401673c4543709dcfad1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/rcu/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306112227.m4YhzxSU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/rcuscale.c:301:20: error: use of undeclared identifier 'get_rcu_tasks_gp_kthread'; did you mean 'get_rcu_tasks_trace_gp_kthread'?
           .rso_gp_kthread = get_rcu_tasks_gp_kthread,
                             ^~~~~~~~~~~~~~~~~~~~~~~~
                             get_rcu_tasks_trace_gp_kthread
   include/linux/rcupdate_trace.h:90:21: note: 'get_rcu_tasks_trace_gp_kthread' declared here
   struct task_struct *get_rcu_tasks_trace_gp_kthread(void);
                       ^
   1 error generated.


vim +301 kernel/rcu/rcuscale.c

8704baab9bc848 kernel/rcu/rcuperf.c  Paul E. McKenney 2015-12-31  289  
4e88ec4a9eb175 kernel/rcu/rcuscale.c Paul E. McKenney 2020-08-11  290  static struct rcu_scale_ops tasks_ops = {
8704baab9bc848 kernel/rcu/rcuperf.c  Paul E. McKenney 2015-12-31  291  	.ptype		= RCU_TASKS_FLAVOR,
4e88ec4a9eb175 kernel/rcu/rcuscale.c Paul E. McKenney 2020-08-11  292  	.init		= rcu_sync_scale_init,
4e88ec4a9eb175 kernel/rcu/rcuscale.c Paul E. McKenney 2020-08-11  293  	.readlock	= tasks_scale_read_lock,
4e88ec4a9eb175 kernel/rcu/rcuscale.c Paul E. McKenney 2020-08-11  294  	.readunlock	= tasks_scale_read_unlock,
17ef2fe97c8c8e kernel/rcu/rcuperf.c  Paul E. McKenney 2018-04-27  295  	.get_gp_seq	= rcu_no_completed,
d72193123c81ae kernel/rcu/rcuperf.c  Paul E. McKenney 2018-05-15  296  	.gp_diff	= rcu_seq_diff,
881ed593a323c8 kernel/rcu/rcuperf.c  Paul E. McKenney 2017-04-17  297  	.async		= call_rcu_tasks,
881ed593a323c8 kernel/rcu/rcuperf.c  Paul E. McKenney 2017-04-17  298  	.gp_barrier	= rcu_barrier_tasks,
8704baab9bc848 kernel/rcu/rcuperf.c  Paul E. McKenney 2015-12-31  299  	.sync		= synchronize_rcu_tasks,
8704baab9bc848 kernel/rcu/rcuperf.c  Paul E. McKenney 2015-12-31  300  	.exp_sync	= synchronize_rcu_tasks,
755f1c5eb416be kernel/rcu/rcuscale.c Paul E. McKenney 2023-06-02 @301  	.rso_gp_kthread	= get_rcu_tasks_gp_kthread,
8704baab9bc848 kernel/rcu/rcuperf.c  Paul E. McKenney 2015-12-31  302  	.name		= "tasks"
8704baab9bc848 kernel/rcu/rcuperf.c  Paul E. McKenney 2015-12-31  303  };
8704baab9bc848 kernel/rcu/rcuperf.c  Paul E. McKenney 2015-12-31  304  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
