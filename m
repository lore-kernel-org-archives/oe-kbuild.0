Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2643BB112
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jul 2026 11:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783078211; cv=none; b=U2JWWHOgvtfY8TMT9mOyhysOqc+2DAgqjJ/L4Qn7hzBUuP9Wqwa1WaE/sfVSEQErbHj8jw2EcvZQKCkRrj8xq/zTK6DjP+jmZNUFt8N10F6qym1maus/NlV400F8zEIrc+mcBv+YJhCtR3br4ydAsFrShAj4Aes6QuTzoXL7xrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783078211; c=relaxed/simple;
	bh=rRNxa8+RpCtMCcbjlOwaiB8oxNTD9B34uTb3yJw1/ro=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OF6uMDS5vS8pcNn9OfVBYosW9pM6RsjNLQ7eqjF8oBPFuhHuYFW+dtlN2b74PuPZ0GWuW1A/siIXNqMDGKBovvRM/kKwGA/++uA5+CitnkP8B+x1vnonk2keJtME8Rlpdeb3EvRhwg79OEKjs2oIav+GTKElj8FbOlcvsHbeHxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfQfb9PJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfQfb9PJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783078210; x=1814614210;
  h=date:from:to:cc:subject:message-id;
  bh=rRNxa8+RpCtMCcbjlOwaiB8oxNTD9B34uTb3yJw1/ro=;
  b=XfQfb9PJEaoFMeH89QZT3oU3vDy7D4i+yHFHy3DGD+OkzGJ5xirYkxZQ
   /pIA20h7vPGU34YNdOje8n+RF+/+2r8EQmAFsR63DZjeb/SyipBPepMpY
   NIZ8pOd9VdU6brY3l1REWWpdpKipI3HnTg7rq1FTyFXMk87/HDjuxOCsD
   tKW4Q9/uzsedcxEbakN+r8GGh37/7l5FvEHA6Wj1fUqdOwjm1g7jf6vNX
   MBKC/ZORco7mUpftW6KVaQj5IjcjNCpINo0ScP7J5HSWLnsjLSsCfp21e
   vhAu6SldlwF+YnpUxkdPerxRIPUeBc/RXPhpfvvti+iP+C+DV/i3mDhE9
   g==;
X-CSE-ConnectionGUID: Tkk3AvWDQ3e9fBcZzyIMdQ==
X-CSE-MsgGUID: 5srKPQJuSXCFBSJO7sqrKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="106628776"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="106628776"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 04:30:09 -0700
X-CSE-ConnectionGUID: DO8L6EMxQCqdR+duRj/oIQ==
X-CSE-MsgGUID: HvwzXgP7TB+FuRnJ0V7OrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="257986454"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jul 2026 04:30:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfc5u-00000000C3d-1Fem;
	Fri, 03 Jul 2026 11:30:06 +0000
Date: Fri, 03 Jul 2026 19:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/amdkfd/kfd_chardev.c:77:2-8: preceding
 lock on line 73
Message-ID: <202607031930.G51RH4qv-lkp@intel.com>
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

Hi Han,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2c9a99135da931377240942d44f3dea104cedb8
commit: fa301127ba9a22f40b4261f569f1fc8b3d66e04e drm/amdkfd: enable kfd on LoongArch systems
date:   12 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r062-20260703 (https://download.01.org/0day-ci/archive/20260703/202607031930.G51RH4qv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: fa301127ba9a ("drm/amdkfd: enable kfd on LoongArch systems")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607031930.G51RH4qv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdkfd/kfd_chardev.c:77:2-8: preceding lock on line 73

vim +77 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c

4a488a7ad714011 Oded Gabbay     2014-07-16  68  
9731dd4cadc5325 Daniel Phillips 2022-05-30  69  static inline struct kfd_process_device *kfd_lock_pdd_by_id(struct kfd_process *p, __u32 gpu_id)
9731dd4cadc5325 Daniel Phillips 2022-05-30  70  {
9731dd4cadc5325 Daniel Phillips 2022-05-30  71  	struct kfd_process_device *pdd;
9731dd4cadc5325 Daniel Phillips 2022-05-30  72  
9731dd4cadc5325 Daniel Phillips 2022-05-30 @73  	mutex_lock(&p->mutex);
9731dd4cadc5325 Daniel Phillips 2022-05-30  74  	pdd = kfd_process_device_data_by_id(p, gpu_id);
9731dd4cadc5325 Daniel Phillips 2022-05-30  75  
9731dd4cadc5325 Daniel Phillips 2022-05-30  76  	if (pdd)
9731dd4cadc5325 Daniel Phillips 2022-05-30 @77  		return pdd;
9731dd4cadc5325 Daniel Phillips 2022-05-30  78  
9731dd4cadc5325 Daniel Phillips 2022-05-30  79  	mutex_unlock(&p->mutex);
9731dd4cadc5325 Daniel Phillips 2022-05-30  80  	return NULL;
9731dd4cadc5325 Daniel Phillips 2022-05-30  81  }
9731dd4cadc5325 Daniel Phillips 2022-05-30  82  

:::::: The code at line 77 was first introduced by commit
:::::: 9731dd4cadc53251ef80b3655c8d841fed52fa3d drm/amdkfd: Add available memory ioctl

:::::: TO: Daniel Phillips <Daniel.Phillips@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
