Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823EF39ACD
	for <oe-kbuild@lists.linux.dev>; Wed, 15 May 2024 05:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715751335; cv=none; b=qk/OCnDT0xCcZbxhOqI49qc70D/psrEFkZ7qQFPn6+7gqvs7jrSbXM2DJoincGKMfgb6Ljm9Pq/UD32j9b3OVx9qdG64NXXJz4UINmb+OY0EpCFneVC5dog+BJgLjDPhdkswP0WZXfl7tSd9Rqdm0nyiA9tBPQbFI97sL5D9nCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715751335; c=relaxed/simple;
	bh=CuIaHBtrF/LnApXNN1xRvzI8eaZPeWG4V2JmceheFR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NLRVkoPfXEPkDoL4LY6eB57+BTYnZUOLB9UneN0s3yuKxTKfeE8fpm36cQ1l1N+++Vc6AC4vjfPACh2iZ5p0k5CMwatQTSW7794o7karNAmh1so4c6h/fy414qo+oh8BwntVPsHYkSeeJTbNglBAR54gvpNOmJjVkcIWcxJO9Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kz2RjaYt; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kz2RjaYt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715751333; x=1747287333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CuIaHBtrF/LnApXNN1xRvzI8eaZPeWG4V2JmceheFR4=;
  b=Kz2RjaYtr/j0yGxNfZYT1hK/hkMG66Ab0FWtJRlNMnO03nkHYKNh4QKw
   iBPPzWOUIieI6OfUsGI0c4dCoIwg5eb784W5MVIyRrFvSdgB5bwsCrII2
   t0DjEVXb6n5i+Nu+QsjS9uk968ciu31phcCpj+H0ahLvnsasuX9n/+gcq
   KNwm0cObSc3/KJIIZFFOOIY4IrITk0wyeSmJ7nE8kyUq/6xKki6rIUdNf
   4K6GNJm3kiqkb0tXQuO1VExrKFFz1UbxcN2gI0dBfBDPht1QmlpePlu0J
   UZCj+zbntGHWA56yx7qrU6JF8YcA0MNp4X+NB1l2Pe2ucmzTu87+0LtI7
   w==;
X-CSE-ConnectionGUID: thvyL6ANQaCpw1WBbhDEDA==
X-CSE-MsgGUID: PTfac2vMQwyz6L6Obog25A==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="22921300"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="22921300"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 22:35:32 -0700
X-CSE-ConnectionGUID: OZqUVZXATfefLrvQpav/6w==
X-CSE-MsgGUID: w74pGPWURWaiVLiRBo6sYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="30759387"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 May 2024 22:35:25 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s77IQ-000CUX-19;
	Wed, 15 May 2024 05:35:22 +0000
Date: Wed, 15 May 2024 13:34:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arnd-asm-generic:syscall-tbl-6.9 43/46] kernel/fork.c:3087:2:
 sparse: sparse: clone3() entry point is missing, please fix
