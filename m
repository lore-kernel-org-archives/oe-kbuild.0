Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A02C2749FE
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 19:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765652778; cv=none; b=bMgLuNuAhWxC/V6umIlAc3Fqp40IX3siyUwkX6/o6AyAiu6YzspTSMNzDBcHKzUcJKyku2qxLnGCEFUc2mJ42F5C7+C9tFt7IcmMznDcgqERkDOjkJTUK6TQ2qqi6Qwgi4ZBBjCF2J5Ha0EGSYxzWNPPJkV9EcMri0awXUs5GE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765652778; c=relaxed/simple;
	bh=aLR8+woVQtqdlcQ5c/Z6LeyU//9eS82stzA4QRbdn+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JWULCVUSGwxxhkUzOpoy0EOWj/g4mOfuxyzAf2mcc0kXq1BgCk11SfZODeeNYHa4Lh2oNE54gA6kVnBSMQls3ECDjMR8lu+/Rh0Bz9go6z+VOBJQi07Lsa6VGlYrpExdABIQDLhPSFRyQ7C6Q20C4W9HZtGoQEtCHFhr4gA3bdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mzU3afuo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mzU3afuo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765652776; x=1797188776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aLR8+woVQtqdlcQ5c/Z6LeyU//9eS82stzA4QRbdn+o=;
  b=mzU3afuofk+8RfIcmaqrd1NbCRLVrWlIWyGufg+S/r8UmczaW12SJaHB
   Rp3xRIn+KOUhgPpPwN2EuOqs6SzXZVpEQOWamKSUnBFfDFLa19QjNEIFt
   596fgQoeRINyr5MfAiKJjnvaipsUtv/fl/fdd0zP5K+zC2+Mj2UVScmiS
   dLi+B2PosBTV1uzULnaKvCkI9QpbnJhZLbfZjWKZX7GnyVHZ1iz6DkJPV
   POWViS8W+yPzCbiRZtTaK/JV5Q4Ot6jWPnOMECJJ8eMSgs5643AcLYZlz
   psT55gyHeXwO0dxyphBGoDO10In7KBC0+ddtlXdc2eUQiRtG5jyfiG0X5
   Q==;
X-CSE-ConnectionGUID: xcEfNh4sRti9Hba6le8GFw==
X-CSE-MsgGUID: 45v5I3foRYeDlm4YfueCpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="66607236"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="66607236"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 11:06:15 -0800
X-CSE-ConnectionGUID: UgkpK9eyQRO+CdfDf4vv9g==
X-CSE-MsgGUID: /XTJiGmCSoKQoAjO3tiuaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="201771585"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Dec 2025 11:06:13 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUUwV-0000000085r-13oO;
	Sat, 13 Dec 2025 19:06:11 +0000
Date: Sun, 14 Dec 2025 03:06:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/mptcp/ctrl.c:205 proc_path_manager() warn: (struct
 ctl_table)->procname cannot be NULL. Expression : tbl.procname
Message-ID: <202512140242.mBbgBnXS-lkp@intel.com>
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
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: 595c26d122d120b6b2f65495e31c857d0c8c6374 mptcp: sysctl: set path manager by name
date:   9 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-r071-20251211 (https://download.01.org/0day-ci/archive/20251214/202512140242.mBbgBnXS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512140242.mBbgBnXS-lkp@intel.com/

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
