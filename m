Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D7720FA
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Sep 2023 10:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694945070; x=1726481070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3G5X0Dn8/Zf1KmKDZjrb7M3Pek1uwRz1vVcn6nMFVYE=;
  b=mEXDYwfcsc0G0UZINoN87uqp6uRd5LG9xT9gSwcINjoili7V5n9lO/JK
   xOp1DLePJ78ORu/BsgcugsHKaR86O6KQbAPb6isqFgz11vPD/0YjzN7/i
   KH8o6OSn9aTUrU8Yolju4ekdtMLsdBByPB9UHqzNhqd/Myon6giR2YOw/
   2NwInUO4m7qMuLbrB0tHlXLZPuzHSYn0OPtjHJzBRLLsSHPrQFdnKbR+t
   criLWwbF7vFRpssPboMpUELAjDYLmyvdNC921Rf05bvx1SVS61+fw3igs
   +mJeNlGJQktaUbe9oGG1NBTXsEwHhqguxKZ20PD6Ro8dKv+V9CC133zhp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="443563233"
X-IronPort-AV: E=Sophos;i="6.02,153,1688454000"; 
   d="scan'208";a="443563233"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 03:04:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="1076275738"
X-IronPort-AV: E=Sophos;i="6.02,153,1688454000"; 
   d="scan'208";a="1076275738"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 17 Sep 2023 03:04:27 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhodd-00058e-2Q;
	Sun, 17 Sep 2023 10:04:25 +0000
Date: Sun, 17 Sep 2023 18:04:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/mac80211/mlme.c:7124 ieee80211_setup_assoc_link() warn: variable
 dereferenced before check 'elem' (see line 7122)
