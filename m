Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5804CA70
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Oct 2023 06:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6t9fghg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697090432; x=1728626432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IhEGCxT9o0vNthbmWHqA3e3srX2EjdKsmN5mEWslSCA=;
  b=M6t9fghgwuFkoVhHBWmDrq3u0GJ9R8W2I6EwjH7Ze3bU24VOqU1kjjU6
   oiboVxPKbvK6eEYusc/XfLtfV1VRGksBu2R4NKSdLDIh84xEea5b31ylS
   G5FUhH2L0x7fAA7BsMLXU6YrqwxCOm3jFgckJnzc6ojqPLcHltsrUNVUQ
   0yGcPb5/9nj34Tk1q2nZn2iluWiPPHIsFfzpGEnnSWqqrTKpupLR3kKMo
   JIFSr+8Pr8qMxmUTEP3ThLJNBvqgfhcENZlVPHAeI811qoVbjTooa8HbX
   5yGCvX7HE1detJf7rOeI8RMgHijEoKv0xIdjQxAAA3PC83xnnWMuxMNrk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="364207882"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="364207882"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 23:00:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="704031535"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="704031535"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 11 Oct 2023 23:00:30 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqokE-0003FJ-0D;
	Thu, 12 Oct 2023 06:00:26 +0000
Date: Thu, 12 Oct 2023 13:59:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7796/11428]
 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c:302
 mt76_connac2_mac_tx_rate_val() warn: variable dereferenced before check
 'vif' (see line 296)
