Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4362F13D518
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Nov 2024 14:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731941929; cv=none; b=Dtrqc4tbZLnNVm7YbD9kRGeLYUNMaSlBfG+hOEjhBU3YnkFq9wszxZjgt8QcHurBSGYSyq91FSBl+heIF5RAbx48MOkrjCQacbUG+N6N7jUpNLOHMdlRHRcFaqwPYcDaq8xdInri4D/+6VxWGZaE11Dm7sv4+8UzVCx9ljJp4Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731941929; c=relaxed/simple;
	bh=VZrOuAJ1U177jFf1mZGUjLXKgZUS7p8S9+VrsdQxJLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fl7OVqHFx5UNqeaOV3ABxgZKQVRhx8XS5vActzYcF2e9GPQRBsNh2bHduuuCmuI0RpLc1JbdmVdwAUtx5qzUs6gDQ5e8yAgsI9O7ldA35XRLQFywyLvstdebcE8TA9FXWTsTmSmnhQsNzVeUdfhJK9vWju2RLJdsqmkmlShAeGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XPbmzhmL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XPbmzhmL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731941927; x=1763477927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VZrOuAJ1U177jFf1mZGUjLXKgZUS7p8S9+VrsdQxJLg=;
  b=XPbmzhmLYi/wrV18zz0sW0J7bELLHHOHfDOxgrJjYBirGfEE3fuM/oFj
   jgd97gS5N8XnB65A5r+K+SlNYKH6VOfypvIPklSvhPIFdG911DLCQ32EU
   VQ/2OK0YtVSYPne6cWmHJNF5MGu3lSCBrm1i8JAtywvLwPXyAA/Vct+Zs
   x0zlCfKfafPZgEPXsGlvHK1oqs7I7iogXf2o00mu+aL12MML/hv9ExbEI
   hA0bR9L4kF00jXgDhJjnoNAwFlP02N9zhSbG4fGKhm8O6x1Yhkhl64UDk
   upHCn8doEk6WU6XWTgxccapfNsrz/R1KLiG5xD1l/z6d8nuARwNlJ0irw
   A==;
X-CSE-ConnectionGUID: Qfrm/JsmSaW5+iH65e4IbA==
X-CSE-MsgGUID: jJuZ46z5RcmyPuoqjPNrpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32136211"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="32136211"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 06:58:47 -0800
X-CSE-ConnectionGUID: 6Nwf28JVRJiGEI5pNHiugA==
X-CSE-MsgGUID: AUQwPd+IT/Oqa3/3PPO5sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="89656533"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Nov 2024 06:58:46 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD3D9-0002UJ-0t;
	Mon, 18 Nov 2024 14:58:43 +0000
Date: Mon, 18 Nov 2024 22:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/renesas/rswitch.c:324
 rswitch_gwca_queue_alloc() warn: missing unwind goto?
Message-ID: <202411182217.dw4mXBjx-lkp@intel.com>
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
head:   adc218676eef25575469234709c2d87185ca223a
commit: 6a203cb5165d2257e8d54193b69afdb480a17f6f net: rswitch: Use build_skb() for RX
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: loongarch-randconfig-r071-20241118 (https://download.01.org/0day-ci/archive/20241118/202411182217.dw4mXBjx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411182217.dw4mXBjx-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/renesas/rswitch.c:324 rswitch_gwca_queue_alloc() warn: missing unwind goto?

vim +324 drivers/net/ethernet/renesas/rswitch.c

33f5d733b58903 Yoshihiro Shimoda 2023-02-09  299  
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  300  static int rswitch_gwca_queue_alloc(struct net_device *ndev,
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  301  				    struct rswitch_private *priv,
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  302  				    struct rswitch_gwca_queue *gq,
8857034184538c Yoshihiro Shimoda 2023-12-08  303  				    bool dir_tx, unsigned int ring_size)
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  304  {
8857034184538c Yoshihiro Shimoda 2023-12-08  305  	unsigned int i, bit;
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  306  
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  307  	gq->dir_tx = dir_tx;
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  308  	gq->ring_size = ring_size;
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  309  	gq->ndev = ndev;
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  310  
48cf0a25702b2d Yoshihiro Shimoda 2023-02-09  311  	if (!dir_tx) {
6a203cb5165d22 Yoshihiro Shimoda 2023-12-08  312  		gq->rx_bufs = kcalloc(gq->ring_size, sizeof(*gq->rx_bufs), GFP_KERNEL);
6a203cb5165d22 Yoshihiro Shimoda 2023-12-08  313  		if (!gq->rx_bufs)
6a203cb5165d22 Yoshihiro Shimoda 2023-12-08  314  			return -ENOMEM;
6a203cb5165d22 Yoshihiro Shimoda 2023-12-08  315  		if (rswitch_gwca_queue_alloc_rx_buf(gq, 0, gq->ring_size) < 0)
6a203cb5165d22 Yoshihiro Shimoda 2023-12-08  316  			goto out;
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  317  
251eadcc640a0b Yoshihiro Shimoda 2023-02-09  318  		gq->rx_ring = dma_alloc_coherent(ndev->dev.parent,
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  319  						 sizeof(struct rswitch_ext_ts_desc) *
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  320  						 (gq->ring_size + 1), &gq->ring_dma, GFP_KERNEL);
48cf0a25702b2d Yoshihiro Shimoda 2023-02-09  321  	} else {
6a203cb5165d22 Yoshihiro Shimoda 2023-12-08  322  		gq->skbs = kcalloc(gq->ring_size, sizeof(*gq->skbs), GFP_KERNEL);
6a203cb5165d22 Yoshihiro Shimoda 2023-12-08  323  		if (!gq->skbs)
6a203cb5165d22 Yoshihiro Shimoda 2023-12-08 @324  			return -ENOMEM;
251eadcc640a0b Yoshihiro Shimoda 2023-02-09  325  		gq->tx_ring = dma_alloc_coherent(ndev->dev.parent,
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  326  						 sizeof(struct rswitch_ext_desc) *
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  327  						 (gq->ring_size + 1), &gq->ring_dma, GFP_KERNEL);
48cf0a25702b2d Yoshihiro Shimoda 2023-02-09  328  	}
48cf0a25702b2d Yoshihiro Shimoda 2023-02-09  329  
251eadcc640a0b Yoshihiro Shimoda 2023-02-09  330  	if (!gq->rx_ring && !gq->tx_ring)
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  331  		goto out;
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  332  
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  333  	i = gq->index / 32;
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  334  	bit = BIT(gq->index % 32);
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  335  	if (dir_tx)
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  336  		priv->gwca.tx_irq_bits[i] |= bit;
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  337  	else
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  338  		priv->gwca.rx_irq_bits[i] |= bit;
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  339  
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  340  	return 0;
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  341  
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  342  out:
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  343  	rswitch_gwca_queue_free(ndev, gq);
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  344  
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  345  	return -ENOMEM;
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  346  }
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  347  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
