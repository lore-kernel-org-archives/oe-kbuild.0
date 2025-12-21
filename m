Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE271E5B9E
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 06:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766297882; cv=none; b=XQrsNtbaO1uAffazXs+IttEncP8hphRiz0Gt7GFBC8CtPbX8jMxexQ12v5b0E+aLycv0IkipJio3CTZgBkhByuSSXNWE4L5jUM/g2c53UKk7gOH5+R/RxNmyIdsZOXcoO1MeuXYUZOZhbUpQqlMl0hZdjfYoZxiWB6eD7TyhFMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766297882; c=relaxed/simple;
	bh=G7129q87eWaEP0Tf7m7vKjzbaDRRqbyZE32LGSTTU9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LaJtKnoVvrD8InN/bnxpX/j4n2tSNjv2RrzUojTxpd44ajAnHxFpjCx+ngqJYjE2sH/dGLvFBbtNgh6O/H382WLissQi46WCzcRngEitA4wXHfjny8QbupAeFXvBTzI+YPWVqs69erKbvbdXTZtillsfTU28d6azbOiPEx0kSX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nw4+eZXP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nw4+eZXP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766297880; x=1797833880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G7129q87eWaEP0Tf7m7vKjzbaDRRqbyZE32LGSTTU9A=;
  b=nw4+eZXPsVm/ZeoIqhMgkI+Xg5rkqLBfP+HD/cXZSkz9gMSiJ6bqkVsa
   pS8rWzewqTUsK5rugFYYBw6WabTTWHtJZSSMtFGjkW2Oh+U1ZOp0rPfNh
   tziLXjfPZknab915Dia9AAIAg9a4mXSSvwKLYiIE8VsTi1MTBAUoTbzZ3
   GoUmLctyVWj/kxPSA2jUA3ZDRl0G6BUyBHmeBBdAim0Jm+urURn0XSsW0
   XKLGfaCYFh59witywAbnhPFVkT6qi6u4SeX08ysQCPe4QPHx/CFg8rU4R
   RMCo5PPizaOYxL3qrls4w0PkvrWoPpmSwuvzNTYIlS9cJukRMq3/siASv
   g==;
X-CSE-ConnectionGUID: Ni8aOw7aTpOaqJEplpvV4w==
X-CSE-MsgGUID: CKeb5l+mSyqkfZw0G2e3Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68088755"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68088755"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 22:17:59 -0800
X-CSE-ConnectionGUID: ePRG9yolSGOpyRrBjF1mHQ==
X-CSE-MsgGUID: nne75Zu6SXCEIR+zKU9kKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203764269"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Dec 2025 22:17:58 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXClP-000000005M1-2pBy;
	Sun, 21 Dec 2025 06:17:55 +0000
Date: Sun, 21 Dec 2025 14:17:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2273/2322]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:860
 kfd_create_process_sysfs() warn: Calling kobject_put|get with
 state->initialized unset from line: 837
