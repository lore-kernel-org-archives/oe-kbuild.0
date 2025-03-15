Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B2615D1
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 05:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742016766; cv=none; b=dt6tVo22lnqXiqp3GGPAeutdhZt8YGW9OcIMQriHv3nmYPNo8NJrLPjoqRvWQFhiyXRsnYQFyLQ4R3HwSpavYbPDDZJAsDrJZpMqkrfAX99KWaJzoHEJRoMBBlBMUqRa03xmK6/rqAr7Iy/hA8IDmf7WJUYHnK/SQnPzpQmJu58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742016766; c=relaxed/simple;
	bh=3/uUAIYqrv1uts2N0YEDYkBBUYbiyIADPGjs4pBcwbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qnzW3leXHIjYgae0WmkSy4vveN9p2fFAZZhw0V7i1tWPsohqDtUCtrNUZvoi8XNqKpnMsMf2rkGU462WJ2YSE1L7+bXqrf5PaX9BfJzQobpQnWNvgmjdv8LjIxUlEcgzj7n+T7dSLU6chuppDwfQ5qqLnflWOYODgfY74o3353s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YObn8c18; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YObn8c18"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742016765; x=1773552765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3/uUAIYqrv1uts2N0YEDYkBBUYbiyIADPGjs4pBcwbk=;
  b=YObn8c18ipalATkWkCehCKAMB4S3wyCZKuPlA2xtDtbnHH9lxWBOW1Xy
   bim+awOAav6Ilg2ACuChe1ID8EwrAHaA4AMziTAZ6dh1dYqBIQVH12qmN
   9iN4hxT9Z+4DEYpsaU7xUROwd2N0OILrOEHmmcP1olWzE5SGCcS0Ir8y+
   cU01RpFuTBLdZJ5i1DdOFuHC/NEUVD3B8yu3rcdP3KaNewJMLEln++h+H
   rtlrF1dh/f+cvpV5vRvboH4wKJVDeekmyOHc5iVVFQxiFFg+uXCY+Q4om
   orSU3VHOSdeI9mX7upwa+XLf83MVybgA2fCT74kEFzxJeNMaWtx/9gWsb
   A==;
X-CSE-ConnectionGUID: UMNW3AN+Tf+Eyf4tFFcj3g==
X-CSE-MsgGUID: l+Yx0LM/TeKuJ+pmK5DCew==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43212181"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="43212181"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 22:32:44 -0700
X-CSE-ConnectionGUID: MPNbaiubRHOz1tMD+3SEyA==
X-CSE-MsgGUID: SCyZLov4RhqHBQCUUS7jfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="121510233"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 14 Mar 2025 22:32:42 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttK8W-000B5B-1u;
	Sat, 15 Mar 2025 05:32:40 +0000
Date: Sat, 15 Mar 2025 13:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/usb/gadget/function/f_fs.c:1652 ffs_dmabuf_transfer() warn:
 'ep' can also be NULL
Message-ID: <202503151351.P6z0T73Q-lkp@intel.com>
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
TO: Paul Cercueil <paul@crapouillou.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3571e8b091f4270d869dda7a6cc43616c6ad6897
commit: 7b07a2a7ca02a20124b552be96c5a56910795488 usb: gadget: functionfs: Add DMABUF import interface
date:   1 year, 1 month ago
:::::: branch date: 37 minutes ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-161-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151351.P6z0T73Q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503151351.P6z0T73Q-lkp@intel.com/

New smatch warnings:
drivers/usb/gadget/function/f_fs.c:1652 ffs_dmabuf_transfer() warn: 'ep' can also be NULL

Old smatch warnings:
drivers/usb/gadget/function/f_fs.c:1050 ffs_epfile_io() warn: 'ep' can also be NULL
drivers/usb/gadget/function/f_fs.c:1073 ffs_epfile_io() warn: 'ep' can also be NULL
drivers/usb/gadget/function/f_fs.c:1093 ffs_epfile_io() warn: 'ep' can also be NULL
drivers/usb/gadget/function/f_fs.c:1142 ffs_epfile_io() warn: 'ep' can also be NULL

vim +/ep +1652 drivers/usb/gadget/function/f_fs.c

