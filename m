Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DF216132F
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Apr 2025 09:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743759491; cv=none; b=jVSGhao8N5hUc2D1v1uqV4t3CD9wB0yHgozlrtdnCBt2BEZg5eKmkObjEcMjtYgoaHhoBhhHW/tmV7gBQEGVqaKhQhyhYfLzhltHJBLEUf/YTl8GGUufg4Re7AZA3nldXnO+E/jG9+RAQHiwuTncTF7d/Wn97VA/BY0zPUR1dVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743759491; c=relaxed/simple;
	bh=cDnVKyezGOqltIMi0+T81ldPRnPV+i5Gh+m0XMu2TFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hyVqsf2KxM2LQlhKfgfHvRnJU2ePtYB5/lDe329G21zbd2D+y4Ff3EBxzmOV+do9QHrD0wuW6LwIQntb9K06IOTXeA9fbmlll5Nwuce9i5DtBXQ/jSBuzm+/q+lCVxy2at3iHMzZ+AoThDDBfEzwRthobBAu9fX5bC7ga58Y630=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUO0vayb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUO0vayb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743759489; x=1775295489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cDnVKyezGOqltIMi0+T81ldPRnPV+i5Gh+m0XMu2TFw=;
  b=nUO0vaybdaCFzGLkgkvGSicrREbYZDqKrtZXOMVYdOa2Cn2dpwSJVK5T
   NbC4Q9qOIyhxdyNel2BPJwKwUdajtqDxppSB7m31S0CbKOHJH8sb34Zep
   xD4Lq/+bo1b5gnLEmP5uWEPJQaF8ZyLMCoXj22u7FQF78hqih3KYcdEMU
   5N7kWqeDbgFdgYLh6X5/4WtUwxeMrpN1gGjiCHpRQXdL2BfSacoyylTgJ
   6BtElWIRtU5+v05YBFu2BHNscFpXGg/t4nLgC65BRTjKVHfGr0vPTDb9P
   Z6TQ1vP5L8/+5FdIMebNPJSk1uSJGp/NquEhw0eVX5xlaMGfkD71236cN
   g==;
X-CSE-ConnectionGUID: w59eVv1jSr+T1Usy+seVPw==
X-CSE-MsgGUID: cCV75rEkRcyPcSb4IxogMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45079895"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="45079895"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 02:38:09 -0700
X-CSE-ConnectionGUID: HJMiJDC2SaKZ4+zFdEGl8A==
X-CSE-MsgGUID: z8JgYqqXR+uhPt25NBZkVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="132238117"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Apr 2025 02:38:07 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0dUy-000185-2k;
	Fri, 04 Apr 2025 09:38:04 +0000
Date: Fri, 4 Apr 2025 17:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/infiniband/hw/mlx5/fs.c:2446 mlx5_ib_matcher_ns() error:
 uninitialized symbol '_val'.
