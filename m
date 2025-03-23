Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794631DE4CE
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Mar 2025 12:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742731571; cv=none; b=G5IfmFpk+YbGOSshW+eizyYp0AQ+lzH6Uax/O9kohfRRemGpO6as1BzwH8L1PVfx1mRUTib1njEiGexHbv+ax7bIqaiirxGuc464YPshoqhHeXWYkgzFlJRvrgVad+miw2L0c8GIkIStfdTK7WyJTb3A5q7Sbgi6oEHsb2fxHJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742731571; c=relaxed/simple;
	bh=xyXaJ7Oq4QwsMHvvDMaQwte9ZW+kfJvNwT9ukYZ7gKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i0IIG36YrrBwAasdMpYybAbYZwNnpYdz/YACZA8/Y7L0g2QfARFBvbtmWbZ1Kjfa2GU41AlRU2Bwo5ZHpmvCwZdzf+7qyCBIXE3z2Lczh1V6HXAVc7GoQpJ/yBknGBjqPTARy3S1Y9FzCBu78fi+o3vvTnkl9KZpC9P38oSn2/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jraAjrtX; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jraAjrtX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742731569; x=1774267569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xyXaJ7Oq4QwsMHvvDMaQwte9ZW+kfJvNwT9ukYZ7gKE=;
  b=jraAjrtXo3uWLYBnSlrEASP2S3K6zPo4m/hD9BQvhIyyI7p+H2kI4vY2
   nkuS8wR6NYqj6kPz20FrBRB/06tlxbShXUO1u4tZutMh+CFGcBuZH2eOT
   EJWSwXSh7637eT5cVZPd02HnyKTA4P6ui02m/ahwPnDWqDUA9FU1jHicF
   Im04T+qMNqgRz+1VZX0mwOOs1a42OZpLLnQl0OG8xq6xBg0WZiXKusfAB
   cm+HXvzgkFK1i45yO6M6N3VU/zCZOnIHDbDOUHK9U/dhENaARQgXs+DFw
   6BjIyZoX+gmZVHPYjV4UQ6vIcFikEhiLdqm9pB5mQi8R5WnM5/Nrl3pGP
   Q==;
X-CSE-ConnectionGUID: ciS03aGwQ4WzBChdiusxtg==
X-CSE-MsgGUID: 53TFPWgSRCaoLfAeKyqStQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="47599668"
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="47599668"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 05:06:08 -0700
X-CSE-ConnectionGUID: FQgZ/hqTTuSohZzUVumWyw==
X-CSE-MsgGUID: v31BbgxURiqcOOpNRYoyRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="128624557"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 23 Mar 2025 05:06:07 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twK5c-0002jv-1v;
	Sun, 23 Mar 2025 12:06:04 +0000
Date: Sun, 23 Mar 2025 20:05:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2818/2818]
 drivers/ub/urma/ubcore/ubcore_cmd.h:134 ubcore_copy_to_user() warn: maybe
 return -EFAULT instead of the bytes remaining?
Message-ID: <202503232011.rximxwnv-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Yizhen Fan <fanyizhen@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a7973281031cedabf6c66de13ffc2c313a71695f
commit: aeda8188894b2ed9ecf04dabaf5e147bce811725 [2818/2818] ub: change name in kconfig, and kconfig content of ub
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 5 months ago
config: x86_64-randconfig-161-20250322 (https://download.01.org/0day-ci/archive/20250323/202503232011.rximxwnv-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503232011.rximxwnv-lkp@intel.com/

New smatch warnings:
drivers/ub/urma/ubcore/ubcore_cmd.h:134 ubcore_copy_to_user() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
drivers/ub/urma/ubcore/ubcore_main.c:506 ubcore_query_res_arg() warn: returning -1 instead of -ENOMEM is sloppy

vim +134 drivers/ub/urma/ubcore/ubcore_cmd.h

95c713224477ac Yizhen Fan 2023-09-09  126  
95c713224477ac Yizhen Fan 2023-09-09  127  /* copy kernel args to user_space addr */
95c713224477ac Yizhen Fan 2023-09-09  128  static inline int ubcore_copy_to_user(void *args_addr, const void *args, unsigned long args_size)
95c713224477ac Yizhen Fan 2023-09-09  129  {
95c713224477ac Yizhen Fan 2023-09-09  130  	int ret = (int)copy_to_user(args_addr, args, args_size);
95c713224477ac Yizhen Fan 2023-09-09  131  
95c713224477ac Yizhen Fan 2023-09-09  132  	if (ret != 0)
95c713224477ac Yizhen Fan 2023-09-09  133  		ubcore_log_err("copy to user failed ret:%d.\n", ret);
95c713224477ac Yizhen Fan 2023-09-09 @134  	return ret;

:::::: The code at line 134 was first introduced by commit
:::::: 95c713224477ac3433652331dd715e9bbcbc793a ub: init ubcore module

:::::: TO: Yizhen Fan <fanyizhen@huawei.com>
:::::: CC: fanyizhen1995 <en_0015767@163.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