7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1571  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1572  static int ffs_dmabuf_transfer(struct file *file,
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1573  			       const struct usb_ffs_dmabuf_transfer_req *req)
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1574  {
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1575  	bool nonblock = file->f_flags & O_NONBLOCK;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1576  	struct ffs_epfile *epfile = file->private_data;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1577  	struct dma_buf_attachment *attach;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1578  	struct ffs_dmabuf_priv *priv;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1579  	struct ffs_dma_fence *fence;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1580  	struct usb_request *usb_req;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1581  	struct dma_buf *dmabuf;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1582  	struct ffs_ep *ep;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1583  	bool cookie;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1584  	u32 seqno;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1585  	int ret;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1586  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1587  	if (req->flags & ~USB_FFS_DMABUF_TRANSFER_MASK)
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1588  		return -EINVAL;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1589  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1590  	dmabuf = dma_buf_get(req->fd);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1591  	if (IS_ERR(dmabuf))
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1592  		return PTR_ERR(dmabuf);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1593  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1594  	if (req->length > dmabuf->size || req->length == 0) {
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1595  		ret = -EINVAL;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1596  		goto err_dmabuf_put;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1597  	}
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1598  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1599  	attach = ffs_dmabuf_find_attachment(epfile, dmabuf);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1600  	if (IS_ERR(attach)) {
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1601  		ret = PTR_ERR(attach);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1602  		goto err_dmabuf_put;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1603  	}
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1604  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1605  	priv = attach->importer_priv;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1606  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1607  	ep = ffs_epfile_wait_ep(file);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1608  	if (IS_ERR(ep)) {
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1609  		ret = PTR_ERR(ep);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1610  		goto err_attachment_put;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1611  	}
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1612  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1613  	ret = ffs_dma_resv_lock(dmabuf, nonblock);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1614  	if (ret)
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1615  		goto err_attachment_put;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1616  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1617  	/* Make sure we don't have writers */
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1618  	if (!dma_resv_test_signaled(dmabuf->resv, DMA_RESV_USAGE_WRITE)) {
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1619  		pr_vdebug("FFS WRITE fence is not signaled\n");
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1620  		ret = -EBUSY;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1621  		goto err_resv_unlock;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1622  	}
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1623  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1624  	/* If we're writing to the DMABUF, make sure we don't have readers */
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1625  	if (epfile->in &&
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1626  	    !dma_resv_test_signaled(dmabuf->resv, DMA_RESV_USAGE_READ)) {
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1627  		pr_vdebug("FFS READ fence is not signaled\n");
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1628  		ret = -EBUSY;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1629  		goto err_resv_unlock;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1630  	}
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1631  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1632  	ret = dma_resv_reserve_fences(dmabuf->resv, 1);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1633  	if (ret)
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1634  		goto err_resv_unlock;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1635  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1636  	fence = kmalloc(sizeof(*fence), GFP_KERNEL);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1637  	if (!fence) {
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1638  		ret = -ENOMEM;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1639  		goto err_resv_unlock;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1640  	}
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1641  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1642  	fence->priv = priv;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1643  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1644  	spin_lock_irq(&epfile->ffs->eps_lock);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1645  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1646  	/* In the meantime, endpoint got disabled or changed. */
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1647  	if (epfile->ep != ep) {
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1648  		ret = -ESHUTDOWN;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1649  		goto err_fence_put;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1650  	}
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1651  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30 @1652  	usb_req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1653  	if (!usb_req) {
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1654  		ret = -ENOMEM;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1655  		goto err_fence_put;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1656  	}
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1657  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1658  	/*
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1659  	 * usb_ep_queue() guarantees that all transfers are processed in the
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1660  	 * order they are enqueued, so we can use a simple incrementing
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1661  	 * sequence number for the dma_fence.
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1662  	 */
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1663  	seqno = atomic_add_return(1, &epfile->seqno);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1664  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1665  	dma_fence_init(&fence->base, &ffs_dmabuf_fence_ops,
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1666  		       &priv->lock, priv->context, seqno);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1667  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1668  	dma_resv_add_fence(dmabuf->resv, &fence->base,
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1669  			   dma_resv_usage_rw(epfile->in));
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1670  	dma_resv_unlock(dmabuf->resv);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1671  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1672  	/* Now that the dma_fence is in place, queue the transfer. */
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1673  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1674  	usb_req->length = req->length;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1675  	usb_req->buf = NULL;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1676  	usb_req->sg = priv->sgt->sgl;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1677  	usb_req->num_sgs = sg_nents_for_len(priv->sgt->sgl, req->length);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1678  	usb_req->sg_was_mapped = true;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1679  	usb_req->context  = fence;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1680  	usb_req->complete = ffs_epfile_dmabuf_io_complete;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1681  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1682  	cookie = dma_fence_begin_signalling();
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1683  	ret = usb_ep_queue(ep->ep, usb_req, GFP_ATOMIC);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1684  	dma_fence_end_signalling(cookie);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1685  	if (!ret) {
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1686  		priv->req = usb_req;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1687  		priv->ep = ep->ep;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1688  	} else {
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1689  		pr_warn("FFS: Failed to queue DMABUF: %d\n", ret);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1690  		ffs_dmabuf_signal_done(fence, ret);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1691  		usb_ep_free_request(ep->ep, usb_req);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1692  	}
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1693  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1694  	spin_unlock_irq(&epfile->ffs->eps_lock);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1695  	dma_buf_put(dmabuf);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1696  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1697  	return ret;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1698  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1699  err_fence_put:
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1700  	spin_unlock_irq(&epfile->ffs->eps_lock);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1701  	dma_fence_put(&fence->base);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1702  err_resv_unlock:
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1703  	dma_resv_unlock(dmabuf->resv);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1704  err_attachment_put:
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1705  	ffs_dmabuf_put(attach);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1706  err_dmabuf_put:
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1707  	dma_buf_put(dmabuf);
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1708  
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1709  	return ret;
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1710  }
7b07a2a7ca02a20 Paul Cercueil 2024-01-30  1711  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
