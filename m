Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EFF335099
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 19:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764098656; cv=none; b=uI7MpJ7U7VlLnJLcewwTDqborA65h20QqkZ6rqetrF4srSWXhdhYRJN4QOb7OX2dZQ3uXdUL9iq33+ie3fFuEPHJu9scdlwrLvcuiimSPKmjc93RMe7lEUNDAjCdV53zusuP9ODrOac3zXZJlwlAuY4hKWraI4iLmxjM8cJvNAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764098656; c=relaxed/simple;
	bh=KyJPFdH/iNVI4YSc7NETOFXThnPr38d7CNA5agFkBK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RwlPRxWTGiFgnWdwUT51/xVnEPcZ/8Tpj4EbzJAMCH5nJ0lb4auFLEUWNCQFcbfnGn3VdWCzoxH0TDs7rFhsKIY/sGTlm/GJFwHs/sw8wG4x89KdGUfJpZ+5GBZrJOQBhEzS6nlahmf4qc6hSmtfOlkL2gBX+uVA/xZpDS2cl00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEsByegi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEsByegi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764098653; x=1795634653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KyJPFdH/iNVI4YSc7NETOFXThnPr38d7CNA5agFkBK0=;
  b=ZEsByegioEzjDCJTvWohH5sY1ZOHf9K7fZfyMPqNlyJ6D6tpbV5w4Yki
   ZBcsBKkHxGgD08E32cpsmOEYPgfyos0hE5P+bQFIIxb1Rzv+2prsnCtnd
   rgTMlitv5uI2WTS8lF0S5gWNu8mYRw+P55vf9Rs0M7OWmMoNfzt6NmWCw
   dw4tGmMrAVTaFGfPqZnhIFdX7mQevqDVt8IWpibeT4VgOCXQTMdllawWN
   2Gy+bGnm/w7ixkTL03AddzVxnb1xOraw3gjX4rwCxY0BH2M9J9rskEQBu
   G+zO/QnpUnhEKjyKLiRN6Sdqhg+TPwNDijxSXkfgLcjtipRzJbETD4JwF
   g==;
X-CSE-ConnectionGUID: 32ZaixzhRq602nYUuX6jfw==
X-CSE-MsgGUID: 3xQpOQMRQTuqkL8dtG7kEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="69986770"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="69986770"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 11:24:12 -0800
X-CSE-ConnectionGUID: Ich6vZ8oRLeW6/XK6hdrbA==
X-CSE-MsgGUID: O17KrAbYSZWHVD4lcsTw2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="192727886"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2025 11:24:11 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNydz-000000002Bt-2iy7;
	Tue, 25 Nov 2025 19:24:07 +0000
Date: Wed, 26 Nov 2025 03:23:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6663/11746]
 drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:2451
 mlx5_esw_fdb_active() warn: iterator 'i' not incremented
