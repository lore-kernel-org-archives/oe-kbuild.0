Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3F2E571
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Nov 2024 00:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730420706; cv=none; b=R0fU9yZf2KW9cRVVoyxQbzRT7XgpaXIUECcYqN/yBJ/FsfCA5fcrX6oamX+FC0Pw/O+yb2OMYgLCoxKx0TzQQ9jkNQSceQaODIJwI2eJddnV1WRQZy0EbmOlnIXWkOz0Nu3KS8x/z7kfw2Hp7LNP62+cXXlxkCJGsLBQM+3KIBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730420706; c=relaxed/simple;
	bh=OD46BpSWOCjjExEDLej+UizACmtT0sqiKCrJZpYQKfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m0BK+2FvCM+vfGM5nx10qhe7EXCv9+pJRMKcEm1bvp2xlDDuf6H5kpx0AqjPBvfnlcFEKDpXhNfgsPCy9ncT4Xrnc7mlhWVuRsRxAp/mD4HSI3ALPgrKFMr/IetpSDS8lTh2gK0C4FzrJF7x2Nc9/eUlngYycgDuyNl8RPNLyuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CHQi+3lx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CHQi+3lx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730420700; x=1761956700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OD46BpSWOCjjExEDLej+UizACmtT0sqiKCrJZpYQKfc=;
  b=CHQi+3lxhcO6z/yoPjoubsXNQ2d+zYvSia7jMC8KIrLr1/6owbFfpppq
   tRQRu/vP8tGcTbSJ3PKXrZNHAkEUVIX5x3RTQhxd6jVy1jxS1Ny2+ZbBy
   LMoKsaDV1ICDAXHs/1qEn3kA7OSjOCiPu27xZbVYlnEuCFvIGyIK2hY7Q
   d+oq8NJYZpRe9seDuTIDmFXjyRSO7RNmtNK6rEYsW1S353IvDvorUpYOJ
   ds4/4dSkwXTOpjZmpd4pvD3vBuMbjcaDnMS9AEcKcl2robBqChmwmixi9
   wTMMyqveEFA4n/vkpnGvKXQPTVs3vzk79/DqKYf951V6I8x3/4FxHBfE7
   A==;
X-CSE-ConnectionGUID: o4VHzks4TQyOZJU0feTh4A==
X-CSE-MsgGUID: eWizhe5lSS6iDB7zmErtoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="33988266"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="33988266"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 17:24:53 -0700
X-CSE-ConnectionGUID: 9ELUV4vWTaOsbwLsbjtZJA==
X-CSE-MsgGUID: aKTgxiDzQfqcNvk/nkDNZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="82323069"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Oct 2024 17:24:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6fT7-000gsH-2F;
	Fri, 01 Nov 2024 00:24:49 +0000
Date: Fri, 1 Nov 2024 08:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android11-kiwi-5.4 2240/30000] drivers/md/dm.c:2371
 dm_derive_raw_secret() warn: inconsistent returns '&md->io_barrier'.
