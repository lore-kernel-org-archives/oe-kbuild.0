Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98212737F4
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 14:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765548006; cv=none; b=Jd4a6un35STgtGGxhYCfpuxO6ElOS6eCAmrrhXrZkarZNyRJ5Z4tgInALp6se5gu9g8i3ruY5LmyGlwwJMDxomPkz9fZdahFjH5TYXURLT2WVhy2LLgKVudSS/PA2ewZKwxFIMnr1I3pZcW0Ry0bKak6rR0UfKF8KCt+qWLzkNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765548006; c=relaxed/simple;
	bh=ZrqzYpybKYdCSE5sNUzGIkRNiqaRQKmYnHq827nKPZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Df9jTeScHciAyKIvfmgMMdKPt0D5O3fzJ7qH7QYhJorMSBHgIGNJMvFVX15It4VjzK+8EuF1FlESn0JDknqLQY7YXTBt84OpLiDtivYN39PggQOeBdNnF8ORTu/knPik3Sp1Ai2yHYseE1D+3ZoJNOg385/BnHL+bYjMqNLc2Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zx84vy4m; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zx84vy4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765548003; x=1797084003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZrqzYpybKYdCSE5sNUzGIkRNiqaRQKmYnHq827nKPZA=;
  b=Zx84vy4mXxA2tBf4hUQRAWi4jwDM/+1brLnqR+1DSHpdmM2OcaZCmqgX
   I/ywRSWpLDIQ/KYDHSHNZ2CUi6c2e9oenucdAJORfN4VoXOlNy3xSvWIB
   k9FquzjRIMl19Sn912Itr9axTusj8tj0n84G+LcP920USC6axCG8NGl2v
   HUC6h0U4BbW+sKQ4Z3QDkaHojouoJ/S5rcGYNbQMjCbcPF8dxItFHLOUO
   0veEQ8xVw5F9Rcvalm22BmildkOpxukOW7iLg/5UhW/EBBjTEuD9KISal
   n2TqP7pyIz0QnOUjXDve8NsFtYu34OLaQHTdmDujT9yQGB+LcRcC8XF9g
   w==;
X-CSE-ConnectionGUID: /kDQuJQlTFm0n93WMMcaEw==
X-CSE-MsgGUID: WPqaPHbRQHaWaXjzg5IETA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67492188"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67492188"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 06:00:00 -0800
X-CSE-ConnectionGUID: y68X/DjNSfCJvrtMwauJLw==
X-CSE-MsgGUID: j7hNTjySSF6CvevR8G7g/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="201277310"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Dec 2025 05:59:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU3ga-0000000068F-1lf5;
	Fri, 12 Dec 2025 13:59:56 +0000
Date: Fri, 12 Dec 2025 21:59:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/mptcp/ctrl.c:260 proc_available_path_managers() warn: (struct
 ctl_table)->procname cannot be NULL. Expression : tbl.procname
Message-ID: <202512122156.0S7a29Nu-lkp@intel.com>
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
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: fa3ee9dd8067e178b459f1df3081fd25fc03c4b5 mptcp: sysctl: add available_path_managers
date:   9 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-r071-20251211 (https://download.01.org/0day-ci/archive/20251212/202512122156.0S7a29Nu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512122156.0S7a29Nu-lkp@intel.com/

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
