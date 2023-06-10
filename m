Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DF31FC5
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jun 2023 15:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686410207; x=1717946207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yHoX63EQYMSSqzdm7+jgU5ihv7H/RiZHmtgX9d3Abuw=;
  b=mxIwio57HLXmXFWqC7+NOTikyaK1NI2F8Fw+O8RsFYuqXVWIh0x7CSza
   mH1qDbItcDMkQ43eurTIMRgBDs33TjhQLE70QvJFPkbcFPdZi4fFotEDR
   K8JtIHeiJVbWutf0M0T1E8nJznW+IZNsKgbIhUnJ9Tj6ZjTMDVckeEfST
   O5Wo5oJXSSrQqU2TfWHnWpuxSHVdX4TKwz2SCoHATSB9f/PIcbLQg0j+n
   5EJ0ZEowKZmXjUOSGpK4yE5gLVxsPOPr3/awi/R9l/QFIXaIuzmjPjB3e
   GB0uShXRmF0PqMge7l4/L7s6mc/ovtvBFKFYXqPOY4GMjyhH9Bayueen5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="347417234"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="347417234"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 08:16:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="823401949"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="823401949"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2023 08:16:44 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q80Ka-000AAa-0P;
	Sat, 10 Jun 2023 15:16:44 +0000
Date: Sat, 10 Jun 2023 23:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:timers/core 2/25] kernel/time/posix-timers.c:1079
 itimer_delete() warn: inconsistent returns '&timer->it_lock'.
Message-ID: <202306102358.dS0ygMIv-lkp@intel.com>
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
CC: x86@kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Frederic Weisbecker <frederic@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/core
head:   5579a8a8f15bd08b731a015630daca6ccd0f8a14
commit: 1b59b2577582f9cf3d0f17245675a76859175cc1 [2/25] posix-timers: Prevent RT livelock in itimer_delete()
:::::: branch date: 3 hours ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-m001-20230608 (https://download.01.org/0day-ci/archive/20230610/202306102358.dS0ygMIv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306102358.dS0ygMIv-lkp@intel.com/

smatch warnings:
kernel/time/posix-timers.c:1079 itimer_delete() warn: inconsistent returns '&timer->it_lock'.
kernel/time/posix-timers.c:1079 itimer_delete() warn: inconsistent returns 'flags'.

vim +1079 kernel/time/posix-timers.c

becf8b5d00f4b4 kernel/posix-timers.c      Thomas Gleixner  2006-01-09  1038  
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1039  /*
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1040   * Delete a timer if it is armed, remove it from the hash and schedule it
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1041   * for RCU freeing.
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1042   */
858119e1593843 kernel/posix-timers.c      Arjan van de Ven 2006-01-14  1043  static void itimer_delete(struct k_itimer *timer)
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1044  {
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1045  	unsigned long flags;
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1046  
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1047  retry_delete:
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1048  	/*
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1049  	 * irqsave is required to make timer_wait_running() work.
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1050  	 */
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1051  	spin_lock_irqsave(&timer->it_lock, flags);
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1052  
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1053  	/*
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1054  	 * Even if the timer is not longer accessible from other tasks
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1055  	 * it still might be armed and queued in the underlying timer
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1056  	 * mechanism. Worse, that timer mechanism might run the expiry
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1057  	 * function concurrently.
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1058  	 */
becf8b5d00f4b4 kernel/posix-timers.c      Thomas Gleixner  2006-01-09  1059  	if (timer_delete_hook(timer) == TIMER_RETRY) {
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1060  		/*
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1061  		 * Timer is expired concurrently, prevent livelocks
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1062  		 * and pointless spinning on RT.
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1063  		 *
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1064  		 * timer_wait_running() drops timer::it_lock, which opens
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1065  		 * the possibility for another task to delete the timer.
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1066  		 *
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1067  		 * That's not possible here because this is invoked from
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1068  		 * do_exit() only for the last thread of the thread group.
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1069  		 * So no other task can access and delete that timer.
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1070  		 */
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1071  		if (WARN_ON_ONCE(timer_wait_running(timer, &flags) != timer))
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1072  			return;
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1073  
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1074  		goto retry_delete;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1075  	}
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1076  	list_del(&timer->list);
4b7a1304267bff kernel/posix-timers.c      Oleg Nesterov    2008-07-25  1077  
1b59b2577582f9 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1078  	spin_unlock_irqrestore(&timer->it_lock, flags);
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
