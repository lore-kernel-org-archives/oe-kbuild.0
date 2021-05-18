Content-Type: multipart/mixed; boundary="===============4116001503674872338=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/ath/ath11k/wmi.c:5740 ath11k_mgmt_rx_event() warn: 'rx_ev.snr + -95' 4294967201 can't fit into 127 'status->signal'
Date: Wed, 19 May 2021 03:33:13 +0800
Message-ID: <202105190310.oBHjSxy4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4116001503674872338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Carl Huang <cjhuang@codeaurora.org>
CC: Kalle Valo <kvalo@codeaurora.org>

Hi Carl,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8ac91e6c6033ebc12c5c1e4aa171b81a662bd70f
commit: 322b60ceb0f321b4b9c41717f7306c0dbaf0279b ath11k: do not depend on A=
RCH_QCOM for ath11k
date:   9 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 9 months ago
config: openrisc-randconfig-m031-20210518 (attached as .config)
compiler: or1k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/wireless/ath/ath11k/wmi.c:5740 ath11k_mgmt_rx_event() warn: 'rx=
_ev.snr + -95' 4294967201 can't fit into 127 'status->signal'
drivers/net/wireless/ath/ath11k/htc.c:266 ath11k_htc_rx_completion_handler(=
) warn: potential spectre issue 'htc->endpoint' [r] (local cap)
drivers/net/wireless/ath/ath11k/dp_rx.c:1527 ath11k_htt_backpressure_event_=
handler() warn: potential spectre issue 'ab->soc_stats.bp_stats.umac_ring_b=
p_stats' [r] (local cap)
drivers/net/wireless/ath/ath11k/dp_rx.c:1534 ath11k_htt_backpressure_event_=
handler() warn: potential spectre issue 'ab->soc_stats.bp_stats.lmac_ring_b=
p_stats' [r] (local cap)
drivers/net/wireless/ath/ath11k/dp_rx.c:1534 ath11k_htt_backpressure_event_=
handler() warn: potential spectre issue 'ab->soc_stats.bp_stats.lmac_ring_b=
p_stats[ring_id]' [r] (local cap)

vim +5740 drivers/net/wireless/ath/ath11k/wmi.c

d5c65159f28953 Kalle Valo             2019-11-23  5675  =

