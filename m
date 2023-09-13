Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA2B3214
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Sep 2023 16:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694623531; x=1726159531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6CBUnkdpNtXwzUUoaZ1PWhx/UHMAWFnEu9NQan0Wzxw=;
  b=EeOQkDTPyyUMz98s3p4n9DWqanZMMPC1EqY9pXTeVCE5c5kxZnlcZQCI
   ZpGp0YbG5HLTplGaob7jNxKZ/gUjj2qbXbjqZzWCFjro0bAO3tLTdLx2G
   2fnUhLI6ojhdKF0VrbyteKtK02CnZGsZqfO61ORBqs/x/gvVdJji/Ih1v
   9AaMDz95r3sX//CvWsjVf3WyED6lliZSZrtzdkgOf0/kHnUaH9Pd7cemO
   X/GYz7tpWnHOP070UhwANyOy6egnVVt3sfRMT+gE3e3Eycd9lWKUCW6Lz
   SWJR90OVYZcjf/ZRGVYQxrV7aJAJwec6NpKYTAVId5zO5YDd1qb7t5A6n
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="378627259"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="378627259"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 09:45:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="990996650"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="990996650"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 13 Sep 2023 09:45:28 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgSzX-0000Ln-01;
	Wed, 13 Sep 2023 16:45:27 +0000
Date: Thu, 14 Sep 2023 00:45:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [nbd168-wireless:mt76 10/10]
 drivers/net/wireless/mediatek/mt76/mt7915/main.c:498:17: sparse: sparse:
 dubious: x & !y
Message-ID: <202309140010.HPVRwN61-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/wireless/mediatek/mt76/mt7915/main.c:498:17: sparse: sparse: dubious: x & !y"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Felix Fietkau <nbd@nbd.name>

