Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E65360745
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Mar 2026 19:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773083896; cv=none; b=tpGm+mkbpz8pjRYeiCE6clPq7CZA6yuAAWCHhXFKvlD2+YvWe6rI0G7e4ZlQRYa37tLvWcgHJoEdTWbyQjhhsGam+k2oRsKx7iRQ5E7m2YTYnFenIomuo+SpGWjT4tVzXiJdfJPmauDCCawkFAq7ei2ERpafyn41j4257S1YStQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773083896; c=relaxed/simple;
	bh=ckin54Iv7OkPjzZs/kUWTHdUZX+eXehC0OKI8R0SS84=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hqDwH9U3G5IbPt9v7JSJE8JNd3UNYN9nYHtnyNsH4fOQ27LjaiGfej7ncEyS1ckRJ3j/zNtESbAgbm7F4BOGL+GT6DNy0Wz6mpezVzJbIgV4UlqqGLqzddWHv2s6wOQ0UScNKUyaPYeoNwPKnNtvb1ylbrg96xdGakELnGk5Bbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=moS+dv2J; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="moS+dv2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773083892; x=1804619892;
  h=date:from:to:cc:subject:message-id;
  bh=ckin54Iv7OkPjzZs/kUWTHdUZX+eXehC0OKI8R0SS84=;
  b=moS+dv2Jd0rvHLTSVC9NVl4ezqo6e3mf/goO2uutEubd2GzmgFzphyNP
   x1J+o4AQHPRApIWBdBLHcQ2bpijODy2F0bH/wotyFdK+PNZvxuUQAG/D6
   73g4Ut4I/9QDjSv3/1cGp11KABsFp44NHgqicbf1gJjVHkaHMXYmFuqhG
   NXUvg+Jmp0joiEVgJSq6csJqAeU3I1mIvOYhPNeKgCi4E/lPrk7fSRwVK
   wjiSYQZZHFdOQ3zqZgM/yw7/KN7Q2kH7a+r+KsxdUIoBqhDJkd/XPkggU
   ukFqO//HyzD0dMI828yyLtSV1TDDXFXJ1NwLLbz8PzLrWOXBmLi/0xxbU
   Q==;
X-CSE-ConnectionGUID: 7F51vr97TrWfW+9vhlERMg==
X-CSE-MsgGUID: iKYS1YmyTwmvyleuhhJCnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="91691056"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="91691056"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 12:18:11 -0700
X-CSE-ConnectionGUID: v+3TyrwUT9mfYu6BQDCq9g==
X-CSE-MsgGUID: cHzxWgJJTXusxKvl/752GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="219064079"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Mar 2026 12:18:10 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzg7C-000000000ka-4AKQ;
	Mon, 09 Mar 2026 19:18:06 +0000
Date: Tue, 10 Mar 2026 03:17:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [net-next:main 28/62]
 drivers/net/ethernet/airoha/airoha_eth.c:1727 airhoha_set_gdm2_loopback()
 warn: subtract is higher precedence than shift
