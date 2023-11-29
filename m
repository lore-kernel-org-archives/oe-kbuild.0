Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051B063D6
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 10:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSK+Wvwz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701254707; x=1732790707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=23XW7bg7koFbQS7h57+CTITBaIT8y5NLa2zjWpOPkmc=;
  b=BSK+WvwzBCLg8GX9cXqIc12QdKpP8Y+Hsrj6uY00OY4stthMldUtjC/e
   BNLIukVHGLHC7/CdoRCWuYh+ya9CD4GEhRE2bNs4JJpfK9kMG5spmQrIm
   Vz4okwLxakc2LT4wTjGt7TVyI0fI1ipj9ohkqGtZlZ/b9bA45MRgZmoZH
   XP0Yml8UpiN45Y1olp8mYxvaEfAjEh/rZsdpaGc+CA6hyewDoCBKQjMSz
   WWSH0O1qSyN8+SjtfYeFowBlDd+5DcmvD3tgphGVivUUJMe/pjFUBCmOU
   g9Dmu3H33Qa9sR97DXQNvz8G7F7DorlJyxMxPwQ+rFlucoV4hbnQw26eO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="29534"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="29534"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 02:45:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="834969718"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="834969718"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Nov 2023 02:45:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8I3x-00006M-0k;
	Wed, 29 Nov 2023 10:45:01 +0000
Date: Wed, 29 Nov 2023 18:44:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/power/suspend.c:92:54: sparse: sparse: incorrect type in
 argument 2 (different base types)
