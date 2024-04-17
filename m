Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7375613D52E
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Apr 2024 13:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713359064; cv=none; b=eCoc5vG4nvA7FoAK/Dvcuft4KEkFAmyBv7HNLn2R8NyXucnFqzOzRXkhrzV/rqBRdN7J+iwHksIVLoCnPX1cKKeUa0JOAEc4jFl3emcYpBq0Z+B+3WPVscNUaSfOXEEHIwwRkWLknlMvoK9wl5kGND/5aJ5lHlJVgdJjGP8vHeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713359064; c=relaxed/simple;
	bh=PNOJmzm/rBqHEFkeUP9YFEBn7JkiQznuWb0iF4nmD8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JTK1i0souWToEs90L4j1+RSoqf5rKXoDOem/PBtAwxzDzXxpvuv3UgvAQ8hEf6/2vjgz6lUoN5TbaTdGmxoigS3lG57GwF4vozuhrINvO+NOyVph4gy2ilZWQYhuRMBa8MChB9bQ5PD3dZBmDj1y0UNse5gHkswykszpyL6OTTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gnz+QfyX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gnz+QfyX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713359059; x=1744895059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PNOJmzm/rBqHEFkeUP9YFEBn7JkiQznuWb0iF4nmD8M=;
  b=Gnz+QfyXscoVPLu0We0Sc7jkDi0r5Bv3qVkqkFrKUQZueaChCiXJoPTA
   FKMk5u/McJvWil/5Gwa/2Ii/NM7tYnNr0acZz/PxBO9vGSbwdsXp5aVb4
   /VbdX4IRc7x4iIzvbqTbCWcdQxCaCm7cn3+kjh15ZvxDHY/DhRS5HaZS7
   6IOCQdmuSIZTW+iUhZPI/fiORqcvsIFXnRlXCuHdTAsZ9TJ5K1mK4e9CZ
   f9VHj2I3nbDEUxyuQ3m28GeUbn7PrpaV7+5Tf+QYK6JJ80y2fF5n7hBtI
   lIGUx7fmjXA29f59OavR8ERe++bjeYhsIN125tO4uDOBgADfbef6lNoyG
   g==;
X-CSE-ConnectionGUID: Lhex3qXETFWwHSZn2Avcpg==
X-CSE-MsgGUID: KK1o1xKBS0CCKH5mBLM1sw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8976987"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8976987"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 06:04:18 -0700
X-CSE-ConnectionGUID: lNu6PJWCQGS+5JDzAhb9pA==
X-CSE-MsgGUID: LRPnGqitTyOFBHHXe/W6XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="22674916"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 17 Apr 2024 06:04:17 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx4xT-0006bp-02;
	Wed, 17 Apr 2024 13:04:15 +0000
Date: Wed, 17 Apr 2024 21:03:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [net-next PATCH 2/9] octeontx2-pf: RVU representor driver
Message-ID: <202404172056.MpOMwcGB-lkp@intel.com>
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
In-Reply-To: <20240416050616.6056-3-gakula@marvell.com>
References: <20240416050616.6056-3-gakula@marvell.com>
TO: Geetha sowjanya <gakula@marvell.com>
TO: netdev@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: kuba@kernel.org
CC: davem@davemloft.net
CC: pabeni@redhat.com
CC: edumazet@google.com
CC: sgoutham@marvell.com
CC: gakula@marvell.com
CC: sbhatta@marvell.com
CC: hkelam@marvell.com

