Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFD07D08D
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Jun 2024 02:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718935937; cv=none; b=VkUYHYD3LnlUOnusdB4Uy9VhMOHFiCywd9cifFCRe5ykWWofaZeLizLea5ZA7N4UUVCKsimOM2dLQsJ/YPnqr3dwtrz2TuenzWs58X1G6NFS/Rjw04R7SU8+SCcNdYi/hdIlH0pYShs29dlJ4/alATQIwTbeemYR9bVkn/dHPaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718935937; c=relaxed/simple;
	bh=VVjnE946u95dLvW85oFE4fHoABghx9Ox315HQFnnCL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V+QR4qIvuRobiB8tnvXm4GWs5d9o+bZIEDJQm4j/Zv5kzvS2XULtQnyjscj+lI0xG7avjzjhTj3MluoX+A0kkyy/HkJJxIInmVBzFwof8AC0zGMywtC4ZVsPG6yveJVVPHFJ3ji6R8grFB+tDEg8MLgOQWoMGaGYWAj2JFebUtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRPBmfxB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRPBmfxB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718935935; x=1750471935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VVjnE946u95dLvW85oFE4fHoABghx9Ox315HQFnnCL8=;
  b=fRPBmfxBrqKh3EDmYB2zlOr7HfV83HIWyDRU4USvExT6C087oKxAGsSW
   BMGp5cbre0n8AMENwGxTup4o9fsAvVvawmgnLcsD+AMUnd91q+1Gm16WC
   tzpo27t42vmMDyBs3S8rn0VvW2qR5sTq4ieR+kJBvSo2UoOzW/oCbtOj7
   W1SMam/1fDRxMJeTx71V7AV11dn323byeZmzq/U1AOOBIKmaFHlwWUtdR
   YM66jHbVkT03NdQGVkA7HUffh0uYSagukGOjwfx/C0iRWVIi5g7RGAvKR
   FzQGWw5YYOGoeCCw7zmqCEOHASaXAQkQ07NY2gI67j2jYQmg3G0tv5Von
   A==;
X-CSE-ConnectionGUID: YoHBtfVlSxSw8ivt0S9gow==
X-CSE-MsgGUID: IaTfZDDkSu+BifIJ3IeOrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16096304"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="16096304"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 19:12:15 -0700
X-CSE-ConnectionGUID: eG8i2/mLSPC3pBj7a5E/+A==
X-CSE-MsgGUID: n1YNQMDWRQKdzJbkTsIh/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="65690576"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Jun 2024 19:12:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKTl5-00087E-1o;
	Fri, 21 Jun 2024 02:12:11 +0000
Date: Fri, 21 Jun 2024 10:11:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net] ionic: fix kernel panic due to multi-buffer handling
Message-ID: <202406211040.17BtI0lu-lkp@intel.com>
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
In-Reply-To: <20240618041412.3184919-1-ap420073@gmail.com>
References: <20240618041412.3184919-1-ap420073@gmail.com>
TO: Taehee Yoo <ap420073@gmail.com>
TO: davem@davemloft.net
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: edumazet@google.com
TO: shannon.nelson@amd.com
TO: brett.creeley@amd.com
TO: drivers@pensando.io
TO: netdev@vger.kernel.org
CC: ap420073@gmail.com
CC: jacob.e.keller@intel.com

