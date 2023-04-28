Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7D73220
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Apr 2023 17:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682701301; x=1714237301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NgvmqSkHOL2qdNe571poOUlA86iJ34caAl2S6RIhl4I=;
  b=F297S4TjFczI4Ik+MjTEg3rX8jpL7+8bNBXOGCsrCuQ2W8gZQZ2Z3mFK
   OiRGgmtkzm20wVQTMq/NBa2t166n2z0bZu6V+oREsUWLaKCOFqczFI0Ab
   413c/Ss2O/N1Reyb2ZzSBoIti9Bdfqr9yV+gX555EV2ld08aLAHiR6nWF
   Y/lC8DEmR7gWAqzzGiGzxH7JFyptSFpqpaMBj6zXcJ6Ffv2AU9y+XXly1
   6yjQOlgM5ZrJ2LG2sM1gb7C2iSfAJi+8bzT5jxHcdFo6xuG3+K4LTuQdY
   9zAQ2k7mJ+QVy+dlyLbfY/e9fBJiAPlJsztvdPa2CFJaGdsGAv729J9kZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="346569068"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="346569068"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 10:01:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="672262266"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="672262266"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Apr 2023 10:01:38 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psRTV-0000Yx-36;
	Fri, 28 Apr 2023 17:01:37 +0000
Date: Sat, 29 Apr 2023 01:01:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tglx-devel:timers/posix 2/21] kernel/time/posix-timers.c:1086
 itimer_delete() warn: inconsistent returns '&timer->it_lock'.
Message-ID: <202304290057.mXXwQFGI-lkp@intel.com>
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
TO: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/posix
head:   6fdc1a95f0406e988c2a5db0e3499cd43b1a94c0
commit: 2737f0e42de31850c75a098be2bc9dcf5fc52b52 [2/21] posix-timers: Prevent RT livelock in itimer_delete()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc-randconfig-m041-20230427 (https://download.01.org/0day-ci/archive/20230429/202304290057.mXXwQFGI-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304290057.mXXwQFGI-lkp@intel.com/

smatch warnings:
kernel/time/posix-timers.c:1086 itimer_delete() warn: inconsistent returns '&timer->it_lock'.
kernel/time/posix-timers.c:1086 itimer_delete() warn: inconsistent returns 'flags'.

vim +1086 kernel/time/posix-timers.c

becf8b5d00f4b4 kernel/posix-timers.c      Thomas Gleixner  2006-01-09  1038  
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1039  /*
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1040   * Delete a timer if it is armed, remove it from the hash and schedule it
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1041   * for RCU freeing.
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1042   */
858119e1593843 kernel/posix-timers.c      Arjan van de Ven 2006-01-14  1043  static void itimer_delete(struct k_itimer *timer)
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1044  {
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1045  	unsigned long flags;
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1046  
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1047  retry_delete:
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1048  	/*
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1049  	 * irqsave is required to make timer_wait_running() work.
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1050  	 */
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1051  	spin_lock_irqsave(&timer->it_lock, flags);
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1052  
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1053  	/*
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1054  	 * Even if the timer is not longer accessible from other tasks
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1055  	 * it still might be armed and queued in the underlying timer
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1056  	 * mechanism. Worse, that timer mechanism might run the expiry
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1057  	 * function concurrently.
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1058  	 */
becf8b5d00f4b4 kernel/posix-timers.c      Thomas Gleixner  2006-01-09  1059  	if (timer_delete_hook(timer) == TIMER_RETRY) {
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1060  		/*
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1061  		 * Timer is expired concurrently, prevent livelocks
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1062  		 * and pointless spinning on RT.
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1063  		 *
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1064  		 * The CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y case is
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1065  		 * irrelevant here because obviously the exiting task
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1066  		 * cannot be expiring timer in task work concurrently.
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1067  		 * Ditto for CONFIG_POSIX_CPU_TIMERS_TASK_WORK=n as the
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1068  		 * tick interrupt cannot run on this CPU because the above
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1069  		 * spin_lock disabled interrupts.
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1070  		 *
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1071  		 * timer_wait_running() drops timer::it_lock, which opens
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1072  		 * the possibility for another task to delete the timer.
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1073  		 *
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1074  		 * That's not possible here because this is invoked from
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1075  		 * do_exit() only for the last thread of the thread group.
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1076  		 * So no other task can access that timer.
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1077  		 */
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1078  		if (WARN_ON_ONCE(timer_wait_running(timer, &flags) != timer))
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1079  			return;
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1080  
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1081  		goto retry_delete;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1082  	}
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1083  	list_del(&timer->list);
4b7a1304267bff kernel/posix-timers.c      Oleg Nesterov    2008-07-25  1084  
2737f0e42de318 kernel/time/posix-timers.c Thomas Gleixner  2023-04-24  1085  	spin_unlock_irqrestore(&timer->it_lock, flags);
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16 @1086  	release_posix_timer(timer, IT_ID_SET);
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1087  }
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1088  

:::::: The code at line 1086 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