Message-ID: <202311291609.v7chEWfl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Song Shuai <songshuaishuai@tinylab.org>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Andrew Jones <ajones@ventanamicro.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   18d46e76d7c2eedd8577fae67e3f1d4db25018b0
commit: c1f048a6bd7d7cb42e9bfd79eff85b33894997fe riscv: Enable ARCH_SUSPEND_POSSIBLE for s2idle
date:   5 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 months ago
config: riscv-buildonly-randconfig-r006-20230429 (https://download.01.org/0day-ci/archive/20231129/202311291609.v7chEWfl-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231129/202311291609.v7chEWfl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311291609.v7chEWfl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
>> kernel/power/suspend.c:92:54: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int val @@     got restricted suspend_state_t [usertype] @@
   kernel/power/suspend.c:92:54: sparse:     expected int val
   kernel/power/suspend.c:92:54: sparse:     got restricted suspend_state_t [usertype]
   kernel/power/suspend.c:117:54: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int val @@     got restricted suspend_state_t [usertype] @@
   kernel/power/suspend.c:117:54: sparse:     expected int val
   kernel/power/suspend.c:117:54: sparse:     got restricted suspend_state_t [usertype]
>> kernel/power/suspend.c:178:19: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:178:47: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:179:19: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:179:51: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:184:26: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:184:65: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:191:42: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:191:51: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:192:38: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:193:51: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:191:72: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:215:34: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:215:73: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:216:27: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:216:59: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:221:34: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:221:69: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:222:21: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:222:42: sparse: sparse: restricted suspend_state_t degrades to integer
>> kernel/power/suspend.c:445:33: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int val @@     got restricted suspend_state_t [usertype] state @@
   kernel/power/suspend.c:445:33: sparse:     expected int val
   kernel/power/suspend.c:445:33: sparse:     got restricted suspend_state_t [usertype] state
   kernel/power/suspend.c:448:33: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int val @@     got restricted suspend_state_t [usertype] state @@
   kernel/power/suspend.c:448:33: sparse:     expected int val
   kernel/power/suspend.c:448:33: sparse:     got restricted suspend_state_t [usertype] state
   kernel/power/suspend.c:518:53: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int val @@     got restricted suspend_state_t [usertype] state @@
   kernel/power/suspend.c:518:53: sparse:     expected int val
   kernel/power/suspend.c:518:53: sparse:     got restricted suspend_state_t [usertype] state
   kernel/power/suspend.c:520:53: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int val @@     got restricted suspend_state_t [usertype] state @@
   kernel/power/suspend.c:520:53: sparse:     expected int val
   kernel/power/suspend.c:520:53: sparse:     got restricted suspend_state_t [usertype] state
   kernel/power/suspend.c:557:52: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int val @@     got restricted suspend_state_t [usertype] state @@
   kernel/power/suspend.c:557:52: sparse:     expected int val
   kernel/power/suspend.c:557:52: sparse:     got restricted suspend_state_t [usertype] state
   kernel/power/suspend.c:580:9: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:580:9: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:589:52: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int val @@     got restricted suspend_state_t [usertype] state @@
   kernel/power/suspend.c:589:52: sparse:     expected int val
   kernel/power/suspend.c:589:52: sparse:     got restricted suspend_state_t [usertype] state
   kernel/power/suspend.c:590:9: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:590:9: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:615:13: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:615:22: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:615:39: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:615:48: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:618:9: sparse: sparse: restricted suspend_state_t degrades to integer

vim +92 kernel/power/suspend.c

7e73c5ae6e7991 Zhang Rui                 2013-02-06   89  
f02f4f9d826590 Rafael J. Wysocki         2017-08-10   90  static void s2idle_enter(void)
7e73c5ae6e7991 Zhang Rui                 2013-02-06   91  {
690cbb90a709c1 Rafael J. Wysocki         2017-08-10  @92  	trace_suspend_resume(TPS("machine_suspend"), PM_SUSPEND_TO_IDLE, true);
33e4f80ee69b51 Rafael J. Wysocki         2017-06-12   93  
62fc00a6611a00 Sebastian Andrzej Siewior 2018-05-25   94  	raw_spin_lock_irq(&s2idle_lock);
3810631332465d Rafael J. Wysocki         2015-02-12   95  	if (pm_wakeup_pending())
3810631332465d Rafael J. Wysocki         2015-02-12   96  		goto out;
3810631332465d Rafael J. Wysocki         2015-02-12   97  
f02f4f9d826590 Rafael J. Wysocki         2017-08-10   98  	s2idle_state = S2IDLE_STATE_ENTER;
62fc00a6611a00 Sebastian Andrzej Siewior 2018-05-25   99  	raw_spin_unlock_irq(&s2idle_lock);
3810631332465d Rafael J. Wysocki         2015-02-12  100  
d2c8cce647f302 Sebastian Andrzej Siewior 2021-08-03  101  	cpus_read_lock();
3810631332465d Rafael J. Wysocki         2015-02-12  102  
3810631332465d Rafael J. Wysocki         2015-02-12  103  	/* Push all the CPUs into the idle loop. */
3810631332465d Rafael J. Wysocki         2015-02-12  104  	wake_up_all_idle_cpus();
3810631332465d Rafael J. Wysocki         2015-02-12  105  	/* Make the current CPU wait so it can enter the idle loop too. */
b3dae109fa89d6 Peter Zijlstra            2018-06-12  106  	swait_event_exclusive(s2idle_wait_head,
f02f4f9d826590 Rafael J. Wysocki         2017-08-10  107  		    s2idle_state == S2IDLE_STATE_WAKE);
3810631332465d Rafael J. Wysocki         2015-02-12  108  
d2c8cce647f302 Sebastian Andrzej Siewior 2021-08-03  109  	cpus_read_unlock();
3810631332465d Rafael J. Wysocki         2015-02-12  110  
62fc00a6611a00 Sebastian Andrzej Siewior 2018-05-25  111  	raw_spin_lock_irq(&s2idle_lock);
3810631332465d Rafael J. Wysocki         2015-02-12  112  
3810631332465d Rafael J. Wysocki         2015-02-12  113   out:
f02f4f9d826590 Rafael J. Wysocki         2017-08-10  114  	s2idle_state = S2IDLE_STATE_NONE;
62fc00a6611a00 Sebastian Andrzej Siewior 2018-05-25  115  	raw_spin_unlock_irq(&s2idle_lock);
33e4f80ee69b51 Rafael J. Wysocki         2017-06-12  116  
690cbb90a709c1 Rafael J. Wysocki         2017-08-10  117  	trace_suspend_resume(TPS("machine_suspend"), PM_SUSPEND_TO_IDLE, false);
33e4f80ee69b51 Rafael J. Wysocki         2017-06-12  118  }
33e4f80ee69b51 Rafael J. Wysocki         2017-06-12  119  
33e4f80ee69b51 Rafael J. Wysocki         2017-06-12  120  static void s2idle_loop(void)
33e4f80ee69b51 Rafael J. Wysocki         2017-06-12  121  {
56b991849009f5 Rafael J. Wysocki         2019-07-15  122  	pm_pr_dbg("suspend-to-idle\n");
9a3ebe3523cc82 Rafael J. Wysocki         2017-07-21  123  
8e6bcd9f7eac47 Rafael J. Wysocki         2017-07-21  124  	/*
56b991849009f5 Rafael J. Wysocki         2019-07-15  125  	 * Suspend-to-idle equals:
8e6bcd9f7eac47 Rafael J. Wysocki         2017-07-21  126  	 * frozen processes + suspended devices + idle processors.
56b991849009f5 Rafael J. Wysocki         2019-07-15  127  	 * Thus s2idle_enter() should be called right after all devices have
56b991849009f5 Rafael J. Wysocki         2019-07-15  128  	 * been suspended.
87cbde8d9081b9 Rafael J. Wysocki         2017-09-28  129  	 *
56b991849009f5 Rafael J. Wysocki         2019-07-15  130  	 * Wakeups during the noirq suspend of devices may be spurious, so try
56b991849009f5 Rafael J. Wysocki         2019-07-15  131  	 * to avoid them upfront.
8e6bcd9f7eac47 Rafael J. Wysocki         2017-07-21  132  	 */
56b991849009f5 Rafael J. Wysocki         2019-07-15  133  	for (;;) {
e3728b50cd9be7 Rafael J. Wysocki         2020-02-11  134  		if (s2idle_ops && s2idle_ops->wake) {
e3728b50cd9be7 Rafael J. Wysocki         2020-02-11  135  			if (s2idle_ops->wake())
33e4f80ee69b51 Rafael J. Wysocki         2017-06-12  136  				break;
e3728b50cd9be7 Rafael J. Wysocki         2020-02-11  137  		} else if (pm_wakeup_pending()) {
e3728b50cd9be7 Rafael J. Wysocki         2020-02-11  138  			break;
e3728b50cd9be7 Rafael J. Wysocki         2020-02-11  139  		}
33e4f80ee69b51 Rafael J. Wysocki         2017-06-12  140  
811d59fdf56a17 Mario Limonciello         2022-08-29  141  		if (s2idle_ops && s2idle_ops->check)
811d59fdf56a17 Mario Limonciello         2022-08-29  142  			s2idle_ops->check();
811d59fdf56a17 Mario Limonciello         2022-08-29  143  
56b991849009f5 Rafael J. Wysocki         2019-07-15  144  		s2idle_enter();
8e6bcd9f7eac47 Rafael J. Wysocki         2017-07-21  145  	}
33e4f80ee69b51 Rafael J. Wysocki         2017-06-12  146  
8d8b2441db9647 Rafael J. Wysocki         2017-07-19  147  	pm_pr_dbg("resume from suspend-to-idle\n");
7e73c5ae6e7991 Zhang Rui                 2013-02-06  148  }
7e73c5ae6e7991 Zhang Rui                 2013-02-06  149  
f02f4f9d826590 Rafael J. Wysocki         2017-08-10  150  void s2idle_wake(void)
7e73c5ae6e7991 Zhang Rui                 2013-02-06  151  {
3810631332465d Rafael J. Wysocki         2015-02-12  152  	unsigned long flags;
3810631332465d Rafael J. Wysocki         2015-02-12  153  
62fc00a6611a00 Sebastian Andrzej Siewior 2018-05-25  154  	raw_spin_lock_irqsave(&s2idle_lock, flags);
f02f4f9d826590 Rafael J. Wysocki         2017-08-10  155  	if (s2idle_state > S2IDLE_STATE_NONE) {
f02f4f9d826590 Rafael J. Wysocki         2017-08-10  156  		s2idle_state = S2IDLE_STATE_WAKE;
b3dae109fa89d6 Peter Zijlstra            2018-06-12  157  		swake_up_one(&s2idle_wait_head);
7e73c5ae6e7991 Zhang Rui                 2013-02-06  158  	}
62fc00a6611a00 Sebastian Andrzej Siewior 2018-05-25  159  	raw_spin_unlock_irqrestore(&s2idle_lock, flags);
3810631332465d Rafael J. Wysocki         2015-02-12  160  }
f02f4f9d826590 Rafael J. Wysocki         2017-08-10  161  EXPORT_SYMBOL_GPL(s2idle_wake);
7e73c5ae6e7991 Zhang Rui                 2013-02-06  162  
43e8317b0bba1d Rafael J. Wysocki         2014-05-26  163  static bool valid_state(suspend_state_t state)
43e8317b0bba1d Rafael J. Wysocki         2014-05-26  164  {
43e8317b0bba1d Rafael J. Wysocki         2014-05-26  165  	/*
9f6abfcd67aae5 Rafael J. Wysocki         2021-10-22  166  	 * The PM_SUSPEND_STANDBY and PM_SUSPEND_MEM states require low-level
9f6abfcd67aae5 Rafael J. Wysocki         2021-10-22  167  	 * support and need to be valid to the low-level implementation.
9f6abfcd67aae5 Rafael J. Wysocki         2021-10-22  168  	 *
9f6abfcd67aae5 Rafael J. Wysocki         2021-10-22  169  	 * No ->valid() or ->enter() callback implies that none are valid.
43e8317b0bba1d Rafael J. Wysocki         2014-05-26  170  	 */
9f6abfcd67aae5 Rafael J. Wysocki         2021-10-22  171  	return suspend_ops && suspend_ops->valid && suspend_ops->valid(state) &&
9f6abfcd67aae5 Rafael J. Wysocki         2021-10-22  172  		suspend_ops->enter;
43e8317b0bba1d Rafael J. Wysocki         2014-05-26  173  }
43e8317b0bba1d Rafael J. Wysocki         2014-05-26  174  
fa7fd6fa38e36d Sudeep Holla              2016-08-19  175  void __init pm_states_init(void)
fa7fd6fa38e36d Sudeep Holla              2016-08-19  176  {
c1bfc598181bf0 Rafael J. Wysocki         2021-10-19  177  	/* "mem" and "freeze" are always present in /sys/power/state. */
c1bfc598181bf0 Rafael J. Wysocki         2021-10-19 @178  	pm_states[PM_SUSPEND_MEM] = pm_labels[PM_SUSPEND_MEM];
690cbb90a709c1 Rafael J. Wysocki         2017-08-10  179  	pm_states[PM_SUSPEND_TO_IDLE] = pm_labels[PM_SUSPEND_TO_IDLE];
fa7fd6fa38e36d Sudeep Holla              2016-08-19  180  	/*
406e79385f3223 Rafael J. Wysocki         2016-11-21  181  	 * Suspend-to-idle should be supported even without any suspend_ops,
406e79385f3223 Rafael J. Wysocki         2016-11-21  182  	 * initialize mem_sleep_states[] accordingly here.
fa7fd6fa38e36d Sudeep Holla              2016-08-19  183  	 */
690cbb90a709c1 Rafael J. Wysocki         2017-08-10  184  	mem_sleep_states[PM_SUSPEND_TO_IDLE] = mem_sleep_labels[PM_SUSPEND_TO_IDLE];
fa7fd6fa38e36d Sudeep Holla              2016-08-19  185  }
fa7fd6fa38e36d Sudeep Holla              2016-08-19  186  
406e79385f3223 Rafael J. Wysocki         2016-11-21  187  static int __init mem_sleep_default_setup(char *str)
0399d4db3edf5c Rafael J. Wysocki         2014-05-26  188  {
406e79385f3223 Rafael J. Wysocki         2016-11-21  189  	suspend_state_t state;
406e79385f3223 Rafael J. Wysocki         2016-11-21  190  
690cbb90a709c1 Rafael J. Wysocki         2017-08-10 @191  	for (state = PM_SUSPEND_TO_IDLE; state <= PM_SUSPEND_MEM; state++)
406e79385f3223 Rafael J. Wysocki         2016-11-21  192  		if (mem_sleep_labels[state] &&
406e79385f3223 Rafael J. Wysocki         2016-11-21  193  		    !strcmp(str, mem_sleep_labels[state])) {
406e79385f3223 Rafael J. Wysocki         2016-11-21  194  			mem_sleep_default = state;
406e79385f3223 Rafael J. Wysocki         2016-11-21  195  			break;
0399d4db3edf5c Rafael J. Wysocki         2014-05-26  196  		}
0399d4db3edf5c Rafael J. Wysocki         2014-05-26  197  
406e79385f3223 Rafael J. Wysocki         2016-11-21  198  	return 1;
406e79385f3223 Rafael J. Wysocki         2016-11-21  199  }
406e79385f3223 Rafael J. Wysocki         2016-11-21  200  __setup("mem_sleep_default=", mem_sleep_default_setup);
0399d4db3edf5c Rafael J. Wysocki         2014-05-26  201  

:::::: The code at line 92 was first introduced by commit
:::::: 690cbb90a709c1b9389c6cb8e1978e77553ce0fb PM / s2idle: Rename PM_SUSPEND_FREEZE to PM_SUSPEND_TO_IDLE

:::::: TO: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
