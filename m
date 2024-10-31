Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C528F19E7D3
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Oct 2024 13:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730379619; cv=none; b=IZFd8ofH1fKKPrlaxu3P/8/PwW6tAbnudsYNvAaX6qB4zcYadfoXKsKE/PKCU/t3PeuApisvqcYNkzzI7dtHC92hbNKxcAgiSw+aMGpK48lkJVk4h4hVxqEoYJtXJT4tJKUbMM73m1NWdk89x4f1rVc4KWhijgQot3/ui+mB1Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730379619; c=relaxed/simple;
	bh=jv6SJSemxBJPALMHZep/HTpRvD479zq/5aQs8q/4+4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nj6TR53MMS0CandEbS3D58yenr+WMfosu4OHlDP7YXAKArWGUq7og22jAXzcuz4WwIdBD4ts6ORREv5+He7T6793t4uLZJLr8ItJf6v1Q53kMMocUuB20ch7xrI+WhFApCcIp2ms2icj3+5vrmg+Epi5RLMwBYNcqRwRttmrpBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMaj3Ekk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMaj3Ekk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730379617; x=1761915617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jv6SJSemxBJPALMHZep/HTpRvD479zq/5aQs8q/4+4c=;
  b=FMaj3EkkgDcLeWHAQba/wjwkm0NGnP89DbERbl4B+BP5rXUlPWTGN7iM
   Yg3oc2JynWe9PuVs1f5aWnO8gTo9o61yr5md44To58wSpXzB0JG2zfS2g
   t6UwHW1DOkVnpgY4cUEfCkhV9LcodPlahJZDBgp0GlYs+yH4rPUOlYDxE
   SWsxSvT7pjm6sO5HRXx6uqPmvV3MUjahuMOZRWZpyPrknS0jXoGanFpyO
   Lfy4SAm9lFk4YjHrnnIx82qYFTBAwU9SuWAh041SaaUaEdQxe+78a6zl4
   cgSVKTq5tBx0VQiEyw7R+KhzwaSrpqmm1xyoEfWWIDfOQmZTkk/4Vlvei
   g==;
X-CSE-ConnectionGUID: yTw9q7mrR7aZJbIjkyRGbQ==
X-CSE-MsgGUID: rJeWidNbTBS0cjtq3EZY3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="32950736"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="32950736"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 06:00:16 -0700
X-CSE-ConnectionGUID: JCzyVm61R+Gn6AK8fLoVyw==
X-CSE-MsgGUID: VsAAvn5pTsWw3qJmzSTkSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="87159515"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Oct 2024 06:00:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Umb-000g72-0W;
	Thu, 31 Oct 2024 13:00:13 +0000
Date: Thu, 31 Oct 2024 20:59:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/amdkfd/kfd_chardev.c:76:2-8: preceding lock on
 line 72
Message-ID: <202410312047.vchqG7xb-lkp@intel.com>
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
TO: Daniel Phillips <Daniel.Phillips@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: David Yat Sin <David.YatSin@amd.com>
CC: Felix Kuehling <Felix.Kuehling@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0fc810ae3ae110f9e2fcccce80fc8c8d62f97907
commit: 9731dd4cadc53251ef80b3655c8d841fed52fa3d drm/amdkfd: Add available memory ioctl
date:   2 years, 5 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 2 years, 5 months ago
config: x86_64-randconfig-103-20241030 (https://download.01.org/0day-ci/archive/20241031/202410312047.vchqG7xb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410312047.vchqG7xb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdkfd/kfd_chardev.c:76:2-8: preceding lock on line 72

vim +76 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c

4a488a7ad71401 Oded Gabbay     2014-07-16  67  
9731dd4cadc532 Daniel Phillips 2022-05-30  68  static inline struct kfd_process_device *kfd_lock_pdd_by_id(struct kfd_process *p, __u32 gpu_id)
9731dd4cadc532 Daniel Phillips 2022-05-30  69  {
9731dd4cadc532 Daniel Phillips 2022-05-30  70  	struct kfd_process_device *pdd;
9731dd4cadc532 Daniel Phillips 2022-05-30  71  
9731dd4cadc532 Daniel Phillips 2022-05-30 @72  	mutex_lock(&p->mutex);
9731dd4cadc532 Daniel Phillips 2022-05-30  73  	pdd = kfd_process_device_data_by_id(p, gpu_id);
9731dd4cadc532 Daniel Phillips 2022-05-30  74  
9731dd4cadc532 Daniel Phillips 2022-05-30  75  	if (pdd)
9731dd4cadc532 Daniel Phillips 2022-05-30 @76  		return pdd;
9731dd4cadc532 Daniel Phillips 2022-05-30  77  
9731dd4cadc532 Daniel Phillips 2022-05-30  78  	mutex_unlock(&p->mutex);
9731dd4cadc532 Daniel Phillips 2022-05-30  79  	return NULL;
9731dd4cadc532 Daniel Phillips 2022-05-30  80  }
9731dd4cadc532 Daniel Phillips 2022-05-30  81  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
