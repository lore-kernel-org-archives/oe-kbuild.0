Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2738F5F
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Sep 2023 10:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696068148; x=1727604148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DNKJPeL11iqE96nE8dnDFOWziacMZLryJboR9tPyJ3U=;
  b=f0yHTwCrpz57k7fQgW9YM/UeW2oFXmMYj/M2/n5YBjgyHNs/ZRizjlyt
   MMO3bXOo3uD4dizamZccjuUAICivt+0JeNXLn9AXvWw/wlVel99dNfLAf
   JJMPn2Igi6v0Aqq/iTGmtKa9ZiluyQMYwn9ROoHSFq3LQ/yORRjT1BWc/
   mPAYhiPSGPytOsTzOHMhp1h0tbIagotD8NpYF7g8WkSdr/qnoSbC3hof+
   Cy+bu8qi/oURiNPENJNr2OIiyo0G62ipw5nh+sR1w1qEPApxJEqIngJi9
   03c/9qhM80Z28W/oePMWo2sfIzmXxFpcbicxq7ojRqB+dzvZ/tE3xyHRO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="385263583"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="385263583"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 03:02:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="923807244"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="923807244"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 30 Sep 2023 03:02:26 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmWnn-00040V-2k;
	Sat, 30 Sep 2023 10:02:23 +0000
Date: Sat, 30 Sep 2023 18:02:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/broadcom/bnxt/bnxt_ulp.c:415
 bnxt_rdma_aux_device_init() warn: possible memory leak of 'edev'
