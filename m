Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E831E515
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Nov 2024 13:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730553762; cv=none; b=pJVvup0SijDHAWhedwoUsSQHi/5oJTLBm6remmtSV7ZVdNQAR4Y+lytoXJi4NZjP/7Z+hSSDokwlnnoeB85DeEP5UKMvQPWia6dKkVVazhdHzpynUK/MQfnqZWe22RuFrbrGwim4Cl2GCcypNXDh97ULOMx44Q55W/vuC6YoUAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730553762; c=relaxed/simple;
	bh=Kw72MuYdtkadn0+DCdvtZsI+OqhfyDXSp9Fof6H479Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pvmrkw3nxROw4CWdOv4rkkmKCPwgkQvmiu/vCtAiJhZ4qiPuPQ5SDCCuEBQiZDQnK1vJq1oqAIVnhOKtm9Qo0wmgWepufm2rdpyjbZpfdtBeOQzituLLgC+e6yCvGLn/7k8R2mj6z5XjP7YUWeg4lwhOsWrCSazAFIUxtjYTyQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jlGK2GnO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jlGK2GnO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730553760; x=1762089760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kw72MuYdtkadn0+DCdvtZsI+OqhfyDXSp9Fof6H479Y=;
  b=jlGK2GnOu6vqav1ajpvEmigiu+7shiMCDscLhyCaTBZA+yclNl9fX6zF
   H3RuBQXrjV0ndvlymtCXL/cUk0JfqY/W1xKeArtT2g4exlCTZCdrB/bmN
   /E+gY7zMuD7Yssj9SQWAwmCPJbEDYjaujSbw3DB5P4qYau2sozwp3+pXG
   dFdwz4gB2orGxP25Pq4Dgw5ESvF7M54mpJPRvAmf+VhRz7zWcej+Qa4Ds
   udEf3Esap58mM6DlJvWFQVRxW6ECW3XJ4AKDepDXliMxLTZWuD0mrSUGY
   Dqnme+o3TTaAlArMlhONEt/ZrtIA6Lh8+1xK+fNuZWSLcyjZccI+yAewc
   A==;
X-CSE-ConnectionGUID: mZYAmm2tQia3Zhko/MqkUQ==
X-CSE-MsgGUID: o3bkHug+QdeA6WKtDzoYjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="29727655"
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="29727655"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 06:22:39 -0700
X-CSE-ConnectionGUID: yWYIdyBESiCmDI885obyDw==
X-CSE-MsgGUID: o/ofquMuTQa/ZK7/zH7N7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="114031335"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Nov 2024 06:22:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7E5L-000j13-3C;
	Sat, 02 Nov 2024 13:22:35 +0000
Date: Sat, 2 Nov 2024 21:22:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android11-kiwi-5.4 387/387] drivers/md/dm.c:2371
 dm_derive_raw_secret() warn: inconsistent returns '&md->io_barrier'.
Message-ID: <202411022119.ekQQcrka-lkp@intel.com>
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
commit: a1423568e2aecd27a202e7053945905dddcc6045 [387/387] ANDROID: dm: add support for passing through derive_raw_secret
:::::: branch date: 5 days ago
:::::: commit date: 4 years, 8 months ago
config: x86_64-randconfig-161-20241029 (https://download.01.org/0day-ci/archive/20241102/202411022119.ekQQcrka-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411022119.ekQQcrka-lkp@intel.com/

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
