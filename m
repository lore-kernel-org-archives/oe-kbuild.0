Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF91D280332
	for <oe-kbuild@lists.linux.dev>; Tue, 27 May 2025 17:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368701; cv=none; b=DO/NZ1uCeiGaYtE8juNbPRaduc/5MotpxtOzCeWH5pjoZTC2ubGRatTFEldeIPy5xAzPxcO1IWBhUCIb79U7LncjXOly6o/1Sk2QeptXItFR9NucCzdh0kWcQsWF6geQsu0qcX2HeISslVFPlG7tBhXODxQCakYQn/JR+zNZtNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368701; c=relaxed/simple;
	bh=aJjEJKr0mHtVAObJayp/5SWAalUV4jA6JLlFLp7RUR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JkoyD+ayP5PhtSOQwc3hYYSk8tpfScefTEKd1aHwo5r/ewmJXGaEjorw97F+rJJG27JTZGHzAS2/+dqtNno+yGbUtaLcBpaJ9qzEt8LOb4uTIKhNxwa+ywuHmWHP9La/tbBFkuGGMQ9PMU9onCMToG9jhEpbNQHubOtjz9VYE6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FsJAhmBV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FsJAhmBV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748368700; x=1779904700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aJjEJKr0mHtVAObJayp/5SWAalUV4jA6JLlFLp7RUR4=;
  b=FsJAhmBVdX6PR1rfY3RcHgT5TrmSZJowivkk2RuE/YGB3f6E/a6zk6lP
   sJM3BaLk9YNTKxCUXX5FQ6YUIZWOX+ampRr1W+z3hT1WO33hQrjNFY5N4
   MejRexgbLeNbucjwASSWvUZKEAaqTxtl7SfcyCtaWlQrTHncxCyIhHNmf
   J6pbEdcg4kUHKs09lsYAWfCz2h6w/PNZlBC/ZZN9Laq/hZLD0x0KTOtYo
   oPtTGKO4oLEFqpYCc+Y3Fa6Hqad06oS2w7jpF/5ScOYHxZdhoD1Tfihgr
   DTrsTqMRr8ZLfqhYrU33OsMv8khC30k2kkL+xdb6LBmH/H4REXjOz/CJ2
   A==;
X-CSE-ConnectionGUID: ZAROjd2UTB2sWPpSEQ7pog==
X-CSE-MsgGUID: C/RQn9KUTeekM09XwvW7Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50429294"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="50429294"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 10:58:15 -0700
X-CSE-ConnectionGUID: G5ynpnQBTUWA7DRnrYf4Rw==
X-CSE-MsgGUID: iNGItO3NRl661pcZLhqwpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="142747897"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 May 2025 10:58:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJyZ1-000Up2-2n;
	Tue, 27 May 2025 17:58:11 +0000
Date: Wed, 28 May 2025 01:57:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma/idxd/init.c:227 idxd_setup_wqs() error: uninitialized
 symbol 'conf_dev'.