tree:   https://github.com/nbd168/wireless mt76
head:   c04c9589d3f0574da76b8439b2478485ed0af4df
commit: c04c9589d3f0574da76b8439b2478485ed0af4df [10/10] wifi: mt76: mt7915: fix monitor mode issues
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-062-20230913 (https://download.01.org/0day-ci/archive/20230914/202309140010.HPVRwN61-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140010.HPVRwN61-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309140010.HPVRwN61-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:498:17: sparse: sparse: dubious: x & !y

vim +498 drivers/net/wireless/mediatek/mt76/mt7915/main.c

2c70627b09aced Lorenzo Bianconi 2021-11-23  452  
e57b7901469fc0 Ryder Lee        2020-04-25  453  static int mt7915_config(struct ieee80211_hw *hw, u32 changed)
e57b7901469fc0 Ryder Lee        2020-04-25  454  {
e57b7901469fc0 Ryder Lee        2020-04-25  455  	struct mt7915_dev *dev = mt7915_hw_dev(hw);
e57b7901469fc0 Ryder Lee        2020-04-25  456  	struct mt7915_phy *phy = mt7915_hw_phy(hw);
e57b7901469fc0 Ryder Lee        2020-04-25  457  	int ret;
e57b7901469fc0 Ryder Lee        2020-04-25  458  
e57b7901469fc0 Ryder Lee        2020-04-25  459  	if (changed & IEEE80211_CONF_CHANGE_CHANNEL) {
aadf09537c575d Shayne Chen      2020-10-22  460  #ifdef CONFIG_NL80211_TESTMODE
c918c74d06457e Shayne Chen      2020-12-04  461  		if (phy->mt76->test.state != MT76_TM_STATE_OFF) {
aadf09537c575d Shayne Chen      2020-10-22  462  			mutex_lock(&dev->mt76.mutex);
c918c74d06457e Shayne Chen      2020-12-04  463  			mt76_testmode_reset(phy->mt76, false);
aadf09537c575d Shayne Chen      2020-10-22  464  			mutex_unlock(&dev->mt76.mutex);
aadf09537c575d Shayne Chen      2020-10-22  465  		}
aadf09537c575d Shayne Chen      2020-10-22  466  #endif
e57b7901469fc0 Ryder Lee        2020-04-25  467  		ieee80211_stop_queues(hw);
e57b7901469fc0 Ryder Lee        2020-04-25  468  		ret = mt7915_set_channel(phy);
e57b7901469fc0 Ryder Lee        2020-04-25  469  		if (ret)
e57b7901469fc0 Ryder Lee        2020-04-25  470  			return ret;
e57b7901469fc0 Ryder Lee        2020-04-25  471  		ieee80211_wake_queues(hw);
e57b7901469fc0 Ryder Lee        2020-04-25  472  	}
e57b7901469fc0 Ryder Lee        2020-04-25  473  
6c0570bc21ec20 Ryder Lee        2023-07-27  474  	if (changed & (IEEE80211_CONF_CHANGE_POWER |
6c0570bc21ec20 Ryder Lee        2023-07-27  475  		       IEEE80211_CONF_CHANGE_CHANNEL)) {
ecb187a74e1846 Shayne Chen      2021-04-17  476  		ret = mt7915_mcu_set_txpower_sku(phy);
f1d962369d5687 Ryder Lee        2020-04-25  477  		if (ret)
f1d962369d5687 Ryder Lee        2020-04-25  478  			return ret;
f1d962369d5687 Ryder Lee        2020-04-25  479  	}
f1d962369d5687 Ryder Lee        2020-04-25  480  
e57b7901469fc0 Ryder Lee        2020-04-25  481  	mutex_lock(&dev->mt76.mutex);
e57b7901469fc0 Ryder Lee        2020-04-25  482  
e57b7901469fc0 Ryder Lee        2020-04-25  483  	if (changed & IEEE80211_CONF_CHANGE_MONITOR) {
11553d88d0b99b Felix Fietkau    2020-09-30  484  		bool enabled = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
3eb50cc9053437 Ryder Lee        2022-12-01  485  		bool band = phy->mt76->band_idx;
c04c9589d3f057 Felix Fietkau    2023-08-31  486  		u32 rxfilter = phy->rxfilter;
11553d88d0b99b Felix Fietkau    2020-09-30  487  
c04c9589d3f057 Felix Fietkau    2023-08-31  488  		if (!enabled) {
c04c9589d3f057 Felix Fietkau    2023-08-31  489  			rxfilter |= MT_WF_RFCR_DROP_OTHER_UC;
c04c9589d3f057 Felix Fietkau    2023-08-31  490  			dev->monitor_mask &= ~BIT(band);
c04c9589d3f057 Felix Fietkau    2023-08-31  491  		} else {
c04c9589d3f057 Felix Fietkau    2023-08-31  492  			rxfilter &= ~MT_WF_RFCR_DROP_OTHER_UC;
c04c9589d3f057 Felix Fietkau    2023-08-31  493  			dev->monitor_mask |= BIT(band);
c04c9589d3f057 Felix Fietkau    2023-08-31  494  		}
e57b7901469fc0 Ryder Lee        2020-04-25  495  
4c430774e01b06 Lorenzo Bianconi 2020-11-13  496  		mt76_rmw_field(dev, MT_DMA_DCR0(band), MT_DMA_DCR0_RXD_G5_EN,
4c430774e01b06 Lorenzo Bianconi 2020-11-13  497  			       enabled);
c04c9589d3f057 Felix Fietkau    2023-08-31 @498  		mt76_rmw_field(dev, MT_DMA_DCR0(band), MT_MDP_DCR0_RX_HDR_TRANS_EN,
c04c9589d3f057 Felix Fietkau    2023-08-31  499  			       !dev->monitor_mask);
c918c74d06457e Shayne Chen      2020-12-04  500  		mt76_testmode_reset(phy->mt76, true);
c04c9589d3f057 Felix Fietkau    2023-08-31  501  		mt76_wr(dev, MT_WF_RFCR(band), rxfilter);
e57b7901469fc0 Ryder Lee        2020-04-25  502  	}
e57b7901469fc0 Ryder Lee        2020-04-25  503  
e57b7901469fc0 Ryder Lee        2020-04-25  504  	mutex_unlock(&dev->mt76.mutex);
e57b7901469fc0 Ryder Lee        2020-04-25  505  
e57b7901469fc0 Ryder Lee        2020-04-25  506  	return 0;
e57b7901469fc0 Ryder Lee        2020-04-25  507  }
e57b7901469fc0 Ryder Lee        2020-04-25  508  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
