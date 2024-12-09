Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5441156C74
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717353; cv=none; b=gMRMOe8vcjfpRnd1H3DiGAVzSbORwek+MHmBlTkgKlS4ofXznHbvWEjmiRxwBJLpCOql7dyuDfl5Ujf8QpuWki9YwokAoxymn+l1UMXfuHTleQDpw1IcpAgKsnklQ1E5jSWesLee/5HyBchXyWy6fJ0ReprKFPfGxH9jl6l15E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717353; c=relaxed/simple;
	bh=PQyZSS8kioltj3hYo83v2u0foWyqXijeTcXSLU4Ech0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cSr2P7czV4UkKTVo6mMK9eMAZRxqD4MV7A0zjVUKEPyQ7OqTeIZNCPFQLMETDv4wz50x1lDLvwyn1lHTDXl0X7ZrGXaVYUzqz9HzOjwEybf0A4lXBvnWOWWZ6IJRjw/JiUXjfBvAo6kVXZoBw3OUEdMnoK6i1epBAbWF5Brww7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GG+NwUvg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GG+NwUvg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717352; x=1765253352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PQyZSS8kioltj3hYo83v2u0foWyqXijeTcXSLU4Ech0=;
  b=GG+NwUvgI4KdVDs8gUiRIcr8pTHGcZ8IRPk+xskoaH2SSrvsJUw8ykwW
   5Y0CsfxbEGnmW931xz893lxpojgAP083VQx/Ff6j/Xy10gRPqsRrtk+0x
   CQyATcYtvtBfcd732rNl6g08K7Q8f7OvSGsygEwZa3iLJrLbMb5kYRLIW
   ARTdsUQLvjtD9SYEzdmmrhfulmSKcr8fkBVVFnS+zzlhUcZWZGFEeW3+I
   /hCSCXepfvuQ152v6lVw99ZlvGvTPOSjw0esMHy9PieDiQ0Zz2mA6RJ1X
   JN1hv/DEM/7ik1Of+CKwXJpz5OZrulxQBBx12opnyYRrYoOrrqmfw4QwY
   w==;
X-CSE-ConnectionGUID: JFOH2G58RxawGlko6ZDD5g==
X-CSE-MsgGUID: FslJBSg6QLuoXSq6mTFglQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="36841939"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="36841939"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:09:08 -0800
X-CSE-ConnectionGUID: LqxUXmn7S/aY6QjtfwlTfw==
X-CSE-MsgGUID: /i4mrjnLRWumtGLscwHQUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95044968"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Dec 2024 20:09:06 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV4x-0003nT-2P;
	Mon, 09 Dec 2024 04:09:03 +0000
Date: Mon, 9 Dec 2024 12:08:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c:173
 mlx5_fc_stats_query_all_counters() error: uninitialized symbol
 'bulk_query_time'.
