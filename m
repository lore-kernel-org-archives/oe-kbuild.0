Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A101365
	for <oe-kbuild@lists.linux.dev>; Sun,  7 May 2023 03:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683428668; x=1714964668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N1s9Wsf7nHMaHO7ls3gMbbyHR74wWn42YpLAqj32Gm8=;
  b=hSfqs5YPhxAT4LAcTBSuRNtE5QHJoviyVYiINd7FE1Fi00Lmf/F8hmzv
   xsJWyp24ROKhdK5tg93vDpxV8B4Fzqv/on9jIG0/r0w0xVzB7cOpgB+xd
   iXiS71CNVwdu/+7M3wtUksY34Ogdxg/TCDyI4OaF8BLzfSipha3LEJa2V
   84pGQ4+ZnHXrqJwKvL9ACa/EoEmAJae0Zb488c62QK0trnxa9/wLQ3mdA
   PUldlIdh1lkFXg3zgIPTuIlqnMVrMIRaX1UHOkVxMd2cBiOl1rvWUL38j
   ZOA3oiFgXw3ziAKAvJkJEo6z/gYcbH7apeXSw+tMH40/K3ChkSES7jHyS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="351600300"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="351600300"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 20:04:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="648432699"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="648432699"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 May 2023 20:04:26 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvUhF-0000a5-3C;
	Sun, 07 May 2023 03:04:25 +0000
Date: Sun, 7 May 2023 11:03:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/ath/ath12k/wmi.c:5522 ath12k_mgmt_rx_event()
 warn: 'rx_ev.snr + -95' 4294967201 can't fit into 127 'status->signal'
