Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0E83CD8A9
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Jul 2026 17:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783792422; cv=none; b=LY0BiOnGNa20iOwgKawCO8KAsMIDZKgg9LmFRihy+wBr0eb/3NrL7qrD7GoJ/zJncNRAqdm4V6yzBtySDvweNchnnqWJxkuavAByz5nYs+/vB1vQWE2PANwsU69wjy6oex2wkMF6xs+qzZHLmCGHiw9cbDlhYkU2LbsZsMQrGQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783792422; c=relaxed/simple;
	bh=Htj/mAGVIu+DbPGhU7Z40G9Mq8AV0sVfgA/u1E+XwJ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L5J/ZHDeuRhkjp7s6/oa1EkhLDi9H9MGQN9O0zQIHuXZbZE6pp7wh9f/LioukvmHIhsNC2cnlhqjhq2+fi9n2lagaGEDrGUjkSGLTnkU0nVDPk160M7X1kUMRL4IOBHztwE8QMMi+iyLHu+TGHytF+fNXR35HY1TyUSE+8Rh1DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PIcgWghz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PIcgWghz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783792420; x=1815328420;
  h=date:from:to:cc:subject:message-id;
  bh=Htj/mAGVIu+DbPGhU7Z40G9Mq8AV0sVfgA/u1E+XwJ8=;
  b=PIcgWghzUe5g4Dvnc4ehD9eUqDfa41WMbTnjhVrG5AAlZeBkhGpQXLyu
   qdkXgOysJ9hyLkYl9hzeFPp/PCZapRpygvBGsvFZqz98MBWq+zzM0DB2U
   SAI6b7kohOarG2RH2Rs/Y0Oy/ZW7EicrD1GKD186t4iCcokSiMxn/Xee0
   jHfuAmu2NeyijS6YT9F5SlH6jIy5k7CZkuRu0vC+Epc3Pe2ykZ6qlFfZC
   /RUfW7mxeJlNI4ts4QkTjR1VoTnmQZrbzORfrgeJDp2y3HDhTJhEGeILa
   ZqKNybNWPHJ+ud8JUjyNmqjSFHJzpYilDtO0z0z0S/Du9CGq701j308Vu
   w==;
X-CSE-ConnectionGUID: JevteCV7TqSbBhTrVcC1Mg==
X-CSE-MsgGUID: JMMcxGm7SFC8rsKnsnF69Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84486718"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84486718"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 10:53:39 -0700
X-CSE-ConnectionGUID: X1tB37heR6Si0GLbrzJbAg==
X-CSE-MsgGUID: /xrDYgXFSVakh3G0+wFH8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="260046591"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jul 2026 10:53:37 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wibtC-00000000KG5-2Emw;
	Sat, 11 Jul 2026 17:53:25 +0000
Date: Sun, 12 Jul 2026 01:53:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 180/180]
 kernel/time/posix-timers.c:1079 itimer_delete() warn: inconsistent returns
 '&timer->it_lock'.
Message-ID: <202607120135.SvdJeAa7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   1517b793772a02ed13258dd27cd6ac22fe27c5a6
commit: e7aff15ba29ba4b3052786b1636fa5c4aa39e179 [180/180] posix-timers: Prevent RT livelock in itimer_delete()
:::::: branch date: 18 hours ago
:::::: commit date: 3 years ago
config: x86_64-randconfig-161-20260708 (https://download.01.org/0day-ci/archive/20260712/202607120135.SvdJeAa7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607120135.SvdJeAa7-lkp@intel.com/

smatch warnings:
kernel/time/posix-timers.c:1079 itimer_delete() warn: inconsistent returns '&timer->it_lock'.

vim +1079 kernel/time/posix-timers.c

becf8b5d00f4b4 kernel/posix-timers.c      Thomas Gleixner  2006-01-09  1038  
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1039  /*
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1040   * Delete a timer if it is armed, remove it from the hash and schedule it
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1041   * for RCU freeing.
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1042   */
858119e1593843 kernel/posix-timers.c      Arjan van de Ven 2006-01-14  1043  static void itimer_delete(struct k_itimer *timer)
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1044  {
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1045  	unsigned long flags;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1046  
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1047  	/*
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1048  	 * irqsave is required to make timer_wait_running() work.
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1049  	 */
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1050  	spin_lock_irqsave(&timer->it_lock, flags);
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1051  
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1052  retry_delete:
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1053  	/*
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1054  	 * Even if the timer is not longer accessible from other tasks
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1055  	 * it still might be armed and queued in the underlying timer
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1056  	 * mechanism. Worse, that timer mechanism might run the expiry
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1057  	 * function concurrently.
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1058  	 */
becf8b5d00f4b4 kernel/posix-timers.c      Thomas Gleixner  2006-01-09  1059  	if (timer_delete_hook(timer) == TIMER_RETRY) {
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1060  		/*
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1061  		 * Timer is expired concurrently, prevent livelocks
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1062  		 * and pointless spinning on RT.
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1063  		 *
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1064  		 * timer_wait_running() drops timer::it_lock, which opens
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1065  		 * the possibility for another task to delete the timer.
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1066  		 *
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1067  		 * That's not possible here because this is invoked from
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1068  		 * do_exit() only for the last thread of the thread group.
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1069  		 * So no other task can access and delete that timer.
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1070  		 */
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1071  		if (WARN_ON_ONCE(timer_wait_running(timer, &flags) != timer))
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1072  			return;
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1073  
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1074  		goto retry_delete;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1075  	}
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds   2005-04-16  1076  	list_del(&timer->list);
4b7a1304267bff kernel/posix-timers.c      Oleg Nesterov    2008-07-25  1077  
e7aff15ba29ba4 kernel/time/posix-timers.c Thomas Gleixner  2023-06-01  1078  	spin_unlock_irqrestore(&timer->it_lock, flags);
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