Message-ID: <202512211418.TxaoD7A8-lkp@intel.com>
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
TO: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
commit: 166cc008bce2b4f9b267b1649e248b85c9cb0155 [2273/2322] Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux.git
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20251218 (https://download.01.org/0day-ci/archive/20251221/202512211418.TxaoD7A8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512211418.TxaoD7A8-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:860 kfd_create_process_sysfs() warn: Calling kobject_put|get with state->initialized unset from line: 837

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:593 kfd_procfs_add_sysfs_stats() warn: Calling kobject_put|get with state->initialized unset from line: 581
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:639 kfd_procfs_add_sysfs_counters() warn: Calling kobject_put|get with state->initialized unset from line: 630
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:2099 signal_eviction_fence() warn: signedness bug returning '(-22)'

vim +860 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c

68df0f195a689b Lang Yu      2021-10-11  826  
4cd255b9694647 Zhu Lingshan 2025-04-22  827  int kfd_create_process_sysfs(struct kfd_process *process)
4cd255b9694647 Zhu Lingshan 2025-04-22  828  {
fac682a1d1af12 Zhu Lingshan 2025-10-14  829  	struct kfd_process *primary_process;
4cd255b9694647 Zhu Lingshan 2025-04-22  830  	int ret;
4cd255b9694647 Zhu Lingshan 2025-04-22  831  
4cd255b9694647 Zhu Lingshan 2025-04-22  832  	if (process->kobj) {
4cd255b9694647 Zhu Lingshan 2025-04-22  833  		pr_warn("kobject already exsists for the kfd_process\n");
4cd255b9694647 Zhu Lingshan 2025-04-22  834  		return -EINVAL;
4cd255b9694647 Zhu Lingshan 2025-04-22  835  	}
4cd255b9694647 Zhu Lingshan 2025-04-22  836  
4cd255b9694647 Zhu Lingshan 2025-04-22  837  	process->kobj = kfd_alloc_struct(process->kobj);
4cd255b9694647 Zhu Lingshan 2025-04-22  838  	if (!process->kobj) {
4cd255b9694647 Zhu Lingshan 2025-04-22  839  		pr_warn("Creating procfs kobject failed");
4cd255b9694647 Zhu Lingshan 2025-04-22  840  		return -ENOMEM;
4cd255b9694647 Zhu Lingshan 2025-04-22  841  	}
fac682a1d1af12 Zhu Lingshan 2025-10-14  842  
fac682a1d1af12 Zhu Lingshan 2025-10-14  843  	if (process->context_id == KFD_CONTEXT_ID_PRIMARY)
4cd255b9694647 Zhu Lingshan 2025-04-22  844  		ret = kobject_init_and_add(process->kobj, &procfs_type,
4cd255b9694647 Zhu Lingshan 2025-04-22  845  					   procfs.kobj, "%d",
4cd255b9694647 Zhu Lingshan 2025-04-22  846  					   (int)process->lead_thread->pid);
fac682a1d1af12 Zhu Lingshan 2025-10-14  847  	else {
fac682a1d1af12 Zhu Lingshan 2025-10-14  848  		primary_process = kfd_lookup_process_by_mm(process->lead_thread->mm);
fac682a1d1af12 Zhu Lingshan 2025-10-14  849  		if (!primary_process)
fac682a1d1af12 Zhu Lingshan 2025-10-14  850  			return -ESRCH;
fac682a1d1af12 Zhu Lingshan 2025-10-14  851  
fac682a1d1af12 Zhu Lingshan 2025-10-14  852  		ret = kobject_init_and_add(process->kobj, &procfs_type,
fac682a1d1af12 Zhu Lingshan 2025-10-14  853  					   primary_process->kobj, "context_%u",
fac682a1d1af12 Zhu Lingshan 2025-10-14  854  					   process->context_id);
fac682a1d1af12 Zhu Lingshan 2025-10-14  855  		kfd_unref_process(primary_process);
fac682a1d1af12 Zhu Lingshan 2025-10-14  856  	}
fac682a1d1af12 Zhu Lingshan 2025-10-14  857  
4cd255b9694647 Zhu Lingshan 2025-04-22  858  	if (ret) {
4cd255b9694647 Zhu Lingshan 2025-04-22  859  		pr_warn("Creating procfs pid directory failed");
4cd255b9694647 Zhu Lingshan 2025-04-22 @860  		kobject_put(process->kobj);
4cd255b9694647 Zhu Lingshan 2025-04-22  861  		return ret;
4cd255b9694647 Zhu Lingshan 2025-04-22  862  	}
4cd255b9694647 Zhu Lingshan 2025-04-22  863  
4cd255b9694647 Zhu Lingshan 2025-04-22  864  	kfd_sysfs_create_file(process->kobj, &process->attr_pasid,
4cd255b9694647 Zhu Lingshan 2025-04-22  865  			      "pasid");
4cd255b9694647 Zhu Lingshan 2025-04-22  866  
4cd255b9694647 Zhu Lingshan 2025-04-22  867  	process->kobj_queues = kobject_create_and_add("queues",
4cd255b9694647 Zhu Lingshan 2025-04-22  868  						process->kobj);
4cd255b9694647 Zhu Lingshan 2025-04-22  869  	if (!process->kobj_queues)
4cd255b9694647 Zhu Lingshan 2025-04-22  870  		pr_warn("Creating KFD proc/queues folder failed");
4cd255b9694647 Zhu Lingshan 2025-04-22  871  
4cd255b9694647 Zhu Lingshan 2025-04-22  872  	kfd_procfs_add_sysfs_stats(process);
4cd255b9694647 Zhu Lingshan 2025-04-22  873  	kfd_procfs_add_sysfs_files(process);
4cd255b9694647 Zhu Lingshan 2025-04-22  874  	kfd_procfs_add_sysfs_counters(process);
4cd255b9694647 Zhu Lingshan 2025-04-22  875  
4cd255b9694647 Zhu Lingshan 2025-04-22  876  	return 0;
4cd255b9694647 Zhu Lingshan 2025-04-22  877  }
4cd255b9694647 Zhu Lingshan 2025-04-22  878  

:::::: The code at line 860 was first introduced by commit
:::::: 4cd255b9694647b784f085ae144b727b6ffdfbfc amdkfd: Introduce kfd_create_process_sysfs as a separate function

:::::: TO: Zhu Lingshan <lingshan.zhu@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
