Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7CF4D8A3
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Dec 2024 20:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733083375; cv=none; b=bqapgEYHGaTWETi/d6xE2yw2XC3Avp0G6W8nvX2ADWdVhbZMbCbdoJuGAbIz47cH3RqWHA6SbnxtsqzK/UzB4hO9iTLEvf5gDFCS3Teo3IRtMi7QfwJtzjq1epcoAvCTG2L3LrDIQruZ/dqvbH9xycab7XAFc/fqa3aEq2nZMlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733083375; c=relaxed/simple;
	bh=AKmiz143Qc6OMYB6JBsgDmH2pJQfdLM8yAFFblBXJpU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fVbpu9dFFRiIH1uoSg4/SABUANhAC9RlRPEfA8khQPtcscJ8RiVVrHF6JW/quVwoNX4dSToDnlv55A5fOQeaTftRreZnHts3jZ8u86GLqze4bwLt5F7tTfGBk6EcIwQyMqOqA+6ChsKVn2+/6zf3nbClaMRgAxm73SMX1T7nju0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ew8x2kkq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ew8x2kkq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733083373; x=1764619373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AKmiz143Qc6OMYB6JBsgDmH2pJQfdLM8yAFFblBXJpU=;
  b=ew8x2kkqb5Glg7sLIpV7NMrr96qp8KD1nmuRJrmLxXY0JjYCzFROPPH2
   8O7s8Qwg1WnL/mr3eSLLtB8AF540YXZ9L97vBjeXVs+ns6Yd1Jk89oACq
   MErX/SHbuX7RAQYLNv7BEPV1RLXQFper2W7NGRWtm/IOCXD+2N+Xq5VpF
   uchHVBOytF1iYOiKaCsUgKleBUtF/OYphAwvX1RhDFCrlCB/22ds8tONc
   HfgpAH77w500o4AjfF6GSEr/AERGPx2kta/BT/jxYsWautcu8OaEZ7Udu
   vomWlKuK980WSt9lQUrmrtvWjUhJxlpQHoyO7TtuJIfNeYwaWot7pNYjy
   A==;
X-CSE-ConnectionGUID: FIPC35MSSA6abHTh+2jMng==
X-CSE-MsgGUID: exGgJrmISkeJ7qQHfhInmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="50762359"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="50762359"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 12:02:53 -0800
X-CSE-ConnectionGUID: RRxIIlZRQ+iNwhdNZ2w9xg==
X-CSE-MsgGUID: fyS+eNirTD2elKPloLJ9XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="93085245"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 01 Dec 2024 12:02:52 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHq9Z-0001of-2B;
	Sun, 01 Dec 2024 20:02:49 +0000
Date: Mon, 2 Dec 2024 04:01:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/actions/owl-emac.c:210
 owl_emac_ring_prepare_rx() error: uninitialized symbol 'desc'.
