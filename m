Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DFF3A6402
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 14:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844989; cv=none; b=dWta5oC5hYKDsv6l/5UzrbqCoE7UxHu+tO6A6cSkJxkPjm6UqpCvSrNqsb6u0E1VcGRFQ2NJVlflaLm/lfIr1r3PoGUFpt8Vlh8SfCxdsKLXmM2FXTAkQZReQkAk4I7OBgq4UXkB9XAWBJGIITIkWR0a2tN6Fa62BWinMsTGDWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844989; c=relaxed/simple;
	bh=w/LdjKtOPkrP2dsOkx9qfiSaS6OgML3Xy0p4pKx6eqs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KQaOnjSsHDc2EPrYHipkVe22HcWb5+4a3Xbd2vHJhJ6iJ8KUVc7GCdEZMikxF0vq7wdayWhoPOmSaflHAIHis9HOLS7sLcL03TkRW8n/7bmIN8fyeZwyvN4J3KS3Edj11Bb0uX2iUE24y0x3frXQljkMHWPVHIzuEuqT7/lwTLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fagtTm8u; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fagtTm8u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773844988; x=1805380988;
  h=date:from:to:cc:subject:message-id;
  bh=w/LdjKtOPkrP2dsOkx9qfiSaS6OgML3Xy0p4pKx6eqs=;
  b=fagtTm8u+zm4/a7zxZ8+eWORONSJYdLRLSKPPOtwRGE2bufKCosjiQLk
   k4GwGnUY2S/RBR4g5WaPbcspefwmtTEmZ/SCl3y1aEZA49K8GkJkCnRh+
   DZjnQdlJkT2744uVZC/CcCOvXQ3779UzTc+4C2PS4iQCMIgAzRsqtYOXR
   Y+GbgGd2fwJzz8wwAUow9Ct7nSB8n+UPXUC6ftH3oPvCmLTNPt9rk/6rC
   UOsEgUAFdz0k8tMFN6p21VRn7cLWgeHnY2cze+1foFKjsCY4D74DgX35U
   cH4EPmFZYTQz8i/jGhP43oVzDYXoFYTJgCfMgMH3Zathm6k/ahlrZyzSA
   g==;
X-CSE-ConnectionGUID: ltUfYFyHTEuKOCRMjDvrPQ==
X-CSE-MsgGUID: O7fLz9zeTsaDU/WwbXF9hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74081752"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74081752"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 07:43:07 -0700
X-CSE-ConnectionGUID: 0miVlaRKRSSUvjic15lEqQ==
X-CSE-MsgGUID: j0BHCh0SQxehGBdmBJBAHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="253123225"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Mar 2026 07:43:03 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2s6v-0000000030r-0dMR;
	Wed, 18 Mar 2026 14:43:01 +0000
Date: Wed, 18 Mar 2026 22:42:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [iwlwifi-next:nan_mac80211_phase2 39/57]
 net/mac80211/cfg.c:2245 sta_link_apply_parameters() error: we previously
 assumed 'sband' could be null (see line 2201)
