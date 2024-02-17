Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E37D4F1F5
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Feb 2024 10:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708166683; cv=none; b=LJAKQ0VL+rFOibkNG6Udav+RR1OH/uV2zC28LB9HZusXCir6pc0+PtoI0fs+2Xh7t9OA2BzOuV8fbjqC9mhWC5VB2nMBs58lXn3rEM6gZPASlzvZeyI88XOClU4e+26ISxkIWZhD+FlZpBzGqVpbBeRtcZZAa4DNFOHidiqpGmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708166683; c=relaxed/simple;
	bh=GHRX29gbmbVyL6z2lGF1LdoHwqUsB2tcTYIVwb20bAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tYFOm+ntv+G8/7PWyWdTSvWSCll0OesbME034IwBDyUvFHIMWzrDs/Zu71qwsUdRAF1SMWUIkUSukZvPpHSCVtxWGXf7HSmUqVHlTYWlpY5p7z1wWRlWsjBBWWinLdepCi25/QpFMb8feIX3M2y9oKTYFLXcxBBP4D70iKvVEpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MAOjbHa0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MAOjbHa0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708166682; x=1739702682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GHRX29gbmbVyL6z2lGF1LdoHwqUsB2tcTYIVwb20bAU=;
  b=MAOjbHa00neJr3JSfZtXnoNhUi/DGE4q9Kgxa19kvgdNXGqFKBXU6WA9
   mdAZWgQ6KS2lHJMV0bynEyUARd5rs6udWCMGoFAO7xjoGgMhMXdpRbQaA
   fv6dgLSBdc+ekQGyIcdV3RLs3HTH8Op586d4njq1xgK2n3rJD02bmlN0X
   uYO0MxvIlNjKGzb8ZUdvJLpdMC5YX0FMeEP7dlSjuEMH8V5oUGkb84cVq
   UFtqOfXLXC+hjCJu+/xaSA5rWhqltvk2+WJd1dT7UDv3UxsGjSAXbd2MR
   wuyp3Yj5Gtq6MgHPaOHkbiXD1kyODirKQg85POF8vVsz+Ic/Vh18zpCdj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="2170747"
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="2170747"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 02:44:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="935983320"
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="935983320"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2024 02:44:40 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbIBO-00023F-0k;
	Sat, 17 Feb 2024 10:44:35 +0000
Date: Sat, 17 Feb 2024 18:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/renesas/rswitch.c:324
 rswitch_gwca_queue_alloc() warn: missing unwind goto?
Message-ID: <202402171836.jYRQfB3I-lkp@intel.com>
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
head:   c1ca10ceffbb289ed02feaf005bc9ee6095b4507
commit: 6a203cb5165d2257e8d54193b69afdb480a17f6f net: rswitch: Use build_skb() for RX
date:   10 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 10 weeks ago
config: openrisc-randconfig-r071-20240215 (https://download.01.org/0day-ci/archive/20240217/202402171836.jYRQfB3I-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402171836.jYRQfB3I-lkp@intel.com/

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
