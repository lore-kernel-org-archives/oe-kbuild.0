Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B575B3191C2
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 10:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766573001; cv=none; b=cFn8rNqyLRX6SpuPj8PXPXOQktLpnVSDBVgPmq7roUQSyIjDUS9NtkKueArXU34cJU0bQRvJKlBTGtKTK+FMpXP5liYzzrfJ8fC5nG1Et5C6mNxXQXJqiJ6RajseWh4D3hWSFUFUo5PD80BDU+0jqpDAW/B+xzwlWz3680A8QbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766573001; c=relaxed/simple;
	bh=yxocUM9FJ5ULXEzEg516wplicCpGvv0YGEsvYgE3XeQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GvSitZrxiQPhV+nus2L7VOkkkkbdlnNCWUDb6DZKmnBtlNUwj23s6uIv6VEcwyKQ9o1HbDx/bUC15PWUWRIlrUQ0C8Zn+2mxb+81yhZ/BchTLJpor+p5+IrfdwAcVLNK+AbahxvqjuDGpUOHkNA8YfrfcAJ6Dxa7zaC7sF+NKSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dYMq72E5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dYMq72E5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766572997; x=1798108997;
  h=date:from:to:cc:subject:message-id;
  bh=yxocUM9FJ5ULXEzEg516wplicCpGvv0YGEsvYgE3XeQ=;
  b=dYMq72E5LwvW7+et+uMFoaGWSos+d9Rjs5/f4i3/YqApzq1v1EXBb4QI
   kqC/JptE5rMK9ZUwJ9gi+kNfO0Y16Mmy6Gcj2ia2ejbzjiMndCOANMlwB
   tQTUBPrWA8YJQ7Hj1ml6tkkayYvZ7OTQmi2j9YrJnlhtymbCz/pK5nwUe
   pSrHRA8OaaSBjkLVBgchtah6yRkjTj9Ha4b4iZBFF6oI60B9o/1IELlS8
   juGWDbAHKsDExbgFu6a2bMHUDx1BIkf43k5Xmz5BM9bF9KQnZ/CqU1/1I
   0PLPRRvT9IPpAmVerS79/SqeAcyyPyVrIQHR3h24+g2Yu+pqo2KYC106V
   w==;
X-CSE-ConnectionGUID: rHJDB6YnR4ayN23F2ceaAQ==
X-CSE-MsgGUID: +Cop+lxDSySr4d2TZIJ9Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="72039680"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="72039680"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 02:43:17 -0800
X-CSE-ConnectionGUID: mCTxj8+hR5yN2HFKBU2/3w==
X-CSE-MsgGUID: qrZFriUyTkuUDVNXPL2Zdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="237384928"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Dec 2025 02:43:15 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYMKk-000000002wx-0nEc;
	Wed, 24 Dec 2025 10:43:10 +0000
Date: Wed, 24 Dec 2025 18:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1059
 mt7996_tx_prepare_skb() error: we previously assumed 'sta' could be null (see
 line 1044)
