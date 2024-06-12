Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE7816B74A
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Jun 2024 06:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718174741; cv=none; b=m5UxyA9lwyNXuXDuZZpnpRT0uawWkB8FRJTb1jqpCcWrNbSSv2j9WbRd9BS6hiOXHbtxxttpMtvMX7KlxPqqmu/LNXEz9M+jhT1yl8YaYAXOnhRHLYi4ItgJ/a0S3G/82ZkRRND248F+IkaqbQ67JDL7m4PHvD8W5EsicBYdyJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718174741; c=relaxed/simple;
	bh=8K+x9+aiG4MYeGZzlv1zSH5G5EMTcu2X8Yoq6GQWrhI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KEs6ivZUQ5RV44nbPVPmL9gyU1jMG3Ql73yzIQb/WBmC8zAW09SusIXQIFphaH9/1ZtF2670l5uQ59tOwEDrbHjPrPeQEchxcbFAv74bzNlkEA6JqFfvKtpJY5lp20almF93wNMBBI+IeBGhn/F5Nyt5/WCgwxyRC4g5Qbay/gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F0JhOREu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F0JhOREu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718174739; x=1749710739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8K+x9+aiG4MYeGZzlv1zSH5G5EMTcu2X8Yoq6GQWrhI=;
  b=F0JhOREuzDrFpisYhz4v8RR5skSjs+RWANdLhV0B0bXQ9PMXtsikQFbF
   tRofk4X1UmV6ux3wgyzoHULXgPmT0LEcfuj9LVfhPdCmHl18iwcUH7wUW
   PS96FdB89TbQWZOsmRZTtmlLBej02Q/WRgqoxh1qzKEl5Kh/0Jr/tWnbF
   jNj1Ex62xm9IQcNkLNMjDSV9Mmk9m01MTCD1qYTeQfT9uS+s5Cy6sAbEc
   ImzfiH00KfZHT48i5AjUWQgra8MC+qCbOlwDluvHl2CICan1cgR8ZLUUj
   Z1nmdANue8nqgFiWucBJZkbds5PoQmfBvooqaL3miMJcGJ6fHnZ1R5nC4
   A==;
X-CSE-ConnectionGUID: o2JSVnNxQri/BBJiaAJNNg==
X-CSE-MsgGUID: Q1xXDb5LS6CwL+eLICiRcA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="25547862"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="25547862"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 23:45:35 -0700
X-CSE-ConnectionGUID: kixMoqQ+QGqHa6lXyn0e+g==
X-CSE-MsgGUID: 4FOnrnCQRVOOnUurbDfD3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="40313260"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Jun 2024 23:45:34 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHHjg-0001I5-0A;
	Wed, 12 Jun 2024 06:45:32 +0000
