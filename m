Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A716643F0B9
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Oct 2026 07:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309971; cv=none; b=bt9skO1oMcm42OiZ11twBckM2NydeWFa947H42jnOUDbwd9kRjzRyQcVp6q3z61488q10t9kj2C92SRygOM4fC1mKSaPR93Cq7uvulr+P6npMF+SueOT524MtaN1l20afHSnmaBVuwJm/QnMZqSUta6UtiPAsbBS7iWfooU1Rng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309971; c=relaxed/simple;
	bh=9IVj3Z3JgSeXqV9uleD7inCzSsEuCRwBW68ty3HPB1I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hQ28iGr052B4VMIT7z2sB1uTh/J+EaUQVBonmuD4UI4KCqHV3EPaD+DWj8eFMFz6D8HKwTigy1TV580qZiO/j5K94c1D9OuFN6/qBOH6dmXUJXqGEa92Y6anaOAwNZ+ZR80yusbSr352gPjOLT2mGzwXS0um669gZeSgBujDY4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gSr+OcEi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSr+OcEi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309970; x=1823845970;
  h=date:from:to:cc:subject:message-id;
  bh=9IVj3Z3JgSeXqV9uleD7inCzSsEuCRwBW68ty3HPB1I=;
  b=gSr+OcEiScxwUFlOtikmps5ekCCbkmCsG/AaJyxuVO0EBAvRs3oAeDef
   kwTU3XaZpfxU/rdryrPHpzY9qYw1HLtBSgccCp9HGz3Dod6dwsVgrejqb
   aZH4L5zr1Cf+gHXmrYGAhcfPXZpZpGHZApuyKFS00q6E+j0f0s8ojKPzo
   dPhNLPe/a3qiwMUl0W+4S/miTZ5TOvuU1Dnh+0BgNtVQBT5BT6lmRZjh6
   48eolVyrR+ukCoIxICs5Oy+yqqUsjCxOuSd3WzrlJ6knjEMwlyMRl5wlN
   ATSTHdNqvjLtT2sNp/VMw7gtYWh/zJVoogpbiHW2QIOdCS0YiMVsmsCKE
   w==;
X-CSE-ConnectionGUID: qm+zsrYxS1u08RjnsVayMQ==
X-CSE-MsgGUID: ib/9tfT3QKCAicTQhygPwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="916704"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="916704"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:40 -0700
X-CSE-ConnectionGUID: XxZSro+HTsmlpW3QwCu64A==
X-CSE-MsgGUID: 4vsSngOMQB+hzFYfdiM6iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2340821"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 00:52:36 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh3-000000004xr-29jA;
	Sun, 18 Oct 2026 07:52:33 +0000
Date: Sun, 18 Oct 2026 09:49:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/airoha/airoha_eth.c:1843
 airoha_enable_gdm2_loopback() warn: subtract is higher precedence than shift
