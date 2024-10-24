Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFE91F76C7
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Oct 2024 17:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729791434; cv=none; b=fPnDqoYhye3TaTBtW40iynhvpIxZaD5HR7sJYoigasEt3pk1uViAKjU4LuTHeNr27G6AwC3rY9mkoSmvHoP9UO6+27gwvol20TtwrqzsGcMD82E2KolKiPzblAg7nuNF+g5ajPge1z7BSZBpGOGmkY3eTTbqufyvo9uDNlKsaYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729791434; c=relaxed/simple;
	bh=vbiXS8cNEk7gDPV+6P2C6MYP3DRZya8I/7H6DRWO5CE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XlwwX5gcLZkATvnjM4smXhnO9kbB2TLSix+29iL2ZbfVW4d8P1ayaXpC8RUQOm5NK/q1BmULxsGeKkyOntzNF7XioBGDqIOCvsa6mHwPLoACNZX5keShUb8T7aWeD4soLazgaS/0XbJIiUFb0VC9t/YzVkHdj0jc3S5L4QA/C94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cy+V2xBP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cy+V2xBP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729791431; x=1761327431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vbiXS8cNEk7gDPV+6P2C6MYP3DRZya8I/7H6DRWO5CE=;
  b=Cy+V2xBPqwo73FITgp0i2WEz5y1mPhIb2GeH2bB6c3hehkT7hnsGOaW3
   2mYkD4AUzUXI7gYMbWZ9Pxa9l0bdoNDTJ71mvqpceu1nG9F1vasJLoKaf
   b2qkK8A/DQu+jn38oR7OALvgqhuO3zSntQqwEPYPypkNtukeronvrxI3k
   r7Sp3z7XK//0zRZPkAhkWMDryvGv1tHMYbdB+oO5QsHUYPVGBFKF9cVOI
   mUGrcy8SrkgIdlMnxHtnfmqzCXlO+YGkERi0GrhCLYgMwl/YvG8jneqWK
   bD+xmy3YKwvw3gK1dgwJZEEfiDZVs5f3T6kWqaMcjB4pfsrbbBvlu4fwu
   w==;
X-CSE-ConnectionGUID: FT4Ko0TCT0aDzOwEktLmSA==
X-CSE-MsgGUID: JZ5+PO05T16LuPlFE84nzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29655206"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="29655206"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 10:37:11 -0700
X-CSE-ConnectionGUID: 3EVrCPm+SDWeoU4JBbkdwQ==
X-CSE-MsgGUID: g79jEwqnT6aU603gFGLPiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="85440485"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Oct 2024 10:37:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t41lj-000Wmy-09;
	Thu, 24 Oct 2024 17:37:07 +0000
Date: Fri, 25 Oct 2024 01:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/ath/ath12k/mac.c:1345
 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'nontx->data' [r]
 (local cap)