Hi Geetha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Geetha-sowjanya/octeontx2-pf-Refactoring-RVU-driver/20240416-131052
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240416050616.6056-3-gakula%40marvell.com
patch subject: [net-next PATCH 2/9] octeontx2-pf: RVU representor driver
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: alpha-randconfig-r081-20240417 (https://download.01.org/0day-ci/archive/20240417/202404172056.MpOMwcGB-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404172056.MpOMwcGB-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/marvell/octeontx2/nic/rep.c:95 rvu_get_rep_cnt() warn: passing zero to 'PTR_ERR'
drivers/net/ethernet/marvell/octeontx2/nic/rep.c:140 rvu_rep_probe() warn: missing unwind goto?

Old smatch warnings:
drivers/net/ethernet/marvell/octeontx2/nic/rep.c:95 rvu_get_rep_cnt() error: uninitialized symbol 'rsp'.

vim +/PTR_ERR +95 drivers/net/ethernet/marvell/octeontx2/nic/rep.c

1e15129a77b419 Geetha sowjanya 2024-04-16   75  
1e15129a77b419 Geetha sowjanya 2024-04-16   76  static int rvu_get_rep_cnt(struct otx2_nic *priv)
1e15129a77b419 Geetha sowjanya 2024-04-16   77  {
1e15129a77b419 Geetha sowjanya 2024-04-16   78  	struct get_rep_cnt_rsp *rsp;
1e15129a77b419 Geetha sowjanya 2024-04-16   79  	struct mbox_msghdr *msghdr;
1e15129a77b419 Geetha sowjanya 2024-04-16   80  	struct msg_req *req;
1e15129a77b419 Geetha sowjanya 2024-04-16   81  	int err, rep;
1e15129a77b419 Geetha sowjanya 2024-04-16   82  
1e15129a77b419 Geetha sowjanya 2024-04-16   83  	mutex_lock(&priv->mbox.lock);
1e15129a77b419 Geetha sowjanya 2024-04-16   84  	req = otx2_mbox_alloc_msg_get_rep_cnt(&priv->mbox);
1e15129a77b419 Geetha sowjanya 2024-04-16   85  	if (!req) {
1e15129a77b419 Geetha sowjanya 2024-04-16   86  		mutex_unlock(&priv->mbox.lock);
1e15129a77b419 Geetha sowjanya 2024-04-16   87  		return -ENOMEM;
1e15129a77b419 Geetha sowjanya 2024-04-16   88  	}
1e15129a77b419 Geetha sowjanya 2024-04-16   89  	err = otx2_sync_mbox_msg(&priv->mbox);
1e15129a77b419 Geetha sowjanya 2024-04-16   90  	if (err)
1e15129a77b419 Geetha sowjanya 2024-04-16   91  		goto exit;
1e15129a77b419 Geetha sowjanya 2024-04-16   92  
1e15129a77b419 Geetha sowjanya 2024-04-16   93  	msghdr = otx2_mbox_get_rsp(&priv->mbox.mbox, 0, &req->hdr);
1e15129a77b419 Geetha sowjanya 2024-04-16   94  	if (IS_ERR(msghdr)) {
1e15129a77b419 Geetha sowjanya 2024-04-16  @95  		err = PTR_ERR(rsp);
1e15129a77b419 Geetha sowjanya 2024-04-16   96  		goto exit;
1e15129a77b419 Geetha sowjanya 2024-04-16   97  	}
1e15129a77b419 Geetha sowjanya 2024-04-16   98  
1e15129a77b419 Geetha sowjanya 2024-04-16   99  	rsp = (struct get_rep_cnt_rsp *)msghdr;
1e15129a77b419 Geetha sowjanya 2024-04-16  100  	priv->hw.tx_queues = rsp->rep_cnt;
1e15129a77b419 Geetha sowjanya 2024-04-16  101  	priv->hw.rx_queues = rsp->rep_cnt;
1e15129a77b419 Geetha sowjanya 2024-04-16  102  	priv->rep_cnt = rsp->rep_cnt;
1e15129a77b419 Geetha sowjanya 2024-04-16  103  	for (rep = 0; rep < priv->rep_cnt; rep++)
1e15129a77b419 Geetha sowjanya 2024-04-16  104  		priv->rep_pf_map[rep] = rsp->rep_pf_map[rep];
1e15129a77b419 Geetha sowjanya 2024-04-16  105  
1e15129a77b419 Geetha sowjanya 2024-04-16  106  exit:
1e15129a77b419 Geetha sowjanya 2024-04-16  107  	mutex_unlock(&priv->mbox.lock);
1e15129a77b419 Geetha sowjanya 2024-04-16  108  	return err;
1e15129a77b419 Geetha sowjanya 2024-04-16  109  }
1e15129a77b419 Geetha sowjanya 2024-04-16  110  
1e15129a77b419 Geetha sowjanya 2024-04-16  111  static int rvu_rep_probe(struct pci_dev *pdev, const struct pci_device_id *id)
1e15129a77b419 Geetha sowjanya 2024-04-16  112  {
1e15129a77b419 Geetha sowjanya 2024-04-16  113  	struct device *dev = &pdev->dev;
1e15129a77b419 Geetha sowjanya 2024-04-16  114  	struct otx2_nic *priv;
1e15129a77b419 Geetha sowjanya 2024-04-16  115  	struct otx2_hw *hw;
1e15129a77b419 Geetha sowjanya 2024-04-16  116  	int err;
1e15129a77b419 Geetha sowjanya 2024-04-16  117  
1e15129a77b419 Geetha sowjanya 2024-04-16  118  	err = pcim_enable_device(pdev);
1e15129a77b419 Geetha sowjanya 2024-04-16  119  	if (err) {
1e15129a77b419 Geetha sowjanya 2024-04-16  120  		dev_err(dev, "Failed to enable PCI device\n");
1e15129a77b419 Geetha sowjanya 2024-04-16  121  		return err;
1e15129a77b419 Geetha sowjanya 2024-04-16  122  	}
1e15129a77b419 Geetha sowjanya 2024-04-16  123  
1e15129a77b419 Geetha sowjanya 2024-04-16  124  	err = pci_request_regions(pdev, DRV_NAME);
1e15129a77b419 Geetha sowjanya 2024-04-16  125  	if (err) {
1e15129a77b419 Geetha sowjanya 2024-04-16  126  		dev_err(dev, "PCI request regions failed 0x%x\n", err);
1e15129a77b419 Geetha sowjanya 2024-04-16  127  		return err;
1e15129a77b419 Geetha sowjanya 2024-04-16  128  	}
1e15129a77b419 Geetha sowjanya 2024-04-16  129  
1e15129a77b419 Geetha sowjanya 2024-04-16  130  	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(48));
1e15129a77b419 Geetha sowjanya 2024-04-16  131  	if (err) {
1e15129a77b419 Geetha sowjanya 2024-04-16  132  		dev_err(dev, "DMA mask config failed, abort\n");
1e15129a77b419 Geetha sowjanya 2024-04-16  133  		goto err_release_regions;
1e15129a77b419 Geetha sowjanya 2024-04-16  134  	}
1e15129a77b419 Geetha sowjanya 2024-04-16  135  
1e15129a77b419 Geetha sowjanya 2024-04-16  136  	pci_set_master(pdev);
1e15129a77b419 Geetha sowjanya 2024-04-16  137  
1e15129a77b419 Geetha sowjanya 2024-04-16  138  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
1e15129a77b419 Geetha sowjanya 2024-04-16  139  	if (!priv)
1e15129a77b419 Geetha sowjanya 2024-04-16 @140  		return -ENOMEM;
1e15129a77b419 Geetha sowjanya 2024-04-16  141  	pci_set_drvdata(pdev, priv);
1e15129a77b419 Geetha sowjanya 2024-04-16  142  	priv->pdev = pdev;
1e15129a77b419 Geetha sowjanya 2024-04-16  143  	priv->dev = dev;
1e15129a77b419 Geetha sowjanya 2024-04-16  144  	priv->flags |= OTX2_FLAG_INTF_DOWN;
1e15129a77b419 Geetha sowjanya 2024-04-16  145  	priv->flags |= OTX2_FLAG_REP_MODE_ENABLED;
1e15129a77b419 Geetha sowjanya 2024-04-16  146  
1e15129a77b419 Geetha sowjanya 2024-04-16  147  	hw = &priv->hw;
1e15129a77b419 Geetha sowjanya 2024-04-16  148  	hw->pdev = pdev;
1e15129a77b419 Geetha sowjanya 2024-04-16  149  	hw->max_queues = OTX2_MAX_CQ_CNT;
1e15129a77b419 Geetha sowjanya 2024-04-16  150  	hw->rbuf_len = OTX2_DEFAULT_RBUF_LEN;
1e15129a77b419 Geetha sowjanya 2024-04-16  151  	hw->xqe_size = 128;
1e15129a77b419 Geetha sowjanya 2024-04-16  152  
1e15129a77b419 Geetha sowjanya 2024-04-16  153  	err = otx2_init_rsrc(pdev, priv);
1e15129a77b419 Geetha sowjanya 2024-04-16  154  	if (err)
1e15129a77b419 Geetha sowjanya 2024-04-16  155  		goto err_release_regions;
1e15129a77b419 Geetha sowjanya 2024-04-16  156  
1e15129a77b419 Geetha sowjanya 2024-04-16  157  	err = rvu_get_rep_cnt(priv);
1e15129a77b419 Geetha sowjanya 2024-04-16  158  	if (err)
1e15129a77b419 Geetha sowjanya 2024-04-16  159  		goto err_detach_rsrc;
1e15129a77b419 Geetha sowjanya 2024-04-16  160  
1e15129a77b419 Geetha sowjanya 2024-04-16  161  	err = rvu_rep_rsrc_init(priv);
1e15129a77b419 Geetha sowjanya 2024-04-16  162  	if (err)
1e15129a77b419 Geetha sowjanya 2024-04-16  163  		goto err_detach_rsrc;
1e15129a77b419 Geetha sowjanya 2024-04-16  164  
1e15129a77b419 Geetha sowjanya 2024-04-16  165  	return 0;
1e15129a77b419 Geetha sowjanya 2024-04-16  166  
1e15129a77b419 Geetha sowjanya 2024-04-16  167  err_detach_rsrc:
1e15129a77b419 Geetha sowjanya 2024-04-16  168  	if (priv->hw.lmt_info)
1e15129a77b419 Geetha sowjanya 2024-04-16  169  		free_percpu(priv->hw.lmt_info);
1e15129a77b419 Geetha sowjanya 2024-04-16  170  	if (test_bit(CN10K_LMTST, &priv->hw.cap_flag))
1e15129a77b419 Geetha sowjanya 2024-04-16  171  		qmem_free(priv->dev, priv->dync_lmt);
1e15129a77b419 Geetha sowjanya 2024-04-16  172  	otx2_detach_resources(&priv->mbox);
1e15129a77b419 Geetha sowjanya 2024-04-16  173  	otx2_disable_mbox_intr(priv);
1e15129a77b419 Geetha sowjanya 2024-04-16  174  	otx2_pfaf_mbox_destroy(priv);
1e15129a77b419 Geetha sowjanya 2024-04-16  175  	pci_free_irq_vectors(pdev);
1e15129a77b419 Geetha sowjanya 2024-04-16  176  err_release_regions:
1e15129a77b419 Geetha sowjanya 2024-04-16  177  	pci_set_drvdata(pdev, NULL);
1e15129a77b419 Geetha sowjanya 2024-04-16  178  	pci_release_regions(pdev);
1e15129a77b419 Geetha sowjanya 2024-04-16  179  	return err;
1e15129a77b419 Geetha sowjanya 2024-04-16  180  }
1e15129a77b419 Geetha sowjanya 2024-04-16  181  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
