Content-Type: multipart/mixed; boundary="===============3657249262954105496=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/ath/ath10k/htt_rx.c:3792:22: warning: Local variable htt shadows outer variable
Date: Tue, 08 Sep 2020 17:32:07 +0800
Message-ID: <202009081755.LCAjazKS%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3657249262954105496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Wen Gong <wgong@codeaurora.org>
CC: Kalle Valo <kvalo@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f4d51dffc6c01a9e94650d95ce0104964f8ae822
commit: d81686d3335648197c5da3992b151648706dc0f8 ath10k: disable TX complet=
e indication of htt for sdio
date:   5 months ago
:::::: branch date: 33 hours ago
:::::: commit date: 5 months ago
compiler: m68k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/net/wireless/ath/ath9k/eeprom_def.c:0:0: warning: Invalid value:=
 0x03000000_S [cppcheckError]
   =

   ^
   drivers/net/wireless/ath/ath9k/eeprom_def.c:0:0: note: Invalid value: 0x=
03000000_S
   =

   ^
   drivers/net/wireless/ath/ath9k/eeprom_def.c:0:0: note: Invalid value: 0x=
03000000_S
   =

   ^
>> drivers/net/wireless/ath/ath10k/mac.c:5751:2: warning: Assignment of fun=
ction parameter has no effect outside the function. [uselessAssignmentArg]
    changed_flags &=3D SUPPORTED_FILTERS;
    ^
>> drivers/net/wireless/ath/ath9k/hw.c:888:10: warning: Shifting signed 32-=
bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
       (0x1 << 31) |
            ^
>> drivers/net/wireless/ath/ath9k/hw.c:0:0: warning: Invalid value: 0x00010=
000_S [cppcheckError]
   =

   ^
   drivers/net/wireless/ath/ath9k/hw.c:0:0: note: Invalid value: 0x00010000=
_S
   =

   ^
   drivers/net/wireless/ath/ath9k/hw.c:0:0: note: Invalid value: 0x00010000=
_S
   =

   ^
>> drivers/net/wireless/ath/ath9k/ar5008_phy.c:0:0: warning: Invalid value:=
 0xFF000000_S [cppcheckError]
   =

   ^
   drivers/net/wireless/ath/ath9k/ar5008_phy.c:0:0: note: Invalid value: 0x=
FF000000_S
   =

   ^
   drivers/net/wireless/ath/ath9k/ar5008_phy.c:0:0: note: Invalid value: 0x=
FF000000_S
   =

   ^
   drivers/net/wireless/ath/ath10k/htt_rx.c:3858:3: warning: Consecutive re=
turn, break, continue, goto or throw statements are unnecessary. [duplicate=
Break]
     break;
     ^
>> drivers/net/wireless/ath/ath10k/htt_rx.c:3792:22: warning: Local variabl=
e htt shadows outer variable [shadowVar]
     struct ath10k_htt *htt =3D &ar->htt;
                        ^
   drivers/net/wireless/ath/ath10k/htt_rx.c:3741:21: note: Shadowed declara=
tion
    struct ath10k_htt *htt =3D &ar->htt;
                       ^
   drivers/net/wireless/ath/ath10k/htt_rx.c:3792:22: note: Shadow variable
     struct ath10k_htt *htt =3D &ar->htt;
                        ^
   drivers/net/wireless/ath/ath10k/htt_rx.c:3901:22: warning: Local variabl=
e htt shadows outer variable [shadowVar]
     struct ath10k_htt *htt =3D &ar->htt;
                        ^
   drivers/net/wireless/ath/ath10k/htt_rx.c:3741:21: note: Shadowed declara=
tion
    struct ath10k_htt *htt =3D &ar->htt;
                       ^
   drivers/net/wireless/ath/ath10k/htt_rx.c:3901:22: note: Shadow variable
     struct ath10k_htt *htt =3D &ar->htt;
                        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dd81686d3335648197c5da3992b151648706dc0f8
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout d81686d3335648197c5da3992b151648706dc0f8
vim +3792 drivers/net/wireless/ath/ath10k/htt_rx.c