Message-ID: <202504041738.HLTp9IbR-lkp@intel.com>
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
TO: Patrisious Haddad <phaddad@nvidia.com>
CC: Leon Romanovsky <leon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e48e99b6edf41c69c5528aa7ffb2daf3c59ee105
commit: 36e0d433672f1e65400d69e7eaf7150752c45e29 RDMA/mlx5: Compile fs.c regardless of INFINIBAND_USER_ACCESS config
date:   2 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 2 weeks ago
config: loongarch-randconfig-r072-20250404 (https://download.01.org/0day-ci/archive/20250404/202504041738.HLTp9IbR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504041738.HLTp9IbR-lkp@intel.com/

smatch warnings:
drivers/infiniband/hw/mlx5/fs.c:2446 mlx5_ib_matcher_ns() error: uninitialized symbol '_val'.
drivers/infiniband/hw/mlx5/fs.c:2580 mlx5_ib_handler_MLX5_IB_METHOD_STEERING_ANCHOR_CREATE() error: uninitialized symbol '_val'.
drivers/infiniband/hw/mlx5/fs.c:2710 mlx5_ib_handler_MLX5_IB_METHOD_FLOW_ACTION_CREATE_MODIFY_HEADER() error: uninitialized symbol '_val'.
drivers/infiniband/hw/mlx5/fs.c:2823 mlx5_ib_handler_MLX5_IB_METHOD_FLOW_ACTION_CREATE_PACKET_REFORMAT() error: uninitialized symbol '_val'.

vim +/_val +2446 drivers/infiniband/hw/mlx5/fs.c

e1f4a52ac171dd Mark Bloch        2023-06-05  2429  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2430  static int mlx5_ib_matcher_ns(struct uverbs_attr_bundle *attrs,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2431  			      struct mlx5_ib_flow_matcher *obj)
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2432  {
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2433  	enum mlx5_ib_uapi_flow_table_type ft_type =
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2434  		MLX5_IB_UAPI_FLOW_TABLE_TYPE_NIC_RX;
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2435  	u32 flags;
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2436  	int err;
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2437  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2438  	/* New users should use MLX5_IB_ATTR_FLOW_MATCHER_FT_TYPE and older
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2439  	 * users should switch to it. We leave this to not break userspace
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2440  	 */
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2441  	if (uverbs_attr_is_valid(attrs, MLX5_IB_ATTR_FLOW_MATCHER_FT_TYPE) &&
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2442  	    uverbs_attr_is_valid(attrs, MLX5_IB_ATTR_FLOW_MATCHER_FLOW_FLAGS))
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2443  		return -EINVAL;
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2444  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2445  	if (uverbs_attr_is_valid(attrs, MLX5_IB_ATTR_FLOW_MATCHER_FT_TYPE)) {
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02 @2446  		err = uverbs_get_const(&ft_type, attrs,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2447  				       MLX5_IB_ATTR_FLOW_MATCHER_FT_TYPE);
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2448  		if (err)
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2449  			return err;
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2450  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2451  		err = mlx5_ib_ft_type_to_namespace(ft_type, &obj->ns_type);
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2452  		if (err)
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2453  			return err;
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2454  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2455  		return 0;
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2456  	}
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2457  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2458  	if (uverbs_attr_is_valid(attrs, MLX5_IB_ATTR_FLOW_MATCHER_FLOW_FLAGS)) {
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2459  		err = uverbs_get_flags32(&flags, attrs,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2460  					 MLX5_IB_ATTR_FLOW_MATCHER_FLOW_FLAGS,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2461  					 IB_FLOW_ATTR_FLAGS_EGRESS);
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2462  		if (err)
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2463  			return err;
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2464  
c9776457bd5eaa Maor Gottlieb     2022-07-31  2465  		if (flags)
c9776457bd5eaa Maor Gottlieb     2022-07-31  2466  			return mlx5_ib_ft_type_to_namespace(
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2467  				MLX5_IB_UAPI_FLOW_TABLE_TYPE_NIC_TX,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2468  				&obj->ns_type);
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2469  	}
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2470  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2471  	obj->ns_type = MLX5_FLOW_NAMESPACE_BYPASS;
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2472  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2473  	return 0;
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2474  }
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2475  
74934ddf124a6f Patrisious Haddad 2025-03-06  2476  static bool verify_context_caps(struct mlx5_ib_dev *dev, u64 enabled_caps)
74934ddf124a6f Patrisious Haddad 2025-03-06  2477  {
74934ddf124a6f Patrisious Haddad 2025-03-06  2478  	if (is_mdev_switchdev_mode(dev->mdev))
74934ddf124a6f Patrisious Haddad 2025-03-06  2479  		return UCAP_ENABLED(enabled_caps,
74934ddf124a6f Patrisious Haddad 2025-03-06  2480  				    RDMA_UCAP_MLX5_CTRL_OTHER_VHCA);
74934ddf124a6f Patrisious Haddad 2025-03-06  2481  
74934ddf124a6f Patrisious Haddad 2025-03-06  2482  	return UCAP_ENABLED(enabled_caps, RDMA_UCAP_MLX5_CTRL_LOCAL);
74934ddf124a6f Patrisious Haddad 2025-03-06  2483  }
74934ddf124a6f Patrisious Haddad 2025-03-06  2484  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2485  static int UVERBS_HANDLER(MLX5_IB_METHOD_FLOW_MATCHER_CREATE)(
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2486  	struct uverbs_attr_bundle *attrs)
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2487  {
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2488  	struct ib_uobject *uobj = uverbs_attr_get_uobject(
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2489  		attrs, MLX5_IB_ATTR_FLOW_MATCHER_CREATE_HANDLE);
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2490  	struct mlx5_ib_dev *dev = mlx5_udata_to_mdev(&attrs->driver_udata);
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2491  	struct mlx5_ib_flow_matcher *obj;
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2492  	int err;
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2493  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2494  	obj = kzalloc(sizeof(struct mlx5_ib_flow_matcher), GFP_KERNEL);
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2495  	if (!obj)
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2496  		return -ENOMEM;
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2497  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2498  	obj->mask_len = uverbs_attr_get_len(
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2499  		attrs, MLX5_IB_ATTR_FLOW_MATCHER_MATCH_MASK);
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2500  	err = uverbs_copy_from(&obj->matcher_mask,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2501  			       attrs,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2502  			       MLX5_IB_ATTR_FLOW_MATCHER_MATCH_MASK);
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2503  	if (err)
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2504  		goto end;
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2505  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2506  	obj->flow_type = uverbs_attr_get_enum_id(
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2507  		attrs, MLX5_IB_ATTR_FLOW_MATCHER_FLOW_TYPE);
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2508  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2509  	if (obj->flow_type == MLX5_IB_FLOW_TYPE_NORMAL) {
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2510  		err = uverbs_copy_from(&obj->priority,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2511  				       attrs,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2512  				       MLX5_IB_ATTR_FLOW_MATCHER_FLOW_TYPE);
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2513  		if (err)
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2514  			goto end;
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2515  	}
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2516  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2517  	err = uverbs_copy_from(&obj->match_criteria_enable,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2518  			       attrs,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2519  			       MLX5_IB_ATTR_FLOW_MATCHER_MATCH_CRITERIA);
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2520  	if (err)
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2521  		goto end;
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2522  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2523  	err = mlx5_ib_matcher_ns(attrs, obj);
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2524  	if (err)
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2525  		goto end;
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2526  
22c3f2f56bd9c9 Maor Gottlieb     2021-12-01  2527  	if (obj->ns_type == MLX5_FLOW_NAMESPACE_FDB_BYPASS &&
edc0b0bccc9c80 Mark Bloch        2021-06-07  2528  	    mlx5_eswitch_mode(dev->mdev) != MLX5_ESWITCH_OFFLOADS) {
edc0b0bccc9c80 Mark Bloch        2021-06-07  2529  		err = -EINVAL;
edc0b0bccc9c80 Mark Bloch        2021-06-07  2530  		goto end;
edc0b0bccc9c80 Mark Bloch        2021-06-07  2531  	}
edc0b0bccc9c80 Mark Bloch        2021-06-07  2532  
74934ddf124a6f Patrisious Haddad 2025-03-06  2533  	if (uverbs_attr_is_valid(attrs, MLX5_IB_ATTR_FLOW_MATCHER_IB_PORT)) {
74934ddf124a6f Patrisious Haddad 2025-03-06  2534  		err = uverbs_copy_from(&obj->ib_port, attrs,
74934ddf124a6f Patrisious Haddad 2025-03-06  2535  				       MLX5_IB_ATTR_FLOW_MATCHER_IB_PORT);
74934ddf124a6f Patrisious Haddad 2025-03-06  2536  		if (err)
74934ddf124a6f Patrisious Haddad 2025-03-06  2537  			goto end;
74934ddf124a6f Patrisious Haddad 2025-03-06  2538  		if (!rdma_is_port_valid(&dev->ib_dev, obj->ib_port)) {
74934ddf124a6f Patrisious Haddad 2025-03-06  2539  			err = -EINVAL;
74934ddf124a6f Patrisious Haddad 2025-03-06  2540  			goto end;
74934ddf124a6f Patrisious Haddad 2025-03-06  2541  		}
74934ddf124a6f Patrisious Haddad 2025-03-06  2542  		if (obj->ns_type != MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX &&
74934ddf124a6f Patrisious Haddad 2025-03-06  2543  		    obj->ns_type != MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX) {
74934ddf124a6f Patrisious Haddad 2025-03-06  2544  			err = -EINVAL;
74934ddf124a6f Patrisious Haddad 2025-03-06  2545  			goto end;
74934ddf124a6f Patrisious Haddad 2025-03-06  2546  		}
74934ddf124a6f Patrisious Haddad 2025-03-06  2547  		if (!verify_context_caps(dev, uobj->context->enabled_caps)) {
74934ddf124a6f Patrisious Haddad 2025-03-06  2548  			err = -EOPNOTSUPP;
74934ddf124a6f Patrisious Haddad 2025-03-06  2549  			goto end;
74934ddf124a6f Patrisious Haddad 2025-03-06  2550  		}
74934ddf124a6f Patrisious Haddad 2025-03-06  2551  	}
74934ddf124a6f Patrisious Haddad 2025-03-06  2552  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2553  	uobj->object = obj;
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2554  	obj->mdev = dev->mdev;
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2555  	atomic_set(&obj->usecnt, 0);
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2556  	return 0;
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2557  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2558  end:
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2559  	kfree(obj);
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2560  	return err;
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2561  }
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2562  
0c6ab0ca9a662d Mark Bloch        2022-07-03  2563  static int UVERBS_HANDLER(MLX5_IB_METHOD_STEERING_ANCHOR_CREATE)(
0c6ab0ca9a662d Mark Bloch        2022-07-03  2564  	struct uverbs_attr_bundle *attrs)
0c6ab0ca9a662d Mark Bloch        2022-07-03  2565  {
0c6ab0ca9a662d Mark Bloch        2022-07-03  2566  	struct ib_uobject *uobj = uverbs_attr_get_uobject(
0c6ab0ca9a662d Mark Bloch        2022-07-03  2567  		attrs, MLX5_IB_ATTR_STEERING_ANCHOR_CREATE_HANDLE);
0c6ab0ca9a662d Mark Bloch        2022-07-03  2568  	struct mlx5_ib_dev *dev = mlx5_udata_to_mdev(&attrs->driver_udata);
0c6ab0ca9a662d Mark Bloch        2022-07-03  2569  	enum mlx5_ib_uapi_flow_table_type ib_uapi_ft_type;
0c6ab0ca9a662d Mark Bloch        2022-07-03  2570  	enum mlx5_flow_namespace_type ns_type;
0c6ab0ca9a662d Mark Bloch        2022-07-03  2571  	struct mlx5_ib_steering_anchor *obj;
0c6ab0ca9a662d Mark Bloch        2022-07-03  2572  	struct mlx5_ib_flow_prio *ft_prio;
0c6ab0ca9a662d Mark Bloch        2022-07-03  2573  	u16 priority;
0c6ab0ca9a662d Mark Bloch        2022-07-03  2574  	u32 ft_id;
0c6ab0ca9a662d Mark Bloch        2022-07-03  2575  	int err;
0c6ab0ca9a662d Mark Bloch        2022-07-03  2576  
0c6ab0ca9a662d Mark Bloch        2022-07-03  2577  	if (!capable(CAP_NET_RAW))
0c6ab0ca9a662d Mark Bloch        2022-07-03  2578  		return -EPERM;
0c6ab0ca9a662d Mark Bloch        2022-07-03  2579  
0c6ab0ca9a662d Mark Bloch        2022-07-03 @2580  	err = uverbs_get_const(&ib_uapi_ft_type, attrs,
0c6ab0ca9a662d Mark Bloch        2022-07-03  2581  			       MLX5_IB_ATTR_STEERING_ANCHOR_FT_TYPE);
0c6ab0ca9a662d Mark Bloch        2022-07-03  2582  	if (err)
0c6ab0ca9a662d Mark Bloch        2022-07-03  2583  		return err;
0c6ab0ca9a662d Mark Bloch        2022-07-03  2584  
0c6ab0ca9a662d Mark Bloch        2022-07-03  2585  	err = mlx5_ib_ft_type_to_namespace(ib_uapi_ft_type, &ns_type);
0c6ab0ca9a662d Mark Bloch        2022-07-03  2586  	if (err)
0c6ab0ca9a662d Mark Bloch        2022-07-03  2587  		return err;
0c6ab0ca9a662d Mark Bloch        2022-07-03  2588  
0c6ab0ca9a662d Mark Bloch        2022-07-03  2589  	err = uverbs_copy_from(&priority, attrs,
0c6ab0ca9a662d Mark Bloch        2022-07-03  2590  			       MLX5_IB_ATTR_STEERING_ANCHOR_PRIORITY);
0c6ab0ca9a662d Mark Bloch        2022-07-03  2591  	if (err)
0c6ab0ca9a662d Mark Bloch        2022-07-03  2592  		return err;
0c6ab0ca9a662d Mark Bloch        2022-07-03  2593  
0c6ab0ca9a662d Mark Bloch        2022-07-03  2594  	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
0c6ab0ca9a662d Mark Bloch        2022-07-03  2595  	if (!obj)
0c6ab0ca9a662d Mark Bloch        2022-07-03  2596  		return -ENOMEM;
0c6ab0ca9a662d Mark Bloch        2022-07-03  2597  
0c6ab0ca9a662d Mark Bloch        2022-07-03  2598  	mutex_lock(&dev->flow_db->lock);
e1f4a52ac171dd Mark Bloch        2023-06-05  2599  
74934ddf124a6f Patrisious Haddad 2025-03-06  2600  	ft_prio = _get_flow_table(dev, priority, ns_type, 0, 0);
0c6ab0ca9a662d Mark Bloch        2022-07-03  2601  	if (IS_ERR(ft_prio)) {
0c6ab0ca9a662d Mark Bloch        2022-07-03  2602  		err = PTR_ERR(ft_prio);
0c6ab0ca9a662d Mark Bloch        2022-07-03  2603  		goto free_obj;
0c6ab0ca9a662d Mark Bloch        2022-07-03  2604  	}
0c6ab0ca9a662d Mark Bloch        2022-07-03  2605  
0c6ab0ca9a662d Mark Bloch        2022-07-03  2606  	ft_prio->refcount++;
e1f4a52ac171dd Mark Bloch        2023-06-05  2607  
e1f4a52ac171dd Mark Bloch        2023-06-05  2608  	if (!ft_prio->anchor.rule_goto_table_ref) {
e1f4a52ac171dd Mark Bloch        2023-06-05  2609  		err = steering_anchor_create_res(dev, ft_prio, ns_type);
e1f4a52ac171dd Mark Bloch        2023-06-05  2610  		if (err)
e1f4a52ac171dd Mark Bloch        2023-06-05  2611  			goto put_flow_table;
e1f4a52ac171dd Mark Bloch        2023-06-05  2612  	}
e1f4a52ac171dd Mark Bloch        2023-06-05  2613  
e1f4a52ac171dd Mark Bloch        2023-06-05  2614  	ft_prio->anchor.rule_goto_table_ref++;
e1f4a52ac171dd Mark Bloch        2023-06-05  2615  
e1f4a52ac171dd Mark Bloch        2023-06-05  2616  	ft_id = mlx5_flow_table_id(ft_prio->anchor.ft);
0c6ab0ca9a662d Mark Bloch        2022-07-03  2617  
0c6ab0ca9a662d Mark Bloch        2022-07-03  2618  	err = uverbs_copy_to(attrs, MLX5_IB_ATTR_STEERING_ANCHOR_FT_ID,
0c6ab0ca9a662d Mark Bloch        2022-07-03  2619  			     &ft_id, sizeof(ft_id));
0c6ab0ca9a662d Mark Bloch        2022-07-03  2620  	if (err)
e1f4a52ac171dd Mark Bloch        2023-06-05  2621  		goto destroy_res;
e1f4a52ac171dd Mark Bloch        2023-06-05  2622  
e1f4a52ac171dd Mark Bloch        2023-06-05  2623  	mutex_unlock(&dev->flow_db->lock);
0c6ab0ca9a662d Mark Bloch        2022-07-03  2624  
0c6ab0ca9a662d Mark Bloch        2022-07-03  2625  	uobj->object = obj;
0c6ab0ca9a662d Mark Bloch        2022-07-03  2626  	obj->dev = dev;
0c6ab0ca9a662d Mark Bloch        2022-07-03  2627  	obj->ft_prio = ft_prio;
0c6ab0ca9a662d Mark Bloch        2022-07-03  2628  	atomic_set(&obj->usecnt, 0);
0c6ab0ca9a662d Mark Bloch        2022-07-03  2629  
0c6ab0ca9a662d Mark Bloch        2022-07-03  2630  	return 0;
0c6ab0ca9a662d Mark Bloch        2022-07-03  2631  
e1f4a52ac171dd Mark Bloch        2023-06-05  2632  destroy_res:
e1f4a52ac171dd Mark Bloch        2023-06-05  2633  	--ft_prio->anchor.rule_goto_table_ref;
e1f4a52ac171dd Mark Bloch        2023-06-05  2634  	mlx5_steering_anchor_destroy_res(ft_prio);
0c6ab0ca9a662d Mark Bloch        2022-07-03  2635  put_flow_table:
0c6ab0ca9a662d Mark Bloch        2022-07-03  2636  	put_flow_table(dev, ft_prio, true);
0c6ab0ca9a662d Mark Bloch        2022-07-03  2637  free_obj:
2fad8f06a582cd Hamdan Igbaria    2023-09-20  2638  	mutex_unlock(&dev->flow_db->lock);
0c6ab0ca9a662d Mark Bloch        2022-07-03  2639  	kfree(obj);
0c6ab0ca9a662d Mark Bloch        2022-07-03  2640  
0c6ab0ca9a662d Mark Bloch        2022-07-03  2641  	return err;
0c6ab0ca9a662d Mark Bloch        2022-07-03  2642  }
0c6ab0ca9a662d Mark Bloch        2022-07-03  2643  

:::::: The code at line 2446 was first introduced by commit
:::::: f7c4ffda0cbf7823915cbfebdbbe8460e7eeca67 RDMA/mlx5: Separate flow steering logic from main.c

:::::: TO: Leon Romanovsky <leonro@mellanox.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
