Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B7179C8
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Nov 2024 12:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730724676; cv=none; b=T70MwGQU6s9/P30a7FzRVILogHn4CVLqK09JE3QURmMZZORztcl4KUKApY5FXqUtFvitYRsjuDvaAMrW8BXc2Y7NHVmuhdp7JcJifTZON/3NZdNorVGqXFUfOs48J1xSuU2sY817qtO95EsFnH3b3JMFfHhha/wxhL97E56YrPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730724676; c=relaxed/simple;
	bh=1EYt31HyxE3Vs8NftsX4jOQBAEEcjddKxxqoqFgkoCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YoL11nvKCWgeql08begpT02nRvZOaYOXDDl+pK/qIHBX0nhPjSxZB3g1tjkLlZZvTKYcWxcvKYYqqkCuCyZV0tDo0ekFbDWZTUEkiwMQDg8OoDYZt2MTAwwJ1X1SUbn/15kwfAqqJ3b9P5Q/iD1Mc2K7nrw5P8u+Zb7naYZuPF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ap8RDmDZ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ap8RDmDZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730724675; x=1762260675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1EYt31HyxE3Vs8NftsX4jOQBAEEcjddKxxqoqFgkoCM=;
  b=ap8RDmDZORJnCYLRu4IIDwytbmxSrSSQzSugOffOOLK8DWX88WyKBb5P
   A5VJtdyzCmvzgqIJd4XRFcLxKBSYyRqFT0S0Zc4BYsCanD38z9lHUwKDq
   aMEa29/NFIh5PiyJYHu57xELtGBbo52M4U+q3XcAATBpXsvil41F8PQ0H
   wpx7hfAvlzCeQOdWHWa21neRbfBNiVmokeMfRKu85pZdP9Ev1wpPqgm/H
   BTRRaAxHjsw1XPp9cQdy+ans3oOgm6wiH9Os3P2SX533RmSf5sQLxuRO2
   AofMzvp+ZoB68XQJNVkWYNWx7asEacOkTnpYHNMxw2oK2EoN/BWtwp53H
   g==;
X-CSE-ConnectionGUID: Lg+DpA1UTSGitDNCaXUGgg==
X-CSE-MsgGUID: raE+uHlaSwO25Mw3JNPm+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="34206769"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="34206769"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 04:51:14 -0800
X-CSE-ConnectionGUID: lnqh/by2Q22Q17OMsi/MYg==
X-CSE-MsgGUID: K15cQn2jQseZzp7Gg3oCyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="83746910"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Nov 2024 04:51:13 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7wY2-000kpV-1z;
	Mon, 04 Nov 2024 12:51:10 +0000
Date: Mon, 4 Nov 2024 20:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:2176
 mt7996_mcu_beacon_mbss() warn: potential spectre issue 'sub_elem->data' [r]
 (local cap)
