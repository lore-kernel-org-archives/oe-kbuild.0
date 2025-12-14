Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691CD17A300
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 07:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765696558; cv=none; b=tu/viDD/rSHtSlRx7qLGKkEIy5d01Jo3pX3xk5q8qek6s2UwxDpFhSF9CvJG4jWusMcFXpC+zgBD3KjcscTJSlSA+wzOJbDLnrT9PtkjJ3uZEpSV9EEEUQJVnxCJMTlznOMEe0YSTwJcyMEKHmcr/sJHtTWdkaSyvySlG/4qsMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765696558; c=relaxed/simple;
	bh=CrYfja7F2kD4AwvPJGbMO1VwJbbYko6IjAdvrKwqIMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nYAduvzCnKC3B4GPqd7TVzqMYhoa3DdkjTwBjWJbRqkUeOwKTNsKSytaSNB9zk42wBR1QtRd8BZ0ovIExJslHh6KseOllM+50GDi3tdUcmUdX0nr5QRYvBAQNKJK3lwaIPAM5gD4sfXKcTb5lzzYOV7n8hFSSs3vZIEotAIXESU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b7ZeC2x1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b7ZeC2x1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765696557; x=1797232557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CrYfja7F2kD4AwvPJGbMO1VwJbbYko6IjAdvrKwqIMo=;
  b=b7ZeC2x1ZoG6y5A4/RZBNJG65G1eZCJOoz4A1sTUGoJFKSKxKEm4jaTc
   q9ivYRvdo7dppYeZjy6kopevkC/lVlXaFWnSrdUOw+YGeXPC1Q9sHsAv7
   VMoZlsbOw2958UJP5mwX20fYA/3xxUOVMRZd8aZ/A8gvunIu34RsGNqLG
   iDHq7IRl4Z8FPbF+2+r2LU3UpCk/vJu/E7Hhtmvk0cS9HmMT+4ffnUssc
   VKpI/IwDRKu7SDok8OTR48nQT00/jyVpmxe2kFBkDpE1ONZZ1FVMCbQ3p
   fszPwfW2tUMkrI/6clZZaMBKwA41FZOarPRNQbhuuH28pd680Lb+NXqwh
   Q==;
X-CSE-ConnectionGUID: /xagVoEiRQCPdaTT/LVIZA==
X-CSE-MsgGUID: auD4gAlySICAt7cGqIaS7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="79091506"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="79091506"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 23:15:57 -0800
X-CSE-ConnectionGUID: lQtGnCM9Q0i/vQweQiN02Q==
X-CSE-MsgGUID: 6PFhI3z2QZKbbbZ3aH0b0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197077889"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Dec 2025 23:15:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUgKe-000000008oL-2cv1;
	Sun, 14 Dec 2025 07:15:52 +0000
Date: Sun, 14 Dec 2025 15:14:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sj:damon/next 44/115] mm/damon/sysfs.c:920
 damon_sysfs_sample_add_dirs() warn: missing unwind goto?
Message-ID: <202512141528.AD9GSzHJ-lkp@intel.com>
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
TO: SeongJae Park <sj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   4daf22e4c21ef13ee2779580295eb0073dc3163b
commit: f4df9946a1d00c8aa6326f28807efec79af1c2ea [44/115] mm/damon/sysfs: implement sample/filters/ directory
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: i386-randconfig-141-20251214 (https://download.01.org/0day-ci/archive/20251214/202512141528.AD9GSzHJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512141528.AD9GSzHJ-lkp@intel.com/

smatch warnings:
mm/damon/sysfs.c:920 damon_sysfs_sample_add_dirs() warn: missing unwind goto?

vim +920 mm/damon/sysfs.c

48cc6a03ab2352 SeongJae Park 2025-12-02  900  
4242d70b872082 SeongJae Park 2025-12-02  901  static int damon_sysfs_sample_add_dirs(
4242d70b872082 SeongJae Park 2025-12-02  902  		struct damon_sysfs_sample *sample)
4242d70b872082 SeongJae Park 2025-12-02  903  {
4242d70b872082 SeongJae Park 2025-12-02  904  	struct damon_sysfs_primitives *primitives;
f4df9946a1d00c SeongJae Park 2025-12-02  905  	struct damon_sysfs_sample_filters *filters;
4242d70b872082 SeongJae Park 2025-12-02  906  	int err;
4242d70b872082 SeongJae Park 2025-12-02  907  
4242d70b872082 SeongJae Park 2025-12-02  908  	primitives = damon_sysfs_primitives_alloc(true, false);
4242d70b872082 SeongJae Park 2025-12-02  909  	if (!primitives)
4242d70b872082 SeongJae Park 2025-12-02  910  		return -ENOMEM;
4242d70b872082 SeongJae Park 2025-12-02  911  	err = kobject_init_and_add(&primitives->kobj,
4242d70b872082 SeongJae Park 2025-12-02  912  			&damon_sysfs_primitives_ktype, &sample->kobj,
4242d70b872082 SeongJae Park 2025-12-02  913  			"primitives");
4242d70b872082 SeongJae Park 2025-12-02  914  	if (err)
4242d70b872082 SeongJae Park 2025-12-02  915  		goto put_primitives_out;
4242d70b872082 SeongJae Park 2025-12-02  916  	sample->primitives = primitives;
4242d70b872082 SeongJae Park 2025-12-02  917  
f4df9946a1d00c SeongJae Park 2025-12-02  918  	filters = damon_sysfs_sample_filters_alloc();
f4df9946a1d00c SeongJae Park 2025-12-02  919  	if (!filters)
f4df9946a1d00c SeongJae Park 2025-12-02 @920  		return -ENOMEM;
f4df9946a1d00c SeongJae Park 2025-12-02  921  	err = kobject_init_and_add(&filters->kobj,
f4df9946a1d00c SeongJae Park 2025-12-02  922  			&damon_sysfs_sample_filters_ktype, &sample->kobj,
f4df9946a1d00c SeongJae Park 2025-12-02  923  			"filters");
f4df9946a1d00c SeongJae Park 2025-12-02  924  	if (err)
f4df9946a1d00c SeongJae Park 2025-12-02  925  		goto put_filters_out;
f4df9946a1d00c SeongJae Park 2025-12-02  926  	sample->filters = filters;
f4df9946a1d00c SeongJae Park 2025-12-02  927  	return 0;
f4df9946a1d00c SeongJae Park 2025-12-02  928  put_filters_out:
f4df9946a1d00c SeongJae Park 2025-12-02  929  	kobject_put(&filters->kobj);
f4df9946a1d00c SeongJae Park 2025-12-02  930  	sample->filters = NULL;
4242d70b872082 SeongJae Park 2025-12-02  931  put_primitives_out:
4242d70b872082 SeongJae Park 2025-12-02  932  	kobject_put(&primitives->kobj);
4242d70b872082 SeongJae Park 2025-12-02  933  	sample->primitives = NULL;
4242d70b872082 SeongJae Park 2025-12-02  934  	return err;
4242d70b872082 SeongJae Park 2025-12-02  935  }
4242d70b872082 SeongJae Park 2025-12-02  936  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
