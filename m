Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A143DF01E
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 22:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775859200; cv=none; b=aHHRaER7nuBXLzzzz5LTguDPvSSusDc7sK8LGzgBeS21/V8aAXilBw3Ti75zK5vp4u8TksHAwp5vCsvcz1SonqJDZwWxx7mahZcX/anPoeCpONlPu5nvOUdeHUdVeZQmaNsxsdfFoykxKJinqgY/G2ZgCZOIwLpQ/Su8rkjrJAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775859200; c=relaxed/simple;
	bh=i0qpJoq38FWoqalkSDZnZu5sqIze0SrG+omNUWVBzt4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a2Jpg//IEjTHafaV7avO0e9YIRywVCaNaaSPfnyA/gGOeNjhjUsEH4MZJXNhUosOOs/gnRTnDvpLPf96RfmeWTvqxn3eriVVZWHhG/yIUpO54WkNLnMCKzY7mzh7bD6yYlt+ZEcRFjtNPHhH3yw1SrGyr1RhmFjucIxfo0smwSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dcBhW0Bd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dcBhW0Bd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775859199; x=1807395199;
  h=date:from:to:cc:subject:message-id;
  bh=i0qpJoq38FWoqalkSDZnZu5sqIze0SrG+omNUWVBzt4=;
  b=dcBhW0BdqQi+sNW+jz1nBxN0dhNArYa4nwpC2NuZPkXdgR5FtGQi9NLH
   W20OTgkt2dxCDvgpHSPMNelM2cy4ISpPpu72k/Hb5hChd0YwWg0jBkmBs
   97G47mpjjeGuMfcAFDxX3MuTGmkCDqdtSEs7rcL8ZsYx0+dQYwLfS5AG1
   twj5VS4Hlh2BG4/UUWFoxIUWSZboATuldpuIaLpcNxeyv9DhmVKgPYpzy
   WIYhE4QDRSrUtTIu8SkUNdPkU3dCB3lR5KwQ/AZrZc3M+yRUeJk0SsIDC
   CsYVcLwbHUy7ryRMyfWt2jobhicn6fHgkd1FoRKiyuC1Rm0benx1g+68m
   A==;
X-CSE-ConnectionGUID: UFzjWM1pQPmaMhFq2dHG1w==
X-CSE-MsgGUID: Fu+IVORXQJ+toqqhqjyoRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76794415"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76794415"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 15:13:19 -0700
X-CSE-ConnectionGUID: aGSaM+U/R4CZyMPu76Edew==
X-CSE-MsgGUID: D98cBUqVQZKwbbNqSzQbGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="229467237"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Apr 2026 15:13:18 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBK6F-000000000Gn-091I;
	Fri, 10 Apr 2026 22:13:15 +0000
Date: Sat, 11 Apr 2026 06:12:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debug.c:794
 kfd_dbg_trap_enable() warn: fd re-used after fget(): 'fd'