Message-ID: <202412020332.8MdB0i7n-lkp@intel.com>
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
TO: Cai Huoqing <caihuoqing@baidu.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc8eda6d34934d80b96adb8dc4ff5dfc632a53a
commit: fbcf8a340150abd20bf44fc706362b0827157fe8 net: ethernet: actions: Add helper dependency on COMPILE_TEST
date:   3 years, 3 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 3 years, 3 months ago
config: hexagon-randconfig-r071-20241118 (https://download.01.org/0day-ci/archive/20241202/202412020332.8MdB0i7n-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412020332.8MdB0i7n-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/actions/owl-emac.c:210 owl_emac_ring_prepare_rx() error: uninitialized symbol 'desc'.
drivers/net/ethernet/actions/owl-emac.c:233 owl_emac_ring_prepare_tx() error: uninitialized symbol 'desc'.

vim +/desc +210 drivers/net/ethernet/actions/owl-emac.c

de6e0b19823985 Cristian Ciocaltea 2021-03-22  178  
de6e0b19823985 Cristian Ciocaltea 2021-03-22  179  static int owl_emac_ring_prepare_rx(struct owl_emac_priv *priv)
de6e0b19823985 Cristian Ciocaltea 2021-03-22  180  {
de6e0b19823985 Cristian Ciocaltea 2021-03-22  181  	struct owl_emac_ring *ring = &priv->rx_ring;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  182  	struct device *dev = owl_emac_get_dev(priv);
de6e0b19823985 Cristian Ciocaltea 2021-03-22  183  	struct net_device *netdev = priv->netdev;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  184  	struct owl_emac_ring_desc *desc;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  185  	struct sk_buff *skb;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  186  	dma_addr_t dma_addr;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  187  	int i;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  188  
de6e0b19823985 Cristian Ciocaltea 2021-03-22  189  	for (i = 0; i < ring->size; i++) {
de6e0b19823985 Cristian Ciocaltea 2021-03-22  190  		skb = owl_emac_alloc_skb(netdev);
de6e0b19823985 Cristian Ciocaltea 2021-03-22  191  		if (!skb)
de6e0b19823985 Cristian Ciocaltea 2021-03-22  192  			return -ENOMEM;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  193  
de6e0b19823985 Cristian Ciocaltea 2021-03-22  194  		dma_addr = owl_emac_dma_map_rx(priv, skb);
de6e0b19823985 Cristian Ciocaltea 2021-03-22  195  		if (dma_mapping_error(dev, dma_addr)) {
de6e0b19823985 Cristian Ciocaltea 2021-03-22  196  			dev_kfree_skb(skb);
de6e0b19823985 Cristian Ciocaltea 2021-03-22  197  			return -ENOMEM;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  198  		}
de6e0b19823985 Cristian Ciocaltea 2021-03-22  199  
de6e0b19823985 Cristian Ciocaltea 2021-03-22  200  		desc = &ring->descs[i];
de6e0b19823985 Cristian Ciocaltea 2021-03-22  201  		desc->status = OWL_EMAC_BIT_RDES0_OWN;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  202  		desc->control = skb_tailroom(skb) & OWL_EMAC_MSK_RDES1_RBS1;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  203  		desc->buf_addr = dma_addr;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  204  		desc->reserved = 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  205  
de6e0b19823985 Cristian Ciocaltea 2021-03-22  206  		ring->skbs[i] = skb;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  207  		ring->skbs_dma[i] = dma_addr;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  208  	}
de6e0b19823985 Cristian Ciocaltea 2021-03-22  209  
de6e0b19823985 Cristian Ciocaltea 2021-03-22 @210  	desc->control |= OWL_EMAC_BIT_RDES1_RER;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  211  
de6e0b19823985 Cristian Ciocaltea 2021-03-22  212  	ring->head = 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  213  	ring->tail = 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  214  
de6e0b19823985 Cristian Ciocaltea 2021-03-22  215  	return 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  216  }
de6e0b19823985 Cristian Ciocaltea 2021-03-22  217  
de6e0b19823985 Cristian Ciocaltea 2021-03-22  218  static void owl_emac_ring_prepare_tx(struct owl_emac_priv *priv)
de6e0b19823985 Cristian Ciocaltea 2021-03-22  219  {
de6e0b19823985 Cristian Ciocaltea 2021-03-22  220  	struct owl_emac_ring *ring = &priv->tx_ring;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  221  	struct owl_emac_ring_desc *desc;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  222  	int i;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  223  
de6e0b19823985 Cristian Ciocaltea 2021-03-22  224  	for (i = 0; i < ring->size; i++) {
de6e0b19823985 Cristian Ciocaltea 2021-03-22  225  		desc = &ring->descs[i];
de6e0b19823985 Cristian Ciocaltea 2021-03-22  226  
de6e0b19823985 Cristian Ciocaltea 2021-03-22  227  		desc->status = 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  228  		desc->control = OWL_EMAC_BIT_TDES1_IC;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  229  		desc->buf_addr = 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  230  		desc->reserved = 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  231  	}
de6e0b19823985 Cristian Ciocaltea 2021-03-22  232  
de6e0b19823985 Cristian Ciocaltea 2021-03-22 @233  	desc->control |= OWL_EMAC_BIT_TDES1_TER;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  234  
de6e0b19823985 Cristian Ciocaltea 2021-03-22  235  	memset(ring->skbs_dma, 0, sizeof(dma_addr_t) * ring->size);
de6e0b19823985 Cristian Ciocaltea 2021-03-22  236  
de6e0b19823985 Cristian Ciocaltea 2021-03-22  237  	ring->head = 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  238  	ring->tail = 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  239  }
de6e0b19823985 Cristian Ciocaltea 2021-03-22  240  

:::::: The code at line 210 was first introduced by commit
:::::: de6e0b198239857943db395377dc1d2ddd6c05df net: ethernet: actions: Add Actions Semi Owl Ethernet MAC driver

:::::: TO: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
