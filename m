Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E3A13DB9F
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Aug 2025 03:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754192656; cv=none; b=shxjalRAC+5VG7R0CjD4wsX8QecS0MiNcspk4TSjbkDlrQ6QkvObfW+uAYpELlriBK+7EgYkBU/sd2ineqtPW5NxY5hQTgUuwkl06MwhvJr34aA9FCAKKiKGzWcka2vOnw3R2aKsnMgsrQpgtgS7+PBk4eC3gQgvJR0Jts2vo3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754192656; c=relaxed/simple;
	bh=m7RvaRt7HHJ6fNrkisWrZMj0lYrR843n0uwTetsXmlY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ptISUqU/fKWNCubqJFw5m6BjxsZtDZQH/Ydvk8mDg3sVuv2IanvZnLJS5OpTi4Ha+/Tu6B2ZiARtyUqvQ9iJFWtpOAY8HKp/6DorBCycHRckm3P+fshBXWoXO4dJ5I10XfY8GY5TLiPnKAd1plfCB+4ghlmM+p1TI7zdcWWkDZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aySM52Om; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aySM52Om"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754192655; x=1785728655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m7RvaRt7HHJ6fNrkisWrZMj0lYrR843n0uwTetsXmlY=;
  b=aySM52Omkc6wgKpbDsoe92JIRZbVMEzG9EReLxq8FUxDlnd93I3cMw+k
   0uoGF9qDhUmQrVLu6duHYR6pYC4QcyHfrJBBmAwA27Eex4CNIGd4gRluZ
   Q0LkbqSVjx5OPcG0d5nBWWE6R05IjcQihf78fkxDwlCkFfS/fF4joA+4h
   VwmTMXSNO8W+CPrFfalog6n7SjT0ykH1aU+dgtH3rutCeNdvRxg1XnZm9
   5IyHKaDqBla25GYS47hSPhZk9vuIfIEgV2Mt63jovvjMw10AB1XL7jf6O
   rjxGaGmNHM73CU8feyx4+Sk0/dJJ+ZJJwNJzE9rNbWjja7i0YvnD/BoZb
   g==;
X-CSE-ConnectionGUID: OI86H0WQTOOjEIX8qUnTgg==
X-CSE-MsgGUID: Ciy5+GfbR8SkDElNP72+Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="56628978"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56628978"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 20:44:14 -0700
X-CSE-ConnectionGUID: lH6denIZQ6ajPkdn7+IQsA==
X-CSE-MsgGUID: KfjQX2wORt+bFwa8qPPkZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163151323"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Aug 2025 20:44:13 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiPdq-0005lc-1X;
	Sun, 03 Aug 2025 03:44:10 +0000
Date: Sun, 3 Aug 2025 11:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:2093
 iwl_mld_set_key_add() error: we previously assumed 'mld_sta' could be null
 (see line 2076)
