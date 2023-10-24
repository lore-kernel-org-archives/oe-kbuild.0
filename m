Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ABB1173A
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Oct 2023 20:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FfqpyKXR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698180510; x=1729716510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/zEANH8hKdwU9rhIF0z8R90ldBtCCFZAzDGa/zylGCM=;
  b=FfqpyKXRviZ2sPbeZPD/UVlDGRhl/moqMxhsiLFqi+Mmocmq6J28eriw
   SCZsf6HNSBG0JXViRziWiW0vN297C7coNwvH8hFl3OBYn+SYv2Xs4hrM2
   ousupN30kePGcsrDr6GM6UjamoyRu58pTM8edKB3whbekFk2diSc/c0Qs
   XEyicP9fiGCqtnLckxWfccpEnReKInbRuVlxXxpZQvPXfqzBpSb4icUGD
   UsJ4zB1Z84CnWjo7Lh5luzDB3lKO/u8Grl7rsMQVaHlnsaMtfG0gXwISV
   PqLS/2ddv0n60RgWQXnuuIuPEDD2jjz5lkQWHyHakEgWkL+V16t8i0O5T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="366507906"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="366507906"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 13:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="902329562"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="902329562"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Oct 2023 13:46:04 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvOK7-0008Gz-14;
	Tue, 24 Oct 2023 20:48:23 +0000
Date: Wed, 25 Oct 2023 04:48:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11114/11428]
 drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c:1133:29: sparse: sparse:
 too long token expansion
