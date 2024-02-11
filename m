Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5846CFBF0
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Feb 2024 04:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707627051; cv=none; b=CvO8etIiKHK3SBtrbYrRstdkNE6eJP30NR7CUQcvMT3PPS1VCxy9MFvugGipGZpz1FdptXpYz8AzWP6AhJ86cPa2sMHOXHoyoo0aB+bvFqu/Y/geBlKqQQYyxG7i6dTPh/t8dkP5mbaJIOQPlhBk+4KAnL1VxrdMg+wXqr16wbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707627051; c=relaxed/simple;
	bh=IBP/9p05uKSJiujKIUqSsEeDOyh2GCDOMYTL7rEiUjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AmdBKdxS2hqsx03ofKS9x8EH1VN7yafJVLCmXK1oOyEp3UFXfkEf5DNBqjAh9tVgA9JH3sbnn533YknI8vPEulFd7t59O+/CaNjvDVbkUoxSkfB7h75eCzxn9ToTrQDmmruKVlNDPDRGjgzXxaTrrnMFf6XqUo39cQ9jwBPzO08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DtS2NMGW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DtS2NMGW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707627049; x=1739163049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IBP/9p05uKSJiujKIUqSsEeDOyh2GCDOMYTL7rEiUjw=;
  b=DtS2NMGWgVtUQUpzFXczqAGP3fqjP0Ba/jkHn4cT8TerCm5NskIyDzy2
   luYIh2wkmDiu369KSbgkXl4xeozQaYlt7OpBS3cYUbvTq7rRoVcDUVS61
   +s1ReUVsderZ/iBmIJai2qA9R/ZJgDPcFjHhNm2XF8Bd3gVW2dgpxq4dL
   CSNzgSDbt8Ln6ijsbtmmdbdY3cSpGO5xUDbAY2K3il0LzVZXFym/0lOWb
   Au34OGxvOcgWB0lfYxYGLh8dYGzhdPIoc5qunYXD1gNg03FzMBD0OZYNn
   L60U8DiM3PPX2CvuXleL36F2ytKGJKKVA+7zLN2ft7l1DfNPovwun8t2y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="12979776"
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="12979776"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 20:50:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="825510048"
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="825510048"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 Feb 2024 20:50:46 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZ1ng-0006KQ-24;
	Sun, 11 Feb 2024 04:50:44 +0000
Date: Sun, 11 Feb 2024 12:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-vfs:vfs.pidfd 15/15] kernel/signal.c:3963
 __do_sys_pidfd_send_signal() error: uninitialized symbol 'type'.
