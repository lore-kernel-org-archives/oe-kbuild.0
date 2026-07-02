Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536E0305664
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 03:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782961694; cv=none; b=CQLI4qnkThjHXiUmI78bc4n1Y1ndFA5ik7BXuwZTTFtVc2DnezAigGgrDiHtB8FsT5+bDSCtHogiPbYG8z0V0CuTJwA6LvJonxkQfe/pMo3MQHa8em3pStgglqJoGTDz5422sT58bLxdw0r/tu7Wyz+NzDdORNeUmMluJ/paK94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782961694; c=relaxed/simple;
	bh=cyIOWXZ0aipKfLV3DMFTkxgFmLKfZuAI9iRWye/6/Ak=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TQrsfAuj65II22G4HFlDrrnOGk09wfQ+xoRjklpEe/K0ONCTbOExOciBJgCSQKJKb/VAQr7yNf6EE2Ue+sWJqxRctLbWT5BCsIHq1x5XiQsRnnAnPTr6okIMdF9+SmLrTzVMlhWZZuK69m4eLoG5MVOETwv4IooYotJZMKMg0D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MqOGU2mn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MqOGU2mn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782961693; x=1814497693;
  h=date:from:to:cc:subject:message-id;
  bh=cyIOWXZ0aipKfLV3DMFTkxgFmLKfZuAI9iRWye/6/Ak=;
  b=MqOGU2mnafA+Ab6Nmeer8NNInkwSZUOswkgyjJcH74Qp6QttBgGTXMLD
   l+a86/H62Nh29hLkkf54mRcmILwt2xrEZJdTfkJPK+Ao5ERi3xHWdm+P/
   aZNGiQ5RKxwVm1hNUvNi68S19Z7gD3bY4c8owRhYW3SbflHQ0oskoAFm4
   V/4mTD2QuAp+yUArjJ+2JtypvTaSresKkJmXGpAVanoF2tk3Em3E7U+d0
   zwgg2KJb9WDTgjNV7JaHiBvQYgPsPY9SraRD0Vb9TyOuJp3ARqRwFJsat
   guNZx1/pLWnyKQjbi5p1d2BGe494eIE9IwvkxHVeWdDzqEp+Mjjhg/R6e
   A==;
X-CSE-ConnectionGUID: TqdXsGG4TK2yNqxb3vFKfg==
X-CSE-MsgGUID: 6s7Tp4pNQ3C7Ih1AfFKAig==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="101126911"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="101126911"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 20:08:12 -0700
X-CSE-ConnectionGUID: qCwZBWZlQq6LXokx2xWWPw==
X-CSE-MsgGUID: 8rvOQgZVRa+pV8XIeqw2HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="251005935"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Jul 2026 20:08:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf7mW-000000009vQ-3Gam;
	Thu, 02 Jul 2026 03:08:05 +0000
Date: Thu, 02 Jul 2026 11:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/airoha/airoha_eth.c:1843
 airoha_enable_gdm2_loopback() warn: subtract is higher precedence than shift
Message-ID: <202607021124.3o2MGXEw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a50a141f05a8d1737661b19ee22ff8455b94409
commit: 842a7ee50d68d66afef4536bf3abdaaed2e0e5f5 net: airoha: Rename airoha_set_gdm2_loopback in airoha_enable_gdm2_loopback
date:   4 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 weeks ago
config: sh-randconfig-r072-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021124.3o2MGXEw-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 842a7ee50d68 ("net: airoha: Rename airoha_set_gdm2_loopback in airoha_enable_gdm2_loopback")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607021124.3o2MGXEw-lkp@intel.com/

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
