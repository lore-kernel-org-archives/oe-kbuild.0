Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049792E85F
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Dec 2023 20:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Admzkw58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703275991; x=1734811991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SZz3FDpaarT/q2cgjkFI0CxuoMhIRMrHhAYN/cBzI8Y=;
  b=Admzkw58t3CQi2MiOQZYDHR+zpBom//kkwpxIJ2Abnjz9PSExMy23/ZN
   G1OxcA2EQRI8Rqgnk/ITn9pnykfq2saiIsTp0X7rMSBoHceFVW8TVhfb1
   XlN2Eym9toFFKr7Q96el6zsjiE1shRUmpIU2a+IYcNU4MVgqUKFJdu7EM
   X/AZIOrSW3dNGTFJuNmSyB5nzIwenAuT2GWcqGlJ/tUkzLSidnh8c8iwg
   e2VAyMnSFed9v8J4NY0eHi540ciqbyqQwwFxfNpUkCWHucNqj7pM+E8Km
   Ps2LcUn3jaW+QNMbSYhCg0/vZ0iGCPcxF5WMLxOJuMIap1pH5zWij7zt9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="2996309"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="2996309"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 12:13:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="11544468"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Dec 2023 12:13:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGlsR-0009px-1p;
	Fri, 22 Dec 2023 20:12:19 +0000
Date: Sat, 23 Dec 2023 04:10:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9985/10295] drivers/dma/xilinx/xdma.c:894
 xdma_channel_isr() error: potentially dereferencing uninitialized 'desc'.
