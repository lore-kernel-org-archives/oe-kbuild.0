Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A633420B80F
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Feb 2025 23:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740441403; cv=none; b=p1BSWlUiJW1QWIs85MwsnzI17N9Wl5tNyl77S+Tw886EoLLgQPeg9LF80SbyWt6Oz/hmR8HzGr3f0JBArkbB3nw18BypQZ7oTgo2jhLcn1d9/bNVNFOKjrpLT9a3KFTHX60Krf19JZXrfe1+PBhYLe/XAg5JjO2tuW11wMAfyWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740441403; c=relaxed/simple;
	bh=vDBYXcfobFbDNQPF4SE/Jsx3+nLfYLS6VJarjzSWzYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a8x1qJ4jW81XwqfFB+q1WmtROy1WwPkNhqTC4553pHgeRozDDi6DzTvOO1f0mGGUjbrua4pusH+wy1TD+Jx46K+A3VAj5zAqHmTtQHcB4rWG+L4SY0yCTGDjDpl/WslRN4A+D67c0bToSpoNpJHS25thn75CFAlW6D8EuXvne10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MjsnFs1B; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjsnFs1B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740441401; x=1771977401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vDBYXcfobFbDNQPF4SE/Jsx3+nLfYLS6VJarjzSWzYc=;
  b=MjsnFs1BmK1u91OiGm7SNmSxI1MajBF6nAO8Y/KabGaPuBPwjmIKDw1m
   +kVJty1Gzg0xjELbHGshN+SxB+6L7IktqZjixSx+81+MvNScNNG+nDZcN
   0tjeIIWOhOCaTymv+sFqsJA9OJp/1Z2YCNhCGBG1hqYzoy4VLSFSUOehY
   Qu3Sr2BBzKTjpQco+iozGEhKjbn0wRyahIYxIREjDSTUCvfvzIEnj8DF4
   bJI9NYbmAGunRf/PiBSreymuPM1XGzgSzeKWneEMsJwGXRrXa39tF8LP2
   5iwnny0sWTHTemw+Jg/MspYh0SPk82XL4gbWzFiu2jHLFBeIJtpFYyHPX
   Q==;
X-CSE-ConnectionGUID: Ua8tZ2bkQoextBq7WNFdlQ==
X-CSE-MsgGUID: NVnXajztTj2ZjTQ9VY14/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51852060"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="51852060"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 15:56:25 -0800
X-CSE-ConnectionGUID: Srtbc+giRJm+YvsSeGcpgA==
X-CSE-MsgGUID: 5ijjCO9QSRG+GUNd/pScRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117129748"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 Feb 2025 15:56:23 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmiJB-0009TR-1L;
	Mon, 24 Feb 2025 23:56:21 +0000
Date: Tue, 25 Feb 2025 07:55:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tglx-devel:timers/posix 8/14] kernel/time/posix-timers.c:852
 timer_wait_running() warn: inconsistent returns '&timer->it_lock'.
