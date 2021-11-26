Content-Type: multipart/mixed; boundary="===============2709681689275266753=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/locking/rtmutex.c:1375 rt_mutex_slowunlock() warn: inconsistent returns '&lock->wait_lock'.
Date: Fri, 26 Nov 2021 13:22:05 +0800
Message-ID: <202111261328.OIntL6AN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2709681689275266753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a4849f6000e29235a2707f22e39da6b897bb9543
commit: 70c80103aafdeae99126694bc1cd54de016bc258 locking/rtmutex: Consolida=
te the fast/slowpath invocation
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: ia64-randconfig-m031-20211122 (https://download.01.org/0day-ci/arch=
ive/20211126/202111261328.OIntL6AN-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/locking/rtmutex.c:1375 rt_mutex_slowunlock() warn: inconsistent retu=
rns '&lock->wait_lock'.
kernel/locking/rtmutex.c:1375 rt_mutex_slowunlock() warn: inconsistent retu=
rns 'flags'.

vim +1375 kernel/locking/rtmutex.c

70c80103aafdeae kernel/locking/rtmutex.c Thomas Gleixner           2021-03-=
26  1311  =

23f78d4a03c53cb kernel/rtmutex.c         Ingo Molnar               2006-06-=
27  1312  /*
802ab58da74bb49 kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2015-06-=
17  1313   * Slow path to release a rt-mutex.
aa2bfe55366552c kernel/locking/rtmutex.c Peter Zijlstra            2017-03-=
23  1314   *
aa2bfe55366552c kernel/locking/rtmutex.c Peter Zijlstra            2017-03-=
23  1315   * Return whether the current task needs to call rt_mutex_postunl=
ock().
23f78d4a03c53cb kernel/rtmutex.c         Ingo Molnar               2006-06-=
27  1316   */
70c80103aafdeae kernel/locking/rtmutex.c Thomas Gleixner           2021-03-=
26  1317  static void __sched rt_mutex_slowunlock(struct rt_mutex *lock)
23f78d4a03c53cb kernel/rtmutex.c         Ingo Molnar               2006-06-=
27  1318  {
70c80103aafdeae kernel/locking/rtmutex.c Thomas Gleixner           2021-03-=
26  1319  	DEFINE_WAKE_Q(wake_q);
b4abf91047cf054 kernel/locking/rtmutex.c Thomas Gleixner           2016-01-=
13  1320  	unsigned long flags;
b4abf91047cf054 kernel/locking/rtmutex.c Thomas Gleixner           2016-01-=
13  1321  =

b4abf91047cf054 kernel/locking/rtmutex.c Thomas Gleixner           2016-01-=
13  1322  	/* irqsave required to support early boot calls */
b4abf91047cf054 kernel/locking/rtmutex.c Thomas Gleixner           2016-01-=
13  1323  	raw_spin_lock_irqsave(&lock->wait_lock, flags);
23f78d4a03c53cb kernel/rtmutex.c         Ingo Molnar               2006-06-=
27  1324  =

23f78d4a03c53cb kernel/rtmutex.c         Ingo Molnar               2006-06-=
27  1325  	debug_rt_mutex_unlock(lock);
23f78d4a03c53cb kernel/rtmutex.c         Ingo Molnar               2006-06-=
27  1326  =

27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1327  	/*
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1328  	 * We must be careful here if the fast path is enabled. If we
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1329  	 * have no waiters queued we cannot set owner to NULL here
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1330  	 * because of:
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1331  	 *
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1332  	 * foo->lock->owner =3D NULL;
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1333  	 *			rtmutex_lock(foo->lock);   <- fast path
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1334  	 *			free =3D atomic_dec_and_test(foo->refcnt);
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1335  	 *			rtmutex_unlock(foo->lock); <- fast path
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1336  	 *			if (free)
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1337  	 *				kfree(foo);
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1338  	 * raw_spin_unlock(foo->lock->wait_lock);
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1339  	 *
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1340  	 * So for the fastpath enabled kernel:
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1341  	 *
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1342  	 * Nothing can set the waiters bit as long as we hold
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1343  	 * lock->wait_lock. So we do the following sequence:
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1344  	 *
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1345  	 *	owner =3D rt_mutex_owner(lock);
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1346  	 *	clear_rt_mutex_waiters(lock);
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1347  	 *	raw_spin_unlock(&lock->wait_lock);
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1348  	 *	if (cmpxchg(&lock->owner, owner, 0) =3D=3D owner)
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1349  	 *		return;
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1350  	 *	goto retry;
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1351  	 *
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1352  	 * The fastpath disabled variant is simple as all access to
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1353  	 * lock->owner is serialized by lock->wait_lock:
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1354  	 *
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1355  	 *	lock->owner =3D NULL;
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1356  	 *	raw_spin_unlock(&lock->wait_lock);
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1357  	 */
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1358  	while (!rt_mutex_has_waiters(lock)) {
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1359  		/* Drops lock->wait_lock ! */
b4abf91047cf054 kernel/locking/rtmutex.c Thomas Gleixner           2016-01-=
13  1360  		if (unlock_rt_mutex_safe(lock, flags) =3D=3D true)
70c80103aafdeae kernel/locking/rtmutex.c Thomas Gleixner           2021-03-=
26  1361  			return;
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1362  		/* Relock the rtmutex and try again */
b4abf91047cf054 kernel/locking/rtmutex.c Thomas Gleixner           2016-01-=
13  1363  		raw_spin_lock_irqsave(&lock->wait_lock, flags);
23f78d4a03c53cb kernel/rtmutex.c         Ingo Molnar               2006-06-=
27  1364  	}
23f78d4a03c53cb kernel/rtmutex.c         Ingo Molnar               2006-06-=
27  1365  =

27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1366  	/*
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1367  	 * The wakeup next waiter path does not suffer from the above
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1368  	 * race. See the comments there.
45ab4effc3bee6f kernel/locking/rtmutex.c Davidlohr Bueso           2015-05-=
19  1369  	 *
45ab4effc3bee6f kernel/locking/rtmutex.c Davidlohr Bueso           2015-05-=
19  1370  	 * Queue the next waiter for wakeup once we release the wait_loc=
k.
27e35715df54cbc kernel/locking/rtmutex.c Thomas Gleixner           2014-06-=
11  1371  	 */
70c80103aafdeae kernel/locking/rtmutex.c Thomas Gleixner           2021-03-=
26  1372  	mark_wakeup_next_waiter(&wake_q, lock);
b4abf91047cf054 kernel/locking/rtmutex.c Thomas Gleixner           2016-01-=
13  1373  	raw_spin_unlock_irqrestore(&lock->wait_lock, flags);
23f78d4a03c53cb kernel/rtmutex.c         Ingo Molnar               2006-06-=
27  1374  =

70c80103aafdeae kernel/locking/rtmutex.c Thomas Gleixner           2021-03-=
26 @1375  	rt_mutex_postunlock(&wake_q);
23f78d4a03c53cb kernel/rtmutex.c         Ingo Molnar               2006-06-=
27  1376  }
23f78d4a03c53cb kernel/rtmutex.c         Ingo Molnar               2006-06-=
27  1377  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2709681689275266753==--

