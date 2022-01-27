Content-Type: multipart/mixed; boundary="===============0457814951670131949=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/ath/ath11k/dp_tx.c:511 ath11k_dp_tx_update_txcompl() error: uninitialized symbol 'rate_idx'.
Date: Thu, 27 Jan 2022 22:00:36 +0800
Message-ID: <202201272110.Z8STyrTC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0457814951670131949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Wen Gong <quic_wgong@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: 1b8bb94c0612cf32e418e90ae93cf37214d84669 ath11k: report tx bitrate =
for iw wlan station dump
date:   5 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 5 weeks ago
config: microblaze-randconfig-m031-20220127 (https://download.01.org/0day-c=
i/archive/20220127/202201272110.Z8STyrTC-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/wireless/ath/ath11k/dp_tx.c:511 ath11k_dp_tx_update_txcompl() e=
rror: uninitialized symbol 'rate_idx'.

vim +/rate_idx +511 drivers/net/wireless/ath/ath11k/dp_tx.c

d5c65159f28953 Kalle Valo 2019-11-23  417  =

1b8bb94c0612cf Wen Gong   2021-12-20  418  void ath11k_dp_tx_update_txcompl=
(struct ath11k *ar, struct hal_tx_status *ts)
1b8bb94c0612cf Wen Gong   2021-12-20  419  {
1b8bb94c0612cf Wen Gong   2021-12-20  420  	struct ath11k_base *ab =3D ar->=
ab;
1b8bb94c0612cf Wen Gong   2021-12-20  421  	struct ath11k_per_peer_tx_stats=
 *peer_stats =3D &ar->cached_stats;
1b8bb94c0612cf Wen Gong   2021-12-20  422  	enum hal_tx_rate_stats_pkt_type=
 pkt_type;
1b8bb94c0612cf Wen Gong   2021-12-20  423  	enum hal_tx_rate_stats_sgi sgi;
1b8bb94c0612cf Wen Gong   2021-12-20  424  	enum hal_tx_rate_stats_bw bw;
1b8bb94c0612cf Wen Gong   2021-12-20  425  	struct ath11k_peer *peer;
1b8bb94c0612cf Wen Gong   2021-12-20  426  	struct ath11k_sta *arsta;
1b8bb94c0612cf Wen Gong   2021-12-20  427  	struct ieee80211_sta *sta;
1b8bb94c0612cf Wen Gong   2021-12-20  428  	u16 rate, ru_tones;
1b8bb94c0612cf Wen Gong   2021-12-20  429  	u8 mcs, rate_idx, ofdma;
1b8bb94c0612cf Wen Gong   2021-12-20  430  	int ret;
1b8bb94c0612cf Wen Gong   2021-12-20  431  =

1b8bb94c0612cf Wen Gong   2021-12-20  432  	spin_lock_bh(&ab->base_lock);
1b8bb94c0612cf Wen Gong   2021-12-20  433  	peer =3D ath11k_peer_find_by_id=
(ab, ts->peer_id);
1b8bb94c0612cf Wen Gong   2021-12-20  434  	if (!peer || !peer->sta) {
1b8bb94c0612cf Wen Gong   2021-12-20  435  		ath11k_dbg(ab, ATH11K_DBG_DP_T=
X,
1b8bb94c0612cf Wen Gong   2021-12-20  436  			   "failed to find the peer b=
y id %u\n", ts->peer_id);
1b8bb94c0612cf Wen Gong   2021-12-20  437  		goto err_out;
1b8bb94c0612cf Wen Gong   2021-12-20  438  	}
1b8bb94c0612cf Wen Gong   2021-12-20  439  =

1b8bb94c0612cf Wen Gong   2021-12-20  440  	sta =3D peer->sta;
1b8bb94c0612cf Wen Gong   2021-12-20  441  	arsta =3D (struct ath11k_sta *)=
sta->drv_priv;
1b8bb94c0612cf Wen Gong   2021-12-20  442  =

1b8bb94c0612cf Wen Gong   2021-12-20  443  	memset(&arsta->txrate, 0, sizeo=
f(arsta->txrate));
1b8bb94c0612cf Wen Gong   2021-12-20  444  	pkt_type =3D FIELD_GET(HAL_TX_R=
ATE_STATS_INFO0_PKT_TYPE,
1b8bb94c0612cf Wen Gong   2021-12-20  445  			     ts->rate_stats);
1b8bb94c0612cf Wen Gong   2021-12-20  446  	mcs =3D FIELD_GET(HAL_TX_RATE_S=
TATS_INFO0_MCS,
1b8bb94c0612cf Wen Gong   2021-12-20  447  			ts->rate_stats);
1b8bb94c0612cf Wen Gong   2021-12-20  448  	sgi =3D FIELD_GET(HAL_TX_RATE_S=
TATS_INFO0_SGI,
1b8bb94c0612cf Wen Gong   2021-12-20  449  			ts->rate_stats);
1b8bb94c0612cf Wen Gong   2021-12-20  450  	bw =3D FIELD_GET(HAL_TX_RATE_ST=
ATS_INFO0_BW, ts->rate_stats);
1b8bb94c0612cf Wen Gong   2021-12-20  451  	ru_tones =3D FIELD_GET(HAL_TX_R=
ATE_STATS_INFO0_TONES_IN_RU, ts->rate_stats);
1b8bb94c0612cf Wen Gong   2021-12-20  452  	ofdma =3D FIELD_GET(HAL_TX_RATE=
_STATS_INFO0_OFDMA_TX, ts->rate_stats);
1b8bb94c0612cf Wen Gong   2021-12-20  453  =

1b8bb94c0612cf Wen Gong   2021-12-20  454  	/* This is to prefer choose the=
 real NSS value arsta->last_txrate.nss,
1b8bb94c0612cf Wen Gong   2021-12-20  455  	 * if it is invalid, then choos=
e the NSS value while assoc.
1b8bb94c0612cf Wen Gong   2021-12-20  456  	 */
1b8bb94c0612cf Wen Gong   2021-12-20  457  	if (arsta->last_txrate.nss)
1b8bb94c0612cf Wen Gong   2021-12-20  458  		arsta->txrate.nss =3D arsta->l=
ast_txrate.nss;
1b8bb94c0612cf Wen Gong   2021-12-20  459  	else
1b8bb94c0612cf Wen Gong   2021-12-20  460  		arsta->txrate.nss =3D arsta->p=
eer_nss;
1b8bb94c0612cf Wen Gong   2021-12-20  461  =

1b8bb94c0612cf Wen Gong   2021-12-20  462  	if (pkt_type =3D=3D HAL_TX_RATE=
_STATS_PKT_TYPE_11A ||
1b8bb94c0612cf Wen Gong   2021-12-20  463  	    pkt_type =3D=3D HAL_TX_RATE=
_STATS_PKT_TYPE_11B) {
1b8bb94c0612cf Wen Gong   2021-12-20  464  		ret =3D ath11k_mac_hw_ratecode=
_to_legacy_rate(mcs,
1b8bb94c0612cf Wen Gong   2021-12-20  465  							    pkt_type,
1b8bb94c0612cf Wen Gong   2021-12-20  466  							    &rate_idx,
1b8bb94c0612cf Wen Gong   2021-12-20  467  							    &rate);
1b8bb94c0612cf Wen Gong   2021-12-20  468  		if (ret < 0)
1b8bb94c0612cf Wen Gong   2021-12-20  469  			goto err_out;
1b8bb94c0612cf Wen Gong   2021-12-20  470  		arsta->txrate.legacy =3D rate;
1b8bb94c0612cf Wen Gong   2021-12-20  471  	} else if (pkt_type =3D=3D HAL_=
TX_RATE_STATS_PKT_TYPE_11N) {
1b8bb94c0612cf Wen Gong   2021-12-20  472  		if (mcs > 7) {
1b8bb94c0612cf Wen Gong   2021-12-20  473  			ath11k_warn(ab, "Invalid HT m=
cs index %d\n", mcs);
1b8bb94c0612cf Wen Gong   2021-12-20  474  			goto err_out;
1b8bb94c0612cf Wen Gong   2021-12-20  475  		}
1b8bb94c0612cf Wen Gong   2021-12-20  476  =

1b8bb94c0612cf Wen Gong   2021-12-20  477  		if (arsta->txrate.nss !=3D 0)
1b8bb94c0612cf Wen Gong   2021-12-20  478  			arsta->txrate.mcs =3D mcs + 8=
 * (arsta->txrate.nss - 1);
1b8bb94c0612cf Wen Gong   2021-12-20  479  		arsta->txrate.flags =3D RATE_I=
NFO_FLAGS_MCS;
1b8bb94c0612cf Wen Gong   2021-12-20  480  		if (sgi)
1b8bb94c0612cf Wen Gong   2021-12-20  481  			arsta->txrate.flags |=3D RATE=
_INFO_FLAGS_SHORT_GI;
1b8bb94c0612cf Wen Gong   2021-12-20  482  	} else if (pkt_type =3D=3D HAL_=
TX_RATE_STATS_PKT_TYPE_11AC) {
1b8bb94c0612cf Wen Gong   2021-12-20  483  		if (mcs > 9) {
1b8bb94c0612cf Wen Gong   2021-12-20  484  			ath11k_warn(ab, "Invalid VHT =
mcs index %d\n", mcs);
1b8bb94c0612cf Wen Gong   2021-12-20  485  			goto err_out;
1b8bb94c0612cf Wen Gong   2021-12-20  486  		}
1b8bb94c0612cf Wen Gong   2021-12-20  487  =

1b8bb94c0612cf Wen Gong   2021-12-20  488  		arsta->txrate.mcs =3D mcs;
1b8bb94c0612cf Wen Gong   2021-12-20  489  		arsta->txrate.flags =3D RATE_I=
NFO_FLAGS_VHT_MCS;
1b8bb94c0612cf Wen Gong   2021-12-20  490  		if (sgi)
1b8bb94c0612cf Wen Gong   2021-12-20  491  			arsta->txrate.flags |=3D RATE=
_INFO_FLAGS_SHORT_GI;
1b8bb94c0612cf Wen Gong   2021-12-20  492  	} else if (pkt_type =3D=3D HAL_=
TX_RATE_STATS_PKT_TYPE_11AX) {
1b8bb94c0612cf Wen Gong   2021-12-20  493  		if (mcs > 11) {
1b8bb94c0612cf Wen Gong   2021-12-20  494  			ath11k_warn(ab, "Invalid HE m=
cs index %d\n", mcs);
1b8bb94c0612cf Wen Gong   2021-12-20  495  			goto err_out;
1b8bb94c0612cf Wen Gong   2021-12-20  496  		}
1b8bb94c0612cf Wen Gong   2021-12-20  497  =

1b8bb94c0612cf Wen Gong   2021-12-20  498  		arsta->txrate.mcs =3D mcs;
1b8bb94c0612cf Wen Gong   2021-12-20  499  		arsta->txrate.flags =3D RATE_I=
NFO_FLAGS_HE_MCS;
1b8bb94c0612cf Wen Gong   2021-12-20  500  		arsta->txrate.he_gi =3D ath11k=
_mac_he_gi_to_nl80211_he_gi(sgi);
1b8bb94c0612cf Wen Gong   2021-12-20  501  	}
1b8bb94c0612cf Wen Gong   2021-12-20  502  =

1b8bb94c0612cf Wen Gong   2021-12-20  503  	arsta->txrate.bw =3D ath11k_mac=
_bw_to_mac80211_bw(bw);
1b8bb94c0612cf Wen Gong   2021-12-20  504  	if (ofdma && pkt_type =3D=3D HA=
L_TX_RATE_STATS_PKT_TYPE_11AX) {
1b8bb94c0612cf Wen Gong   2021-12-20  505  		arsta->txrate.bw =3D RATE_INFO=
_BW_HE_RU;
1b8bb94c0612cf Wen Gong   2021-12-20  506  		arsta->txrate.he_ru_alloc =3D
1b8bb94c0612cf Wen Gong   2021-12-20  507  			ath11k_mac_he_ru_tones_to_nl8=
0211_he_ru_alloc(ru_tones);
1b8bb94c0612cf Wen Gong   2021-12-20  508  	}
1b8bb94c0612cf Wen Gong   2021-12-20  509  =

1b8bb94c0612cf Wen Gong   2021-12-20  510  	if (ath11k_debugfs_is_extd_tx_s=
tats_enabled(ar))
1b8bb94c0612cf Wen Gong   2021-12-20 @511  		ath11k_debugfs_sta_add_tx_stat=
s(arsta, peer_stats, rate_idx);
1b8bb94c0612cf Wen Gong   2021-12-20  512  =

1b8bb94c0612cf Wen Gong   2021-12-20  513  err_out:
1b8bb94c0612cf Wen Gong   2021-12-20  514  	spin_unlock_bh(&ab->base_lock);
1b8bb94c0612cf Wen Gong   2021-12-20  515  }
1b8bb94c0612cf Wen Gong   2021-12-20  516  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0457814951670131949==--

