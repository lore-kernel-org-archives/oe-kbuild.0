Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C97143C69
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Oct 2024 06:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728456220; cv=none; b=DOVkCOExNIBJrTfcPebBgdGT4rRJiKTHfqYP8KwZdDAcvsArfEFIdVPdHmJ4zCK7jPooc8uykSKEJDgkokUeFVhJjJjJhpW0VR1xnQJf4ox4+v84NDloO80FMWQuROYMnTyBnHj34AzcyrFcLW86LFtAukYjh5E6KE/9DXok7rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728456220; c=relaxed/simple;
	bh=bYDcbtZO71rGHd8phBRLqSNoo3oJHZXjFwe2sNgkuDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tp+k9DNg4f3UdyddliChQkhNJuKijhoQlx5kwVGPhlop4uCXBTwl4S92uGznAkzMXlU5ji4yUlKwn21btZuSsVZDC90ubCekRrgLxyoUl0VE1r6O2oeKInpHUdGyRSbXwcdjIfBNOQB158JwvRo3srQqr8yjtYjOI919UahajLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1EiywW5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1EiywW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728456219; x=1759992219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bYDcbtZO71rGHd8phBRLqSNoo3oJHZXjFwe2sNgkuDw=;
  b=f1EiywW5FaAmu1Fqaqzbn6SS7CIR4n/o1R5JWXXjIfpJi85iXyibdUDw
   gZGzT2n4Qh1exSOu59bXxTnbozWevZgxHnzjsWK9iDLFhHAoXuEtAfIC3
   yX/7akFAm+vvEwJkUzGNBFDeWvLRuR7nNFEow2hdKLJptnIhYyv3qHegj
   Hbh+v+EK9VO0YW+eli4EsJf9BiFJcnWPZk1XwYQC7sXr1JcSoQeMTsPv4
   WOx6e8xGnvbbdt76UxmOpM0QTQUdm1t0SdZbH5ADx+2j7UA5pqswwyEHf
   6IjbJ/Ol6PplrGZk9f/ZZ4bLKfQX52d6tdxcG/zEDs0PDgquR4KnPRIbx
   g==;
X-CSE-ConnectionGUID: U6UDMSlLRDqUHWLWwh5rCQ==
X-CSE-MsgGUID: Babu8zpHQ9GkWhCWV6yObA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27856855"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="27856855"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 23:43:37 -0700
X-CSE-ConnectionGUID: xKrgwAvuTwO16eS6GCniDw==
X-CSE-MsgGUID: JQLeWJqBRDORlj7dN8KPGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="113631784"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Oct 2024 23:43:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syQQ0-0008sM-2L;
	Wed, 09 Oct 2024 06:43:32 +0000
Date: Wed, 9 Oct 2024 14:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ath:ath12k-mlo-qcn9274 69/81]
 drivers/net/wireless/ath/ath12k/mac.c:10744 ath12k_mac_hw_register() error:
 uninitialized symbol 'cap'.
