Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2852F2E
	for <oe-kbuild@lists.linux.dev>; Sun, 11 May 2025 03:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746935645; cv=none; b=STQp9SXsAraQU2yt7L2tXyWp6cgidOuhW0/fqax/lqkIruGYetNCHg392uK3T8crKEk9pQle0vSJnyeOfpAzzwjrZXSVKfBAhyBm830aDy8USAdwPwY+Siak8kS8s/n+KJ8Lu+nZyqUvxoKJm+4wihX9gpdo5wtATbkktWXiDV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746935645; c=relaxed/simple;
	bh=9//mQO1z/aWNLG5b1/5pAKVcUkMCMcCeNfF201WlaKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EFhmjZIs+Ix8Pc+dE/buiQYA6vQgAUlzRV7KxUkWvpfmSwlQ2NXtns3MMF7cTkkoL/clKHHKMestvSKpPmdrdWUfKUrbndMZNyenarEbYW/7L9yQpxlHh7/6BQct4lGe6IScZxVALt9pITFbEEKwzUpA31XWw+w2VetrPsLEJAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mLsaJ5IE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mLsaJ5IE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746935644; x=1778471644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9//mQO1z/aWNLG5b1/5pAKVcUkMCMcCeNfF201WlaKY=;
  b=mLsaJ5IEi2XmyE8e5A76a9Q89eQOiDANAU60qlkhoHoahvnkEHGBA+TK
   t1eGasUGPhT5XkwYK3YzF+mwU3Cxq05OtMN4wBT3cqqTX8joCfQHmKpQ5
   lOwNoD/snv12AIuy507KaueJrBsf21+s2hZkWWoHuXXBWSH9K4dVMF6/X
   XFmeHQ7xFJhfukd2THWFtc97seg2HBHRUxvhSABDHjB4GL0J2orXf+gbV
   fdS+4xgrIBlbPrJDuRGTy6ITOTAoITAnsu/QHMHy/vA2uWavbF7bctX/r
   8XjX2MoQfmVJmZBPuXEjvve1NV/RPP4PYxn2bIdXKId72wA2jrO26YJux
   Q==;
X-CSE-ConnectionGUID: S5ZaO7CAQCWZEEp5J60m9Q==
X-CSE-MsgGUID: G5KdNdNFQ9eyd05VUN48wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="48860127"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="48860127"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 20:54:03 -0700
X-CSE-ConnectionGUID: e1izJNOiQqSO/o9QaqPC9A==
X-CSE-MsgGUID: 77fw5RoGT0S4x6IurUSFeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="142132019"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 May 2025 20:54:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDxlH-000DZb-2W;
	Sun, 11 May 2025 03:53:59 +0000
Date: Sun, 11 May 2025 11:53:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6048/10031]
 drivers/mtd/nand/raw/loongson1-nand-controller.c:374
 ls1x_nand_dma_transfer() warn: passing zero to 'PTR_ERR'
