Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDA2306B3D
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Aug 2026 07:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786348666; cv=none; b=IfS0NfEPe5ZXG7x31W8ls7vwF/i62QeaRVDYYjXT0TptDgsIuPUYAXQI0WezT8y4OwDpUhcHd3u87xJZscrlWQx1z4EFJ+t3BpMSHSQ31Sm5rHWRgUS0hBVrzvBCNN83LiaNYMpx/96e/R16wqIJdiTwnKplhEB6IpueEFaxD8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786348666; c=relaxed/simple;
	bh=qQS8mDexRnMGkiEwHAsAIuVGLbv46tAQD7cDPZlY6DY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jXaiB0r6HmnuJ0EyU+xic3d/Kv8lBzyRLzJYc7kBwpU5sYF43siUyLHFmRfVLxL8CBO0QJK4+fVTJTRGnU/+CvzrAPvmTs/O2dOrv+Y54rL3naBkO+obHIKrQO8UZbTeHDLU1f9ELphAQqn2/fTVsm0AkR+o8ROerJLhueI4QLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3G2kaM0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3G2kaM0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786348665; x=1817884665;
  h=date:from:to:cc:subject:message-id;
  bh=qQS8mDexRnMGkiEwHAsAIuVGLbv46tAQD7cDPZlY6DY=;
  b=R3G2kaM0GwCFSNnTYB02SuPYWpZ35HiAy+P26JXWATdwypt3ihDeh16l
   ud76I2jjPMLhYfRju2AkaN9Ium5YTG6p09czysFKG2n4qJMnV0mEmFc3+
   en/gfOiOAaDQ60UUR+XUZv4PHspXnrbRtHKqwwtl31vwgs4LflRHGiXdO
   eCVrKvmSF8pOtimSDi+1hJBzCAiJmlO7w4f5JLoKu5ZCYmvmGvlG8NKXl
   HiP3WP3USpEruufOAo2Hg4LDZHOza7i4CUWvvAfQ8TZbwq2nP6eqAlhh8
   bBN2fzb0WKNUe7oHfB/XxXXtmQ4PxxYvQWcTF32svspH2dkvzeesXifF8
   A==;
X-CSE-ConnectionGUID: W0i+rh+iTy+NFuEDAfnDrQ==
X-CSE-MsgGUID: qhFaERFHR4uIgWIXhBE2sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="97453519"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="97453519"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 00:57:44 -0700
X-CSE-ConnectionGUID: EwvNZj7OQGCzr9AYCCmJ1A==
X-CSE-MsgGUID: EEDp58r+QR63QuBdTwZhsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="292891013"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Aug 2026 00:57:42 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtKtA-00000000N0g-1TLd;
	Mon, 10 Aug 2026 07:57:40 +0000
Date: Mon, 10 Aug 2026 15:56:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1059
 mt7996_tx_prepare_skb() error: we previously assumed 'sta' could be null (see
 line 1044)
