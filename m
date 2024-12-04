Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA994186E52
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Dec 2024 06:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733294591; cv=none; b=kwhCsY/auVcfAaEghY+yDfX6Xf9WjEVId9TrxOH+XIroGHeurbDIsSj29aVMGcucZWC3ZT8dwy0hjkJ8uCvne0S2aSLCg8KmZmVS6KyVh2X73okyPyyc9IMbK/SzdnDEFeBnB0+aYCbw5wpG8AvQBnkEK4k0X6yg4/57vAMqs68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733294591; c=relaxed/simple;
	bh=MMRxRiexZvoZlc+T8+Zj61V8vuLKDWJSSvw9EL7VUzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=feuQMiUk2BwllrzuGUn431mN4YsOCw0kJhzLKdpWOHFgpyNgkdWX4e6w6hXu13hH1hORHYmFcOwyCUSgFm3Q8ZflFwDwF9eLEdN1jq8ER6kPXIJAxllBSweivrTGlKF1tWDEC4G0jNxthml/UROjjkREjgjgTfmXo4J0GLbBLdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1AoRPCf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1AoRPCf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733294589; x=1764830589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MMRxRiexZvoZlc+T8+Zj61V8vuLKDWJSSvw9EL7VUzI=;
  b=B1AoRPCfipXU+nJCk6UvUdzmM40dddQoQeRX/QhXgjMM/EDqW94SlP5r
   iHSZghjS/r2G5Zu9fw9H45z629EKkS64VrqDXOSK9lDAD4KdhcXlHiJnz
   /3ZHv6z4r7VrihvatlrZ87y2rFmM+HbVwHtE1u5x7RLGH2S/1TtReJYbY
   /oReICsc1sEhFYxfAtb5sBoNWZm/6f+kQX8XV1LjVfjEevEjtM7WUUwav
   POTeRaMny9anhUauhCHGXuykOcrrqKzYR6g8w1td7e6pzX8LCAdbdr1AD
   EZ2ShGjvjOm6LJy/P7O4/54NP4sRAF4dETL26XIygrL9LWS1uUGTX4oSV
   g==;
X-CSE-ConnectionGUID: xpUtqHL3QPaRWYBI88XHqg==
X-CSE-MsgGUID: 1gpbdwbuSfy3D13hSp9FhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="32885426"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="32885426"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 22:43:09 -0800
X-CSE-ConnectionGUID: 4T4MCRqPRqWPF0vZUNR1Ag==
X-CSE-MsgGUID: tJJQQ8fmTHCq6soXo68nhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="124602680"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 03 Dec 2024 22:43:08 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIj6H-0002fr-1G;
	Wed, 04 Dec 2024 06:43:05 +0000
Date: Wed, 4 Dec 2024 14:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/ath/ath11k/wmi.c:5740 ath11k_mgmt_rx_event()
 warn: 'rx_ev.snr + -95' 4294967201 can't fit into 127 'status->signal'
