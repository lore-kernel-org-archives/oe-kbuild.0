Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC0D2C11E4
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jun 2026 04:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780289470; cv=none; b=ESIjwjTdR5x7J3AO8h4eC8J6nKxqCRREsthZy8AwjUtSQmCZ/oOLHqvHTTelkFOr2kPqwLSI+3xzL/SkZTUkKju5AXkmE0kyN5FNe01AI6h+2Pv+FFuYQJiswXgNLRMgGkNo1VTKOEN3qRO8/ulaHmmxm4qSVqEdttcTxtiA410=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780289470; c=relaxed/simple;
	bh=6kTV0Ycm4poPZmWNyvnL0GpMSB+5+rqW8qH2Y2Zf6+o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n4fn5914A+iy0p9j0N/SixqvjROh27IzzKv73d4QGa98bqUYU9sWTcNkYtUAkLtC0dn9qPwzVgR8wTt8wCWiDUp4dO0UlwBgBmwQHOFXmG/smNYC0YqVUg0dW5mGLcpK4bEJ/zFw6pc3KZvMOetq7LwrG9MFwUMxpFLIe0mRYls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FldQc8Wb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FldQc8Wb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780289469; x=1811825469;
  h=date:from:to:cc:subject:message-id;
  bh=6kTV0Ycm4poPZmWNyvnL0GpMSB+5+rqW8qH2Y2Zf6+o=;
  b=FldQc8WbhqFQ7ENEUweH2z4je96C4LoExne2kY+O91A4RTbs+SsQoLZH
   kmr3X/bN7g/U0K1Z9z0rXJATM2DyMl3K3h1Y/GFE1QTLj6Jjy8DMRLCcs
   7wvJ4N50fJgJnZpZXHsFw4zpHrM+fmdH/XBJg6jE5z2mzQIFo/Mwf6oQQ
   xnjnMgSCs4Nimjdt37BDI6Qi8gMZoxgxK01wZSTUc3qNfTSfsu3YL2TBR
   3/nqvtOg2GwyvCR3FxLsgF3jIR0Ycz8Eb7cBeD1XeJ8azLAU3I6yxiC3a
   bet8lkiJyA4vUc1T98ZLGTqC/FhatHB2L9uHbYI5Xsc11LahwBgHeAoo+
   w==;
X-CSE-ConnectionGUID: /ts3UF4GSAq9IYbegvZbJQ==
X-CSE-MsgGUID: jI1uB24HRDC2b9QEjlbc/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="106488509"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="106488509"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 21:51:08 -0700
X-CSE-ConnectionGUID: 2CpUfooAQdW17jlrhFXJPg==
X-CSE-MsgGUID: JGhxxadzRLW4nMNVYnMhrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="243554244"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 May 2026 21:51:07 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTucC-00000000ABe-2nne;
	Mon, 01 Jun 2026 04:51:04 +0000
Date: Mon, 01 Jun 2026 12:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [nbd168-wireless:mt76 34/42]
 drivers/net/wireless/mediatek/mt76/mt7925/main.c:415
 mt7925_mac_link_bss_add() error: we previously assumed
 'mvif->phy->mt76->chandef.chan' could be null (see line 405)
Message-ID: <202606011203.GwBe93Bo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sean Wang <sean.wang@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>
CC: Javier Tia <floss@jetm.me>

