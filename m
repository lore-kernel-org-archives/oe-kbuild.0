Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D088306B37
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Apr 2026 03:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775618332; cv=none; b=MY3iQWzV4CnDUdZGlZjTWHRNuvYfg3/A9ek4AmqPyj7ZrCPS3ro0NRCmmhJQgy4PIbqYb+QnZ3zK3UFx5ycbm+23Umabq+GCMJ1eRDwjVPE3TRaSPXr8oIT8fGLZrPUHuqdJ6iET/jex8o6xkYtJo2QZs0h84MRaABufL2oygWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775618332; c=relaxed/simple;
	bh=lCv5cPMiZrCfp9i/Elk9cFxNxXuIWt3pnSebdpdMhr8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gkcn02xiUGr6cQkH53IHiXyd1ZH7ZmpvQND97uZ05PLeNqPhKlcuQ2ZC4i5ubT87UMOZYLaNZsN8QX60wqDhpr1AHpIJAccKEvlFBIe4RpyB4kffZwZMGZfmRFOvpS5Gyfy2FZznke+INOiPNEJRbSCgH7y/+h8CMVpkqWmYmCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DhKVmYIJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DhKVmYIJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775618329; x=1807154329;
  h=date:from:to:cc:subject:message-id;
  bh=lCv5cPMiZrCfp9i/Elk9cFxNxXuIWt3pnSebdpdMhr8=;
  b=DhKVmYIJWtz2lwOY3YkObxyPm1LbVq6sKmRROLXKtYTMAbub2tyRCGmH
   +goTuZTF3JHdJiA93He7qWH72MJJYrcEhPQwTZVyBycZ/jYYo+zNo/95w
   IPLGxAv/lsz0ifdc+cw5Ms/56j3RRAhSk1H+yaSUr1sxPC7l4W5RiWaE0
   c0qyJqa1dfD1yjYNrwdaNK6XtWK7HZHdxXMt8mmGthi9bYSuft9k2GjmD
   hi0gRE6Bal5eabaIpztRQ+XK+lvri6tqm3C/I83TLk2v5RRMyaK5YLIrL
   tXfU7tVNvDxc9X/SWiLPOSVlW42YN8aQPL4UlMjSgBbDxkc+fJXgKaXSw
   Q==;
X-CSE-ConnectionGUID: o/Ccj/1tSdaUn57WZ7B1FQ==
X-CSE-MsgGUID: XRoti571SKeLAx8kZCC36g==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80187130"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="80187130"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 20:18:48 -0700
X-CSE-ConnectionGUID: bElF63S5Ri+4C8fih/aEAw==
X-CSE-MsgGUID: AbTu1o6MRw60txxU1/pmpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="251665894"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Apr 2026 20:18:47 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAJRE-000000001N3-3Bsl;
	Wed, 08 Apr 2026 03:18:44 +0000
Date: Wed, 08 Apr 2026 11:18:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9739/12445]
 drivers/net/ethernet/airoha/airoha_eth.c:1755 airoha_set_gdm2_loopback()
 warn: subtract is higher precedence than shift
