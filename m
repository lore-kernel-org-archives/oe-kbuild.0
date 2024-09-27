Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0AE19AD85
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Sep 2024 13:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727444495; cv=none; b=S7DNv8aQ2B2zvZ1sgJxrD0Pc/ECdla6w4Ij2X6azQd2+FefX0CSrU2a1yRihfEtBVG7P6G6N6tNw8B2oC045nBt7cJTK/HyF1pDC2iDfueBjsn3sKOtSatmvdvQ2Gi2QdhzaIU0q0ndg+J/jk9iseZZqvOVBfQ64zyZnORw3AHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727444495; c=relaxed/simple;
	bh=MGPqmXrH2QSXe5cGahOqkPt0+Z1EqE2c5AYtP9SN+DU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sM6IOu09ofhqzNQpKd1y6azZ/ssknb/orvUVrHXwxAUh8WE/0mB0BhVp7Q+9cwLePvLe5u2FEy4T/6zVP7CvwJCntc9LlberFsjnbRQsUQBNcwzvq0d1YQXfm40UDN8jwJRaysC0VLgNqpr603wQCnsscxqt4G70J2P6PvqMViU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTPZwLhy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTPZwLhy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727444493; x=1758980493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MGPqmXrH2QSXe5cGahOqkPt0+Z1EqE2c5AYtP9SN+DU=;
  b=RTPZwLhyYryK2XgUGfK6aZ8AgILNUuIte0SCocKA0aGZOj0KnWz7gIeH
   GnmqMkmXGU3uhnGjHer7OsLpZY4tLjL1Qy1SKmso5SJ4oAUZkE70XkFzv
   MP+fQJn/x8B0vJbLZOvR0N6chVR6A17xv/Fyi6Z/YbbxQMKGCJA7jG9AD
   BAkeCesYWdrAEKnvJ3FCUFCkuId7G7Z0xN8T5J4/iHU9FRAN4UPunI/VC
   5bfS/XxRX2Y/5HQxLwM3DdyK+zuoLhhCRWenJYixkFIM+3I9IkvpyXRRN
   /PQStPk4AXPyyj8ALELe4OB8xnB6d5CfK+xVu14Q/63R93mqnPi0gxDed
   A==;
X-CSE-ConnectionGUID: 56//SXe+SWixLJkbWPGEDg==
X-CSE-MsgGUID: RAWXcPGhSHKLwU6oNMFhIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26761814"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26761814"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 06:41:26 -0700
X-CSE-ConnectionGUID: 3u1PbEHMTbirjHkx5xc4jg==
X-CSE-MsgGUID: IjaSSQVVTvKj+63/x/bckA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="77323700"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Sep 2024 06:41:24 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suBDm-000MBe-0F;
	Fri, 27 Sep 2024 13:41:22 +0000
Date: Fri, 27 Sep 2024 21:41:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cip:linux-4.19.y-cip-rt-rebase 9879/30000]
 kernel/locking/rtmutex.c:1345 task_blocks_on_rt_mutex() warn: inconsistent
 indenting
