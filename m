Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA1B20D4E9
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 01:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765848200; cv=none; b=QXZtaLrmCeklTqo7HoARJhgf0NUCj1OEa8pv4q3DEuFGysojcAIiJSdPYVI6+bHp6/sEs3Qcq6aEvCcAgFlVdSRVgDdB02DLhtyxOxBNE11SpFNaKozGmq3pNbRD4rO3pEmWvx4vS9G8clZ+5gDqIRf4AofHvgeoGAgyi/k6Vwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765848200; c=relaxed/simple;
	bh=JaVaPUPCtKQE4drkpxsfOH2DuiG/GR9i4Y9+SPqt2A8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qmNSNciU9o+XTRAKvjJL3KV8/vBDNUKLBalvVMVHiWmPlnXHw9mCKpRFESyF4UBEPbpqHtGn3eJEoesXi2zsB1/iduSTUr/Hrh1sD9o4UzSm2eJ/MDiIlbdz4HLdX/qA/fhSV9KBsxmbknn9K+XTMgmtA1yukdNhURhM1d2ucrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HcGygc24; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HcGygc24"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765848198; x=1797384198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JaVaPUPCtKQE4drkpxsfOH2DuiG/GR9i4Y9+SPqt2A8=;
  b=HcGygc24267IV712mpKrH/t0y/AxczET7FLApzqvZRO8g4GKaMM9mId2
   Dn/LPing5j4e5rYA8+DVk1lE2YqyovLTpTaGLAsa2ypl8aZF/Y5I+907X
   FJA+BjuJSFgme+LhedVYsdUYWoXCrIFKUSiLFfjYDFGmIoSPqIQhJsCw2
   Ka41A6KK0ywI4Th0C8t59GQ/zkr+2IIJm0yl1tAXUkPJvDUlv4xBp0dsJ
   sGbs/2xlPoj7F+jYKfQFWuVYJsVMPnpXXImOYjWiBkbmkgns6hXbFewPV
   0fBOgaL8y5JENBb82ll2EPNNkmqwFOzpaaf6mXwt4OsoAYH3KkFTM4Thq
   w==;
X-CSE-ConnectionGUID: 0EnyPG1HTKO06g0epC+vkg==
X-CSE-MsgGUID: XOGQIYZqTrSJ/kXHa71LCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="55325939"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="55325939"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 17:23:18 -0800
X-CSE-ConnectionGUID: 5Tve1oZwT5KT3ejN8Y0E3w==
X-CSE-MsgGUID: H5s8mhRFR9a+FeSrqRf3PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="197770808"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 15 Dec 2025 17:23:17 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVJmU-0000000010d-3Wph;
	Tue, 16 Dec 2025 01:23:14 +0000
Date: Tue, 16 Dec 2025 09:22:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/kernel/cacheinfo.c:800 cacheinfo_create_index_dir()
 warn: Calling kobject_put|get with state->initialized unset from line: 791
Message-ID: <202512160926.egPHZGYn-lkp@intel.com>
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
TO: Andreas Gruenbacher <agruenba@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: ae9f3bd8259a0a8f67be2420e66bb05fbb95af48 gfs2: replace sd_aspace with sd_inode
date:   8 months ago
:::::: branch date: 2 days ago
:::::: commit date: 8 months ago
config: powerpc-randconfig-r072-20251215 (https://download.01.org/0day-ci/archive/20251216/202512160926.egPHZGYn-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512160926.egPHZGYn-lkp@intel.com/

smatch warnings:
arch/powerpc/kernel/cacheinfo.c:800 cacheinfo_create_index_dir() warn: Calling kobject_put|get with state->initialized unset from line: 791

vim +800 arch/powerpc/kernel/cacheinfo.c

93197a36a9c16a Nathan Lynch     2008-12-23  784  
061d19f279f9be Paul Gortmaker   2013-06-24  785  static void cacheinfo_create_index_dir(struct cache *cache, int index,
061d19f279f9be Paul Gortmaker   2013-06-24  786  				       struct cache_dir *cache_dir)
93197a36a9c16a Nathan Lynch     2008-12-23  787  {
93197a36a9c16a Nathan Lynch     2008-12-23  788  	struct cache_index_dir *index_dir;
93197a36a9c16a Nathan Lynch     2008-12-23  789  	int rc;
93197a36a9c16a Nathan Lynch     2008-12-23  790  
93197a36a9c16a Nathan Lynch     2008-12-23  791  	index_dir = kzalloc(sizeof(*index_dir), GFP_KERNEL);
93197a36a9c16a Nathan Lynch     2008-12-23  792  	if (!index_dir)
7e8039795a80bd Tobin C. Harding 2019-04-30  793  		return;
93197a36a9c16a Nathan Lynch     2008-12-23  794  
93197a36a9c16a Nathan Lynch     2008-12-23  795  	index_dir->cache = cache;
93197a36a9c16a Nathan Lynch     2008-12-23  796  
93197a36a9c16a Nathan Lynch     2008-12-23  797  	rc = kobject_init_and_add(&index_dir->kobj, &cache_index_type,
93197a36a9c16a Nathan Lynch     2008-12-23  798  				  cache_dir->kobj, "index%d", index);
7e8039795a80bd Tobin C. Harding 2019-04-30  799  	if (rc) {
7e8039795a80bd Tobin C. Harding 2019-04-30 @800  		kobject_put(&index_dir->kobj);
7e8039795a80bd Tobin C. Harding 2019-04-30  801  		return;
7e8039795a80bd Tobin C. Harding 2019-04-30  802  	}
93197a36a9c16a Nathan Lynch     2008-12-23  803  
93197a36a9c16a Nathan Lynch     2008-12-23  804  	index_dir->next = cache_dir->index;
93197a36a9c16a Nathan Lynch     2008-12-23  805  	cache_dir->index = index_dir;
93197a36a9c16a Nathan Lynch     2008-12-23  806  
93197a36a9c16a Nathan Lynch     2008-12-23  807  	cacheinfo_create_index_opt_attrs(index_dir);
93197a36a9c16a Nathan Lynch     2008-12-23  808  }
93197a36a9c16a Nathan Lynch     2008-12-23  809  

:::::: The code at line 800 was first introduced by commit
:::::: 7e8039795a80bdf1418964b9cabef6168bc5d9a4 powerpc/cacheinfo: Fix kobject memleak

:::::: TO: Tobin C. Harding <tobin@kernel.org>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
