Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06491DAC4D
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Sep 2024 08:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725352495; cv=none; b=Ir0yVMYTQkRvfj/6UfWMJ8B3BY4NnLwTBdbsbr3q0/s4djTDe7L+muAEHm0KTOaXHkkAYfU8NVqGPwXED3oxC0+jOC4gfyZwY2Ae1dKyc5s4jsJrvAea94ZxSnDh4b4qGv34il3r0aPdidISs7H2+lQXmDz8Pmq2QBQr++Wy1e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725352495; c=relaxed/simple;
	bh=QL90oCnu0yzsBrIzrTiA1yC+djQFmKJcdkNGF/RwiEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NZNrqGBvQ98GiYuNMb/fZxR4Hw4sRE1XvfhSaTj76j6gzF01uXkZ/snWnY+gMKqujcHECgnHVhH1QZz3opUqjAlZf0fiU43OZZ2r46B7s/l3zSiT6HMuWpZt1qA5jb5ABegW8yfCcSAkeSsBufzHqLjyS5cdavG5KjI1CfndAhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L1B0UJde; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L1B0UJde"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725352493; x=1756888493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QL90oCnu0yzsBrIzrTiA1yC+djQFmKJcdkNGF/RwiEA=;
  b=L1B0UJdeFK5I5CUk9c9YcneOu2Nqdgn1N0yQZyJ3Bateeye5mxzgSi1V
   fQ1WRUBSZaSUytaV0hgAibEo8SAcqY6aVMUnv536qdDB6acFCB6iprdLN
   Ga59l4YgYjIAusZ6E/BTVpx0dugAb8SuuJCfGMFfFLgKUrEwQQV7nDe8C
   ytVBte4B8x4sto9THfy3BoVu4lL/qrErEHgjG/WZElSHmH0mMiA6eyDl4
   49trUdTTd/VJnMuyOGEqI4DUpVrZldcNjnXTnE4rI+sBpVFmRswyCXL6b
   8cc6GHcXJBLyCmfK+WlWt4eNaO6jnpewuzM9I+79d+qc0t0XuU4go95Qf
   g==;
X-CSE-ConnectionGUID: FDQEqORBRsa+OKmIer2Mjg==
X-CSE-MsgGUID: FohgzsMXT/6Mro6DMWssNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24092368"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="24092368"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 01:34:52 -0700
X-CSE-ConnectionGUID: 4fW7TyQTTp6eOBCSGjAS3Q==
X-CSE-MsgGUID: jDQaOIrPTz2wAyHYQAfN5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="102274621"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Sep 2024 01:34:51 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slOzw-0006Pq-2o;
	Tue, 03 Sep 2024 08:34:48 +0000
Date: Tue, 3 Sep 2024 16:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/kernel/cacheinfo.c:800 cacheinfo_create_index_dir()
 warn: Calling kobject_put|get with state->initialized unset from line: 791
Message-ID: <202409031652.xgv9EWz6-lkp@intel.com>
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
TO: Dominique Martinet <asmadeus@codewreck.org>
CC: Christian Schoenebeck <linux_oss@crudebyte.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   67784a74e258a467225f0e68335df77acd67b7ab
commit: c898afdc15645efb555acb6d85b484eb40a45409 9p: add missing locking around taking dentry fid list
date:   3 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 3 months ago
config: powerpc-randconfig-r072-20240902 (https://download.01.org/0day-ci/archive/20240903/202409031652.xgv9EWz6-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409031652.xgv9EWz6-lkp@intel.com/

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
