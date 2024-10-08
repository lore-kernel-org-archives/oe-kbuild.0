Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3D81DB344
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Oct 2024 07:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728372044; cv=none; b=kvsva87u2NUFRSxDISgQd5Dfl3I1EMZaOk+KXAuZfI5o6O1JSbxY1ywO2GYFridO8MIxaR4jqk7F1TeVoekyC6qNNLczi8jYjVDL+huIBl5t/pAYjo8uK3eXauO5MMmIpWu5smQxvj26fbCFWwkrrfLEJUNOvuHwXvjByNOybOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728372044; c=relaxed/simple;
	bh=8CX1R3hBvdUkDwZ8XqA+V2lMJQw3WKXjQYtcgZbXmC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CJsAth2WUPi5kb0mCRVyeLtmCwjo/eZGGKKyUALmKtZlI8FCpYJRaPr+IwhKAfOyWStfSAQSNhzYa6Z91563fESgIosMSTgAGk9kxnWndHQWkmUXyQ6BkWqQpb3z911y5CTaJ4UCHQI9vaAoiSG6lM9pni1RSBiYbCk6RGCsESg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EfBGUinx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfBGUinx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728372043; x=1759908043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8CX1R3hBvdUkDwZ8XqA+V2lMJQw3WKXjQYtcgZbXmC4=;
  b=EfBGUinxkyv9mGh5SakBBF6vvv9/pvajY1AnMLzHCcLpB55lYiqKuPot
   mHJz3o6CcaUXO6Zn1eFEl2y0N+4Wccou7REWQZwO0lWTccf2j5ALwbas1
   l0J1WUIUSuON8wTvgtS8615HlUvAFeLpukt83dvqQpk72F33LY3ICaYnY
   TfNmU1vJ+P8OqfM2R2oCtdfUf9TtbpXFXMlLmlkLz+dzuQ4iP+/kfe2sb
   jBlgTjl5wc0e04TNuRqwJqAanWYuLBFv+k2MFrcmmv+VjSrCA0VDdUcpw
   BdJgZlhIT03gJitVb1SP+B+XWqTqTu/Qt5fBP5ICAC8pRV/Yn5BvysDA0
   g==;
X-CSE-ConnectionGUID: x1ugeUJDSfSVEKFOHKUWUw==
X-CSE-MsgGUID: cV6+W2bhRlSxiSiAMIY1Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27036737"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="27036737"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 00:20:43 -0700
X-CSE-ConnectionGUID: 3eClgZKUT1+kResjmdTLtw==
X-CSE-MsgGUID: xIwPCPdxQxu7vQ64igP9Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="80568116"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Oct 2024 00:20:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy4WM-00062E-1F;
	Tue, 08 Oct 2024 07:20:38 +0000
Date: Tue, 8 Oct 2024 15:20:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/ath/ath12k/mac.c:1345
 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'nontx->data' [r]
 (local cap)
