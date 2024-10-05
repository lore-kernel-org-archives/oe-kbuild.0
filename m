Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F09322B
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Oct 2024 08:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728116288; cv=none; b=D/s+xAsSCtvVg1HrSf0SzgDJ6kP+z47kgyLT2UI+Zxv3nuovu+Ybe3KlLl7J0geh46y2gxLh0VTBsKsJUSNK2X9DDcRDU5L0klRKg8daUa5k653qXifzcsFGmtJfTGlHtjuii0GCxGLc5SuK8gjYVv6S+edi/t0r6+0SgC5f6bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728116288; c=relaxed/simple;
	bh=oy3WYDMjE8SHXqzn8BG0O7BxS3MxuuKbm/Y63LRRJrI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C+GhAk3DncyeUW+gkK26iUCQHI68ZSRPOCwroioLTZ97Yb3JUxU0c+fUhH4w447kF6OhOancg2ybXeJBnHls6JAzNgO9J1VsjCD4c7/ZUHe6nj+yvfONCBjpdtQLmXyDljsOvPafisE/2t+x0U6icRUD9UJvUb93kkFhtP96cKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mWMhoDyX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mWMhoDyX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728116286; x=1759652286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oy3WYDMjE8SHXqzn8BG0O7BxS3MxuuKbm/Y63LRRJrI=;
  b=mWMhoDyXB9z+hXtkvzlp7DOewBvOqEZBRcD77GVxNhzCD7RrFYqiyqwK
   bC69XYsnu0dhWQejtbGhhVK+zKK4UoZ5vvU20cIt8GSYX/Hpo0W1EIHhD
   UViC0uS3/sPw+fsmyN8tllhXaEUDZ5XxOh5B5vZPlHirKf9tkbIIRT1W0
   7SKBL3CyKHH68elwmGLMMvGXqIP12Zo31XvlnPLhI3E9LmT9+GxIt+CMJ
   wxahe24cgmRRCHxSOty0E/IbrMjrRb7VibdtEtrnai1kCOthG2luJQBQo
   5/dXMpTN5MC6cZpv4f92lIcRazkrvGN1QVpJTGFkA1NePnXHEwOC3bCgQ
   w==;
X-CSE-ConnectionGUID: JrIIr48NR/+wE+VPTVoV8g==
X-CSE-MsgGUID: LT9xF53JRoOwx8Y1VaBS1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27468902"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="27468902"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 01:18:03 -0700
X-CSE-ConnectionGUID: HsPlzF+BQOe9RTcSe66tBA==
X-CSE-MsgGUID: VmFCV/DwS6SQ2rMkJwDOYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="74516908"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Oct 2024 01:18:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swzzE-0002lQ-1U;
	Sat, 05 Oct 2024 08:18:00 +0000
Date: Sat, 5 Oct 2024 16:17:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next V2 3/6] net/mlx5: hw counters: Replace IDR+lists
 with xarray
Message-ID: <202410051611.V2fRGx99-lkp@intel.com>
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
In-Reply-To: <20241001103709.58127-4-tariqt@nvidia.com>
References: <20241001103709.58127-4-tariqt@nvidia.com>
TO: Tariq Toukan <tariqt@nvidia.com>

