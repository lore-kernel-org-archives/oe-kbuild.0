Content-Type: multipart/mixed; boundary="===============0826607728664092092=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/intel/iwlegacy/4965-mac.c:2822 il4965_hdl_tx() error: uninitialized symbol 'tid'.
Date: Mon, 08 Feb 2021 09:00:57 +0800
Message-ID: <202102080950.WI6IP2je-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0826607728664092092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   61556703b610a104de324e4f061dc6cf7b218b46
commit: 3f649ab728cda8038259d8f14492fe400fbab911 treewide: Remove uninitial=
ized_var() usage
date:   7 months ago
:::::: branch date: 4 days ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-m001-20210208 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/intel/iwlegacy/4965-mac.c:2822 il4965_hdl_tx() error: =
uninitialized symbol 'tid'.

Old smatch warnings:
drivers/net/wireless/intel/iwlegacy/4965-mac.c:1736 il4965_tx_skb() warn: p=
otential spectre issue 'il->stations[sta_id]->tid' [r] (local cap)
drivers/net/wireless/intel/iwlegacy/4965-mac.c:2822 il4965_hdl_tx() warn: p=
otential spectre issue 'il->stations[sta_id]->tid' [r]

vim +/tid +2822 drivers/net/wireless/intel/iwlegacy/4965-mac.c

3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2755  =

