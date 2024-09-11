Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E6A1AAE01
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Sep 2024 13:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726061999; cv=none; b=N78bDzXJYLmkTx8KBbPDY6m7ooGtD8/uFRfkIiet3ZOGd4zslhAyD1/a77a2x8Xb7rbIZb4NMRYNJyAIn7LXdTBM9d2HC//VrMBa8Zk6NNyy0z7XElF6t6+2nqQqeP21NsyR7NV14itXfX047vGK0yuDlUsmXlQWCGrOvXW5Fpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726061999; c=relaxed/simple;
	bh=Rv/qDWmvjFNAJTsNrdgF+toLA9m2FxX0Y3AT364bVgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eCZCFwAitgz4584tzJYr/pW4ocPiPuVDxz6RFZL7rgx2cXCucHH1r6zk5THasQ4TNDj0CuHoJ+c0L+z9Fii4DFk/aofgMW1M+swy3eYR2wXdJlE/CtY+4w5OfYI+8IqVaXwghT5BbrqsCtDQOIEyFDfllC5EOX7yfR2dCa20Gn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iyx5FphR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iyx5FphR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726061997; x=1757597997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rv/qDWmvjFNAJTsNrdgF+toLA9m2FxX0Y3AT364bVgg=;
  b=iyx5FphRq/gxXPTlAF823MBBkT0JM2Ye7yLeDRYNOZCNcB1cqDhFlS9o
   UtNji0JQeUD4ONDL9z0eAAmA6+Al2dDDrmCzZXCxaebJpgEfKA7cgHeOB
   CM6PXusp6LdHxNVFbbo4GNaQsiEH8PggoWIsU1QnWa+iYR/bpjlb0dn4m
   punP+aNfzu64FiV18RXvG5iqUUhBGNxh/fjiZw84OTqqF0f4nY0uYkg5R
   cdeY0ReJIjUX0ujPFjD7Mw1TGbAJ8K9rVEv2wuEBxZA4Lih1XwB1TKhgO
   PG1p0qLnoG7/o+gYCEOd9iY41xYQbbrExPR4ejbqoXqkZA5BxkVEs5Zun
   w==;
X-CSE-ConnectionGUID: SeVQXniFSQmAP9Fyr5kL9w==
X-CSE-MsgGUID: oBN3wcCpQhm/A0AHjTpLig==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24735019"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="24735019"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 06:39:57 -0700
X-CSE-ConnectionGUID: wKvIan60Tq2hWHv8rv13LA==
X-CSE-MsgGUID: bE7bZv1oSZ2ENlIc/zhWlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67216207"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Sep 2024 06:39:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soNZZ-0003dU-0b;
	Wed, 11 Sep 2024 13:39:53 +0000
Date: Wed, 11 Sep 2024 21:39:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/btrfs/compression.c:195:12-13: WARNING opportunity for max()
Message-ID: <202409112129.MXX1M41B-lkp@intel.com>
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
TO: David Sterba <dsterba@suse.com>
CC: Josef Bacik <josef@toxicpanda.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8d8d276ba2fb5f9ac4984f5c10ae60858090babc
commit: 4cea422a776558ccf84e918205d0c162a516502c btrfs: use shrinker for compression page pool
date:   9 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 9 months ago
config: m68k-randconfig-r064-20240911 (https://download.01.org/0day-ci/archive/20240911/202409112129.MXX1M41B-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409112129.MXX1M41B-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/compression.c:195:12-13: WARNING opportunity for max()

vim +195 fs/btrfs/compression.c

4cea422a776558 David Sterba 2023-11-15  183  
4cea422a776558 David Sterba 2023-11-15  184  static unsigned long btrfs_compr_pool_count(struct shrinker *sh, struct shrink_control *sc)
4cea422a776558 David Sterba 2023-11-15  185  {
4cea422a776558 David Sterba 2023-11-15  186  	int ret;
4cea422a776558 David Sterba 2023-11-15  187  
4cea422a776558 David Sterba 2023-11-15  188  	/*
4cea422a776558 David Sterba 2023-11-15  189  	 * We must not read the values more than once if 'ret' gets expanded in
4cea422a776558 David Sterba 2023-11-15  190  	 * the return statement so we don't accidentally return a negative
4cea422a776558 David Sterba 2023-11-15  191  	 * number, even if the first condition finds it positive.
4cea422a776558 David Sterba 2023-11-15  192  	 */
4cea422a776558 David Sterba 2023-11-15  193  	ret = READ_ONCE(compr_pool.count) - READ_ONCE(compr_pool.thresh);
4cea422a776558 David Sterba 2023-11-15  194  
4cea422a776558 David Sterba 2023-11-15 @195  	return ret > 0 ? ret : 0;
4cea422a776558 David Sterba 2023-11-15  196  }
4cea422a776558 David Sterba 2023-11-15  197  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
