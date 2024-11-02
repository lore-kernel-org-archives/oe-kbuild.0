Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55C02E40E
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Nov 2024 10:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730543854; cv=none; b=PMLrDsLI5/kI5HkJWs//2X3MQF3ptveG/OavkZyiX7Ugh2zM/PQ2WTDX8yWKi7oTvwOKSBKueS6OMQx1a22snkDl0BD7Z2dOmBIxWyQSHJRAo9Z2Lkt3kLIWWi90QeEtytqWYinLHqZvS1JVXjRu34m2ia2LPn8tw+fECuzdw80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730543854; c=relaxed/simple;
	bh=49vfdiVTKD9atFDoreiHR0zUG9R8z3WuQqIvxZnnr3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hbW6yRxYDNd9+AfhukgC2i+zSw2pAbFppmmiP0ZqZIAh7FZeZkthIOHXpcfvg2dnnU5U/5dIA65DH+SY8hkRiLYMsMhFWmpu0xvuwegDv5PBfT0e1AH0IJOh6jx3/VJf27W4cRam1Fm/TzOj7S8jaElVjvjw27dFttkg3R++qL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSTXbe4O; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSTXbe4O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730543853; x=1762079853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=49vfdiVTKD9atFDoreiHR0zUG9R8z3WuQqIvxZnnr3w=;
  b=mSTXbe4Orf6vFYiOuZe84FRbtu5Mc5Y7QzyzliZdHt6XyZinziMr2VIy
   KG8cqBK00o4Bk7Z3dC2s23OaiJVfudF1vXO+ut+3lMPJD7jVCKpdwQ9h9
   nVRasZbdkx6R6m1DR+yc+LfJaCShjdNpvjUkyV4/3xE/0+LVQ8kHkHoTT
   APblx3gcc2rJjCkWFL20ypMxnaC5VCCH5a0y+kcxkgEJV+qPKC8BVjLhs
   ouut9iDGSwD/tnXTnY6TzyEBqzA3VmSMZadp8hoK9mI9374MJwB4yv9jh
   Foy/Vlra1nN/KBXIoa8I5Kc5oPsnI5C0Udm9TS6jqHSaWA554oun60WPt
   g==;
X-CSE-ConnectionGUID: Q+/ZqZh5SDi/iYDXDBmYOg==
X-CSE-MsgGUID: wNEiLUwcRwSh749l+WxREw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30480448"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30480448"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 03:37:32 -0700
X-CSE-ConnectionGUID: XXBBGcWoSiy+izrhcQjhAA==
X-CSE-MsgGUID: 5Q6dw/HVQ6ucBjh50nqMjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="87128858"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Nov 2024 03:37:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7BVY-000imX-2W;
	Sat, 02 Nov 2024 10:37:28 +0000
Date: Sat, 2 Nov 2024 18:36:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android11-kiwi-5.4 387/387] drivers/md/dm.c:2295
 dm_keyslot_evict() warn: inconsistent returns '&md->io_barrier'.
Message-ID: <202411021852.RqJCJb2W-lkp@intel.com>
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
commit: 695cfeb08863e147e56b4895443440692cfcebff [387/387] ANDROID: dm: add support for passing through inline crypto support
:::::: branch date: 5 days ago
:::::: commit date: 4 years, 9 months ago
config: x86_64-randconfig-161-20241029 (https://download.01.org/0day-ci/archive/20241102/202411021852.RqJCJb2W-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411021852.RqJCJb2W-lkp@intel.com/

New smatch warnings:
drivers/md/dm.c:2295 dm_keyslot_evict() warn: inconsistent returns '&md->io_barrier'.

Old smatch warnings:
drivers/md/dm.c:1152 dm_dax_supported() warn: inconsistent returns '&md->io_barrier'.

vim +2295 drivers/md/dm.c

695cfeb08863e1 Eric Biggers 2020-01-21  2270  
695cfeb08863e1 Eric Biggers 2020-01-21  2271  /*
695cfeb08863e1 Eric Biggers 2020-01-21  2272   * When an inline encryption key is evicted from a device-mapper device, evict
695cfeb08863e1 Eric Biggers 2020-01-21  2273   * it from all the underlying devices.
695cfeb08863e1 Eric Biggers 2020-01-21  2274   */
695cfeb08863e1 Eric Biggers 2020-01-21  2275  static int dm_keyslot_evict(struct keyslot_manager *ksm,
695cfeb08863e1 Eric Biggers 2020-01-21  2276  			    const struct blk_crypto_key *key, unsigned int slot)
695cfeb08863e1 Eric Biggers 2020-01-21  2277  {
695cfeb08863e1 Eric Biggers 2020-01-21  2278  	struct mapped_device *md = keyslot_manager_private(ksm);
695cfeb08863e1 Eric Biggers 2020-01-21  2279  	struct dm_keyslot_evict_args args = { key };
695cfeb08863e1 Eric Biggers 2020-01-21  2280  	struct dm_table *t;
695cfeb08863e1 Eric Biggers 2020-01-21  2281  	int srcu_idx;
695cfeb08863e1 Eric Biggers 2020-01-21  2282  	int i;
695cfeb08863e1 Eric Biggers 2020-01-21  2283  	struct dm_target *ti;
695cfeb08863e1 Eric Biggers 2020-01-21  2284  
695cfeb08863e1 Eric Biggers 2020-01-21  2285  	t = dm_get_live_table(md, &srcu_idx);
695cfeb08863e1 Eric Biggers 2020-01-21  2286  	if (!t)
695cfeb08863e1 Eric Biggers 2020-01-21  2287  		return 0;
695cfeb08863e1 Eric Biggers 2020-01-21  2288  	for (i = 0; i < dm_table_get_num_targets(t); i++) {
695cfeb08863e1 Eric Biggers 2020-01-21  2289  		ti = dm_table_get_target(t, i);
695cfeb08863e1 Eric Biggers 2020-01-21  2290  		if (!ti->type->iterate_devices)
695cfeb08863e1 Eric Biggers 2020-01-21  2291  			continue;
695cfeb08863e1 Eric Biggers 2020-01-21  2292  		ti->type->iterate_devices(ti, dm_keyslot_evict_callback, &args);
695cfeb08863e1 Eric Biggers 2020-01-21  2293  	}
695cfeb08863e1 Eric Biggers 2020-01-21  2294  	dm_put_live_table(md, srcu_idx);
695cfeb08863e1 Eric Biggers 2020-01-21 @2295  	return args.err;
695cfeb08863e1 Eric Biggers 2020-01-21  2296  }
695cfeb08863e1 Eric Biggers 2020-01-21  2297  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
