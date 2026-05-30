Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DA03A545B
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 10:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780137637; cv=none; b=btKYWccSDdfnj8WEuMD/1bFMJMDi058DABnjayb2LcwTM4LRL24Z54wYwbxJq/APSmalO3WtJSWyCzZMcOSDz3O2k7Zps0W7gGx289hzut3qx4+hrg0LxQMzH5bGihpJgeGr7NabVsQQgYyv+IZn/Gjc5XjxPWfDb3gmlBg3tGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780137637; c=relaxed/simple;
	bh=kNgCN472b6WDqEV9UsrmZ0ZxOOC31JvP0mVZDqAv5qo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DlJ5uXxDEKalx5T3a6ybjSAK3qNG4xCx96fxMBy5fzukvPHjmRWSr7v7xcJZ47BmAA2NsSV61JepY4VoxSZYdLFC4YLBKoFeRCPfEH+Vb2ZQtRHfF6ou61S6hViTH8BD4/29ejH737KkzSzZw835qsc1a0PZOr4ggbwxUf0Bd+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gb89An1c; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gb89An1c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780137635; x=1811673635;
  h=date:from:to:cc:subject:message-id;
  bh=kNgCN472b6WDqEV9UsrmZ0ZxOOC31JvP0mVZDqAv5qo=;
  b=Gb89An1cNjblxp1qFgEiUBi+aHLEV4GOoURx6KvJVZSa+flhg5KwR6hY
   +vuX8ZmU5lXgkVFdv0/YFE2oFBprhttbKmcG5CVjOdo7TnsxsuOb06tFk
   NguMdUjjUiGVVzuWg+AQevS8do0ahMWGNOcGTaNuSL0Rrb7KPKOHo+/Ti
   IDvmHo74OKMRHHlb1+IRjgNyGgJdjQR5R2Z/cB968eRLRAiDYW/VFo5ao
   jY9v49nWeBlGwVD8yhu0EOXwmetSKKQi7xZdMlI3AefSY8gWOOyZzM9Uz
   x99AUA3nTLlJxdvSdizXjJsIScxs/a6qHpcQBeY/3SQtdXrf7qfvOOfhz
   w==;
X-CSE-ConnectionGUID: vU3dPfgwTSGEpVLQzNk1CA==
X-CSE-MsgGUID: 8fpRzT+rQIexjd8GSiBQkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="92087234"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="92087234"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 03:40:35 -0700
X-CSE-ConnectionGUID: OSknq+WGQZi2v863ni2A/Q==
X-CSE-MsgGUID: W+/iRYnKQKOVOvad6i5GGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="266715812"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 May 2026 03:40:33 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTH7H-000000008Ko-2O7P;
	Sat, 30 May 2026 10:40:31 +0000
Date: Sat, 30 May 2026 18:40:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld: mm/slub.c:3294:undefined reference to
 `bpf_arena_alloc_slab_page'
Message-ID: <202605301843.J0MIzEp3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Alexei-Starovoitov/slab-Introduce-kmem_cache_alloc_arena_nolock-and-kfree_arena_nolock/20260530-091530, commit: b76d09903028979bc6ee776d527701c97e9fa75c"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alexei Starovoitov <ast@kernel.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Alexei-Starovoitov/slab-Introduce-kmem_cache_alloc_arena_nolock-and-kfree_arena_nolock/20260530-091530
head:   3d01ecf4de7c4ea67e7e84597b640dc717a8a6c9
commit: b76d09903028979bc6ee776d527701c97e9fa75c bpf,slab: Add slub-backed allocator for bpf_arena
date:   9 hours ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: i386-randconfig-003-20260530 (https://download.01.org/0day-ci/archive/20260530/202605301843.J0MIzEp3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301843.J0MIzEp3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605301843.J0MIzEp3-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/slub.o: in function `alloc_slab_page':
   mm/slub.c:3294:(.text+0x54ce): undefined reference to `bpf_arena_alloc_slab_page'
>> ld: mm/slub.c:3294:(.text+0x5983): undefined reference to `bpf_arena_alloc_slab_page'
   ld: mm/slub.o: in function `__free_slab':
   mm/slub.c:3575:(.text+0x6f73): undefined reference to `bpf_arena_free_slab_page'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