Message-ID: <202410091406.hArg0HeY-lkp@intel.com>
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
CC: Jeff Johnson <jjohnson@kernel.org>
CC: Kalle Valo <kvalo@kernel.org>
CC: ath12k@lists.infradead.org
TO: Rameshkumar Sundaram <quic_ramess@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
head:   7435d14d41d5d479a5e6a8a2cd4efdac9d928823
commit: fffabfa458e189fe7aa4dc90a69f7e7365df4892 [69/81] wifi: ath12k: advertise MLO support and capabilities
:::::: branch date: 13 hours ago
:::::: commit date: 6 days ago
config: csky-randconfig-r072-20241008 (https://download.01.org/0day-ci/archive/20241009/202410091406.hArg0HeY-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410091406.hArg0HeY-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:10744 ath12k_mac_hw_register() error: uninitialized symbol 'cap'.

Old smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:1503 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'nontx->data' [r] (local cap)
drivers/net/wireless/ath/ath12k/mac.c:1491 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'elem->data' [r] (local cap)
drivers/net/wireless/ath/ath12k/mac.c:4682 ath12k_mac_op_set_key() error: uninitialized symbol 'ret'.
drivers/net/wireless/ath/ath12k/mac.c:5902 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:5904 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:11157 ath12k_mac_destroy() error: we previously assumed 'ab' could be null (see line 11146)
drivers/net/wireless/ath/ath12k/mac.c:11224 ath12k_mac_allocate() error: uninitialized symbol 'ab'.

vim +/cap +10744 drivers/net/wireless/ath/ath12k/mac.c

d889913205cf7e Kalle Valo             2022-11-28  10595  
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10596  static int ath12k_mac_hw_register(struct ath12k_hw *ah)
d889913205cf7e Kalle Valo             2022-11-28  10597  {
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10598  	struct ieee80211_hw *hw = ah->hw;
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10599  	struct wiphy *wiphy = hw->wiphy;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10600  	struct ath12k *ar = ath12k_ah_to_ar(ah, 0);
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10601  	struct ath12k_base *ab = ar->ab;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10602  	struct ath12k_pdev *pdev;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10603  	struct ath12k_pdev_cap *cap;
d889913205cf7e Kalle Valo             2022-11-28  10604  	static const u32 cipher_suites[] = {
d889913205cf7e Kalle Valo             2022-11-28  10605  		WLAN_CIPHER_SUITE_TKIP,
d889913205cf7e Kalle Valo             2022-11-28  10606  		WLAN_CIPHER_SUITE_CCMP,
d889913205cf7e Kalle Valo             2022-11-28  10607  		WLAN_CIPHER_SUITE_AES_CMAC,
d889913205cf7e Kalle Valo             2022-11-28  10608  		WLAN_CIPHER_SUITE_BIP_CMAC_256,
d889913205cf7e Kalle Valo             2022-11-28  10609  		WLAN_CIPHER_SUITE_BIP_GMAC_128,
d889913205cf7e Kalle Valo             2022-11-28  10610  		WLAN_CIPHER_SUITE_BIP_GMAC_256,
d889913205cf7e Kalle Valo             2022-11-28  10611  		WLAN_CIPHER_SUITE_GCMP,
d889913205cf7e Kalle Valo             2022-11-28  10612  		WLAN_CIPHER_SUITE_GCMP_256,
d889913205cf7e Kalle Valo             2022-11-28  10613  		WLAN_CIPHER_SUITE_CCMP_256,
d889913205cf7e Kalle Valo             2022-11-28  10614  	};
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10615  	int ret, i, j;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10616  	u32 ht_cap = U32_MAX, antennas_rx = 0, antennas_tx = 0;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10617  	bool is_6ghz = false, is_raw_mode = false, is_monitor_disable = false;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10618  	u8 *mac_addr = NULL;
253ec89c9013b0 Karthikeyan Periyasamy 2024-06-13  10619  	u8 mbssid_max_interfaces = 0;
d889913205cf7e Kalle Valo             2022-11-28  10620  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10621  	wiphy->max_ap_assoc_sta = 0;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10622  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10623  	for_each_ar(ah, ar, i) {
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10624  		u32 ht_cap_info = 0;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10625  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10626  		pdev = ar->pdev;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10627  		if (ar->ab->pdevs_macaddr_valid) {
d786c9f5fe3472 Karthikeyan Periyasamy 2024-01-14  10628  			ether_addr_copy(ar->mac_addr, pdev->mac_addr);
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10629  		} else {
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10630  			ether_addr_copy(ar->mac_addr, ar->ab->mac_addr);
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10631  			ar->mac_addr[4] += ar->pdev_idx;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10632  		}
d889913205cf7e Kalle Valo             2022-11-28  10633  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10634  		ret = ath12k_mac_setup_register(ar, &ht_cap_info, hw->wiphy->bands);
d889913205cf7e Kalle Valo             2022-11-28  10635  		if (ret)
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10636  			goto err_cleanup_unregister;
d889913205cf7e Kalle Valo             2022-11-28  10637  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10638  		ht_cap &= ht_cap_info;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10639  		wiphy->max_ap_assoc_sta += ar->max_num_stations;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10640  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10641  		/* Advertise the max antenna support of all radios, driver can handle
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10642  		 * per pdev specific antenna setting based on pdev cap when antenna
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10643  		 * changes are made
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10644  		 */
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10645  		cap = &pdev->cap;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10646  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10647  		antennas_rx = max_t(u32, antennas_rx, cap->rx_chain_mask);
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10648  		antennas_tx = max_t(u32, antennas_tx, cap->tx_chain_mask);
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10649  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10650  		if (ar->supports_6ghz)
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10651  			is_6ghz = true;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10652  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10653  		if (test_bit(ATH12K_FLAG_RAW_MODE, &ar->ab->dev_flags))
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10654  			is_raw_mode = true;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10655  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10656  		if (!ar->ab->hw_params->supports_monitor)
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10657  			is_monitor_disable = true;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10658  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10659  		if (i == 0)
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10660  			mac_addr = ar->mac_addr;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10661  		else
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10662  			mac_addr = ab->mac_addr;
253ec89c9013b0 Karthikeyan Periyasamy 2024-06-13  10663  
253ec89c9013b0 Karthikeyan Periyasamy 2024-06-13  10664  		mbssid_max_interfaces += TARGET_NUM_VDEVS;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10665  	}
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10666  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10667  	wiphy->available_antennas_rx = antennas_rx;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10668  	wiphy->available_antennas_tx = antennas_tx;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10669  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10670  	SET_IEEE80211_PERM_ADDR(hw, mac_addr);
d786c9f5fe3472 Karthikeyan Periyasamy 2024-01-14  10671  	SET_IEEE80211_DEV(hw, ab->dev);
d889913205cf7e Kalle Valo             2022-11-28  10672  
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10673  	ret = ath12k_mac_setup_iface_combinations(ah);
d889913205cf7e Kalle Valo             2022-11-28  10674  	if (ret) {
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10675  		ath12k_err(ab, "failed to setup interface combinations: %d\n", ret);
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10676  		goto err_complete_cleanup_unregister;
d889913205cf7e Kalle Valo             2022-11-28  10677  	}
d889913205cf7e Kalle Valo             2022-11-28  10678  
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10679  	wiphy->interface_modes = ath12k_mac_get_ifmodes(ah);
d889913205cf7e Kalle Valo             2022-11-28  10680  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10681  	if (ah->num_radio == 1 &&
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10682  	    wiphy->bands[NL80211_BAND_2GHZ] &&
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10683  	    wiphy->bands[NL80211_BAND_5GHZ] &&
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10684  	    wiphy->bands[NL80211_BAND_6GHZ])
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10685  		ieee80211_hw_set(hw, SINGLE_SCAN_ON_ALL_BANDS);
a1e09eb35476d6 Wen Gong               2023-09-13  10686  
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10687  	ieee80211_hw_set(hw, SIGNAL_DBM);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10688  	ieee80211_hw_set(hw, SUPPORTS_PS);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10689  	ieee80211_hw_set(hw, SUPPORTS_DYNAMIC_PS);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10690  	ieee80211_hw_set(hw, MFP_CAPABLE);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10691  	ieee80211_hw_set(hw, REPORTS_TX_ACK_STATUS);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10692  	ieee80211_hw_set(hw, HAS_RATE_CONTROL);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10693  	ieee80211_hw_set(hw, AP_LINK_PS);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10694  	ieee80211_hw_set(hw, SPECTRUM_MGMT);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10695  	ieee80211_hw_set(hw, CONNECTION_MONITOR);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10696  	ieee80211_hw_set(hw, SUPPORTS_PER_STA_GTK);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10697  	ieee80211_hw_set(hw, CHANCTX_STA_CSA);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10698  	ieee80211_hw_set(hw, QUEUE_CONTROL);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10699  	ieee80211_hw_set(hw, SUPPORTS_TX_FRAG);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10700  	ieee80211_hw_set(hw, REPORTS_LOW_ACK);
d889913205cf7e Kalle Valo             2022-11-28  10701  
112dbc6af80702 Pradeep Kumar Chitrapu 2024-05-08  10702  	if ((ht_cap & WMI_HT_CAP_ENABLED) || ar->supports_6ghz) {
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10703  		ieee80211_hw_set(hw, AMPDU_AGGREGATION);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10704  		ieee80211_hw_set(hw, TX_AMPDU_SETUP_IN_HW);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10705  		ieee80211_hw_set(hw, SUPPORTS_REORDERING_BUFFER);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10706  		ieee80211_hw_set(hw, SUPPORTS_AMSDU_IN_AMPDU);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10707  		ieee80211_hw_set(hw, USES_RSS);
d889913205cf7e Kalle Valo             2022-11-28  10708  	}
d889913205cf7e Kalle Valo             2022-11-28  10709  
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10710  	wiphy->features |= NL80211_FEATURE_STATIC_SMPS;
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10711  	wiphy->flags |= WIPHY_FLAG_IBSS_RSN;
d889913205cf7e Kalle Valo             2022-11-28  10712  
d889913205cf7e Kalle Valo             2022-11-28  10713  	/* TODO: Check if HT capability advertised from firmware is different
d889913205cf7e Kalle Valo             2022-11-28  10714  	 * for each band for a dual band capable radio. It will be tricky to
d889913205cf7e Kalle Valo             2022-11-28  10715  	 * handle it when the ht capability different for each band.
d889913205cf7e Kalle Valo             2022-11-28  10716  	 */
97b7cbb7a3cbee Pradeep Kumar Chitrapu 2024-05-08  10717  	if (ht_cap & WMI_HT_CAP_DYNAMIC_SMPS ||
97b7cbb7a3cbee Pradeep Kumar Chitrapu 2024-05-08  10718  	    (ar->supports_6ghz && ab->hw_params->supports_dynamic_smps_6ghz))
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10719  		wiphy->features |= NL80211_FEATURE_DYNAMIC_SMPS;
d889913205cf7e Kalle Valo             2022-11-28  10720  
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10721  	wiphy->max_scan_ssids = WLAN_SCAN_PARAMS_MAX_SSID;
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10722  	wiphy->max_scan_ie_len = WLAN_SCAN_PARAMS_MAX_IE_LEN;
d889913205cf7e Kalle Valo             2022-11-28  10723  
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10724  	hw->max_listen_interval = ATH12K_MAX_HW_LISTEN_INTERVAL;
d889913205cf7e Kalle Valo             2022-11-28  10725  
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10726  	wiphy->flags |= WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL;
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10727  	wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH;
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10728  	wiphy->max_remain_on_channel_duration = 5000;
d889913205cf7e Kalle Valo             2022-11-28  10729  
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10730  	wiphy->flags |= WIPHY_FLAG_AP_UAPSD;
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10731  	wiphy->features |= NL80211_FEATURE_AP_MODE_CHAN_WIDTH_CHANGE |
d889913205cf7e Kalle Valo             2022-11-28  10732  				   NL80211_FEATURE_AP_SCAN;
d889913205cf7e Kalle Valo             2022-11-28  10733  
03a509740b5d29 Kalle Valo             2024-04-11  10734  	/* MLO is not yet supported so disable Wireless Extensions for now
03a509740b5d29 Kalle Valo             2024-04-11  10735  	 * to make sure ath12k users don't use it. This flag can be removed
03a509740b5d29 Kalle Valo             2024-04-11  10736  	 * once WIPHY_FLAG_SUPPORTS_MLO is enabled.
03a509740b5d29 Kalle Valo             2024-04-11  10737  	 */
03a509740b5d29 Kalle Valo             2024-04-11  10738  	wiphy->flags |= WIPHY_FLAG_DISABLE_WEXT;
03a509740b5d29 Kalle Valo             2024-04-11  10739  
fffabfa458e189 Rameshkumar Sundaram   2024-09-27  10740  	/* Copy over MLO related capabilities received from
fffabfa458e189 Rameshkumar Sundaram   2024-09-27  10741  	 * WMI_SERVICE_READY_EXT2_EVENT if single_chip_mlo_supp is set.
fffabfa458e189 Rameshkumar Sundaram   2024-09-27  10742  	 */
fffabfa458e189 Rameshkumar Sundaram   2024-09-27  10743  	if (ab->ag->mlo_capable) {
fffabfa458e189 Rameshkumar Sundaram   2024-09-27 @10744  		ath12k_iftypes_ext_capa[2].eml_capabilities = cap->eml_cap;
fffabfa458e189 Rameshkumar Sundaram   2024-09-27  10745  		ath12k_iftypes_ext_capa[2].mld_capa_and_ops = cap->mld_cap;
fffabfa458e189 Rameshkumar Sundaram   2024-09-27  10746  		wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO;
fffabfa458e189 Rameshkumar Sundaram   2024-09-27  10747  	}
fffabfa458e189 Rameshkumar Sundaram   2024-09-27  10748  
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10749  	hw->queues = ATH12K_HW_MAX_QUEUES;
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10750  	wiphy->tx_queue_len = ATH12K_QUEUE_LEN;
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10751  	hw->offchannel_tx_hw_queue = ATH12K_HW_MAX_QUEUES - 1;
b0970f50839ecb Baochen Qiang          2024-01-17  10752  	hw->max_rx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF_EHT;
d889913205cf7e Kalle Valo             2022-11-28  10753  
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10754  	hw->vif_data_size = sizeof(struct ath12k_vif);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10755  	hw->sta_data_size = sizeof(struct ath12k_sta);
38055789d15155 Baochen Qiang          2024-08-01  10756  	hw->extra_tx_headroom = ab->hw_params->iova_mask;
d889913205cf7e Kalle Valo             2022-11-28  10757  
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10758  	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10759  	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
d889913205cf7e Kalle Valo             2022-11-28  10760  
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10761  	wiphy->cipher_suites = cipher_suites;
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10762  	wiphy->n_cipher_suites = ARRAY_SIZE(cipher_suites);
d889913205cf7e Kalle Valo             2022-11-28  10763  
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10764  	wiphy->iftype_ext_capab = ath12k_iftypes_ext_capa;
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10765  	wiphy->num_iftype_ext_capab = ARRAY_SIZE(ath12k_iftypes_ext_capa);
d889913205cf7e Kalle Valo             2022-11-28  10766  
253ec89c9013b0 Karthikeyan Periyasamy 2024-06-13  10767  	wiphy->mbssid_max_interfaces = mbssid_max_interfaces;
519a545cfee790 Aloka Dixit            2024-05-08  10768  	wiphy->ema_max_profile_periodicity = TARGET_EMA_MAX_PROFILE_PERIOD;
519a545cfee790 Aloka Dixit            2024-05-08  10769  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10770  	if (is_6ghz) {
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10771  		wiphy_ext_feature_set(wiphy,
d889913205cf7e Kalle Valo             2022-11-28  10772  				      NL80211_EXT_FEATURE_FILS_DISCOVERY);
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10773  		wiphy_ext_feature_set(wiphy,
d889913205cf7e Kalle Valo             2022-11-28  10774  				      NL80211_EXT_FEATURE_UNSOL_BCAST_PROBE_RESP);
d889913205cf7e Kalle Valo             2022-11-28  10775  	}
d889913205cf7e Kalle Valo             2022-11-28  10776  
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10777  	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_PUNCT);
07c01b86f21dd4 Aloka Dixit            2023-08-02  10778  
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10779  	ath12k_reg_init(hw);
d889913205cf7e Kalle Valo             2022-11-28  10780  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10781  	if (!is_raw_mode) {
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10782  		hw->netdev_features = NETIF_F_HW_CSUM;
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10783  		ieee80211_hw_set(hw, SW_CRYPTO_CONTROL);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10784  		ieee80211_hw_set(hw, SUPPORT_FAST_XMIT);
d889913205cf7e Kalle Valo             2022-11-28  10785  	}
d889913205cf7e Kalle Valo             2022-11-28  10786  
16f474d6d49db5 Baochen Qiang          2024-06-04  10787  	if (test_bit(WMI_TLV_SERVICE_NLO, ar->wmi->wmi_ab->svc_map)) {
16f474d6d49db5 Baochen Qiang          2024-06-04  10788  		wiphy->max_sched_scan_ssids = WMI_PNO_MAX_SUPP_NETWORKS;
16f474d6d49db5 Baochen Qiang          2024-06-04  10789  		wiphy->max_match_sets = WMI_PNO_MAX_SUPP_NETWORKS;
16f474d6d49db5 Baochen Qiang          2024-06-04  10790  		wiphy->max_sched_scan_ie_len = WMI_PNO_MAX_IE_LENGTH;
16f474d6d49db5 Baochen Qiang          2024-06-04  10791  		wiphy->max_sched_scan_plans = WMI_PNO_MAX_SCHED_SCAN_PLANS;
16f474d6d49db5 Baochen Qiang          2024-06-04  10792  		wiphy->max_sched_scan_plan_interval =
16f474d6d49db5 Baochen Qiang          2024-06-04  10793  					WMI_PNO_MAX_SCHED_SCAN_PLAN_INT;
16f474d6d49db5 Baochen Qiang          2024-06-04  10794  		wiphy->max_sched_scan_plan_iterations =
16f474d6d49db5 Baochen Qiang          2024-06-04  10795  					WMI_PNO_MAX_SCHED_SCAN_PLAN_ITRNS;
16f474d6d49db5 Baochen Qiang          2024-06-04  10796  		wiphy->features |= NL80211_FEATURE_ND_RANDOM_MAC_ADDR;
16f474d6d49db5 Baochen Qiang          2024-06-04  10797  	}
16f474d6d49db5 Baochen Qiang          2024-06-04  10798  
4a3c212eee0e36 Baochen Qiang          2024-06-19  10799  	ret = ath12k_wow_init(ar);
4a3c212eee0e36 Baochen Qiang          2024-06-19  10800  	if (ret) {
4a3c212eee0e36 Baochen Qiang          2024-06-19  10801  		ath12k_warn(ar->ab, "failed to init wow: %d\n", ret);
7ddd182f4f35cc Karthikeyan Periyasamy 2024-03-27  10802  		goto err_cleanup_if_combs;
4a3c212eee0e36 Baochen Qiang          2024-06-19  10803  	}
4a3c212eee0e36 Baochen Qiang          2024-06-19  10804  
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10805  	ret = ieee80211_register_hw(hw);
d889913205cf7e Kalle Valo             2022-11-28  10806  	if (ret) {
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10807  		ath12k_err(ab, "ieee80211 registration failed: %d\n", ret);
7ddd182f4f35cc Karthikeyan Periyasamy 2024-03-27  10808  		goto err_cleanup_if_combs;
d889913205cf7e Kalle Valo             2022-11-28  10809  	}
d889913205cf7e Kalle Valo             2022-11-28  10810  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10811  	if (is_monitor_disable)
d889913205cf7e Kalle Valo             2022-11-28  10812  		/* There's a race between calling ieee80211_register_hw()
d889913205cf7e Kalle Valo             2022-11-28  10813  		 * and here where the monitor mode is enabled for a little
d889913205cf7e Kalle Valo             2022-11-28  10814  		 * while. But that time is so short and in practise it make
d889913205cf7e Kalle Valo             2022-11-28  10815  		 * a difference in real life.
d889913205cf7e Kalle Valo             2022-11-28  10816  		 */
c8a5f34ad81174 Karthikeyan Periyasamy 2023-12-01  10817  		wiphy->interface_modes &= ~BIT(NL80211_IFTYPE_MONITOR);
d889913205cf7e Kalle Valo             2022-11-28  10818  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10819  	for_each_ar(ah, ar, i) {
d889913205cf7e Kalle Valo             2022-11-28  10820  		/* Apply the regd received during initialization */
d889913205cf7e Kalle Valo             2022-11-28  10821  		ret = ath12k_regd_update(ar, true);
d889913205cf7e Kalle Valo             2022-11-28  10822  		if (ret) {
d889913205cf7e Kalle Valo             2022-11-28  10823  			ath12k_err(ar->ab, "ath12k regd update failed: %d\n", ret);
d889913205cf7e Kalle Valo             2022-11-28  10824  			goto err_unregister_hw;
d889913205cf7e Kalle Valo             2022-11-28  10825  		}
d889913205cf7e Kalle Valo             2022-11-28  10826  
f8bde02a26b96f Ramasamy Kaliappan     2024-04-04  10827  		ath12k_debugfs_register(ar);
8dd65ccbdf91e2 Aditya Kumar Singh     2024-06-11  10828  	}
f8bde02a26b96f Ramasamy Kaliappan     2024-04-04  10829  
d889913205cf7e Kalle Valo             2022-11-28  10830  	return 0;
d889913205cf7e Kalle Valo             2022-11-28  10831  
d889913205cf7e Kalle Valo             2022-11-28  10832  err_unregister_hw:
4e1eff38d37a27 Aditya Kumar Singh     2024-06-11  10833  	for_each_ar(ah, ar, i)
4e1eff38d37a27 Aditya Kumar Singh     2024-06-11  10834  		ath12k_debugfs_unregister(ar);
4e1eff38d37a27 Aditya Kumar Singh     2024-06-11  10835  
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10836  	ieee80211_unregister_hw(hw);
d889913205cf7e Kalle Valo             2022-11-28  10837  
7ddd182f4f35cc Karthikeyan Periyasamy 2024-03-27  10838  err_cleanup_if_combs:
7ddd182f4f35cc Karthikeyan Periyasamy 2024-03-27  10839  	ath12k_mac_cleanup_iface_combinations(ah);
d889913205cf7e Kalle Valo             2022-11-28  10840  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10841  err_complete_cleanup_unregister:
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10842  	i = ah->num_radio;
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10843  
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10844  err_cleanup_unregister:
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10845  	for (j = 0; j < i; j++) {
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10846  		ar = ath12k_ah_to_ar(ah, j);
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  10847  		ath12k_mac_cleanup_unregister(ar);
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  10848  	}
d889913205cf7e Kalle Valo             2022-11-28  10849  
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  10850  	SET_IEEE80211_DEV(hw, NULL);
d889913205cf7e Kalle Valo             2022-11-28  10851  
d889913205cf7e Kalle Valo             2022-11-28  10852  	return ret;
d889913205cf7e Kalle Valo             2022-11-28  10853  }
d889913205cf7e Kalle Valo             2022-11-28  10854  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
