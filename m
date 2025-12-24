Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B96032E686
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 08:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766566669; cv=none; b=Q/jrCBliZgWgI0r36tbWez/HjcS6H2UHDgRQ+OBaLbIxmqGudaqp84ipzAuOKug73nW91i+xBxfYX5zrHgwkkR2OaAFS0Vaw7wX7qTWitNpZZtWm+Ov2ogclaGk9VrO4PhisEzdNRIR0O5/6KyqiX7FgZGbBnlPqq93C3YY+5jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766566669; c=relaxed/simple;
	bh=YcvGRb0UFD/9yki1dvqR9X/yt57jRoMVGeOZ9Iha5/A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kyOP3dKtvraA1rr8RbRu9THlWVYqMGYsLNnncvMCmDK82XKKubEsXpI+MpuStM+ZP+Ro5msApPOVOkOT0wF/1FvIQe32Yo2g+y1fPTnjWCbgJPklIUXWAbYqDIE0hIqR4NDt3o3O/1oSRXQcOeo6Xqe2rB1eDdYiKW82KjA8cyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyaY1bLG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyaY1bLG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766566666; x=1798102666;
  h=date:from:to:cc:subject:message-id;
  bh=YcvGRb0UFD/9yki1dvqR9X/yt57jRoMVGeOZ9Iha5/A=;
  b=fyaY1bLGEoSy//ed4yQClOJ/TNsIpd0gxI4nLHQ2zHwLX6DDl54hKWSC
   2jZBS76QjZCcvRZW65lPT525PZL9Lo74HwnOGmSiaHNDTgqtUOZrrJdXx
   i53AibtFLk8N+mEs5dGZ1Tev69J0NdIlITxQPzHj7JpuirA7dvzQZ7RQl
   qZyH1k+jDGFxGJqkRXA9Q4+EfXsOxbCPBdBnyvW7kUTClv7gSd0uauAXW
   m5oYuUfhtZXBthuGTsJtu/XDoZwf7iqYvODXcqE7tMakmNgP4EQOge4aq
   3PhmInBSt+7+F0rfqXNF3WNnfssYeuFtbMDKo85MMC21xRLMON3cASuUY
   Q==;
X-CSE-ConnectionGUID: kM4R9cNuQYi2ADcbIvvqVQ==
X-CSE-MsgGUID: 2duRNAuzRYm/VEVUIgVJ0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68289740"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="68289740"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 00:57:45 -0800
X-CSE-ConnectionGUID: a8oJnr9dRhSDn/KbVpKDKg==
X-CSE-MsgGUID: JjtLLFO/S46T8WE/NbuNlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="199951932"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Dec 2025 00:57:43 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYKgf-000000002s5-3a84;
	Wed, 24 Dec 2025 08:57:41 +0000
Date: Wed, 24 Dec 2025 16:57:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/ath/ath12k/mac.c:10928
 ath12k_mac_hw_register() error: uninitialized symbol 'cap'.