Message-ID: <202603182219.w5ri0Zkg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git nan_mac80211_phase2
head:   2d6c6fa9647943d4c8ff3d8a6f82c00ea1edd2f4
commit: 86779883b70780814530c087af95f4200b81387b [39/57] wifi: mac80211: support NAN stations
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-141-20260318 (https://download.01.org/0day-ci/archive/20260318/202603182219.w5ri0Zkg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603182219.w5ri0Zkg-lkp@intel.com/

smatch warnings:
net/mac80211/cfg.c:2245 sta_link_apply_parameters() error: we previously assumed 'sband' could be null (see line 2201)

vim +/sband +2245 net/mac80211/cfg.c

03ecd745dde181 Johannes Berg   2024-06-05  2074  
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2075  static int sta_link_apply_parameters(struct ieee80211_local *local,
03ecd745dde181 Johannes Berg   2024-06-05  2076  				     struct sta_info *sta,
03ecd745dde181 Johannes Berg   2024-06-05  2077  				     enum sta_link_apply_mode mode,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2078  				     struct link_station_parameters *params)
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2079  {
86779883b70780 Miri Korenblit  2025-11-26  2080  	struct ieee80211_supported_band *sband = NULL;
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2081  	struct ieee80211_sub_if_data *sdata = sta->sdata;
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2082  	u32 link_id = params->link_id < 0 ? 0 : params->link_id;
d8675a63518c61 Johannes Berg   2022-06-17  2083  	struct ieee80211_link_data *link =
d8675a63518c61 Johannes Berg   2022-06-17  2084  		sdata_dereference(sdata->link[link_id], sdata);
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2085  	struct link_sta_info *link_sta =
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2086  		rcu_dereference_protected(sta->link[link_id],
4d3acf4311a040 Johannes Berg   2023-08-28  2087  					  lockdep_is_held(&local->hw.wiphy->mtx));
86779883b70780 Miri Korenblit  2025-11-26  2088  	const struct ieee80211_sta_ht_cap *own_ht_cap;
86779883b70780 Miri Korenblit  2025-11-26  2089  	const struct ieee80211_sta_vht_cap *own_vht_cap;
86779883b70780 Miri Korenblit  2025-11-26  2090  	const struct ieee80211_sta_he_cap *own_he_cap;
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
86779883b70780 Miri Korenblit  2025-11-26  2120  	if (sdata->vif.type == NL80211_IFTYPE_NAN ||
86779883b70780 Miri Korenblit  2025-11-26  2121  	    sdata->vif.type == NL80211_IFTYPE_NAN_DATA) {
86779883b70780 Miri Korenblit  2025-11-26  2122  		own_ht_cap = &local->hw.wiphy->nan_capa.phy.ht;
86779883b70780 Miri Korenblit  2025-11-26  2123  		own_vht_cap = &local->hw.wiphy->nan_capa.phy.vht;
86779883b70780 Miri Korenblit  2025-11-26  2124  		own_he_cap = &local->hw.wiphy->nan_capa.phy.he;
86779883b70780 Miri Korenblit  2025-11-26  2125  	} else {
d8675a63518c61 Johannes Berg   2022-06-17  2126  		sband = ieee80211_get_link_sband(link);
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2127  		if (!sband)
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2128  			return -EINVAL;
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2129  
86779883b70780 Miri Korenblit  2025-11-26  2130  		own_ht_cap = &sband->ht_cap;
86779883b70780 Miri Korenblit  2025-11-26  2131  		own_vht_cap = &sband->vht_cap;
86779883b70780 Miri Korenblit  2025-11-26  2132  		own_he_cap = ieee80211_get_he_iftype_cap_vif(sband, &sdata->vif);
86779883b70780 Miri Korenblit  2025-11-26  2133  	}
86779883b70780 Miri Korenblit  2025-11-26  2134  
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2135  	if (params->link_mac) {
03ecd745dde181 Johannes Berg   2024-06-05  2136  		if (mode == STA_LINK_MODE_NEW) {
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2137  			memcpy(link_sta->addr, params->link_mac, ETH_ALEN);
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2138  			memcpy(link_sta->pub->addr, params->link_mac, ETH_ALEN);
9aebce6c97bfd7 Johannes Berg   2022-07-18  2139  		} else if (!ether_addr_equal(link_sta->addr,
9aebce6c97bfd7 Johannes Berg   2022-07-18  2140  					     params->link_mac)) {
9aebce6c97bfd7 Johannes Berg   2022-07-18  2141  			return -EINVAL;
9aebce6c97bfd7 Johannes Berg   2022-07-18  2142  		}
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2143  	}
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2144  
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2145  	if (params->txpwr_set) {
642508a42f74d7 Johannes Berg   2024-06-05  2146  		int ret;
642508a42f74d7 Johannes Berg   2024-06-05  2147  
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2148  		link_sta->pub->txpwr.type = params->txpwr.type;
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2149  		if (params->txpwr.type == NL80211_TX_POWER_LIMITED)
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2150  			link_sta->pub->txpwr.power = params->txpwr.power;
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2151  		ret = drv_sta_set_txpwr(local, sdata, sta);
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2152  		if (ret)
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2153  			return ret;
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2154  	}
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2155  
86779883b70780 Miri Korenblit  2025-11-26  2156  	if (sdata->vif.type == NL80211_IFTYPE_NAN ||
86779883b70780 Miri Korenblit  2025-11-26  2157  	    sdata->vif.type == NL80211_IFTYPE_NAN_DATA) {
86779883b70780 Miri Korenblit  2025-11-26  2158  		static const u8 all_ofdm_rates[] = {
86779883b70780 Miri Korenblit  2025-11-26  2159  			0x0c, 0x12, 0x18, 0x24, 0x30, 0x48, 0x60, 0x6c
86779883b70780 Miri Korenblit  2025-11-26  2160  		};
86779883b70780 Miri Korenblit  2025-11-26  2161  
86779883b70780 Miri Korenblit  2025-11-26  2162  		/* Set the same supported_rates for all bands */
86779883b70780 Miri Korenblit  2025-11-26  2163  		for (int i = 0; i < NUM_NL80211_BANDS; i++) {
86779883b70780 Miri Korenblit  2025-11-26  2164  			struct ieee80211_supported_band *tmp =
86779883b70780 Miri Korenblit  2025-11-26  2165  				sdata->local->hw.wiphy->bands[i];
86779883b70780 Miri Korenblit  2025-11-26  2166  
86779883b70780 Miri Korenblit  2025-11-26  2167  			if ((i != NL80211_BAND_2GHZ && i != NL80211_BAND_5GHZ) ||
86779883b70780 Miri Korenblit  2025-11-26  2168  			    !tmp)
86779883b70780 Miri Korenblit  2025-11-26  2169  				continue;
86779883b70780 Miri Korenblit  2025-11-26  2170  
86779883b70780 Miri Korenblit  2025-11-26  2171  			if (!ieee80211_parse_bitrates(tmp, all_ofdm_rates,
86779883b70780 Miri Korenblit  2025-11-26  2172  						      sizeof(all_ofdm_rates),
86779883b70780 Miri Korenblit  2025-11-26  2173  						      &link_sta->pub->supp_rates[i]))
86779883b70780 Miri Korenblit  2025-11-26  2174  				return -EINVAL;
86779883b70780 Miri Korenblit  2025-11-26  2175  		}
86779883b70780 Miri Korenblit  2025-11-26  2176  	}
86779883b70780 Miri Korenblit  2025-11-26  2177  
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2178  	if (params->supported_rates &&
16ee3ea8faef8f Mikhail Lobanov 2025-03-17  2179  	    params->supported_rates_len &&
46e7ced3ef5b56 Miri Korenblit  2026-01-08  2180  	    !ieee80211_parse_bitrates(sband, params->supported_rates,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2181  				      params->supported_rates_len,
16ee3ea8faef8f Mikhail Lobanov 2025-03-17  2182  				      &link_sta->pub->supp_rates[sband->band]))
16ee3ea8faef8f Mikhail Lobanov 2025-03-17  2183  		return -EINVAL;
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2184  
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2185  	if (params->ht_capa)
86779883b70780 Miri Korenblit  2025-11-26  2186  		ieee80211_ht_cap_ie_to_sta_ht_cap(sdata, own_ht_cap,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2187  						  params->ht_capa, link_sta);
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2188  
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2189  	/* VHT can override some HT caps such as the A-MSDU max length */
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2190  	if (params->vht_capa)
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2191  		ieee80211_vht_cap_ie_to_sta_vht_cap(sdata, sband,
86779883b70780 Miri Korenblit  2025-11-26  2192  						    own_vht_cap,
084cf2aeca9756 Johannes Berg   2023-09-18  2193  						    params->vht_capa, NULL,
084cf2aeca9756 Johannes Berg   2023-09-18  2194  						    link_sta);
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2195  
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2196  	if (params->he_capa)
86779883b70780 Miri Korenblit  2025-11-26  2197  		_ieee80211_he_cap_ie_to_sta_he_cap(sdata,
86779883b70780 Miri Korenblit  2025-11-26  2198  						   own_he_cap,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2199  						   (void *)params->he_capa,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2200  						   params->he_capa_len,
86779883b70780 Miri Korenblit  2025-11-26 @2201  						   (sband && sband->band == NL80211_BAND_6GHZ) ?
86779883b70780 Miri Korenblit  2025-11-26  2202  						   (void *)params->he_6ghz_capa : NULL,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2203  						   link_sta);
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2204  
e8edb34640eeee Johannes Berg   2023-03-01  2205  	if (params->he_capa && params->eht_capa)
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2206  		ieee80211_eht_cap_ie_to_sta_eht_cap(sdata, sband,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2207  						    (u8 *)params->he_capa,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2208  						    params->he_capa_len,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2209  						    params->eht_capa,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2210  						    params->eht_capa_len,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2211  						    link_sta);
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2212  
a1085114715ee9 Johannes Berg   2026-01-30  2213  	if (params->uhr_capa)
a1085114715ee9 Johannes Berg   2026-01-30  2214  		ieee80211_uhr_cap_ie_to_sta_uhr_cap(sdata, sband,
a1085114715ee9 Johannes Berg   2026-01-30  2215  						    params->uhr_capa,
a1085114715ee9 Johannes Berg   2026-01-30  2216  						    params->uhr_capa_len,
a1085114715ee9 Johannes Berg   2026-01-30  2217  						    link_sta);
a1085114715ee9 Johannes Berg   2026-01-30  2218  
037dc18ac3fb8f Lachlan Hodges  2025-06-17  2219  	if (params->s1g_capa)
037dc18ac3fb8f Lachlan Hodges  2025-06-17  2220  		ieee80211_s1g_cap_to_sta_s1g_cap(sdata, params->s1g_capa,
037dc18ac3fb8f Lachlan Hodges  2025-06-17  2221  						 link_sta);
037dc18ac3fb8f Lachlan Hodges  2025-06-17  2222  
819e0f1e58e0ba Benjamin Lin    2024-11-18  2223  	ieee80211_sta_init_nss(link_sta);
819e0f1e58e0ba Benjamin Lin    2024-11-18  2224  
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2225  	if (params->opmode_notif_used) {
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2226  		enum nl80211_chan_width width = link->conf->chanreq.oper.width;
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2227  
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2228  		switch (width) {
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2229  		case NL80211_CHAN_WIDTH_20:
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2230  		case NL80211_CHAN_WIDTH_40:
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2231  		case NL80211_CHAN_WIDTH_80:
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2232  		case NL80211_CHAN_WIDTH_160:
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2233  		case NL80211_CHAN_WIDTH_80P80:
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2234  		case NL80211_CHAN_WIDTH_320: /* not VHT, allowed for HE/EHT */
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2235  			break;
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2236  		default:
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2237  			return -EINVAL;
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2238  		}
58fcb1b4287ce3 Moon Hee Lee    2025-07-03  2239  
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2240  		/* returned value is only needed for rc update, but the
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2241  		 * rc isn't initialized here yet, so ignore it
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2242  		 */
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2243  		__ieee80211_vht_handle_opmode(sdata, link_sta,
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2244  					      params->opmode_notif,
b95eb7f0eee479 Shaul Triebitz  2022-06-14 @2245  					      sband->band);
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2246  	}
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2247  
642508a42f74d7 Johannes Berg   2024-06-05  2248  	return 0;
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2249  }
b95eb7f0eee479 Shaul Triebitz  2022-06-14  2250  

:::::: The code at line 2245 was first introduced by commit
:::::: b95eb7f0eee479478eb1a7c0a42a80167708c1df wifi: cfg80211/mac80211: separate link params from station params

:::::: TO: Shaul Triebitz <shaul.triebitz@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
