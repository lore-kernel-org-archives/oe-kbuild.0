Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2EC207A02
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Feb 2025 11:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740137775; cv=none; b=k1sRazZsBsSIJbCB+tmu9Thdi2BLRxSfJkTwvg49mLe9zeLo44/QZ4Xq3bgn/dm6F5rU7ulNFTHz7V2z38RdbSgZJte405Z0+dLFqfuEn7ei85qyNZxSMNOd3IBgG6piY5j4R3wh3MrpvusO7yEOsDOSxGYY9/wmEf1vBebwdsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740137775; c=relaxed/simple;
	bh=paWjvEpR2NALdmeMZeJs6vqGyacCZWuzMeRcKnczifM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I9HabucmFTmEkRDgjCJtiIu/JEaIMxPj4CMGVzjN1JFjmk1p5TKcyzK3Fgw+TM/7gzcuwCp7kIIEGJ9YFCV+kmyVU9lXziVyhArtzs/a/3kD+MXkbdnkf5eCEu2NPbieTrweY7B4kC9ce39Y+zme3/wYZ9uE3n0Qq82eQeAD3sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mey094H3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mey094H3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740137773; x=1771673773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=paWjvEpR2NALdmeMZeJs6vqGyacCZWuzMeRcKnczifM=;
  b=Mey094H3n+/ONhehEJwUH++MSN1ZrjlowMvQ3i9KXi1Dpwi7G0kRvYgY
   eOcIi3QrLcTuVUeEmjp8se37DsxoDpLgdU8Q8O0s9GUfeiKxPq6CMiAC+
   rCRo+iOqru26DC488+Hx3FSvkf0odXW/lR9SOQBap/k5Ylg1IppZiu1kz
   2DfjXNuBG68eC+x/qXd1hUg5ym1sLf21qPYEP9aaD/zhLnMaGsxOW65Mo
   LF5LlwIqaT7ImFFljgEvUrNpsvNBdnTEnRzDPSeB/oJnsApRBwoe9iMiV
   W2eLUtZB5lUR0LMaKdecL32BRIoB91GvAlTpHNgj3WzA0F34iRt9R4scI
   g==;
X-CSE-ConnectionGUID: M8e+m3ysT2K+epj0p1k3xA==
X-CSE-MsgGUID: TGXr2ZFATzeuo0lwQlG/Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44869907"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="44869907"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 03:36:12 -0800
X-CSE-ConnectionGUID: y4l2DApKTxawN1e82vcxrg==
X-CSE-MsgGUID: dplzxQ8jT6GCzwKfxbN7Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="115349469"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Feb 2025 03:36:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlRKA-0005S9-25;
	Fri, 21 Feb 2025 11:36:09 +0000
Date: Fri, 21 Feb 2025 19:34:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/sched/ext.c:5356 scx_create_rt_helper() warn: 'helper' is an
 error pointer or valid
Message-ID: <202502211941.Z5Lgg2UR-lkp@intel.com>
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
TO: Frederic Weisbecker <frederic@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   334426094588f8179fe175a09ecc887ff0c75758
commit: 41f70d8e16349c65abdc0dd88a7d0ab94e5ce639 kthread: Unify kthread_create_on_cpu() and kthread_create_worker_on_cpu() automatic format
date:   6 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 6 weeks ago
config: powerpc-randconfig-r073-20250221 (https://download.01.org/0day-ci/archive/20250221/202502211941.Z5Lgg2UR-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502211941.Z5Lgg2UR-lkp@intel.com/

smatch warnings:
kernel/sched/ext.c:5356 scx_create_rt_helper() warn: 'helper' is an error pointer or valid
kernel/sched/ext.c:5357 scx_create_rt_helper() error: 'helper' dereferencing possible ERR_PTR()

vim +/helper +5356 kernel/sched/ext.c

f0e1a0643a59bf Tejun Heo 2024-06-18  5350  
f0e1a0643a59bf Tejun Heo 2024-06-18  5351  static struct kthread_worker *scx_create_rt_helper(const char *name)
f0e1a0643a59bf Tejun Heo 2024-06-18  5352  {
f0e1a0643a59bf Tejun Heo 2024-06-18  5353  	struct kthread_worker *helper;
f0e1a0643a59bf Tejun Heo 2024-06-18  5354  
f0e1a0643a59bf Tejun Heo 2024-06-18  5355  	helper = kthread_create_worker(0, name);
f0e1a0643a59bf Tejun Heo 2024-06-18 @5356  	if (helper)
f0e1a0643a59bf Tejun Heo 2024-06-18 @5357  		sched_set_fifo(helper->task);
f0e1a0643a59bf Tejun Heo 2024-06-18  5358  	return helper;
f0e1a0643a59bf Tejun Heo 2024-06-18  5359  }
f0e1a0643a59bf Tejun Heo 2024-06-18  5360  

:::::: The code at line 5356 was first introduced by commit
:::::: f0e1a0643a59bf1f922fa209cec86a170b784f3f sched_ext: Implement BPF extensible scheduler class

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