Message-ID: <202505280104.d7OKH0O1-lkp@intel.com>
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
TO: Shuai Xue <xueshuai@linux.alibaba.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Dave Jiang <dave.jiang@intel.com>
CC: Fenghua Yu <fenghuay@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   44ed0f35df343d00b8d38006854f96e333104a66
commit: 3fd2f4bc010cdfbc07dd21018dc65bd9370eb7a4 dmaengine: idxd: fix memory leak in error handling path of idxd_setup_wqs
date:   13 days ago
:::::: branch date: 2 hours ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-161-20250527 (https://download.01.org/0day-ci/archive/20250528/202505280104.d7OKH0O1-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505280104.d7OKH0O1-lkp@intel.com/

smatch warnings:
drivers/dma/idxd/init.c:227 idxd_setup_wqs() error: uninitialized symbol 'conf_dev'.

vim +/conf_dev +227 drivers/dma/idxd/init.c

ddf742d4f3f12a Dave Jiang       2021-05-25  157  
7c5dd23e57c14c Dave Jiang       2021-04-15  158  static int idxd_setup_wqs(struct idxd_device *idxd)
7c5dd23e57c14c Dave Jiang       2021-04-15  159  {
7c5dd23e57c14c Dave Jiang       2021-04-15  160  	struct device *dev = &idxd->pdev->dev;
7c5dd23e57c14c Dave Jiang       2021-04-15  161  	struct idxd_wq *wq;
700af3a0a26cba Dave Jiang       2021-07-15  162  	struct device *conf_dev;
7c5dd23e57c14c Dave Jiang       2021-04-15  163  	int i, rc;
7c5dd23e57c14c Dave Jiang       2021-04-15  164  
7c5dd23e57c14c Dave Jiang       2021-04-15  165  	idxd->wqs = kcalloc_node(idxd->max_wqs, sizeof(struct idxd_wq *),
7c5dd23e57c14c Dave Jiang       2021-04-15  166  				 GFP_KERNEL, dev_to_node(dev));
7c5dd23e57c14c Dave Jiang       2021-04-15  167  	if (!idxd->wqs)
7c5dd23e57c14c Dave Jiang       2021-04-15  168  		return -ENOMEM;
7c5dd23e57c14c Dave Jiang       2021-04-15  169  
de5819b9948931 Jerry Snitselaar 2022-09-28  170  	idxd->wq_enable_map = bitmap_zalloc_node(idxd->max_wqs, GFP_KERNEL, dev_to_node(dev));
de5819b9948931 Jerry Snitselaar 2022-09-28  171  	if (!idxd->wq_enable_map) {
3fd2f4bc010cdf Shuai Xue        2025-04-04  172  		rc = -ENOMEM;
3fd2f4bc010cdf Shuai Xue        2025-04-04  173  		goto err_bitmap;
de5819b9948931 Jerry Snitselaar 2022-09-28  174  	}
de5819b9948931 Jerry Snitselaar 2022-09-28  175  
7c5dd23e57c14c Dave Jiang       2021-04-15  176  	for (i = 0; i < idxd->max_wqs; i++) {
7c5dd23e57c14c Dave Jiang       2021-04-15  177  		wq = kzalloc_node(sizeof(*wq), GFP_KERNEL, dev_to_node(dev));
7c5dd23e57c14c Dave Jiang       2021-04-15  178  		if (!wq) {
7c5dd23e57c14c Dave Jiang       2021-04-15  179  			rc = -ENOMEM;
7c5dd23e57c14c Dave Jiang       2021-04-15  180  			goto err;
7c5dd23e57c14c Dave Jiang       2021-04-15  181  		}
7c5dd23e57c14c Dave Jiang       2021-04-15  182  
700af3a0a26cba Dave Jiang       2021-07-15  183  		idxd_dev_set_type(&wq->idxd_dev, IDXD_DEV_WQ);
700af3a0a26cba Dave Jiang       2021-07-15  184  		conf_dev = wq_confdev(wq);
7c5dd23e57c14c Dave Jiang       2021-04-15  185  		wq->id = i;
7c5dd23e57c14c Dave Jiang       2021-04-15  186  		wq->idxd = idxd;
700af3a0a26cba Dave Jiang       2021-07-15  187  		device_initialize(wq_confdev(wq));
700af3a0a26cba Dave Jiang       2021-07-15  188  		conf_dev->parent = idxd_confdev(idxd);
700af3a0a26cba Dave Jiang       2021-07-15  189  		conf_dev->bus = &dsa_bus_type;
700af3a0a26cba Dave Jiang       2021-07-15  190  		conf_dev->type = &idxd_wq_device_type;
700af3a0a26cba Dave Jiang       2021-07-15  191  		rc = dev_set_name(conf_dev, "wq%d.%d", idxd->id, wq->id);
3fd2f4bc010cdf Shuai Xue        2025-04-04  192  		if (rc < 0)
7c5dd23e57c14c Dave Jiang       2021-04-15  193  			goto err;
7c5dd23e57c14c Dave Jiang       2021-04-15  194  
7c5dd23e57c14c Dave Jiang       2021-04-15  195  		mutex_init(&wq->wq_lock);
04922b7445a195 Dave Jiang       2021-04-15  196  		init_waitqueue_head(&wq->err_queue);
93a40a6d742892 Dave Jiang       2021-04-20  197  		init_completion(&wq->wq_dead);
56fc39f5a36794 Dave Jiang       2021-10-26  198  		init_completion(&wq->wq_resurrect);
92452a72ebdf12 Dave Jiang       2021-10-26  199  		wq->max_xfer_bytes = WQ_DEFAULT_MAX_XFER;
e8dbd6445dd6b3 Xiaochen Shen    2022-10-01  200  		idxd_wq_set_max_batch_size(idxd->data->type, wq, WQ_DEFAULT_MAX_BATCH);
7930d85535751b Dave Jiang       2021-11-29  201  		wq->enqcmds_retries = IDXD_ENQCMDS_RETRIES;
7c5dd23e57c14c Dave Jiang       2021-04-15  202  		wq->wqcfg = kzalloc_node(idxd->wqcfg_size, GFP_KERNEL, dev_to_node(dev));
7c5dd23e57c14c Dave Jiang       2021-04-15  203  		if (!wq->wqcfg) {
7c5dd23e57c14c Dave Jiang       2021-04-15  204  			rc = -ENOMEM;
7c5dd23e57c14c Dave Jiang       2021-04-15  205  			goto err;
7c5dd23e57c14c Dave Jiang       2021-04-15  206  		}
b0325aefd398d8 Dave Jiang       2022-09-17  207  
b0325aefd398d8 Dave Jiang       2022-09-17  208  		if (idxd->hw.wq_cap.op_config) {
b0325aefd398d8 Dave Jiang       2022-09-17  209  			wq->opcap_bmap = bitmap_zalloc(IDXD_MAX_OPCAP_BITS, GFP_KERNEL);
b0325aefd398d8 Dave Jiang       2022-09-17  210  			if (!wq->opcap_bmap) {
b0325aefd398d8 Dave Jiang       2022-09-17  211  				rc = -ENOMEM;
3fd2f4bc010cdf Shuai Xue        2025-04-04  212  				goto err_opcap_bmap;
b0325aefd398d8 Dave Jiang       2022-09-17  213  			}
b0325aefd398d8 Dave Jiang       2022-09-17  214  			bitmap_copy(wq->opcap_bmap, idxd->opcap_bmap, IDXD_MAX_OPCAP_BITS);
b0325aefd398d8 Dave Jiang       2022-09-17  215  		}
b022f59725f0ae Fenghua Yu       2023-04-07  216  		mutex_init(&wq->uc_lock);
b022f59725f0ae Fenghua Yu       2023-04-07  217  		xa_init(&wq->upasid_xa);
7c5dd23e57c14c Dave Jiang       2021-04-15  218  		idxd->wqs[i] = wq;
7c5dd23e57c14c Dave Jiang       2021-04-15  219  	}
7c5dd23e57c14c Dave Jiang       2021-04-15  220  
7c5dd23e57c14c Dave Jiang       2021-04-15  221  	return 0;
7c5dd23e57c14c Dave Jiang       2021-04-15  222  
3fd2f4bc010cdf Shuai Xue        2025-04-04  223  err_opcap_bmap:
3fd2f4bc010cdf Shuai Xue        2025-04-04  224  	kfree(wq->wqcfg);
3fd2f4bc010cdf Shuai Xue        2025-04-04  225  
7c5dd23e57c14c Dave Jiang       2021-04-15  226  err:
3fd2f4bc010cdf Shuai Xue        2025-04-04 @227  	put_device(conf_dev);
3fd2f4bc010cdf Shuai Xue        2025-04-04  228  	kfree(wq);
3fd2f4bc010cdf Shuai Xue        2025-04-04  229  
700af3a0a26cba Dave Jiang       2021-07-15  230  	while (--i >= 0) {
700af3a0a26cba Dave Jiang       2021-07-15  231  		wq = idxd->wqs[i];
3fd2f4bc010cdf Shuai Xue        2025-04-04  232  		if (idxd->hw.wq_cap.op_config)
3fd2f4bc010cdf Shuai Xue        2025-04-04  233  			bitmap_free(wq->opcap_bmap);
3fd2f4bc010cdf Shuai Xue        2025-04-04  234  		kfree(wq->wqcfg);
700af3a0a26cba Dave Jiang       2021-07-15  235  		conf_dev = wq_confdev(wq);
700af3a0a26cba Dave Jiang       2021-07-15  236  		put_device(conf_dev);
3fd2f4bc010cdf Shuai Xue        2025-04-04  237  		kfree(wq);
3fd2f4bc010cdf Shuai Xue        2025-04-04  238  
700af3a0a26cba Dave Jiang       2021-07-15  239  	}
3fd2f4bc010cdf Shuai Xue        2025-04-04  240  	bitmap_free(idxd->wq_enable_map);
3fd2f4bc010cdf Shuai Xue        2025-04-04  241  
3fd2f4bc010cdf Shuai Xue        2025-04-04  242  err_bitmap:
3fd2f4bc010cdf Shuai Xue        2025-04-04  243  	kfree(idxd->wqs);
3fd2f4bc010cdf Shuai Xue        2025-04-04  244  
7c5dd23e57c14c Dave Jiang       2021-04-15  245  	return rc;
7c5dd23e57c14c Dave Jiang       2021-04-15  246  }
7c5dd23e57c14c Dave Jiang       2021-04-15  247  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