Message-ID: <202305071153.kJIM2Y2U-lkp@intel.com>
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
TO: Kalle Valo <quic_kvalo@quicinc.com>
CC: Balamurugan Selvarajan <quic_bselvara@quicinc.com>
CC: Baochen Qiang <quic_bqiang@quicinc.com>
CC: Bhagavathi Perumal S <quic_bperumal@quicinc.com>
CC: Carl Huang <quic_cjhuang@quicinc.com>
CC: Jeff Johnson <quic_jjohnson@quicinc.com>
CC: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
CC: P Praneesh <quic_ppranees@quicinc.com>
CC: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
CC: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
CC: Sriram R <quic_srirrama@quicinc.com>
CC: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
CC: Wen Gong <quic_wgong@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc4354c6e5c21257cf4a50b32f7c11c7d65c55b3
commit: d889913205cf7ebda905b1e62c5867ed4e39f6c2 wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices
date:   5 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-m041-20230428 (https://download.01.org/0day-ci/archive/20230507/202305071153.kJIM2Y2U-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305071153.kJIM2Y2U-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/wmi.c:5522 ath12k_mgmt_rx_event() warn: 'rx_ev.snr + -95' 4294967201 can't fit into 127 'status->signal'
drivers/net/wireless/ath/ath12k/mac.c:1630 ath12k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_80'.
drivers/net/wireless/ath/ath12k/mac.c:1630 ath12k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_160'.
drivers/net/wireless/ath/ath12k/mac.c:1658 ath12k_peer_assoc_h_he() warn: mask and shift to zero: expr='(he_cap->he_cap_elem.mac_cap_info[3] & 24) >> 24'
drivers/net/wireless/ath/ath12k/mac.c:3699 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:4737 ath12k_mac_get_vdev_stats_id() warn: always true condition '(vdev_stats_id <= 255) => (0-255 <= 255)'
drivers/net/wireless/ath/ath12k/qmi.c:2384 ath12k_qmi_load_file_target_mem() error: uninitialized symbol 'ret'.
drivers/net/wireless/ath/ath12k/dp.c:210 ath12k_dp_srng_msi_setup() error: uninitialized symbol 'addr_lo'.
drivers/net/wireless/ath/ath12k/dp.c:211 ath12k_dp_srng_msi_setup() error: uninitialized symbol 'addr_hi'.
drivers/net/wireless/ath/ath12k/dp_rx.c:3981 ath12k_dp_rxdma_ring_sel_config_wcn7850() error: uninitialized symbol 'ret'.
drivers/net/wireless/ath/ath12k/ce.c:485 ath12k_ce_srng_msi_ring_params_setup() error: uninitialized symbol 'addr_lo'.
drivers/net/wireless/ath/ath12k/ce.c:486 ath12k_ce_srng_msi_ring_params_setup() error: uninitialized symbol 'addr_hi'.
drivers/net/wireless/ath/ath12k/dp_mon.c:2434 ath12k_dp_mon_rx_update_user_stats() warn: always true condition '(user_stats->nss <= 8) => (0-7 <= 8)'

Old smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:1087 ath12k_mac_op_config() error: uninitialized symbol 'ret'.
drivers/net/wireless/ath/ath12k/mac.c:1632 ath12k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_80'.
drivers/net/wireless/ath/ath12k/mac.c:3701 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/dp_rx.c:2690 ath12k_dp_rx_process() error: uninitialized symbol 'i'.
drivers/net/wireless/ath/ath12k/dp_mon.c:532 ath12k_dp_mon_parse_he_sig_su() warn: inconsistent indenting
drivers/net/wireless/ath/ath12k/dp_mon.c:623 ath12k_dp_mon_rx_parse_status_tlv() error: buffer overflow 'info' 6 <= 6
drivers/net/wireless/ath/ath12k/dp_mon.c:630 ath12k_dp_mon_rx_parse_status_tlv() error: buffer overflow 'info' 6 <= 6

vim +5522 drivers/net/wireless/ath/ath12k/wmi.c

d889913205cf7e Kalle Valo 2022-11-28  5456  
d889913205cf7e Kalle Valo 2022-11-28  5457  static void ath12k_mgmt_rx_event(struct ath12k_base *ab, struct sk_buff *skb)
d889913205cf7e Kalle Valo 2022-11-28  5458  {
d889913205cf7e Kalle Valo 2022-11-28  5459  	struct ath12k_wmi_mgmt_rx_arg rx_ev = {0};
d889913205cf7e Kalle Valo 2022-11-28  5460  	struct ath12k *ar;
d889913205cf7e Kalle Valo 2022-11-28  5461  	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
d889913205cf7e Kalle Valo 2022-11-28  5462  	struct ieee80211_hdr *hdr;
d889913205cf7e Kalle Valo 2022-11-28  5463  	u16 fc;
d889913205cf7e Kalle Valo 2022-11-28  5464  	struct ieee80211_supported_band *sband;
d889913205cf7e Kalle Valo 2022-11-28  5465  
d889913205cf7e Kalle Valo 2022-11-28  5466  	if (ath12k_pull_mgmt_rx_params_tlv(ab, skb, &rx_ev) != 0) {
d889913205cf7e Kalle Valo 2022-11-28  5467  		ath12k_warn(ab, "failed to extract mgmt rx event");
d889913205cf7e Kalle Valo 2022-11-28  5468  		dev_kfree_skb(skb);
d889913205cf7e Kalle Valo 2022-11-28  5469  		return;
d889913205cf7e Kalle Valo 2022-11-28  5470  	}
d889913205cf7e Kalle Valo 2022-11-28  5471  
d889913205cf7e Kalle Valo 2022-11-28  5472  	memset(status, 0, sizeof(*status));
d889913205cf7e Kalle Valo 2022-11-28  5473  
d889913205cf7e Kalle Valo 2022-11-28  5474  	ath12k_dbg(ab, ATH12K_DBG_MGMT, "mgmt rx event status %08x\n",
d889913205cf7e Kalle Valo 2022-11-28  5475  		   rx_ev.status);
d889913205cf7e Kalle Valo 2022-11-28  5476  
d889913205cf7e Kalle Valo 2022-11-28  5477  	rcu_read_lock();
d889913205cf7e Kalle Valo 2022-11-28  5478  	ar = ath12k_mac_get_ar_by_pdev_id(ab, rx_ev.pdev_id);
d889913205cf7e Kalle Valo 2022-11-28  5479  
d889913205cf7e Kalle Valo 2022-11-28  5480  	if (!ar) {
d889913205cf7e Kalle Valo 2022-11-28  5481  		ath12k_warn(ab, "invalid pdev_id %d in mgmt_rx_event\n",
d889913205cf7e Kalle Valo 2022-11-28  5482  			    rx_ev.pdev_id);
d889913205cf7e Kalle Valo 2022-11-28  5483  		dev_kfree_skb(skb);
d889913205cf7e Kalle Valo 2022-11-28  5484  		goto exit;
d889913205cf7e Kalle Valo 2022-11-28  5485  	}
d889913205cf7e Kalle Valo 2022-11-28  5486  
d889913205cf7e Kalle Valo 2022-11-28  5487  	if ((test_bit(ATH12K_CAC_RUNNING, &ar->dev_flags)) ||
d889913205cf7e Kalle Valo 2022-11-28  5488  	    (rx_ev.status & (WMI_RX_STATUS_ERR_DECRYPT |
d889913205cf7e Kalle Valo 2022-11-28  5489  			     WMI_RX_STATUS_ERR_KEY_CACHE_MISS |
d889913205cf7e Kalle Valo 2022-11-28  5490  			     WMI_RX_STATUS_ERR_CRC))) {
d889913205cf7e Kalle Valo 2022-11-28  5491  		dev_kfree_skb(skb);
d889913205cf7e Kalle Valo 2022-11-28  5492  		goto exit;
d889913205cf7e Kalle Valo 2022-11-28  5493  	}
d889913205cf7e Kalle Valo 2022-11-28  5494  
d889913205cf7e Kalle Valo 2022-11-28  5495  	if (rx_ev.status & WMI_RX_STATUS_ERR_MIC)
d889913205cf7e Kalle Valo 2022-11-28  5496  		status->flag |= RX_FLAG_MMIC_ERROR;
d889913205cf7e Kalle Valo 2022-11-28  5497  
d889913205cf7e Kalle Valo 2022-11-28  5498  	if (rx_ev.chan_freq >= ATH12K_MIN_6G_FREQ) {
d889913205cf7e Kalle Valo 2022-11-28  5499  		status->band = NL80211_BAND_6GHZ;
d889913205cf7e Kalle Valo 2022-11-28  5500  	} else if (rx_ev.channel >= 1 && rx_ev.channel <= 14) {
d889913205cf7e Kalle Valo 2022-11-28  5501  		status->band = NL80211_BAND_2GHZ;
d889913205cf7e Kalle Valo 2022-11-28  5502  	} else if (rx_ev.channel >= 36 && rx_ev.channel <= ATH12K_MAX_5G_CHAN) {
d889913205cf7e Kalle Valo 2022-11-28  5503  		status->band = NL80211_BAND_5GHZ;
d889913205cf7e Kalle Valo 2022-11-28  5504  	} else {
d889913205cf7e Kalle Valo 2022-11-28  5505  		/* Shouldn't happen unless list of advertised channels to
d889913205cf7e Kalle Valo 2022-11-28  5506  		 * mac80211 has been changed.
d889913205cf7e Kalle Valo 2022-11-28  5507  		 */
d889913205cf7e Kalle Valo 2022-11-28  5508  		WARN_ON_ONCE(1);
d889913205cf7e Kalle Valo 2022-11-28  5509  		dev_kfree_skb(skb);
d889913205cf7e Kalle Valo 2022-11-28  5510  		goto exit;
d889913205cf7e Kalle Valo 2022-11-28  5511  	}
d889913205cf7e Kalle Valo 2022-11-28  5512  
d889913205cf7e Kalle Valo 2022-11-28  5513  	if (rx_ev.phy_mode == MODE_11B &&
d889913205cf7e Kalle Valo 2022-11-28  5514  	    (status->band == NL80211_BAND_5GHZ || status->band == NL80211_BAND_6GHZ))
d889913205cf7e Kalle Valo 2022-11-28  5515  		ath12k_dbg(ab, ATH12K_DBG_WMI,
d889913205cf7e Kalle Valo 2022-11-28  5516  			   "wmi mgmt rx 11b (CCK) on 5/6GHz, band = %d\n", status->band);
d889913205cf7e Kalle Valo 2022-11-28  5517  
d889913205cf7e Kalle Valo 2022-11-28  5518  	sband = &ar->mac.sbands[status->band];
d889913205cf7e Kalle Valo 2022-11-28  5519  
d889913205cf7e Kalle Valo 2022-11-28  5520  	status->freq = ieee80211_channel_to_frequency(rx_ev.channel,
d889913205cf7e Kalle Valo 2022-11-28  5521  						      status->band);
d889913205cf7e Kalle Valo 2022-11-28 @5522  	status->signal = rx_ev.snr + ATH12K_DEFAULT_NOISE_FLOOR;
d889913205cf7e Kalle Valo 2022-11-28  5523  	status->rate_idx = ath12k_mac_bitrate_to_idx(sband, rx_ev.rate / 100);
d889913205cf7e Kalle Valo 2022-11-28  5524  
d889913205cf7e Kalle Valo 2022-11-28  5525  	hdr = (struct ieee80211_hdr *)skb->data;
d889913205cf7e Kalle Valo 2022-11-28  5526  	fc = le16_to_cpu(hdr->frame_control);
d889913205cf7e Kalle Valo 2022-11-28  5527  
d889913205cf7e Kalle Valo 2022-11-28  5528  	/* Firmware is guaranteed to report all essential management frames via
d889913205cf7e Kalle Valo 2022-11-28  5529  	 * WMI while it can deliver some extra via HTT. Since there can be
d889913205cf7e Kalle Valo 2022-11-28  5530  	 * duplicates split the reporting wrt monitor/sniffing.
d889913205cf7e Kalle Valo 2022-11-28  5531  	 */
d889913205cf7e Kalle Valo 2022-11-28  5532  	status->flag |= RX_FLAG_SKIP_MONITOR;
d889913205cf7e Kalle Valo 2022-11-28  5533  
d889913205cf7e Kalle Valo 2022-11-28  5534  	/* In case of PMF, FW delivers decrypted frames with Protected Bit set
d889913205cf7e Kalle Valo 2022-11-28  5535  	 * including group privacy action frames.
d889913205cf7e Kalle Valo 2022-11-28  5536  	 */
d889913205cf7e Kalle Valo 2022-11-28  5537  	if (ieee80211_has_protected(hdr->frame_control)) {
d889913205cf7e Kalle Valo 2022-11-28  5538  		status->flag |= RX_FLAG_DECRYPTED;
d889913205cf7e Kalle Valo 2022-11-28  5539  
d889913205cf7e Kalle Valo 2022-11-28  5540  		if (!ieee80211_is_robust_mgmt_frame(skb)) {
d889913205cf7e Kalle Valo 2022-11-28  5541  			status->flag |= RX_FLAG_IV_STRIPPED |
d889913205cf7e Kalle Valo 2022-11-28  5542  					RX_FLAG_MMIC_STRIPPED;
d889913205cf7e Kalle Valo 2022-11-28  5543  			hdr->frame_control = __cpu_to_le16(fc &
d889913205cf7e Kalle Valo 2022-11-28  5544  					     ~IEEE80211_FCTL_PROTECTED);
d889913205cf7e Kalle Valo 2022-11-28  5545  		}
d889913205cf7e Kalle Valo 2022-11-28  5546  	}
d889913205cf7e Kalle Valo 2022-11-28  5547  
d889913205cf7e Kalle Valo 2022-11-28  5548  	/* TODO: Pending handle beacon implementation
d889913205cf7e Kalle Valo 2022-11-28  5549  	 *if (ieee80211_is_beacon(hdr->frame_control))
d889913205cf7e Kalle Valo 2022-11-28  5550  	 *	ath12k_mac_handle_beacon(ar, skb);
d889913205cf7e Kalle Valo 2022-11-28  5551  	 */
d889913205cf7e Kalle Valo 2022-11-28  5552  
d889913205cf7e Kalle Valo 2022-11-28  5553  	ath12k_dbg(ab, ATH12K_DBG_MGMT,
d889913205cf7e Kalle Valo 2022-11-28  5554  		   "event mgmt rx skb %pK len %d ftype %02x stype %02x\n",
d889913205cf7e Kalle Valo 2022-11-28  5555  		   skb, skb->len,
d889913205cf7e Kalle Valo 2022-11-28  5556  		   fc & IEEE80211_FCTL_FTYPE, fc & IEEE80211_FCTL_STYPE);
d889913205cf7e Kalle Valo 2022-11-28  5557  
d889913205cf7e Kalle Valo 2022-11-28  5558  	ath12k_dbg(ab, ATH12K_DBG_MGMT,
d889913205cf7e Kalle Valo 2022-11-28  5559  		   "event mgmt rx freq %d band %d snr %d, rate_idx %d\n",
d889913205cf7e Kalle Valo 2022-11-28  5560  		   status->freq, status->band, status->signal,
d889913205cf7e Kalle Valo 2022-11-28  5561  		   status->rate_idx);
d889913205cf7e Kalle Valo 2022-11-28  5562  
d889913205cf7e Kalle Valo 2022-11-28  5563  	ieee80211_rx_ni(ar->hw, skb);
d889913205cf7e Kalle Valo 2022-11-28  5564  
d889913205cf7e Kalle Valo 2022-11-28  5565  exit:
d889913205cf7e Kalle Valo 2022-11-28  5566  	rcu_read_unlock();
d889913205cf7e Kalle Valo 2022-11-28  5567  }
d889913205cf7e Kalle Valo 2022-11-28  5568  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
