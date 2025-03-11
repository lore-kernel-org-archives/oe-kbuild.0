Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8581C1ADB
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Mar 2025 09:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741683999; cv=none; b=AG3/5epAaY8f8xvxnDyQNJ6k8t5J1uQePCR3Pqc10d6eNVKUtzvnc1fwjFai/+Vtvz4zMCBtjO2Kx1O91qxXcyb5D6C/hG8T0/4I8vdQUIH/2yFRYHnfbYNV6jYcwtQzhzqOpILQQXloxnrBeD74RIKCUjsCkoyqv3bpOjZJqog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741683999; c=relaxed/simple;
	bh=gGsXujux8tKYQhh4GKHiAojOQzN4IYrJCU25KzzdsWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eyTwhjq6YaVzryaK3lhs/T7xQoem6HfxbcQ/907OgF+315U3X314bVhR7AyobzzAQQU0SfFcIdLJMB/RB9Qdue7wq4aqBiLFUORV4hN7nmiEMvmMldWj1fufmZS/FbuWKd+foCGAsmM0iyCypPRtb4Rd+QxAKfMxfxUJyJzDdbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GDKsqbhN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDKsqbhN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741683998; x=1773219998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gGsXujux8tKYQhh4GKHiAojOQzN4IYrJCU25KzzdsWU=;
  b=GDKsqbhN0JiP3x0yDyfGu7FlusP7AA+VK23Dp+M9YzbkMYCgOA3IBcKa
   QM7X4gca/MVEpvnAZ2r0tmiRu/rdOHw3Bk3lZrRn6At9dzg68uhiwJo+c
   Wenm8BwukwCeTBZis4kewcGAjzSk6DsOEHgWl5dgmvu+tlrtmqc0kpzhd
   rvQzWvzhuBastWqs9P+qDlpFxzKXK4FRjqd54IGXJpks4BMz+kAqaEkl9
   UAf+cRT9XnlKmtIJMP5CfzmYB45yi7X1YnvE6CYnhdbU6JMVZ1Zvnb3xv
   P5xOHveo0+jV3LCrSse2Ai+5kVROdCwa04IbEV1UUe+zEA7wlFJ0YFee2
   g==;
X-CSE-ConnectionGUID: lEwTm60PTDSyH72kwp9Ubg==
X-CSE-MsgGUID: bXfaKvvXSrCvBu2RT7QDMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42427730"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="42427730"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 02:06:37 -0700
X-CSE-ConnectionGUID: Pur7v+HpTH6p0je3i7kbyw==
X-CSE-MsgGUID: GXPUhXNoTWuLfu3jb5DH3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="120484212"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 11 Mar 2025 02:06:36 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trvZK-0006Vo-0B;
	Tue, 11 Mar 2025 09:06:34 +0000
Date: Tue, 11 Mar 2025 17:05:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH mptcp-next v10 03/12] mptcp: sysctl: set path manager by
 name
Message-ID: <202503111629.cVBbmSzC-lkp@intel.com>
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
In-Reply-To: <3b6949a2eda46c8aed7164e7a66516772a6d512e.1741258415.git.tanggeliang@kylinos.cn>
References: <3b6949a2eda46c8aed7164e7a66516772a6d512e.1741258415.git.tanggeliang@kylinos.cn>
TO: Geliang Tang <geliang@kernel.org>
TO: mptcp@lists.linux.dev
CC: Geliang Tang <tanggeliang@kylinos.cn>

Hi Geliang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mptcp/export]
[cannot apply to mptcp/export-net linus/master v6.14-rc6 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Geliang-Tang/mptcp-pm-define-struct-mptcp_pm_ops/20250306-190707
base:   https://github.com/multipath-tcp/mptcp_net-next.git export
patch link:    https://lore.kernel.org/r/3b6949a2eda46c8aed7164e7a66516772a6d512e.1741258415.git.tanggeliang%40kylinos.cn
patch subject: [PATCH mptcp-next v10 03/12] mptcp: sysctl: set path manager by name
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-r072-20250311 (https://download.01.org/0day-ci/archive/20250311/202503111629.cVBbmSzC-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503111629.cVBbmSzC-lkp@intel.com/

New smatch warnings:
net/mptcp/ctrl.c:205 proc_path_manager() warn: (struct ctl_table)->procname cannot be NULL. Expression : tbl.procname
net/mptcp/ctrl.c:205 proc_path_manager() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : tbl.proc_handler

Old smatch warnings:
net/mptcp/ctrl.c:135 proc_scheduler() warn: (struct ctl_table)->procname cannot be NULL. Expression : tbl.procname
net/mptcp/ctrl.c:135 proc_scheduler() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : tbl.proc_handler
net/mptcp/ctrl.c:154 proc_available_schedulers() warn: (struct ctl_table)->procname cannot be NULL. Expression : tbl.procname
net/mptcp/ctrl.c:154 proc_available_schedulers() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : tbl.proc_handler

vim +205 net/mptcp/ctrl.c

31553efb7085f23 Geliang Tang 2025-03-06  199  
31553efb7085f23 Geliang Tang 2025-03-06  200  static int proc_path_manager(const struct ctl_table *ctl, int write,
31553efb7085f23 Geliang Tang 2025-03-06  201  			     void *buffer, size_t *lenp, loff_t *ppos)
31553efb7085f23 Geliang Tang 2025-03-06  202  {
31553efb7085f23 Geliang Tang 2025-03-06  203  	char (*path_manager)[MPTCP_PM_NAME_MAX] = ctl->data;
31553efb7085f23 Geliang Tang 2025-03-06  204  	char pm_name[MPTCP_PM_NAME_MAX];
31553efb7085f23 Geliang Tang 2025-03-06 @205  	const struct ctl_table tbl = {
31553efb7085f23 Geliang Tang 2025-03-06  206  		.data = pm_name,
31553efb7085f23 Geliang Tang 2025-03-06  207  		.maxlen = MPTCP_PM_NAME_MAX,
31553efb7085f23 Geliang Tang 2025-03-06  208  	};
31553efb7085f23 Geliang Tang 2025-03-06  209  	int ret;
31553efb7085f23 Geliang Tang 2025-03-06  210  
31553efb7085f23 Geliang Tang 2025-03-06  211  	strscpy(pm_name, *path_manager, MPTCP_PM_NAME_MAX);
31553efb7085f23 Geliang Tang 2025-03-06  212  
31553efb7085f23 Geliang Tang 2025-03-06  213  	ret = proc_dostring(&tbl, write, buffer, lenp, ppos);
31553efb7085f23 Geliang Tang 2025-03-06  214  	if (write && ret == 0)
31553efb7085f23 Geliang Tang 2025-03-06  215  		ret = mptcp_set_path_manager(*path_manager, pm_name);
31553efb7085f23 Geliang Tang 2025-03-06  216  
31553efb7085f23 Geliang Tang 2025-03-06  217  	return ret;
31553efb7085f23 Geliang Tang 2025-03-06  218  }
31553efb7085f23 Geliang Tang 2025-03-06  219  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