Message-ID: <202412071312.oNFnyT9f-lkp@intel.com>
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
TO: Cosmin Ratiu <cratiu@nvidia.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Tariq Toukan <tariqt@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5f217084ab3ddd4bdd03cd437f8e3b7e2d1f5b6
commit: 918af0219a4d6a89cf02839005ede24e91f13bf6 net/mlx5: hw counters: Replace IDR+lists with xarray
date:   9 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 9 weeks ago
config: openrisc-randconfig-r072-20241206 (https://download.01.org/0day-ci/archive/20241207/202412071312.oNFnyT9f-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412071312.oNFnyT9f-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c:173 mlx5_fc_stats_query_all_counters() error: uninitialized symbol 'bulk_query_time'.
drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c:174 mlx5_fc_stats_query_all_counters() error: uninitialized symbol 'bulk_base_id'.

vim +/bulk_query_time +173 drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c

6f06e04b67baa1c Gavi Teitz   2019-07-29  119  
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  120  /* Synchronization notes
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  121   *
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  122   * Access to counter array:
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  123   * - create - mlx5_fc_create() (user context)
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  124   *   - inserts the counter into the xarray.
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  125   *
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  126   * - destroy - mlx5_fc_destroy() (user context)
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  127   *   - erases the counter from the xarray and releases it.
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  128   *
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  129   * - query mlx5_fc_query(), mlx5_fc_query_cached{,_raw}() (user context)
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  130   *   - user should not access a counter after destroy.
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  131   *
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  132   * - bulk query (single thread workqueue context)
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  133   *   - create: query relies on 'lastuse' to avoid updating counters added
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  134   *             around the same time as the current bulk cmd.
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  135   *   - destroy: destroyed counters will not be accessed, even if they are
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  136   *              destroyed during a bulk query command.
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  137   */
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  138  static void mlx5_fc_stats_query_all_counters(struct mlx5_core_dev *dev)
a351a1b03bf169f Amir Vadai   2016-07-14  139  {
5acd957a986c167 Cosmin Ratiu 2024-10-01  140  	struct mlx5_fc_stats *fc_stats = dev->priv.fc_stats;
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  141  	u32 bulk_len = fc_stats->bulk_query_len;
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  142  	XA_STATE(xas, &fc_stats->counters, 0);
6f06e04b67baa1c Gavi Teitz   2019-07-29  143  	u32 *data = fc_stats->bulk_query_out;
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  144  	struct mlx5_fc *counter;
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  145  	u32 last_bulk_id = 0;
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  146  	u64 bulk_query_time;
6f06e04b67baa1c Gavi Teitz   2019-07-29  147  	u32 bulk_base_id;
a351a1b03bf169f Amir Vadai   2016-07-14  148  	int err;
a8ffcc741acb3c7 Rabie Loulou 2017-07-09  149  
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  150  	xas_lock(&xas);
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  151  	xas_for_each(&xas, counter, U32_MAX) {
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  152  		if (xas_retry(&xas, counter))
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  153  			continue;
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  154  		if (unlikely(counter->id >= last_bulk_id)) {
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  155  			/* Start new bulk query. */
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  156  			/* First id must be aligned to 4 when using bulk query. */
6f06e04b67baa1c Gavi Teitz   2019-07-29  157  			bulk_base_id = counter->id & ~0x3;
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  158  			last_bulk_id = bulk_base_id + bulk_len;
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  159  			/* The lock is released while querying the hw and reacquired after. */
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  160  			xas_unlock(&xas);
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  161  			/* The same id needs to be processed again in the next loop iteration. */
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  162  			xas_reset(&xas);
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  163  			bulk_query_time = jiffies;
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  164  			err = mlx5_cmd_fc_bulk_query(dev, bulk_base_id, bulk_len, data);
a351a1b03bf169f Amir Vadai   2016-07-14  165  			if (err) {
a351a1b03bf169f Amir Vadai   2016-07-14  166  				mlx5_core_err(dev, "Error doing bulk query: %d\n", err);
6f06e04b67baa1c Gavi Teitz   2019-07-29  167  				return;
a351a1b03bf169f Amir Vadai   2016-07-14  168  			}
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  169  			xas_lock(&xas);
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  170  			continue;
6f06e04b67baa1c Gavi Teitz   2019-07-29  171  		}
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  172  		/* Do not update counters added after bulk query was started. */
918af0219a4d6a8 Cosmin Ratiu 2024-10-01 @173  		if (time_after64(bulk_query_time, counter->cache.lastuse))
918af0219a4d6a8 Cosmin Ratiu 2024-10-01 @174  			update_counter_cache(counter->id - bulk_base_id, data,
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  175  					     &counter->cache);
a351a1b03bf169f Amir Vadai   2016-07-14  176  	}
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  177  	xas_unlock(&xas);
a351a1b03bf169f Amir Vadai   2016-07-14  178  }
a351a1b03bf169f Amir Vadai   2016-07-14  179  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