d5c65159f28953 Kalle Valo             2019-11-23  5676  static void ath11k_=
mgmt_rx_event(struct ath11k_base *ab, struct sk_buff *skb)
d5c65159f28953 Kalle Valo             2019-11-23  5677  {
d5c65159f28953 Kalle Valo             2019-11-23  5678  	struct mgmt_rx_eve=
nt_params rx_ev =3D {0};
d5c65159f28953 Kalle Valo             2019-11-23  5679  	struct ath11k *ar;
d5c65159f28953 Kalle Valo             2019-11-23  5680  	struct ieee80211_r=
x_status *status =3D IEEE80211_SKB_RXCB(skb);
d5c65159f28953 Kalle Valo             2019-11-23  5681  	struct ieee80211_h=
dr *hdr;
d5c65159f28953 Kalle Valo             2019-11-23  5682  	u16 fc;
d5c65159f28953 Kalle Valo             2019-11-23  5683  	struct ieee80211_s=
upported_band *sband;
d5c65159f28953 Kalle Valo             2019-11-23  5684  =

d5c65159f28953 Kalle Valo             2019-11-23  5685  	if (ath11k_pull_mg=
mt_rx_params_tlv(ab, skb, &rx_ev) !=3D 0) {
d5c65159f28953 Kalle Valo             2019-11-23  5686  		ath11k_warn(ab, "=
failed to extract mgmt rx event");
d5c65159f28953 Kalle Valo             2019-11-23  5687  		dev_kfree_skb(skb=
);
d5c65159f28953 Kalle Valo             2019-11-23  5688  		return;
d5c65159f28953 Kalle Valo             2019-11-23  5689  	}
d5c65159f28953 Kalle Valo             2019-11-23  5690  =

d5c65159f28953 Kalle Valo             2019-11-23  5691  	memset(status, 0, =
sizeof(*status));
d5c65159f28953 Kalle Valo             2019-11-23  5692  =

d5c65159f28953 Kalle Valo             2019-11-23  5693  	ath11k_dbg(ab, ATH=
11K_DBG_MGMT, "mgmt rx event status %08x\n",
d5c65159f28953 Kalle Valo             2019-11-23  5694  		   rx_ev.status);
d5c65159f28953 Kalle Valo             2019-11-23  5695  =

d5c65159f28953 Kalle Valo             2019-11-23  5696  	rcu_read_lock();
d5c65159f28953 Kalle Valo             2019-11-23  5697  	ar =3D ath11k_mac_=
get_ar_by_pdev_id(ab, rx_ev.pdev_id);
d5c65159f28953 Kalle Valo             2019-11-23  5698  =

d5c65159f28953 Kalle Valo             2019-11-23  5699  	if (!ar) {
d5c65159f28953 Kalle Valo             2019-11-23  5700  		ath11k_warn(ab, "=
invalid pdev_id %d in mgmt_rx_event\n",
d5c65159f28953 Kalle Valo             2019-11-23  5701  			    rx_ev.pdev_i=
d);
d5c65159f28953 Kalle Valo             2019-11-23  5702  		dev_kfree_skb(skb=
);
d5c65159f28953 Kalle Valo             2019-11-23  5703  		goto exit;
d5c65159f28953 Kalle Valo             2019-11-23  5704  	}
d5c65159f28953 Kalle Valo             2019-11-23  5705  =

d5c65159f28953 Kalle Valo             2019-11-23  5706  	if ((test_bit(ATH1=
1K_CAC_RUNNING, &ar->dev_flags)) ||
d5c65159f28953 Kalle Valo             2019-11-23  5707  	    (rx_ev.status =
& (WMI_RX_STATUS_ERR_DECRYPT |
d5c65159f28953 Kalle Valo             2019-11-23  5708  	    WMI_RX_STATUS_=
ERR_KEY_CACHE_MISS | WMI_RX_STATUS_ERR_CRC))) {
d5c65159f28953 Kalle Valo             2019-11-23  5709  		dev_kfree_skb(skb=
);
d5c65159f28953 Kalle Valo             2019-11-23  5710  		goto exit;
d5c65159f28953 Kalle Valo             2019-11-23  5711  	}
d5c65159f28953 Kalle Valo             2019-11-23  5712  =

d5c65159f28953 Kalle Valo             2019-11-23  5713  	if (rx_ev.status &=
 WMI_RX_STATUS_ERR_MIC)
d5c65159f28953 Kalle Valo             2019-11-23  5714  		status->flag |=3D=
 RX_FLAG_MMIC_ERROR;
d5c65159f28953 Kalle Valo             2019-11-23  5715  =

5dcf42f8b79d14 Pradeep Kumar Chitrapu 2020-06-09  5716  	if (rx_ev.chan_fre=
q >=3D ATH11K_MIN_6G_FREQ) {
5dcf42f8b79d14 Pradeep Kumar Chitrapu 2020-06-09  5717  		status->band =3D =
NL80211_BAND_6GHZ;
5dcf42f8b79d14 Pradeep Kumar Chitrapu 2020-06-09  5718  	} else if (rx_ev.c=
hannel >=3D 1 && rx_ev.channel <=3D 14) {
d5c65159f28953 Kalle Valo             2019-11-23  5719  		status->band =3D =
NL80211_BAND_2GHZ;
d5c65159f28953 Kalle Valo             2019-11-23  5720  	} else if (rx_ev.c=
hannel >=3D 36 && rx_ev.channel <=3D ATH11K_MAX_5G_CHAN) {
d5c65159f28953 Kalle Valo             2019-11-23  5721  		status->band =3D =
NL80211_BAND_5GHZ;
d5c65159f28953 Kalle Valo             2019-11-23  5722  	} else {
d5c65159f28953 Kalle Valo             2019-11-23  5723  		/* Shouldn't happ=
en unless list of advertised channels to
d5c65159f28953 Kalle Valo             2019-11-23  5724  		 * mac80211 has b=
een changed.
d5c65159f28953 Kalle Valo             2019-11-23  5725  		 */
d5c65159f28953 Kalle Valo             2019-11-23  5726  		WARN_ON_ONCE(1);
d5c65159f28953 Kalle Valo             2019-11-23  5727  		dev_kfree_skb(skb=
);
d5c65159f28953 Kalle Valo             2019-11-23  5728  		goto exit;
d5c65159f28953 Kalle Valo             2019-11-23  5729  	}
d5c65159f28953 Kalle Valo             2019-11-23  5730  =

22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  5731  	if (rx_ev.phy_mode=
 =3D=3D MODE_11B &&
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  5732  	    (status->band =
=3D=3D NL80211_BAND_5GHZ || status->band =3D=3D NL80211_BAND_6GHZ))
d5c65159f28953 Kalle Valo             2019-11-23  5733  		ath11k_dbg(ab, AT=
H11K_DBG_WMI,
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  5734  			   "wmi mgmt rx =
11b (CCK) on 5/6GHz, band =3D %d\n", status->band);
d5c65159f28953 Kalle Valo             2019-11-23  5735  =

d5c65159f28953 Kalle Valo             2019-11-23  5736  	sband =3D &ar->mac=
.sbands[status->band];
d5c65159f28953 Kalle Valo             2019-11-23  5737  =

d5c65159f28953 Kalle Valo             2019-11-23  5738  	status->freq =3D i=
eee80211_channel_to_frequency(rx_ev.channel,
d5c65159f28953 Kalle Valo             2019-11-23  5739  						      status-=
>band);
d5c65159f28953 Kalle Valo             2019-11-23 @5740  	status->signal =3D=
 rx_ev.snr + ATH11K_DEFAULT_NOISE_FLOOR;
d5c65159f28953 Kalle Valo             2019-11-23  5741  	status->rate_idx =
=3D ath11k_mac_bitrate_to_idx(sband, rx_ev.rate / 100);
d5c65159f28953 Kalle Valo             2019-11-23  5742  =

d5c65159f28953 Kalle Valo             2019-11-23  5743  	hdr =3D (struct ie=
ee80211_hdr *)skb->data;
d5c65159f28953 Kalle Valo             2019-11-23  5744  	fc =3D le16_to_cpu=
(hdr->frame_control);
d5c65159f28953 Kalle Valo             2019-11-23  5745  =

d5c65159f28953 Kalle Valo             2019-11-23  5746  	/* Firmware is gua=
ranteed to report all essential management frames via
d5c65159f28953 Kalle Valo             2019-11-23  5747  	 * WMI while it ca=
n deliver some extra via HTT. Since there can be
d5c65159f28953 Kalle Valo             2019-11-23  5748  	 * duplicates spli=
t the reporting wrt monitor/sniffing.
d5c65159f28953 Kalle Valo             2019-11-23  5749  	 */
d5c65159f28953 Kalle Valo             2019-11-23  5750  	status->flag |=3D =
RX_FLAG_SKIP_MONITOR;
d5c65159f28953 Kalle Valo             2019-11-23  5751  =

d5c65159f28953 Kalle Valo             2019-11-23  5752  	/* In case of PMF,=
 FW delivers decrypted frames with Protected Bit set.
d5c65159f28953 Kalle Valo             2019-11-23  5753  	 * Don't clear tha=
t. Also, FW delivers broadcast management frames
d5c65159f28953 Kalle Valo             2019-11-23  5754  	 * (ex: group priv=
acy action frames in mesh) as encrypted payload.
d5c65159f28953 Kalle Valo             2019-11-23  5755  	 */
d5c65159f28953 Kalle Valo             2019-11-23  5756  	if (ieee80211_has_=
protected(hdr->frame_control) &&
d5c65159f28953 Kalle Valo             2019-11-23  5757  	    !is_multicast_=
ether_addr(ieee80211_get_DA(hdr))) {
d5c65159f28953 Kalle Valo             2019-11-23  5758  		status->flag |=3D=
 RX_FLAG_DECRYPTED;
d5c65159f28953 Kalle Valo             2019-11-23  5759  =

d5c65159f28953 Kalle Valo             2019-11-23  5760  		if (!ieee80211_is=
_robust_mgmt_frame(skb)) {
d5c65159f28953 Kalle Valo             2019-11-23  5761  			status->flag |=
=3D RX_FLAG_IV_STRIPPED |
d5c65159f28953 Kalle Valo             2019-11-23  5762  					RX_FLAG_MMIC_S=
TRIPPED;
d5c65159f28953 Kalle Valo             2019-11-23  5763  			hdr->frame_contr=
ol =3D __cpu_to_le16(fc &
d5c65159f28953 Kalle Valo             2019-11-23  5764  					     ~IEEE8021=
1_FCTL_PROTECTED);
d5c65159f28953 Kalle Valo             2019-11-23  5765  		}
d5c65159f28953 Kalle Valo             2019-11-23  5766  	}
d5c65159f28953 Kalle Valo             2019-11-23  5767  =

d5c65159f28953 Kalle Valo             2019-11-23  5768  	/* TODO: Pending h=
andle beacon implementation
d5c65159f28953 Kalle Valo             2019-11-23  5769  	 *if (ieee80211_is=
_beacon(hdr->frame_control))
d5c65159f28953 Kalle Valo             2019-11-23  5770  	 *	ath11k_mac_hand=
le_beacon(ar, skb);
d5c65159f28953 Kalle Valo             2019-11-23  5771  	 */
d5c65159f28953 Kalle Valo             2019-11-23  5772  =

d5c65159f28953 Kalle Valo             2019-11-23  5773  	ath11k_dbg(ab, ATH=
11K_DBG_MGMT,
d5c65159f28953 Kalle Valo             2019-11-23  5774  		   "event mgmt rx=
 skb %pK len %d ftype %02x stype %02x\n",
d5c65159f28953 Kalle Valo             2019-11-23  5775  		   skb, skb->len,
d5c65159f28953 Kalle Valo             2019-11-23  5776  		   fc & IEEE80211=
_FCTL_FTYPE, fc & IEEE80211_FCTL_STYPE);
d5c65159f28953 Kalle Valo             2019-11-23  5777  =

d5c65159f28953 Kalle Valo             2019-11-23  5778  	ath11k_dbg(ab, ATH=
11K_DBG_MGMT,
d5c65159f28953 Kalle Valo             2019-11-23  5779  		   "event mgmt rx=
 freq %d band %d snr %d, rate_idx %d\n",
d5c65159f28953 Kalle Valo             2019-11-23  5780  		   status->freq, =
status->band, status->signal,
d5c65159f28953 Kalle Valo             2019-11-23  5781  		   status->rate_i=
dx);
d5c65159f28953 Kalle Valo             2019-11-23  5782  =

d5c65159f28953 Kalle Valo             2019-11-23  5783  	ieee80211_rx_ni(ar=
->hw, skb);
d5c65159f28953 Kalle Valo             2019-11-23  5784  =

d5c65159f28953 Kalle Valo             2019-11-23  5785  exit:
d5c65159f28953 Kalle Valo             2019-11-23  5786  	rcu_read_unlock();
d5c65159f28953 Kalle Valo             2019-11-23  5787  }
d5c65159f28953 Kalle Valo             2019-11-23  5788  =


:::::: The code at line 5740 was first introduced by commit
:::::: d5c65159f2895379e11ca13f62feabe93278985d ath11k: driver for Qualcomm=
 IEEE 802.11ax devices

:::::: TO: Kalle Valo <kvalo@codeaurora.org>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4116001503674872338==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4116001503674872338==--