Message-ID: <202411042047.FpydCvXU-lkp@intel.com>
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
TO: Chank Chen <chank.chen@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>
CC: Shayne Chen <shayne.chen@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   59b723cd2adbac2a34fc8e12c74ae26ae45bf230
commit: e35f43aa34d36e6cb1de00705c08026b023ef5ed wifi: mt76: connac: add MBSSID support for mt7996
date:   1 year, 1 month ago
:::::: branch date: 13 hours ago
:::::: commit date: 1 year, 1 month ago
config: sh-randconfig-r073-20241104 (https://download.01.org/0day-ci/archive/20241104/202411042047.FpydCvXU-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411042047.FpydCvXU-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:2176 mt7996_mcu_beacon_mbss() warn: potential spectre issue 'sub_elem->data' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:2168 mt7996_mcu_beacon_mbss() warn: potential spectre issue 'elem->data' [r] (local cap)

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:345 mt7996_mcu_rx_radar_detected() warn: potential spectre issue 'dev->mt76.phys' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:347 mt7996_mcu_rx_radar_detected() warn: possible spectre second half.  'mphy'
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:427 mt7996_mcu_ie_countdown() warn: potential spectre issue 'dev->mt76.phys' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:434 mt7996_mcu_ie_countdown() warn: possible spectre second half.  'mphy'
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:439 mt7996_mcu_ie_countdown() warn: possible spectre second half.  'mphy'

vim +2176 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c

98686cd21624c7 Shayne Chen 2022-11-22  2149  
e35f43aa34d36e Chank Chen  2023-08-31  2150  static void
e35f43aa34d36e Chank Chen  2023-08-31  2151  mt7996_mcu_beacon_mbss(struct sk_buff *rskb, struct sk_buff *skb,
e35f43aa34d36e Chank Chen  2023-08-31  2152  		       struct ieee80211_vif *vif, struct bss_bcn_content_tlv *bcn,
e35f43aa34d36e Chank Chen  2023-08-31  2153  		       struct ieee80211_mutable_offsets *offs)
e35f43aa34d36e Chank Chen  2023-08-31  2154  {
e35f43aa34d36e Chank Chen  2023-08-31  2155  	struct bss_bcn_mbss_tlv *mbss;
e35f43aa34d36e Chank Chen  2023-08-31  2156  	const struct element *elem;
e35f43aa34d36e Chank Chen  2023-08-31  2157  	struct tlv *tlv;
e35f43aa34d36e Chank Chen  2023-08-31  2158  
e35f43aa34d36e Chank Chen  2023-08-31  2159  	if (!vif->bss_conf.bssid_indicator)
e35f43aa34d36e Chank Chen  2023-08-31  2160  		return;
e35f43aa34d36e Chank Chen  2023-08-31  2161  
e35f43aa34d36e Chank Chen  2023-08-31  2162  	tlv = mt7996_mcu_add_uni_tlv(rskb, UNI_BSS_INFO_BCN_MBSSID, sizeof(*mbss));
e35f43aa34d36e Chank Chen  2023-08-31  2163  
e35f43aa34d36e Chank Chen  2023-08-31  2164  	mbss = (struct bss_bcn_mbss_tlv *)tlv;
e35f43aa34d36e Chank Chen  2023-08-31  2165  	mbss->offset[0] = cpu_to_le16(offs->tim_offset);
e35f43aa34d36e Chank Chen  2023-08-31  2166  	mbss->bitmap = cpu_to_le32(1);
e35f43aa34d36e Chank Chen  2023-08-31  2167  
e35f43aa34d36e Chank Chen  2023-08-31 @2168  	for_each_element_id(elem, WLAN_EID_MULTIPLE_BSSID,
e35f43aa34d36e Chank Chen  2023-08-31  2169  			    &skb->data[offs->mbssid_off],
e35f43aa34d36e Chank Chen  2023-08-31  2170  			    skb->len - offs->mbssid_off) {
e35f43aa34d36e Chank Chen  2023-08-31  2171  		const struct element *sub_elem;
e35f43aa34d36e Chank Chen  2023-08-31  2172  
e35f43aa34d36e Chank Chen  2023-08-31  2173  		if (elem->datalen < 2)
e35f43aa34d36e Chank Chen  2023-08-31  2174  			continue;
e35f43aa34d36e Chank Chen  2023-08-31  2175  
e35f43aa34d36e Chank Chen  2023-08-31 @2176  		for_each_element(sub_elem, elem->data + 1, elem->datalen - 1) {
e35f43aa34d36e Chank Chen  2023-08-31  2177  			const struct ieee80211_bssid_index *idx;
e35f43aa34d36e Chank Chen  2023-08-31  2178  			const u8 *idx_ie;
e35f43aa34d36e Chank Chen  2023-08-31  2179  
e35f43aa34d36e Chank Chen  2023-08-31  2180  			/* not a valid BSS profile */
e35f43aa34d36e Chank Chen  2023-08-31  2181  			if (sub_elem->id || sub_elem->datalen < 4)
e35f43aa34d36e Chank Chen  2023-08-31  2182  				continue;
e35f43aa34d36e Chank Chen  2023-08-31  2183  
e35f43aa34d36e Chank Chen  2023-08-31  2184  			/* Find WLAN_EID_MULTI_BSSID_IDX
e35f43aa34d36e Chank Chen  2023-08-31  2185  			 * in the merged nontransmitted profile
e35f43aa34d36e Chank Chen  2023-08-31  2186  			 */
e35f43aa34d36e Chank Chen  2023-08-31  2187  			idx_ie = cfg80211_find_ie(WLAN_EID_MULTI_BSSID_IDX,
e35f43aa34d36e Chank Chen  2023-08-31  2188  						  sub_elem->data, sub_elem->datalen);
e35f43aa34d36e Chank Chen  2023-08-31  2189  			if (!idx_ie || idx_ie[1] < sizeof(*idx))
e35f43aa34d36e Chank Chen  2023-08-31  2190  				continue;
e35f43aa34d36e Chank Chen  2023-08-31  2191  
e35f43aa34d36e Chank Chen  2023-08-31  2192  			idx = (void *)(idx_ie + 2);
e35f43aa34d36e Chank Chen  2023-08-31  2193  			if (!idx->bssid_index || idx->bssid_index > 31)
e35f43aa34d36e Chank Chen  2023-08-31  2194  				continue;
e35f43aa34d36e Chank Chen  2023-08-31  2195  
e35f43aa34d36e Chank Chen  2023-08-31  2196  			mbss->offset[idx->bssid_index] = cpu_to_le16(idx_ie -
e35f43aa34d36e Chank Chen  2023-08-31  2197  								     skb->data);
e35f43aa34d36e Chank Chen  2023-08-31  2198  			mbss->bitmap |= cpu_to_le32(BIT(idx->bssid_index));
e35f43aa34d36e Chank Chen  2023-08-31  2199  		}
e35f43aa34d36e Chank Chen  2023-08-31  2200  	}
e35f43aa34d36e Chank Chen  2023-08-31  2201  }
e35f43aa34d36e Chank Chen  2023-08-31  2202  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
