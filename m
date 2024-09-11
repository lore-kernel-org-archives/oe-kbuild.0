Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AC4161
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Sep 2024 02:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726020987; cv=none; b=XYb/WpTVKZfWJX64TKXvFS7Y26BNMvcCUkwOXm9NbyP5r/JDcNMVNw53EL506QlGHuHh84EzR++CpngfHVbO2O+NBohZ07z/Z/CX8YbJVPgMR+0V2IgY4UV3zdGsnYWYxfhnoqoOwPt53tOR+t6cVfBQN2+6WplZ7bLdlGRVbww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726020987; c=relaxed/simple;
	bh=ukQ9d0UQCm+2qEW9yGdxKkwoSFjQXQl0lzLQedpnzp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=slIdHrRXckyL5BfsAx3BAUnlC98IbbatH5bPPx6sQWtdJkyEVjDv/225Mfmba9Tfyw6EXFR/M6UBicOfkfs6Ep0jbOekOEBHoOfOndr/51cNzNYbqDoKSaJqOO37TNseLFrJx2aPbnH4dEN7v9vB66syjTKFwwkuIKwfno7R1E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cbZzvjXr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cbZzvjXr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726020984; x=1757556984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ukQ9d0UQCm+2qEW9yGdxKkwoSFjQXQl0lzLQedpnzp8=;
  b=cbZzvjXrZTv2vQjJAwIC7YUSjRq6EjsuZGmW2jwquK/7+tS8+0cpnXAd
   xpJadg1ckes1hepjpL2Rw67xbqMb/XIACkrB0nL+NYq6D6NB41QPtKHVL
   MOIdDxaMaRe+MgCUmuESigoqCuJNIU1P9W52cxVaw2PpiYx4gDoLfZYsp
   Ck4KCNXU+DE4p2wYZ1z/S3CYp+hw39YHalPDGvwVZ/drB2itiLCwuMuU1
   evWDgSq38bvjO+lffgL4kFaj6y0vuFy5VdIeAAcojY43hwMTCnLLCatvf
   gXi0/QlEHTIXcGGOzrMTV2hTcoMXbeWce8oQHgIaw/BxXM6FIcTvbcaYm
   A==;
X-CSE-ConnectionGUID: DrL2+J9mQHu/e2LBSaGfSA==
X-CSE-MsgGUID: tm7/pQwsQ8KV/BQs20YO7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="28689690"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="28689690"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 19:16:23 -0700
X-CSE-ConnectionGUID: 8ChmWnHqRAOPeHL/3vqrGw==
X-CSE-MsgGUID: 5mF4bnfQR5Ci0wjGrAkVYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="71985601"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Sep 2024 19:16:22 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soCu3-0002wQ-24;
	Wed, 11 Sep 2024 02:16:19 +0000