Message-ID: <202312230438.ciSi2tY3-lkp@intel.com>
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
TO: Jan Kuliga <jankul@alatek.krakow.pl>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: 01e6d907656134949c4126e7fd64984d4daa4c1e [9985/10295] dmaengine: xilinx: xdma: Implement interleaved DMA transfers
:::::: branch date: 15 hours ago
:::::: commit date: 28 hours ago
config: x86_64-randconfig-161-20231222 (https://download.01.org/0day-ci/archive/20231223/202312230438.ciSi2tY3-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312230438.ciSi2tY3-lkp@intel.com/

smatch warnings:
drivers/dma/xilinx/xdma.c:894 xdma_channel_isr() error: potentially dereferencing uninitialized 'desc'.

vim +/desc +894 drivers/dma/xilinx/xdma.c

0db2b6717c5ed1 Miquel Raynal 2023-10-05  862  
17ce252266c7f0 Lizhi Hou     2023-01-19  863  /**
17ce252266c7f0 Lizhi Hou     2023-01-19  864   * xdma_channel_isr - XDMA channel interrupt handler
17ce252266c7f0 Lizhi Hou     2023-01-19  865   * @irq: IRQ number
17ce252266c7f0 Lizhi Hou     2023-01-19  866   * @dev_id: Pointer to the DMA channel structure
17ce252266c7f0 Lizhi Hou     2023-01-19  867   */
17ce252266c7f0 Lizhi Hou     2023-01-19  868  static irqreturn_t xdma_channel_isr(int irq, void *dev_id)
17ce252266c7f0 Lizhi Hou     2023-01-19  869  {
17ce252266c7f0 Lizhi Hou     2023-01-19  870  	struct xdma_chan *xchan = dev_id;
17ce252266c7f0 Lizhi Hou     2023-01-19  871  	u32 complete_desc_num = 0;
01e6d907656134 Jan Kuliga    2023-12-18  872  	struct xdma_device *xdev = xchan->xdev_hdl;
01e6d907656134 Jan Kuliga    2023-12-18  873  	struct virt_dma_desc *vd, *next_vd;
17ce252266c7f0 Lizhi Hou     2023-01-19  874  	struct xdma_desc *desc;
17ce252266c7f0 Lizhi Hou     2023-01-19  875  	int ret;
cd8c732ce1a561 Miquel Raynal 2023-10-05  876  	u32 st;
01e6d907656134 Jan Kuliga    2023-12-18  877  	bool repeat_tx;
17ce252266c7f0 Lizhi Hou     2023-01-19  878  
17ce252266c7f0 Lizhi Hou     2023-01-19  879  	spin_lock(&xchan->vchan.lock);
17ce252266c7f0 Lizhi Hou     2023-01-19  880  
17ce252266c7f0 Lizhi Hou     2023-01-19  881  	/* get submitted request */
17ce252266c7f0 Lizhi Hou     2023-01-19  882  	vd = vchan_next_desc(&xchan->vchan);
17ce252266c7f0 Lizhi Hou     2023-01-19  883  	if (!vd)
17ce252266c7f0 Lizhi Hou     2023-01-19  884  		goto out;
17ce252266c7f0 Lizhi Hou     2023-01-19  885  
c38d055a7c0211 Jan Kuliga    2023-12-18  886  	/* Clear-on-read the status register */
c38d055a7c0211 Jan Kuliga    2023-12-18  887  	ret = regmap_read(xdev->rmap, xchan->base + XDMA_CHAN_STATUS_RC, &st);
17ce252266c7f0 Lizhi Hou     2023-01-19  888  	if (ret)
17ce252266c7f0 Lizhi Hou     2023-01-19  889  		goto out;
17ce252266c7f0 Lizhi Hou     2023-01-19  890  
c38d055a7c0211 Jan Kuliga    2023-12-18  891  	st &= XDMA_CHAN_STATUS_MASK;
c38d055a7c0211 Jan Kuliga    2023-12-18  892  	if ((st & XDMA_CHAN_ERROR_MASK) ||
c38d055a7c0211 Jan Kuliga    2023-12-18  893  	    !(st & (CHAN_CTRL_IE_DESC_COMPLETED | CHAN_CTRL_IE_DESC_STOPPED))) {
c3fcb6f5575fcf Jan Kuliga    2023-12-18 @894  		desc->error = true;
c38d055a7c0211 Jan Kuliga    2023-12-18  895  		xdma_err(xdev, "channel error, status register value: 0x%x", st);
c38d055a7c0211 Jan Kuliga    2023-12-18  896  		goto out;
c38d055a7c0211 Jan Kuliga    2023-12-18  897  	}
26ee018ff6d1c3 Miquel Raynal 2023-11-30  898  
c38d055a7c0211 Jan Kuliga    2023-12-18  899  	ret = regmap_read(xdev->rmap, xchan->base + XDMA_CHAN_COMPLETED_DESC,
c38d055a7c0211 Jan Kuliga    2023-12-18  900  			  &complete_desc_num);
cd8c732ce1a561 Miquel Raynal 2023-10-05  901  	if (ret)
cd8c732ce1a561 Miquel Raynal 2023-10-05  902  		goto out;
cd8c732ce1a561 Miquel Raynal 2023-10-05  903  
01e6d907656134 Jan Kuliga    2023-12-18  904  	desc = to_xdma_desc(vd);
01e6d907656134 Jan Kuliga    2023-12-18  905  	if (desc->interleaved_dma) {
01e6d907656134 Jan Kuliga    2023-12-18  906  		xchan->busy = false;
01e6d907656134 Jan Kuliga    2023-12-18  907  		desc->completed_desc_num += complete_desc_num;
01e6d907656134 Jan Kuliga    2023-12-18  908  		if (complete_desc_num == XDMA_DESC_BLOCK_NUM * XDMA_DESC_ADJACENT) {
01e6d907656134 Jan Kuliga    2023-12-18  909  			xdma_xfer_start(xchan);
01e6d907656134 Jan Kuliga    2023-12-18  910  			goto out;
01e6d907656134 Jan Kuliga    2023-12-18  911  		}
01e6d907656134 Jan Kuliga    2023-12-18  912  
01e6d907656134 Jan Kuliga    2023-12-18  913  		/* last desc of any frame */
01e6d907656134 Jan Kuliga    2023-12-18  914  		desc->frames_left--;
01e6d907656134 Jan Kuliga    2023-12-18  915  		if (desc->frames_left)
01e6d907656134 Jan Kuliga    2023-12-18  916  			goto out;
01e6d907656134 Jan Kuliga    2023-12-18  917  
01e6d907656134 Jan Kuliga    2023-12-18  918  		/* last desc of the last frame  */
01e6d907656134 Jan Kuliga    2023-12-18  919  		repeat_tx = vd->tx.flags & DMA_PREP_REPEAT;
01e6d907656134 Jan Kuliga    2023-12-18  920  		next_vd = list_first_entry_or_null(&vd->node, struct virt_dma_desc, node);
01e6d907656134 Jan Kuliga    2023-12-18  921  		if (next_vd)
01e6d907656134 Jan Kuliga    2023-12-18  922  			repeat_tx = repeat_tx && !(next_vd->tx.flags & DMA_PREP_LOAD_EOT);
01e6d907656134 Jan Kuliga    2023-12-18  923  		if (repeat_tx) {
01e6d907656134 Jan Kuliga    2023-12-18  924  			desc->frames_left = desc->periods;
01e6d907656134 Jan Kuliga    2023-12-18  925  			desc->completed_desc_num = 0;
cd8c732ce1a561 Miquel Raynal 2023-10-05  926  			vchan_cyclic_callback(vd);
58b61fc75ba901 Miquel Raynal 2023-11-30  927  		} else {
01e6d907656134 Jan Kuliga    2023-12-18  928  			list_del(&vd->node);
01e6d907656134 Jan Kuliga    2023-12-18  929  			vchan_cookie_complete(vd);
01e6d907656134 Jan Kuliga    2023-12-18  930  		}
01e6d907656134 Jan Kuliga    2023-12-18  931  		/* start (or continue) the tx of a first desc on the vc.desc_issued list, if any */
01e6d907656134 Jan Kuliga    2023-12-18  932  		xdma_xfer_start(xchan);
01e6d907656134 Jan Kuliga    2023-12-18  933  	} else if (!desc->cyclic) {
b3072be7f955e5 Miquel Raynal 2023-11-30  934  		xchan->busy = false;
26ee018ff6d1c3 Miquel Raynal 2023-11-30  935  		desc->completed_desc_num += complete_desc_num;
26ee018ff6d1c3 Miquel Raynal 2023-11-30  936  
58b61fc75ba901 Miquel Raynal 2023-11-30  937  		/* if all data blocks are transferred, remove and complete the request */
17ce252266c7f0 Lizhi Hou     2023-01-19  938  		if (desc->completed_desc_num == desc->desc_num) {
17ce252266c7f0 Lizhi Hou     2023-01-19  939  			list_del(&vd->node);
17ce252266c7f0 Lizhi Hou     2023-01-19  940  			vchan_cookie_complete(vd);
17ce252266c7f0 Lizhi Hou     2023-01-19  941  			goto out;
17ce252266c7f0 Lizhi Hou     2023-01-19  942  		}
17ce252266c7f0 Lizhi Hou     2023-01-19  943  
17ce252266c7f0 Lizhi Hou     2023-01-19  944  		if (desc->completed_desc_num > desc->desc_num ||
17ce252266c7f0 Lizhi Hou     2023-01-19  945  		    complete_desc_num != XDMA_DESC_BLOCK_NUM * XDMA_DESC_ADJACENT)
17ce252266c7f0 Lizhi Hou     2023-01-19  946  			goto out;
17ce252266c7f0 Lizhi Hou     2023-01-19  947  
58b61fc75ba901 Miquel Raynal 2023-11-30  948  		/* transfer the rest of data */
17ce252266c7f0 Lizhi Hou     2023-01-19  949  		xdma_xfer_start(xchan);
01e6d907656134 Jan Kuliga    2023-12-18  950  	} else {
01e6d907656134 Jan Kuliga    2023-12-18  951  		desc->completed_desc_num = complete_desc_num;
01e6d907656134 Jan Kuliga    2023-12-18  952  		vchan_cyclic_callback(vd);
58b61fc75ba901 Miquel Raynal 2023-11-30  953  	}
17ce252266c7f0 Lizhi Hou     2023-01-19  954  
17ce252266c7f0 Lizhi Hou     2023-01-19  955  out:
17ce252266c7f0 Lizhi Hou     2023-01-19  956  	spin_unlock(&xchan->vchan.lock);
17ce252266c7f0 Lizhi Hou     2023-01-19  957  	return IRQ_HANDLED;
17ce252266c7f0 Lizhi Hou     2023-01-19  958  }
17ce252266c7f0 Lizhi Hou     2023-01-19  959  

:::::: The code at line 894 was first introduced by commit
:::::: c3fcb6f5575fcfd240baa339319d2a42d137cd8e dmaengine: xilinx: xdma: Add transfer error reporting

:::::: TO: Jan Kuliga <jankul@alatek.krakow.pl>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
