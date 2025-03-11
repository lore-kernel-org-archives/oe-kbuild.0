Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D5B23F295
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Mar 2025 11:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741691452; cv=none; b=g7EzEHPHqqhdhKyjsQUPZlPwU4ytiP6bL3Pl3xDPLpjo26kK6Bm6GOhGC5TAHj+IX+Ttv20Vod9RM27hi/tUj6v6xcrFIHWHWngL7V1ydMDK1OSOVJpNw/s2Rs5qW9DywZeSJ6M46/LvVpA3E3hdW8kmaYrBM1AX3NDKZQDzYto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741691452; c=relaxed/simple;
	bh=GkvtftHuOJidlQUXCjAwtRpLfxBdwJIwdDDWzIBrImU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CVWDaRnKz7Pn98lPDYyhbsI8HTFHRUw+M0wsxZL7VZVnBHtHjkaXdzth4vy18ljEBh9XVC5PCdDwTjYwepemykg2fTYR1laUkaUfXVUsUsKLpXVEc7qOwZvFQW2vzZAL8xYQgIUxuUHNxnLLhXJ93vHkC5zkfrjIkgX81zIXw8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WZoJb9WW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZoJb9WW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741691450; x=1773227450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GkvtftHuOJidlQUXCjAwtRpLfxBdwJIwdDDWzIBrImU=;
  b=WZoJb9WW5AIOQ6JKybD5iFjdxjIaGmeXHRr/znV/yKk/Y5OxHFfz33Kj
   gZdtdSqRCtZZ7GCvI8vB1w3P1GbcsxYm7PqyMdy8+Okvr5r3ledhE49xh
   LKZuf9S7cwl5ZmKbu1GdQLQZYmJW5L3ytIq7fGzc6OcsdYiPpKcNFhslp
   mkwnnW4ZaWAQ7TrrbUXD47F3i96AN3SLF0EoVrEK0Z21xTE/KATgAkRgJ
   tyj63Jpd7ANp6tm8l4L0x6FSkf9wF4mQmyKXa7XliOxqbh+LqRK32l3EC
   zflGFcJGmYg8C91iJzokqMkQKShZQnMgNPbhv1EduIPBUoEPvu4BIpwLt
   g==;
X-CSE-ConnectionGUID: yIWsIc6ATTmVvEufnmUZRg==
X-CSE-MsgGUID: 44VQRs1RS1CCyPeG3BRvEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42443702"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="42443702"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 04:10:50 -0700
X-CSE-ConnectionGUID: IwDd84EqQXGPTAf3XFAgog==
X-CSE-MsgGUID: xXWtlhH1TTyHS6JtF23Qcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="120520959"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 11 Mar 2025 04:10:48 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trxVV-0006b6-2u;
	Tue, 11 Mar 2025 11:10:45 +0000
Date: Tue, 11 Mar 2025 19:10:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH mptcp-next v10 11/12] mptcp: sysctl: add
 available_path_managers
Message-ID: <202503111822.Na489Ujk-lkp@intel.com>
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
In-Reply-To: <269ed2f20a9f017e9a32ace3728dde2f63774936.1741258415.git.tanggeliang@kylinos.cn>
References: <269ed2f20a9f017e9a32ace3728dde2f63774936.1741258415.git.tanggeliang@kylinos.cn>
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
patch link:    https://lore.kernel.org/r/269ed2f20a9f017e9a32ace3728dde2f63774936.1741258415.git.tanggeliang%40kylinos.cn
patch subject: [PATCH mptcp-next v10 11/12] mptcp: sysctl: add available_path_managers
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-r072-20250311 (https://download.01.org/0day-ci/archive/20250311/202503111822.Na489Ujk-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503111822.Na489Ujk-lkp@intel.com/

New smatch warnings:
net/mptcp/ctrl.c:258 proc_available_path_managers() warn: (struct ctl_table)->procname cannot be NULL. Expression : tbl.procname
net/mptcp/ctrl.c:258 proc_available_path_managers() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : tbl.proc_handler

Old smatch warnings:
net/mptcp/ctrl.c:135 proc_scheduler() warn: (struct ctl_table)->procname cannot be NULL. Expression : tbl.procname
net/mptcp/ctrl.c:135 proc_scheduler() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : tbl.proc_handler
net/mptcp/ctrl.c:154 proc_available_schedulers() warn: (struct ctl_table)->procname cannot be NULL. Expression : tbl.procname
net/mptcp/ctrl.c:154 proc_available_schedulers() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : tbl.proc_handler
net/mptcp/ctrl.c:208 proc_path_manager() warn: (struct ctl_table)->procname cannot be NULL. Expression : tbl.procname
net/mptcp/ctrl.c:208 proc_path_manager() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : tbl.proc_handler

vim +258 net/mptcp/ctrl.c

ce988b8bb6a4f5f Geliang Tang 2025-03-06  253  
466ab1271e2497a Geliang Tang 2025-03-06  254  static int proc_available_path_managers(const struct ctl_table *ctl,
466ab1271e2497a Geliang Tang 2025-03-06  255  					int write, void *buffer,
466ab1271e2497a Geliang Tang 2025-03-06  256  					size_t *lenp, loff_t *ppos)
466ab1271e2497a Geliang Tang 2025-03-06  257  {
466ab1271e2497a Geliang Tang 2025-03-06 @258  	struct ctl_table tbl = { .maxlen = MPTCP_PM_BUF_MAX, };
466ab1271e2497a Geliang Tang 2025-03-06  259  	int ret;
466ab1271e2497a Geliang Tang 2025-03-06  260  
466ab1271e2497a Geliang Tang 2025-03-06  261  	tbl.data = kmalloc(tbl.maxlen, GFP_USER);
466ab1271e2497a Geliang Tang 2025-03-06  262  	if (!tbl.data)
466ab1271e2497a Geliang Tang 2025-03-06  263  		return -ENOMEM;
466ab1271e2497a Geliang Tang 2025-03-06  264  
466ab1271e2497a Geliang Tang 2025-03-06  265  	mptcp_pm_get_available(tbl.data, MPTCP_PM_BUF_MAX);
466ab1271e2497a Geliang Tang 2025-03-06  266  	ret = proc_dostring(&tbl, write, buffer, lenp, ppos);
466ab1271e2497a Geliang Tang 2025-03-06  267  	kfree(tbl.data);
466ab1271e2497a Geliang Tang 2025-03-06  268  
466ab1271e2497a Geliang Tang 2025-03-06  269  	return ret;
466ab1271e2497a Geliang Tang 2025-03-06  270  }
466ab1271e2497a Geliang Tang 2025-03-06  271  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
