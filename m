Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C52338B
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jul 2024 22:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722378726; cv=none; b=P04zaCX2DkX4t8F4kBjcFTKp5LUX7ZYfAEIao0m6Wc3uL+/6vz58ajebPUn54VH69Nr033671E0eurrjFYBxsSLf/+1LBcdAi2MKAcIFsT4IYdw8rRIOprX/K1+gsM97I3jftb6BgbTq6eYLnY5mnzV9i2OfnwJLBR2PdwHksOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722378726; c=relaxed/simple;
	bh=c4LFHknL/F0tHWkdWCEJ/zz4ywQUzWVcCTvTXOTAfMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NWALr9XIDz45NeCCJYpgALhdyMjK3vF1SpE2ob0b0dQ6cLcrNXa1XN5zjzjb7TgHj7I32NC3MRFN/7QWqxxSK3ELi5KsWs1RNkvS7xR51FhYIxHdu5NKc8Se+kF0ylRNdilpS5It582NjqyridVoXASV9291UEXOdDyKzGL0ZbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VwzdhCw9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VwzdhCw9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722378724; x=1753914724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c4LFHknL/F0tHWkdWCEJ/zz4ywQUzWVcCTvTXOTAfMo=;
  b=VwzdhCw9sm0m0Q2WTn9rqVvWInonK7agn0qdPi6btn++ki1tCcwctiuz
   q4YKB3dC76gkkYzCaMye3Y4F72Ejfdn9Cihqst0XsteErZFUy+IN2gRh0
   B4dKF8lfMqaOE2qqXuCqtIGyo7l+CnQIBpRRYNYbhwziWG1Oc/hE/r1XM
   Tz0Wp8qaj3ZoHyfzMcHbM7Gy2OEcjQNu63uUSEuop5/v8MXciGIhWGT28
   +hUsLevZwprL7rrkz702naVr28z7Eq1dzUj8qBxx6AziAZXsNibfrBMQQ
   ZaAOtJcdBgFtGAK+K3wkdLmEsMSbYOfE9sU7Zi2tUMCahO6F0T0xgyulE
   w==;
X-CSE-ConnectionGUID: mGc8m56VQ02arLRjSg1UCQ==
X-CSE-MsgGUID: 5RFm3vrFQFeiDsLkbclmAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20408971"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="20408971"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 15:32:04 -0700
X-CSE-ConnectionGUID: aM1ssBy5RlerVEGIzG32ag==
X-CSE-MsgGUID: NNaxVSX0TsCYh04ZUHVd8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="85408729"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jul 2024 15:32:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYvNw-000tRG-1a;
	Tue, 30 Jul 2024 22:32:00 +0000
Date: Wed, 31 Jul 2024 06:31:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1656/1677] kernel/sched/sched.h:269
 sched_weight_to_cgroup() error: uninitialized symbol '__rem'.
Message-ID: <202407310643.xqYiq98A-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Tejun Heo <tj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cd19ac2f903276b820f5d0d89de0c896c27036ed
commit: 2d500e26b5f532a6d5cdfcb40696c6afaeca1980 [1656/1677] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git
:::::: branch date: 17 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-161-20240730 (https://download.01.org/0day-ci/archive/20240731/202407310643.xqYiq98A-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407310643.xqYiq98A-lkp@intel.com/

smatch warnings:
kernel/sched/sched.h:269 sched_weight_to_cgroup() error: uninitialized symbol '__rem'.

vim +/__rem +269 kernel/sched/sched.h

4f9c7ca8510442 Tejun Heo 2024-06-18  266  
4f9c7ca8510442 Tejun Heo 2024-06-18  267  static inline unsigned long sched_weight_to_cgroup(unsigned long weight)
4f9c7ca8510442 Tejun Heo 2024-06-18  268  {
4f9c7ca8510442 Tejun Heo 2024-06-18 @269  	return clamp_t(unsigned long,
4f9c7ca8510442 Tejun Heo 2024-06-18  270  		       DIV_ROUND_CLOSEST_ULL(weight * CGROUP_WEIGHT_DFL, 1024),
4f9c7ca8510442 Tejun Heo 2024-06-18  271  		       CGROUP_WEIGHT_MIN, CGROUP_WEIGHT_MAX);
4f9c7ca8510442 Tejun Heo 2024-06-18  272  }
4f9c7ca8510442 Tejun Heo 2024-06-18  273  

:::::: The code at line 269 was first introduced by commit
:::::: 4f9c7ca851044273df5d67e00ca0b4d0476a48f6 sched: Factor out cgroup weight conversion functions

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
