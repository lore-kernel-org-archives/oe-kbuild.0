Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6671B283
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Oct 2023 22:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3G9S+am"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698187239; x=1729723239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p4S7oaNnjd48ofgWUWBQRFJnx44Md1DGaNxkSB1x3RA=;
  b=H3G9S+amOZICtOew7lrKkkwWHOkhGVpG50Ht5lPB7AQme0rLKG2FKIHF
   0c9chlkN/h8DW6D9aFB0W8dig20IVXJfXD2qgrM3oJTM0+fKrz1cxlUzn
   CkLXKROWLdk+YFqayB990UKJFcu/ngETp6zStGJ76dJTcxWfg7WTuWc+4
   RxMsdpCI51s9/Oa+VNCPqB3QluPy04GT1IF3p/21FZ9Z5uQl/tb2E9R+e
   FRjkHnWUW0lHBhqhP1ERoHHyhSGAUFL/LjhLO77mUF5IbMHdzdCvqMIaV
   Gs+6C5Wn04JSE8XgJXEfZekrHFv9Pv1JaxZK5SyvPurmdLYZWDkR32mbj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="5804775"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="5804775"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 15:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="902357848"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="902357848"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Oct 2023 15:38:11 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvQ4c-0008MT-23;
	Tue, 24 Oct 2023 22:40:30 +0000
Date: Wed, 25 Oct 2023 06:40:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4839/14747]
 drivers/net/wireless/mediatek/mt76/mt7915/main.c:498:17: sparse: sparse:
 dubious: x & !y
Message-ID: <202310250609.K45P9ysN-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Felix Fietkau <nbd@nbd.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f017d9a92a735ac1adc8875955621eda6ae1b3e6
commit: b2491018587a4aca6ea398bbad8f142306b8e086 [4839/14747] wifi: mt76: mt7915: fix monitor mode issues
:::::: branch date: 16 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-063-20231025 (https://download.01.org/0day-ci/archive/20231025/202310250609.K45P9ysN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310250609.K45P9ysN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310250609.K45P9ysN-lkp@intel.com/

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
b2491018587a4a Felix Fietkau    2023-08-31  486  		u32 rxfilter = phy->rxfilter;
11553d88d0b99b Felix Fietkau    2020-09-30  487  
b2491018587a4a Felix Fietkau    2023-08-31  488  		if (!enabled) {
b2491018587a4a Felix Fietkau    2023-08-31  489  			rxfilter |= MT_WF_RFCR_DROP_OTHER_UC;
b2491018587a4a Felix Fietkau    2023-08-31  490  			dev->monitor_mask &= ~BIT(band);
b2491018587a4a Felix Fietkau    2023-08-31  491  		} else {
b2491018587a4a Felix Fietkau    2023-08-31  492  			rxfilter &= ~MT_WF_RFCR_DROP_OTHER_UC;
b2491018587a4a Felix Fietkau    2023-08-31  493  			dev->monitor_mask |= BIT(band);
b2491018587a4a Felix Fietkau    2023-08-31  494  		}
e57b7901469fc0 Ryder Lee        2020-04-25  495  
4c430774e01b06 Lorenzo Bianconi 2020-11-13  496  		mt76_rmw_field(dev, MT_DMA_DCR0(band), MT_DMA_DCR0_RXD_G5_EN,
4c430774e01b06 Lorenzo Bianconi 2020-11-13  497  			       enabled);
b2491018587a4a Felix Fietkau    2023-08-31 @498  		mt76_rmw_field(dev, MT_DMA_DCR0(band), MT_MDP_DCR0_RX_HDR_TRANS_EN,
b2491018587a4a Felix Fietkau    2023-08-31  499  			       !dev->monitor_mask);
c918c74d06457e Shayne Chen      2020-12-04  500  		mt76_testmode_reset(phy->mt76, true);
b2491018587a4a Felix Fietkau    2023-08-31  501  		mt76_wr(dev, MT_WF_RFCR(band), rxfilter);
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
