Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ABFB640
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 06:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765522116; cv=none; b=BU86bSol/HCbbOq+pcyz4xoqkdp4PBO2hQIsMsn5T81u+ZV5cl9OXoKrPQNIzi+Pl7iAINdhzUsaDNEHxXZq3aXUywsTCspRG/xiSHTONs3aoo8U2YVFLotEnSQ+IUiaEUfwrkhahqw8f/sairg0u2txIobUrTjAMIYhxEPFXrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765522116; c=relaxed/simple;
	bh=lePiCDcVJF4gHj9y6wl5ErXBsfAJUa56Y6JbEtYPhbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AjaBQZErvUFRN3CbSpzjKgp30zJZ4vN5g8Wdt5SLmUCXlITujf0X5oYxkLLl/Er799dMg3+AbCd+HhVKC5eMJy3Fn9glFlQrPt+jFY9mg3UKCpwhl5T/Nb3+d1963ND0Vji/0/W2p6tSsYvKyC79AjYc3JJ8xU55x93SjWWVlx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XaklNJ++; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XaklNJ++"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765522114; x=1797058114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lePiCDcVJF4gHj9y6wl5ErXBsfAJUa56Y6JbEtYPhbk=;
  b=XaklNJ++XNL3AmwafWC8dwmbAmTYGOhRRsJPWyAX7XPtC84hFgupPgy3
   qKHW2beKlO6Pjvq2mhg1Nyut5YyK/jJdzeyqQItUNUN7Bl0qe5yiPVzPj
   5rGIK07ifMd0x+ITZ3g6nD/GV+0kTBmY9dPVf3lKeMxN/WDOFld3KuNTQ
   YOLMrxTeVq9oVBzr3hiep5t6OVZO3KNjeHET8gmgu7ZdB0OsI0zbbLITS
   VME7Eu9HJOzLTPQ5kMj/1aOgPgNwWt1uRDQszKFluMzawZGTb53L0ZpwR
   Uf0S4MMHrSfPKeyejKmqbIhjVCNCTHZRKKolJtzxjRkZDOqJGLXRmgwx+
   Q==;
X-CSE-ConnectionGUID: 8aH2QlQQTxSSE5qEioYJBA==
X-CSE-MsgGUID: R+/OrthiSL65+Gj9qSf6gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71379715"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="71379715"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 22:48:33 -0800
X-CSE-ConnectionGUID: +rPUKiMISoWWzUGxk71YLg==
X-CSE-MsgGUID: VsL6lKceTZe2xRXMMUKfww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196292676"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Dec 2025 22:48:33 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTwx4-000000005gf-0Q8I;
	Fri, 12 Dec 2025 06:48:30 +0000
Date: Fri, 12 Dec 2025 14:47:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/mptcp/ctrl.c:205 proc_path_manager() warn: (struct
 ctl_table)->procname cannot be NULL. Expression : tbl.procname
Message-ID: <202512121431.tcoFb0SM-lkp@intel.com>
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
TO: Geliang Tang <tanggeliang@kylinos.cn>
CC: mptcp@lists.linux.dev
CC: matthieu.baerts@tessares.net
CC: Paolo Abeni <pabeni@redhat.com>
CC: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
CC: Simon Horman <horms@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 595c26d122d120b6b2f65495e31c857d0c8c6374 mptcp: sysctl: set path manager by name
date:   9 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-r071-20251211 (https://download.01.org/0day-ci/archive/20251212/202512121431.tcoFb0SM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512121431.tcoFb0SM-lkp@intel.com/

New smatch warnings:
net/mptcp/ctrl.c:205 proc_path_manager() warn: (struct ctl_table)->procname cannot be NULL. Expression : tbl.procname
net/mptcp/ctrl.c:205 proc_path_manager() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : tbl.proc_handler

Old smatch warnings:
net/mptcp/ctrl.c:135 proc_scheduler() warn: (struct ctl_table)->procname cannot be NULL. Expression : tbl.procname
net/mptcp/ctrl.c:135 proc_scheduler() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : tbl.proc_handler
net/mptcp/ctrl.c:154 proc_available_schedulers() warn: (struct ctl_table)->procname cannot be NULL. Expression : tbl.procname
net/mptcp/ctrl.c:154 proc_available_schedulers() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : tbl.proc_handler

vim +205 net/mptcp/ctrl.c

595c26d122d120 Geliang Tang 2025-03-13  199  
595c26d122d120 Geliang Tang 2025-03-13  200  static int proc_path_manager(const struct ctl_table *ctl, int write,
595c26d122d120 Geliang Tang 2025-03-13  201  			     void *buffer, size_t *lenp, loff_t *ppos)
595c26d122d120 Geliang Tang 2025-03-13  202  {
595c26d122d120 Geliang Tang 2025-03-13  203  	char (*path_manager)[MPTCP_PM_NAME_MAX] = ctl->data;
595c26d122d120 Geliang Tang 2025-03-13  204  	char pm_name[MPTCP_PM_NAME_MAX];
595c26d122d120 Geliang Tang 2025-03-13 @205  	const struct ctl_table tbl = {
595c26d122d120 Geliang Tang 2025-03-13  206  		.data = pm_name,
595c26d122d120 Geliang Tang 2025-03-13  207  		.maxlen = MPTCP_PM_NAME_MAX,
595c26d122d120 Geliang Tang 2025-03-13  208  	};
595c26d122d120 Geliang Tang 2025-03-13  209  	int ret;
595c26d122d120 Geliang Tang 2025-03-13  210  
595c26d122d120 Geliang Tang 2025-03-13  211  	strscpy(pm_name, *path_manager, MPTCP_PM_NAME_MAX);
595c26d122d120 Geliang Tang 2025-03-13  212  
595c26d122d120 Geliang Tang 2025-03-13  213  	ret = proc_dostring(&tbl, write, buffer, lenp, ppos);
595c26d122d120 Geliang Tang 2025-03-13  214  	if (write && ret == 0)
595c26d122d120 Geliang Tang 2025-03-13  215  		ret = mptcp_set_path_manager(*path_manager, pm_name);
595c26d122d120 Geliang Tang 2025-03-13  216  
595c26d122d120 Geliang Tang 2025-03-13  217  	return ret;
595c26d122d120 Geliang Tang 2025-03-13  218  }
595c26d122d120 Geliang Tang 2025-03-13  219  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