Message-ID: <202405151354.mPycoB6W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/fork.c:3087:2: sparse: sparse: clone3() entry point is missing, please fix"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arch@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git syscall-tbl-6.9
head:   e0d7a2fe9b74052a280531e773ebaba59e2d523f
commit: 6bca3b47be851b7e05f0117d8022a0daabc84c72 [43/46] clone3: drop __ARCH_WANT_SYS_CLONE3 macro
:::::: branch date: 6 days ago
:::::: commit date: 7 days ago
config: alpha-randconfig-r133-20240515 (https://download.01.org/0day-ci/archive/20240515/202405151354.mPycoB6W-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240515/202405151354.mPycoB6W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405151354.mPycoB6W-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/fork.c:3087:2: sparse: sparse: clone3() entry point is missing, please fix
   kernel/fork.c:1242:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *owner @@     got struct task_struct *p @@
   kernel/fork.c:1242:19: sparse:     expected struct task_struct [noderef] __rcu *owner
   kernel/fork.c:1242:19: sparse:     got struct task_struct *p
   kernel/fork.c:1806:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1806:38: sparse:     expected struct refcount_struct [usertype] *r
   kernel/fork.c:1806:38: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:1815:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1815:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1815:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1816:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1816:36: sparse:     expected void const *
   kernel/fork.c:1816:36: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1817:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1817:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1817:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2209:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2209:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2209:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2213:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2213:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2213:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2526:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *real_parent @@     got struct task_struct *task @@
   kernel/fork.c:2526:32: sparse:     expected struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:2526:32: sparse:     got struct task_struct *task
   kernel/fork.c:2535:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2535:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2535:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2584:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct list_head *head @@     got struct list_head [noderef] __rcu * @@
   kernel/fork.c:2584:54: sparse:     expected struct list_head *head
   kernel/fork.c:2584:54: sparse:     got struct list_head [noderef] __rcu *
   kernel/fork.c:2604:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2604:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2604:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2626:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2626:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2626:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2653:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/fork.c:2653:28: sparse:     expected struct sighand_struct *sighand
   kernel/fork.c:2653:28: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/fork.c:2682:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2682:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2682:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2684:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2684:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2684:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:3127:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *[assigned] parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/fork.c:3127:24: sparse:     expected struct task_struct *[assigned] parent
   kernel/fork.c:3127:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:3215:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct const [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:3215:43: sparse:     expected struct refcount_struct const [usertype] *r
   kernel/fork.c:3215:43: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:2259:22: sparse: sparse: dereference of noderef expression
   kernel/fork.c: note: in included file (through include/uapi/asm-generic/bpf_perf_event.h, arch/alpha/include/generated/uapi/asm/bpf_perf_event.h, ...):
   include/linux/ptrace.h:210:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:210:45: sparse:     expected struct task_struct *new_parent
   include/linux/ptrace.h:210:45: sparse:     got struct task_struct [noderef] __rcu *parent
   include/linux/ptrace.h:210:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct cred const *ptracer_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   include/linux/ptrace.h:210:62: sparse:     expected struct cred const *ptracer_cred
   include/linux/ptrace.h:210:62: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/fork.c:2582:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2583:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:1234:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/fork.c:1234:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/fork.c:1234:23: sparse:    struct task_struct *

vim +3087 kernel/fork.c

7f192e3cd316ba Christian Brauner       2019-05-25  3067  
501bd0166eb949 Christian Brauner       2019-09-27  3068  /**
ff0712ea71f173 Matthew Wilcox (Oracle  2023-08-24  3069)  * sys_clone3 - create a new process with specific properties
501bd0166eb949 Christian Brauner       2019-09-27  3070   * @uargs: argument structure
501bd0166eb949 Christian Brauner       2019-09-27  3071   * @size:  size of @uargs
501bd0166eb949 Christian Brauner       2019-09-27  3072   *
501bd0166eb949 Christian Brauner       2019-09-27  3073   * clone3() is the extensible successor to clone()/clone2().
501bd0166eb949 Christian Brauner       2019-09-27  3074   * It takes a struct as argument that is versioned by its size.
501bd0166eb949 Christian Brauner       2019-09-27  3075   *
501bd0166eb949 Christian Brauner       2019-09-27  3076   * Return: On success, a positive PID for the child process.
501bd0166eb949 Christian Brauner       2019-09-27  3077   *         On error, a negative errno number.
501bd0166eb949 Christian Brauner       2019-09-27  3078   */
7f192e3cd316ba Christian Brauner       2019-05-25  3079  SYSCALL_DEFINE2(clone3, struct clone_args __user *, uargs, size_t, size)
7f192e3cd316ba Christian Brauner       2019-05-25  3080  {
7f192e3cd316ba Christian Brauner       2019-05-25  3081  	int err;
7f192e3cd316ba Christian Brauner       2019-05-25  3082  
7f192e3cd316ba Christian Brauner       2019-05-25  3083  	struct kernel_clone_args kargs;
49cb2fc42ce4b7 Adrian Reber            2019-11-15  3084  	pid_t set_tid[MAX_PID_NS_LEVEL];
49cb2fc42ce4b7 Adrian Reber            2019-11-15  3085  
6bca3b47be851b Arnd Bergmann           2024-05-08  3086  #ifdef __ARCH_BROKEN_SYS_CLONE3
6bca3b47be851b Arnd Bergmann           2024-05-08 @3087  #warning clone3() entry point is missing, please fix
6bca3b47be851b Arnd Bergmann           2024-05-08  3088  	return -ENOSYS;
6bca3b47be851b Arnd Bergmann           2024-05-08  3089  #endif
6bca3b47be851b Arnd Bergmann           2024-05-08  3090  
49cb2fc42ce4b7 Adrian Reber            2019-11-15  3091  	kargs.set_tid = set_tid;
7f192e3cd316ba Christian Brauner       2019-05-25  3092  
7f192e3cd316ba Christian Brauner       2019-05-25  3093  	err = copy_clone_args_from_user(&kargs, uargs, size);
7f192e3cd316ba Christian Brauner       2019-05-25  3094  	if (err)
7f192e3cd316ba Christian Brauner       2019-05-25  3095  		return err;
7f192e3cd316ba Christian Brauner       2019-05-25  3096  
7f192e3cd316ba Christian Brauner       2019-05-25  3097  	if (!clone3_args_valid(&kargs))
7f192e3cd316ba Christian Brauner       2019-05-25  3098  		return -EINVAL;
7f192e3cd316ba Christian Brauner       2019-05-25  3099  
cad6967ac10843 Christian Brauner       2020-08-19  3100  	return kernel_clone(&kargs);
d2125043aebf7f Al Viro                 2012-10-23  3101  }
d2125043aebf7f Al Viro                 2012-10-23  3102  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
