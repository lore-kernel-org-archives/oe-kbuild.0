Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72513529C
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Dec 2023 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOTbfEtk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702293426; x=1733829426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mlWf8unzCygrlCrExyiB2xDJ8k0gk9dsU2PLT1+bAXE=;
  b=AOTbfEtkqt9kHgPNXZXLdoJBI7hPdVEOIgnwVl3XPC/RlouU067xinDB
   kNtNIiNuHRP91YdgRdopWHEzrOMQab2+GeMpewdYOBoJupu661PdtG9/8
   /GlzxZ2AFbORfoA+uvOQ91Y0CQyfQkxJmSN/z1jTB64p8t6SBmaq4TWOC
   BE337p/182bQAlfXxJW39bG7TE69k/iCOnQJLUZkUXY1vPrjDFDB78U6y
   jXy89Xxep/kuwoeHTn7N4tJEg6HRzA2we65pQGBDKLzwCb98/X5fJb3oH
   fJh8v0OlA+9P6KtBRQB7K/zPKKbFFIYOpX6Rrpg8jcSsHDXbjZjWD3vm7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="7981931"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="7981931"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 03:17:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="916800605"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="916800605"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 11 Dec 2023 03:17:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCeHU-000Hyk-15;
	Mon, 11 Dec 2023 11:17:00 +0000
Date: Mon, 11 Dec 2023 19:16:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [nbd168-wireless:mt76 58/62]
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c:946:27: sparse: sparse:
 shift too big (32) for type unsigned int
Message-ID: <202312111933.s5JIwHEo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/wireless/mediatek/mt76/mt7996/mac.c:946:27: sparse: sparse: shift too big (32) for type unsigned int"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sujuan Chen <sujuan.chen@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>
CC: Rex Lu <rex.lu@mediatek.com>
CC: Lorenzo Bianconi <lorenzo@kernel.org>

