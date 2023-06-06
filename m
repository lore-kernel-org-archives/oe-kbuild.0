Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEA137B97
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Jun 2023 15:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686064531; x=1717600531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ixxppgMNpDSVoi4FcNhuO4dEdOLpl9Dfxm+3ObNxxlo=;
  b=clZ1mfbQWJM4Y05KLe/S2994vRMZuiEyp9ANN1RAvmLNDJ/oLWbg8nm+
   YuO7R/ra/S7t9L7gMcgIMO4GHOsZJZxZt0Pc9rf+aYmcNEbuzv4wikl2W
   Sj/K/VndIcg9veRmpB/P3U9CJJRKdALh4PnSweaH4ghd4Z04crWNGlnk8
   vOEPO0IovqjTjBeAZlGxZZf3uGG2cDQF3S6pb/ODJFt+6PC4Natm66mHq
   ibb17S9fT8t5ZZqmcCINbgDg4jhjhMKkHNxNnmX1SmlcmVtE8ZMAcPoNe
   +kQe2I/+VLSzYNfF4/IEA/XCFRVDg1fCmWVipkqEI7EzeaWVwqcQRv2KD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="337062930"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="337062930"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 08:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="883384946"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="883384946"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Jun 2023 08:13:35 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6YNK-0005N1-3C;
	Tue, 06 Jun 2023 15:13:34 +0000
Date: Tue, 6 Jun 2023 23:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt76x02_util.c:475
 mt76x02_set_key() warn: variable dereferenced before check 'key' (see line
 415)
