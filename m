Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A5F5EE85
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 21:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SVSksSC5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701293819; x=1732829819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZcxSij9f2kUgCeQ58Mxtvs9PXxtq/kK5jbFuOMshnhw=;
  b=SVSksSC5wRVmV5JZJOp8oHOR/LQkP+FbJxV7o7QWohLfQu60Pgnklbgw
   qD3JleZXqRPUOcn2KKZs6kgbtMzN/eZSMNRcyTaKTBS6+hvhHCbdt26+3
   6p/oHmPNmEdHaSyY4Cx8eYIqmPpEjz0kxzXzhWOX4z8M7I4rOv8KXN7m2
   crs6/efzlAEwb1QxoPrwBZwqJJ/DwEuXjSM8G224Ca2ms9cAr/7C1nO2N
   DJIZic1J/OKvi08W5uVM/cHphuRpn+T0+FbaJegpEz+SNxqAd4JZcAo4t
   xvtM9E8uMeHwA7kymw1MID0QrHnEnFHKcVYFMhaiQqq4EBo4W2jd7vfqG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="212739"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="212739"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 13:36:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="839568526"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="839568526"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Nov 2023 13:36:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8SEn-0000r5-0p;
	Wed, 29 Nov 2023 21:36:53 +0000
Date: Thu, 30 Nov 2023 05:36:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qais-yousef:uclamp-max-aggregation 10/11]
 kernel/sched/sched.h:2966:30: sparse: sparse: cast to non-scalar
Message-ID: <202311300140.W4ykDUXv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/sched/sched.h:2966:30: sparse: sparse: cast to non-scalar"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Qais Yousef <qyousef@layalina.io>

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   eb0c51750b3bf5ac41d3f628fd05e22a5426a759
commit: 4dba3a34b6fdc129e9aefe934922cab56a7a68d3 [10/11] schedutil: Ignore update requests for short running tasks
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: alpha-randconfig-r133-20231129 (https://download.01.org/0day-ci/archive/20231130/202311300140.W4ykDUXv-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311300140.W4ykDUXv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311300140.W4ykDUXv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1158:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1158:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:1158:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1195:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1195:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1195:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12249:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12249:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12249:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:5854:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5854:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:5854:22: sparse:    struct task_struct *
   kernel/sched/fair.c:7886:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7886:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:7886:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8065:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8065:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8065:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8164:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8164:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8164:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8445:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8445:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8445:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9436:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9436:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9436:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10073:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10073:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10073:22: sparse:    struct task_struct *
   kernel/sched/fair.c:11509:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11509:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11509:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11166:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11166:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11166:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11605:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11605:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11605:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/fair.c: note: in included file:
>> kernel/sched/sched.h:2966:30: sparse: sparse: cast to non-scalar
>> kernel/sched/sched.h:2966:30: sparse: sparse: cast from non-scalar
   kernel/sched/fair.c:6605:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6605:44: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:6605:44: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/sched.h:2966:30: sparse: sparse: cast to non-scalar
>> kernel/sched/sched.h:2966:30: sparse: sparse: cast from non-scalar
>> kernel/sched/sched.h:2966:30: sparse: sparse: cast to non-scalar
>> kernel/sched/sched.h:2966:30: sparse: sparse: cast from non-scalar
>> kernel/sched/sched.h:2966:30: sparse: sparse: cast to non-scalar
>> kernel/sched/sched.h:2966:30: sparse: sparse: cast from non-scalar
>> kernel/sched/sched.h:2966:30: sparse: sparse: cast to non-scalar
>> kernel/sched/sched.h:2966:30: sparse: sparse: cast from non-scalar
>> kernel/sched/sched.h:2966:30: sparse: sparse: cast to non-scalar
>> kernel/sched/sched.h:2966:30: sparse: sparse: cast from non-scalar
>> kernel/sched/sched.h:2966:30: sparse: sparse: cast to non-scalar
>> kernel/sched/sched.h:2966:30: sparse: sparse: cast from non-scalar
>> kernel/sched/sched.h:2966:30: sparse: sparse: cast to non-scalar
>> kernel/sched/sched.h:2966:30: sparse: sparse: cast from non-scalar
   kernel/sched/fair.c:7125:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7125:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7125:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7131:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7131:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7131:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7138:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7138:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7138:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7146:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7146:17: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:7146:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/sched.h:2259:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2259:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2259:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2091:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2091:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2091:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2091:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2091:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2091:25: sparse:    struct task_struct *

vim +2966 kernel/sched/sched.h

4dba3a34b6fdc1 Qais Yousef 2023-11-26  2963  
4dba3a34b6fdc1 Qais Yousef 2023-11-26  2964  static inline unsigned long _task_util_est(struct task_struct *p)
4dba3a34b6fdc1 Qais Yousef 2023-11-26  2965  {
4dba3a34b6fdc1 Qais Yousef 2023-11-26 @2966  	struct util_est ue = READ_ONCE(p->se.avg.util_est);
4dba3a34b6fdc1 Qais Yousef 2023-11-26  2967  
4dba3a34b6fdc1 Qais Yousef 2023-11-26  2968  	return max(ue.ewma, (ue.enqueued & ~UTIL_AVG_UNCHANGED));
4dba3a34b6fdc1 Qais Yousef 2023-11-26  2969  }
4dba3a34b6fdc1 Qais Yousef 2023-11-26  2970  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
