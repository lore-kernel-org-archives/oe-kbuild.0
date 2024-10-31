Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B271465B4
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Oct 2024 20:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730405089; cv=none; b=XJDLeQWUwLas1e+2TkBJGmxRztjsWb+Wz4U4U4NCjeFGTCf4/w7GtlFXIoCzbI4lfNf34oGyCmQcw5VfYgPZx3poe5OUtDl90SmrDX00hNWQm3Q2XKXRiB2Z11kwvi6Cl0XedBP/HvqoC+wcMuKqBKpl0hlcxePeCqhZ1Mewsw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730405089; c=relaxed/simple;
	bh=byLMfBqeTHjnmD0Z6ccN/NEBUEfA33oLLPlUiVRxkFA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s/V24+mHzrUfTZ/dZ4lmE9+EutlD120R1vcAcaEsqm2chAME0EYxEuHu6drgXquPPyI1ZmGFvmoXpchr+7J8j7t937+dmDKaZRBtlOSxMMNYMBx9G0rcvnq0Veo6egU/n4ukz5+nYR4kgVWMxndxPfsC6+aM1nvNXZerWrMwI1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OPaRzbtU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OPaRzbtU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730405087; x=1761941087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=byLMfBqeTHjnmD0Z6ccN/NEBUEfA33oLLPlUiVRxkFA=;
  b=OPaRzbtU86Dq/Xh9s5qdg/lBj320GRNb3zuCRacKwtnbippnz0yKQg0Y
   5uKuD+YB+GlrAn1gDtLRvsfJBshLX5NZIVsrfQo1xRe0tLWzYajdaA4uB
   v1wvbwbPEhM7yNfDpbBI6r9eNTYjs5ZakDD0+XY0uRf2kJiqk+htniHiR
   o+5c56LKJtKe3o9nBkvVBnU43rIXzHEKNk4xCmtSJL6WFWs0ux6nq9O91
   xQIGitl6LfBMRGgiyCN33MfIvRrCjL+9+xnQVjrAiDt79IsnHxz5Q2ovR
   GLtCbtObWnxfUKv6rdjko4nt2I92TkQ5jGF7R8QuQs+7M3ehHEF0JnIAw
   w==;
X-CSE-ConnectionGUID: hwibXxkARV+SgEsRBAuaBA==
X-CSE-MsgGUID: dzk0/5bUTdm9eWZ16a7Wuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30332431"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30332431"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 13:04:46 -0700
X-CSE-ConnectionGUID: 34ogdm8ZT6++8dkOITvGtQ==
X-CSE-MsgGUID: c3RoWIGLSPy7EikfziOYLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="113579056"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Oct 2024 13:04:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6bPN-000gfI-35;
	Thu, 31 Oct 2024 20:04:41 +0000
Date: Fri, 1 Nov 2024 04:04:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android11-kiwi-5.4 779/30000] drivers/md/dm.c:2295
 dm_keyslot_evict() warn: inconsistent returns '&md->io_barrier'.
Message-ID: <202411010347.BzF0LDj0-lkp@intel.com>
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
commit: 695cfeb08863e147e56b4895443440692cfcebff [779/30000] ANDROID: dm: add support for passing through inline crypto support
:::::: branch date: 3 days ago
:::::: commit date: 4 years, 9 months ago
config: x86_64-randconfig-161-20241029 (https://download.01.org/0day-ci/archive/20241101/202411010347.BzF0LDj0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411010347.BzF0LDj0-lkp@intel.com/

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