Message-ID: <202603100304.07P7zt0l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: netdev@vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git main
head:   0bcac7b11262557c990da1ac564d45777eb6b005
commit: 7600fb3b41dd6ab65ed61169df1b6099044edf97 [28/62] net: airoha: Rely __field_prep for non-constant masks
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: openrisc-randconfig-r073-20260309 (https://download.01.org/0day-ci/archive/20260310/202603100304.07P7zt0l-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603100304.07P7zt0l-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/airoha/airoha_eth.c:1727 airhoha_set_gdm2_loopback() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:1727 airhoha_set_gdm2_loopback() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:1727 airhoha_set_gdm2_loopback() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:1727 airhoha_set_gdm2_loopback() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:1782 airoha_dev_init() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:1782 airoha_dev_init() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:1782 airoha_dev_init() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:1782 airoha_dev_init() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:2139 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:2139 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:2139 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:2139 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than shift

vim +1727 drivers/net/ethernet/airoha/airoha_eth.c

23020f04932701 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2024-07-12  1683  
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1684  static int airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1685  {
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1686  	struct airoha_eth *eth = port->qdma->eth;
e4e5ce823bdd46 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1687  	u32 val, pse_port, chan, nbq;
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1688  	int src_port;
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1689  
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1690  	/* Forward the traffic to the proper GDM port */
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1691  	pse_port = port->id == AIROHA_GDM3_IDX ? FE_PSE_PORT_GDM3
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1692  					       : FE_PSE_PORT_GDM4;
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1693  	airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(AIROHA_GDM2_IDX),
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1694  				    pse_port);
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1695  	airoha_fe_clear(eth, REG_GDM_FWD_CFG(AIROHA_GDM2_IDX),
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1696  			GDM_STRIP_CRC_MASK);
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1697  
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1698  	/* Enable GDM2 loopback */
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1699  	airoha_fe_wr(eth, REG_GDM_TXCHN_EN(AIROHA_GDM2_IDX), 0xffffffff);
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1700  	airoha_fe_wr(eth, REG_GDM_RXCHN_EN(AIROHA_GDM2_IDX), 0xffff);
e4e5ce823bdd46 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1701  
e4e5ce823bdd46 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1702  	chan = port->id == AIROHA_GDM3_IDX ? airoha_is_7581(eth) ? 4 : 3 : 0;
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1703  	airoha_fe_rmw(eth, REG_GDM_LPBK_CFG(AIROHA_GDM2_IDX),
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1704  		      LPBK_CHAN_MASK | LPBK_MODE_MASK | LPBK_EN_MASK,
fea8cdf6738a8b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-08  1705  		      FIELD_PREP(LPBK_CHAN_MASK, chan) |
fea8cdf6738a8b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-08  1706  		      LBK_GAP_MODE_MASK | LBK_LEN_MODE_MASK |
fea8cdf6738a8b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-08  1707  		      LBK_CHAN_MODE_MASK | LPBK_EN_MASK);
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1708  	airoha_fe_rmw(eth, REG_GDM_LEN_CFG(AIROHA_GDM2_IDX),
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1709  		      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1710  		      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1711  		      FIELD_PREP(GDM_LONG_LEN_MASK, AIROHA_MAX_MTU));
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1712  
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1713  	/* Disable VIP and IFC for GDM2 */
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1714  	airoha_fe_clear(eth, REG_FE_VIP_PORT_EN, BIT(AIROHA_GDM2_IDX));
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1715  	airoha_fe_clear(eth, REG_FE_IFC_PORT_EN, BIT(AIROHA_GDM2_IDX));
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1716  
e4e5ce823bdd46 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1717  	/* XXX: handle XSI_USB_PORT and XSI_PCE1_PORT */
e4e5ce823bdd46 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1718  	nbq = port->id == AIROHA_GDM3_IDX && airoha_is_7581(eth) ? 4 : 0;
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1719  	src_port = eth->soc->ops.get_src_port_id(port, nbq);
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1720  	if (src_port < 0)
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1721  		return src_port;
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1722  
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1723  	airoha_fe_rmw(eth, REG_FE_WAN_PORT,
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1724  		      WAN1_EN_MASK | WAN1_MASK | WAN0_MASK,
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1725  		      FIELD_PREP(WAN0_MASK, src_port));
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1726  	val = src_port & SP_CPORT_DFT_MASK;
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28 @1727  	airoha_fe_rmw(eth,
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1728  		      REG_SP_DFT_CPORT(src_port >> fls(SP_CPORT_DFT_MASK)),
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1729  		      SP_CPORT_MASK(val),
7600fb3b41dd6a drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-03-04  1730  		      __field_prep(SP_CPORT_MASK(val), FE_PSE_PORT_CDM2));
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1731  
e4e5ce823bdd46 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1732  	if (port->id != AIROHA_GDM3_IDX && airoha_is_7581(eth))
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1733  		airoha_fe_rmw(eth, REG_SRC_PORT_FC_MAP6,
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1734  			      FC_ID_OF_SRC_PORT24_MASK,
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1735  			      FIELD_PREP(FC_ID_OF_SRC_PORT24_MASK, 2));
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1736  
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1737  	return 0;
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1738  }
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1739  
23020f04932701 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2024-07-12  1740  static int airoha_dev_init(struct net_device *dev)
23020f04932701 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2024-07-12  1741  {
23020f04932701 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2024-07-12  1742  	struct airoha_gdm_port *port = netdev_priv(dev);
c71a7a861ef02a drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1743  	struct airoha_qdma *qdma = port->qdma;
c71a7a861ef02a drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1744  	struct airoha_eth *eth = qdma->eth;
c71a7a861ef02a drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1745  	u32 pse_port, fe_cpu_port;
c71a7a861ef02a drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1746  	u8 ppe_id;
23020f04932701 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2024-07-12  1747  
812a2751e827fa drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2024-08-21  1748  	airoha_set_macaddr(port, dev->dev_addr);
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1749  
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1750  	switch (port->id) {
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1751  	case AIROHA_GDM3_IDX:
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1752  	case AIROHA_GDM4_IDX:
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1753  		/* If GDM2 is active we can't enable loopback */
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1754  		if (!eth->ports[1]) {
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1755  			int err;
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1756  
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1757  			err = airhoha_set_gdm2_loopback(port);
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1758  			if (err)
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1759  				return err;
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1760  		}
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1761  		fallthrough;
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1762  	case AIROHA_GDM2_IDX:
ef9449f080b619 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1763  		if (airoha_ppe_is_enabled(eth, 1)) {
c71a7a861ef02a drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1764  			/* For PPE2 always use secondary cpu port. */
c71a7a861ef02a drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1765  			fe_cpu_port = FE_PSE_PORT_CDM2;
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1766  			pse_port = FE_PSE_PORT_PPE2;
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1767  			break;
ef9449f080b619 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1768  		}
ef9449f080b619 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1769  		fallthrough;
c71a7a861ef02a drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1770  	default: {
c71a7a861ef02a drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1771  		u8 qdma_id = qdma - &eth->qdma[0];
c71a7a861ef02a drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1772  
c71a7a861ef02a drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1773  		/* For PPE1 select cpu port according to the running QDMA. */
c71a7a861ef02a drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1774  		fe_cpu_port = qdma_id ? FE_PSE_PORT_CDM2 : FE_PSE_PORT_CDM1;
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1775  		pse_port = FE_PSE_PORT_PPE1;
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1776  		break;
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1777  	}
c71a7a861ef02a drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1778  	}
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1779  
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1780  	airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(port->id), pse_port);
c71a7a861ef02a drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1781  	ppe_id = pse_port == FE_PSE_PORT_PPE2 ? 1 : 0;
c71a7a861ef02a drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17 @1782  	airoha_fe_rmw(eth, REG_PPE_DFT_CPORT0(ppe_id),
c71a7a861ef02a drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1783  		      DFT_CPORT_MASK(port->id),
7600fb3b41dd6a drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-03-04  1784  		      __field_prep(DFT_CPORT_MASK(port->id), fe_cpu_port));
23020f04932701 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2024-07-12  1785  
23020f04932701 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2024-07-12  1786  	return 0;
23020f04932701 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2024-07-12  1787  }
23020f04932701 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2024-07-12  1788  

:::::: The code at line 1727 was first introduced by commit
:::::: 9cd451d414f6e29f507a216fb3b19fa68c011f8c net: airoha: Add loopback support for GDM2

:::::: TO: Lorenzo Bianconi <lorenzo@kernel.org>
:::::: CC: Paolo Abeni <pabeni@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
