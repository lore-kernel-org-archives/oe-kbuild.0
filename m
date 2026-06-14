Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71782146D53
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jun 2026 19:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781466586; cv=none; b=AdtmlicCSpb7b8AWy4ChkGGSC2bO8PA/G18mSKTnNNmWU7ukkDouwdyYQJptaPldkUg3rNI/CLXAu3mpe94/kW+h2koN/oHRu2ZiLdTY6JXaIq9TWkXoqv87TxBsPCWmRBcCMqwFufXD2v3kjiq8IxMLEAZg3lOL89msUiJP1bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781466586; c=relaxed/simple;
	bh=ILdjAHYeZkZ5sECF+1vVdE8NUxK58Kt8d/ZEjecvjfY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XWGRBPFoDxrICLyKZVHckGDJz+N9E+UzUrC9VftsiYmmer6ongN+cavmXUfXoikQ5DxvPK4MwQGUu3iAE5jiYrMxY+xOE/kAzLcgZbUWmJUfnc4RVA0LC9A3C/PoAVvby9KJkENUWlj4QlJZm2ASxID/8fqmgEoQAf+sifihEKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAP1I8uS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAP1I8uS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781466585; x=1813002585;
  h=date:from:to:cc:subject:message-id;
  bh=ILdjAHYeZkZ5sECF+1vVdE8NUxK58Kt8d/ZEjecvjfY=;
  b=AAP1I8uS+X7h0UjDhl5pCxBF+/Fvt/d5l7ZMWIbXEAbmXOgQxJaM65a4
   S4VOvrmisV3vHQ/PIcWovJC7XOAGMWJTxuw+WM69nEuV54IdcqzGMpQmZ
   OTB6UJyXie+etTjTeaz0iC64siIS4drkFaRYm098x8x+qUv6OVIqsxiIr
   p9we6t+KsaNijISEjEDFYUM3thVq55PLD/Fbc/Q2BQapiONuFcguS/3am
   Wuqk+lZyM/3IJKFtrKpbZJ57crajNjKbfOYwP9uqYRO4u2PI4u36tKMUu
   3b8oMpU18jjm88ywTLwwV+zLX9a8Fth4gmOckxAxH/Mk//DNo2TW//3kx
   A==;
X-CSE-ConnectionGUID: wqN8u+XIS5WDoEZxHHcMVg==
X-CSE-MsgGUID: cwe2vceyT1O1QSGb1LB4+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82278279"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="82278279"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 12:49:44 -0700
X-CSE-ConnectionGUID: PVWeMxE1SBmrhX2KerBnGQ==
X-CSE-MsgGUID: Qj5lbsTiSFOka9/YQKrQbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="247169717"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Jun 2026 12:49:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYqpw-00000000RAS-2VAk;
	Sun, 14 Jun 2026 19:49:40 +0000
Date: Mon, 15 Jun 2026 03:49:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/cgroup/cgroup.o: warning: objtool:
 cgroup_wq_init+0xe8: unreachable instruction
Message-ID: <202606150338.OCsBCglV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Chen Ridong <chenridong@huawei.com>
CC: Tejun Heo <tj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cd9520d35a6c38db6567e97dd93b1f11f185dc6
commit: 79f919a89c9d06816dbdbbd168fa41d27411a7f9 cgroup: split cgroup_destroy_wq into 3 workqueues
date:   10 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-r064-20260608 (https://download.01.org/0day-ci/archive/20260615/202606150338.OCsBCglV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150338.OCsBCglV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 79f919a89c9d ("cgroup: split cgroup_destroy_wq into 3 workqueues")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606150338.OCsBCglV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/cgroup/cgroup.o: warning: objtool: compare_css_sets+0x1b4: unreachable instruction
   kernel/cgroup/cgroup.o: warning: objtool: cgroup_setup_root+0x5ec: unreachable instruction
   kernel/cgroup/cgroup.o: warning: objtool: cgroup_destroy_root+0x11c: unreachable instruction
>> kernel/cgroup/cgroup.o: warning: objtool: cgroup_wq_init+0xe8: unreachable instruction
   kernel/cgroup/cgroup.o: warning: objtool: cgroup_init_subsys+0x240: unreachable instruction
   kernel/cgroup/cgroup.o: warning: objtool: cgroup_init+0xd0: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
