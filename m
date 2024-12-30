Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6AA2904
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Dec 2024 01:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735521332; cv=none; b=YtaIohUWI5v3kY2aCjhR+kO1PyPEL5CjwqLBIWP3flL01Qmr/POOsslnVeBW7rRhSvkXQWA4Q/qWPoZ2gYfw8QRTFEgJd0HRAJ56JapcQ6GsJZDK5shQFrLTnVjfUJj8U+wZ8ZIYVgZjIFeGKtRZFFDjXeXi0N9uUyqWA3Pbhao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735521332; c=relaxed/simple;
	bh=yxr2oRmjYNz8k+Egi+a7qkvDRq+Cr5OJAfX9HG2VSXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LmIflndcFRp2YMJtG6c7mW0L9lzHumdd98e+0Umfz4bcqsG2sXaWMpOS/U083ydCxUGZ47no/TwJTElng3QmwqWLx87i33eXqAtlRznJrIerbeO7TwTWKKbQOp8PEzhB6jiJmb/nC+bwQ4mWp2SmvPOe2aTBbzB9GvD87yyjvTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkIyOD8T; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FkIyOD8T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735521331; x=1767057331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yxr2oRmjYNz8k+Egi+a7qkvDRq+Cr5OJAfX9HG2VSXY=;
  b=FkIyOD8THzBKpleW3K6wnCc/iOSSWXxevEynwPpETPMX2TC9XVMjv6rD
   QlP8qlvV9u5qD+i3DdvEKP8CqcCxFWdkPXudJcm5P+otHyggSvXBwpa3h
   xOPGIclsp+64Ao9mZmbIfu7ECYxeXuiSS9hiRx+7HvFRd84OMyCW4xN1Z
   44u3RUZicgsQ2vkstcP6TAgrSVbRLerAyMgn6s1gMd8D0C4oqwv/20HK7
   jDUlQseaFfPX6ieki+/WPenjU5+lXJdEBDXbd9IJ1L4AHx0jg3bQR4tDj
   +ROhkPLuNBd5YiouEywcT6ozh6WnigGICo8SRbGZ2lGF39xu0u6da6pMs
   w==;
X-CSE-ConnectionGUID: LY2qAa8JTp+bLosBDfD2hg==
X-CSE-MsgGUID: AH4982RQT8+bE7sSSUPqUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="36031150"
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="36031150"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 17:15:30 -0800
X-CSE-ConnectionGUID: 0RgRQGOfS6C2HF8QyIjl7Q==
X-CSE-MsgGUID: gd+T/rTOSAOIjP4CXSpToA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123936486"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Dec 2024 17:15:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tS4NS-0005HH-2O;
	Mon, 30 Dec 2024 01:15:26 +0000
Date: Mon, 30 Dec 2024 09:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [netdev-net-next:main 3/60]
 drivers/net/ethernet/freescale/enetc/enetc.c:716 enetc_lso_map_data() error:
 uninitialized symbol 'tx_swbd'.