Message-ID: <202502250737.fMTOUVfQ-lkp@intel.com>
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
head:   2f9ae35230ff61b3caa708359c745f375cf0c075
commit: 029c3a43aaca2ffc86a970704b469733b70fe88b [8/14] posix-timers: Rework timer removal
:::::: branch date: 17 hours ago
:::::: commit date: 24 hours ago
config: x86_64-randconfig-161-20250225 (https://download.01.org/0day-ci/archive/20250225/202502250737.fMTOUVfQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502250737.fMTOUVfQ-lkp@intel.com/

smatch warnings:
kernel/time/posix-timers.c:852 timer_wait_running() warn: inconsistent returns '&timer->it_lock'.

vim +852 kernel/time/posix-timers.c

ec8f954a40da8c Thomas Gleixner     2019-08-02  800  
0bee3b601b77db Frederic Weisbecker 2019-08-20  801  /*
7d990902664506 Thomas Gleixner     2023-04-25  802   * On PREEMPT_RT this prevents priority inversion and a potential livelock
7d990902664506 Thomas Gleixner     2023-04-25  803   * against the ksoftirqd thread in case that ksoftirqd gets preempted while
7d990902664506 Thomas Gleixner     2023-04-25  804   * executing a hrtimer callback.
7d990902664506 Thomas Gleixner     2023-04-25  805   *
7d990902664506 Thomas Gleixner     2023-04-25  806   * See the comments in hrtimer_cancel_wait_running(). For PREEMPT_RT=n this
7d990902664506 Thomas Gleixner     2023-04-25  807   * just results in a cpu_relax().
7d990902664506 Thomas Gleixner     2023-04-25  808   *
7d990902664506 Thomas Gleixner     2023-04-25  809   * For POSIX CPU timers with CONFIG_POSIX_CPU_TIMERS_TASK_WORK=n this is
7d990902664506 Thomas Gleixner     2023-04-25  810   * just a cpu_relax(). With CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y this
7d990902664506 Thomas Gleixner     2023-04-25  811   * prevents spinning on an eventually scheduled out task and a livelock
7d990902664506 Thomas Gleixner     2023-04-25  812   * when the task which tries to delete or disarm the timer has preempted
7d990902664506 Thomas Gleixner     2023-04-25  813   * the task which runs the expiry in task work context.
0bee3b601b77db Frederic Weisbecker 2019-08-20  814   */
029c3a43aaca2f Thomas Gleixner     2025-02-20  815  static struct k_itimer *timer_wait_running(struct k_itimer *timer, unsigned long *flags,
029c3a43aaca2f Thomas Gleixner     2025-02-20  816  					   bool delete)
6945e5c2abe008 Thomas Gleixner     2019-07-31  817  {
ec8f954a40da8c Thomas Gleixner     2019-08-02  818  	const struct k_clock *kc = READ_ONCE(timer->kclock);
6945e5c2abe008 Thomas Gleixner     2019-07-31  819  	timer_t timer_id = READ_ONCE(timer->it_id);
6945e5c2abe008 Thomas Gleixner     2019-07-31  820  
ec8f954a40da8c Thomas Gleixner     2019-08-02  821  	/* Prevent kfree(timer) after dropping the lock */
ec8f954a40da8c Thomas Gleixner     2019-08-02  822  	rcu_read_lock();
da7ae390d73a82 Thomas Gleixner     2025-02-20  823  	spin_unlock_irqrestore(&timer->it_lock, *flags);
ec8f954a40da8c Thomas Gleixner     2019-08-02  824  
f7abf14f0001a5 Thomas Gleixner     2023-04-17  825  	/*
029c3a43aaca2f Thomas Gleixner     2025-02-20  826  	 * kc->timer_wait_running() might drop RCU lock. So @timer cannot
029c3a43aaca2f Thomas Gleixner     2025-02-20  827  	 * be touched anymore after the function returns, except when
029c3a43aaca2f Thomas Gleixner     2025-02-20  828  	 * @delete is true!
f7abf14f0001a5 Thomas Gleixner     2023-04-17  829  	 */
ec8f954a40da8c Thomas Gleixner     2019-08-02  830  	if (!WARN_ON_ONCE(!kc->timer_wait_running))
ec8f954a40da8c Thomas Gleixner     2019-08-02  831  		kc->timer_wait_running(timer);
ec8f954a40da8c Thomas Gleixner     2019-08-02  832  
ec8f954a40da8c Thomas Gleixner     2019-08-02  833  	rcu_read_unlock();
029c3a43aaca2f Thomas Gleixner     2025-02-20  834  
029c3a43aaca2f Thomas Gleixner     2025-02-20  835  	/*
029c3a43aaca2f Thomas Gleixner     2025-02-20  836  	 * On deletion the timer has been marked invalid before
029c3a43aaca2f Thomas Gleixner     2025-02-20  837  	 * timer_delete_hook() has been invoked. That means that the
029c3a43aaca2f Thomas Gleixner     2025-02-20  838  	 * current task is the only one which has access to the timer and
029c3a43aaca2f Thomas Gleixner     2025-02-20  839  	 * even after dropping timer::it_lock above, no other thread can
029c3a43aaca2f Thomas Gleixner     2025-02-20  840  	 * have accessed the timer.
029c3a43aaca2f Thomas Gleixner     2025-02-20  841  	 */
029c3a43aaca2f Thomas Gleixner     2025-02-20  842  	if (delete) {
029c3a43aaca2f Thomas Gleixner     2025-02-20  843  		spin_lock_irqsave(&timer->it_lock, *flags);
029c3a43aaca2f Thomas Gleixner     2025-02-20  844  		return timer;
029c3a43aaca2f Thomas Gleixner     2025-02-20  845  	}
029c3a43aaca2f Thomas Gleixner     2025-02-20  846  
029c3a43aaca2f Thomas Gleixner     2025-02-20  847  	/*
029c3a43aaca2f Thomas Gleixner     2025-02-20  848  	 * If invoked from timer_set() the timer could have been deleted
029c3a43aaca2f Thomas Gleixner     2025-02-20  849  	 * after dropping the lock. So in that case the timer needs to be
029c3a43aaca2f Thomas Gleixner     2025-02-20  850  	 * looked up and validated.
029c3a43aaca2f Thomas Gleixner     2025-02-20  851  	 */
6945e5c2abe008 Thomas Gleixner     2019-07-31 @852  	return lock_timer(timer_id, flags);
6945e5c2abe008 Thomas Gleixner     2019-07-31  853  }
6945e5c2abe008 Thomas Gleixner     2019-07-31  854  

:::::: The code at line 852 was first introduced by commit
:::::: 6945e5c2abe008302b20266248d6de95575311a8 posix-timers: Rework cancel retry loops

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
