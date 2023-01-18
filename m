Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D0D7B
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 16:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674060009; x=1705596009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O8UuiyD0LEJohljM7WGANjM/0E0xrlpiaNcav8lGMaM=;
  b=RX0zvzdtfgx/IcABVZizHWuPLpHiWMaCUjSC0sNltbFiO/Meloxdhtb1
   6RT1iFbRG4gnEHRR+bpDA1/qPXwsTpA/4vFmTkdEbqWEbVPhfVVUVNK2q
   v2NPmQDI2XDVebI0SD6ThA+qSeppoGL5oIvwy44G92mV3tfbJ3UyxrKSh
   0HwnsPo+p44rBwUu02S6lzBtMcESqbuS41KEmHXaCH14NGH3SoZrw+8eL
   Zwx2wnxoTtctBRu8SYfYs2B9hWJZikX6jDftWhXmfqJAQXp+ph+XcchYn
   S5lTbnoSWQ2LgmJdzTrt373XTeEHqapUqVm44ZNL0qW74WMF7tARTrvAL
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="308589358"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="308589358"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 08:39:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="783741421"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="783741421"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Jan 2023 08:39:56 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIBTg-0000WQ-0n;
	Wed, 18 Jan 2023 16:39:56 +0000
Date: Thu, 19 Jan 2023 00:39:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/sched/fair.c:4049:30: sparse: sparse: cast to non-scalar
Message-ID: <202301190052.5Ewnb3sN-lkp@intel.com>
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
head:   c1649ec55708ae42091a2f1bca1ab49ecd722d55
commit: 51bf903b64bdde4e4c9009a9e2b4a589845d9d81 sched/fair: Optimize and simplify rq leaf_cfs_rq_list
date:   7 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 7 months ago
config: alpha-randconfig-s051-20230118 (https://download.01.org/0day-ci/archive/20230119/202301190052.5Ewnb3sN-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash kernel/sched/ mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
