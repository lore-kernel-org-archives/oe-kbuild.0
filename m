Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9867913AD9
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Sep 2023 15:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694876940; x=1726412940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NMkAQhaToqWf21iNtEWPNOEq5V3mouPuroQNkNQZDqU=;
  b=MKEtGLbaH3ZMYAUywF1Y2458NstRGhvhKZabdZJvZq1RiiUCvq0QLanA
   bDhdJDGcOKI0iKTZkFXQtjQAPsAoLz36ayDBCPdv4L8S4VfmEV6DTo9HD
   ghe2t7uQsJpwpKHj2S9vEa9BqPWITVVfCedK95WWhUoG7m42xoLUqfw3o
   +qKAVoROZg4rlD3uT3yRNrOpqVnD1b8iOuPy4mrmkcXUWdT7p8s33VIKS
   JTCwMcUMkCzgYNZ8NglXvttdw8b2zUmDuZBub08aLh8Rsw8UuZqjq6sx+
   VbecT2a/W8YYYJEJArhbQO4UvfxodBc3bqMUygBUGTp6QZYi3O3hSHCdy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="465781423"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="465781423"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 08:08:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="815522728"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="815522728"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Sep 2023 08:08:57 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhWul-0004NS-1o;
	Sat, 16 Sep 2023 15:08:55 +0000
Date: Sat, 16 Sep 2023 23:08:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/time/posix-timers.c:1079 itimer_delete() warn: inconsistent
 returns '&timer->it_lock'.
Message-ID: <202309162338.5vPeJwM9-lkp@intel.com>
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
head:   57d88e8a5974644039fbc47806bac7bb12025636
commit: 9d9e522010eb5685d8b53e8a24320653d9d4cbbf posix-timers: Prevent RT livelock in itimer_delete()
date:   3 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20230914 (https://download.01.org/0day-ci/archive/20230916/202309162338.5vPeJwM9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230916/202309162338.5vPeJwM9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309162338.5vPeJwM9-lkp@intel.com/

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