Message-ID: <202410250136.7ct3hNwM-lkp@intel.com>
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
TO: Aloka Dixit <quic_alokad@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c2ee9f594da826bea183ed14f2cc029c719bf4da
commit: 8c6faa56bfb245a165820f46b8ea90e6ae1f24f5 wifi: ath12k: add MBSSID beacon support
date:   5 months ago
:::::: branch date: 3 days ago
:::::: commit date: 5 months ago
config: parisc-randconfig-r071-20241024 (https://download.01.org/0day-ci/archive/20241025/202410250136.7ct3hNwM-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410250136.7ct3hNwM-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:1345 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'nontx->data' [r] (local cap)
drivers/net/wireless/ath/ath12k/mac.c:1333 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'elem->data' [r] (local cap)

Old smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:2038 ath12k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_80'.
drivers/net/wireless/ath/ath12k/mac.c:2038 ath12k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_160'.
drivers/net/wireless/ath/ath12k/mac.c:2040 ath12k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_80'.
drivers/net/wireless/ath/ath12k/mac.c:2066 ath12k_peer_assoc_h_he() warn: mask and shift to zero: expr='(he_cap->he_cap_elem.mac_cap_info[3] & 24) >> 24'
drivers/net/wireless/ath/ath12k/mac.c:4694 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:4696 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:8293 ath12k_mac_op_get_survey() error: we previously assumed 'sband' could be null (see line 8292)

vim +1345 drivers/net/wireless/ath/ath12k/mac.c

575ec73cb8803b4 Kang Yang   2024-02-05  1301  
8c6faa56bfb245a Aloka Dixit 2024-05-08  1302  static void ath12k_mac_set_arvif_ies(struct ath12k_vif *arvif, struct sk_buff *bcn,
8c6faa56bfb245a Aloka Dixit 2024-05-08  1303  				     u8 bssid_index, bool *nontx_profile_found)
9fd28936b641ab0 Aloka Dixit 2024-05-08  1304  {
9fd28936b641ab0 Aloka Dixit 2024-05-08  1305  	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)bcn->data;
8c6faa56bfb245a Aloka Dixit 2024-05-08  1306  	const struct element *elem, *nontx, *index, *nie;
9fd28936b641ab0 Aloka Dixit 2024-05-08  1307  	const u8 *start, *tail;
9fd28936b641ab0 Aloka Dixit 2024-05-08  1308  	u16 rem_len;
8c6faa56bfb245a Aloka Dixit 2024-05-08  1309  	u8 i;
9fd28936b641ab0 Aloka Dixit 2024-05-08  1310  
9fd28936b641ab0 Aloka Dixit 2024-05-08  1311  	start = bcn->data + ieee80211_get_hdrlen_from_skb(bcn) + sizeof(mgmt->u.beacon);
9fd28936b641ab0 Aloka Dixit 2024-05-08  1312  	tail = skb_tail_pointer(bcn);
9fd28936b641ab0 Aloka Dixit 2024-05-08  1313  	rem_len = tail - start;
9fd28936b641ab0 Aloka Dixit 2024-05-08  1314  
9fd28936b641ab0 Aloka Dixit 2024-05-08  1315  	arvif->rsnie_present = false;
9fd28936b641ab0 Aloka Dixit 2024-05-08  1316  	arvif->wpaie_present = false;
9fd28936b641ab0 Aloka Dixit 2024-05-08  1317  
9fd28936b641ab0 Aloka Dixit 2024-05-08  1318  	if (cfg80211_find_ie(WLAN_EID_RSN, start, rem_len))
9fd28936b641ab0 Aloka Dixit 2024-05-08  1319  		arvif->rsnie_present = true;
9fd28936b641ab0 Aloka Dixit 2024-05-08  1320  	if (cfg80211_find_vendor_ie(WLAN_OUI_MICROSOFT, WLAN_OUI_TYPE_MICROSOFT_WPA,
9fd28936b641ab0 Aloka Dixit 2024-05-08  1321  				    start, rem_len))
9fd28936b641ab0 Aloka Dixit 2024-05-08  1322  		arvif->wpaie_present = true;
8c6faa56bfb245a Aloka Dixit 2024-05-08  1323  
8c6faa56bfb245a Aloka Dixit 2024-05-08  1324  	/* Return from here for the transmitted profile */
8c6faa56bfb245a Aloka Dixit 2024-05-08  1325  	if (!bssid_index)
8c6faa56bfb245a Aloka Dixit 2024-05-08  1326  		return;
8c6faa56bfb245a Aloka Dixit 2024-05-08  1327  
8c6faa56bfb245a Aloka Dixit 2024-05-08  1328  	/* Initial rsnie_present for the nontransmitted profile is set to be same as that
8c6faa56bfb245a Aloka Dixit 2024-05-08  1329  	 * of the transmitted profile. It will be changed if security configurations are
8c6faa56bfb245a Aloka Dixit 2024-05-08  1330  	 * different.
8c6faa56bfb245a Aloka Dixit 2024-05-08  1331  	 */
8c6faa56bfb245a Aloka Dixit 2024-05-08  1332  	*nontx_profile_found = false;
8c6faa56bfb245a Aloka Dixit 2024-05-08 @1333  	for_each_element_id(elem, WLAN_EID_MULTIPLE_BSSID, start, rem_len) {
8c6faa56bfb245a Aloka Dixit 2024-05-08  1334  		/* Fixed minimum MBSSID element length with at least one
8c6faa56bfb245a Aloka Dixit 2024-05-08  1335  		 * nontransmitted BSSID profile is 12 bytes as given below;
8c6faa56bfb245a Aloka Dixit 2024-05-08  1336  		 * 1 (max BSSID indicator) +
8c6faa56bfb245a Aloka Dixit 2024-05-08  1337  		 * 2 (Nontransmitted BSSID profile: Subelement ID + length) +
8c6faa56bfb245a Aloka Dixit 2024-05-08  1338  		 * 4 (Nontransmitted BSSID Capabilities: tag + length + info)
8c6faa56bfb245a Aloka Dixit 2024-05-08  1339  		 * 2 (Nontransmitted BSSID SSID: tag + length)
8c6faa56bfb245a Aloka Dixit 2024-05-08  1340  		 * 3 (Nontransmitted BSSID Index: tag + length + BSSID index
8c6faa56bfb245a Aloka Dixit 2024-05-08  1341  		 */
8c6faa56bfb245a Aloka Dixit 2024-05-08  1342  		if (elem->datalen < 12 || elem->data[0] < 1)
8c6faa56bfb245a Aloka Dixit 2024-05-08  1343  			continue; /* Max BSSID indicator must be >=1 */
8c6faa56bfb245a Aloka Dixit 2024-05-08  1344  
8c6faa56bfb245a Aloka Dixit 2024-05-08 @1345  		for_each_element(nontx, elem->data + 1, elem->datalen - 1) {
8c6faa56bfb245a Aloka Dixit 2024-05-08  1346  			start = nontx->data;
8c6faa56bfb245a Aloka Dixit 2024-05-08  1347  
8c6faa56bfb245a Aloka Dixit 2024-05-08  1348  			if (nontx->id != 0 || nontx->datalen < 4)
8c6faa56bfb245a Aloka Dixit 2024-05-08  1349  				continue; /* Invalid nontransmitted profile */
8c6faa56bfb245a Aloka Dixit 2024-05-08  1350  
8c6faa56bfb245a Aloka Dixit 2024-05-08  1351  			if (nontx->data[0] != WLAN_EID_NON_TX_BSSID_CAP ||
8c6faa56bfb245a Aloka Dixit 2024-05-08  1352  			    nontx->data[1] != 2) {
8c6faa56bfb245a Aloka Dixit 2024-05-08  1353  				continue; /* Missing nontransmitted BSS capabilities */
8c6faa56bfb245a Aloka Dixit 2024-05-08  1354  			}
8c6faa56bfb245a Aloka Dixit 2024-05-08  1355  
8c6faa56bfb245a Aloka Dixit 2024-05-08  1356  			if (nontx->data[4] != WLAN_EID_SSID)
8c6faa56bfb245a Aloka Dixit 2024-05-08  1357  				continue; /* Missing SSID for nontransmitted BSS */
8c6faa56bfb245a Aloka Dixit 2024-05-08  1358  
8c6faa56bfb245a Aloka Dixit 2024-05-08  1359  			index = cfg80211_find_elem(WLAN_EID_MULTI_BSSID_IDX,
8c6faa56bfb245a Aloka Dixit 2024-05-08  1360  						   start, nontx->datalen);
8c6faa56bfb245a Aloka Dixit 2024-05-08  1361  			if (!index || index->datalen < 1 || index->data[0] == 0)
8c6faa56bfb245a Aloka Dixit 2024-05-08  1362  				continue; /* Invalid MBSSID Index element */
8c6faa56bfb245a Aloka Dixit 2024-05-08  1363  
8c6faa56bfb245a Aloka Dixit 2024-05-08  1364  			if (index->data[0] == bssid_index) {
8c6faa56bfb245a Aloka Dixit 2024-05-08  1365  				*nontx_profile_found = true;
8c6faa56bfb245a Aloka Dixit 2024-05-08  1366  				if (cfg80211_find_ie(WLAN_EID_RSN,
8c6faa56bfb245a Aloka Dixit 2024-05-08  1367  						     nontx->data,
8c6faa56bfb245a Aloka Dixit 2024-05-08  1368  						     nontx->datalen)) {
8c6faa56bfb245a Aloka Dixit 2024-05-08  1369  					arvif->rsnie_present = true;
8c6faa56bfb245a Aloka Dixit 2024-05-08  1370  					return;
8c6faa56bfb245a Aloka Dixit 2024-05-08  1371  				} else if (!arvif->rsnie_present) {
8c6faa56bfb245a Aloka Dixit 2024-05-08  1372  					return; /* Both tx and nontx BSS are open */
8c6faa56bfb245a Aloka Dixit 2024-05-08  1373  				}
8c6faa56bfb245a Aloka Dixit 2024-05-08  1374  
8c6faa56bfb245a Aloka Dixit 2024-05-08  1375  				nie = cfg80211_find_ext_elem(WLAN_EID_EXT_NON_INHERITANCE,
8c6faa56bfb245a Aloka Dixit 2024-05-08  1376  							     nontx->data,
8c6faa56bfb245a Aloka Dixit 2024-05-08  1377  							     nontx->datalen);
8c6faa56bfb245a Aloka Dixit 2024-05-08  1378  				if (!nie || nie->datalen < 2)
8c6faa56bfb245a Aloka Dixit 2024-05-08  1379  					return; /* Invalid non-inheritance element */
8c6faa56bfb245a Aloka Dixit 2024-05-08  1380  
8c6faa56bfb245a Aloka Dixit 2024-05-08  1381  				for (i = 1; i < nie->datalen - 1; i++) {
8c6faa56bfb245a Aloka Dixit 2024-05-08  1382  					if (nie->data[i] == WLAN_EID_RSN) {
8c6faa56bfb245a Aloka Dixit 2024-05-08  1383  						arvif->rsnie_present = false;
8c6faa56bfb245a Aloka Dixit 2024-05-08  1384  						break;
8c6faa56bfb245a Aloka Dixit 2024-05-08  1385  					}
8c6faa56bfb245a Aloka Dixit 2024-05-08  1386  				}
8c6faa56bfb245a Aloka Dixit 2024-05-08  1387  
8c6faa56bfb245a Aloka Dixit 2024-05-08  1388  				return;
8c6faa56bfb245a Aloka Dixit 2024-05-08  1389  			}
8c6faa56bfb245a Aloka Dixit 2024-05-08  1390  		}
8c6faa56bfb245a Aloka Dixit 2024-05-08  1391  	}
9fd28936b641ab0 Aloka Dixit 2024-05-08  1392  }
9fd28936b641ab0 Aloka Dixit 2024-05-08  1393  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