Message-ID: <202402111212.MwpHqZHA-lkp@intel.com>
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
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>
CC: Oleg Nesterov <oleg@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.pidfd
head:   3f643cd2351099e6b859533b6f984463e5315e5f
commit: 3f643cd2351099e6b859533b6f984463e5315e5f [15/15] pidfd: allow to override signal scope in pidfd_send_signal()
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-randconfig-141-20240211 (https://download.01.org/0day-ci/archive/20240211/202402111212.MwpHqZHA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402111212.MwpHqZHA-lkp@intel.com/

smatch warnings:
kernel/signal.c:3963 __do_sys_pidfd_send_signal() error: uninitialized symbol 'type'.
kernel/signal.c:3963 __do_sys_pidfd_send_signal() error: uninitialized symbol 'type'.

vim +/type +3963 kernel/signal.c

2151ad1b067275 Christian Brauner 2019-04-17  3878  
3f643cd2351099 Christian Brauner 2024-02-09  3879  #define PIDFD_SEND_SIGNAL_FLAGS                            \
3f643cd2351099 Christian Brauner 2024-02-09  3880  	(PIDFD_SIGNAL_THREAD | PIDFD_SIGNAL_THREAD_GROUP | \
3f643cd2351099 Christian Brauner 2024-02-09  3881  	 PIDFD_SIGNAL_PROCESS_GROUP)
3f643cd2351099 Christian Brauner 2024-02-09  3882  
3eb39f47934f9d Christian Brauner 2018-11-19  3883  /**
c732327f04a381 Christian Brauner 2019-06-04  3884   * sys_pidfd_send_signal - Signal a process through a pidfd
c732327f04a381 Christian Brauner 2019-06-04  3885   * @pidfd:  file descriptor of the process
c732327f04a381 Christian Brauner 2019-06-04  3886   * @sig:    signal to send
c732327f04a381 Christian Brauner 2019-06-04  3887   * @info:   signal info
c732327f04a381 Christian Brauner 2019-06-04  3888   * @flags:  future flags
3eb39f47934f9d Christian Brauner 2018-11-19  3889   *
81b9d8ac0640b2 Oleg Nesterov     2024-02-09  3890   * Send the signal to the thread group or to the individual thread depending
81b9d8ac0640b2 Oleg Nesterov     2024-02-09  3891   * on PIDFD_THREAD.
81b9d8ac0640b2 Oleg Nesterov     2024-02-09  3892   * In the future extension to @flags may be used to override the default scope
81b9d8ac0640b2 Oleg Nesterov     2024-02-09  3893   * of @pidfd.
3eb39f47934f9d Christian Brauner 2018-11-19  3894   *
3eb39f47934f9d Christian Brauner 2018-11-19  3895   * Return: 0 on success, negative errno on failure
3eb39f47934f9d Christian Brauner 2018-11-19  3896   */
3eb39f47934f9d Christian Brauner 2018-11-19  3897  SYSCALL_DEFINE4(pidfd_send_signal, int, pidfd, int, sig,
3eb39f47934f9d Christian Brauner 2018-11-19  3898  		siginfo_t __user *, info, unsigned int, flags)
3eb39f47934f9d Christian Brauner 2018-11-19  3899  {
3eb39f47934f9d Christian Brauner 2018-11-19  3900  	int ret;
3eb39f47934f9d Christian Brauner 2018-11-19  3901  	struct fd f;
3eb39f47934f9d Christian Brauner 2018-11-19  3902  	struct pid *pid;
3eb39f47934f9d Christian Brauner 2018-11-19  3903  	kernel_siginfo_t kinfo;
81b9d8ac0640b2 Oleg Nesterov     2024-02-09  3904  	enum pid_type type;
3eb39f47934f9d Christian Brauner 2018-11-19  3905  
3eb39f47934f9d Christian Brauner 2018-11-19  3906  	/* Enforce flags be set to 0 until we add an extension. */
3f643cd2351099 Christian Brauner 2024-02-09  3907  	if (flags & ~PIDFD_SEND_SIGNAL_FLAGS)
3f643cd2351099 Christian Brauner 2024-02-09  3908  		return -EINVAL;
3f643cd2351099 Christian Brauner 2024-02-09  3909  
3f643cd2351099 Christian Brauner 2024-02-09  3910  	/* Ensure that only a single signal scope determining flag is set. */
3f643cd2351099 Christian Brauner 2024-02-09  3911  	if (hweight32(flags & PIDFD_SEND_SIGNAL_FLAGS) > 1)
3eb39f47934f9d Christian Brauner 2018-11-19  3912  		return -EINVAL;
3eb39f47934f9d Christian Brauner 2018-11-19  3913  
738a7832d21e3d Christian Brauner 2019-04-18  3914  	f = fdget(pidfd);
3eb39f47934f9d Christian Brauner 2018-11-19  3915  	if (!f.file)
3eb39f47934f9d Christian Brauner 2018-11-19  3916  		return -EBADF;
3eb39f47934f9d Christian Brauner 2018-11-19  3917  
3eb39f47934f9d Christian Brauner 2018-11-19  3918  	/* Is this a pidfd? */
2151ad1b067275 Christian Brauner 2019-04-17  3919  	pid = pidfd_to_pid(f.file);
3eb39f47934f9d Christian Brauner 2018-11-19  3920  	if (IS_ERR(pid)) {
3eb39f47934f9d Christian Brauner 2018-11-19  3921  		ret = PTR_ERR(pid);
3eb39f47934f9d Christian Brauner 2018-11-19  3922  		goto err;
3eb39f47934f9d Christian Brauner 2018-11-19  3923  	}
3eb39f47934f9d Christian Brauner 2018-11-19  3924  
3eb39f47934f9d Christian Brauner 2018-11-19  3925  	ret = -EINVAL;
3eb39f47934f9d Christian Brauner 2018-11-19  3926  	if (!access_pidfd_pidns(pid))
3eb39f47934f9d Christian Brauner 2018-11-19  3927  		goto err;
3eb39f47934f9d Christian Brauner 2018-11-19  3928  
3f643cd2351099 Christian Brauner 2024-02-09  3929  	switch (flags) {
3f643cd2351099 Christian Brauner 2024-02-09  3930  	case 0:
3f643cd2351099 Christian Brauner 2024-02-09  3931  		/* Infer scope from the type of pidfd. */
81b9d8ac0640b2 Oleg Nesterov     2024-02-09  3932  		if (f.file->f_flags & PIDFD_THREAD)
81b9d8ac0640b2 Oleg Nesterov     2024-02-09  3933  			type = PIDTYPE_PID;
81b9d8ac0640b2 Oleg Nesterov     2024-02-09  3934  		else
81b9d8ac0640b2 Oleg Nesterov     2024-02-09  3935  			type = PIDTYPE_TGID;
3f643cd2351099 Christian Brauner 2024-02-09  3936  		break;
3f643cd2351099 Christian Brauner 2024-02-09  3937  	case PIDFD_SIGNAL_THREAD:
3f643cd2351099 Christian Brauner 2024-02-09  3938  		type = PIDTYPE_PID;
3f643cd2351099 Christian Brauner 2024-02-09  3939  		break;
3f643cd2351099 Christian Brauner 2024-02-09  3940  	case PIDFD_SIGNAL_THREAD_GROUP:
3f643cd2351099 Christian Brauner 2024-02-09  3941  		type = PIDTYPE_TGID;
3f643cd2351099 Christian Brauner 2024-02-09  3942  		break;
3f643cd2351099 Christian Brauner 2024-02-09  3943  	case PIDFD_SIGNAL_PROCESS_GROUP:
3f643cd2351099 Christian Brauner 2024-02-09  3944  		type = PIDTYPE_PGID;
3f643cd2351099 Christian Brauner 2024-02-09  3945  		break;
3f643cd2351099 Christian Brauner 2024-02-09  3946  	}
81b9d8ac0640b2 Oleg Nesterov     2024-02-09  3947  
3eb39f47934f9d Christian Brauner 2018-11-19  3948  	if (info) {
3eb39f47934f9d Christian Brauner 2018-11-19  3949  		ret = copy_siginfo_from_user_any(&kinfo, info);
3eb39f47934f9d Christian Brauner 2018-11-19  3950  		if (unlikely(ret))
3eb39f47934f9d Christian Brauner 2018-11-19  3951  			goto err;
3eb39f47934f9d Christian Brauner 2018-11-19  3952  
3eb39f47934f9d Christian Brauner 2018-11-19  3953  		ret = -EINVAL;
3eb39f47934f9d Christian Brauner 2018-11-19  3954  		if (unlikely(sig != kinfo.si_signo))
3eb39f47934f9d Christian Brauner 2018-11-19  3955  			goto err;
3eb39f47934f9d Christian Brauner 2018-11-19  3956  
3eb39f47934f9d Christian Brauner 2018-11-19  3957  		/* Only allow sending arbitrary signals to yourself. */
3eb39f47934f9d Christian Brauner 2018-11-19  3958  		ret = -EPERM;
556a888a14afe2 Jann Horn         2019-03-30  3959  		if ((task_pid(current) != pid) &&
556a888a14afe2 Jann Horn         2019-03-30  3960  		    (kinfo.si_code >= 0 || kinfo.si_code == SI_TKILL))
3eb39f47934f9d Christian Brauner 2018-11-19  3961  			goto err;
3eb39f47934f9d Christian Brauner 2018-11-19  3962  	} else {
81b9d8ac0640b2 Oleg Nesterov     2024-02-09 @3963  		prepare_kill_siginfo(sig, &kinfo, type);
3eb39f47934f9d Christian Brauner 2018-11-19  3964  	}
3eb39f47934f9d Christian Brauner 2018-11-19  3965  
3f643cd2351099 Christian Brauner 2024-02-09  3966  	if (type == PIDTYPE_PGID)
3f643cd2351099 Christian Brauner 2024-02-09  3967  		ret = kill_pgrp_info(sig, &kinfo, pid);
3f643cd2351099 Christian Brauner 2024-02-09  3968  	else
81b9d8ac0640b2 Oleg Nesterov     2024-02-09  3969  		ret = kill_pid_info_type(sig, &kinfo, pid, type);
3eb39f47934f9d Christian Brauner 2018-11-19  3970  err:
3eb39f47934f9d Christian Brauner 2018-11-19  3971  	fdput(f);
3eb39f47934f9d Christian Brauner 2018-11-19  3972  	return ret;
3eb39f47934f9d Christian Brauner 2018-11-19  3973  }
3eb39f47934f9d Christian Brauner 2018-11-19  3974  

:::::: The code at line 3963 was first introduced by commit
:::::: 81b9d8ac0640b285a3c369cd41a85f6c240d3a60 pidfd: change pidfd_send_signal() to respect PIDFD_THREAD

:::::: TO: Oleg Nesterov <oleg@redhat.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