Hi Tariq,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Tariq-Toukan/net-mlx5-hw-counters-Make-fc_stats-fc_pool-private/20241001-184125
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241001103709.58127-4-tariqt%40nvidia.com
patch subject: [PATCH net-next V2 3/6] net/mlx5: hw counters: Replace IDR+lists with xarray
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: loongarch-randconfig-r071-20241003 (https://download.01.org/0day-ci/archive/20241005/202410051611.V2fRGx99-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410051611.V2fRGx99-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c:173 mlx5_fc_stats_query_all_counters() error: uninitialized symbol 'bulk_query_time'.
drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c:174 mlx5_fc_stats_query_all_counters() error: uninitialized symbol 'bulk_base_id'.

vim +/bulk_query_time +173 drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c

6f06e04b67baa1 Gavi Teitz   2019-07-29  119  
a76cdab93204e4 Cosmin Ratiu 2024-10-01  120  /* Synchronization notes
a76cdab93204e4 Cosmin Ratiu 2024-10-01  121   *
a76cdab93204e4 Cosmin Ratiu 2024-10-01  122   * Access to counter array:
a76cdab93204e4 Cosmin Ratiu 2024-10-01  123   * - create - mlx5_fc_create() (user context)
a76cdab93204e4 Cosmin Ratiu 2024-10-01  124   *   - inserts the counter into the xarray.
a76cdab93204e4 Cosmin Ratiu 2024-10-01  125   *
a76cdab93204e4 Cosmin Ratiu 2024-10-01  126   * - destroy - mlx5_fc_destroy() (user context)
a76cdab93204e4 Cosmin Ratiu 2024-10-01  127   *   - erases the counter from the xarray and releases it.
a76cdab93204e4 Cosmin Ratiu 2024-10-01  128   *
a76cdab93204e4 Cosmin Ratiu 2024-10-01  129   * - query mlx5_fc_query(), mlx5_fc_query_cached{,_raw}() (user context)
a76cdab93204e4 Cosmin Ratiu 2024-10-01  130   *   - user should not access a counter after destroy.
a76cdab93204e4 Cosmin Ratiu 2024-10-01  131   *
a76cdab93204e4 Cosmin Ratiu 2024-10-01  132   * - bulk query (single thread workqueue context)
a76cdab93204e4 Cosmin Ratiu 2024-10-01  133   *   - create: query relies on 'lastuse' to avoid updating counters added
a76cdab93204e4 Cosmin Ratiu 2024-10-01  134   *             around the same time as the current bulk cmd.
a76cdab93204e4 Cosmin Ratiu 2024-10-01  135   *   - destroy: destroyed counters will not be accessed, even if they are
a76cdab93204e4 Cosmin Ratiu 2024-10-01  136   *              destroyed during a bulk query command.
a76cdab93204e4 Cosmin Ratiu 2024-10-01  137   */
a76cdab93204e4 Cosmin Ratiu 2024-10-01  138  static void mlx5_fc_stats_query_all_counters(struct mlx5_core_dev *dev)
a351a1b03bf169 Amir Vadai   2016-07-14  139  {
80cdc8314c3af3 Cosmin Ratiu 2024-10-01  140  	struct mlx5_fc_stats *fc_stats = dev->priv.fc_stats;
a76cdab93204e4 Cosmin Ratiu 2024-10-01  141  	u32 bulk_len = fc_stats->bulk_query_len;
a76cdab93204e4 Cosmin Ratiu 2024-10-01  142  	XA_STATE(xas, &fc_stats->counters, 0);
6f06e04b67baa1 Gavi Teitz   2019-07-29  143  	u32 *data = fc_stats->bulk_query_out;
a76cdab93204e4 Cosmin Ratiu 2024-10-01  144  	struct mlx5_fc *counter;
a76cdab93204e4 Cosmin Ratiu 2024-10-01  145  	u32 last_bulk_id = 0;
a76cdab93204e4 Cosmin Ratiu 2024-10-01  146  	u64 bulk_query_time;
6f06e04b67baa1 Gavi Teitz   2019-07-29  147  	u32 bulk_base_id;
a351a1b03bf169 Amir Vadai   2016-07-14  148  	int err;
a8ffcc741acb3c Rabie Loulou 2017-07-09  149  
a76cdab93204e4 Cosmin Ratiu 2024-10-01  150  	xas_lock(&xas);
a76cdab93204e4 Cosmin Ratiu 2024-10-01  151  	xas_for_each(&xas, counter, U32_MAX) {
a76cdab93204e4 Cosmin Ratiu 2024-10-01  152  		if (xas_retry(&xas, counter))
a76cdab93204e4 Cosmin Ratiu 2024-10-01  153  			continue;
a76cdab93204e4 Cosmin Ratiu 2024-10-01  154  		if (unlikely(counter->id >= last_bulk_id)) {
a76cdab93204e4 Cosmin Ratiu 2024-10-01  155  			/* Start new bulk query. */
a76cdab93204e4 Cosmin Ratiu 2024-10-01  156  			/* First id must be aligned to 4 when using bulk query. */
6f06e04b67baa1 Gavi Teitz   2019-07-29  157  			bulk_base_id = counter->id & ~0x3;
a76cdab93204e4 Cosmin Ratiu 2024-10-01  158  			last_bulk_id = bulk_base_id + bulk_len;
a76cdab93204e4 Cosmin Ratiu 2024-10-01  159  			/* The lock is released while querying the hw and reacquired after. */
a76cdab93204e4 Cosmin Ratiu 2024-10-01  160  			xas_unlock(&xas);
a76cdab93204e4 Cosmin Ratiu 2024-10-01  161  			/* The same id needs to be processed again in the next loop iteration. */
a76cdab93204e4 Cosmin Ratiu 2024-10-01  162  			xas_reset(&xas);
a76cdab93204e4 Cosmin Ratiu 2024-10-01  163  			bulk_query_time = jiffies;
a76cdab93204e4 Cosmin Ratiu 2024-10-01  164  			err = mlx5_cmd_fc_bulk_query(dev, bulk_base_id, bulk_len, data);
a351a1b03bf169 Amir Vadai   2016-07-14  165  			if (err) {
a351a1b03bf169 Amir Vadai   2016-07-14  166  				mlx5_core_err(dev, "Error doing bulk query: %d\n", err);
6f06e04b67baa1 Gavi Teitz   2019-07-29  167  				return;
a351a1b03bf169 Amir Vadai   2016-07-14  168  			}
a76cdab93204e4 Cosmin Ratiu 2024-10-01  169  			xas_lock(&xas);
a76cdab93204e4 Cosmin Ratiu 2024-10-01  170  			continue;
6f06e04b67baa1 Gavi Teitz   2019-07-29  171  		}
a76cdab93204e4 Cosmin Ratiu 2024-10-01  172  		/* Do not update counters added after bulk query was started. */
a76cdab93204e4 Cosmin Ratiu 2024-10-01 @173  		if (time_after64(bulk_query_time, counter->cache.lastuse))
a76cdab93204e4 Cosmin Ratiu 2024-10-01 @174  			update_counter_cache(counter->id - bulk_base_id, data,
a76cdab93204e4 Cosmin Ratiu 2024-10-01  175  					     &counter->cache);
a351a1b03bf169 Amir Vadai   2016-07-14  176  	}
a76cdab93204e4 Cosmin Ratiu 2024-10-01  177  	xas_unlock(&xas);
a351a1b03bf169 Amir Vadai   2016-07-14  178  }
a351a1b03bf169 Amir Vadai   2016-07-14  179  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
