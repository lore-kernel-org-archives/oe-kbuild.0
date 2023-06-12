Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD4A1F18A
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jun 2023 16:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686587116; x=1718123116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uLq1HBA1nHLWLqZAPaHONxyCFVqlWXBrzzNJLa2/l6k=;
  b=i5rJVBaJK9Q4ZZstg89aiSw8uxWJsFa7UDc5SAVrtDc1vsd8OKltkoG1
   GIBwj3cMt2r1QzX6kYBLI9qXWysh58oXcC+Pdw+UemTTpGupVyxj5H4MK
   iirm15McodXnsIOGiWcjta/wvw77xtSeT6diLhKZqebDn+ug+O+vsrYrn
   rw1U003Hc0rNNo1Hp6eXVb8sZC9BocMqlzeG0Myn8iXpV8FsVMPACTgiW
   LDeVnipDH3gN/p86yy3mtXpqZHQ1Sq3d/jvtWvVEIbC/kw3SbZo7BaSyA
   IxQxAk9YoGYa92ouxc5/bcjdH5/iJ5VAoMMR+2BhWDrLD2FTT1oWm+V0R
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="337727572"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="337727572"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 09:25:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="801077168"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="801077168"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2023 09:25:14 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8kLy-0000QP-00;
	Mon, 12 Jun 2023 16:25:14 +0000
Date: Tue, 13 Jun 2023 00:23:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [paulmck-rcu:dev.2023.06.08a 26/40] kernel/rcu/rcuscale.c:301:27:
 error: 'get_rcu_tasks_gp_kthread' undeclared here (not in a function); did
 you mean 'get_rcu_tasks_trace_gp_kthread'?
Message-ID: <202306130017.zobg8dFX-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.06.08a
head:   0bf38cfa30b818fefa8b44615cb4f1659af201bb
commit: 755f1c5eb416be95e2c7401673c4543709dcfad1 [26/40] rcuscale: Measure RCU Tasks Trace grace-period kthread CPU time
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230613/202306130017.zobg8dFX-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash kernel/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306130017.zobg8dFX-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/rcu/rcuscale.c:301:27: error: 'get_rcu_tasks_gp_kthread' undeclared here (not in a function); did you mean 'get_rcu_tasks_trace_gp_kthread'?
     301 |         .rso_gp_kthread = get_rcu_tasks_gp_kthread,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                           get_rcu_tasks_trace_gp_kthread
--
   In file included from kernel/rcu/update.c:649:
>> kernel/rcu/tasks.h:1113:21: warning: no previous prototype for 'get_rcu_tasks_gp_kthread' [-Wmissing-prototypes]
    1113 | struct task_struct *get_rcu_tasks_gp_kthread(void)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~


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
