Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFC454654
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Sep 2025 04:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757390982; cv=none; b=WhLFsfAxlJsu0if3sf+c5wD7PV54qnya5WPfpaZpYVYh9f0xEhvQeK3eJgs232rZgN1JXOvQS9SFwAn3dIkQmAnjIwj52q2AeUEdUIWmIbigolPJSDokE0dOkXYETk4mbBzQaPp4FGOK6a6H/HqX9ed74rOdM4GTN6zodVGoOng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757390982; c=relaxed/simple;
	bh=w230Ndk6SLI/uOCUBqm/9OiGoAceBPpk8g/fTzW4YoI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b9D2jIGhf8FYIZN11s5kyLBruxe6eWEkI7HPYnzgX5xNs+INIybTzca77MVHiRuMXytC5i12Z+FsZrQ9MK2s8DSTDth7WlvGCh0zaPeeKqIXTCRz6RoolVFcuGNgrxLHc/JCgVFvy5uioFarY0b+6G4O/+q89bQpvSaF234N68g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cI2bseUP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cI2bseUP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757390980; x=1788926980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w230Ndk6SLI/uOCUBqm/9OiGoAceBPpk8g/fTzW4YoI=;
  b=cI2bseUPwTvSs/LC5aRB4pbAoboaW6ZelSqd7ga+/eqLVdIwsveFmZOA
   pRBApoviXuaW9WJNpv4/0IjqUqoreQ8ycYsUuaROeSqnrTJLwrN6iTgc7
   IrtUpHcsyxrVzke7e2gNSvQlkLbKm/YU5X3PfMOEWGi89cqgBHJu/LxO1
   i6PwBc23/YkoHtsh+wlNHwGJO8hRkQYO13mwZ/GsmbXF3f4hzn/vZ6sd9
   iUx8D+yuB40WRaCBC9ZAAp+DRtaBHnF/nhUz0fiSpnEsfm2DaVR8pId6M
   E+fuj+0soHrLlDUMCTr2renRhMwqJ+GOaROAdJCG/KPLoDWSd1OEp7RPr
   w==;
X-CSE-ConnectionGUID: xH+1F7/DROa6/Ds80IzX7w==
X-CSE-MsgGUID: c870Bq2JR12ShiYdPhuSwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="47239508"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="47239508"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 21:09:39 -0700
X-CSE-ConnectionGUID: 3Ba7Q1wWTx2UvJ3GHDR/pA==
X-CSE-MsgGUID: xrtDmB4rTXGYE+489je8/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="172150160"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Sep 2025 21:09:37 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvpfi-0004Q5-2b;
	Tue, 09 Sep 2025 04:09:34 +0000
Date: Tue, 9 Sep 2025 12:09:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [nbd168-wireless:mt76 5/19]
 drivers/net/wireless/mediatek/mt76/mt7996/main.c:1279 mt7996_tx() error: we
 previously assumed 'vif' could be null (see line 1262)
Message-ID: <202509091137.3BrqVNmN-lkp@intel.com>
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
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>

