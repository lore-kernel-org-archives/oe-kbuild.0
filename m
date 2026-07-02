Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D72541229E
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 08:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782980105; cv=none; b=hfTkw3PdXZhU9Dyykla8M/LGURznZzrL/U5pRU7xnms/LEN65EUHtj68qU0S8aI/odgFtyiisftPfZ7ps7AMC7ZJhiSIY5IK7Vq5Y5ffC12GriTn5Wnw9+CcJOxssYSNcSyCXeqJeFf82FXGq9FAMIGJE81+ntnQdki7Vd8+vq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782980105; c=relaxed/simple;
	bh=HBJrjFUwe6M5ZwUak40IOaqwJZUuiU2Dzked/R2q9hU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=el8mm44D9SnxLT2S/MRmiqmYyZaCIlIFs7Joj9nHXHnufvGzhpB5y8mNM7QeufGD4UJTW3/a25v4pIiqvlW9pF353at53K+fojnQx/Nlf/FVybwDUsaTjPw+BGweUjklqxS11kM8vPEpP3Zi3kJy1T9nLuSUaA+y+py0Ru0iu6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6hMZSKD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6hMZSKD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782980103; x=1814516103;
  h=date:from:to:cc:subject:message-id;
  bh=HBJrjFUwe6M5ZwUak40IOaqwJZUuiU2Dzked/R2q9hU=;
  b=a6hMZSKDV+ldCJVOmaJL1XcK7dvppDCJn8SxkMsu3j8HBaodJ9rqbQJ6
   zZFUUW279btgNq4riyD9ReA597x/cCqag+0S3I/Hsm3XhlgOFoveiJzgQ
   LFU4iTsrPRp7wyCyXympkpWXf0pyKE9zgynH9ZpAB24vG7WdBnKrcmBpR
   rYDx02pf5ry/XRSiKFrjE2Y2RPrMIOncBBl7d65AF6eGORMOdfF29D/2f
   AzeU/ivjcK8SNf1gqBhsfLcVR7FvYGdI1WcEKE9wwJ/ngnyuXknVCB1qX
   R0o5B9c/khqQIomzyQG4Qm751NE8M4s5kKk+kJ6E6TB0sk1yiNpeIBJ4k
   g==;
X-CSE-ConnectionGUID: dxE40mheRI6Po1gw18z/5g==
X-CSE-MsgGUID: 2XaZ4AJiTouLYTqdofKVgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="109274767"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="109274767"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 01:15:02 -0700
X-CSE-ConnectionGUID: SEGHLxWUT7OF+u2u2BZ4sw==
X-CSE-MsgGUID: Vln9ODpGRMy/qVq3tUCPfg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Jul 2026 01:15:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfCZW-00000000AWT-2QMC;
	Thu, 02 Jul 2026 08:14:58 +0000
Date: Thu, 02 Jul 2026 16:14:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/mac80211/cfg.c:2250 sta_link_apply_parameters() error:
 we previously assumed 'sband' could be null (see line 2206)
Message-ID: <202607021621.civqm7Gg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a50a141f05a8d1737661b19ee22ff8455b94409
commit: 27e9b326b67440b559517977e19682461a50da2c wifi: mac80211: support NAN stations
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260702/202607021621.civqm7Gg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 27e9b326b674 ("wifi: mac80211: support NAN stations")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607021621.civqm7Gg-lkp@intel.com/

smatch warnings:
net/mac80211/cfg.c:2250 sta_link_apply_parameters() error: we previously assumed 'sband' could be null (see line 2206)

vim +/sband +2250 net/mac80211/cfg.c