Message-ID: <202310250442.t4gnr6QB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c:1133:29: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: David Laight <David.Laight@ACULAB.COM>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f017d9a92a735ac1adc8875955621eda6ae1b3e6
commit: b519cf868c9db4d72314c7f0f066dcffe3ecef72 [11114/11428] minmax: allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 14 hours ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-063-20231025 (https://download.01.org/0day-ci/archive/20231025/202310250442.t4gnr6QB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310250442.t4gnr6QB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310250442.t4gnr6QB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c:1133:29: sparse: sparse: too long token expansion
>> drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c:1133:29: sparse: sparse: too long token expansion
>> drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c:1133:29: sparse: sparse: too long token expansion
>> drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c:1133:29: sparse: sparse: too long token expansion

vim +1133 drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c

f1d962369d5687 Ryder Lee 2020-04-25  1047  
e3296759f34752 Ryder Lee 2022-11-24  1048  static ssize_t
e3296759f34752 Ryder Lee 2022-11-24  1049  mt7915_rate_txpower_set(struct file *file, const char __user *user_buf,
e3296759f34752 Ryder Lee 2022-11-24  1050  			size_t count, loff_t *ppos)
e3296759f34752 Ryder Lee 2022-11-24  1051  {
e3296759f34752 Ryder Lee 2022-11-24  1052  	struct mt7915_phy *phy = file->private_data;
e3296759f34752 Ryder Lee 2022-11-24  1053  	struct mt7915_dev *dev = phy->dev;
e3296759f34752 Ryder Lee 2022-11-24  1054  	struct mt76_phy *mphy = phy->mt76;
e3296759f34752 Ryder Lee 2022-11-24  1055  	struct mt7915_mcu_txpower_sku req = {
e3296759f34752 Ryder Lee 2022-11-24  1056  		.format_id = TX_POWER_LIMIT_TABLE,
3eb50cc9053437 Ryder Lee 2022-12-01  1057  		.band_idx = phy->mt76->band_idx,
e3296759f34752 Ryder Lee 2022-11-24  1058  	};
e3296759f34752 Ryder Lee 2022-11-24  1059  	char buf[100];
e3296759f34752 Ryder Lee 2022-11-24  1060  	int i, ret, pwr160 = 0, pwr80 = 0, pwr40 = 0, pwr20 = 0;
e3296759f34752 Ryder Lee 2022-11-24  1061  	enum mac80211_rx_encoding mode;
e3296759f34752 Ryder Lee 2022-11-24  1062  	u32 offs = 0, len = 0;
bd2404d428215e Ryder Lee 2022-11-22  1063  
e3296759f34752 Ryder Lee 2022-11-24  1064  	if (count >= sizeof(buf))
e3296759f34752 Ryder Lee 2022-11-24  1065  		return -EINVAL;
bd2404d428215e Ryder Lee 2022-11-22  1066  
e3296759f34752 Ryder Lee 2022-11-24  1067  	if (copy_from_user(buf, user_buf, count))
e3296759f34752 Ryder Lee 2022-11-24  1068  		return -EFAULT;
e3296759f34752 Ryder Lee 2022-11-24  1069  
e3296759f34752 Ryder Lee 2022-11-24  1070  	if (count && buf[count - 1] == '\n')
e3296759f34752 Ryder Lee 2022-11-24  1071  		buf[count - 1] = '\0';
e3296759f34752 Ryder Lee 2022-11-24  1072  	else
e3296759f34752 Ryder Lee 2022-11-24  1073  		buf[count] = '\0';
e3296759f34752 Ryder Lee 2022-11-24  1074  
e3296759f34752 Ryder Lee 2022-11-24  1075  	if (sscanf(buf, "%u %u %u %u %u",
e3296759f34752 Ryder Lee 2022-11-24  1076  		   &mode, &pwr160, &pwr80, &pwr40, &pwr20) != 5) {
e3296759f34752 Ryder Lee 2022-11-24  1077  		dev_warn(dev->mt76.dev,
e3296759f34752 Ryder Lee 2022-11-24  1078  			 "per bandwidth power limit: Mode BW160 BW80 BW40 BW20");
e3296759f34752 Ryder Lee 2022-11-24  1079  		return -EINVAL;
e3296759f34752 Ryder Lee 2022-11-24  1080  	}
e3296759f34752 Ryder Lee 2022-11-24  1081  
e3296759f34752 Ryder Lee 2022-11-24  1082  	if (mode > RX_ENC_HE)
e3296759f34752 Ryder Lee 2022-11-24  1083  		return -EINVAL;
e3296759f34752 Ryder Lee 2022-11-24  1084  
e3296759f34752 Ryder Lee 2022-11-24  1085  	if (pwr160)
e3296759f34752 Ryder Lee 2022-11-24  1086  		pwr160 = mt7915_get_power_bound(phy, pwr160);
e3296759f34752 Ryder Lee 2022-11-24  1087  	if (pwr80)
e3296759f34752 Ryder Lee 2022-11-24  1088  		pwr80 = mt7915_get_power_bound(phy, pwr80);
e3296759f34752 Ryder Lee 2022-11-24  1089  	if (pwr40)
e3296759f34752 Ryder Lee 2022-11-24  1090  		pwr40 = mt7915_get_power_bound(phy, pwr40);
e3296759f34752 Ryder Lee 2022-11-24  1091  	if (pwr20)
e3296759f34752 Ryder Lee 2022-11-24  1092  		pwr20 = mt7915_get_power_bound(phy, pwr20);
e3296759f34752 Ryder Lee 2022-11-24  1093  
e3296759f34752 Ryder Lee 2022-11-24  1094  	if (pwr160 < 0 || pwr80 < 0 || pwr40 < 0 || pwr20 < 0)
e3296759f34752 Ryder Lee 2022-11-24  1095  		return -EINVAL;
e3296759f34752 Ryder Lee 2022-11-24  1096  
e3296759f34752 Ryder Lee 2022-11-24  1097  	mutex_lock(&dev->mt76.mutex);
e3296759f34752 Ryder Lee 2022-11-24  1098  	ret = mt7915_mcu_get_txpower_sku(phy, req.txpower_sku,
e3296759f34752 Ryder Lee 2022-11-24  1099  					 sizeof(req.txpower_sku));
e3296759f34752 Ryder Lee 2022-11-24  1100  	if (ret)
e3296759f34752 Ryder Lee 2022-11-24  1101  		goto out;
e3296759f34752 Ryder Lee 2022-11-24  1102  
e3296759f34752 Ryder Lee 2022-11-24  1103  	mt7915_txpower_sets(SKU_CCK, pwr20, RX_ENC_LEGACY);
e3296759f34752 Ryder Lee 2022-11-24  1104  	mt7915_txpower_sets(SKU_OFDM, pwr20, RX_ENC_LEGACY);
e3296759f34752 Ryder Lee 2022-11-24  1105  	if (mode == RX_ENC_LEGACY)
e3296759f34752 Ryder Lee 2022-11-24  1106  		goto skip;
e3296759f34752 Ryder Lee 2022-11-24  1107  
e3296759f34752 Ryder Lee 2022-11-24  1108  	mt7915_txpower_sets(SKU_HT_BW20, pwr20, RX_ENC_HT);
e3296759f34752 Ryder Lee 2022-11-24  1109  	mt7915_txpower_sets(SKU_HT_BW40, pwr40, RX_ENC_HT);
e3296759f34752 Ryder Lee 2022-11-24  1110  	if (mode == RX_ENC_HT)
e3296759f34752 Ryder Lee 2022-11-24  1111  		goto skip;
e3296759f34752 Ryder Lee 2022-11-24  1112  
e3296759f34752 Ryder Lee 2022-11-24  1113  	mt7915_txpower_sets(SKU_VHT_BW20, pwr20, RX_ENC_VHT);
e3296759f34752 Ryder Lee 2022-11-24  1114  	mt7915_txpower_sets(SKU_VHT_BW40, pwr40, RX_ENC_VHT);
e3296759f34752 Ryder Lee 2022-11-24  1115  	mt7915_txpower_sets(SKU_VHT_BW80, pwr80, RX_ENC_VHT);
e3296759f34752 Ryder Lee 2022-11-24  1116  	mt7915_txpower_sets(SKU_VHT_BW160, pwr160, RX_ENC_VHT);
e3296759f34752 Ryder Lee 2022-11-24  1117  	if (mode == RX_ENC_VHT)
e3296759f34752 Ryder Lee 2022-11-24  1118  		goto skip;
e3296759f34752 Ryder Lee 2022-11-24  1119  
e3296759f34752 Ryder Lee 2022-11-24  1120  	mt7915_txpower_sets(SKU_HE_RU26, pwr20, RX_ENC_HE + 1);
e3296759f34752 Ryder Lee 2022-11-24  1121  	mt7915_txpower_sets(SKU_HE_RU52, pwr20, RX_ENC_HE + 1);
e3296759f34752 Ryder Lee 2022-11-24  1122  	mt7915_txpower_sets(SKU_HE_RU106, pwr20, RX_ENC_HE + 1);
e3296759f34752 Ryder Lee 2022-11-24  1123  	mt7915_txpower_sets(SKU_HE_RU242, pwr20, RX_ENC_HE);
e3296759f34752 Ryder Lee 2022-11-24  1124  	mt7915_txpower_sets(SKU_HE_RU484, pwr40, RX_ENC_HE);
e3296759f34752 Ryder Lee 2022-11-24  1125  	mt7915_txpower_sets(SKU_HE_RU996, pwr80, RX_ENC_HE);
e3296759f34752 Ryder Lee 2022-11-24  1126  	mt7915_txpower_sets(SKU_HE_RU2x996, pwr160, RX_ENC_HE);
e3296759f34752 Ryder Lee 2022-11-24  1127  skip:
e3296759f34752 Ryder Lee 2022-11-24  1128  	ret = mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(TX_POWER_FEATURE_CTRL),
e3296759f34752 Ryder Lee 2022-11-24  1129  				&req, sizeof(req), true);
e3296759f34752 Ryder Lee 2022-11-24  1130  	if (ret)
e3296759f34752 Ryder Lee 2022-11-24  1131  		goto out;
e3296759f34752 Ryder Lee 2022-11-24  1132  
e3296759f34752 Ryder Lee 2022-11-24 @1133  	mphy->txpower_cur = max(mphy->txpower_cur,
e3296759f34752 Ryder Lee 2022-11-24  1134  				max(pwr160, max(pwr80, max(pwr40, pwr20))));
e3296759f34752 Ryder Lee 2022-11-24  1135  out:
e3296759f34752 Ryder Lee 2022-11-24  1136  	mutex_unlock(&dev->mt76.mutex);
e3296759f34752 Ryder Lee 2022-11-24  1137  
e3296759f34752 Ryder Lee 2022-11-24  1138  	return ret ? ret : count;
f1d962369d5687 Ryder Lee 2020-04-25  1139  }
f1d962369d5687 Ryder Lee 2020-04-25  1140  

:::::: The code at line 1133 was first introduced by commit
:::::: e3296759f34752ea2562678706dbb5bf607af530 wifi: mt76: mt7915: enable per bandwidth power limit support

:::::: TO: Ryder Lee <ryder.lee@mediatek.com>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
