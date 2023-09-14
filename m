Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9482510E
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Sep 2023 05:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694670736; x=1726206736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+rfZOlfOW05SOkRycfP3V3mx7BCakwUfBsVo2te4Wr4=;
  b=aKQ3jhcwICrbHqCzIWXg0lFKnNrKDFuWKF7i2GpEh+HfItbI/C1P2Mz5
   D9sg7GcuFcoQ/q3wUKiTeYRjjsEUQeUhZVe5rPjJEJm5YI5GIYFFb4Z2E
   pTLRFVUVtgxbZGjb61gjOCK1Nt8IVr0nCvcVCA2bQt+1S+ZaK0BB8grzc
   oHb1JQsCDVQcx2N0iw55kfgR8tj/XizLs7pCoN46L6KVDFdagdbbdGwOj
   vyPMLbwMwRqU20JYicnwTKehCpubhk3B99S8fmtqoihbNfVrV9Lg8TQNa
   QS8RXmL+DxAk9zzro/KBAd41LJQpyeM6AS4vJDht2fsAJC8ct63JsjyYe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377767957"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="377767957"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 22:52:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="809927478"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="809927478"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 13 Sep 2023 22:52:12 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgfGs-0001DF-2y;
	Thu, 14 Sep 2023 05:52:10 +0000
Date: Thu, 14 Sep 2023 13:51:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/time/posix-timers.c:1079 itimer_delete() warn: inconsistent
 returns '&timer->it_lock'.
Message-ID: <202309141308.8vPNDQKm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Frederic Weisbecker <frederic@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aed8aee11130a954356200afa3f1b8753e8a9482
commit: 9d9e522010eb5685d8b53e8a24320653d9d4cbbf posix-timers: Prevent RT livelock in itimer_delete()
date:   3 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20230914 (https://download.01.org/0day-ci/archive/20230914/202309141308.8vPNDQKm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230914/202309141308.8vPNDQKm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309141308.8vPNDQKm-lkp@intel.com/

smatch warnings:
kernel/time/posix-timers.c:1079 itimer_delete() warn: inconsistent returns '&timer->it_lock'.
kernel/time/posix-timers.c:1079 itimer_delete() warn: inconsistent returns 'flags'.

vim +1079 kernel/time/posix-timers.c

becf8b5d00f4b4 kernel/posix-timers.c      Thomas Gleixner  2006-01-09  1038  
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1039  /*
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1040   * Delete a timer if it is armed, remove it from the hash and schedule it
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1041   * for RCU freeing.
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1042   */
858119e1593843 kernel/posix-timers.c      Arjan van de Ven 2006-01-14  1043  static void itimer_delete(struct k_itimer *timer)
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1044  {
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1045  	unsigned long flags;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1046  
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1047  	/*
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1048  	 * irqsave is required to make timer_wait_running() work.
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1049  	 */
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1050  	spin_lock_irqsave(&timer->it_lock, flags);
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1051  
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1052  retry_delete:
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1053  	/*
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1054  	 * Even if the timer is not longer accessible from other tasks
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1055  	 * it still might be armed and queued in the underlying timer
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1056  	 * mechanism. Worse, that timer mechanism might run the expiry
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1057  	 * function concurrently.
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1058  	 */
becf8b5d00f4b4 kernel/posix-timers.c      Thomas Gleixner  2006-01-09  1059  	if (timer_delete_hook(timer) == TIMER_RETRY) {
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1060  		/*
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1061  		 * Timer is expired concurrently, prevent livelocks
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1062  		 * and pointless spinning on RT.
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1063  		 *
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1064  		 * timer_wait_running() drops timer::it_lock, which opens
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1065  		 * the possibility for another task to delete the timer.
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1066  		 *
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1067  		 * That's not possible here because this is invoked from
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1068  		 * do_exit() only for the last thread of the thread group.
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1069  		 * So no other task can access and delete that timer.
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1070  		 */
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1071  		if (WARN_ON_ONCE(timer_wait_running(timer, &flags) != timer))
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1072  			return;
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1073  
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1074  		goto retry_delete;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1075  	}
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1076  	list_del(&timer->list);
4b7a1304267bff kernel/posix-timers.c      Oleg Nesterov    2008-07-25  1077  
9d9e522010eb56 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1078  	spin_unlock_irqrestore(&timer->it_lock, flags);
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16 @1079  	release_posix_timer(timer, IT_ID_SET);
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1080  }
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1081  

:::::: The code at line 1079 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