28ce53b6cfda35d Wen Gong                 2019-04-26  3738  =

e3a91f877c60ce8 Rajkumar Manoharan       2016-03-22  3739  bool ath10k_htt_=
t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3740  {
edb8236df4d0429 Michal Kazior            2013-07-05  3741  	struct ath10k_h=
tt *htt =3D &ar->htt;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3742  	struct htt_resp=
 *resp =3D (struct htt_resp *)skb->data;
8348db298496211 Rajkumar Manoharan       2015-03-25  3743  	enum htt_t2h_ms=
g_type type;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3744  =

5e3dd157d7e70f0 Kalle Valo               2013-06-12  3745  	/* confirm alig=
nment */
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3746  	if (!IS_ALIGNED=
((unsigned long)skb->data, 4))
7aa7a72a23679ab Michal Kazior            2014-08-25  3747  		ath10k_warn(ar=
, "unaligned htt message, expect trouble\n");
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3748  =

7aa7a72a23679ab Michal Kazior            2014-08-25  3749  	ath10k_dbg(ar, =
ATH10K_DBG_HTT, "htt rx, msg_type: 0x%0X\n",
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3750  		   resp->hdr.m=
sg_type);
8348db298496211 Rajkumar Manoharan       2015-03-25  3751  =

8348db298496211 Rajkumar Manoharan       2015-03-25  3752  	if (resp->hdr.m=
sg_type >=3D ar->htt.t2h_msg_types_max) {
8348db298496211 Rajkumar Manoharan       2015-03-25  3753  		ath10k_dbg(ar,=
 ATH10K_DBG_HTT, "htt rx, unsupported msg_type: 0x%0X\n max: 0x%0X",
8348db298496211 Rajkumar Manoharan       2015-03-25  3754  			   resp->hdr.=
msg_type, ar->htt.t2h_msg_types_max);
e3a91f877c60ce8 Rajkumar Manoharan       2016-03-22  3755  		return true;
8348db298496211 Rajkumar Manoharan       2015-03-25  3756  	}
8348db298496211 Rajkumar Manoharan       2015-03-25  3757  	type =3D ar->ht=
t.t2h_msg_types[resp->hdr.msg_type];
8348db298496211 Rajkumar Manoharan       2015-03-25  3758  =

8348db298496211 Rajkumar Manoharan       2015-03-25  3759  	switch (type) {
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3760  	case HTT_T2H_MS=
G_TYPE_VERSION_CONF: {
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3761  		htt->target_ve=
rsion_major =3D resp->ver_resp.major;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3762  		htt->target_ve=
rsion_minor =3D resp->ver_resp.minor;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3763  		complete(&htt-=
>target_version_received);
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3764  		break;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3765  	}
6c5151a9ffa9f79 Michal Kazior            2014-02-27  3766  	case HTT_T2H_MS=
G_TYPE_RX_IND:
cfee8793a74dc3a Wen Gong                 2019-11-29  3767  		if (ar->bus_pa=
ram.dev_type !=3D ATH10K_DEV_TYPE_HL) {
f88d493450403f5 Erik Stromdahl           2018-09-04  3768  			ath10k_htt_rx=
_proc_rx_ind_ll(htt, &resp->rx_ind);
cfee8793a74dc3a Wen Gong                 2019-11-29  3769  		} else {
cfee8793a74dc3a Wen Gong                 2019-11-29  3770  			skb_queue_tai=
l(&htt->rx_indication_head, skb);
cfee8793a74dc3a Wen Gong                 2019-11-29  3771  			return false;
cfee8793a74dc3a Wen Gong                 2019-11-29  3772  		}
3128b3d8a2b97ba Rajkumar Manoharan       2016-03-22  3773  		break;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3774  	case HTT_T2H_MS=
G_TYPE_PEER_MAP: {
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3775  		struct htt_pee=
r_map_event ev =3D {
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3776  			.vdev_id =3D =
resp->peer_map.vdev_id,
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3777  			.peer_id =3D =
__le16_to_cpu(resp->peer_map.peer_id),
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3778  		};
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3779  		memcpy(ev.addr=
, resp->peer_map.addr, sizeof(ev.addr));
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3780  		ath10k_peer_ma=
p_event(htt, &ev);
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3781  		break;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3782  	}
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3783  	case HTT_T2H_MS=
G_TYPE_PEER_UNMAP: {
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3784  		struct htt_pee=
r_unmap_event ev =3D {
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3785  			.peer_id =3D =
__le16_to_cpu(resp->peer_unmap.peer_id),
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3786  		};
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3787  		ath10k_peer_un=
map_event(htt, &ev);
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3788  		break;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3789  	}
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3790  	case HTT_T2H_MS=
G_TYPE_MGMT_TX_COMPLETION: {
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3791  		struct htt_tx_=
done tx_done =3D {};
d81686d33356481 Wen Gong                 2020-04-07 @3792  		struct ath10k_=
htt *htt =3D &ar->htt;
d81686d33356481 Wen Gong                 2020-04-07  3793  		struct ath10k_=
htc *htc =3D &ar->htc;
d81686d33356481 Wen Gong                 2020-04-07  3794  		struct ath10k_=
htc_ep *ep =3D &ar->htc.endpoint[htt->eid];
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3795  		int status =3D=
 __le32_to_cpu(resp->mgmt_tx_completion.status);
235b9c42766129b Venkateswara Naralasetty 2018-04-10  3796  		int info =3D _=
_le32_to_cpu(resp->mgmt_tx_completion.info);
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3797  =

59465fe46ef1c2c Rajkumar Manoharan       2016-03-22  3798  		tx_done.msdu_i=
d =3D __le32_to_cpu(resp->mgmt_tx_completion.desc_id);
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3799  =

5e3dd157d7e70f0 Kalle Valo               2013-06-12  3800  		switch (status=
) {
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3801  		case HTT_MGMT_=
TX_STATUS_OK:
59465fe46ef1c2c Rajkumar Manoharan       2016-03-22  3802  			tx_done.statu=
s =3D HTT_TX_COMPL_STATE_ACK;
235b9c42766129b Venkateswara Naralasetty 2018-04-10  3803  			if (test_bit(=
WMI_SERVICE_HTT_MGMT_TX_COMP_VALID_FLAGS,
235b9c42766129b Venkateswara Naralasetty 2018-04-10  3804  				     ar->wmi=
.svc_map) &&
235b9c42766129b Venkateswara Naralasetty 2018-04-10  3805  			    (resp->mg=
mt_tx_completion.flags &
235b9c42766129b Venkateswara Naralasetty 2018-04-10  3806  			     HTT_MGMT=
_TX_CMPL_FLAG_ACK_RSSI)) {
235b9c42766129b Venkateswara Naralasetty 2018-04-10  3807  				tx_done.ack_=
rssi =3D
235b9c42766129b Venkateswara Naralasetty 2018-04-10  3808  				FIELD_GET(HT=
T_MGMT_TX_CMPL_INFO_ACK_RSSI_MASK,
235b9c42766129b Venkateswara Naralasetty 2018-04-10  3809  					  info);
235b9c42766129b Venkateswara Naralasetty 2018-04-10  3810  			}
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3811  			break;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3812  		case HTT_MGMT_=
TX_STATUS_RETRY:
59465fe46ef1c2c Rajkumar Manoharan       2016-03-22  3813  			tx_done.statu=
s =3D HTT_TX_COMPL_STATE_NOACK;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3814  			break;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3815  		case HTT_MGMT_=
TX_STATUS_DROP:
59465fe46ef1c2c Rajkumar Manoharan       2016-03-22  3816  			tx_done.statu=
s =3D HTT_TX_COMPL_STATE_DISCARD;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3817  			break;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3818  		}
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3819  =

d81686d33356481 Wen Gong                 2020-04-07  3820  		if (htt->disab=
le_tx_comp) {
d81686d33356481 Wen Gong                 2020-04-07  3821  			spin_lock_bh(=
&htc->tx_lock);
d81686d33356481 Wen Gong                 2020-04-07  3822  			ep->tx_credit=
s++;
d81686d33356481 Wen Gong                 2020-04-07  3823  			spin_unlock_b=
h(&htc->tx_lock);
d81686d33356481 Wen Gong                 2020-04-07  3824  		}
d81686d33356481 Wen Gong                 2020-04-07  3825  =

cac085524cf1643 Rajkumar Manoharan       2016-03-09  3826  		status =3D ath=
10k_txrx_tx_unref(htt, &tx_done);
cac085524cf1643 Rajkumar Manoharan       2016-03-09  3827  		if (!status) {
cac085524cf1643 Rajkumar Manoharan       2016-03-09  3828  			spin_lock_bh(=
&htt->tx_lock);
cac085524cf1643 Rajkumar Manoharan       2016-03-09  3829  			ath10k_htt_tx=
_mgmt_dec_pending(htt);
cac085524cf1643 Rajkumar Manoharan       2016-03-09  3830  			spin_unlock_b=
h(&htt->tx_lock);
cac085524cf1643 Rajkumar Manoharan       2016-03-09  3831  		}
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3832  		break;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3833  	}
6c5151a9ffa9f79 Michal Kazior            2014-02-27  3834  	case HTT_T2H_MS=
G_TYPE_TX_COMPL_IND:
59465fe46ef1c2c Rajkumar Manoharan       2016-03-22  3835  		ath10k_htt_rx_=
tx_compl_ind(htt->ar, skb);
59465fe46ef1c2c Rajkumar Manoharan       2016-03-22  3836  		break;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3837  	case HTT_T2H_MS=
G_TYPE_SEC_IND: {
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3838  		struct ath10k =
*ar =3D htt->ar;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3839  		struct htt_sec=
urity_indication *ev =3D &resp->security_indication;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3840  =

28ce53b6cfda35d Wen Gong                 2019-04-26  3841  		ath10k_htt_rx_=
sec_ind_handler(ar, ev);
7aa7a72a23679ab Michal Kazior            2014-08-25  3842  		ath10k_dbg(ar,=
 ATH10K_DBG_HTT,
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3843  			   "sec ind p=
eer_id %d unicast %d type %d\n",
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3844  			  __le16_to_c=
pu(ev->peer_id),
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3845  			  !!(ev->flag=
s & HTT_SECURITY_IS_UNICAST),
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3846  			  MS(ev->flag=
s, HTT_SECURITY_TYPE));
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3847  		complete(&ar->=
install_key_done);
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3848  		break;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3849  	}
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3850  	case HTT_T2H_MS=
G_TYPE_RX_FRAG_IND: {
7aa7a72a23679ab Michal Kazior            2014-08-25  3851  		ath10k_dbg_dum=
p(ar, ATH10K_DBG_HTT_DUMP, NULL, "htt event: ",
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3852  				skb->data, s=
kb->len);
3c97f5de1f28249 Rajkumar Manoharan       2016-09-02  3853  		atomic_inc(&ht=
t->num_mpdus_ready);
33f9747291ff384 Wen Gong                 2019-04-26  3854  =

33f9747291ff384 Wen Gong                 2019-04-26  3855  		return ath10k_=
htt_rx_proc_rx_frag_ind(htt,
33f9747291ff384 Wen Gong                 2019-04-26  3856  						      &res=
p->rx_frag_ind,
33f9747291ff384 Wen Gong                 2019-04-26  3857  						      skb);
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3858  		break;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3859  	}
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3860  	case HTT_T2H_MS=
G_TYPE_TEST:
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3861  		break;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3862  	case HTT_T2H_MS=
G_TYPE_STATS_CONF:
d35a6c18cb70be7 Michal Kazior            2014-09-02  3863  		trace_ath10k_h=
tt_stats(ar, skb->data, skb->len);
a9bf05062d13b25 Kalle Valo               2013-09-03  3864  		break;
a9bf05062d13b25 Kalle Valo               2013-09-03  3865  	case HTT_T2H_MS=
G_TYPE_TX_INSPECT_IND:
708b9bde5d8462d Michal Kazior            2014-07-21  3866  		/* Firmware ca=
n return tx frames if it's unable to fully
708b9bde5d8462d Michal Kazior            2014-07-21  3867  		 * process the=
m and suspects host may be able to fix it. ath10k
708b9bde5d8462d Michal Kazior            2014-07-21  3868  		 * sends all t=
x frames as already inspected so this shouldn't
708b9bde5d8462d Michal Kazior            2014-07-21  3869  		 * happen unle=
ss fw has a bug.
708b9bde5d8462d Michal Kazior            2014-07-21  3870  		 */
7aa7a72a23679ab Michal Kazior            2014-08-25  3871  		ath10k_warn(ar=
, "received an unexpected htt tx inspect event\n");
708b9bde5d8462d Michal Kazior            2014-07-21  3872  		break;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3873  	case HTT_T2H_MS=
G_TYPE_RX_ADDBA:
aa5b4fbcff48234 Michal Kazior            2014-07-23  3874  		ath10k_htt_rx_=
addba(ar, resp);
aa5b4fbcff48234 Michal Kazior            2014-07-23  3875  		break;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3876  	case HTT_T2H_MS=
G_TYPE_RX_DELBA:
aa5b4fbcff48234 Michal Kazior            2014-07-23  3877  		ath10k_htt_rx_=
delba(ar, resp);
aa5b4fbcff48234 Michal Kazior            2014-07-23  3878  		break;
bfdd7937ab1a3ee Rajkumar Manoharan       2014-10-03  3879  	case HTT_T2H_MS=
G_TYPE_PKTLOG: {
bfdd7937ab1a3ee Rajkumar Manoharan       2014-10-03  3880  		trace_ath10k_h=
tt_pktlog(ar, resp->pktlog_msg.payload,
34293f75586bab3 Ashok Raj Nagarajan      2016-06-30  3881  					skb->len -
34293f75586bab3 Ashok Raj Nagarajan      2016-06-30  3882  					offsetof(st=
ruct htt_resp,
34293f75586bab3 Ashok Raj Nagarajan      2016-06-30  3883  						 pktlog_ms=
g.payload));
e8123bb74c4ef05 Anilkumar Kolli          2017-12-05  3884  =

e8123bb74c4ef05 Anilkumar Kolli          2017-12-05  3885  		if (ath10k_pee=
r_stats_enabled(ar))
e8123bb74c4ef05 Anilkumar Kolli          2017-12-05  3886  			ath10k_fetch_=
10_2_tx_stats(ar,
e8123bb74c4ef05 Anilkumar Kolli          2017-12-05  3887  						   resp->p=
ktlog_msg.payload);
bfdd7937ab1a3ee Rajkumar Manoharan       2014-10-03  3888  		break;
bfdd7937ab1a3ee Rajkumar Manoharan       2014-10-03  3889  	}
aa5b4fbcff48234 Michal Kazior            2014-07-23  3890  	case HTT_T2H_MS=
G_TYPE_RX_FLUSH: {
aa5b4fbcff48234 Michal Kazior            2014-07-23  3891  		/* Ignore this=
 event because mac80211 takes care of Rx
aa5b4fbcff48234 Michal Kazior            2014-07-23  3892  		 * aggregation=
 reordering.
aa5b4fbcff48234 Michal Kazior            2014-07-23  3893  		 */
aa5b4fbcff48234 Michal Kazior            2014-07-23  3894  		break;
aa5b4fbcff48234 Michal Kazior            2014-07-23  3895  	}
c545070e404bfb2 Michal Kazior            2015-01-24  3896  	case HTT_T2H_MS=
G_TYPE_RX_IN_ORD_PADDR_IND: {
62652555c616cad Bob Copeland             2018-06-21  3897  		skb_queue_tail=
(&htt->rx_in_ord_compl_q, skb);
e3a91f877c60ce8 Rajkumar Manoharan       2016-03-22  3898  		return false;
c545070e404bfb2 Michal Kazior            2015-01-24  3899  	}
d81686d33356481 Wen Gong                 2020-04-07  3900  	case HTT_T2H_MS=
G_TYPE_TX_CREDIT_UPDATE_IND: {
d81686d33356481 Wen Gong                 2020-04-07  3901  		struct ath10k_=
htt *htt =3D &ar->htt;
d81686d33356481 Wen Gong                 2020-04-07  3902  		struct ath10k_=
htc *htc =3D &ar->htc;
d81686d33356481 Wen Gong                 2020-04-07  3903  		struct ath10k_=
htc_ep *ep =3D &ar->htc.endpoint[htt->eid];
d81686d33356481 Wen Gong                 2020-04-07  3904  		u32 msg_word =
=3D __le32_to_cpu(*(__le32 *)resp);
d81686d33356481 Wen Gong                 2020-04-07  3905  		int htt_credit=
_delta;
d81686d33356481 Wen Gong                 2020-04-07  3906  =

d81686d33356481 Wen Gong                 2020-04-07  3907  		htt_credit_del=
ta =3D HTT_TX_CREDIT_DELTA_ABS_GET(msg_word);
d81686d33356481 Wen Gong                 2020-04-07  3908  		if (HTT_TX_CRE=
DIT_SIGN_BIT_GET(msg_word))
d81686d33356481 Wen Gong                 2020-04-07  3909  			htt_credit_de=
lta =3D -htt_credit_delta;
d81686d33356481 Wen Gong                 2020-04-07  3910  =

d81686d33356481 Wen Gong                 2020-04-07  3911  		ath10k_dbg(ar,=
 ATH10K_DBG_HTT,
d81686d33356481 Wen Gong                 2020-04-07  3912  			   "htt credi=
t update delta %d\n",
d81686d33356481 Wen Gong                 2020-04-07  3913  			   htt_credit=
_delta);
d81686d33356481 Wen Gong                 2020-04-07  3914  =

d81686d33356481 Wen Gong                 2020-04-07  3915  		if (htt->disab=
le_tx_comp) {
d81686d33356481 Wen Gong                 2020-04-07  3916  			spin_lock_bh(=
&htc->tx_lock);
d81686d33356481 Wen Gong                 2020-04-07  3917  			ep->tx_credit=
s +=3D htt_credit_delta;
d81686d33356481 Wen Gong                 2020-04-07  3918  			spin_unlock_b=
h(&htc->tx_lock);
d81686d33356481 Wen Gong                 2020-04-07  3919  			ath10k_dbg(ar=
, ATH10K_DBG_HTT,
d81686d33356481 Wen Gong                 2020-04-07  3920  				   "htt cred=
it total %d\n",
d81686d33356481 Wen Gong                 2020-04-07  3921  				   ep->tx_cr=
edits);
d81686d33356481 Wen Gong                 2020-04-07  3922  		}
8348db298496211 Rajkumar Manoharan       2015-03-25  3923  		break;
d81686d33356481 Wen Gong                 2020-04-07  3924  	}
2ce9b25cefa64f1 Rajkumar Manoharan       2016-03-08  3925  	case HTT_T2H_MS=
G_TYPE_CHAN_CHANGE: {
2ce9b25cefa64f1 Rajkumar Manoharan       2016-03-08  3926  		u32 phymode =
=3D __le32_to_cpu(resp->chan_change.phymode);
2ce9b25cefa64f1 Rajkumar Manoharan       2016-03-08  3927  		u32 freq =3D _=
_le32_to_cpu(resp->chan_change.freq);
2ce9b25cefa64f1 Rajkumar Manoharan       2016-03-08  3928  =

543b921b475ad2e Arend Van Spriel         2016-11-17  3929  		ar->tgt_oper_c=
han =3D ieee80211_get_channel(ar->hw->wiphy, freq);
2ce9b25cefa64f1 Rajkumar Manoharan       2016-03-08  3930  		ath10k_dbg(ar,=
 ATH10K_DBG_HTT,
2ce9b25cefa64f1 Rajkumar Manoharan       2016-03-08  3931  			   "htt chan =
change freq %u phymode %s\n",
2ce9b25cefa64f1 Rajkumar Manoharan       2016-03-08  3932  			   freq, ath1=
0k_wmi_phymode_str(phymode));
c545070e404bfb2 Michal Kazior            2015-01-24  3933  		break;
2ce9b25cefa64f1 Rajkumar Manoharan       2016-03-08  3934  	}
ccec9038c7217e5 David Liu                2015-07-24  3935  	case HTT_T2H_MS=
G_TYPE_AGGR_CONF:
ccec9038c7217e5 David Liu                2015-07-24  3936  		break;
b2fdbccd15a27d1 Rajkumar Manoharan       2016-03-22  3937  	case HTT_T2H_MS=
G_TYPE_TX_FETCH_IND: {
b2fdbccd15a27d1 Rajkumar Manoharan       2016-03-22  3938  		struct sk_buff=
 *tx_fetch_ind =3D skb_copy(skb, GFP_ATOMIC);
b2fdbccd15a27d1 Rajkumar Manoharan       2016-03-22  3939  =

b2fdbccd15a27d1 Rajkumar Manoharan       2016-03-22  3940  		if (!tx_fetch_=
ind) {
b2fdbccd15a27d1 Rajkumar Manoharan       2016-03-22  3941  			ath10k_warn(a=
r, "failed to copy htt tx fetch ind\n");
b2fdbccd15a27d1 Rajkumar Manoharan       2016-03-22  3942  			break;
b2fdbccd15a27d1 Rajkumar Manoharan       2016-03-22  3943  		}
b2fdbccd15a27d1 Rajkumar Manoharan       2016-03-22  3944  		skb_queue_tail=
(&htt->tx_fetch_ind_q, tx_fetch_ind);
b2fdbccd15a27d1 Rajkumar Manoharan       2016-03-22  3945  		break;
b2fdbccd15a27d1 Rajkumar Manoharan       2016-03-22  3946  	}
df94e702277e148 Michal Kazior            2016-01-21  3947  	case HTT_T2H_MS=
G_TYPE_TX_FETCH_CONFIRM:
839ae6371e56594 Michal Kazior            2016-03-06  3948  		ath10k_htt_rx_=
tx_fetch_confirm(ar, skb);
839ae6371e56594 Michal Kazior            2016-03-06  3949  		break;
df94e702277e148 Michal Kazior            2016-01-21  3950  	case HTT_T2H_MS=
G_TYPE_TX_MODE_SWITCH_IND:
839ae6371e56594 Michal Kazior            2016-03-06  3951  		ath10k_htt_rx_=
tx_mode_switch_ind(ar, skb);
9b15873628050fe Michal Kazior            2016-01-21  3952  		break;
cec17c382140a17 Anilkumar Kolli          2016-11-23  3953  	case HTT_T2H_MS=
G_TYPE_PEER_STATS:
cec17c382140a17 Anilkumar Kolli          2016-11-23  3954  		ath10k_htt_fet=
ch_peer_stats(ar, skb);
cec17c382140a17 Anilkumar Kolli          2016-11-23  3955  		break;
9b15873628050fe Michal Kazior            2016-01-21  3956  	case HTT_T2H_MS=
G_TYPE_EN_STATS:
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3957  	default:
2358a544fe65d2b Michal Kazior            2014-10-02  3958  		ath10k_warn(ar=
, "htt event (%d) not handled\n",
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3959  			    resp->hdr=
.msg_type);
7aa7a72a23679ab Michal Kazior            2014-08-25  3960  		ath10k_dbg_dum=
p(ar, ATH10K_DBG_HTT_DUMP, NULL, "htt event: ",
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3961  				skb->data, s=
kb->len);
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3962  		break;
dab55d1083db11d Waldemar Rymarkiewicz    2017-02-02  3963  	}
e3a91f877c60ce8 Rajkumar Manoharan       2016-03-22  3964  	return true;
5e3dd157d7e70f0 Kalle Valo               2013-06-12  3965  }
3f0f7ed420594cc Rajkumar Manoharan       2015-10-12  3966  EXPORT_SYMBOL(at=
h10k_htt_t2h_msg_handler);
6c5151a9ffa9f79 Michal Kazior            2014-02-27  3967  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3657249262954105496==--