Message-ID: <202411010811.geBuwIcp-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   6a622c20579dfeb7db056fc9b624d4abb73c8081
commit: a1423568e2aecd27a202e7053945905dddcc6045 [2240/30000] ANDROID: dm: add support for passing through derive_raw_secret
:::::: branch date: 4 days ago
:::::: commit date: 4 years, 8 months ago
config: x86_64-randconfig-161-20241029 (https://download.01.org/0day-ci/archive/20241101/202411010811.geBuwIcp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411010811.geBuwIcp-lkp@intel.com/

New smatch warnings:
drivers/md/dm.c:2371 dm_derive_raw_secret() warn: inconsistent returns '&md->io_barrier'.

Old smatch warnings:
drivers/md/dm.c:1152 dm_dax_supported() warn: inconsistent returns '&md->io_barrier'.
drivers/md/dm.c:2301 dm_keyslot_evict() warn: inconsistent returns '&md->io_barrier'.

vim +2371 drivers/md/dm.c

a1423568e2aecd Barani Muthukumaran 2020-02-06  2334  
a1423568e2aecd Barani Muthukumaran 2020-02-06  2335  /*
a1423568e2aecd Barani Muthukumaran 2020-02-06  2336   * Retrieve the raw_secret from the underlying device. Given that
a1423568e2aecd Barani Muthukumaran 2020-02-06  2337   * only only one raw_secret can exist for a particular wrappedkey,
a1423568e2aecd Barani Muthukumaran 2020-02-06  2338   * retrieve it only from the first device that supports derive_raw_secret()
a1423568e2aecd Barani Muthukumaran 2020-02-06  2339   */
a1423568e2aecd Barani Muthukumaran 2020-02-06  2340  static int dm_derive_raw_secret(struct keyslot_manager *ksm,
a1423568e2aecd Barani Muthukumaran 2020-02-06  2341  				const u8 *wrapped_key,
a1423568e2aecd Barani Muthukumaran 2020-02-06  2342  				unsigned int wrapped_key_size,
a1423568e2aecd Barani Muthukumaran 2020-02-06  2343  				u8 *secret, unsigned int secret_size)
a1423568e2aecd Barani Muthukumaran 2020-02-06  2344  {
a1423568e2aecd Barani Muthukumaran 2020-02-06  2345  	struct mapped_device *md = keyslot_manager_private(ksm);
a1423568e2aecd Barani Muthukumaran 2020-02-06  2346  	struct dm_derive_raw_secret_args args = {
a1423568e2aecd Barani Muthukumaran 2020-02-06  2347  		.wrapped_key = wrapped_key,
a1423568e2aecd Barani Muthukumaran 2020-02-06  2348  		.wrapped_key_size = wrapped_key_size,
a1423568e2aecd Barani Muthukumaran 2020-02-06  2349  		.secret = secret,
a1423568e2aecd Barani Muthukumaran 2020-02-06  2350  		.secret_size = secret_size,
a1423568e2aecd Barani Muthukumaran 2020-02-06  2351  		.err = -EOPNOTSUPP,
a1423568e2aecd Barani Muthukumaran 2020-02-06  2352  	};
a1423568e2aecd Barani Muthukumaran 2020-02-06  2353  	struct dm_table *t;
a1423568e2aecd Barani Muthukumaran 2020-02-06  2354  	int srcu_idx;
a1423568e2aecd Barani Muthukumaran 2020-02-06  2355  	int i;
a1423568e2aecd Barani Muthukumaran 2020-02-06  2356  	struct dm_target *ti;
a1423568e2aecd Barani Muthukumaran 2020-02-06  2357  
a1423568e2aecd Barani Muthukumaran 2020-02-06  2358  	t = dm_get_live_table(md, &srcu_idx);
a1423568e2aecd Barani Muthukumaran 2020-02-06  2359  	if (!t)
a1423568e2aecd Barani Muthukumaran 2020-02-06  2360  		return -EOPNOTSUPP;
a1423568e2aecd Barani Muthukumaran 2020-02-06  2361  	for (i = 0; i < dm_table_get_num_targets(t); i++) {
a1423568e2aecd Barani Muthukumaran 2020-02-06  2362  		ti = dm_table_get_target(t, i);
a1423568e2aecd Barani Muthukumaran 2020-02-06  2363  		if (!ti->type->iterate_devices)
a1423568e2aecd Barani Muthukumaran 2020-02-06  2364  			continue;
a1423568e2aecd Barani Muthukumaran 2020-02-06  2365  		ti->type->iterate_devices(ti, dm_derive_raw_secret_callback,
a1423568e2aecd Barani Muthukumaran 2020-02-06  2366  					  &args);
a1423568e2aecd Barani Muthukumaran 2020-02-06  2367  		if (!args.err)
a1423568e2aecd Barani Muthukumaran 2020-02-06  2368  			break;
a1423568e2aecd Barani Muthukumaran 2020-02-06  2369  	}
a1423568e2aecd Barani Muthukumaran 2020-02-06  2370  	dm_put_live_table(md, srcu_idx);
a1423568e2aecd Barani Muthukumaran 2020-02-06 @2371  	return args.err;
a1423568e2aecd Barani Muthukumaran 2020-02-06  2372  }
a1423568e2aecd Barani Muthukumaran 2020-02-06  2373  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
