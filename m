Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F41C3271EA
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Jul 2026 14:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125250; cv=none; b=W1ZzyAGwJ4PfJ+z5rpOXe0DIPiv9re4z8lBqDN5TOL9Vo4ZCZ40agW176EaamPnlnZLXInph98wdxlpqRl5XNlspE9zOIAXaDfeH/DWYGA90GClTWtWhISZWu/XPZU7MsaMmOplYD7wfSULcs2lmXzh0m20RHHqO5dnR0s7jG0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125250; c=relaxed/simple;
	bh=ijLISXi5yWZTiC8k/LKxrDmWvPfXT//GkStdsPAUqLU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WRF0KgWleQaZ5F57b847KXEgd0/k0v9NghdAyiCnqq4J/8ZP38JTIKm7HH7/lMTJ+k30g4CdYzTRIovcXIBKvbRXaDp3qTwUyXeIoZ3gkIT/xJHZmwdPIW3ddczIXceYZs7Ey6KZeUC1fhVP84/vWI4bz5WcoTKBhKzTc18VZe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HC4i9wqp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HC4i9wqp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784125248; x=1815661248;
  h=date:from:to:cc:subject:message-id;
  bh=ijLISXi5yWZTiC8k/LKxrDmWvPfXT//GkStdsPAUqLU=;
  b=HC4i9wqpaV1411Co3mMcabca0f4Ewy1UyIS/nGCKjS19kdo+FMLxTLgk
   vXUI3T2TcLoEdni2UYTt4TZh6mWCU7Lm9qKDb+WLoZAcxcFjzyaLkP6Bv
   EyR4Vc/Abl/zOaBNtZUulQsT4n4En5EAb1qfjR0J2UQ8o2TvVHz2vugBA
   CpACvOWNSEIHa+cQfR1kVxH3N+FcTHX3SAD7nt6neJZX1en54rGUpu33V
   7QPWRQ1rGLDTrzPHavbR+0nOuAoNzsXTpzVmira9oFZBozt5O7Q4EMG7B
   mf/VqJe191vNnd62aCKZy1xDvVCjD1yWdeZSpyZRXPO5TEmqbn97smYe/
   A==;
X-CSE-ConnectionGUID: IcRzDCYrQGmLFpjJ0ofyQg==
X-CSE-MsgGUID: K8Y4w+eNTFSYfo2jzlDjjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88440545"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="88440545"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 07:20:48 -0700
X-CSE-ConnectionGUID: l8OdIgZ9QLG+hdrFP6jnWg==
X-CSE-MsgGUID: w4vQcXIHST6r2fb7GMK71Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="258149702"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jul 2026 07:20:47 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wk0Ta-00000000Ni5-0avG;
	Wed, 15 Jul 2026 14:20:43 +0000
Date: Wed, 15 Jul 2026 22:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-6.1 8/8]
 drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c:274
 mlx5_devcom_get_peer_data_rcu() error: buffer overflow 'comp->device' 2 <= 2
 (assuming for loop doesn't break)
Message-ID: <202607152239.OGtCQIxu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   e69716042404c1fdc90175146d84a7b1513b559c
commit: 362063df6ceec80b0b6798b61ae03504dcc125a5 [8/8] net/mlx5e: Fix deadlock in tc route query code
:::::: branch date: 2 days ago
:::::: commit date: 3 years, 2 months ago
config: i386-randconfig-141-20260715 (https://download.01.org/0day-ci/archive/20260715/202607152239.OGtCQIxu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607152239.OGtCQIxu-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c:274 mlx5_devcom_get_peer_data_rcu() error: buffer overflow 'comp->device' 2 <= 2 (assuming for loop doesn't break)
drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c:274 mlx5_devcom_get_peer_data_rcu() error: buffer overflow 'comp->device' 2 <= 2 (assuming for loop doesn't break)

Old smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c:252 mlx5_devcom_get_peer_data() error: buffer overflow 'comp->device' 2 <= 2 (assuming for loop doesn't break)
drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c:252 mlx5_devcom_get_peer_data() error: buffer overflow 'comp->device' 2 <= 2 (assuming for loop doesn't break)
drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c:252 mlx5_devcom_get_peer_data() error: buffer overflow 'comp->device' 2 <= 2 (assuming for loop doesn't break)

vim +274 drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c

362063df6ceec8 Vlad Buslov 2023-03-31  254  
362063df6ceec8 Vlad Buslov 2023-03-31  255  void *mlx5_devcom_get_peer_data_rcu(struct mlx5_devcom *devcom, enum mlx5_devcom_components id)
362063df6ceec8 Vlad Buslov 2023-03-31  256  {
362063df6ceec8 Vlad Buslov 2023-03-31  257  	struct mlx5_devcom_component *comp;
362063df6ceec8 Vlad Buslov 2023-03-31  258  	int i;
362063df6ceec8 Vlad Buslov 2023-03-31  259  
362063df6ceec8 Vlad Buslov 2023-03-31  260  	if (IS_ERR_OR_NULL(devcom))
362063df6ceec8 Vlad Buslov 2023-03-31  261  		return NULL;
362063df6ceec8 Vlad Buslov 2023-03-31  262  
362063df6ceec8 Vlad Buslov 2023-03-31  263  	for (i = 0; i < MLX5_DEVCOM_PORTS_SUPPORTED; i++)
362063df6ceec8 Vlad Buslov 2023-03-31  264  		if (i != devcom->idx)
362063df6ceec8 Vlad Buslov 2023-03-31  265  			break;
362063df6ceec8 Vlad Buslov 2023-03-31  266  
362063df6ceec8 Vlad Buslov 2023-03-31  267  	comp = &devcom->priv->components[id];
362063df6ceec8 Vlad Buslov 2023-03-31  268  	/* This can change concurrently, however 'data' pointer will remain
362063df6ceec8 Vlad Buslov 2023-03-31  269  	 * valid for the duration of RCU read section.
362063df6ceec8 Vlad Buslov 2023-03-31  270  	 */
362063df6ceec8 Vlad Buslov 2023-03-31  271  	if (!READ_ONCE(comp->paired))
362063df6ceec8 Vlad Buslov 2023-03-31  272  		return NULL;
362063df6ceec8 Vlad Buslov 2023-03-31  273  
362063df6ceec8 Vlad Buslov 2023-03-31 @274  	return rcu_dereference(comp->device[i].data);
fadd59fc50d010 Aviv Heller 2018-12-04  275  }
fadd59fc50d010 Aviv Heller 2018-12-04  276  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
