Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA53218A6D4
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Dec 2024 09:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734947560; cv=none; b=rEWbV5r3Sup0I0j/Y1ySp9vXauGvKEN+fok1xWboBWoNLshoLPz6KSHoK8uFcscuAT8xTUe7izxVdGP3Y8NCcaERLFR9J3sGTvXMkSvl0uN6FKosKyftU0EphzuXnVtw2iQyeVjhMPy2CLwlqz4CS9E+IedZ2YE7kcCXFWHkbKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734947560; c=relaxed/simple;
	bh=rvmUcp9VbCAqQvg5GwCs3QfadK8YIoBhjzCvxfqskgY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=emrW7WJkWOqOpOo1lztoCqwJcGzycsA3A15+wa/Ia0bqeDMCIA13g8tnHaWM6gad5WBcw3zpqwVNXGXdgsUPb0YRaWJKQycWs/iEZBTimGRdiHwouasz+VMDbS38awfUPkkkgVaN0S8BNkJxaNxGrXDLSfMEob/FLBSKH4OnvKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcKhsU2a; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcKhsU2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734947559; x=1766483559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rvmUcp9VbCAqQvg5GwCs3QfadK8YIoBhjzCvxfqskgY=;
  b=LcKhsU2afSIpl3hLCYD9jHUkQKrTNwfHjwuCJyaYyn362GQxYt5YIBaf
   0y4lm856QgxFKH5URCaflcy7RlklBYZBgawkXgioOAIwOeRpTE+yemrD1
   d7vmOIMk70LYtobpcBIHWtI4vj+bvVowlTLYUndnAbPwHmF6dfgv8TwCj
   PkIOEupar6VDQd5Ggqz6+ZwtsVf4UrzNmAFpwtD36RUyYaj+4jVMpoExT
   WA1QaFho33c1d9JRKk6qF+k9/Serbl91CURIO6S+ABqyjR6/P8Xs3LzAe
   zAFX8BvVAM5rjER9RLHmYXLJGajLC51olTcLeHTi6euu5SDoxoNwhRiKK
   g==;
X-CSE-ConnectionGUID: U+l4hbHfSTKwd6ou9IMy8Q==
X-CSE-MsgGUID: m0WQwoAPQ92aPInky2n76A==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="52810647"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="52810647"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 01:52:36 -0800
X-CSE-ConnectionGUID: NWupY5XLQMGhItqaJRqe+A==
X-CSE-MsgGUID: SUXOtsLUQEanLqibwRFMyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="98935824"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Dec 2024 01:52:34 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPf72-0003Wz-2l;
	Mon, 23 Dec 2024 09:52:32 +0000
Date: Mon, 23 Dec 2024 17:52:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7915/main.c:283
 mt7915_add_interface() warn: inconsistent returns '&dev->mt76.mutex'.
