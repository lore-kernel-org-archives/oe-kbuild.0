Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2B777102
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jul 2024 12:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720268330; cv=none; b=Ieodapdugwktf+H90zawpLO1XkrUEmHNu1pgFNcaXCpvNIJEM/mjkI9gEPk/fyKNTGnxsiKAAnOqWVtnOmwXiCsvdTZovh1rOVjdYToCg64YFLSLmuPBt2ftFomssyjlUN6vy1+b2QWJ8eM6Q9ZVLTL7vXLqP/3X51bE+kbWXyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720268330; c=relaxed/simple;
	bh=a0jZri1wdZzLmX6zQEisYNhlCCDfp3kLIrrfuvurL3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lj1IcxNnIivl+kF+mhIKk4aqf+0nRi2okMJsEx96sIo1pDjr6dPoeZmrIt0xkWmEa0MrGui4njOD6rPDakDIg296SEfM814KXT6buF1uhK3cYiO6IKbj7KaJkRIHyrghXO9LE6zb5OmPdW25YG6SK2ngwKI/K6ImrCHrB/ayFo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxP1zN74; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxP1zN74"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720268329; x=1751804329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a0jZri1wdZzLmX6zQEisYNhlCCDfp3kLIrrfuvurL3w=;
  b=cxP1zN74nqRqZh9DYCvRdGY4OljtgyR+Ba1yWE7EX5nUSP6pG7yTVARS
   NMSSKvNCY58QePhz3+ydV1IOJ79XpruKYFAXbj990pCtNRUfbNARF18Jw
   t40IWjpdZoWY4DZUk6Tg3GdRam/WtK0GXtXH88v32xJN89roASB0I7Zhk
   57SY/TSZDTXvm5/hcysknPzdp4l1s2a33Bzs3q00r7A8t0EzSzBSnSrog
   SZRHH5BTXMM6MTg7x2axEN8TmJHHqaHpgndRDX3uigxP7mbwmYTlwAIrS
   ZoAR6WbOPLRtGMqW6rRJP2pb+sjVL5DcPncnwFH1LXQ7rijB6QOlLLFEe
   A==;
X-CSE-ConnectionGUID: cwzldB25SkS1MXvY70CaIQ==
X-CSE-MsgGUID: E+UUcm3mTm2HOj764PNpeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17740379"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="17740379"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 05:18:48 -0700
X-CSE-ConnectionGUID: O/C/gEVOS6iFM8aU0oZ6dQ==
X-CSE-MsgGUID: ROOHIyM1RHaStGvpMbySFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="46847116"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Jul 2024 05:18:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQ4NI-000TlW-11;
	Sat, 06 Jul 2024 12:18:44 +0000
Date: Sat, 6 Jul 2024 20:18:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5300/10451] drivers/infiniband/hw/mlx5/umr.c:153
 mlx5r_umr_resource_init() warn: missing error code 'ret'
Message-ID: <202407062041.Mf6y04U0-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jianbo Liu <jianbol@nvidia.com>
CC: Leon Romanovsky <leon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: 638420115cc4ad6c3a2683bf46a052b505abb202 [5300/10451] IB/mlx5: Create UMR QP just before first reg_mr occurs
:::::: branch date: 3 days ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-161-20240706 (https://download.01.org/0day-ci/archive/20240706/202407062041.Mf6y04U0-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407062041.Mf6y04U0-lkp@intel.com/

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