Date: Wed, 12 Jun 2024 14:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v4 08/15] virtio_net: sq support premapped mode
Message-ID: <202406121447.HULbTIme-lkp@intel.com>
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
In-Reply-To: <20240611114147.31320-9-xuanzhuo@linux.alibaba.com>
References: <20240611114147.31320-9-xuanzhuo@linux.alibaba.com>
TO: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Hi Xuan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Xuan-Zhuo/virtio_ring-introduce-dma-map-api-for-page/20240611-194942
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240611114147.31320-9-xuanzhuo%40linux.alibaba.com
patch subject: [PATCH net-next v4 08/15] virtio_net: sq support premapped mode
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-141-20240612 (https://download.01.org/0day-ci/archive/20240612/202406121447.HULbTIme-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406121447.HULbTIme-lkp@intel.com/

New smatch warnings:
drivers/net/virtio_net.c:556 virtnet_sq_unmap() error: uninitialized symbol 'tail'.
drivers/net/virtio_net.c:682 virtnet_sq_alloc_dma_meta() error: uninitialized symbol 'd'.

Old smatch warnings:
drivers/net/virtio_net.c:1774 build_skb_from_xdp_buff() error: uninitialized symbol 'nr_frags'.
drivers/net/virtio_net.c:1856 virtnet_build_xdp_buff_mrg() error: uninitialized symbol 'shinfo'.
drivers/net/virtio_net.c:4851 virtnet_update_settings() error: uninitialized symbol 'virtio_cread_v'.
drivers/net/virtio_net.c:5392 virtnet_config_changed_work() error: uninitialized symbol 'virtio_cread_v'.
drivers/net/virtio_net.c:5396 virtnet_config_changed_work() error: uninitialized symbol 'v'.

vim +/tail +556 drivers/net/virtio_net.c

5050471d35d131 Toshiaki Makita 2019-01-29  539  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  540  static void virtnet_sq_unmap(struct send_queue *sq, void **data)
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  541  {
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  542  	struct virtnet_sq_dma *head, *tail, *p;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  543  	int i;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  544  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  545  	head = *data;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  546  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  547  	p = head;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  548  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  549  	for (i = 0; i < head->num; ++i) {
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  550  		virtqueue_dma_unmap_page_attrs(sq->vq, p->addr, p->len,
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  551  					       DMA_TO_DEVICE, 0);
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  552  		tail = p;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  553  		p = p->next;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  554  	}
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  555  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11 @556  	*data = tail->data;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  557  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  558  	tail->next = sq->dmainfo.free;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  559  	sq->dmainfo.free = head;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  560  	sq->dmainfo.free_num += head->num;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  561  }
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  562  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  563  static void *virtnet_dma_chain_update(struct send_queue *sq,
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  564  				      struct virtnet_sq_dma *head,
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  565  				      struct virtnet_sq_dma *tail,
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  566  				      u8 num, void *data)
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  567  {
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  568  	sq->dmainfo.free = tail->next;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  569  	sq->dmainfo.free_num -= num;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  570  	head->num = num;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  571  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  572  	tail->data = data;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  573  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  574  	return virtnet_xmit_ptr_mix(head, VIRTNET_XMIT_TYPE_DMA);
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  575  }
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  576  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  577  static struct virtnet_sq_dma *virtnet_sq_map_sg(struct send_queue *sq, int num, void *data)
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  578  {
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  579  	struct virtnet_sq_dma *head, *tail, *p;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  580  	struct scatterlist *sg;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  581  	dma_addr_t addr;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  582  	int i, err;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  583  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  584  	if (num > sq->dmainfo.free_num)
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  585  		return NULL;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  586  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  587  	head = sq->dmainfo.free;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  588  	p = head;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  589  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  590  	tail = NULL;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  591  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  592  	for (i = 0; i < num; ++i) {
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  593  		sg = &sq->sg[i];
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  594  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  595  		addr = virtqueue_dma_map_page_attrs(sq->vq, sg_page(sg),
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  596  						    sg->offset,
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  597  						    sg->length, DMA_TO_DEVICE,
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  598  						    0);
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  599  		err = virtqueue_dma_mapping_error(sq->vq, addr);
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  600  		if (err)
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  601  			goto err;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  602  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  603  		sg->dma_address = addr;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  604  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  605  		tail = p;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  606  		tail->addr = sg->dma_address;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  607  		tail->len = sg->length;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  608  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  609  		p = p->next;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  610  	}
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  611  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  612  	return virtnet_dma_chain_update(sq, head, tail, num, data);
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  613  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  614  err:
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  615  	if (tail) {
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  616  		virtnet_dma_chain_update(sq, head, tail, i, data);
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  617  		virtnet_sq_unmap(sq, (void **)&head);
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  618  	}
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  619  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  620  	return NULL;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  621  }
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  622  
113da0fa1b0068 Xuan Zhuo       2024-06-11  623  static int virtnet_add_outbuf(struct send_queue *sq, int num, void *data,
113da0fa1b0068 Xuan Zhuo       2024-06-11  624  			      enum virtnet_xmit_type type)
5050471d35d131 Toshiaki Makita 2019-01-29  625  {
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  626  	int ret;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  627  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  628  	data = virtnet_xmit_ptr_mix(data, type);
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  629  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  630  	if (sq->premapped) {
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  631  		data = virtnet_sq_map_sg(sq, num, data);
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  632  		if (!data)
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  633  			return -ENOMEM;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  634  	}
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  635  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  636  	ret = virtqueue_add_outbuf(sq->vq, sq->sg, num, data, GFP_ATOMIC);
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  637  	if (ret && sq->premapped) {
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  638  		virtnet_xmit_ptr_strip(&data);
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  639  		virtnet_sq_unmap(sq, &data);
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  640  	}
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  641  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  642  	return ret;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  643  }
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  644  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  645  static int virtnet_sq_alloc_dma_meta(struct send_queue *sq)
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  646  {
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  647  	struct virtnet_sq_dma *d;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  648  	int num, i;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  649  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  650  	num = virtqueue_get_vring_size(sq->vq);
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  651  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  652  	/* Currently, the SQ premapped mode is operational only with af-xdp. In
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  653  	 * this mode, af-xdp, the kernel stack, and xdp tx/redirect will share
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  654  	 * the same SQ. Af-xdp independently manages its DMA. The kernel stack
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  655  	 * and xdp tx/redirect utilize this DMA metadata to manage the DMA info.
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  656  	 *
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  657  	 * If the indirect descriptor feature be supported, the volume of DMA
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  658  	 * details we need to maintain becomes quite substantial. Here, we have
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  659  	 * a cap on the amount of DMA info we manage, effectively limiting it to
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  660  	 * twice the size of the ring buffer.
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  661  	 *
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  662  	 * If the kernel stack and xdp tx/redirect attempt to use more
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  663  	 * descriptors than allowed by this double ring buffer size,
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  664  	 * virtnet_add_outbuf() will return an -ENOMEM error. But the af-xdp can
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  665  	 * work continually.
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  666  	 */
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  667  	if (virtio_has_feature(sq->vq->vdev, VIRTIO_RING_F_INDIRECT_DESC))
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  668  		num = num * 2;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  669  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  670  	sq->dmainfo.free = kcalloc(num, sizeof(*sq->dmainfo.free), GFP_KERNEL);
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  671  	if (!sq->dmainfo.free)
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  672  		return -ENOMEM;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  673  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  674  	sq->dmainfo.p = sq->dmainfo.free;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  675  	sq->dmainfo.free_num = num;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  676  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  677  	for (i = 0; i < num; ++i) {
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  678  		d = &sq->dmainfo.free[i];
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  679  		d->next = d + 1;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  680  	}
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  681  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11 @682  	d->next = NULL;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  683  
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  684  	return 0;
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  685  }
5b7e6920fb3a08 Xuan Zhuo       2024-06-11  686  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