Message-ID: <202508031151.K87baMm4-lkp@intel.com>
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
TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>
CC: Avraham Stern <avraham.stern@intel.com>
CC: Daniel Gabay <daniel.gabay@intel.com>
CC: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
CC: Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>
CC: Yedidya Benshimol <yedidya.ben.shimol@intel.com>
CC: Benjamin Berg <benjamin.berg@intel.com>
CC: Shaul Triebitz <shaul.triebitz@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   186f3edfdd41f2ae87fc40a9ccba52a3bf930994
commit: d1e879ec600f9b3bdd253167533959facfefb17b wifi: iwlwifi: add iwlmld sub-driver
date:   5 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-141-20250803 (https://download.01.org/0day-ci/archive/20250803/202508031151.K87baMm4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508031151.K87baMm4-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:2093 iwl_mld_set_key_add() error: we previously assumed 'mld_sta' could be null (see line 2076)
drivers/net/wireless/intel/iwlwifi/mld/scan.c:1124 iwl_mld_scan_cmd_set_chan_params() warn: assigning (-128) to unsigned variable 'cfg->v5.psd_20'
drivers/net/wireless/intel/iwlwifi/mld/ptp.c:298 iwl_mld_ptp_init() warn: passing zero to 'PTR_ERR'

vim +/mld_sta +2093 drivers/net/wireless/intel/iwlwifi/mld/mac80211.c

d1e879ec600f9b Miri Korenblit 2025-02-16  2023  
d1e879ec600f9b Miri Korenblit 2025-02-16  2024  static int iwl_mld_set_key_add(struct iwl_mld *mld,
d1e879ec600f9b Miri Korenblit 2025-02-16  2025  			       struct ieee80211_vif *vif,
d1e879ec600f9b Miri Korenblit 2025-02-16  2026  			       struct ieee80211_sta *sta,
d1e879ec600f9b Miri Korenblit 2025-02-16  2027  			       struct ieee80211_key_conf *key)
d1e879ec600f9b Miri Korenblit 2025-02-16  2028  {
d1e879ec600f9b Miri Korenblit 2025-02-16  2029  	struct iwl_mld_vif *mld_vif = iwl_mld_vif_from_mac80211(vif);
d1e879ec600f9b Miri Korenblit 2025-02-16  2030  	struct iwl_mld_sta *mld_sta =
d1e879ec600f9b Miri Korenblit 2025-02-16  2031  		sta ? iwl_mld_sta_from_mac80211(sta) : NULL;
d1e879ec600f9b Miri Korenblit 2025-02-16  2032  	struct iwl_mld_ptk_pn *ptk_pn = NULL;
d1e879ec600f9b Miri Korenblit 2025-02-16  2033  	int keyidx = key->keyidx;
d1e879ec600f9b Miri Korenblit 2025-02-16  2034  	int ret;
d1e879ec600f9b Miri Korenblit 2025-02-16  2035  
d1e879ec600f9b Miri Korenblit 2025-02-16  2036  	/* Will be set to 0 if added successfully */
d1e879ec600f9b Miri Korenblit 2025-02-16  2037  	key->hw_key_idx = STA_KEY_IDX_INVALID;
d1e879ec600f9b Miri Korenblit 2025-02-16  2038  
d1e879ec600f9b Miri Korenblit 2025-02-16  2039  	switch (key->cipher) {
d1e879ec600f9b Miri Korenblit 2025-02-16  2040  	case WLAN_CIPHER_SUITE_WEP40:
d1e879ec600f9b Miri Korenblit 2025-02-16  2041  	case WLAN_CIPHER_SUITE_WEP104:
d1e879ec600f9b Miri Korenblit 2025-02-16  2042  		IWL_DEBUG_MAC80211(mld, "Use SW encryption for WEP\n");
d1e879ec600f9b Miri Korenblit 2025-02-16  2043  		return -EOPNOTSUPP;
d1e879ec600f9b Miri Korenblit 2025-02-16  2044  	case WLAN_CIPHER_SUITE_TKIP:
d1e879ec600f9b Miri Korenblit 2025-02-16  2045  		if (vif->type == NL80211_IFTYPE_STATION) {
d1e879ec600f9b Miri Korenblit 2025-02-16  2046  			key->flags |= IEEE80211_KEY_FLAG_PUT_MIC_SPACE;
d1e879ec600f9b Miri Korenblit 2025-02-16  2047  			break;
d1e879ec600f9b Miri Korenblit 2025-02-16  2048  		}
d1e879ec600f9b Miri Korenblit 2025-02-16  2049  		IWL_DEBUG_MAC80211(mld, "Use SW encryption for TKIP\n");
d1e879ec600f9b Miri Korenblit 2025-02-16  2050  		return -EOPNOTSUPP;
d1e879ec600f9b Miri Korenblit 2025-02-16  2051  	case WLAN_CIPHER_SUITE_CCMP:
d1e879ec600f9b Miri Korenblit 2025-02-16  2052  	case WLAN_CIPHER_SUITE_GCMP:
d1e879ec600f9b Miri Korenblit 2025-02-16  2053  	case WLAN_CIPHER_SUITE_GCMP_256:
d1e879ec600f9b Miri Korenblit 2025-02-16  2054  	case WLAN_CIPHER_SUITE_AES_CMAC:
d1e879ec600f9b Miri Korenblit 2025-02-16  2055  	case WLAN_CIPHER_SUITE_BIP_GMAC_128:
d1e879ec600f9b Miri Korenblit 2025-02-16  2056  	case WLAN_CIPHER_SUITE_BIP_GMAC_256:
d1e879ec600f9b Miri Korenblit 2025-02-16  2057  		break;
d1e879ec600f9b Miri Korenblit 2025-02-16  2058  	default:
d1e879ec600f9b Miri Korenblit 2025-02-16  2059  		return -EOPNOTSUPP;
d1e879ec600f9b Miri Korenblit 2025-02-16  2060  	}
d1e879ec600f9b Miri Korenblit 2025-02-16  2061  
d1e879ec600f9b Miri Korenblit 2025-02-16  2062  	if (vif->type == NL80211_IFTYPE_STATION &&
d1e879ec600f9b Miri Korenblit 2025-02-16  2063  	    (keyidx == 6 || keyidx == 7))
d1e879ec600f9b Miri Korenblit 2025-02-16  2064  		rcu_assign_pointer(mld_vif->bigtks[keyidx - 6], key);
d1e879ec600f9b Miri Korenblit 2025-02-16  2065  
d1e879ec600f9b Miri Korenblit 2025-02-16  2066  	/* After exiting from RFKILL, hostapd configures GTK/ITGK before the
d1e879ec600f9b Miri Korenblit 2025-02-16  2067  	 * AP is started, but those keys can't be sent to the FW before the
d1e879ec600f9b Miri Korenblit 2025-02-16  2068  	 * MCAST/BCAST STAs are added to it (which happens upon AP start).
d1e879ec600f9b Miri Korenblit 2025-02-16  2069  	 * Store it here to be sent later when the AP is started.
d1e879ec600f9b Miri Korenblit 2025-02-16  2070  	 */
d1e879ec600f9b Miri Korenblit 2025-02-16  2071  	if ((vif->type == NL80211_IFTYPE_ADHOC ||
d1e879ec600f9b Miri Korenblit 2025-02-16  2072  	     vif->type == NL80211_IFTYPE_AP) && !sta &&
d1e879ec600f9b Miri Korenblit 2025-02-16  2073  	     !mld_vif->ap_ibss_active)
d1e879ec600f9b Miri Korenblit 2025-02-16  2074  		return iwl_mld_store_ap_early_key(mld, key, mld_vif);
d1e879ec600f9b Miri Korenblit 2025-02-16  2075  
d1e879ec600f9b Miri Korenblit 2025-02-16 @2076  	if (!mld->fw_status.in_hw_restart && mld_sta &&
d1e879ec600f9b Miri Korenblit 2025-02-16  2077  	    key->flags & IEEE80211_KEY_FLAG_PAIRWISE &&
d1e879ec600f9b Miri Korenblit 2025-02-16  2078  	    (key->cipher == WLAN_CIPHER_SUITE_CCMP ||
d1e879ec600f9b Miri Korenblit 2025-02-16  2079  	     key->cipher == WLAN_CIPHER_SUITE_GCMP ||
d1e879ec600f9b Miri Korenblit 2025-02-16  2080  	     key->cipher == WLAN_CIPHER_SUITE_GCMP_256)) {
d1e879ec600f9b Miri Korenblit 2025-02-16  2081  		ret = iwl_mld_alloc_ptk_pn(mld, mld_sta, key, &ptk_pn);
d1e879ec600f9b Miri Korenblit 2025-02-16  2082  		if (ret)
d1e879ec600f9b Miri Korenblit 2025-02-16  2083  			return ret;
d1e879ec600f9b Miri Korenblit 2025-02-16  2084  	}
d1e879ec600f9b Miri Korenblit 2025-02-16  2085  
d1e879ec600f9b Miri Korenblit 2025-02-16  2086  	IWL_DEBUG_MAC80211(mld, "set hwcrypto key (sta:%pM, id:%d)\n",
d1e879ec600f9b Miri Korenblit 2025-02-16  2087  			   sta ? sta->addr : NULL, keyidx);
d1e879ec600f9b Miri Korenblit 2025-02-16  2088  
d1e879ec600f9b Miri Korenblit 2025-02-16  2089  	ret = iwl_mld_add_key(mld, vif, sta, key);
d1e879ec600f9b Miri Korenblit 2025-02-16  2090  	if (ret) {
d1e879ec600f9b Miri Korenblit 2025-02-16  2091  		IWL_WARN(mld, "set key failed (%d)\n", ret);
d1e879ec600f9b Miri Korenblit 2025-02-16  2092  		if (ptk_pn) {
d1e879ec600f9b Miri Korenblit 2025-02-16 @2093  			RCU_INIT_POINTER(mld_sta->ptk_pn[keyidx], NULL);
d1e879ec600f9b Miri Korenblit 2025-02-16  2094  			kfree(ptk_pn);
d1e879ec600f9b Miri Korenblit 2025-02-16  2095  		}
d1e879ec600f9b Miri Korenblit 2025-02-16  2096  
d1e879ec600f9b Miri Korenblit 2025-02-16  2097  		return -EOPNOTSUPP;
d1e879ec600f9b Miri Korenblit 2025-02-16  2098  	}
d1e879ec600f9b Miri Korenblit 2025-02-16  2099  
d1e879ec600f9b Miri Korenblit 2025-02-16  2100  	return 0;
d1e879ec600f9b Miri Korenblit 2025-02-16  2101  }
d1e879ec600f9b Miri Korenblit 2025-02-16  2102  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
