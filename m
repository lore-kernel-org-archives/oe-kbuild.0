Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360A517C5
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Feb 2023 04:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675570570; x=1707106570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZdR9o1K/XgmeKSQxImpi3axESnBJwLYXpGA4QH3JWoQ=;
  b=ZXmTZUlM1DIas512Stqn+8bj8fY1lcpg6YtXVOmzcYlDRUtJ7j+uBHol
   oyfDMsAy0UKt6q2ffQP+ThYPGdvzkuVuPqxYRgU53LyQ1fcssKpNnqLSq
   /KWApJZiTcEa6COG4syUDysTY3l5hqjvIbKJPTRYxV8kSyNLK9KYuwVrE
   RWI6FI9SCFg/gQ7wn6d+ccE7XTw/YaT0hZ60usTKNWN5OmzzD8M1lmfzi
   Z+9rUx3WJB/CvJOkEwR/kTVYaho1dL5f06Ecmfpes4wMTXw/t1wSNRR3Z
   HG4HYGoRrLaT3wlyF2/qFLDIIMTr2F0AMhXjmzbvibC9M8gQOHvD/4pNo
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="308656043"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="308656043"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 20:16:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="616111498"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="616111498"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 Feb 2023 20:16:08 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOWRj-0001je-1p;
	Sun, 05 Feb 2023 04:16:07 +0000
Date: Sun, 5 Feb 2023 12:15:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [paulmck-rcu:dev.2023.01.24a 66/81]
 arch/powerpc/kernel/smp.c:1768:1: error: function declared 'noreturn' should
 not return
Message-ID: <202302051202.byEHNyPh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "commit 6002817348a1c610dc1b1c01ff81654cdec12be4 was found in branch paulmck-rcu/dev.2023.01.24a, not in new branch paulmck-rcu/dev.2023.02.03a"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.01.24a
head:   c722c164d799860f1a31c82e001221df13dccede
commit: 6002817348a1c610dc1b1c01ff81654cdec12be4 [66/81] objtool: Fix for unreachable instruction warning
:::::: branch date: 28 hours ago
:::::: commit date: 4 days ago
config: powerpc-randconfig-r016-20230205 (https://download.01.org/0day-ci/archive/20230205/202302051202.byEHNyPh-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?id=6002817348a1c610dc1b1c01ff81654cdec12be4
        git remote add paulmck-rcu https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
        git fetch --no-tags paulmck-rcu dev.2023.01.24a
        git checkout 6002817348a1c610dc1b1c01ff81654cdec12be4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