Message-ID: <202306062344.hNBWnaW3-lkp@intel.com>
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
CC: Kalle Valo <kvalo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f8dba31b0a826e691949cd4fdfa5c30defaac8c5
commit: e6db67fa871dee37d22701daba806bfcd4d9df49 wifi: mt76: ignore key disable commands
date:   9 weeks ago
:::::: branch date: 24 hours ago
:::::: commit date: 9 weeks ago
config: riscv-randconfig-m031-20230605 (https://download.01.org/0day-ci/archive/20230606/202306062344.hNBWnaW3-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306062344.hNBWnaW3-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt76x02_util.c:475 mt76x02_set_key() warn: variable dereferenced before check 'key' (see line 415)

vim +/key +475 drivers/net/wireless/mediatek/mt76/mt76x02_util.c

22c575c4f1777f Stanislaw Gruszka 2018-09-04  406  
60c26859e863c1 Stanislaw Gruszka 2018-09-04  407  int mt76x02_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
60c26859e863c1 Stanislaw Gruszka 2018-09-04  408  		    struct ieee80211_vif *vif, struct ieee80211_sta *sta,
60c26859e863c1 Stanislaw Gruszka 2018-09-04  409  		    struct ieee80211_key_conf *key)
60c26859e863c1 Stanislaw Gruszka 2018-09-04  410  {
d87cf75f111183 Lorenzo Bianconi  2018-10-07  411  	struct mt76x02_dev *dev = hw->priv;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  412  	struct mt76x02_vif *mvif = (struct mt76x02_vif *)vif->drv_priv;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  413  	struct mt76x02_sta *msta;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  414  	struct mt76_wcid *wcid;
60c26859e863c1 Stanislaw Gruszka 2018-09-04 @415  	int idx = key->keyidx;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  416  	int ret;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  417  
60c26859e863c1 Stanislaw Gruszka 2018-09-04  418  	/* fall back to sw encryption for unsupported ciphers */
60c26859e863c1 Stanislaw Gruszka 2018-09-04  419  	switch (key->cipher) {
60c26859e863c1 Stanislaw Gruszka 2018-09-04  420  	case WLAN_CIPHER_SUITE_WEP40:
60c26859e863c1 Stanislaw Gruszka 2018-09-04  421  	case WLAN_CIPHER_SUITE_WEP104:
60c26859e863c1 Stanislaw Gruszka 2018-09-04  422  	case WLAN_CIPHER_SUITE_TKIP:
60c26859e863c1 Stanislaw Gruszka 2018-09-04  423  	case WLAN_CIPHER_SUITE_CCMP:
60c26859e863c1 Stanislaw Gruszka 2018-09-04  424  		break;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  425  	default:
60c26859e863c1 Stanislaw Gruszka 2018-09-04  426  		return -EOPNOTSUPP;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  427  	}
60c26859e863c1 Stanislaw Gruszka 2018-09-04  428  
60c26859e863c1 Stanislaw Gruszka 2018-09-04  429  	/*
60c26859e863c1 Stanislaw Gruszka 2018-09-04  430  	 * The hardware does not support per-STA RX GTK, fall back
60c26859e863c1 Stanislaw Gruszka 2018-09-04  431  	 * to software mode for these.
60c26859e863c1 Stanislaw Gruszka 2018-09-04  432  	 */
60c26859e863c1 Stanislaw Gruszka 2018-09-04  433  	if ((vif->type == NL80211_IFTYPE_ADHOC ||
60c26859e863c1 Stanislaw Gruszka 2018-09-04  434  	     vif->type == NL80211_IFTYPE_MESH_POINT) &&
60c26859e863c1 Stanislaw Gruszka 2018-09-04  435  	    (key->cipher == WLAN_CIPHER_SUITE_TKIP ||
60c26859e863c1 Stanislaw Gruszka 2018-09-04  436  	     key->cipher == WLAN_CIPHER_SUITE_CCMP) &&
60c26859e863c1 Stanislaw Gruszka 2018-09-04  437  	    !(key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
60c26859e863c1 Stanislaw Gruszka 2018-09-04  438  		return -EOPNOTSUPP;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  439  
b98558e2529986 Stanislaw Gruszka 2019-03-19  440  	/*
b98558e2529986 Stanislaw Gruszka 2019-03-19  441  	 * In USB AP mode, broadcast/multicast frames are setup in beacon
b98558e2529986 Stanislaw Gruszka 2019-03-19  442  	 * data registers and sent via HW beacons engine, they require to
b98558e2529986 Stanislaw Gruszka 2019-03-19  443  	 * be already encrypted.
b98558e2529986 Stanislaw Gruszka 2019-03-19  444  	 */
61c51a74a4e586 Lorenzo Bianconi  2019-10-29  445  	if (mt76_is_usb(&dev->mt76) &&
b98558e2529986 Stanislaw Gruszka 2019-03-19  446  	    vif->type == NL80211_IFTYPE_AP &&
b98558e2529986 Stanislaw Gruszka 2019-03-19  447  	    !(key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
b98558e2529986 Stanislaw Gruszka 2019-03-19  448  		return -EOPNOTSUPP;
b98558e2529986 Stanislaw Gruszka 2019-03-19  449  
4b36cc6b390f18 David Bauer       2021-02-07  450  	/* MT76x0 GTK offloading does not work with more than one VIF */
4b36cc6b390f18 David Bauer       2021-02-07  451  	if (is_mt76x0(dev) && !(key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
4b36cc6b390f18 David Bauer       2021-02-07  452  		return -EOPNOTSUPP;
4b36cc6b390f18 David Bauer       2021-02-07  453  
60c26859e863c1 Stanislaw Gruszka 2018-09-04  454  	msta = sta ? (struct mt76x02_sta *)sta->drv_priv : NULL;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  455  	wcid = msta ? &msta->wcid : &mvif->group_wcid;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  456  
e6db67fa871dee Felix Fietkau     2023-03-30  457  	if (cmd != SET_KEY) {
60c26859e863c1 Stanislaw Gruszka 2018-09-04  458  		if (idx == wcid->hw_key_idx) {
60c26859e863c1 Stanislaw Gruszka 2018-09-04  459  			wcid->hw_key_idx = -1;
f2f6a47b504b8f Felix Fietkau     2019-01-25  460  			wcid->sw_iv = false;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  461  		}
60c26859e863c1 Stanislaw Gruszka 2018-09-04  462  
e6db67fa871dee Felix Fietkau     2023-03-30  463  		return 0;
e6db67fa871dee Felix Fietkau     2023-03-30  464  	}
e6db67fa871dee Felix Fietkau     2023-03-30  465  
e6db67fa871dee Felix Fietkau     2023-03-30  466  	key->hw_key_idx = wcid->idx;
e6db67fa871dee Felix Fietkau     2023-03-30  467  	wcid->hw_key_idx = idx;
e6db67fa871dee Felix Fietkau     2023-03-30  468  	if (key->flags & IEEE80211_KEY_FLAG_RX_MGMT) {
e6db67fa871dee Felix Fietkau     2023-03-30  469  		key->flags |= IEEE80211_KEY_FLAG_SW_MGMT_TX;
e6db67fa871dee Felix Fietkau     2023-03-30  470  		wcid->sw_iv = true;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  471  	}
d87cf75f111183 Lorenzo Bianconi  2018-10-07  472  	mt76_wcid_key_setup(&dev->mt76, wcid, key);
60c26859e863c1 Stanislaw Gruszka 2018-09-04  473  
60c26859e863c1 Stanislaw Gruszka 2018-09-04  474  	if (!msta) {
60c26859e863c1 Stanislaw Gruszka 2018-09-04 @475  		if (key || wcid->hw_key_idx == idx) {
8d66af49a3db9a Lorenzo Bianconi  2018-10-07  476  			ret = mt76x02_mac_wcid_set_key(dev, wcid->idx, key);
60c26859e863c1 Stanislaw Gruszka 2018-09-04  477  			if (ret)
60c26859e863c1 Stanislaw Gruszka 2018-09-04  478  				return ret;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  479  		}
60c26859e863c1 Stanislaw Gruszka 2018-09-04  480  
8d66af49a3db9a Lorenzo Bianconi  2018-10-07  481  		return mt76x02_mac_shared_key_setup(dev, mvif->idx, idx, key);
60c26859e863c1 Stanislaw Gruszka 2018-09-04  482  	}
60c26859e863c1 Stanislaw Gruszka 2018-09-04  483  
8d66af49a3db9a Lorenzo Bianconi  2018-10-07  484  	return mt76x02_mac_wcid_set_key(dev, msta->wcid.idx, key);
60c26859e863c1 Stanislaw Gruszka 2018-09-04  485  }
60c26859e863c1 Stanislaw Gruszka 2018-09-04  486  EXPORT_SYMBOL_GPL(mt76x02_set_key);
60c26859e863c1 Stanislaw Gruszka 2018-09-04  487  

:::::: The code at line 475 was first introduced by commit
:::::: 60c26859e863c1b83757759176517453599db500 mt76: unify set_key

:::::: TO: Stanislaw Gruszka <sgruszka@redhat.com>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
