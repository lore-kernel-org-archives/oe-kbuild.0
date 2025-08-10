Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72AAB640
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Aug 2025 01:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754788317; cv=none; b=ZJXxIK8P4DfQUW8KkejPNk8XPlfSRyVfyrtlJwR5E3+kyLRGubNJq7egUyeP7oAjf6CHlwPc1FKi2j5e7EmRz1vmwc5kb7itycOkPjSnx1NZAUDrkD08MsuRVFgOfXcGeI7LdipsXOFgPyqbJ3/8AN/S3kPsupY7yTtTQ2YqEwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754788317; c=relaxed/simple;
	bh=oHT+1RQ4JTWJ3BZUkAn6yLqtwQZFQlYzvri1Q4B3ITM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iTIWMYVjA8TgbJ4Okl/7Y5JFh8BGptR6YC2U9n/xCAYL3MCTV8Ahu9NkMCYi6jnfosnH2nXQ2ksw2dNZzQ/a95dj1niV2imWU3P1RqabcXZ3suUczkFxLcMXf2xkUal+98aDSknGvhI0VF1yMqd5ELWafLMcKTP+0AKgz5ZcUyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NxNfV1zj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NxNfV1zj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754788315; x=1786324315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oHT+1RQ4JTWJ3BZUkAn6yLqtwQZFQlYzvri1Q4B3ITM=;
  b=NxNfV1zjAcV4r2mlhgbKho5BnpLcmLTNw8eMKraswFZ8SF0VcmrO5Vo1
   pY4cAfUEsHWtjFMJhiOWrrthOMQ2ke1pquXGZ4auYz7uP7n6TUEMJJQaG
   AZ+Q9KrMrHB18SvlwfxEWBovhiqaNg6+7Ajy386G3KTv1gjgGhj6bB8iC
   QXr/ru1W3e1LA6bWBWgH+ewwRpYk4YMxOew220W1ZEPEQSS0KXR0BPjGk
   c7GGR9+LBDcdy8R7BXtscsbc6//CY+2ko6UjJ+uz8/KnMygYonMSdJshd
   Nx5pjw6F5mCyNEv5W5g0SzqTMohAi9hAqOhVS6rUq4tSNIOXKIa8rXTpo
   g==;
X-CSE-ConnectionGUID: c7DEINXvR1qkq6jjvDWAzA==
X-CSE-MsgGUID: +rL9ApciQFm0sXGa7h0k5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="68458027"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="68458027"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 18:11:54 -0700
X-CSE-ConnectionGUID: aXIqSlV6S2SrKmsh4fB3+A==
X-CSE-MsgGUID: +WhmTOpaT2+mkyxG5jzToQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165925324"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 09 Aug 2025 18:11:53 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukubG-00056i-1v;
	Sun, 10 Aug 2025 01:11:50 +0000
Date: Sun, 10 Aug 2025 09:11:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rgushchin:bpfoom.1.6 14/15] kernel/sched/bpf_psi.c:185
 bpf_psi_create_trigger() warn: curly braces intended?
