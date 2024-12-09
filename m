Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221DD15AD9C
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 05:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720951; cv=none; b=aiidJ609mAbragSgxZcn+viUyNEnXiPsFlt1ivIgjJRie88+8t4dLUqx89pVmxmPsbi2c3G84g2AzPsz+UNdWwKFencgm64CvEzPyhPyTfEXfu6UAWGQZvczc2Gu3xcX5Fwj+6lfj+q1LqWVfP7ZGbQXhU7H5ZmwuVfhguuye7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720951; c=relaxed/simple;
	bh=bNUEiGkn6iHtQiIn1CoYk66YmMS8lfZzrUwLONM5jgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PbKBy076qVF2DauXAEBhTJD70bqLeGLNwDed3nTJk2bvCiv7SHdDlcns6JPCmf9MtcEI5akleM+lOImafKcgZyoh7+PrvnLIYJtC9UkIYGeV7PaOlphIwcCviJCaS4qqZPbqgaey6Li939dfI2vzPO/NWSAVJP/zLlGvJvpq57g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+nmkW0L; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+nmkW0L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733720949; x=1765256949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bNUEiGkn6iHtQiIn1CoYk66YmMS8lfZzrUwLONM5jgQ=;
  b=m+nmkW0LsMAU9OtgWrRykiErV/qVydWhDZF7x7A92fJTQQyUzEJOtgS0
   pAToFP7aJjX3jDWsAjQ81HOakO5VLgqHiykeywH8vqbPq8fSRQ6SqQJVt
   YpPFIQfh+gINgSMQfRGXduhVwsHFV/JaBN2urnwz3vCBO372B1Be285lN
   0PBWNuHia+96Ups9/vcuuNAXW8Xu3Iu8j2oShMpx4RfRG6OwqYKa6AkIN
   hFq27uVz00aB3B2G57eVnDLt6l59ik8KXgPzK5EV9tpxXxLSXKGTAnPwA
   pImAjGXDJ1k4Z1gR27i/i1H+pwvBDGBDCLsUsqCTwM5mrFDsskNbQkUZ7
   Q==;
X-CSE-ConnectionGUID: UYXmGbUmTo+BY5VhlS1nlg==
X-CSE-MsgGUID: hjulMOu3SkibVebbJ2xdGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="45017457"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="45017457"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 21:08:46 -0800
X-CSE-ConnectionGUID: jBGsrPMOT9CuEdqyhj6Phg==
X-CSE-MsgGUID: Y1e/p0ChRdq4l/kCNZtEbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94833952"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Dec 2024 21:08:44 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKW0f-0003xv-2X;
	Mon, 09 Dec 2024 05:08:41 +0000
Date: Mon, 9 Dec 2024 13:08:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bigeasy-staging:futex_local_v4.5 6/11] kernel/futex/pi.c:1205
 futex_unlock_pi() warn: bitwise AND condition is false here