Message-ID: <202412041446.hU8vlWHJ-lkp@intel.com>
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
TO: Carl Huang <cjhuang@codeaurora.org>
CC: Kalle Valo <kvalo@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   feffde684ac29a3b7aec82d2df850fbdbdee55e4
commit: 322b60ceb0f321b4b9c41717f7306c0dbaf0279b ath11k: do not depend on ARCH_QCOM for ath11k
date:   4 years, 4 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 years, 4 months ago
config: i386-randconfig-141-20241120 (https://download.01.org/0day-ci/archive/20241204/202412041446.hU8vlWHJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412041446.hU8vlWHJ-lkp@intel.com/

smatch warnings:
drivers/net/wireless/ath/ath11k/wmi.c:5740 ath11k_mgmt_rx_event() warn: 'rx_ev.snr + -95' 4294967201 can't fit into 127 'status->signal'
drivers/net/wireless/ath/ath11k/htc.c:266 ath11k_htc_rx_completion_handler() warn: potential spectre issue 'htc->endpoint' [r] (local cap)
drivers/net/wireless/ath/ath11k/dp_rx.c:1527 ath11k_htt_backpressure_event_handler() warn: potential spectre issue 'ab->soc_stats.bp_stats.umac_ring_bp_stats' [r]

vim +5740 drivers/net/wireless/ath/ath11k/wmi.c

d5c65159f28953 Kalle Valo             2019-11-23  5675  
d5c65159f28953 Kalle Valo             2019-11-23  5676  static void ath11k_mgmt_rx_event(struct ath11k_base *ab, struct sk_buff *skb)
d5c65159f28953 Kalle Valo             2019-11-23  5677  {
d5c65159f28953 Kalle Valo             2019-11-23  5678  	struct mgmt_rx_event_params rx_ev = {0};
d5c65159f28953 Kalle Valo             2019-11-23  5679  	struct ath11k *ar;
d5c65159f28953 Kalle Valo             2019-11-23  5680  	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
d5c65159f28953 Kalle Valo             2019-11-23  5681  	struct ieee80211_hdr *hdr;
d5c65159f28953 Kalle Valo             2019-11-23  5682  	u16 fc;
d5c65159f28953 Kalle Valo             2019-11-23  5683  	struct ieee80211_supported_band *sband;
d5c65159f28953 Kalle Valo             2019-11-23  5684  
d5c65159f28953 Kalle Valo             2019-11-23  5685  	if (ath11k_pull_mgmt_rx_params_tlv(ab, skb, &rx_ev) != 0) {
d5c65159f28953 Kalle Valo             2019-11-23  5686  		ath11k_warn(ab, "failed to extract mgmt rx event");
d5c65159f28953 Kalle Valo             2019-11-23  5687  		dev_kfree_skb(skb);
d5c65159f28953 Kalle Valo             2019-11-23  5688  		return;
d5c65159f28953 Kalle Valo             2019-11-23  5689  	}
d5c65159f28953 Kalle Valo             2019-11-23  5690  
d5c65159f28953 Kalle Valo             2019-11-23  5691  	memset(status, 0, sizeof(*status));
d5c65159f28953 Kalle Valo             2019-11-23  5692  
d5c65159f28953 Kalle Valo             2019-11-23  5693  	ath11k_dbg(ab, ATH11K_DBG_MGMT, "mgmt rx event status %08x\n",
d5c65159f28953 Kalle Valo             2019-11-23  5694  		   rx_ev.status);
d5c65159f28953 Kalle Valo             2019-11-23  5695  
d5c65159f28953 Kalle Valo             2019-11-23  5696  	rcu_read_lock();
d5c65159f28953 Kalle Valo             2019-11-23  5697  	ar = ath11k_mac_get_ar_by_pdev_id(ab, rx_ev.pdev_id);
d5c65159f28953 Kalle Valo             2019-11-23  5698  
d5c65159f28953 Kalle Valo             2019-11-23  5699  	if (!ar) {
d5c65159f28953 Kalle Valo             2019-11-23  5700  		ath11k_warn(ab, "invalid pdev_id %d in mgmt_rx_event\n",
d5c65159f28953 Kalle Valo             2019-11-23  5701  			    rx_ev.pdev_id);
d5c65159f28953 Kalle Valo             2019-11-23  5702  		dev_kfree_skb(skb);
d5c65159f28953 Kalle Valo             2019-11-23  5703  		goto exit;
d5c65159f28953 Kalle Valo             2019-11-23  5704  	}
d5c65159f28953 Kalle Valo             2019-11-23  5705  
d5c65159f28953 Kalle Valo             2019-11-23  5706  	if ((test_bit(ATH11K_CAC_RUNNING, &ar->dev_flags)) ||
d5c65159f28953 Kalle Valo             2019-11-23  5707  	    (rx_ev.status & (WMI_RX_STATUS_ERR_DECRYPT |
d5c65159f28953 Kalle Valo             2019-11-23  5708  	    WMI_RX_STATUS_ERR_KEY_CACHE_MISS | WMI_RX_STATUS_ERR_CRC))) {
d5c65159f28953 Kalle Valo             2019-11-23  5709  		dev_kfree_skb(skb);
d5c65159f28953 Kalle Valo             2019-11-23  5710  		goto exit;
d5c65159f28953 Kalle Valo             2019-11-23  5711  	}
d5c65159f28953 Kalle Valo             2019-11-23  5712  
d5c65159f28953 Kalle Valo             2019-11-23  5713  	if (rx_ev.status & WMI_RX_STATUS_ERR_MIC)
d5c65159f28953 Kalle Valo             2019-11-23  5714  		status->flag |= RX_FLAG_MMIC_ERROR;
d5c65159f28953 Kalle Valo             2019-11-23  5715  
5dcf42f8b79d14 Pradeep Kumar Chitrapu 2020-06-09  5716  	if (rx_ev.chan_freq >= ATH11K_MIN_6G_FREQ) {
5dcf42f8b79d14 Pradeep Kumar Chitrapu 2020-06-09  5717  		status->band = NL80211_BAND_6GHZ;
5dcf42f8b79d14 Pradeep Kumar Chitrapu 2020-06-09  5718  	} else if (rx_ev.channel >= 1 && rx_ev.channel <= 14) {
d5c65159f28953 Kalle Valo             2019-11-23  5719  		status->band = NL80211_BAND_2GHZ;
d5c65159f28953 Kalle Valo             2019-11-23  5720  	} else if (rx_ev.channel >= 36 && rx_ev.channel <= ATH11K_MAX_5G_CHAN) {
d5c65159f28953 Kalle Valo             2019-11-23  5721  		status->band = NL80211_BAND_5GHZ;
d5c65159f28953 Kalle Valo             2019-11-23  5722  	} else {
d5c65159f28953 Kalle Valo             2019-11-23  5723  		/* Shouldn't happen unless list of advertised channels to
d5c65159f28953 Kalle Valo             2019-11-23  5724  		 * mac80211 has been changed.
d5c65159f28953 Kalle Valo             2019-11-23  5725  		 */
d5c65159f28953 Kalle Valo             2019-11-23  5726  		WARN_ON_ONCE(1);
d5c65159f28953 Kalle Valo             2019-11-23  5727  		dev_kfree_skb(skb);
d5c65159f28953 Kalle Valo             2019-11-23  5728  		goto exit;
d5c65159f28953 Kalle Valo             2019-11-23  5729  	}
d5c65159f28953 Kalle Valo             2019-11-23  5730  
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  5731  	if (rx_ev.phy_mode == MODE_11B &&
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  5732  	    (status->band == NL80211_BAND_5GHZ || status->band == NL80211_BAND_6GHZ))
d5c65159f28953 Kalle Valo             2019-11-23  5733  		ath11k_dbg(ab, ATH11K_DBG_WMI,
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  5734  			   "wmi mgmt rx 11b (CCK) on 5/6GHz, band = %d\n", status->band);
d5c65159f28953 Kalle Valo             2019-11-23  5735  
d5c65159f28953 Kalle Valo             2019-11-23  5736  	sband = &ar->mac.sbands[status->band];
d5c65159f28953 Kalle Valo             2019-11-23  5737  
d5c65159f28953 Kalle Valo             2019-11-23  5738  	status->freq = ieee80211_channel_to_frequency(rx_ev.channel,
d5c65159f28953 Kalle Valo             2019-11-23  5739  						      status->band);
d5c65159f28953 Kalle Valo             2019-11-23 @5740  	status->signal = rx_ev.snr + ATH11K_DEFAULT_NOISE_FLOOR;
d5c65159f28953 Kalle Valo             2019-11-23  5741  	status->rate_idx = ath11k_mac_bitrate_to_idx(sband, rx_ev.rate / 100);
d5c65159f28953 Kalle Valo             2019-11-23  5742  
d5c65159f28953 Kalle Valo             2019-11-23  5743  	hdr = (struct ieee80211_hdr *)skb->data;
d5c65159f28953 Kalle Valo             2019-11-23  5744  	fc = le16_to_cpu(hdr->frame_control);
d5c65159f28953 Kalle Valo             2019-11-23  5745  
d5c65159f28953 Kalle Valo             2019-11-23  5746  	/* Firmware is guaranteed to report all essential management frames via
d5c65159f28953 Kalle Valo             2019-11-23  5747  	 * WMI while it can deliver some extra via HTT. Since there can be
d5c65159f28953 Kalle Valo             2019-11-23  5748  	 * duplicates split the reporting wrt monitor/sniffing.
d5c65159f28953 Kalle Valo             2019-11-23  5749  	 */
d5c65159f28953 Kalle Valo             2019-11-23  5750  	status->flag |= RX_FLAG_SKIP_MONITOR;
d5c65159f28953 Kalle Valo             2019-11-23  5751  
d5c65159f28953 Kalle Valo             2019-11-23  5752  	/* In case of PMF, FW delivers decrypted frames with Protected Bit set.
d5c65159f28953 Kalle Valo             2019-11-23  5753  	 * Don't clear that. Also, FW delivers broadcast management frames
d5c65159f28953 Kalle Valo             2019-11-23  5754  	 * (ex: group privacy action frames in mesh) as encrypted payload.
d5c65159f28953 Kalle Valo             2019-11-23  5755  	 */
d5c65159f28953 Kalle Valo             2019-11-23  5756  	if (ieee80211_has_protected(hdr->frame_control) &&
d5c65159f28953 Kalle Valo             2019-11-23  5757  	    !is_multicast_ether_addr(ieee80211_get_DA(hdr))) {
d5c65159f28953 Kalle Valo             2019-11-23  5758  		status->flag |= RX_FLAG_DECRYPTED;
d5c65159f28953 Kalle Valo             2019-11-23  5759  
d5c65159f28953 Kalle Valo             2019-11-23  5760  		if (!ieee80211_is_robust_mgmt_frame(skb)) {
d5c65159f28953 Kalle Valo             2019-11-23  5761  			status->flag |= RX_FLAG_IV_STRIPPED |
d5c65159f28953 Kalle Valo             2019-11-23  5762  					RX_FLAG_MMIC_STRIPPED;
d5c65159f28953 Kalle Valo             2019-11-23  5763  			hdr->frame_control = __cpu_to_le16(fc &
d5c65159f28953 Kalle Valo             2019-11-23  5764  					     ~IEEE80211_FCTL_PROTECTED);
d5c65159f28953 Kalle Valo             2019-11-23  5765  		}
d5c65159f28953 Kalle Valo             2019-11-23  5766  	}
d5c65159f28953 Kalle Valo             2019-11-23  5767  
d5c65159f28953 Kalle Valo             2019-11-23  5768  	/* TODO: Pending handle beacon implementation
d5c65159f28953 Kalle Valo             2019-11-23  5769  	 *if (ieee80211_is_beacon(hdr->frame_control))
d5c65159f28953 Kalle Valo             2019-11-23  5770  	 *	ath11k_mac_handle_beacon(ar, skb);
d5c65159f28953 Kalle Valo             2019-11-23  5771  	 */
d5c65159f28953 Kalle Valo             2019-11-23  5772  
d5c65159f28953 Kalle Valo             2019-11-23  5773  	ath11k_dbg(ab, ATH11K_DBG_MGMT,
d5c65159f28953 Kalle Valo             2019-11-23  5774  		   "event mgmt rx skb %pK len %d ftype %02x stype %02x\n",
d5c65159f28953 Kalle Valo             2019-11-23  5775  		   skb, skb->len,
d5c65159f28953 Kalle Valo             2019-11-23  5776  		   fc & IEEE80211_FCTL_FTYPE, fc & IEEE80211_FCTL_STYPE);
d5c65159f28953 Kalle Valo             2019-11-23  5777  
d5c65159f28953 Kalle Valo             2019-11-23  5778  	ath11k_dbg(ab, ATH11K_DBG_MGMT,
d5c65159f28953 Kalle Valo             2019-11-23  5779  		   "event mgmt rx freq %d band %d snr %d, rate_idx %d\n",
d5c65159f28953 Kalle Valo             2019-11-23  5780  		   status->freq, status->band, status->signal,
d5c65159f28953 Kalle Valo             2019-11-23  5781  		   status->rate_idx);
d5c65159f28953 Kalle Valo             2019-11-23  5782  
d5c65159f28953 Kalle Valo             2019-11-23  5783  	ieee80211_rx_ni(ar->hw, skb);
d5c65159f28953 Kalle Valo             2019-11-23  5784  
d5c65159f28953 Kalle Valo             2019-11-23  5785  exit:
d5c65159f28953 Kalle Valo             2019-11-23  5786  	rcu_read_unlock();
d5c65159f28953 Kalle Valo             2019-11-23  5787  }
d5c65159f28953 Kalle Valo             2019-11-23  5788  

:::::: The code at line 5740 was first introduced by commit
:::::: d5c65159f2895379e11ca13f62feabe93278985d ath11k: driver for Qualcomm IEEE 802.11ax devices

:::::: TO: Kalle Valo <kvalo@codeaurora.org>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