Message-ID: <202412231734.srK9iuag-lkp@intel.com>
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
head:   4bbf9020becbfd8fc2c3da790855b7042fad455b
commit: f3049b88b2b32326df97461813ae73e8bbc296fc wifi: mt76: mt7915: allocate vif wcid in the same range as stations
date:   4 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 months ago
config: powerpc-randconfig-r072-20241223 (https://download.01.org/0day-ci/archive/20241223/202412231734.srK9iuag-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412231734.srK9iuag-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7915/main.c:283 mt7915_add_interface() warn: inconsistent returns '&dev->mt76.mutex'.

vim +283 drivers/net/wireless/mediatek/mt76/mt7915/main.c

76be6c076c07748 Ryder Lee        2021-04-27  203  
e57b7901469fc0b Ryder Lee        2020-04-25  204  static int mt7915_add_interface(struct ieee80211_hw *hw,
e57b7901469fc0b Ryder Lee        2020-04-25  205  				struct ieee80211_vif *vif)
e57b7901469fc0b Ryder Lee        2020-04-25  206  {
e57b7901469fc0b Ryder Lee        2020-04-25  207  	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
e57b7901469fc0b Ryder Lee        2020-04-25  208  	struct mt7915_dev *dev = mt7915_hw_dev(hw);
e57b7901469fc0b Ryder Lee        2020-04-25  209  	struct mt7915_phy *phy = mt7915_hw_phy(hw);
e57b7901469fc0b Ryder Lee        2020-04-25  210  	struct mt76_txq *mtxq;
e57b7901469fc0b Ryder Lee        2020-04-25  211  	bool ext_phy = phy != &dev->phy;
e57b7901469fc0b Ryder Lee        2020-04-25  212  	int idx, ret = 0;
e57b7901469fc0b Ryder Lee        2020-04-25  213  
e57b7901469fc0b Ryder Lee        2020-04-25  214  	mutex_lock(&dev->mt76.mutex);
e57b7901469fc0b Ryder Lee        2020-04-25  215  
c918c74d06457ee Shayne Chen      2020-12-04  216  	mt76_testmode_reset(phy->mt76, true);
aadf09537c575db Shayne Chen      2020-10-22  217  
aadf09537c575db Shayne Chen      2020-10-22  218  	if (vif->type == NL80211_IFTYPE_MONITOR &&
aadf09537c575db Shayne Chen      2020-10-22  219  	    is_zero_ether_addr(vif->addr))
aadf09537c575db Shayne Chen      2020-10-22  220  		phy->monitor_vif = vif;
aadf09537c575db Shayne Chen      2020-10-22  221  
b619e01380eedf2 Evelyn Tsai      2022-03-17  222  	mvif->mt76.idx = __ffs64(~dev->mt76.vif_mask);
b619e01380eedf2 Evelyn Tsai      2022-03-17  223  	if (mvif->mt76.idx >= (MT7915_MAX_INTERFACES << dev->dbdc_support)) {
e57b7901469fc0b Ryder Lee        2020-04-25  224  		ret = -ENOSPC;
e57b7901469fc0b Ryder Lee        2020-04-25  225  		goto out;
e57b7901469fc0b Ryder Lee        2020-04-25  226  	}
e57b7901469fc0b Ryder Lee        2020-04-25  227  
e57b7901469fc0b Ryder Lee        2020-04-25  228  	idx = get_omac_idx(vif->type, phy->omac_mask);
e57b7901469fc0b Ryder Lee        2020-04-25  229  	if (idx < 0) {
e57b7901469fc0b Ryder Lee        2020-04-25  230  		ret = -ENOSPC;
e57b7901469fc0b Ryder Lee        2020-04-25  231  		goto out;
e57b7901469fc0b Ryder Lee        2020-04-25  232  	}
6cf4392f248903b Lorenzo Bianconi 2021-12-14  233  	mvif->mt76.omac_idx = idx;
1daf2522fa16046 Felix Fietkau    2020-07-26  234  	mvif->phy = phy;
3eb50cc90534376 Ryder Lee        2022-12-01  235  	mvif->mt76.band_idx = phy->mt76->band_idx;
e57b7901469fc0b Ryder Lee        2020-04-25  236  
6cf4392f248903b Lorenzo Bianconi 2021-12-14  237  	mvif->mt76.wmm_idx = vif->type != NL80211_IFTYPE_AP;
92610d6df8a69cb Felix Fietkau    2021-11-25  238  	if (ext_phy)
6cf4392f248903b Lorenzo Bianconi 2021-12-14  239  		mvif->mt76.wmm_idx += 2;
e57b7901469fc0b Ryder Lee        2020-04-25  240  
8aa2c6f4714eccc Felix Fietkau    2020-09-26  241  	ret = mt7915_mcu_add_dev_info(phy, vif, true);
e57b7901469fc0b Ryder Lee        2020-04-25  242  	if (ret)
e57b7901469fc0b Ryder Lee        2020-04-25  243  		goto out;
e57b7901469fc0b Ryder Lee        2020-04-25  244  
b619e01380eedf2 Evelyn Tsai      2022-03-17  245  	dev->mt76.vif_mask |= BIT_ULL(mvif->mt76.idx);
6cf4392f248903b Lorenzo Bianconi 2021-12-14  246  	phy->omac_mask |= BIT_ULL(mvif->mt76.omac_idx);
e57b7901469fc0b Ryder Lee        2020-04-25  247  
f3049b88b2b3232 Felix Fietkau    2024-08-27  248  	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, mt7915_wtbl_size(dev));
f3049b88b2b3232 Felix Fietkau    2024-08-27  249  	if (idx < 0)
f3049b88b2b3232 Felix Fietkau    2024-08-27  250  		return -ENOSPC;
e57b7901469fc0b Ryder Lee        2020-04-25  251  
1daf2522fa16046 Felix Fietkau    2020-07-26  252  	INIT_LIST_HEAD(&mvif->sta.rc_list);
b73e1d9245eba06 Lorenzo Bianconi 2023-06-22  253  	INIT_LIST_HEAD(&mvif->sta.wcid.poll_list);
e57b7901469fc0b Ryder Lee        2020-04-25  254  	mvif->sta.wcid.idx = idx;
a1a99d7bddad6b8 Lorenzo Bianconi 2022-07-04  255  	mvif->sta.wcid.phy_idx = ext_phy;
e57b7901469fc0b Ryder Lee        2020-04-25  256  	mvif->sta.wcid.hw_key_idx = -1;
e57b7901469fc0b Ryder Lee        2020-04-25  257  	mvif->sta.wcid.tx_info |= MT_WCID_TX_INFO_SET;
0335c034e7265d3 Felix Fietkau    2023-08-29  258  	mt76_wcid_init(&mvif->sta.wcid);
bd1e3e7b693c17a Lorenzo Bianconi 2021-09-13  259  
e57b7901469fc0b Ryder Lee        2020-04-25  260  	mt7915_mac_wtbl_update(dev, idx,
e57b7901469fc0b Ryder Lee        2020-04-25  261  			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
e57b7901469fc0b Ryder Lee        2020-04-25  262  
e57b7901469fc0b Ryder Lee        2020-04-25  263  	if (vif->txq) {
e57b7901469fc0b Ryder Lee        2020-04-25  264  		mtxq = (struct mt76_txq *)vif->txq->drv_priv;
51fb1278aa57ae0 Felix Fietkau    2022-03-25  265  		mtxq->wcid = idx;
e57b7901469fc0b Ryder Lee        2020-04-25  266  	}
e57b7901469fc0b Ryder Lee        2020-04-25  267  
8aa2c6f4714eccc Felix Fietkau    2020-09-26  268  	if (vif->type != NL80211_IFTYPE_AP &&
6cf4392f248903b Lorenzo Bianconi 2021-12-14  269  	    (!mvif->mt76.omac_idx || mvif->mt76.omac_idx > 3))
8aa2c6f4714eccc Felix Fietkau    2020-09-26  270  		vif->offload_flags = 0;
e151d71e503d032 Felix Fietkau    2020-08-21  271  	vif->offload_flags |= IEEE80211_OFFLOAD_ENCAP_4ADDR;
e151d71e503d032 Felix Fietkau    2020-08-21  272  
76be6c076c07748 Ryder Lee        2021-04-27  273  	mt7915_init_bitrate_mask(vif);
02a894046d5ab7d Felix Fietkau    2023-06-29  274  	memset(&mvif->cap, -1, sizeof(mvif->cap));
76be6c076c07748 Ryder Lee        2021-04-27  275  
d3bc111307447a2 Shayne Chen      2022-01-14  276  	mt7915_mcu_add_bss_info(phy, vif, true);
d3bc111307447a2 Shayne Chen      2022-01-14  277  	mt7915_mcu_add_sta(dev, vif, NULL, true);
8e3e7567b8c1216 Shayne Chen      2022-06-22  278  	rcu_assign_pointer(dev->mt76.wcid[idx], &mvif->sta.wcid);
d3bc111307447a2 Shayne Chen      2022-01-14  279  
e57b7901469fc0b Ryder Lee        2020-04-25  280  out:
e57b7901469fc0b Ryder Lee        2020-04-25  281  	mutex_unlock(&dev->mt76.mutex);
e57b7901469fc0b Ryder Lee        2020-04-25  282  
e57b7901469fc0b Ryder Lee        2020-04-25 @283  	return ret;
e57b7901469fc0b Ryder Lee        2020-04-25  284  }
e57b7901469fc0b Ryder Lee        2020-04-25  285  

:::::: The code at line 283 was first introduced by commit
:::::: e57b7901469fc0b021930b83a8094baaf3d81b09 mt76: add mac80211 driver for MT7915 PCIe-based chipsets

:::::: TO: Ryder Lee <ryder.lee@mediatek.com>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
