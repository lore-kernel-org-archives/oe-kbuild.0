Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D529262B6
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 21:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UoTJ3Jx3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701465726; x=1733001726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F3WpYRPFhBgL2uDGugGnOXyNRsNgrJ/BopX96KY4y0A=;
  b=UoTJ3Jx30eTmStds9ijw5bzg3qv2rl40vWXWopRLxyEc7tpoRTdqJlsK
   smF6G+aGGrlDiy/FJYpnSFUmn/J+4rmhB/o9r73JKZbFi/Wfaq5KuUB2Q
   00EZB7TaYSxS9ucfTRxMr3ExW9wBaKHfmOyn1M7Kh+NuBPnsbY2C029ls
   2TdqfY4YILEC34bSSTOx42pK+PMm1FTQWllbaAZNxz5D9AMiTpVwLjw6Y
   kewU0woj5GrEvABaELVygirNeYDWsbvmUVwGZNWe31U1w+RKdPcBxWTQ2
   KtuVFTSCJG4o5Gny0crt0ZrtLmy/ZjTdtYo3lyHATQkicjxU7IAQkelMK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="479755913"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="479755913"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 13:22:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="11276456"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Dec 2023 13:22:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9AxU-0004Iu-3B;
	Fri, 01 Dec 2023 21:22:00 +0000