Message-ID: <202604081148.WNMxbBvS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f3e6330d7fe42b204af05a2dbc68b379e0ad179e
commit: a94ddc191f19579a7e0a5da2c012f1048ce10262 [9739/12445] net: airoha: Fix typo in airoha_set_gdm2_loopback routine name
:::::: branch date: 13 hours ago
:::::: commit date: 7 days ago
config: um-randconfig-r073-20260408 (https://download.01.org/0day-ci/archive/20260408/202604081148.WNMxbBvS-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604081148.WNMxbBvS-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/airoha/airoha_eth.c:1755 airoha_set_gdm2_loopback() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:1755 airoha_set_gdm2_loopback() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:1755 airoha_set_gdm2_loopback() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:1755 airoha_set_gdm2_loopback() warn: subtract is higher precedence than shift

Old smatch warnings:
drivers/net/ethernet/airoha/airoha_eth.c:2153 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:2153 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:2153 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:2153 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than shift

vim +1755 drivers/net/ethernet/airoha/airoha_eth.c

23020f04932701d drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2024-07-12  1711  
a94ddc191f19579 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-03-30  1712  static int airoha_set_gdm2_loopback(struct airoha_gdm_port *port)
9cd451d414f6e29 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1713  {
9cd451d414f6e29 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1714  	struct airoha_eth *eth = port->qdma->eth;
e4e5ce823bdd460 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1715  	u32 val, pse_port, chan, nbq;
9d5b5219f672c80 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1716  	int src_port;
9cd451d414f6e29 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1717  
9cd451d414f6e29 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1718  	/* Forward the traffic to the proper GDM port */
9d5b5219f672c80 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1719  	pse_port = port->id == AIROHA_GDM3_IDX ? FE_PSE_PORT_GDM3
9d5b5219f672c80 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1720  					       : FE_PSE_PORT_GDM4;
4d513329b87c1bd drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1721  	airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(AIROHA_GDM2_IDX),
4d513329b87c1bd drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1722  				    pse_port);
4d513329b87c1bd drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1723  	airoha_fe_clear(eth, REG_GDM_FWD_CFG(AIROHA_GDM2_IDX),
4d513329b87c1bd drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1724  			GDM_STRIP_CRC_MASK);
9cd451d414f6e29 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1725  
9cd451d414f6e29 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1726  	/* Enable GDM2 loopback */
4d513329b87c1bd drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1727  	airoha_fe_wr(eth, REG_GDM_TXCHN_EN(AIROHA_GDM2_IDX), 0xffffffff);
4d513329b87c1bd drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1728  	airoha_fe_wr(eth, REG_GDM_RXCHN_EN(AIROHA_GDM2_IDX), 0xffff);
e4e5ce823bdd460 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1729  
e4e5ce823bdd460 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1730  	chan = port->id == AIROHA_GDM3_IDX ? airoha_is_7581(eth) ? 4 : 3 : 0;
4d513329b87c1bd drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1731  	airoha_fe_rmw(eth, REG_GDM_LPBK_CFG(AIROHA_GDM2_IDX),
9cd451d414f6e29 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1732  		      LPBK_CHAN_MASK | LPBK_MODE_MASK | LPBK_EN_MASK,
fea8cdf6738a8b2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-08  1733  		      FIELD_PREP(LPBK_CHAN_MASK, chan) |
fea8cdf6738a8b2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-08  1734  		      LBK_GAP_MODE_MASK | LBK_LEN_MODE_MASK |
fea8cdf6738a8b2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-08  1735  		      LBK_CHAN_MODE_MASK | LPBK_EN_MASK);
4d513329b87c1bd drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1736  	airoha_fe_rmw(eth, REG_GDM_LEN_CFG(AIROHA_GDM2_IDX),
9cd451d414f6e29 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1737  		      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
9cd451d414f6e29 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1738  		      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
9cd451d414f6e29 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1739  		      FIELD_PREP(GDM_LONG_LEN_MASK, AIROHA_MAX_MTU));
9cd451d414f6e29 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1740  
9cd451d414f6e29 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1741  	/* Disable VIP and IFC for GDM2 */
4d513329b87c1bd drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1742  	airoha_fe_clear(eth, REG_FE_VIP_PORT_EN, BIT(AIROHA_GDM2_IDX));
4d513329b87c1bd drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1743  	airoha_fe_clear(eth, REG_FE_IFC_PORT_EN, BIT(AIROHA_GDM2_IDX));
9cd451d414f6e29 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1744  
e4e5ce823bdd460 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1745  	/* XXX: handle XSI_USB_PORT and XSI_PCE1_PORT */
e4e5ce823bdd460 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1746  	nbq = port->id == AIROHA_GDM3_IDX && airoha_is_7581(eth) ? 4 : 0;
9d5b5219f672c80 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1747  	src_port = eth->soc->ops.get_src_port_id(port, nbq);
9d5b5219f672c80 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1748  	if (src_port < 0)
9d5b5219f672c80 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1749  		return src_port;
9d5b5219f672c80 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1750  
9cd451d414f6e29 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1751  	airoha_fe_rmw(eth, REG_FE_WAN_PORT,
9cd451d414f6e29 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1752  		      WAN1_EN_MASK | WAN1_MASK | WAN0_MASK,
9d5b5219f672c80 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1753  		      FIELD_PREP(WAN0_MASK, src_port));
9d5b5219f672c80 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1754  	val = src_port & SP_CPORT_DFT_MASK;
9cd451d414f6e29 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28 @1755  	airoha_fe_rmw(eth,
9d5b5219f672c80 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1756  		      REG_SP_DFT_CPORT(src_port >> fls(SP_CPORT_DFT_MASK)),
9d5b5219f672c80 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1757  		      SP_CPORT_MASK(val),
7600fb3b41dd6ab drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-03-04  1758  		      __field_prep(SP_CPORT_MASK(val), FE_PSE_PORT_CDM2));
9d5b5219f672c80 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1759  
bf3471e6e6c0213 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-03-06  1760  	if (port->id == AIROHA_GDM4_IDX && airoha_is_7581(eth)) {
bf3471e6e6c0213 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-03-06  1761  		u32 mask = FC_ID_OF_SRC_PORT_MASK(nbq);
bf3471e6e6c0213 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-03-06  1762  
bf3471e6e6c0213 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-03-06  1763  		airoha_fe_rmw(eth, REG_SRC_PORT_FC_MAP6, mask,
bf3471e6e6c0213 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-03-06  1764  			      __field_prep(mask, AIROHA_GDM2_IDX));
bf3471e6e6c0213 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-03-06  1765  	}
9d5b5219f672c80 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1766  
9d5b5219f672c80 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1767  	return 0;
9cd451d414f6e29 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1768  }
9cd451d414f6e29 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1769  

:::::: The code at line 1755 was first introduced by commit
:::::: 9cd451d414f6e29f507a216fb3b19fa68c011f8c net: airoha: Add loopback support for GDM2

:::::: TO: Lorenzo Bianconi <lorenzo@kernel.org>
:::::: CC: Paolo Abeni <pabeni@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