Hi Taehee,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Taehee-Yoo/ionic-fix-kernel-panic-due-to-multi-buffer-handling/20240618-121629
base:   net/main
patch link:    https://lore.kernel.org/r/20240618041412.3184919-1-ap420073%40gmail.com
patch subject: [PATCH net] ionic: fix kernel panic due to multi-buffer handling
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20240620 (https://download.01.org/0day-ci/archive/20240621/202406211040.17BtI0lu-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406211040.17BtI0lu-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/pensando/ionic/ionic_txrx.c:588 ionic_run_xdp() error: uninitialized symbol 'sinfo'.

Old smatch warnings:
drivers/net/ethernet/pensando/ionic/ionic_txrx.c:253 ionic_rx_build_skb() warn: variable dereferenced before check 'buf_info->page' (see line 237)
drivers/net/ethernet/pensando/ionic/ionic_txrx.c:614 ionic_run_xdp() error: uninitialized symbol 'sinfo'.

vim +/sinfo +588 drivers/net/ethernet/pensando/ionic/ionic_txrx.c

26f5726a78574a Shannon Nelson 2024-02-14  482  
180e35cdf035d1 Shannon Nelson 2024-02-14  483  static bool ionic_run_xdp(struct ionic_rx_stats *stats,
180e35cdf035d1 Shannon Nelson 2024-02-14  484  			  struct net_device *netdev,
180e35cdf035d1 Shannon Nelson 2024-02-14  485  			  struct bpf_prog *xdp_prog,
180e35cdf035d1 Shannon Nelson 2024-02-14  486  			  struct ionic_queue *rxq,
180e35cdf035d1 Shannon Nelson 2024-02-14  487  			  struct ionic_buf_info *buf_info,
180e35cdf035d1 Shannon Nelson 2024-02-14  488  			  int len)
180e35cdf035d1 Shannon Nelson 2024-02-14  489  {
17cb07b96a5f58 Taehee Yoo     2024-06-18  490  	int remain_len, frag_len, i, err = 0;
17cb07b96a5f58 Taehee Yoo     2024-06-18  491  	struct skb_shared_info *sinfo;
180e35cdf035d1 Shannon Nelson 2024-02-14  492  	u32 xdp_action = XDP_ABORTED;
180e35cdf035d1 Shannon Nelson 2024-02-14  493  	struct xdp_buff xdp_buf;
8eeed8373e1cca Shannon Nelson 2024-02-14  494  	struct ionic_queue *txq;
8eeed8373e1cca Shannon Nelson 2024-02-14  495  	struct netdev_queue *nq;
8eeed8373e1cca Shannon Nelson 2024-02-14  496  	struct xdp_frame *xdpf;
180e35cdf035d1 Shannon Nelson 2024-02-14  497  
180e35cdf035d1 Shannon Nelson 2024-02-14  498  	xdp_init_buff(&xdp_buf, IONIC_PAGE_SIZE, rxq->xdp_rxq_info);
5377805dc1c02a Shannon Nelson 2024-02-14  499  	frag_len = min_t(u16, len, IONIC_XDP_MAX_LINEAR_MTU + VLAN_ETH_HLEN);
180e35cdf035d1 Shannon Nelson 2024-02-14  500  	xdp_prepare_buff(&xdp_buf, ionic_rx_buf_va(buf_info),
5377805dc1c02a Shannon Nelson 2024-02-14  501  			 XDP_PACKET_HEADROOM, frag_len, false);
180e35cdf035d1 Shannon Nelson 2024-02-14  502  
180e35cdf035d1 Shannon Nelson 2024-02-14  503  	dma_sync_single_range_for_cpu(rxq->dev, ionic_rx_buf_pa(buf_info),
f81da39bf4c0a5 Shannon Nelson 2024-02-14  504  				      XDP_PACKET_HEADROOM, len,
180e35cdf035d1 Shannon Nelson 2024-02-14  505  				      DMA_FROM_DEVICE);
180e35cdf035d1 Shannon Nelson 2024-02-14  506  
180e35cdf035d1 Shannon Nelson 2024-02-14  507  	prefetchw(&xdp_buf.data_hard_start);
180e35cdf035d1 Shannon Nelson 2024-02-14  508  
5377805dc1c02a Shannon Nelson 2024-02-14  509  	/*  We limit MTU size to one buffer if !xdp_has_frags, so
5377805dc1c02a Shannon Nelson 2024-02-14  510  	 *  if the recv len is bigger than one buffer
5377805dc1c02a Shannon Nelson 2024-02-14  511  	 *     then we know we have frag info to gather
5377805dc1c02a Shannon Nelson 2024-02-14  512  	 */
5377805dc1c02a Shannon Nelson 2024-02-14  513  	remain_len = len - frag_len;
5377805dc1c02a Shannon Nelson 2024-02-14  514  	if (remain_len) {
5377805dc1c02a Shannon Nelson 2024-02-14  515  		struct ionic_buf_info *bi;
5377805dc1c02a Shannon Nelson 2024-02-14  516  		skb_frag_t *frag;
5377805dc1c02a Shannon Nelson 2024-02-14  517  
5377805dc1c02a Shannon Nelson 2024-02-14  518  		bi = buf_info;
5377805dc1c02a Shannon Nelson 2024-02-14  519  		sinfo = xdp_get_shared_info_from_buff(&xdp_buf);
5377805dc1c02a Shannon Nelson 2024-02-14  520  		sinfo->nr_frags = 0;
5377805dc1c02a Shannon Nelson 2024-02-14  521  		sinfo->xdp_frags_size = 0;
5377805dc1c02a Shannon Nelson 2024-02-14  522  		xdp_buff_set_frags_flag(&xdp_buf);
5377805dc1c02a Shannon Nelson 2024-02-14  523  
5377805dc1c02a Shannon Nelson 2024-02-14  524  		do {
5377805dc1c02a Shannon Nelson 2024-02-14  525  			if (unlikely(sinfo->nr_frags >= MAX_SKB_FRAGS)) {
5377805dc1c02a Shannon Nelson 2024-02-14  526  				err = -ENOSPC;
5377805dc1c02a Shannon Nelson 2024-02-14  527  				goto out_xdp_abort;
5377805dc1c02a Shannon Nelson 2024-02-14  528  			}
5377805dc1c02a Shannon Nelson 2024-02-14  529  
5377805dc1c02a Shannon Nelson 2024-02-14  530  			frag = &sinfo->frags[sinfo->nr_frags];
5377805dc1c02a Shannon Nelson 2024-02-14  531  			sinfo->nr_frags++;
5377805dc1c02a Shannon Nelson 2024-02-14  532  			bi++;
5377805dc1c02a Shannon Nelson 2024-02-14  533  			frag_len = min_t(u16, remain_len, ionic_rx_buf_size(bi));
5377805dc1c02a Shannon Nelson 2024-02-14  534  			dma_sync_single_range_for_cpu(rxq->dev, ionic_rx_buf_pa(bi),
5377805dc1c02a Shannon Nelson 2024-02-14  535  						      0, frag_len, DMA_FROM_DEVICE);
5377805dc1c02a Shannon Nelson 2024-02-14  536  			skb_frag_fill_page_desc(frag, bi->page, 0, frag_len);
5377805dc1c02a Shannon Nelson 2024-02-14  537  			sinfo->xdp_frags_size += frag_len;
5377805dc1c02a Shannon Nelson 2024-02-14  538  			remain_len -= frag_len;
5377805dc1c02a Shannon Nelson 2024-02-14  539  
5377805dc1c02a Shannon Nelson 2024-02-14  540  			if (page_is_pfmemalloc(bi->page))
5377805dc1c02a Shannon Nelson 2024-02-14  541  				xdp_buff_set_frag_pfmemalloc(&xdp_buf);
5377805dc1c02a Shannon Nelson 2024-02-14  542  		} while (remain_len > 0);
5377805dc1c02a Shannon Nelson 2024-02-14  543  	}
5377805dc1c02a Shannon Nelson 2024-02-14  544  
180e35cdf035d1 Shannon Nelson 2024-02-14  545  	xdp_action = bpf_prog_run_xdp(xdp_prog, &xdp_buf);
180e35cdf035d1 Shannon Nelson 2024-02-14  546  
180e35cdf035d1 Shannon Nelson 2024-02-14  547  	switch (xdp_action) {
180e35cdf035d1 Shannon Nelson 2024-02-14  548  	case XDP_PASS:
180e35cdf035d1 Shannon Nelson 2024-02-14  549  		stats->xdp_pass++;
180e35cdf035d1 Shannon Nelson 2024-02-14  550  		return false;  /* false = we didn't consume the packet */
180e35cdf035d1 Shannon Nelson 2024-02-14  551  
180e35cdf035d1 Shannon Nelson 2024-02-14  552  	case XDP_DROP:
180e35cdf035d1 Shannon Nelson 2024-02-14  553  		ionic_rx_page_free(rxq, buf_info);
180e35cdf035d1 Shannon Nelson 2024-02-14  554  		stats->xdp_drop++;
180e35cdf035d1 Shannon Nelson 2024-02-14  555  		break;
180e35cdf035d1 Shannon Nelson 2024-02-14  556  
180e35cdf035d1 Shannon Nelson 2024-02-14  557  	case XDP_TX:
8eeed8373e1cca Shannon Nelson 2024-02-14  558  		xdpf = xdp_convert_buff_to_frame(&xdp_buf);
8eeed8373e1cca Shannon Nelson 2024-02-14  559  		if (!xdpf)
8eeed8373e1cca Shannon Nelson 2024-02-14  560  			goto out_xdp_abort;
8eeed8373e1cca Shannon Nelson 2024-02-14  561  
8eeed8373e1cca Shannon Nelson 2024-02-14  562  		txq = rxq->partner;
8eeed8373e1cca Shannon Nelson 2024-02-14  563  		nq = netdev_get_tx_queue(netdev, txq->index);
8eeed8373e1cca Shannon Nelson 2024-02-14  564  		__netif_tx_lock(nq, smp_processor_id());
8eeed8373e1cca Shannon Nelson 2024-02-14  565  		txq_trans_cond_update(nq);
8eeed8373e1cca Shannon Nelson 2024-02-14  566  
8eeed8373e1cca Shannon Nelson 2024-02-14  567  		if (netif_tx_queue_stopped(nq) ||
1937b7ab6bd6bd Brett Creeley  2024-02-29  568  		    !netif_txq_maybe_stop(q_to_ndq(netdev, txq),
061b9bedbef124 Brett Creeley  2024-02-29  569  					  ionic_q_space_avail(txq),
061b9bedbef124 Brett Creeley  2024-02-29  570  					  1, 1)) {
8eeed8373e1cca Shannon Nelson 2024-02-14  571  			__netif_tx_unlock(nq);
8eeed8373e1cca Shannon Nelson 2024-02-14  572  			goto out_xdp_abort;
8eeed8373e1cca Shannon Nelson 2024-02-14  573  		}
8eeed8373e1cca Shannon Nelson 2024-02-14  574  
8eeed8373e1cca Shannon Nelson 2024-02-14  575  		dma_unmap_page(rxq->dev, buf_info->dma_addr,
8eeed8373e1cca Shannon Nelson 2024-02-14  576  			       IONIC_PAGE_SIZE, DMA_FROM_DEVICE);
1937b7ab6bd6bd Brett Creeley  2024-02-29  577  		err = ionic_xdp_post_frame(txq, xdpf, XDP_TX,
8eeed8373e1cca Shannon Nelson 2024-02-14  578  					   buf_info->page,
8eeed8373e1cca Shannon Nelson 2024-02-14  579  					   buf_info->page_offset,
8eeed8373e1cca Shannon Nelson 2024-02-14  580  					   true);
8eeed8373e1cca Shannon Nelson 2024-02-14  581  		__netif_tx_unlock(nq);
8eeed8373e1cca Shannon Nelson 2024-02-14  582  		if (err) {
8eeed8373e1cca Shannon Nelson 2024-02-14  583  			netdev_dbg(netdev, "tx ionic_xdp_post_frame err %d\n", err);
8eeed8373e1cca Shannon Nelson 2024-02-14  584  			goto out_xdp_abort;
8eeed8373e1cca Shannon Nelson 2024-02-14  585  		}
491aee894a08bc Taehee Yoo     2024-06-03  586  		buf_info->page = NULL;
17cb07b96a5f58 Taehee Yoo     2024-06-18  587  		if (xdp_frame_has_frags(xdpf)) {
17cb07b96a5f58 Taehee Yoo     2024-06-18 @588  			for (i = 0; i < sinfo->nr_frags; i++) {
17cb07b96a5f58 Taehee Yoo     2024-06-18  589  				buf_info++;
17cb07b96a5f58 Taehee Yoo     2024-06-18  590  				dma_unmap_page(rxq->dev, buf_info->dma_addr,
17cb07b96a5f58 Taehee Yoo     2024-06-18  591  					       IONIC_PAGE_SIZE, DMA_FROM_DEVICE);
17cb07b96a5f58 Taehee Yoo     2024-06-18  592  				buf_info->page = NULL;
17cb07b96a5f58 Taehee Yoo     2024-06-18  593  			}
17cb07b96a5f58 Taehee Yoo     2024-06-18  594  		}
17cb07b96a5f58 Taehee Yoo     2024-06-18  595  
8eeed8373e1cca Shannon Nelson 2024-02-14  596  		stats->xdp_tx++;
8eeed8373e1cca Shannon Nelson 2024-02-14  597  
8eeed8373e1cca Shannon Nelson 2024-02-14  598  		/* the Tx completion will free the buffers */
8eeed8373e1cca Shannon Nelson 2024-02-14  599  		break;
8eeed8373e1cca Shannon Nelson 2024-02-14  600  
180e35cdf035d1 Shannon Nelson 2024-02-14  601  	case XDP_REDIRECT:
17cb07b96a5f58 Taehee Yoo     2024-06-18  602  		xdpf = xdp_convert_buff_to_frame(&xdp_buf);
587fc3f0dceb08 Shannon Nelson 2024-02-14  603  		/* unmap the pages before handing them to a different device */
587fc3f0dceb08 Shannon Nelson 2024-02-14  604  		dma_unmap_page(rxq->dev, buf_info->dma_addr,
587fc3f0dceb08 Shannon Nelson 2024-02-14  605  			       IONIC_PAGE_SIZE, DMA_FROM_DEVICE);
587fc3f0dceb08 Shannon Nelson 2024-02-14  606  
587fc3f0dceb08 Shannon Nelson 2024-02-14  607  		err = xdp_do_redirect(netdev, &xdp_buf, xdp_prog);
587fc3f0dceb08 Shannon Nelson 2024-02-14  608  		if (err) {
587fc3f0dceb08 Shannon Nelson 2024-02-14  609  			netdev_dbg(netdev, "xdp_do_redirect err %d\n", err);
587fc3f0dceb08 Shannon Nelson 2024-02-14  610  			goto out_xdp_abort;
587fc3f0dceb08 Shannon Nelson 2024-02-14  611  		}
587fc3f0dceb08 Shannon Nelson 2024-02-14  612  		buf_info->page = NULL;
17cb07b96a5f58 Taehee Yoo     2024-06-18  613  		if (xdp_frame_has_frags(xdpf)) {
17cb07b96a5f58 Taehee Yoo     2024-06-18  614  			for (i = 0; i < sinfo->nr_frags; i++) {
17cb07b96a5f58 Taehee Yoo     2024-06-18  615  				buf_info++;
17cb07b96a5f58 Taehee Yoo     2024-06-18  616  				dma_unmap_page(rxq->dev, buf_info->dma_addr,
17cb07b96a5f58 Taehee Yoo     2024-06-18  617  					       IONIC_PAGE_SIZE, DMA_FROM_DEVICE);
17cb07b96a5f58 Taehee Yoo     2024-06-18  618  				buf_info->page = NULL;
17cb07b96a5f58 Taehee Yoo     2024-06-18  619  			}
17cb07b96a5f58 Taehee Yoo     2024-06-18  620  		}
17cb07b96a5f58 Taehee Yoo     2024-06-18  621  
587fc3f0dceb08 Shannon Nelson 2024-02-14  622  		rxq->xdp_flush = true;
587fc3f0dceb08 Shannon Nelson 2024-02-14  623  		stats->xdp_redirect++;
587fc3f0dceb08 Shannon Nelson 2024-02-14  624  		break;
587fc3f0dceb08 Shannon Nelson 2024-02-14  625  
180e35cdf035d1 Shannon Nelson 2024-02-14  626  	case XDP_ABORTED:
180e35cdf035d1 Shannon Nelson 2024-02-14  627  	default:
8eeed8373e1cca Shannon Nelson 2024-02-14  628  		goto out_xdp_abort;
8eeed8373e1cca Shannon Nelson 2024-02-14  629  	}
8eeed8373e1cca Shannon Nelson 2024-02-14  630  
8eeed8373e1cca Shannon Nelson 2024-02-14  631  	return true;
8eeed8373e1cca Shannon Nelson 2024-02-14  632  
8eeed8373e1cca Shannon Nelson 2024-02-14  633  out_xdp_abort:
180e35cdf035d1 Shannon Nelson 2024-02-14  634  	trace_xdp_exception(netdev, xdp_prog, xdp_action);
180e35cdf035d1 Shannon Nelson 2024-02-14  635  	ionic_rx_page_free(rxq, buf_info);
180e35cdf035d1 Shannon Nelson 2024-02-14  636  	stats->xdp_aborted++;
180e35cdf035d1 Shannon Nelson 2024-02-14  637  
180e35cdf035d1 Shannon Nelson 2024-02-14  638  	return true;
180e35cdf035d1 Shannon Nelson 2024-02-14  639  }
180e35cdf035d1 Shannon Nelson 2024-02-14  640  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