Date: Sat, 2 Dec 2023 05:21:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/fork.c:1605:9: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202312020532.PwEXoxyr-lkp@intel.com>
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
TO: YiFei Zhu <yifeifz2@illinois.edu>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   994d5c58e50e91bb02c7be4a91d5186292a895c8
commit: 282a181b1a0d66de1f0894d82f395fcd478f51d1 seccomp: Move config option SECCOMP to arch/Kconfig
date:   3 years, 2 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 years, 2 months ago
config: s390-randconfig-r113-20231102 (https://download.01.org/0day-ci/archive/20231202/202312020532.PwEXoxyr-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312020532.PwEXoxyr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312020532.PwEXoxyr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/fork.c:989:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *owner @@     got struct task_struct *p @@
   kernel/fork.c:989:19: sparse:     expected struct task_struct [noderef] __rcu *owner
   kernel/fork.c:989:19: sparse:     got struct task_struct *p
   kernel/fork.c:1501:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1501:38: sparse:     expected struct refcount_struct [usertype] *r
   kernel/fork.c:1501:38: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:1510:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1510:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1510:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1511:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *src @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1511:36: sparse:     expected void const *src
   kernel/fork.c:1511:36: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1512:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1512:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1512:33: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/fork.c:1605:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct arch_spinlock_t [usertype] *lp @@     got struct arch_spinlock_t [noderef] __rcu * @@
   kernel/fork.c:1605:9: sparse:     expected struct arch_spinlock_t [usertype] *lp
   kernel/fork.c:1605:9: sparse:     got struct arch_spinlock_t [noderef] __rcu *
   kernel/fork.c:1906:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1906:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1906:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1910:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1910:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1910:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2196:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *real_parent @@     got struct task_struct * @@
   kernel/fork.c:2196:32: sparse:     expected struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:2196:32: sparse:     got struct task_struct *
   kernel/fork.c:2202:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2202:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2202:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2251:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct list_head *head @@     got struct list_head [noderef] __rcu * @@
   kernel/fork.c:2251:54: sparse:     expected struct list_head *head
   kernel/fork.c:2251:54: sparse:     got struct list_head [noderef] __rcu *
   kernel/fork.c:2272:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2272:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2272:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2287:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2287:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2287:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2314:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/fork.c:2314:28: sparse:     expected struct sighand_struct *sighand
   kernel/fork.c:2314:28: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/fork.c:2342:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2342:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2342:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2344:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2344:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2344:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2731:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *[assigned] parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/fork.c:2731:24: sparse:     expected struct task_struct *[assigned] parent
   kernel/fork.c:2731:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:2812:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct const [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:2812:43: sparse:     expected struct refcount_struct const [usertype] *r
   kernel/fork.c:2812:43: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:3030:47: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/fork.c:3030:47: sparse:     expected void *
   kernel/fork.c:3030:47: sparse:     got void [noderef] __user *buffer
   kernel/fork.c:3016:5: sparse: sparse: symbol 'sysctl_max_threads' redeclared with different type (incompatible argument 3 (different address spaces)):
   kernel/fork.c:3016:5: sparse:    int extern [addressable] [signed] [toplevel] sysctl_max_threads( ... )
   kernel/fork.c: note: in included file (through include/linux/key.h, include/linux/cred.h, include/linux/sched/signal.h, ...):
   include/linux/sysctl.h:242:5: sparse: note: previously declared as:
   include/linux/sysctl.h:242:5: sparse:    int extern [addressable] [signed] [toplevel] sysctl_max_threads( ... )
   kernel/fork.c:981:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/fork.c:981:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/fork.c:981:23: sparse:    struct task_struct *
--
   kernel/seccomp.c:1098:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:1098:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:1098:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:1110:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:1110:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:1110:33: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/seccomp.c:341:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct arch_spinlock_t [usertype] *lp @@     got struct arch_spinlock_t [noderef] __rcu * @@
   kernel/seccomp.c:341:9: sparse:     expected struct arch_spinlock_t [usertype] *lp
   kernel/seccomp.c:341:9: sparse:     got struct arch_spinlock_t [noderef] __rcu *
   kernel/seccomp.c:355:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct arch_spinlock_t [usertype] *lp @@     got struct arch_spinlock_t [noderef] __rcu * @@
   kernel/seccomp.c:355:9: sparse:     expected struct arch_spinlock_t [usertype] *lp
   kernel/seccomp.c:355:9: sparse:     got struct arch_spinlock_t [noderef] __rcu *

vim +1605 kernel/fork.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  1595  
dbd952127d11bb Kees Cook      2014-06-27  1596  static void copy_seccomp(struct task_struct *p)
dbd952127d11bb Kees Cook      2014-06-27  1597  {
dbd952127d11bb Kees Cook      2014-06-27  1598  #ifdef CONFIG_SECCOMP
dbd952127d11bb Kees Cook      2014-06-27  1599  	/*
dbd952127d11bb Kees Cook      2014-06-27  1600  	 * Must be called with sighand->lock held, which is common to
dbd952127d11bb Kees Cook      2014-06-27  1601  	 * all threads in the group. Holding cred_guard_mutex is not
dbd952127d11bb Kees Cook      2014-06-27  1602  	 * needed because this new task is not yet running and cannot
dbd952127d11bb Kees Cook      2014-06-27  1603  	 * be racing exec.
dbd952127d11bb Kees Cook      2014-06-27  1604  	 */
69f6a34bdeea4f Guenter Roeck  2014-08-10 @1605  	assert_spin_locked(&current->sighand->siglock);
dbd952127d11bb Kees Cook      2014-06-27  1606  
dbd952127d11bb Kees Cook      2014-06-27  1607  	/* Ref-count the new filter user, and assign it. */
dbd952127d11bb Kees Cook      2014-06-27  1608  	get_seccomp_filter(current);
dbd952127d11bb Kees Cook      2014-06-27  1609  	p->seccomp = current->seccomp;
dbd952127d11bb Kees Cook      2014-06-27  1610  
dbd952127d11bb Kees Cook      2014-06-27  1611  	/*
dbd952127d11bb Kees Cook      2014-06-27  1612  	 * Explicitly enable no_new_privs here in case it got set
dbd952127d11bb Kees Cook      2014-06-27  1613  	 * between the task_struct being duplicated and holding the
dbd952127d11bb Kees Cook      2014-06-27  1614  	 * sighand lock. The seccomp state and nnp must be in sync.
dbd952127d11bb Kees Cook      2014-06-27  1615  	 */
dbd952127d11bb Kees Cook      2014-06-27  1616  	if (task_no_new_privs(current))
dbd952127d11bb Kees Cook      2014-06-27  1617  		task_set_no_new_privs(p);
dbd952127d11bb Kees Cook      2014-06-27  1618  
dbd952127d11bb Kees Cook      2014-06-27  1619  	/*
dbd952127d11bb Kees Cook      2014-06-27  1620  	 * If the parent gained a seccomp mode after copying thread
dbd952127d11bb Kees Cook      2014-06-27  1621  	 * flags and between before we held the sighand lock, we have
dbd952127d11bb Kees Cook      2014-06-27  1622  	 * to manually enable the seccomp thread flag here.
dbd952127d11bb Kees Cook      2014-06-27  1623  	 */
dbd952127d11bb Kees Cook      2014-06-27  1624  	if (p->seccomp.mode != SECCOMP_MODE_DISABLED)
dbd952127d11bb Kees Cook      2014-06-27  1625  		set_tsk_thread_flag(p, TIF_SECCOMP);
dbd952127d11bb Kees Cook      2014-06-27  1626  #endif
dbd952127d11bb Kees Cook      2014-06-27  1627  }
dbd952127d11bb Kees Cook      2014-06-27  1628  

:::::: The code at line 1605 was first introduced by commit
:::::: 69f6a34bdeea4fec50bb90619bc9602973119572 seccomp: Replace BUG(!spin_is_locked()) with assert_spin_lock

:::::: TO: Guenter Roeck <linux@roeck-us.net>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