Message-ID: <202309301712.5srMAyFC-lkp@intel.com>
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
TO: Ajit Khaparde <ajit.khaparde@broadcom.com>
CC: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f3ebbef746f89f860a90ced99a359202ea86fde
commit: 30343221132430c24b468493c861f71e2bad131f bnxt_en: Remove runtime interrupt vector allocation
date:   8 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161-20230930 (https://download.01.org/0day-ci/archive/20230930/202309301712.5srMAyFC-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230930/202309301712.5srMAyFC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309301712.5srMAyFC-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/broadcom/bnxt/bnxt_ulp.c:415 bnxt_rdma_aux_device_init() warn: possible memory leak of 'edev'

vim +/edev +415 drivers/net/ethernet/broadcom/bnxt/bnxt_ulp.c

d80d88b0dfff58 Ajit Khaparde 2022-03-06  348  
d80d88b0dfff58 Ajit Khaparde 2022-03-06  349  void bnxt_rdma_aux_device_init(struct bnxt *bp)
d80d88b0dfff58 Ajit Khaparde 2022-03-06  350  {
d80d88b0dfff58 Ajit Khaparde 2022-03-06  351  	struct auxiliary_device *aux_dev;
d80d88b0dfff58 Ajit Khaparde 2022-03-06  352  	struct bnxt_aux_priv *aux_priv;
d80d88b0dfff58 Ajit Khaparde 2022-03-06  353  	struct bnxt_en_dev *edev;
30343221132430 Ajit Khaparde 2022-12-12  354  	struct bnxt_ulp *ulp;
d80d88b0dfff58 Ajit Khaparde 2022-03-06  355  	int rc;
d80d88b0dfff58 Ajit Khaparde 2022-03-06  356  
d80d88b0dfff58 Ajit Khaparde 2022-03-06  357  	if (!(bp->flags & BNXT_FLAG_ROCE_CAP))
d80d88b0dfff58 Ajit Khaparde 2022-03-06  358  		return;
d80d88b0dfff58 Ajit Khaparde 2022-03-06  359  
d80d88b0dfff58 Ajit Khaparde 2022-03-06  360  	bp->aux_priv = kzalloc(sizeof(*bp->aux_priv), GFP_KERNEL);
d80d88b0dfff58 Ajit Khaparde 2022-03-06  361  	if (!bp->aux_priv)
d80d88b0dfff58 Ajit Khaparde 2022-03-06  362  		goto exit;
d80d88b0dfff58 Ajit Khaparde 2022-03-06  363  
d80d88b0dfff58 Ajit Khaparde 2022-03-06  364  	bp->aux_priv->id = ida_alloc(&bnxt_aux_dev_ids, GFP_KERNEL);
d80d88b0dfff58 Ajit Khaparde 2022-03-06  365  	if (bp->aux_priv->id < 0) {
d80d88b0dfff58 Ajit Khaparde 2022-03-06  366  		netdev_warn(bp->dev,
d80d88b0dfff58 Ajit Khaparde 2022-03-06  367  			    "ida alloc failed for ROCE auxiliary device\n");
d80d88b0dfff58 Ajit Khaparde 2022-03-06  368  		kfree(bp->aux_priv);
d80d88b0dfff58 Ajit Khaparde 2022-03-06  369  		goto exit;
d80d88b0dfff58 Ajit Khaparde 2022-03-06  370  	}
d80d88b0dfff58 Ajit Khaparde 2022-03-06  371  
d80d88b0dfff58 Ajit Khaparde 2022-03-06  372  	aux_priv = bp->aux_priv;
d80d88b0dfff58 Ajit Khaparde 2022-03-06  373  	aux_dev = &aux_priv->aux_dev;
d80d88b0dfff58 Ajit Khaparde 2022-03-06  374  	aux_dev->id = aux_priv->id;
d80d88b0dfff58 Ajit Khaparde 2022-03-06  375  	aux_dev->name = "rdma";
d80d88b0dfff58 Ajit Khaparde 2022-03-06  376  	aux_dev->dev.parent = &bp->pdev->dev;
d80d88b0dfff58 Ajit Khaparde 2022-03-06  377  	aux_dev->dev.release = bnxt_aux_dev_release;
d80d88b0dfff58 Ajit Khaparde 2022-03-06  378  
d80d88b0dfff58 Ajit Khaparde 2022-03-06  379  	rc = auxiliary_device_init(aux_dev);
d80d88b0dfff58 Ajit Khaparde 2022-03-06  380  	if (rc) {
d80d88b0dfff58 Ajit Khaparde 2022-03-06  381  		ida_free(&bnxt_aux_dev_ids, bp->aux_priv->id);
d80d88b0dfff58 Ajit Khaparde 2022-03-06  382  		kfree(bp->aux_priv);
d80d88b0dfff58 Ajit Khaparde 2022-03-06  383  		goto exit;
d80d88b0dfff58 Ajit Khaparde 2022-03-06  384  	}
d80d88b0dfff58 Ajit Khaparde 2022-03-06  385  
d80d88b0dfff58 Ajit Khaparde 2022-03-06  386  	/* From this point, all cleanup will happen via the .release callback &
d80d88b0dfff58 Ajit Khaparde 2022-03-06  387  	 * any error unwinding will need to include a call to
d80d88b0dfff58 Ajit Khaparde 2022-03-06  388  	 * auxiliary_device_uninit.
d80d88b0dfff58 Ajit Khaparde 2022-03-06  389  	 */
d80d88b0dfff58 Ajit Khaparde 2022-03-06  390  	edev = kzalloc(sizeof(*edev), GFP_KERNEL);
d80d88b0dfff58 Ajit Khaparde 2022-03-06  391  	if (!edev)
d80d88b0dfff58 Ajit Khaparde 2022-03-06  392  		goto aux_dev_uninit;
d80d88b0dfff58 Ajit Khaparde 2022-03-06  393  
30343221132430 Ajit Khaparde 2022-12-12  394  	ulp = kzalloc(sizeof(*ulp), GFP_KERNEL);
30343221132430 Ajit Khaparde 2022-12-12  395  	if (!ulp)
30343221132430 Ajit Khaparde 2022-12-12  396  		goto aux_dev_uninit;
30343221132430 Ajit Khaparde 2022-12-12  397  
30343221132430 Ajit Khaparde 2022-12-12  398  	edev->ulp_tbl = ulp;
d80d88b0dfff58 Ajit Khaparde 2022-03-06  399  	aux_priv->edev = edev;
d80d88b0dfff58 Ajit Khaparde 2022-03-06  400  	bp->edev = edev;
d80d88b0dfff58 Ajit Khaparde 2022-03-06  401  	bnxt_set_edev_info(edev, bp);
d80d88b0dfff58 Ajit Khaparde 2022-03-06  402  
d80d88b0dfff58 Ajit Khaparde 2022-03-06  403  	rc = auxiliary_device_add(aux_dev);
d80d88b0dfff58 Ajit Khaparde 2022-03-06  404  	if (rc) {
d80d88b0dfff58 Ajit Khaparde 2022-03-06  405  		netdev_warn(bp->dev,
d80d88b0dfff58 Ajit Khaparde 2022-03-06  406  			    "Failed to add auxiliary device for ROCE\n");
d80d88b0dfff58 Ajit Khaparde 2022-03-06  407  		goto aux_dev_uninit;
d80d88b0dfff58 Ajit Khaparde 2022-03-06  408  	}
d80d88b0dfff58 Ajit Khaparde 2022-03-06  409  
d80d88b0dfff58 Ajit Khaparde 2022-03-06  410  	return;
d80d88b0dfff58 Ajit Khaparde 2022-03-06  411  
d80d88b0dfff58 Ajit Khaparde 2022-03-06  412  aux_dev_uninit:
d80d88b0dfff58 Ajit Khaparde 2022-03-06  413  	auxiliary_device_uninit(aux_dev);
d80d88b0dfff58 Ajit Khaparde 2022-03-06  414  exit:
d80d88b0dfff58 Ajit Khaparde 2022-03-06 @415  	bp->flags &= ~BNXT_FLAG_ROCE_CAP;

:::::: The code at line 415 was first introduced by commit
:::::: d80d88b0dfff5829ab31030692672ba6fe9cde48 bnxt_en: Add auxiliary driver support

:::::: TO: Ajit Khaparde <ajit.khaparde@broadcom.com>
:::::: CC: Ajit Khaparde <ajit.khaparde@broadcom.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
