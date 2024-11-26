Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625997DA68
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Nov 2024 11:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732619065; cv=none; b=EYLXIqJJ+LfTuXdzj8q9ICJJZFWWAeKgSDn3xecIjrErZZuoKesEjMbfY8Ad20cYkzmslVvk1zJv4V1LmhQ6TwIz+Rie+U3SbB23kjbLGojBCzsFmTlY7nSE/wliUCUdbG4BhEgCX0xrZrSEu3y8ecX/yGrVPGFoJSPUiW/aaDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732619065; c=relaxed/simple;
	bh=+rJMRhplUUQpf4N2xnr69aUGfN5LnmQSoX/FTxtcq3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LUBSk5RwI8379jVOVcb0lWAc4AmoFhU4hEaN39O06o37PkEstVNfK7zlD2COLyBRMiTS0LF7IyTbicR568gBw/VvMBLzYw6dxLi6jxEB03MHnouPc+hSNoDsBD1a34VzBElgJC9/FKMXEiFtUkPtlEJL9MZcN1bZuQ+3FzPA7hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HlNOtOzY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HlNOtOzY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732619064; x=1764155064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+rJMRhplUUQpf4N2xnr69aUGfN5LnmQSoX/FTxtcq3I=;
  b=HlNOtOzYechV5LlDaYzB/Fys9MCuGuEoyMX2JMTEBcIYx7/rOmTjSxil
   tLzElfL0fRpvGWM5mcAG1INIIsWKfkW/3UG+UEM+hS4nZa4TOnF0IA5et
   TEj3ubkXpF7+kjLh5hLkY4eyQqBC880XjUAO0QzsEhvXd6pNj+59r8SbS
   TT0UioD3JEMG8Mp3HtTxnsxkpE8Zyra0NreJfsMTKHc5Ywo8jrdvOtUPG
   2VWwGvb6yWbcx7HvVFbJJx85SW0rWeAXVfFNm9/09Sdo0xDq5Q2CwpEiw
   F4S6YBmaKmbw4qaG9wDPLkn86T4mDVzO3t8QcWb2BvPC6kpAjFebQ8uNe
   g==;
X-CSE-ConnectionGUID: pBTXe06ARIigEdSA3fhrkQ==
X-CSE-MsgGUID: ES2HZqAdSbG+/qFA63fWsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="35629866"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="35629866"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 03:04:23 -0800
X-CSE-ConnectionGUID: Uqv21skNQNC0ZoqM+QgM2w==
X-CSE-MsgGUID: DszVPO6JQ2KeszUOR3xqeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="114841350"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 03:04:22 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFtMh-0007EZ-1T;
	Tue, 26 Nov 2024 11:04:19 +0000
Date: Tue, 26 Nov 2024 19:04:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/infiniband/hw/mlx5/umr.c:153 mlx5r_umr_resource_init() warn:
 missing error code 'ret'