3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2756  /**
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2757   * il4965_hdl_tx - Handle standard (non-aggregation)=
 Tx response
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2758   */
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2759  static void
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2760  il4965_hdl_tx(struct il_priv *il, struct il_rx_buf *=
rxb)
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2761  {
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2762  	struct il_rx_pkt *pkt =3D rxb_addr(rxb);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2763  	u16 sequence =3D le16_to_cpu(pkt->hdr.sequence);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2764  	int txq_id =3D SEQ_TO_QUEUE(sequence);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2765  	int idx =3D SEQ_TO_IDX(sequence);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2766  	struct il_tx_queue *txq =3D &il->txq[txq_id];
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2767  	struct sk_buff *skb;
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2768  	struct ieee80211_hdr *hdr;
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2769  	struct ieee80211_tx_info *info;
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2770  	struct il4965_tx_resp *tx_resp =3D (void *)&pkt->u.=
raw[0];
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2771  	u32 status =3D le32_to_cpu(tx_resp->u.status);
3f649ab728cda8 drivers/net/wireless/intel/iwlegacy/4965-mac.c Kees Cook    =
     2020-06-03  2772  	int tid;
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2773  	int sta_id;
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2774  	int freed;
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2775  	u8 *qc =3D NULL;
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2776  	unsigned long flags;
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2777  =

3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2778  	if (idx >=3D txq->q.n_bd || il_queue_used(&txq->q, =
idx) =3D=3D 0) {
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2779  		IL_ERR("Read idx for DMA queue txq_id (%d) idx %d "
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2780  		       "is out of range [0-%d] %d %d\n", txq_id, i=
dx,
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2781  		       txq->q.n_bd, txq->q.write_ptr, txq->q.read_=
ptr);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2782  		return;
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2783  	}
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2784  =

3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2785  	txq->time_stamp =3D jiffies;
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2786  =

3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2787  	skb =3D txq->skbs[txq->q.read_ptr];
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2788  	info =3D IEEE80211_SKB_CB(skb);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2789  	memset(&info->status, 0, sizeof(info->status));
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2790  =

3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2791  	hdr =3D (struct ieee80211_hdr *) skb->data;
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2792  	if (ieee80211_is_data_qos(hdr->frame_control)) {
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2793  		qc =3D ieee80211_get_qos_ctl(hdr);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2794  		tid =3D qc[0] & 0xf;
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2795  	}
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2796  =

3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2797  	sta_id =3D il4965_get_ra_sta_id(il, hdr);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2798  	if (txq->sched_retry && unlikely(sta_id =3D=3D IL_I=
NVALID_STATION)) {
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2799  		IL_ERR("Station not known\n");
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2800  		return;
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2801  	}
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2802  =

8cdbab7f07e82f drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2013-06-12  2803  	/*
8cdbab7f07e82f drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2013-06-12  2804  	 * Firmware will not transmit frame on passive chan=
nel, if it not yet
8cdbab7f07e82f drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2013-06-12  2805  	 * received some valid frame on that channel. When =
this error happen
8cdbab7f07e82f drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2013-06-12  2806  	 * we have to wait until firmware will unblock itse=
lf i.e. when we
8cdbab7f07e82f drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2013-06-12  2807  	 * note received beacon or other frame. We unblock =
queues in
8cdbab7f07e82f drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2013-06-12  2808  	 * il4965_pass_packet_to_mac80211 or in il_mac_bss_=
info_changed.
8cdbab7f07e82f drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2013-06-12  2809  	 */
8cdbab7f07e82f drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2013-06-12  2810  	if (unlikely((status & TX_STATUS_MSK) =3D=3D TX_STA=
TUS_FAIL_PASSIVE_NO_RX) &&
8cdbab7f07e82f drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2013-06-12  2811  	    il->iw_mode =3D=3D NL80211_IFTYPE_STATION) {
8cdbab7f07e82f drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2013-06-12  2812  		il_stop_queues_by_reason(il, IL_STOP_REASON_PASSIV=
E);
8cdbab7f07e82f drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2013-06-12  2813  		D_INFO("Stopped queues - RX waiting on passive cha=
nnel\n");
8cdbab7f07e82f drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2013-06-12  2814  	}
8cdbab7f07e82f drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2013-06-12  2815  =

3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2816  	spin_lock_irqsave(&il->sta_lock, flags);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2817  	if (txq->sched_retry) {
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2818  		const u32 scd_ssn =3D il4965_get_scd_ssn(tx_resp);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2819  		struct il_ht_agg *agg =3D NULL;
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2820  		WARN_ON(!qc);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2821  =

3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13 @2822  		agg =3D &il->stations[sta_id].tid[tid].agg;
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2823  =

3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2824  		il4965_tx_status_reply_tx(il, agg, tx_resp, txq_id=
, idx);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2825  =

3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2826  		/* check if BAR is needed */
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2827  		if (tx_resp->frame_count =3D=3D 1 &&
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2828  		    !il4965_is_tx_success(status))
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2829  			info->flags |=3D IEEE80211_TX_STAT_AMPDU_NO_BACK;
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2830  =

3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2831  		if (txq->q.read_ptr !=3D (scd_ssn & 0xff)) {
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2832  			idx =3D il_queue_dec_wrap(scd_ssn & 0xff, txq->q.=
n_bd);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2833  			D_TX_REPLY("Retry scheduler reclaim scd_ssn "
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2834  				   "%d idx %d\n", scd_ssn, idx);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2835  			freed =3D il4965_tx_queue_reclaim(il, txq_id, idx=
);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2836  			if (qc)
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2837  				il4965_free_tfds_in_queue(il, sta_id, tid,
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2838  							  freed);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2839  =

3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2840  			if (il->mac80211_registered &&
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2841  			    il_queue_space(&txq->q) > txq->q.low_mark &&
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2842  			    agg->state !=3D IL_EMPTYING_HW_QUEUE_DELBA)
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2843  				il_wake_queue(il, txq);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2844  		}
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2845  	} else {
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2846  		info->status.rates[0].count =3D tx_resp->failure_f=
rame + 1;
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2847  		info->flags |=3D il4965_tx_status_to_mac80211(stat=
us);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2848  		il4965_hwrate_to_tx_control(il,
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2849  					    le32_to_cpu(tx_resp->rate_n_flags),
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2850  					    info);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2851  =

3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2852  		D_TX_REPLY("TXQ %d status %s (0x%08x) "
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2853  			   "rate_n_flags 0x%x retries %d\n", txq_id,
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2854  			   il4965_get_tx_fail_reason(status), status,
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2855  			   le32_to_cpu(tx_resp->rate_n_flags),
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2856  			   tx_resp->failure_frame);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2857  =

3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2858  		freed =3D il4965_tx_queue_reclaim(il, txq_id, idx);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2859  		if (qc && likely(sta_id !=3D IL_INVALID_STATION))
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2860  			il4965_free_tfds_in_queue(il, sta_id, tid, freed);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2861  		else if (sta_id =3D=3D IL_INVALID_STATION)
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2862  			D_TX_REPLY("Station not known\n");
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2863  =

3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2864  		if (il->mac80211_registered &&
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2865  		    il_queue_space(&txq->q) > txq->q.low_mark)
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2866  			il_wake_queue(il, txq);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2867  	}
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2868  	if (qc && likely(sta_id !=3D IL_INVALID_STATION))
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2869  		il4965_txq_check_empty(il, sta_id, tid, txq_id);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2870  =

3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2871  	il4965_check_abort_status(il, tx_resp->frame_count,=
 status);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2872  =

3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2873  	spin_unlock_irqrestore(&il->sta_lock, flags);
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2874  }
3dfea27d103e99 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gru=
szka 2012-02-13  2875  =


:::::: The code at line 2822 was first introduced by commit
:::::: 3dfea27d103e9913698cf1a2c86745a74c7c556b iwlegacy: gather all 4965 h=
andlers in one place

:::::: TO: Stanislaw Gruszka <sgruszka@redhat.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0826607728664092092==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
fGT0H6hXpdiZWgIA
--===============0826607728664092092==--

