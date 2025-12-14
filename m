Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918EC13AD05
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 01:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765675599; cv=none; b=pTxeS5UZz+NqlfCPR6u1hzNmwU0O02QxgTZdXWUb2HB0y9OfM3a4LZP/71DDX7eHJcahbch4DSt1O9MfjDKTZqNuE7pKbLh22ALFt8sNm7GYT+jvTHtOJxNgT/9UX6cB/lJWSHT+VgkzH3Wxpup2ii3Fjo4UexYIRMEFbIjU+58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765675599; c=relaxed/simple;
	bh=hxxhtot6ZWTf64RT/kkz9iHuYNcdIPYFIpSd5T5p5Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zqj6q+FQoWoWa/37zHpUyFJ873lLRPCyRIycpc+075HlC3zWyQbTL76UXA5XCuRLsmgHWilLvU67Bb+OJ6O7MEcLedFe9h7YJ7XTzd08QWaJs+Xo7XoJdEv/+2rYXiqeaHmvGT/1N3uXrX1V3Br0UXb7buKJ1CvUUmXYdI3sLt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EeDFe+k5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EeDFe+k5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765675597; x=1797211597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hxxhtot6ZWTf64RT/kkz9iHuYNcdIPYFIpSd5T5p5Kc=;
  b=EeDFe+k5LQTP+iB9QWfiB6KDUuc4s1zZHvtqgoEmmIXjj7De0M4+bxNA
   Dp3zwAGeym1Mz+vzccBtKCEo6FZb/XuQi0u3nKDQy3Ho2wZAUu4pP+0SB
   pRqG+3LB/mDIAmR2NntVUXVieDO0KOV8JIpRIvBsB0nNzZZOYAEx/STH8
   ri/NeZM0jZK21ZeLlDW5JxWJAOkja6zHdn2bIt4Tkbl2l2I+JBqk5hKb4
   aOjhLsTc2Xtq49a8cC9AXYfs2dVmquKw3O8MATScMcxk18xvY7TQ5uGmj
   8KBivjw0X2N0VUMFvDBAopnXqBey43D/16VFxwEXr/p/78d3bVuyz8OPf
   g==;
X-CSE-ConnectionGUID: jzNnkCOzQAGhycSQ2uVOmA==
X-CSE-MsgGUID: ofNx86cSRIeNIHPfK/RoEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="66615763"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="66615763"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 17:26:37 -0800
X-CSE-ConnectionGUID: 5l0vbzjbQQ+bovSxRD1wew==
X-CSE-MsgGUID: lYkxGyhjR2Sw2e0XVI/wBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197919437"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Dec 2025 17:26:35 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUasb-000000008Q7-3RfB;
	Sun, 14 Dec 2025 01:26:33 +0000
Date: Sun, 14 Dec 2025 09:26:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/mptcp/ctrl.c:260 proc_available_path_managers() warn: (struct
 ctl_table)->procname cannot be NULL. Expression : tbl.procname
Message-ID: <202512140954.2OYaqOqr-lkp@intel.com>
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
head:   4a298a43f5e339f48d2dda0665c02b88ee9a4e03
commit: fa3ee9dd8067e178b459f1df3081fd25fc03c4b5 mptcp: sysctl: add available_path_managers
date:   9 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-r071-20251211 (https://download.01.org/0day-ci/archive/20251214/202512140954.2OYaqOqr-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512140954.2OYaqOqr-lkp@intel.com/

New smatch warnings:
net/mptcp/ctrl.c:260 proc_available_path_managers() warn: (struct ctl_table)->procname cannot be NULL. Expression : tbl.procname
net/mptcp/ctrl.c:260 proc_available_path_managers() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : tbl.proc_handler

Old smatch warnings:
net/mptcp/ctrl.c:135 proc_scheduler() warn: (struct ctl_table)->procname cannot be NULL. Expression : tbl.procname
net/mptcp/ctrl.c:135 proc_scheduler() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : tbl.proc_handler
net/mptcp/ctrl.c:154 proc_available_schedulers() warn: (struct ctl_table)->procname cannot be NULL. Expression : tbl.procname
net/mptcp/ctrl.c:154 proc_available_schedulers() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : tbl.proc_handler
net/mptcp/ctrl.c:208 proc_path_manager() warn: (struct ctl_table)->procname cannot be NULL. Expression : tbl.procname
net/mptcp/ctrl.c:208 proc_path_manager() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : tbl.proc_handler

vim +260 net/mptcp/ctrl.c

7982ed0edda337 Geliang Tang 2025-03-13  255  
fa3ee9dd8067e1 Geliang Tang 2025-03-13  256  static int proc_available_path_managers(const struct ctl_table *ctl,
fa3ee9dd8067e1 Geliang Tang 2025-03-13  257  					int write, void *buffer,
fa3ee9dd8067e1 Geliang Tang 2025-03-13  258  					size_t *lenp, loff_t *ppos)
fa3ee9dd8067e1 Geliang Tang 2025-03-13  259  {
fa3ee9dd8067e1 Geliang Tang 2025-03-13 @260  	struct ctl_table tbl = { .maxlen = MPTCP_PM_BUF_MAX, };
fa3ee9dd8067e1 Geliang Tang 2025-03-13  261  	int ret;
fa3ee9dd8067e1 Geliang Tang 2025-03-13  262  
fa3ee9dd8067e1 Geliang Tang 2025-03-13  263  	tbl.data = kmalloc(tbl.maxlen, GFP_USER);
fa3ee9dd8067e1 Geliang Tang 2025-03-13  264  	if (!tbl.data)
fa3ee9dd8067e1 Geliang Tang 2025-03-13  265  		return -ENOMEM;
fa3ee9dd8067e1 Geliang Tang 2025-03-13  266  
fa3ee9dd8067e1 Geliang Tang 2025-03-13  267  	mptcp_pm_get_available(tbl.data, MPTCP_PM_BUF_MAX);
fa3ee9dd8067e1 Geliang Tang 2025-03-13  268  	ret = proc_dostring(&tbl, write, buffer, lenp, ppos);
fa3ee9dd8067e1 Geliang Tang 2025-03-13  269  	kfree(tbl.data);
fa3ee9dd8067e1 Geliang Tang 2025-03-13  270  
fa3ee9dd8067e1 Geliang Tang 2025-03-13  271  	return ret;
fa3ee9dd8067e1 Geliang Tang 2025-03-13  272  }
fa3ee9dd8067e1 Geliang Tang 2025-03-13  273  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
