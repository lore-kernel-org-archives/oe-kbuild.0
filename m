Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDBC277C9D
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Apr 2026 21:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777498586; cv=none; b=Iolj1D2Q8MOTy6isgvq4P3V9R8lxDSiSWWTFMGRKbvTM8Qje2G4qDAqqnY/ngJn8O8sx0AJ6cLE7YwQgxrULVV7tvk0sKu+4ky0NyPt6L1BekNrv0+pqQo1JHULRJr03gqlgf4u/DR++H+1ENnLVzkR3M9nLVFRKgyblM3V1+Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777498586; c=relaxed/simple;
	bh=Dg/6rOqANKPu9p/UvHW9b09ORVA6WDlN93dWD33yzYQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N4aY0UrL9u1QSbQibPyDPtizpyHfDdcQQaA7iuyXmd3504Vo55FsZSkn5gEbSrQ5nXCQec+V58R4dDpXAIUfEXSilg5pk/SdujQnSqKNvLJlyeLJ0ZVvty3MTALLy7ninay6bJz+ijuQ1rMTMI6lt39jD9Rgg7aZotmrO58HYnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ncFIW2hD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ncFIW2hD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777498585; x=1809034585;
  h=date:from:to:cc:subject:message-id;
  bh=Dg/6rOqANKPu9p/UvHW9b09ORVA6WDlN93dWD33yzYQ=;
  b=ncFIW2hDXzinQW9t8sxKb6DUkCjt5FHCNEMjkC++lZBebbKAnku+3H7k
   V1vstrx+oiloNi2q5vlGvW+GQwHplv9l7+M1t46InGngDjmxjSbbCLIvZ
   5L5a98KQzND9KbdtxbnumOcGRMnzYzw5HUjgZ6DXnvs/I3MfsGnXkVi8Y
   bTIfiKDiPSLxNcbcb6cpVdXXpM9wFT4VzLaaDuODErohqcuWpo908iELi
   vc6xWMQWqMPc9uoGBXD1AHyRtntmv+54WHgCa2yCKANnh+GujF296Llue
   iWxJtfEODrEA2d5lwZifdq3dI7/vTDbxvfZ/cNzhmZ7s+zGoF2wKVNlBf
   w==;
X-CSE-ConnectionGUID: D6EA955ARdqbBBXdMizLeQ==
X-CSE-MsgGUID: gRJ3JwIUSi64LyxFp+NWHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78546545"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="78546545"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 14:36:24 -0700
X-CSE-ConnectionGUID: vU+XptgkSGegShGoR2V4zw==
X-CSE-MsgGUID: k5shtNhMQWytTtZUVIG4JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="234657420"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 29 Apr 2026 14:36:23 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wICZx-000000004a5-0WWu;
	Wed, 29 Apr 2026 21:36:21 +0000
Date: Wed, 29 Apr 2026 23:36:17 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/ptp/ptp_vmclock.c:392:31: warning: unused variable
 'st'
Message-ID: <202604292322.eqQsW64I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Arthur Kiyanovski <akiyano@amazon.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Arthur-Kiyanovski/ptp-Add-ioctls-for-PHC-timestamps-with-quality-attributes/20260429-193801
head:   168c8dd7ae017cf31339764a464da1905af79142
commit: 8ad144a6daed9eaf10ab64bf87bbf49e0811b67b ptp: ptp_vmclock: Implement attributes ioctls
date:   10 hours ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260429/202604292322.eqQsW64I-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604292322.eqQsW64I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604292322.eqQsW64I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ptp/ptp_vmclock.c: In function 'ptp_vmclock_do_getcrosststamp':
>> drivers/ptp/ptp_vmclock.c:392:31: warning: unused variable 'st' [-Wunused-variable]
     392 |         struct vmclock_state *st = vctx->st;
         |                               ^~


vim +/st +392 drivers/ptp/ptp_vmclock.c

20503272422693d David Woodhouse   2024-10-06  388  
8ad144a6daed9ea Arthur Kiyanovski 2026-04-28  389  static int ptp_vmclock_do_getcrosststamp(struct vmclock_crosststamp_ctx *vctx,
20503272422693d David Woodhouse   2024-10-06  390  					 struct system_device_crosststamp *xtstamp)
20503272422693d David Woodhouse   2024-10-06  391  {
8ad144a6daed9ea Arthur Kiyanovski 2026-04-28 @392  	struct vmclock_state *st = vctx->st;
8ad144a6daed9ea Arthur Kiyanovski 2026-04-28  393  	int ret = get_device_system_crosststamp(ptp_vmclock_get_time_fn, vctx,
20503272422693d David Woodhouse   2024-10-06  394  						NULL, xtstamp);
20503272422693d David Woodhouse   2024-10-06  395  #ifdef SUPPORT_KVMCLOCK
20503272422693d David Woodhouse   2024-10-06  396  	/*
20503272422693d David Woodhouse   2024-10-06  397  	 * On x86, the KVM clock may be used for the system time. We can
20503272422693d David Woodhouse   2024-10-06  398  	 * actually convert a TSC reading to that, and return a paired
20503272422693d David Woodhouse   2024-10-06  399  	 * timestamp that get_device_system_crosststamp() *can* handle.
20503272422693d David Woodhouse   2024-10-06  400  	 */
20503272422693d David Woodhouse   2024-10-06  401  	if (ret == -ENODEV) {
20503272422693d David Woodhouse   2024-10-06  402  		struct system_time_snapshot systime_snapshot;
20503272422693d David Woodhouse   2024-10-06  403  
20503272422693d David Woodhouse   2024-10-06  404  		ktime_get_snapshot(&systime_snapshot);
20503272422693d David Woodhouse   2024-10-06  405  
20503272422693d David Woodhouse   2024-10-06  406  		if (systime_snapshot.cs_id == CSID_X86_TSC ||
20503272422693d David Woodhouse   2024-10-06  407  		    systime_snapshot.cs_id == CSID_X86_KVM_CLK) {
20503272422693d David Woodhouse   2024-10-06  408  			WRITE_ONCE(st->sys_cs_id, systime_snapshot.cs_id);
20503272422693d David Woodhouse   2024-10-06  409  			ret = get_device_system_crosststamp(ptp_vmclock_get_time_fn,
8ad144a6daed9ea Arthur Kiyanovski 2026-04-28  410  							    vctx, NULL, xtstamp);
20503272422693d David Woodhouse   2024-10-06  411  		}
20503272422693d David Woodhouse   2024-10-06  412  	}
20503272422693d David Woodhouse   2024-10-06  413  #endif
20503272422693d David Woodhouse   2024-10-06  414  	return ret;
20503272422693d David Woodhouse   2024-10-06  415  }
20503272422693d David Woodhouse   2024-10-06  416  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
