Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8081D89E5
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Nov 2024 23:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731884810; cv=none; b=Ci9pb4k9slwKdBOykbS/ioILOYwn9b7147AAiezQuaoh+864gRSke5J+0nAPxI+MyaLf6cH12A9o6e2LYetHTtzc5+aSNwX45Ox/Nt0xwHqXWilcFySuCDIOlJA8gYYuElCNPyHT6w6ag3QrNJft2q3/TCKnC9pZcMKyxWyeKTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731884810; c=relaxed/simple;
	bh=Cl1q+P7TVXN8r4hz4H9OQbK/HbSGL4dOmtfjN1QbPRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=huXhxG1MXjv+bnDpe1CSUtpEJXvZ0mkZj7UgxAvY6Ya7JafkIvTAl1eVaoEd5otHna/8dFEx2OHf+maxoyxnEhBN7Eqa7erG1zXA0EPRppmUtQqkSS+JOXw16BVJnCNiKk64/+V2BsMdIqZ2V0w1bJjs9K3MWdozfSw4tLSo80I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+xKBfCj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+xKBfCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731884809; x=1763420809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cl1q+P7TVXN8r4hz4H9OQbK/HbSGL4dOmtfjN1QbPRA=;
  b=l+xKBfCjjBhfmG2XA1aWC1ty8oMXNl4e4B7dhpC3f8yldv89nv8+oSSq
   BkSgpdX/59CoXddzHqtZSTd6MwBuiIxQeEABPJnk1IKyAParOD1iDodwX
   KGrA2NF7nBZLmmx4j7N4AhwgmfbRt4Vscvc+eFfKGHnmNRsUsXlC3FxCI
   z6g/+9gkkWlk6UrfKLd9B34u4BM9y8HpMOcjKpKgoIkGqyuq7e9Z8KTOD
   lJvalk1yfSHdukcqWffQSnxZcIqwjNrJl24AW6KNvhCdc9nqLuOMWOH5A
   NYqNjWofIYGYc6cB+69U2cMxaroDcNJAVat1P7cXEy7u2xfBLBD2pcQfq
   g==;
X-CSE-ConnectionGUID: B/vXf4drRaWdV6kz3c9GNA==
X-CSE-MsgGUID: RTOUialPQA28gpvZAVgB8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31975512"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="31975512"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 15:06:48 -0800
X-CSE-ConnectionGUID: GBl196eWQgyi1DBoLllRRQ==
X-CSE-MsgGUID: ZLmzyDTZTrqEPHu9cHWMcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="88635694"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Nov 2024 15:06:46 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCoLs-000257-0X;
	Sun, 17 Nov 2024 23:06:44 +0000
Date: Mon, 18 Nov 2024 07:05:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7915/main.c:283
 mt7915_add_interface() warn: inconsistent returns '&dev->mt76.mutex'.