Message-ID: <202310121311.s9gz7dvC-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Sean Wang <sean.wang@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>
CC: David Ruth <druth@chromium.org>
CC: Deren Wu <deren.wu@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2933a1156742d8c47550493a77af8e2d81cf3c84
commit: 32b1000db221df33ec8b57794a091ba6075b6c28 [7796/11428] wifi: mt76: mt7921: fix the wrong rate pickup for the chanctx driver
:::::: branch date: 24 hours ago
:::::: commit date: 12 days ago
config: i386-randconfig-141-20231011 (https://download.01.org/0day-ci/archive/20231012/202310121311.s9gz7dvC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121311.s9gz7dvC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310121311.s9gz7dvC-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c:302 mt76_connac2_mac_tx_rate_val() warn: variable dereferenced before check 'vif' (see line 296)

vim +/vif +302 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c

9c54548bc9e462 Ryder Lee        2023-04-14  291  
0b8e2d69467f78 Lorenzo Bianconi 2023-01-17  292  u16 mt76_connac2_mac_tx_rate_val(struct mt76_phy *mphy,
0b8e2d69467f78 Lorenzo Bianconi 2023-01-17  293  				 struct ieee80211_vif *vif,
182071cdd594bc Lorenzo Bianconi 2022-06-07  294  				 bool beacon, bool mcast)
182071cdd594bc Lorenzo Bianconi 2022-06-07  295  {
32b1000db221df Sean Wang        2023-09-18 @296  	struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
32b1000db221df Sean Wang        2023-09-18  297  	struct cfg80211_chan_def *chandef = mvif->ctx ?
32b1000db221df Sean Wang        2023-09-18  298  					    &mvif->ctx->def : &mphy->chandef;
32b1000db221df Sean Wang        2023-09-18  299  	u8 nss = 0, mode = 0, band = chandef->chan->band;
182071cdd594bc Lorenzo Bianconi 2022-06-07  300  	int rateidx = 0, mcast_rate;
182071cdd594bc Lorenzo Bianconi 2022-06-07  301  
182071cdd594bc Lorenzo Bianconi 2022-06-07 @302  	if (!vif)
182071cdd594bc Lorenzo Bianconi 2022-06-07  303  		goto legacy;
182071cdd594bc Lorenzo Bianconi 2022-06-07  304  
182071cdd594bc Lorenzo Bianconi 2022-06-07  305  	if (is_mt7921(mphy->dev)) {
182071cdd594bc Lorenzo Bianconi 2022-06-07  306  		rateidx = ffs(vif->bss_conf.basic_rates) - 1;
182071cdd594bc Lorenzo Bianconi 2022-06-07  307  		goto legacy;
182071cdd594bc Lorenzo Bianconi 2022-06-07  308  	}
182071cdd594bc Lorenzo Bianconi 2022-06-07  309  
182071cdd594bc Lorenzo Bianconi 2022-06-07  310  	if (beacon) {
182071cdd594bc Lorenzo Bianconi 2022-06-07  311  		struct cfg80211_bitrate_mask *mask;
182071cdd594bc Lorenzo Bianconi 2022-06-07  312  
182071cdd594bc Lorenzo Bianconi 2022-06-07  313  		mask = &vif->bss_conf.beacon_tx_rate;
9c54548bc9e462 Ryder Lee        2023-04-14  314  
9c54548bc9e462 Ryder Lee        2023-04-14  315  		__bitrate_mask_check(he_mcs, HE_SU);
9c54548bc9e462 Ryder Lee        2023-04-14  316  		__bitrate_mask_check(vht_mcs, VHT);
9c54548bc9e462 Ryder Lee        2023-04-14  317  		__bitrate_mask_check(ht_mcs, HT);
9c54548bc9e462 Ryder Lee        2023-04-14  318  
9c54548bc9e462 Ryder Lee        2023-04-14  319  		if (hweight32(mask->control[band].legacy) == 1) {
182071cdd594bc Lorenzo Bianconi 2022-06-07  320  			rateidx = ffs(mask->control[band].legacy) - 1;
182071cdd594bc Lorenzo Bianconi 2022-06-07  321  			goto legacy;
182071cdd594bc Lorenzo Bianconi 2022-06-07  322  		}
182071cdd594bc Lorenzo Bianconi 2022-06-07  323  	}
182071cdd594bc Lorenzo Bianconi 2022-06-07  324  
182071cdd594bc Lorenzo Bianconi 2022-06-07  325  	mcast_rate = vif->bss_conf.mcast_rate[band];
182071cdd594bc Lorenzo Bianconi 2022-06-07  326  	if (mcast && mcast_rate > 0)
182071cdd594bc Lorenzo Bianconi 2022-06-07  327  		rateidx = mcast_rate - 1;
182071cdd594bc Lorenzo Bianconi 2022-06-07  328  	else
182071cdd594bc Lorenzo Bianconi 2022-06-07  329  		rateidx = ffs(vif->bss_conf.basic_rates) - 1;
182071cdd594bc Lorenzo Bianconi 2022-06-07  330  
182071cdd594bc Lorenzo Bianconi 2022-06-07  331  legacy:
32b1000db221df Sean Wang        2023-09-18  332  	rateidx = mt76_calculate_default_rate(mphy, vif, rateidx);
182071cdd594bc Lorenzo Bianconi 2022-06-07  333  	mode = rateidx >> 8;
182071cdd594bc Lorenzo Bianconi 2022-06-07  334  	rateidx &= GENMASK(7, 0);
182071cdd594bc Lorenzo Bianconi 2022-06-07  335  out:
9c54548bc9e462 Ryder Lee        2023-04-14  336  	return FIELD_PREP(MT_TX_RATE_NSS, nss) |
9c54548bc9e462 Ryder Lee        2023-04-14  337  	       FIELD_PREP(MT_TX_RATE_IDX, rateidx) |
182071cdd594bc Lorenzo Bianconi 2022-06-07  338  	       FIELD_PREP(MT_TX_RATE_MODE, mode);
182071cdd594bc Lorenzo Bianconi 2022-06-07  339  }
0b8e2d69467f78 Lorenzo Bianconi 2023-01-17  340  EXPORT_SYMBOL_GPL(mt76_connac2_mac_tx_rate_val);
182071cdd594bc Lorenzo Bianconi 2022-06-07  341  

:::::: The code at line 302 was first introduced by commit
:::::: 182071cdd594bc79f42899c85afa995c370ef82d mt76: connac: move connac2_mac_write_txwi in mt76_connac module

:::::: TO: Lorenzo Bianconi <lorenzo@kernel.org>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