Message-ID: <202412300923.ayioqjb3-lkp@intel.com>
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
TO: Wei Fang <wei.fang@nxp.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>
CC: Claudiu Manoil <claudiu.manoil@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
head:   9268abe611b09edc975aa27e6ce829f629352ff4
commit: 69797ff888d3dbab035a0d2516b554285b094e3c [3/60] net: enetc: add LSO support for i.MX95 ENETC PF
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: alpha-randconfig-r072-20241228 (https://download.01.org/0day-ci/archive/20241230/202412300923.ayioqjb3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412300923.ayioqjb3-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/freescale/enetc/enetc.c:716 enetc_lso_map_data() error: uninitialized symbol 'tx_swbd'.

vim +/tx_swbd +716 drivers/net/ethernet/freescale/enetc/enetc.c

69797ff888d3dba Wei Fang 2024-12-19  650  
69797ff888d3dba Wei Fang 2024-12-19  651  static int enetc_lso_map_data(struct enetc_bdr *tx_ring, struct sk_buff *skb,
69797ff888d3dba Wei Fang 2024-12-19  652  			      int *i, struct enetc_lso_t *lso, int *count)
69797ff888d3dba Wei Fang 2024-12-19  653  {
69797ff888d3dba Wei Fang 2024-12-19  654  	union enetc_tx_bd txbd_tmp, *txbd = NULL;
69797ff888d3dba Wei Fang 2024-12-19  655  	struct enetc_tx_swbd *tx_swbd;
69797ff888d3dba Wei Fang 2024-12-19  656  	skb_frag_t *frag;
69797ff888d3dba Wei Fang 2024-12-19  657  	dma_addr_t dma;
69797ff888d3dba Wei Fang 2024-12-19  658  	u8 flags = 0;
69797ff888d3dba Wei Fang 2024-12-19  659  	int len, f;
69797ff888d3dba Wei Fang 2024-12-19  660  
69797ff888d3dba Wei Fang 2024-12-19  661  	len = skb_headlen(skb) - lso->hdr_len;
69797ff888d3dba Wei Fang 2024-12-19  662  	if (len > 0) {
69797ff888d3dba Wei Fang 2024-12-19  663  		dma = dma_map_single(tx_ring->dev, skb->data + lso->hdr_len,
69797ff888d3dba Wei Fang 2024-12-19  664  				     len, DMA_TO_DEVICE);
69797ff888d3dba Wei Fang 2024-12-19  665  		if (dma_mapping_error(tx_ring->dev, dma))
69797ff888d3dba Wei Fang 2024-12-19  666  			return -ENOMEM;
69797ff888d3dba Wei Fang 2024-12-19  667  
69797ff888d3dba Wei Fang 2024-12-19  668  		enetc_bdr_idx_inc(tx_ring, i);
69797ff888d3dba Wei Fang 2024-12-19  669  		txbd = ENETC_TXBD(*tx_ring, *i);
69797ff888d3dba Wei Fang 2024-12-19  670  		tx_swbd = &tx_ring->tx_swbd[*i];
69797ff888d3dba Wei Fang 2024-12-19  671  		prefetchw(txbd);
69797ff888d3dba Wei Fang 2024-12-19  672  		*count += 1;
69797ff888d3dba Wei Fang 2024-12-19  673  
69797ff888d3dba Wei Fang 2024-12-19  674  		enetc_clear_tx_bd(&txbd_tmp);
69797ff888d3dba Wei Fang 2024-12-19  675  		txbd_tmp.addr = cpu_to_le64(dma);
69797ff888d3dba Wei Fang 2024-12-19  676  		txbd_tmp.buf_len = cpu_to_le16(len);
69797ff888d3dba Wei Fang 2024-12-19  677  
69797ff888d3dba Wei Fang 2024-12-19  678  		tx_swbd->dma = dma;
69797ff888d3dba Wei Fang 2024-12-19  679  		tx_swbd->len = len;
69797ff888d3dba Wei Fang 2024-12-19  680  		tx_swbd->is_dma_page = 0;
69797ff888d3dba Wei Fang 2024-12-19  681  		tx_swbd->dir = DMA_TO_DEVICE;
69797ff888d3dba Wei Fang 2024-12-19  682  	}
69797ff888d3dba Wei Fang 2024-12-19  683  
69797ff888d3dba Wei Fang 2024-12-19  684  	frag = &skb_shinfo(skb)->frags[0];
69797ff888d3dba Wei Fang 2024-12-19  685  	for (f = 0; f < skb_shinfo(skb)->nr_frags; f++, frag++) {
69797ff888d3dba Wei Fang 2024-12-19  686  		if (txbd)
69797ff888d3dba Wei Fang 2024-12-19  687  			*txbd = txbd_tmp;
69797ff888d3dba Wei Fang 2024-12-19  688  
69797ff888d3dba Wei Fang 2024-12-19  689  		len = skb_frag_size(frag);
69797ff888d3dba Wei Fang 2024-12-19  690  		dma = skb_frag_dma_map(tx_ring->dev, frag);
69797ff888d3dba Wei Fang 2024-12-19  691  		if (dma_mapping_error(tx_ring->dev, dma))
69797ff888d3dba Wei Fang 2024-12-19  692  			return -ENOMEM;
69797ff888d3dba Wei Fang 2024-12-19  693  
69797ff888d3dba Wei Fang 2024-12-19  694  		/* Get the next BD */
69797ff888d3dba Wei Fang 2024-12-19  695  		enetc_bdr_idx_inc(tx_ring, i);
69797ff888d3dba Wei Fang 2024-12-19  696  		txbd = ENETC_TXBD(*tx_ring, *i);
69797ff888d3dba Wei Fang 2024-12-19  697  		tx_swbd = &tx_ring->tx_swbd[*i];
69797ff888d3dba Wei Fang 2024-12-19  698  		prefetchw(txbd);
69797ff888d3dba Wei Fang 2024-12-19  699  		*count += 1;
69797ff888d3dba Wei Fang 2024-12-19  700  
69797ff888d3dba Wei Fang 2024-12-19  701  		enetc_clear_tx_bd(&txbd_tmp);
69797ff888d3dba Wei Fang 2024-12-19  702  		txbd_tmp.addr = cpu_to_le64(dma);
69797ff888d3dba Wei Fang 2024-12-19  703  		txbd_tmp.buf_len = cpu_to_le16(len);
69797ff888d3dba Wei Fang 2024-12-19  704  
69797ff888d3dba Wei Fang 2024-12-19  705  		tx_swbd->dma = dma;
69797ff888d3dba Wei Fang 2024-12-19  706  		tx_swbd->len = len;
69797ff888d3dba Wei Fang 2024-12-19  707  		tx_swbd->is_dma_page = 1;
69797ff888d3dba Wei Fang 2024-12-19  708  		tx_swbd->dir = DMA_TO_DEVICE;
69797ff888d3dba Wei Fang 2024-12-19  709  	}
69797ff888d3dba Wei Fang 2024-12-19  710  
69797ff888d3dba Wei Fang 2024-12-19  711  	/* Last BD needs 'F' bit set */
69797ff888d3dba Wei Fang 2024-12-19  712  	flags |= ENETC_TXBD_FLAGS_F;
69797ff888d3dba Wei Fang 2024-12-19  713  	txbd_tmp.flags = flags;
69797ff888d3dba Wei Fang 2024-12-19  714  	*txbd = txbd_tmp;
69797ff888d3dba Wei Fang 2024-12-19  715  
69797ff888d3dba Wei Fang 2024-12-19 @716  	tx_swbd->is_eof = 1;
69797ff888d3dba Wei Fang 2024-12-19  717  	tx_swbd->skb = skb;
69797ff888d3dba Wei Fang 2024-12-19  718  
69797ff888d3dba Wei Fang 2024-12-19  719  	return 0;
69797ff888d3dba Wei Fang 2024-12-19  720  }
69797ff888d3dba Wei Fang 2024-12-19  721  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