tree:   https://github.com/nbd168/wireless mt76
head:   11c3ee032f406b80c7ccf743ddfc7b12387abf4a
commit: 6c270ac14b34f53688527658aeff0f4e02a0628c [5/19] wifi: mt76: mt7996: Set proper link destination address in mt7996_tx()
:::::: branch date: 19 hours ago
:::::: commit date: 2 weeks ago
config: xtensa-randconfig-r071-20250909 (https://download.01.org/0day-ci/archive/20250909/202509091137.3BrqVNmN-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509091137.3BrqVNmN-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/main.c:1279 mt7996_tx() error: we previously assumed 'vif' could be null (see line 1262)
drivers/net/wireless/mediatek/mt76/mt7996/main.c:1307 mt7996_tx() error: testing array offset 'link_id' after use.

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/main.c:320 mt7996_vif_link_add() warn: unsigned 'link->mld_idx' is never less than zero.
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting
drivers/net/wireless/mediatek/mt76/mt7996/main.c:1328 mt7996_tx() error: testing array offset 'link_id' after use.

vim +/vif +1279 drivers/net/wireless/mediatek/mt76/mt7996/main.c

98686cd21624c7 Shayne Chen      2022-11-22  1250  
98686cd21624c7 Shayne Chen      2022-11-22  1251  static void mt7996_tx(struct ieee80211_hw *hw,
98686cd21624c7 Shayne Chen      2022-11-22  1252  		      struct ieee80211_tx_control *control,
98686cd21624c7 Shayne Chen      2022-11-22  1253  		      struct sk_buff *skb)
98686cd21624c7 Shayne Chen      2022-11-22  1254  {
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1255  	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
98686cd21624c7 Shayne Chen      2022-11-22  1256  	struct mt7996_dev *dev = mt7996_hw_dev(hw);
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1257  	struct ieee80211_sta *sta = control->sta;
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1258  	struct mt7996_sta *msta = sta ? (void *)sta->drv_priv : NULL;
98686cd21624c7 Shayne Chen      2022-11-22  1259  	struct mt76_phy *mphy = hw->priv;
98686cd21624c7 Shayne Chen      2022-11-22  1260  	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
98686cd21624c7 Shayne Chen      2022-11-22  1261  	struct ieee80211_vif *vif = info->control.vif;
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31 @1262  	struct mt7996_vif *mvif = vif ? (void *)vif->drv_priv : NULL;
98686cd21624c7 Shayne Chen      2022-11-22  1263  	struct mt76_wcid *wcid = &dev->mt76.global_wcid;
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1264  	u8 link_id = u32_get_bits(info->control.flags,
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1265  				  IEEE80211_TX_CTRL_MLO_LINK);
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1266  
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1267  	rcu_read_lock();
98686cd21624c7 Shayne Chen      2022-11-22  1268  
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1269  	/* Use primary link_id if the value from mac80211 is set to
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1270  	 * IEEE80211_LINK_UNSPECIFIED.
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1271  	 */
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1272  	if (link_id == IEEE80211_LINK_UNSPECIFIED) {
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1273  		if (msta)
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1274  			link_id = msta->deflink_id;
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1275  		else if (mvif)
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1276  			link_id = mvif->mt76.deflink_id;
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1277  	}
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1278  
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31 @1279  	if (ieee80211_vif_is_mld(vif)) {
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1280  		struct ieee80211_bss_conf *link_conf;
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1281  
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1282  		if (msta) {
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1283  			struct ieee80211_link_sta *link_sta;
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1284  
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1285  			link_sta = rcu_dereference(sta->link[link_id]);
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1286  			if (!link_sta)
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1287  				link_sta = rcu_dereference(sta->link[msta->deflink_id]);
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1288  
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1289  			if (link_sta) {
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1290  				memcpy(hdr->addr1, link_sta->addr, ETH_ALEN);
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1291  				if (ether_addr_equal(sta->addr, hdr->addr3))
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1292  					memcpy(hdr->addr3, link_sta->addr, ETH_ALEN);
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1293  			}
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1294  		}
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1295  
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1296  		link_conf = rcu_dereference(vif->link_conf[link_id]);
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1297  		if (link_conf) {
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1298  			memcpy(hdr->addr2, link_conf->addr, ETH_ALEN);
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1299  			if (ether_addr_equal(vif->addr, hdr->addr3))
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1300  				memcpy(hdr->addr3, link_conf->addr, ETH_ALEN);
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1301  		}
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1302  	}
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1303  
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1304  	if (mvif) {
64cbf0d7ce9afe Lorenzo Bianconi 2025-07-04  1305  		struct mt76_vif_link *mlink = &mvif->deflink.mt76;
69d54ce7491d04 Felix Fietkau    2025-01-02  1306  
64cbf0d7ce9afe Lorenzo Bianconi 2025-07-04 @1307  		if (link_id < IEEE80211_LINK_UNSPECIFIED)
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1308  			mlink = rcu_dereference(mvif->mt76.link[link_id]);
64cbf0d7ce9afe Lorenzo Bianconi 2025-07-04  1309  
64cbf0d7ce9afe Lorenzo Bianconi 2025-07-04  1310  		if (mlink->wcid)
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1311  			wcid = mlink->wcid;
69d54ce7491d04 Felix Fietkau    2025-01-02  1312  
69d54ce7491d04 Felix Fietkau    2025-01-02  1313  		if (mvif->mt76.roc_phy &&
69d54ce7491d04 Felix Fietkau    2025-01-02  1314  		    (info->flags & IEEE80211_TX_CTL_TX_OFFCHAN)) {
69d54ce7491d04 Felix Fietkau    2025-01-02  1315  			mphy = mvif->mt76.roc_phy;
69d54ce7491d04 Felix Fietkau    2025-01-02  1316  			if (mphy->roc_link)
69d54ce7491d04 Felix Fietkau    2025-01-02  1317  				wcid = mphy->roc_link->wcid;
69d54ce7491d04 Felix Fietkau    2025-01-02  1318  		} else {
64cbf0d7ce9afe Lorenzo Bianconi 2025-07-04  1319  			mphy = mt76_vif_link_phy(mlink);
69d54ce7491d04 Felix Fietkau    2025-01-02  1320  		}
69d54ce7491d04 Felix Fietkau    2025-01-02  1321  	}
69d54ce7491d04 Felix Fietkau    2025-01-02  1322  
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1323  	if (!mphy) {
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1324  		ieee80211_free_txskb(hw, skb);
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1325  		goto unlock;
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1326  	}
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1327  
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1328  	if (msta && link_id < IEEE80211_LINK_UNSPECIFIED) {
f32915eb6dd4b6 Lorenzo Bianconi 2025-03-11  1329  		struct mt7996_sta_link *msta_link;
98686cd21624c7 Shayne Chen      2022-11-22  1330  
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1331  		msta_link = rcu_dereference(msta->link[link_id]);
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1332  		if (msta_link)
f32915eb6dd4b6 Lorenzo Bianconi 2025-03-11  1333  			wcid = &msta_link->wcid;
98686cd21624c7 Shayne Chen      2022-11-22  1334  	}
98686cd21624c7 Shayne Chen      2022-11-22  1335  	mt76_tx(mphy, control->sta, wcid, skb);
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1336  unlock:
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1337  	rcu_read_unlock();
98686cd21624c7 Shayne Chen      2022-11-22  1338  }
98686cd21624c7 Shayne Chen      2022-11-22  1339  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