Message-ID: <202604110615.68xgUv0Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Han Gao <rabenda.cn@gmail.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Felix Kuehling <felix.kuehling@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7c6c4ed80b874f721bc7c2c937e098c56e37d2f0
commit: fa301127ba9a22f40b4261f569f1fc8b3d66e04e drm/amdkfd: enable kfd on LoongArch systems
date:   9 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 months ago
config: loongarch-randconfig-r073-20260409 (https://download.01.org/0day-ci/archive/20260411/202604110615.68xgUv0Q-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: fa301127ba9a ("drm/amdkfd: enable kfd on LoongArch systems")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604110615.68xgUv0Q-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debug.c:794 kfd_dbg_trap_enable() warn: fd re-used after fget(): 'fd'

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debug.c:445 kfd_dbg_trap_clear_dev_address_watch() error: buffer overflow 'pdd->watch_points' 4 <= u32max

vim +/fd +794 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debug.c

218895820e6fcc Jonathan Kim 2022-04-05  767  
0ab2d7532b05a3 Jonathan Kim 2022-03-25  768  int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
0ab2d7532b05a3 Jonathan Kim 2022-03-25  769  			void __user *runtime_info, uint32_t *runtime_size)
0ab2d7532b05a3 Jonathan Kim 2022-03-25  770  {
0ab2d7532b05a3 Jonathan Kim 2022-03-25  771  	struct file *f;
0ab2d7532b05a3 Jonathan Kim 2022-03-25  772  	uint32_t copy_size;
218895820e6fcc Jonathan Kim 2022-04-05  773  	int i, r = 0;
0ab2d7532b05a3 Jonathan Kim 2022-03-25  774  
0ab2d7532b05a3 Jonathan Kim 2022-03-25  775  	if (target->debug_trap_enabled)
0ab2d7532b05a3 Jonathan Kim 2022-03-25  776  		return -EALREADY;
0ab2d7532b05a3 Jonathan Kim 2022-03-25  777  
218895820e6fcc Jonathan Kim 2022-04-05  778  	/* Enable pre-checks */
218895820e6fcc Jonathan Kim 2022-04-05  779  	for (i = 0; i < target->n_pdds; i++) {
218895820e6fcc Jonathan Kim 2022-04-05  780  		struct kfd_process_device *pdd = target->pdds[i];
218895820e6fcc Jonathan Kim 2022-04-05  781  
218895820e6fcc Jonathan Kim 2022-04-05  782  		if (!KFD_IS_SOC15(pdd->dev))
218895820e6fcc Jonathan Kim 2022-04-05  783  			return -ENODEV;
218895820e6fcc Jonathan Kim 2022-04-05  784  
7a1c5c6753858c Jonathan Kim 2023-07-12  785  		if (pdd->qpd.num_gws && (!kfd_dbg_has_gws_support(pdd->dev) ||
7a1c5c6753858c Jonathan Kim 2023-07-12  786  					 kfd_dbg_has_cwsr_workaround(pdd->dev)))
218895820e6fcc Jonathan Kim 2022-04-05  787  			return -EBUSY;
218895820e6fcc Jonathan Kim 2022-04-05  788  	}
218895820e6fcc Jonathan Kim 2022-04-05  789  
0ab2d7532b05a3 Jonathan Kim 2022-03-25  790  	copy_size = min((size_t)(*runtime_size), sizeof(target->runtime_info));
0ab2d7532b05a3 Jonathan Kim 2022-03-25  791  
0ab2d7532b05a3 Jonathan Kim 2022-03-25  792  	f = fget(fd);
0ab2d7532b05a3 Jonathan Kim 2022-03-25  793  	if (!f) {
0ab2d7532b05a3 Jonathan Kim 2022-03-25 @794  		pr_err("Failed to get file for (%i)\n", fd);
0ab2d7532b05a3 Jonathan Kim 2022-03-25  795  		return -EBADF;
0ab2d7532b05a3 Jonathan Kim 2022-03-25  796  	}
0ab2d7532b05a3 Jonathan Kim 2022-03-25  797  
0ab2d7532b05a3 Jonathan Kim 2022-03-25  798  	target->dbg_ev_file = f;
0ab2d7532b05a3 Jonathan Kim 2022-03-25  799  
218895820e6fcc Jonathan Kim 2022-04-05  800  	/* defer activation to runtime if not runtime enabled */
218895820e6fcc Jonathan Kim 2022-04-05  801  	if (target->runtime_info.runtime_state == DEBUG_RUNTIME_STATE_ENABLED)
218895820e6fcc Jonathan Kim 2022-04-05  802  		kfd_dbg_trap_activate(target);
218895820e6fcc Jonathan Kim 2022-04-05  803  
0ab2d7532b05a3 Jonathan Kim 2022-03-25  804  	/* We already hold the process reference but hold another one for the
0ab2d7532b05a3 Jonathan Kim 2022-03-25  805  	 * debug session.
0ab2d7532b05a3 Jonathan Kim 2022-03-25  806  	 */
0ab2d7532b05a3 Jonathan Kim 2022-03-25  807  	kref_get(&target->ref);
0ab2d7532b05a3 Jonathan Kim 2022-03-25  808  	target->debug_trap_enabled = true;
0ab2d7532b05a3 Jonathan Kim 2022-03-25  809  
0ab2d7532b05a3 Jonathan Kim 2022-03-25  810  	if (target->debugger_process)
0ab2d7532b05a3 Jonathan Kim 2022-03-25  811  		atomic_inc(&target->debugger_process->debugged_process_count);
0ab2d7532b05a3 Jonathan Kim 2022-03-25  812  
218895820e6fcc Jonathan Kim 2022-04-05  813  	if (copy_to_user(runtime_info, (void *)&target->runtime_info, copy_size)) {
218895820e6fcc Jonathan Kim 2022-04-05  814  		kfd_dbg_trap_deactivate(target, false, 0);
0ab2d7532b05a3 Jonathan Kim 2022-03-25  815  		r = -EFAULT;
218895820e6fcc Jonathan Kim 2022-04-05  816  	}
0ab2d7532b05a3 Jonathan Kim 2022-03-25  817  
0ab2d7532b05a3 Jonathan Kim 2022-03-25  818  	*runtime_size = sizeof(target->runtime_info);
0ab2d7532b05a3 Jonathan Kim 2022-03-25  819  
0ab2d7532b05a3 Jonathan Kim 2022-03-25  820  	return r;
0ab2d7532b05a3 Jonathan Kim 2022-03-25  821  }
e90bf919f714ae Jonathan Kim 2022-04-27  822  

:::::: The code at line 794 was first introduced by commit
:::::: 0ab2d7532b05a3e7c06fd3b0c8bd6b46c1dfb508 drm/amdkfd: prepare per-process debug enable and disable

:::::: TO: Jonathan Kim <jonathan.kim@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