Date: Wed, 11 Sep 2024 10:15:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] wifi: mac80211: Assign tx-stats to the proper link.
Message-ID: <202409111021.knHCdoxY-lkp@intel.com>
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
In-Reply-To: <20240909210017.3228400-1-greearb@candelatech.com>
References: <20240909210017.3228400-1-greearb@candelatech.com>
TO: greearb@candelatech.com
TO: linux-wireless@vger.kernel.org
CC: Ben Greear <greearb@candelatech.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.11-rc7 next-20240910]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/greearb-candelatech-com/wifi-iwlwifi-Report-link-id-for-transmitted-frames/20240910-050218
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20240909210017.3228400-1-greearb%40candelatech.com
patch subject: [PATCH 1/2] wifi: mac80211: Assign tx-stats to the proper link.
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: x86_64-randconfig-161-20240910 (https://download.01.org/0day-ci/archive/20240911/202409111021.knHCdoxY-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409111021.knHCdoxY-lkp@intel.com/

smatch warnings:
net/mac80211/status.c:1063 __ieee80211_tx_status() warn: potential spectre issue 'link_sta->status_stats.msdu_failed' [w]
net/mac80211/status.c:1065 __ieee80211_tx_status() warn: potential spectre issue 'link_sta->status_stats.msdu_retries' [w]

vim +1063 net/mac80211/status.c

4dc792b8f098ab Helmut Schaa     2015-09-02   977  
5fe49a9d11644f Felix Fietkau    2017-04-26   978  static void __ieee80211_tx_status(struct ieee80211_hw *hw,
3318111cf63d97 Felix Fietkau    2020-09-08   979  				  struct ieee80211_tx_status *status,
3318111cf63d97 Felix Fietkau    2020-09-08   980  				  int rates_idx, int retry_count)
4dc792b8f098ab Helmut Schaa     2015-09-02   981  {
5fe49a9d11644f Felix Fietkau    2017-04-26   982  	struct sk_buff *skb = status->skb;
7e1cdcbb092458 Felix Fietkau    2014-11-19   983  	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *) skb->data;
7e1cdcbb092458 Felix Fietkau    2014-11-19   984  	struct ieee80211_local *local = hw_to_local(hw);
5fe49a9d11644f Felix Fietkau    2017-04-26   985  	struct ieee80211_tx_info *info = status->info;
5fe49a9d11644f Felix Fietkau    2017-04-26   986  	struct sta_info *sta;
7e1cdcbb092458 Felix Fietkau    2014-11-19   987  	__le16 fc;
7e1cdcbb092458 Felix Fietkau    2014-11-19   988  	bool send_to_cooked;
7e1cdcbb092458 Felix Fietkau    2014-11-19   989  	bool acked;
5972fa15b923df Markus Theil     2019-12-18   990  	bool noack_success;
7e1cdcbb092458 Felix Fietkau    2014-11-19   991  	struct ieee80211_bar *bar;
5e06a9e8b6db44 Johannes Berg    2015-01-16   992  	int tid = IEEE80211_NUM_TIDS;
7e1cdcbb092458 Felix Fietkau    2014-11-19   993  
375177bf35efc0 Vivek Natarajan  2010-02-09   994  	fc = hdr->frame_control;
fe7a5d5c1ad659 Johannes Berg    2009-11-18   995  
5fe49a9d11644f Felix Fietkau    2017-04-26   996  	if (status->sta) {
1482c6ea0a99cb Ben Greear       2024-09-09   997  		struct link_sta_info *link_sta = status->link_sta;
1482c6ea0a99cb Ben Greear       2024-09-09   998  
5fe49a9d11644f Felix Fietkau    2017-04-26   999  		sta = container_of(status->sta, struct sta_info, sta);
2103dec14792be Simon Wunderlich 2013-07-08  1000  
47086fc51aa222 Johannes Berg    2011-09-29  1001  		if (info->flags & IEEE80211_TX_STATUS_EOSP)
c2c98fdeb5c897 Johannes Berg    2011-09-29  1002  			clear_sta_flag(sta, WLAN_STA_SP);
47086fc51aa222 Johannes Berg    2011-09-29  1003  
04ac3c0ee2c773 Felix Fietkau    2010-12-02  1004  		acked = !!(info->flags & IEEE80211_TX_STAT_ACK);
5972fa15b923df Markus Theil     2019-12-18  1005  		noack_success = !!(info->flags &
5972fa15b923df Markus Theil     2019-12-18  1006  				   IEEE80211_TX_STAT_NOACK_TRANSMITTED);
71f2c3470fca51 Masashi Honma    2016-08-02  1007  
71f2c3470fca51 Masashi Honma    2016-08-02  1008  		/* mesh Peer Service Period support */
71f2c3470fca51 Masashi Honma    2016-08-02  1009  		if (ieee80211_vif_is_mesh(&sta->sdata->vif) &&
71f2c3470fca51 Masashi Honma    2016-08-02  1010  		    ieee80211_is_data_qos(fc))
71f2c3470fca51 Masashi Honma    2016-08-02  1011  			ieee80211_mpsp_trigger_process(
71f2c3470fca51 Masashi Honma    2016-08-02  1012  				ieee80211_get_qos_ctl(hdr), sta, true, acked);
71f2c3470fca51 Masashi Honma    2016-08-02  1013  
30686bf7f5b3c3 Johannes Berg    2015-06-02  1014  		if (ieee80211_hw_check(&local->hw, HAS_RATE_CONTROL) &&
00a9a6d1e2f18c Chun-Yeow Yeoh   2014-04-02  1015  		    (ieee80211_is_data(hdr->frame_control)) &&
0c86980817853e Juuso Oikarinen  2010-04-22  1016  		    (rates_idx != -1))
1482c6ea0a99cb Ben Greear       2024-09-09  1017  			link_sta->tx_stats.last_rate =
e5a9f8d04660da Johannes Berg    2015-10-16  1018  				info->status.rates[rates_idx];
0c86980817853e Juuso Oikarinen  2010-04-22  1019  
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1020  		if ((info->flags & IEEE80211_TX_STAT_AMPDU_NO_BACK) &&
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1021  		    (ieee80211_is_data_qos(fc))) {
79c892b85027d5 Johannes Berg    2014-11-21  1022  			u16 ssn;
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1023  			u8 *qc;
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1024  
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1025  			qc = ieee80211_get_qos_ctl(hdr);
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1026  			tid = qc[0] & 0xf;
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1027  			ssn = ((le16_to_cpu(hdr->seq_ctrl) + 0x10)
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1028  						& IEEE80211_SCTL_SEQ);
8c771244fbab51 Felix Fietkau    2011-08-20  1029  			ieee80211_send_bar(&sta->sdata->vif, hdr->addr1,
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1030  					   tid, ssn);
79c892b85027d5 Johannes Berg    2014-11-21  1031  		} else if (ieee80211_is_data_qos(fc)) {
79c892b85027d5 Johannes Berg    2014-11-21  1032  			u8 *qc = ieee80211_get_qos_ctl(hdr);
79c892b85027d5 Johannes Berg    2014-11-21  1033  
79c892b85027d5 Johannes Berg    2014-11-21  1034  			tid = qc[0] & 0xf;
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1035  		}
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1036  
e69deded2bc29e Helmut Schaa     2011-08-11  1037  		if (!acked && ieee80211_is_back_req(fc)) {
79c892b85027d5 Johannes Berg    2014-11-21  1038  			u16 control;
7107676a3a4641 Felix Fietkau    2011-09-15  1039  
e69deded2bc29e Helmut Schaa     2011-08-11  1040  			/*
7107676a3a4641 Felix Fietkau    2011-09-15  1041  			 * BAR failed, store the last SSN and retry sending
7107676a3a4641 Felix Fietkau    2011-09-15  1042  			 * the BAR when the next unicast transmission on the
7107676a3a4641 Felix Fietkau    2011-09-15  1043  			 * same TID succeeds.
e69deded2bc29e Helmut Schaa     2011-08-11  1044  			 */
e69deded2bc29e Helmut Schaa     2011-08-11  1045  			bar = (struct ieee80211_bar *) skb->data;
7107676a3a4641 Felix Fietkau    2011-09-15  1046  			control = le16_to_cpu(bar->control);
7107676a3a4641 Felix Fietkau    2011-09-15  1047  			if (!(control & IEEE80211_BAR_CTRL_MULTI_TID)) {
f0425beda4d404 Felix Fietkau    2011-08-28  1048  				u16 ssn = le16_to_cpu(bar->start_seq_num);
f0425beda4d404 Felix Fietkau    2011-08-28  1049  
7107676a3a4641 Felix Fietkau    2011-09-15  1050  				tid = (control &
e69deded2bc29e Helmut Schaa     2011-08-11  1051  				       IEEE80211_BAR_CTRL_TID_INFO_MASK) >>
e69deded2bc29e Helmut Schaa     2011-08-11  1052  				      IEEE80211_BAR_CTRL_TID_INFO_SHIFT;
f0425beda4d404 Felix Fietkau    2011-08-28  1053  
f0425beda4d404 Felix Fietkau    2011-08-28  1054  				ieee80211_set_bar_pending(sta, tid, ssn);
e69deded2bc29e Helmut Schaa     2011-08-11  1055  			}
e69deded2bc29e Helmut Schaa     2011-08-11  1056  		}
e69deded2bc29e Helmut Schaa     2011-08-11  1057  
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1058  		if (info->flags & IEEE80211_TX_STAT_TX_FILTERED) {
1482c6ea0a99cb Ben Greear       2024-09-09  1059  			ieee80211_handle_filtered_frame(local, sta, skb, status);
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1060  			return;
3318111cf63d97 Felix Fietkau    2020-09-08  1061  		} else if (ieee80211_is_data_present(fc)) {
5972fa15b923df Markus Theil     2019-12-18  1062  			if (!acked && !noack_success)
1482c6ea0a99cb Ben Greear       2024-09-09 @1063  				link_sta->status_stats.msdu_failed[tid]++;
e5a9f8d04660da Johannes Berg    2015-10-16  1064  
1482c6ea0a99cb Ben Greear       2024-09-09 @1065  			link_sta->status_stats.msdu_retries[tid] +=
e5a9f8d04660da Johannes Berg    2015-10-16  1066  				retry_count;
79c892b85027d5 Johannes Berg    2014-11-21  1067  		}
0f78231bffb868 Johannes Berg    2009-12-01  1068  
04ac3c0ee2c773 Felix Fietkau    2010-12-02  1069  		if (!(info->flags & IEEE80211_TX_CTL_INJECTED) && acked)
0f78231bffb868 Johannes Berg    2009-12-01  1070  			ieee80211_frame_acked(sta, skb);
99ba2a14283be9 Johannes Berg    2010-11-24  1071  
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1072  	}
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1073  
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1074  	/* SNMP counters
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1075  	 * Fragments are passed to low-level drivers as separate skbs, so these
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1076  	 * are actually fragments, not frames. Update frame counters only for
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1077  	 * the first fragment of the frame. */
5cf16616e152dd Sujith Manoharan 2014-12-10  1078  	if ((info->flags & IEEE80211_TX_STAT_ACK) ||
5cf16616e152dd Sujith Manoharan 2014-12-10  1079  	    (info->flags & IEEE80211_TX_STAT_NOACK_TRANSMITTED)) {
adf5ace5d8161b Helmut Schaa     2011-12-08  1080  		if (ieee80211_is_first_frag(hdr->seq_ctrl)) {
c206ca670974ce Johannes Berg    2015-04-22  1081  			I802_DEBUG_INC(local->dot11TransmittedFrameCount);
85b89af07d5095 Eliad Peller     2014-12-21  1082  			if (is_multicast_ether_addr(ieee80211_get_DA(hdr)))
c206ca670974ce Johannes Berg    2015-04-22  1083  				I802_DEBUG_INC(local->dot11MulticastTransmittedFrameCount);
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1084  			if (retry_count > 0)
c206ca670974ce Johannes Berg    2015-04-22  1085  				I802_DEBUG_INC(local->dot11RetryCount);
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1086  			if (retry_count > 1)
c206ca670974ce Johannes Berg    2015-04-22  1087  				I802_DEBUG_INC(local->dot11MultipleRetryCount);
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1088  		}
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1089  
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1090  		/* This counter shall be incremented for an acknowledged MPDU
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1091  		 * with an individual address in the address 1 field or an MPDU
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1092  		 * with a multicast address in the address 1 field of type Data
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1093  		 * or Management. */
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1094  		if (!is_multicast_ether_addr(hdr->addr1) ||
adf5ace5d8161b Helmut Schaa     2011-12-08  1095  		    ieee80211_is_data(fc) ||
adf5ace5d8161b Helmut Schaa     2011-12-08  1096  		    ieee80211_is_mgmt(fc))
c206ca670974ce Johannes Berg    2015-04-22  1097  			I802_DEBUG_INC(local->dot11TransmittedFragmentCount);
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1098  	} else {
adf5ace5d8161b Helmut Schaa     2011-12-08  1099  		if (ieee80211_is_first_frag(hdr->seq_ctrl))
c206ca670974ce Johannes Berg    2015-04-22  1100  			I802_DEBUG_INC(local->dot11FailedCount);
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1101  	}
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1102  
30b2f0be23fb40 Thomas Pedersen  2020-01-13  1103  	if (ieee80211_is_any_nullfunc(fc) &&
08a5bdde381299 Thomas Pedersen  2019-11-18  1104  	    ieee80211_has_pm(fc) &&
30686bf7f5b3c3 Johannes Berg    2015-06-02  1105  	    ieee80211_hw_check(&local->hw, REPORTS_TX_ACK_STATUS) &&
375177bf35efc0 Vivek Natarajan  2010-02-09  1106  	    !(info->flags & IEEE80211_TX_CTL_INJECTED) &&
375177bf35efc0 Vivek Natarajan  2010-02-09  1107  	    local->ps_sdata && !(local->scanning)) {
6e899fa027addf Bassem Dawood    2021-02-27  1108  		if (info->flags & IEEE80211_TX_STAT_ACK)
375177bf35efc0 Vivek Natarajan  2010-02-09  1109  			local->ps_sdata->u.mgd.flags |=
375177bf35efc0 Vivek Natarajan  2010-02-09  1110  					IEEE80211_STA_NULLFUNC_ACKED;
6e899fa027addf Bassem Dawood    2021-02-27  1111  		mod_timer(&local->dynamic_ps_timer,
6e899fa027addf Bassem Dawood    2021-02-27  1112  			  jiffies + msecs_to_jiffies(10));
375177bf35efc0 Vivek Natarajan  2010-02-09  1113  	}
375177bf35efc0 Vivek Natarajan  2010-02-09  1114  
f9202638df3447 Avraham Stern    2022-01-26  1115  	ieee80211_report_used_skb(local, skb, false, status->ack_hwtstamp);
a729cff8ad5120 Johannes Berg    2011-11-06  1116  
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1117  	/* this was a transmitted frame, but now we want to reuse it */
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1118  	skb_orphan(skb);
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1119  
eaf55530c94cb7 Felix Fietkau    2010-03-11  1120  	/* Need to make a copy before skb->cb gets cleared */
eaf55530c94cb7 Felix Fietkau    2010-03-11  1121  	send_to_cooked = !!(info->flags & IEEE80211_TX_CTL_INJECTED) ||
adf5ace5d8161b Helmut Schaa     2011-12-08  1122  			 !(ieee80211_is_data(fc));
eaf55530c94cb7 Felix Fietkau    2010-03-11  1123  
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1124  	/*
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1125  	 * This is a bit racy but we can avoid a lot of work
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1126  	 * with this test...
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1127  	 */
eaf55530c94cb7 Felix Fietkau    2010-03-11  1128  	if (!local->monitors && (!send_to_cooked || !local->cooked_mntrs)) {
f02dff93e26bef Felix Fietkau    2020-09-08  1129  		if (status->free_list)
f02dff93e26bef Felix Fietkau    2020-09-08  1130  			list_add_tail(&skb->list, status->free_list);
f02dff93e26bef Felix Fietkau    2020-09-08  1131  		else
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1132  			dev_kfree_skb(skb);
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1133  		return;
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1134  	}
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1135  
4dc792b8f098ab Helmut Schaa     2015-09-02  1136  	/* send to monitor interfaces */
2400dfe23fa916 Johannes Berg    2023-08-29  1137  	ieee80211_tx_monitor(local, skb, retry_count,
b7b2e8caa08c30 John Crispin     2019-07-14  1138  			     send_to_cooked, status);
fe7a5d5c1ad659 Johannes Berg    2009-11-18  1139  }
5fe49a9d11644f Felix Fietkau    2017-04-26  1140  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
