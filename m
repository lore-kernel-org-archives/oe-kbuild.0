Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1086A3128CF
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Dec 2025 11:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766836238; cv=none; b=FTN6kZQX1l3/opnM4ZcgGSF0nnrgc0Zxlz/l70SJY1vVQ9mZm4a5YP1Mh//+QFf/m+G23/KP8HjpaM4EaPwMOAqhjZ4FvsigBX2a4V/WKyt5LRcMFakGuNrMnJ7MMZ0jzoMbcc8qcTJKOUObibLVjzwWyjTNOd9aL9ugcyp8jfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766836238; c=relaxed/simple;
	bh=XlIH8b2g67jXmfkEjDKf2jO+qd3dXQxBgeZv4XLxSR4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RFNdsWDGEs3nFV7IzDqv/R4VW0t5/IJbdGYUIRg3LiaNOPTATvnkLztgUc18wzoxKooCWr8nUUcEvEUKBFWby2DD4AKxyeD6JvFFRfUNBzRy/cTpIqco9Ln9/CHj6ZJUp1+B01Zp6mXyirApVHn/oH1S1Qd/RHeS/bZbqqeAzIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrO/+O8Z; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrO/+O8Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766836237; x=1798372237;
  h=date:from:to:cc:subject:message-id;
  bh=XlIH8b2g67jXmfkEjDKf2jO+qd3dXQxBgeZv4XLxSR4=;
  b=nrO/+O8ZV7DqCEkZt1O+dII127/HnUthgVTFgmrhg6H70vyN+SJmo782
   R8Rh2yrEVw7F3Rjhu003KLLJEKTwftY0iIseKQ1d470ZyIO8WHrWAAwPC
   0ow0XuddhgFvOOtPVQRDZFjD+aTfPBljkOSrRZ0HzywIu49MDQVqgZKIp
   MDId1TDZdirBeNsFk+jxZpYTb1z+9xGT/+WJv+qBTdOIvZrKR+uvnQkt1
   wC9bWwr1i5aUTbnMKh9aMH+Gsck3zuB0kvaKiv40sKN3LVtCU7gx836WT
   X87PsaCroz/tTbnE9sa8mxAi1Zurfdx4+yPR7mSiysLO3HmH+4IjmuGXP
   A==;
X-CSE-ConnectionGUID: kTk5JZttR3msKzzDui7oig==
X-CSE-MsgGUID: /1lKF2LRSTqPUddWCW/Tug==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68588104"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68588104"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 03:50:37 -0800
X-CSE-ConnectionGUID: 4bwR3g4JTweoE5m5Gt3V/w==
X-CSE-MsgGUID: iUzwccO4RNqXKv9s5EjniQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="205588918"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 27 Dec 2025 03:50:34 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZSoQ-000000005mr-2jjb;
	Sat, 27 Dec 2025 11:50:24 +0000
Date: Sat, 27 Dec 2025 19:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sj:damon/next 39/109] mm/damon/sysfs.c:920
 damon_sysfs_sample_add_dirs() warn: missing error code 'err'
Message-ID: <202512271918.xuSlfGd4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: SeongJae Park <sj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   1d3e0ce41f6d1140a6ca73d505b536f2edc92e40
commit: 4cba4bd330b3be68e2624d824965554e1ba6a48c [39/109] mm/damon/sysfs: implement sample/filters/ directory
:::::: branch date: 16 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20251227 (https://download.01.org/0day-ci/archive/20251227/202512271918.xuSlfGd4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512271918.xuSlfGd4-lkp@intel.com/

smatch warnings:
mm/damon/sysfs.c:920 damon_sysfs_sample_add_dirs() warn: missing error code 'err'

vim +/err +920 mm/damon/sysfs.c

399d9187753ad1 SeongJae Park 2025-12-02  900  
381d987c8a405a SeongJae Park 2025-12-02  901  static int damon_sysfs_sample_add_dirs(
381d987c8a405a SeongJae Park 2025-12-02  902  		struct damon_sysfs_sample *sample)
381d987c8a405a SeongJae Park 2025-12-02  903  {
381d987c8a405a SeongJae Park 2025-12-02  904  	struct damon_sysfs_primitives *primitives;
4cba4bd330b3be SeongJae Park 2025-12-02  905  	struct damon_sysfs_sample_filters *filters;
381d987c8a405a SeongJae Park 2025-12-02  906  	int err;
381d987c8a405a SeongJae Park 2025-12-02  907  
381d987c8a405a SeongJae Park 2025-12-02  908  	primitives = damon_sysfs_primitives_alloc(true, false);
381d987c8a405a SeongJae Park 2025-12-02  909  	if (!primitives)
381d987c8a405a SeongJae Park 2025-12-02  910  		return -ENOMEM;
381d987c8a405a SeongJae Park 2025-12-02  911  	err = kobject_init_and_add(&primitives->kobj,
381d987c8a405a SeongJae Park 2025-12-02  912  			&damon_sysfs_primitives_ktype, &sample->kobj,
381d987c8a405a SeongJae Park 2025-12-02  913  			"primitives");
381d987c8a405a SeongJae Park 2025-12-02  914  	if (err)
381d987c8a405a SeongJae Park 2025-12-02  915  		goto put_primitives_out;
381d987c8a405a SeongJae Park 2025-12-02  916  	sample->primitives = primitives;
381d987c8a405a SeongJae Park 2025-12-02  917  
4cba4bd330b3be SeongJae Park 2025-12-02  918  	filters = damon_sysfs_sample_filters_alloc();
4cba4bd330b3be SeongJae Park 2025-12-02  919  	if (!filters)
4cba4bd330b3be SeongJae Park 2025-12-02 @920  		goto put_primitives_out;
4cba4bd330b3be SeongJae Park 2025-12-02  921  	err = kobject_init_and_add(&filters->kobj,
4cba4bd330b3be SeongJae Park 2025-12-02  922  			&damon_sysfs_sample_filters_ktype, &sample->kobj,
4cba4bd330b3be SeongJae Park 2025-12-02  923  			"filters");
4cba4bd330b3be SeongJae Park 2025-12-02  924  	if (err)
4cba4bd330b3be SeongJae Park 2025-12-02  925  		goto put_filters_out;
4cba4bd330b3be SeongJae Park 2025-12-02  926  	sample->filters = filters;
4cba4bd330b3be SeongJae Park 2025-12-02  927  	return 0;
4cba4bd330b3be SeongJae Park 2025-12-02  928  put_filters_out:
4cba4bd330b3be SeongJae Park 2025-12-02  929  	kobject_put(&filters->kobj);
4cba4bd330b3be SeongJae Park 2025-12-02  930  	sample->filters = NULL;
381d987c8a405a SeongJae Park 2025-12-02  931  put_primitives_out:
381d987c8a405a SeongJae Park 2025-12-02  932  	kobject_put(&primitives->kobj);
381d987c8a405a SeongJae Park 2025-12-02  933  	sample->primitives = NULL;
381d987c8a405a SeongJae Park 2025-12-02  934  	return err;
381d987c8a405a SeongJae Park 2025-12-02  935  }
381d987c8a405a SeongJae Park 2025-12-02  936  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