Message-ID: <202505111115.FfRZilcq-lkp@intel.com>
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
TO: Keguang Zhang <keguang.zhang@gmail.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed61cb3d78d585209ec775933078e268544fe9a4
commit: d2d10ede04b1671dc4762479a2d06f183aaafbba [6048/10031] mtd: rawnand: Add Loongson-1 NAND Controller Driver
:::::: branch date: 2 days ago
:::::: commit date: 13 days ago
config: microblaze-randconfig-r072-20250511 (https://download.01.org/0day-ci/archive/20250511/202505111115.FfRZilcq-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505111115.FfRZilcq-lkp@intel.com/

smatch warnings:
drivers/mtd/nand/raw/loongson1-nand-controller.c:374 ls1x_nand_dma_transfer() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +374 drivers/mtd/nand/raw/loongson1-nand-controller.c

d2d10ede04b1671 Keguang Zhang 2025-03-20  341  
d2d10ede04b1671 Keguang Zhang 2025-03-20  342  static int ls1x_nand_dma_transfer(struct ls1x_nand_host *host, struct ls1x_nand_op *op)
d2d10ede04b1671 Keguang Zhang 2025-03-20  343  {
d2d10ede04b1671 Keguang Zhang 2025-03-20  344  	struct nand_chip *chip = &host->chip;
d2d10ede04b1671 Keguang Zhang 2025-03-20  345  	struct dma_chan *chan = host->dma_chan;
d2d10ede04b1671 Keguang Zhang 2025-03-20  346  	struct device *dev = chan->device->dev;
d2d10ede04b1671 Keguang Zhang 2025-03-20  347  	struct dma_async_tx_descriptor *desc;
d2d10ede04b1671 Keguang Zhang 2025-03-20  348  	enum dma_data_direction data_dir = op->is_write ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
d2d10ede04b1671 Keguang Zhang 2025-03-20  349  	enum dma_transfer_direction xfer_dir = op->is_write ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
d2d10ede04b1671 Keguang Zhang 2025-03-20  350  	void *buf = op->buf;
d2d10ede04b1671 Keguang Zhang 2025-03-20  351  	char *dma_buf = NULL;
d2d10ede04b1671 Keguang Zhang 2025-03-20  352  	dma_addr_t dma_addr;
d2d10ede04b1671 Keguang Zhang 2025-03-20  353  	int ret;
d2d10ede04b1671 Keguang Zhang 2025-03-20  354  
d2d10ede04b1671 Keguang Zhang 2025-03-20  355  	if (IS_ALIGNED((uintptr_t)buf, chip->buf_align) &&
d2d10ede04b1671 Keguang Zhang 2025-03-20  356  	    IS_ALIGNED(op->orig_len, chip->buf_align)) {
d2d10ede04b1671 Keguang Zhang 2025-03-20  357  		dma_addr = dma_map_single(dev, buf, op->orig_len, data_dir);
d2d10ede04b1671 Keguang Zhang 2025-03-20  358  		if (dma_mapping_error(dev, dma_addr)) {
d2d10ede04b1671 Keguang Zhang 2025-03-20  359  			dev_err(dev, "failed to map DMA buffer\n");
d2d10ede04b1671 Keguang Zhang 2025-03-20  360  			return -ENXIO;
d2d10ede04b1671 Keguang Zhang 2025-03-20  361  		}
d2d10ede04b1671 Keguang Zhang 2025-03-20  362  	} else if (!op->is_write) {
d2d10ede04b1671 Keguang Zhang 2025-03-20  363  		dma_buf = dma_alloc_coherent(dev, op->len, &dma_addr, GFP_KERNEL);
d2d10ede04b1671 Keguang Zhang 2025-03-20  364  		if (!dma_buf)
d2d10ede04b1671 Keguang Zhang 2025-03-20  365  			return -ENOMEM;
d2d10ede04b1671 Keguang Zhang 2025-03-20  366  	} else {
d2d10ede04b1671 Keguang Zhang 2025-03-20  367  		dev_err(dev, "subpage writing not supported\n");
d2d10ede04b1671 Keguang Zhang 2025-03-20  368  		return -EOPNOTSUPP;
d2d10ede04b1671 Keguang Zhang 2025-03-20  369  	}
d2d10ede04b1671 Keguang Zhang 2025-03-20  370  
d2d10ede04b1671 Keguang Zhang 2025-03-20  371  	desc = dmaengine_prep_slave_single(chan, dma_addr, op->len, xfer_dir, DMA_PREP_INTERRUPT);
d2d10ede04b1671 Keguang Zhang 2025-03-20  372  	if (!desc) {
d2d10ede04b1671 Keguang Zhang 2025-03-20  373  		dev_err(dev, "failed to prepare DMA descriptor\n");
d2d10ede04b1671 Keguang Zhang 2025-03-20 @374  		ret = PTR_ERR(desc);
d2d10ede04b1671 Keguang Zhang 2025-03-20  375  		goto err;
d2d10ede04b1671 Keguang Zhang 2025-03-20  376  	}
d2d10ede04b1671 Keguang Zhang 2025-03-20  377  	desc->callback = ls1x_nand_dma_callback;
d2d10ede04b1671 Keguang Zhang 2025-03-20  378  	desc->callback_param = host;
d2d10ede04b1671 Keguang Zhang 2025-03-20  379  
d2d10ede04b1671 Keguang Zhang 2025-03-20  380  	host->dma_cookie = dmaengine_submit(desc);
d2d10ede04b1671 Keguang Zhang 2025-03-20  381  	ret = dma_submit_error(host->dma_cookie);
d2d10ede04b1671 Keguang Zhang 2025-03-20  382  	if (ret) {
d2d10ede04b1671 Keguang Zhang 2025-03-20  383  		dev_err(dev, "failed to submit DMA descriptor\n");
d2d10ede04b1671 Keguang Zhang 2025-03-20  384  		goto err;
d2d10ede04b1671 Keguang Zhang 2025-03-20  385  	}
d2d10ede04b1671 Keguang Zhang 2025-03-20  386  
d2d10ede04b1671 Keguang Zhang 2025-03-20  387  	dev_dbg(dev, "issue DMA with cookie=%d\n", host->dma_cookie);
d2d10ede04b1671 Keguang Zhang 2025-03-20  388  	dma_async_issue_pending(chan);
d2d10ede04b1671 Keguang Zhang 2025-03-20  389  
d2d10ede04b1671 Keguang Zhang 2025-03-20  390  	if (!wait_for_completion_timeout(&host->dma_complete, msecs_to_jiffies(1000))) {
d2d10ede04b1671 Keguang Zhang 2025-03-20  391  		dmaengine_terminate_sync(chan);
d2d10ede04b1671 Keguang Zhang 2025-03-20  392  		reinit_completion(&host->dma_complete);
d2d10ede04b1671 Keguang Zhang 2025-03-20  393  		ret = -ETIMEDOUT;
d2d10ede04b1671 Keguang Zhang 2025-03-20  394  		goto err;
d2d10ede04b1671 Keguang Zhang 2025-03-20  395  	}
d2d10ede04b1671 Keguang Zhang 2025-03-20  396  
d2d10ede04b1671 Keguang Zhang 2025-03-20  397  	if (dma_buf)
d2d10ede04b1671 Keguang Zhang 2025-03-20  398  		memcpy(buf, dma_buf + op->aligned_offset, op->orig_len);
d2d10ede04b1671 Keguang Zhang 2025-03-20  399  err:
d2d10ede04b1671 Keguang Zhang 2025-03-20  400  	if (dma_buf)
d2d10ede04b1671 Keguang Zhang 2025-03-20  401  		dma_free_coherent(dev, op->len, dma_buf, dma_addr);
d2d10ede04b1671 Keguang Zhang 2025-03-20  402  	else
d2d10ede04b1671 Keguang Zhang 2025-03-20  403  		dma_unmap_single(dev, dma_addr, op->orig_len, data_dir);
d2d10ede04b1671 Keguang Zhang 2025-03-20  404  
d2d10ede04b1671 Keguang Zhang 2025-03-20  405  	return ret;
d2d10ede04b1671 Keguang Zhang 2025-03-20  406  }
d2d10ede04b1671 Keguang Zhang 2025-03-20  407  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