03ecd745dde181 Johannes Berg   2024-06-05  2074  
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2075  static int sta_link_apply_parameters(struct ieee80211_local *local,
03ecd745dde181 Johannes Berg   2024-06-05  2076  				     struct sta_info *sta,
03ecd745dde181 Johannes Berg   2024-06-05  2077  				     enum sta_link_apply_mode mode,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2078  				     struct link_station_parameters *params)
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2079  {
27e9b326b67440 Miri Korenblit  2026-03-26  2080  	struct ieee80211_supported_band *sband = NULL;
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2081  	struct ieee80211_sub_if_data *sdata = sta->sdata;
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2082  	u32 link_id = params->link_id < 0 ? 0 : params->link_id;
d8675a63518c61 Johannes Berg   2022-06-17  2083  	struct ieee80211_link_data *link =
d8675a63518c61 Johannes Berg   2022-06-17  2084  		sdata_dereference(sdata->link[link_id], sdata);
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2085  	struct link_sta_info *link_sta =
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2086  		rcu_dereference_protected(sta->link[link_id],
4d3acf4311a040 Johannes Berg   2023-08-28  2087  					  lockdep_is_held(&local->hw.wiphy->mtx));
27e9b326b67440 Miri Korenblit  2026-03-26  2088  	const struct ieee80211_sta_ht_cap *own_ht_cap;
27e9b326b67440 Miri Korenblit  2026-03-26  2089  	const struct ieee80211_sta_vht_cap *own_vht_cap;
27e9b326b67440 Miri Korenblit  2026-03-26  2090  	const struct ieee80211_sta_he_cap *own_he_cap;
03ecd745dde181 Johannes Berg   2024-06-05  2091  	bool changes = params->link_mac ||
03ecd745dde181 Johannes Berg   2024-06-05  2092  		       params->txpwr_set ||
03ecd745dde181 Johannes Berg   2024-06-05  2093  		       params->supported_rates_len ||
03ecd745dde181 Johannes Berg   2024-06-05  2094  		       params->ht_capa ||
03ecd745dde181 Johannes Berg   2024-06-05  2095  		       params->vht_capa ||
03ecd745dde181 Johannes Berg   2024-06-05  2096  		       params->he_capa ||
03ecd745dde181 Johannes Berg   2024-06-05  2097  		       params->eht_capa ||
a1085114715ee9 Johannes Berg   2026-01-30  2098  		       params->uhr_capa ||
037dc18ac3fb8f Lachlan Hodges  2025-06-17  2099  		       params->s1g_capa ||
03ecd745dde181 Johannes Berg   2024-06-05  2100  		       params->opmode_notif_used;
03ecd745dde181 Johannes Berg   2024-06-05  2101  
03ecd745dde181 Johannes Berg   2024-06-05  2102  	switch (mode) {
03ecd745dde181 Johannes Berg   2024-06-05  2103  	case STA_LINK_MODE_NEW:
03ecd745dde181 Johannes Berg   2024-06-05  2104  		if (!params->link_mac)
03ecd745dde181 Johannes Berg   2024-06-05  2105  			return -EINVAL;
03ecd745dde181 Johannes Berg   2024-06-05  2106  		break;
03ecd745dde181 Johannes Berg   2024-06-05  2107  	case STA_LINK_MODE_LINK_MODIFY:
03ecd745dde181 Johannes Berg   2024-06-05  2108  		break;
03ecd745dde181 Johannes Berg   2024-06-05  2109  	case STA_LINK_MODE_STA_MODIFY:
03ecd745dde181 Johannes Berg   2024-06-05  2110  		if (params->link_id >= 0)
03ecd745dde181 Johannes Berg   2024-06-05  2111  			break;
03ecd745dde181 Johannes Berg   2024-06-05  2112  		if (!changes)
b303835dabe034 Johannes Berg   2022-07-23  2113  			return 0;
03ecd745dde181 Johannes Berg   2024-06-05  2114  		break;
03ecd745dde181 Johannes Berg   2024-06-05  2115  	}
b303835dabe034 Johannes Berg   2022-07-23  2116  
d8675a63518c61 Johannes Berg   2022-06-17  2117  	if (!link || !link_sta)
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2118  		return -EINVAL;
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2119  
27e9b326b67440 Miri Korenblit  2026-03-26  2120  	/*
27e9b326b67440 Miri Korenblit  2026-03-26  2121  	 * We should not have any changes in NDI station, its capabilities are
27e9b326b67440 Miri Korenblit  2026-03-26  2122  	 * copied from the NMI sta
27e9b326b67440 Miri Korenblit  2026-03-26  2123  	 */
27e9b326b67440 Miri Korenblit  2026-03-26  2124  	if (WARN_ON(sdata->vif.type == NL80211_IFTYPE_NAN_DATA))
27e9b326b67440 Miri Korenblit  2026-03-26  2125  		return -EINVAL;
27e9b326b67440 Miri Korenblit  2026-03-26  2126  
27e9b326b67440 Miri Korenblit  2026-03-26  2127  	if (sdata->vif.type == NL80211_IFTYPE_NAN) {
27e9b326b67440 Miri Korenblit  2026-03-26  2128  		own_ht_cap = &local->hw.wiphy->nan_capa.phy.ht;
27e9b326b67440 Miri Korenblit  2026-03-26  2129  		own_vht_cap = &local->hw.wiphy->nan_capa.phy.vht;
27e9b326b67440 Miri Korenblit  2026-03-26  2130  		own_he_cap = &local->hw.wiphy->nan_capa.phy.he;
27e9b326b67440 Miri Korenblit  2026-03-26  2131  	} else {
d8675a63518c61 Johannes Berg   2022-06-17  2132  		sband = ieee80211_get_link_sband(link);
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2133  		if (!sband)
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2134  			return -EINVAL;
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2135  
27e9b326b67440 Miri Korenblit  2026-03-26  2136  		own_ht_cap = &sband->ht_cap;
27e9b326b67440 Miri Korenblit  2026-03-26  2137  		own_vht_cap = &sband->vht_cap;
27e9b326b67440 Miri Korenblit  2026-03-26  2138  		own_he_cap = ieee80211_get_he_iftype_cap_vif(sband, &sdata->vif);
27e9b326b67440 Miri Korenblit  2026-03-26  2139  	}
27e9b326b67440 Miri Korenblit  2026-03-26  2140  
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2141  	if (params->link_mac) {
03ecd745dde181 Johannes Berg   2024-06-05  2142  		if (mode == STA_LINK_MODE_NEW) {
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2143  			memcpy(link_sta->addr, params->link_mac, ETH_ALEN);
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2144  			memcpy(link_sta->pub->addr, params->link_mac, ETH_ALEN);
9aebce6c97bfd7 Johannes Berg   2022-07-18  2145  		} else if (!ether_addr_equal(link_sta->addr,
9aebce6c97bfd7 Johannes Berg   2022-07-18  2146  					     params->link_mac)) {
9aebce6c97bfd7 Johannes Berg   2022-07-18  2147  			return -EINVAL;
9aebce6c97bfd7 Johannes Berg   2022-07-18  2148  		}
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2149  	}
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2150  
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2151  	if (params->txpwr_set) {
642508a42f74d7 Johannes Berg   2024-06-05  2152  		int ret;
642508a42f74d7 Johannes Berg   2024-06-05  2153  
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2154  		link_sta->pub->txpwr.type = params->txpwr.type;
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2155  		if (params->txpwr.type == NL80211_TX_POWER_LIMITED)
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2156  			link_sta->pub->txpwr.power = params->txpwr.power;
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2157  		ret = drv_sta_set_txpwr(local, sdata, sta);
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2158  		if (ret)
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2159  			return ret;
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2160  	}
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2161  
27e9b326b67440 Miri Korenblit  2026-03-26  2162  	if (sdata->vif.type == NL80211_IFTYPE_NAN) {
27e9b326b67440 Miri Korenblit  2026-03-26  2163  		static const u8 all_ofdm_rates[] = {
27e9b326b67440 Miri Korenblit  2026-03-26  2164  			0x0c, 0x12, 0x18, 0x24, 0x30, 0x48, 0x60, 0x6c
27e9b326b67440 Miri Korenblit  2026-03-26  2165  		};
27e9b326b67440 Miri Korenblit  2026-03-26  2166  
27e9b326b67440 Miri Korenblit  2026-03-26  2167  		/* Set the same supported_rates for all bands */
27e9b326b67440 Miri Korenblit  2026-03-26  2168  		for (int i = 0; i < NUM_NL80211_BANDS; i++) {
27e9b326b67440 Miri Korenblit  2026-03-26  2169  			struct ieee80211_supported_band *tmp =
27e9b326b67440 Miri Korenblit  2026-03-26  2170  				sdata->local->hw.wiphy->bands[i];
27e9b326b67440 Miri Korenblit  2026-03-26  2171  
27e9b326b67440 Miri Korenblit  2026-03-26  2172  			if ((i != NL80211_BAND_2GHZ && i != NL80211_BAND_5GHZ) ||
27e9b326b67440 Miri Korenblit  2026-03-26  2173  			    !tmp)
27e9b326b67440 Miri Korenblit  2026-03-26  2174  				continue;
27e9b326b67440 Miri Korenblit  2026-03-26  2175  
27e9b326b67440 Miri Korenblit  2026-03-26  2176  			if (!ieee80211_parse_bitrates(tmp, all_ofdm_rates,
27e9b326b67440 Miri Korenblit  2026-03-26  2177  						      sizeof(all_ofdm_rates),
27e9b326b67440 Miri Korenblit  2026-03-26  2178  						      &link_sta->pub->supp_rates[i]))
27e9b326b67440 Miri Korenblit  2026-03-26  2179  				return -EINVAL;
27e9b326b67440 Miri Korenblit  2026-03-26  2180  		}
27e9b326b67440 Miri Korenblit  2026-03-26  2181  	}
27e9b326b67440 Miri Korenblit  2026-03-26  2182  
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2183  	if (params->supported_rates &&
16ee3ea8faef8f Mikhail Lobanov 2025-03-17  2184  	    params->supported_rates_len &&
46e7ced3ef5b56 Miri Korenblit  2026-01-08  2185  	    !ieee80211_parse_bitrates(sband, params->supported_rates,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2186  				      params->supported_rates_len,
16ee3ea8faef8f Mikhail Lobanov 2025-03-17  2187  				      &link_sta->pub->supp_rates[sband->band]))
16ee3ea8faef8f Mikhail Lobanov 2025-03-17  2188  		return -EINVAL;
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2189  
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2190  	if (params->ht_capa)
27e9b326b67440 Miri Korenblit  2026-03-26  2191  		ieee80211_ht_cap_ie_to_sta_ht_cap(sdata, own_ht_cap,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2192  						  params->ht_capa, link_sta);
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2193  
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2194  	/* VHT can override some HT caps such as the A-MSDU max length */
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2195  	if (params->vht_capa)
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2196  		ieee80211_vht_cap_ie_to_sta_vht_cap(sdata, sband,
27e9b326b67440 Miri Korenblit  2026-03-26  2197  						    own_vht_cap,
084cf2aeca9756 Johannes Berg   2023-09-18  2198  						    params->vht_capa, NULL,
084cf2aeca9756 Johannes Berg   2023-09-18  2199  						    link_sta);
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2200  
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2201  	if (params->he_capa)
27e9b326b67440 Miri Korenblit  2026-03-26  2202  		_ieee80211_he_cap_ie_to_sta_he_cap(sdata,
27e9b326b67440 Miri Korenblit  2026-03-26  2203  						   own_he_cap,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2204  						   (void *)params->he_capa,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2205  						   params->he_capa_len,
27e9b326b67440 Miri Korenblit  2026-03-26 @2206  						   (sband && sband->band == NL80211_BAND_6GHZ) ?
27e9b326b67440 Miri Korenblit  2026-03-26  2207  						   (void *)params->he_6ghz_capa : NULL,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2208  						   link_sta);
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2209  
e8edb34640eeee Johannes Berg   2023-03-01  2210  	if (params->he_capa && params->eht_capa)
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2211  		ieee80211_eht_cap_ie_to_sta_eht_cap(sdata, sband,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2212  						    (u8 *)params->he_capa,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2213  						    params->he_capa_len,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2214  						    params->eht_capa,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2215  						    params->eht_capa_len,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2216  						    link_sta);
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2217  
a1085114715ee9 Johannes Berg   2026-01-30  2218  	if (params->uhr_capa)
a1085114715ee9 Johannes Berg   2026-01-30  2219  		ieee80211_uhr_cap_ie_to_sta_uhr_cap(sdata, sband,
a1085114715ee9 Johannes Berg   2026-01-30  2220  						    params->uhr_capa,
a1085114715ee9 Johannes Berg   2026-01-30  2221  						    params->uhr_capa_len,
a1085114715ee9 Johannes Berg   2026-01-30  2222  						    link_sta);
a1085114715ee9 Johannes Berg   2026-01-30  2223  
037dc18ac3fb8f Lachlan Hodges  2025-06-17  2224  	if (params->s1g_capa)
037dc18ac3fb8f Lachlan Hodges  2025-06-17  2225  		ieee80211_s1g_cap_to_sta_s1g_cap(sdata, params->s1g_capa,
037dc18ac3fb8f Lachlan Hodges  2025-06-17  2226  						 link_sta);
037dc18ac3fb8f Lachlan Hodges  2025-06-17  2227  
819e0f1e58e0ba Benjamin Lin    2024-11-18  2228  	ieee80211_sta_init_nss(link_sta);
819e0f1e58e0ba Benjamin Lin    2024-11-18  2229  
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2230  	if (params->opmode_notif_used) {
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2231  		enum nl80211_chan_width width = link->conf->chanreq.oper.width;
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2232  
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2233  		switch (width) {
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2234  		case NL80211_CHAN_WIDTH_20:
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2235  		case NL80211_CHAN_WIDTH_40:
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2236  		case NL80211_CHAN_WIDTH_80:
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2237  		case NL80211_CHAN_WIDTH_160:
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2238  		case NL80211_CHAN_WIDTH_80P80:
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2239  		case NL80211_CHAN_WIDTH_320: /* not VHT, allowed for HE/EHT */
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2240  			break;
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2241  		default:
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2242  			return -EINVAL;
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2243  		}
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2244  
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2245  		/* returned value is only needed for rc update, but the
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2246  		 * rc isn't initialized here yet, so ignore it
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2247  		 */
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2248  		__ieee80211_vht_handle_opmode(sdata, link_sta,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2249  					      params->opmode_notif,
b95eb7f0eee479 Shaul Triebitz  2022-06-14 @2250  					      sband->band);
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2251  	}
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2252  
642508a42f74d7 Johannes Berg   2024-06-05  2253  	return 0;
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2254  }
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2255  

:::::: The code at line 2250 was first introduced by commit
:::::: b95eb7f0eee479478eb1a7c0a42a80167708c1df wifi: cfg80211/mac80211: separate link params from station params

:::::: TO: Shaul Triebitz <shaul.triebitz@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