Message-ID: <202411261836.ZMTzikEz-lkp@intel.com>
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
TO: Jianbo Liu <jianbol@nvidia.com>
CC: Leon Romanovsky <leon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5
commit: 638420115cc4ad6c3a2683bf46a052b505abb202 IB/mlx5: Create UMR QP just before first reg_mr occurs
date:   5 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 months ago
config: openrisc-randconfig-r071-20241124 (https://download.01.org/0day-ci/archive/20241126/202411261836.ZMTzikEz-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411261836.ZMTzikEz-lkp@intel.com/

smatch warnings:
drivers/infiniband/hw/mlx5/umr.c:153 mlx5r_umr_resource_init() warn: missing error code 'ret'

vim +/ret +153 drivers/infiniband/hw/mlx5/umr.c

04876c12c19e94 Aharon Landau 2022-04-12  134  
04876c12c19e94 Aharon Landau 2022-04-12  135  int mlx5r_umr_resource_init(struct mlx5_ib_dev *dev)
04876c12c19e94 Aharon Landau 2022-04-12  136  {
04876c12c19e94 Aharon Landau 2022-04-12  137  	struct ib_qp_init_attr init_attr = {};
04876c12c19e94 Aharon Landau 2022-04-12  138  	struct ib_cq *cq;
04876c12c19e94 Aharon Landau 2022-04-12  139  	struct ib_qp *qp;
638420115cc4ad Jianbo Liu    2024-06-03  140  	int ret = 0;
04876c12c19e94 Aharon Landau 2022-04-12  141  
638420115cc4ad Jianbo Liu    2024-06-03  142  
638420115cc4ad Jianbo Liu    2024-06-03  143  	/*
638420115cc4ad Jianbo Liu    2024-06-03  144  	 * UMR qp is set once, never changed until device unload.
638420115cc4ad Jianbo Liu    2024-06-03  145  	 * Avoid taking the mutex if initialization is already done.
638420115cc4ad Jianbo Liu    2024-06-03  146  	 */
638420115cc4ad Jianbo Liu    2024-06-03  147  	if (dev->umrc.qp)
638420115cc4ad Jianbo Liu    2024-06-03  148  		return 0;
638420115cc4ad Jianbo Liu    2024-06-03  149  
638420115cc4ad Jianbo Liu    2024-06-03  150  	mutex_lock(&dev->umrc.init_lock);
638420115cc4ad Jianbo Liu    2024-06-03  151  	/* First user allocates the UMR resources. Skip if already allocated. */
638420115cc4ad Jianbo Liu    2024-06-03  152  	if (dev->umrc.qp)
638420115cc4ad Jianbo Liu    2024-06-03 @153  		goto unlock;
04876c12c19e94 Aharon Landau 2022-04-12  154  
04876c12c19e94 Aharon Landau 2022-04-12  155  	cq = ib_alloc_cq(&dev->ib_dev, NULL, 128, 0, IB_POLL_SOFTIRQ);
04876c12c19e94 Aharon Landau 2022-04-12  156  	if (IS_ERR(cq)) {
04876c12c19e94 Aharon Landau 2022-04-12  157  		mlx5_ib_dbg(dev, "Couldn't create CQ for sync UMR QP\n");
04876c12c19e94 Aharon Landau 2022-04-12  158  		ret = PTR_ERR(cq);
638420115cc4ad Jianbo Liu    2024-06-03  159  		goto unlock;
04876c12c19e94 Aharon Landau 2022-04-12  160  	}
04876c12c19e94 Aharon Landau 2022-04-12  161  
04876c12c19e94 Aharon Landau 2022-04-12  162  	init_attr.send_cq = cq;
04876c12c19e94 Aharon Landau 2022-04-12  163  	init_attr.recv_cq = cq;
04876c12c19e94 Aharon Landau 2022-04-12  164  	init_attr.sq_sig_type = IB_SIGNAL_ALL_WR;
04876c12c19e94 Aharon Landau 2022-04-12  165  	init_attr.cap.max_send_wr = MAX_UMR_WR;
04876c12c19e94 Aharon Landau 2022-04-12  166  	init_attr.cap.max_send_sge = 1;
04876c12c19e94 Aharon Landau 2022-04-12  167  	init_attr.qp_type = MLX5_IB_QPT_REG_UMR;
04876c12c19e94 Aharon Landau 2022-04-12  168  	init_attr.port_num = 1;
638420115cc4ad Jianbo Liu    2024-06-03  169  	qp = ib_create_qp(dev->umrc.pd, &init_attr);
04876c12c19e94 Aharon Landau 2022-04-12  170  	if (IS_ERR(qp)) {
04876c12c19e94 Aharon Landau 2022-04-12  171  		mlx5_ib_dbg(dev, "Couldn't create sync UMR QP\n");
04876c12c19e94 Aharon Landau 2022-04-12  172  		ret = PTR_ERR(qp);
04876c12c19e94 Aharon Landau 2022-04-12  173  		goto destroy_cq;
04876c12c19e94 Aharon Landau 2022-04-12  174  	}
04876c12c19e94 Aharon Landau 2022-04-12  175  
04876c12c19e94 Aharon Landau 2022-04-12  176  	ret = mlx5r_umr_qp_rst2rts(dev, qp);
04876c12c19e94 Aharon Landau 2022-04-12  177  	if (ret)
04876c12c19e94 Aharon Landau 2022-04-12  178  		goto destroy_qp;
04876c12c19e94 Aharon Landau 2022-04-12  179  
04876c12c19e94 Aharon Landau 2022-04-12  180  	dev->umrc.cq = cq;
04876c12c19e94 Aharon Landau 2022-04-12  181  
04876c12c19e94 Aharon Landau 2022-04-12  182  	sema_init(&dev->umrc.sem, MAX_UMR_WR);
158e71bb69e368 Aharon Landau 2022-05-15  183  	mutex_init(&dev->umrc.lock);
9b7d4be967f16f Maor Gottlieb 2022-08-29  184  	dev->umrc.state = MLX5_UMR_STATE_ACTIVE;
638420115cc4ad Jianbo Liu    2024-06-03  185  	dev->umrc.qp = qp;
04876c12c19e94 Aharon Landau 2022-04-12  186  
638420115cc4ad Jianbo Liu    2024-06-03  187  	mutex_unlock(&dev->umrc.init_lock);
04876c12c19e94 Aharon Landau 2022-04-12  188  	return 0;
04876c12c19e94 Aharon Landau 2022-04-12  189  
04876c12c19e94 Aharon Landau 2022-04-12  190  destroy_qp:
04876c12c19e94 Aharon Landau 2022-04-12  191  	ib_destroy_qp(qp);
04876c12c19e94 Aharon Landau 2022-04-12  192  destroy_cq:
04876c12c19e94 Aharon Landau 2022-04-12  193  	ib_free_cq(cq);
638420115cc4ad Jianbo Liu    2024-06-03  194  unlock:
638420115cc4ad Jianbo Liu    2024-06-03  195  	mutex_unlock(&dev->umrc.init_lock);
04876c12c19e94 Aharon Landau 2022-04-12  196  	return ret;
04876c12c19e94 Aharon Landau 2022-04-12  197  }
04876c12c19e94 Aharon Landau 2022-04-12  198  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