Message-ID: <202409272156.iIRQwg4p-lkp@intel.com>
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
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   67ac3270c7aaf93810ea5b43e2bf8361b683718e
commit: 00157807cce7cd6918471ea01122aa8cc6c951e5 [9879/30000] futex: Make the futex_hash_bucket spinlock_t again and bring back its old state
:::::: branch date: 3 days ago
:::::: commit date: 4 years, 8 months ago
config: i386-randconfig-141-20240927 (https://download.01.org/0day-ci/archive/20240927/202409272156.iIRQwg4p-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409272156.iIRQwg4p-lkp@intel.com/

smatch warnings:
kernel/locking/rtmutex.c:1345 task_blocks_on_rt_mutex() warn: inconsistent indenting

vim +1345 kernel/locking/rtmutex.c

1505d62914cfb9 kernel/locking/rtmutex.c Thomas Gleixner           2017-10-12  1298  
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1299  /*
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1300   * Task blocks on lock.
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1301   *
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1302   * Prepare waiter and propagate pi chain
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1303   *
b4abf91047cf05 kernel/locking/rtmutex.c Thomas Gleixner           2016-01-13  1304   * This must be called with lock->wait_lock held and interrupts disabled
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1305   */
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1306  static int task_blocks_on_rt_mutex(struct rt_mutex *lock,
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1307  				   struct rt_mutex_waiter *waiter,
8dac456a681bd9 kernel/rtmutex.c         Darren Hart               2009-04-03  1308  				   struct task_struct *task,
8930ed80f970a9 kernel/locking/rtmutex.c Thomas Gleixner           2014-05-22  1309  				   enum rtmutex_chainwalk chwalk)
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1310  {
36c8b586896f60 kernel/rtmutex.c         Ingo Molnar               2006-07-03  1311  	struct task_struct *owner = rt_mutex_owner(lock);
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1312  	struct rt_mutex_waiter *top_waiter = waiter;
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner           2014-06-05  1313  	struct rt_mutex *next_lock;
db630637b2f192 kernel/rtmutex.c         Steven Rostedt            2006-09-29  1314  	int chain_walk = 0, res;
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1315  
e0aad5b44ff5d2 kernel/locking/rtmutex.c Peter Zijlstra            2017-03-23  1316  	lockdep_assert_held(&lock->wait_lock);
e0aad5b44ff5d2 kernel/locking/rtmutex.c Peter Zijlstra            2017-03-23  1317  
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner           2014-05-22  1318  	/*
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner           2014-05-22  1319  	 * Early deadlock detection. We really don't want the task to
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner           2014-05-22  1320  	 * enqueue on itself just to untangle the mess later. It's not
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner           2014-05-22  1321  	 * only an optimization. We drop the locks, so another waiter
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner           2014-05-22  1322  	 * can come in before the chain walk detects the deadlock. So
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner           2014-05-22  1323  	 * the other will detect the deadlock and return -EDEADLOCK,
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner           2014-05-22  1324  	 * which is wrong, as the other waiter is not in a deadlock
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner           2014-05-22  1325  	 * situation.
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner           2014-05-22  1326  	 */
3d5c9340d19497 kernel/locking/rtmutex.c Thomas Gleixner           2014-06-05  1327  	if (owner == task)
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner           2014-05-22  1328  		return -EDEADLK;
397335f004f41e kernel/locking/rtmutex.c Thomas Gleixner           2014-05-22  1329  
b4abf91047cf05 kernel/locking/rtmutex.c Thomas Gleixner           2016-01-13  1330  	raw_spin_lock(&task->pi_lock);
00157807cce7cd kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2019-10-07  1331  	/*
00157807cce7cd kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2019-10-07  1332  	 * In the case of futex requeue PI, this will be a proxy
00157807cce7cd kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2019-10-07  1333  	 * lock. The task will wake unaware that it is enqueueed on
00157807cce7cd kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2019-10-07  1334  	 * this lock. Avoid blocking on two locks and corrupting
00157807cce7cd kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2019-10-07  1335  	 * pi_blocked_on via the PI_WAKEUP_INPROGRESS
00157807cce7cd kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2019-10-07  1336  	 * flag. futex_wait_requeue_pi() sets this when it wakes up
00157807cce7cd kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2019-10-07  1337  	 * before requeue (due to a signal or timeout). Do not enqueue
00157807cce7cd kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2019-10-07  1338  	 * the task if PI_WAKEUP_INPROGRESS is set.
00157807cce7cd kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2019-10-07  1339  	 */
00157807cce7cd kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2019-10-07  1340  	if (task != current && task->pi_blocked_on == PI_WAKEUP_INPROGRESS) {
00157807cce7cd kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2019-10-07  1341  		raw_spin_unlock(&task->pi_lock);
00157807cce7cd kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2019-10-07  1342  		return -EAGAIN;
00157807cce7cd kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2019-10-07  1343  	}
00157807cce7cd kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2019-10-07  1344  
00157807cce7cd kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2019-10-07 @1345         BUG_ON(rt_mutex_real_waiter(task->pi_blocked_on));
00157807cce7cd kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2019-10-07  1346  
8dac456a681bd9 kernel/rtmutex.c         Darren Hart               2009-04-03  1347  	waiter->task = task;
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1348  	waiter->lock = lock;
2d3d891d334415 kernel/locking/rtmutex.c Dario Faggioli            2013-11-07  1349  	waiter->prio = task->prio;
e0aad5b44ff5d2 kernel/locking/rtmutex.c Peter Zijlstra            2017-03-23  1350  	waiter->deadline = task->dl.deadline;
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1351  
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1352  	/* Get the top priority waiter on the lock */
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1353  	if (rt_mutex_has_waiters(lock))
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1354  		top_waiter = rt_mutex_top_waiter(lock);
fb00aca474405f kernel/locking/rtmutex.c Peter Zijlstra            2013-11-07  1355  	rt_mutex_enqueue(lock, waiter);
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1356  
8dac456a681bd9 kernel/rtmutex.c         Darren Hart               2009-04-03  1357  	task->pi_blocked_on = waiter;
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1358  
b4abf91047cf05 kernel/locking/rtmutex.c Thomas Gleixner           2016-01-13  1359  	raw_spin_unlock(&task->pi_lock);
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1360  
8161239a8bcce9 kernel/rtmutex.c         Lai Jiangshan             2011-01-14  1361  	if (!owner)
8161239a8bcce9 kernel/rtmutex.c         Lai Jiangshan             2011-01-14  1362  		return 0;
8161239a8bcce9 kernel/rtmutex.c         Lai Jiangshan             2011-01-14  1363  
b4abf91047cf05 kernel/locking/rtmutex.c Thomas Gleixner           2016-01-13  1364  	raw_spin_lock(&owner->pi_lock);
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner           2014-06-05  1365  	if (waiter == rt_mutex_top_waiter(lock)) {
fb00aca474405f kernel/locking/rtmutex.c Peter Zijlstra            2013-11-07  1366  		rt_mutex_dequeue_pi(owner, top_waiter);
fb00aca474405f kernel/locking/rtmutex.c Peter Zijlstra            2013-11-07  1367  		rt_mutex_enqueue_pi(owner, waiter);
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1368  
acd58620e415ae kernel/locking/rtmutex.c Peter Zijlstra            2017-03-23  1369  		rt_mutex_adjust_prio(owner);
00157807cce7cd kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2019-10-07  1370  		if (rt_mutex_real_waiter(owner->pi_blocked_on))
db630637b2f192 kernel/rtmutex.c         Steven Rostedt            2006-09-29  1371  			chain_walk = 1;
8930ed80f970a9 kernel/locking/rtmutex.c Thomas Gleixner           2014-05-22  1372  	} else if (rt_mutex_cond_detect_deadlock(waiter, chwalk)) {
db630637b2f192 kernel/rtmutex.c         Steven Rostedt            2006-09-29  1373  		chain_walk = 1;
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner           2014-06-05  1374  	}
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner           2014-06-05  1375  
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner           2014-06-05  1376  	/* Store the lock on which owner is blocked or NULL */
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner           2014-06-05  1377  	next_lock = task_blocked_on_lock(owner);
db630637b2f192 kernel/rtmutex.c         Steven Rostedt            2006-09-29  1378  
b4abf91047cf05 kernel/locking/rtmutex.c Thomas Gleixner           2016-01-13  1379  	raw_spin_unlock(&owner->pi_lock);
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner           2014-06-05  1380  	/*
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner           2014-06-05  1381  	 * Even if full deadlock detection is on, if the owner is not
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner           2014-06-05  1382  	 * blocked itself, we can avoid finding this out in the chain
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner           2014-06-05  1383  	 * walk.
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner           2014-06-05  1384  	 */
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner           2014-06-05  1385  	if (!chain_walk || !next_lock)
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1386  		return 0;
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1387  
db630637b2f192 kernel/rtmutex.c         Steven Rostedt            2006-09-29  1388  	/*
db630637b2f192 kernel/rtmutex.c         Steven Rostedt            2006-09-29  1389  	 * The owner can't disappear while holding a lock,
db630637b2f192 kernel/rtmutex.c         Steven Rostedt            2006-09-29  1390  	 * so the owner struct is protected by wait_lock.
db630637b2f192 kernel/rtmutex.c         Steven Rostedt            2006-09-29  1391  	 * Gets dropped in rt_mutex_adjust_prio_chain()!
db630637b2f192 kernel/rtmutex.c         Steven Rostedt            2006-09-29  1392  	 */
db630637b2f192 kernel/rtmutex.c         Steven Rostedt            2006-09-29  1393  	get_task_struct(owner);
db630637b2f192 kernel/rtmutex.c         Steven Rostedt            2006-09-29  1394  
b4abf91047cf05 kernel/locking/rtmutex.c Thomas Gleixner           2016-01-13  1395  	raw_spin_unlock_irq(&lock->wait_lock);
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1396  
8930ed80f970a9 kernel/locking/rtmutex.c Thomas Gleixner           2014-05-22  1397  	res = rt_mutex_adjust_prio_chain(owner, chwalk, lock,
82084984383bab kernel/locking/rtmutex.c Thomas Gleixner           2014-06-05  1398  					 next_lock, waiter, task);
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1399  
b4abf91047cf05 kernel/locking/rtmutex.c Thomas Gleixner           2016-01-13  1400  	raw_spin_lock_irq(&lock->wait_lock);
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1401  
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1402  	return res;
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1403  }
23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  1404  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
