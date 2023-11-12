Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DE55235
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Nov 2023 09:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVafpQ1+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699780815; x=1731316815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O4eqw4IWUPvGOrCbModczntRuDS6GX9LOgQU7DkJnSY=;
  b=UVafpQ1+IgOs6lSSuEhUZykgxJeUo4zbigj0qhKt7dM4GP5LupCU42iH
   XIL83l9IG3zym5oasFr0GjGyrY+mtW2ZX4pzVu7B2BtVaLwWImg5N3dnX
   xTloUdX88ff6SugYL+rL1BiUqX6JRKoZMBDF3zKPDf6RLnJbB8+beP2M5
   eHdR0D1fe8iW58oDpNRaBir6G3lf7KPe8Z5a5HwyyEZi0gaOZ8tAcuuGC
   C9huYPOJMLVW4QpPucVyymnzwwQOpPlfF+QYV+WZBuzGcXErHv2jvCfAM
   8ZmURxzw+JzOlNQoRl6u4PSsE2fkbUByhzITAZ3H4BH8ey+3mSDifcceF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="393188323"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="393188323"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 01:20:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="937509168"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="937509168"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Nov 2023 01:20:13 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r26dW-000B2U-2i;
	Sun, 12 Nov 2023 09:20:10 +0000
Date: Sun, 12 Nov 2023 17:19:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7603/dma.c:45
 mt7603_rx_loopback_skb() warn: potential spectre issue 'dev->mt76.wcid' [w]
 (local cap)
Message-ID: <202311121704.w5Q5wipu-lkp@intel.com>
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
head:   1b907d0507354b74a4f2c286380cd6059af79248
commit: c8846e1015022d2531ac4c895783e400b3e5babe mt76: add driver for MT7603E and MT7628/7688
date:   4 years, 9 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 years, 9 months ago
config: i386-randconfig-141-20230912 (https://download.01.org/0day-ci/archive/20231112/202311121704.w5Q5wipu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231112/202311121704.w5Q5wipu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311121704.w5Q5wipu-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7603/dma.c:45 mt7603_rx_loopback_skb() warn: potential spectre issue 'dev->mt76.wcid' [w] (local cap)
drivers/net/wireless/mediatek/mt76/mt7603/mac.c:509 mt7603_mac_fill_rx() warn: potential spectre issue 'sband->channels' [r] (local cap)

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7603/dma.c:45 mt7603_rx_loopback_skb() warn: possible spectre second half.  '__u.__val'
drivers/net/wireless/mediatek/mt76/mt7603/mac.c:1075 mt7603_fill_txs() error: uninitialized symbol 'i'.

vim +45 drivers/net/wireless/mediatek/mt76/mt7603/dma.c

c8846e1015022d25 Felix Fietkau 2018-11-06  25  
c8846e1015022d25 Felix Fietkau 2018-11-06  26  static void
c8846e1015022d25 Felix Fietkau 2018-11-06  27  mt7603_rx_loopback_skb(struct mt7603_dev *dev, struct sk_buff *skb)
c8846e1015022d25 Felix Fietkau 2018-11-06  28  {
c8846e1015022d25 Felix Fietkau 2018-11-06  29  	__le32 *txd = (__le32 *)skb->data;
c8846e1015022d25 Felix Fietkau 2018-11-06  30  	struct mt7603_sta *msta;
c8846e1015022d25 Felix Fietkau 2018-11-06  31  	struct mt76_wcid *wcid;
c8846e1015022d25 Felix Fietkau 2018-11-06  32  	int idx;
c8846e1015022d25 Felix Fietkau 2018-11-06  33  	u32 val;
c8846e1015022d25 Felix Fietkau 2018-11-06  34  
c8846e1015022d25 Felix Fietkau 2018-11-06  35  	if (skb->len < sizeof(MT_TXD_SIZE) + sizeof(struct ieee80211_hdr))
c8846e1015022d25 Felix Fietkau 2018-11-06  36  		goto free;
c8846e1015022d25 Felix Fietkau 2018-11-06  37  
c8846e1015022d25 Felix Fietkau 2018-11-06  38  	val = le32_to_cpu(txd[1]);
c8846e1015022d25 Felix Fietkau 2018-11-06  39  	idx = FIELD_GET(MT_TXD1_WLAN_IDX, val);
c8846e1015022d25 Felix Fietkau 2018-11-06  40  	skb->priority = FIELD_GET(MT_TXD1_TID, val);
c8846e1015022d25 Felix Fietkau 2018-11-06  41  
c8846e1015022d25 Felix Fietkau 2018-11-06  42  	if (idx >= MT7603_WTBL_STA - 1)
c8846e1015022d25 Felix Fietkau 2018-11-06  43  		goto free;
c8846e1015022d25 Felix Fietkau 2018-11-06  44  
c8846e1015022d25 Felix Fietkau 2018-11-06 @45  	wcid = rcu_dereference(dev->mt76.wcid[idx]);
c8846e1015022d25 Felix Fietkau 2018-11-06  46  	if (!wcid)
c8846e1015022d25 Felix Fietkau 2018-11-06  47  		goto free;
c8846e1015022d25 Felix Fietkau 2018-11-06  48  
c8846e1015022d25 Felix Fietkau 2018-11-06  49  	msta = container_of(wcid, struct mt7603_sta, wcid);
c8846e1015022d25 Felix Fietkau 2018-11-06  50  	val = le32_to_cpu(txd[0]);
c8846e1015022d25 Felix Fietkau 2018-11-06  51  	skb_set_queue_mapping(skb, FIELD_GET(MT_TXD0_Q_IDX, val));
c8846e1015022d25 Felix Fietkau 2018-11-06  52  
c8846e1015022d25 Felix Fietkau 2018-11-06  53  	spin_lock_bh(&dev->ps_lock);
c8846e1015022d25 Felix Fietkau 2018-11-06  54  	__skb_queue_tail(&msta->psq, skb);
c8846e1015022d25 Felix Fietkau 2018-11-06  55  	if (skb_queue_len(&msta->psq) >= 64) {
c8846e1015022d25 Felix Fietkau 2018-11-06  56  		skb = __skb_dequeue(&msta->psq);
c8846e1015022d25 Felix Fietkau 2018-11-06  57  		dev_kfree_skb(skb);
c8846e1015022d25 Felix Fietkau 2018-11-06  58  	}
c8846e1015022d25 Felix Fietkau 2018-11-06  59  	spin_unlock_bh(&dev->ps_lock);
c8846e1015022d25 Felix Fietkau 2018-11-06  60  	return;
c8846e1015022d25 Felix Fietkau 2018-11-06  61  
c8846e1015022d25 Felix Fietkau 2018-11-06  62  free:
c8846e1015022d25 Felix Fietkau 2018-11-06  63  	dev_kfree_skb(skb);
c8846e1015022d25 Felix Fietkau 2018-11-06  64  }
c8846e1015022d25 Felix Fietkau 2018-11-06  65  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