Message-ID: <202512241853.oN0rQyHQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Shayne Chen <shayne.chen@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b927546677c876e26eba308550207c2ddf812a43
commit: 85cd5534a3f2ec93e7d88713a77df5b4255520df wifi: mt76: mt7996: use correct link_id when filling TXD and TXP
date:   4 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
config: alpha-randconfig-r072-20251224 (https://download.01.org/0day-ci/archive/20251224/202512241853.oN0rQyHQ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512241853.oN0rQyHQ-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1059 mt7996_tx_prepare_skb() error: we previously assumed 'sta' could be null (see line 1044)
drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1099 mt7996_tx_prepare_skb() error: we previously assumed 'vif' could be null (see line 1043)

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/mac.c:483 mt7996_mac_fill_rx() warn: potential spectre issue 'dev->mt76.phys' [r]
drivers/net/wireless/mediatek/mt76/mt7996/mac.c:484 mt7996_mac_fill_rx() warn: possible spectre second half.  'mphy'
drivers/net/wireless/mediatek/mt76/mt7996/mac.c:3131 mt7996_mac_twt_sched_list_add() error: uninitialized symbol 'start_tsf'.

vim +/sta +1059 drivers/net/wireless/mediatek/mt76/mt7996/mac.c

b7ddeb9cc43949 Shayne Chen      2025-04-09  1032  
98686cd21624c7 Shayne Chen      2022-11-22  1033  int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
98686cd21624c7 Shayne Chen      2022-11-22  1034  			  enum mt76_txq_id qid, struct mt76_wcid *wcid,
98686cd21624c7 Shayne Chen      2022-11-22  1035  			  struct ieee80211_sta *sta,
98686cd21624c7 Shayne Chen      2022-11-22  1036  			  struct mt76_tx_info *tx_info)
98686cd21624c7 Shayne Chen      2022-11-22  1037  {
85cd5534a3f2ec Shayne Chen      2025-11-06  1038  	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)tx_info->skb->data;
98686cd21624c7 Shayne Chen      2022-11-22  1039  	struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
98686cd21624c7 Shayne Chen      2022-11-22  1040  	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(tx_info->skb);
98686cd21624c7 Shayne Chen      2022-11-22  1041  	struct ieee80211_key_conf *key = info->control.hw_key;
98686cd21624c7 Shayne Chen      2022-11-22  1042  	struct ieee80211_vif *vif = info->control.vif;
85cd5534a3f2ec Shayne Chen      2025-11-06 @1043  	struct mt7996_vif *mvif = vif ? (struct mt7996_vif *)vif->drv_priv : NULL;
85cd5534a3f2ec Shayne Chen      2025-11-06 @1044  	struct mt7996_sta *msta = sta ? (struct mt7996_sta *)sta->drv_priv : NULL;
85cd5534a3f2ec Shayne Chen      2025-11-06  1045  	struct mt76_vif_link *mlink = NULL;
98686cd21624c7 Shayne Chen      2022-11-22  1046  	struct mt76_txwi_cache *t;
98686cd21624c7 Shayne Chen      2022-11-22  1047  	int id, i, pid, nbuf = tx_info->nbuf - 1;
98686cd21624c7 Shayne Chen      2022-11-22  1048  	bool is_8023 = info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP;
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1049  	__le32 *ptr = (__le32 *)txwi_ptr;
98686cd21624c7 Shayne Chen      2022-11-22  1050  	u8 *txwi = (u8 *)txwi_ptr;
85cd5534a3f2ec Shayne Chen      2025-11-06  1051  	u8 link_id;
98686cd21624c7 Shayne Chen      2022-11-22  1052  
98686cd21624c7 Shayne Chen      2022-11-22  1053  	if (unlikely(tx_info->skb->len <= ETH_HLEN))
98686cd21624c7 Shayne Chen      2022-11-22  1054  		return -EINVAL;
98686cd21624c7 Shayne Chen      2022-11-22  1055  
98686cd21624c7 Shayne Chen      2022-11-22  1056  	if (!wcid)
98686cd21624c7 Shayne Chen      2022-11-22  1057  		wcid = &dev->mt76.global_wcid;
98686cd21624c7 Shayne Chen      2022-11-22  1058  
85cd5534a3f2ec Shayne Chen      2025-11-06 @1059  	if ((is_8023 || ieee80211_is_data_qos(hdr->frame_control)) && sta->mlo &&
85cd5534a3f2ec Shayne Chen      2025-11-06  1060  	    likely(tx_info->skb->protocol != cpu_to_be16(ETH_P_PAE))) {
85cd5534a3f2ec Shayne Chen      2025-11-06  1061  		u8 tid = tx_info->skb->priority & IEEE80211_QOS_CTL_TID_MASK;
85cd5534a3f2ec Shayne Chen      2025-11-06  1062  
85cd5534a3f2ec Shayne Chen      2025-11-06  1063  		link_id = (tid % 2) ? msta->seclink_id : msta->deflink_id;
85cd5534a3f2ec Shayne Chen      2025-11-06  1064  	} else {
85cd5534a3f2ec Shayne Chen      2025-11-06  1065  		link_id = u32_get_bits(info->control.flags,
85cd5534a3f2ec Shayne Chen      2025-11-06  1066  				       IEEE80211_TX_CTRL_MLO_LINK);
85cd5534a3f2ec Shayne Chen      2025-11-06  1067  	}
85cd5534a3f2ec Shayne Chen      2025-11-06  1068  
85cd5534a3f2ec Shayne Chen      2025-11-06  1069  	if (link_id != wcid->link_id && link_id != IEEE80211_LINK_UNSPECIFIED) {
85cd5534a3f2ec Shayne Chen      2025-11-06  1070  		if (msta) {
85cd5534a3f2ec Shayne Chen      2025-11-06  1071  			struct mt7996_sta_link *msta_link =
85cd5534a3f2ec Shayne Chen      2025-11-06  1072  				rcu_dereference(msta->link[link_id]);
85cd5534a3f2ec Shayne Chen      2025-11-06  1073  
85cd5534a3f2ec Shayne Chen      2025-11-06  1074  			if (msta_link)
85cd5534a3f2ec Shayne Chen      2025-11-06  1075  				wcid = &msta_link->wcid;
85cd5534a3f2ec Shayne Chen      2025-11-06  1076  		} else if (mvif) {
85cd5534a3f2ec Shayne Chen      2025-11-06  1077  			mlink = rcu_dereference(mvif->mt76.link[link_id]);
85cd5534a3f2ec Shayne Chen      2025-11-06  1078  			if (mlink && mlink->wcid)
85cd5534a3f2ec Shayne Chen      2025-11-06  1079  				wcid = mlink->wcid;
85cd5534a3f2ec Shayne Chen      2025-11-06  1080  		}
85cd5534a3f2ec Shayne Chen      2025-11-06  1081  	}
85cd5534a3f2ec Shayne Chen      2025-11-06  1082  
98686cd21624c7 Shayne Chen      2022-11-22  1083  	t = (struct mt76_txwi_cache *)(txwi + mdev->drv->txwi_size);
98686cd21624c7 Shayne Chen      2022-11-22  1084  	t->skb = tx_info->skb;
98686cd21624c7 Shayne Chen      2022-11-22  1085  
98686cd21624c7 Shayne Chen      2022-11-22  1086  	id = mt76_token_consume(mdev, &t);
98686cd21624c7 Shayne Chen      2022-11-22  1087  	if (id < 0)
98686cd21624c7 Shayne Chen      2022-11-22  1088  		return id;
98686cd21624c7 Shayne Chen      2022-11-22  1089  
7ef0c7ad735b0c Shayne Chen      2025-09-04  1090  	/* Since the rules of HW MLD address translation are not fully
7ef0c7ad735b0c Shayne Chen      2025-09-04  1091  	 * compatible with 802.11 EAPOL frame, we do the translation by
7ef0c7ad735b0c Shayne Chen      2025-09-04  1092  	 * software
7ef0c7ad735b0c Shayne Chen      2025-09-04  1093  	 */
7ef0c7ad735b0c Shayne Chen      2025-09-04  1094  	if (tx_info->skb->protocol == cpu_to_be16(ETH_P_PAE) && sta->mlo) {
7ef0c7ad735b0c Shayne Chen      2025-09-04  1095  		struct ieee80211_hdr *hdr = (void *)tx_info->skb->data;
7ef0c7ad735b0c Shayne Chen      2025-09-04  1096  		struct ieee80211_bss_conf *link_conf;
7ef0c7ad735b0c Shayne Chen      2025-09-04  1097  		struct ieee80211_link_sta *link_sta;
7ef0c7ad735b0c Shayne Chen      2025-09-04  1098  
7ef0c7ad735b0c Shayne Chen      2025-09-04 @1099  		link_conf = rcu_dereference(vif->link_conf[wcid->link_id]);
7ef0c7ad735b0c Shayne Chen      2025-09-04  1100  		if (!link_conf)
7ef0c7ad735b0c Shayne Chen      2025-09-04  1101  			return -EINVAL;
7ef0c7ad735b0c Shayne Chen      2025-09-04  1102  
7ef0c7ad735b0c Shayne Chen      2025-09-04  1103  		link_sta = rcu_dereference(sta->link[wcid->link_id]);
7ef0c7ad735b0c Shayne Chen      2025-09-04  1104  		if (!link_sta)
7ef0c7ad735b0c Shayne Chen      2025-09-04  1105  			return -EINVAL;
7ef0c7ad735b0c Shayne Chen      2025-09-04  1106  
7ef0c7ad735b0c Shayne Chen      2025-09-04  1107  		dma_sync_single_for_cpu(mdev->dma_dev, tx_info->buf[1].addr,
7ef0c7ad735b0c Shayne Chen      2025-09-04  1108  					tx_info->buf[1].len, DMA_TO_DEVICE);
7ef0c7ad735b0c Shayne Chen      2025-09-04  1109  
7ef0c7ad735b0c Shayne Chen      2025-09-04  1110  		memcpy(hdr->addr1, link_sta->addr, ETH_ALEN);
7ef0c7ad735b0c Shayne Chen      2025-09-04  1111  		memcpy(hdr->addr2, link_conf->addr, ETH_ALEN);
7ef0c7ad735b0c Shayne Chen      2025-09-04  1112  		if (ieee80211_has_a4(hdr->frame_control)) {
7ef0c7ad735b0c Shayne Chen      2025-09-04  1113  			memcpy(hdr->addr3, sta->addr, ETH_ALEN);
7ef0c7ad735b0c Shayne Chen      2025-09-04  1114  			memcpy(hdr->addr4, vif->addr, ETH_ALEN);
7ef0c7ad735b0c Shayne Chen      2025-09-04  1115  		} else if (ieee80211_has_tods(hdr->frame_control)) {
7ef0c7ad735b0c Shayne Chen      2025-09-04  1116  			memcpy(hdr->addr3, sta->addr, ETH_ALEN);
7ef0c7ad735b0c Shayne Chen      2025-09-04  1117  		} else if (ieee80211_has_fromds(hdr->frame_control)) {
7ef0c7ad735b0c Shayne Chen      2025-09-04  1118  			memcpy(hdr->addr3, vif->addr, ETH_ALEN);
7ef0c7ad735b0c Shayne Chen      2025-09-04  1119  		}
7ef0c7ad735b0c Shayne Chen      2025-09-04  1120  
7ef0c7ad735b0c Shayne Chen      2025-09-04  1121  		dma_sync_single_for_device(mdev->dma_dev, tx_info->buf[1].addr,
7ef0c7ad735b0c Shayne Chen      2025-09-04  1122  					   tx_info->buf[1].len, DMA_TO_DEVICE);
7ef0c7ad735b0c Shayne Chen      2025-09-04  1123  	}
7ef0c7ad735b0c Shayne Chen      2025-09-04  1124  
98686cd21624c7 Shayne Chen      2022-11-22  1125  	pid = mt76_tx_status_skb_add(mdev, wcid, tx_info->skb);
3dbfb8abe3fd3f Shayne Chen      2025-03-28  1126  	memset(txwi_ptr, 0, MT_TXD_SIZE);
3dbfb8abe3fd3f Shayne Chen      2025-03-28  1127  	/* Transmit non qos data by 802.11 header and need to fill txd by host*/
3dbfb8abe3fd3f Shayne Chen      2025-03-28  1128  	if (!is_8023 || pid >= MT_PACKET_ID_FIRST)
d0b6f86fdbefa6 Shayne Chen      2023-03-03  1129  		mt7996_mac_write_txwi(dev, txwi_ptr, tx_info->skb, wcid, key,
d0b6f86fdbefa6 Shayne Chen      2023-03-03  1130  				      pid, qid, 0);
98686cd21624c7 Shayne Chen      2022-11-22  1131  
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1132  	/* MT7996 and MT7992 require driver to provide the MAC TXP for AddBA
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1133  	 * req
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1134  	 */
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1135  	if (le32_to_cpu(ptr[7]) & MT_TXD7_MAC_TXD) {
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1136  		u32 val;
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1137  
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1138  		ptr = (__le32 *)(txwi + MT_TXD_SIZE);
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1139  		memset((void *)ptr, 0, sizeof(struct mt76_connac_fw_txp));
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1140  
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1141  		val = FIELD_PREP(MT_TXP0_TOKEN_ID0, id) |
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1142  		      MT_TXP0_TOKEN_ID0_VALID_MASK;
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1143  		ptr[0] = cpu_to_le32(val);
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1144  
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1145  		val = FIELD_PREP(MT_TXP1_TID_ADDBA,
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1146  				 tx_info->skb->priority &
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1147  				 IEEE80211_QOS_CTL_TID_MASK);
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1148  		ptr[1] = cpu_to_le32(val);
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1149  		ptr[2] = cpu_to_le32(tx_info->buf[1].addr & 0xFFFFFFFF);
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1150  
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1151  		val = FIELD_PREP(MT_TXP_BUF_LEN, tx_info->buf[1].len) |
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1152  		      MT_TXP3_ML0_MASK;
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1153  #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1154  		val |= FIELD_PREP(MT_TXP3_DMA_ADDR_H,
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1155  				  tx_info->buf[1].addr >> 32);
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1156  #endif
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1157  		ptr[3] = cpu_to_le32(val);
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1158  	} else {
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1159  		struct mt76_connac_txp_common *txp;
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1160  
3c38dfc1702d81 Lorenzo Bianconi 2023-01-18  1161  		txp = (struct mt76_connac_txp_common *)(txwi + MT_TXD_SIZE);
98686cd21624c7 Shayne Chen      2022-11-22  1162  		for (i = 0; i < nbuf; i++) {
4920a3a1285f5f Sujuan Chen      2023-11-17  1163  			u16 len;
4920a3a1285f5f Sujuan Chen      2023-11-17  1164  
4920a3a1285f5f Sujuan Chen      2023-11-17  1165  			len = FIELD_PREP(MT_TXP_BUF_LEN, tx_info->buf[i + 1].len);
4920a3a1285f5f Sujuan Chen      2023-11-17  1166  #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
4920a3a1285f5f Sujuan Chen      2023-11-17  1167  			len |= FIELD_PREP(MT_TXP_DMA_ADDR_H,
4920a3a1285f5f Sujuan Chen      2023-11-17  1168  					  tx_info->buf[i + 1].addr >> 32);
4920a3a1285f5f Sujuan Chen      2023-11-17  1169  #endif
4920a3a1285f5f Sujuan Chen      2023-11-17  1170  
3c38dfc1702d81 Lorenzo Bianconi 2023-01-18  1171  			txp->fw.buf[i] = cpu_to_le32(tx_info->buf[i + 1].addr);
4920a3a1285f5f Sujuan Chen      2023-11-17  1172  			txp->fw.len[i] = cpu_to_le16(len);
98686cd21624c7 Shayne Chen      2022-11-22  1173  		}
3c38dfc1702d81 Lorenzo Bianconi 2023-01-18  1174  		txp->fw.nbuf = nbuf;
98686cd21624c7 Shayne Chen      2022-11-22  1175  
3dbfb8abe3fd3f Shayne Chen      2025-03-28  1176  		txp->fw.flags = cpu_to_le16(MT_CT_INFO_FROM_HOST);
3dbfb8abe3fd3f Shayne Chen      2025-03-28  1177  
3dbfb8abe3fd3f Shayne Chen      2025-03-28  1178  		if (!is_8023 || pid >= MT_PACKET_ID_FIRST)
3dbfb8abe3fd3f Shayne Chen      2025-03-28  1179  			txp->fw.flags |= cpu_to_le16(MT_CT_INFO_APPLY_TXD);
98686cd21624c7 Shayne Chen      2022-11-22  1180  
98686cd21624c7 Shayne Chen      2022-11-22  1181  		if (!key)
3c38dfc1702d81 Lorenzo Bianconi 2023-01-18  1182  			txp->fw.flags |= cpu_to_le16(MT_CT_INFO_NONE_CIPHER_FRAME);
98686cd21624c7 Shayne Chen      2022-11-22  1183  
b7ddeb9cc43949 Shayne Chen      2025-04-09  1184  		if (!is_8023 && mt7996_tx_use_mgmt(dev, tx_info->skb))
3c38dfc1702d81 Lorenzo Bianconi 2023-01-18  1185  			txp->fw.flags |= cpu_to_le16(MT_CT_INFO_MGMT_FRAME);
98686cd21624c7 Shayne Chen      2022-11-22  1186  
85cd5534a3f2ec Shayne Chen      2025-11-06  1187  		if (mvif) {
13b4c81083cc4b Felix Fietkau    2025-03-11  1188  			if (wcid->offchannel)
13b4c81083cc4b Felix Fietkau    2025-03-11  1189  				mlink = rcu_dereference(mvif->mt76.offchannel_link);
13b4c81083cc4b Felix Fietkau    2025-03-11  1190  			if (!mlink)
59ea7af6f9ce21 Lorenzo Bianconi 2025-07-04  1191  				mlink = rcu_dereference(mvif->mt76.link[wcid->link_id]);
98686cd21624c7 Shayne Chen      2022-11-22  1192  
59ea7af6f9ce21 Lorenzo Bianconi 2025-07-04  1193  			txp->fw.bss_idx = mlink ? mlink->idx : mvif->deflink.mt76.idx;
98686cd21624c7 Shayne Chen      2022-11-22  1194  		}
98686cd21624c7 Shayne Chen      2022-11-22  1195  
3c38dfc1702d81 Lorenzo Bianconi 2023-01-18  1196  		txp->fw.token = cpu_to_le16(id);
bde2e77f76266f Peter Chiu       2023-08-17  1197  		txp->fw.rept_wds_wcid = cpu_to_le16(sta ? wcid->idx : 0xfff);
cb6ebbdffef2a8 Howard Hsu       2025-09-09  1198  	}
bde2e77f76266f Peter Chiu       2023-08-17  1199  
832f42699791e7 Felix Fietkau    2023-09-11  1200  	tx_info->skb = NULL;
98686cd21624c7 Shayne Chen      2022-11-22  1201  
98686cd21624c7 Shayne Chen      2022-11-22  1202  	/* pass partial skb header to fw */
98686cd21624c7 Shayne Chen      2022-11-22  1203  	tx_info->buf[1].len = MT_CT_PARSE_LEN;
98686cd21624c7 Shayne Chen      2022-11-22  1204  	tx_info->buf[1].skip_unmap = true;
98686cd21624c7 Shayne Chen      2022-11-22  1205  	tx_info->nbuf = MT_CT_DMA_BUF_NUM;
98686cd21624c7 Shayne Chen      2022-11-22  1206  
98686cd21624c7 Shayne Chen      2022-11-22  1207  	return 0;
98686cd21624c7 Shayne Chen      2022-11-22  1208  }
98686cd21624c7 Shayne Chen      2022-11-22  1209  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