Message-ID: <202610171445.Bx2Y6CFq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
commit: 842a7ee50d68d66afef4536bf3abdaaed2e0e5f5 net: airoha: Rename airoha_set_gdm2_loopback in airoha_enable_gdm2_loopback
date:   5 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 5 months ago
config: alpha-randconfig-r2201-20261017 (https://download.01.org/0day-ci/archive/20261017/202610171445.Bx2Y6CFq-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 842a7ee50d68 ("net: airoha: Rename airoha_set_gdm2_loopback in airoha_enable_gdm2_loopback")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610171445.Bx2Y6CFq-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/airoha/airoha_eth.c:1843 airoha_enable_gdm2_loopback() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:1843 airoha_enable_gdm2_loopback() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:1843 airoha_enable_gdm2_loopback() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:1843 airoha_enable_gdm2_loopback() warn: subtract is higher precedence than shift

Old smatch warnings:
drivers/net/ethernet/airoha/airoha_eth.c:2254 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:2254 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:2254 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:2254 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than shift

vim +1843 drivers/net/ethernet/airoha/airoha_eth.c

23020f04932701 drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2024-07-12  1798  
842a7ee50d68d6 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-05-27  1799  static int airoha_enable_gdm2_loopback(struct airoha_gdm_dev *dev)
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1800  {
528c5153a557f6 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-05-27  1801  	struct airoha_gdm_port *port = dev->port;
528c5153a557f6 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-05-27  1802  	struct airoha_eth *eth = dev->eth;
1acdfbdb516b32 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-04-12  1803  	u32 val, pse_port, chan;
d647f254521975 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-04-17  1804  	int i, src_port;
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1805  
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1806  	airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(AIROHA_GDM2_IDX),
985d4a55e64e43 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-05-20  1807  				    FE_PSE_PORT_DROP);
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1808  	airoha_fe_clear(eth, REG_GDM_FWD_CFG(AIROHA_GDM2_IDX),
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1809  			GDM_STRIP_CRC_MASK);
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1810  
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1811  	/* Enable GDM2 loopback */
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1812  	airoha_fe_wr(eth, REG_GDM_TXCHN_EN(AIROHA_GDM2_IDX), 0xffffffff);
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1813  	airoha_fe_wr(eth, REG_GDM_RXCHN_EN(AIROHA_GDM2_IDX), 0xffff);
e4e5ce823bdd46 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1814  
e4e5ce823bdd46 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1815  	chan = port->id == AIROHA_GDM3_IDX ? airoha_is_7581(eth) ? 4 : 3 : 0;
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1816  	airoha_fe_rmw(eth, REG_GDM_LPBK_CFG(AIROHA_GDM2_IDX),
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1817  		      LPBK_CHAN_MASK | LPBK_MODE_MASK | LPBK_EN_MASK,
fea8cdf6738a8b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-08  1818  		      FIELD_PREP(LPBK_CHAN_MASK, chan) |
fea8cdf6738a8b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-08  1819  		      LBK_GAP_MODE_MASK | LBK_LEN_MODE_MASK |
fea8cdf6738a8b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-08  1820  		      LBK_CHAN_MODE_MASK | LPBK_EN_MASK);
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1821  	airoha_fe_rmw(eth, REG_GDM_LEN_CFG(AIROHA_GDM2_IDX),
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1822  		      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1823  		      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1824  		      FIELD_PREP(GDM_LONG_LEN_MASK, AIROHA_MAX_MTU));
985d4a55e64e43 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-05-20  1825  	/* Forward the traffic to the proper GDM port */
985d4a55e64e43 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-05-20  1826  	pse_port = port->id == AIROHA_GDM3_IDX ? FE_PSE_PORT_GDM3
985d4a55e64e43 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-05-20  1827  					       : FE_PSE_PORT_GDM4;
985d4a55e64e43 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-05-20  1828  	airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(AIROHA_GDM2_IDX),
985d4a55e64e43 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-05-20  1829  				    pse_port);
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1830  
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1831  	/* Disable VIP and IFC for GDM2 */
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1832  	airoha_fe_clear(eth, REG_FE_VIP_PORT_EN, BIT(AIROHA_GDM2_IDX));
4d513329b87c1b drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-01-05  1833  	airoha_fe_clear(eth, REG_FE_IFC_PORT_EN, BIT(AIROHA_GDM2_IDX));
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1834  
c06a2f2903f6fb drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-04-28  1835  	src_port = eth->soc->ops.get_sport(port, port->nbq);
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1836  	if (src_port < 0)
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1837  		return src_port;
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1838  
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1839  	airoha_fe_rmw(eth, REG_FE_WAN_PORT,
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1840  		      WAN1_EN_MASK | WAN1_MASK | WAN0_MASK,
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1841  		      FIELD_PREP(WAN0_MASK, src_port));
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1842  	val = src_port & SP_CPORT_DFT_MASK;
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28 @1843  	airoha_fe_rmw(eth,
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1844  		      REG_SP_DFT_CPORT(src_port >> fls(SP_CPORT_DFT_MASK)),
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1845  		      SP_CPORT_MASK(val),
7600fb3b41dd6a drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-03-04  1846  		      __field_prep(SP_CPORT_MASK(val), FE_PSE_PORT_CDM2));
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1847  
d647f254521975 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-04-17  1848  	for (i = 0; i < eth->soc->num_ppe; i++)
528c5153a557f6 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-05-27  1849  		airoha_ppe_set_cpu_port(dev, i, AIROHA_GDM2_IDX);
d647f254521975 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-04-17  1850  
bf3471e6e6c021 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-03-06  1851  	if (port->id == AIROHA_GDM4_IDX && airoha_is_7581(eth)) {
35c2c39832e569 drivers/net/ethernet/airoha/airoha_eth.c   Jakub Kicinski   2026-04-14  1852  		u32 mask = FC_ID_OF_SRC_PORT_MASK(port->nbq);
bf3471e6e6c021 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-03-06  1853  
bf3471e6e6c021 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-03-06  1854  		airoha_fe_rmw(eth, REG_SRC_PORT_FC_MAP6, mask,
bf3471e6e6c021 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-03-06  1855  			      __field_prep(mask, AIROHA_GDM2_IDX));
bf3471e6e6c021 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-03-06  1856  	}
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1857  
9d5b5219f672c8 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-10-17  1858  	return 0;
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1859  }
9cd451d414f6e2 drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2025-02-28  1860  

:::::: The code at line 1843 was first introduced by commit
:::::: 9cd451d414f6e29f507a216fb3b19fa68c011f8c net: airoha: Add loopback support for GDM2

:::::: TO: Lorenzo Bianconi <lorenzo@kernel.org>
:::::: CC: Paolo Abeni <pabeni@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
