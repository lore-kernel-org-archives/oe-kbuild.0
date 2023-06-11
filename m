Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4165EEA8
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jun 2023 22:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686523700; x=1718059700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xKPv5/PrtVGVoOt7DSQOyqRpw08DLBmYjORv+1Drslw=;
  b=CBh/lg5Fl/j77JsREpw2nrxHH92teFeJqoyox1xlMq6GaCsWKzasuq1A
   p+m4krUNDRzC4kiwfOD/KggrPJy5FmIMP562uo2QStJtdQIBgn0ZMGjsQ
   8Ak1Ln0qY8f0uu00nVebA/frXSSizctkxLTuf444Ri7a/uzPEFfE34IjD
   X1boVCI25Bfgfqa576L6ksXgNrr1PR0VglL/gLXM+2+uLHXOpV8kOzuA9
   8qgoNJdzvvLNorjuml0gaMVsBHIow4IcS57rCCCUh4b+R7R8nXLSwndPQ
   7Mw9w7h8e0dwr5mp4R/xFz/x3xnyPf1Y6dhxm3f1Rjdwynufb1fPtqdXA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="338269439"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; 
   d="scan'208";a="338269439"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2023 15:48:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="740784716"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; 
   d="scan'208";a="740784716"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Jun 2023 15:48:17 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8Tr7-000B8e-0X;
	Sun, 11 Jun 2023 22:48:17 +0000
Date: Mon, 12 Jun 2023 06:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [paulmck-rcu:dev.2023.06.08a 26/40] kernel/rcu/rcuscale.c:301:27:
 error: 'get_rcu_tasks_gp_kthread' undeclared here (not in a function); did
 you mean 'show_rcu_tasks_rude_gp_kthread'?
Message-ID: <202306120626.eGSc14tJ-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: m68k-randconfig-r035-20230612 (https://download.01.org/0day-ci/archive/20230612/202306120626.eGSc14tJ-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash kernel/rcu/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306120626.eGSc14tJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/rcuscale.c:301:27: error: 'get_rcu_tasks_gp_kthread' undeclared here (not in a function); did you mean 'show_rcu_tasks_rude_gp_kthread'?
     301 |         .rso_gp_kthread = get_rcu_tasks_gp_kthread,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                           show_rcu_tasks_rude_gp_kthread


vim +301 kernel/rcu/rcuscale.c

8704baab9bc848b kernel/rcu/rcuperf.c  Paul E. McKenney 2015-12-31  289  
4e88ec4a9eb1752 kernel/rcu/rcuscale.c Paul E. McKenney 2020-08-11  290  static struct rcu_scale_ops tasks_ops = {
8704baab9bc848b kernel/rcu/rcuperf.c  Paul E. McKenney 2015-12-31  291  	.ptype		= RCU_TASKS_FLAVOR,
4e88ec4a9eb1752 kernel/rcu/rcuscale.c Paul E. McKenney 2020-08-11  292  	.init		= rcu_sync_scale_init,
4e88ec4a9eb1752 kernel/rcu/rcuscale.c Paul E. McKenney 2020-08-11  293  	.readlock	= tasks_scale_read_lock,
4e88ec4a9eb1752 kernel/rcu/rcuscale.c Paul E. McKenney 2020-08-11  294  	.readunlock	= tasks_scale_read_unlock,
17ef2fe97c8c8e7 kernel/rcu/rcuperf.c  Paul E. McKenney 2018-04-27  295  	.get_gp_seq	= rcu_no_completed,
d72193123c81ae6 kernel/rcu/rcuperf.c  Paul E. McKenney 2018-05-15  296  	.gp_diff	= rcu_seq_diff,
881ed593a323c83 kernel/rcu/rcuperf.c  Paul E. McKenney 2017-04-17  297  	.async		= call_rcu_tasks,
881ed593a323c83 kernel/rcu/rcuperf.c  Paul E. McKenney 2017-04-17  298  	.gp_barrier	= rcu_barrier_tasks,
8704baab9bc848b kernel/rcu/rcuperf.c  Paul E. McKenney 2015-12-31  299  	.sync		= synchronize_rcu_tasks,
8704baab9bc848b kernel/rcu/rcuperf.c  Paul E. McKenney 2015-12-31  300  	.exp_sync	= synchronize_rcu_tasks,
755f1c5eb416be9 kernel/rcu/rcuscale.c Paul E. McKenney 2023-06-02 @301  	.rso_gp_kthread	= get_rcu_tasks_gp_kthread,
8704baab9bc848b kernel/rcu/rcuperf.c  Paul E. McKenney 2015-12-31  302  	.name		= "tasks"
8704baab9bc848b kernel/rcu/rcuperf.c  Paul E. McKenney 2015-12-31  303  };
8704baab9bc848b kernel/rcu/rcuperf.c  Paul E. McKenney 2015-12-31  304  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