Message-ID: <202412091000.qtDSxcrs-lkp@intel.com>
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
TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git futex_local_v4.5
head:   9d2ce92c85945509103b52a80a01735d48490c96
commit: 40d4ad3aa9b6cc1645e51d06dadca2f39fc72e9d [6/11] futex: Allow to re-allocate the private hash bucket.
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-r071-20241209 (https://download.01.org/0day-ci/archive/20241209/202412091000.qtDSxcrs-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412091000.qtDSxcrs-lkp@intel.com/

smatch warnings:
kernel/futex/pi.c:1205 futex_unlock_pi() warn: bitwise AND condition is false here

vim +1205 kernel/futex/pi.c

85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1187  
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1188  /*
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1189   * Userspace attempted a TID -> 0 atomic transition, and failed.
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1190   * This is the in-kernel slowpath: we look up the PI state (if any),
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1191   * and do the rt-mutex unlock.
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1192   */
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1193  int futex_unlock_pi(u32 __user *uaddr, unsigned int flags)
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1194  {
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1195  	u32 curval, uval, vpid = task_pid_vnr(current);
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1196  	union futex_key key = FUTEX_KEY_INIT;
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1197  	struct rw_semaphore *futex_hash_lock = NULL;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1198  	struct futex_hash_bucket *hb;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1199  	struct futex_q *top_waiter;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1200  	int ret;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1201  
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1202  	if (!IS_ENABLED(CONFIG_FUTEX_PI))
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1203  		return -ENOSYS;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1204  
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15 @1205  	if (!(flags & FLAGS_SHARED))
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1206  		futex_hash_lock = &current->mm->futex_hash_lock;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1207  retry:
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1208  	if (get_user(uval, uaddr))
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1209  		return -EFAULT;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1210  	/*
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1211  	 * We release only a lock we actually own:
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1212  	 */
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1213  	if ((uval & FUTEX_TID_MASK) != vpid)
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1214  		return -EPERM;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1215  
3b63a55f498b763 peterz@infradead.org      2023-09-21  1216  	ret = get_futex_key(uaddr, flags, &key, FUTEX_WRITE);
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1217  	if (ret)
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1218  		return ret;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1219  
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1220  	hb = futex_hash(&key);
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1221  	spin_lock(&hb->lock);
e626cb02ee8399f Sebastian Andrzej Siewior 2024-01-18  1222  retry_hb:
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1223  
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1224  	/*
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1225  	 * Check waiters first. We do not trust user space values at
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1226  	 * all and we at least want to know if user space fiddled
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1227  	 * with the futex value instead of blindly unlocking.
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1228  	 */
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1229  	top_waiter = futex_top_waiter(hb, &key);
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1230  	if (top_waiter) {
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1231  		struct futex_pi_state *pi_state = top_waiter->pi_state;
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1232  		struct rt_mutex_waiter *rt_waiter;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1233  
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1234  		ret = -EINVAL;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1235  		if (!pi_state)
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1236  			goto out_unlock;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1237  
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1238  		/*
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1239  		 * If current does not own the pi_state then the futex is
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1240  		 * inconsistent and user space fiddled with the futex value.
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1241  		 */
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1242  		if (pi_state->owner != current)
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1243  			goto out_unlock;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1244  
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1245  		/*
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1246  		 * By taking wait_lock while still holding hb->lock, we ensure
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1247  		 * there is no point where we hold neither; and thereby
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1248  		 * wake_futex_pi() must observe any new waiters.
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1249  		 *
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1250  		 * Since the cleanup: case in futex_lock_pi() removes the
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1251  		 * rt_waiter without holding hb->lock, it is possible for
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1252  		 * wake_futex_pi() to not find a waiter while the above does,
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1253  		 * in this case the waiter is on the way out and it can be
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1254  		 * ignored.
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1255  		 *
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1256  		 * In particular; this forces __rt_mutex_start_proxy() to
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1257  		 * complete such that we're guaranteed to observe the
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1258  		 * rt_waiter.
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1259  		 */
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1260  		raw_spin_lock_irq(&pi_state->pi_mutex.wait_lock);
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1261  
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1262  		/*
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1263  		 * Futex vs rt_mutex waiter state -- if there are no rt_mutex
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1264  		 * waiters even though futex thinks there are, then the waiter
e626cb02ee8399f Sebastian Andrzej Siewior 2024-01-18  1265  		 * is leaving. The entry needs to be removed from the list so a
e626cb02ee8399f Sebastian Andrzej Siewior 2024-01-18  1266  		 * new futex_lock_pi() is not using this stale PI-state while
e626cb02ee8399f Sebastian Andrzej Siewior 2024-01-18  1267  		 * the futex is available in user space again.
e626cb02ee8399f Sebastian Andrzej Siewior 2024-01-18  1268  		 * There can be more than one task on its way out so it needs
e626cb02ee8399f Sebastian Andrzej Siewior 2024-01-18  1269  		 * to retry.
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1270  		 */
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1271  		rt_waiter = rt_mutex_top_waiter(&pi_state->pi_mutex);
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1272  		if (!rt_waiter) {
e626cb02ee8399f Sebastian Andrzej Siewior 2024-01-18  1273  			__futex_unqueue(top_waiter);
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1274  			raw_spin_unlock_irq(&pi_state->pi_mutex.wait_lock);
e626cb02ee8399f Sebastian Andrzej Siewior 2024-01-18  1275  			goto retry_hb;
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1276  		}
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1277  
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1278  		get_pi_state(pi_state);
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1279  		spin_unlock(&hb->lock);
6df37a9175b2332 Sebastian Andrzej Siewior 2024-11-14  1280  		futex_hash_put(hb);
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1281  
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1282  		/* drops pi_state->pi_mutex.wait_lock */
fbeb558b0dd0d63 Peter Zijlstra            2023-09-15  1283  		ret = wake_futex_pi(uaddr, uval, pi_state, rt_waiter);
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1284  
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1285  		put_pi_state(pi_state);
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1286  
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1287  		/*
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1288  		 * Success, we're done! No tricky corner cases.
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1289  		 */
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1290  		if (!ret)
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1291  			return ret;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1292  		/*
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1293  		 * The atomic access to the futex value generated a
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1294  		 * pagefault, so retry the user-access and the wakeup:
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1295  		 */
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1296  		if (ret == -EFAULT)
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1297  			goto pi_faulted;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1298  		/*
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1299  		 * A unconditional UNLOCK_PI op raced against a waiter
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1300  		 * setting the FUTEX_WAITERS bit. Try again.
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1301  		 */
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1302  		if (ret == -EAGAIN)
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1303  			goto pi_retry;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1304  		/*
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1305  		 * wake_futex_pi has detected invalid state. Tell user
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1306  		 * space.
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1307  		 */
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1308  		return ret;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1309  	}
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1310  
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1311  	/*
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1312  	 * If the hb changed before the following cmpxchg finished then the
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1313  	 * situtation gets complicated as we don't own the lock anymore but
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1314  	 * there could be an internal state recorded under our name by the
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1315  	 * waiter under a different hb->lock. Also the PI-lock could be snuck in
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1316  	 * userland so there is no guarantee that we get it back.
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1317  	 * To avoid the mess due to this tiny race, ensure that the HB can not
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1318  	 * be resized while the PI lock with no owner is unlocked.
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1319  	 */
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1320  	if (futex_hash_lock) {
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1321  		spin_unlock(&hb->lock);
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1322  		down_read(futex_hash_lock);
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1323  		spin_lock(&hb->lock);
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1324  
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1325  		if (!futex_check_hb_valid(hb)) {
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1326  			spin_unlock(&hb->lock);
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1327  			up_read(futex_hash_lock);
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1328  			futex_hash_put(hb);
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1329  			goto retry;
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1330  		}
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1331  		if (futex_top_waiter(hb, &key)) {
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1332  			up_read(futex_hash_lock);
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1333  			goto retry_hb;
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1334  		}
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1335  	}
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1336  
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1337  	/*
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1338  	 * We have no kernel internal state, i.e. no waiters in the
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1339  	 * kernel. Waiters which are about to queue themselves are stuck
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1340  	 * on hb->lock. So we can safely ignore them. We do neither
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1341  	 * preserve the WAITERS bit not the OWNER_DIED one. We are the
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1342  	 * owner.
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1343  	 */
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1344  	if ((ret = futex_cmpxchg_value_locked(&curval, uaddr, uval, 0))) {
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1345  		spin_unlock(&hb->lock);
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1346  		if (futex_hash_lock)
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1347  			up_read(futex_hash_lock);
6df37a9175b2332 Sebastian Andrzej Siewior 2024-11-14  1348  		futex_hash_put(hb);
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1349  		switch (ret) {
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1350  		case -EFAULT:
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1351  			goto pi_faulted;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1352  
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1353  		case -EAGAIN:
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1354  			goto pi_retry;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1355  
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1356  		default:
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1357  			WARN_ON_ONCE(1);
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1358  			return ret;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1359  		}
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1360  	}
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1361  	if (futex_hash_lock)
40d4ad3aa9b6cc1 Sebastian Andrzej Siewior 2024-11-15  1362  		up_read(futex_hash_lock);
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1363  
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1364  	/*
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1365  	 * If uval has changed, let user space handle it.
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1366  	 */
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1367  	ret = (curval == uval) ? 0 : -EAGAIN;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1368  
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1369  out_unlock:
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1370  	spin_unlock(&hb->lock);
6df37a9175b2332 Sebastian Andrzej Siewior 2024-11-14  1371  	futex_hash_put(hb);
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1372  	return ret;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1373  
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1374  pi_retry:
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1375  	cond_resched();
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1376  	goto retry;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1377  
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1378  pi_faulted:
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1379  
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1380  	ret = fault_in_user_writeable(uaddr);
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1381  	if (!ret)
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1382  		goto retry;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1383  
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1384  	return ret;
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1385  }
85dc28fa4ec0586 Peter Zijlstra            2021-09-23  1386  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