Message-ID: <202309171709.Dh9AGg63-lkp@intel.com>
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
TO: Johannes Berg <johannes.berg@intel.com>
CC: Miri Korenblit <miriam.rachel.korenblit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0b0d403eabbe135d8dbb40ad5e41018947d336c
commit: aa87cd8b35736a5183745ab0ec4b82419024dfd7 wifi: mac80211: mlme: handle EHT channel puncturing
date:   7 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20230917 (https://download.01.org/0day-ci/archive/20230917/202309171709.Dh9AGg63-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230917/202309171709.Dh9AGg63-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309171709.Dh9AGg63-lkp@intel.com/

smatch warnings:
net/mac80211/mlme.c:7124 ieee80211_setup_assoc_link() warn: variable dereferenced before check 'elem' (see line 7122)

vim +/elem +7124 net/mac80211/mlme.c

af6b63741cc4e4 Johannes Berg 2009-12-23  7004  
1845c1d4a455e0 Johannes Berg 2022-07-12  7005  static ieee80211_conn_flags_t
1845c1d4a455e0 Johannes Berg 2022-07-12  7006  ieee80211_setup_assoc_link(struct ieee80211_sub_if_data *sdata,
1845c1d4a455e0 Johannes Berg 2022-07-12  7007  			   struct ieee80211_mgd_assoc_data *assoc_data,
1845c1d4a455e0 Johannes Berg 2022-07-12  7008  			   struct cfg80211_assoc_request *req,
81151ce462e533 Johannes Berg 2022-06-01  7009  			   ieee80211_conn_flags_t conn_flags,
81151ce462e533 Johannes Berg 2022-06-01  7010  			   unsigned int link_id)
1845c1d4a455e0 Johannes Berg 2022-07-12  7011  {
1845c1d4a455e0 Johannes Berg 2022-07-12  7012  	struct ieee80211_local *local = sdata->local;
1845c1d4a455e0 Johannes Berg 2022-07-12  7013  	const struct cfg80211_bss_ies *beacon_ies;
1845c1d4a455e0 Johannes Berg 2022-07-12  7014  	struct ieee80211_supported_band *sband;
1845c1d4a455e0 Johannes Berg 2022-07-12  7015  	const struct element *ht_elem, *vht_elem;
81151ce462e533 Johannes Berg 2022-06-01  7016  	struct ieee80211_link_data *link;
81151ce462e533 Johannes Berg 2022-06-01  7017  	struct cfg80211_bss *cbss;
81151ce462e533 Johannes Berg 2022-06-01  7018  	struct ieee80211_bss *bss;
1845c1d4a455e0 Johannes Berg 2022-07-12  7019  	bool is_5ghz, is_6ghz;
1845c1d4a455e0 Johannes Berg 2022-07-12  7020  
81151ce462e533 Johannes Berg 2022-06-01  7021  	cbss = assoc_data->link[link_id].bss;
81151ce462e533 Johannes Berg 2022-06-01  7022  	if (WARN_ON(!cbss))
81151ce462e533 Johannes Berg 2022-06-01  7023  		return 0;
81151ce462e533 Johannes Berg 2022-06-01  7024  
81151ce462e533 Johannes Berg 2022-06-01  7025  	bss = (void *)cbss->priv;
81151ce462e533 Johannes Berg 2022-06-01  7026  
1845c1d4a455e0 Johannes Berg 2022-07-12  7027  	sband = local->hw.wiphy->bands[cbss->channel->band];
1845c1d4a455e0 Johannes Berg 2022-07-12  7028  	if (WARN_ON(!sband))
81151ce462e533 Johannes Berg 2022-06-01  7029  		return 0;
81151ce462e533 Johannes Berg 2022-06-01  7030  
81151ce462e533 Johannes Berg 2022-06-01  7031  	link = sdata_dereference(sdata->link[link_id], sdata);
81151ce462e533 Johannes Berg 2022-06-01  7032  	if (WARN_ON(!link))
81151ce462e533 Johannes Berg 2022-06-01  7033  		return 0;
1845c1d4a455e0 Johannes Berg 2022-07-12  7034  
1845c1d4a455e0 Johannes Berg 2022-07-12  7035  	is_5ghz = cbss->channel->band == NL80211_BAND_5GHZ;
1845c1d4a455e0 Johannes Berg 2022-07-12  7036  	is_6ghz = cbss->channel->band == NL80211_BAND_6GHZ;
1845c1d4a455e0 Johannes Berg 2022-07-12  7037  
81151ce462e533 Johannes Berg 2022-06-01  7038  	/* for MLO connections assume advertising all rates is OK */
81151ce462e533 Johannes Berg 2022-06-01  7039  	if (!req->ap_mld_addr) {
1845c1d4a455e0 Johannes Berg 2022-07-12  7040  		assoc_data->supp_rates = bss->supp_rates;
1845c1d4a455e0 Johannes Berg 2022-07-12  7041  		assoc_data->supp_rates_len = bss->supp_rates_len;
81151ce462e533 Johannes Berg 2022-06-01  7042  	}
81151ce462e533 Johannes Berg 2022-06-01  7043  
81151ce462e533 Johannes Berg 2022-06-01  7044  	/* copy and link elems for the STA profile */
81151ce462e533 Johannes Berg 2022-06-01  7045  	if (req->links[link_id].elems_len) {
81151ce462e533 Johannes Berg 2022-06-01  7046  		memcpy(assoc_data->ie_pos, req->links[link_id].elems,
81151ce462e533 Johannes Berg 2022-06-01  7047  		       req->links[link_id].elems_len);
81151ce462e533 Johannes Berg 2022-06-01  7048  		assoc_data->link[link_id].elems = assoc_data->ie_pos;
81151ce462e533 Johannes Berg 2022-06-01  7049  		assoc_data->link[link_id].elems_len = req->links[link_id].elems_len;
81151ce462e533 Johannes Berg 2022-06-01  7050  		assoc_data->ie_pos += req->links[link_id].elems_len;
81151ce462e533 Johannes Berg 2022-06-01  7051  	}
1845c1d4a455e0 Johannes Berg 2022-07-12  7052  
1845c1d4a455e0 Johannes Berg 2022-07-12  7053  	rcu_read_lock();
1845c1d4a455e0 Johannes Berg 2022-07-12  7054  	ht_elem = ieee80211_bss_get_elem(cbss, WLAN_EID_HT_OPERATION);
1845c1d4a455e0 Johannes Berg 2022-07-12  7055  	if (ht_elem && ht_elem->datalen >= sizeof(struct ieee80211_ht_operation))
81151ce462e533 Johannes Berg 2022-06-01  7056  		assoc_data->link[link_id].ap_ht_param =
1845c1d4a455e0 Johannes Berg 2022-07-12  7057  			((struct ieee80211_ht_operation *)(ht_elem->data))->ht_param;
1845c1d4a455e0 Johannes Berg 2022-07-12  7058  	else if (!is_6ghz)
1845c1d4a455e0 Johannes Berg 2022-07-12  7059  		conn_flags |= IEEE80211_CONN_DISABLE_HT;
1845c1d4a455e0 Johannes Berg 2022-07-12  7060  	vht_elem = ieee80211_bss_get_elem(cbss, WLAN_EID_VHT_CAPABILITY);
1845c1d4a455e0 Johannes Berg 2022-07-12  7061  	if (vht_elem && vht_elem->datalen >= sizeof(struct ieee80211_vht_cap)) {
81151ce462e533 Johannes Berg 2022-06-01  7062  		memcpy(&assoc_data->link[link_id].ap_vht_cap, vht_elem->data,
1845c1d4a455e0 Johannes Berg 2022-07-12  7063  		       sizeof(struct ieee80211_vht_cap));
1845c1d4a455e0 Johannes Berg 2022-07-12  7064  	} else if (is_5ghz) {
1845c1d4a455e0 Johannes Berg 2022-07-12  7065  		link_info(link,
1845c1d4a455e0 Johannes Berg 2022-07-12  7066  			  "VHT capa missing/short, disabling VHT/HE/EHT\n");
1845c1d4a455e0 Johannes Berg 2022-07-12  7067  		conn_flags |= IEEE80211_CONN_DISABLE_VHT |
1845c1d4a455e0 Johannes Berg 2022-07-12  7068  			      IEEE80211_CONN_DISABLE_HE |
1845c1d4a455e0 Johannes Berg 2022-07-12  7069  			      IEEE80211_CONN_DISABLE_EHT;
1845c1d4a455e0 Johannes Berg 2022-07-12  7070  	}
1845c1d4a455e0 Johannes Berg 2022-07-12  7071  	rcu_read_unlock();
1845c1d4a455e0 Johannes Berg 2022-07-12  7072  
1845c1d4a455e0 Johannes Berg 2022-07-12  7073  	link->u.mgd.beacon_crc_valid = false;
1845c1d4a455e0 Johannes Berg 2022-07-12  7074  	link->u.mgd.dtim_period = 0;
1845c1d4a455e0 Johannes Berg 2022-07-12  7075  	link->u.mgd.have_beacon = false;
1845c1d4a455e0 Johannes Berg 2022-07-12  7076  
1845c1d4a455e0 Johannes Berg 2022-07-12  7077  	/* override HT/VHT configuration only if the AP and we support it */
1845c1d4a455e0 Johannes Berg 2022-07-12  7078  	if (!(conn_flags & IEEE80211_CONN_DISABLE_HT)) {
1845c1d4a455e0 Johannes Berg 2022-07-12  7079  		struct ieee80211_sta_ht_cap sta_ht_cap;
1845c1d4a455e0 Johannes Berg 2022-07-12  7080  
1845c1d4a455e0 Johannes Berg 2022-07-12  7081  		memcpy(&sta_ht_cap, &sband->ht_cap, sizeof(sta_ht_cap));
1845c1d4a455e0 Johannes Berg 2022-07-12  7082  		ieee80211_apply_htcap_overrides(sdata, &sta_ht_cap);
1845c1d4a455e0 Johannes Berg 2022-07-12  7083  	}
1845c1d4a455e0 Johannes Berg 2022-07-12  7084  
aa87cd8b35736a Johannes Berg 2023-01-27  7085  	link->conf->eht_puncturing = 0;
aa87cd8b35736a Johannes Berg 2023-01-27  7086  
1845c1d4a455e0 Johannes Berg 2022-07-12  7087  	rcu_read_lock();
1845c1d4a455e0 Johannes Berg 2022-07-12  7088  	beacon_ies = rcu_dereference(cbss->beacon_ies);
1845c1d4a455e0 Johannes Berg 2022-07-12  7089  	if (beacon_ies) {
aa87cd8b35736a Johannes Berg 2023-01-27  7090  		const struct ieee80211_eht_operation *eht_oper;
1845c1d4a455e0 Johannes Berg 2022-07-12  7091  		const struct element *elem;
1845c1d4a455e0 Johannes Berg 2022-07-12  7092  		u8 dtim_count = 0;
1845c1d4a455e0 Johannes Berg 2022-07-12  7093  
1845c1d4a455e0 Johannes Berg 2022-07-12  7094  		ieee80211_get_dtim(beacon_ies, &dtim_count,
1845c1d4a455e0 Johannes Berg 2022-07-12  7095  				   &link->u.mgd.dtim_period);
1845c1d4a455e0 Johannes Berg 2022-07-12  7096  
1845c1d4a455e0 Johannes Berg 2022-07-12  7097  		sdata->deflink.u.mgd.have_beacon = true;
1845c1d4a455e0 Johannes Berg 2022-07-12  7098  
1845c1d4a455e0 Johannes Berg 2022-07-12  7099  		if (ieee80211_hw_check(&local->hw, TIMING_BEACON_ONLY)) {
1845c1d4a455e0 Johannes Berg 2022-07-12  7100  			link->conf->sync_tsf = beacon_ies->tsf;
1845c1d4a455e0 Johannes Berg 2022-07-12  7101  			link->conf->sync_device_ts = bss->device_ts_beacon;
1845c1d4a455e0 Johannes Berg 2022-07-12  7102  			link->conf->sync_dtim_count = dtim_count;
1845c1d4a455e0 Johannes Berg 2022-07-12  7103  		}
1845c1d4a455e0 Johannes Berg 2022-07-12  7104  
1845c1d4a455e0 Johannes Berg 2022-07-12  7105  		elem = cfg80211_find_ext_elem(WLAN_EID_EXT_MULTIPLE_BSSID_CONFIGURATION,
1845c1d4a455e0 Johannes Berg 2022-07-12  7106  					      beacon_ies->data, beacon_ies->len);
1845c1d4a455e0 Johannes Berg 2022-07-12  7107  		if (elem && elem->datalen >= 3)
1845c1d4a455e0 Johannes Berg 2022-07-12  7108  			link->conf->profile_periodicity = elem->data[2];
1845c1d4a455e0 Johannes Berg 2022-07-12  7109  		else
1845c1d4a455e0 Johannes Berg 2022-07-12  7110  			link->conf->profile_periodicity = 0;
1845c1d4a455e0 Johannes Berg 2022-07-12  7111  
1845c1d4a455e0 Johannes Berg 2022-07-12  7112  		elem = cfg80211_find_elem(WLAN_EID_EXT_CAPABILITY,
1845c1d4a455e0 Johannes Berg 2022-07-12  7113  					  beacon_ies->data, beacon_ies->len);
1845c1d4a455e0 Johannes Berg 2022-07-12  7114  		if (elem && elem->datalen >= 11 &&
1845c1d4a455e0 Johannes Berg 2022-07-12  7115  		    (elem->data[10] & WLAN_EXT_CAPA11_EMA_SUPPORT))
1845c1d4a455e0 Johannes Berg 2022-07-12  7116  			link->conf->ema_ap = true;
1845c1d4a455e0 Johannes Berg 2022-07-12  7117  		else
1845c1d4a455e0 Johannes Berg 2022-07-12  7118  			link->conf->ema_ap = false;
aa87cd8b35736a Johannes Berg 2023-01-27  7119  
aa87cd8b35736a Johannes Berg 2023-01-27  7120  		elem = cfg80211_find_ext_elem(WLAN_EID_EXT_EHT_OPERATION,
aa87cd8b35736a Johannes Berg 2023-01-27  7121  					      beacon_ies->data, beacon_ies->len);
aa87cd8b35736a Johannes Berg 2023-01-27 @7122  		eht_oper = (const void *)(elem->data + 1);
aa87cd8b35736a Johannes Berg 2023-01-27  7123  
aa87cd8b35736a Johannes Berg 2023-01-27 @7124  		if (elem &&
aa87cd8b35736a Johannes Berg 2023-01-27  7125  		    ieee80211_eht_oper_size_ok((const void *)(elem->data + 1),
aa87cd8b35736a Johannes Berg 2023-01-27  7126  					       elem->datalen - 1) &&
aa87cd8b35736a Johannes Berg 2023-01-27  7127  		    (eht_oper->params & IEEE80211_EHT_OPER_INFO_PRESENT) &&
aa87cd8b35736a Johannes Berg 2023-01-27  7128  		    (eht_oper->params & IEEE80211_EHT_OPER_DISABLED_SUBCHANNEL_BITMAP_PRESENT)) {
aa87cd8b35736a Johannes Berg 2023-01-27  7129  			const struct ieee80211_eht_operation_info *info =
aa87cd8b35736a Johannes Berg 2023-01-27  7130  				(void *)eht_oper->optional;
aa87cd8b35736a Johannes Berg 2023-01-27  7131  			const u8 *disable_subchannel_bitmap = info->optional;
aa87cd8b35736a Johannes Berg 2023-01-27  7132  			u16 bitmap;
aa87cd8b35736a Johannes Berg 2023-01-27  7133  
aa87cd8b35736a Johannes Berg 2023-01-27  7134  			bitmap = get_unaligned_le16(disable_subchannel_bitmap);
aa87cd8b35736a Johannes Berg 2023-01-27  7135  			if (ieee80211_valid_disable_subchannel_bitmap(&bitmap,
aa87cd8b35736a Johannes Berg 2023-01-27  7136  								      link->conf->chandef.width))
aa87cd8b35736a Johannes Berg 2023-01-27  7137  				ieee80211_handle_puncturing_bitmap(link,
aa87cd8b35736a Johannes Berg 2023-01-27  7138  								   eht_oper,
aa87cd8b35736a Johannes Berg 2023-01-27  7139  								   bitmap,
aa87cd8b35736a Johannes Berg 2023-01-27  7140  								   NULL);
aa87cd8b35736a Johannes Berg 2023-01-27  7141  			else
aa87cd8b35736a Johannes Berg 2023-01-27  7142  				conn_flags |= IEEE80211_CONN_DISABLE_EHT;
aa87cd8b35736a Johannes Berg 2023-01-27  7143  		}
1845c1d4a455e0 Johannes Berg 2022-07-12  7144  	}
1845c1d4a455e0 Johannes Berg 2022-07-12  7145  	rcu_read_unlock();
1845c1d4a455e0 Johannes Berg 2022-07-12  7146  
1845c1d4a455e0 Johannes Berg 2022-07-12  7147  	if (bss->corrupt_data) {
1845c1d4a455e0 Johannes Berg 2022-07-12  7148  		char *corrupt_type = "data";
1845c1d4a455e0 Johannes Berg 2022-07-12  7149  
1845c1d4a455e0 Johannes Berg 2022-07-12  7150  		if (bss->corrupt_data & IEEE80211_BSS_CORRUPT_BEACON) {
1845c1d4a455e0 Johannes Berg 2022-07-12  7151  			if (bss->corrupt_data & IEEE80211_BSS_CORRUPT_PROBE_RESP)
1845c1d4a455e0 Johannes Berg 2022-07-12  7152  				corrupt_type = "beacon and probe response";
1845c1d4a455e0 Johannes Berg 2022-07-12  7153  			else
1845c1d4a455e0 Johannes Berg 2022-07-12  7154  				corrupt_type = "beacon";
1845c1d4a455e0 Johannes Berg 2022-07-12  7155  		} else if (bss->corrupt_data & IEEE80211_BSS_CORRUPT_PROBE_RESP) {
1845c1d4a455e0 Johannes Berg 2022-07-12  7156  			corrupt_type = "probe response";
1845c1d4a455e0 Johannes Berg 2022-07-12  7157  		}
1845c1d4a455e0 Johannes Berg 2022-07-12  7158  		sdata_info(sdata, "associating to AP %pM with corrupt %s\n",
1845c1d4a455e0 Johannes Berg 2022-07-12  7159  			   cbss->bssid, corrupt_type);
1845c1d4a455e0 Johannes Berg 2022-07-12  7160  	}
1845c1d4a455e0 Johannes Berg 2022-07-12  7161  
1845c1d4a455e0 Johannes Berg 2022-07-12  7162  	if (link->u.mgd.req_smps == IEEE80211_SMPS_AUTOMATIC) {
1845c1d4a455e0 Johannes Berg 2022-07-12  7163  		if (sdata->u.mgd.powersave)
1845c1d4a455e0 Johannes Berg 2022-07-12  7164  			link->smps_mode = IEEE80211_SMPS_DYNAMIC;
1845c1d4a455e0 Johannes Berg 2022-07-12  7165  		else
1845c1d4a455e0 Johannes Berg 2022-07-12  7166  			link->smps_mode = IEEE80211_SMPS_OFF;
1845c1d4a455e0 Johannes Berg 2022-07-12  7167  	} else {
1845c1d4a455e0 Johannes Berg 2022-07-12  7168  		link->smps_mode = link->u.mgd.req_smps;
1845c1d4a455e0 Johannes Berg 2022-07-12  7169  	}
1845c1d4a455e0 Johannes Berg 2022-07-12  7170  
1845c1d4a455e0 Johannes Berg 2022-07-12  7171  	return conn_flags;
1845c1d4a455e0 Johannes Berg 2022-07-12  7172  }
1845c1d4a455e0 Johannes Berg 2022-07-12  7173  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