Message-ID: <202410081525.l3HZmE3J-lkp@intel.com>
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
head:   87d6aab2389e5ce0197d8257d5f8ee965a67c4cd
commit: 8c6faa56bfb245a165820f46b8ea90e6ae1f24f5 wifi: ath12k: add MBSSID beacon support
date:   5 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 months ago
config: csky-randconfig-r072-20241008 (https://download.01.org/0day-ci/archive/20241008/202410081525.l3HZmE3J-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410081525.l3HZmE3J-lkp@intel.com/

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

575ec73cb8803b Kang Yang   2024-02-05  1301  
8c6faa56bfb245 Aloka Dixit 2024-05-08  1302  static void ath12k_mac_set_arvif_ies(struct ath12k_vif *arvif, struct sk_buff *bcn,
8c6faa56bfb245 Aloka Dixit 2024-05-08  1303  				     u8 bssid_index, bool *nontx_profile_found)
9fd28936b641ab Aloka Dixit 2024-05-08  1304  {
9fd28936b641ab Aloka Dixit 2024-05-08  1305  	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)bcn->data;
8c6faa56bfb245 Aloka Dixit 2024-05-08  1306  	const struct element *elem, *nontx, *index, *nie;
9fd28936b641ab Aloka Dixit 2024-05-08  1307  	const u8 *start, *tail;
9fd28936b641ab Aloka Dixit 2024-05-08  1308  	u16 rem_len;
8c6faa56bfb245 Aloka Dixit 2024-05-08  1309  	u8 i;
9fd28936b641ab Aloka Dixit 2024-05-08  1310  
9fd28936b641ab Aloka Dixit 2024-05-08  1311  	start = bcn->data + ieee80211_get_hdrlen_from_skb(bcn) + sizeof(mgmt->u.beacon);
9fd28936b641ab Aloka Dixit 2024-05-08  1312  	tail = skb_tail_pointer(bcn);
9fd28936b641ab Aloka Dixit 2024-05-08  1313  	rem_len = tail - start;
9fd28936b641ab Aloka Dixit 2024-05-08  1314  
9fd28936b641ab Aloka Dixit 2024-05-08  1315  	arvif->rsnie_present = false;
9fd28936b641ab Aloka Dixit 2024-05-08  1316  	arvif->wpaie_present = false;
9fd28936b641ab Aloka Dixit 2024-05-08  1317  
9fd28936b641ab Aloka Dixit 2024-05-08  1318  	if (cfg80211_find_ie(WLAN_EID_RSN, start, rem_len))
9fd28936b641ab Aloka Dixit 2024-05-08  1319  		arvif->rsnie_present = true;
9fd28936b641ab Aloka Dixit 2024-05-08  1320  	if (cfg80211_find_vendor_ie(WLAN_OUI_MICROSOFT, WLAN_OUI_TYPE_MICROSOFT_WPA,
9fd28936b641ab Aloka Dixit 2024-05-08  1321  				    start, rem_len))
9fd28936b641ab Aloka Dixit 2024-05-08  1322  		arvif->wpaie_present = true;
8c6faa56bfb245 Aloka Dixit 2024-05-08  1323  
8c6faa56bfb245 Aloka Dixit 2024-05-08  1324  	/* Return from here for the transmitted profile */
8c6faa56bfb245 Aloka Dixit 2024-05-08  1325  	if (!bssid_index)
8c6faa56bfb245 Aloka Dixit 2024-05-08  1326  		return;
8c6faa56bfb245 Aloka Dixit 2024-05-08  1327  
8c6faa56bfb245 Aloka Dixit 2024-05-08  1328  	/* Initial rsnie_present for the nontransmitted profile is set to be same as that
8c6faa56bfb245 Aloka Dixit 2024-05-08  1329  	 * of the transmitted profile. It will be changed if security configurations are
8c6faa56bfb245 Aloka Dixit 2024-05-08  1330  	 * different.
8c6faa56bfb245 Aloka Dixit 2024-05-08  1331  	 */
8c6faa56bfb245 Aloka Dixit 2024-05-08  1332  	*nontx_profile_found = false;
8c6faa56bfb245 Aloka Dixit 2024-05-08 @1333  	for_each_element_id(elem, WLAN_EID_MULTIPLE_BSSID, start, rem_len) {
8c6faa56bfb245 Aloka Dixit 2024-05-08  1334  		/* Fixed minimum MBSSID element length with at least one
8c6faa56bfb245 Aloka Dixit 2024-05-08  1335  		 * nontransmitted BSSID profile is 12 bytes as given below;
8c6faa56bfb245 Aloka Dixit 2024-05-08  1336  		 * 1 (max BSSID indicator) +
8c6faa56bfb245 Aloka Dixit 2024-05-08  1337  		 * 2 (Nontransmitted BSSID profile: Subelement ID + length) +
8c6faa56bfb245 Aloka Dixit 2024-05-08  1338  		 * 4 (Nontransmitted BSSID Capabilities: tag + length + info)
8c6faa56bfb245 Aloka Dixit 2024-05-08  1339  		 * 2 (Nontransmitted BSSID SSID: tag + length)
8c6faa56bfb245 Aloka Dixit 2024-05-08  1340  		 * 3 (Nontransmitted BSSID Index: tag + length + BSSID index
8c6faa56bfb245 Aloka Dixit 2024-05-08  1341  		 */
8c6faa56bfb245 Aloka Dixit 2024-05-08  1342  		if (elem->datalen < 12 || elem->data[0] < 1)
8c6faa56bfb245 Aloka Dixit 2024-05-08  1343  			continue; /* Max BSSID indicator must be >=1 */
8c6faa56bfb245 Aloka Dixit 2024-05-08  1344  
8c6faa56bfb245 Aloka Dixit 2024-05-08 @1345  		for_each_element(nontx, elem->data + 1, elem->datalen - 1) {
8c6faa56bfb245 Aloka Dixit 2024-05-08  1346  			start = nontx->data;
8c6faa56bfb245 Aloka Dixit 2024-05-08  1347  
8c6faa56bfb245 Aloka Dixit 2024-05-08  1348  			if (nontx->id != 0 || nontx->datalen < 4)
8c6faa56bfb245 Aloka Dixit 2024-05-08  1349  				continue; /* Invalid nontransmitted profile */
8c6faa56bfb245 Aloka Dixit 2024-05-08  1350  
8c6faa56bfb245 Aloka Dixit 2024-05-08  1351  			if (nontx->data[0] != WLAN_EID_NON_TX_BSSID_CAP ||
8c6faa56bfb245 Aloka Dixit 2024-05-08  1352  			    nontx->data[1] != 2) {
8c6faa56bfb245 Aloka Dixit 2024-05-08  1353  				continue; /* Missing nontransmitted BSS capabilities */
8c6faa56bfb245 Aloka Dixit 2024-05-08  1354  			}
8c6faa56bfb245 Aloka Dixit 2024-05-08  1355  
8c6faa56bfb245 Aloka Dixit 2024-05-08  1356  			if (nontx->data[4] != WLAN_EID_SSID)
8c6faa56bfb245 Aloka Dixit 2024-05-08  1357  				continue; /* Missing SSID for nontransmitted BSS */
8c6faa56bfb245 Aloka Dixit 2024-05-08  1358  
8c6faa56bfb245 Aloka Dixit 2024-05-08  1359  			index = cfg80211_find_elem(WLAN_EID_MULTI_BSSID_IDX,
8c6faa56bfb245 Aloka Dixit 2024-05-08  1360  						   start, nontx->datalen);
8c6faa56bfb245 Aloka Dixit 2024-05-08  1361  			if (!index || index->datalen < 1 || index->data[0] == 0)
8c6faa56bfb245 Aloka Dixit 2024-05-08  1362  				continue; /* Invalid MBSSID Index element */
8c6faa56bfb245 Aloka Dixit 2024-05-08  1363  
8c6faa56bfb245 Aloka Dixit 2024-05-08  1364  			if (index->data[0] == bssid_index) {
8c6faa56bfb245 Aloka Dixit 2024-05-08  1365  				*nontx_profile_found = true;
8c6faa56bfb245 Aloka Dixit 2024-05-08  1366  				if (cfg80211_find_ie(WLAN_EID_RSN,
8c6faa56bfb245 Aloka Dixit 2024-05-08  1367  						     nontx->data,
8c6faa56bfb245 Aloka Dixit 2024-05-08  1368  						     nontx->datalen)) {
8c6faa56bfb245 Aloka Dixit 2024-05-08  1369  					arvif->rsnie_present = true;
8c6faa56bfb245 Aloka Dixit 2024-05-08  1370  					return;
8c6faa56bfb245 Aloka Dixit 2024-05-08  1371  				} else if (!arvif->rsnie_present) {
8c6faa56bfb245 Aloka Dixit 2024-05-08  1372  					return; /* Both tx and nontx BSS are open */
8c6faa56bfb245 Aloka Dixit 2024-05-08  1373  				}
8c6faa56bfb245 Aloka Dixit 2024-05-08  1374  
8c6faa56bfb245 Aloka Dixit 2024-05-08  1375  				nie = cfg80211_find_ext_elem(WLAN_EID_EXT_NON_INHERITANCE,
8c6faa56bfb245 Aloka Dixit 2024-05-08  1376  							     nontx->data,
8c6faa56bfb245 Aloka Dixit 2024-05-08  1377  							     nontx->datalen);
8c6faa56bfb245 Aloka Dixit 2024-05-08  1378  				if (!nie || nie->datalen < 2)
8c6faa56bfb245 Aloka Dixit 2024-05-08  1379  					return; /* Invalid non-inheritance element */
8c6faa56bfb245 Aloka Dixit 2024-05-08  1380  
8c6faa56bfb245 Aloka Dixit 2024-05-08  1381  				for (i = 1; i < nie->datalen - 1; i++) {
8c6faa56bfb245 Aloka Dixit 2024-05-08  1382  					if (nie->data[i] == WLAN_EID_RSN) {
8c6faa56bfb245 Aloka Dixit 2024-05-08  1383  						arvif->rsnie_present = false;
8c6faa56bfb245 Aloka Dixit 2024-05-08  1384  						break;
8c6faa56bfb245 Aloka Dixit 2024-05-08  1385  					}
8c6faa56bfb245 Aloka Dixit 2024-05-08  1386  				}
8c6faa56bfb245 Aloka Dixit 2024-05-08  1387  
8c6faa56bfb245 Aloka Dixit 2024-05-08  1388  				return;
8c6faa56bfb245 Aloka Dixit 2024-05-08  1389  			}
8c6faa56bfb245 Aloka Dixit 2024-05-08  1390  		}
8c6faa56bfb245 Aloka Dixit 2024-05-08  1391  	}
9fd28936b641ab Aloka Dixit 2024-05-08  1392  }
9fd28936b641ab Aloka Dixit 2024-05-08  1393  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