Message-ID: <202411180723.DsbWYzTR-lkp@intel.com>
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
TO: Felix Fietkau <nbd@nbd.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   adc218676eef25575469234709c2d87185ca223a
commit: f3049b88b2b32326df97461813ae73e8bbc296fc wifi: mt76: mt7915: allocate vif wcid in the same range as stations
date:   2 months ago
:::::: branch date: 47 minutes ago
:::::: commit date: 2 months ago
config: i386-randconfig-141-20241115 (https://download.01.org/0day-ci/archive/20241118/202411180723.DsbWYzTR-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411180723.DsbWYzTR-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7915/main.c:283 mt7915_add_interface() warn: inconsistent returns '&dev->mt76.mutex'.

vim +283 drivers/net/wireless/mediatek/mt76/mt7915/main.c

76be6c076c0774 Ryder Lee        2021-04-27  203  
e57b7901469fc0 Ryder Lee        2020-04-25  204  static int mt7915_add_interface(struct ieee80211_hw *hw,
e57b7901469fc0 Ryder Lee        2020-04-25  205  				struct ieee80211_vif *vif)
e57b7901469fc0 Ryder Lee        2020-04-25  206  {
e57b7901469fc0 Ryder Lee        2020-04-25  207  	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
e57b7901469fc0 Ryder Lee        2020-04-25  208  	struct mt7915_dev *dev = mt7915_hw_dev(hw);
e57b7901469fc0 Ryder Lee        2020-04-25  209  	struct mt7915_phy *phy = mt7915_hw_phy(hw);
e57b7901469fc0 Ryder Lee        2020-04-25  210  	struct mt76_txq *mtxq;
e57b7901469fc0 Ryder Lee        2020-04-25  211  	bool ext_phy = phy != &dev->phy;
e57b7901469fc0 Ryder Lee        2020-04-25  212  	int idx, ret = 0;
e57b7901469fc0 Ryder Lee        2020-04-25  213  
e57b7901469fc0 Ryder Lee        2020-04-25  214  	mutex_lock(&dev->mt76.mutex);
e57b7901469fc0 Ryder Lee        2020-04-25  215  
c918c74d06457e Shayne Chen      2020-12-04  216  	mt76_testmode_reset(phy->mt76, true);
aadf09537c575d Shayne Chen      2020-10-22  217  
aadf09537c575d Shayne Chen      2020-10-22  218  	if (vif->type == NL80211_IFTYPE_MONITOR &&
aadf09537c575d Shayne Chen      2020-10-22  219  	    is_zero_ether_addr(vif->addr))
aadf09537c575d Shayne Chen      2020-10-22  220  		phy->monitor_vif = vif;
aadf09537c575d Shayne Chen      2020-10-22  221  
b619e01380eedf Evelyn Tsai      2022-03-17  222  	mvif->mt76.idx = __ffs64(~dev->mt76.vif_mask);
b619e01380eedf Evelyn Tsai      2022-03-17  223  	if (mvif->mt76.idx >= (MT7915_MAX_INTERFACES << dev->dbdc_support)) {
e57b7901469fc0 Ryder Lee        2020-04-25  224  		ret = -ENOSPC;
e57b7901469fc0 Ryder Lee        2020-04-25  225  		goto out;
e57b7901469fc0 Ryder Lee        2020-04-25  226  	}
e57b7901469fc0 Ryder Lee        2020-04-25  227  
e57b7901469fc0 Ryder Lee        2020-04-25  228  	idx = get_omac_idx(vif->type, phy->omac_mask);
e57b7901469fc0 Ryder Lee        2020-04-25  229  	if (idx < 0) {
e57b7901469fc0 Ryder Lee        2020-04-25  230  		ret = -ENOSPC;
e57b7901469fc0 Ryder Lee        2020-04-25  231  		goto out;
e57b7901469fc0 Ryder Lee        2020-04-25  232  	}
6cf4392f248903 Lorenzo Bianconi 2021-12-14  233  	mvif->mt76.omac_idx = idx;
1daf2522fa1604 Felix Fietkau    2020-07-26  234  	mvif->phy = phy;
3eb50cc9053437 Ryder Lee        2022-12-01  235  	mvif->mt76.band_idx = phy->mt76->band_idx;
e57b7901469fc0 Ryder Lee        2020-04-25  236  
6cf4392f248903 Lorenzo Bianconi 2021-12-14  237  	mvif->mt76.wmm_idx = vif->type != NL80211_IFTYPE_AP;
92610d6df8a69c Felix Fietkau    2021-11-25  238  	if (ext_phy)
6cf4392f248903 Lorenzo Bianconi 2021-12-14  239  		mvif->mt76.wmm_idx += 2;
e57b7901469fc0 Ryder Lee        2020-04-25  240  
8aa2c6f4714ecc Felix Fietkau    2020-09-26  241  	ret = mt7915_mcu_add_dev_info(phy, vif, true);
e57b7901469fc0 Ryder Lee        2020-04-25  242  	if (ret)
e57b7901469fc0 Ryder Lee        2020-04-25  243  		goto out;
e57b7901469fc0 Ryder Lee        2020-04-25  244  
b619e01380eedf Evelyn Tsai      2022-03-17  245  	dev->mt76.vif_mask |= BIT_ULL(mvif->mt76.idx);
6cf4392f248903 Lorenzo Bianconi 2021-12-14  246  	phy->omac_mask |= BIT_ULL(mvif->mt76.omac_idx);
e57b7901469fc0 Ryder Lee        2020-04-25  247  
f3049b88b2b323 Felix Fietkau    2024-08-27  248  	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, mt7915_wtbl_size(dev));
f3049b88b2b323 Felix Fietkau    2024-08-27  249  	if (idx < 0)
f3049b88b2b323 Felix Fietkau    2024-08-27  250  		return -ENOSPC;
e57b7901469fc0 Ryder Lee        2020-04-25  251  
1daf2522fa1604 Felix Fietkau    2020-07-26  252  	INIT_LIST_HEAD(&mvif->sta.rc_list);
b73e1d9245eba0 Lorenzo Bianconi 2023-06-22  253  	INIT_LIST_HEAD(&mvif->sta.wcid.poll_list);
e57b7901469fc0 Ryder Lee        2020-04-25  254  	mvif->sta.wcid.idx = idx;
a1a99d7bddad6b Lorenzo Bianconi 2022-07-04  255  	mvif->sta.wcid.phy_idx = ext_phy;
e57b7901469fc0 Ryder Lee        2020-04-25  256  	mvif->sta.wcid.hw_key_idx = -1;
e57b7901469fc0 Ryder Lee        2020-04-25  257  	mvif->sta.wcid.tx_info |= MT_WCID_TX_INFO_SET;
0335c034e7265d Felix Fietkau    2023-08-29  258  	mt76_wcid_init(&mvif->sta.wcid);
bd1e3e7b693c17 Lorenzo Bianconi 2021-09-13  259  
e57b7901469fc0 Ryder Lee        2020-04-25  260  	mt7915_mac_wtbl_update(dev, idx,
e57b7901469fc0 Ryder Lee        2020-04-25  261  			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
e57b7901469fc0 Ryder Lee        2020-04-25  262  
e57b7901469fc0 Ryder Lee        2020-04-25  263  	if (vif->txq) {
e57b7901469fc0 Ryder Lee        2020-04-25  264  		mtxq = (struct mt76_txq *)vif->txq->drv_priv;
51fb1278aa57ae Felix Fietkau    2022-03-25  265  		mtxq->wcid = idx;
e57b7901469fc0 Ryder Lee        2020-04-25  266  	}
e57b7901469fc0 Ryder Lee        2020-04-25  267  
8aa2c6f4714ecc Felix Fietkau    2020-09-26  268  	if (vif->type != NL80211_IFTYPE_AP &&
6cf4392f248903 Lorenzo Bianconi 2021-12-14  269  	    (!mvif->mt76.omac_idx || mvif->mt76.omac_idx > 3))
8aa2c6f4714ecc Felix Fietkau    2020-09-26  270  		vif->offload_flags = 0;
e151d71e503d03 Felix Fietkau    2020-08-21  271  	vif->offload_flags |= IEEE80211_OFFLOAD_ENCAP_4ADDR;
e151d71e503d03 Felix Fietkau    2020-08-21  272  
76be6c076c0774 Ryder Lee        2021-04-27  273  	mt7915_init_bitrate_mask(vif);
02a894046d5ab7 Felix Fietkau    2023-06-29  274  	memset(&mvif->cap, -1, sizeof(mvif->cap));
76be6c076c0774 Ryder Lee        2021-04-27  275  
d3bc111307447a Shayne Chen      2022-01-14  276  	mt7915_mcu_add_bss_info(phy, vif, true);
d3bc111307447a Shayne Chen      2022-01-14  277  	mt7915_mcu_add_sta(dev, vif, NULL, true);
8e3e7567b8c121 Shayne Chen      2022-06-22  278  	rcu_assign_pointer(dev->mt76.wcid[idx], &mvif->sta.wcid);
d3bc111307447a Shayne Chen      2022-01-14  279  
e57b7901469fc0 Ryder Lee        2020-04-25  280  out:
e57b7901469fc0 Ryder Lee        2020-04-25  281  	mutex_unlock(&dev->mt76.mutex);
e57b7901469fc0 Ryder Lee        2020-04-25  282  
e57b7901469fc0 Ryder Lee        2020-04-25 @283  	return ret;
e57b7901469fc0 Ryder Lee        2020-04-25  284  }
e57b7901469fc0 Ryder Lee        2020-04-25  285  

:::::: The code at line 283 was first introduced by commit
:::::: e57b7901469fc0b021930b83a8094baaf3d81b09 mt76: add mac80211 driver for MT7915 PCIe-based chipsets

:::::: TO: Ryder Lee <ryder.lee@mediatek.com>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