Message-ID: <202511260309.z8AJsHBY-lkp@intel.com>
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
TO: Saeed Mahameed <saeedm@nvidia.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Adithya Jayachandran <ajayachandra@nvidia.com>
CC: Jiri Pirko <jiri@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   92fd6e84175befa1775e5c0ab682938eca27c0b2
commit: 9da611df15aa8d519f9947b88a5c733267cba888 [6663/11746] net/mlx5: E-Switch, support eswitch inactive mode
:::::: branch date: 10 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20251125 (https://download.01.org/0day-ci/archive/20251126/202511260309.z8AJsHBY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511260309.z8AJsHBY-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:2451 mlx5_esw_fdb_active() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:2471 mlx5_esw_fdb_inactive() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:2225 mlx5_eswitch_inline_mode_get() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:2569 esw_offloads_cleanup_reps() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:2582 esw_offloads_init_reps() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:2713 __unload_reps_all_vport() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:3070 mlx5_esw_offloads_rep_event_unpair() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:3104 mlx5_esw_offloads_pair() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:3376 esw_offloads_metadata_uninit() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:3389 esw_offloads_metadata_init() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:3491 mlx5_eswitch_reload_ib_reps() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:4340 mlx5_eswitch_register_vport_reps() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:4358 mlx5_eswitch_unregister_vport_reps() warn: iterator 'i' not incremented

vim +/i +2451 drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c

9da611df15aa8d Saeed Mahameed 2025-11-07  2442  
9da611df15aa8d Saeed Mahameed 2025-11-07  2443  static void mlx5_esw_fdb_active(struct mlx5_eswitch *esw)
9da611df15aa8d Saeed Mahameed 2025-11-07  2444  {
9da611df15aa8d Saeed Mahameed 2025-11-07  2445  	struct mlx5_vport *vport;
9da611df15aa8d Saeed Mahameed 2025-11-07  2446  	unsigned long i;
9da611df15aa8d Saeed Mahameed 2025-11-07  2447  
9da611df15aa8d Saeed Mahameed 2025-11-07  2448  	mlx5_esw_fdb_drop_destroy(esw);
9da611df15aa8d Saeed Mahameed 2025-11-07  2449  	mlx5_mpfs_enable(esw->dev);
9da611df15aa8d Saeed Mahameed 2025-11-07  2450  
9da611df15aa8d Saeed Mahameed 2025-11-07 @2451  	mlx5_esw_for_each_vf_vport(esw, i, vport, U16_MAX) {
9da611df15aa8d Saeed Mahameed 2025-11-07  2452  		if (!vport->adjacent)
9da611df15aa8d Saeed Mahameed 2025-11-07  2453  			continue;
9da611df15aa8d Saeed Mahameed 2025-11-07  2454  		esw_debug(esw->dev, "Connecting vport %d to eswitch\n",
9da611df15aa8d Saeed Mahameed 2025-11-07  2455  			  vport->vport);
9da611df15aa8d Saeed Mahameed 2025-11-07  2456  		mlx5_esw_adj_vport_modify(esw->dev, vport->vport, true);
9da611df15aa8d Saeed Mahameed 2025-11-07  2457  	}
9da611df15aa8d Saeed Mahameed 2025-11-07  2458  
9da611df15aa8d Saeed Mahameed 2025-11-07  2459  	esw->offloads_inactive = false;
9da611df15aa8d Saeed Mahameed 2025-11-07  2460  	esw_warn(esw->dev, "MPFS/FDB active\n");
9da611df15aa8d Saeed Mahameed 2025-11-07  2461  }
9da611df15aa8d Saeed Mahameed 2025-11-07  2462  
9da611df15aa8d Saeed Mahameed 2025-11-07  2463  static void mlx5_esw_fdb_inactive(struct mlx5_eswitch *esw)
9da611df15aa8d Saeed Mahameed 2025-11-07  2464  {
9da611df15aa8d Saeed Mahameed 2025-11-07  2465  	struct mlx5_vport *vport;
9da611df15aa8d Saeed Mahameed 2025-11-07  2466  	unsigned long i;
9da611df15aa8d Saeed Mahameed 2025-11-07  2467  
9da611df15aa8d Saeed Mahameed 2025-11-07  2468  	mlx5_mpfs_disable(esw->dev);
9da611df15aa8d Saeed Mahameed 2025-11-07  2469  	mlx5_esw_fdb_drop_create(esw);
9da611df15aa8d Saeed Mahameed 2025-11-07  2470  
9da611df15aa8d Saeed Mahameed 2025-11-07 @2471  	mlx5_esw_for_each_vf_vport(esw, i, vport, U16_MAX) {
9da611df15aa8d Saeed Mahameed 2025-11-07  2472  		if (!vport->adjacent)
9da611df15aa8d Saeed Mahameed 2025-11-07  2473  			continue;
9da611df15aa8d Saeed Mahameed 2025-11-07  2474  		esw_debug(esw->dev, "Disconnecting vport %u from eswitch\n",
9da611df15aa8d Saeed Mahameed 2025-11-07  2475  			  vport->vport);
9da611df15aa8d Saeed Mahameed 2025-11-07  2476  
9da611df15aa8d Saeed Mahameed 2025-11-07  2477  		mlx5_esw_adj_vport_modify(esw->dev, vport->vport, false);
9da611df15aa8d Saeed Mahameed 2025-11-07  2478  	}
9da611df15aa8d Saeed Mahameed 2025-11-07  2479  
9da611df15aa8d Saeed Mahameed 2025-11-07  2480  	esw->offloads_inactive = true;
9da611df15aa8d Saeed Mahameed 2025-11-07  2481  	esw_warn(esw->dev, "MPFS/FDB inactive\n");
9da611df15aa8d Saeed Mahameed 2025-11-07  2482  }
9da611df15aa8d Saeed Mahameed 2025-11-07  2483  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
