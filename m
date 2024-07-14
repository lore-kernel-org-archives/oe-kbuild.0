Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245D5BA2B
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jul 2024 16:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720975166; cv=none; b=c5FFl2phPmDCAr5HA3t2okXbtuL4brtS3nO3JSbhSDAQVOH/tAZ5RJt5torBPu7/ua58V63XzY+ok2z1ITn2cD2gacl6uTzr78Q7y2/KG6DEi2uOCKyaO+YhxEF2nOkOXt3zFSw9nZ+8dUWoS/XZAUVhpZRNRIMENwGp2KswaDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720975166; c=relaxed/simple;
	bh=PDgGaiAxJYha/9grKweqp+JD7cW+6dG2TSZqX0LO2xY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pk9eM5VHQEM4jS1u+8KhOmHz2tDcb10daYGRyrc0d95+mDowiD8ZconIbOuDgm/dSptlH8ASuOA3hZvutZulIUzvfCHpCpc+8P3IRsfMS9cH14memCSukkbcVmEW0N3NkJNbc7mN6o5ZjTx9QhK5ARHJ7I6i40Lr2c5HRajKwVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBtED+wt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBtED+wt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720975164; x=1752511164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PDgGaiAxJYha/9grKweqp+JD7cW+6dG2TSZqX0LO2xY=;
  b=UBtED+wtbmVtYL1Ub+rjFJAGMP1ADh94FYePaLAZQb832XIrSlucqEVO
   cS4SsOngtSHYFeuW8wIq1e1z2cen6UPHyB3t1xrg61yEdlZMKVLNc2YEB
   +zka2JKYimpmIcw2u/mZnburC7rj+yyqzZK4UlbS37BEaClnoSUcmX4f8
   7PO1v1lx850gdafi15+mVzWfLVwtfEYMm+vr8qi5qzVAuOYan++MjE1KF
   oEw58EIPOCFRU3Q96PFgKMc7jJ7MEkPyMk26NKmYnP9RuKsfP4FOaFVVU
   O7Qty6CSnERp1ONC/2KpUL3oOxKYKUE7lpmYTTNPWtbgoRCilXB4XMFjT
   g==;
X-CSE-ConnectionGUID: Bh5GrjcoQQuO2Yd3RwZsYw==
X-CSE-MsgGUID: K4PlpNqsR6agvUs7Pr9Jaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="17971749"
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="17971749"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 09:39:23 -0700
X-CSE-ConnectionGUID: 5o/XRS2cRJebI2cNEgxcDg==
X-CSE-MsgGUID: rkrEGV8sQEK43vDvu6UaDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="54226286"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Jul 2024 09:39:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sT2Fr-000das-3B;
	Sun, 14 Jul 2024 16:39:19 +0000
Date: Mon, 15 Jul 2024 00:38:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cip:linux-4.19.y-cip-rt-rebase 3529/9999] kernel/ptrace.c:205
 ptrace_unfreeze_traced() warn: mixing irq and irqsave
Message-ID: <202407150032.OnfFrSgT-lkp@intel.com>
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
TO: Pavel Machek <pavel@denx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   642e819a3c30d3536e6d66a631b761886a0316e7
commit: 7103517ca97f4d7eeb361aec644e6ed7afce5ff3 [3529/9999] ptrace: fix ptrace_unfreeze_traced() race with rt-lock
:::::: branch date: 2 days ago
:::::: commit date: 3 years, 8 months ago
config: i386-randconfig-141-20240714 (https://download.01.org/0day-ci/archive/20240715/202407150032.OnfFrSgT-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407150032.OnfFrSgT-lkp@intel.com/

smatch warnings:
kernel/ptrace.c:205 ptrace_unfreeze_traced() warn: mixing irq and irqsave

vim +205 kernel/ptrace.c

9899d11f654474 Oleg Nesterov      2013-01-21  191  
9899d11f654474 Oleg Nesterov      2013-01-21  192  static void ptrace_unfreeze_traced(struct task_struct *task)
9899d11f654474 Oleg Nesterov      2013-01-21  193  {
7103517ca97f4d Oleg Nesterov      2020-11-03  194  	unsigned long flags;
7103517ca97f4d Oleg Nesterov      2020-11-03  195  	bool frozen = true;
9899d11f654474 Oleg Nesterov      2013-01-21  196  
9899d11f654474 Oleg Nesterov      2013-01-21  197  	WARN_ON(!task->ptrace || task->parent != current);
9899d11f654474 Oleg Nesterov      2013-01-21  198  
5402e97af667e3 bsegall@google.com 2017-04-07  199  	/*
5402e97af667e3 bsegall@google.com 2017-04-07  200  	 * PTRACE_LISTEN can allow ptrace_trap_notify to wake us up remotely.
5402e97af667e3 bsegall@google.com 2017-04-07  201  	 * Recheck state under the lock to close this race.
5402e97af667e3 bsegall@google.com 2017-04-07  202  	 */
9899d11f654474 Oleg Nesterov      2013-01-21  203  	spin_lock_irq(&task->sighand->siglock);
7103517ca97f4d Oleg Nesterov      2020-11-03  204  
7103517ca97f4d Oleg Nesterov      2020-11-03 @205  	raw_spin_lock_irqsave(&task->pi_lock, flags);
7103517ca97f4d Oleg Nesterov      2020-11-03  206  	if (task->state == __TASK_TRACED)
9899d11f654474 Oleg Nesterov      2013-01-21  207  		task->state = TASK_TRACED;
7103517ca97f4d Oleg Nesterov      2020-11-03  208  	else if (task->saved_state == __TASK_TRACED)
7103517ca97f4d Oleg Nesterov      2020-11-03  209  		task->saved_state = TASK_TRACED;
7103517ca97f4d Oleg Nesterov      2020-11-03  210  	else
7103517ca97f4d Oleg Nesterov      2020-11-03  211  		frozen = false;
7103517ca97f4d Oleg Nesterov      2020-11-03  212  	raw_spin_unlock_irqrestore(&task->pi_lock, flags);
7103517ca97f4d Oleg Nesterov      2020-11-03  213  
7103517ca97f4d Oleg Nesterov      2020-11-03  214  	if (frozen && __fatal_signal_pending(task))
7103517ca97f4d Oleg Nesterov      2020-11-03  215  		wake_up_state(task, __TASK_TRACED);
7103517ca97f4d Oleg Nesterov      2020-11-03  216  
9899d11f654474 Oleg Nesterov      2013-01-21  217  	spin_unlock_irq(&task->sighand->siglock);
9899d11f654474 Oleg Nesterov      2013-01-21  218  }
9899d11f654474 Oleg Nesterov      2013-01-21  219  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