Message-ID: <202512241612.7JsJYcUl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rameshkumar Sundaram <quic_ramess@quicinc.com>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b927546677c876e26eba308550207c2ddf812a43
commit: d33bc467e8325be66b7209250e9829d199034ffe wifi: ath12k: advertise MLO support and capabilities
date:   1 year ago
:::::: branch date: 2 days ago
:::::: commit date: 1 year ago
config: alpha-randconfig-r072-20251224 (https://download.01.org/0day-ci/archive/20251224/202512241612.7JsJYcUl-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512241612.7JsJYcUl-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:10928 ath12k_mac_hw_register() error: uninitialized symbol 'cap'.

Old smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:1491 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'nontx->data' [r] (local cap)
drivers/net/wireless/ath/ath12k/mac.c:1479 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'elem->data' [r] (local cap)
drivers/net/wireless/ath/ath12k/mac.c:5995 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:5997 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:11343 ath12k_mac_destroy() error: we previously assumed 'ab' could be null (see line 11332)
drivers/net/wireless/ath/ath12k/mac.c:11409 ath12k_mac_allocate() error: uninitialized symbol 'ab'.
drivers/net/wireless/ath/ath12k/mac.c:11415 ath12k_mac_allocate() error: uninitialized symbol 'ab'.

vim +/cap +10928 drivers/net/wireless/ath/ath12k/mac.c

d889913205cf7e Kalle Valo             2022-11-28  10776  
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10777  static int ath12k_mac_hw_register(struct ath12k_hw *ah)
d889913205cf7e Kalle Valo             2022-11-28  10778  {
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10779  	struct ieee80211_hw *hw = ah->hw;
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10780  	struct wiphy *wiphy = hw->wiphy;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10781  	struct ath12k *ar = ath12k_ah_to_ar(ah, 0);
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10782  	struct ath12k_base *ab = ar->ab;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10783  	struct ath12k_pdev *pdev;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10784  	struct ath12k_pdev_cap *cap;
d889913205cf7e Kalle Valo             2022-11-28  10785  	static const u32 cipher_suites[] = {
d889913205cf7e Kalle Valo             2022-11-28  10786  		WLAN_CIPHER_SUITE_TKIP,
d889913205cf7e Kalle Valo             2022-11-28  10787  		WLAN_CIPHER_SUITE_CCMP,
d889913205cf7e Kalle Valo             2022-11-28  10788  		WLAN_CIPHER_SUITE_AES_CMAC,
d889913205cf7e Kalle Valo             2022-11-28  10789  		WLAN_CIPHER_SUITE_BIP_CMAC_256,
d889913205cf7e Kalle Valo             2022-11-28  10790  		WLAN_CIPHER_SUITE_BIP_GMAC_128,
d889913205cf7e Kalle Valo             2022-11-28  10791  		WLAN_CIPHER_SUITE_BIP_GMAC_256,
d889913205cf7e Kalle Valo             2022-11-28  10792  		WLAN_CIPHER_SUITE_GCMP,
d889913205cf7e Kalle Valo             2022-11-28  10793  		WLAN_CIPHER_SUITE_GCMP_256,
d889913205cf7e Kalle Valo             2022-11-28  10794  		WLAN_CIPHER_SUITE_CCMP_256,
d889913205cf7e Kalle Valo             2022-11-28  10795  	};
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10796  	int ret, i, j;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10797  	u32 ht_cap = U32_MAX, antennas_rx = 0, antennas_tx = 0;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10798  	bool is_6ghz = false, is_raw_mode = false, is_monitor_disable = false;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10799  	u8 *mac_addr = NULL;
253ec89c9013b0 Karthikeyan Periyasamy 2024-06-13  10800  	u8 mbssid_max_interfaces = 0;
d889913205cf7e Kalle Valo             2022-11-28  10801  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10802  	wiphy->max_ap_assoc_sta = 0;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10803  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10804  	for_each_ar(ah, ar, i) {
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10805  		u32 ht_cap_info = 0;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10806  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10807  		pdev = ar->pdev;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10808  		if (ar->ab->pdevs_macaddr_valid) {
d786c9f5fe3472 Karthikeyan Periyasamy 2024-01-14  10809  			ether_addr_copy(ar->mac_addr, pdev->mac_addr);
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10810  		} else {
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10811  			ether_addr_copy(ar->mac_addr, ar->ab->mac_addr);
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10812  			ar->mac_addr[4] += ar->pdev_idx;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10813  		}
d889913205cf7e Kalle Valo             2022-11-28  10814  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10815  		ret = ath12k_mac_setup_register(ar, &ht_cap_info, hw->wiphy->bands);
d889913205cf7e Kalle Valo             2022-11-28  10816  		if (ret)
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10817  			goto err_cleanup_unregister;
d889913205cf7e Kalle Valo             2022-11-28  10818  
72c24b1b779d78 Aditya Kumar Singh     2024-12-09  10819  		/* 6 GHz does not support HT Cap, hence do not consider it */
72c24b1b779d78 Aditya Kumar Singh     2024-12-09  10820  		if (!ar->supports_6ghz)
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10821  			ht_cap &= ht_cap_info;
72c24b1b779d78 Aditya Kumar Singh     2024-12-09  10822  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10823  		wiphy->max_ap_assoc_sta += ar->max_num_stations;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10824  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10825  		/* Advertise the max antenna support of all radios, driver can handle
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10826  		 * per pdev specific antenna setting based on pdev cap when antenna
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10827  		 * changes are made
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10828  		 */
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10829  		cap = &pdev->cap;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10830  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10831  		antennas_rx = max_t(u32, antennas_rx, cap->rx_chain_mask);
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10832  		antennas_tx = max_t(u32, antennas_tx, cap->tx_chain_mask);
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10833  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10834  		if (ar->supports_6ghz)
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10835  			is_6ghz = true;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10836  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10837  		if (test_bit(ATH12K_FLAG_RAW_MODE, &ar->ab->dev_flags))
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10838  			is_raw_mode = true;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10839  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10840  		if (!ar->ab->hw_params->supports_monitor)
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10841  			is_monitor_disable = true;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10842  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10843  		if (i == 0)
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10844  			mac_addr = ar->mac_addr;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10845  		else
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10846  			mac_addr = ab->mac_addr;
253ec89c9013b0 Karthikeyan Periyasamy 2024-06-13  10847  
253ec89c9013b0 Karthikeyan Periyasamy 2024-06-13  10848  		mbssid_max_interfaces += TARGET_NUM_VDEVS;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10849  	}
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10850  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10851  	wiphy->available_antennas_rx = antennas_rx;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10852  	wiphy->available_antennas_tx = antennas_tx;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10853  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10854  	SET_IEEE80211_PERM_ADDR(hw, mac_addr);
d786c9f5fe3472 Karthikeyan Periyasamy 2024-01-14  10855  	SET_IEEE80211_DEV(hw, ab->dev);
d889913205cf7e Kalle Valo             2022-11-28  10856  
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10857  	ret = ath12k_mac_setup_iface_combinations(ah);
d889913205cf7e Kalle Valo             2022-11-28  10858  	if (ret) {
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10859  		ath12k_err(ab, "failed to setup interface combinations: %d\n", ret);
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10860  		goto err_complete_cleanup_unregister;
d889913205cf7e Kalle Valo             2022-11-28  10861  	}
d889913205cf7e Kalle Valo             2022-11-28  10862  
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10863  	wiphy->interface_modes = ath12k_mac_get_ifmodes(ah);
d889913205cf7e Kalle Valo             2022-11-28  10864  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10865  	if (ah->num_radio == 1 &&
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10866  	    wiphy->bands[NL80211_BAND_2GHZ] &&
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10867  	    wiphy->bands[NL80211_BAND_5GHZ] &&
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10868  	    wiphy->bands[NL80211_BAND_6GHZ])
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10869  		ieee80211_hw_set(hw, SINGLE_SCAN_ON_ALL_BANDS);
a1e09eb35476d6 Wen Gong               2023-09-13  10870  
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10871  	ieee80211_hw_set(hw, SIGNAL_DBM);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10872  	ieee80211_hw_set(hw, SUPPORTS_PS);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10873  	ieee80211_hw_set(hw, SUPPORTS_DYNAMIC_PS);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10874  	ieee80211_hw_set(hw, MFP_CAPABLE);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10875  	ieee80211_hw_set(hw, REPORTS_TX_ACK_STATUS);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10876  	ieee80211_hw_set(hw, HAS_RATE_CONTROL);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10877  	ieee80211_hw_set(hw, AP_LINK_PS);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10878  	ieee80211_hw_set(hw, SPECTRUM_MGMT);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10879  	ieee80211_hw_set(hw, CONNECTION_MONITOR);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10880  	ieee80211_hw_set(hw, SUPPORTS_PER_STA_GTK);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10881  	ieee80211_hw_set(hw, CHANCTX_STA_CSA);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10882  	ieee80211_hw_set(hw, QUEUE_CONTROL);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10883  	ieee80211_hw_set(hw, SUPPORTS_TX_FRAG);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10884  	ieee80211_hw_set(hw, REPORTS_LOW_ACK);
d889913205cf7e Kalle Valo             2022-11-28  10885  
72c24b1b779d78 Aditya Kumar Singh     2024-12-09  10886  	if ((ht_cap & WMI_HT_CAP_ENABLED) || is_6ghz) {
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10887  		ieee80211_hw_set(hw, AMPDU_AGGREGATION);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10888  		ieee80211_hw_set(hw, TX_AMPDU_SETUP_IN_HW);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10889  		ieee80211_hw_set(hw, SUPPORTS_REORDERING_BUFFER);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10890  		ieee80211_hw_set(hw, SUPPORTS_AMSDU_IN_AMPDU);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10891  		ieee80211_hw_set(hw, USES_RSS);
d889913205cf7e Kalle Valo             2022-11-28  10892  	}
d889913205cf7e Kalle Valo             2022-11-28  10893  
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10894  	wiphy->features |= NL80211_FEATURE_STATIC_SMPS;
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10895  	wiphy->flags |= WIPHY_FLAG_IBSS_RSN;
d889913205cf7e Kalle Valo             2022-11-28  10896  
d889913205cf7e Kalle Valo             2022-11-28  10897  	/* TODO: Check if HT capability advertised from firmware is different
d889913205cf7e Kalle Valo             2022-11-28  10898  	 * for each band for a dual band capable radio. It will be tricky to
d889913205cf7e Kalle Valo             2022-11-28  10899  	 * handle it when the ht capability different for each band.
d889913205cf7e Kalle Valo             2022-11-28  10900  	 */
97b7cbb7a3cbee Pradeep Kumar Chitrapu 2024-05-08  10901  	if (ht_cap & WMI_HT_CAP_DYNAMIC_SMPS ||
72c24b1b779d78 Aditya Kumar Singh     2024-12-09  10902  	    (is_6ghz && ab->hw_params->supports_dynamic_smps_6ghz))
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10903  		wiphy->features |= NL80211_FEATURE_DYNAMIC_SMPS;
d889913205cf7e Kalle Valo             2022-11-28  10904  
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10905  	wiphy->max_scan_ssids = WLAN_SCAN_PARAMS_MAX_SSID;
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10906  	wiphy->max_scan_ie_len = WLAN_SCAN_PARAMS_MAX_IE_LEN;
d889913205cf7e Kalle Valo             2022-11-28  10907  
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10908  	hw->max_listen_interval = ATH12K_MAX_HW_LISTEN_INTERVAL;
d889913205cf7e Kalle Valo             2022-11-28  10909  
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10910  	wiphy->flags |= WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL;
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10911  	wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH;
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10912  	wiphy->max_remain_on_channel_duration = 5000;
d889913205cf7e Kalle Valo             2022-11-28  10913  
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10914  	wiphy->flags |= WIPHY_FLAG_AP_UAPSD;
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10915  	wiphy->features |= NL80211_FEATURE_AP_MODE_CHAN_WIDTH_CHANGE |
d889913205cf7e Kalle Valo             2022-11-28  10916  				   NL80211_FEATURE_AP_SCAN;
d889913205cf7e Kalle Valo             2022-11-28  10917  
03a509740b5d29 Kalle Valo             2024-04-11  10918  	/* MLO is not yet supported so disable Wireless Extensions for now
03a509740b5d29 Kalle Valo             2024-04-11  10919  	 * to make sure ath12k users don't use it. This flag can be removed
03a509740b5d29 Kalle Valo             2024-04-11  10920  	 * once WIPHY_FLAG_SUPPORTS_MLO is enabled.
03a509740b5d29 Kalle Valo             2024-04-11  10921  	 */
03a509740b5d29 Kalle Valo             2024-04-11  10922  	wiphy->flags |= WIPHY_FLAG_DISABLE_WEXT;
03a509740b5d29 Kalle Valo             2024-04-11  10923  
d33bc467e8325b Rameshkumar Sundaram   2024-12-11  10924  	/* Copy over MLO related capabilities received from
d33bc467e8325b Rameshkumar Sundaram   2024-12-11  10925  	 * WMI_SERVICE_READY_EXT2_EVENT if single_chip_mlo_supp is set.
d33bc467e8325b Rameshkumar Sundaram   2024-12-11  10926  	 */
d33bc467e8325b Rameshkumar Sundaram   2024-12-11  10927  	if (ab->ag->mlo_capable) {
d33bc467e8325b Rameshkumar Sundaram   2024-12-11 @10928  		ath12k_iftypes_ext_capa[2].eml_capabilities = cap->eml_cap;
d33bc467e8325b Rameshkumar Sundaram   2024-12-11  10929  		ath12k_iftypes_ext_capa[2].mld_capa_and_ops = cap->mld_cap;
d33bc467e8325b Rameshkumar Sundaram   2024-12-11  10930  		wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO;
d33bc467e8325b Rameshkumar Sundaram   2024-12-11  10931  	}
d33bc467e8325b Rameshkumar Sundaram   2024-12-11  10932  
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10933  	hw->queues = ATH12K_HW_MAX_QUEUES;
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10934  	wiphy->tx_queue_len = ATH12K_QUEUE_LEN;
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10935  	hw->offchannel_tx_hw_queue = ATH12K_HW_MAX_QUEUES - 1;
b0970f50839ecb Baochen Qiang          2024-01-17  10936  	hw->max_rx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF_EHT;
d889913205cf7e Kalle Valo             2022-11-28  10937  
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10938  	hw->vif_data_size = sizeof(struct ath12k_vif);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10939  	hw->sta_data_size = sizeof(struct ath12k_sta);
38055789d15155 Baochen Qiang          2024-08-01  10940  	hw->extra_tx_headroom = ab->hw_params->iova_mask;
d889913205cf7e Kalle Valo             2022-11-28  10941  
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10942  	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10943  	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
d889913205cf7e Kalle Valo             2022-11-28  10944  
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10945  	wiphy->cipher_suites = cipher_suites;
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10946  	wiphy->n_cipher_suites = ARRAY_SIZE(cipher_suites);
d889913205cf7e Kalle Valo             2022-11-28  10947  
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10948  	wiphy->iftype_ext_capab = ath12k_iftypes_ext_capa;
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10949  	wiphy->num_iftype_ext_capab = ARRAY_SIZE(ath12k_iftypes_ext_capa);
d889913205cf7e Kalle Valo             2022-11-28  10950  
253ec89c9013b0 Karthikeyan Periyasamy 2024-06-13  10951  	wiphy->mbssid_max_interfaces = mbssid_max_interfaces;
519a545cfee790 Aloka Dixit            2024-05-08  10952  	wiphy->ema_max_profile_periodicity = TARGET_EMA_MAX_PROFILE_PERIOD;
519a545cfee790 Aloka Dixit            2024-05-08  10953  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10954  	if (is_6ghz) {
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10955  		wiphy_ext_feature_set(wiphy,
d889913205cf7e Kalle Valo             2022-11-28  10956  				      NL80211_EXT_FEATURE_FILS_DISCOVERY);
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10957  		wiphy_ext_feature_set(wiphy,
d889913205cf7e Kalle Valo             2022-11-28  10958  				      NL80211_EXT_FEATURE_UNSOL_BCAST_PROBE_RESP);
d889913205cf7e Kalle Valo             2022-11-28  10959  	}
d889913205cf7e Kalle Valo             2022-11-28  10960  
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10961  	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_PUNCT);
07c01b86f21dd4 Aloka Dixit            2023-08-02  10962  
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10963  	ath12k_reg_init(hw);
d889913205cf7e Kalle Valo             2022-11-28  10964  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10965  	if (!is_raw_mode) {
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10966  		hw->netdev_features = NETIF_F_HW_CSUM;
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10967  		ieee80211_hw_set(hw, SW_CRYPTO_CONTROL);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10968  		ieee80211_hw_set(hw, SUPPORT_FAST_XMIT);
d889913205cf7e Kalle Valo             2022-11-28  10969  	}
d889913205cf7e Kalle Valo             2022-11-28  10970  
16f474d6d49db5 Baochen Qiang          2024-06-04  10971  	if (test_bit(WMI_TLV_SERVICE_NLO, ar->wmi->wmi_ab->svc_map)) {
16f474d6d49db5 Baochen Qiang          2024-06-04  10972  		wiphy->max_sched_scan_ssids = WMI_PNO_MAX_SUPP_NETWORKS;
16f474d6d49db5 Baochen Qiang          2024-06-04  10973  		wiphy->max_match_sets = WMI_PNO_MAX_SUPP_NETWORKS;
16f474d6d49db5 Baochen Qiang          2024-06-04  10974  		wiphy->max_sched_scan_ie_len = WMI_PNO_MAX_IE_LENGTH;
16f474d6d49db5 Baochen Qiang          2024-06-04  10975  		wiphy->max_sched_scan_plans = WMI_PNO_MAX_SCHED_SCAN_PLANS;
16f474d6d49db5 Baochen Qiang          2024-06-04  10976  		wiphy->max_sched_scan_plan_interval =
16f474d6d49db5 Baochen Qiang          2024-06-04  10977  					WMI_PNO_MAX_SCHED_SCAN_PLAN_INT;
16f474d6d49db5 Baochen Qiang          2024-06-04  10978  		wiphy->max_sched_scan_plan_iterations =
16f474d6d49db5 Baochen Qiang          2024-06-04  10979  					WMI_PNO_MAX_SCHED_SCAN_PLAN_ITRNS;
16f474d6d49db5 Baochen Qiang          2024-06-04  10980  		wiphy->features |= NL80211_FEATURE_ND_RANDOM_MAC_ADDR;
16f474d6d49db5 Baochen Qiang          2024-06-04  10981  	}
16f474d6d49db5 Baochen Qiang          2024-06-04  10982  
4a3c212eee0e36 Baochen Qiang          2024-06-19  10983  	ret = ath12k_wow_init(ar);
4a3c212eee0e36 Baochen Qiang          2024-06-19  10984  	if (ret) {
4a3c212eee0e36 Baochen Qiang          2024-06-19  10985  		ath12k_warn(ar->ab, "failed to init wow: %d\n", ret);
8fea0066b4b481 Karthikeyan Periyasamy 2024-12-09  10986  		goto err_cleanup_if_combs;
4a3c212eee0e36 Baochen Qiang          2024-06-19  10987  	}
4a3c212eee0e36 Baochen Qiang          2024-06-19  10988  
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10989  	ret = ieee80211_register_hw(hw);
d889913205cf7e Kalle Valo             2022-11-28  10990  	if (ret) {
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10991  		ath12k_err(ab, "ieee80211 registration failed: %d\n", ret);
8fea0066b4b481 Karthikeyan Periyasamy 2024-12-09  10992  		goto err_cleanup_if_combs;
d889913205cf7e Kalle Valo             2022-11-28  10993  	}
d889913205cf7e Kalle Valo             2022-11-28  10994  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10995  	if (is_monitor_disable)
d889913205cf7e Kalle Valo             2022-11-28  10996  		/* There's a race between calling ieee80211_register_hw()
d889913205cf7e Kalle Valo             2022-11-28  10997  		 * and here where the monitor mode is enabled for a little
d889913205cf7e Kalle Valo             2022-11-28  10998  		 * while. But that time is so short and in practise it make
d889913205cf7e Kalle Valo             2022-11-28  10999  		 * a difference in real life.
d889913205cf7e Kalle Valo             2022-11-28  11000  		 */
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  11001  		wiphy->interface_modes &= ~BIT(NL80211_IFTYPE_MONITOR);
d889913205cf7e Kalle Valo             2022-11-28  11002  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  11003  	for_each_ar(ah, ar, i) {
d889913205cf7e Kalle Valo             2022-11-28  11004  		/* Apply the regd received during initialization */
d889913205cf7e Kalle Valo             2022-11-28  11005  		ret = ath12k_regd_update(ar, true);
d889913205cf7e Kalle Valo             2022-11-28  11006  		if (ret) {
d889913205cf7e Kalle Valo             2022-11-28  11007  			ath12k_err(ar->ab, "ath12k regd update failed: %d\n", ret);
d889913205cf7e Kalle Valo             2022-11-28  11008  			goto err_unregister_hw;
d889913205cf7e Kalle Valo             2022-11-28  11009  		}
d889913205cf7e Kalle Valo             2022-11-28  11010  
f8bde02a26b96f Ramasamy Kaliappan     2024-04-04  11011  		ath12k_debugfs_register(ar);
8dd65ccbdf91e2 Aditya Kumar Singh     2024-06-11  11012  	}
f8bde02a26b96f Ramasamy Kaliappan     2024-04-04  11013  
d889913205cf7e Kalle Valo             2022-11-28  11014  	return 0;
d889913205cf7e Kalle Valo             2022-11-28  11015  
d889913205cf7e Kalle Valo             2022-11-28  11016  err_unregister_hw:
4e1eff38d37a27 Aditya Kumar Singh     2024-06-11  11017  	for_each_ar(ah, ar, i)
4e1eff38d37a27 Aditya Kumar Singh     2024-06-11  11018  		ath12k_debugfs_unregister(ar);
4e1eff38d37a27 Aditya Kumar Singh     2024-06-11  11019  
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  11020  	ieee80211_unregister_hw(hw);
d889913205cf7e Kalle Valo             2022-11-28  11021  
8fea0066b4b481 Karthikeyan Periyasamy 2024-12-09  11022  err_cleanup_if_combs:
8fea0066b4b481 Karthikeyan Periyasamy 2024-12-09  11023  	ath12k_mac_cleanup_iface_combinations(ah);
d889913205cf7e Kalle Valo             2022-11-28  11024  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  11025  err_complete_cleanup_unregister:
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  11026  	i = ah->num_radio;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  11027  
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  11028  err_cleanup_unregister:
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  11029  	for (j = 0; j < i; j++) {
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  11030  		ar = ath12k_ah_to_ar(ah, j);
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  11031  		ath12k_mac_cleanup_unregister(ar);
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  11032  	}
d889913205cf7e Kalle Valo             2022-11-28  11033  
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  11034  	SET_IEEE80211_DEV(hw, NULL);
d889913205cf7e Kalle Valo             2022-11-28  11035  
d889913205cf7e Kalle Valo             2022-11-28  11036  	return ret;
d889913205cf7e Kalle Valo             2022-11-28  11037  }
d889913205cf7e Kalle Valo             2022-11-28  11038  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
