Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC698C0D
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Apr 2023 13:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681220178; x=1712756178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uynqi4/lj2qqFXgLtHhn45x4CD7QqvjN60lEjH3ytRU=;
  b=Cgbg2mp9g04X+YiuSxdrpVEJ3MiL6+LZ1afKbi0DvVZJDVIdgV8QGWZC
   CL9q5x7GiljLfrNGa9rRq3EhrPK5OZLGf2RxNbw1C1puZEt9zT5lwwa60
   SpbbcrnbyX9AJfg4Lfdk/j6VIpCksu3e2Raasj2vmXVjp9dywg3rQQWaT
   F3TFEEHfG6hJvWNbU4xvJpQE8fqpgIlNPGxENtUV87qe1O2hWH8LiyE0Q
   iRh/zfkSVfsU6QYsqJuvwLuW+XFX/IQrujKOyEHWWWVtIJbL21/SiKUCu
   qrRS37C305fboyofLWBDV7LG4vEh37HFQc0ewoH+7eyoIqJhF50Qt6yMq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="327715214"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="327715214"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 06:36:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="638825323"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="638825323"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Apr 2023 06:36:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmEAN-000WL1-07;
	Tue, 11 Apr 2023 13:36:11 +0000
Date: Tue, 11 Apr 2023 21:36:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/sched/fair.c:4049:30: sparse: sparse: cast to non-scalar
Message-ID: <202304112117.6ljCPug7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/sched/fair.c:4049:30: sparse: sparse: cast to non-scalar"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Chengming Zhou <zhouchengming@bytedance.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Vincent Guittot <vincent.guittot@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0d3eb744aed40ffce820cded61d7eac515199165
commit: 51bf903b64bdde4e4c9009a9e2b4a589845d9d81 sched/fair: Optimize and simplify rq leaf_cfs_rq_list
date:   10 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 10 months ago
config: alpha-randconfig-s032-20230411 (https://download.01.org/0day-ci/archive/20230411/202304112117.6ljCPug7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=51bf903b64bdde4e4c9009a9e2b4a589845d9d81
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 51bf903b64bdde4e4c9009a9e2b4a589845d9d81
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304112117.6ljCPug7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:930:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:930:34: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:930:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:10918:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:10918:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:10918:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:5083:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5083:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:5083:22: sparse:    struct task_struct *
   kernel/sched/fair.c:6770:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:6770:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:6770:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6904:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:6904:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:6904:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7102:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7102:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:7102:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:7400:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7400:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:7400:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8385:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:8385:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:8385:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:8929:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:8929:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:8929:22: sparse:    struct task_struct *
   kernel/sched/fair.c:10193:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:10193:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:10193:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:9853:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9853:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:9853:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:10289:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:10289:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:10289:9: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast to non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast from non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast to non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast from non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast to non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast from non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast to non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast from non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast to non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast from non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast to non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast from non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast to non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast from non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast to non-scalar
>> kernel/sched/fair.c:4049:30: sparse: sparse: cast from non-scalar
   kernel/sched/fair.c:6155:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:6155:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:6155:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:6161:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:6161:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:6161:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:6168:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:6168:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:6168:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:6176:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:6176:17: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:6176:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2171:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2171:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2171:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2013:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2013:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2013:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2013:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2013:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2013:25: sparse:    struct task_struct *

vim +4049 kernel/sched/fair.c

7f65ea42eb00bc Patrick Bellasi  2018-03-09  4046  
7f65ea42eb00bc Patrick Bellasi  2018-03-09  4047  static inline unsigned long _task_util_est(struct task_struct *p)
7f65ea42eb00bc Patrick Bellasi  2018-03-09  4048  {
7f65ea42eb00bc Patrick Bellasi  2018-03-09 @4049  	struct util_est ue = READ_ONCE(p->se.avg.util_est);
7f65ea42eb00bc Patrick Bellasi  2018-03-09  4050  
68d7a190682aa4 Dietmar Eggemann 2021-06-02  4051  	return max(ue.ewma, (ue.enqueued & ~UTIL_AVG_UNCHANGED));
7f65ea42eb00bc Patrick Bellasi  2018-03-09  4052  }
7f65ea42eb00bc Patrick Bellasi  2018-03-09  4053  

:::::: The code at line 4049 was first introduced by commit
:::::: 7f65ea42eb00bc902f1c37a71e984e4f4064cfa9 sched/fair: Add util_est on top of PELT

:::::: TO: Patrick Bellasi <patrick.bellasi@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
