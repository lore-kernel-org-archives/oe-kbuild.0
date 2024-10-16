Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F962189F57
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Oct 2024 05:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729055292; cv=none; b=OXZ3vdEStL9IJl5cUZX0dX+pvEdIj0Ev5rDqSLFYv14iBc1yJv4jGhFcwr9W2J4nUWqK6mnzCLMHof9F+7MzvDzLLpvMpgzZvaoF7K/R1xGQ+B1DKMemNQvfFA6YPVxhkkgeoLlWq7FJZrebS6fvQ13E1cVHTUVVsRpMXwIBneo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729055292; c=relaxed/simple;
	bh=CmdgCav4LUkICFmEzTG7PxNznpDUFbSJkl6JscoMT8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qdgIad5Nfn0Sby45J5GwT98PdA5XD14CiVLFL+wXeqV7VW+ehEM3yEatblMp6fcZ/zS2cQ0e1MgRlscYDN8TgdrY3gW4BlvPh7PNWouEGG9JDZAVjKhW1pPutmsLdFkE3lEcxnI7zyWrWBs5uyJPl0GC/qN5KUD8w3C8HYfR6bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbsuIHWh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbsuIHWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729055288; x=1760591288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CmdgCav4LUkICFmEzTG7PxNznpDUFbSJkl6JscoMT8A=;
  b=dbsuIHWhiWcfbZjAwCII7xSkioHXhWMLjx1dgu3H+2s630zdbSgtE18r
   hTtrV8pbmGNydPj1vuoktY+DY+WyPWPWNBN67E4tazq+RfbeI9kMN+LwP
   RCtp6qkKT0cQWkqBon+9r5LeqPUt9r3lpHrt0Kc6zLz7bOjFWne/daQNd
   EbVXdfK9y/aCJdJCBbY2FigQuujwgbmBa3szQGmb5T1xkSmXv+e0ltckb
   eVb/NP6PweYlpMvKpf7fcQb6yP0AvzfY18HV9M+sqt8XmnI9O5cc7faKT
   SDo0DJAyRc/6QMdqsdqudl9XEOveRtfZxC5uKQbsVAihU1GXeywFPIGWL
   w==;
X-CSE-ConnectionGUID: wHFoYEqISlaqw9jLdHlnrA==
X-CSE-MsgGUID: XYAHFKAjR7CN6fPTdZb7uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28681940"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="28681940"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 22:07:55 -0700
X-CSE-ConnectionGUID: cz+u8wByTfybBuQKbY8Olg==
X-CSE-MsgGUID: oMzwPb3OQ2+nKpzCHcXEZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="101432862"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Oct 2024 22:07:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0wGF-000KKl-3B;
	Wed, 16 Oct 2024 05:07:51 +0000
Date: Wed, 16 Oct 2024 13:07:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/renesas/rswitch.c:324
 rswitch_gwca_queue_alloc() warn: missing unwind goto?
Message-ID: <202410161230.IOnfdggt-lkp@intel.com>
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
TO: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2
commit: 6a203cb5165d2257e8d54193b69afdb480a17f6f net: rswitch: Use build_skb() for RX
date:   10 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 10 months ago
config: sparc64-randconfig-r072-20241015 (https://download.01.org/0day-ci/archive/20241016/202410161230.IOnfdggt-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410161230.IOnfdggt-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/renesas/rswitch.c:324 rswitch_gwca_queue_alloc() warn: missing unwind goto?

vim +324 drivers/net/ethernet/renesas/rswitch.c

33f5d733b589031 Yoshihiro Shimoda 2023-02-09  299  
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  300  static int rswitch_gwca_queue_alloc(struct net_device *ndev,
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  301  				    struct rswitch_private *priv,
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  302  				    struct rswitch_gwca_queue *gq,
8857034184538ca Yoshihiro Shimoda 2023-12-08  303  				    bool dir_tx, unsigned int ring_size)
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  304  {
8857034184538ca Yoshihiro Shimoda 2023-12-08  305  	unsigned int i, bit;
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  306  
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  307  	gq->dir_tx = dir_tx;
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  308  	gq->ring_size = ring_size;
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  309  	gq->ndev = ndev;
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  310  
48cf0a25702b2d1 Yoshihiro Shimoda 2023-02-09  311  	if (!dir_tx) {
6a203cb5165d225 Yoshihiro Shimoda 2023-12-08  312  		gq->rx_bufs = kcalloc(gq->ring_size, sizeof(*gq->rx_bufs), GFP_KERNEL);
6a203cb5165d225 Yoshihiro Shimoda 2023-12-08  313  		if (!gq->rx_bufs)
6a203cb5165d225 Yoshihiro Shimoda 2023-12-08  314  			return -ENOMEM;
6a203cb5165d225 Yoshihiro Shimoda 2023-12-08  315  		if (rswitch_gwca_queue_alloc_rx_buf(gq, 0, gq->ring_size) < 0)
6a203cb5165d225 Yoshihiro Shimoda 2023-12-08  316  			goto out;
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  317  
251eadcc640a0b5 Yoshihiro Shimoda 2023-02-09  318  		gq->rx_ring = dma_alloc_coherent(ndev->dev.parent,
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  319  						 sizeof(struct rswitch_ext_ts_desc) *
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  320  						 (gq->ring_size + 1), &gq->ring_dma, GFP_KERNEL);
48cf0a25702b2d1 Yoshihiro Shimoda 2023-02-09  321  	} else {
6a203cb5165d225 Yoshihiro Shimoda 2023-12-08  322  		gq->skbs = kcalloc(gq->ring_size, sizeof(*gq->skbs), GFP_KERNEL);
6a203cb5165d225 Yoshihiro Shimoda 2023-12-08  323  		if (!gq->skbs)
6a203cb5165d225 Yoshihiro Shimoda 2023-12-08 @324  			return -ENOMEM;
251eadcc640a0b5 Yoshihiro Shimoda 2023-02-09  325  		gq->tx_ring = dma_alloc_coherent(ndev->dev.parent,
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  326  						 sizeof(struct rswitch_ext_desc) *
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  327  						 (gq->ring_size + 1), &gq->ring_dma, GFP_KERNEL);
48cf0a25702b2d1 Yoshihiro Shimoda 2023-02-09  328  	}
48cf0a25702b2d1 Yoshihiro Shimoda 2023-02-09  329  
251eadcc640a0b5 Yoshihiro Shimoda 2023-02-09  330  	if (!gq->rx_ring && !gq->tx_ring)
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  331  		goto out;
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  332  
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  333  	i = gq->index / 32;
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  334  	bit = BIT(gq->index % 32);
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  335  	if (dir_tx)
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  336  		priv->gwca.tx_irq_bits[i] |= bit;
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  337  	else
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  338  		priv->gwca.rx_irq_bits[i] |= bit;
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  339  
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  340  	return 0;
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  341  
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  342  out:
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  343  	rswitch_gwca_queue_free(ndev, gq);
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  344  
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  345  	return -ENOMEM;
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  346  }
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  347  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
