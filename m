Content-Type: multipart/mixed; boundary="===============3227245049624075975=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2046/6488] drivers/net/wireless/intel/iwlegacy/4965-mac.c:2822 il4965_hdl_tx() error: uninitialized symbol 'tid'.
Date: Thu, 09 Jul 2020 01:48:00 +0800
Message-ID: <202007090150.b2nTEquK%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3227245049624075975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Kees Cook <keescook@chromium.org>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   8903263671cb22bc33545eb7cbd68c875bb87e95
commit: 80b89ab785a48bc06be50dd9cf859175318ff99a [2046/6488] treewide: Remo=
ve uninitialized_var() usage
:::::: branch date: 6 hours ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-m021-20200708 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-14) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/wireless/intel/iwlegacy/4965-mac.c:2822 il4965_hdl_tx() error: =
uninitialized symbol 'tid'.

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D80b89ab785a48bc06be50dd9cf859175318ff99a
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout 80b89ab785a48bc06be50dd9cf859175318ff99a
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
80b89ab785a48b drivers/net/wireless/intel/iwlegacy/4965-mac.c Kees Cook    =
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

--===============3227245049624075975==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICK34BV8AAy5jb25maWcAjDxLc+M20vf8CtXkkhyS9Wu8k/rKBxAEJaxIggOQsuQLy/FoZl3x
2LN+bDL//usGQBKAmsrmMDG7G41Xo19o6Mcfflywt9enr7ev93e3Dw/fF1/2j/vn29f9p8Xn+4f9
/y1ytahVuxC5bH8F4vL+8e2vf9yff7hcvP/1w68nvzzfnS7W++fH/cOCPz1+vv/yBq3vnx5/+PEH
rupCLnvO+43QRqq6b8W2vXr35e7ul98WP+X73+9vHxe//XoObE4vfnZ/vQuaSdMvOb/6PoCWE6ur
307OT04GRJmP8LPzixP738inZPVyRJ8E7FfM9MxU/VK1auokQMi6lLWYUFJ/7K+VXk+QrJNl3spK
9C3LStEbpdsJ2660YDmwKRT8AyQGm8LK/LhY2mV+WLzsX9++TWsla9n2ot70TMOsZCXbq/MzIB/G
pqpGQjetMO3i/mXx+PSKHMZlUJyVw0zfvaPAPevCydrx94aVbUC/YhvRr4WuRdkvb2QzkYeYDDBn
NKq8qRiN2d7MtVBziAtAjAsQjCqcf4q3YyMWKB5f2mp7c4wnDPE4+oLoMBcF68rW7muwwgN4pUxb
s0pcvfvp8elx//NIYK5ZsOxmZzay4QcA/D9vywneKCO3ffWxE52goVOTcQLXrOWr3mKJGXCtjOkr
USm961nbMr6aOHdGlDILmbEOFAXBxu4p09CRpcBRsLIcTgMcrMXL2+8v319e91+n07AUtdCS23PX
aJUFcwpRZqWuaYwoCsFbiV0XRV+585fQNaLOZW0PN82kkkvNWjxSgYTqHFAG9qnXwgAHuilfhacH
IbmqmKxjmJEVRdSvpNC4ZLuZcbFWw77CMsL5bpWmqXB4emPH31cqT7RZoTQXuVdUsAqBiDVMG+FX
ZdzekHMusm5ZmPhQ7B8/LZ4+Jxs6qWLF10Z10KeTulwFPVrpCEnsoflONd6wUuasFX3JTNvzHS8J
0bBqeTNJWoK2/MRG1K05iuwzrVjOoaPjZBXsGMv/1ZF0lTJ91+CQB5Fv77/un18oqV/dgExqqXLJ
w6WvFWJkXgpSDVk0iVnJ5QrFwC6IpvfrYDRT80YLUTUtdFDTPQ8EG1V2dcv0jjj+nibQSb4RV9Dm
AOwOm10n3nT/aG9f/li8whAXtzDcl9fb15fF7d3d09vj6/3jl2nlWsnXPTToGbd8nUCPA0WhtUIx
ockJGb6yZ0LoipU4JGM6Tc89MzlqJg4kyJXSfGj1TctCKUMQHJ+S7WyjBLElYFLFcxqWy8hwgvA5
mpZcGvRIcnK7/4dFDZwOWFBpVGl1SMjO7o/m3cIcCnELG9kD7nDHIyB89GIL4h5M2EQUllECwhW1
Tf35IlAHoC4XFLzVjIvDMcGGlSW6W1Wo9hFTC5ANI5Y8K2V41BFXsFp11mM7APalYMXV6eW0rIjL
lCIdOduR4hmufbjByZh7615WGbnH8caMSn/t/gjMwHrcIMVD8AqYg76YQKVCh7EAeyuL9ursJISj
kFRsG+BPz6adl3W7Bi+zEAmP0/PIP+hq491oewKtdh30gLn79/7T28P+efF5f/v69rx/sWA/WQIb
mZVrVrd9hiYH+HZ1xZq+LbO+KDsTuDN8qVXXmHDFwfHhtJbIyrVvQKIdys3kGEEjc3MMr/OKHcMX
cD5uhD5GsuqWAmZLkzTgw7VHR5CLjeS0+vMUwCRVfgfTFLo43gk4E8RJQO8YXBFQsOGudGBva3rQ
VsHHuEGiwWGuYzbgGs3xgX2h2dSiTdjAFvN1o0DI0cyCJ0YvlhNqjL/mpQa8lcLAYoCyBJ8ulpxB
N6DdCCK4Ek3JxjpLOnBD7TergJvzmYLoQ+dJWAeAIZqb1FNuwyRylICbiZVsK0WNOk9DOdB9aP7x
byrs4L0CP6CSNwKdVCs/CuxxzUW09AmZgT8Ibmmc5LSNzE8vo5gKaMAacWEdEKdmkzYNN80aRgPG
EIcTbENTTB+jRZskDfsiBlaBqZYohiGxgeOKsUrvfVd6QrizqW9brFidlwehn3P8QlOMCjn97utK
hpmB0M+YnTaDGKHoojF0rdgmn3CagtVpVEhv5LJmZRGIrh2uBYxLYn3sgjoOZgUqOopAJSV/4EB1
OvEHWb6RRgyrSJ11YJ0xraUIgqs10u4qcwjpo70YoXaN8NRiIBqdgKagtjhST9aZIydu7RpmqqZB
Arcagg1QQNFJNuIj0R5aiTwXeSrh0GefhkUWCMPpN5UNNyOnk5+eRKkPa5d9SrDZP39+ev56+3i3
X4j/7h/Bx2RgsTl6mRBwTP4i2a01CnTn3u7/j90MDDeV68OFHe5MTMeu7LJDOxTl3hg4EXpNa+6S
ZZR4AtO4E0WTsQw2Ui/F4MDHjQCLhh5dzl7DGVfVHJORDHMU4B5Hx8isuqIA/6ph0NGYOJiZT2fd
T6DVrWQzSqgVVQ9RLcP8qiwkT/Ik4FIWshyOnd+zOPU5kG4/XPbnQT4RvkNjZlrdcauWc8FVHh5I
8K4bcLCteWiv3u0fPp+f/YIZ6jABugab2puuaaIELbibfO3c6QNcVQUxgT1sFbqNugZjKV28f/Xh
GJ5t0d8nCQZZ+hs+EVnEbszDGNbnYbJ1QETq23GFaNPbsL7I+WET0EMy05hVyWMXY9Q0KA6oyLYU
joF702O+3BphggIkAY5c3yxBKtpE64AP6pxEF75DXDMR2IhrQFmtBaw05n1WXb2eobMSTpK58chM
6NplxcBGGpmV6ZBNZzA1OIe2EYVdOlYOHvYBBytSZtBjMKRBgUVC35uqmWva2bxnoBMLsOeC6XLH
MaEnAlvcLF3wVIKKK83VGH75Cw3DcGtQ4HH9BXcZQ6usm+enu/3Ly9Pz4vX7N5cPiIIsz+hGAYck
HBkOUjgDnFUhWNtp4fz3GFU1NrUYpRVVmRfSrGifUrTgMciacuyQn5NKcN50GXeUyeXBuMS2hU1F
QZl8mbEnJDg6FCQAVwnT/Y2h4wYkYdXEnwifRpfEFBC8B57RAHECk45M5/z87HQ7swogRjVIBGxw
nbMwEEDkKE4+j18wWXZaRIrwbHt6eiCZUsvYRtoYRlUS9C1EF6BMMOyJw8/hXO/gLIKDBV75shNh
qgS2n22kJiDjxFO4aWRt87+BfwXGPGHsMshNh0lSkPmy9Z7m5Kts6H0d+zmSHkxJh+zElCq4+HBp
tiR/RNGI90cQreGzuKqiBKG6tFZzogQNBvFFJSXNaEQfx1dHsRc0dj0zsfU/Z+AfaDjXnVF0RF2J
AnwOEWclJ+y1rPEChs8MxKPP6fRMBXZuhu9SgAOy3J4ewfbljCDwnZbb2fXeSMbP+7N55Mzaocs/
0wocPMpXtKouzZ4O6k3XOAVn0V2i7jIkKU/ncU47YuTCVbOLWaMP34DxcQkT01UxGsQ9BvCq2fLV
8vIiBatNYlFkLauuspagYJUsd/GgrFaB4L4ygdvo0/aYNBCl4JHDjYxAZ7rZzOXNLIXdT9CUVArD
k4A1CFKMHrjaLa2jfMgQDhXrKIU6UIC/WptKgNMd+ssDtqu4gx9wvlkxtZU1paob4VRflIbIK0nQ
1ta/MhiFgIeViSW4r2c0Eq9FLy9S3BDfnKetAogzM6YKXXULqhIRsaUNPWsOpFgNwNiECg3RgksV
ZVqtRe3SUHiXO3NIqjjh5EGYxi7FknHqssvTOOkhGqNEzDRjNZcYn1Zh5mlohre0ZgX+ySFK1v8S
4aWRPU/+AmsT+3pBqPz16fH+9ek5ukMLAnF/mDVrYiMaUFhPR12n+Wcf6c30FW2gXUQIzMNwz3/F
bpdqSvwH5kRdsinQRVlU1CE/0IG6kwPcdnClu4b24irJQT2AFpxlAbpk3h+VUdRdK7yCBdeLOnoO
cxF5ex54eUFnIjaVaUrwwM7/Do250aMkZ8c5nB1wSAhOI18NjrwqCgjlrk7+8kVYJ8k8013lDUPf
s5WmlZw6gtalK8CXhsagUBgRp9loYh5tlfvg+GIFRBAlyBLlrxy8WKwr6MRVNOimPTj/1nxBdKEM
5tp016QXo5GkYfkF3ntdB7qwanVgifALwzPZQuA8C/fTG/XnyQwZrgfmG61eHYhP4xk0jJYLu2Kz
+SUbSVS2MCniBg4kfZshCsqCGMExsREJ/E1/enJCVy/c9GfvZ1HncauI3UmQY7i5Og2EcS22IjAY
XDOz6vMujBWb1c5ItC0gnRoF+tTLcxCW2vQZ7gkVJgztWSmXNbQ/i4+DapuyW/r7XQ9EnYThRRWi
TyKTbBMJIfZYqnKTG7pkjVe5TdRAh7R3A8dEFru+zFs6QT3o9yN5g+gQetH1h9CPf7RIT3/unxdg
JW6/7L/uH18tH8YbuXj6hpWkQZbY52QCr8Anafwt6CHCrGVj0+Kxfh2zP9TWVb0phQiFwUN8mmOy
hJW9zrM4Oq6s+mu2FjZyJXtKuM3dggKKl0EO6/qjs7q9DYCsxzCljSPtNwT+uJ4B7uBrMMRWng2o
K7Xu0qRUBeqw9ZV82KQJs4gW4jPCbmyo14HVlFid1AzS2rkuydSB49Vw7YaTduI3J2aH7nxhDp2R
kEaLTa82QmuZizCvF3MSnCptCylYOu+MtWA+dim0a9vYybfgDfROXVFZZMEOG7SMDlHdMoJszTGz
8ZAWICzGJGOboh9u92kWLfODDRiRCTxWaofb4xiy5RKMU3rvEM3XOa4Jd94ZCGX73IBSKmQZXmiP
KWa/XKhrumapWZ4OPcURIjm/1A1H4VOUQ+RGqCB0A706ty5SpTGJk+eM9kFd25nqkXBJIBZcqSNk
WuQdVnnijdA1OgeqLqm4ZTrZrBGBfojh/po47gIR5ADypi2oCGFUbBJv8EEg5EwWZ1hZ+Js8kNad
qQ6jV1PQA2JN5NoMNYaL4nn/n7f94933xcvd7YMLiaIQGg8SaQXp1iNj+elhHzyGwGK66EgNkH6p
Nn3J8jyeR4SuRN3NpiNGqlbMmP2QaEiPknLgUEMqNby8m2Y0OgF/a77tUmRvLwNg8ROcpMX+9e7X
n8NFxuO1VOhWUxbQIqvKfUZm02JyqcVMBZIjYDVZlwo41zSw9gCb64jX2dkJrODHTmpK7eJ9XNYF
ytZf0GE2IgKGiQ30DeMkO0JW2gk1OSdVNpxSQ6UM7uZq0b5/fxIk9TFar6PraOvS70xBlxDO7Jnb
z/vH2+fvC/H17eE28dK8++mzUAOvA/pYvYAiw/tM5eIL20Vx//z1z9vn/SJ/vv+vqxaYQoucVniF
1JXVceBrAiua5rrnha+hIRZxqdSyFCOn+J7KojDdavNGc94/BD7jJd0wm3b/5fl28XmY0yc7p7CG
cYZgQB+sRrR+602QTcX7iQ5k4Sa5jscrE9DEOrLcYDU32/enZxHIrNhpX8sUdvb+MoVCxNKZsap9
uNu/fb779/3r/g5jgV8+7b/BHFA1HDj0LvTyFSthdJbABhMapQSVKy+IdmiA+ToPW1/VlIK6LLHr
FvBIOYCdOzQra3cfS8rVvyCCBA2eCVqpQm+Tu97VNjDEgkCOjlHiamOqHN9mtbLus/gxkGUkYXWw
SoC4Sl+nN8YOireoFEI1NNyzAV+hL6hKuKKrXT2GlSefgEweyWxEXFM2PQKyHFcQZCRIVJXoRsll
pzriXQYEYM6EuRcryarZKgOINTB29VWPhwRGDNmgGaSzB311sOhu5O5Nn6tH6a9XshVxIfhYHWD6
fFcz1Gq2hN+1SOjOzzLZYtasT7cR3x9CGO6f7aW7Aw4TnFuMb/FC38tQbGQcnREf5zYOnxjONlxd
9xlM1JW1JrhKbkFuJ7Sxw0mIbG0tCF2n675WsCVREV1aakbICXqrGDjb4mBXr2BbUEyI/oeqMe2X
KE7vTPs5Hdrj2LCCz5NVVddDIAPRio8rMAtBorFWnyLxcufOiSuQ95de6WC8svBih7nWhMK3czci
M7hcdTOFLFgb7R58Dc9HicXwiTtfyBN4MDPwoCVuQQnykiAPylEGs+BLViK0fYEU9DrTNmkEK6bq
g+W0E5ftStZePGw1QypDxIOh9CgoFLUqLaIcdFxtk7GwvlggFG/atPaIQx5oYHW6raAChjS34Fhh
F8iXyjvM1aCtECUegvJAsozD2IxuVJU1DTOqWksIxBa0E6lq41YfYnFTzW7Qk22ZOMPgHcfqhpdY
VpTBJoC3lQfUCl8my6XP5J0fIFhib0a3E1Uqbhul31uwIu3wZldfb0O5mUWlzd3Kk80p1LTWEOiW
52dD6jjW66PdB+NEGXfUhWH1atrUlwL3ouZ6Z5/aOY+Mq80vv9++7D8t/nDFst+enz7fpxEukvm5
H6s1tmSDg8R8cc1Q13mkp2gp8Bk/enPSP6NI6kL/xnccWGn07lrwFYOFsKXWBsuEg+sRd0xCJ85v
kn38Cus6k17zVF19jGKwz8c4GM3H1/czpd4DpaTTTx6NEo6vEY/RYIXhNZhoY/BR8/h8ppeVTQQT
m9vVIHVwonZVpsLTOugX+wIvTQhnvvpp/AQHhxvMNX2Ma7KG9ymZWZLA5P349JylFUst2x0514EK
KxLprbGvs/w1hzVsdByNZNcZldFzXeB1S2GSeWIFXMPKdNju1yKG80e9lWxun1/vUYoX7fdvcW2l
rbJ2blm+wVcuZMl/BVpvIg22yuTKUAgMREPwlLVJhhJOsPqIuY540gDDqFKqGGxvMNwTfjU9wgsC
PGgnlavdyMEexL+nESDXuyx0HQZwVnwMRx13MkWhdZDk6Gq/EVgzaE8vT6t/p1sRl3WAQD8YlH2w
YhvDbqjrKJ+rrw2o2Bmk1dAzuFG7299ZyKmCxnlM2lhf000P4KPextJQvPkoWdOgXmB5joqkt7qB
MnTDQ5I+EwX+Dz3p+OcDAlp7Q9hfa2Aeznm6lLMSIv7a37293v7+sLc/LbOwpSGvgaxksi6qFj2W
QIDLIs4EeCLDtQzfk3sw6L0owY5t0fMn01tzA7KjrfZfn56/L6opr3l4G3mstGCoWahY3cW6YipY
cDjioPvGMbfeVuW5duGPg4zsbCFF4CC6cA9/IWEZqm4/3vFJd8gKizqa1gqyLcm6SBplaF7CJh7g
nC/KIeOj5hk13RLjVzyAdIUt8Xsb3KYE+qR6PgM3KJReV8GrfAJ2StkYqphheCdvHVn32w25vro4
+e2SVhVzldNz8NU1xMYGVmYszRoHRAUGVL0fBEy1LbQMjxSsRJwP4uHzD/hIa6hHUGjHEAgDYObq
n9O4bpAxMZCbRqlIgm+yjjJPN+dFVJx2Yw5fiw2w8bVC5TQSaZ1HYpRsKlPrs0I21TrkxMLebKrI
ChwmnNa0vLlC9k0SRoIms4WT/pcbJke5a0An1nxVMfIGYFSLTStc0MYiL3lerwwcahGWPa4z92Zh
yAJZ5VTvX/98ev4DPOtDrQRHbi3a+MQhpM8lo6YP9jKIVfALlGuVQLDtBIqCOvjwbxxiWKvCEsYi
fDWKX5j0Qsc6gbJyqcKxW2BnyDt9i7OFWwVLqjQRY7qsx4cjnPYhLY3TNTNVfpbJseI0N4AmrWbC
F+JrQV03yTreGdm4DDX+ugxF3ozeYG8LV3XSuJAZSLYUTkxpDkMK3Jd2JBxcPayjYS39OmIkAwci
U4Z8yzKQ8JJB5BG+Q4c4tm7S7z5f8SYZCoJtCdTcIJBAM02pKFxy2YRv2h1kqbFgruq2KaJvu7oO
7fVIH5y9Hdo1tZZhiOnoNq2MQV1OsyxUl4oGgKYB0LEcyknPVjMS1ENIF62dhw1Hap6lQOey5dQK
SjcxL8sh0Ep5OjeLIYGxqnB0vKHAuGYEWLNrCowg2EvM5+0iawrM4c/lscBppOFdFnpIgxMw4K/e
3f0/Z8+23LiN7K+o8nAqqdo9a0nW7WEfQBCUMOJNBCXR88JyPM5GFceeGnt2s39/0ABIAmBDmjoP
yVjdjQtx7W705fuvl6ef7HJZvBBOvJTytHRX7mlpdifod/AoF4pIRyqAw6SNCdZN+M6lnHf3y5dm
vn2QdYI6s7y8Nc1L5MxSHcx4iQUp0GWCy2A5hkJleou4DQg0NpxC9XW4JbYVftxIlN5aTv+vHXXQ
/DECZUZgz6ka1ESG8YJtl2161p29QSY5BNx/S6+YMkUr6tjKsqY2zw4/R0tPQ6GdUERIOT0QsBJU
9MCvuGdTWZfmvE4eHIwqUu4elBZVXi1Z6UVOkDRa2Y8pTkr/HUAedjGl/rECoG6fK6YGABNKefwe
iiRqKmqBaDZ2krTRc1TiCzYxdMBEFNg9Pv3hqUi76hErMbt6rwKnvKCB262Ksdu7doI+wi8pbsgh
g5PTOQIBo7ROmF2hwpqBHsygakwoSme1NU3wyxId+rIKfpqjHxJVPEalGf3KBfMuiLsMMYDcwcBK
b+bzKY6LKpqN4nP5BFeKypPatSS2Kbbi7LMSHUp31rnPOxSTfwRYk44kq/d4tXvxOVRtAd5Ggb3d
Ex1oYAxTkm/md/NQ5eITmU7vFjdql8ITT13m8yQrbtd3s+kBXQYxo7ICbIWl1oqWP2yzk5rYNs6g
35WyYcpccFqXnoanxBnfOPYuOAkA5Swq4jazhdUEKS1X/nJXOBLZMi3OpWula0BXzIY7inxHsYIS
rFgbdCxtIimrbjOWYyNrk+2KMtQM3CE3m8mKiKee8h0hg8vSuxlstDylrlSwlRRSsm13cRXq7/aH
KuE08+5FrImbw2sTwzD/YNcVw2BdbYwx2BYLJ9bVAG3z1PyhgkRxmExUBWgVEYWR6MeoYTF2LAGh
ffPWTlba9O6iPXx//v4s76Z/GF264/9nqFsaHfxDA8C7Go8j1+MTgRkmduiysl8QOqji29DmKpSd
77AiibBCIsEPpQ5fswM24j06SsZdpJEYAyUXhLVfE/jMKy1IpjYe1xaLMYsGcPkvyxBy24WsH8kD
PsJiH+EIuiv2DPuIw41BBOdInAPuKJLDmMivhOzZuE8JvvJ2uGjVLy0eCIzb4dOAbf8wm6Fwf2q4
x2GZOukxwcJrdUjJDSeF0sKPxU5T9z9/+vrb5be39rfH94+fjOH4y+P7++W3y5PHAUMJmnpLUQLg
5dsWbDtwTXkes2aMUMfW/RienMewo+NnrgGdKdZwDxt4QC3atytOJdIbCV36k666I8+34KQBwTgC
pz8wZYJ8ZQoeCWN4BhFCnShuSmuiwBhMGw85IfotJM1CHTMEefRQM7ReZ8gtOLj9++NkUJBbIThU
XY9IznH1UDcCBI1h3O9MuZatZUyd4zfOwRBQFJBqAJMLpchB1PO2XWiAdn+ecLnCokvxqJQWSYw+
F1gEuf2MNIAzE+YbrRMLdx4gu964Mjy3WymkKHKSMoecIqTkSd//1qbvIJ6arAenRVGCQZXDsGuz
+FNGeU+INaYe+bE2XQQme6U8348EzawM6Dh1HFXsg3fCv9nU0EiBwF/66RyC+oPmTSLRVg5VjVt+
qOapwByUq9L67ipRkb1t9Vbjhgg2EWyVRsW79zEaoyEP7LIKQiiLh9aNkRkdXGuTMmk/oao0pV8G
AyCdO8R9Lpp8PL9/jJi9cl9vWe6PbFwVpRQDcj6KD2h0HaM6PYT9NjXoALKKxIoNMfYwT388f0yq
xy+XNzAW+3h7enuxnrKII5bBL7mzMwKBDk8+01KhLutVMfgmkOZ/Z4vJq+n3l+d/X546LwvHFCfb
84CJ1RJe0lCV14GBna/dJUFx5V9EHuTWacEwOYnxIEEWyS5A8kAydFaufmN/hdsCg/wBGndnQUtQ
RPGgT4DbnpExAMSn6Wa+6YZbAiax7sDgv2MRn0bdODXUlasBKFJKMC9tquTtk1sDJSkFi1TQs9u2
uqpzJP8sZUWSz134/kRgpEvKmR2EttTXpd8dCJMY6g6lq9XdqAAAwfI1OJyaoosXF6ibJxz+daPi
AiK70qGSkf3wYe6wfiIQ0SBQUBSJL9jTTr9hHnvxPBLIpPebxLbWgTiqLK4cSJXAneKccx2wrUOG
gLKiPOB8L3E7Hodx2PUXQaB+rwtGxg7Vk7JAAHeJy0QSZMui+oq+SCIFS5PaNaUcgC2j8c7rZ48T
vr3TQNOFZRxxKdqn7+X788fb28fvV05HGDnKo1rEgatOExxJhbJgCnnaUe51PqtOmKAImHov9J3h
0Nd7v4nB1TD0Gf1Nksh7tnL1iB0srCAbKJRFj+SyAtdETxj2J6+afcipP2n3FI3uW1eMZMaYdVgU
YAJQGQNnAzrziqWOT1kHAa2VBQUdlmtdp0BuIggFEnYsN0PE7cM32YLayVbWKz3XVD1MGcPB4Swx
1HCUsBRiOrWSOc3liRNIRNDRUwbOXSbMcFvkR2zv9NRgiyw/XEUYBwsKto2jcZeVYWVn9Q8kYLsh
ELpeoheBbwnLB8MHVDHpbMquU569c8PgUx55A91B9AOQLFcGcZRmYWS9544StkeHJBqjarS60kGU
/VNFEURFwdYOlnKKY3uzvB+h+udPf15e3z++Pb+0v3/8NCLMmJ3cowfDgY2AkYcuuybRWZGFjNXc
ikau+j6VqAkM005lTVERk63YQmcuofjBkew56rQPTPvGU61sysFo2+HuN+grZn/T8wTbVqzctdpa
34PAY5q8oEfvsT0edtgN7UCe2NqrBB4st7y2PdkAmLv3hgG1gcsG0DvbkB0AYherJygjGD1+mySX
5xeIFf/nn99fjcJt8rMk/cVcHxbfChVkjMPbuFerncINAElcjgAtn3kfWeaL+3v/ixQQaAOfpPEZ
46O65nMEZFr1m5jPrg2bin9n3L6ckj3iSgcHGt1JpwJRz6byX+KX94jUvIabyJsSXQwafKWgmCfn
Kl94s6eB/Uj1kuwPrY5eYhAkK1NPn8cT5+a7YvERQ6hy19p3C7FSWWrre0H9MqS/azI7Q55SlQA+
s31tlDTPTqCcsbgGwlPwBxggUoCtiyLt9DgDQjsCGpVDt3FCgp0m5u4jOePow7gJRm8tY/+HSYQo
HKCyHPdMvLvwAFAGSNCFBQgSikMDOFFifBeg2tL2JtSQOvMgkSNEqygiqHoJMCp+iPDpg+G/KDhW
aVNoE0rNTeOqIhPVbqYJNRaJAgeqdHLSAQDs/hWbqGEukttRd1XllTdbJXEsP1WNnmP1ME+h6VOR
Y5DFYpFQZ534mPZzvVgs7q4QjOIe2xRiV/bXA4Q8eXp7/fj29gKpxQZpyOyB98u/Xs8QkgMI6Zv8
Q3z/+vXt24cd1uMamfY0eftV1nt5AfRzsJorVFo8e/zyDHFWFXroNOR0HNV1m7Z3E8NHoB8d9vrl
69vl9cMyP5djyPK4ixvgLMcOfi2ek6KT69aIvk5P+tb69t//c/l4+h2fJHtvnI0OuWbUrzRchd15
Sio0GRcpeWy/qxpAWwu+mk3H8JgLnZlUJQq0w0kaArO/q6atm3bksjkih4AZLN/yQG7Onixwsgyt
HjP/DbHDgatDPgYrf9KWah2cTgX5+PXyBVz09IiOZsIam8WqQRoqRdsgcKBfru3FZJeQuxmLvt2R
VI0imdvTHujoEMHm8mSutknhu1cctQv2jqWOr5sDhviqOyfd86nOSle26GBtBs7c6OTpXA7plbyr
qs0+5JFK5j1S6vRxg17e5Lb/NnxJcla+z44yoQMpp5kYMjVaHEIjxZ8hLNLweUMpFW+jH5q+pyiB
5EHSNMIV6kOBzuXZ6WPHJo1jI5lv7DUVREXGPPV+gI7GR3lK29iAKZtSelYcF1x6nWjFvPkFuNLH
6bLyBodoEdiRl7WHQrT7IyR/7889g1Q1EOWPaepRgXmQanT5joi1rvKwz/ID+XUk8xDIpw3o0zGF
tDbKBMzxfajY1nE91L9dscbAssw5FQ2hnWLbwASllkgJx5kKg6HWXuIHpJfLj+VUy+HeprCDCIy3
bx+CbhDpBsF9B6E6cX22XaQXewvJwRtnMWszAm+mYtkgU7PN7RUMv+B1h9virQJmkCa1Q/R1a3pe
JQaHLlNFdIyaazRZjescC0ze90O+6ggxfihXA8JWte31o1x+jF5EqVJ6V7bSevYb7OUEkSXwUy8v
QyEC89KNa2uiBIwAbX5MU/gRxrRaC4VEteoo7bciGleF+3BhiEAuEELKwTUv57MGV+l8rvzHPK+W
oxc6fkQA7/1XCeIqwriX/qujePyBolmPgbKrKNDk8R4SlNk4pd1SnrWDaghGDJ6eaXxCIx3URPmr
g1hqD6yxQpC1X/mcKoqxyaiEOwFaA3TKmMVudzKzhI7yKPajBUUQ7QKU6R3pLPkb4AmJ5OkqfKir
mAFQTaotw581nK5qyeHy/jRWUpF4MVs0rWS17WhjA9A9r+W9lz2Yk3nYf1EGAciwTbaTV2phLYKa
J5n3iKBAq6ax2F/57Zv5TNzb0SjlSZ4WkFkdjiz1pGjtKLFYzBdtlmxtJ38b2muKoesrj4JawXKE
rYjeyUsoddShpIzFZn03I2gCUC7S2ebuztKracjMki8Fy0VRCcmmpjMteA4cnEFFu+lqhT22dgSq
F5u7xpGKM7qcLzDeNhbT5doyEDO2PSPnfHjDLndeAkrvtMHEM5dzaCCDo7xX4sQOmg+RFlopnThd
Lk8lyTmme6MzN7ui/i1Xn+wOqdrZVA2cjhPBSjDmePc3pYbLo2HmqEwNeJyNxafISLNcrzBfB0Ow
mdNmiVTN47pdb3YlC2T3MmSMTe/u7tGt631SPwjRanrnbR4N8334B6Dcl0KyqrXtDl4///X4PuHw
FPL9T5X99P13yQ1/mXx8e3x9hyYnL5fX58kXeV5cvsKf9mVbg+4I7fb/o97x2k+5mAeVvQQ8xVQK
kBI1glcJaDwtcg9s0XN4QNcNG+0RsH/rho2/fjy/TDK5Xv9n8u355fFDfpmtLelKFmWQP7xWRb+6
6M45cdTOISktlNEJ9kbUba2RnoxEJCct4WhfnNvAUbJy9/mVu2lt1LdC8KbuuXy081Rkp6ywmISK
8FjuxNrOKg1U7i83NamCDOply1JK6PjwrasQGvplOqSzTPwsV9sff5t8PH59/tuExn+XG+sXK4ZM
x724Fi+7SkPDkZ4kskKLoNnJOyTdjb6kv9ZwmR5I5N8g26OigiJIi+3WMWBSUAE2OMQksxhGp+42
47s3YwICs4/nSLIdKJir/2MYAUGCA/CUR/IftAAZjQ3Ad8UVExVNVZW6OXSZ+9/sFZYyvUqAGq4+
3oXr9XaAxY5aXwjMKXyFddECSBud2dGXdF5kCJnQ+lGXJUqFn3NBRn4Z+gvAz2URCHat0KU7lPrk
snS6/7l8/C6xr38XSTJ5ffyQcvHkAmmxf3t8sgLTq7qI81yqQMoVjLVpmZlgGkNkvb4Ikhhe4bjk
BabLWTP6JALqVFU0/F2Cp7N7ZIMoXJL0W0B+1ZP/uU/f3z/e/pyoXLXWpw58Siy3gJfJ1m39IPAE
Fbprzb07b1GmTzrdIwnBu6XILEYdZo/b0Vf0iJ88QO4DgJngbgbdbsiCXebCq0Sczh7kmPqTf+Jk
1MiJS/ZQjG+Q8uZnW0oDWAMp+jimUJlzemtYVQeEXI2u5UBi7hYGW66XtspZQWkWL+9HQClBzO5G
zSvBAs+2NOAx3nLALv2WHjrNpluVlGuwladwu7KeL/2KALhqRvUAuJmhGY569BwvNffTPLs0vF7P
pvNQxQrrD+snZRSQj5qTzL88rPHTWhFIhoFeJ+D5J4Im4NRosV7dTxded4o0NjvPrQxCdOAZrhVa
nhuzu9loIcFxoiNfubWBsbt4QHVVCm3nT1IQQaczO2+ZAe58CKSUqyBKg/AxPF2uRxXw8SIzCRND
XasrnqTM/07vOFCwM8+jIh8/O5S8+Pvb68t//SPBDlTV7cE77+VfLQz3ZLTm0v88mDN/Qkb3kQIf
Yp+w+mwSxaEf1Z7SaPRhnYb5t8eXl18fn/6Y/GPy8vyvx6f/YtayZXer49KPRBrFe2gitFjriA84
L6AVR0qYRPHJUWAhScGXeDKdb+4nPyeXb89n+d8vYwEg4RUDG9Jh9DpIWzgsQw8WUekkoe0Rua/d
GhEU4gFl0K52tZedwEAPFrd5CPHt+VqWHbPiKFhUYyej7J0xb7dUdcy3koW14bDnSok2/ITv2B51
FnbLps8Ar5jesYNK24FbyIFrj+fiWTOSjSEqFCXktyWx78/mklTFMY8ryeAFhsImVSHEQ21BlMcT
g8e8YxmigQe9iKTECdkoZwQiSXiTdKoDmVt4eQpl5T41KeoHAfvLdRaKSMXwqAJbO/qJ7Idg7niD
3FZ4Fl4G1uV6cHCuE5dytlJplYq8ruQf7utWxQs8ZEZ9tFR68kd7UiuyKoRo7c6cmK12NppyJ3RF
nmZePrrKD9OhLVsu7x/fLr9+B22GeSMnVlDu8ct+tHAYCflTHlNgdjB6NXVp4AEw+LIKFKIikaGw
th8gWBX7mxTClUQ0k9LBbIyANxIEKqVwfggFfMnqlWT6/P2jMKf1mi3vlphOt6dROYR3vIToLsFY
NQ7V5n61+gESz5AUI1uvNotwx5sGS4jT0YTi7hwoWSPxa8AyrWZ7KdNzrEWRCdqFoQkbfWLEWRyM
ogC0RhBpT4Ku5k0z7phHYHMFg3XWDy71XpkHfn7uppKtnZg8Hat2Tt1nQJbiQZLmdDFd4KdYUdUM
1zLXD+WuQBOWWj0gMSk7G6duj2uQSmQLl+yNCrbMffVi9XQ+Da2WrlBKaCUH29OGpZx6LjJY0Zr5
OTKZ94Tga4trNASlXWlGPvt7rUc5l7L8uZ5OpzCtaIvqugpYjMpaXbFjWM18iU8vJGBrtqj1ht1H
yQXIY4ngH1BRHA4Ls3DYHVKneP8kYhpE4J8LmNCk3Fodx6qoHMFBQ9o8Wq9RF0SrsOZivNf1+3v8
SqEZ3PYBd7u8wQeDhlZbzbdFHohyJivDd6nOgBt075EFQ27bwwdTLzdplIfiipkyUCB3I+BK7gUz
+3UKnfgxQ9cS3bFUuF4jBtTW+MLp0fh49Wh84gb0CbNEsXvGq8o1/aZivfnrxiKiXFDna/wTBimi
wpM7q5Y2LaOBxOkxzrpZFcbuqax442PKQxFCulL+Y0mczvb4wpOsvH9YjeuT0o8W64fFxWY3+84+
A1uBLhWdERFF7Y7kzDiK4uvZwr+xOxQ83zlzNUXPCOYL7goQCN25xYNWSfgpEK+1CRXxj+8Bcx9s
HT9fPuFmJMNQGN2Ys61PPlM0LID9NvDktH/AtGN2Q7IVkhfOusjS5l7uE7RGiVuENQ0SK85X0QkW
QMDuj+Rk3UWwF+v1YirL4opAYHjX903gPdWruTCL2b7kV/fzG7eYKimYy+NKbpWaAI1tMH6LXclD
5ZaXv6d3gXlLJF+d3+hVTmq/TwaEMyZiPV/PbpyW8k9WeUkbxCyw6k4NGu3Tra4q8iLDD4nc7TuX
7BHkBMglHwqh8Vr/Ph/XsJ5vPBFt5gU2sFF7f430yGNaV7jO+xyv7/7C1N32d5x47GpH1fNe7DGW
44LF3hkBMNkJnTCQ5vvGtWVC/WuPANdFSjLFcuGjFT8wMIVOgmqgrnKWC1ADoRN5SIutm9z8kJJ5
E7B5PKRBtkvW2bC8DaEPwYiAXUeOYFvhBpI4QDwVForHXGU3F5lW1Q8llnf3N3aRkYrtUuvpfENx
xRag6gLfYtV6utzcakzONhHoxFQQsKlCUYJkkm1wfHYF3G++OISUZHZeURtRpFLMlP+5r5MJPvIC
HGNhum6sPME9JaGgm9ndfHqrlLMD5M9N4GCQqOnmxoSCasKpLqOb6QZnaFnJ6TTUlqxnM50GxAdA
3t86oUVBQVnY4FoIUau7yulrnSnd981pPebumVGWDxkLWJPD0gkYJlMIcZUH7iCO+cXbnXjIi1I8
uN4UZ9o26dbbweOyNdsd3bjzGnKjlFsC3AQlBwMB0EXAkKTGlc1Wnd5bmfzZVruQmxZgIRIGxWPu
WtWe+efczSGiIe15EVpwPcH8lrCtLT3tyo3tJ2l4+Pg0NGkqxxqfoCS2H95iljROIwqgPEaQsmKf
2Hl7eWlb+INyoAKHaleT3kMla1dBtqlgZBHlMh0FIiFpFbaX2kYBIzs3tYbQDDLlyO/3EbyOiP1W
pKDb0hWvFVBxkxnn+J5SJE2JJqKRS9V12lYAy69GnHXIgoHnZTE88m634Cu0cxadNi3nfALwcCAg
kWCyK4l53nptgdbLa6PDGE2XG1CBNOv1arOMXKgc4VUDWlwPuF4hQP3Y0g3CIOwabZLfHVuFtLif
woN0mGB9v15PAx9EOSWx9zlGleCPSkzkwhp3pcOWwKnP3JoAWNP1dDqqC6jv18FeK/xyda2t5cZt
K1FJvh0Qp2V6FB5MWds2Z/Lg9ykFW8h6ejed0kC7aVO7lf0fZV/WHDeurPlX9DTRHTN9m0txqRtx
Hlgkq4otbiZYi/xSobarbcWRJYck3+OeXz+ZABcsCarnod2q/JKJHUgAicxhw0sTYZ+kAXyXqCc7
34LQic54b1TjtMezfFtzv0OJkWbSx45/tnz0YRQoTVvDjYlG5DqcRgTlbSyMNJrxlkTLA+tz1yEt
oPDMHIZDkWqyx+sRTdAwne9gBvA6/Jeab1r5bVfbXjYsUyMHIRHm9TKRHdwicQoOMm95gFq1Lfky
sh3iV2mzW9s2itheTbkZ4lgoSXDDWfooH1D+wNLmZY7R53Ss3E+WuPvn17ffXh8+X28ObDMZLOM3
1+vn62eMLcmR0W1m8vn++9v1xTS1OJXyY+vJcddJ9lmEPPONT6VtM4ASey6lGyf93riHVGTJF8jI
bLj0AWJAnz9yxHIAA9j69rI/KcKBoudFppJpA7rp0wbjs5o+tGQ2XaZiXyRIyX6jkwgXUALgUeCa
ejka3CDjrk5SI/1TYxZ+n6AnGG4NoKjyY44b2ev7VIxL3QwPTiz1hjEH+05+WgpweGv8vjDFccFA
1B6enIoy9GSLq4FwKRg/I1cVUQHZvRpCGq6j1g38vqhW0JyktxfSjPwikeolE53MxCmt/VBVQAfS
ogs3dZxUln2BzDUqG1QeJLbxcmLMf9E19OgcT8bHlbc9QW07BmH02isXcITslkfI4ZFaMKhQAM7J
iN96RylOk6XaTFmtQ8UIAUj+ehUYyubDfx45/Xf8Cz+6ya5//vjyBX0Izw4YZDE8LatXC5Vhq0SZ
/ydpSXJOxbbQipAdaQUdoEqFeKYHz4b/jen95+GvB2T48Xp9vL4K8+jnH283g1RYI4SQ2cWMWQ1q
3oh2mMlqyYlykv2WR9SkTcllNuJ2ArpG3vUJNepG6NLDJhh9SCgdSoXMQV1hmXLqLLw6lbGy+ilZ
xGBZsDq+UxKYLBX1ouu9s3q3BJSV49hOjgENDHTCQld7xQXssZ0dk+ZO8zQPCjOgzI0zneSdvHVQ
oIgYRkKqj0QJIJbIAbUNRqWmp0PR6dsydmWDZSBc8HGIlgJwrT3ycnPAWK4JXXuZRoo8P8l1sUAk
zTFExuLcFKuTQNdKVNIwZ6gE/S3fSLZ65hGZM3QkoAsVqFAtO7v+FMfvrkkd6ZFM5lClpieXXhXk
T9Tjs1PpegGlfSKgrbulG5OWaKdSc0vLf190P8Anvi+Y7Low7ANlKSHn9eNdllg0aX4Wkde1ZHfz
oa+3ypHOQOCOHeQt6uj39KQ4guQByYfeIJ42P/Fo86cHdO/5i+kp/9ebt2fI+fXm7evIZdhantST
cHRnSe3pS3mWwF/4/vlfsbSpyUqqsjD4meHMHj3vJ4za3bJNLT8agl/Tho2MiiWZZZvYNrnNyw0J
6TVbndH8Ss7j9vBH0bPDJaeWH9h6rS7awamw9WYFpaBxY+vZR+K8xrOMPPc9KtdN8PPSaj4qhhfH
32G1tz2zLer2IIf5wp/jTDzngFO3Www8jztDWhXhTGhsbIuLITgY9yZ9W9nMrTlTlfRdcdaZeHkO
r9eXx3tQL6ZXdqqiJr5Hc/vlfPzR3C0z5Mf3cMqfuahum69K8eVtfrdpNFP9kQZb6RZfg5EJq0yW
uVdjoq7xZpb+dkNn40PvOsE7uUCe6F0ezw3f4cmGKC5dGNM2jBNneXu7od+iTCx4zP0+B++o+Tui
+jQJVy7tmV1milfuO00h+vM7Zati36Nt2RQe/x0emHMjP1i/w5TSo3hmaDvXow3vJp46P/UNba4z
8WCcIVxI30luuBZ+h6lvTskpoQ/MZq5D/W4n6Svv0jeHdA+UZc5z/64wPMC95PQ531yfPSgN6LSB
2DrOU5a0vuPPS8s8gnRJSjlc0Ezf3GUUGc0k4P/yAeoMsrs6aXvFURABXlilXkBNLPOTUgNCl2m3
hlfOGc/xKUSe0mbQUiZyPIUo6AqWUuPtSYYompm2TYrbAdVqfIaPFf97UcRYE9rnSz7QOIMILIuZ
XGDCy6B1RN/wC470LmlpmyGBY6Va3zwIFuhwNmNhwYAdZmO5EhT1kLqu01rCSQiWIzufz8lSTq0z
9VChU99bLs3Mh4fdiws+HqPSR8mChcdwpytmYMDmY2mXW6wUh6FcMJvVT7EyrBTFWf79y2fuTbL4
vbnRHWvkShhNwkmexsF/XorYWXk6Ef5VnSIJctrHXhq5jk6HPYcyBQkqbMoFdVbsOb1LKCNLgQ3v
KAhpQKpElEv1gy6luMXiraZ+4BCR9C6pcrW4I+VSM9CNCHq5Ioh5dXCdW5dAtlXM/YtNJ15UQ86e
ewhVXCivX+9f7j/h5YzhWq3vlauyIzW/HerivI4vbS8HERnOI23EwX2eF0z+80ruKBgddeK7yXH/
yK4vD/eP5p5QzHeXPOnKu1Q+LRiA2AscknjJclgx0qTPM/6OupGdrct8wpuj0sdGyA2DwEkuxwRI
tcVdscy/xQNG6kxOZkr1p5ZKZhQvJRKQn5OORuqOhztg/1pRaAe1X1T5xELmOz/3eZ2R5odKjZ40
owMVfLd68Hgwpg5FZCbQOSwNVRVTb6mfn35DGgjh3YZfSRIOrobPsfBl0VML7sChHspIRKm5dKl/
MHrtGmDxAHOJg6Vpfab3pxOHGxYsspiaDkzQvpu8y5LSYiQvuIaZ8Y8+2ZnhpUjW99jQoPddUZ3F
PFLAXUu/XBrgLYNqbN9Lg3MVNXp1eI+VtZ2mTIwuktTpR+sIVdp3pWHZNIC1cHmVJbroga2+7Cwd
pW4+NjZzdvTWaru05z6CLwx2s/YOjT68FFVaovPSgHDd4y2QMPRB3dPKy/DuehgQlru2qgB1oc5K
y9toYNgMhmfiNmZruDseOPen4WU+dQTYl6pdAOi8hXYfOTdTU99ZvFRUp+Roc2b203McQ3cc0DaN
Iz/8OfaIsc1gWVMpUNBKvuqG37cKoT4qbmdBszGehGMQJU7Pj0xeRuG33n771qJVQovs0n2e3nL/
/NSL9D6F/1rZ+SkSCqb7PxVUkw10Z3F3TEN4+1Xn8vIto/Xh2PQ6WLNUJYzi5+6a7ibB9DgBhrSj
lXXEjj26/uqas2WYDVlkve9/bD0jcNHMmJfcLStRr+eiLO/GjdwYo8LQwiTVnXd5GOEH1l82TdML
Z/Hm+R9kxTxlld/Oo2sWXrsNqEE7xdEzUvlxAdSeMqMhgMZOZIxpDu7hK9nvNBKrw3lcl6sfj28P
3x+vP6FwmMX068N3Mp/4kTZYRmrZpyvfCU2gTZN1sHJtwE+9JAhB0el5aMCr8py2Jb0mLBZGzsPg
9V8NXIOAdprBB0m5azZyaKORCIUYaxETmxR89NM+1+AQHuQGJAP96/Pr22KEECG8cAM/0GuHk0Pq
7c+Eqj60OLnKoiC0fSNenBPfXKqWeqfHZ4ZxYyPTGPnaTEBVr7OjOyX6KINPLvy1Eq1mcJw/b4K+
eLCysAJ2cWv6zHjAQ5+6ShzAdXhW2/sov4AfCG03BY/mXpUIu2QuLlU1hnk2+Pv17frt5k906y8+
vfnlG/SPx79vrt/+vH5GU73fB67fQH3+BL35V116Cv3VtughnuUYcZK7m9V9iGswD2RtrTGJcSE6
sM4p740Qy3eeo42kvMqPnp6thQI1/NBYlQEjkXCzJdqy6mXHOUibXhaIa9CfMK8/gSYJ0O9ikN4P
9pCWBu0TPNYlrGuat69i4hnkSC2rDnDMr4hLJrekOC2+iKBskhooFJsk3chLknXG0TofHXGLQ0Pg
cp00W/RpHQAdPltf0s4sODW+w2L1YCytkVO+fKn5UozcCBTQsVgv61zZSSXPaiEZwYu1lRy1i6k/
lKVWnMKxQvMbN5MfH9AbtRR2Dp3q7uW9f6tGaYWfC8Zvdd8ih9G5kDakRe2bUWhaFvhM9dZQGSku
fqhDacozy7DaT8l/QW9z92/PL+b61reQuedP/yazBiVygzi+2FQulQF3qXJPN2VP3xU1boykii5q
odpIDPCXdDw3RJYxANEvZ4Fz5gUJ10Qq5wNapa3nMydWFTodpeSysxs49GHByLJJ7mD/WFjcTg5M
sFnourtjkdOHOiNbeVef+cXLcoqgYdsu8KYEkxr20WVya3FJM7LlsM2GeZneoI5cWV7DFuq9JHd5
VdTFu0nCTvVdnj8SBgrgu2xlfirY5tDRQ3Vqw0PdFSx/v177YmcmqncW3D0kZidK2Soqfcl3KI5O
xdRuIFy2MAli2I9LWWBIzsD1ZI6LGpdm/KjoPuiuCMSYsCzFXBS7Y1umypICGor9xfXb88vfN9/u
v38HdYYLI5ZVkbEqa6ltDAezU9IqJ5mcimesti+msW4oBhwuZE+mnFJt4pDJ/lRFGQvVF4Ug9ol3
Jp81cPh4joPA+EjoHWQHGct/2eqXgOPOxl6NYgKGefG3AcULBq2i5WS2kRvHZpGKPo6s7axei440
3yWdcXF48FqqVeaJuWG6ipXpfSnnk67Mqdef3++fPpNdZ8HsRbQt2j6QxoMz7JmVMtBxdNg+5VtZ
3/x0oC9/uo0Do8P1bZF6sevo2p5WBWJ0bbN/VDXkI24Ob7J1ELnV6WgUwOpFWozHZO0EnpZ1TtSm
KJhq64+Xvi+NBMrWX69om5Wh8nEmtFZeUlaJPvl0adAHsW/UKAuDODQrGshrVy9E/6E6x6FGPKQb
dyU/cBDduYrX65XcUESDTPFBjYbSBv+wFVdap4/PRK+ENa6hjQWGfkVtxgeouPBQlG5I9NgiFyDp
615UcJb6wqG2ErfUKLLaBXe7Lt8ltBN7UaJG9dZ6Uk4YTi4eYRsasfvbfx6GzU91D5tktfPDR2I3
wG2sGnrenZky5q1i+sxBZnJP5BOaiUM9IJvpbFfIdUZkXS4Se7z/n6teGrE5Q2tY+tR8YmFaiDYd
x6I6gZJLCYi1mpchtJnP9DCZNDPpkl0VF1qy4Pm2LMQOfaSjfE6e66gcriVlOWa9BsD2PLXWjB+/
k2TgnGnJkfzeQAX0ITDXQu5Q41NlcSOivw39alItmxMegh6lWZQ7p0lb9U0sZ+tyRjqmESg+gSyl
B1cy1XxC0+KzdOQg5MGSG6+9QODK5QEGH7V9hRtudB+Aq50TKlW3SXoYgXeX9OQ5LrWejQxY66FD
fSoa6p1PY6lXKXSPEsk2lGn4WAxA5fsk9EClEUc5mw8eeiKwAuqOVAf32Qc7mPWXA7QU1PtgU64X
DlZ7n64vrhyQQ1VicYOlKoV+4EbOipQ/YMspcCbP4ttmrGhQwaC/+NRkNbLwDukoc9IIlW0cedFi
Apbt0yyct610wjWK7v0wcE06lmoVRBGVHdRWo3C9VBho25UbnKmvOUQ6HpI5vCAyM4VApF5YSFAQ
L0pl1cZfRWb32iWHXY53S956RQytrg8ceb4exXX9ehXQWcnW63VA3zvsTxXp94kvt2oE3IG0/P56
ZMqrHNKu0bIKZ65mu4XZsEygd7I5dtHIfOoKbmiIzlBkO94RH6NM7hqMHpa3sMlSA+9QjNuk6EQY
Y/omlPiEB8Zmre2ef/zELp1gXMwvMqBjGv7PO4LmzCltzE8OBz4y11l+3Hb5h0WeudUOJX9kb97b
8Bh7eM7/jbJ9g43Dpb3Ftapqp77zTToC5x5KWJPC5MqorMy3ScDqr5wzkZYsDVnoIg0r/6IsPWNo
H7QkjC79pIAkfbrPGvnF/kAxrp4moG5OyV1zoBSLiUdYp/C79Ute4wDJiCTwPQE3lgBp89Ca4PGo
SjyDvn/79PXz85eb9uX69vDtis+ed89QmKdnbRMxft52+SAbO6HRYpNA432PZNSy7Sd5lIUMXzPl
Spy7Lt9WL31c5fXWczdVSn5/gkUc/qEqeXCwQn31sSg6VCeXki3PKFeahIXzZ7oUp0VRyTlEv/hm
J4KaPxDkJP1wwBAtSvpJdhQvBzRyWVR4oz5QZyskoEeu41oqJ9+kl9SPV6owPD9zYi1h1qLLs0sv
e0/Y5RhqREuSgcxt0bepR9bGxJcfumYsCHWBt4kgOSULxQb2mqoTjGQLc6VFQOg7Ts42mgwMx6CR
oEwEZXLS16p21HiM6Hpb/Ys40iti3y51BxF8SqtjcRGq0NCuC/aauvD6iE1ByA0dvXzQILEfOkQ7
RbBHtdRe2h6MzsQdIQ2nopbPkMWPNpFZG+LQyfIZeuRT8nyCHHvRfqtLAXocRVuLGEDXAyp/hK5Y
P+qfKP01b88wDpaaa45zqzdEsUZvVDbpdZFGjhtbcZjXLolnjE+xFLPktz/vX6+f59k3vX/5LAf1
Ss1poyrOsMU9qdGQCOltWrwrvaASAGGqSTiMsbZhrNgoFuRso7GkBQ9GKrHObTDjVKcCFB+jL34+
MtBtzMa4NrbtyiatEqIUSFZ/iYiqeMpIc0+4sq2bAEb6FOb4kEGlbmUA/XFe0qq2oMq5nECGU4nZ
DO6vH0+f8Om76Whw7DzbTDOv5BR+UK4MKaAmzI/IGyJ87DeeyhsfJb0XR45hZiGx8Idgjrzj51Tq
GJ9LPLeec7a/lNpOzxQv2qtmiWO6k1S+E9Rl0XhpSR66TKhZc5xsefA74Wv66fCMk0EYser5sYVs
JDAS5esMlDNoZMoBykQ3co3UkD6RmGBqZz6Arvwohtdu6vpnvZkH4pAntTVaL/SoN937Pr20CStS
5QgDqSBFs6SU5Ikp/cMh6W4nk6w5M2WbqjeoSNCuCefNDq/idN9n6YV0fzunN7wlUUo2I0b0QppL
m144+oGFHumzB0B+Q5VWjebRA6Fb2MhZqyiO2yp2tHYTRKN7cHLo2LIgHeuoVH6gY448oMeWu7OB
IV471H3uhHpGFjl5TR9nzTh9ycrxPvTJIGQjuNaLN+5aVDIq/CplPKWT9T5BgYlUGQkT3bKQDfd4
xCw+32zJRO2QidOmO0al9CxPl6ZtVqyi8Eyky6pAtaediLYycIbbuxg6jGd+aHlhmmzOgbO4sAw2
DYbEO5aSR2MI9sUlqXw/OF96liaZ1pDiglcXiIemlqv6QWRZUV65eUfQLn3xCtd11PNMfq3ruPT6
IMCIPhTmyXOGmPbtMDMsLD9YACgiGcNjEiBuo03Ba9c2gMzbaplKrQiAwezk074a+lO5cnyzQ8gM
GFhgqcegE6XIJ/p0WfmBbzQ8/epNZtBu3pFmmNJwpaYrPjb1supxquKVxQn5APvusl6ELIGjs6gM
4/X/QOUHJqwlalV+oWDTM+cTjx2ePzbStcBE0n3szYBwknxsyj7Z5RQDvgY78EeSNTtUOSkdT1f5
4eoiFyxmO8WeQoHUNXGGkrSP4zAgoSzw1zGJDE1dZo27hIOGgWcRFIukMc8NNaOj5kz2A6neudpI
9ASVRZ2SNYzWaRUmj5wANBayJrZJDduQgKxfVXmb6QUr175DfgJQ6EVuQhcHp/aI2t1oLJba4Bdn
y5WJLOrIl7A+9WkHRipPGIW0gFHdWpSATEFslxCHq+UscJ6QHAuzCkZD8l5EgQx9UENjj3rsIzEN
Owj9RF7liGJqq6LyQP7JPLZxHKwtokEJJPfEKotnKyDXId8ZQ0JFWEzDVCclbHv4mLv0BNYe49hR
LQQ0kDQS0HjWtOxTRZG5PYb6WmEGCU1UArnqupgdSYk0sXIXDFHtDAwUi8CFZrJghkamoh69SVCZ
AsfWCSgNjmZy7TkMLKuXqWTNGLHa2zV+dPZ6STHS7XRAPt9V5umiayjErS5wDngWeChZHiOflaVL
iprtk6w56WxKDoncKcDgIX/h+03WHfk7SpaXedpP52nXzw/3o37z9vd32XHJUDlJhadHxgWCQJM6
KRtQQo82hqzYFT26UrBydAmaMlpAlhF3FwKaPHhacG6HJFfcZKJtFFmqik/PL4SXxWOR5Tysi54I
/JjDsg9IdtzM07aSqCKcJ3p8+Hx9XpUPTz9+jv489VSPq1Lq5zNNPfCS6NjYOTR2q5yuCIYkOy68
aRI8QkGtipq7Oa53pHNMntL2VDeZUk6qPErtTi9qn00f3XqVYk3S2rlN2BCJ/svD2/3jTX+kEsHW
qWzOKxGk47rxz5LzEBm7Y/9yQxlCD/54eMZrTY1ChWiOL6IZjDsMCFA2jKGHLksqhzKXLPGmkONG
meTxa15jD2MkLRaiHoiRN5Xob5Xe50kQBWedjAckjvbqdqJJG6yRlzQwneHQSABqueB/kRkKVxby
5dzL8QuGFJIkipxwb36zDePQ08lio6yMmlU5YAUbLymo4TB2XR5NYXaKxFvk0/O3b7iJ5I1kGeWb
w9bTNugznZgBOL3Kq0a2P5qRrBLjqNiR8qqkLBt98pg+ZNJHrGLQTEkNzZL10uyH9TK7UNbd84p5
JE22sD1NC2OWmkNPU+RLygqvOy+hvYHiMzHZ3ATzB9XjwX9S9rSJbmLIucOU0mZIhaNSLyx9QQer
1RKjGLJV+jte893g7DY8YZbdcmGN8yBi3VHviXxJs8ndPrxcT2g9/Au6QL5x/fXq1zFkjCQfC7Mt
ulxpTok4eRTWF0z5qY8g3T99enh8vH/5m7iBE9pB3yf8rkGYS/34/PAMC++nZ3x88H9uvr88f7q+
vuIzVXQH/O3hpyJCtFF/TA7KXDCQsyRa+Z7ZpgCsYzLO5oS763V0Jr7M0VlsQClhEoPn6FmpWOuv
VNf/Q49lvu/QB6gjQ+CvqEu3GS59LyGyWh59z0mK1POpV+OC6QAl9VeG6gDqcRQFFNVfG+pE60Ws
ao3Rho5/Lpt+exHYbMT2j1qYd4YuYxOjvG4NCSRJaLwTGxJRvpyVKFmarvJEIlyAqQsBQC1PMx46
K/pDAKyK/cwVr6jrTYFv+thdm8KBTPoBmdAwND+6ZY7rUackQxct4xCyHEbml7hCuuRZloxTwwWP
dqKVvfr6Yxu4K+pLBEib8gmPHMfouP3Ji52VSV0Lo2+TGlJU1xi/x/bse3xYS50Ju+u90pvJThq5
5AZ3GL9nL4hXyvtAradKCV6f6N7LE/EiYwQiOTaGMe/SkVFEQQ7onuwvtCHH1XOsGQjII6IRX/vx
ekN8eBvHFlv/oZH2LPb0CwGl+qaqkqrv4RvMNf9z/XZ9ertB/ytGPR7aLFw5vkvMpgKK/YUkTfHz
iva7YAEt7/sLTHZ4X0DmAOe0KPD2zJgxrRKE/86su3n78QSqoyYWtQ1Qlr2xZUeHexq/WLAfXj9d
Ya1+uj6jd6Pr43dT3lT/ke8QTV4FXkQ+EBCwdrE1lBl96bZF5nj0Ps6eKzHc7r9dX+7hmydYQ0zP
qkOPakWkzLI0BklVJG1LIfsiCIzpoaigLonpntOpE+QZlj3RztTImK2QujaGJ1B911h8kRoQY7Y5
euGCgoNwYAhDKrUGcjp93TExRIupBeHKmJ2aYxgGRjGR15ybONWYyJC6JqiRF7hUKSL6mmKCwxWR
cCSyQwhbLHEcB8QS3BzXy82yJqvE9WOz8xxZGHpG56n6deU4LkmmVGEEXJe+Vp44WtvF88TRQ5p2
zQJw1zXWaiAfHZdoKQ74dqUIceV59TCSO8d32tQ3KrBumtpxSagKqqY0NqXdH8GqNuUHt2GSkFRi
JgT6Kk93S6sYsASbZGtXq/jUpCeY93F+q3hdoGdAPjmWQDM3XuPyG8TmTiW5jXxzqGWndeQanQ2o
sRNdjmklZ0dJU+w6H+9fv0pTs6EntG4Y0AZQggNtEMiLhgkOV6GcBzVFsUS2hb6mzcuhjmmnxAcR
CFxk/cfr2/O3h/97xXM2voYaW1rOj+7KWtlkVsZwh6n6ztbQWFkCDFB2NGHKjVwruo7jyALyIzLb
lxy0fFn1nmrDqmHqLZuBWizfVDYvpPY7GpPru7aUMIoNbY4jMZ1Tz/FiuiDnNFBu0FRsZcWqcwkf
BmwJjcx7CYGmqxWL5Z2LgqJaJ5tgmB3BtRRmmzqOa2lqjnm2euTo+y02JE/N4TJbbq+3bQoKk61O
47hjIXxqqbf+kKyVRVAdlp4bRLbyFf3apa29JKYu9mxJQ4P6jtttafRD5WYu1KB84mLgGyiY4oeE
mnHkqej1yo8Jty/PT2/wyeTRjtsnvb7BNvX+5fPNL6/3b6BHP7xdf735S2IdsoGne6zfOPFaOW8Y
yKFL+tsR6NFZOz/Vc0JOlLfRAzF0XYI11PyW8nsUGBlkCD8OxnHGfJePDKqon3g0vP9983Z9gc3S
GzoXtxY66863ao7GSTT1skzLa6GOOJ6XOo5XkUcRp+wB6TdmbQGl3OnZW9FnLRPq+Vpiva8OWCR+
LKHJfGrSnNG1Vrpg7ypnl2NLenFM9QlnsU94a128aH5TEvYfmyRc7RzVLGJsIkez7NS+8uS1DInH
nLnntSlqGPeZay+P4BFN4xudBZI6a8RDErqOUVQhwJZpgUbkR6TPp7FHnvXUGSxjWjPCcFGmWt5v
NnGYqL6D5rpVDcKmXtzf/PJPBhVrQc/QexLStKxC4byIrCggU6vH1E99o8fDQKaM+xEqYf8Zu+Yo
h4lWy1B97kOzono/0AY4DiA/MDpTVmywnivqxF3GU611+BNQpyKprUFdGzkcChOr1GS7dvT+mqeu
/jGOQF9W7kQTZB4sc7rJAlJXrm7J0PWlF/tGMwqytRlxMtVy/DFzYfnEu/BmijaC3S4d5nRrh8PB
HeudXtSKRza8Z7SdmLQio9snPYPk6+eXt683Cey0Hj7dP/1++/xyvX+66eex8HvKF52sPy7M7tC9
PId8OIJo0wWuZy6FSHat1bhJYXOkL7XlLut93zmT1EBPYKCHlH82gWN4R2KxcLQpPjnEgWcMTEG9
QM1Y5A8Mx1VptAmm4ppTUcGyfz4XrfUeAEMopmdDz5lu5HkS6qL9v/6/0u1TtCCmFIOVP3msHm02
JIE3z0+Pfw963u9tWep9CEjWG2ixUEH5HFvMTo1LPawVG+U8Hc1mxh30zV/PL0KJMXQnf32++8Po
UPVm79EnhhNMHZYOYKs3GKcZ/QqtmlcWL2IT7lHnUjOqzY647/b1QcPiXUmMGSBbIgNxSf0GtFTS
f9kwCYVh8NMo0tkLnMA2Tvi+x3PM9RInetI+FMF90x2YnxjfsLTpPcrgkX+UlzkPtCx6n7BOKcZg
vDe/5HXgeJ77Kx3/QFvMM89Z06FKhV5AH/zbdjdcfv/8/PiKQa2hh14fn7/fPF3/Y9XwD1V1d9kS
tnamcQIXvnu5//714RPpmzvZtUSVHXfJJemkZ+ADgZuD7doDNwWbD7UAZKeiRz/PDW0amnWmS/oE
aPIh2ng9JJHFcdvL/bfrzZ8//voLGiUzT922tMEc+Rn/bnP/6d+PD1++vsEMWKaZNc40YJe0TBgb
YgzJXQ6xhWAD6Iiw5OEONQEGPvsknmTPoHistChfMc6eyfpLYhWR1b8ZId5eziCPBLqYE24PflI8
4MwgS/aJ+kxbEm11A6vwxLHuAU8Bo2UBpmG9Us2h7yRWaE0ibRwEZA2btutSc2thvyR5R6iDqKSG
48y0yWAjFllqoUvPaV2Tg+GdLj8mtM8qxReoMXOMjKw5yA6U+c8L2nhqoe8UOnoqguEgx6dnipQ6
EyGlVFKbqh+gwV5e74o6N6H9KctbldQlp6rICpX4B9SaSRlCoSo2z0wUAN1uydWO5Ko4g97RWGLL
D1l/F7cF0eIl1U1s5dRhKk6TLmP/8j1V6mgg35QZWkRbZLddk162TC/UMe82DUbLBXhrz/nMZo3w
xgug213LIvRAGUPbXthuc9jq+WL5hwMaQ9qqqmoPK9hqYcw+rfHa0r8ozugH6sqkJuk6gq6ayWFZ
eK50a09OxHVY+75sGq37VX2baN1pjCPJA4Jq3LwUetl5tga3pVogHInrhCbWeonYZrDQ1cnxJWOt
TnRDk6oEg+G5yfTAnZzoxi654xrRVWx8UzL6HJaDH3vYpAVa0h97z1ePeCayR28QEE+rAvbttFni
hJO6LUcZ6NWumhFOM/IBm/YwpvztDqDmMJvXeWo5d0Rwd2BcfVDVgwHJz32XV7bOAAwwQeifcZtf
e5hCmQOPRC2y/0g+fnRDc5SxxNOJfbH2znPzExhVuxyTtRcx23aN0YnNDmxU8CY52SqJd/iUtcY3
LE1aex1h9Wy7piY9HmFO+fRa1HWSKn6VRsjSpuisXNeR99lv3FxKVpAnmrLwodviLudG7hdWfMxn
P4MIo6Hzqei03IxUc9rIFG2Vt8l5ezK6E0PFw1ILXHjT3RorzCbfNHQYRSVP+IqKPltS2HrY+CWV
pVxVI7vrGKFtoheONalBELOuGvV0QMbwHQuKCLL1TduUze6OEq0+VJroFU72lAqocfg/bZ93R3xe
GcYed55mreaJPa+bwram8iCZQ+WoTZhW3CNi4bHLaV+wvrSrMHPINeDWepkcjq0ad+fsOR2sqvGY
Zvtyvb5+un+83qTtYboLHHbwM+vwxIT45L8VT5dD0THKb8I6yvBdZmEJ2UwIVR+oNzGK/ANo0+aE
P4pmNsVs4mizwlSDBjCHrL3zPSiO26I0O19RnXneDood+2KtK/oAtPm+CD3XMRtUiN+RRP5hoesh
EtYcehpsYedYltATrRy8qqzCBWoXD/0Xhgq+d8LFr0aPw4nR5Tm38BrFehzaZX7My4UmqPrby6ZP
jywzk2XNdhJBo5qfKBnSHU2RTEPQsK7Z5HYlfmaGfDRt3i08nJP4bRkT1UNVjRjXffXw6eX5+nj9
9Pby/ITbSiD53g161hOG5/IB1dgv//lXelYHB7JkLx0w/tDmgoc43HW3lW8cizrab9tdMqQw1cnH
86XPqFOhqR9hIFP8m68Cw/wEmw7TtE1Zi4iNCcey5HA59EVJFBMxN3JcG3K2IuECoj7DlVH1EYOC
uK6urUkIbNwXQDq52xUt8na1Coy9xoAEARWeQmII5QtGmb6iynUb+HFI0oOAylqZBqFHJLDJvJgG
etgh6GpvMwfktHSJlPlB6RM5FoBP1Y6AaBf0Kg99RaHyUFYBM8fKK6n65EBAdLwB0A3uVZh2cKjy
vJutiGgEBMKApkeOhW4pRWQZPIidz0SfGYCFovuudes6cqzo3PirNUXHJ3hUsc6eE3lnE8iSyKOG
Dag/RElzFrn+iioLIN6Kut+aGWJf33iOdI+oO0GnK3zXV6F50iJW+bq5dLc+bW40Le/JeR07MZEq
R/wgSijhHAyc5WHGmULam4zCsyYfwKkZicjRLjCLqzg1H+/wsCpewzb6lGaDZ4x/zD74yVgoAewK
3DAmOi8CUUz03gGg25yDa6IHD4BtkCEch3aPbBKf74Q2t2wyF5QqIbPBkYV8BK738x350HXJ0dCV
oXHSwumwXaRGFdIpfrbrS9V4eEI05wYzfVcl5nGjhNDtNaFdDn+Qn6NNOmxk27LYFlp05Ymn2w56
nlCyFnRb246LscrzHerZsswRUrrPAFgKyKpVIJsqTUCfaDEfZYR8SDozFLBvJXTBPmFeoPqAUyCL
h2CZJ7JYYUg8uoNKgiNyiT7CAY/oVACA8kUuGPxFPPlMbeLYJus4IuYJ6Tn5Iki328TgK9aKJuyd
V+/A7yVAdoIBztKzS76/mviYn3helJMymFAtlhsUmSxxiUYe/ujeX9KrT1WsmHTJdKr+OZ2oOKSr
L/okJLI8+5JZFu4ARhbL0zCFZWnRRYYVqVcgsjhyOQNdHVFETNBIj4kpB+jKq3GVTnc49CDm0Gmv
HXLwIfKObsBZKEM/mSGic7qOiCUM6TGhiX/kO/l12HpEdaAWEwXEHIA++6jdBqdTil0fKi4TR3qN
Bn8rCxC7ZIflkLc84wqepYHVtwlsWJ3Ek0/y1KMETaxYMPHe2Jr0mZzApdNwcTNRZKbFDBDlwsLP
Oahg3+X1rqdPpIGxS+jo8AdMyMwOitbCebPv109ob4gfELZb+EWywrg1tixAGbsDPR9yVLeAUdED
3r5Y4U1e3hZ0CHmE0XSqu1uAC/i1gDeHnRptXIGrJE3K0v552zVZcZvf0SeFPAH+rMcO37VdbrFz
QBxad9fwQPRWlrxil+3WDpd52tDBZTn8EbJvRXd5tSksPZ7jW0vcWg6WTVc0B3vhIOW+OSx0q9s7
e7FPSdk3tGM2hI9FfmJNXdD7Dp69u84IB6cwFOhFyo72duyPZNPZ27w/FfU+sad7m9esgBG/kLUy
NWKmqnhub7Myr5sjbWzI4Qb2lktjvUp2RVpBu9rLX0HbdAvZr5K7bZkwexpdLjq+XUKBB3nNlo59
wzkavJNY6NvVoeyL5f5X9/R9AWJN1+e0+Q6fGJIaY+7BCLA3RJvDHv6uts+bLcxdaHNmxcsEvR/W
WrRKbYYqYBm3wiwplorBkoodavpgguPoSK0s6gUJfZ7YpwhA8xKteix3LZznULflwizSVfZG2nV5
XidsYQJmVdL1fzR3i0n0xcKAgVmI5Qvjrd/DYLZXQb/vDqwXFl1WpgOu8peW0Q9u+XRYFFWzMCWd
i7qyl+Fj3jWLNfDxLoM1fmFAMpi0mu6yP9AGCnyhL1stgfGmitA/xNMLL9XUpUkg3gRpCs4c0VL/
bDIAkYijPoSOdZt9WlzKou9Bw8trWK+l+1DECY+6SIZZFqO60sMDGQ5lW6DqZ2WAP2trVBPAky7d
X/YJu+zTTEvd8oW4/uQ1hUxYVEmnm+jt179fHz5BnZf3f9MW+3XTcoHnNC9oN/qIYt4vR1sR+2R/
bPTMTq2xkA8tkSTb5fRM39+1Sw6TG2hQYWBPVFelxKip0ssG480SpNGKNJbUfTwVQ5NJWi53vji2
g/DhKNw47p9f327S+akEEVMUP7dZfyLGsr0cLm0iXdA9a5qCNqlYvM64HkEJANgENHv8i6zC+VPr
zbkkvey31NUtcpw28l0+r59iW110YrqJ5MMOJB25W2ejpQ6QZhFC8zpGiWAvASuabhMmp/Jhb1bE
nn2wtWTD9sUmUWPUIVD1t4oU0MP7Ir0lxNT5CecKqVHwl7Bmk0XM1ItdPeJMmw7tx2po68v+hLGw
6526AgmnLzm5n+MS+AMJ+hBixqkTiBn1tfJw7yueRjRd/3NymybrBflaXDIuHeMOrQhioCdZtkHA
gyEM1rtawfDJBHVXNqNGwYAYeoSkOCC9Hc0llJ85yFSqgAiF6qklp5sxSkw8sNak8sqFU4hANKJP
ZV7s6HU5hzRUGlVEk9CofZqgE3+jAH2ZBmuX9OEwdSb1BRwnN73h2U/JwxhnbKHbc4usPx8fnv79
i/srX2+63eZm2Bz9ePoMHITucfPLrLb9agycDaq71EQnclWeoX6NsmAEHntRMGBqvLHWjwieZVij
C2yOzDCVvX95+PJFMYYRrDBn7BRbfJk8vR/R2m5AG5hr9g29BiuMWcGoKVDh2eewcG7ypLcmN73N
eU9U2h4s5UlS0NqL/s6ahjUag1qefJvARvFChI1/+P6GL71fb95Ehc+dqr6+/fXw+IZepJ6f/nr4
cvMLtsvb/cuX69uvdLPA/xPY9ue1vVJEcIX3swx7z4K6rFOY6rwXr3VsMvDwkYoQp1ay6m5ZqB/F
pii1ii/g3xpW0Zo6kcxha3GBCQnf67C0O0gW1RwitG+kE5K6PlUtspEAk9UqjN34oj2+QIwvtmSN
ZhgIFZ8emr6zAdoctqZvdnZXYxhwLU7vidMpbV3ImTMrfl+q5piD9g0aklKFA8rycovKJWVDO7DA
8GoZ8SmnY+i/Pte2o2PcALVgs4DkcIZx3ZYJfZpysAwkjE224AYfYfVNn6Dg1H6gBWYt9VDmyMMM
41dzZQoaHhKxYUsHPXeXpHeTVo7Gka/Pf73d7P/+fn357Xjz5ccVlHNir7mHTUZ3JKvsPSljdnZd
fifuAOae0Se7wnK2gmHDZ9/wZj8c2NpKDBxFD52D/xJfpPuuqfJJtrQYCAS+a1mvhZGaoF5bbkdc
JCfJGozsNGuMkVy2C1LwTL1vjM9uN/xUc3FlqPKyTOrmPBVvztEeH+akpbS7gx8Y+KRsmttDazLi
m5A2kd99DPEahJA5cxOVX5etYsrWQWJiRaAYlWlQYIVk3VdC0izNIye0ZCnlXgIuKX1OLjFaA2zJ
PCelo+1PrC1q3B8bM2T6+Pzp3zfs+ccLFXAbZLEOOkfsyXe2QM2PvU7lPy/qvhw4N2U2cc7Xd1Sq
U99IinLTKNp1m1LdELePXXKpBPOYDaiFg7QQCe8A1yd0AnPDwZv2HhZ37vmFmbbY77Gq6fDd/3a6
MOyu357fruge36zLLsdTP3xyKtcE8YWQ9P3b6xdCSFvJYTz4T9xUdjqNP1TfoQJsR5CgLLMcFzM7
OYWqmZLmR3wCjY+RjO7FmvTmF/b369v1203zdJN+ffj+680rKvJ/QR1n6mlX8u3x+QuQ8ZmGvBke
nSYQsPgOBF4/Wz8zUeEh4eX5/vOn52+270icM9Tn9vf58ciH55fig03Ie6xCO/2v6mwTYGAc/PDj
/hHDz9i+IvFJ+cFL9eno8fwAm66fmqBxbRMPA47pQe6y1BfT+fA/au95UcQVc9vlH/5fZU/S3MjN
619xzekdknyWvIx9mAPVzZYY9eZeJNmXLsdWPKqMpSlbrm/m/foHkM1uLqAy75CMBaC5EwRAANSt
6X+ezQ9AuD84mUkUspsXK33JX+Qxz2hZ1aQGoUDGP+R2gguLBG/pApHHJt3wQqshDZrFYNjjirv9
id2hHbve8ZVSJbTAvGkiqTzKAviPIygmfW4PygapyLukZnCi0Up4TxLUonq8Cm2B/19c3lLeET2Z
/1T6iLhwMpuPGPluZrhQ92FpDW5yfFLCg1fNze3nC+bB6+zq6nxKtEAbwE/1H2jIhwEHkSUrKltV
CpSXk1HFKxDmDN8S+AksZvf8Qs4qEkfsdhJtLmn/GSRoajG5pEKxEZmwJbfqOmCaTbIqgfSfb2zf
z+FDb+npFWyaq+AHqit2qgUEhh+lQ2x4tBHrv1+uoHXt2owJgnDeGqSRFjzpZaVur6o7mUXa9/ZB
3RJkDCAwWaBHP0gFJabYsAJqZwWr8DHwSEztLFB9igRRFlET8KqpeM0b4+U8b4LKxT1IJn+9S447
tloH7wLaaEiUdUt8qxkW+rRHjQO3uO/KDeumN3nWLWrSKmHRYCHG/ANK8Q+ubgCGobJbaFSI/DYK
vNeXRTO/q9u3vw9vr497WIyvh/3ueHijYulOkQ2CkMlq4Ae++GMJQgoUvNuBvl/qpcP2z2+H3bOV
byqPqyJw4anJh7ODGbJrDvstc34O28oGlpno6pgNAcWL9dnx7fFpt3+h1OK6oTZCH8tovKKnIe4F
1AB3b5dc/JwsLatbqo6GroNgGfpS2O+kLhVjFA3rltIMygp2l/fUsgxnzOaVpopWVDC6pJpVIp5b
H/ffwMHNH3iPJ77uJacSrZJR0ZbWQ6Ky6IrPhX3nIcFxQsWKNHzg5fAnJfGZYEPGKMzHCGpha1X4
G3lV+GSsU5E5N8bGbFXwd64enTUU1TYPuUdkRd2Q8+ocMSoj2g4EZsU1zNxwEYsWvFsXVdybMC2j
FEtFzBo4/GoMqK7JgH3Age5mRlrA+T91sgT1oG7DmobuDFBcdAk1NIC57BJbmLmUTSpqsYFmp05N
ElnzqK1EQ5vtJFGIG0nkss1FI++yjYr/nMVT+9fwAuk4GNlMjqnBELmAkQOMPSQDGIjJu9OBQGZd
EnlSkGWqMSVLNscocB6OlNSA6Z7qxhu/zcE3wLoUG+qMkiRsWCPw2tgalI2siWjCPKmnVhsw0xQN
6YppNCPAWKNVmcKoqHeQlpehODSTLpDeatZUoZbnInVbmky91SBB2EK6kP4Lf6414vQ8a6oTcyxJ
5FKkWqZugkT+p3qb92QlUZFJz94gHV7cUld+9KriG7Q8uexEwXonlaIkx0yAQot4kRtrD7VbvAK+
D+ATNJpH1b18mzYAhlNrbo9RjcnNAgNbDzcamum6AKEAUhc2qmQu3V1bNFaEqATghZY0P8kzJHFe
Z9VnF+Zc6+nXrMpVn52CQhxRYZuKG1ztLsmabjVxAVOntVFjcWd8WT2pL0PbSKEDWwBGx1makeOJ
q48tdZdi8YYVvlt773w/QtHtVlSwuLuYzGxDUbJ0ze6hsaBJFGuqKpiQmG8CFea4ojZu4gyKMuMw
jEVpra3+2benr05a01qePaRQ0FMr8vj3qsj+E69iKReMYsEoPdbF7fX1OT0VbZzokdSF0wUqm01R
/ydhzX/4Bv+fN06Vw2pvrBnLavjOgqxcEvytL6kxgKVkIFteXnym8KJAqy5of18+7d4PNzdXt79P
PlGEbZPc2KwmCTHlvHHORQkY3yQ3odWaltROjY1S0963H8+Hs7+pMRvTMZqApSugS+gqQzDJGTAA
9L5WO9UE4niiM7lQHjN2edFCpHHFqXty9TG6vaIPJx5qrdvGqGxRGY+ayqh0yavc7I2jqTVZaW9f
CfiXk0/ReGJnj120c+CdM7OWHiQ7b6xGri4XOUjDxnWM/Gc8y7XK7E/ZUI6o1UW5uos2OVSFnmzO
gmIxDYDlZMASh4jLc8qVwDUQ+lLX4fvXhcd/TRR6SgdlIB7+dBbi6jxxJaGoYhlJWt+1rF5YC6SH
qKNci92jtmWhFdem1TJNiMplVnYYgxII23JJZSjFicZadGg3t9x2BipPrhswD6kgcypqfPpwSX6X
PgRU0KHKh9P4h7qhrgEG/OUSLe4zeUX7wIk+8WzG49hM7TxOSMXmGQeBRKmfsoCLgc9vnPWciRx2
uHWcZw7JovTW0V2+uQytOsBdOyX0IEdTqbyaFATv4vFK/t71nFZoEBE1fOSa0rmAGtH7emVV0Xp9
UZBuXTmhVwbaO3Z45YtS45nEG8yzaLIi6oAz00PBD31IWmfoWGZaD8dwd0kGPFskny8+26WPGPsN
Zgt3c0VfyjhElFeoQ3IVqP3mKtSuGzOS18FMgphpuC/X1BWOQ3IZLDjYgevrIOY22JhbMnWNTXJ1
fuLzfx3yWzN1kN2uz04vQfzE9dXdBD6YWA9HuihnLlgdCUGXP6HBUxp8QYMDbb+iwdc0+DMN9uZr
aDkdEGWR0DkYLBI6LxeSLAtx09G2ugHdBqY8YxFyQjOYSIMjDgdh5PZKYUB/bavAHaAmqgrWCEaJ
nQPJfSXS1EwjpTFzxlO6boyWI+MXeryAZjMz7/yAyFvRUCXK7p9uaNNWS1Ev7EJd/SNO6QC6Nhe4
5ClTctGtrds1y/Sr3Ei2Tx9vu+NP35MTI7pNifweFd67ltdN55g1QZapBZwccIoDWQUik3VkzfrP
Kes7hv3x2KmrN6+M8KEo+N3Fiw6TTcqwZVI47C1bXQzirbzoayphm9JPGL80yhIp0B0OdMaY59Am
NM2gEt7JbMl2DIFHZNbql5BAESg/UPqIR4wsrS7NjZQUlTQW1UVb2e4X0qQayW8zWBoLnpakxV6r
uuOYMWOzpHX25RP6kz0f/rv/7efj6+Nv3w6Pz993+9/eH//eQjm75992++P2BVfQJ7Wgltu3/fbb
2dfHt+ftHu+TxoWlXE63r4e3n2e7/e64e/y2+99HxI6rTqCxHTOqLru8yI1FJhHS4IY5qkePdLPb
mgbvkAJO68abN2Q7NDrcjcEhx905gy6Iixct9MqK8vbz+/Fw9nR4254d3vqHlQ0/QEmMZkRWGieT
BZ76cM5iEuiT1stIlAvTmugg/E8WzGRFBtAnrUyD6QgjCQeZ0Wt4sCUs1PhlWfrUS/NKTpeAOpdP
ChwZtpNfbg+3BLUe5YavkB9i6AebgY7p3Bf1VPNkMr1Rb4HYiLxNaSDVklL+G26L/IdYH22zANZK
FIiNDRdXi8wvbJ62vFN8BR21PbzKbK43Qfnx17fd0+//bH+ePcn98IJPw/z0tkFlvhbRw2J/LfIo
ImAkYRUTRQKzW/Hp1dXkVjeQfRy/bvfH3dPjcft8xveylbCrz/67w4cO398PTzuJih+Pj16zIzN/
ux4gAhYt4OBk0/OySO8nF+bzFMMWnot6Yqbf03PA78SK6N6CAc9b6V7MpPPv6+F5++63ceaPWZTM
fFjj74qIWMo8mhErKXWtmza6SCgLxrCsiSZumpqoBuSAdcUo5wK9dRbhMcY4iKb1ZwcvqoahXDy+
fw2NZMb8di4o4Eb1yG39KmN+wF68e9m+H/3KquhiSsycBCvPDhpJ1CvhMMwpcKBTs7TZLJzAWxs/
S9mST/2lo+D+UoF6m8m5lQJbbxLyqAlOXRZfEjCCTsDG4DKHPTEMVRZPAqncDIpAcrKRYkqmAx7x
F2bEqN7GCzahgFAWBb6aEOf5gl0QnaozyoCgkXhhNyv8o7qZV5Nbaqmsyyv7vXoly+y+f7WjGDTb
8icdYJ3thmQgcqGWbrjJLG9ngii1ivwlMEuLdSKIhaQRXtioXpgMo2UEcUAw1HJCH9WNv+QQ6s9h
TAxMIv/1hZcFe2AxNbMsrRn5vp1zqhCHBvcPbpBiSssr2oZ3dc2n3RVxoteZP/INZ0SLm3WBo35q
//QkWJG/yg6v39+27++WXjAMaJLaFy/9ufNQeLCbS3/3ODbyEbqgo7EkGu3f+lyoHvfPh9ez/OP1
r+2bCmlxNJhhAdeii0pKQI6r2dyJ1DMx5FGiMBS3lBjq1EaEB/xTYEwrR7fX8t7DoozbsZLathrV
nT4bBjJD7wgWVQVunlw61GzCVWKDtFOUqXJ92/31hq+Zvh0+jrs9cZCnYkayLgmnGA0i+kPOSB8Y
pCFxaree/FyR0KhBcj1dging+miKLSFcH7wgh+M9zOQUyanqgwf42LsTQjASBc5E852HgSNgaEjs
3rH4WJzq8CIyCWti8BE/50Xssx7ELESSd59vrzaBJgx4d8n7pOrVJEHIfCNW6T9URf2bSzi+l3SU
vEEckW9FGQR3dnYCGwOK2c3t1Y+ITpvj0EYXGzL3hUt2PQ0NoVnjKvmForDGlS9ymlUF0ENMto+q
WcI3ESFzy8HPMG9g1M03aWh6RoqgixWr77OMo81SmjsxudNYm4Es21na09TtLEjWlBlNs7k6v+0i
jiZEEaFrr/LrHQnKZVTfoLvYCrFYhkuhy6a+/Nx7FxjljhegEo9Why6UeBOf9uKYHlBd2aNPnWym
IHJQRNu3I0bBgYKunvB6373sH48fb9uzp6/bp392+xczQQHecZqW58ry+vPx9ZdPxt1mj8f3E5k5
fHQvOPwRs+rerY+mVkXD6YHh3XVDE2s/q1/otMqGEjwGU5FzVnXS3cR0y2GOI+RMgP6A+QuM1aPj
YEC1yCM0ZVdF5ngtmiQpzwPYnDfu80MalYhcPrkHIzETpsRaVLGt2WGCR97lbTajsyyo2wKW+nWU
MmeY5bSuUQ54SEOXoHIgvTjKVJhdkhTomwi7D+S/vGjUJYXJLCLguiCCWSD72UmkUeoyyeSgXU3b
2QVcTJ2fQ4YMp2DEANPgs/uQ/muQUKmjewJWrZUU7nwJ00R/dG0JU7ZoFRkXnnD2DxYPs2wqFk+Z
KUxCWMlxkRndJ74CrWDwSx7rRajyz7Hh6HODsqWtdDwoIcqBgg5ClIxQqmTQOUjqS7odoIIQ5BJM
0W8eOutpJ/XbttT2MBkuVvq0gl1bulIPZoFkxyO6WcA+PEVTw4lAqVs9ehb96TWmX8s9cOxxN38Q
JYmYAWJKYpQO6Gx24jKP1XURCdjCKw7dqpihLiEbAPbAMxckX8622AbC48wQKHPQyrtaJqTBNMRW
XJfEIQKKkJd4pjfVWhRNahldkTLKaDkPcag7Bd/Qnqeq09ZOK1sMf+iKJJF3cNRmRn9Nq4fxnclX
08JqIv4+tR3ztPd308WnD13DDNuiqO5QnzCqyEph5TcqZK7kORyYlTVFMG16dldxXfhzPucNJvwq
kticW/ObzuSsFqKRB47pglyg8WRIjmFCb36YD+RIELq315iV3HxVEkM3C6Oj2mk2Wq6ZmbWlBjZr
P2jToJhgM/1eTPBOf/uSVgtHEvr9bbc//nP2CF8+v27fX3yfAPVeu+y8c/wiGNPE03dkcAgWMsRi
Lh93HG4CPwcp7lrBmy+Xw5z3sqRXwqXhZ1AUjW5KzEN5muL7nGGSrXD4tEXRBXyl4YifFSh/86oC
citnAX4G//WP3JuzERzhwfC1+7b9/bh77YW4d0n6pOBv/nyouuyAsBGGAQptxC2jooHVDDGQttmg
rEHQof1lDaJ4zaqE9jOaxzNMaibKhvZB5Lm8M81atLoGYuCSCkZZBqx8uZncTk1fBygYmDXG85K+
ixVnsSwfaMyhWHCMQMfYDNhjKWWLVr2rVaQTemxnrIkMdu1iZPO6Ik/v3elIiiqC1nO2RG+ZPmPf
KMv/6sRbKXf6TRxv//p4eUEXBbF/P759vG73R2OJyEz1qFrIOHsfOPhJqEn4cv5jQlGpkHq6hD7c
vkbvIMwD8umT03nXl0YytiWsCnM68DelDmuxu53VLAfRMxeNeOB4dplfSyypKP3ScNkNxvADnvrb
Bn32Pe2zdyQZyjVjZ6QbIqiK+JhBIAauf2oXCOVpTNLIYop1Hoj+leiyEPjUA2leUnVURcwweMsS
pYbhVTTrjbtyTcigNDVxmxnnj/qtw8Ft4JjHySq2mGEAYe2PcY8gZYYAKbr7/AKZTO5Jpgy0yNAb
OtysKmol4/jXYpSDv47aDnRfcz59mg1br07b2RCmam6dfoGC6JkCM3GL/Tc4Rq9IIUM52k+uz8/P
3Z4OtAGJzaEa3KySxB+1gQrlHTgCSCfInstKn6+2toJtajgN4h7F81gdDsHFu4K+zRvJxbyWrGit
xf3wFAPqaUXVtCYnPAlWqW2kY5qL6s8BFPWJbbAQ80XGqdwSxjKQA4PxgYmKO3TKsNCUWBbJfi0Z
MlbPnq/AsgxYl67f3MjunGlcqIQuyqcBic6Kw/f3387Sw9M/H9/VubZ43L+823wyB7YCJ2lBB/Ba
eExG0MJBZSOlJN82X4z1jE+joEG/RS7UwH4rAo9LsCr+FTqF7BZtjln9a/q9j/UdSAEgC8SBEHJp
9VS10XGAJ8dM+eyCiPD8ITPnU4eO2jRBvU9ie5HR/kbyG7JRVI3uasMJWHJehqyb+k15zjPbeU1Z
KdFzaTyb/+f9+26P3kwwCq8fx+2PLfyxPT798ccfZu5gvK2R5c6l/uPnyC0rTCTbh3aTzVI3PtDz
8LmJ1r6Gb7h3iOncj96up8nXa4UB7l6sS9Ys/C1brWs6AEeh1T1Wr7UbHYh56ZfVI4KF6WzDKeel
29R+xNRNrs62a1YhWwIbpWkrHjopxv5Siun/Y8JHPReYUVMx29lZCt0wKF2bo8cDrG5lBzyxCpfq
/PWdsOTm+0dJis+Px8czFBGf0KruaV1oofcHvUTwiZrrsHwmY/yFSk4+KrUoLOSdlNxAvqra0s+6
YHGOQOPtqiLQDHnegNQ+JtiMWoudaHZlTLFlagU5CHP/heYe8c63BgbPPal0DWx7OrHLlrMcKJff
mUFuOoOm1X5n4931Clg1ql62ti6XMwjqeEtHTx82eVE0ZaoO1obr5GE0VwGCPLp3HmfTugr6NYxr
2bcaySM+aXOlXUqiKoSdV6xc0DTakJHoLRNGdmvRLNCK5smbBFmf9QDNPS55T5ZJsRfKw6sahwQD
zOXMIyVoLbkn40b9h6qUEanKjpwwS2RTszZJzO4bQMku1129Ng1mWFLgxEi8lWcdJiLm8qWkycXt
pbSxomhH3+bhu9Kky4EhUcqUY6JWjbQCZGXQSk9hWEMLDyN374+ba3L3yhEDiSxJ2bz2Fxqm2O7N
VNJ8ZiaB5qxK73t7mjlAJryLZ3M6z5xFJZ9Qime0cttLD+ksSVvSs0iuiSwThbtbxnsF6AYa+GPc
V6f0RlEoy2B3vrmhPOoMvG02GxBt2LI40GDgyomuKjslq1hGW8OiMpx/RZWA7lv3PhfLM3HK1K5G
SRpkzMjzUua3QmHAYKqaU+VrzFxS9dY3uVtJC+9AOG915rCeL9sr07Q+N9v3Ix79KN1GmJX28WVr
hJ+1uR1Op/Jw9eYEogljni5Dh5EwvpFb0TvDFFbyIvcxgYFGH8po5y0qOu+R5hx2ZiTD4s9EWqfM
snYhTBluwmYfSZOxJdeBd2SlQCOK4Rx1q0hQAPv3xhKWOlW7fE1KVm4XbX9tHGaJSOkl0muboFRG
xarnTOa1YwW8Hi9VcC6QN/cOkuORuowbWqZTKhU6TNShJDqSJBO5fP8hTBH8fjYe1rDBPKFnFF1m
6Gp9Ai8v/4q0wHzyYTaFuwy03O50Yb2JKbDdlXh/fUn6AsjeLvgGTXQnhkPdK6kwn8Drdj1dHZU0
V1RePkDRFNQ6lGh5TBi+WBI4XHLZRQEY9mNK31lIirZ1M4Sa2I28yg3jKXuJTVGh24FnLXKGNvRy
mcSKmL6zVQt5eWKVQ+8L9wFJE7/KwuxEDQ7Knm4OKaeOkn5IWSHROWlRSJsl/SKi9NqBdnYzkIAX
Gauo2xxZViKqDJQ37ky8m4FI/bb5+8gVpJ/UgKKFcdPPKUymxid8vvdLXUbWBp+7Vss9K06sQMtg
eIJb8SxisDdCoyd5rnAOSf2lK5X2aMC4evjJw9iLhlX3xf8Hc0Av8NDiAQA=
--===============3227245049624075975==--