tree:   https://github.com/nbd168/wireless mt76
head:   0318b308805ea665679297c3f24b243c1b39b292
commit: 6a871112fab64e1ef3e8eb6487cf53167d9f962f [58/62] wifi: mt76: mt7996: set DMA mask to 36 bits for boards with more than 4GB of RAM
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: csky-randconfig-r113-20231211 (https://download.01.org/0day-ci/archive/20231211/202312111933.s5JIwHEo-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312111933.s5JIwHEo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312111933.s5JIwHEo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/mediatek/mt76/mt7996/mac.c:946:27: sparse: sparse: shift too big (32) for type unsigned int

vim +946 drivers/net/wireless/mediatek/mt76/mt7996/mac.c

98686cd21624c75 Shayne Chen      2022-11-22  909  
98686cd21624c75 Shayne Chen      2022-11-22  910  int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
98686cd21624c75 Shayne Chen      2022-11-22  911  			  enum mt76_txq_id qid, struct mt76_wcid *wcid,
98686cd21624c75 Shayne Chen      2022-11-22  912  			  struct ieee80211_sta *sta,
98686cd21624c75 Shayne Chen      2022-11-22  913  			  struct mt76_tx_info *tx_info)
98686cd21624c75 Shayne Chen      2022-11-22  914  {
98686cd21624c75 Shayne Chen      2022-11-22  915  	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)tx_info->skb->data;
98686cd21624c75 Shayne Chen      2022-11-22  916  	struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
98686cd21624c75 Shayne Chen      2022-11-22  917  	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(tx_info->skb);
98686cd21624c75 Shayne Chen      2022-11-22  918  	struct ieee80211_key_conf *key = info->control.hw_key;
98686cd21624c75 Shayne Chen      2022-11-22  919  	struct ieee80211_vif *vif = info->control.vif;
3c38dfc1702d812 Lorenzo Bianconi 2023-01-18  920  	struct mt76_connac_txp_common *txp;
98686cd21624c75 Shayne Chen      2022-11-22  921  	struct mt76_txwi_cache *t;
98686cd21624c75 Shayne Chen      2022-11-22  922  	int id, i, pid, nbuf = tx_info->nbuf - 1;
98686cd21624c75 Shayne Chen      2022-11-22  923  	bool is_8023 = info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP;
98686cd21624c75 Shayne Chen      2022-11-22  924  	u8 *txwi = (u8 *)txwi_ptr;
98686cd21624c75 Shayne Chen      2022-11-22  925  
98686cd21624c75 Shayne Chen      2022-11-22  926  	if (unlikely(tx_info->skb->len <= ETH_HLEN))
98686cd21624c75 Shayne Chen      2022-11-22  927  		return -EINVAL;
98686cd21624c75 Shayne Chen      2022-11-22  928  
98686cd21624c75 Shayne Chen      2022-11-22  929  	if (!wcid)
98686cd21624c75 Shayne Chen      2022-11-22  930  		wcid = &dev->mt76.global_wcid;
98686cd21624c75 Shayne Chen      2022-11-22  931  
98686cd21624c75 Shayne Chen      2022-11-22  932  	t = (struct mt76_txwi_cache *)(txwi + mdev->drv->txwi_size);
98686cd21624c75 Shayne Chen      2022-11-22  933  	t->skb = tx_info->skb;
98686cd21624c75 Shayne Chen      2022-11-22  934  
98686cd21624c75 Shayne Chen      2022-11-22  935  	id = mt76_token_consume(mdev, &t);
98686cd21624c75 Shayne Chen      2022-11-22  936  	if (id < 0)
98686cd21624c75 Shayne Chen      2022-11-22  937  		return id;
98686cd21624c75 Shayne Chen      2022-11-22  938  
98686cd21624c75 Shayne Chen      2022-11-22  939  	pid = mt76_tx_status_skb_add(mdev, wcid, tx_info->skb);
d0b6f86fdbefa62 Shayne Chen      2023-03-03  940  	mt7996_mac_write_txwi(dev, txwi_ptr, tx_info->skb, wcid, key,
d0b6f86fdbefa62 Shayne Chen      2023-03-03  941  			      pid, qid, 0);
98686cd21624c75 Shayne Chen      2022-11-22  942  
3c38dfc1702d812 Lorenzo Bianconi 2023-01-18  943  	txp = (struct mt76_connac_txp_common *)(txwi + MT_TXD_SIZE);
98686cd21624c75 Shayne Chen      2022-11-22  944  	for (i = 0; i < nbuf; i++) {
6a871112fab64e1 Sujuan Chen      2023-11-17  945  		u16 len = FIELD_PREP(MT_TXP_BUF_LEN, tx_info->buf[i + 1].len) |
6a871112fab64e1 Sujuan Chen      2023-11-17 @946  			  FIELD_PREP(MT_TXP_DMA_ADDR_H,
6a871112fab64e1 Sujuan Chen      2023-11-17  947  				     tx_info->buf[i + 1].addr >> 32);
6a871112fab64e1 Sujuan Chen      2023-11-17  948  
3c38dfc1702d812 Lorenzo Bianconi 2023-01-18  949  		txp->fw.buf[i] = cpu_to_le32(tx_info->buf[i + 1].addr);
6a871112fab64e1 Sujuan Chen      2023-11-17  950  		txp->fw.len[i] = cpu_to_le16(len);
98686cd21624c75 Shayne Chen      2022-11-22  951  	}
3c38dfc1702d812 Lorenzo Bianconi 2023-01-18  952  	txp->fw.nbuf = nbuf;
98686cd21624c75 Shayne Chen      2022-11-22  953  
3b522cadedfe6e9 Ryder Lee        2023-04-19  954  	txp->fw.flags =
3b522cadedfe6e9 Ryder Lee        2023-04-19  955  		cpu_to_le16(MT_CT_INFO_FROM_HOST | MT_CT_INFO_APPLY_TXD);
98686cd21624c75 Shayne Chen      2022-11-22  956  
98686cd21624c75 Shayne Chen      2022-11-22  957  	if (!key)
3c38dfc1702d812 Lorenzo Bianconi 2023-01-18  958  		txp->fw.flags |= cpu_to_le16(MT_CT_INFO_NONE_CIPHER_FRAME);
98686cd21624c75 Shayne Chen      2022-11-22  959  
98686cd21624c75 Shayne Chen      2022-11-22  960  	if (!is_8023 && ieee80211_is_mgmt(hdr->frame_control))
3c38dfc1702d812 Lorenzo Bianconi 2023-01-18  961  		txp->fw.flags |= cpu_to_le16(MT_CT_INFO_MGMT_FRAME);
98686cd21624c75 Shayne Chen      2022-11-22  962  
98686cd21624c75 Shayne Chen      2022-11-22  963  	if (vif) {
98686cd21624c75 Shayne Chen      2022-11-22  964  		struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
98686cd21624c75 Shayne Chen      2022-11-22  965  
3c38dfc1702d812 Lorenzo Bianconi 2023-01-18  966  		txp->fw.bss_idx = mvif->mt76.idx;
98686cd21624c75 Shayne Chen      2022-11-22  967  	}
98686cd21624c75 Shayne Chen      2022-11-22  968  
3c38dfc1702d812 Lorenzo Bianconi 2023-01-18  969  	txp->fw.token = cpu_to_le16(id);
bde2e77f76266fb Peter Chiu       2023-08-17  970  	txp->fw.rept_wds_wcid = cpu_to_le16(sta ? wcid->idx : 0xfff);
bde2e77f76266fb Peter Chiu       2023-08-17  971  
832f42699791e7a Felix Fietkau    2023-09-11  972  	tx_info->skb = NULL;
98686cd21624c75 Shayne Chen      2022-11-22  973  
98686cd21624c75 Shayne Chen      2022-11-22  974  	/* pass partial skb header to fw */
98686cd21624c75 Shayne Chen      2022-11-22  975  	tx_info->buf[1].len = MT_CT_PARSE_LEN;
98686cd21624c75 Shayne Chen      2022-11-22  976  	tx_info->buf[1].skip_unmap = true;
98686cd21624c75 Shayne Chen      2022-11-22  977  	tx_info->nbuf = MT_CT_DMA_BUF_NUM;
98686cd21624c75 Shayne Chen      2022-11-22  978  
98686cd21624c75 Shayne Chen      2022-11-22  979  	return 0;
98686cd21624c75 Shayne Chen      2022-11-22  980  }
98686cd21624c75 Shayne Chen      2022-11-22  981  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