Message-ID: <202608101558.Q1CI1hTW-lkp@intel.com>
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
head:   06cf61899d6498b33e4b7c87d99d5bd471ccc375
commit: 85cd5534a3f2ec93e7d88713a77df5b4255520df wifi: mt76: mt7996: use correct link_id when filling TXD and TXP
date:   9 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-161-20260810 (https://download.01.org/0day-ci/archive/20260810/202608101558.Q1CI1hTW-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 85cd5534a3f2 ("wifi: mt76: mt7996: use correct link_id when filling TXD and TXP")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608101558.Q1CI1hTW-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1059 mt7996_tx_prepare_skb() error: we previously assumed 'sta' could be null (see line 1044)
drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1099 mt7996_tx_prepare_skb() error: we previously assumed 'vif' could be null (see line 1043)

vim +/sta +1059 drivers/net/wireless/mediatek/mt76/mt7996/mac.c

b7ddeb9cc43949d Shayne Chen      2025-04-09  1032  
98686cd21624c75 Shayne Chen      2022-11-22  1033  int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
98686cd21624c75 Shayne Chen      2022-11-22  1034  			  enum mt76_txq_id qid, struct mt76_wcid *wcid,
98686cd21624c75 Shayne Chen      2022-11-22  1035  			  struct ieee80211_sta *sta,
98686cd21624c75 Shayne Chen      2022-11-22  1036  			  struct mt76_tx_info *tx_info)
98686cd21624c75 Shayne Chen      2022-11-22  1037  {
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1038  	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)tx_info->skb->data;
98686cd21624c75 Shayne Chen      2022-11-22  1039  	struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
98686cd21624c75 Shayne Chen      2022-11-22  1040  	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(tx_info->skb);
98686cd21624c75 Shayne Chen      2022-11-22  1041  	struct ieee80211_key_conf *key = info->control.hw_key;
98686cd21624c75 Shayne Chen      2022-11-22  1042  	struct ieee80211_vif *vif = info->control.vif;
85cd5534a3f2ec9 Shayne Chen      2025-11-06 @1043  	struct mt7996_vif *mvif = vif ? (struct mt7996_vif *)vif->drv_priv : NULL;
85cd5534a3f2ec9 Shayne Chen      2025-11-06 @1044  	struct mt7996_sta *msta = sta ? (struct mt7996_sta *)sta->drv_priv : NULL;
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1045  	struct mt76_vif_link *mlink = NULL;
98686cd21624c75 Shayne Chen      2022-11-22  1046  	struct mt76_txwi_cache *t;
98686cd21624c75 Shayne Chen      2022-11-22  1047  	int id, i, pid, nbuf = tx_info->nbuf - 1;
98686cd21624c75 Shayne Chen      2022-11-22  1048  	bool is_8023 = info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP;
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1049  	__le32 *ptr = (__le32 *)txwi_ptr;
98686cd21624c75 Shayne Chen      2022-11-22  1050  	u8 *txwi = (u8 *)txwi_ptr;
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1051  	u8 link_id;
98686cd21624c75 Shayne Chen      2022-11-22  1052  
98686cd21624c75 Shayne Chen      2022-11-22  1053  	if (unlikely(tx_info->skb->len <= ETH_HLEN))
98686cd21624c75 Shayne Chen      2022-11-22  1054  		return -EINVAL;
98686cd21624c75 Shayne Chen      2022-11-22  1055  
98686cd21624c75 Shayne Chen      2022-11-22  1056  	if (!wcid)
98686cd21624c75 Shayne Chen      2022-11-22  1057  		wcid = &dev->mt76.global_wcid;
98686cd21624c75 Shayne Chen      2022-11-22  1058  
85cd5534a3f2ec9 Shayne Chen      2025-11-06 @1059  	if ((is_8023 || ieee80211_is_data_qos(hdr->frame_control)) && sta->mlo &&
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1060  	    likely(tx_info->skb->protocol != cpu_to_be16(ETH_P_PAE))) {
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1061  		u8 tid = tx_info->skb->priority & IEEE80211_QOS_CTL_TID_MASK;
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1062  
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1063  		link_id = (tid % 2) ? msta->seclink_id : msta->deflink_id;
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1064  	} else {
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1065  		link_id = u32_get_bits(info->control.flags,
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1066  				       IEEE80211_TX_CTRL_MLO_LINK);
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1067  	}
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1068  
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1069  	if (link_id != wcid->link_id && link_id != IEEE80211_LINK_UNSPECIFIED) {
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1070  		if (msta) {
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1071  			struct mt7996_sta_link *msta_link =
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1072  				rcu_dereference(msta->link[link_id]);
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1073  
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1074  			if (msta_link)
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1075  				wcid = &msta_link->wcid;
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1076  		} else if (mvif) {
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1077  			mlink = rcu_dereference(mvif->mt76.link[link_id]);
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1078  			if (mlink && mlink->wcid)
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1079  				wcid = mlink->wcid;
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1080  		}
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1081  	}
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1082  
98686cd21624c75 Shayne Chen      2022-11-22  1083  	t = (struct mt76_txwi_cache *)(txwi + mdev->drv->txwi_size);
98686cd21624c75 Shayne Chen      2022-11-22  1084  	t->skb = tx_info->skb;
98686cd21624c75 Shayne Chen      2022-11-22  1085  
98686cd21624c75 Shayne Chen      2022-11-22  1086  	id = mt76_token_consume(mdev, &t);
98686cd21624c75 Shayne Chen      2022-11-22  1087  	if (id < 0)
98686cd21624c75 Shayne Chen      2022-11-22  1088  		return id;
98686cd21624c75 Shayne Chen      2022-11-22  1089  
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1090  	/* Since the rules of HW MLD address translation are not fully
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1091  	 * compatible with 802.11 EAPOL frame, we do the translation by
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1092  	 * software
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1093  	 */
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1094  	if (tx_info->skb->protocol == cpu_to_be16(ETH_P_PAE) && sta->mlo) {
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1095  		struct ieee80211_hdr *hdr = (void *)tx_info->skb->data;
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1096  		struct ieee80211_bss_conf *link_conf;
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1097  		struct ieee80211_link_sta *link_sta;
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1098  
7ef0c7ad735b0c3 Shayne Chen      2025-09-04 @1099  		link_conf = rcu_dereference(vif->link_conf[wcid->link_id]);
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1100  		if (!link_conf)
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1101  			return -EINVAL;
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1102  
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1103  		link_sta = rcu_dereference(sta->link[wcid->link_id]);
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1104  		if (!link_sta)
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1105  			return -EINVAL;
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1106  
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1107  		dma_sync_single_for_cpu(mdev->dma_dev, tx_info->buf[1].addr,
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1108  					tx_info->buf[1].len, DMA_TO_DEVICE);
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1109  
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1110  		memcpy(hdr->addr1, link_sta->addr, ETH_ALEN);
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1111  		memcpy(hdr->addr2, link_conf->addr, ETH_ALEN);
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1112  		if (ieee80211_has_a4(hdr->frame_control)) {
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1113  			memcpy(hdr->addr3, sta->addr, ETH_ALEN);
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1114  			memcpy(hdr->addr4, vif->addr, ETH_ALEN);
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1115  		} else if (ieee80211_has_tods(hdr->frame_control)) {
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1116  			memcpy(hdr->addr3, sta->addr, ETH_ALEN);
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1117  		} else if (ieee80211_has_fromds(hdr->frame_control)) {
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1118  			memcpy(hdr->addr3, vif->addr, ETH_ALEN);
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1119  		}
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1120  
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1121  		dma_sync_single_for_device(mdev->dma_dev, tx_info->buf[1].addr,
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1122  					   tx_info->buf[1].len, DMA_TO_DEVICE);
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1123  	}
7ef0c7ad735b0c3 Shayne Chen      2025-09-04  1124  
98686cd21624c75 Shayne Chen      2022-11-22  1125  	pid = mt76_tx_status_skb_add(mdev, wcid, tx_info->skb);
3dbfb8abe3fd3ff Shayne Chen      2025-03-28  1126  	memset(txwi_ptr, 0, MT_TXD_SIZE);
3dbfb8abe3fd3ff Shayne Chen      2025-03-28  1127  	/* Transmit non qos data by 802.11 header and need to fill txd by host*/
3dbfb8abe3fd3ff Shayne Chen      2025-03-28  1128  	if (!is_8023 || pid >= MT_PACKET_ID_FIRST)
d0b6f86fdbefa62 Shayne Chen      2023-03-03  1129  		mt7996_mac_write_txwi(dev, txwi_ptr, tx_info->skb, wcid, key,
d0b6f86fdbefa62 Shayne Chen      2023-03-03  1130  				      pid, qid, 0);
98686cd21624c75 Shayne Chen      2022-11-22  1131  
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1132  	/* MT7996 and MT7992 require driver to provide the MAC TXP for AddBA
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1133  	 * req
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1134  	 */
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1135  	if (le32_to_cpu(ptr[7]) & MT_TXD7_MAC_TXD) {
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1136  		u32 val;
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1137  
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1138  		ptr = (__le32 *)(txwi + MT_TXD_SIZE);
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1139  		memset((void *)ptr, 0, sizeof(struct mt76_connac_fw_txp));
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1140  
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1141  		val = FIELD_PREP(MT_TXP0_TOKEN_ID0, id) |
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1142  		      MT_TXP0_TOKEN_ID0_VALID_MASK;
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1143  		ptr[0] = cpu_to_le32(val);
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1144  
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1145  		val = FIELD_PREP(MT_TXP1_TID_ADDBA,
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1146  				 tx_info->skb->priority &
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1147  				 IEEE80211_QOS_CTL_TID_MASK);
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1148  		ptr[1] = cpu_to_le32(val);
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1149  		ptr[2] = cpu_to_le32(tx_info->buf[1].addr & 0xFFFFFFFF);
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1150  
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1151  		val = FIELD_PREP(MT_TXP_BUF_LEN, tx_info->buf[1].len) |
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1152  		      MT_TXP3_ML0_MASK;
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1153  #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1154  		val |= FIELD_PREP(MT_TXP3_DMA_ADDR_H,
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1155  				  tx_info->buf[1].addr >> 32);
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1156  #endif
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1157  		ptr[3] = cpu_to_le32(val);
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1158  	} else {
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1159  		struct mt76_connac_txp_common *txp;
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1160  
3c38dfc1702d812 Lorenzo Bianconi 2023-01-18  1161  		txp = (struct mt76_connac_txp_common *)(txwi + MT_TXD_SIZE);
98686cd21624c75 Shayne Chen      2022-11-22  1162  		for (i = 0; i < nbuf; i++) {
4920a3a1285f5fd Sujuan Chen      2023-11-17  1163  			u16 len;
4920a3a1285f5fd Sujuan Chen      2023-11-17  1164  
4920a3a1285f5fd Sujuan Chen      2023-11-17  1165  			len = FIELD_PREP(MT_TXP_BUF_LEN, tx_info->buf[i + 1].len);
4920a3a1285f5fd Sujuan Chen      2023-11-17  1166  #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
4920a3a1285f5fd Sujuan Chen      2023-11-17  1167  			len |= FIELD_PREP(MT_TXP_DMA_ADDR_H,
4920a3a1285f5fd Sujuan Chen      2023-11-17  1168  					  tx_info->buf[i + 1].addr >> 32);
4920a3a1285f5fd Sujuan Chen      2023-11-17  1169  #endif
4920a3a1285f5fd Sujuan Chen      2023-11-17  1170  
3c38dfc1702d812 Lorenzo Bianconi 2023-01-18  1171  			txp->fw.buf[i] = cpu_to_le32(tx_info->buf[i + 1].addr);
4920a3a1285f5fd Sujuan Chen      2023-11-17  1172  			txp->fw.len[i] = cpu_to_le16(len);
98686cd21624c75 Shayne Chen      2022-11-22  1173  		}
3c38dfc1702d812 Lorenzo Bianconi 2023-01-18  1174  		txp->fw.nbuf = nbuf;
98686cd21624c75 Shayne Chen      2022-11-22  1175  
3dbfb8abe3fd3ff Shayne Chen      2025-03-28  1176  		txp->fw.flags = cpu_to_le16(MT_CT_INFO_FROM_HOST);
3dbfb8abe3fd3ff Shayne Chen      2025-03-28  1177  
3dbfb8abe3fd3ff Shayne Chen      2025-03-28  1178  		if (!is_8023 || pid >= MT_PACKET_ID_FIRST)
3dbfb8abe3fd3ff Shayne Chen      2025-03-28  1179  			txp->fw.flags |= cpu_to_le16(MT_CT_INFO_APPLY_TXD);
98686cd21624c75 Shayne Chen      2022-11-22  1180  
98686cd21624c75 Shayne Chen      2022-11-22  1181  		if (!key)
3c38dfc1702d812 Lorenzo Bianconi 2023-01-18  1182  			txp->fw.flags |= cpu_to_le16(MT_CT_INFO_NONE_CIPHER_FRAME);
98686cd21624c75 Shayne Chen      2022-11-22  1183  
b7ddeb9cc43949d Shayne Chen      2025-04-09  1184  		if (!is_8023 && mt7996_tx_use_mgmt(dev, tx_info->skb))
3c38dfc1702d812 Lorenzo Bianconi 2023-01-18  1185  			txp->fw.flags |= cpu_to_le16(MT_CT_INFO_MGMT_FRAME);
98686cd21624c75 Shayne Chen      2022-11-22  1186  
85cd5534a3f2ec9 Shayne Chen      2025-11-06  1187  		if (mvif) {
13b4c81083cc4b5 Felix Fietkau    2025-03-11  1188  			if (wcid->offchannel)
13b4c81083cc4b5 Felix Fietkau    2025-03-11  1189  				mlink = rcu_dereference(mvif->mt76.offchannel_link);
13b4c81083cc4b5 Felix Fietkau    2025-03-11  1190  			if (!mlink)
59ea7af6f9ce218 Lorenzo Bianconi 2025-07-04  1191  				mlink = rcu_dereference(mvif->mt76.link[wcid->link_id]);
98686cd21624c75 Shayne Chen      2022-11-22  1192  
59ea7af6f9ce218 Lorenzo Bianconi 2025-07-04  1193  			txp->fw.bss_idx = mlink ? mlink->idx : mvif->deflink.mt76.idx;
98686cd21624c75 Shayne Chen      2022-11-22  1194  		}
98686cd21624c75 Shayne Chen      2022-11-22  1195  
3c38dfc1702d812 Lorenzo Bianconi 2023-01-18  1196  		txp->fw.token = cpu_to_le16(id);
bde2e77f76266fb Peter Chiu       2023-08-17  1197  		txp->fw.rept_wds_wcid = cpu_to_le16(sta ? wcid->idx : 0xfff);
cb6ebbdffef2a88 Howard Hsu       2025-09-09  1198  	}
bde2e77f76266fb Peter Chiu       2023-08-17  1199  
832f42699791e7a Felix Fietkau    2023-09-11  1200  	tx_info->skb = NULL;
98686cd21624c75 Shayne Chen      2022-11-22  1201  
98686cd21624c75 Shayne Chen      2022-11-22  1202  	/* pass partial skb header to fw */
98686cd21624c75 Shayne Chen      2022-11-22  1203  	tx_info->buf[1].len = MT_CT_PARSE_LEN;
98686cd21624c75 Shayne Chen      2022-11-22  1204  	tx_info->buf[1].skip_unmap = true;
98686cd21624c75 Shayne Chen      2022-11-22  1205  	tx_info->nbuf = MT_CT_DMA_BUF_NUM;
98686cd21624c75 Shayne Chen      2022-11-22  1206  
98686cd21624c75 Shayne Chen      2022-11-22  1207  	return 0;
98686cd21624c75 Shayne Chen      2022-11-22  1208  }
98686cd21624c75 Shayne Chen      2022-11-22  1209  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
