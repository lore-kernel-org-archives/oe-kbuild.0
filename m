Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ACB1C75F
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jun 2023 15:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686585056; x=1718121056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FJ6scPUQ6lH8SXywlsTbE77lpa1RUS0MbsOWjmBNDSA=;
  b=gZu2PqbqiHzOlFgBpx0tZwWOxhUQQUUlI8WFTIMoX511tQb1k+eM55w8
   qKvars7DojJSelU+ZZwdFlTNdW3y7mtesAlbkw45pS5roWIHnoR8M5uYq
   PcBEeFgDtWJcX0zOlEYGOulzTcsvbFNh06l+GgY2DVXWXrow8+wQ1RMSQ
   Zi9H53sG8/rjMHj5n50gRHxhDm6nvcJIZ87LicLNCwtlL4h6mh3tNOnUX
   D6LNluyS+kWKNpu+9Ui0VmTO6e0I5PF0N85WI2/HB5iQn4CktcH/Lw6av
   cEwP4S5DWmAOW5Jk7jAyHSOh3SsZ9Fk2neYDMLR8al06NqA47E1HCIn/3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="358078810"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="358078810"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 08:50:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="801065644"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="801065644"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2023 08:50:52 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8joh-0000NY-1c;
	Mon, 12 Jun 2023 15:50:51 +0000
Date: Mon, 12 Jun 2023 23:50:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [paulmck-rcu:dev.2023.06.08a 27/40] kernel/rcu/tasks.h:1271:21:
 warning: no previous prototype for function 'get_rcu_tasks_rude_gp_kthread'
Message-ID: <202306122300.WS98uJyn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "commit 88d7ff818f0ce90945d6bb4c84c446f5f13d0faa was found in branch paulmck-rcu/dev.2023.06.08a, not in new branch paulmck-rcu/dev.2023.06.09a"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.06.08a
head:   0bf38cfa30b818fefa8b44615cb4f1659af201bb
commit: 88d7ff818f0ce90945d6bb4c84c446f5f13d0faa [27/40] rcuscale: Add RCU Tasks Rude testing
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-r035-20230612 (https://download.01.org/0day-ci/archive/20230612/202306122300.WS98uJyn-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?id=88d7ff818f0ce90945d6bb4c84c446f5f13d0faa
        git remote add paulmck-rcu https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
        git fetch --no-tags paulmck-rcu dev.2023.06.08a
        git checkout 88d7ff818f0ce90945d6bb4c84c446f5f13d0faa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/ lib/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306122300.WS98uJyn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rcu/update.c:649:
>> kernel/rcu/tasks.h:1271:21: warning: no previous prototype for function 'get_rcu_tasks_rude_gp_kthread' [-Wmissing-prototypes]
    1271 | struct task_struct *get_rcu_tasks_rude_gp_kthread(void)
         |                     ^
   kernel/rcu/tasks.h:1271:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1271 | struct task_struct *get_rcu_tasks_rude_gp_kthread(void)
         | ^
         | static 
   1 warning generated.


vim +/get_rcu_tasks_rude_gp_kthread +1271 kernel/rcu/tasks.h

88d7ff818f0ce9 Paul E. McKenney 2023-06-03  1270  
88d7ff818f0ce9 Paul E. McKenney 2023-06-03 @1271  struct task_struct *get_rcu_tasks_rude_gp_kthread(void)
88d7ff818f0ce9 Paul E. McKenney 2023-06-03  1272  {
88d7ff818f0ce9 Paul E. McKenney 2023-06-03  1273  	return rcu_tasks_rude.kthread_ptr;
88d7ff818f0ce9 Paul E. McKenney 2023-06-03  1274  }
88d7ff818f0ce9 Paul E. McKenney 2023-06-03  1275  EXPORT_SYMBOL_GPL(get_rcu_tasks_rude_gp_kthread);
88d7ff818f0ce9 Paul E. McKenney 2023-06-03  1276  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