Message-ID: <202508100933.hE8ICkP7-lkp@intel.com>
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
TO: Roman Gushchin <roman.gushchin@linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.1.6
head:   4449fabc436d3de0b6d9ba42227e052e65bbcc97
commit: f3c5ff34789daf7f90c525e674e45059048b10d0 [14/15] sched: psi: implement bpf_psi_create_trigger() kfunc
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: openrisc-randconfig-r071-20250810 (https://download.01.org/0day-ci/archive/20250810/202508100933.hE8ICkP7-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508100933.hE8ICkP7-lkp@intel.com/

smatch warnings:
kernel/sched/bpf_psi.c:185 bpf_psi_create_trigger() warn: curly braces intended?
kernel/sched/bpf_psi.c:187 bpf_psi_create_trigger() warn: inconsistent indenting
kernel/sched/bpf_psi.c:197 bpf_psi_create_trigger() warn: passing zero to 'PTR_ERR'

vim +185 kernel/sched/bpf_psi.c

f3c5ff34789daf Roman Gushchin 2025-08-06  160  
f3c5ff34789daf Roman Gushchin 2025-08-06  161  __bpf_kfunc int bpf_psi_create_trigger(struct bpf_psi *bpf_psi,
f3c5ff34789daf Roman Gushchin 2025-08-06  162  				       u64 cgroup_id, u32 resource,
f3c5ff34789daf Roman Gushchin 2025-08-06  163  				       u32 threshold_us, u32 window_us)
f3c5ff34789daf Roman Gushchin 2025-08-06  164  {
f3c5ff34789daf Roman Gushchin 2025-08-06  165  	enum psi_res res = resource & ~BPF_PSI_FULL;
f3c5ff34789daf Roman Gushchin 2025-08-06  166  	bool full = resource & BPF_PSI_FULL;
f3c5ff34789daf Roman Gushchin 2025-08-06  167  	struct psi_trigger_params params;
f3c5ff34789daf Roman Gushchin 2025-08-06  168  	struct cgroup *cgroup __maybe_unused = NULL;
f3c5ff34789daf Roman Gushchin 2025-08-06  169  	struct psi_group *group;
f3c5ff34789daf Roman Gushchin 2025-08-06  170  	struct psi_trigger *t;
f3c5ff34789daf Roman Gushchin 2025-08-06  171  	int ret = 0;
f3c5ff34789daf Roman Gushchin 2025-08-06  172  
f3c5ff34789daf Roman Gushchin 2025-08-06  173  	if (res >= NR_PSI_RESOURCES)
f3c5ff34789daf Roman Gushchin 2025-08-06  174  		return -EINVAL;
f3c5ff34789daf Roman Gushchin 2025-08-06  175  
f3c5ff34789daf Roman Gushchin 2025-08-06  176  #ifdef CONFIG_CGROUPS
f3c5ff34789daf Roman Gushchin 2025-08-06  177  	if (cgroup_id) {
f3c5ff34789daf Roman Gushchin 2025-08-06  178  		cgroup = cgroup_get_from_id(cgroup_id);
f3c5ff34789daf Roman Gushchin 2025-08-06  179  		if (IS_ERR_OR_NULL(cgroup))
f3c5ff34789daf Roman Gushchin 2025-08-06  180  			return PTR_ERR(cgroup);
f3c5ff34789daf Roman Gushchin 2025-08-06  181  
f3c5ff34789daf Roman Gushchin 2025-08-06  182  		group = cgroup_psi(cgroup);
f3c5ff34789daf Roman Gushchin 2025-08-06  183  	} else
f3c5ff34789daf Roman Gushchin 2025-08-06  184  #endif
f3c5ff34789daf Roman Gushchin 2025-08-06 @185  		group = &psi_system;
f3c5ff34789daf Roman Gushchin 2025-08-06  186  
f3c5ff34789daf Roman Gushchin 2025-08-06 @187  	params.type = PSI_BPF;
f3c5ff34789daf Roman Gushchin 2025-08-06  188  	params.bpf_psi = bpf_psi;
f3c5ff34789daf Roman Gushchin 2025-08-06  189  	params.privileged = capable(CAP_SYS_RESOURCE);
f3c5ff34789daf Roman Gushchin 2025-08-06  190  	params.res = res;
f3c5ff34789daf Roman Gushchin 2025-08-06  191  	params.full = full;
f3c5ff34789daf Roman Gushchin 2025-08-06  192  	params.threshold_us = threshold_us;
f3c5ff34789daf Roman Gushchin 2025-08-06  193  	params.window_us = window_us;
f3c5ff34789daf Roman Gushchin 2025-08-06  194  
f3c5ff34789daf Roman Gushchin 2025-08-06  195  	t = psi_trigger_create(group, &params);
f3c5ff34789daf Roman Gushchin 2025-08-06  196  	if (IS_ERR_OR_NULL(t))
f3c5ff34789daf Roman Gushchin 2025-08-06 @197  		ret = PTR_ERR(t);
f3c5ff34789daf Roman Gushchin 2025-08-06  198  	else
f3c5ff34789daf Roman Gushchin 2025-08-06  199  		t->cgroup_id = cgroup_id;
f3c5ff34789daf Roman Gushchin 2025-08-06  200  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
