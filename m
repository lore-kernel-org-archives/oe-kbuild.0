Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C564A77112
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Sep 2024 16:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727194771; cv=none; b=D/FAvTKo4A2uPKs+sTx1QvcFWQJCHpLLtR4IINyj49ezoaMHMQNd4eHm5vUl4c9r30HjgkAyPadk9LAeQ8K4r2ONrl/6Tqhmrztf+/3GY+kOAMrTJXxWVEh11uJDgrSu+SPkNVjHxrIPhR9lWSzQqwxbs8aB7coglQ+T3ObrNgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727194771; c=relaxed/simple;
	bh=xlnWsgkB4Fjm27GyncPm510ohWlTizo3hPMNr/epkVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=md7PElLZ77v2e1i/zCARU/uMwrRmfBllLnmowjG0Tv5iprXpxZsq9sEwHk6f9OkBT2Bk1/gqk2TANbhIwbPdhQp4sH90q+guGokuGD2qxodm76bFW6ZRYO+qFYPxg54JwXXCJiki0UeSW5IEX7vCQ678i7UDWIABVNR4Ye0yzk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B2ML/jXz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B2ML/jXz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727194769; x=1758730769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xlnWsgkB4Fjm27GyncPm510ohWlTizo3hPMNr/epkVU=;
  b=B2ML/jXzrF9WVllZdnGLghWaB1a6L3TZCj69HNqj/uCZTMNLq0HKDtAF
   sVzqqpOomKhjXGwzZzjC4ZArHOmke/Ss7fn+jRAeD9l3Lk0hcRTHAarvO
   50iTSfmhrT/ARKS8IC0W7CH4XJ6MBEGw8PWZ4vQyF7EfkhFSnoJ77qd6w
   T4H/5/N8ipa2N0d9nGhk3Yh5uwS+U12GGJCnlQLmUkIC0zpQ6vbyn1UpR
   hChEMAxrcVqLMCol9ZZ33qSMsrZCQLmxQr+2aa3GVjaDzNamECHDYosSM
   u7UBBXzjUtoeA66/ArYaWSRObrWcor1tQUG32r4hYRyUBiV58mGF0Qc14
   Q==;
X-CSE-ConnectionGUID: xXD4bs+gTSOjn+AsgV2wQQ==
X-CSE-MsgGUID: 6qduRV+JT/Ce4ufoygK5zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="36771140"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="36771140"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 09:19:29 -0700
X-CSE-ConnectionGUID: M/KjBZ0UQHe4cj9o0lYjcw==
X-CSE-MsgGUID: jUS4fWL5RTO8ORklb3iQGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="94793367"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Sep 2024 09:19:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st8G4-000IYj-2M;
	Tue, 24 Sep 2024 16:19:24 +0000
Date: Wed, 25 Sep 2024 00:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/infiniband/hw/mlx5/umr.c:153 mlx5r_umr_resource_init() warn:
 missing error code 'ret'
Message-ID: <202409250005.68tjtZiT-lkp@intel.com>
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
head:   abf2050f51fdca0fd146388f83cddd95a57a008d
commit: 638420115cc4ad6c3a2683bf46a052b505abb202 IB/mlx5: Create UMR QP just before first reg_mr occurs
date:   3 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 months ago
config: powerpc64-randconfig-r071-20240924 (https://download.01.org/0day-ci/archive/20240925/202409250005.68tjtZiT-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409250005.68tjtZiT-lkp@intel.com/

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
