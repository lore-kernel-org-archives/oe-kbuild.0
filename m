Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFA81103
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Oct 2023 03:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BC0p+lSq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697167556; x=1728703556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cLYtDE8isCYgrgXAxt3D4WdNH/O8E8OeuI7aWNTCyOg=;
  b=BC0p+lSq9cl6GKv2sw3zWW0DJoiy1ZgCyLwPF9g++9cvO2rrzBjZ+1ax
   9htOlIaoJglO8lst2qB45zJWlWKE44BEmZqy8lEb7JYZDpSpT/L67n7tp
   tV9+pMZdjWe2ysjKCP+mTGmT1E/NvSeVAnbkRgKSY5lQ9l/xgqsKoonq+
   nmh3Q9MeXFzfhJ8241o9mx+wHMx1zkMD5dZqx7caHRlb6cggc9ZzmNKYN
   yX3XvhVvb7RtdFbVstAQjknX7KRbRSmgLtlPkgPk3iLaiNNTrtAjyCOtn
   UvTM509ESwsGO93GpgxIkSn9ARSN1DRdUetikR98Vv0RDapshutdQlUk+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="6652817"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="6652817"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 20:25:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="878371128"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="878371128"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Oct 2023 20:25:50 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr8o7-0004Hl-39;
	Fri, 13 Oct 2023 03:25:47 +0000
Date: Fri, 13 Oct 2023 11:25:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt76x02_util.c:475
 mt76x02_set_key() warn: variable dereferenced before check 'key' (see line
 415)
Message-ID: <202310131101.mdSNSTmg-lkp@intel.com>
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
head:   20f4757fa5ed2d9a7746d01b8950cfe04d593a0a
commit: e6db67fa871dee37d22701daba806bfcd4d9df49 wifi: mt76: ignore key disable commands
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-141-20231011 (https://download.01.org/0day-ci/archive/20231013/202310131101.mdSNSTmg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310131101.mdSNSTmg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310131101.mdSNSTmg-lkp@intel.com/

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
