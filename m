Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6201817E
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Mar 2023 04:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679633281; x=1711169281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=px77PHdX9dWyhUWatu3fK/gYgUj/9IPM96s0Xt5GSkg=;
  b=nFQF56UQPjRBvyXp998VsckLC+W3y3bynjf7muyo+FpZend23utOogAq
   e2s9vd+ne72j1SeAm2MqtCxt+SvCEmgGkPoZ9wSpV73UKLxHkf4+x3NoC
   KdBJvQUp/Iasb7EVaAhN8V6kgE+cDLpfX3u2Cf4ZbEp9BYF1fdmvEKiPu
   O+tYh+rQh1MrevuxgFETSiZOjyFZJLKeL+oXN72+Qn7XuBtkYFdNCQ+tT
   pZLv8mgMzQtb/+YXH5iCIQAuOdwX42teXhvLdK9zR/eyA7zjVHgUlgRRG
   /ftycTbQWh++CUpMFteGLOVWKL1Vg7LEc6ciADSqMslWAmFEK2yI1G6ZS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="367433001"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="367433001"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 21:48:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="747012983"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="747012983"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2023 21:47:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfZLK-000EzA-2x;
	Fri, 24 Mar 2023 04:47:58 +0000
Date: Fri, 24 Mar 2023 12:47:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [paulmck-rcu:dev.2023.03.22a 43/47]
 arch/powerpc/kernel/smp.c:1768:1: error: function declared 'noreturn' should
 not return
Message-ID: <202303241201.H2rdbmmr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "commit 8e17542eb704270e146f79dfe2a4cacc48fe334e was found in branch paulmck-rcu/dev.2023.03.22a, not in new branch paulmck-rcu/dev.2023.03.22b"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.03.22a
head:   6c104ef06e7fcd7a66237e2ffbac435e00503eed
commit: 8e17542eb704270e146f79dfe2a4cacc48fe334e [43/47] objtool: Fix for unreachable instruction warning
:::::: branch date: 10 hours ago
:::::: commit date: 32 hours ago
config: powerpc-randconfig-r011-20230323 (https://download.01.org/0day-ci/archive/20230324/202303241201.H2rdbmmr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?id=8e17542eb704270e146f79dfe2a4cacc48fe334e
        git remote add paulmck-rcu https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
        git fetch --no-tags paulmck-rcu dev.2023.03.22a
        git checkout 8e17542eb704270e146f79dfe2a4cacc48fe334e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303241201.H2rdbmmr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/smp.c:1768:1: error: function declared 'noreturn' should not return [-Werror,-Winvalid-noreturn]
   }
   ^
   1 error generated.


vim +/noreturn +1768 arch/powerpc/kernel/smp.c

d0174c721900ff Nathan Fontenot        2010-01-14  1754  
1ea21ba231f248 Michael Ellerman       2020-08-19  1755  void arch_cpu_idle_dead(void)
1ea21ba231f248 Michael Ellerman       2020-08-19  1756  {
424ef0160f439f Naveen N. Rao          2018-04-19  1757  	/*
424ef0160f439f Naveen N. Rao          2018-04-19  1758  	 * Disable on the down path. This will be re-enabled by
424ef0160f439f Naveen N. Rao          2018-04-19  1759  	 * start_secondary() via start_secondary_resume() below
424ef0160f439f Naveen N. Rao          2018-04-19  1760  	 */
424ef0160f439f Naveen N. Rao          2018-04-19  1761  	this_cpu_disable_ftrace();
424ef0160f439f Naveen N. Rao          2018-04-19  1762  
39f87561454dc3 Michael Ellerman       2020-08-19  1763  	if (smp_ops->cpu_offline_self)
39f87561454dc3 Michael Ellerman       2020-08-19  1764  		smp_ops->cpu_offline_self();
fa3f82c8bb7acb Benjamin Herrenschmidt 2011-02-10  1765  
fa3f82c8bb7acb Benjamin Herrenschmidt 2011-02-10  1766  	/* If we return, we re-enter start_secondary */
fa3f82c8bb7acb Benjamin Herrenschmidt 2011-02-10  1767  	start_secondary_resume();
abb17f9c3a92c5 Milton Miller          2010-05-19 @1768  }
fa3f82c8bb7acb Benjamin Herrenschmidt 2011-02-10  1769  

:::::: The code at line 1768 was first introduced by commit
:::::: abb17f9c3a92c5acf30e749efdf0419b7f50a5b8 powerpc: Use common cpu_die (fixes SMP+SUSPEND build)

:::::: TO: Milton Miller <miltonm@bga.com>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