tree:   https://github.com/nbd168/wireless mt76
head:   4913f44167cf35a9536e9eec7352e15b2de0c573
commit: b7ce8a8162e825b541286a4682ca6194e7c15dc2 [34/42] wifi: mt76: mt7925: sync MT7927 BSS band assignment
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20260601 (https://download.01.org/0day-ci/archive/20260601/202606011203.GwBe93Bo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606011203.GwBe93Bo-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7925/main.c:415 mt7925_mac_link_bss_add() error: we previously assumed 'mvif->phy->mt76->chandef.chan' could be null (see line 405)

vim +415 drivers/net/wireless/mediatek/mt76/mt7925/main.c

c948b5da6bbec7 Deren Wu       2023-09-18  374  
95977b1d10cfeb Sean Wang      2024-06-12  375  static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
95977b1d10cfeb Sean Wang      2024-06-12  376  				   struct ieee80211_bss_conf *link_conf,
95977b1d10cfeb Sean Wang      2024-06-12  377  				   struct mt792x_link_sta *mlink)
c948b5da6bbec7 Deren Wu       2023-09-18  378  {
95977b1d10cfeb Sean Wang      2024-06-12  379  	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
95977b1d10cfeb Sean Wang      2024-06-12  380  	struct ieee80211_vif *vif = link_conf->vif;
95977b1d10cfeb Sean Wang      2024-06-12  381  	struct mt792x_vif *mvif = mconf->vif;
c948b5da6bbec7 Deren Wu       2023-09-18  382  	struct mt76_txq *mtxq;
c948b5da6bbec7 Deren Wu       2023-09-18  383  	int idx, ret = 0;
c948b5da6bbec7 Deren Wu       2023-09-18  384  
4bada9b0a29c18 Ming Yen Hsieh 2025-03-04  385  	if (vif->type == NL80211_IFTYPE_P2P_DEVICE) {
4bada9b0a29c18 Ming Yen Hsieh 2025-03-04  386  		mconf->mt76.idx = MT792x_MAX_INTERFACES;
4bada9b0a29c18 Ming Yen Hsieh 2025-03-04  387  	} else {
95977b1d10cfeb Sean Wang      2024-06-12  388  		mconf->mt76.idx = __ffs64(~dev->mt76.vif_mask);
4bada9b0a29c18 Ming Yen Hsieh 2025-03-04  389  
95977b1d10cfeb Sean Wang      2024-06-12  390  		if (mconf->mt76.idx >= MT792x_MAX_INTERFACES) {
c948b5da6bbec7 Deren Wu       2023-09-18  391  			ret = -ENOSPC;
c948b5da6bbec7 Deren Wu       2023-09-18  392  			goto out;
c948b5da6bbec7 Deren Wu       2023-09-18  393  		}
4bada9b0a29c18 Ming Yen Hsieh 2025-03-04  394  	}
c948b5da6bbec7 Deren Wu       2023-09-18  395  
0cb349d742d177 Sean Wang      2024-07-06  396  	mconf->mt76.omac_idx = ieee80211_vif_is_mld(vif) ?
0cb349d742d177 Sean Wang      2024-07-06  397  			       0 : mconf->mt76.idx;
0cb349d742d177 Sean Wang      2024-07-06  398  	mconf->mt76.band_idx = 0xff;
b7ce8a8162e825 Sean Wang      2026-04-25  399  
b7ce8a8162e825 Sean Wang      2026-04-25  400  	if (is_mt7927(&dev->mt76)) {
b7ce8a8162e825 Sean Wang      2026-04-25  401  		struct ieee80211_channel *chan = NULL;
b7ce8a8162e825 Sean Wang      2026-04-25  402  
b7ce8a8162e825 Sean Wang      2026-04-25  403  		if (link_conf->chanreq.oper.chan)
b7ce8a8162e825 Sean Wang      2026-04-25  404  			chan = link_conf->chanreq.oper.chan;
b7ce8a8162e825 Sean Wang      2026-04-25 @405  		else if (mvif->phy->mt76->chandef.chan)
b7ce8a8162e825 Sean Wang      2026-04-25  406  			chan = mvif->phy->mt76->chandef.chan;
b7ce8a8162e825 Sean Wang      2026-04-25  407  
b7ce8a8162e825 Sean Wang      2026-04-25  408  		mconf->mt76.band_idx = mt7927_band_idx(chan->band);
b7ce8a8162e825 Sean Wang      2026-04-25  409  	}
b7ce8a8162e825 Sean Wang      2026-04-25  410  
ac03e5b82bc6b4 Ming Yen Hsieh 2024-12-10  411  	mconf->mt76.wmm_idx = ieee80211_vif_is_mld(vif) ?
ac03e5b82bc6b4 Ming Yen Hsieh 2024-12-10  412  			      0 : mconf->mt76.idx % MT76_CONNAC_MAX_WMM_SETS;
4bada9b0a29c18 Ming Yen Hsieh 2025-03-04  413  	mconf->mt76.link_idx = hweight16(mvif->valid_links);
c948b5da6bbec7 Deren Wu       2023-09-18  414  
95977b1d10cfeb Sean Wang      2024-06-12 @415  	if (mvif->phy->mt76->chandef.chan->band != NL80211_BAND_2GHZ)
95977b1d10cfeb Sean Wang      2024-06-12  416  		mconf->mt76.basic_rates_idx = MT792x_BASIC_RATES_TBL + 4;
c948b5da6bbec7 Deren Wu       2023-09-18  417  	else
95977b1d10cfeb Sean Wang      2024-06-12  418  		mconf->mt76.basic_rates_idx = MT792x_BASIC_RATES_TBL;
c948b5da6bbec7 Deren Wu       2023-09-18  419  
95977b1d10cfeb Sean Wang      2024-06-12  420  	dev->mt76.vif_mask |= BIT_ULL(mconf->mt76.idx);
95977b1d10cfeb Sean Wang      2024-06-12  421  	mvif->phy->omac_mask |= BIT_ULL(mconf->mt76.omac_idx);
c948b5da6bbec7 Deren Wu       2023-09-18  422  
95977b1d10cfeb Sean Wang      2024-06-12  423  	idx = MT792x_WTBL_RESERVED - mconf->mt76.idx;
c948b5da6bbec7 Deren Wu       2023-09-18  424  
95977b1d10cfeb Sean Wang      2024-06-12  425  	mlink->wcid.idx = idx;
95977b1d10cfeb Sean Wang      2024-06-12  426  	mlink->wcid.tx_info |= MT_WCID_TX_INFO_SET;
cbf5e61da66028 Felix Fietkau  2025-01-02  427  	mt76_wcid_init(&mlink->wcid, 0);
c948b5da6bbec7 Deren Wu       2023-09-18  428  
c948b5da6bbec7 Deren Wu       2023-09-18  429  	mt7925_mac_wtbl_update(dev, idx,
c948b5da6bbec7 Deren Wu       2023-09-18  430  			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
c948b5da6bbec7 Deren Wu       2023-09-18  431  
95977b1d10cfeb Sean Wang      2024-06-12  432  	ewma_rssi_init(&mconf->rssi);
c948b5da6bbec7 Deren Wu       2023-09-18  433  
95977b1d10cfeb Sean Wang      2024-06-12  434  	rcu_assign_pointer(dev->mt76.wcid[idx], &mlink->wcid);
ac03e5b82bc6b4 Ming Yen Hsieh 2024-12-10  435  
ac03e5b82bc6b4 Ming Yen Hsieh 2024-12-10  436  	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf, &mconf->mt76,
ac03e5b82bc6b4 Ming Yen Hsieh 2024-12-10  437  					  &mlink->wcid, true);
ac03e5b82bc6b4 Ming Yen Hsieh 2024-12-10  438  	if (ret)
ac03e5b82bc6b4 Ming Yen Hsieh 2024-12-10  439  		goto out;
ac03e5b82bc6b4 Ming Yen Hsieh 2024-12-10  440  
c948b5da6bbec7 Deren Wu       2023-09-18  441  	if (vif->txq) {
c948b5da6bbec7 Deren Wu       2023-09-18  442  		mtxq = (struct mt76_txq *)vif->txq->drv_priv;
c948b5da6bbec7 Deren Wu       2023-09-18  443  		mtxq->wcid = idx;
c948b5da6bbec7 Deren Wu       2023-09-18  444  	}
c948b5da6bbec7 Deren Wu       2023-09-18  445  
95977b1d10cfeb Sean Wang      2024-06-12  446  out:
95977b1d10cfeb Sean Wang      2024-06-12  447  	return ret;
95977b1d10cfeb Sean Wang      2024-06-12  448  }
95977b1d10cfeb Sean Wang      2024-06-12  449  

:::::: The code at line 415 was first introduced by commit
:::::: 95977b1d10cfeb12b67a76dc2eefa86300c396d1 wifi: mt76: mt7925: add mt7925_mac_link_bss_add to create per-link BSS

:::::: TO: Sean Wang <sean.wang@mediatek.com>
:::::: CC: Felix Fietkau <nbd@nbd.name>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
