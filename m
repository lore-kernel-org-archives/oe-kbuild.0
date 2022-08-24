Content-Type: multipart/mixed; boundary="===============8811470757538030454=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7921/mac.c:506 mt7921_mac_fill_rx() error: uninitialized symbol 'msta'.
Date: Thu, 25 Aug 2022 03:49:24 +0800
Message-ID: <202208250344.2cqAI24l-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8811470757538030454==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c40e8341e3b3bb27e3a65b06b5b454626234c4f0
commit: 0880d40871d1d0155c157a68add961d8dbcca2a3 mt76: connac: move mt76_co=
nnac2_reverse_frag0_hdr_trans in mt76-connac module
date:   6 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 6 weeks ago
config: openrisc-randconfig-m031-20220824
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7921/mac.c:506 mt7921_mac_fill_rx() er=
ror: uninitialized symbol 'msta'.

vim +/msta +506 drivers/net/wireless/mediatek/mt76/mt7921/mac.c

93c81df520a1ba Lorenzo Bianconi 2021-03-24  220  =

0ab947c3dc8e0d Lorenzo Bianconi 2021-08-16  221  static int
0ab947c3dc8e0d Lorenzo Bianconi 2021-08-16  222  mt7921_mac_fill_rx(struct =
mt7921_dev *dev, struct sk_buff *skb)
163f4d22c118d4 Sean Wang        2021-01-28  223  {
0e75732764e86a Lorenzo Bianconi 2021-05-06  224  	u32 csum_mask =3D MT_RXD0=
_NORMAL_IP_SUM | MT_RXD0_NORMAL_UDP_TCP_SUM;
163f4d22c118d4 Sean Wang        2021-01-28  225  	struct mt76_rx_status *st=
atus =3D (struct mt76_rx_status *)skb->cb;
24299fc869f7ca Lorenzo Bianconi 2021-05-06  226  	bool hdr_trans, unicast, =
insert_ccmp_hdr =3D false;
24299fc869f7ca Lorenzo Bianconi 2021-05-06  227  	u8 chfreq, qos_ctl =3D 0,=
 remove_pad, amsdu_info;
dc5399a50b45fa Xing Song        2021-11-10  228  	u16 hdr_gap;
0e75732764e86a Lorenzo Bianconi 2021-05-06  229  	__le32 *rxv =3D NULL, *rx=
d =3D (__le32 *)skb->data;
163f4d22c118d4 Sean Wang        2021-01-28  230  	struct mt76_phy *mphy =3D=
 &dev->mt76.phy;
163f4d22c118d4 Sean Wang        2021-01-28  231  	struct mt7921_phy *phy =
=3D &dev->phy;
163f4d22c118d4 Sean Wang        2021-01-28  232  	struct ieee80211_supporte=
d_band *sband;
0e75732764e86a Lorenzo Bianconi 2021-05-06  233  	u32 rxd0 =3D le32_to_cpu(=
rxd[0]);
163f4d22c118d4 Sean Wang        2021-01-28  234  	u32 rxd1 =3D le32_to_cpu(=
rxd[1]);
163f4d22c118d4 Sean Wang        2021-01-28  235  	u32 rxd2 =3D le32_to_cpu(=
rxd[2]);
163f4d22c118d4 Sean Wang        2021-01-28  236  	u32 rxd3 =3D le32_to_cpu(=
rxd[3]);
5b0b5c6a1c2195 Lorenzo Bianconi 2021-05-06  237  	u32 rxd4 =3D le32_to_cpu(=
rxd[4]);
0880d40871d1d0 Lorenzo Bianconi 2022-06-08  238  	struct mt7921_sta *msta;
24299fc869f7ca Lorenzo Bianconi 2021-05-06  239  	u16 seq_ctrl =3D 0;
24299fc869f7ca Lorenzo Bianconi 2021-05-06  240  	__le16 fc =3D 0;
0e75732764e86a Lorenzo Bianconi 2021-05-06  241  	u32 mode =3D 0;
163f4d22c118d4 Sean Wang        2021-01-28  242  	int i, idx;
163f4d22c118d4 Sean Wang        2021-01-28  243  =

163f4d22c118d4 Sean Wang        2021-01-28  244  	memset(status, 0, sizeof(=
*status));
163f4d22c118d4 Sean Wang        2021-01-28  245  =

163f4d22c118d4 Sean Wang        2021-01-28  246  	if (rxd1 & MT_RXD1_NORMAL=
_BAND_IDX)
163f4d22c118d4 Sean Wang        2021-01-28  247  		return -EINVAL;
163f4d22c118d4 Sean Wang        2021-01-28  248  =

163f4d22c118d4 Sean Wang        2021-01-28  249  	if (!test_bit(MT76_STATE_=
RUNNING, &mphy->state))
163f4d22c118d4 Sean Wang        2021-01-28  250  		return -EINVAL;
163f4d22c118d4 Sean Wang        2021-01-28  251  =

5b0b5c6a1c2195 Lorenzo Bianconi 2021-05-06  252  	if (rxd2 & MT_RXD2_NORMAL=
_AMSDU_ERR)
5b0b5c6a1c2195 Lorenzo Bianconi 2021-05-06  253  		return -EINVAL;
5b0b5c6a1c2195 Lorenzo Bianconi 2021-05-06  254  =

dd28dea52ad937 Xing Song        2021-11-19  255  	hdr_trans =3D rxd2 & MT_R=
XD2_NORMAL_HDR_TRANS;
dd28dea52ad937 Xing Song        2021-11-19  256  	if (hdr_trans && (rxd1 & =
MT_RXD1_NORMAL_CM))
dd28dea52ad937 Xing Song        2021-11-19  257  		return -EINVAL;
dd28dea52ad937 Xing Song        2021-11-19  258  =

dd28dea52ad937 Xing Song        2021-11-19  259  	/* ICV error or CCMP/BIP/=
WPI MIC error */
dd28dea52ad937 Xing Song        2021-11-19  260  	if (rxd1 & MT_RXD1_NORMAL=
_ICV_ERR)
dd28dea52ad937 Xing Song        2021-11-19  261  		status->flag |=3D RX_FLA=
G_ONLY_MONITOR;
dd28dea52ad937 Xing Song        2021-11-19  262  =

163f4d22c118d4 Sean Wang        2021-01-28  263  	chfreq =3D FIELD_GET(MT_R=
XD3_NORMAL_CH_FREQ, rxd3);
163f4d22c118d4 Sean Wang        2021-01-28  264  	unicast =3D FIELD_GET(MT_=
RXD3_NORMAL_ADDR_TYPE, rxd3) =3D=3D MT_RXD3_NORMAL_U2M;
163f4d22c118d4 Sean Wang        2021-01-28  265  	idx =3D FIELD_GET(MT_RXD1=
_NORMAL_WLAN_IDX, rxd1);
163f4d22c118d4 Sean Wang        2021-01-28  266  	status->wcid =3D mt7921_r=
x_get_wcid(dev, idx, unicast);
163f4d22c118d4 Sean Wang        2021-01-28  267  =

163f4d22c118d4 Sean Wang        2021-01-28  268  	if (status->wcid) {
163f4d22c118d4 Sean Wang        2021-01-28  269  		msta =3D container_of(st=
atus->wcid, struct mt7921_sta, wcid);
163f4d22c118d4 Sean Wang        2021-01-28  270  		spin_lock_bh(&dev->sta_p=
oll_lock);
163f4d22c118d4 Sean Wang        2021-01-28  271  		if (list_empty(&msta->po=
ll_list))
163f4d22c118d4 Sean Wang        2021-01-28  272  			list_add_tail(&msta->po=
ll_list, &dev->sta_poll_list);
163f4d22c118d4 Sean Wang        2021-01-28  273  		spin_unlock_bh(&dev->sta=
_poll_lock);
163f4d22c118d4 Sean Wang        2021-01-28  274  	}
163f4d22c118d4 Sean Wang        2021-01-28  275  =

163f4d22c118d4 Sean Wang        2021-01-28  276  	mt7921_get_status_freq_in=
fo(dev, mphy, status, chfreq);
163f4d22c118d4 Sean Wang        2021-01-28  277  =

50ac15a511e3a0 Lorenzo Bianconi 2021-08-24  278  	switch (status->band) {
50ac15a511e3a0 Lorenzo Bianconi 2021-08-24  279  	case NL80211_BAND_5GHZ:
163f4d22c118d4 Sean Wang        2021-01-28  280  		sband =3D &mphy->sband_5=
g.sband;
50ac15a511e3a0 Lorenzo Bianconi 2021-08-24  281  		break;
50ac15a511e3a0 Lorenzo Bianconi 2021-08-24  282  	case NL80211_BAND_6GHZ:
50ac15a511e3a0 Lorenzo Bianconi 2021-08-24  283  		sband =3D &mphy->sband_6=
g.sband;
50ac15a511e3a0 Lorenzo Bianconi 2021-08-24  284  		break;
50ac15a511e3a0 Lorenzo Bianconi 2021-08-24  285  	default:
163f4d22c118d4 Sean Wang        2021-01-28  286  		sband =3D &mphy->sband_2=
g.sband;
50ac15a511e3a0 Lorenzo Bianconi 2021-08-24  287  		break;
50ac15a511e3a0 Lorenzo Bianconi 2021-08-24  288  	}
163f4d22c118d4 Sean Wang        2021-01-28  289  =

163f4d22c118d4 Sean Wang        2021-01-28  290  	if (!sband->channels)
163f4d22c118d4 Sean Wang        2021-01-28  291  		return -EINVAL;
163f4d22c118d4 Sean Wang        2021-01-28  292  =

0e75732764e86a Lorenzo Bianconi 2021-05-06  293  	if ((rxd0 & csum_mask) =
=3D=3D csum_mask)
0e75732764e86a Lorenzo Bianconi 2021-05-06  294  		skb->ip_summed =3D CHECK=
SUM_UNNECESSARY;
0e75732764e86a Lorenzo Bianconi 2021-05-06  295  =

163f4d22c118d4 Sean Wang        2021-01-28  296  	if (rxd1 & MT_RXD1_NORMAL=
_FCS_ERR)
163f4d22c118d4 Sean Wang        2021-01-28  297  		status->flag |=3D RX_FLA=
G_FAILED_FCS_CRC;
163f4d22c118d4 Sean Wang        2021-01-28  298  =

163f4d22c118d4 Sean Wang        2021-01-28  299  	if (rxd1 & MT_RXD1_NORMAL=
_TKIP_MIC_ERR)
163f4d22c118d4 Sean Wang        2021-01-28  300  		status->flag |=3D RX_FLA=
G_MMIC_ERROR;
163f4d22c118d4 Sean Wang        2021-01-28  301  =

163f4d22c118d4 Sean Wang        2021-01-28  302  	if (FIELD_GET(MT_RXD1_NOR=
MAL_SEC_MODE, rxd1) !=3D 0 &&
163f4d22c118d4 Sean Wang        2021-01-28  303  	    !(rxd1 & (MT_RXD1_NOR=
MAL_CLM | MT_RXD1_NORMAL_CM))) {
163f4d22c118d4 Sean Wang        2021-01-28  304  		status->flag |=3D RX_FLA=
G_DECRYPTED;
163f4d22c118d4 Sean Wang        2021-01-28  305  		status->flag |=3D RX_FLA=
G_IV_STRIPPED;
163f4d22c118d4 Sean Wang        2021-01-28  306  		status->flag |=3D RX_FLA=
G_MMIC_STRIPPED | RX_FLAG_MIC_STRIPPED;
163f4d22c118d4 Sean Wang        2021-01-28  307  	}
163f4d22c118d4 Sean Wang        2021-01-28  308  =

163f4d22c118d4 Sean Wang        2021-01-28  309  	remove_pad =3D FIELD_GET(=
MT_RXD2_NORMAL_HDR_OFFSET, rxd2);
163f4d22c118d4 Sean Wang        2021-01-28  310  =

163f4d22c118d4 Sean Wang        2021-01-28  311  	if (rxd2 & MT_RXD2_NORMAL=
_MAX_LEN_ERROR)
163f4d22c118d4 Sean Wang        2021-01-28  312  		return -EINVAL;
163f4d22c118d4 Sean Wang        2021-01-28  313  =

163f4d22c118d4 Sean Wang        2021-01-28  314  	rxd +=3D 6;
163f4d22c118d4 Sean Wang        2021-01-28  315  	if (rxd1 & MT_RXD1_NORMAL=
_GROUP_4) {
24299fc869f7ca Lorenzo Bianconi 2021-05-06  316  		u32 v0 =3D le32_to_cpu(r=
xd[0]);
24299fc869f7ca Lorenzo Bianconi 2021-05-06  317  		u32 v2 =3D le32_to_cpu(r=
xd[2]);
24299fc869f7ca Lorenzo Bianconi 2021-05-06  318  =

24299fc869f7ca Lorenzo Bianconi 2021-05-06  319  		fc =3D cpu_to_le16(FIELD=
_GET(MT_RXD6_FRAME_CONTROL, v0));
24299fc869f7ca Lorenzo Bianconi 2021-05-06  320  		seq_ctrl =3D FIELD_GET(M=
T_RXD8_SEQ_CTRL, v2);
24299fc869f7ca Lorenzo Bianconi 2021-05-06  321  		qos_ctl =3D FIELD_GET(MT=
_RXD8_QOS_CTL, v2);
24299fc869f7ca Lorenzo Bianconi 2021-05-06  322  =

163f4d22c118d4 Sean Wang        2021-01-28  323  		rxd +=3D 4;
163f4d22c118d4 Sean Wang        2021-01-28  324  		if ((u8 *)rxd - skb->dat=
a >=3D skb->len)
163f4d22c118d4 Sean Wang        2021-01-28  325  			return -EINVAL;
163f4d22c118d4 Sean Wang        2021-01-28  326  	}
163f4d22c118d4 Sean Wang        2021-01-28  327  =

163f4d22c118d4 Sean Wang        2021-01-28  328  	if (rxd1 & MT_RXD1_NORMAL=
_GROUP_1) {
163f4d22c118d4 Sean Wang        2021-01-28  329  		u8 *data =3D (u8 *)rxd;
163f4d22c118d4 Sean Wang        2021-01-28  330  =

163f4d22c118d4 Sean Wang        2021-01-28  331  		if (status->flag & RX_FL=
AG_DECRYPTED) {
c368362c36d3d4 Ryder Lee        2021-06-17  332  			switch (FIELD_GET(MT_RX=
D1_NORMAL_SEC_MODE, rxd1)) {
c368362c36d3d4 Ryder Lee        2021-06-17  333  			case MT_CIPHER_AES_CCMP:
c368362c36d3d4 Ryder Lee        2021-06-17  334  			case MT_CIPHER_CCMP_CCX:
c368362c36d3d4 Ryder Lee        2021-06-17  335  			case MT_CIPHER_CCMP_256:
c368362c36d3d4 Ryder Lee        2021-06-17  336  				insert_ccmp_hdr =3D
c368362c36d3d4 Ryder Lee        2021-06-17  337  					FIELD_GET(MT_RXD2_NOR=
MAL_FRAG, rxd2);
c368362c36d3d4 Ryder Lee        2021-06-17  338  				fallthrough;
c368362c36d3d4 Ryder Lee        2021-06-17  339  			case MT_CIPHER_TKIP:
c368362c36d3d4 Ryder Lee        2021-06-17  340  			case MT_CIPHER_TKIP_NO_=
MIC:
c368362c36d3d4 Ryder Lee        2021-06-17  341  			case MT_CIPHER_GCMP:
c368362c36d3d4 Ryder Lee        2021-06-17  342  			case MT_CIPHER_GCMP_256:
163f4d22c118d4 Sean Wang        2021-01-28  343  				status->iv[0] =3D data=
[5];
163f4d22c118d4 Sean Wang        2021-01-28  344  				status->iv[1] =3D data=
[4];
163f4d22c118d4 Sean Wang        2021-01-28  345  				status->iv[2] =3D data=
[3];
163f4d22c118d4 Sean Wang        2021-01-28  346  				status->iv[3] =3D data=
[2];
163f4d22c118d4 Sean Wang        2021-01-28  347  				status->iv[4] =3D data=
[1];
163f4d22c118d4 Sean Wang        2021-01-28  348  				status->iv[5] =3D data=
[0];
c368362c36d3d4 Ryder Lee        2021-06-17  349  				break;
c368362c36d3d4 Ryder Lee        2021-06-17  350  			default:
c368362c36d3d4 Ryder Lee        2021-06-17  351  				break;
c368362c36d3d4 Ryder Lee        2021-06-17  352  			}
163f4d22c118d4 Sean Wang        2021-01-28  353  		}
163f4d22c118d4 Sean Wang        2021-01-28  354  		rxd +=3D 4;
163f4d22c118d4 Sean Wang        2021-01-28  355  		if ((u8 *)rxd - skb->dat=
a >=3D skb->len)
163f4d22c118d4 Sean Wang        2021-01-28  356  			return -EINVAL;
163f4d22c118d4 Sean Wang        2021-01-28  357  	}
163f4d22c118d4 Sean Wang        2021-01-28  358  =

163f4d22c118d4 Sean Wang        2021-01-28  359  	if (rxd1 & MT_RXD1_NORMAL=
_GROUP_2) {
0fda6d7bb5a29b Ryder Lee        2021-03-30  360  		status->timestamp =3D le=
32_to_cpu(rxd[0]);
0fda6d7bb5a29b Ryder Lee        2021-03-30  361  		status->flag |=3D RX_FLA=
G_MACTIME_START;
0fda6d7bb5a29b Ryder Lee        2021-03-30  362  =

0fda6d7bb5a29b Ryder Lee        2021-03-30  363  		if (!(rxd2 & MT_RXD2_NOR=
MAL_NON_AMPDU)) {
0fda6d7bb5a29b Ryder Lee        2021-03-30  364  			status->flag |=3D RX_FL=
AG_AMPDU_DETAILS;
0fda6d7bb5a29b Ryder Lee        2021-03-30  365  =

0fda6d7bb5a29b Ryder Lee        2021-03-30  366  			/* all subframes of an =
A-MPDU have the same timestamp */
0fda6d7bb5a29b Ryder Lee        2021-03-30  367  			if (phy->rx_ampdu_ts !=
=3D status->timestamp) {
0fda6d7bb5a29b Ryder Lee        2021-03-30  368  				if (!++phy->ampdu_ref)
0fda6d7bb5a29b Ryder Lee        2021-03-30  369  					phy->ampdu_ref++;
0fda6d7bb5a29b Ryder Lee        2021-03-30  370  			}
0fda6d7bb5a29b Ryder Lee        2021-03-30  371  			phy->rx_ampdu_ts =3D st=
atus->timestamp;
0fda6d7bb5a29b Ryder Lee        2021-03-30  372  =

0fda6d7bb5a29b Ryder Lee        2021-03-30  373  			status->ampdu_ref =3D p=
hy->ampdu_ref;
0fda6d7bb5a29b Ryder Lee        2021-03-30  374  		}
0fda6d7bb5a29b Ryder Lee        2021-03-30  375  =

163f4d22c118d4 Sean Wang        2021-01-28  376  		rxd +=3D 2;
163f4d22c118d4 Sean Wang        2021-01-28  377  		if ((u8 *)rxd - skb->dat=
a >=3D skb->len)
163f4d22c118d4 Sean Wang        2021-01-28  378  			return -EINVAL;
163f4d22c118d4 Sean Wang        2021-01-28  379  	}
163f4d22c118d4 Sean Wang        2021-01-28  380  =

163f4d22c118d4 Sean Wang        2021-01-28  381  	/* RXD Group 3 - P-RXV */
163f4d22c118d4 Sean Wang        2021-01-28  382  	if (rxd1 & MT_RXD1_NORMAL=
_GROUP_3) {
0940605a2a7080 Sean Wang        2021-02-19  383  		u8 stbc, gi;
0940605a2a7080 Sean Wang        2021-02-19  384  		u32 v0, v1;
0940605a2a7080 Sean Wang        2021-02-19  385  		bool cck;
163f4d22c118d4 Sean Wang        2021-01-28  386  =

163f4d22c118d4 Sean Wang        2021-01-28  387  		rxv =3D rxd;
163f4d22c118d4 Sean Wang        2021-01-28  388  		rxd +=3D 2;
163f4d22c118d4 Sean Wang        2021-01-28  389  		if ((u8 *)rxd - skb->dat=
a >=3D skb->len)
163f4d22c118d4 Sean Wang        2021-01-28  390  			return -EINVAL;
163f4d22c118d4 Sean Wang        2021-01-28  391  =

163f4d22c118d4 Sean Wang        2021-01-28  392  		v0 =3D le32_to_cpu(rxv[0=
]);
163f4d22c118d4 Sean Wang        2021-01-28  393  		v1 =3D le32_to_cpu(rxv[1=
]);
163f4d22c118d4 Sean Wang        2021-01-28  394  =

163f4d22c118d4 Sean Wang        2021-01-28  395  		if (v0 & MT_PRXV_HT_AD_C=
ODE)
163f4d22c118d4 Sean Wang        2021-01-28  396  			status->enc_flags |=3D =
RX_ENC_FLAG_LDPC;
163f4d22c118d4 Sean Wang        2021-01-28  397  =

163f4d22c118d4 Sean Wang        2021-01-28  398  		status->chains =3D mphy-=
>antenna_mask;
163f4d22c118d4 Sean Wang        2021-01-28  399  		status->chain_signal[0] =
=3D to_rssi(MT_PRXV_RCPI0, v1);
163f4d22c118d4 Sean Wang        2021-01-28  400  		status->chain_signal[1] =
=3D to_rssi(MT_PRXV_RCPI1, v1);
163f4d22c118d4 Sean Wang        2021-01-28  401  		status->chain_signal[2] =
=3D to_rssi(MT_PRXV_RCPI2, v1);
163f4d22c118d4 Sean Wang        2021-01-28  402  		status->chain_signal[3] =
=3D to_rssi(MT_PRXV_RCPI3, v1);
edb5aebc1c3db3 Sean Wang        2021-05-10  403  		status->signal =3D -128;
edb5aebc1c3db3 Sean Wang        2021-05-10  404  		for (i =3D 0; i < hweigh=
t8(mphy->antenna_mask); i++) {
edb5aebc1c3db3 Sean Wang        2021-05-10  405  			if (!(status->chains & =
BIT(i)) ||
edb5aebc1c3db3 Sean Wang        2021-05-10  406  			    status->chain_signa=
l[i] >=3D 0)
163f4d22c118d4 Sean Wang        2021-01-28  407  				continue;
163f4d22c118d4 Sean Wang        2021-01-28  408  =

163f4d22c118d4 Sean Wang        2021-01-28  409  			status->signal =3D max(=
status->signal,
163f4d22c118d4 Sean Wang        2021-01-28  410  					     status->chain_si=
gnal[i]);
163f4d22c118d4 Sean Wang        2021-01-28  411  		}
163f4d22c118d4 Sean Wang        2021-01-28  412  =

f71662de66a63e Lorenzo Bianconi 2022-06-08  413  		stbc =3D FIELD_GET(MT_PR=
XV_HT_STBC, v0);
f71662de66a63e Lorenzo Bianconi 2022-06-08  414  		gi =3D FIELD_GET(MT_PRXV=
_HT_SGI, v0);
0940605a2a7080 Sean Wang        2021-02-19  415  		cck =3D false;
163f4d22c118d4 Sean Wang        2021-01-28  416  =

163f4d22c118d4 Sean Wang        2021-01-28  417  		idx =3D i =3D FIELD_GET(=
MT_PRXV_TX_RATE, v0);
0940605a2a7080 Sean Wang        2021-02-19  418  		mode =3D FIELD_GET(MT_PR=
XV_TX_MODE, v0);
163f4d22c118d4 Sean Wang        2021-01-28  419  =

163f4d22c118d4 Sean Wang        2021-01-28  420  		switch (mode) {
163f4d22c118d4 Sean Wang        2021-01-28  421  		case MT_PHY_TYPE_CCK:
163f4d22c118d4 Sean Wang        2021-01-28  422  			cck =3D true;
163f4d22c118d4 Sean Wang        2021-01-28  423  			fallthrough;
163f4d22c118d4 Sean Wang        2021-01-28  424  		case MT_PHY_TYPE_OFDM:
163f4d22c118d4 Sean Wang        2021-01-28  425  			i =3D mt76_get_rate(&de=
v->mt76, sband, i, cck);
163f4d22c118d4 Sean Wang        2021-01-28  426  			break;
163f4d22c118d4 Sean Wang        2021-01-28  427  		case MT_PHY_TYPE_HT_GF:
163f4d22c118d4 Sean Wang        2021-01-28  428  		case MT_PHY_TYPE_HT:
163f4d22c118d4 Sean Wang        2021-01-28  429  			status->encoding =3D RX=
_ENC_HT;
163f4d22c118d4 Sean Wang        2021-01-28  430  			if (i > 31)
163f4d22c118d4 Sean Wang        2021-01-28  431  				return -EINVAL;
163f4d22c118d4 Sean Wang        2021-01-28  432  			break;
163f4d22c118d4 Sean Wang        2021-01-28  433  		case MT_PHY_TYPE_VHT:
163f4d22c118d4 Sean Wang        2021-01-28  434  			status->nss =3D
163f4d22c118d4 Sean Wang        2021-01-28  435  				FIELD_GET(MT_PRXV_NSTS=
, v0) + 1;
163f4d22c118d4 Sean Wang        2021-01-28  436  			status->encoding =3D RX=
_ENC_VHT;
3128ea016965ce Felix Fietkau    2022-03-25  437  			if (i > 11)
163f4d22c118d4 Sean Wang        2021-01-28  438  				return -EINVAL;
163f4d22c118d4 Sean Wang        2021-01-28  439  			break;
163f4d22c118d4 Sean Wang        2021-01-28  440  		case MT_PHY_TYPE_HE_MU:
163f4d22c118d4 Sean Wang        2021-01-28  441  		case MT_PHY_TYPE_HE_SU:
163f4d22c118d4 Sean Wang        2021-01-28  442  		case MT_PHY_TYPE_HE_EXT_=
SU:
163f4d22c118d4 Sean Wang        2021-01-28  443  		case MT_PHY_TYPE_HE_TB:
163f4d22c118d4 Sean Wang        2021-01-28  444  			status->nss =3D
163f4d22c118d4 Sean Wang        2021-01-28  445  				FIELD_GET(MT_PRXV_NSTS=
, v0) + 1;
163f4d22c118d4 Sean Wang        2021-01-28  446  			status->encoding =3D RX=
_ENC_HE;
163f4d22c118d4 Sean Wang        2021-01-28  447  			i &=3D GENMASK(3, 0);
163f4d22c118d4 Sean Wang        2021-01-28  448  =

163f4d22c118d4 Sean Wang        2021-01-28  449  			if (gi <=3D NL80211_RAT=
E_INFO_HE_GI_3_2)
163f4d22c118d4 Sean Wang        2021-01-28  450  				status->he_gi =3D gi;
163f4d22c118d4 Sean Wang        2021-01-28  451  =

163f4d22c118d4 Sean Wang        2021-01-28  452  			status->he_dcm =3D !!(i=
dx & MT_PRXV_TX_DCM);
163f4d22c118d4 Sean Wang        2021-01-28  453  			break;
163f4d22c118d4 Sean Wang        2021-01-28  454  		default:
163f4d22c118d4 Sean Wang        2021-01-28  455  			return -EINVAL;
163f4d22c118d4 Sean Wang        2021-01-28  456  		}
0940605a2a7080 Sean Wang        2021-02-19  457  =

163f4d22c118d4 Sean Wang        2021-01-28  458  		status->rate_idx =3D i;
163f4d22c118d4 Sean Wang        2021-01-28  459  =

0940605a2a7080 Sean Wang        2021-02-19  460  		switch (FIELD_GET(MT_PRX=
V_FRAME_MODE, v0)) {
163f4d22c118d4 Sean Wang        2021-01-28  461  		case IEEE80211_STA_RX_BW=
_20:
163f4d22c118d4 Sean Wang        2021-01-28  462  			break;
163f4d22c118d4 Sean Wang        2021-01-28  463  		case IEEE80211_STA_RX_BW=
_40:
163f4d22c118d4 Sean Wang        2021-01-28  464  			if (mode & MT_PHY_TYPE_=
HE_EXT_SU &&
163f4d22c118d4 Sean Wang        2021-01-28  465  			    (idx & MT_PRXV_TX_E=
R_SU_106T)) {
163f4d22c118d4 Sean Wang        2021-01-28  466  				status->bw =3D RATE_IN=
FO_BW_HE_RU;
163f4d22c118d4 Sean Wang        2021-01-28  467  				status->he_ru =3D
163f4d22c118d4 Sean Wang        2021-01-28  468  					NL80211_RATE_INFO_HE_=
RU_ALLOC_106;
163f4d22c118d4 Sean Wang        2021-01-28  469  			} else {
163f4d22c118d4 Sean Wang        2021-01-28  470  				status->bw =3D RATE_IN=
FO_BW_40;
163f4d22c118d4 Sean Wang        2021-01-28  471  			}
163f4d22c118d4 Sean Wang        2021-01-28  472  			break;
163f4d22c118d4 Sean Wang        2021-01-28  473  		case IEEE80211_STA_RX_BW=
_80:
163f4d22c118d4 Sean Wang        2021-01-28  474  			status->bw =3D RATE_INF=
O_BW_80;
163f4d22c118d4 Sean Wang        2021-01-28  475  			break;
163f4d22c118d4 Sean Wang        2021-01-28  476  		case IEEE80211_STA_RX_BW=
_160:
163f4d22c118d4 Sean Wang        2021-01-28  477  			status->bw =3D RATE_INF=
O_BW_160;
163f4d22c118d4 Sean Wang        2021-01-28  478  			break;
163f4d22c118d4 Sean Wang        2021-01-28  479  		default:
163f4d22c118d4 Sean Wang        2021-01-28  480  			return -EINVAL;
163f4d22c118d4 Sean Wang        2021-01-28  481  		}
163f4d22c118d4 Sean Wang        2021-01-28  482  =

163f4d22c118d4 Sean Wang        2021-01-28  483  		status->enc_flags |=3D R=
X_ENC_FLAG_STBC_MASK * stbc;
163f4d22c118d4 Sean Wang        2021-01-28  484  		if (mode < MT_PHY_TYPE_H=
E_SU && gi)
163f4d22c118d4 Sean Wang        2021-01-28  485  			status->enc_flags |=3D =
RX_ENC_FLAG_SHORT_GI;
0940605a2a7080 Sean Wang        2021-02-19  486  =

0940605a2a7080 Sean Wang        2021-02-19  487  		if (rxd1 & MT_RXD1_NORMA=
L_GROUP_5) {
0940605a2a7080 Sean Wang        2021-02-19  488  			rxd +=3D 18;
0940605a2a7080 Sean Wang        2021-02-19  489  			if ((u8 *)rxd - skb->da=
ta >=3D skb->len)
0940605a2a7080 Sean Wang        2021-02-19  490  				return -EINVAL;
163f4d22c118d4 Sean Wang        2021-01-28  491  		}
163f4d22c118d4 Sean Wang        2021-01-28  492  	}
163f4d22c118d4 Sean Wang        2021-01-28  493  =

5b0b5c6a1c2195 Lorenzo Bianconi 2021-05-06  494  	amsdu_info =3D FIELD_GET(=
MT_RXD4_NORMAL_PAYLOAD_FORMAT, rxd4);
5b0b5c6a1c2195 Lorenzo Bianconi 2021-05-06  495  	status->amsdu =3D !!amsdu=
_info;
5b0b5c6a1c2195 Lorenzo Bianconi 2021-05-06  496  	if (status->amsdu) {
5b0b5c6a1c2195 Lorenzo Bianconi 2021-05-06  497  		status->first_amsdu =3D =
amsdu_info =3D=3D MT_RXD4_FIRST_AMSDU_FRAME;
5b0b5c6a1c2195 Lorenzo Bianconi 2021-05-06  498  		status->last_amsdu =3D a=
msdu_info =3D=3D MT_RXD4_LAST_AMSDU_FRAME;
dc5399a50b45fa Xing Song        2021-11-10  499  	}
dc5399a50b45fa Xing Song        2021-11-10  500  =

dc5399a50b45fa Xing Song        2021-11-10  501  	hdr_gap =3D (u8 *)rxd - s=
kb->data + 2 * remove_pad;
dc5399a50b45fa Xing Song        2021-11-10  502  	if (hdr_trans && ieee8021=
1_has_morefrags(fc)) {
0880d40871d1d0 Lorenzo Bianconi 2022-06-08  503  		struct ieee80211_vif *vi=
f;
0880d40871d1d0 Lorenzo Bianconi 2022-06-08  504  		int err;
0880d40871d1d0 Lorenzo Bianconi 2022-06-08  505  =

0880d40871d1d0 Lorenzo Bianconi 2022-06-08 @506  		if (!msta || !msta->vif)
dc5399a50b45fa Xing Song        2021-11-10  507  			return -EINVAL;
0880d40871d1d0 Lorenzo Bianconi 2022-06-08  508  =

0880d40871d1d0 Lorenzo Bianconi 2022-06-08  509  		vif =3D container_of((vo=
id *)msta->vif, struct ieee80211_vif,
0880d40871d1d0 Lorenzo Bianconi 2022-06-08  510  				   drv_priv);
0880d40871d1d0 Lorenzo Bianconi 2022-06-08  511  		err =3D mt76_connac2_rev=
erse_frag0_hdr_trans(vif, skb, hdr_gap);
0880d40871d1d0 Lorenzo Bianconi 2022-06-08  512  		if (err)
0880d40871d1d0 Lorenzo Bianconi 2022-06-08  513  			return err;
0880d40871d1d0 Lorenzo Bianconi 2022-06-08  514  =

dc5399a50b45fa Xing Song        2021-11-10  515  		hdr_trans =3D false;
dc5399a50b45fa Xing Song        2021-11-10  516  	} else {
dc5399a50b45fa Xing Song        2021-11-10  517  		skb_pull(skb, hdr_gap);
dc5399a50b45fa Xing Song        2021-11-10  518  		if (!hdr_trans && status=
->amsdu) {
5b0b5c6a1c2195 Lorenzo Bianconi 2021-05-06  519  			memmove(skb->data + 2, =
skb->data,
5b0b5c6a1c2195 Lorenzo Bianconi 2021-05-06  520  				ieee80211_get_hdrlen_f=
rom_skb(skb));
5b0b5c6a1c2195 Lorenzo Bianconi 2021-05-06  521  			skb_pull(skb, 2);
5b0b5c6a1c2195 Lorenzo Bianconi 2021-05-06  522  		}
24299fc869f7ca Lorenzo Bianconi 2021-05-06  523  	}
5b0b5c6a1c2195 Lorenzo Bianconi 2021-05-06  524  =

24299fc869f7ca Lorenzo Bianconi 2021-05-06  525  	if (!hdr_trans) {
087baf9b6d373f Ryder Lee        2021-12-03  526  		struct ieee80211_hdr *hd=
r;
c23fa1bbc5d604 Ryder Lee        2021-11-15  527  =

163f4d22c118d4 Sean Wang        2021-01-28  528  		if (insert_ccmp_hdr) {
163f4d22c118d4 Sean Wang        2021-01-28  529  			u8 key_id =3D FIELD_GET=
(MT_RXD1_NORMAL_KEY_ID, rxd1);
163f4d22c118d4 Sean Wang        2021-01-28  530  =

163f4d22c118d4 Sean Wang        2021-01-28  531  			mt76_insert_ccmp_hdr(sk=
b, key_id);
163f4d22c118d4 Sean Wang        2021-01-28  532  		}
163f4d22c118d4 Sean Wang        2021-01-28  533  =

24299fc869f7ca Lorenzo Bianconi 2021-05-06  534  		hdr =3D mt76_skb_get_hdr=
(skb);
24299fc869f7ca Lorenzo Bianconi 2021-05-06  535  		fc =3D hdr->frame_contro=
l;
24299fc869f7ca Lorenzo Bianconi 2021-05-06  536  		if (ieee80211_is_data_qo=
s(fc)) {
24299fc869f7ca Lorenzo Bianconi 2021-05-06  537  			seq_ctrl =3D le16_to_cp=
u(hdr->seq_ctrl);
24299fc869f7ca Lorenzo Bianconi 2021-05-06  538  			qos_ctl =3D *ieee80211_=
get_qos_ctl(hdr);
24299fc869f7ca Lorenzo Bianconi 2021-05-06  539  		}
24299fc869f7ca Lorenzo Bianconi 2021-05-06  540  	} else {
24299fc869f7ca Lorenzo Bianconi 2021-05-06  541  		status->flag |=3D RX_FLA=
G_8023;
24299fc869f7ca Lorenzo Bianconi 2021-05-06  542  	}
24299fc869f7ca Lorenzo Bianconi 2021-05-06  543  =

93c81df520a1ba Lorenzo Bianconi 2021-03-24  544  	mt7921_mac_assoc_rssi(dev=
, skb);
93c81df520a1ba Lorenzo Bianconi 2021-03-24  545  =

c23fa1bbc5d604 Ryder Lee        2021-11-15  546  	if (rxv && mode >=3D MT_P=
HY_TYPE_HE_SU && !(status->flag & RX_FLAG_8023))
f71662de66a63e Lorenzo Bianconi 2022-06-08  547  		mt76_connac2_mac_decode_=
he_radiotap(&dev->mt76, skb, rxv, mode);
4fee32153ab623 Sean Wang        2021-08-13  548  =

24299fc869f7ca Lorenzo Bianconi 2021-05-06  549  	if (!status->wcid || !iee=
e80211_is_data_qos(fc))
163f4d22c118d4 Sean Wang        2021-01-28  550  		return 0;
163f4d22c118d4 Sean Wang        2021-01-28  551  =

24299fc869f7ca Lorenzo Bianconi 2021-05-06  552  	status->aggr =3D unicast =
&& !ieee80211_is_qos_nullfunc(fc);
24299fc869f7ca Lorenzo Bianconi 2021-05-06  553  	status->seqno =3D IEEE802=
11_SEQ_TO_SN(seq_ctrl);
24299fc869f7ca Lorenzo Bianconi 2021-05-06  554  	status->qos_ctl =3D qos_c=
tl;
163f4d22c118d4 Sean Wang        2021-01-28  555  =

163f4d22c118d4 Sean Wang        2021-01-28  556  	return 0;
163f4d22c118d4 Sean Wang        2021-01-28  557  }
163f4d22c118d4 Sean Wang        2021-01-28  558  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp

--===============8811470757538030454==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.ksh"

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIExpbnV4L29w
ZW5yaXNjIDUuMTkuMC1yYzEgS2VybmVsIENvbmZpZ3VyYXRpb24KIwpDT05GSUdfQ0NfVkVSU0lP
Tl9URVhUPSJvcjFrLWxpbnV4LWdjYyAoR0NDKSAxMi4xLjAiCkNPTkZJR19DQ19JU19HQ0M9eQpD
T05GSUdfR0NDX1ZFUlNJT049MTIwMTAwCkNPTkZJR19DTEFOR19WRVJTSU9OPTAKQ09ORklHX0FT
X0lTX0dOVT15CkNPTkZJR19BU19WRVJTSU9OPTIzODAwCkNPTkZJR19MRF9JU19CRkQ9eQpDT05G
SUdfTERfVkVSU0lPTj0yMzgwMApDT05GSUdfTExEX1ZFUlNJT049MApDT05GSUdfQ0NfSEFTX0FT
TV9HT1RPPXkKQ09ORklHX0NDX0hBU19BU01fR09UT19PVVRQVVQ9eQpDT05GSUdfQ0NfSEFTX0FT
TV9JTkxJTkU9eQpDT05GSUdfQ0NfSEFTX05PX1BST0ZJTEVfRk5fQVRUUj15CkNPTkZJR19QQUhP
TEVfVkVSU0lPTj0xMjQKQ09ORklHX0lSUV9XT1JLPXkKCiMKIyBHZW5lcmFsIHNldHVwCiMKQ09O
RklHX0JST0tFTl9PTl9TTVA9eQpDT05GSUdfSU5JVF9FTlZfQVJHX0xJTUlUPTMyCkNPTkZJR19D
T01QSUxFX1RFU1Q9eQojIENPTkZJR19XRVJST1IgaXMgbm90IHNldApDT05GSUdfTE9DQUxWRVJT
SU9OPSIiCkNPTkZJR19CVUlMRF9TQUxUPSIiCkNPTkZJR19ERUZBVUxUX0lOSVQ9IiIKQ09ORklH
X0RFRkFVTFRfSE9TVE5BTUU9Iihub25lKSIKIyBDT05GSUdfU1lTVklQQyBpcyBub3Qgc2V0CkNP
TkZJR19QT1NJWF9NUVVFVUU9eQpDT05GSUdfUE9TSVhfTVFVRVVFX1NZU0NUTD15CkNPTkZJR19X
QVRDSF9RVUVVRT15CiMgQ09ORklHX0NST1NTX01FTU9SWV9BVFRBQ0ggaXMgbm90IHNldApDT05G
SUdfVVNFTElCPXkKIyBDT05GSUdfQVVESVQgaXMgbm90IHNldAoKIwojIElSUSBzdWJzeXN0ZW0K
IwpDT05GSUdfR0VORVJJQ19JUlFfUFJPQkU9eQpDT05GSUdfR0VORVJJQ19JUlFfU0hPVz15CkNP
TkZJR19HRU5FUklDX0lSUV9DSElQPXkKQ09ORklHX0lSUV9ET01BSU49eQpDT05GSUdfSVJRX1NJ
TT15CkNPTkZJR19TUEFSU0VfSVJRPXkKIyBDT05GSUdfR0VORVJJQ19JUlFfREVCVUdGUyBpcyBu
b3Qgc2V0CiMgZW5kIG9mIElSUSBzdWJzeXN0ZW0KCkNPTkZJR19HRU5FUklDX0lSUV9NVUxUSV9I
QU5ETEVSPXkKQ09ORklHX0dFTkVSSUNfQ0xPQ0tFVkVOVFM9eQpDT05GSUdfR0VORVJJQ19DTE9D
S0VWRU5UU19CUk9BRENBU1Q9eQoKIwojIFRpbWVycyBzdWJzeXN0ZW0KIwpDT05GSUdfVElDS19P
TkVTSE9UPXkKQ09ORklHX05PX0haX0NPTU1PTj15CiMgQ09ORklHX0haX1BFUklPRElDIGlzIG5v
dCBzZXQKQ09ORklHX05PX0haX0lETEU9eQojIENPTkZJR19OT19IWiBpcyBub3Qgc2V0CiMgQ09O
RklHX0hJR0hfUkVTX1RJTUVSUyBpcyBub3Qgc2V0CiMgZW5kIG9mIFRpbWVycyBzdWJzeXN0ZW0K
CkNPTkZJR19CUEY9eQoKIwojIEJQRiBzdWJzeXN0ZW0KIwojIENPTkZJR19CUEZfU1lTQ0FMTCBp
cyBub3Qgc2V0CiMgZW5kIG9mIEJQRiBzdWJzeXN0ZW0KCkNPTkZJR19QUkVFTVBUX05PTkVfQlVJ
TEQ9eQpDT05GSUdfUFJFRU1QVF9OT05FPXkKIyBDT05GSUdfUFJFRU1QVF9WT0xVTlRBUlkgaXMg
bm90IHNldAojIENPTkZJR19QUkVFTVBUIGlzIG5vdCBzZXQKQ09ORklHX1BSRUVNUFRfQ09VTlQ9
eQoKIwojIENQVS9UYXNrIHRpbWUgYW5kIHN0YXRzIGFjY291bnRpbmcKIwpDT05GSUdfVElDS19D
UFVfQUNDT1VOVElORz15CiMgQ09ORklHX0JTRF9QUk9DRVNTX0FDQ1QgaXMgbm90IHNldApDT05G
SUdfVEFTS1NUQVRTPXkKIyBDT05GSUdfVEFTS19ERUxBWV9BQ0NUIGlzIG5vdCBzZXQKIyBDT05G
SUdfVEFTS19YQUNDVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BTSSBpcyBub3Qgc2V0CiMgZW5kIG9m
IENQVS9UYXNrIHRpbWUgYW5kIHN0YXRzIGFjY291bnRpbmcKCkNPTkZJR19DUFVfSVNPTEFUSU9O
PXkKCiMKIyBSQ1UgU3Vic3lzdGVtCiMKQ09ORklHX1RJTllfUkNVPXkKQ09ORklHX1JDVV9FWFBF
UlQ9eQpDT05GSUdfU1JDVT15CkNPTkZJR19USU5ZX1NSQ1U9eQpDT05GSUdfVEFTS1NfUkNVX0dF
TkVSSUM9eQpDT05GSUdfRk9SQ0VfVEFTS1NfUkNVPXkKQ09ORklHX1RBU0tTX1JDVT15CkNPTkZJ
R19GT1JDRV9UQVNLU19SVURFX1JDVT15CkNPTkZJR19UQVNLU19SVURFX1JDVT15CiMgQ09ORklH
X0ZPUkNFX1RBU0tTX1RSQUNFX1JDVSBpcyBub3Qgc2V0CkNPTkZJR19SQ1VfTkVFRF9TRUdDQkxJ
U1Q9eQojIGVuZCBvZiBSQ1UgU3Vic3lzdGVtCgojIENPTkZJR19JS0NPTkZJRyBpcyBub3Qgc2V0
CkNPTkZJR19JS0hFQURFUlM9eQpDT05GSUdfTE9HX0JVRl9TSElGVD0xNwpDT05GSUdfUFJJTlRL
X1NBRkVfTE9HX0JVRl9TSElGVD0xMwpDT05GSUdfUFJJTlRLX0lOREVYPXkKCiMKIyBTY2hlZHVs
ZXIgZmVhdHVyZXMKIwojIGVuZCBvZiBTY2hlZHVsZXIgZmVhdHVyZXMKCkNPTkZJR19DQ19JTVBM
SUNJVF9GQUxMVEhST1VHSD0iLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD01IgpDT05GSUdfR0NDMTJf
Tk9fQVJSQVlfQk9VTkRTPXkKQ09ORklHX0NDX05PX0FSUkFZX0JPVU5EUz15CkNPTkZJR19DR1JP
VVBTPXkKIyBDT05GSUdfTUVNQ0cgaXMgbm90IHNldAojIENPTkZJR19CTEtfQ0dST1VQIGlzIG5v
dCBzZXQKQ09ORklHX0NHUk9VUF9TQ0hFRD15CkNPTkZJR19GQUlSX0dST1VQX1NDSEVEPXkKIyBD
T05GSUdfQ0ZTX0JBTkRXSURUSCBpcyBub3Qgc2V0CkNPTkZJR19SVF9HUk9VUF9TQ0hFRD15CiMg
Q09ORklHX0NHUk9VUF9QSURTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0dST1VQX1JETUEgaXMgbm90
IHNldAojIENPTkZJR19DR1JPVVBfRlJFRVpFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0NHUk9VUF9E
RVZJQ0UgaXMgbm90IHNldApDT05GSUdfQ0dST1VQX0NQVUFDQ1Q9eQojIENPTkZJR19DR1JPVVBf
TUlTQyBpcyBub3Qgc2V0CiMgQ09ORklHX0NHUk9VUF9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19T
T0NLX0NHUk9VUF9EQVRBPXkKQ09ORklHX05BTUVTUEFDRVM9eQojIENPTkZJR19VVFNfTlMgaXMg
bm90IHNldAojIENPTkZJR19JUENfTlMgaXMgbm90IHNldAojIENPTkZJR19VU0VSX05TIGlzIG5v
dCBzZXQKIyBDT05GSUdfUElEX05TIGlzIG5vdCBzZXQKQ09ORklHX05FVF9OUz15CiMgQ09ORklH
X0NIRUNLUE9JTlRfUkVTVE9SRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NDSEVEX0FVVE9HUk9VUCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NZU0ZTX0RFUFJFQ0FURUQgaXMgbm90IHNldApDT05GSUdfUkVM
QVk9eQpDT05GSUdfQkxLX0RFVl9JTklUUkQ9eQpDT05GSUdfSU5JVFJBTUZTX1NPVVJDRT0iIgoj
IENPTkZJR19SRF9HWklQIGlzIG5vdCBzZXQKQ09ORklHX1JEX0JaSVAyPXkKQ09ORklHX1JEX0xa
TUE9eQpDT05GSUdfUkRfWFo9eQojIENPTkZJR19SRF9MWk8gaXMgbm90IHNldApDT05GSUdfUkRf
TFo0PXkKQ09ORklHX1JEX1pTVEQ9eQojIENPTkZJR19CT09UX0NPTkZJRyBpcyBub3Qgc2V0CkNP
TkZJR19JTklUUkFNRlNfUFJFU0VSVkVfTVRJTUU9eQpDT05GSUdfQ0NfT1BUSU1JWkVfRk9SX1BF
UkZPUk1BTkNFPXkKIyBDT05GSUdfQ0NfT1BUSU1JWkVfRk9SX1NJWkUgaXMgbm90IHNldApDT05G
SUdfU1lTQ1RMPXkKQ09ORklHX0hBVkVfVUlEMTY9eQojIENPTkZJR19FWFBFUlQgaXMgbm90IHNl
dApDT05GSUdfVUlEMTY9eQpDT05GSUdfTVVMVElVU0VSPXkKQ09ORklHX1NZU0ZTX1NZU0NBTEw9
eQpDT05GSUdfRkhBTkRMRT15CkNPTkZJR19QT1NJWF9USU1FUlM9eQpDT05GSUdfUFJJTlRLPXkK
Q09ORklHX0JVRz15CkNPTkZJR19FTEZfQ09SRT15CkNPTkZJR19CQVNFX0ZVTEw9eQpDT05GSUdf
RlVURVg9eQpDT05GSUdfRlVURVhfUEk9eQpDT05GSUdfRVBPTEw9eQpDT05GSUdfU0lHTkFMRkQ9
eQpDT05GSUdfVElNRVJGRD15CkNPTkZJR19FVkVOVEZEPXkKQ09ORklHX1NITUVNPXkKQ09ORklH
X0FJTz15CkNPTkZJR19JT19VUklORz15CkNPTkZJR19BRFZJU0VfU1lTQ0FMTFM9eQpDT05GSUdf
TUVNQkFSUklFUj15CkNPTkZJR19LQUxMU1lNUz15CkNPTkZJR19LQUxMU1lNU19BTEw9eQpDT05G
SUdfS0FMTFNZTVNfQkFTRV9SRUxBVElWRT15CkNPTkZJR19LQ01QPXkKIyBDT05GSUdfRU1CRURE
RUQgaXMgbm90IHNldAoKIwojIEtlcm5lbCBQZXJmb3JtYW5jZSBFdmVudHMgQW5kIENvdW50ZXJz
CiMKIyBlbmQgb2YgS2VybmVsIFBlcmZvcm1hbmNlIEV2ZW50cyBBbmQgQ291bnRlcnMKCkNPTkZJ
R19TWVNURU1fREFUQV9WRVJJRklDQVRJT049eQpDT05GSUdfUFJPRklMSU5HPXkKQ09ORklHX1RS
QUNFUE9JTlRTPXkKIyBlbmQgb2YgR2VuZXJhbCBzZXR1cAoKQ09ORklHX09QRU5SSVNDPXkKQ09O
RklHX0NQVV9CSUdfRU5ESUFOPXkKQ09ORklHX01NVT15CkNPTkZJR19HRU5FUklDX0hXRUlHSFQ9
eQpDT05GSUdfTk9fSU9QT1JUX01BUD15CkNPTkZJR19HRU5FUklDX0NTVU09eQpDT05GSUdfU1RB
Q0tUUkFDRV9TVVBQT1JUPXkKQ09ORklHX0xPQ0tERVBfU1VQUE9SVD15CgojCiMgUHJvY2Vzc29y
IHR5cGUgYW5kIGZlYXR1cmVzCiMKQ09ORklHX09SMUtfMTIwMD15CkNPTkZJR19EQ0FDSEVfV1JJ
VEVUSFJPVUdIPXkKQ09ORklHX09QRU5SSVNDX0JVSUxUSU5fRFRCPSIiCgojCiMgQ2xhc3MgSUkg
SW5zdHJ1Y3Rpb25zCiMKQ09ORklHX09QRU5SSVNDX0hBVkVfSU5TVF9GRjE9eQpDT05GSUdfT1BF
TlJJU0NfSEFWRV9JTlNUX0ZMMT15CiMgQ09ORklHX09QRU5SSVNDX0hBVkVfSU5TVF9NVUwgaXMg
bm90IHNldAojIENPTkZJR19PUEVOUklTQ19IQVZFX0lOU1RfRElWIGlzIG5vdCBzZXQKIyBDT05G
SUdfT1BFTlJJU0NfSEFWRV9JTlNUX0NNT1YgaXMgbm90IHNldAojIENPTkZJR19PUEVOUklTQ19I
QVZFX0lOU1RfUk9SIGlzIG5vdCBzZXQKQ09ORklHX09QRU5SSVNDX0hBVkVfSU5TVF9ST1JJPXkK
Q09ORklHX09QRU5SSVNDX0hBVkVfSU5TVF9TRVhUPXkKIyBlbmQgb2YgQ2xhc3MgSUkgSW5zdHJ1
Y3Rpb25zCgojIENPTkZJR19TTVAgaXMgbm90IHNldAojIENPTkZJR19IWl8xMDAgaXMgbm90IHNl
dAojIENPTkZJR19IWl8yNTAgaXMgbm90IHNldAojIENPTkZJR19IWl8zMDAgaXMgbm90IHNldApD
T05GSUdfSFpfMTAwMD15CkNPTkZJR19IWj0xMDAwCiMgQ09ORklHX09QRU5SSVNDX05PX1NQUl9T
Ul9EU1ggaXMgbm90IHNldAojIENPTkZJR19PUEVOUklTQ19IQVZFX1NIQURPV19HUFJTIGlzIG5v
dCBzZXQKQ09ORklHX0NNRExJTkU9IiIKCiMKIyBEZWJ1Z2dpbmcgb3B0aW9ucwojCkNPTkZJR19K
VU1QX1VQT05fVU5IQU5ETEVEX0VYQ0VQVElPTj15CkNPTkZJR19PUEVOUklTQ19FU1JfRVhDRVBU
SU9OX0JVR19DSEVDSz15CiMgZW5kIG9mIERlYnVnZ2luZyBvcHRpb25zCiMgZW5kIG9mIFByb2Nl
c3NvciB0eXBlIGFuZCBmZWF0dXJlcwoKIwojIEdlbmVyYWwgYXJjaGl0ZWN0dXJlLWRlcGVuZGVu
dCBvcHRpb25zCiMKQ09ORklHX1RSQUNFX0lSUUZMQUdTX1NVUFBPUlQ9eQpDT05GSUdfSEFWRV9B
UkNIX1RSQUNFSE9PSz15CkNPTkZJR19HRU5FUklDX1NNUF9JRExFX1RIUkVBRD15CkNPTkZJR19B
UkNIX0hBU19ETUFfU0VUX1VOQ0FDSEVEPXkKQ09ORklHX0FSQ0hfSEFTX0RNQV9DTEVBUl9VTkNB
Q0hFRD15CkNPTkZJR19BUkNIXzMyQklUX09GRl9UPXkKQ09ORklHX01NVV9HQVRIRVJfTk9fUkFO
R0U9eQpDT05GSUdfTFRPX05PTkU9eQpDT05GSUdfTU9EVUxFU19VU0VfRUxGX1JFTEE9eQpDT05G
SUdfUEdUQUJMRV9MRVZFTFM9MgpDT05GSUdfUEFHRV9TSVpFX0xFU1NfVEhBTl82NEtCPXkKQ09O
RklHX1BBR0VfU0laRV9MRVNTX1RIQU5fMjU2S0I9eQpDT05GSUdfQ09NUEFUXzMyQklUX1RJTUU9
eQojIENPTkZJR19MT0NLX0VWRU5UX0NPVU5UUyBpcyBub3Qgc2V0CgojCiMgR0NPVi1iYXNlZCBr
ZXJuZWwgcHJvZmlsaW5nCiMKIyBDT05GSUdfR0NPVl9LRVJORUwgaXMgbm90IHNldAojIGVuZCBv
ZiBHQ09WLWJhc2VkIGtlcm5lbCBwcm9maWxpbmcKIyBlbmQgb2YgR2VuZXJhbCBhcmNoaXRlY3R1
cmUtZGVwZW5kZW50IG9wdGlvbnMKCkNPTkZJR19SVF9NVVRFWEVTPXkKQ09ORklHX0JBU0VfU01B
TEw9MAojIENPTkZJR19NT0RVTEVTIGlzIG5vdCBzZXQKQ09ORklHX01PRFVMRVNfVFJFRV9MT09L
VVA9eQpDT05GSUdfQkxPQ0s9eQpDT05GSUdfQkxPQ0tfTEVHQUNZX0FVVE9MT0FEPXkKQ09ORklH
X0JMS19ERVZfQlNHX0NPTU1PTj15CkNPTkZJR19CTEtfREVWX0JTR0xJQj15CiMgQ09ORklHX0JM
S19ERVZfSU5URUdSSVRZIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0RFVl9aT05FRCBpcyBub3Qg
c2V0CkNPTkZJR19CTEtfV0JUPXkKQ09ORklHX0JMS19XQlRfTVE9eQojIENPTkZJR19CTEtfREVC
VUdfRlMgaXMgbm90IHNldAojIENPTkZJR19CTEtfU0VEX09QQUwgaXMgbm90IHNldAojIENPTkZJ
R19CTEtfSU5MSU5FX0VOQ1JZUFRJT04gaXMgbm90IHNldAoKIwojIFBhcnRpdGlvbiBUeXBlcwoj
CiMgQ09ORklHX1BBUlRJVElPTl9BRFZBTkNFRCBpcyBub3Qgc2V0CkNPTkZJR19BTUlHQV9QQVJU
SVRJT049eQpDT05GSUdfTVNET1NfUEFSVElUSU9OPXkKQ09ORklHX0VGSV9QQVJUSVRJT049eQoj
IGVuZCBvZiBQYXJ0aXRpb24gVHlwZXMKCkNPTkZJR19CTEtfTVFfVklSVElPPXkKQ09ORklHX0JM
S19NUV9SRE1BPXkKQ09ORklHX0JMT0NLX0hPTERFUl9ERVBSRUNBVEVEPXkKQ09ORklHX0JMS19N
UV9TVEFDS0lORz15CgojCiMgSU8gU2NoZWR1bGVycwojCiMgQ09ORklHX01RX0lPU0NIRURfREVB
RExJTkUgaXMgbm90IHNldApDT05GSUdfTVFfSU9TQ0hFRF9LWUJFUj15CiMgQ09ORklHX0lPU0NI
RURfQkZRIGlzIG5vdCBzZXQKIyBlbmQgb2YgSU8gU2NoZWR1bGVycwoKQ09ORklHX0FTTjE9eQpD
T05GSUdfVU5JTkxJTkVfU1BJTl9VTkxPQ0s9eQpDT05GSUdfQVJDSF9VU0VfUVVFVUVEX1JXTE9D
S1M9eQoKIwojIEV4ZWN1dGFibGUgZmlsZSBmb3JtYXRzCiMKIyBDT05GSUdfQklORk1UX0VMRiBp
cyBub3Qgc2V0CkNPTkZJR19CSU5GTVRfU0NSSVBUPXkKQ09ORklHX0JJTkZNVF9NSVNDPXkKQ09O
RklHX0NPUkVEVU1QPXkKIyBlbmQgb2YgRXhlY3V0YWJsZSBmaWxlIGZvcm1hdHMKCiMKIyBNZW1v
cnkgTWFuYWdlbWVudCBvcHRpb25zCiMKIyBDT05GSUdfU1dBUCBpcyBub3Qgc2V0CgojCiMgU0xB
QiBhbGxvY2F0b3Igb3B0aW9ucwojCkNPTkZJR19TTEFCPXkKIyBDT05GSUdfU0xVQiBpcyBub3Qg
c2V0CiMgQ09ORklHX1NMQUJfTUVSR0VfREVGQVVMVCBpcyBub3Qgc2V0CkNPTkZJR19TTEFCX0ZS
RUVMSVNUX1JBTkRPTT15CkNPTkZJR19TTEFCX0ZSRUVMSVNUX0hBUkRFTkVEPXkKIyBlbmQgb2Yg
U0xBQiBhbGxvY2F0b3Igb3B0aW9ucwoKQ09ORklHX1NIVUZGTEVfUEFHRV9BTExPQ0FUT1I9eQpD
T05GSUdfQ09NUEFUX0JSSz15CkNPTkZJR19GTEFUTUVNPXkKQ09ORklHX1NQTElUX1BUTE9DS19D
UFVTPTQKQ09ORklHX0NPTVBBQ1RJT049eQpDT05GSUdfUEFHRV9SRVBPUlRJTkc9eQpDT05GSUdf
TUlHUkFUSU9OPXkKQ09ORklHX01NVV9OT1RJRklFUj15CkNPTkZJR19LU009eQpDT05GSUdfREVG
QVVMVF9NTUFQX01JTl9BRERSPTQwOTYKQ09ORklHX05FRURfUEVSX0NQVV9LTT15CiMgQ09ORklH
X0NNQSBpcyBub3Qgc2V0CiMgQ09ORklHX0lETEVfUEFHRV9UUkFDS0lORyBpcyBub3Qgc2V0CkNP
TkZJR19ITU1fTUlSUk9SPXkKQ09ORklHX1ZNX0VWRU5UX0NPVU5URVJTPXkKQ09ORklHX1BFUkNQ
VV9TVEFUUz15CkNPTkZJR19HVVBfVEVTVD15CkNPTkZJR19BTk9OX1ZNQV9OQU1FPXkKQ09ORklH
X1VTRVJGQVVMVEZEPXkKCiMKIyBEYXRhIEFjY2VzcyBNb25pdG9yaW5nCiMKIyBDT05GSUdfREFN
T04gaXMgbm90IHNldAojIGVuZCBvZiBEYXRhIEFjY2VzcyBNb25pdG9yaW5nCiMgZW5kIG9mIE1l
bW9yeSBNYW5hZ2VtZW50IG9wdGlvbnMKCkNPTkZJR19ORVQ9eQpDT05GSUdfTkVUX0lOR1JFU1M9
eQpDT05GSUdfU0tCX0VYVEVOU0lPTlM9eQoKIwojIE5ldHdvcmtpbmcgb3B0aW9ucwojCiMgQ09O
RklHX1BBQ0tFVCBpcyBub3Qgc2V0CkNPTkZJR19VTklYPXkKQ09ORklHX1VOSVhfU0NNPXkKQ09O
RklHX0FGX1VOSVhfT09CPXkKQ09ORklHX1VOSVhfRElBRz15CiMgQ09ORklHX1RMUyBpcyBub3Qg
c2V0CkNPTkZJR19YRlJNPXkKQ09ORklHX1hGUk1fT0ZGTE9BRD15CkNPTkZJR19YRlJNX0FMR089
eQojIENPTkZJR19YRlJNX1VTRVIgaXMgbm90IHNldAojIENPTkZJR19YRlJNX0lOVEVSRkFDRSBp
cyBub3Qgc2V0CkNPTkZJR19YRlJNX1NVQl9QT0xJQ1k9eQpDT05GSUdfWEZSTV9NSUdSQVRFPXkK
IyBDT05GSUdfWEZSTV9TVEFUSVNUSUNTIGlzIG5vdCBzZXQKQ09ORklHX1hGUk1fQUg9eQpDT05G
SUdfWEZSTV9FU1A9eQpDT05GSUdfTkVUX0tFWT15CkNPTkZJR19ORVRfS0VZX01JR1JBVEU9eQpD
T05GSUdfWEZSTV9FU1BJTlRDUD15CkNPTkZJR19TTUM9eQpDT05GSUdfU01DX0RJQUc9eQpDT05G
SUdfSU5FVD15CiMgQ09ORklHX0lQX01VTFRJQ0FTVCBpcyBub3Qgc2V0CkNPTkZJR19JUF9BRFZB
TkNFRF9ST1VURVI9eQpDT05GSUdfSVBfRklCX1RSSUVfU1RBVFM9eQojIENPTkZJR19JUF9NVUxU
SVBMRV9UQUJMRVMgaXMgbm90IHNldAojIENPTkZJR19JUF9ST1VURV9NVUxUSVBBVEggaXMgbm90
IHNldAojIENPTkZJR19JUF9ST1VURV9WRVJCT1NFIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBfUE5Q
IGlzIG5vdCBzZXQKQ09ORklHX05FVF9JUElQPXkKQ09ORklHX05FVF9JUEdSRV9ERU1VWD15CkNP
TkZJR19ORVRfSVBfVFVOTkVMPXkKQ09ORklHX05FVF9JUEdSRT15CiMgQ09ORklHX1NZTl9DT09L
SUVTIGlzIG5vdCBzZXQKQ09ORklHX05FVF9JUFZUST15CkNPTkZJR19ORVRfVURQX1RVTk5FTD15
CkNPTkZJR19ORVRfRk9VPXkKQ09ORklHX05FVF9GT1VfSVBfVFVOTkVMUz15CkNPTkZJR19JTkVU
X0FIPXkKQ09ORklHX0lORVRfRVNQPXkKQ09ORklHX0lORVRfRVNQX09GRkxPQUQ9eQojIENPTkZJ
R19JTkVUX0VTUElOVENQIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5FVF9JUENPTVAgaXMgbm90IHNl
dApDT05GSUdfSU5FVF9UVU5ORUw9eQpDT05GSUdfSU5FVF9ESUFHPXkKQ09ORklHX0lORVRfVENQ
X0RJQUc9eQojIENPTkZJR19JTkVUX1VEUF9ESUFHIGlzIG5vdCBzZXQKQ09ORklHX0lORVRfUkFX
X0RJQUc9eQojIENPTkZJR19JTkVUX0RJQUdfREVTVFJPWSBpcyBub3Qgc2V0CiMgQ09ORklHX1RD
UF9DT05HX0FEVkFOQ0VEIGlzIG5vdCBzZXQKQ09ORklHX1RDUF9DT05HX0NVQklDPXkKQ09ORklH
X0RFRkFVTFRfVENQX0NPTkc9ImN1YmljIgpDT05GSUdfVENQX01ENVNJRz15CkNPTkZJR19JUFY2
PXkKIyBDT05GSUdfSVBWNl9ST1VURVJfUFJFRiBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVjZfT1BU
SU1JU1RJQ19EQUQgaXMgbm90IHNldApDT05GSUdfSU5FVDZfQUg9eQpDT05GSUdfSU5FVDZfRVNQ
PXkKQ09ORklHX0lORVQ2X0VTUF9PRkZMT0FEPXkKQ09ORklHX0lORVQ2X0VTUElOVENQPXkKIyBD
T05GSUdfSU5FVDZfSVBDT01QIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9NSVA2IGlzIG5vdCBz
ZXQKQ09ORklHX0lQVjZfSUxBPXkKQ09ORklHX0lORVQ2X1RVTk5FTD15CiMgQ09ORklHX0lQVjZf
VlRJIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9TSVQgaXMgbm90IHNldApDT05GSUdfSVBWNl9U
VU5ORUw9eQojIENPTkZJR19JUFY2X0dSRSBpcyBub3Qgc2V0CkNPTkZJR19JUFY2X0ZPVT15CkNP
TkZJR19JUFY2X0ZPVV9UVU5ORUw9eQpDT05GSUdfSVBWNl9NVUxUSVBMRV9UQUJMRVM9eQpDT05G
SUdfSVBWNl9TVUJUUkVFUz15CiMgQ09ORklHX0lQVjZfTVJPVVRFIGlzIG5vdCBzZXQKQ09ORklH
X0lQVjZfU0VHNl9MV1RVTk5FTD15CkNPTkZJR19JUFY2X1NFRzZfSE1BQz15CkNPTkZJR19JUFY2
X1NFRzZfQlBGPXkKQ09ORklHX0lQVjZfUlBMX0xXVFVOTkVMPXkKQ09ORklHX0lQVjZfSU9BTTZf
TFdUVU5ORUw9eQpDT05GSUdfTVBUQ1A9eQpDT05GSUdfSU5FVF9NUFRDUF9ESUFHPXkKQ09ORklH
X01QVENQX0lQVjY9eQojIENPTkZJR19ORVRXT1JLX1NFQ01BUksgaXMgbm90IHNldAojIENPTkZJ
R19ORVRXT1JLX1BIWV9USU1FU1RBTVBJTkcgaXMgbm90IHNldApDT05GSUdfTkVURklMVEVSPXkK
IyBDT05GSUdfTkVURklMVEVSX0FEVkFOQ0VEIGlzIG5vdCBzZXQKCiMKIyBDb3JlIE5ldGZpbHRl
ciBDb25maWd1cmF0aW9uCiMKQ09ORklHX05FVEZJTFRFUl9JTkdSRVNTPXkKIyBDT05GSUdfTkVU
RklMVEVSX0VHUkVTUyBpcyBub3Qgc2V0CkNPTkZJR19ORVRGSUxURVJfTkVUTElOSz15CkNPTkZJ
R19ORVRGSUxURVJfRkFNSUxZX0JSSURHRT15CkNPTkZJR19ORVRGSUxURVJfRkFNSUxZX0FSUD15
CkNPTkZJR19ORVRGSUxURVJfTkVUTElOS19MT0c9eQpDT05GSUdfTkZfQ09OTlRSQUNLPXkKQ09O
RklHX05GX0xPR19TWVNMT0c9eQojIENPTkZJR19ORl9DT05OVFJBQ0tfUFJPQ0ZTIGlzIG5vdCBz
ZXQKQ09ORklHX05GX0NPTk5UUkFDS19MQUJFTFM9eQpDT05GSUdfTkZfQ09OTlRSQUNLX0ZUUD15
CkNPTkZJR19ORl9DT05OVFJBQ0tfSVJDPXkKQ09ORklHX05GX0NPTk5UUkFDS19CUk9BRENBU1Q9
eQpDT05GSUdfTkZfQ09OTlRSQUNLX05FVEJJT1NfTlM9eQpDT05GSUdfTkZfQ09OTlRSQUNLX1NJ
UD15CkNPTkZJR19ORl9DVF9ORVRMSU5LPXkKQ09ORklHX05FVEZJTFRFUl9ORVRMSU5LX0dMVUVf
Q1Q9eQpDT05GSUdfTkZfTkFUPXkKQ09ORklHX05GX05BVF9GVFA9eQpDT05GSUdfTkZfTkFUX0lS
Qz15CkNPTkZJR19ORl9OQVRfU0lQPXkKQ09ORklHX05GX05BVF9SRURJUkVDVD15CkNPTkZJR19O
Rl9OQVRfTUFTUVVFUkFERT15CkNPTkZJR19ORl9UQUJMRVM9eQojIENPTkZJR19ORl9UQUJMRVNf
SU5FVCBpcyBub3Qgc2V0CkNPTkZJR19ORl9UQUJMRVNfTkVUREVWPXkKQ09ORklHX05GVF9OVU1H
RU49eQojIENPTkZJR19ORlRfQ1QgaXMgbm90IHNldAojIENPTkZJR19ORlRfRkxPV19PRkZMT0FE
IGlzIG5vdCBzZXQKQ09ORklHX05GVF9MT0c9eQpDT05GSUdfTkZUX0xJTUlUPXkKQ09ORklHX05G
VF9NQVNRPXkKQ09ORklHX05GVF9SRURJUj15CkNPTkZJR19ORlRfTkFUPXkKQ09ORklHX05GVF9U
VU5ORUw9eQpDT05GSUdfTkZUX09CSlJFRj15CkNPTkZJR19ORlRfUVVPVEE9eQojIENPTkZJR19O
RlRfUkVKRUNUIGlzIG5vdCBzZXQKQ09ORklHX05GVF9DT01QQVQ9eQpDT05GSUdfTkZUX0hBU0g9
eQojIENPTkZJR19ORlRfWEZSTSBpcyBub3Qgc2V0CiMgQ09ORklHX05GVF9TT0NLRVQgaXMgbm90
IHNldApDT05GSUdfTkZUX1RQUk9YWT15CkNPTkZJR19ORl9EVVBfTkVUREVWPXkKQ09ORklHX05G
VF9EVVBfTkVUREVWPXkKQ09ORklHX05GVF9GV0RfTkVUREVWPXkKQ09ORklHX05GX0ZMT1dfVEFC
TEVfSU5FVD15CkNPTkZJR19ORl9GTE9XX1RBQkxFPXkKQ09ORklHX05FVEZJTFRFUl9YVEFCTEVT
PXkKCiMKIyBYdGFibGVzIGNvbWJpbmVkIG1vZHVsZXMKIwojIENPTkZJR19ORVRGSUxURVJfWFRf
TUFSSyBpcyBub3Qgc2V0CgojCiMgWHRhYmxlcyB0YXJnZXRzCiMKQ09ORklHX05FVEZJTFRFUl9Y
VF9UQVJHRVRfTE9HPXkKQ09ORklHX05FVEZJTFRFUl9YVF9OQVQ9eQpDT05GSUdfTkVURklMVEVS
X1hUX1RBUkdFVF9ORVRNQVA9eQpDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9ORkxPRz15CiMg
Q09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfUkVESVJFQ1QgaXMgbm90IHNldApDT05GSUdfTkVU
RklMVEVSX1hUX1RBUkdFVF9NQVNRVUVSQURFPXkKQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRf
VENQTVNTPXkKCiMKIyBYdGFibGVzIG1hdGNoZXMKIwpDT05GSUdfTkVURklMVEVSX1hUX01BVENI
X0FERFJUWVBFPXkKIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0NPTk5UUkFDSyBpcyBub3Qg
c2V0CiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9QT0xJQ1kgaXMgbm90IHNldAojIENPTkZJ
R19ORVRGSUxURVJfWFRfTUFUQ0hfU1RBVEUgaXMgbm90IHNldAojIGVuZCBvZiBDb3JlIE5ldGZp
bHRlciBDb25maWd1cmF0aW9uCgojIENPTkZJR19JUF9TRVQgaXMgbm90IHNldApDT05GSUdfSVBf
VlM9eQojIENPTkZJR19JUF9WU19JUFY2IGlzIG5vdCBzZXQKIyBDT05GSUdfSVBfVlNfREVCVUcg
aXMgbm90IHNldApDT05GSUdfSVBfVlNfVEFCX0JJVFM9MTIKCiMKIyBJUFZTIHRyYW5zcG9ydCBw
cm90b2NvbCBsb2FkIGJhbGFuY2luZyBzdXBwb3J0CiMKIyBDT05GSUdfSVBfVlNfUFJPVE9fVENQ
IGlzIG5vdCBzZXQKQ09ORklHX0lQX1ZTX1BST1RPX1VEUD15CiMgQ09ORklHX0lQX1ZTX1BST1RP
X0VTUCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX1ZTX1BST1RPX0FIIGlzIG5vdCBzZXQKIyBDT05G
SUdfSVBfVlNfUFJPVE9fU0NUUCBpcyBub3Qgc2V0CgojCiMgSVBWUyBzY2hlZHVsZXIKIwojIENP
TkZJR19JUF9WU19SUiBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX1ZTX1dSUiBpcyBub3Qgc2V0CkNP
TkZJR19JUF9WU19MQz15CkNPTkZJR19JUF9WU19XTEM9eQojIENPTkZJR19JUF9WU19GTyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lQX1ZTX09WRiBpcyBub3Qgc2V0CkNPTkZJR19JUF9WU19MQkxDPXkK
Q09ORklHX0lQX1ZTX0xCTENSPXkKQ09ORklHX0lQX1ZTX0RIPXkKQ09ORklHX0lQX1ZTX1NIPXkK
IyBDT05GSUdfSVBfVlNfTUggaXMgbm90IHNldAojIENPTkZJR19JUF9WU19TRUQgaXMgbm90IHNl
dAojIENPTkZJR19JUF9WU19OUSBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX1ZTX1RXT1MgaXMgbm90
IHNldAoKIwojIElQVlMgU0ggc2NoZWR1bGVyCiMKQ09ORklHX0lQX1ZTX1NIX1RBQl9CSVRTPTgK
CiMKIyBJUFZTIE1IIHNjaGVkdWxlcgojCkNPTkZJR19JUF9WU19NSF9UQUJfSU5ERVg9MTIKCiMK
IyBJUFZTIGFwcGxpY2F0aW9uIGhlbHBlcgojCkNPTkZJR19JUF9WU19ORkNUPXkKIyBDT05GSUdf
SVBfVlNfUEVfU0lQIGlzIG5vdCBzZXQKCiMKIyBJUDogTmV0ZmlsdGVyIENvbmZpZ3VyYXRpb24K
IwpDT05GSUdfTkZfREVGUkFHX0lQVjQ9eQpDT05GSUdfTkZfU09DS0VUX0lQVjQ9eQpDT05GSUdf
TkZfVFBST1hZX0lQVjQ9eQojIENPTkZJR19ORl9UQUJMRVNfSVBWNCBpcyBub3Qgc2V0CkNPTkZJ
R19ORl9UQUJMRVNfQVJQPXkKQ09ORklHX05GX0RVUF9JUFY0PXkKQ09ORklHX05GX0xPR19BUlA9
eQpDT05GSUdfTkZfTE9HX0lQVjQ9eQpDT05GSUdfTkZfUkVKRUNUX0lQVjQ9eQpDT05GSUdfSVBf
TkZfSVBUQUJMRVM9eQpDT05GSUdfSVBfTkZfRklMVEVSPXkKIyBDT05GSUdfSVBfTkZfVEFSR0VU
X1JFSkVDVCBpcyBub3Qgc2V0CkNPTkZJR19JUF9ORl9OQVQ9eQojIENPTkZJR19JUF9ORl9UQVJH
RVRfTUFTUVVFUkFERSBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX05GX01BTkdMRSBpcyBub3Qgc2V0
CiMgQ09ORklHX0lQX05GX1JBVyBpcyBub3Qgc2V0CiMgZW5kIG9mIElQOiBOZXRmaWx0ZXIgQ29u
ZmlndXJhdGlvbgoKIwojIElQdjY6IE5ldGZpbHRlciBDb25maWd1cmF0aW9uCiMKQ09ORklHX05G
X1NPQ0tFVF9JUFY2PXkKQ09ORklHX05GX1RQUk9YWV9JUFY2PXkKQ09ORklHX05GX1RBQkxFU19J
UFY2PXkKIyBDT05GSUdfTkZUX0RVUF9JUFY2IGlzIG5vdCBzZXQKIyBDT05GSUdfTkZUX0ZJQl9J
UFY2IGlzIG5vdCBzZXQKIyBDT05GSUdfTkZfRFVQX0lQVjYgaXMgbm90IHNldApDT05GSUdfTkZf
UkVKRUNUX0lQVjY9eQpDT05GSUdfTkZfTE9HX0lQVjY9eQojIENPTkZJR19JUDZfTkZfSVBUQUJM
RVMgaXMgbm90IHNldAojIGVuZCBvZiBJUHY2OiBOZXRmaWx0ZXIgQ29uZmlndXJhdGlvbgoKQ09O
RklHX05GX0RFRlJBR19JUFY2PXkKIyBDT05GSUdfTkZfVEFCTEVTX0JSSURHRSBpcyBub3Qgc2V0
CkNPTkZJR19ORl9DT05OVFJBQ0tfQlJJREdFPXkKQ09ORklHX0JSSURHRV9ORl9FQlRBQkxFUz15
CkNPTkZJR19CUklER0VfRUJUX0JST1VURT15CiMgQ09ORklHX0JSSURHRV9FQlRfVF9GSUxURVIg
aXMgbm90IHNldApDT05GSUdfQlJJREdFX0VCVF9UX05BVD15CkNPTkZJR19CUklER0VfRUJUXzgw
Ml8zPXkKQ09ORklHX0JSSURHRV9FQlRfQU1PTkc9eQpDT05GSUdfQlJJREdFX0VCVF9BUlA9eQpD
T05GSUdfQlJJREdFX0VCVF9JUD15CkNPTkZJR19CUklER0VfRUJUX0lQNj15CkNPTkZJR19CUklE
R0VfRUJUX0xJTUlUPXkKQ09ORklHX0JSSURHRV9FQlRfTUFSSz15CiMgQ09ORklHX0JSSURHRV9F
QlRfUEtUVFlQRSBpcyBub3Qgc2V0CkNPTkZJR19CUklER0VfRUJUX1NUUD15CiMgQ09ORklHX0JS
SURHRV9FQlRfVkxBTiBpcyBub3Qgc2V0CiMgQ09ORklHX0JSSURHRV9FQlRfQVJQUkVQTFkgaXMg
bm90IHNldApDT05GSUdfQlJJREdFX0VCVF9ETkFUPXkKIyBDT05GSUdfQlJJREdFX0VCVF9NQVJL
X1QgaXMgbm90IHNldApDT05GSUdfQlJJREdFX0VCVF9SRURJUkVDVD15CkNPTkZJR19CUklER0Vf
RUJUX1NOQVQ9eQojIENPTkZJR19CUklER0VfRUJUX0xPRyBpcyBub3Qgc2V0CkNPTkZJR19CUklE
R0VfRUJUX05GTE9HPXkKIyBDT05GSUdfQlBGSUxURVIgaXMgbm90IHNldAojIENPTkZJR19JUF9E
Q0NQIGlzIG5vdCBzZXQKQ09ORklHX0lQX1NDVFA9eQojIENPTkZJR19TQ1RQX0RCR19PQkpDTlQg
aXMgbm90IHNldApDT05GSUdfU0NUUF9ERUZBVUxUX0NPT0tJRV9ITUFDX01ENT15CiMgQ09ORklH
X1NDVFBfREVGQVVMVF9DT09LSUVfSE1BQ19TSEExIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NUUF9E
RUZBVUxUX0NPT0tJRV9ITUFDX05PTkUgaXMgbm90IHNldApDT05GSUdfU0NUUF9DT09LSUVfSE1B
Q19NRDU9eQpDT05GSUdfU0NUUF9DT09LSUVfSE1BQ19TSEExPXkKQ09ORklHX0lORVRfU0NUUF9E
SUFHPXkKIyBDT05GSUdfUkRTIGlzIG5vdCBzZXQKIyBDT05GSUdfVElQQyBpcyBub3Qgc2V0CiMg
Q09ORklHX0FUTSBpcyBub3Qgc2V0CkNPTkZJR19MMlRQPXkKQ09ORklHX0wyVFBfREVCVUdGUz15
CkNPTkZJR19MMlRQX1YzPXkKIyBDT05GSUdfTDJUUF9JUCBpcyBub3Qgc2V0CiMgQ09ORklHX0wy
VFBfRVRIIGlzIG5vdCBzZXQKQ09ORklHX1NUUD15CkNPTkZJR19HQVJQPXkKQ09ORklHX01SUD15
CkNPTkZJR19CUklER0U9eQojIENPTkZJR19CUklER0VfSUdNUF9TTk9PUElORyBpcyBub3Qgc2V0
CiMgQ09ORklHX0JSSURHRV9WTEFOX0ZJTFRFUklORyBpcyBub3Qgc2V0CiMgQ09ORklHX0JSSURH
RV9NUlAgaXMgbm90IHNldApDT05GSUdfQlJJREdFX0NGTT15CkNPTkZJR19ORVRfRFNBPXkKQ09O
RklHX05FVF9EU0FfVEFHX0FSOTMzMT15CkNPTkZJR19ORVRfRFNBX1RBR19CUkNNX0NPTU1PTj15
CkNPTkZJR19ORVRfRFNBX1RBR19CUkNNPXkKQ09ORklHX05FVF9EU0FfVEFHX0JSQ01fTEVHQUNZ
PXkKQ09ORklHX05FVF9EU0FfVEFHX0JSQ01fUFJFUEVORD15CkNPTkZJR19ORVRfRFNBX1RBR19I
RUxMQ1JFRUs9eQpDT05GSUdfTkVUX0RTQV9UQUdfR1NXSVA9eQpDT05GSUdfTkVUX0RTQV9UQUdf
RFNBX0NPTU1PTj15CkNPTkZJR19ORVRfRFNBX1RBR19EU0E9eQpDT05GSUdfTkVUX0RTQV9UQUdf
RURTQT15CiMgQ09ORklHX05FVF9EU0FfVEFHX01USyBpcyBub3Qgc2V0CkNPTkZJR19ORVRfRFNB
X1RBR19LU1o9eQojIENPTkZJR19ORVRfRFNBX1RBR19PQ0VMT1QgaXMgbm90IHNldApDT05GSUdf
TkVUX0RTQV9UQUdfT0NFTE9UXzgwMjFRPXkKQ09ORklHX05FVF9EU0FfVEFHX1FDQT15CkNPTkZJ
R19ORVRfRFNBX1RBR19SVEw0X0E9eQpDT05GSUdfTkVUX0RTQV9UQUdfUlRMOF80PXkKQ09ORklH
X05FVF9EU0FfVEFHX0xBTjkzMDM9eQpDT05GSUdfTkVUX0RTQV9UQUdfU0pBMTEwNT15CkNPTkZJ
R19ORVRfRFNBX1RBR19UUkFJTEVSPXkKQ09ORklHX05FVF9EU0FfVEFHX1hSUzcwMFg9eQpDT05G
SUdfVkxBTl84MDIxUT15CkNPTkZJR19WTEFOXzgwMjFRX0dWUlA9eQpDT05GSUdfVkxBTl84MDIx
UV9NVlJQPXkKQ09ORklHX0RFQ05FVD15CiMgQ09ORklHX0RFQ05FVF9ST1VURVIgaXMgbm90IHNl
dApDT05GSUdfTExDPXkKQ09ORklHX0xMQzI9eQpDT05GSUdfQVRBTEs9eQpDT05GSUdfREVWX0FQ
UExFVEFMSz15CkNPTkZJR19JUEREUD15CkNPTkZJR19JUEREUF9FTkNBUD15CkNPTkZJR19YMjU9
eQpDT05GSUdfTEFQQj15CkNPTkZJR19QSE9ORVQ9eQpDT05GSUdfNkxPV1BBTj15CkNPTkZJR182
TE9XUEFOX0RFQlVHRlM9eQpDT05GSUdfNkxPV1BBTl9OSEM9eQojIENPTkZJR182TE9XUEFOX05I
Q19ERVNUIGlzIG5vdCBzZXQKQ09ORklHXzZMT1dQQU5fTkhDX0ZSQUdNRU5UPXkKQ09ORklHXzZM
T1dQQU5fTkhDX0hPUD15CkNPTkZJR182TE9XUEFOX05IQ19JUFY2PXkKQ09ORklHXzZMT1dQQU5f
TkhDX01PQklMSVRZPXkKIyBDT05GSUdfNkxPV1BBTl9OSENfUk9VVElORyBpcyBub3Qgc2V0CiMg
Q09ORklHXzZMT1dQQU5fTkhDX1VEUCBpcyBub3Qgc2V0CkNPTkZJR182TE9XUEFOX0dIQ19FWFRf
SERSX0hPUD15CkNPTkZJR182TE9XUEFOX0dIQ19VRFA9eQpDT05GSUdfNkxPV1BBTl9HSENfSUNN
UFY2PXkKIyBDT05GSUdfNkxPV1BBTl9HSENfRVhUX0hEUl9ERVNUIGlzIG5vdCBzZXQKIyBDT05G
SUdfNkxPV1BBTl9HSENfRVhUX0hEUl9GUkFHIGlzIG5vdCBzZXQKIyBDT05GSUdfNkxPV1BBTl9H
SENfRVhUX0hEUl9ST1VURSBpcyBub3Qgc2V0CkNPTkZJR19JRUVFODAyMTU0PXkKIyBDT05GSUdf
SUVFRTgwMjE1NF9OTDgwMjE1NF9FWFBFUklNRU5UQUwgaXMgbm90IHNldApDT05GSUdfSUVFRTgw
MjE1NF9TT0NLRVQ9eQojIENPTkZJR19JRUVFODAyMTU0XzZMT1dQQU4gaXMgbm90IHNldApDT05G
SUdfTUFDODAyMTU0PXkKIyBDT05GSUdfTkVUX1NDSEVEIGlzIG5vdCBzZXQKQ09ORklHX0RDQj15
CkNPTkZJR19ETlNfUkVTT0xWRVI9eQpDT05GSUdfQkFUTUFOX0FEVj15CiMgQ09ORklHX0JBVE1B
Tl9BRFZfQkFUTUFOX1YgaXMgbm90IHNldAojIENPTkZJR19CQVRNQU5fQURWX0JMQSBpcyBub3Qg
c2V0CkNPTkZJR19CQVRNQU5fQURWX0RBVD15CiMgQ09ORklHX0JBVE1BTl9BRFZfTkMgaXMgbm90
IHNldAojIENPTkZJR19CQVRNQU5fQURWX01DQVNUIGlzIG5vdCBzZXQKQ09ORklHX0JBVE1BTl9B
RFZfREVCVUc9eQpDT05GSUdfQkFUTUFOX0FEVl9UUkFDSU5HPXkKQ09ORklHX09QRU5WU1dJVENI
PXkKQ09ORklHX09QRU5WU1dJVENIX0dSRT15CkNPTkZJR19WU09DS0VUUz15CkNPTkZJR19WU09D
S0VUU19ESUFHPXkKQ09ORklHX1ZTT0NLRVRTX0xPT1BCQUNLPXkKQ09ORklHX1ZJUlRJT19WU09D
S0VUUz15CkNPTkZJR19WSVJUSU9fVlNPQ0tFVFNfQ09NTU9OPXkKIyBDT05GSUdfTkVUTElOS19E
SUFHIGlzIG5vdCBzZXQKQ09ORklHX01QTFM9eQpDT05GSUdfTkVUX01QTFNfR1NPPXkKIyBDT05G
SUdfTVBMU19ST1VUSU5HIGlzIG5vdCBzZXQKQ09ORklHX05FVF9OU0g9eQpDT05GSUdfSFNSPXkK
Q09ORklHX05FVF9TV0lUQ0hERVY9eQpDT05GSUdfTkVUX0wzX01BU1RFUl9ERVY9eQpDT05GSUdf
UVJUUj15CiMgQ09ORklHX1FSVFJfU01EIGlzIG5vdCBzZXQKQ09ORklHX1FSVFJfVFVOPXkKIyBD
T05GSUdfUVJUUl9NSEkgaXMgbm90IHNldAojIENPTkZJR19ORVRfTkNTSSBpcyBub3Qgc2V0CiMg
Q09ORklHX0NHUk9VUF9ORVRfUFJJTyBpcyBub3Qgc2V0CkNPTkZJR19DR1JPVVBfTkVUX0NMQVNT
SUQ9eQpDT05GSUdfTkVUX1JYX0JVU1lfUE9MTD15CkNPTkZJR19CUUw9eQoKIwojIE5ldHdvcmsg
dGVzdGluZwojCkNPTkZJR19ORVRfUEtUR0VOPXkKQ09ORklHX05FVF9EUk9QX01PTklUT1I9eQoj
IGVuZCBvZiBOZXR3b3JrIHRlc3RpbmcKIyBlbmQgb2YgTmV0d29ya2luZyBvcHRpb25zCgpDT05G
SUdfSEFNUkFESU89eQoKIwojIFBhY2tldCBSYWRpbyBwcm90b2NvbHMKIwpDT05GSUdfQVgyNT15
CiMgQ09ORklHX0FYMjVfREFNQV9TTEFWRSBpcyBub3Qgc2V0CkNPTkZJR19ORVRST009eQpDT05G
SUdfUk9TRT15CgojCiMgQVguMjUgbmV0d29yayBkZXZpY2UgZHJpdmVycwojCkNPTkZJR19NS0lT
Uz15CkNPTkZJR182UEFDSz15CkNPTkZJR19CUFFFVEhFUj15CkNPTkZJR19CQVlDT01fU0VSX0ZE
WD15CkNPTkZJR19CQVlDT01fU0VSX0hEWD15CkNPTkZJR19CQVlDT01fUEFSPXkKIyBDT05GSUdf
QkFZQ09NX0VQUCBpcyBub3Qgc2V0CiMgQ09ORklHX1lBTSBpcyBub3Qgc2V0CiMgZW5kIG9mIEFY
LjI1IG5ldHdvcmsgZGV2aWNlIGRyaXZlcnMKCkNPTkZJR19DQU49eQpDT05GSUdfQ0FOX1JBVz15
CkNPTkZJR19DQU5fQkNNPXkKIyBDT05GSUdfQ0FOX0dXIGlzIG5vdCBzZXQKQ09ORklHX0NBTl9K
MTkzOT15CiMgQ09ORklHX0NBTl9JU09UUCBpcyBub3Qgc2V0CgojCiMgQ0FOIERldmljZSBEcml2
ZXJzCiMKQ09ORklHX0NBTl9WQ0FOPXkKQ09ORklHX0NBTl9WWENBTj15CkNPTkZJR19DQU5fU0xD
QU49eQpDT05GSUdfQ0FOX0RFVj15CiMgQ09ORklHX0NBTl9DQUxDX0JJVFRJTUlORyBpcyBub3Qg
c2V0CiMgQ09ORklHX0NBTl9BVDkxIGlzIG5vdCBzZXQKQ09ORklHX0NBTl9GTEVYQ0FOPXkKIyBD
T05GSUdfQ0FOX0dSQ0FOIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FOX1NVTjRJIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ0FOX1hJTElOWENBTiBpcyBub3Qgc2V0CkNPTkZJR19DQU5fQ19DQU49eQojIENP
TkZJR19DQU5fQ19DQU5fUExBVEZPUk0gaXMgbm90IHNldAojIENPTkZJR19DQU5fQ0M3NzAgaXMg
bm90IHNldAojIENPTkZJR19DQU5fQ1RVQ0FORkQgaXMgbm90IHNldAojIENPTkZJR19DQU5fQ1RV
Q0FORkRfUExBVEZPUk0gaXMgbm90IHNldApDT05GSUdfQ0FOX0lGSV9DQU5GRD15CkNPTkZJR19D
QU5fTV9DQU49eQpDT05GSUdfQ0FOX01fQ0FOX1BMQVRGT1JNPXkKQ09ORklHX0NBTl9NX0NBTl9U
Q0FONFg1WD15CiMgQ09ORklHX0NBTl9SQ0FSIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FOX1JDQVJf
Q0FORkQgaXMgbm90IHNldAojIENPTkZJR19DQU5fU0pBMTAwMCBpcyBub3Qgc2V0CkNPTkZJR19D
QU5fU09GVElORz15CgojCiMgQ0FOIFNQSSBpbnRlcmZhY2VzCiMKQ09ORklHX0NBTl9ISTMxMVg9
eQojIENPTkZJR19DQU5fTUNQMjUxWCBpcyBub3Qgc2V0CkNPTkZJR19DQU5fTUNQMjUxWEZEPXkK
Q09ORklHX0NBTl9NQ1AyNTFYRkRfU0FOSVRZPXkKIyBlbmQgb2YgQ0FOIFNQSSBpbnRlcmZhY2Vz
CgojIENPTkZJR19DQU5fREVCVUdfREVWSUNFUyBpcyBub3Qgc2V0CiMgZW5kIG9mIENBTiBEZXZp
Y2UgRHJpdmVycwoKIyBDT05GSUdfQlQgaXMgbm90IHNldApDT05GSUdfQUZfUlhSUEM9eQpDT05G
SUdfQUZfUlhSUENfSVBWNj15CkNPTkZJR19BRl9SWFJQQ19JTkpFQ1RfTE9TUz15CkNPTkZJR19B
Rl9SWFJQQ19ERUJVRz15CiMgQ09ORklHX1JYS0FEIGlzIG5vdCBzZXQKIyBDT05GSUdfQUZfS0NN
IGlzIG5vdCBzZXQKQ09ORklHX1NUUkVBTV9QQVJTRVI9eQpDT05GSUdfTUNUUD15CkNPTkZJR19N
Q1RQX0ZMT1dTPXkKQ09ORklHX0ZJQl9SVUxFUz15CkNPTkZJR19XSVJFTEVTUz15CkNPTkZJR19X
SVJFTEVTU19FWFQ9eQpDT05GSUdfV0VYVF9DT1JFPXkKQ09ORklHX1dFWFRfUFJPQz15CkNPTkZJ
R19XRVhUX1NQWT15CkNPTkZJR19DRkc4MDIxMT15CiMgQ09ORklHX05MODAyMTFfVEVTVE1PREUg
aXMgbm90IHNldApDT05GSUdfQ0ZHODAyMTFfREVWRUxPUEVSX1dBUk5JTkdTPXkKQ09ORklHX0NG
RzgwMjExX1JFUVVJUkVfU0lHTkVEX1JFR0RCPXkKQ09ORklHX0NGRzgwMjExX1VTRV9LRVJORUxf
UkVHREJfS0VZUz15CkNPTkZJR19DRkc4MDIxMV9ERUZBVUxUX1BTPXkKQ09ORklHX0NGRzgwMjEx
X0RFQlVHRlM9eQpDT05GSUdfQ0ZHODAyMTFfQ1JEQV9TVVBQT1JUPXkKIyBDT05GSUdfQ0ZHODAy
MTFfV0VYVCBpcyBub3Qgc2V0CkNPTkZJR19MSUI4MDIxMT15CiMgQ09ORklHX0xJQjgwMjExX0RF
QlVHIGlzIG5vdCBzZXQKQ09ORklHX01BQzgwMjExPXkKQ09ORklHX01BQzgwMjExX0hBU19SQz15
CkNPTkZJR19NQUM4MDIxMV9SQ19NSU5TVFJFTD15CkNPTkZJR19NQUM4MDIxMV9SQ19ERUZBVUxU
X01JTlNUUkVMPXkKQ09ORklHX01BQzgwMjExX1JDX0RFRkFVTFQ9Im1pbnN0cmVsX2h0IgpDT05G
SUdfTUFDODAyMTFfTUVTSD15CiMgQ09ORklHX01BQzgwMjExX0xFRFMgaXMgbm90IHNldApDT05G
SUdfTUFDODAyMTFfREVCVUdGUz15CkNPTkZJR19NQUM4MDIxMV9NRVNTQUdFX1RSQUNJTkc9eQoj
IENPTkZJR19NQUM4MDIxMV9ERUJVR19NRU5VIGlzIG5vdCBzZXQKQ09ORklHX01BQzgwMjExX1NU
QV9IQVNIX01BWF9TSVpFPTAKQ09ORklHX1JGS0lMTD15CkNPTkZJR19SRktJTExfTEVEUz15CkNP
TkZJR19SRktJTExfSU5QVVQ9eQpDT05GSUdfUkZLSUxMX0dQSU89eQpDT05GSUdfTkVUXzlQPXkK
IyBDT05GSUdfTkVUXzlQX0ZEIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUXzlQX1ZJUlRJTyBpcyBu
b3Qgc2V0CkNPTkZJR19ORVRfOVBfREVCVUc9eQojIENPTkZJR19DQUlGIGlzIG5vdCBzZXQKQ09O
RklHX0NFUEhfTElCPXkKIyBDT05GSUdfQ0VQSF9MSUJfUFJFVFRZREVCVUcgaXMgbm90IHNldAoj
IENPTkZJR19DRVBIX0xJQl9VU0VfRE5TX1JFU09MVkVSIGlzIG5vdCBzZXQKQ09ORklHX05GQz15
CiMgQ09ORklHX05GQ19ESUdJVEFMIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZDX05DSSBpcyBub3Qg
c2V0CkNPTkZJR19ORkNfSENJPXkKQ09ORklHX05GQ19TSERMQz15CgojCiMgTmVhciBGaWVsZCBD
b21tdW5pY2F0aW9uIChORkMpIGRldmljZXMKIwpDT05GSUdfTkZDX1BONTQ0PXkKQ09ORklHX05G
Q19QTjU0NF9JMkM9eQpDT05GSUdfTkZDX1BONTMzPXkKQ09ORklHX05GQ19QTjUzM19JMkM9eQpD
T05GSUdfTkZDX1BONTMyX1VBUlQ9eQojIENPTkZJR19ORkNfTUlDUk9SRUFEX0kyQyBpcyBub3Qg
c2V0CkNPTkZJR19ORkNfU1QyMU5GQ0E9eQpDT05GSUdfTkZDX1NUMjFORkNBX0kyQz15CiMgZW5k
IG9mIE5lYXIgRmllbGQgQ29tbXVuaWNhdGlvbiAoTkZDKSBkZXZpY2VzCgojIENPTkZJR19QU0FN
UExFIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0lGRSBpcyBub3Qgc2V0CkNPTkZJR19MV1RVTk5F
TD15CkNPTkZJR19MV1RVTk5FTF9CUEY9eQpDT05GSUdfRFNUX0NBQ0hFPXkKQ09ORklHX0dST19D
RUxMUz15CkNPTkZJR19ORVRfU0VMRlRFU1RTPXkKQ09ORklHX05FVF9TT0NLX01TRz15CkNPTkZJ
R19ORVRfREVWTElOSz15CiMgQ09ORklHX0ZBSUxPVkVSIGlzIG5vdCBzZXQKQ09ORklHX0VUSFRP
T0xfTkVUTElOSz15CgojCiMgRGV2aWNlIERyaXZlcnMKIwojIENPTkZJR19QQ0NBUkQgaXMgbm90
IHNldAoKIwojIEdlbmVyaWMgRHJpdmVyIE9wdGlvbnMKIwpDT05GSUdfQVVYSUxJQVJZX0JVUz15
CkNPTkZJR19VRVZFTlRfSEVMUEVSPXkKQ09ORklHX1VFVkVOVF9IRUxQRVJfUEFUSD0iIgojIENP
TkZJR19ERVZUTVBGUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NUQU5EQUxPTkUgaXMgbm90IHNldApD
T05GSUdfUFJFVkVOVF9GSVJNV0FSRV9CVUlMRD15CgojCiMgRmlybXdhcmUgbG9hZGVyCiMKQ09O
RklHX0ZXX0xPQURFUj15CkNPTkZJR19GV19MT0FERVJfUEFHRURfQlVGPXkKQ09ORklHX0ZXX0xP
QURFUl9TWVNGUz15CkNPTkZJR19FWFRSQV9GSVJNV0FSRT0iIgpDT05GSUdfRldfTE9BREVSX1VT
RVJfSEVMUEVSPXkKIyBDT05GSUdfRldfTE9BREVSX1VTRVJfSEVMUEVSX0ZBTExCQUNLIGlzIG5v
dCBzZXQKQ09ORklHX0ZXX0xPQURFUl9DT01QUkVTUz15CkNPTkZJR19GV19MT0FERVJfQ09NUFJF
U1NfWFo9eQpDT05GSUdfRldfTE9BREVSX0NPTVBSRVNTX1pTVEQ9eQpDT05GSUdfRldfVVBMT0FE
PXkKIyBlbmQgb2YgRmlybXdhcmUgbG9hZGVyCgpDT05GSUdfV0FOVF9ERVZfQ09SRURVTVA9eQpD
T05GSUdfQUxMT1dfREVWX0NPUkVEVU1QPXkKQ09ORklHX0RFVl9DT1JFRFVNUD15CkNPTkZJR19E
RUJVR19EUklWRVI9eQojIENPTkZJR19ERUJVR19ERVZSRVMgaXMgbm90IHNldApDT05GSUdfREVC
VUdfVEVTVF9EUklWRVJfUkVNT1ZFPXkKQ09ORklHX0dFTkVSSUNfQ1BVX0RFVklDRVM9eQpDT05G
SUdfUkVHTUFQPXkKQ09ORklHX1JFR01BUF9JMkM9eQpDT05GSUdfUkVHTUFQX1NQST15CkNPTkZJ
R19SRUdNQVBfU1BNST15CkNPTkZJR19SRUdNQVBfTU1JTz15CkNPTkZJR19SRUdNQVBfSVJRPXkK
Q09ORklHX0RNQV9TSEFSRURfQlVGRkVSPXkKQ09ORklHX0RNQV9GRU5DRV9UUkFDRT15CiMgZW5k
IG9mIEdlbmVyaWMgRHJpdmVyIE9wdGlvbnMKCiMKIyBCdXMgZGV2aWNlcwojCiMgQ09ORklHX0FS
TV9JTlRFR1JBVE9SX0xNIGlzIG5vdCBzZXQKIyBDT05GSUdfQlQxX0FQQiBpcyBub3Qgc2V0CiMg
Q09ORklHX0JUMV9BWEkgaXMgbm90IHNldAojIENPTkZJR19NT1hURVQgaXMgbm90IHNldAojIENP
TkZJR19ISVNJTElDT05fTFBDIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfSVhQNFhYX0VCIGlz
IG5vdCBzZXQKIyBDT05GSUdfUUNPTV9FQkkyIGlzIG5vdCBzZXQKQ09ORklHX01ISV9CVVM9eQoj
IENPTkZJR19NSElfQlVTX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX01ISV9CVVNfRVA9eQojIGVu
ZCBvZiBCdXMgZGV2aWNlcwoKQ09ORklHX0NPTk5FQ1RPUj15CkNPTkZJR19QUk9DX0VWRU5UUz15
CgojCiMgRmlybXdhcmUgRHJpdmVycwojCgojCiMgQVJNIFN5c3RlbSBDb250cm9sIGFuZCBNYW5h
Z2VtZW50IEludGVyZmFjZSBQcm90b2NvbAojCiMgQ09ORklHX0FSTV9TQ01JX1BST1RPQ09MIGlz
IG5vdCBzZXQKQ09ORklHX0FSTV9TQ01JX1BPV0VSX0RPTUFJTj15CiMgZW5kIG9mIEFSTSBTeXN0
ZW0gQ29udHJvbCBhbmQgTWFuYWdlbWVudCBJbnRlcmZhY2UgUHJvdG9jb2wKCkNPTkZJR19BUk1f
U0NQSV9QT1dFUl9ET01BSU49eQojIENPTkZJR19CQ000N1hYX05WUkFNIGlzIG5vdCBzZXQKIyBD
T05GSUdfR09PR0xFX0ZJUk1XQVJFIGlzIG5vdCBzZXQKCiMKIyBUZWdyYSBmaXJtd2FyZSBkcml2
ZXIKIwojIGVuZCBvZiBUZWdyYSBmaXJtd2FyZSBkcml2ZXIKIyBlbmQgb2YgRmlybXdhcmUgRHJp
dmVycwoKQ09ORklHX0dOU1M9eQpDT05GSUdfR05TU19TRVJJQUw9eQpDT05GSUdfR05TU19NVEtf
U0VSSUFMPXkKQ09ORklHX0dOU1NfU0lSRl9TRVJJQUw9eQojIENPTkZJR19HTlNTX1VCWF9TRVJJ
QUwgaXMgbm90IHNldAojIENPTkZJR19NVEQgaXMgbm90IHNldAojIENPTkZJR19NVERfTkFORF9F
Q0NfTVhJQyBpcyBub3Qgc2V0CkNPTkZJR19EVEM9eQpDT05GSUdfT0Y9eQojIENPTkZJR19PRl9V
TklUVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX09GX0FMTF9EVEJTIGlzIG5vdCBzZXQKQ09ORklH
X09GX0ZMQVRUUkVFPXkKQ09ORklHX09GX0VBUkxZX0ZMQVRUUkVFPXkKQ09ORklHX09GX0tPQko9
eQpDT05GSUdfT0ZfRFlOQU1JQz15CkNPTkZJR19PRl9BRERSRVNTPXkKQ09ORklHX09GX0lSUT15
CkNPTkZJR19PRl9SRVNFUlZFRF9NRU09eQpDT05GSUdfT0ZfUkVTT0xWRT15CkNPTkZJR19PRl9P
VkVSTEFZPXkKQ09ORklHX1BBUlBPUlQ9eQpDT05GSUdfUEFSUE9SVF9BWDg4Nzk2PXkKIyBDT05G
SUdfUEFSUE9SVF8xMjg0IGlzIG5vdCBzZXQKQ09ORklHX1BBUlBPUlRfTk9UX1BDPXkKIyBDT05G
SUdfQkxLX0RFViBpcyBub3Qgc2V0CgojCiMgTlZNRSBTdXBwb3J0CiMKQ09ORklHX05WTUVfQ09S
RT15CkNPTkZJR19OVk1FX01VTFRJUEFUSD15CiMgQ09ORklHX05WTUVfVkVSQk9TRV9FUlJPUlMg
aXMgbm90IHNldApDT05GSUdfTlZNRV9GQUJSSUNTPXkKQ09ORklHX05WTUVfRkM9eQpDT05GSUdf
TlZNRV9UQ1A9eQojIENPTkZJR19OVk1FX1RBUkdFVCBpcyBub3Qgc2V0CiMgZW5kIG9mIE5WTUUg
U3VwcG9ydAoKIwojIE1pc2MgZGV2aWNlcwojCkNPTkZJR19TRU5TT1JTX0xJUzNMVjAyRD15CiMg
Q09ORklHX0FENTI1WF9EUE9UIGlzIG5vdCBzZXQKQ09ORklHX0RVTU1ZX0lSUT15CkNPTkZJR19J
Q1M5MzJTNDAxPXkKIyBDT05GSUdfQVRNRUxfU1NDIGlzIG5vdCBzZXQKQ09ORklHX0VOQ0xPU1VS
RV9TRVJWSUNFUz15CiMgQ09ORklHX0dFSENfQUNIQyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJNjQy
MVY2MDBfSVJRIGlzIG5vdCBzZXQKIyBDT05GSUdfUUNPTV9DT0lOQ0VMTCBpcyBub3Qgc2V0CiMg
Q09ORklHX1FDT01fRkFTVFJQQyBpcyBub3Qgc2V0CkNPTkZJR19BUERTOTgwMkFMUz15CkNPTkZJ
R19JU0wyOTAwMz15CiMgQ09ORklHX0lTTDI5MDIwIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNf
VFNMMjU1MD15CkNPTkZJR19TRU5TT1JTX0JIMTc3MD15CkNPTkZJR19TRU5TT1JTX0FQRFM5OTBY
PXkKIyBDT05GSUdfSE1DNjM1MiBpcyBub3Qgc2V0CiMgQ09ORklHX0RTMTY4MiBpcyBub3Qgc2V0
CkNPTkZJR19MQVRUSUNFX0VDUDNfQ09ORklHPXkKQ09ORklHX1NSQU09eQojIENPTkZJR19YSUxJ
TlhfU0RGRUMgaXMgbm90IHNldAojIENPTkZJR19ISVNJX0hJS0VZX1VTQiBpcyBub3Qgc2V0CiMg
Q09ORklHX09QRU5fRElDRSBpcyBub3Qgc2V0CkNPTkZJR19DMlBPUlQ9eQoKIwojIEVFUFJPTSBz
dXBwb3J0CiMKQ09ORklHX0VFUFJPTV9BVDI0PXkKIyBDT05GSUdfRUVQUk9NX0FUMjUgaXMgbm90
IHNldAojIENPTkZJR19FRVBST01fTEVHQUNZIGlzIG5vdCBzZXQKQ09ORklHX0VFUFJPTV9NQVg2
ODc1PXkKQ09ORklHX0VFUFJPTV85M0NYNj15CiMgQ09ORklHX0VFUFJPTV85M1hYNDYgaXMgbm90
IHNldApDT05GSUdfRUVQUk9NX0lEVF84OUhQRVNYPXkKQ09ORklHX0VFUFJPTV9FRTEwMDQ9eQoj
IGVuZCBvZiBFRVBST00gc3VwcG9ydAoKIwojIFRleGFzIEluc3RydW1lbnRzIHNoYXJlZCB0cmFu
c3BvcnQgbGluZSBkaXNjaXBsaW5lCiMKIyBDT05GSUdfVElfU1QgaXMgbm90IHNldAojIGVuZCBv
ZiBUZXhhcyBJbnN0cnVtZW50cyBzaGFyZWQgdHJhbnNwb3J0IGxpbmUgZGlzY2lwbGluZQoKIyBD
T05GSUdfU0VOU09SU19MSVMzX1NQSSBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0xJUzNfSTJD
PXkKQ09ORklHX0FMVEVSQV9TVEFQTD15CkNPTkZJR19FQ0hPPXkKIyBDT05GSUdfVUFDQ0UgaXMg
bm90IHNldAojIENPTkZJR19QVlBBTklDIGlzIG5vdCBzZXQKIyBlbmQgb2YgTWlzYyBkZXZpY2Vz
CgojCiMgU0NTSSBkZXZpY2Ugc3VwcG9ydAojCkNPTkZJR19TQ1NJX01PRD15CiMgQ09ORklHX1JB
SURfQVRUUlMgaXMgbm90IHNldApDT05GSUdfU0NTSV9DT01NT049eQpDT05GSUdfU0NTST15CkNP
TkZJR19TQ1NJX0RNQT15CkNPTkZJR19TQ1NJX1BST0NfRlM9eQoKIwojIFNDU0kgc3VwcG9ydCB0
eXBlIChkaXNrLCB0YXBlLCBDRC1ST00pCiMKQ09ORklHX0JMS19ERVZfU0Q9eQpDT05GSUdfQ0hS
X0RFVl9TVD15CkNPTkZJR19DSFJfREVWX1NHPXkKIyBDT05GSUdfQkxLX0RFVl9CU0cgaXMgbm90
IHNldApDT05GSUdfQ0hSX0RFVl9TQ0g9eQpDT05GSUdfU0NTSV9FTkNMT1NVUkU9eQpDT05GSUdf
U0NTSV9DT05TVEFOVFM9eQojIENPTkZJR19TQ1NJX0xPR0dJTkcgaXMgbm90IHNldApDT05GSUdf
U0NTSV9TQ0FOX0FTWU5DPXkKCiMKIyBTQ1NJIFRyYW5zcG9ydHMKIwojIENPTkZJR19TQ1NJX1NQ
SV9BVFRSUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfRkNfQVRUUlMgaXMgbm90IHNldApDT05G
SUdfU0NTSV9JU0NTSV9BVFRSUz15CiMgQ09ORklHX1NDU0lfU0FTX0FUVFJTIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0NTSV9TQVNfTElCU0FTIGlzIG5vdCBzZXQKQ09ORklHX1NDU0lfU1JQX0FUVFJT
PXkKIyBlbmQgb2YgU0NTSSBUcmFuc3BvcnRzCgpDT05GSUdfU0NTSV9MT1dMRVZFTD15CkNPTkZJ
R19JU0NTSV9UQ1A9eQojIENPTkZJR19JU0NTSV9CT09UX1NZU0ZTIGlzIG5vdCBzZXQKQ09ORklH
X1NDU0lfREVCVUc9eQojIENPTkZJR19TQ1NJX1ZJUlRJTyBpcyBub3Qgc2V0CiMgQ09ORklHX1ND
U0lfREggaXMgbm90IHNldAojIGVuZCBvZiBTQ1NJIGRldmljZSBzdXBwb3J0CgojIENPTkZJR19B
VEEgaXMgbm90IHNldApDT05GSUdfTUQ9eQpDT05GSUdfQkxLX0RFVl9NRD15CiMgQ09ORklHX01E
X0FVVE9ERVRFQ1QgaXMgbm90IHNldAojIENPTkZJR19NRF9MSU5FQVIgaXMgbm90IHNldApDT05G
SUdfTURfUkFJRDA9eQpDT05GSUdfTURfUkFJRDE9eQpDT05GSUdfTURfUkFJRDEwPXkKQ09ORklH
X01EX1JBSUQ0NTY9eQpDT05GSUdfTURfTVVMVElQQVRIPXkKQ09ORklHX01EX0ZBVUxUWT15CiMg
Q09ORklHX01EX0NMVVNURVIgaXMgbm90IHNldApDT05GSUdfQkNBQ0hFPXkKIyBDT05GSUdfQkNB
Q0hFX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfQkNBQ0hFX0NMT1NVUkVTX0RFQlVHIGlzIG5v
dCBzZXQKIyBDT05GSUdfQkNBQ0hFX0FTWU5DX1JFR0lTVFJBVElPTiBpcyBub3Qgc2V0CkNPTkZJ
R19CTEtfREVWX0RNX0JVSUxUSU49eQpDT05GSUdfQkxLX0RFVl9ETT15CkNPTkZJR19ETV9ERUJV
Rz15CkNPTkZJR19ETV9CVUZJTz15CkNPTkZJR19ETV9ERUJVR19CTE9DS19NQU5BR0VSX0xPQ0tJ
Tkc9eQpDT05GSUdfRE1fREVCVUdfQkxPQ0tfU1RBQ0tfVFJBQ0lORz15CkNPTkZJR19ETV9CSU9f
UFJJU09OPXkKQ09ORklHX0RNX1BFUlNJU1RFTlRfREFUQT15CkNPTkZJR19ETV9VTlNUUklQRUQ9
eQpDT05GSUdfRE1fQ1JZUFQ9eQpDT05GSUdfRE1fU05BUFNIT1Q9eQpDT05GSUdfRE1fVEhJTl9Q
Uk9WSVNJT05JTkc9eQojIENPTkZJR19ETV9DQUNIRSBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX1dS
SVRFQ0FDSEUgaXMgbm90IHNldAojIENPTkZJR19ETV9FQlMgaXMgbm90IHNldAojIENPTkZJR19E
TV9FUkEgaXMgbm90IHNldAojIENPTkZJR19ETV9DTE9ORSBpcyBub3Qgc2V0CkNPTkZJR19ETV9N
SVJST1I9eQpDT05GSUdfRE1fTE9HX1VTRVJTUEFDRT15CkNPTkZJR19ETV9SQUlEPXkKQ09ORklH
X0RNX1pFUk89eQpDT05GSUdfRE1fTVVMVElQQVRIPXkKQ09ORklHX0RNX01VTFRJUEFUSF9RTD15
CkNPTkZJR19ETV9NVUxUSVBBVEhfU1Q9eQpDT05GSUdfRE1fTVVMVElQQVRIX0hTVD15CkNPTkZJ
R19ETV9NVUxUSVBBVEhfSU9BPXkKQ09ORklHX0RNX0RFTEFZPXkKQ09ORklHX0RNX0RVU1Q9eQoj
IENPTkZJR19ETV9JTklUIGlzIG5vdCBzZXQKQ09ORklHX0RNX1VFVkVOVD15CiMgQ09ORklHX0RN
X0ZMQUtFWSBpcyBub3Qgc2V0CkNPTkZJR19ETV9WRVJJVFk9eQojIENPTkZJR19ETV9WRVJJVFlf
VkVSSUZZX1JPT1RIQVNIX1NJRyBpcyBub3Qgc2V0CkNPTkZJR19ETV9WRVJJVFlfRkVDPXkKQ09O
RklHX0RNX1NXSVRDSD15CkNPTkZJR19ETV9MT0dfV1JJVEVTPXkKIyBDT05GSUdfRE1fSU5URUdS
SVRZIGlzIG5vdCBzZXQKIyBDT05GSUdfVEFSR0VUX0NPUkUgaXMgbm90IHNldAoKIwojIElFRUUg
MTM5NCAoRmlyZVdpcmUpIHN1cHBvcnQKIwojIENPTkZJR19GSVJFV0lSRSBpcyBub3Qgc2V0CiMg
ZW5kIG9mIElFRUUgMTM5NCAoRmlyZVdpcmUpIHN1cHBvcnQKCkNPTkZJR19ORVRERVZJQ0VTPXkK
IyBDT05GSUdfTkVUX0NPUkUgaXMgbm90IHNldAoKIwojIERpc3RyaWJ1dGVkIFN3aXRjaCBBcmNo
aXRlY3R1cmUgZHJpdmVycwojCkNPTkZJR19CNTM9eQpDT05GSUdfQjUzX1NQSV9EUklWRVI9eQpD
T05GSUdfQjUzX01ESU9fRFJJVkVSPXkKQ09ORklHX0I1M19NTUFQX0RSSVZFUj15CkNPTkZJR19C
NTNfU1JBQl9EUklWRVI9eQpDT05GSUdfQjUzX1NFUkRFUz15CkNPTkZJR19ORVRfRFNBX0JDTV9T
RjI9eQojIENPTkZJR19ORVRfRFNBX0xPT1AgaXMgbm90IHNldApDT05GSUdfTkVUX0RTQV9MQU5U
SVFfR1NXSVA9eQojIENPTkZJR19ORVRfRFNBX01UNzUzMCBpcyBub3Qgc2V0CkNPTkZJR19ORVRf
RFNBX01WODhFNjA2MD15CiMgQ09ORklHX05FVF9EU0FfTUlDUk9DSElQX0tTWjk0NzcgaXMgbm90
IHNldAojIENPTkZJR19ORVRfRFNBX01JQ1JPQ0hJUF9LU1o4Nzk1IGlzIG5vdCBzZXQKQ09ORklH
X05FVF9EU0FfTVY4OEU2WFhYPXkKQ09ORklHX05FVF9EU0FfQVI5MzMxPXkKIyBDT05GSUdfTkVU
X0RTQV9TSkExMTA1IGlzIG5vdCBzZXQKQ09ORklHX05FVF9EU0FfWFJTNzAwWD15CiMgQ09ORklH
X05FVF9EU0FfWFJTNzAwWF9JMkMgaXMgbm90IHNldApDT05GSUdfTkVUX0RTQV9YUlM3MDBYX01E
SU89eQpDT05GSUdfTkVUX0RTQV9RQ0E4Sz15CkNPTkZJR19ORVRfRFNBX1JFQUxURUs9eQojIENP
TkZJR19ORVRfRFNBX1JFQUxURUtfTURJTyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9EU0FfUkVB
TFRFS19TTUkgaXMgbm90IHNldApDT05GSUdfTkVUX0RTQV9SRUFMVEVLX1JUTDgzNjVNQj15CkNP
TkZJR19ORVRfRFNBX1JFQUxURUtfUlRMODM2NlJCPXkKIyBDT05GSUdfTkVUX0RTQV9TTVNDX0xB
TjkzMDNfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0RTQV9TTVNDX0xBTjkzMDNfTURJTyBp
cyBub3Qgc2V0CkNPTkZJR19ORVRfRFNBX1ZJVEVTU0VfVlNDNzNYWD15CkNPTkZJR19ORVRfRFNB
X1ZJVEVTU0VfVlNDNzNYWF9TUEk9eQpDT05GSUdfTkVUX0RTQV9WSVRFU1NFX1ZTQzczWFhfUExB
VEZPUk09eQojIGVuZCBvZiBEaXN0cmlidXRlZCBTd2l0Y2ggQXJjaGl0ZWN0dXJlIGRyaXZlcnMK
CiMgQ09ORklHX0VUSEVSTkVUIGlzIG5vdCBzZXQKQ09ORklHX1BIWUxJTks9eQpDT05GSUdfUEhZ
TElCPXkKQ09ORklHX1NXUEhZPXkKQ09ORklHX0xFRF9UUklHR0VSX1BIWT15CkNPTkZJR19GSVhF
RF9QSFk9eQojIENPTkZJR19TRlAgaXMgbm90IHNldAoKIwojIE1JSSBQSFkgZGV2aWNlIGRyaXZl
cnMKIwpDT05GSUdfQU1EX1BIWT15CiMgQ09ORklHX01FU09OX0dYTF9QSFkgaXMgbm90IHNldAoj
IENPTkZJR19BRElOX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX0FESU4xMTAwX1BIWSBpcyBub3Qg
c2V0CiMgQ09ORklHX0FRVUFOVElBX1BIWSBpcyBub3Qgc2V0CkNPTkZJR19BWDg4Nzk2Ql9QSFk9
eQojIENPTkZJR19CUk9BRENPTV9QSFkgaXMgbm90IHNldAojIENPTkZJR19CQ001NDE0MF9QSFkg
aXMgbm90IHNldAojIENPTkZJR19CQ002M1hYX1BIWSBpcyBub3Qgc2V0CkNPTkZJR19CQ003WFhY
X1BIWT15CkNPTkZJR19CQ004NDg4MV9QSFk9eQojIENPTkZJR19CQ004N1hYX1BIWSBpcyBub3Qg
c2V0CkNPTkZJR19CQ01fTkVUX1BIWUxJQj15CkNPTkZJR19DSUNBREFfUEhZPXkKQ09ORklHX0NP
UlRJTkFfUEhZPXkKQ09ORklHX0RBVklDT01fUEhZPXkKIyBDT05GSUdfSUNQTFVTX1BIWSBpcyBu
b3Qgc2V0CkNPTkZJR19MWFRfUEhZPXkKQ09ORklHX0lOVEVMX1hXQVlfUEhZPXkKIyBDT05GSUdf
TFNJX0VUMTAxMUNfUEhZIGlzIG5vdCBzZXQKQ09ORklHX01BUlZFTExfUEhZPXkKIyBDT05GSUdf
TUFSVkVMTF8xMEdfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFSVkVMTF84OFgyMjIyX1BIWSBp
cyBub3Qgc2V0CkNPTkZJR19NQVhMSU5FQVJfR1BIWT15CiMgQ09ORklHX01FRElBVEVLX0dFX1BI
WSBpcyBub3Qgc2V0CkNPTkZJR19NSUNSRUxfUEhZPXkKIyBDT05GSUdfTUlDUk9DSElQX1BIWSBp
cyBub3Qgc2V0CiMgQ09ORklHX01JQ1JPQ0hJUF9UMV9QSFkgaXMgbm90IHNldApDT05GSUdfTUlD
Uk9TRU1JX1BIWT15CkNPTkZJR19NT1RPUkNPTU1fUEhZPXkKIyBDT05GSUdfTkFUSU9OQUxfUEhZ
IGlzIG5vdCBzZXQKIyBDT05GSUdfTlhQX0M0NV9USkExMVhYX1BIWSBpcyBub3Qgc2V0CiMgQ09O
RklHX0FUODAzWF9QSFkgaXMgbm90IHNldApDT05GSUdfUVNFTUlfUEhZPXkKQ09ORklHX1JFQUxU
RUtfUEhZPXkKQ09ORklHX1JFTkVTQVNfUEhZPXkKQ09ORklHX1JPQ0tDSElQX1BIWT15CkNPTkZJ
R19TTVNDX1BIWT15CkNPTkZJR19TVEUxMFhQPXkKQ09ORklHX1RFUkFORVRJQ1NfUEhZPXkKIyBD
T05GSUdfRFA4MzgyMl9QSFkgaXMgbm90IHNldAojIENPTkZJR19EUDgzVEM4MTFfUEhZIGlzIG5v
dCBzZXQKQ09ORklHX0RQODM4NDhfUEhZPXkKIyBDT05GSUdfRFA4Mzg2N19QSFkgaXMgbm90IHNl
dAojIENPTkZJR19EUDgzODY5X1BIWSBpcyBub3Qgc2V0CkNPTkZJR19EUDgzVEQ1MTBfUEhZPXkK
Q09ORklHX1ZJVEVTU0VfUEhZPXkKQ09ORklHX1hJTElOWF9HTUlJMlJHTUlJPXkKIyBDT05GSUdf
TUlDUkVMX0tTODk5NU1BIGlzIG5vdCBzZXQKCiMKIyBNQ1RQIERldmljZSBEcml2ZXJzCiMKQ09O
RklHX01DVFBfU0VSSUFMPXkKQ09ORklHX01DVFBfVFJBTlNQT1JUX0kyQz15CiMgZW5kIG9mIE1D
VFAgRGV2aWNlIERyaXZlcnMKCkNPTkZJR19NRElPX0RFVklDRT15CkNPTkZJR19NRElPX0JVUz15
CkNPTkZJR19GV05PREVfTURJTz15CkNPTkZJR19PRl9NRElPPXkKQ09ORklHX01ESU9fREVWUkVT
PXkKIyBDT05GSUdfTURJT19TVU40SSBpcyBub3Qgc2V0CiMgQ09ORklHX01ESU9fWEdFTkUgaXMg
bm90IHNldAojIENPTkZJR19NRElPX0FTUEVFRCBpcyBub3Qgc2V0CkNPTkZJR19NRElPX0JJVEJB
Tkc9eQojIENPTkZJR19NRElPX0JDTV9JUFJPQyBpcyBub3Qgc2V0CkNPTkZJR19NRElPX0JDTV9V
TklNQUM9eQpDT05GSUdfTURJT19HUElPPXkKQ09ORklHX01ESU9fSElTSV9GRU1BQz15CkNPTkZJ
R19NRElPX01TQ0NfTUlJTT15CiMgQ09ORklHX01ESU9fTU9YQVJUIGlzIG5vdCBzZXQKIyBDT05G
SUdfTURJT19PQ1RFT04gaXMgbm90IHNldAojIENPTkZJR19NRElPX0lQUTQwMTkgaXMgbm90IHNl
dAojIENPTkZJR19NRElPX0lQUTgwNjQgaXMgbm90IHNldAoKIwojIE1ESU8gTXVsdGlwbGV4ZXJz
CiMKQ09ORklHX01ESU9fQlVTX01VWD15CiMgQ09ORklHX01ESU9fQlVTX01VWF9NRVNPTl9HMTJB
IGlzIG5vdCBzZXQKIyBDT05GSUdfTURJT19CVVNfTVVYX0JDTTYzNjggaXMgbm90IHNldAojIENP
TkZJR19NRElPX0JVU19NVVhfQkNNX0lQUk9DIGlzIG5vdCBzZXQKQ09ORklHX01ESU9fQlVTX01V
WF9HUElPPXkKIyBDT05GSUdfTURJT19CVVNfTVVYX01VTFRJUExFWEVSIGlzIG5vdCBzZXQKIyBD
T05GSUdfTURJT19CVVNfTVVYX01NSU9SRUcgaXMgbm90IHNldAoKIwojIFBDUyBkZXZpY2UgZHJp
dmVycwojCiMgQ09ORklHX1BDU19YUENTIGlzIG5vdCBzZXQKIyBlbmQgb2YgUENTIGRldmljZSBk
cml2ZXJzCgpDT05GSUdfUExJUD15CiMgQ09ORklHX1BQUCBpcyBub3Qgc2V0CkNPTkZJR19TTElQ
PXkKIyBDT05GSUdfU0xJUF9DT01QUkVTU0VEIGlzIG5vdCBzZXQKIyBDT05GSUdfU0xJUF9TTUFS
VCBpcyBub3Qgc2V0CkNPTkZJR19TTElQX01PREVfU0xJUDY9eQoKIwojIEhvc3Qtc2lkZSBVU0Ig
c3VwcG9ydCBpcyBuZWVkZWQgZm9yIFVTQiBOZXR3b3JrIEFkYXB0ZXIgc3VwcG9ydAojCkNPTkZJ
R19XTEFOPXkKIyBDT05GSUdfV0xBTl9WRU5ET1JfQURNVEVLIGlzIG5vdCBzZXQKQ09ORklHX0FU
SF9DT01NT049eQpDT05GSUdfV0xBTl9WRU5ET1JfQVRIPXkKIyBDT05GSUdfQVRIX0RFQlVHIGlz
IG5vdCBzZXQKIyBDT05GSUdfQVRIOUsgaXMgbm90IHNldApDT05GSUdfQVRINktMPXkKQ09ORklH
X0FUSDZLTF9TRElPPXkKIyBDT05GSUdfQVRINktMX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX0FU
SDZLTF9UUkFDSU5HPXkKQ09ORklHX0FUSDEwSz15CkNPTkZJR19BVEgxMEtfQ0U9eQpDT05GSUdf
QVRIMTBLX1NESU89eQojIENPTkZJR19BVEgxMEtfU05PQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FU
SDEwS19ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19BVEgxMEtfREVCVUdGUz15CkNPTkZJR19BVEgx
MEtfU1BFQ1RSQUw9eQojIENPTkZJR19BVEgxMEtfVFJBQ0lORyBpcyBub3Qgc2V0CiMgQ09ORklH
X1dDTjM2WFggaXMgbm90IHNldApDT05GSUdfV0xBTl9WRU5ET1JfQVRNRUw9eQojIENPTkZJR19X
TEFOX1ZFTkRPUl9CUk9BRENPTSBpcyBub3Qgc2V0CiMgQ09ORklHX1dMQU5fVkVORE9SX0NJU0NP
IGlzIG5vdCBzZXQKQ09ORklHX1dMQU5fVkVORE9SX0lOVEVMPXkKQ09ORklHX1dMQU5fVkVORE9S
X0lOVEVSU0lMPXkKIyBDT05GSUdfSE9TVEFQIGlzIG5vdCBzZXQKQ09ORklHX1A1NF9DT01NT049
eQojIENPTkZJR19QNTRfU1BJIGlzIG5vdCBzZXQKQ09ORklHX1dMQU5fVkVORE9SX01BUlZFTEw9
eQpDT05GSUdfTElCRVJUQVM9eQpDT05GSUdfTElCRVJUQVNfU0RJTz15CkNPTkZJR19MSUJFUlRB
U19TUEk9eQpDT05GSUdfTElCRVJUQVNfREVCVUc9eQojIENPTkZJR19MSUJFUlRBU19NRVNIIGlz
IG5vdCBzZXQKQ09ORklHX0xJQkVSVEFTX1RISU5GSVJNPXkKIyBDT05GSUdfTElCRVJUQVNfVEhJ
TkZJUk1fREVCVUcgaXMgbm90IHNldAojIENPTkZJR19NV0lGSUVYIGlzIG5vdCBzZXQKQ09ORklH
X1dMQU5fVkVORE9SX01FRElBVEVLPXkKQ09ORklHX01UNzZfQ09SRT15CkNPTkZJR19NVDc2X0xF
RFM9eQpDT05GSUdfTVQ3Nl9TRElPPXkKQ09ORklHX01UNzZfQ09OTkFDX0xJQj15CkNPTkZJR19N
VDc2MTVfQ09NTU9OPXkKQ09ORklHX01UNzY2M19VU0JfU0RJT19DT01NT049eQpDT05GSUdfTVQ3
NjYzUz15CkNPTkZJR19NVDc5MjFfQ09NTU9OPXkKQ09ORklHX01UNzkyMVM9eQpDT05GSUdfV0xB
Tl9WRU5ET1JfTUlDUk9DSElQPXkKQ09ORklHX1dJTEMxMDAwPXkKQ09ORklHX1dJTEMxMDAwX1NE
SU89eQpDT05GSUdfV0lMQzEwMDBfU1BJPXkKIyBDT05GSUdfV0lMQzEwMDBfSFdfT09CX0lOVFIg
aXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9QVVJFTElGSSBpcyBub3Qgc2V0CkNPTkZJ
R19XTEFOX1ZFTkRPUl9SQUxJTks9eQpDT05GSUdfUlQyWDAwPXkKQ09ORklHX1dMQU5fVkVORE9S
X1JFQUxURUs9eQpDT05GSUdfUlRXODg9eQpDT05GSUdfUlRXODk9eQpDT05GSUdfV0xBTl9WRU5E
T1JfUlNJPXkKIyBDT05GSUdfUlNJXzkxWCBpcyBub3Qgc2V0CiMgQ09ORklHX1dMQU5fVkVORE9S
X1NJTEFCUyBpcyBub3Qgc2V0CkNPTkZJR19XTEFOX1ZFTkRPUl9TVD15CiMgQ09ORklHX0NXMTIw
MCBpcyBub3Qgc2V0CiMgQ09ORklHX1dMQU5fVkVORE9SX1RJIGlzIG5vdCBzZXQKIyBDT05GSUdf
V0xBTl9WRU5ET1JfWllEQVMgaXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9RVUFOVEVO
TkEgaXMgbm90IHNldApDT05GSUdfTUFDODAyMTFfSFdTSU09eQojIENPTkZJR19WSVJUX1dJRkkg
aXMgbm90IHNldAojIENPTkZJR19XQU4gaXMgbm90IHNldApDT05GSUdfSUVFRTgwMjE1NF9EUklW
RVJTPXkKQ09ORklHX0lFRUU4MDIxNTRfRkFLRUxCPXkKQ09ORklHX0lFRUU4MDIxNTRfQVQ4NlJG
MjMwPXkKIyBDT05GSUdfSUVFRTgwMjE1NF9NUkYyNEo0MCBpcyBub3Qgc2V0CkNPTkZJR19JRUVF
ODAyMTU0X0NDMjUyMD15CkNPTkZJR19JRUVFODAyMTU0X0FERjcyNDI9eQpDT05GSUdfSUVFRTgw
MjE1NF9DQTgyMTA9eQojIENPTkZJR19JRUVFODAyMTU0X0NBODIxMF9ERUJVR0ZTIGlzIG5vdCBz
ZXQKQ09ORklHX0lFRUU4MDIxNTRfTUNSMjBBPXkKQ09ORklHX0lFRUU4MDIxNTRfSFdTSU09eQoK
IwojIFdpcmVsZXNzIFdBTgojCiMgQ09ORklHX1dXQU4gaXMgbm90IHNldAojIGVuZCBvZiBXaXJl
bGVzcyBXQU4KCkNPTkZJR19ORVRERVZTSU09eQojIENPTkZJR19ORVRfRkFJTE9WRVIgaXMgbm90
IHNldApDT05GSUdfSVNETj15CkNPTkZJR19NSVNETj15CkNPTkZJR19NSVNETl9EU1A9eQojIENP
TkZJR19NSVNETl9MMU9JUCBpcyBub3Qgc2V0CgojCiMgbUlTRE4gaGFyZHdhcmUgZHJpdmVycwoj
CgojCiMgSW5wdXQgZGV2aWNlIHN1cHBvcnQKIwpDT05GSUdfSU5QVVQ9eQpDT05GSUdfSU5QVVRf
TEVEUz15CkNPTkZJR19JTlBVVF9GRl9NRU1MRVNTPXkKQ09ORklHX0lOUFVUX1NQQVJTRUtNQVA9
eQpDT05GSUdfSU5QVVRfTUFUUklYS01BUD15CkNPTkZJR19JTlBVVF9WSVZBTERJRk1BUD15Cgoj
CiMgVXNlcmxhbmQgaW50ZXJmYWNlcwojCkNPTkZJR19JTlBVVF9NT1VTRURFVj15CiMgQ09ORklH
X0lOUFVUX01PVVNFREVWX1BTQVVYIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX01PVVNFREVWX1ND
UkVFTl9YPTEwMjQKQ09ORklHX0lOUFVUX01PVVNFREVWX1NDUkVFTl9ZPTc2OApDT05GSUdfSU5Q
VVRfSk9ZREVWPXkKIyBDT05GSUdfSU5QVVRfRVZERVYgaXMgbm90IHNldAojIENPTkZJR19JTlBV
VF9FVkJVRyBpcyBub3Qgc2V0CgojCiMgSW5wdXQgRGV2aWNlIERyaXZlcnMKIwpDT05GSUdfSU5Q
VVRfS0VZQk9BUkQ9eQpDT05GSUdfS0VZQk9BUkRfQURDPXkKQ09ORklHX0tFWUJPQVJEX0FEUDU1
ODg9eQpDT05GSUdfS0VZQk9BUkRfQURQNTU4OT15CiMgQ09ORklHX0tFWUJPQVJEX0FUS0JEIGlz
IG5vdCBzZXQKQ09ORklHX0tFWUJPQVJEX1FUMTA1MD15CkNPTkZJR19LRVlCT0FSRF9RVDEwNzA9
eQojIENPTkZJR19LRVlCT0FSRF9RVDIxNjAgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9D
TFBTNzExWCBpcyBub3Qgc2V0CkNPTkZJR19LRVlCT0FSRF9ETElOS19ESVI2ODU9eQpDT05GSUdf
S0VZQk9BUkRfTEtLQkQ9eQojIENPTkZJR19LRVlCT0FSRF9FUDkzWFggaXMgbm90IHNldAojIENP
TkZJR19LRVlCT0FSRF9HUElPIGlzIG5vdCBzZXQKQ09ORklHX0tFWUJPQVJEX0dQSU9fUE9MTEVE
PXkKQ09ORklHX0tFWUJPQVJEX1RDQTY0MTY9eQojIENPTkZJR19LRVlCT0FSRF9UQ0E4NDE4IGlz
IG5vdCBzZXQKQ09ORklHX0tFWUJPQVJEX01BVFJJWD15CkNPTkZJR19LRVlCT0FSRF9MTTgzMjM9
eQojIENPTkZJR19LRVlCT0FSRF9MTTgzMzMgaXMgbm90IHNldApDT05GSUdfS0VZQk9BUkRfTUFY
NzM1OT15CkNPTkZJR19LRVlCT0FSRF9NQ1M9eQpDT05GSUdfS0VZQk9BUkRfTVBSMTIxPXkKIyBD
T05GSUdfS0VZQk9BUkRfU05WU19QV1JLRVkgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9J
TVggaXMgbm90IHNldApDT05GSUdfS0VZQk9BUkRfTkVXVE9OPXkKQ09ORklHX0tFWUJPQVJEX09Q
RU5DT1JFUz15CkNPTkZJR19LRVlCT0FSRF9TQU1TVU5HPXkKQ09ORklHX0tFWUJPQVJEX0dPTERG
SVNIX0VWRU5UUz15CkNPTkZJR19LRVlCT0FSRF9TVE9XQVdBWT15CiMgQ09ORklHX0tFWUJPQVJE
X1NUX0tFWVNDQU4gaXMgbm90IHNldApDT05GSUdfS0VZQk9BUkRfU1VOS0JEPXkKIyBDT05GSUdf
S0VZQk9BUkRfU0hfS0VZU0MgaXMgbm90IHNldApDT05GSUdfS0VZQk9BUkRfU1RNUEU9eQojIENP
TkZJR19LRVlCT0FSRF9JUVM2MlggaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9PTUFQNCBp
cyBub3Qgc2V0CkNPTkZJR19LRVlCT0FSRF9UQzM1ODlYPXkKQ09ORklHX0tFWUJPQVJEX1RNMl9U
T1VDSEtFWT15CiMgQ09ORklHX0tFWUJPQVJEX1RXTDQwMzAgaXMgbm90IHNldAojIENPTkZJR19L
RVlCT0FSRF9YVEtCRCBpcyBub3Qgc2V0CkNPTkZJR19LRVlCT0FSRF9DQVAxMVhYPXkKQ09ORklH
X0tFWUJPQVJEX0JDTT15CiMgQ09ORklHX0tFWUJPQVJEX01UNjc3OSBpcyBub3Qgc2V0CkNPTkZJ
R19LRVlCT0FSRF9NVEtfUE1JQz15CkNPTkZJR19LRVlCT0FSRF9DWVBSRVNTX1NGPXkKIyBDT05G
SUdfSU5QVVRfTU9VU0UgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9KT1lTVElDSyBpcyBub3Qg
c2V0CiMgQ09ORklHX0lOUFVUX1RBQkxFVCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1RPVUNI
U0NSRUVOIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfTUlTQyBpcyBub3Qgc2V0CkNPTkZJR19S
TUk0X0NPUkU9eQpDT05GSUdfUk1JNF9JMkM9eQojIENPTkZJR19STUk0X1NQSSBpcyBub3Qgc2V0
CiMgQ09ORklHX1JNSTRfU01CIGlzIG5vdCBzZXQKQ09ORklHX1JNSTRfRjAzPXkKQ09ORklHX1JN
STRfRjAzX1NFUklPPXkKQ09ORklHX1JNSTRfMkRfU0VOU09SPXkKIyBDT05GSUdfUk1JNF9GMTEg
aXMgbm90IHNldApDT05GSUdfUk1JNF9GMTI9eQojIENPTkZJR19STUk0X0YzMCBpcyBub3Qgc2V0
CiMgQ09ORklHX1JNSTRfRjM0IGlzIG5vdCBzZXQKIyBDT05GSUdfUk1JNF9GM0EgaXMgbm90IHNl
dAojIENPTkZJR19STUk0X0Y1NSBpcyBub3Qgc2V0CgojCiMgSGFyZHdhcmUgSS9PIHBvcnRzCiMK
Q09ORklHX1NFUklPPXkKQ09ORklHX1NFUklPX1NFUlBPUlQ9eQojIENPTkZJR19TRVJJT19QQVJL
QkQgaXMgbm90IHNldApDT05GSUdfU0VSSU9fTElCUFMyPXkKQ09ORklHX1NFUklPX1JBVz15CkNP
TkZJR19TRVJJT19BTFRFUkFfUFMyPXkKQ09ORklHX1NFUklPX1BTMk1VTFQ9eQpDT05GSUdfU0VS
SU9fQVJDX1BTMj15CiMgQ09ORklHX1NFUklPX0FQQlBTMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
UklPX09MUENfQVBTUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklPX1NVTjRJX1BTMiBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFUklPX0dQSU9fUFMyIGlzIG5vdCBzZXQKQ09ORklHX1VTRVJJTz15CiMg
Q09ORklHX0dBTUVQT1JUIGlzIG5vdCBzZXQKIyBlbmQgb2YgSGFyZHdhcmUgSS9PIHBvcnRzCiMg
ZW5kIG9mIElucHV0IGRldmljZSBzdXBwb3J0CgojCiMgQ2hhcmFjdGVyIGRldmljZXMKIwpDT05G
SUdfVFRZPXkKQ09ORklHX1ZUPXkKQ09ORklHX0NPTlNPTEVfVFJBTlNMQVRJT05TPXkKQ09ORklH
X1ZUX0NPTlNPTEU9eQpDT05GSUdfSFdfQ09OU09MRT15CkNPTkZJR19WVF9IV19DT05TT0xFX0JJ
TkRJTkc9eQpDT05GSUdfVU5JWDk4X1BUWVM9eQojIENPTkZJR19MRUdBQ1lfUFRZUyBpcyBub3Qg
c2V0CkNPTkZJR19MRElTQ19BVVRPTE9BRD15CgojCiMgU2VyaWFsIGRyaXZlcnMKIwpDT05GSUdf
U0VSSUFMX0VBUkxZQ09OPXkKQ09ORklHX1NFUklBTF84MjUwPXkKQ09ORklHX1NFUklBTF84MjUw
X0RFUFJFQ0FURURfT1BUSU9OUz15CiMgQ09ORklHX1NFUklBTF84MjUwXzE2NTUwQV9WQVJJQU5U
UyBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfODI1MF9GSU5URUs9eQojIENPTkZJR19TRVJJQUxf
ODI1MF9DT05TT0xFIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF84MjUwX01FTl9NQ0I9eQpDT05G
SUdfU0VSSUFMXzgyNTBfTlJfVUFSVFM9NApDT05GSUdfU0VSSUFMXzgyNTBfUlVOVElNRV9VQVJU
Uz00CkNPTkZJR19TRVJJQUxfODI1MF9FWFRFTkRFRD15CkNPTkZJR19TRVJJQUxfODI1MF9NQU5Z
X1BPUlRTPXkKQ09ORklHX1NFUklBTF84MjUwX0FTUEVFRF9WVUFSVD15CkNPTkZJR19TRVJJQUxf
ODI1MF9TSEFSRV9JUlE9eQpDT05GSUdfU0VSSUFMXzgyNTBfREVURUNUX0lSUT15CiMgQ09ORklH
X1NFUklBTF84MjUwX1JTQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF84MjUwX0JDTTI4MzVB
VVggaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfODI1MF9EVyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFUklBTF84MjUwX0VNIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMXzgyNTBfSU9DMyBpcyBu
b3Qgc2V0CkNPTkZJR19TRVJJQUxfODI1MF9SVDI4OFg9eQojIENPTkZJR19TRVJJQUxfODI1MF9P
TUFQIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMXzgyNTBfTFBDMThYWCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFUklBTF84MjUwX01UNjU3NyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF84MjUw
X1VOSVBISUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMXzgyNTBfSU5HRU5JQyBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFUklBTF84MjUwX1BYQSBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfODI1
MF9URUdSQT15CiMgQ09ORklHX1NFUklBTF84MjUwX0JDTTcyNzEgaXMgbm90IHNldApDT05GSUdf
U0VSSUFMX09GX1BMQVRGT1JNPXkKCiMKIyBOb24tODI1MCBzZXJpYWwgcG9ydCBzdXBwb3J0CiMK
IyBDT05GSUdfU0VSSUFMX0FNQkFfUEwwMTAgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfQVRN
RUwgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfTUVTT04gaXMgbm90IHNldAojIENPTkZJR19T
RVJJQUxfQ0xQUzcxMVggaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfU0FNU1VORyBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFUklBTF9URUdSQSBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfTUFYMzEw
MD15CiMgQ09ORklHX1NFUklBTF9NQVgzMTBYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0lN
WCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9JTVhfRUFSTFlDT04gaXMgbm90IHNldApDT05G
SUdfU0VSSUFMX1VBUlRMSVRFPXkKIyBDT05GSUdfU0VSSUFMX1VBUlRMSVRFX0NPTlNPTEUgaXMg
bm90IHNldApDT05GSUdfU0VSSUFMX1VBUlRMSVRFX05SX1VBUlRTPTEKIyBDT05GSUdfU0VSSUFM
X1NIX1NDSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9IU19MUEMzMlhYIGlzIG5vdCBzZXQK
Q09ORklHX1NFUklBTF9DT1JFPXkKQ09ORklHX1NFUklBTF9DT1JFX0NPTlNPTEU9eQojIENPTkZJ
R19TRVJJQUxfTVNNIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX1ZUODUwMCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFUklBTF9PTUFQIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF9TSUZJVkU9eQpD
T05GSUdfU0VSSUFMX1NJRklWRV9DT05TT0xFPXkKIyBDT05GSUdfU0VSSUFMX0xBTlRJUSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFUklBTF9TQ0NOWFAgaXMgbm90IHNldApDT05GSUdfU0VSSUFMX1ND
MTZJUzdYWF9DT1JFPXkKQ09ORklHX1NFUklBTF9TQzE2SVM3WFg9eQojIENPTkZJR19TRVJJQUxf
U0MxNklTN1hYX0kyQyBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfU0MxNklTN1hYX1NQST15CiMg
Q09ORklHX1NFUklBTF9USU1CRVJEQUxFIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0JDTTYz
WFggaXMgbm90IHNldApDT05GSUdfU0VSSUFMX0FMVEVSQV9KVEFHVUFSVD15CiMgQ09ORklHX1NF
UklBTF9BTFRFUkFfSlRBR1VBUlRfQ09OU09MRSBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfQUxU
RVJBX1VBUlQ9eQpDT05GSUdfU0VSSUFMX0FMVEVSQV9VQVJUX01BWFBPUlRTPTQKQ09ORklHX1NF
UklBTF9BTFRFUkFfVUFSVF9CQVVEUkFURT0xMTUyMDAKIyBDT05GSUdfU0VSSUFMX0FMVEVSQV9V
QVJUX0NPTlNPTEUgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfTVhTX0FVQVJUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VSSUFMX1hJTElOWF9QU19VQVJUIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VS
SUFMX01QUzJfVUFSVCBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfQVJDPXkKIyBDT05GSUdfU0VS
SUFMX0FSQ19DT05TT0xFIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF9BUkNfTlJfUE9SVFM9MQpD
T05GSUdfU0VSSUFMX0ZTTF9MUFVBUlQ9eQpDT05GSUdfU0VSSUFMX0ZTTF9MUFVBUlRfQ09OU09M
RT15CiMgQ09ORklHX1NFUklBTF9GU0xfTElORkxFWFVBUlQgaXMgbm90IHNldApDT05GSUdfU0VS
SUFMX0NPTkVYQU5UX0RJR0lDT0xPUj15CkNPTkZJR19TRVJJQUxfQ09ORVhBTlRfRElHSUNPTE9S
X0NPTlNPTEU9eQojIENPTkZJR19TRVJJQUxfU1RfQVNDIGlzIG5vdCBzZXQKQ09ORklHX1NFUklB
TF9NRU5fWjEzNT15CkNPTkZJR19TRVJJQUxfU1BSRD15CiMgQ09ORklHX1NFUklBTF9TUFJEX0NP
TlNPTEUgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfU1RNMzIgaXMgbm90IHNldAojIENPTkZJ
R19TRVJJQUxfTVZFQlVfVUFSVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9PV0wgaXMgbm90
IHNldAojIENPTkZJR19TRVJJQUxfUkRBIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX01JTEJF
QVVUX1VTSU8gaXMgbm90IHNldApDT05GSUdfU0VSSUFMX0xJVEVVQVJUPXkKQ09ORklHX1NFUklB
TF9MSVRFVUFSVF9NQVhfUE9SVFM9MQojIENPTkZJR19TRVJJQUxfTElURVVBUlRfQ09OU09MRSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9TVU5QTFVTIGlzIG5vdCBzZXQKIyBlbmQgb2YgU2Vy
aWFsIGRyaXZlcnMKCkNPTkZJR19TRVJJQUxfTUNUUkxfR1BJTz15CiMgQ09ORklHX1NFUklBTF9O
T05TVEFOREFSRCBpcyBub3Qgc2V0CiMgQ09ORklHX0dPTERGSVNIX1RUWSBpcyBub3Qgc2V0CkNP
TkZJR19OX0dTTT15CiMgQ09ORklHX05VTExfVFRZIGlzIG5vdCBzZXQKQ09ORklHX0hWQ19EUklW
RVI9eQojIENPTkZJR19SUE1TR19UVFkgaXMgbm90IHNldApDT05GSUdfU0VSSUFMX0RFVl9CVVM9
eQojIENPTkZJR19TRVJJQUxfREVWX0NUUkxfVFRZUE9SVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BS
SU5URVIgaXMgbm90IHNldApDT05GSUdfUFBERVY9eQpDT05GSUdfVklSVElPX0NPTlNPTEU9eQpD
T05GSUdfSVBNSV9IQU5ETEVSPXkKIyBDT05GSUdfSVBNSV9QQU5JQ19FVkVOVCBpcyBub3Qgc2V0
CkNPTkZJR19JUE1JX0RFVklDRV9JTlRFUkZBQ0U9eQojIENPTkZJR19JUE1JX1NJIGlzIG5vdCBz
ZXQKQ09ORklHX0lQTUlfU1NJRj15CiMgQ09ORklHX0lQTUlfSVBNQiBpcyBub3Qgc2V0CkNPTkZJ
R19JUE1JX1dBVENIRE9HPXkKQ09ORklHX0lQTUlfUE9XRVJPRkY9eQojIENPTkZJR19BU1BFRURf
S0NTX0lQTUlfQk1DIGlzIG5vdCBzZXQKIyBDT05GSUdfTlBDTTdYWF9LQ1NfSVBNSV9CTUMgaXMg
bm90IHNldAojIENPTkZJR19BU1BFRURfQlRfSVBNSV9CTUMgaXMgbm90IHNldAojIENPTkZJR19J
UE1CX0RFVklDRV9JTlRFUkZBQ0UgaXMgbm90IHNldApDT05GSUdfSFdfUkFORE9NPXkKIyBDT05G
SUdfSFdfUkFORE9NX1RJTUVSSU9NRU0gaXMgbm90IHNldApDT05GSUdfSFdfUkFORE9NX0FUTUVM
PXkKQ09ORklHX0hXX1JBTkRPTV9CQTQzMT15CkNPTkZJR19IV19SQU5ET01fQkNNMjgzNT15CkNP
TkZJR19IV19SQU5ET01fSVBST0NfUk5HMjAwPXkKQ09ORklHX0hXX1JBTkRPTV9JWFA0WFg9eQpD
T05GSUdfSFdfUkFORE9NX09NQVA9eQpDT05GSUdfSFdfUkFORE9NX09NQVAzX1JPTT15CkNPTkZJ
R19IV19SQU5ET01fVklSVElPPXkKQ09ORklHX0hXX1JBTkRPTV9JTVhfUk5HQz15CkNPTkZJR19I
V19SQU5ET01fTk9NQURJSz15CkNPTkZJR19IV19SQU5ET01fU1RNMzI9eQpDT05GSUdfSFdfUkFO
RE9NX01FU09OPXkKQ09ORklHX0hXX1JBTkRPTV9NVEs9eQpDT05GSUdfSFdfUkFORE9NX0VYWU5P
Uz15CkNPTkZJR19IV19SQU5ET01fTlBDTT15CkNPTkZJR19IV19SQU5ET01fS0VZU1RPTkU9eQoj
IENPTkZJR19IV19SQU5ET01fQ0NUUk5HIGlzIG5vdCBzZXQKIyBDT05GSUdfSFdfUkFORE9NX1hJ
UEhFUkEgaXMgbm90IHNldApDT05GSUdfREVWTUVNPXkKQ09ORklHX1RDR19UUE09eQojIENPTkZJ
R19IV19SQU5ET01fVFBNIGlzIG5vdCBzZXQKQ09ORklHX1RDR19USVNfQ09SRT15CkNPTkZJR19U
Q0dfVElTPXkKQ09ORklHX1RDR19USVNfU1BJPXkKIyBDT05GSUdfVENHX1RJU19TUElfQ1I1MCBp
cyBub3Qgc2V0CiMgQ09ORklHX1RDR19USVNfU1lOUVVBQ0VSIGlzIG5vdCBzZXQKQ09ORklHX1RD
R19USVNfSTJDX0NSNTA9eQpDT05GSUdfVENHX1RJU19JMkNfQVRNRUw9eQojIENPTkZJR19UQ0df
VElTX0kyQ19JTkZJTkVPTiBpcyBub3Qgc2V0CkNPTkZJR19UQ0dfVElTX0kyQ19OVVZPVE9OPXkK
Q09ORklHX1RDR19WVFBNX1BST1hZPXkKQ09ORklHX1RDR19USVNfU1QzM1pQMjQ9eQpDT05GSUdf
VENHX1RJU19TVDMzWlAyNF9JMkM9eQpDT05GSUdfVENHX1RJU19TVDMzWlAyNF9TUEk9eQpDT05G
SUdfWElMTFlCVVNfQ0xBU1M9eQpDT05GSUdfWElMTFlCVVM9eQojIENPTkZJR19YSUxMWUJVU19P
RiBpcyBub3Qgc2V0CiMgQ09ORklHX1JBTkRPTV9UUlVTVF9CT09UTE9BREVSIGlzIG5vdCBzZXQK
IyBlbmQgb2YgQ2hhcmFjdGVyIGRldmljZXMKCiMKIyBJMkMgc3VwcG9ydAojCkNPTkZJR19JMkM9
eQpDT05GSUdfSTJDX0JPQVJESU5GTz15CiMgQ09ORklHX0kyQ19DT01QQVQgaXMgbm90IHNldAoj
IENPTkZJR19JMkNfQ0hBUkRFViBpcyBub3Qgc2V0CkNPTkZJR19JMkNfTVVYPXkKCiMKIyBNdWx0
aXBsZXhlciBJMkMgQ2hpcCBzdXBwb3J0CiMKIyBDT05GSUdfSTJDX0FSQl9HUElPX0NIQUxMRU5H
RSBpcyBub3Qgc2V0CkNPTkZJR19JMkNfTVVYX0dQSU89eQojIENPTkZJR19JMkNfTVVYX0dQTVVY
IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX01VWF9MVEM0MzA2IGlzIG5vdCBzZXQKIyBDT05GSUdf
STJDX01VWF9QQ0E5NTQxIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX01VWF9QQ0E5NTR4IGlzIG5v
dCBzZXQKQ09ORklHX0kyQ19NVVhfUElOQ1RSTD15CkNPTkZJR19JMkNfTVVYX1JFRz15CiMgQ09O
RklHX0kyQ19ERU1VWF9QSU5DVFJMIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19NVVhfTUxYQ1BMRD15
CiMgZW5kIG9mIE11bHRpcGxleGVyIEkyQyBDaGlwIHN1cHBvcnQKCiMgQ09ORklHX0kyQ19IRUxQ
RVJfQVVUTyBpcyBub3Qgc2V0CkNPTkZJR19JMkNfU01CVVM9eQoKIwojIEkyQyBBbGdvcml0aG1z
CiMKQ09ORklHX0kyQ19BTEdPQklUPXkKQ09ORklHX0kyQ19BTEdPUENGPXkKIyBDT05GSUdfSTJD
X0FMR09QQ0EgaXMgbm90IHNldAojIGVuZCBvZiBJMkMgQWxnb3JpdGhtcwoKIwojIEkyQyBIYXJk
d2FyZSBCdXMgc3VwcG9ydAojCiMgQ09ORklHX0kyQ19ISVg1SEQyIGlzIG5vdCBzZXQKCiMKIyBJ
MkMgc3lzdGVtIGJ1cyBkcml2ZXJzIChtb3N0bHkgZW1iZWRkZWQgLyBzeXN0ZW0tb24tY2hpcCkK
IwojIENPTkZJR19JMkNfQUxURVJBIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0FTUEVFRCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0kyQ19BVDkxIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0FYWElBIGlz
IG5vdCBzZXQKIyBDT05GSUdfSTJDX0JDTTI4MzUgaXMgbm90IHNldAojIENPTkZJR19JMkNfQkNN
X0lQUk9DIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0JDTV9LT05BIGlzIG5vdCBzZXQKQ09ORklH
X0kyQ19CUkNNU1RCPXkKIyBDT05GSUdfSTJDX0NBREVOQ0UgaXMgbm90IHNldAojIENPTkZJR19J
MkNfQ0JVU19HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0RBVklOQ0kgaXMgbm90IHNldApD
T05GSUdfSTJDX0RFU0lHTldBUkVfQ09SRT15CkNPTkZJR19JMkNfREVTSUdOV0FSRV9TTEFWRT15
CkNPTkZJR19JMkNfREVTSUdOV0FSRV9QTEFURk9STT15CiMgQ09ORklHX0kyQ19ESUdJQ09MT1Ig
aXMgbm90IHNldApDT05GSUdfSTJDX0VNRVYyPXkKIyBDT05GSUdfSTJDX0VYWU5PUzUgaXMgbm90
IHNldApDT05GSUdfSTJDX0dQSU89eQpDT05GSUdfSTJDX0dQSU9fRkFVTFRfSU5KRUNUT1I9eQoj
IENPTkZJR19JMkNfSElHSExBTkRFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19ISVNJIGlzIG5v
dCBzZXQKIyBDT05GSUdfSTJDX0lNRyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19JTVggaXMgbm90
IHNldAojIENPTkZJR19JMkNfSU1YX0xQSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0lPUDNY
WCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19KWjQ3ODAgaXMgbm90IHNldAojIENPTkZJR19JMkNf
S0VNUExEIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0xQQzJLIGlzIG5vdCBzZXQKIyBDT05GSUdf
STJDX01FU09OIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX01UNjVYWCBpcyBub3Qgc2V0CiMgQ09O
RklHX0kyQ19NVDc2MjEgaXMgbm90IHNldAojIENPTkZJR19JMkNfTVY2NFhYWCBpcyBub3Qgc2V0
CiMgQ09ORklHX0kyQ19NWFMgaXMgbm90IHNldAojIENPTkZJR19JMkNfTlBDTTdYWCBpcyBub3Qg
c2V0CkNPTkZJR19JMkNfT0NPUkVTPXkKIyBDT05GSUdfSTJDX09NQVAgaXMgbm90IHNldAojIENP
TkZJR19JMkNfT1dMIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0FQUExFIGlzIG5vdCBzZXQKIyBD
T05GSUdfSTJDX1BDQV9QTEFURk9STSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19QTlggaXMgbm90
IHNldAojIENPTkZJR19JMkNfUFhBIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1FDT01fQ0NJIGlz
IG5vdCBzZXQKIyBDT05GSUdfSTJDX1FVUCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19SSUlDIGlz
IG5vdCBzZXQKIyBDT05GSUdfSTJDX1JLM1ggaXMgbm90IHNldAojIENPTkZJR19JMkNfUzNDMjQx
MCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19TSF9NT0JJTEUgaXMgbm90IHNldApDT05GSUdfSTJD
X1NJTVRFQz15CiMgQ09ORklHX0kyQ19TUFJEIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1NUIGlz
IG5vdCBzZXQKIyBDT05GSUdfSTJDX1NUTTMyRjQgaXMgbm90IHNldAojIENPTkZJR19JMkNfU1RN
MzJGNyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19TWU5RVUFDRVIgaXMgbm90IHNldAojIENPTkZJ
R19JMkNfVEVHUkFfQlBNUCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19VTklQSElFUiBpcyBub3Qg
c2V0CiMgQ09ORklHX0kyQ19VTklQSElFUl9GIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1ZFUlNB
VElMRSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19XTVQgaXMgbm90IHNldApDT05GSUdfSTJDX1hJ
TElOWD15CiMgQ09ORklHX0kyQ19YTFA5WFggaXMgbm90IHNldAojIENPTkZJR19JMkNfUkNBUiBp
cyBub3Qgc2V0CgojCiMgRXh0ZXJuYWwgSTJDL1NNQnVzIGFkYXB0ZXIgZHJpdmVycwojCkNPTkZJ
R19JMkNfUEFSUE9SVD15CkNPTkZJR19JMkNfVEFPU19FVk09eQoKIwojIE90aGVyIEkyQy9TTUJ1
cyBidXMgZHJpdmVycwojCiMgQ09ORklHX0kyQ19NTFhDUExEIGlzIG5vdCBzZXQKIyBDT05GSUdf
STJDX1ZJUlRJTyBpcyBub3Qgc2V0CiMgZW5kIG9mIEkyQyBIYXJkd2FyZSBCdXMgc3VwcG9ydAoK
Q09ORklHX0kyQ19TTEFWRT15CkNPTkZJR19JMkNfU0xBVkVfRUVQUk9NPXkKIyBDT05GSUdfSTJD
X1NMQVZFX1RFU1RVTklUIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0RFQlVHX0NPUkUgaXMgbm90
IHNldAojIENPTkZJR19JMkNfREVCVUdfQUxHTyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19ERUJV
R19CVVMgaXMgbm90IHNldAojIGVuZCBvZiBJMkMgc3VwcG9ydAoKIyBDT05GSUdfSTNDIGlzIG5v
dCBzZXQKQ09ORklHX1NQST15CkNPTkZJR19TUElfREVCVUc9eQpDT05GSUdfU1BJX01BU1RFUj15
CiMgQ09ORklHX1NQSV9NRU0gaXMgbm90IHNldAoKIwojIFNQSSBNYXN0ZXIgQ29udHJvbGxlciBE
cml2ZXJzCiMKQ09ORklHX1NQSV9BTFRFUkE9eQpDT05GSUdfU1BJX0FMVEVSQV9DT1JFPXkKQ09O
RklHX1NQSV9BTFRFUkFfREZMPXkKIyBDT05GSUdfU1BJX0FSOTM0WCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NQSV9BVEg3OSBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9BUk1BREFfMzcwMCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NQSV9BU1BFRURfU01DIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX0FUTUVM
IGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX0FUTUVMX1FVQURTUEkgaXMgbm90IHNldAojIENPTkZJ
R19TUElfQVhJX1NQSV9FTkdJTkUgaXMgbm90IHNldAojIENPTkZJR19TUElfQkNNMjgzNSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NQSV9CQ00yODM1QVVYIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX0JD
TTYzWFggaXMgbm90IHNldAojIENPTkZJR19TUElfQkNNNjNYWF9IU1NQSSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NQSV9CQ01fUVNQSSBpcyBub3Qgc2V0CkNPTkZJR19TUElfQklUQkFORz15CkNPTkZJ
R19TUElfQlVUVEVSRkxZPXkKQ09ORklHX1NQSV9DQURFTkNFPXkKIyBDT05GSUdfU1BJX0NBREVO
Q0VfUVVBRFNQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9DTFBTNzExWCBpcyBub3Qgc2V0CkNP
TkZJR19TUElfREVTSUdOV0FSRT15CiMgQ09ORklHX1NQSV9EV19ETUEgaXMgbm90IHNldApDT05G
SUdfU1BJX0RXX01NSU89eQojIENPTkZJR19TUElfRFdfQlQxIGlzIG5vdCBzZXQKIyBDT05GSUdf
U1BJX0VQOTNYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9GU0xfTFBTUEkgaXMgbm90IHNldAoj
IENPTkZJR19TUElfRlNMX1FVQURTUEkgaXMgbm90IHNldAojIENPTkZJR19TUElfSElTSV9LVU5Q
RU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX0hJU0lfU0ZDX1YzWFggaXMgbm90IHNldAojIENP
TkZJR19TUElfTlhQX0ZMRVhTUEkgaXMgbm90IHNldAojIENPTkZJR19TUElfR1BJTyBpcyBub3Qg
c2V0CiMgQ09ORklHX1NQSV9JTUdfU1BGSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9JTVggaXMg
bm90IHNldAojIENPTkZJR19TUElfSU5HRU5JQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9KQ09S
RSBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9MTTcwX0xMUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NQ
SV9MUDg4NDFfUlRDIGlzIG5vdCBzZXQKQ09ORklHX1NQSV9GU0xfTElCPXkKQ09ORklHX1NQSV9G
U0xfU1BJPXkKIyBDT05GSUdfU1BJX0ZTTF9EU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX01F
U09OX1NQSUNDIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX01FU09OX1NQSUZDIGlzIG5vdCBzZXQK
IyBDT05GSUdfU1BJX01UNjVYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9NVDc2MjEgaXMgbm90
IHNldAojIENPTkZJR19TUElfTVRLX05PUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9OUENNX0ZJ
VSBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9OUENNX1BTUEkgaXMgbm90IHNldAojIENPTkZJR19T
UElfTEFOVElRX1NTQyBpcyBub3Qgc2V0CkNPTkZJR19TUElfT0NfVElOWT15CiMgQ09ORklHX1NQ
SV9PTUFQMjRYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9USV9RU1BJIGlzIG5vdCBzZXQKIyBD
T05GSUdfU1BJX09NQVBfMTAwSyBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9PUklPTiBpcyBub3Qg
c2V0CiMgQ09ORklHX1NQSV9QSUMzMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9QSUMzMl9TUUkg
aXMgbm90IHNldAojIENPTkZJR19TUElfUFhBMlhYIGlzIG5vdCBzZXQKQ09ORklHX1NQSV9ST0NL
Q0hJUD15CiMgQ09ORklHX1NQSV9ST0NLQ0hJUF9TRkMgaXMgbm90IHNldAojIENPTkZJR19TUElf
UlNQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9RVVAgaXMgbm90IHNldAojIENPTkZJR19TUElf
UzNDNjRYWCBpcyBub3Qgc2V0CkNPTkZJR19TUElfU0MxOElTNjAyPXkKIyBDT05GSUdfU1BJX1NI
X01TSU9GIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX1NIIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJ
X1NIX0hTUEkgaXMgbm90IHNldApDT05GSUdfU1BJX1NJRklWRT15CiMgQ09ORklHX1NQSV9TTEFW
RV9NVDI3WFggaXMgbm90IHNldAojIENPTkZJR19TUElfU1BSRCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NQSV9TUFJEX0FESSBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9TVE0zMiBpcyBub3Qgc2V0CiMg
Q09ORklHX1NQSV9TVF9TU0M0IGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX1NVTjRJIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU1BJX1NVTlBMVVNfU1A3MDIxIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX1NZ
TlFVQUNFUiBpcyBub3Qgc2V0CkNPTkZJR19TUElfTVhJQz15CiMgQ09ORklHX1NQSV9VTklQSElF
UiBpcyBub3Qgc2V0CkNPTkZJR19TUElfWENPTU09eQpDT05GSUdfU1BJX1hJTElOWD15CiMgQ09O
RklHX1NQSV9YTFAgaXMgbm90IHNldAojIENPTkZJR19TUElfWFRFTlNBX1hURlBHQSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NQSV9aWU5RX1FTUEkgaXMgbm90IHNldApDT05GSUdfU1BJX1pZTlFNUF9H
UVNQST15CiMgQ09ORklHX1NQSV9BTUQgaXMgbm90IHNldAoKIwojIFNQSSBNdWx0aXBsZXhlciBz
dXBwb3J0CiMKIyBDT05GSUdfU1BJX01VWCBpcyBub3Qgc2V0CgojCiMgU1BJIFByb3RvY29sIE1h
c3RlcnMKIwojIENPTkZJR19TUElfU1BJREVWIGlzIG5vdCBzZXQKQ09ORklHX1NQSV9UTEU2Mlgw
PXkKQ09ORklHX1NQSV9TTEFWRT15CiMgQ09ORklHX1NQSV9TTEFWRV9USU1FIGlzIG5vdCBzZXQK
IyBDT05GSUdfU1BJX1NMQVZFX1NZU1RFTV9DT05UUk9MIGlzIG5vdCBzZXQKQ09ORklHX1NQSV9E
WU5BTUlDPXkKQ09ORklHX1NQTUk9eQojIENPTkZJR19TUE1JX0hJU0kzNjcwIGlzIG5vdCBzZXQK
IyBDT05GSUdfU1BNSV9NU01fUE1JQ19BUkIgaXMgbm90IHNldAojIENPTkZJR19TUE1JX01US19Q
TUlGIGlzIG5vdCBzZXQKQ09ORklHX0hTST15CkNPTkZJR19IU0lfQk9BUkRJTkZPPXkKCiMKIyBI
U0kgY29udHJvbGxlcnMKIwoKIwojIEhTSSBjbGllbnRzCiMKQ09ORklHX0hTSV9DSEFSPXkKQ09O
RklHX1BQUz15CiMgQ09ORklHX1BQU19ERUJVRyBpcyBub3Qgc2V0CgojCiMgUFBTIGNsaWVudHMg
c3VwcG9ydAojCkNPTkZJR19QUFNfQ0xJRU5UX0tUSU1FUj15CiMgQ09ORklHX1BQU19DTElFTlRf
TERJU0MgaXMgbm90IHNldAojIENPTkZJR19QUFNfQ0xJRU5UX1BBUlBPUlQgaXMgbm90IHNldAoj
IENPTkZJR19QUFNfQ0xJRU5UX0dQSU8gaXMgbm90IHNldAoKIwojIFBQUyBnZW5lcmF0b3JzIHN1
cHBvcnQKIwoKIwojIFBUUCBjbG9jayBzdXBwb3J0CiMKIyBDT05GSUdfUFRQXzE1ODhfQ0xPQ0sg
aXMgbm90IHNldApDT05GSUdfUFRQXzE1ODhfQ0xPQ0tfT1BUSU9OQUw9eQoKIwojIEVuYWJsZSBQ
SFlMSUIgYW5kIE5FVFdPUktfUEhZX1RJTUVTVEFNUElORyB0byBzZWUgdGhlIGFkZGl0aW9uYWwg
Y2xvY2tzLgojCiMgZW5kIG9mIFBUUCBjbG9jayBzdXBwb3J0CgpDT05GSUdfUElOQ1RSTD15CkNP
TkZJR19HRU5FUklDX1BJTkNUUkxfR1JPVVBTPXkKQ09ORklHX1BJTk1VWD15CkNPTkZJR19HRU5F
UklDX1BJTk1VWF9GVU5DVElPTlM9eQpDT05GSUdfUElOQ09ORj15CkNPTkZJR19HRU5FUklDX1BJ
TkNPTkY9eQojIENPTkZJR19ERUJVR19QSU5DVFJMIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RS
TF9BTUQgaXMgbm90IHNldApDT05GSUdfUElOQ1RSTF9BUzM3MjI9eQojIENPTkZJR19QSU5DVFJM
X0FUOTFQSU80IGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9BWFAyMDkgaXMgbm90IHNldAoj
IENPTkZJR19QSU5DVFJMX0JNMTg4MCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfREE4NTBf
UFVQRCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfRVFVSUxJQlJJVU0gaXMgbm90IHNldAoj
IENPTkZJR19QSU5DVFJMX0lOR0VOSUMgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX0xQQzE4
WFggaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX01BWDc3NjIwIGlzIG5vdCBzZXQKQ09ORklH
X1BJTkNUUkxfTUNQMjNTMDhfSTJDPXkKQ09ORklHX1BJTkNUUkxfTUNQMjNTMDhfU1BJPXkKQ09O
RklHX1BJTkNUUkxfTUNQMjNTMDg9eQpDT05GSUdfUElOQ1RSTF9NSUNST0NISVBfU0dQSU89eQpD
T05GSUdfUElOQ1RSTF9PQ0VMT1Q9eQojIENPTkZJR19QSU5DVFJMX1BBTE1BUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1BJTkNUUkxfUElTVEFDSElPIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9S
T0NLQ0hJUCBpcyBub3Qgc2V0CkNPTkZJR19QSU5DVFJMX1NJTkdMRT15CiMgQ09ORklHX1BJTkNU
UkxfU1RBUkZJVkUgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1NUTUZYIGlzIG5vdCBzZXQK
Q09ORklHX1BJTkNUUkxfU1gxNTBYPXkKIyBDT05GSUdfUElOQ1RSTF9PV0wgaXMgbm90IHNldAoj
IENPTkZJR19QSU5DVFJMX0FTUEVFRF9HNCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfQVNQ
RUVEX0c1IGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9BU1BFRURfRzYgaXMgbm90IHNldAoj
IENPTkZJR19QSU5DVFJMX0JDTTI4MVhYIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9CQ00y
ODM1IGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9CQ000OTA4IGlzIG5vdCBzZXQKIyBDT05G
SUdfUElOQ1RSTF9CQ002MzE4IGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9CQ002MzI4IGlz
IG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9CQ002MzU4IGlzIG5vdCBzZXQKIyBDT05GSUdfUElO
Q1RSTF9CQ002MzYyIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9CQ002MzY4IGlzIG5vdCBz
ZXQKIyBDT05GSUdfUElOQ1RSTF9CQ002MzI2OCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxf
SVBST0NfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfQ1lHTlVTX01VWCBpcyBub3Qg
c2V0CiMgQ09ORklHX1BJTkNUUkxfTlMgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX05TUF9H
UElPIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9OUzJfTVVYIGlzIG5vdCBzZXQKIyBDT05G
SUdfUElOQ1RSTF9OU1BfTVVYIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9BUzM3MCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfQkVSTElOX0JHNENUIGlzIG5vdCBzZXQKQ09ORklHX1BJ
TkNUUkxfTUFERVJBPXkKQ09ORklHX1BJTkNUUkxfQ1M0N0wxNT15CkNPTkZJR19QSU5DVFJMX0NT
NDdMMzU9eQpDT05GSUdfUElOQ1RSTF9DUzQ3TDg1PXkKCiMKIyBJbnRlbCBwaW5jdHJsIGRyaXZl
cnMKIwojIGVuZCBvZiBJbnRlbCBwaW5jdHJsIGRyaXZlcnMKCiMKIyBNZWRpYVRlayBwaW5jdHJs
IGRyaXZlcnMKIwpDT05GSUdfRUlOVF9NVEs9eQpDT05GSUdfUElOQ1RSTF9NVEs9eQojIENPTkZJ
R19QSU5DVFJMX01UMjcwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfTVQ3NjIzIGlzIG5v
dCBzZXQKIyBDT05GSUdfUElOQ1RSTF9NVDc2MjkgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJM
X01UODEzNSBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfTVQ4MTI3IGlzIG5vdCBzZXQKIyBD
T05GSUdfUElOQ1RSTF9NVDI3MTIgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX01UNjc2NSBp
cyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfTVQ2Nzc5IGlzIG5vdCBzZXQKIyBDT05GSUdfUElO
Q1RSTF9NVDY3OTUgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX01UNjc5NyBpcyBub3Qgc2V0
CiMgQ09ORklHX1BJTkNUUkxfTVQ3NjIyIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9NVDc5
ODYgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX01UODE2NyBpcyBub3Qgc2V0CiMgQ09ORklH
X1BJTkNUUkxfTVQ4MTczIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9NVDgxODMgaXMgbm90
IHNldAojIENPTkZJR19QSU5DVFJMX01UODE4NiBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxf
TVQ4MTkyIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9NVDgxOTUgaXMgbm90IHNldAojIENP
TkZJR19QSU5DVFJMX01UODM2NSBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfTVQ4NTE2IGlz
IG5vdCBzZXQKQ09ORklHX1BJTkNUUkxfTVQ2Mzk3PXkKIyBlbmQgb2YgTWVkaWFUZWsgcGluY3Ry
bCBkcml2ZXJzCgpDT05GSUdfUElOQ1RSTF9NRVNPTj15CiMgQ09ORklHX1BJTkNUUkxfV1BDTTQ1
MCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfTlBDTTdYWCBpcyBub3Qgc2V0CiMgQ09ORklH
X1BJTkNUUkxfUFhBMjVYIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9QWEEyN1ggaXMgbm90
IHNldAojIENPTkZJR19QSU5DVFJMX01TTSBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfUUNP
TV9TUE1JX1BNSUMgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1FDT01fU1NCSV9QTUlDIGlz
IG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9TTTg0NTAgaXMgbm90IHNldAojIENPTkZJR19QSU5D
VFJMX0xQQVNTX0xQSSBpcyBub3Qgc2V0CgojCiMgUmVuZXNhcyBwaW5jdHJsIGRyaXZlcnMKIwoj
IENPTkZJR19QSU5DVFJMX1JFTkVTQVMgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1BGQ19F
TUVWMiBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfUEZDX1I4QTc3OTk1IGlzIG5vdCBzZXQK
IyBDT05GSUdfUElOQ1RSTF9QRkNfUjhBNzc5NCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxf
UEZDX1I4QTc3OTkwIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9QRkNfUjhBNzc3OSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfUEZDX1I4QTc3OTAgaXMgbm90IHNldAojIENPTkZJR19Q
SU5DVFJMX1BGQ19SOEE3Nzk1MCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfUEZDX1I4QTc3
OTUxIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9QRkNfUjhBNzc3OCBpcyBub3Qgc2V0CiMg
Q09ORklHX1BJTkNUUkxfUEZDX1I4QTc3OTMgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1BG
Q19SOEE3NzkxIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9QRkNfUjhBNzc5NjUgaXMgbm90
IHNldAojIENPTkZJR19QSU5DVFJMX1BGQ19SOEE3Nzk2MCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJ
TkNUUkxfUEZDX1I4QTc3OTYxIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9QRkNfUjhBNzc5
RjAgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1BGQ19SOEE3NzkyIGlzIG5vdCBzZXQKIyBD
T05GSUdfUElOQ1RSTF9QRkNfUjhBNzc5ODAgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1BG
Q19SOEE3Nzk3MCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfUEZDX1I4QTc3OUEwIGlzIG5v
dCBzZXQKIyBDT05GSUdfUElOQ1RSTF9QRkNfUjhBNzc0MCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJ
TkNUUkxfUEZDX1I4QTczQTQgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1JaQTEgaXMgbm90
IHNldAojIENPTkZJR19QSU5DVFJMX1JaQTIgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1Ja
RzJMIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9QRkNfUjhBNzc0NzAgaXMgbm90IHNldAoj
IENPTkZJR19QSU5DVFJMX1BGQ19SOEE3NzQ1IGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9Q
RkNfUjhBNzc0MiBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfUEZDX1I4QTc3NDMgaXMgbm90
IHNldAojIENPTkZJR19QSU5DVFJMX1BGQ19SOEE3NzQ0IGlzIG5vdCBzZXQKIyBDT05GSUdfUElO
Q1RSTF9QRkNfUjhBNzc0QzAgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1BGQ19SOEE3NzRF
MSBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfUEZDX1I4QTc3NEExIGlzIG5vdCBzZXQKIyBD
T05GSUdfUElOQ1RSTF9QRkNfUjhBNzc0QjEgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1Ja
TjEgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1BGQ19TSDcyMDMgaXMgbm90IHNldAojIENP
TkZJR19QSU5DVFJMX1BGQ19TSDcyNjQgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1BGQ19T
SDcyNjkgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1BGQ19TSDc3MjAgaXMgbm90IHNldAoj
IENPTkZJR19QSU5DVFJMX1BGQ19TSDc3MjIgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1BG
Q19TSDc3MzQgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1BGQ19TSDc3NTcgaXMgbm90IHNl
dAojIENPTkZJR19QSU5DVFJMX1BGQ19TSDc3ODUgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJM
X1BGQ19TSDc3ODYgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1BGQ19TSDczQTAgaXMgbm90
IHNldAojIENPTkZJR19QSU5DVFJMX1BGQ19TSDc3MjMgaXMgbm90IHNldAojIENPTkZJR19QSU5D
VFJMX1BGQ19TSDc3MjQgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1BGQ19TSFgzIGlzIG5v
dCBzZXQKIyBlbmQgb2YgUmVuZXNhcyBwaW5jdHJsIGRyaXZlcnMKCiMgQ09ORklHX1BJTkNUUkxf
RVhZTk9TIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9TM0MyNFhYIGlzIG5vdCBzZXQKIyBD
T05GSUdfUElOQ1RSTF9TM0M2NFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9TUFJEX1ND
OTg2MCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfU1RNMzJGNDI5IGlzIG5vdCBzZXQKIyBD
T05GSUdfUElOQ1RSTF9TVE0zMkY0NjkgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1NUTTMy
Rjc0NiBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfU1RNMzJGNzY5IGlzIG5vdCBzZXQKIyBD
T05GSUdfUElOQ1RSTF9TVE0zMkg3NDMgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1NUTTMy
TVAxMzUgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1NUTTMyTVAxNTcgaXMgbm90IHNldAoj
IENPTkZJR19QSU5DVFJMX1RJX0lPREVMQVkgaXMgbm90IHNldApDT05GSUdfUElOQ1RSTF9VTklQ
SElFUj15CiMgQ09ORklHX1BJTkNUUkxfVU5JUEhJRVJfTEQ0IGlzIG5vdCBzZXQKIyBDT05GSUdf
UElOQ1RSTF9VTklQSElFUl9QUk80IGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9VTklQSElF
Ul9TTEQ4IGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9VTklQSElFUl9QUk81IGlzIG5vdCBz
ZXQKIyBDT05GSUdfUElOQ1RSTF9VTklQSElFUl9QWFMyIGlzIG5vdCBzZXQKIyBDT05GSUdfUElO
Q1RSTF9VTklQSElFUl9MRDZCIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9VTklQSElFUl9M
RDExIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9VTklQSElFUl9MRDIwIGlzIG5vdCBzZXQK
IyBDT05GSUdfUElOQ1RSTF9VTklQSElFUl9QWFMzIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RS
TF9VTklQSElFUl9OWDEgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1RNUFY3NzAwIGlzIG5v
dCBzZXQKQ09ORklHX0dQSU9MSUI9eQpDT05GSUdfR1BJT0xJQl9GQVNUUEFUSF9MSU1JVD01MTIK
Q09ORklHX09GX0dQSU89eQpDT05GSUdfR1BJT0xJQl9JUlFDSElQPXkKQ09ORklHX0RFQlVHX0dQ
SU89eQpDT05GSUdfR1BJT19DREVWPXkKQ09ORklHX0dQSU9fQ0RFVl9WMT15CkNPTkZJR19HUElP
X0dFTkVSSUM9eQpDT05GSUdfR1BJT19NQVg3MzBYPXkKCiMKIyBNZW1vcnkgbWFwcGVkIEdQSU8g
ZHJpdmVycwojCkNPTkZJR19HUElPXzc0WFhfTU1JTz15CiMgQ09ORklHX0dQSU9fQUxURVJBIGlz
IG5vdCBzZXQKIyBDT05GSUdfR1BJT19BU1BFRUQgaXMgbm90IHNldAojIENPTkZJR19HUElPX0FT
UEVFRF9TR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fQVRINzkgaXMgbm90IHNldAojIENP
TkZJR19HUElPX1JBU1BCRVJSWVBJX0VYUCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fQkNNX0tP
TkEgaXMgbm90IHNldAojIENPTkZJR19HUElPX0JDTV9YR1NfSVBST0MgaXMgbm90IHNldAojIENP
TkZJR19HUElPX0JSQ01TVEIgaXMgbm90IHNldAojIENPTkZJR19HUElPX0NBREVOQ0UgaXMgbm90
IHNldAojIENPTkZJR19HUElPX0NMUFM3MTFYIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19EV0FQ
QiBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fRUlDX1NQUkQgaXMgbm90IHNldAojIENPTkZJR19H
UElPX0VNIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19GVEdQSU8wMTAgaXMgbm90IHNldAojIENP
TkZJR19HUElPX0dFTkVSSUNfUExBVEZPUk0gaXMgbm90IHNldAojIENPTkZJR19HUElPX0dSR1BJ
TyBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fSElTSSBpcyBub3Qgc2V0CkNPTkZJR19HUElPX0hM
V0Q9eQojIENPTkZJR19HUElPX0lPUCBpcyBub3Qgc2V0CkNPTkZJR19HUElPX0xPR0lDVkM9eQoj
IENPTkZJR19HUElPX0xQQzE4WFggaXMgbm90IHNldAojIENPTkZJR19HUElPX0xQQzMyWFggaXMg
bm90IHNldApDT05GSUdfR1BJT19NQjg2UzdYPXkKQ09ORklHX0dQSU9fTUVOWjEyNz15CiMgQ09O
RklHX0dQSU9fTVBDOFhYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fTVQ3NjIxIGlzIG5vdCBz
ZXQKIyBDT05GSUdfR1BJT19NWEMgaXMgbm90IHNldAojIENPTkZJR19HUElPX01YUyBpcyBub3Qg
c2V0CiMgQ09ORklHX0dQSU9fUE1JQ19FSUNfU1BSRCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9f
UFhBIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19SQ0FSIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJ
T19SREEgaXMgbm90IHNldAojIENPTkZJR19HUElPX1JPQ0tDSElQIGlzIG5vdCBzZXQKQ09ORklH
X0dQSU9fU0FNQTVEMl9QSU9CVT15CiMgQ09ORklHX0dQSU9fU0lGSVZFIGlzIG5vdCBzZXQKQ09O
RklHX0dQSU9fU0lPWD15CiMgQ09ORklHX0dQSU9fU05QU19DUkVHIGlzIG5vdCBzZXQKIyBDT05G
SUdfR1BJT19TUFJEIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19TVFBfWFdBWSBpcyBub3Qgc2V0
CkNPTkZJR19HUElPX1NZU0NPTj15CiMgQ09ORklHX0dQSU9fVEVHUkEgaXMgbm90IHNldAojIENP
TkZJR19HUElPX1RFR1JBMTg2IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19UUzQ4MDAgaXMgbm90
IHNldAojIENPTkZJR19HUElPX1VOSVBISUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19WSVND
T05USSBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fWEdFTkVfU0IgaXMgbm90IHNldApDT05GSUdf
R1BJT19YSUxJTlg9eQojIENPTkZJR19HUElPX1hMUCBpcyBub3Qgc2V0CkNPTkZJR19HUElPX0FN
RF9GQ0g9eQojIENPTkZJR19HUElPX0lEVDMyNDNYIGlzIG5vdCBzZXQKIyBlbmQgb2YgTWVtb3J5
IG1hcHBlZCBHUElPIGRyaXZlcnMKCiMKIyBJMkMgR1BJTyBleHBhbmRlcnMKIwpDT05GSUdfR1BJ
T19BRFA1NTg4PXkKIyBDT05GSUdfR1BJT19BRFA1NTg4X0lSUSBpcyBub3Qgc2V0CkNPTkZJR19H
UElPX0FETlA9eQpDT05GSUdfR1BJT19HV19QTEQ9eQpDT05GSUdfR1BJT19NQVg3MzAwPXkKQ09O
RklHX0dQSU9fTUFYNzMyWD15CiMgQ09ORklHX0dQSU9fTUFYNzMyWF9JUlEgaXMgbm90IHNldAoj
IENPTkZJR19HUElPX1BDQTk1M1ggaXMgbm90IHNldApDT05GSUdfR1BJT19QQ0E5NTcwPXkKQ09O
RklHX0dQSU9fUENGODU3WD15CiMgQ09ORklHX0dQSU9fVFBJQzI4MTAgaXMgbm90IHNldAojIENP
TkZJR19HUElPX1RTNDkwMCBpcyBub3Qgc2V0CiMgZW5kIG9mIEkyQyBHUElPIGV4cGFuZGVycwoK
IwojIE1GRCBHUElPIGV4cGFuZGVycwojCkNPTkZJR19HUElPX0FSSVpPTkE9eQpDT05GSUdfR1BJ
T19CRDcxODE1PXkKIyBDT05GSUdfR1BJT19CRDcxODI4IGlzIG5vdCBzZXQKQ09ORklHX0dQSU9f
REE5MDUyPXkKQ09ORklHX0dQSU9fS0VNUExEPXkKQ09ORklHX0dQSU9fTFA4NzNYPXkKIyBDT05G
SUdfR1BJT19MUDg3NTY1IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19NQURFUkEgaXMgbm90IHNl
dApDT05GSUdfR1BJT19NQVg3NzYyMD15CkNPTkZJR19HUElPX01BWDc3NjUwPXkKIyBDT05GSUdf
R1BJT19QQUxNQVMgaXMgbm90IHNldAojIENPTkZJR19HUElPX1NMMjhDUExEIGlzIG5vdCBzZXQK
IyBDT05GSUdfR1BJT19TVE1QRSBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fVEMzNTg5WCBpcyBu
b3Qgc2V0CkNPTkZJR19HUElPX1RQUzY1MDg2PXkKIyBDT05GSUdfR1BJT19UUFM2NTg2WCBpcyBu
b3Qgc2V0CkNPTkZJR19HUElPX1RQUzY1OTEyPXkKQ09ORklHX0dQSU9fVFdMNDAzMD15CkNPTkZJ
R19HUElPX1RXTDYwNDA9eQpDT05GSUdfR1BJT19XTTgzMVg9eQpDT05GSUdfR1BJT19XTTg5OTQ9
eQojIGVuZCBvZiBNRkQgR1BJTyBleHBhbmRlcnMKCiMKIyBTUEkgR1BJTyBleHBhbmRlcnMKIwpD
T05GSUdfR1BJT183NFgxNjQ9eQojIENPTkZJR19HUElPX01BWDMxOTFYIGlzIG5vdCBzZXQKQ09O
RklHX0dQSU9fTUFYNzMwMT15CkNPTkZJR19HUElPX01DMzM4ODA9eQpDT05GSUdfR1BJT19QSVNP
U1I9eQojIENPTkZJR19HUElPX1hSQTE0MDMgaXMgbm90IHNldAojIGVuZCBvZiBTUEkgR1BJTyBl
eHBhbmRlcnMKCiMKIyBWaXJ0dWFsIEdQSU8gZHJpdmVycwojCkNPTkZJR19HUElPX0FHR1JFR0FU
T1I9eQojIENPTkZJR19HUElPX01PQ0tVUCBpcyBub3Qgc2V0CkNPTkZJR19HUElPX1ZJUlRJTz15
CkNPTkZJR19HUElPX1NJTT15CiMgZW5kIG9mIFZpcnR1YWwgR1BJTyBkcml2ZXJzCgpDT05GSUdf
VzE9eQojIENPTkZJR19XMV9DT04gaXMgbm90IHNldAoKIwojIDEtd2lyZSBCdXMgTWFzdGVycwoj
CkNPTkZJR19XMV9NQVNURVJfRFMyNDgyPXkKIyBDT05GSUdfVzFfTUFTVEVSX01YQyBpcyBub3Qg
c2V0CkNPTkZJR19XMV9NQVNURVJfRFMxV009eQojIENPTkZJR19XMV9NQVNURVJfR1BJTyBpcyBu
b3Qgc2V0CkNPTkZJR19XMV9NQVNURVJfU0dJPXkKIyBlbmQgb2YgMS13aXJlIEJ1cyBNYXN0ZXJz
CgojCiMgMS13aXJlIFNsYXZlcwojCkNPTkZJR19XMV9TTEFWRV9USEVSTT15CkNPTkZJR19XMV9T
TEFWRV9TTUVNPXkKQ09ORklHX1cxX1NMQVZFX0RTMjQwNT15CkNPTkZJR19XMV9TTEFWRV9EUzI0
MDg9eQojIENPTkZJR19XMV9TTEFWRV9EUzI0MDhfUkVBREJBQ0sgaXMgbm90IHNldApDT05GSUdf
VzFfU0xBVkVfRFMyNDEzPXkKQ09ORklHX1cxX1NMQVZFX0RTMjQwNj15CkNPTkZJR19XMV9TTEFW
RV9EUzI0MjM9eQojIENPTkZJR19XMV9TTEFWRV9EUzI4MDUgaXMgbm90IHNldAojIENPTkZJR19X
MV9TTEFWRV9EUzI0MzAgaXMgbm90IHNldApDT05GSUdfVzFfU0xBVkVfRFMyNDMxPXkKIyBDT05G
SUdfVzFfU0xBVkVfRFMyNDMzIGlzIG5vdCBzZXQKQ09ORklHX1cxX1NMQVZFX0RTMjQzOD15CkNP
TkZJR19XMV9TTEFWRV9EUzI1MFg9eQpDT05GSUdfVzFfU0xBVkVfRFMyNzgwPXkKQ09ORklHX1cx
X1NMQVZFX0RTMjc4MT15CiMgQ09ORklHX1cxX1NMQVZFX0RTMjhFMDQgaXMgbm90IHNldAojIENP
TkZJR19XMV9TTEFWRV9EUzI4RTE3IGlzIG5vdCBzZXQKIyBlbmQgb2YgMS13aXJlIFNsYXZlcwoK
Q09ORklHX1BPV0VSX1JFU0VUPXkKQ09ORklHX1BPV0VSX1JFU0VUX0FTMzcyMj15CkNPTkZJR19Q
T1dFUl9SRVNFVF9BVEMyNjBYPXkKIyBDT05GSUdfUE9XRVJfUkVTRVRfQlJDTUtPTkEgaXMgbm90
IHNldAojIENPTkZJR19QT1dFUl9SRVNFVF9CUkNNU1RCIGlzIG5vdCBzZXQKIyBDT05GSUdfUE9X
RVJfUkVTRVRfR0VNSU5JX1BPV0VST0ZGIGlzIG5vdCBzZXQKIyBDT05GSUdfUE9XRVJfUkVTRVRf
R1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX1BPV0VSX1JFU0VUX0dQSU9fUkVTVEFSVCBpcyBub3Qg
c2V0CiMgQ09ORklHX1BPV0VSX1JFU0VUX0xJTktTVEFUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdf
UE9XRVJfUkVTRVRfT0NFTE9UX1JFU0VUIGlzIG5vdCBzZXQKIyBDT05GSUdfUE9XRVJfUkVTRVRf
TFRDMjk1MiBpcyBub3Qgc2V0CiMgQ09ORklHX1BPV0VSX1JFU0VUX01UNjMyMyBpcyBub3Qgc2V0
CiMgQ09ORklHX1BPV0VSX1JFU0VUX1JFR1VMQVRPUiBpcyBub3Qgc2V0CiMgQ09ORklHX1BPV0VS
X1JFU0VUX1JFU1RBUlQgaXMgbm90IHNldAojIENPTkZJR19QT1dFUl9SRVNFVF9UUFM2NTA4NiBp
cyBub3Qgc2V0CiMgQ09ORklHX1BPV0VSX1JFU0VUX0tFWVNUT05FIGlzIG5vdCBzZXQKQ09ORklH
X1BPV0VSX1JFU0VUX1NZU0NPTj15CiMgQ09ORklHX1BPV0VSX1JFU0VUX1NZU0NPTl9QT1dFUk9G
RiBpcyBub3Qgc2V0CiMgQ09ORklHX1BPV0VSX1JFU0VUX1JNT0JJTEUgaXMgbm90IHNldApDT05G
SUdfUkVCT09UX01PREU9eQpDT05GSUdfU1lTQ09OX1JFQk9PVF9NT0RFPXkKIyBDT05GSUdfUE9X
RVJfUkVTRVRfU0MyN1hYIGlzIG5vdCBzZXQKQ09ORklHX05WTUVNX1JFQk9PVF9NT0RFPXkKQ09O
RklHX1BPV0VSX1NVUFBMWT15CkNPTkZJR19QT1dFUl9TVVBQTFlfREVCVUc9eQpDT05GSUdfUERB
X1BPV0VSPXkKIyBDT05GSUdfR0VORVJJQ19BRENfQkFUVEVSWSBpcyBub3Qgc2V0CiMgQ09ORklH
X0lQNVhYWF9QT1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1dNODMxWF9CQUNLVVAgaXMgbm90IHNl
dApDT05GSUdfV004MzFYX1BPV0VSPXkKIyBDT05GSUdfVEVTVF9QT1dFUiBpcyBub3Qgc2V0CkNP
TkZJR19CQVRURVJZXzg4UE04NjBYPXkKIyBDT05GSUdfQ0hBUkdFUl9BRFA1MDYxIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQkFUVEVSWV9BQ1Q4OTQ1QSBpcyBub3Qgc2V0CkNPTkZJR19CQVRURVJZX0NX
MjAxNT15CkNPTkZJR19CQVRURVJZX0RTMjc2MD15CkNPTkZJR19CQVRURVJZX0RTMjc4MD15CkNP
TkZJR19CQVRURVJZX0RTMjc4MT15CiMgQ09ORklHX0JBVFRFUllfRFMyNzgyIGlzIG5vdCBzZXQK
IyBDT05GSUdfQkFUVEVSWV9MRUdPX0VWMyBpcyBub3Qgc2V0CkNPTkZJR19CQVRURVJZX1NBTVNV
TkdfU0RJPXkKIyBDT05GSUdfQkFUVEVSWV9TQlMgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VS
X1NCUyBpcyBub3Qgc2V0CkNPTkZJR19NQU5BR0VSX1NCUz15CkNPTkZJR19CQVRURVJZX0JRMjdY
WFg9eQpDT05GSUdfQkFUVEVSWV9CUTI3WFhYX0kyQz15CkNPTkZJR19CQVRURVJZX0JRMjdYWFhf
SERRPXkKQ09ORklHX0JBVFRFUllfQlEyN1hYWF9EVF9VUERBVEVTX05WTT15CiMgQ09ORklHX0JB
VFRFUllfREE5MDUyIGlzIG5vdCBzZXQKQ09ORklHX0NIQVJHRVJfQVhQMjBYPXkKQ09ORklHX0JB
VFRFUllfQVhQMjBYPXkKQ09ORklHX0FYUDIwWF9QT1dFUj15CkNPTkZJR19CQVRURVJZX01BWDE3
MDQwPXkKQ09ORklHX0JBVFRFUllfTUFYMTcwNDI9eQojIENPTkZJR19CQVRURVJZX01BWDE3MjFY
IGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9UV0w0MDMwX01BREMgaXMgbm90IHNldApDT05G
SUdfQ0hBUkdFUl84OFBNODYwWD15CkNPTkZJR19DSEFSR0VSX1BDRjUwNjMzPXkKIyBDT05GSUdf
QkFUVEVSWV9SWDUxIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9JU1AxNzA0IGlzIG5vdCBz
ZXQKQ09ORklHX0NIQVJHRVJfTUFYODkwMz15CiMgQ09ORklHX0NIQVJHRVJfVFdMNDAzMCBpcyBu
b3Qgc2V0CkNPTkZJR19DSEFSR0VSX0xQODcyNz15CiMgQ09ORklHX0NIQVJHRVJfTFA4Nzg4IGlz
IG5vdCBzZXQKQ09ORklHX0NIQVJHRVJfR1BJTz15CkNPTkZJR19DSEFSR0VSX01BTkFHRVI9eQoj
IENPTkZJR19DSEFSR0VSX0xUMzY1MSBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfTFRDNDE2
MkwgaXMgbm90IHNldApDT05GSUdfQ0hBUkdFUl9NQVgxNDU3Nz15CkNPTkZJR19DSEFSR0VSX0RF
VEVDVE9SX01BWDE0NjU2PXkKQ09ORklHX0NIQVJHRVJfTUFYNzc2NTA9eQpDT05GSUdfQ0hBUkdF
Ul9NQVg3NzY5Mz15CkNPTkZJR19DSEFSR0VSX01BWDc3OTc2PXkKQ09ORklHX0NIQVJHRVJfTVAy
NjI5PXkKQ09ORklHX0NIQVJHRVJfTVQ2MzYwPXkKIyBDT05GSUdfQ0hBUkdFUl9RQ09NX1NNQkIg
aXMgbm90IHNldApDT05GSUdfQ0hBUkdFUl9CUTI0MTVYPXkKQ09ORklHX0NIQVJHRVJfQlEyNDE5
MD15CkNPTkZJR19DSEFSR0VSX0JRMjQyNTc9eQpDT05GSUdfQ0hBUkdFUl9CUTI0NzM1PXkKQ09O
RklHX0NIQVJHRVJfQlEyNTE1WD15CkNPTkZJR19DSEFSR0VSX0JRMjU4OTA9eQpDT05GSUdfQ0hB
UkdFUl9CUTI1OTgwPXkKIyBDT05GSUdfQ0hBUkdFUl9CUTI1NlhYIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ0hBUkdFUl9TTUIzNDcgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX0dBVUdFX0xUQzI5
NDEgaXMgbm90IHNldApDT05GSUdfQkFUVEVSWV9HT0xERklTSD15CkNPTkZJR19CQVRURVJZX1JU
NTAzMz15CkNPTkZJR19DSEFSR0VSX1JUOTQ1NT15CiMgQ09ORklHX0NIQVJHRVJfU0MyNzMxIGlz
IG5vdCBzZXQKIyBDT05GSUdfRlVFTF9HQVVHRV9TQzI3WFggaXMgbm90IHNldAojIENPTkZJR19D
SEFSR0VSX1VDUzEwMDIgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0JEOTk5NTQgaXMgbm90
IHNldAojIENPTkZJR19STjVUNjE4X1BPV0VSIGlzIG5vdCBzZXQKQ09ORklHX0JBVFRFUllfVUcz
MTA1PXkKIyBDT05GSUdfSFdNT04gaXMgbm90IHNldAojIENPTkZJR19USEVSTUFMIGlzIG5vdCBz
ZXQKIyBDT05GSUdfV0FUQ0hET0cgaXMgbm90IHNldApDT05GSUdfU1NCX1BPU1NJQkxFPXkKQ09O
RklHX1NTQj15CkNPTkZJR19TU0JfU0RJT0hPU1RfUE9TU0lCTEU9eQojIENPTkZJR19TU0JfU0RJ
T0hPU1QgaXMgbm90IHNldApDT05GSUdfU1NCX0RSSVZFUl9HUElPPXkKQ09ORklHX0JDTUFfUE9T
U0lCTEU9eQpDT05GSUdfQkNNQT15CiMgQ09ORklHX0JDTUFfSE9TVF9TT0MgaXMgbm90IHNldAoj
IENPTkZJR19CQ01BX0RSSVZFUl9NSVBTIGlzIG5vdCBzZXQKQ09ORklHX0JDTUFfRFJJVkVSX0dN
QUNfQ01OPXkKQ09ORklHX0JDTUFfRFJJVkVSX0dQSU89eQojIENPTkZJR19CQ01BX0RFQlVHIGlz
IG5vdCBzZXQKCiMKIyBNdWx0aWZ1bmN0aW9uIGRldmljZSBkcml2ZXJzCiMKQ09ORklHX01GRF9D
T1JFPXkKIyBDT05GSUdfTUZEX0FDVDg5NDVBIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NVTjRJ
X0dQQURDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0FTMzcxMSBpcyBub3Qgc2V0CkNPTkZJR19N
RkRfQVMzNzIyPXkKIyBDT05GSUdfUE1JQ19BRFA1NTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZE
X0FBVDI4NzBfQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9BVDkxX1VTQVJUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUZEX0FUTUVMX0ZMRVhDT00gaXMgbm90IHNldApDT05GSUdfTUZEX0FUTUVM
X0hMQ0RDPXkKQ09ORklHX01GRF9CQ001OTBYWD15CiMgQ09ORklHX01GRF9CRDk1NzFNV1YgaXMg
bm90IHNldApDT05GSUdfTUZEX0FYUDIwWD15CkNPTkZJR19NRkRfQVhQMjBYX0kyQz15CkNPTkZJ
R19NRkRfTUFERVJBPXkKQ09ORklHX01GRF9NQURFUkFfSTJDPXkKQ09ORklHX01GRF9NQURFUkFf
U1BJPXkKQ09ORklHX01GRF9DUzQ3TDE1PXkKQ09ORklHX01GRF9DUzQ3TDM1PXkKQ09ORklHX01G
RF9DUzQ3TDg1PXkKIyBDT05GSUdfTUZEX0NTNDdMOTAgaXMgbm90IHNldAojIENPTkZJR19NRkRf
Q1M0N0w5MiBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9BU0lDMyBpcyBub3Qgc2V0CiMgQ09ORklH
X1BNSUNfREE5MDNYIGlzIG5vdCBzZXQKQ09ORklHX1BNSUNfREE5MDUyPXkKQ09ORklHX01GRF9E
QTkwNTJfU1BJPXkKIyBDT05GSUdfTUZEX0RBOTA1Ml9JMkMgaXMgbm90IHNldAojIENPTkZJR19N
RkRfREE5MDU1IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0RBOTA2MiBpcyBub3Qgc2V0CkNPTkZJ
R19NRkRfREE5MDYzPXkKIyBDT05GSUdfTUZEX0RBOTE1MCBpcyBub3Qgc2V0CiMgQ09ORklHX01G
RF9FTkVfS0IzOTMwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0VYWU5PU19MUEFTUyBpcyBub3Qg
c2V0CiMgQ09ORklHX01GRF9HQVRFV09SS1NfR1NDIGlzIG5vdCBzZXQKQ09ORklHX01GRF9NQzEz
WFhYPXkKQ09ORklHX01GRF9NQzEzWFhYX1NQST15CiMgQ09ORklHX01GRF9NQzEzWFhYX0kyQyBp
cyBub3Qgc2V0CkNPTkZJR19NRkRfTVAyNjI5PXkKIyBDT05GSUdfTUZEX01YU19MUkFEQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX01GRF9NWDI1X1RTQURDIGlzIG5vdCBzZXQKQ09ORklHX01GRF9ISTY0
MjFfUE1JQz15CkNPTkZJR19NRkRfSEk2NDIxX1NQTUk9eQojIENPTkZJR19NRkRfSEk2NTVYX1BN
SUMgaXMgbm90IHNldApDT05GSUdfSFRDX1BBU0lDMz15CkNPTkZJR19IVENfSTJDUExEPXkKQ09O
RklHX01GRF9JUVM2Mlg9eQpDT05GSUdfTUZEX0tFTVBMRD15CkNPTkZJR19NRkRfODhQTTgwMD15
CiMgQ09ORklHX01GRF84OFBNODA1IGlzIG5vdCBzZXQKQ09ORklHX01GRF84OFBNODYwWD15CkNP
TkZJR19NRkRfTUFYMTQ1Nzc9eQpDT05GSUdfTUZEX01BWDc3NjIwPXkKQ09ORklHX01GRF9NQVg3
NzY1MD15CiMgQ09ORklHX01GRF9NQVg3NzY4NiBpcyBub3Qgc2V0CkNPTkZJR19NRkRfTUFYNzc2
OTM9eQpDT05GSUdfTUZEX01BWDc3NzE0PXkKIyBDT05GSUdfTUZEX01BWDc3ODQzIGlzIG5vdCBz
ZXQKQ09ORklHX01GRF9NQVg4OTA3PXkKIyBDT05GSUdfTUZEX01BWDg5MjUgaXMgbm90IHNldAoj
IENPTkZJR19NRkRfTUFYODk5NyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NQVg4OTk4IGlzIG5v
dCBzZXQKQ09ORklHX01GRF9NVDYzNjA9eQpDT05GSUdfTUZEX01UNjM5Nz15CkNPTkZJR19NRkRf
TUVORjIxQk1DPXkKIyBDT05GSUdfRVpYX1BDQVAgaXMgbm90IHNldAojIENPTkZJR19NRkRfQ1BD
QVAgaXMgbm90IHNldApDT05GSUdfTUZEX05UWEVDPXkKQ09ORklHX01GRF9SRVRVPXkKQ09ORklH
X01GRF9QQ0Y1MDYzMz15CiMgQ09ORklHX1BDRjUwNjMzX0FEQyBpcyBub3Qgc2V0CkNPTkZJR19Q
Q0Y1MDYzM19HUElPPXkKIyBDT05GSUdfTUZEX1BNOFhYWCBpcyBub3Qgc2V0CiMgQ09ORklHX01G
RF9TUE1JX1BNSUMgaXMgbm90IHNldApDT05GSUdfTUZEX1JUNDgzMT15CkNPTkZJR19NRkRfUlQ1
MDMzPXkKIyBDT05GSUdfTUZEX1JDNVQ1ODMgaXMgbm90IHNldAojIENPTkZJR19NRkRfUks4MDgg
aXMgbm90IHNldApDT05GSUdfTUZEX1JONVQ2MTg9eQpDT05GSUdfTUZEX1NFQ19DT1JFPXkKQ09O
RklHX01GRF9TSTQ3NlhfQ09SRT15CiMgQ09ORklHX01GRF9TSU1QTEVfTUZEX0kyQyBpcyBub3Qg
c2V0CiMgQ09ORklHX01GRF9TTDI4Q1BMRCBpcyBub3Qgc2V0CkNPTkZJR19NRkRfU001MDE9eQpD
T05GSUdfTUZEX1NNNTAxX0dQSU89eQpDT05GSUdfTUZEX1NLWTgxNDUyPXkKIyBDT05GSUdfTUZE
X1NDMjdYWF9QTUlDIGlzIG5vdCBzZXQKIyBDT05GSUdfQUJYNTAwX0NPUkUgaXMgbm90IHNldApD
T05GSUdfTUZEX1NUTVBFPXkKCiMKIyBTVE1pY3JvZWxlY3Ryb25pY3MgU1RNUEUgSW50ZXJmYWNl
IERyaXZlcnMKIwpDT05GSUdfU1RNUEVfSTJDPXkKIyBDT05GSUdfU1RNUEVfU1BJIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgU1RNaWNyb2VsZWN0cm9uaWNzIFNUTVBFIEludGVyZmFjZSBEcml2ZXJzCgpD
T05GSUdfTUZEX1NVTjZJX1BSQ009eQpDT05GSUdfTUZEX1NZU0NPTj15CiMgQ09ORklHX01GRF9U
SV9BTTMzNVhfVFNDQURDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0xQMzk0MyBpcyBub3Qgc2V0
CkNPTkZJR19NRkRfTFA4Nzg4PXkKIyBDT05GSUdfTUZEX1RJX0xNVSBpcyBub3Qgc2V0CkNPTkZJ
R19NRkRfUEFMTUFTPXkKIyBDT05GSUdfVFBTNjEwNVggaXMgbm90IHNldApDT05GSUdfVFBTNjUw
MTA9eQpDT05GSUdfVFBTNjUwN1g9eQpDT05GSUdfTUZEX1RQUzY1MDg2PXkKIyBDT05GSUdfTUZE
X1RQUzY1MDkwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RQUzY1MjE3IGlzIG5vdCBzZXQKQ09O
RklHX01GRF9USV9MUDg3M1g9eQpDT05GSUdfTUZEX1RJX0xQODc1NjU9eQojIENPTkZJR19NRkRf
VFBTNjUyMTggaXMgbm90IHNldApDT05GSUdfTUZEX1RQUzY1ODZYPXkKIyBDT05GSUdfTUZEX1RQ
UzY1OTEwIGlzIG5vdCBzZXQKQ09ORklHX01GRF9UUFM2NTkxMj15CkNPTkZJR19NRkRfVFBTNjU5
MTJfSTJDPXkKIyBDT05GSUdfTUZEX1RQUzY1OTEyX1NQSSBpcyBub3Qgc2V0CkNPTkZJR19UV0w0
MDMwX0NPUkU9eQpDT05GSUdfTUZEX1RXTDQwMzBfQVVESU89eQpDT05GSUdfVFdMNjA0MF9DT1JF
PXkKIyBDT05GSUdfTUZEX1dMMTI3M19DT1JFIGlzIG5vdCBzZXQKQ09ORklHX01GRF9MTTM1MzM9
eQpDT05GSUdfTUZEX1RDMzU4OVg9eQojIENPTkZJR19NRkRfVFFNWDg2IGlzIG5vdCBzZXQKIyBD
T05GSUdfTUZEX0xPQ0hOQUdBUiBpcyBub3Qgc2V0CkNPTkZJR19NRkRfQVJJWk9OQT15CkNPTkZJ
R19NRkRfQVJJWk9OQV9JMkM9eQojIENPTkZJR19NRkRfQVJJWk9OQV9TUEkgaXMgbm90IHNldAoj
IENPTkZJR19NRkRfQ1M0N0wyNCBpcyBub3Qgc2V0CkNPTkZJR19NRkRfV001MTAyPXkKQ09ORklH
X01GRF9XTTUxMTA9eQojIENPTkZJR19NRkRfV004OTk3IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZE
X1dNODk5OCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9XTTg0MDAgaXMgbm90IHNldApDT05GSUdf
TUZEX1dNODMxWD15CkNPTkZJR19NRkRfV004MzFYX0kyQz15CkNPTkZJR19NRkRfV004MzFYX1NQ
ST15CiMgQ09ORklHX01GRF9XTTgzNTBfSTJDIGlzIG5vdCBzZXQKQ09ORklHX01GRF9XTTg5OTQ9
eQojIENPTkZJR19NRkRfU1RXNDgxWCBpcyBub3Qgc2V0CkNPTkZJR19NRkRfUk9ITV9CRDcxOFhY
PXkKQ09ORklHX01GRF9ST0hNX0JENzE4Mjg9eQojIENPTkZJR19NRkRfUk9ITV9CRDk1N1hNVUYg
aXMgbm90IHNldAojIENPTkZJR19NRkRfU1RNMzJfTFBUSU1FUiBpcyBub3Qgc2V0CiMgQ09ORklH
X01GRF9TVE0zMl9USU1FUlMgaXMgbm90IHNldApDT05GSUdfTUZEX1NUUE1JQzE9eQpDT05GSUdf
TUZEX1NUTUZYPXkKIyBDT05GSUdfTUZEX1dDRDkzNFggaXMgbm90IHNldApDT05GSUdfTUZEX0FU
QzI2MFg9eQpDT05GSUdfTUZEX0FUQzI2MFhfSTJDPXkKIyBDT05GSUdfTUZEX0tIQURBU19NQ1Ug
aXMgbm90IHNldAojIENPTkZJR19NRkRfQUNFUl9BNTAwX0VDIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX1FDT01fUE04MDA4IGlzIG5vdCBzZXQKIyBDT05GSUdfUkFWRV9TUF9DT1JFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUZEX0lOVEVMX00xMF9CTUMgaXMgbm90IHNldApDT05GSUdfTUZEX1JTTVVf
STJDPXkKQ09ORklHX01GRF9SU01VX1NQST15CiMgZW5kIG9mIE11bHRpZnVuY3Rpb24gZGV2aWNl
IGRyaXZlcnMKCkNPTkZJR19SRUdVTEFUT1I9eQpDT05GSUdfUkVHVUxBVE9SX0RFQlVHPXkKQ09O
RklHX1JFR1VMQVRPUl9GSVhFRF9WT0xUQUdFPXkKQ09ORklHX1JFR1VMQVRPUl9WSVJUVUFMX0NP
TlNVTUVSPXkKQ09ORklHX1JFR1VMQVRPUl9VU0VSU1BBQ0VfQ09OU1VNRVI9eQpDT05GSUdfUkVH
VUxBVE9SXzg4UEc4Nlg9eQpDT05GSUdfUkVHVUxBVE9SXzg4UE04MDA9eQpDT05GSUdfUkVHVUxB
VE9SXzg4UE04NjA3PXkKQ09ORklHX1JFR1VMQVRPUl9BQ1Q4ODY1PXkKQ09ORklHX1JFR1VMQVRP
Ul9BRDUzOTg9eQojIENPTkZJR19SRUdVTEFUT1JfQU5BVE9QIGlzIG5vdCBzZXQKIyBDT05GSUdf
UkVHVUxBVE9SX0FTMzcyMiBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9BVEMyNjBYIGlz
IG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9BWFAyMFg9eQpDT05GSUdfUkVHVUxBVE9SX0JDTTU5
MFhYPXkKIyBDT05GSUdfUkVHVUxBVE9SX0JENzE4MTUgaXMgbm90IHNldApDT05GSUdfUkVHVUxB
VE9SX0JENzE4Mjg9eQpDT05GSUdfUkVHVUxBVE9SX0JENzE4WFg9eQojIENPTkZJR19SRUdVTEFU
T1JfREE5MDUyIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9EQTkwNjM9eQpDT05GSUdfUkVH
VUxBVE9SX0RBOTEyMT15CkNPTkZJR19SRUdVTEFUT1JfREE5MjEwPXkKQ09ORklHX1JFR1VMQVRP
Ul9EQTkyMTE9eQpDT05GSUdfUkVHVUxBVE9SX0ZBTjUzNTU1PXkKQ09ORklHX1JFR1VMQVRPUl9G
QU41Mzg4MD15CiMgQ09ORklHX1JFR1VMQVRPUl9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVH
VUxBVE9SX0hJNjQyMSBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9ISTY0MjFWNTMwIGlz
IG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9ISTY0MjFWNjAwPXkKIyBDT05GSUdfUkVHVUxBVE9S
X0lTTDkzMDUgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX0lTTDYyNzFBPXkKQ09ORklHX1JF
R1VMQVRPUl9MUDM5NzE9eQojIENPTkZJR19SRUdVTEFUT1JfTFAzOTcyIGlzIG5vdCBzZXQKQ09O
RklHX1JFR1VMQVRPUl9MUDg3Mlg9eQpDT05GSUdfUkVHVUxBVE9SX0xQODczWD15CkNPTkZJR19S
RUdVTEFUT1JfTFA4NzU1PXkKQ09ORklHX1JFR1VMQVRPUl9MUDg3NTY1PXkKIyBDT05GSUdfUkVH
VUxBVE9SX0xQODc4OCBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfTFRDMzU4OT15CkNPTkZJ
R19SRUdVTEFUT1JfTFRDMzY3Nj15CiMgQ09ORklHX1JFR1VMQVRPUl9NQVgxNDU3NyBpcyBub3Qg
c2V0CkNPTkZJR19SRUdVTEFUT1JfTUFYMTU4Nj15CkNPTkZJR19SRUdVTEFUT1JfTUFYNzc2MjA9
eQojIENPTkZJR19SRUdVTEFUT1JfTUFYNzc2NTAgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9S
X01BWDg2NDk9eQpDT05GSUdfUkVHVUxBVE9SX01BWDg2NjA9eQpDT05GSUdfUkVHVUxBVE9SX01B
WDg4OTM9eQpDT05GSUdfUkVHVUxBVE9SX01BWDg5MDc9eQojIENPTkZJR19SRUdVTEFUT1JfTUFY
ODk1MiBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfTUFYMjAwODY9eQojIENPTkZJR19SRUdV
TEFUT1JfTUFYNzc2ODYgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX01BWDc3NjkzPXkKIyBD
T05GSUdfUkVHVUxBVE9SX01BWDc3ODAyIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9NQVg3
NzgyNj15CkNPTkZJR19SRUdVTEFUT1JfTUMxM1hYWF9DT1JFPXkKQ09ORklHX1JFR1VMQVRPUl9N
QzEzNzgzPXkKIyBDT05GSUdfUkVHVUxBVE9SX01DMTM4OTIgaXMgbm90IHNldAojIENPTkZJR19S
RUdVTEFUT1JfTUNQMTY1MDIgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX01QNTQxNj15CkNP
TkZJR19SRUdVTEFUT1JfTVA4ODU5PXkKQ09ORklHX1JFR1VMQVRPUl9NUDg4Nlg9eQpDT05GSUdf
UkVHVUxBVE9SX01QUTc5MjA9eQpDT05GSUdfUkVHVUxBVE9SX01UNjMxMT15CkNPTkZJR19SRUdV
TEFUT1JfTVQ2MzE1PXkKQ09ORklHX1JFR1VMQVRPUl9NVDYzMjM9eQpDT05GSUdfUkVHVUxBVE9S
X01UNjM1OD15CiMgQ09ORklHX1JFR1VMQVRPUl9NVDYzNTkgaXMgbm90IHNldApDT05GSUdfUkVH
VUxBVE9SX01UNjM2MD15CkNPTkZJR19SRUdVTEFUT1JfTVQ2Mzk3PXkKQ09ORklHX1JFR1VMQVRP
Ul9QQUxNQVM9eQojIENPTkZJR19SRUdVTEFUT1JfUEJJQVMgaXMgbm90IHNldApDT05GSUdfUkVH
VUxBVE9SX1BDQTk0NTA9eQpDT05GSUdfUkVHVUxBVE9SX1BDRjUwNjMzPXkKIyBDT05GSUdfUkVH
VUxBVE9SX1BGOFgwMCBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfUEZVWkUxMDA9eQpDT05G
SUdfUkVHVUxBVE9SX1BWODgwNjA9eQpDT05GSUdfUkVHVUxBVE9SX1BWODgwODA9eQpDT05GSUdf
UkVHVUxBVE9SX1BWODgwOTA9eQojIENPTkZJR19SRUdVTEFUT1JfUUNPTV9SUE1IIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUkVHVUxBVE9SX1FDT01fU1BNSSBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFU
T1JfUUNPTV9VU0JfVkJVUz15CiMgQ09ORklHX1JFR1VMQVRPUl9SQVNQQkVSUllQSV9UT1VDSFND
UkVFTl9BVFRJTlkgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX1JONVQ2MTg9eQpDT05GSUdf
UkVHVUxBVE9SX1JPSE09eQojIENPTkZJR19SRUdVTEFUT1JfUlQ0ODAxIGlzIG5vdCBzZXQKQ09O
RklHX1JFR1VMQVRPUl9SVDQ4MzE9eQpDT05GSUdfUkVHVUxBVE9SX1JUNTAzMz15CiMgQ09ORklH
X1JFR1VMQVRPUl9SVDUxOTBBIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9SVDU3NTk9eQpD
T05GSUdfUkVHVUxBVE9SX1JUNjE2MD15CkNPTkZJR19SRUdVTEFUT1JfUlQ2MjQ1PXkKQ09ORklH
X1JFR1VMQVRPUl9SVFEyMTM0PXkKQ09ORklHX1JFR1VMQVRPUl9SVE1WMjA9eQpDT05GSUdfUkVH
VUxBVE9SX1JUUTY3NTI9eQpDT05GSUdfUkVHVUxBVE9SX1MyTVBBMDE9eQpDT05GSUdfUkVHVUxB
VE9SX1MyTVBTMTE9eQpDT05GSUdfUkVHVUxBVE9SX1M1TTg3Njc9eQojIENPTkZJR19SRUdVTEFU
T1JfU0MyNzMxIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX1NLWTgxNDUyIGlzIG5vdCBz
ZXQKQ09ORklHX1JFR1VMQVRPUl9TTEc1MTAwMD15CiMgQ09ORklHX1JFR1VMQVRPUl9TVE0zMl9C
T09TVEVSIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX1NUTTMyX1ZSRUZCVUYgaXMgbm90
IHNldAojIENPTkZJR19SRUdVTEFUT1JfU1RNMzJfUFdSIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VM
QVRPUl9TVFBNSUMxPXkKIyBDT05GSUdfUkVHVUxBVE9SX1RJX0FCQiBpcyBub3Qgc2V0CiMgQ09O
RklHX1JFR1VMQVRPUl9TVFc0ODFYX1ZNTUMgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX1NZ
NzYzNkE9eQojIENPTkZJR19SRUdVTEFUT1JfU1k4MTA2QSBpcyBub3Qgc2V0CiMgQ09ORklHX1JF
R1VMQVRPUl9TWTg4MjRYIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9TWTg4MjdOPXkKIyBD
T05GSUdfUkVHVUxBVE9SX1RQUzUxNjMyIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9UUFM2
MjM2MD15CkNPTkZJR19SRUdVTEFUT1JfVFBTNjI4Nlg9eQpDT05GSUdfUkVHVUxBVE9SX1RQUzY1
MDIzPXkKQ09ORklHX1JFR1VMQVRPUl9UUFM2NTA3WD15CiMgQ09ORklHX1JFR1VMQVRPUl9UUFM2
NTA4NiBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfVFBTNjUxMzI9eQpDT05GSUdfUkVHVUxB
VE9SX1RQUzY1MjRYPXkKQ09ORklHX1JFR1VMQVRPUl9UUFM2NTg2WD15CiMgQ09ORklHX1JFR1VM
QVRPUl9UUFM2NTkxMiBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9UUFM2ODQ3MCBpcyBu
b3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfVFdMNDAzMD15CiMgQ09ORklHX1JFR1VMQVRPUl9VTklQ
SElFUiBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfVkNUUkw9eQpDT05GSUdfUkVHVUxBVE9S
X1dNODMxWD15CiMgQ09ORklHX1JFR1VMQVRPUl9XTTg5OTQgaXMgbm90IHNldAojIENPTkZJR19S
RUdVTEFUT1JfUUNPTV9MQUJJQkIgaXMgbm90IHNldApDT05GSUdfUkNfQ09SRT15CiMgQ09ORklH
X0xJUkMgaXMgbm90IHNldAojIENPTkZJR19SQ19NQVAgaXMgbm90IHNldApDT05GSUdfUkNfREVD
T0RFUlM9eQpDT05GSUdfSVJfSU1PTl9ERUNPREVSPXkKIyBDT05GSUdfSVJfSlZDX0RFQ09ERVIg
aXMgbm90IHNldApDT05GSUdfSVJfTUNFX0tCRF9ERUNPREVSPXkKIyBDT05GSUdfSVJfTkVDX0RF
Q09ERVIgaXMgbm90IHNldApDT05GSUdfSVJfUkM1X0RFQ09ERVI9eQpDT05GSUdfSVJfUkM2X0RF
Q09ERVI9eQpDT05GSUdfSVJfUkNNTV9ERUNPREVSPXkKIyBDT05GSUdfSVJfU0FOWU9fREVDT0RF
UiBpcyBub3Qgc2V0CkNPTkZJR19JUl9TSEFSUF9ERUNPREVSPXkKQ09ORklHX0lSX1NPTllfREVD
T0RFUj15CkNPTkZJR19JUl9YTVBfREVDT0RFUj15CkNPTkZJR19SQ19ERVZJQ0VTPXkKIyBDT05G
SUdfSVJfRU5FIGlzIG5vdCBzZXQKIyBDT05GSUdfSVJfRklOVEVLIGlzIG5vdCBzZXQKQ09ORklH
X0lSX0dQSU9fQ0lSPXkKQ09ORklHX0lSX0hJWDVIRDI9eQojIENPTkZJR19JUl9JVEVfQ0lSIGlz
IG5vdCBzZXQKIyBDT05GSUdfSVJfTUVTT04gaXMgbm90IHNldAojIENPTkZJR19JUl9NRVNPTl9U
WCBpcyBub3Qgc2V0CiMgQ09ORklHX0lSX01USyBpcyBub3Qgc2V0CiMgQ09ORklHX0lSX05VVk9U
T04gaXMgbm90IHNldAojIENPTkZJR19JUl9SWDUxIGlzIG5vdCBzZXQKIyBDT05GSUdfSVJfU0VS
SUFMIGlzIG5vdCBzZXQKIyBDT05GSUdfSVJfU1VOWEkgaXMgbm90IHNldAojIENPTkZJR19JUl9X
SU5CT05EX0NJUiBpcyBub3Qgc2V0CkNPTkZJR19SQ19MT09QQkFDSz15CiMgQ09ORklHX1JDX1NU
IGlzIG5vdCBzZXQKIyBDT05GSUdfSVJfSU1HIGlzIG5vdCBzZXQKQ09ORklHX0NFQ19DT1JFPXkK
Q09ORklHX0NFQ19OT1RJRklFUj15CgojCiMgQ0VDIHN1cHBvcnQKIwpDT05GSUdfTUVESUFfQ0VD
X1JDPXkKIyBDT05GSUdfTUVESUFfQ0VDX1NVUFBPUlQgaXMgbm90IHNldAojIGVuZCBvZiBDRUMg
c3VwcG9ydAoKIyBDT05GSUdfTUVESUFfU1VQUE9SVCBpcyBub3Qgc2V0CgojCiMgR3JhcGhpY3Mg
c3VwcG9ydAojCiMgQ09ORklHX0lNWF9JUFVWM19DT1JFIGlzIG5vdCBzZXQKQ09ORklHX0RSTT15
CkNPTkZJR19EUk1fTUlQSV9EQkk9eQpDT05GSUdfRFJNX01JUElfRFNJPXkKQ09ORklHX0RSTV9E
RUJVR19NTT15CkNPTkZJR19EUk1fREVCVUdfU0VMRlRFU1Q9eQpDT05GSUdfRFJNX0tNU19IRUxQ
RVI9eQojIENPTkZJR19EUk1fRkJERVZfRU1VTEFUSU9OIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9M
T0FEX0VESURfRklSTVdBUkU9eQpDT05GSUdfRFJNX0RQX0FVWF9CVVM9eQpDT05GSUdfRFJNX0RJ
U1BMQVlfSEVMUEVSPXkKQ09ORklHX0RSTV9ESVNQTEFZX0RQX0hFTFBFUj15CkNPTkZJR19EUk1f
RElTUExBWV9IRENQX0hFTFBFUj15CkNPTkZJR19EUk1fRElTUExBWV9IRE1JX0hFTFBFUj15CkNP
TkZJR19EUk1fRFBfQVVYX0NIQVJERVY9eQpDT05GSUdfRFJNX0RQX0NFQz15CkNPTkZJR19EUk1f
QlVERFk9eQpDT05GSUdfRFJNX0dFTV9DTUFfSEVMUEVSPXkKQ09ORklHX0RSTV9HRU1fU0hNRU1f
SEVMUEVSPXkKQ09ORklHX0RSTV9TQ0hFRD15CgojCiMgSTJDIGVuY29kZXIgb3IgaGVscGVyIGNo
aXBzCiMKIyBDT05GSUdfRFJNX0kyQ19DSDcwMDYgaXMgbm90IHNldAojIENPTkZJR19EUk1fSTJD
X1NJTDE2NCBpcyBub3Qgc2V0CkNPTkZJR19EUk1fSTJDX05YUF9UREE5OThYPXkKIyBDT05GSUdf
RFJNX0kyQ19OWFBfVERBOTk1MCBpcyBub3Qgc2V0CiMgZW5kIG9mIEkyQyBlbmNvZGVyIG9yIGhl
bHBlciBjaGlwcwoKIwojIEFSTSBkZXZpY2VzCiMKIyBDT05GSUdfRFJNX0hETENEIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFJNX01BTElfRElTUExBWSBpcyBub3Qgc2V0CkNPTkZJR19EUk1fS09NRURB
PXkKIyBlbmQgb2YgQVJNIGRldmljZXMKCiMgQ09ORklHX0RSTV9LTUJfRElTUExBWSBpcyBub3Qg
c2V0CkNPTkZJR19EUk1fVkdFTT15CkNPTkZJR19EUk1fVktNUz15CiMgQ09ORklHX0RSTV9FWFlO
T1MgaXMgbm90IHNldApDT05GSUdfRFJNX1JDQVJfRFdfSERNST15CkNPTkZJR19EUk1fUkNBUl9V
U0VfTFZEUz15CkNPTkZJR19EUk1fUkNBUl9NSVBJX0RTST15CiMgQ09ORklHX0RSTV9TVU40SSBp
cyBub3Qgc2V0CiMgQ09ORklHX0RSTV9WSVJUSU9fR1BVIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9Q
QU5FTD15CgojCiMgRGlzcGxheSBQYW5lbHMKIwojIENPTkZJR19EUk1fUEFORUxfQUJUX1kwMzBY
WDA2N0EgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfQVJNX1ZFUlNBVElMRSBpcyBub3Qg
c2V0CkNPTkZJR19EUk1fUEFORUxfQVNVU19aMDBUX1RNNVA1X05UMzU1OTY9eQojIENPTkZJR19E
Uk1fUEFORUxfQk9FX0JGMDYwWThNX0FKMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9C
T0VfSElNQVg4Mjc5RCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9CT0VfVFYxMDFXVU1f
Tkw2IGlzIG5vdCBzZXQKQ09ORklHX0RSTV9QQU5FTF9EU0lfQ009eQojIENPTkZJR19EUk1fUEFO
RUxfTFZEUyBpcyBub3Qgc2V0CkNPTkZJR19EUk1fUEFORUxfRUxJREFfS0QzNVQxMzM9eQojIENP
TkZJR19EUk1fUEFORUxfRkVJWElOX0sxMDFfSU0yQkEwMiBpcyBub3Qgc2V0CkNPTkZJR19EUk1f
UEFORUxfRkVJWUFOR19GWTA3MDI0REkyNkEzMEQ9eQojIENPTkZJR19EUk1fUEFORUxfSUxJVEVL
X0lMOTMyMiBpcyBub3Qgc2V0CkNPTkZJR19EUk1fUEFORUxfSUxJVEVLX0lMSTkzNDE9eQpDT05G
SUdfRFJNX1BBTkVMX0lMSVRFS19JTEk5ODgxQz15CiMgQ09ORklHX0RSTV9QQU5FTF9JTk5PTFVY
X0VKMDMwTkEgaXMgbm90IHNldApDT05GSUdfRFJNX1BBTkVMX0lOTk9MVVhfUDA3OVpDQT15CkNP
TkZJR19EUk1fUEFORUxfSkRJX0xUMDcwTUUwNTAwMD15CiMgQ09ORklHX0RSTV9QQU5FTF9KRElf
UjYzNDUyIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9QQU5FTF9LSEFEQVNfVFMwNTA9eQpDT05GSUdf
RFJNX1BBTkVMX0tJTkdESVNQTEFZX0tEMDk3RDA0PXkKIyBDT05GSUdfRFJNX1BBTkVMX0xFQURU
RUtfTFRLMDUwSDMxNDZXIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9QQU5FTF9MRUFEVEVLX0xUSzUw
MEhEMTgyOT15CiMgQ09ORklHX0RSTV9QQU5FTF9TQU1TVU5HX0xEOTA0MCBpcyBub3Qgc2V0CkNP
TkZJR19EUk1fUEFORUxfTEdfTEIwMzVRMDI9eQpDT05GSUdfRFJNX1BBTkVMX0xHX0xHNDU3Mz15
CkNPTkZJR19EUk1fUEFORUxfTkVDX05MODA0OEhMMTE9eQojIENPTkZJR19EUk1fUEFORUxfTkVX
VklTSU9OX05WMzA1MkMgaXMgbm90IHNldApDT05GSUdfRFJNX1BBTkVMX05PVkFURUtfTlQzNTUx
MD15CiMgQ09ORklHX0RSTV9QQU5FTF9OT1ZBVEVLX05UMzU1NjAgaXMgbm90IHNldAojIENPTkZJ
R19EUk1fUEFORUxfTk9WQVRFS19OVDM1OTUwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVM
X05PVkFURUtfTlQzNjY3MkEgaXMgbm90IHNldApDT05GSUdfRFJNX1BBTkVMX05PVkFURUtfTlQz
OTAxNj15CiMgQ09ORklHX0RSTV9QQU5FTF9NQU5USVhfTUxBRjA1N1dFNTEgaXMgbm90IHNldAoj
IENPTkZJR19EUk1fUEFORUxfT0xJTUVYX0xDRF9PTElOVVhJTk8gaXMgbm90IHNldApDT05GSUdf
RFJNX1BBTkVMX09SSVNFVEVDSF9PVE04MDA5QT15CiMgQ09ORklHX0RSTV9QQU5FTF9PU0RfT1NE
MTAxVDI1ODdfNTNUUyBpcyBub3Qgc2V0CkNPTkZJR19EUk1fUEFORUxfUEFOQVNPTklDX1ZWWDEw
RjAzNE4wMD15CiMgQ09ORklHX0RSTV9QQU5FTF9SQVNQQkVSUllQSV9UT1VDSFNDUkVFTiBpcyBu
b3Qgc2V0CkNPTkZJR19EUk1fUEFORUxfUkFZRElVTV9STTY3MTkxPXkKQ09ORklHX0RSTV9QQU5F
TF9SQVlESVVNX1JNNjgyMDA9eQpDT05GSUdfRFJNX1BBTkVMX1JPTkJPX1JCMDcwRDMwPXkKQ09O
RklHX0RSTV9QQU5FTF9TQU1TVU5HX0RCNzQzMD15CiMgQ09ORklHX0RSTV9QQU5FTF9TQU1TVU5H
X1M2RDE2RDAgaXMgbm90IHNldApDT05GSUdfRFJNX1BBTkVMX1NBTVNVTkdfUzZEMjdBMT15CkNP
TkZJR19EUk1fUEFORUxfU0FNU1VOR19TNkUzSEEyPXkKIyBDT05GSUdfRFJNX1BBTkVMX1NBTVNV
TkdfUzZFNjNKMFgwMyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9TQU1TVU5HX1M2RTYz
TTAgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfU0FNU1VOR19TNkU4OEEwX0FNUzQ1MkVG
MDEgaXMgbm90IHNldApDT05GSUdfRFJNX1BBTkVMX1NBTVNVTkdfUzZFOEFBMD15CiMgQ09ORklH
X0RSTV9QQU5FTF9TQU1TVU5HX1NPRkVGMDAgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxf
U0VJS09fNDNXVkYxRyBpcyBub3Qgc2V0CkNPTkZJR19EUk1fUEFORUxfU0hBUlBfTFExMDFSMVNY
MDE9eQpDT05GSUdfRFJNX1BBTkVMX1NIQVJQX0xTMDM3VjdEVzAxPXkKQ09ORklHX0RSTV9QQU5F
TF9TSEFSUF9MUzA0M1QxTEUwMT15CkNPTkZJR19EUk1fUEFORUxfU0hBUlBfTFMwNjBUMVNYMDE9
eQpDT05GSUdfRFJNX1BBTkVMX1NJVFJPTklYX1NUNzcwMT15CiMgQ09ORklHX0RSTV9QQU5FTF9T
SVRST05JWF9TVDc3MDMgaXMgbm90IHNldApDT05GSUdfRFJNX1BBTkVMX1NJVFJPTklYX1NUNzc4
OVY9eQpDT05GSUdfRFJNX1BBTkVMX1NPTllfQUNYNTY1QUtNPXkKQ09ORklHX0RSTV9QQU5FTF9T
T05ZX1RVTElQX1RSVUxZX05UMzU1MjE9eQpDT05GSUdfRFJNX1BBTkVMX1RET19UTDA3MFdTSDMw
PXkKQ09ORklHX0RSTV9QQU5FTF9UUE9fVEQwMjhUVEVDMT15CiMgQ09ORklHX0RSTV9QQU5FTF9U
UE9fVEQwNDNNVEVBMSBpcyBub3Qgc2V0CkNPTkZJR19EUk1fUEFORUxfVFBPX1RQRzExMD15CkNP
TkZJR19EUk1fUEFORUxfVFJVTFlfTlQzNTU5N19XUVhHQT15CkNPTkZJR19EUk1fUEFORUxfVklT
SU9OT1hfUk02OTI5OT15CkNPTkZJR19EUk1fUEFORUxfV0lERUNISVBTX1dTMjQwMT15CkNPTkZJ
R19EUk1fUEFORUxfWElOUEVOR19YUFAwNTVDMjcyPXkKIyBlbmQgb2YgRGlzcGxheSBQYW5lbHMK
CkNPTkZJR19EUk1fQlJJREdFPXkKQ09ORklHX0RSTV9QQU5FTF9CUklER0U9eQoKIwojIERpc3Bs
YXkgSW50ZXJmYWNlIEJyaWRnZXMKIwojIENPTkZJR19EUk1fQ0ROU19EU0kgaXMgbm90IHNldApD
T05GSUdfRFJNX0NISVBPTkVfSUNONjIxMT15CkNPTkZJR19EUk1fQ0hST05URUxfQ0g3MDMzPXkK
IyBDT05GSUdfRFJNX0NST1NfRUNfQU5YNzY4OCBpcyBub3Qgc2V0CkNPTkZJR19EUk1fRElTUExB
WV9DT05ORUNUT1I9eQojIENPTkZJR19EUk1fRlNMX0xEQiBpcyBub3Qgc2V0CkNPTkZJR19EUk1f
SVRFX0lUNjUwNT15CiMgQ09ORklHX0RSTV9MT05USVVNX0xUODkxMkIgaXMgbm90IHNldApDT05G
SUdfRFJNX0xPTlRJVU1fTFQ5MjExPXkKQ09ORklHX0RSTV9MT05USVVNX0xUOTYxMT15CkNPTkZJ
R19EUk1fTE9OVElVTV9MVDk2MTFVWEM9eQojIENPTkZJR19EUk1fSVRFX0lUNjYxMjEgaXMgbm90
IHNldApDT05GSUdfRFJNX0xWRFNfQ09ERUM9eQojIENPTkZJR19EUk1fTUVHQUNISVBTX1NURFBY
WFhYX0dFX0I4NTBWM19GVyBpcyBub3Qgc2V0CkNPTkZJR19EUk1fTldMX01JUElfRFNJPXkKQ09O
RklHX0RSTV9OWFBfUFROMzQ2MD15CkNPTkZJR19EUk1fUEFSQURFX1BTODYyMj15CiMgQ09ORklH
X0RSTV9QQVJBREVfUFM4NjQwIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9TSUxfU0lJODYyMD15CiMg
Q09ORklHX0RSTV9TSUk5MDJYIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9TSUk5MjM0PXkKQ09ORklH
X0RSTV9TSU1QTEVfQlJJREdFPXkKIyBDT05GSUdfRFJNX1RISU5FX1RIQzYzTFZEMTAyNCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RSTV9UT1NISUJBX1RDMzU4NzYyIGlzIG5vdCBzZXQKIyBDT05GSUdf
RFJNX1RPU0hJQkFfVEMzNTg3NjQgaXMgbm90IHNldApDT05GSUdfRFJNX1RPU0hJQkFfVEMzNTg3
Njc9eQojIENPTkZJR19EUk1fVE9TSElCQV9UQzM1ODc2OCBpcyBub3Qgc2V0CkNPTkZJR19EUk1f
VE9TSElCQV9UQzM1ODc3NT15CkNPTkZJR19EUk1fVElfVEZQNDEwPXkKQ09ORklHX0RSTV9USV9T
TjY1RFNJODM9eQojIENPTkZJR19EUk1fVElfU042NURTSTg2IGlzIG5vdCBzZXQKIyBDT05GSUdf
RFJNX1RJX1RQRDEyUzAxNSBpcyBub3Qgc2V0CkNPTkZJR19EUk1fQU5BTE9HSVhfQU5YNjM0NT15
CiMgQ09ORklHX0RSTV9BTkFMT0dJWF9BTlg3OFhYIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9BTkFM
T0dJWF9EUD15CkNPTkZJR19EUk1fQU5BTE9HSVhfQU5YNzYyNT15CkNPTkZJR19EUk1fSTJDX0FE
Vjc1MTE9eQpDT05GSUdfRFJNX0kyQ19BRFY3NTExX0NFQz15CkNPTkZJR19EUk1fQ0ROU19NSERQ
ODU0Nj15CkNPTkZJR19EUk1fQ0ROU19NSERQODU0Nl9KNzIxRT15CkNPTkZJR19EUk1fRFdfSERN
ST15CkNPTkZJR19EUk1fRFdfSERNSV9DRUM9eQojIGVuZCBvZiBEaXNwbGF5IEludGVyZmFjZSBC
cmlkZ2VzCgojIENPTkZJR19EUk1fVjNEIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9FVE5BVklWPXkK
IyBDT05GSUdfRFJNX0VUTkFWSVZfVEhFUk1BTCBpcyBub3Qgc2V0CkNPTkZJR19EUk1fTVhTPXkK
Q09ORklHX0RSTV9NWFNGQj15CiMgQ09ORklHX0RSTV9BUkNQR1UgaXMgbm90IHNldApDT05GSUdf
RFJNX1BBTkVMX01JUElfREJJPXkKQ09ORklHX0RSTV9TSU1QTEVEUk09eQojIENPTkZJR19USU5Z
RFJNX0hYODM1N0QgaXMgbm90IHNldApDT05GSUdfVElOWURSTV9JTEk5MTYzPXkKQ09ORklHX1RJ
TllEUk1fSUxJOTIyNT15CkNPTkZJR19USU5ZRFJNX0lMSTkzNDE9eQojIENPTkZJR19USU5ZRFJN
X0lMSTk0ODYgaXMgbm90IHNldApDT05GSUdfVElOWURSTV9NSTAyODNRVD15CkNPTkZJR19USU5Z
RFJNX1JFUEFQRVI9eQpDT05GSUdfVElOWURSTV9TVDc1ODY9eQpDT05GSUdfVElOWURSTV9TVDc3
MzVSPXkKIyBDT05GSUdfRFJNX1BMMTExIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0xJTUEgaXMg
bm90IHNldAojIENPTkZJR19EUk1fQVNQRUVEX0dGWCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9U
SURTUyBpcyBub3Qgc2V0CkNPTkZJR19EUk1fU1NEMTMwWD15CkNPTkZJR19EUk1fU1NEMTMwWF9J
MkM9eQojIENPTkZJR19EUk1fU1NEMTMwWF9TUEkgaXMgbm90IHNldAojIENPTkZJR19EUk1fU1BS
RCBpcyBub3Qgc2V0CkNPTkZJR19EUk1fTEVHQUNZPXkKQ09ORklHX0RSTV9QQU5FTF9PUklFTlRB
VElPTl9RVUlSS1M9eQpDT05GSUdfRFJNX05PTU9ERVNFVD15CkNPTkZJR19EUk1fTElCX1JBTkRP
TT15CgojCiMgRnJhbWUgYnVmZmVyIERldmljZXMKIwpDT05GSUdfRkJfQ01ETElORT15CkNPTkZJ
R19GQl9OT1RJRlk9eQpDT05GSUdfRkI9eQojIENPTkZJR19GSVJNV0FSRV9FRElEIGlzIG5vdCBz
ZXQKQ09ORklHX0ZCX0NGQl9GSUxMUkVDVD15CkNPTkZJR19GQl9DRkJfQ09QWUFSRUE9eQpDT05G
SUdfRkJfQ0ZCX0lNQUdFQkxJVD15CkNPTkZJR19GQl9TWVNfRklMTFJFQ1Q9eQpDT05GSUdfRkJf
U1lTX0NPUFlBUkVBPXkKQ09ORklHX0ZCX1NZU19JTUFHRUJMSVQ9eQpDT05GSUdfRkJfRk9SRUlH
Tl9FTkRJQU49eQojIENPTkZJR19GQl9CT1RIX0VORElBTiBpcyBub3Qgc2V0CkNPTkZJR19GQl9C
SUdfRU5ESUFOPXkKIyBDT05GSUdfRkJfTElUVExFX0VORElBTiBpcyBub3Qgc2V0CkNPTkZJR19G
Ql9TWVNfRk9QUz15CkNPTkZJR19GQl9ERUZFUlJFRF9JTz15CkNPTkZJR19GQl9NT0RFX0hFTFBF
UlM9eQpDT05GSUdfRkJfVElMRUJMSVRUSU5HPXkKCiMKIyBGcmFtZSBidWZmZXIgaGFyZHdhcmUg
ZHJpdmVycwojCiMgQ09ORklHX0ZCX0NMUFM3MTFYIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfSU1Y
IGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfQVJDIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfQ09OVFJP
TCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1VWRVNBIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfR0JF
IGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfUFZSMiBpcyBub3Qgc2V0CkNPTkZJR19GQl9PUEVOQ09S
RVM9eQojIENPTkZJR19GQl9TMUQxM1hYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0FUTUVMIGlz
IG5vdCBzZXQKIyBDT05GSUdfRkJfV004NTA1IGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfUFhBMTY4
IGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfVzEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1NIX01P
QklMRV9MQ0RDIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfVE1JTyBpcyBub3Qgc2V0CiMgQ09ORklH
X0ZCX1MzQyBpcyBub3Qgc2V0CkNPTkZJR19GQl9TTTUwMT15CkNPTkZJR19GQl9JQk1fR1hUNDUw
MD15CkNPTkZJR19GQl9HT0xERklTSD15CiMgQ09ORklHX0ZCX0RBOFhYIGlzIG5vdCBzZXQKQ09O
RklHX0ZCX1ZJUlRVQUw9eQpDT05GSUdfRkJfTUVUUk9OT01FPXkKIyBDT05GSUdfRkJfQlJPQURT
SEVFVCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1NTRDEzMDcgaXMgbm90IHNldApDT05GSUdfRkJf
T01BUF9MQ0RfSDM9eQojIENPTkZJR19GQl9PTUFQMiBpcyBub3Qgc2V0CiMgQ09ORklHX01NUF9E
SVNQIGlzIG5vdCBzZXQKIyBlbmQgb2YgRnJhbWUgYnVmZmVyIERldmljZXMKCiMKIyBCYWNrbGln
aHQgJiBMQ0QgZGV2aWNlIHN1cHBvcnQKIwpDT05GSUdfTENEX0NMQVNTX0RFVklDRT15CkNPTkZJ
R19MQ0RfTDRGMDAyNDJUMDM9eQojIENPTkZJR19MQ0RfTE1TMjgzR0YwNSBpcyBub3Qgc2V0CiMg
Q09ORklHX0xDRF9MVFYzNTBRViBpcyBub3Qgc2V0CkNPTkZJR19MQ0RfSUxJOTIyWD15CiMgQ09O
RklHX0xDRF9JTEk5MzIwIGlzIG5vdCBzZXQKIyBDT05GSUdfTENEX1RETzI0TSBpcyBub3Qgc2V0
CiMgQ09ORklHX0xDRF9WR0cyNDMyQTQgaXMgbm90IHNldApDT05GSUdfTENEX1BMQVRGT1JNPXkK
Q09ORklHX0xDRF9BTVMzNjlGRzA2PXkKQ09ORklHX0xDRF9MTVM1MDFLRjAzPXkKQ09ORklHX0xD
RF9IWDgzNTc9eQojIENPTkZJR19MQ0RfT1RNMzIyNUEgaXMgbm90IHNldApDT05GSUdfQkFDS0xJ
R0hUX0NMQVNTX0RFVklDRT15CkNPTkZJR19CQUNLTElHSFRfS1REMjUzPXkKQ09ORklHX0JBQ0tM
SUdIVF9MTTM1MzM9eQojIENPTkZJR19CQUNLTElHSFRfT01BUDEgaXMgbm90IHNldAojIENPTkZJ
R19CQUNLTElHSFRfREE5MDUyIGlzIG5vdCBzZXQKQ09ORklHX0JBQ0tMSUdIVF9RQ09NX1dMRUQ9
eQpDT05GSUdfQkFDS0xJR0hUX1JUNDgzMT15CkNPTkZJR19CQUNLTElHSFRfV004MzFYPXkKQ09O
RklHX0JBQ0tMSUdIVF9BRFA4ODYwPXkKQ09ORklHX0JBQ0tMSUdIVF9BRFA4ODcwPXkKQ09ORklH
X0JBQ0tMSUdIVF84OFBNODYwWD15CkNPTkZJR19CQUNLTElHSFRfUENGNTA2MzM9eQpDT05GSUdf
QkFDS0xJR0hUX0xNMzYzOT15CiMgQ09ORklHX0JBQ0tMSUdIVF9QQU5ET1JBIGlzIG5vdCBzZXQK
IyBDT05GSUdfQkFDS0xJR0hUX1NLWTgxNDUyIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hU
X0dQSU8gaXMgbm90IHNldAojIENPTkZJR19CQUNLTElHSFRfTFY1MjA3TFAgaXMgbm90IHNldAoj
IENPTkZJR19CQUNLTElHSFRfQkQ2MTA3IGlzIG5vdCBzZXQKQ09ORklHX0JBQ0tMSUdIVF9BUkNY
Q05OPXkKIyBDT05GSUdfQkFDS0xJR0hUX0xFRCBpcyBub3Qgc2V0CiMgZW5kIG9mIEJhY2tsaWdo
dCAmIExDRCBkZXZpY2Ugc3VwcG9ydAoKQ09ORklHX1ZJREVPTU9ERV9IRUxQRVJTPXkKQ09ORklH
X0hETUk9eQoKIwojIENvbnNvbGUgZGlzcGxheSBkcml2ZXIgc3VwcG9ydAojCkNPTkZJR19EVU1N
WV9DT05TT0xFPXkKQ09ORklHX0RVTU1ZX0NPTlNPTEVfQ09MVU1OUz04MApDT05GSUdfRFVNTVlf
Q09OU09MRV9ST1dTPTI1CkNPTkZJR19GUkFNRUJVRkZFUl9DT05TT0xFPXkKQ09ORklHX0ZSQU1F
QlVGRkVSX0NPTlNPTEVfTEVHQUNZX0FDQ0VMRVJBVElPTj15CkNPTkZJR19GUkFNRUJVRkZFUl9D
T05TT0xFX0RFVEVDVF9QUklNQVJZPXkKIyBDT05GSUdfRlJBTUVCVUZGRVJfQ09OU09MRV9ST1RB
VElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0ZSQU1FQlVGRkVSX0NPTlNPTEVfREVGRVJSRURfVEFL
RU9WRVIgaXMgbm90IHNldAojIGVuZCBvZiBDb25zb2xlIGRpc3BsYXkgZHJpdmVyIHN1cHBvcnQK
CkNPTkZJR19MT0dPPXkKQ09ORklHX0xPR09fTElOVVhfTU9OTz15CkNPTkZJR19MT0dPX0xJTlVY
X1ZHQTE2PXkKIyBDT05GSUdfTE9HT19MSU5VWF9DTFVUMjI0IGlzIG5vdCBzZXQKIyBlbmQgb2Yg
R3JhcGhpY3Mgc3VwcG9ydAoKIyBDT05GSUdfU09VTkQgaXMgbm90IHNldAoKIwojIEhJRCBzdXBw
b3J0CiMKQ09ORklHX0hJRD15CiMgQ09ORklHX0hJRF9CQVRURVJZX1NUUkVOR1RIIGlzIG5vdCBz
ZXQKQ09ORklHX0hJRFJBVz15CkNPTkZJR19VSElEPXkKIyBDT05GSUdfSElEX0dFTkVSSUMgaXMg
bm90IHNldAoKIwojIFNwZWNpYWwgSElEIGRyaXZlcnMKIwpDT05GSUdfSElEX0E0VEVDSD15CkNP
TkZJR19ISURfQUNSVVg9eQojIENPTkZJR19ISURfQUNSVVhfRkYgaXMgbm90IHNldAojIENPTkZJ
R19ISURfQVBQTEUgaXMgbm90IHNldAojIENPTkZJR19ISURfQVVSRUFMIGlzIG5vdCBzZXQKQ09O
RklHX0hJRF9CRUxLSU49eQojIENPTkZJR19ISURfQ0hFUlJZIGlzIG5vdCBzZXQKQ09ORklHX0hJ
RF9DT1VHQVI9eQojIENPTkZJR19ISURfTUFDQUxMWSBpcyBub3Qgc2V0CkNPTkZJR19ISURfQ01F
RElBPXkKIyBDT05GSUdfSElEX0NZUFJFU1MgaXMgbm90IHNldApDT05GSUdfSElEX0RSQUdPTlJJ
U0U9eQpDT05GSUdfRFJBR09OUklTRV9GRj15CiMgQ09ORklHX0hJRF9FTVNfRkYgaXMgbm90IHNl
dAojIENPTkZJR19ISURfRUxFQ09NIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9FWktFWT15CiMgQ09O
RklHX0hJRF9HRU1CSVJEIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9HRlJNPXkKIyBDT05GSUdfSElE
X0dMT1JJT1VTIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9WSVZBTERJX0NPTU1PTj15CkNPTkZJR19I
SURfVklWQUxEST15CkNPTkZJR19ISURfS0VZVE9VQ0g9eQpDT05GSUdfSElEX0tZRT15CkNPTkZJ
R19ISURfV0FMVE9QPXkKQ09ORklHX0hJRF9WSUVXU09OSUM9eQojIENPTkZJR19ISURfWElBT01J
IGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0dZUkFUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfSElE
X0lDQURFIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9JVEU9eQojIENPTkZJR19ISURfSkFCUkEgaXMg
bm90IHNldAojIENPTkZJR19ISURfVFdJTkhBTiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9LRU5T
SU5HVE9OIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9MQ1BPV0VSPXkKQ09ORklHX0hJRF9MRUQ9eQoj
IENPTkZJR19ISURfTEVOT1ZPIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9NQUdJQ01PVVNFPXkKQ09O
RklHX0hJRF9NQUxUUk9OPXkKIyBDT05GSUdfSElEX01BWUZMQVNIIGlzIG5vdCBzZXQKQ09ORklH
X0hJRF9SRURSQUdPTj15CiMgQ09ORklHX0hJRF9NSUNST1NPRlQgaXMgbm90IHNldAojIENPTkZJ
R19ISURfTU9OVEVSRVkgaXMgbm90IHNldAojIENPTkZJR19ISURfTVVMVElUT1VDSCBpcyBub3Qg
c2V0CkNPTkZJR19ISURfTklOVEVORE89eQpDT05GSUdfTklOVEVORE9fRkY9eQpDT05GSUdfSElE
X05UST15CkNPTkZJR19ISURfT1JURUs9eQpDT05GSUdfSElEX1BBTlRIRVJMT1JEPXkKIyBDT05G
SUdfUEFOVEhFUkxPUkRfRkYgaXMgbm90IHNldApDT05GSUdfSElEX1BFVEFMWU5YPXkKQ09ORklH
X0hJRF9QSUNPTENEPXkKQ09ORklHX0hJRF9QSUNPTENEX0ZCPXkKQ09ORklHX0hJRF9QSUNPTENE
X0JBQ0tMSUdIVD15CkNPTkZJR19ISURfUElDT0xDRF9MQ0Q9eQpDT05GSUdfSElEX1BJQ09MQ0Rf
TEVEUz15CkNPTkZJR19ISURfUElDT0xDRF9DSVI9eQpDT05GSUdfSElEX1BMQU5UUk9OSUNTPXkK
Q09ORklHX0hJRF9SQVpFUj15CkNPTkZJR19ISURfUFJJTUFYPXkKIyBDT05GSUdfSElEX1NBSVRF
SyBpcyBub3Qgc2V0CkNPTkZJR19ISURfU0VNSVRFSz15CkNPTkZJR19ISURfU1BFRURMSU5LPXkK
Q09ORklHX0hJRF9TVEVBTT15CkNPTkZJR19ISURfU1RFRUxTRVJJRVM9eQpDT05GSUdfSElEX1NV
TlBMVVM9eQojIENPTkZJR19ISURfUk1JIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0dSRUVOQVNJ
QSBpcyBub3Qgc2V0CkNPTkZJR19ISURfU01BUlRKT1lQTFVTPXkKIyBDT05GSUdfU01BUlRKT1lQ
TFVTX0ZGIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9USVZPPXkKIyBDT05GSUdfSElEX1RPUFNFRUQg
aXMgbm90IHNldApDT05GSUdfSElEX1RISU5HTT15CkNPTkZJR19ISURfVURSQVdfUFMzPXkKQ09O
RklHX0hJRF9XSUlNT1RFPXkKIyBDT05GSUdfSElEX1hJTk1PIGlzIG5vdCBzZXQKQ09ORklHX0hJ
RF9aRVJPUExVUz15CiMgQ09ORklHX1pFUk9QTFVTX0ZGIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9a
WURBQ1JPTj15CkNPTkZJR19ISURfU0VOU09SX0hVQj15CkNPTkZJR19ISURfU0VOU09SX0NVU1RP
TV9TRU5TT1I9eQpDT05GSUdfSElEX0FMUFM9eQojIGVuZCBvZiBTcGVjaWFsIEhJRCBkcml2ZXJz
CgojCiMgSTJDIEhJRCBzdXBwb3J0CiMKQ09ORklHX0kyQ19ISURfT0Y9eQpDT05GSUdfSTJDX0hJ
RF9PRl9HT09ESVg9eQojIGVuZCBvZiBJMkMgSElEIHN1cHBvcnQKCkNPTkZJR19JMkNfSElEX0NP
UkU9eQojIGVuZCBvZiBISUQgc3VwcG9ydAoKQ09ORklHX1VTQl9PSENJX0xJVFRMRV9FTkRJQU49
eQpDT05GSUdfVVNCX1NVUFBPUlQ9eQpDT05GSUdfVVNCX0NPTU1PTj15CiMgQ09ORklHX1VTQl9M
RURfVFJJRyBpcyBub3Qgc2V0CkNPTkZJR19VU0JfVUxQSV9CVVM9eQojIENPTkZJR19VU0JfQ09O
Tl9HUElPIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9BUkNIX0hBU19IQ0Q9eQojIENPTkZJR19VU0Ig
aXMgbm90IHNldAoKIwojIFVTQiBwb3J0IGRyaXZlcnMKIwoKIwojIFVTQiBQaHlzaWNhbCBMYXll
ciBkcml2ZXJzCiMKQ09ORklHX1VTQl9QSFk9eQojIENPTkZJR19LRVlTVE9ORV9VU0JfUEhZIGlz
IG5vdCBzZXQKQ09ORklHX05PUF9VU0JfWENFSVY9eQojIENPTkZJR19BTTMzNVhfUEhZX1VTQiBp
cyBub3Qgc2V0CkNPTkZJR19VU0JfR1BJT19WQlVTPXkKQ09ORklHX1RBSFZPX1VTQj15CkNPTkZJ
R19UQUhWT19VU0JfSE9TVF9CWV9ERUZBVUxUPXkKIyBDT05GSUdfVVNCX1RFR1JBX1BIWSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VTQl9VTFBJIGlzIG5vdCBzZXQKIyBDT05GSUdfSlo0NzcwX1BIWSBp
cyBub3Qgc2V0CiMgZW5kIG9mIFVTQiBQaHlzaWNhbCBMYXllciBkcml2ZXJzCgojIENPTkZJR19V
U0JfR0FER0VUIGlzIG5vdCBzZXQKQ09ORklHX1RZUEVDPXkKQ09ORklHX1RZUEVDX1RQUzY1OThY
PXkKQ09ORklHX1RZUEVDX1JUMTcxOT15CkNPTkZJR19UWVBFQ19IRDNTUzMyMjA9eQpDT05GSUdf
VFlQRUNfU1RVU0IxNjBYPXkKIyBDT05GSUdfVFlQRUNfUUNPTV9QTUlDIGlzIG5vdCBzZXQKQ09O
RklHX1RZUEVDX1dVU0IzODAxPXkKCiMKIyBVU0IgVHlwZS1DIE11bHRpcGxleGVyL0RlTXVsdGlw
bGV4ZXIgU3dpdGNoIHN1cHBvcnQKIwpDT05GSUdfVFlQRUNfTVVYX0ZTQTQ0ODA9eQpDT05GSUdf
VFlQRUNfTVVYX1BJM1VTQjMwNTMyPXkKIyBlbmQgb2YgVVNCIFR5cGUtQyBNdWx0aXBsZXhlci9E
ZU11bHRpcGxleGVyIFN3aXRjaCBzdXBwb3J0CgojCiMgVVNCIFR5cGUtQyBBbHRlcm5hdGUgTW9k
ZSBkcml2ZXJzCiMKQ09ORklHX1RZUEVDX0RQX0FMVE1PREU9eQojIENPTkZJR19UWVBFQ19OVklE
SUFfQUxUTU9ERSBpcyBub3Qgc2V0CiMgZW5kIG9mIFVTQiBUeXBlLUMgQWx0ZXJuYXRlIE1vZGUg
ZHJpdmVycwoKQ09ORklHX1VTQl9ST0xFX1NXSVRDSD15CkNPTkZJR19NTUM9eQojIENPTkZJR19Q
V1JTRVFfRU1NQyBpcyBub3Qgc2V0CkNPTkZJR19QV1JTRVFfU0Q4Nzg3PXkKIyBDT05GSUdfUFdS
U0VRX1NJTVBMRSBpcyBub3Qgc2V0CkNPTkZJR19NTUNfQkxPQ0s9eQpDT05GSUdfTU1DX0JMT0NL
X01JTk9SUz04CkNPTkZJR19TRElPX1VBUlQ9eQojIENPTkZJR19NTUNfVEVTVCBpcyBub3Qgc2V0
CgojCiMgTU1DL1NEL1NESU8gSG9zdCBDb250cm9sbGVyIERyaXZlcnMKIwpDT05GSUdfTU1DX0RF
QlVHPXkKQ09ORklHX01NQ19TREhDST15CiMgQ09ORklHX01NQ19TREhDSV9QTFRGTSBpcyBub3Qg
c2V0CiMgQ09ORklHX01NQ19TREhDSV9TM0MgaXMgbm90IHNldAojIENPTkZJR19NTUNfU0RIQ0lf
U1BFQVIgaXMgbm90IHNldAojIENPTkZJR19NTUNfTUVTT05fR1ggaXMgbm90IHNldAojIENPTkZJ
R19NTUNfTUVTT05fTVhfU0RIQyBpcyBub3Qgc2V0CiMgQ09ORklHX01NQ19NRVNPTl9NWF9TRElP
IGlzIG5vdCBzZXQKIyBDT05GSUdfTU1DX01PWEFSVCBpcyBub3Qgc2V0CiMgQ09ORklHX01NQ19P
TUFQX0hTIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1DX0RBVklOQ0kgaXMgbm90IHNldApDT05GSUdf
TU1DX1NQST15CiMgQ09ORklHX01NQ19TM0MgaXMgbm90IHNldAojIENPTkZJR19NTUNfVE1JTyBp
cyBub3Qgc2V0CiMgQ09ORklHX01NQ19TREhJIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1DX1VOSVBI
SUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1DX0RXIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1DX1NI
X01NQ0lGIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1DX1VTREhJNlJPTDAgaXMgbm90IHNldApDT05G
SUdfTU1DX0NRSENJPXkKQ09ORklHX01NQ19IU1E9eQojIENPTkZJR19NTUNfQkNNMjgzNSBpcyBu
b3Qgc2V0CkNPTkZJR19NTUNfTVRLPXkKIyBDT05GSUdfTU1DX09XTCBpcyBub3Qgc2V0CiMgQ09O
RklHX01NQ19MSVRFWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfVUZTSENEIGlzIG5vdCBzZXQK
Q09ORklHX01FTVNUSUNLPXkKIyBDT05GSUdfTUVNU1RJQ0tfREVCVUcgaXMgbm90IHNldAoKIwoj
IE1lbW9yeVN0aWNrIGRyaXZlcnMKIwojIENPTkZJR19NRU1TVElDS19VTlNBRkVfUkVTVU1FIGlz
IG5vdCBzZXQKIyBDT05GSUdfTVNQUk9fQkxPQ0sgaXMgbm90IHNldApDT05GSUdfTVNfQkxPQ0s9
eQoKIwojIE1lbW9yeVN0aWNrIEhvc3QgQ29udHJvbGxlciBEcml2ZXJzCiMKQ09ORklHX05FV19M
RURTPXkKQ09ORklHX0xFRFNfQ0xBU1M9eQojIENPTkZJR19MRURTX0NMQVNTX0ZMQVNIIGlzIG5v
dCBzZXQKIyBDT05GSUdfTEVEU19DTEFTU19NVUxUSUNPTE9SIGlzIG5vdCBzZXQKIyBDT05GSUdf
TEVEU19CUklHSFRORVNTX0hXX0NIQU5HRUQgaXMgbm90IHNldAoKIwojIExFRCBkcml2ZXJzCiMK
Q09ORklHX0xFRFNfODhQTTg2MFg9eQojIENPTkZJR19MRURTX0FOMzAyNTlBIGlzIG5vdCBzZXQK
IyBDT05GSUdfTEVEU19BUklFTCBpcyBub3Qgc2V0CkNPTkZJR19MRURTX0FXMjAxMz15CkNPTkZJ
R19MRURTX0JDTTYzMjg9eQpDT05GSUdfTEVEU19CQ002MzU4PXkKQ09ORklHX0xFRFNfQ1IwMDE0
MTE0PXkKQ09ORklHX0xFRFNfRUwxNTIwMzAwMD15CkNPTkZJR19MRURTX0xNMzUzMD15CkNPTkZJ
R19MRURTX0xNMzUzMj15CkNPTkZJR19MRURTX0xNMzUzMz15CkNPTkZJR19MRURTX0xNMzY0Mj15
CkNPTkZJR19MRURTX0xNMzY5Mlg9eQpDT05GSUdfTEVEU19NVDYzMjM9eQojIENPTkZJR19MRURT
X1MzQzI0WFggaXMgbm90IHNldAojIENPTkZJR19MRURTX0NPQkFMVF9RVUJFIGlzIG5vdCBzZXQK
IyBDT05GSUdfTEVEU19DT0JBTFRfUkFRIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfUENBOTUzMj15
CkNPTkZJR19MRURTX1BDQTk1MzJfR1BJTz15CiMgQ09ORklHX0xFRFNfR1BJTyBpcyBub3Qgc2V0
CkNPTkZJR19MRURTX0xQMzk0ND15CiMgQ09ORklHX0xFRFNfTFAzOTUyIGlzIG5vdCBzZXQKQ09O
RklHX0xFRFNfTFA1MFhYPXkKQ09ORklHX0xFRFNfTFA1NVhYX0NPTU1PTj15CkNPTkZJR19MRURT
X0xQNTUyMT15CiMgQ09ORklHX0xFRFNfTFA1NTIzIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfTFA1
NTYyPXkKIyBDT05GSUdfTEVEU19MUDg1MDEgaXMgbm90IHNldApDT05GSUdfTEVEU19MUDg3ODg9
eQpDT05GSUdfTEVEU19MUDg4NjA9eQojIENPTkZJR19MRURTX1BDQTk1NVggaXMgbm90IHNldApD
T05GSUdfTEVEU19QQ0E5NjNYPXkKQ09ORklHX0xFRFNfV004MzFYX1NUQVRVUz15CkNPTkZJR19M
RURTX0RBOTA1Mj15CkNPTkZJR19MRURTX0RBQzEyNFMwODU9eQojIENPTkZJR19MRURTX1JFR1VM
QVRPUiBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfQkQyODAyIGlzIG5vdCBzZXQKIyBDT05GSUdf
TEVEU19MVDM1OTMgaXMgbm90IHNldApDT05GSUdfTEVEU19NQzEzNzgzPXkKQ09ORklHX0xFRFNf
TlMyPXkKQ09ORklHX0xFRFNfTkVUWEJJRz15CkNPTkZJR19MRURTX1RDQTY1MDc9eQojIENPTkZJ
R19MRURTX1RMQzU5MVhYIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfTUFYNzc2NTA9eQpDT05GSUdf
TEVEU19MTTM1NXg9eQojIENPTkZJR19MRURTX09UMjAwIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNf
TUVORjIxQk1DPXkKQ09ORklHX0xFRFNfSVMzMUZMMzE5WD15CkNPTkZJR19MRURTX0lTMzFGTDMy
WFg9eQoKIwojIExFRCBkcml2ZXIgZm9yIGJsaW5rKDEpIFVTQiBSR0IgTEVEIGlzIHVuZGVyIFNw
ZWNpYWwgSElEIGRyaXZlcnMgKEhJRF9USElOR00pCiMKQ09ORklHX0xFRFNfQkxJTktNPXkKQ09O
RklHX0xFRFNfU1lTQ09OPXkKQ09ORklHX0xFRFNfTUxYUkVHPXkKIyBDT05GSUdfTEVEU19VU0VS
IGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19TUElfQllURSBpcyBub3Qgc2V0CkNPTkZJR19MRURT
X1RJX0xNVV9DT01NT049eQojIENPTkZJR19MRURTX0xNMzY5NyBpcyBub3Qgc2V0CiMgQ09ORklH
X0xFRFNfSVAzMCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTEdNIGlzIG5vdCBzZXQKCiMKIyBG
bGFzaCBhbmQgVG9yY2ggTEVEIGRyaXZlcnMKIwoKIwojIFJHQiBMRUQgZHJpdmVycwojCgojCiMg
TEVEIFRyaWdnZXJzCiMKQ09ORklHX0xFRFNfVFJJR0dFUlM9eQpDT05GSUdfTEVEU19UUklHR0VS
X1RJTUVSPXkKQ09ORklHX0xFRFNfVFJJR0dFUl9PTkVTSE9UPXkKIyBDT05GSUdfTEVEU19UUklH
R0VSX0hFQVJUQkVBVCBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1RSSUdHRVJfQkFDS0xJR0hUPXkK
IyBDT05GSUdfTEVEU19UUklHR0VSX0NQVSBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1RSSUdHRVJf
QUNUSVZJVFk9eQojIENPTkZJR19MRURTX1RSSUdHRVJfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklH
X0xFRFNfVFJJR0dFUl9ERUZBVUxUX09OIGlzIG5vdCBzZXQKCiMKIyBpcHRhYmxlcyB0cmlnZ2Vy
IGlzIHVuZGVyIE5ldGZpbHRlciBjb25maWcgKExFRCB0YXJnZXQpCiMKIyBDT05GSUdfTEVEU19U
UklHR0VSX1RSQU5TSUVOVCBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1RSSUdHRVJfQ0FNRVJBPXkK
IyBDT05GSUdfTEVEU19UUklHR0VSX1BBTklDIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfVFJJR0dF
Ul9ORVRERVY9eQpDT05GSUdfTEVEU19UUklHR0VSX1BBVFRFUk49eQojIENPTkZJR19MRURTX1RS
SUdHRVJfQVVESU8gaXMgbm90IHNldApDT05GSUdfTEVEU19UUklHR0VSX1RUWT15CgojCiMgU2lt
cGxlIExFRCBkcml2ZXJzCiMKQ09ORklHX0FDQ0VTU0lCSUxJVFk9eQojIENPTkZJR19BMTFZX0JS
QUlMTEVfQ09OU09MRSBpcyBub3Qgc2V0CgojCiMgU3BlYWt1cCBjb25zb2xlIHNwZWVjaAojCkNP
TkZJR19TUEVBS1VQPXkKQ09ORklHX1NQRUFLVVBfU0VSSUFMSU89eQpDT05GSUdfU1BFQUtVUF9T
WU5USF9BQ05UU0E9eQojIENPTkZJR19TUEVBS1VQX1NZTlRIX0FDTlRQQyBpcyBub3Qgc2V0CkNP
TkZJR19TUEVBS1VQX1NZTlRIX0FQT0xMTz15CiMgQ09ORklHX1NQRUFLVVBfU1lOVEhfQVVEUFRS
IGlzIG5vdCBzZXQKIyBDT05GSUdfU1BFQUtVUF9TWU5USF9CTlMgaXMgbm90IHNldApDT05GSUdf
U1BFQUtVUF9TWU5USF9ERUNUTEs9eQpDT05GSUdfU1BFQUtVUF9TWU5USF9ERUNFWFQ9eQojIENP
TkZJR19TUEVBS1VQX1NZTlRIX0RUTEsgaXMgbm90IHNldAojIENPTkZJR19TUEVBS1VQX1NZTlRI
X0tFWVBDIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BFQUtVUF9TWU5USF9MVExLIGlzIG5vdCBzZXQK
Q09ORklHX1NQRUFLVVBfU1lOVEhfU09GVD15CkNPTkZJR19TUEVBS1VQX1NZTlRIX1NQS09VVD15
CiMgQ09ORklHX1NQRUFLVVBfU1lOVEhfVFhQUlQgaXMgbm90IHNldApDT05GSUdfU1BFQUtVUF9T
WU5USF9EVU1NWT15CiMgZW5kIG9mIFNwZWFrdXAgY29uc29sZSBzcGVlY2gKCkNPTkZJR19JTkZJ
TklCQU5EPXkKQ09ORklHX0lORklOSUJBTkRfVVNFUl9NQUQ9eQpDT05GSUdfSU5GSU5JQkFORF9V
U0VSX0FDQ0VTUz15CkNPTkZJR19JTkZJTklCQU5EX1VTRVJfTUVNPXkKQ09ORklHX0lORklOSUJB
TkRfT05fREVNQU5EX1BBR0lORz15CiMgQ09ORklHX0lORklOSUJBTkRfQUREUl9UUkFOUyBpcyBu
b3Qgc2V0CkNPTkZJR19JTkZJTklCQU5EX1ZJUlRfRE1BPXkKQ09ORklHX1JETUFfU0lXPXkKQ09O
RklHX0lORklOSUJBTkRfSVBPSUI9eQpDT05GSUdfSU5GSU5JQkFORF9JUE9JQl9DTT15CkNPTkZJ
R19JTkZJTklCQU5EX0lQT0lCX0RFQlVHPXkKQ09ORklHX0lORklOSUJBTkRfSVBPSUJfREVCVUdf
REFUQT15CiMgQ09ORklHX1JUQ19DTEFTUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RNQURFVklDRVMg
aXMgbm90IHNldAoKIwojIERNQUJVRiBvcHRpb25zCiMKQ09ORklHX1NZTkNfRklMRT15CkNPTkZJ
R19TV19TWU5DPXkKIyBDT05GSUdfVURNQUJVRiBpcyBub3Qgc2V0CiMgQ09ORklHX0RNQUJVRl9N
T1ZFX05PVElGWSBpcyBub3Qgc2V0CkNPTkZJR19ETUFCVUZfREVCVUc9eQpDT05GSUdfRE1BQlVG
X1NFTEZURVNUUz15CkNPTkZJR19ETUFCVUZfSEVBUFM9eQpDT05GSUdfRE1BQlVGX1NZU0ZTX1NU
QVRTPXkKQ09ORklHX0RNQUJVRl9IRUFQU19TWVNURU09eQojIGVuZCBvZiBETUFCVUYgb3B0aW9u
cwoKIyBDT05GSUdfQVVYRElTUExBWSBpcyBub3Qgc2V0CiMgQ09ORklHX1BBTkVMIGlzIG5vdCBz
ZXQKQ09ORklHX1VJTz15CkNPTkZJR19VSU9fUERSVl9HRU5JUlE9eQpDT05GSUdfVUlPX0RNRU1f
R0VOSVJRPXkKIyBDT05GSUdfVUlPX1BSVVNTIGlzIG5vdCBzZXQKIyBDT05GSUdfVUlPX0RGTCBp
cyBub3Qgc2V0CkNPTkZJR19WRklPPXkKIyBDT05GSUdfVkZJT19OT0lPTU1VIGlzIG5vdCBzZXQK
IyBDT05GSUdfVkZJT19QTEFURk9STSBpcyBub3Qgc2V0CkNPTkZJR19WRklPX01ERVY9eQojIENP
TkZJR19WSVJUX0RSSVZFUlMgaXMgbm90IHNldApDT05GSUdfVklSVElPPXkKQ09ORklHX1ZJUlRJ
T19NRU5VPXkKQ09ORklHX1ZJUlRJT19WRFBBPXkKIyBDT05GSUdfVklSVElPX0JBTExPT04gaXMg
bm90IHNldApDT05GSUdfVklSVElPX0lOUFVUPXkKQ09ORklHX1ZJUlRJT19NTUlPPXkKIyBDT05G
SUdfVklSVElPX01NSU9fQ01ETElORV9ERVZJQ0VTIGlzIG5vdCBzZXQKQ09ORklHX1ZEUEE9eQoj
IENPTkZJR19WRFBBX1VTRVIgaXMgbm90IHNldAojIENPTkZJR19WSE9TVF9NRU5VIGlzIG5vdCBz
ZXQKCiMKIyBNaWNyb3NvZnQgSHlwZXItViBndWVzdCBzdXBwb3J0CiMKIyBlbmQgb2YgTWljcm9z
b2Z0IEh5cGVyLVYgZ3Vlc3Qgc3VwcG9ydAoKIyBDT05GSUdfR1JFWUJVUyBpcyBub3Qgc2V0CkNP
TkZJR19DT01FREk9eQpDT05GSUdfQ09NRURJX0RFQlVHPXkKQ09ORklHX0NPTUVESV9ERUZBVUxU
X0JVRl9TSVpFX0tCPTIwNDgKQ09ORklHX0NPTUVESV9ERUZBVUxUX0JVRl9NQVhTSVpFX0tCPTIw
NDgwCkNPTkZJR19DT01FRElfTUlTQ19EUklWRVJTPXkKQ09ORklHX0NPTUVESV9CT05EPXkKQ09O
RklHX0NPTUVESV9URVNUPXkKQ09ORklHX0NPTUVESV9QQVJQT1JUPXkKIyBDT05GSUdfQ09NRURJ
X1NTVl9ETlAgaXMgbm90IHNldApDT05GSUdfQ09NRURJX0lTQV9EUklWRVJTPXkKQ09ORklHX0NP
TUVESV9QQ0w3MTE9eQpDT05GSUdfQ09NRURJX1BDTDcyND15CkNPTkZJR19DT01FRElfUENMNzI2
PXkKQ09ORklHX0NPTUVESV9QQ0w3MzA9eQpDT05GSUdfQ09NRURJX1BDTDgxMj15CiMgQ09ORklH
X0NPTUVESV9QQ0w4MTYgaXMgbm90IHNldApDT05GSUdfQ09NRURJX1BDTDgxOD15CiMgQ09ORklH
X0NPTUVESV9QQ00zNzI0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NRURJX0FNUExDX0RJTzIwMF9J
U0EgaXMgbm90IHNldApDT05GSUdfQ09NRURJX0FNUExDX1BDMjM2X0lTQT15CkNPTkZJR19DT01F
RElfQU1QTENfUEMyNjNfSVNBPXkKQ09ORklHX0NPTUVESV9SVEk4MDA9eQpDT05GSUdfQ09NRURJ
X1JUSTgwMj15CkNPTkZJR19DT01FRElfREFDMDI9eQpDT05GSUdfQ09NRURJX0RBUzE2TTE9eQpD
T05GSUdfQ09NRURJX0RBUzA4X0lTQT15CkNPTkZJR19DT01FRElfREFTMTY9eQpDT05GSUdfQ09N
RURJX0RBUzgwMD15CiMgQ09ORklHX0NPTUVESV9EQVMxODAwIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q09NRURJX0RBUzY0MDIgaXMgbm90IHNldApDT05GSUdfQ09NRURJX0RUMjgwMT15CkNPTkZJR19D
T01FRElfRFQyODExPXkKQ09ORklHX0NPTUVESV9EVDI4MTQ9eQojIENPTkZJR19DT01FRElfRFQy
ODE1IGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NRURJX0RUMjgxNyBpcyBub3Qgc2V0CkNPTkZJR19D
T01FRElfRFQyODJYPXkKQ09ORklHX0NPTUVESV9ETU0zMkFUPXkKQ09ORklHX0NPTUVESV9GTDUx
Mj15CiMgQ09ORklHX0NPTUVESV9BSU9fQUlPMTJfOCBpcyBub3Qgc2V0CkNPTkZJR19DT01FRElf
QUlPX0lJUk9fMTY9eQojIENPTkZJR19DT01FRElfSUlfUENJMjBLQyBpcyBub3Qgc2V0CiMgQ09O
RklHX0NPTUVESV9DNlhESUdJTyBpcyBub3Qgc2V0CkNPTkZJR19DT01FRElfTVBDNjI0PXkKQ09O
RklHX0NPTUVESV9BRFExMkI9eQojIENPTkZJR19DT01FRElfTklfQVRfQTIxNTAgaXMgbm90IHNl
dApDT05GSUdfQ09NRURJX05JX0FUX0FPPXkKQ09ORklHX0NPTUVESV9OSV9BVE1JTz15CkNPTkZJ
R19DT01FRElfTklfQVRNSU8xNkQ9eQojIENPTkZJR19DT01FRElfTklfTEFCUENfSVNBIGlzIG5v
dCBzZXQKQ09ORklHX0NPTUVESV9QQ01BRD15CkNPTkZJR19DT01FRElfUENNREExMj15CkNPTkZJ
R19DT01FRElfUENNTUlPPXkKIyBDT05GSUdfQ09NRURJX1BDTVVJTyBpcyBub3Qgc2V0CiMgQ09O
RklHX0NPTUVESV9NVUxUSVEzIGlzIG5vdCBzZXQKQ09ORklHX0NPTUVESV9TNTI2PXkKQ09ORklH
X0NPTUVESV84MjU0PXkKQ09ORklHX0NPTUVESV84MjU1PXkKQ09ORklHX0NPTUVESV84MjU1X1NB
PXkKQ09ORklHX0NPTUVESV9LQ09NRURJTElCPXkKQ09ORklHX0NPTUVESV9BTVBMQ19QQzIzNj15
CkNPTkZJR19DT01FRElfREFTMDg9eQpDT05GSUdfQ09NRURJX05JX1RJTz15CkNPTkZJR19DT01F
RElfTklfUk9VVElORz15CiMgQ09ORklHX0NPTUVESV9URVNUUyBpcyBub3Qgc2V0CkNPTkZJR19T
VEFHSU5HPXkKIyBDT05GSUdfT0NURU9OX0VUSEVSTkVUIGlzIG5vdCBzZXQKCiMKIyBJSU8gc3Rh
Z2luZyBkcml2ZXJzCiMKCiMKIyBBY2NlbGVyb21ldGVycwojCiMgQ09ORklHX0FESVMxNjIwMyBp
cyBub3Qgc2V0CkNPTkZJR19BRElTMTYyNDA9eQojIGVuZCBvZiBBY2NlbGVyb21ldGVycwoKIwoj
IEFuYWxvZyB0byBkaWdpdGFsIGNvbnZlcnRlcnMKIwpDT05GSUdfQUQ3ODE2PXkKIyBlbmQgb2Yg
QW5hbG9nIHRvIGRpZ2l0YWwgY29udmVydGVycwoKIwojIEFuYWxvZyBkaWdpdGFsIGJpLWRpcmVj
dGlvbiBjb252ZXJ0ZXJzCiMKQ09ORklHX0FEVDczMTY9eQpDT05GSUdfQURUNzMxNl9TUEk9eQpD
T05GSUdfQURUNzMxNl9JMkM9eQojIGVuZCBvZiBBbmFsb2cgZGlnaXRhbCBiaS1kaXJlY3Rpb24g
Y29udmVydGVycwoKIwojIENhcGFjaXRhbmNlIHRvIGRpZ2l0YWwgY29udmVydGVycwojCkNPTkZJ
R19BRDc3NDY9eQojIGVuZCBvZiBDYXBhY2l0YW5jZSB0byBkaWdpdGFsIGNvbnZlcnRlcnMKCiMK
IyBEaXJlY3QgRGlnaXRhbCBTeW50aGVzaXMKIwpDT05GSUdfQUQ5ODMyPXkKIyBDT05GSUdfQUQ5
ODM0IGlzIG5vdCBzZXQKIyBlbmQgb2YgRGlyZWN0IERpZ2l0YWwgU3ludGhlc2lzCgojCiMgTmV0
d29yayBBbmFseXplciwgSW1wZWRhbmNlIENvbnZlcnRlcnMKIwpDT05GSUdfQUQ1OTMzPXkKIyBl
bmQgb2YgTmV0d29yayBBbmFseXplciwgSW1wZWRhbmNlIENvbnZlcnRlcnMKCiMKIyBBY3RpdmUg
ZW5lcmd5IG1ldGVyaW5nIElDCiMKIyBDT05GSUdfQURFNzg1NCBpcyBub3Qgc2V0CiMgZW5kIG9m
IEFjdGl2ZSBlbmVyZ3kgbWV0ZXJpbmcgSUMKCiMKIyBSZXNvbHZlciB0byBkaWdpdGFsIGNvbnZl
cnRlcnMKIwojIENPTkZJR19BRDJTMTIxMCBpcyBub3Qgc2V0CiMgZW5kIG9mIFJlc29sdmVyIHRv
IGRpZ2l0YWwgY29udmVydGVycwojIGVuZCBvZiBJSU8gc3RhZ2luZyBkcml2ZXJzCgojIENPTkZJ
R19TVEFHSU5HX01FRElBIGlzIG5vdCBzZXQKQ09ORklHX1NUQUdJTkdfQk9BUkQ9eQpDT05GSUdf
Q09NTU9OX0NMS19YTE5YX0NMS1daUkQ9eQojIENPTkZJR19GQl9URlQgaXMgbm90IHNldApDT05G
SUdfTU9TVF9DT01QT05FTlRTPXkKQ09ORklHX01PU1RfTkVUPXkKQ09ORklHX01PU1RfRElNMj15
CkNPTkZJR19NT1NUX0kyQz15CiMgQ09ORklHX0tTNzAxMCBpcyBub3Qgc2V0CkNPTkZJR19CQ01f
VklERU9DT1JFPXkKIyBDT05GSUdfQkNNMjgzNV9WQ0hJUSBpcyBub3Qgc2V0CkNPTkZJR19QSTQz
Mz15CkNPTkZJR19YSUxfQVhJU19GSUZPPXkKQ09ORklHX0ZJRUxEQlVTX0RFVj15CiMgQ09ORklH
X0hNU19BTllCVVNTX0JVUyBpcyBub3Qgc2V0CgojCiMgVk1FIERldmljZSBEcml2ZXJzCiMKQ09O
RklHX0dPTERGSVNIPXkKQ09ORklHX0dPTERGSVNIX1BJUEU9eQojIENPTkZJR19DSFJPTUVfUExB
VEZPUk1TIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVMTEFOT1hfUExBVEZPUk0gaXMgbm90IHNldAoj
IENPTkZJR19PTFBDX1hPMTc1IGlzIG5vdCBzZXQKQ09ORklHX1NVUkZBQ0VfUExBVEZPUk1TPXkK
Q09ORklHX0hBVkVfQ0xLPXkKQ09ORklHX0hBVkVfQ0xLX1BSRVBBUkU9eQpDT05GSUdfQ09NTU9O
X0NMSz15CkNPTkZJR19DT01NT05fQ0xLX1dNODMxWD15CgojCiMgQ2xvY2sgZHJpdmVyIGZvciBB
Uk0gUmVmZXJlbmNlIGRlc2lnbnMKIwojIENPTkZJR19DTEtfSUNTVCBpcyBub3Qgc2V0CiMgQ09O
RklHX0NMS19TUDgxMCBpcyBub3Qgc2V0CiMgZW5kIG9mIENsb2NrIGRyaXZlciBmb3IgQVJNIFJl
ZmVyZW5jZSBkZXNpZ25zCgojIENPTkZJR19DTEtfSFNESyBpcyBub3Qgc2V0CiMgQ09ORklHX0xN
SzA0ODMyIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19BUFBMRV9OQ08gaXMgbm90IHNl
dAojIENPTkZJR19DT01NT05fQ0xLX01BWDc3Njg2IGlzIG5vdCBzZXQKQ09ORklHX0NPTU1PTl9D
TEtfTUFYOTQ4NT15CiMgQ09ORklHX0NPTU1PTl9DTEtfU0NNSSBpcyBub3Qgc2V0CiMgQ09ORklH
X0NPTU1PTl9DTEtfU0NQSSBpcyBub3Qgc2V0CkNPTkZJR19DT01NT05fQ0xLX1NJNTM0MT15CkNP
TkZJR19DT01NT05fQ0xLX1NJNTM1MT15CkNPTkZJR19DT01NT05fQ0xLX1NJNTE0PXkKIyBDT05G
SUdfQ09NTU9OX0NMS19TSTU0NCBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfU0k1NzAg
aXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX0JNMTg4MCBpcyBub3Qgc2V0CkNPTkZJR19D
T01NT05fQ0xLX0NEQ0U3MDY9eQojIENPTkZJR19DT01NT05fQ0xLX1RQUzY4NDcwIGlzIG5vdCBz
ZXQKQ09ORklHX0NPTU1PTl9DTEtfQ0RDRTkyNT15CkNPTkZJR19DT01NT05fQ0xLX0NTMjAwMF9D
UD15CiMgQ09ORklHX0NPTU1PTl9DTEtfRU43NTIzIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9O
X0NMS19GU0xfRkxFWFNQSSBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfRlNMX1NBSSBp
cyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfR0VNSU5JIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q09NTU9OX0NMS19MQU45NjZYIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19BU1BFRUQg
aXMgbm90IHNldApDT05GSUdfQ09NTU9OX0NMS19TMk1QUzExPXkKIyBDT05GSUdfQ0xLX1RXTDYw
NDAgaXMgbm90IHNldApDT05GSUdfQ09NTU9OX0NMS19BWElfQ0xLR0VOPXkKIyBDT05GSUdfQ0xL
X1FPUklRIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLX0xTMTAyOEFfUExMRElHIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ09NTU9OX0NMS19YR0VORSBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtf
UEFMTUFTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19PWE5BUyBpcyBub3Qgc2V0CiMg
Q09ORklHX0NPTU1PTl9DTEtfUlM5X1BDSUUgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xL
X1ZDNSBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfTU1QMl9BVURJTyBpcyBub3Qgc2V0
CkNPTkZJR19DT01NT05fQ0xLX0JENzE4WFg9eQpDT05GSUdfQ09NTU9OX0NMS19GSVhFRF9NTUlP
PXkKIyBDT05GSUdfQ0xLX0FDVElPTlMgaXMgbm90IHNldAojIENPTkZJR19DTEtfQkFJS0FMX1Qx
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLX0JDTTI3MTFfRFZQIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q0xLX0JDTTI4MzUgaXMgbm90IHNldAojIENPTkZJR19DTEtfQkNNXzYzWFggaXMgbm90IHNldAoj
IENPTkZJR19DTEtfQkNNXzYzWFhfR0FURSBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS19CQ01fS09O
QSBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS19CQ01fQ1lHTlVTIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q0xLX0JDTV9IUjIgaXMgbm90IHNldAojIENPTkZJR19DTEtfQkNNX05TUCBpcyBub3Qgc2V0CiMg
Q09ORklHX0NMS19CQ01fTlMyIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLX0JDTV9TUiBpcyBub3Qg
c2V0CiMgQ09ORklHX0NMS19SQVNQQkVSUllQSSBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9D
TEtfSEkzNTE2Q1YzMDAgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX0hJMzUxOSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfSEkzNTU5QSBpcyBub3Qgc2V0CiMgQ09ORklHX0NP
TU1PTl9DTEtfSEkzNjYwIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19ISTM2NzAgaXMg
bm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX0hJMzc5OENWMjAwIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ09NTU9OX0NMS19ISTYyMjAgaXMgbm90IHNldAojIENPTkZJR19SRVNFVF9ISVNJIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19CT1NUT04gaXMgbm90IHNldAojIENPTkZJR19NWENf
Q0xLIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLX0lNWDhNTSBpcyBub3Qgc2V0CiMgQ09ORklHX0NM
S19JTVg4TU4gaXMgbm90IHNldAojIENPTkZJR19DTEtfSU1YOE1QIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ0xLX0lNWDhNUSBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS19JTVg4VUxQIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ0xLX0lNWDkzIGlzIG5vdCBzZXQKCiMKIyBJbmdlbmljIFNvQ3MgZHJpdmVycwoj
CiMgQ09ORklHX0lOR0VOSUNfQ0dVX0paNDc0MCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOR0VOSUNf
Q0dVX0paNDcyNUIgaXMgbm90IHNldAojIENPTkZJR19JTkdFTklDX0NHVV9KWjQ3NjAgaXMgbm90
IHNldAojIENPTkZJR19JTkdFTklDX0NHVV9KWjQ3NzAgaXMgbm90IHNldAojIENPTkZJR19JTkdF
TklDX0NHVV9KWjQ3ODAgaXMgbm90IHNldAojIENPTkZJR19JTkdFTklDX0NHVV9YMTAwMCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lOR0VOSUNfQ0dVX1gxODMwIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5H
RU5JQ19UQ1VfQ0xLIGlzIG5vdCBzZXQKIyBlbmQgb2YgSW5nZW5pYyBTb0NzIGRyaXZlcnMKCiMg
Q09ORklHX0NPTU1PTl9DTEtfS0VZU1RPTkUgaXMgbm90IHNldAojIENPTkZJR19USV9TWVNDT05f
Q0xLIGlzIG5vdCBzZXQKCiMKIyBDbG9jayBkcml2ZXIgZm9yIE1lZGlhVGVrIFNvQwojCiMgQ09O
RklHX0NPTU1PTl9DTEtfTVQyNzAxIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19NVDI3
MTIgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX01UNjc2NSBpcyBub3Qgc2V0CiMgQ09O
RklHX0NPTU1PTl9DTEtfTVQ2Nzc5IGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19NVDY3
OTcgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX01UNzYyMiBpcyBub3Qgc2V0CiMgQ09O
RklHX0NPTU1PTl9DTEtfTVQ3NjI5IGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19NVDc5
ODYgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX01UODEzNSBpcyBub3Qgc2V0CiMgQ09O
RklHX0NPTU1PTl9DTEtfTVQ4MTY3IGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19NVDgx
NzMgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX01UODE4MyBpcyBub3Qgc2V0CiMgQ09O
RklHX0NPTU1PTl9DTEtfTVQ4MTg2IGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19NVDgx
OTIgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX01UODE5NSBpcyBub3Qgc2V0CiMgQ09O
RklHX0NPTU1PTl9DTEtfTVQ4NTE2IGlzIG5vdCBzZXQKIyBlbmQgb2YgQ2xvY2sgZHJpdmVyIGZv
ciBNZWRpYVRlayBTb0MKCiMKIyBDbG9jayBzdXBwb3J0IGZvciBBbWxvZ2ljIHBsYXRmb3Jtcwoj
CiMgZW5kIG9mIENsb2NrIHN1cHBvcnQgZm9yIEFtbG9naWMgcGxhdGZvcm1zCgojIENPTkZJR19N
U1RBUl9NU0MzMTNfTVBMTCBpcyBub3Qgc2V0CiMgQ09ORklHX01DSFBfQ0xLX01QRlMgaXMgbm90
IHNldAojIENPTkZJR19DT01NT05fQ0xLX1BJU1RBQ0hJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0NP
TU1PTl9DTEtfUUNPTSBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS19NVDc2MjEgaXMgbm90IHNldAoj
IENPTkZJR19DTEtfUkVORVNBUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfU0FNU1VO
RyBpcyBub3Qgc2V0CiMgQ09ORklHX1MzQzI0MTBfQ09NTU9OX0NMSyBpcyBub3Qgc2V0CiMgQ09O
RklHX1MzQzI0MTJfQ09NTU9OX0NMSyBpcyBub3Qgc2V0CiMgQ09ORklHX1MzQzI0NDNfQ09NTU9O
X0NMSyBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS19TSUZJVkUgaXMgbm90IHNldAojIENPTkZJR19D
TEtfSU5URUxfU09DRlBHQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NQUkRfQ09NTU9OX0NMSyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NMS19TVEFSRklWRV9KSDcxMDAgaXMgbm90IHNldApDT05GSUdfQ0xL
X1NVTlhJPXkKQ09ORklHX0NMS19TVU5YSV9DTE9DS1M9eQpDT05GSUdfQ0xLX1NVTlhJX1BSQ01f
U1VONkk9eQpDT05GSUdfQ0xLX1NVTlhJX1BSQ01fU1VOOEk9eQpDT05GSUdfQ0xLX1NVTlhJX1BS
Q01fU1VOOUk9eQojIENPTkZJR19TVU5YSV9DQ1UgaXMgbm90IHNldAojIENPTkZJR19DT01NT05f
Q0xLX1RJX0FEUExMIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLX1VOSVBISUVSIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ09NTU9OX0NMS19WSVNDT05USSBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS19MR01f
Q0dVIGlzIG5vdCBzZXQKIyBDT05GSUdfWElMSU5YX1ZDVSBpcyBub3Qgc2V0CiMgQ09ORklHX0NP
TU1PTl9DTEtfWllOUU1QIGlzIG5vdCBzZXQKIyBDT05GSUdfSFdTUElOTE9DSyBpcyBub3Qgc2V0
CgojCiMgQ2xvY2sgU291cmNlIGRyaXZlcnMKIwojIENPTkZJR19CQ00yODM1X1RJTUVSIGlzIG5v
dCBzZXQKIyBDT05GSUdfQkNNX0tPTkFfVElNRVIgaXMgbm90IHNldAojIENPTkZJR19EQVZJTkNJ
X1RJTUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfRElHSUNPTE9SX1RJTUVSIGlzIG5vdCBzZXQKIyBD
T05GSUdfRFdfQVBCX1RJTUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfRlRUTVIwMTBfVElNRVIgaXMg
bm90IHNldAojIENPTkZJR19JWFA0WFhfVElNRVIgaXMgbm90IHNldAojIENPTkZJR19NRVNPTjZf
VElNRVIgaXMgbm90IHNldAojIENPTkZJR19PV0xfVElNRVIgaXMgbm90IHNldAojIENPTkZJR19S
REFfVElNRVIgaXMgbm90IHNldAojIENPTkZJR19TVU40SV9USU1FUiBpcyBub3Qgc2V0CiMgQ09O
RklHX1NVTjVJX0hTVElNRVIgaXMgbm90IHNldAojIENPTkZJR19URUdSQV9USU1FUiBpcyBub3Qg
c2V0CiMgQ09ORklHX1ZUODUwMF9USU1FUiBpcyBub3Qgc2V0CiMgQ09ORklHX05QQ003WFhfVElN
RVIgaXMgbm90IHNldAojIENPTkZJR19DQURFTkNFX1RUQ19USU1FUiBpcyBub3Qgc2V0CiMgQ09O
RklHX0FTTTkyNjBfVElNRVIgaXMgbm90IHNldAojIENPTkZJR19DTEtTUkNfREJYNTAwX1BSQ01V
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xQUzcxMVhfVElNRVIgaXMgbm90IHNldAojIENPTkZJR19N
WFNfVElNRVIgaXMgbm90IHNldAojIENPTkZJR19OU1BJUkVfVElNRVIgaXMgbm90IHNldAojIENP
TkZJR19JTlRFR1JBVE9SX0FQX1RJTUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLU1JDX1BJU1RB
Q0hJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS1NSQ19TVE0zMl9MUCBpcyBub3Qgc2V0CiMgQ09O
RklHX0FSTVY3TV9TWVNUSUNLIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRNRUxfUElUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQVRNRUxfU1QgaXMgbm90IHNldAojIENPTkZJR19DTEtTUkNfU0FNU1VOR19Q
V00gaXMgbm90IHNldAojIENPTkZJR19GU0xfRlRNX1RJTUVSIGlzIG5vdCBzZXQKIyBDT05GSUdf
T1hOQVNfUlBTX1RJTUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfTVRLX1RJTUVSIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ0xLU1JDX0pDT1JFX1BJVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NIX1RJTUVSX0NN
VCBpcyBub3Qgc2V0CiMgQ09ORklHX1NIX1RJTUVSX01UVTIgaXMgbm90IHNldAojIENPTkZJR19S
RU5FU0FTX09TVE0gaXMgbm90IHNldAojIENPTkZJR19TSF9USU1FUl9UTVUgaXMgbm90IHNldAoj
IENPTkZJR19FTV9USU1FUl9TVEkgaXMgbm90IHNldAojIENPTkZJR19DTEtTUkNfUFhBIGlzIG5v
dCBzZXQKIyBDT05GSUdfVElNRVJfSU1YX1NZU19DVFIgaXMgbm90IHNldAojIENPTkZJR19DTEtT
UkNfU1RfTFBDIGlzIG5vdCBzZXQKIyBDT05GSUdfR1hQX1RJTUVSIGlzIG5vdCBzZXQKIyBDT05G
SUdfTVNDMzEzRV9USU1FUiBpcyBub3Qgc2V0CiMgQ09ORklHX0lOR0VOSUNfVElNRVIgaXMgbm90
IHNldAojIENPTkZJR19JTkdFTklDX1NZU09TVCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOR0VOSUNf
T1NUIGlzIG5vdCBzZXQKIyBDT05GSUdfTUlDUk9DSElQX1BJVDY0QiBpcyBub3Qgc2V0CiMgZW5k
IG9mIENsb2NrIFNvdXJjZSBkcml2ZXJzCgojIENPTkZJR19NQUlMQk9YIGlzIG5vdCBzZXQKQ09O
RklHX0lPTU1VX0FQST15CiMgQ09ORklHX0lPTU1VX1NVUFBPUlQgaXMgbm90IHNldAoKIwojIFJl
bW90ZXByb2MgZHJpdmVycwojCiMgQ09ORklHX1JFTU9URVBST0MgaXMgbm90IHNldAojIGVuZCBv
ZiBSZW1vdGVwcm9jIGRyaXZlcnMKCiMKIyBScG1zZyBkcml2ZXJzCiMKQ09ORklHX1JQTVNHPXkK
IyBDT05GSUdfUlBNU0dfQ0hBUiBpcyBub3Qgc2V0CkNPTkZJR19SUE1TR19DVFJMPXkKQ09ORklH
X1JQTVNHX05TPXkKQ09ORklHX1JQTVNHX1ZJUlRJTz15CiMgZW5kIG9mIFJwbXNnIGRyaXZlcnMK
CiMgQ09ORklHX1NPVU5EV0lSRSBpcyBub3Qgc2V0CgojCiMgU09DIChTeXN0ZW0gT24gQ2hpcCkg
c3BlY2lmaWMgRHJpdmVycwojCgojCiMgQW1sb2dpYyBTb0MgZHJpdmVycwojCiMgQ09ORklHX01F
U09OX0NBTlZBUyBpcyBub3Qgc2V0CiMgQ09ORklHX01FU09OX0NMS19NRUFTVVJFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUVTT05fR1hfU09DSU5GTyBpcyBub3Qgc2V0CiMgQ09ORklHX01FU09OX01Y
X1NPQ0lORk8gaXMgbm90IHNldAojIGVuZCBvZiBBbWxvZ2ljIFNvQyBkcml2ZXJzCgojCiMgQXBw
bGUgU29DIGRyaXZlcnMKIwojIENPTkZJR19BUFBMRV9TQVJUIGlzIG5vdCBzZXQKIyBlbmQgb2Yg
QXBwbGUgU29DIGRyaXZlcnMKCiMKIyBBU1BFRUQgU29DIGRyaXZlcnMKIwojIENPTkZJR19BU1BF
RURfTFBDX0NUUkwgaXMgbm90IHNldAojIENPTkZJR19BU1BFRURfTFBDX1NOT09QIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQVNQRUVEX1VBUlRfUk9VVElORyBpcyBub3Qgc2V0CiMgQ09ORklHX0FTUEVF
RF9QMkFfQ1RSTCBpcyBub3Qgc2V0CiMgQ09ORklHX0FTUEVFRF9TT0NJTkZPIGlzIG5vdCBzZXQK
IyBlbmQgb2YgQVNQRUVEIFNvQyBkcml2ZXJzCgojIENPTkZJR19BVDkxX1NPQ19JRCBpcyBub3Qg
c2V0CiMgQ09ORklHX0FUOTFfU09DX1NGUiBpcyBub3Qgc2V0CgojCiMgQnJvYWRjb20gU29DIGRy
aXZlcnMKIwojIENPTkZJR19CQ00yODM1X1BPV0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfU09DX0JD
TTYzWFggaXMgbm90IHNldAojIENPTkZJR19TT0NfQlJDTVNUQiBpcyBub3Qgc2V0CiMgQ09ORklH
X0JDTV9QTUIgaXMgbm90IHNldAojIGVuZCBvZiBCcm9hZGNvbSBTb0MgZHJpdmVycwoKIwojIE5Y
UC9GcmVlc2NhbGUgUW9ySVEgU29DIGRyaXZlcnMKIwojIENPTkZJR19RVUlDQ19FTkdJTkUgaXMg
bm90IHNldApDT05GSUdfRFBBQTJfQ09OU09MRT15CiMgZW5kIG9mIE5YUC9GcmVlc2NhbGUgUW9y
SVEgU29DIGRyaXZlcnMKCiMKIyBpLk1YIFNvQyBkcml2ZXJzCiMKIyBDT05GSUdfU09DX0lNWDhN
IGlzIG5vdCBzZXQKIyBlbmQgb2YgaS5NWCBTb0MgZHJpdmVycwoKIwojIElYUDR4eCBTb0MgZHJp
dmVycwojCiMgQ09ORklHX0lYUDRYWF9RTUdSIGlzIG5vdCBzZXQKIyBDT05GSUdfSVhQNFhYX05Q
RSBpcyBub3Qgc2V0CiMgZW5kIG9mIElYUDR4eCBTb0MgZHJpdmVycwoKIwojIEVuYWJsZSBMaXRl
WCBTb0MgQnVpbGRlciBzcGVjaWZpYyBkcml2ZXJzCiMKQ09ORklHX0xJVEVYPXkKQ09ORklHX0xJ
VEVYX1NPQ19DT05UUk9MTEVSPXkKIyBlbmQgb2YgRW5hYmxlIExpdGVYIFNvQyBCdWlsZGVyIHNw
ZWNpZmljIGRyaXZlcnMKCiMKIyBNZWRpYVRlayBTb0MgZHJpdmVycwojCiMgQ09ORklHX01US19D
TURRIGlzIG5vdCBzZXQKIyBDT05GSUdfTVRLX0RFVkFQQyBpcyBub3Qgc2V0CiMgQ09ORklHX01U
S19JTkZSQUNGRyBpcyBub3Qgc2V0CiMgQ09ORklHX01US19TQ1BTWVMgaXMgbm90IHNldAojIENP
TkZJR19NVEtfTU1TWVMgaXMgbm90IHNldAojIGVuZCBvZiBNZWRpYVRlayBTb0MgZHJpdmVycwoK
IwojIFF1YWxjb21tIFNvQyBkcml2ZXJzCiMKIyBDT05GSUdfUUNPTV9DT01NQU5EX0RCIGlzIG5v
dCBzZXQKIyBDT05GSUdfUUNPTV9HRU5JX1NFIGlzIG5vdCBzZXQKIyBDT05GSUdfUUNPTV9HU0JJ
IGlzIG5vdCBzZXQKIyBDT05GSUdfUUNPTV9MTENDIGlzIG5vdCBzZXQKIyBDT05GSUdfUUNPTV9S
UE1IIGlzIG5vdCBzZXQKIyBDT05GSUdfUUNPTV9TTURfUlBNIGlzIG5vdCBzZXQKIyBDT05GSUdf
UUNPTV9TUE0gaXMgbm90IHNldAojIENPTkZJR19RQ09NX1dDTlNTX0NUUkwgaXMgbm90IHNldAoj
IENPTkZJR19RQ09NX0FQUiBpcyBub3Qgc2V0CiMgZW5kIG9mIFF1YWxjb21tIFNvQyBkcml2ZXJz
CgojIENPTkZJR19TT0NfUkVORVNBUyBpcyBub3Qgc2V0CiMgQ09ORklHX1JPQ0tDSElQX0dSRiBp
cyBub3Qgc2V0CiMgQ09ORklHX1JPQ0tDSElQX0lPRE9NQUlOIGlzIG5vdCBzZXQKIyBDT05GSUdf
U09DX1NBTVNVTkcgaXMgbm90IHNldAojIENPTkZJR19TT0NfVEVHUkEyMF9WT0xUQUdFX0NPVVBM
RVIgaXMgbm90IHNldAojIENPTkZJR19TT0NfVEVHUkEzMF9WT0xUQUdFX0NPVVBMRVIgaXMgbm90
IHNldAojIENPTkZJR19TT0NfVEkgaXMgbm90IHNldAojIENPTkZJR19VWDUwMF9TT0NfSUQgaXMg
bm90IHNldAoKIwojIFhpbGlueCBTb0MgZHJpdmVycwojCiMgZW5kIG9mIFhpbGlueCBTb0MgZHJp
dmVycwojIGVuZCBvZiBTT0MgKFN5c3RlbSBPbiBDaGlwKSBzcGVjaWZpYyBEcml2ZXJzCgpDT05G
SUdfUE1fREVWRlJFUT15CgojCiMgREVWRlJFUSBHb3Zlcm5vcnMKIwojIENPTkZJR19ERVZGUkVR
X0dPVl9TSU1QTEVfT05ERU1BTkQgaXMgbm90IHNldApDT05GSUdfREVWRlJFUV9HT1ZfUEVSRk9S
TUFOQ0U9eQpDT05GSUdfREVWRlJFUV9HT1ZfUE9XRVJTQVZFPXkKIyBDT05GSUdfREVWRlJFUV9H
T1ZfVVNFUlNQQUNFIGlzIG5vdCBzZXQKQ09ORklHX0RFVkZSRVFfR09WX1BBU1NJVkU9eQoKIwoj
IERFVkZSRVEgRHJpdmVycwojCiMgQ09ORklHX0FSTV9FWFlOT1NfQlVTX0RFVkZSRVEgaXMgbm90
IHNldAojIENPTkZJR19BUk1fSU1YX0JVU19ERVZGUkVRIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJN
X1RFR1JBX0RFVkZSRVEgaXMgbm90IHNldAojIENPTkZJR19BUk1fU1VOOElfQTMzX01CVVNfREVW
RlJFUSBpcyBub3Qgc2V0CkNPTkZJR19QTV9ERVZGUkVRX0VWRU5UPXkKIyBDT05GSUdfREVWRlJF
UV9FVkVOVF9FWFlOT1NfTk9DUCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFVkZSRVFfRVZFTlRfRVhZ
Tk9TX1BQTVUgaXMgbm90IHNldAojIENPTkZJR19ERVZGUkVRX0VWRU5UX1JPQ0tDSElQX0RGSSBp
cyBub3Qgc2V0CkNPTkZJR19FWFRDT049eQoKIwojIEV4dGNvbiBEZXZpY2UgRHJpdmVycwojCkNP
TkZJR19FWFRDT05fQURDX0pBQ0s9eQpDT05GSUdfRVhUQ09OX0ZTQTk0ODA9eQojIENPTkZJR19F
WFRDT05fR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0VYVENPTl9NQVgxNDU3NyBpcyBub3Qgc2V0
CiMgQ09ORklHX0VYVENPTl9NQVgzMzU1IGlzIG5vdCBzZXQKQ09ORklHX0VYVENPTl9NQVg3NzY5
Mz15CkNPTkZJR19FWFRDT05fUEFMTUFTPXkKQ09ORklHX0VYVENPTl9QVE41MTUwPXkKIyBDT05G
SUdfRVhUQ09OX1FDT01fU1BNSV9NSVNDIGlzIG5vdCBzZXQKQ09ORklHX0VYVENPTl9SVDg5NzNB
PXkKQ09ORklHX0VYVENPTl9TTTU1MDI9eQpDT05GSUdfRVhUQ09OX1VTQl9HUElPPXkKQ09ORklH
X0VYVENPTl9VU0JDX1RVU0IzMjA9eQojIENPTkZJR19NRU1PUlkgaXMgbm90IHNldApDT05GSUdf
SUlPPXkKQ09ORklHX0lJT19CVUZGRVI9eQpDT05GSUdfSUlPX0JVRkZFUl9DQj15CkNPTkZJR19J
SU9fQlVGRkVSX0RNQT15CkNPTkZJR19JSU9fQlVGRkVSX0RNQUVOR0lORT15CkNPTkZJR19JSU9f
QlVGRkVSX0hXX0NPTlNVTUVSPXkKQ09ORklHX0lJT19LRklGT19CVUY9eQpDT05GSUdfSUlPX1RS
SUdHRVJFRF9CVUZGRVI9eQpDT05GSUdfSUlPX0NPTkZJR0ZTPXkKQ09ORklHX0lJT19UUklHR0VS
PXkKQ09ORklHX0lJT19DT05TVU1FUlNfUEVSX1RSSUdHRVI9MgpDT05GSUdfSUlPX1NXX0RFVklD
RT15CiMgQ09ORklHX0lJT19TV19UUklHR0VSIGlzIG5vdCBzZXQKQ09ORklHX0lJT19UUklHR0VS
RURfRVZFTlQ9eQoKIwojIEFjY2VsZXJvbWV0ZXJzCiMKQ09ORklHX0FESVMxNjIwMT15CiMgQ09O
RklHX0FESVMxNjIwOSBpcyBub3Qgc2V0CkNPTkZJR19BRFhMMzEzPXkKQ09ORklHX0FEWEwzMTNf
STJDPXkKQ09ORklHX0FEWEwzMTNfU1BJPXkKQ09ORklHX0FEWEwzNDU9eQojIENPTkZJR19BRFhM
MzQ1X0kyQyBpcyBub3Qgc2V0CkNPTkZJR19BRFhMMzQ1X1NQST15CkNPTkZJR19BRFhMMzU1PXkK
Q09ORklHX0FEWEwzNTVfSTJDPXkKQ09ORklHX0FEWEwzNTVfU1BJPXkKQ09ORklHX0FEWEwzNjc9
eQpDT05GSUdfQURYTDM2N19TUEk9eQpDT05GSUdfQURYTDM2N19JMkM9eQojIENPTkZJR19BRFhM
MzcyX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX0FEWEwzNzJfSTJDIGlzIG5vdCBzZXQKQ09ORklH
X0JNQTE4MD15CkNPTkZJR19CTUEyMjA9eQojIENPTkZJR19CTUE0MDAgaXMgbm90IHNldAojIENP
TkZJR19CTUMxNTBfQUNDRUwgaXMgbm90IHNldApDT05GSUdfQk1JMDg4X0FDQ0VMPXkKQ09ORklH
X0JNSTA4OF9BQ0NFTF9TUEk9eQojIENPTkZJR19EQTI4MCBpcyBub3Qgc2V0CkNPTkZJR19EQTMx
MT15CiMgQ09ORklHX0RNQVJEMDYgaXMgbm90IHNldApDT05GSUdfRE1BUkQwOT15CiMgQ09ORklH
X0RNQVJEMTAgaXMgbm90IHNldApDT05GSUdfRlhMUzg5NjJBRj15CkNPTkZJR19GWExTODk2MkFG
X0kyQz15CiMgQ09ORklHX0ZYTFM4OTYyQUZfU1BJIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9TRU5T
T1JfQUNDRUxfM0Q9eQojIENPTkZJR19LWFNEOSBpcyBub3Qgc2V0CiMgQ09ORklHX0tYQ0pLMTAx
MyBpcyBub3Qgc2V0CkNPTkZJR19NQzMyMzA9eQpDT05GSUdfTU1BNzQ1NT15CkNPTkZJR19NTUE3
NDU1X0kyQz15CiMgQ09ORklHX01NQTc0NTVfU1BJIGlzIG5vdCBzZXQKQ09ORklHX01NQTc2NjA9
eQpDT05GSUdfTU1BODQ1Mj15CkNPTkZJR19NTUE5NTUxX0NPUkU9eQpDT05GSUdfTU1BOTU1MT15
CiMgQ09ORklHX01NQTk1NTMgaXMgbm90IHNldAojIENPTkZJR19NWEM0MDA1IGlzIG5vdCBzZXQK
Q09ORklHX01YQzYyNTU9eQpDT05GSUdfU0NBMzAwMD15CkNPTkZJR19TQ0EzMzAwPXkKIyBDT05G
SUdfU1RLODMxMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NUSzhCQTUwIGlzIG5vdCBzZXQKIyBlbmQg
b2YgQWNjZWxlcm9tZXRlcnMKCiMKIyBBbmFsb2cgdG8gZGlnaXRhbCBjb252ZXJ0ZXJzCiMKQ09O
RklHX0FEX1NJR01BX0RFTFRBPXkKQ09ORklHX0FENzA5MVI1PXkKQ09ORklHX0FENzEyND15CkNP
TkZJR19BRDcxOTI9eQpDT05GSUdfQUQ3MjY2PXkKQ09ORklHX0FENzI4MD15CkNPTkZJR19BRDcy
OTE9eQpDT05GSUdfQUQ3MjkyPXkKIyBDT05GSUdfQUQ3Mjk4IGlzIG5vdCBzZXQKQ09ORklHX0FE
NzQ3Nj15CkNPTkZJR19BRDc2MDY9eQpDT05GSUdfQUQ3NjA2X0lGQUNFX1BBUkFMTEVMPXkKIyBD
T05GSUdfQUQ3NjA2X0lGQUNFX1NQSSBpcyBub3Qgc2V0CkNPTkZJR19BRDc3NjY9eQpDT05GSUdf
QUQ3NzY4XzE9eQojIENPTkZJR19BRDc3ODAgaXMgbm90IHNldApDT05GSUdfQUQ3NzkxPXkKIyBD
T05GSUdfQUQ3NzkzIGlzIG5vdCBzZXQKQ09ORklHX0FENzg4Nz15CkNPTkZJR19BRDc5MjM9eQpD
T05GSUdfQUQ3OTQ5PXkKQ09ORklHX0FENzk5WD15CiMgQ09ORklHX0FEOTQ2NyBpcyBub3Qgc2V0
CkNPTkZJR19BRElfQVhJX0FEQz15CiMgQ09ORklHX0FTUEVFRF9BREMgaXMgbm90IHNldAojIENP
TkZJR19BVDkxX0FEQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FUOTFfU0FNQTVEMl9BREMgaXMgbm90
IHNldApDT05GSUdfQVhQMjBYX0FEQz15CiMgQ09ORklHX0FYUDI4OF9BREMgaXMgbm90IHNldAoj
IENPTkZJR19CQ01fSVBST0NfQURDIGlzIG5vdCBzZXQKIyBDT05GSUdfQkVSTElOMl9BREMgaXMg
bm90IHNldApDT05GSUdfQ0MxMDAwMV9BREM9eQojIENPTkZJR19FTlZFTE9QRV9ERVRFQ1RPUiBp
cyBub3Qgc2V0CiMgQ09ORklHX0VYWU5PU19BREMgaXMgbm90IHNldApDT05GSUdfSEk4NDM1PXkK
Q09ORklHX0hYNzExPXkKQ09ORklHX0lOQTJYWF9BREM9eQojIENPTkZJR19JTkdFTklDX0FEQyBp
cyBub3Qgc2V0CiMgQ09ORklHX0lNWDdEX0FEQyBpcyBub3Qgc2V0CiMgQ09ORklHX0lNWDhRWFBf
QURDIGlzIG5vdCBzZXQKQ09ORklHX0xQODc4OF9BREM9eQojIENPTkZJR19MUEMxOFhYX0FEQyBp
cyBub3Qgc2V0CiMgQ09ORklHX0xQQzMyWFhfQURDIGlzIG5vdCBzZXQKIyBDT05GSUdfTFRDMjQ3
MSBpcyBub3Qgc2V0CkNPTkZJR19MVEMyNDg1PXkKQ09ORklHX0xUQzI0OTY9eQpDT05GSUdfTFRD
MjQ5Nz15CkNPTkZJR19NQVgxMDI3PXkKQ09ORklHX01BWDExMTAwPXkKIyBDT05GSUdfTUFYMTEx
OCBpcyBub3Qgc2V0CkNPTkZJR19NQVgxMjQxPXkKQ09ORklHX01BWDEzNjM9eQpDT05GSUdfTUFY
OTYxMT15CkNPTkZJR19NQ1AzMjBYPXkKIyBDT05GSUdfTUNQMzQyMiBpcyBub3Qgc2V0CkNPTkZJ
R19NQ1AzOTExPXkKQ09ORklHX01FRElBVEVLX01UNjM2MF9BREM9eQojIENPTkZJR19NRURJQVRF
S19NVDY1NzdfQVVYQURDIGlzIG5vdCBzZXQKQ09ORklHX01FTl9aMTg4X0FEQz15CiMgQ09ORklH
X01FU09OX1NBUkFEQyBpcyBub3Qgc2V0CkNPTkZJR19NUDI2MjlfQURDPXkKIyBDT05GSUdfTkFV
NzgwMiBpcyBub3Qgc2V0CiMgQ09ORklHX05QQ01fQURDIGlzIG5vdCBzZXQKQ09ORklHX1BBTE1B
U19HUEFEQz15CkNPTkZJR19RQ09NX1ZBRENfQ09NTU9OPXkKQ09ORklHX1FDT01fU1BNSV9JQURD
PXkKIyBDT05GSUdfUUNPTV9TUE1JX1ZBREMgaXMgbm90IHNldApDT05GSUdfUUNPTV9TUE1JX0FE
QzU9eQojIENPTkZJR19SQ0FSX0dZUk9fQURDIGlzIG5vdCBzZXQKQ09ORklHX1JONVQ2MThfQURD
PXkKIyBDT05GSUdfUlpHMkxfQURDIGlzIG5vdCBzZXQKIyBDT05GSUdfU0MyN1hYX0FEQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NQRUFSX0FEQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NEX0FEQ19NT0RV
TEFUT1IgaXMgbm90IHNldAojIENPTkZJR19TVE0zMl9BRENfQ09SRSBpcyBub3Qgc2V0CiMgQ09O
RklHX1NUTTMyX0RGU0RNX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19TVE0zMl9ERlNETV9BREMg
aXMgbm90IHNldApDT05GSUdfU1RNUEVfQURDPXkKQ09ORklHX1RJX0FEQzA4MUM9eQpDT05GSUdf
VElfQURDMDgzMj15CiMgQ09ORklHX1RJX0FEQzA4NFMwMjEgaXMgbm90IHNldAojIENPTkZJR19U
SV9BREMxMjEzOCBpcyBub3Qgc2V0CkNPTkZJR19USV9BREMxMDhTMTAyPXkKIyBDT05GSUdfVElf
QURDMTI4UzA1MiBpcyBub3Qgc2V0CiMgQ09ORklHX1RJX0FEQzE2MVM2MjYgaXMgbm90IHNldApD
T05GSUdfVElfQURTMTAxNT15CkNPTkZJR19USV9BRFM3OTUwPXkKQ09ORklHX1RJX0FEUzgzNDQ9
eQpDT05GSUdfVElfQURTODY4OD15CiMgQ09ORklHX1RJX0FEUzEyNFMwOCBpcyBub3Qgc2V0CkNP
TkZJR19USV9BRFMxMzFFMDg9eQojIENPTkZJR19USV9UTEM0NTQxIGlzIG5vdCBzZXQKQ09ORklH
X1RJX1RTQzIwNDY9eQpDT05GSUdfVFdMNDAzMF9NQURDPXkKQ09ORklHX1RXTDYwMzBfR1BBREM9
eQpDT05GSUdfVkY2MTBfQURDPXkKQ09ORklHX1hJTElOWF9YQURDPXkKIyBDT05GSUdfWElMSU5Y
X0FNUyBpcyBub3Qgc2V0CiMgZW5kIG9mIEFuYWxvZyB0byBkaWdpdGFsIGNvbnZlcnRlcnMKCiMK
IyBBbmFsb2cgdG8gZGlnaXRhbCBhbmQgZGlnaXRhbCB0byBhbmFsb2cgY29udmVydGVycwojCiMg
Q09ORklHX0FENzQ0MTNSIGlzIG5vdCBzZXQKIyBlbmQgb2YgQW5hbG9nIHRvIGRpZ2l0YWwgYW5k
IGRpZ2l0YWwgdG8gYW5hbG9nIGNvbnZlcnRlcnMKCiMKIyBBbmFsb2cgRnJvbnQgRW5kcwojCkNP
TkZJR19JSU9fUkVTQ0FMRT15CiMgZW5kIG9mIEFuYWxvZyBGcm9udCBFbmRzCgojCiMgQW1wbGlm
aWVycwojCkNPTkZJR19BRDgzNjY9eQpDT05GSUdfQURBNDI1MD15CkNPTkZJR19ITUM0MjU9eQoj
IGVuZCBvZiBBbXBsaWZpZXJzCgojCiMgQ2FwYWNpdGFuY2UgdG8gZGlnaXRhbCBjb252ZXJ0ZXJz
CiMKQ09ORklHX0FENzE1MD15CiMgZW5kIG9mIENhcGFjaXRhbmNlIHRvIGRpZ2l0YWwgY29udmVy
dGVycwoKIwojIENoZW1pY2FsIFNlbnNvcnMKIwojIENPTkZJR19BVExBU19QSF9TRU5TT1IgaXMg
bm90IHNldAojIENPTkZJR19BVExBU19FWk9fU0VOU09SIGlzIG5vdCBzZXQKIyBDT05GSUdfQk1F
NjgwIGlzIG5vdCBzZXQKQ09ORklHX0NDUzgxMT15CkNPTkZJR19JQVFDT1JFPXkKQ09ORklHX1BN
UzcwMDM9eQpDT05GSUdfU0NEMzBfQ09SRT15CiMgQ09ORklHX1NDRDMwX0kyQyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NDRDMwX1NFUklBTCBpcyBub3Qgc2V0CkNPTkZJR19TQ0Q0WD15CiMgQ09ORklH
X1NFTlNJUklPTl9TR1AzMCBpcyBub3Qgc2V0CkNPTkZJR19TRU5TSVJJT05fU0dQNDA9eQojIENP
TkZJR19TUFMzMF9JMkMgaXMgbm90IHNldAojIENPTkZJR19TUFMzMF9TRVJJQUwgaXMgbm90IHNl
dApDT05GSUdfU0VOU0VBSVJfU1VOUklTRV9DTzI9eQpDT05GSUdfVlo4OVg9eQojIGVuZCBvZiBD
aGVtaWNhbCBTZW5zb3JzCgojCiMgSGlkIFNlbnNvciBJSU8gQ29tbW9uCiMKQ09ORklHX0hJRF9T
RU5TT1JfSUlPX0NPTU1PTj15CkNPTkZJR19ISURfU0VOU09SX0lJT19UUklHR0VSPXkKIyBlbmQg
b2YgSGlkIFNlbnNvciBJSU8gQ29tbW9uCgpDT05GSUdfSUlPX01TX1NFTlNPUlNfSTJDPXkKCiMK
IyBJSU8gU0NNSSBTZW5zb3JzCiMKIyBlbmQgb2YgSUlPIFNDTUkgU2Vuc29ycwoKIwojIFNTUCBT
ZW5zb3IgQ29tbW9uCiMKQ09ORklHX0lJT19TU1BfU0VOU09SU19DT01NT05TPXkKQ09ORklHX0lJ
T19TU1BfU0VOU09SSFVCPXkKIyBlbmQgb2YgU1NQIFNlbnNvciBDb21tb24KCkNPTkZJR19JSU9f
U1RfU0VOU09SU19JMkM9eQpDT05GSUdfSUlPX1NUX1NFTlNPUlNfU1BJPXkKQ09ORklHX0lJT19T
VF9TRU5TT1JTX0NPUkU9eQoKIwojIERpZ2l0YWwgdG8gYW5hbG9nIGNvbnZlcnRlcnMKIwpDT05G
SUdfQUQzNTUyUj15CiMgQ09ORklHX0FENTA2NCBpcyBub3Qgc2V0CkNPTkZJR19BRDUzNjA9eQoj
IENPTkZJR19BRDUzODAgaXMgbm90IHNldAojIENPTkZJR19BRDU0MjEgaXMgbm90IHNldApDT05G
SUdfQUQ1NDQ2PXkKQ09ORklHX0FENTQ0OT15CkNPTkZJR19BRDU1OTJSX0JBU0U9eQpDT05GSUdf
QUQ1NTkyUj15CkNPTkZJR19BRDU1OTNSPXkKIyBDT05GSUdfQUQ1NTA0IGlzIG5vdCBzZXQKQ09O
RklHX0FENTYyNFJfU1BJPXkKQ09ORklHX0xUQzI2ODg9eQpDT05GSUdfQUQ1Njg2PXkKIyBDT05G
SUdfQUQ1Njg2X1NQSSBpcyBub3Qgc2V0CkNPTkZJR19BRDU2OTZfSTJDPXkKQ09ORklHX0FENTc1
NT15CkNPTkZJR19BRDU3NTg9eQojIENPTkZJR19BRDU3NjEgaXMgbm90IHNldApDT05GSUdfQUQ1
NzY0PXkKIyBDT05GSUdfQUQ1NzY2IGlzIG5vdCBzZXQKQ09ORklHX0FENTc3MFI9eQojIENPTkZJ
R19BRDU3OTEgaXMgbm90IHNldAojIENPTkZJR19BRDcyOTMgaXMgbm90IHNldApDT05GSUdfQUQ3
MzAzPXkKIyBDT05GSUdfQUQ4ODAxIGlzIG5vdCBzZXQKIyBDT05GSUdfRFBPVF9EQUMgaXMgbm90
IHNldApDT05GSUdfRFM0NDI0PXkKIyBDT05GSUdfTFBDMThYWF9EQUMgaXMgbm90IHNldAojIENP
TkZJR19MVEMxNjYwIGlzIG5vdCBzZXQKQ09ORklHX0xUQzI2MzI9eQpDT05GSUdfTTYyMzMyPXkK
Q09ORklHX01BWDUxNz15CiMgQ09ORklHX01BWDU4MjEgaXMgbm90IHNldAojIENPTkZJR19NQ1A0
NzI1IGlzIG5vdCBzZXQKQ09ORklHX01DUDQ5MjI9eQojIENPTkZJR19TVE0zMl9EQUMgaXMgbm90
IHNldApDT05GSUdfVElfREFDMDgyUzA4NT15CiMgQ09ORklHX1RJX0RBQzU1NzEgaXMgbm90IHNl
dApDT05GSUdfVElfREFDNzMxMT15CkNPTkZJR19USV9EQUM3NjEyPXkKQ09ORklHX1ZGNjEwX0RB
Qz15CiMgZW5kIG9mIERpZ2l0YWwgdG8gYW5hbG9nIGNvbnZlcnRlcnMKCiMKIyBJSU8gZHVtbXkg
ZHJpdmVyCiMKQ09ORklHX0lJT19EVU1NWV9FVkdFTj15CkNPTkZJR19JSU9fU0lNUExFX0RVTU1Z
PXkKQ09ORklHX0lJT19TSU1QTEVfRFVNTVlfRVZFTlRTPXkKQ09ORklHX0lJT19TSU1QTEVfRFVN
TVlfQlVGRkVSPXkKIyBlbmQgb2YgSUlPIGR1bW15IGRyaXZlcgoKIwojIEZpbHRlcnMKIwojIGVu
ZCBvZiBGaWx0ZXJzCgojCiMgRnJlcXVlbmN5IFN5bnRoZXNpemVycyBERFMvUExMCiMKCiMKIyBD
bG9jayBHZW5lcmF0b3IvRGlzdHJpYnV0aW9uCiMKQ09ORklHX0FEOTUyMz15CiMgZW5kIG9mIENs
b2NrIEdlbmVyYXRvci9EaXN0cmlidXRpb24KCiMKIyBQaGFzZS1Mb2NrZWQgTG9vcCAoUExMKSBm
cmVxdWVuY3kgc3ludGhlc2l6ZXJzCiMKQ09ORklHX0FERjQzNTA9eQpDT05GSUdfQURGNDM3MT15
CiMgQ09ORklHX0FETVYxMDEzIGlzIG5vdCBzZXQKQ09ORklHX0FETVY0NDIwPXkKIyBDT05GSUdf
QURSRjY3ODAgaXMgbm90IHNldAojIGVuZCBvZiBQaGFzZS1Mb2NrZWQgTG9vcCAoUExMKSBmcmVx
dWVuY3kgc3ludGhlc2l6ZXJzCiMgZW5kIG9mIEZyZXF1ZW5jeSBTeW50aGVzaXplcnMgRERTL1BM
TAoKIwojIERpZ2l0YWwgZ3lyb3Njb3BlIHNlbnNvcnMKIwpDT05GSUdfQURJUzE2MDgwPXkKQ09O
RklHX0FESVMxNjEzMD15CkNPTkZJR19BRElTMTYxMzY9eQpDT05GSUdfQURJUzE2MjYwPXkKIyBD
T05GSUdfQURYUlMyOTAgaXMgbm90IHNldApDT05GSUdfQURYUlM0NTA9eQpDT05GSUdfQk1HMTYw
PXkKQ09ORklHX0JNRzE2MF9JMkM9eQpDT05GSUdfQk1HMTYwX1NQST15CkNPTkZJR19GWEFTMjEw
MDJDPXkKQ09ORklHX0ZYQVMyMTAwMkNfSTJDPXkKQ09ORklHX0ZYQVMyMTAwMkNfU1BJPXkKQ09O
RklHX0hJRF9TRU5TT1JfR1lST18zRD15CkNPTkZJR19NUFUzMDUwPXkKQ09ORklHX01QVTMwNTBf
STJDPXkKQ09ORklHX0lJT19TVF9HWVJPXzNBWElTPXkKQ09ORklHX0lJT19TVF9HWVJPX0kyQ18z
QVhJUz15CkNPTkZJR19JSU9fU1RfR1lST19TUElfM0FYSVM9eQpDT05GSUdfSVRHMzIwMD15CiMg
ZW5kIG9mIERpZ2l0YWwgZ3lyb3Njb3BlIHNlbnNvcnMKCiMKIyBIZWFsdGggU2Vuc29ycwojCgoj
CiMgSGVhcnQgUmF0ZSBNb25pdG9ycwojCkNPTkZJR19BRkU0NDAzPXkKQ09ORklHX0FGRTQ0MDQ9
eQpDT05GSUdfTUFYMzAxMDA9eQojIENPTkZJR19NQVgzMDEwMiBpcyBub3Qgc2V0CiMgZW5kIG9m
IEhlYXJ0IFJhdGUgTW9uaXRvcnMKIyBlbmQgb2YgSGVhbHRoIFNlbnNvcnMKCiMKIyBIdW1pZGl0
eSBzZW5zb3JzCiMKQ09ORklHX0FNMjMxNT15CiMgQ09ORklHX0RIVDExIGlzIG5vdCBzZXQKIyBD
T05GSUdfSERDMTAwWCBpcyBub3Qgc2V0CkNPTkZJR19IREMyMDEwPXkKQ09ORklHX0hJRF9TRU5T
T1JfSFVNSURJVFk9eQpDT05GSUdfSFRTMjIxPXkKQ09ORklHX0hUUzIyMV9JMkM9eQpDT05GSUdf
SFRTMjIxX1NQST15CiMgQ09ORklHX0hUVTIxIGlzIG5vdCBzZXQKQ09ORklHX1NJNzAwNT15CkNP
TkZJR19TSTcwMjA9eQojIGVuZCBvZiBIdW1pZGl0eSBzZW5zb3JzCgojCiMgSW5lcnRpYWwgbWVh
c3VyZW1lbnQgdW5pdHMKIwpDT05GSUdfQURJUzE2NDAwPXkKQ09ORklHX0FESVMxNjQ2MD15CkNP
TkZJR19BRElTMTY0NzU9eQojIENPTkZJR19BRElTMTY0ODAgaXMgbm90IHNldApDT05GSUdfQk1J
MTYwPXkKQ09ORklHX0JNSTE2MF9JMkM9eQojIENPTkZJR19CTUkxNjBfU1BJIGlzIG5vdCBzZXQK
Q09ORklHX0ZYT1M4NzAwPXkKQ09ORklHX0ZYT1M4NzAwX0kyQz15CkNPTkZJR19GWE9TODcwMF9T
UEk9eQojIENPTkZJR19LTVg2MSBpcyBub3Qgc2V0CkNPTkZJR19JTlZfSUNNNDI2MDA9eQpDT05G
SUdfSU5WX0lDTTQyNjAwX0kyQz15CkNPTkZJR19JTlZfSUNNNDI2MDBfU1BJPXkKQ09ORklHX0lO
Vl9NUFU2MDUwX0lJTz15CkNPTkZJR19JTlZfTVBVNjA1MF9JMkM9eQojIENPTkZJR19JTlZfTVBV
NjA1MF9TUEkgaXMgbm90IHNldApDT05GSUdfSUlPX1NUX0xTTTZEU1g9eQpDT05GSUdfSUlPX1NU
X0xTTTZEU1hfSTJDPXkKQ09ORklHX0lJT19TVF9MU002RFNYX1NQST15CiMgZW5kIG9mIEluZXJ0
aWFsIG1lYXN1cmVtZW50IHVuaXRzCgpDT05GSUdfSUlPX0FESVNfTElCPXkKQ09ORklHX0lJT19B
RElTX0xJQl9CVUZGRVI9eQoKIwojIExpZ2h0IHNlbnNvcnMKIwojIENPTkZJR19BREpEX1MzMTEg
aXMgbm90IHNldApDT05GSUdfQURVWDEwMjA9eQpDT05GSUdfQUwzMDEwPXkKQ09ORklHX0FMMzMy
MEE9eQojIENPTkZJR19BUERTOTMwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0FQRFM5OTYwIGlzIG5v
dCBzZXQKQ09ORklHX0FTNzMyMTE9eQojIENPTkZJR19CSDE3NTAgaXMgbm90IHNldAojIENPTkZJ
R19CSDE3ODAgaXMgbm90IHNldApDT05GSUdfQ00zMjE4MT15CkNPTkZJR19DTTMyMzI9eQpDT05G
SUdfQ00zMzIzPXkKQ09ORklHX0NNMzYwNT15CkNPTkZJR19DTTM2NjUxPXkKQ09ORklHX0dQMkFQ
MDAyPXkKQ09ORklHX0dQMkFQMDIwQTAwRj15CkNPTkZJR19JUVM2MjFfQUxTPXkKQ09ORklHX1NF
TlNPUlNfSVNMMjkwMTg9eQojIENPTkZJR19TRU5TT1JTX0lTTDI5MDI4IGlzIG5vdCBzZXQKQ09O
RklHX0lTTDI5MTI1PXkKQ09ORklHX0hJRF9TRU5TT1JfQUxTPXkKIyBDT05GSUdfSElEX1NFTlNP
Ul9QUk9YIGlzIG5vdCBzZXQKIyBDT05GSUdfSlNBMTIxMiBpcyBub3Qgc2V0CiMgQ09ORklHX1JQ
UjA1MjEgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19MTTM1MzM9eQpDT05GSUdfTFRSNTAxPXkK
IyBDT05GSUdfTFYwMTA0Q1MgaXMgbm90IHNldAojIENPTkZJR19NQVg0NDAwMCBpcyBub3Qgc2V0
CkNPTkZJR19NQVg0NDAwOT15CkNPTkZJR19OT0ExMzA1PXkKQ09ORklHX09QVDMwMDE9eQojIENP
TkZJR19QQTEyMjAzMDAxIGlzIG5vdCBzZXQKQ09ORklHX1NJMTEzMz15CkNPTkZJR19TSTExNDU9
eQojIENPTkZJR19TVEszMzEwIGlzIG5vdCBzZXQKIyBDT05GSUdfU1RfVVZJUzI1IGlzIG5vdCBz
ZXQKQ09ORklHX1RDUzM0MTQ9eQojIENPTkZJR19UQ1MzNDcyIGlzIG5vdCBzZXQKQ09ORklHX1NF
TlNPUlNfVFNMMjU2Mz15CkNPTkZJR19UU0wyNTgzPXkKIyBDT05GSUdfVFNMMjU5MSBpcyBub3Qg
c2V0CiMgQ09ORklHX1RTTDI3NzIgaXMgbm90IHNldApDT05GSUdfVFNMNDUzMT15CkNPTkZJR19V
UzUxODJEPXkKQ09ORklHX1ZDTkw0MDAwPXkKIyBDT05GSUdfVkNOTDQwMzUgaXMgbm90IHNldApD
T05GSUdfVkVNTDYwMzA9eQojIENPTkZJR19WRU1MNjA3MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZM
NjE4MCBpcyBub3Qgc2V0CkNPTkZJR19aT1BUMjIwMT15CiMgZW5kIG9mIExpZ2h0IHNlbnNvcnMK
CiMKIyBNYWduZXRvbWV0ZXIgc2Vuc29ycwojCkNPTkZJR19BSzg5NzQ9eQpDT05GSUdfQUs4OTc1
PXkKQ09ORklHX0FLMDk5MTE9eQpDT05GSUdfQk1DMTUwX01BR049eQpDT05GSUdfQk1DMTUwX01B
R05fSTJDPXkKQ09ORklHX0JNQzE1MF9NQUdOX1NQST15CkNPTkZJR19NQUczMTEwPXkKQ09ORklH
X0hJRF9TRU5TT1JfTUFHTkVUT01FVEVSXzNEPXkKQ09ORklHX01NQzM1MjQwPXkKIyBDT05GSUdf
SUlPX1NUX01BR05fM0FYSVMgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19ITUM1ODQzPXkKQ09O
RklHX1NFTlNPUlNfSE1DNTg0M19JMkM9eQpDT05GSUdfU0VOU09SU19ITUM1ODQzX1NQST15CkNP
TkZJR19TRU5TT1JTX1JNMzEwMD15CkNPTkZJR19TRU5TT1JTX1JNMzEwMF9JMkM9eQpDT05GSUdf
U0VOU09SU19STTMxMDBfU1BJPXkKIyBDT05GSUdfWUFNQUhBX1lBUzUzMCBpcyBub3Qgc2V0CiMg
ZW5kIG9mIE1hZ25ldG9tZXRlciBzZW5zb3JzCgojCiMgTXVsdGlwbGV4ZXJzCiMKQ09ORklHX0lJ
T19NVVg9eQojIGVuZCBvZiBNdWx0aXBsZXhlcnMKCiMKIyBJbmNsaW5vbWV0ZXIgc2Vuc29ycwoj
CkNPTkZJR19ISURfU0VOU09SX0lOQ0xJTk9NRVRFUl8zRD15CiMgQ09ORklHX0hJRF9TRU5TT1Jf
REVWSUNFX1JPVEFUSU9OIGlzIG5vdCBzZXQKIyBlbmQgb2YgSW5jbGlub21ldGVyIHNlbnNvcnMK
CiMKIyBUcmlnZ2VycyAtIHN0YW5kYWxvbmUKIwpDT05GSUdfSUlPX0lOVEVSUlVQVF9UUklHR0VS
PXkKIyBDT05GSUdfSUlPX1NUTTMyX0xQVElNRVJfVFJJR0dFUiBpcyBub3Qgc2V0CiMgQ09ORklH
X0lJT19TVE0zMl9USU1FUl9UUklHR0VSIGlzIG5vdCBzZXQKQ09ORklHX0lJT19TWVNGU19UUklH
R0VSPXkKIyBlbmQgb2YgVHJpZ2dlcnMgLSBzdGFuZGFsb25lCgojCiMgTGluZWFyIGFuZCBhbmd1
bGFyIHBvc2l0aW9uIHNlbnNvcnMKIwojIENPTkZJR19JUVM2MjRfUE9TIGlzIG5vdCBzZXQKQ09O
RklHX0hJRF9TRU5TT1JfQ1VTVE9NX0lOVEVMX0hJTkdFPXkKIyBlbmQgb2YgTGluZWFyIGFuZCBh
bmd1bGFyIHBvc2l0aW9uIHNlbnNvcnMKCiMKIyBEaWdpdGFsIHBvdGVudGlvbWV0ZXJzCiMKQ09O
RklHX0FENTExMD15CkNPTkZJR19BRDUyNzI9eQpDT05GSUdfRFMxODAzPXkKIyBDT05GSUdfTUFY
NTQzMiBpcyBub3Qgc2V0CiMgQ09ORklHX01BWDU0ODEgaXMgbm90IHNldApDT05GSUdfTUFYNTQ4
Nz15CkNPTkZJR19NQ1A0MDE4PXkKQ09ORklHX01DUDQxMzE9eQojIENPTkZJR19NQ1A0NTMxIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUNQNDEwMTAgaXMgbm90IHNldAojIENPTkZJR19UUEwwMTAyIGlz
IG5vdCBzZXQKIyBlbmQgb2YgRGlnaXRhbCBwb3RlbnRpb21ldGVycwoKIwojIERpZ2l0YWwgcG90
ZW50aW9zdGF0cwojCkNPTkZJR19MTVA5MTAwMD15CiMgZW5kIG9mIERpZ2l0YWwgcG90ZW50aW9z
dGF0cwoKIwojIFByZXNzdXJlIHNlbnNvcnMKIwpDT05GSUdfQUJQMDYwTUc9eQpDT05GSUdfQk1Q
MjgwPXkKQ09ORklHX0JNUDI4MF9JMkM9eQpDT05GSUdfQk1QMjgwX1NQST15CkNPTkZJR19ETEhM
NjBEPXkKIyBDT05GSUdfRFBTMzEwIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9TRU5TT1JfUFJFU1M9
eQpDT05GSUdfSFAwMz15CiMgQ09ORklHX0lDUDEwMTAwIGlzIG5vdCBzZXQKQ09ORklHX01QTDEx
NT15CkNPTkZJR19NUEwxMTVfSTJDPXkKQ09ORklHX01QTDExNV9TUEk9eQpDT05GSUdfTVBMMzEx
NT15CkNPTkZJR19NUzU2MTE9eQpDT05GSUdfTVM1NjExX0kyQz15CiMgQ09ORklHX01TNTYxMV9T
UEkgaXMgbm90IHNldApDT05GSUdfTVM1NjM3PXkKQ09ORklHX0lJT19TVF9QUkVTUz15CkNPTkZJ
R19JSU9fU1RfUFJFU1NfSTJDPXkKQ09ORklHX0lJT19TVF9QUkVTU19TUEk9eQojIENPTkZJR19U
NTQwMyBpcyBub3Qgc2V0CiMgQ09ORklHX0hQMjA2QyBpcyBub3Qgc2V0CkNPTkZJR19aUEEyMzI2
PXkKQ09ORklHX1pQQTIzMjZfSTJDPXkKQ09ORklHX1pQQTIzMjZfU1BJPXkKIyBlbmQgb2YgUHJl
c3N1cmUgc2Vuc29ycwoKIwojIExpZ2h0bmluZyBzZW5zb3JzCiMKQ09ORklHX0FTMzkzNT15CiMg
ZW5kIG9mIExpZ2h0bmluZyBzZW5zb3JzCgojCiMgUHJveGltaXR5IGFuZCBkaXN0YW5jZSBzZW5z
b3JzCiMKQ09ORklHX0lTTDI5NTAxPXkKIyBDT05GSUdfTElEQVJfTElURV9WMiBpcyBub3Qgc2V0
CiMgQ09ORklHX01CMTIzMiBpcyBub3Qgc2V0CkNPTkZJR19QSU5HPXkKQ09ORklHX1JGRDc3NDAy
PXkKQ09ORklHX1NSRjA0PXkKQ09ORklHX1NYX0NPTU1PTj15CkNPTkZJR19TWDkzMTA9eQpDT05G
SUdfU1g5MzI0PXkKIyBDT05GSUdfU1g5MzYwIGlzIG5vdCBzZXQKIyBDT05GSUdfU1g5NTAwIGlz
IG5vdCBzZXQKIyBDT05GSUdfU1JGMDggaXMgbm90IHNldApDT05GSUdfVkNOTDMwMjA9eQojIENP
TkZJR19WTDUzTDBYX0kyQyBpcyBub3Qgc2V0CiMgZW5kIG9mIFByb3hpbWl0eSBhbmQgZGlzdGFu
Y2Ugc2Vuc29ycwoKIwojIFJlc29sdmVyIHRvIGRpZ2l0YWwgY29udmVydGVycwojCkNPTkZJR19B
RDJTOTA9eQojIENPTkZJR19BRDJTMTIwMCBpcyBub3Qgc2V0CiMgZW5kIG9mIFJlc29sdmVyIHRv
IGRpZ2l0YWwgY29udmVydGVycwoKIwojIFRlbXBlcmF0dXJlIHNlbnNvcnMKIwojIENPTkZJR19J
UVM2MjBBVF9URU1QIGlzIG5vdCBzZXQKIyBDT05GSUdfTFRDMjk4MyBpcyBub3Qgc2V0CkNPTkZJ
R19NQVhJTV9USEVSTU9DT1VQTEU9eQojIENPTkZJR19ISURfU0VOU09SX1RFTVAgaXMgbm90IHNl
dAojIENPTkZJR19NTFg5MDYxNCBpcyBub3Qgc2V0CkNPTkZJR19NTFg5MDYzMj15CkNPTkZJR19U
TVAwMDY9eQojIENPTkZJR19UTVAwMDcgaXMgbm90IHNldApDT05GSUdfVE1QMTE3PXkKQ09ORklH
X1RTWVMwMT15CkNPTkZJR19UU1lTMDJEPXkKQ09ORklHX01BWDMxODU2PXkKIyBDT05GSUdfTUFY
MzE4NjUgaXMgbm90IHNldAojIGVuZCBvZiBUZW1wZXJhdHVyZSBzZW5zb3JzCgojIENPTkZJR19Q
V00gaXMgbm90IHNldAoKIwojIElSUSBjaGlwIHN1cHBvcnQKIwpDT05GSUdfSVJRQ0hJUD15CiMg
Q09ORklHX0FMX0ZJQyBpcyBub3Qgc2V0CkNPTkZJR19NQURFUkFfSVJRPXkKQ09ORklHX09SMUtf
UElDPXkKIyBDT05GSUdfSkNPUkVfQUlDIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVORVNBU19JTlRD
X0lSUVBJTiBpcyBub3Qgc2V0CiMgQ09ORklHX1JFTkVTQVNfSVJRQyBpcyBub3Qgc2V0CiMgQ09O
RklHX1JFTkVTQVNfUlpBMV9JUlFDIGlzIG5vdCBzZXQKIyBDT05GSUdfU0wyOENQTERfSU5UQyBp
cyBub3Qgc2V0CiMgQ09ORklHX1RTNDgwMF9JUlEgaXMgbm90IHNldAojIENPTkZJR19JTkdFTklD
X1RDVV9JUlEgaXMgbm90IHNldAojIENPTkZJR19JUlFfVU5JUEhJRVJfQUlERVQgaXMgbm90IHNl
dAojIENPTkZJR19NRVNPTl9JUlFfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0lNWF9JUlFTVEVF
UiBpcyBub3Qgc2V0CiMgQ09ORklHX0lNWF9JTlRNVVggaXMgbm90IHNldAojIENPTkZJR19FWFlO
T1NfSVJRX0NPTUJJTkVSIGlzIG5vdCBzZXQKIyBDT05GSUdfTE9PTkdTT05fUENIX1BJQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX01TVF9JUlEgaXMgbm90IHNldAojIENPTkZJR19NQ0hQX0VJQyBpcyBu
b3Qgc2V0CiMgZW5kIG9mIElSUSBjaGlwIHN1cHBvcnQKCkNPTkZJR19JUEFDS19CVVM9eQpDT05G
SUdfU0VSSUFMX0lQT0NUQUw9eQojIENPTkZJR19SRVNFVF9DT05UUk9MTEVSIGlzIG5vdCBzZXQK
CiMKIyBQSFkgU3Vic3lzdGVtCiMKQ09ORklHX0dFTkVSSUNfUEhZPXkKQ09ORklHX0dFTkVSSUNf
UEhZX01JUElfRFBIWT15CiMgQ09ORklHX1BIWV9MUEMxOFhYX1VTQl9PVEcgaXMgbm90IHNldAoj
IENPTkZJR19QSFlfUElTVEFDSElPX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9YR0VORSBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTQl9MR01fUEhZIGlzIG5vdCBzZXQKQ09ORklHX1BIWV9DQU5f
VFJBTlNDRUlWRVI9eQojIENPTkZJR19QSFlfTUVTT044X0hETUlfVFggaXMgbm90IHNldAojIENP
TkZJR19QSFlfTUVTT044Ql9VU0IyIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX01FU09OX0dYTF9V
U0IyIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX01FU09OX0cxMkFfVVNCMiBpcyBub3Qgc2V0CiMg
Q09ORklHX1BIWV9NRVNPTl9HMTJBX1VTQjNfUENJRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9N
RVNPTl9BWEdfUENJRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9NRVNPTl9BWEdfTUlQSV9QQ0lF
X0FOQUxPRyBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9NRVNPTl9BWEdfTUlQSV9EUEhZIGlzIG5v
dCBzZXQKCiMKIyBQSFkgZHJpdmVycyBmb3IgQnJvYWRjb20gcGxhdGZvcm1zCiMKIyBDT05GSUdf
UEhZX0JDTTYzWFhfVVNCSCBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9DWUdOVVNfUENJRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BIWV9CQ01fU1JfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfQkNNX0tP
TkFfVVNCMl9QSFkgaXMgbm90IHNldAojIENPTkZJR19QSFlfQkNNX05TX1VTQjIgaXMgbm90IHNl
dAojIENPTkZJR19QSFlfQkNNX05TX1VTQjMgaXMgbm90IHNldAojIENPTkZJR19QSFlfTlMyX1BD
SUUgaXMgbm90IHNldAojIENPTkZJR19QSFlfTlMyX1VTQl9EUkQgaXMgbm90IHNldAojIENPTkZJ
R19QSFlfQlJDTV9TQVRBIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX0JSQ01fVVNCIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUEhZX0JDTV9TUl9QQ0lFIGlzIG5vdCBzZXQKIyBlbmQgb2YgUEhZIGRyaXZl
cnMgZm9yIEJyb2FkY29tIHBsYXRmb3JtcwoKQ09ORklHX1BIWV9DQURFTkNFX1RPUlJFTlQ9eQpD
T05GSUdfUEhZX0NBREVOQ0VfRFBIWT15CkNPTkZJR19QSFlfQ0FERU5DRV9EUEhZX1JYPXkKQ09O
RklHX1BIWV9DQURFTkNFX1NBTFZPPXkKIyBDT05GSUdfUEhZX0ZTTF9JTVg4TVFfVVNCIGlzIG5v
dCBzZXQKIyBDT05GSUdfUEhZX01JWEVMX01JUElfRFBIWSBpcyBub3Qgc2V0CiMgQ09ORklHX1BI
WV9GU0xfSU1YOE1fUENJRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9GU0xfTFlOWF8yOEcgaXMg
bm90IHNldAojIENPTkZJR19QSFlfSEk2MjIwX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9I
STM2NjBfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX0hJMzY3MF9VU0IgaXMgbm90IHNldAoj
IENPTkZJR19QSFlfSEkzNjcwX1BDSUUgaXMgbm90IHNldAojIENPTkZJR19QSFlfSElTVEJfQ09N
QlBIWSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9ISVNJX0lOTk9fVVNCMiBpcyBub3Qgc2V0CiMg
Q09ORklHX1BIWV9JTkdFTklDX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9MQU5USVFfVlJY
MjAwX1BDSUUgaXMgbm90IHNldAojIENPTkZJR19QSFlfTEFOVElRX1JDVV9VU0IyIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQVJNQURBMzc1X1VTQkNMVVNURVJfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdf
UEhZX0JFUkxJTl9TQVRBIGlzIG5vdCBzZXQKQ09ORklHX1BIWV9NVkVCVV9BMzcwMF9VVE1JPXkK
IyBDT05GSUdfUEhZX01WRUJVX0EzOFhfQ09NUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX01W
RUJVX0NQMTEwX1VUTUkgaXMgbm90IHNldAojIENPTkZJR19QSFlfUFhBXzI4Tk1fSFNJQyBpcyBu
b3Qgc2V0CkNPTkZJR19QSFlfUFhBXzI4Tk1fVVNCMj15CiMgQ09ORklHX1BIWV9QWEFfVVNCIGlz
IG5vdCBzZXQKIyBDT05GSUdfUEhZX01NUDNfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX01N
UDNfSFNJQyBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9NVEtfVFBIWSBpcyBub3Qgc2V0CiMgQ09O
RklHX1BIWV9NVEtfVUZTIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX01US19YU1BIWSBpcyBub3Qg
c2V0CiMgQ09ORklHX1BIWV9NVEtfSERNSSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9NVEtfTUlQ
SV9EU0kgaXMgbm90IHNldAojIENPTkZJR19QSFlfU1BBUlg1X1NFUkRFUyBpcyBub3Qgc2V0CiMg
Q09ORklHX1BIWV9MQU45NjZYX1NFUkRFUyBpcyBub3Qgc2V0CkNPTkZJR19QSFlfQ1BDQVBfVVNC
PXkKIyBDT05GSUdfUEhZX01BUFBIT05FX01ETTY2MDAgaXMgbm90IHNldApDT05GSUdfUEhZX09D
RUxPVF9TRVJERVM9eQojIENPTkZJR19QSFlfQVRINzlfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdf
UEhZX1FDT01fRURQIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1FDT01fSVBRNDAxOV9VU0IgaXMg
bm90IHNldAojIENPTkZJR19QSFlfUUNPTV9QQ0lFMiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9R
Q09NX1FNUCBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9RQ09NX1FVU0IyIGlzIG5vdCBzZXQKIyBD
T05GSUdfUEhZX1FDT01fVVNCX0hTIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1FDT01fVVNCX1NO
UFNfRkVNVE9fVjIgaXMgbm90IHNldAojIENPTkZJR19QSFlfUUNPTV9VU0JfSFNJQyBpcyBub3Qg
c2V0CiMgQ09ORklHX1BIWV9RQ09NX1VTQl9IU18yOE5NIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZ
X1FDT01fVVNCX1NTIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1FDT01fSVBRODA2WF9VU0IgaXMg
bm90IHNldAojIENPTkZJR19QSFlfTVQ3NjIxX1BDSSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9S
QUxJTktfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1JDQVJfR0VOM19VU0IzIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUEhZX1JPQ0tDSElQX0RQSFlfUlgwIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZ
X1JPQ0tDSElQX0lOTk9fSERNSSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9ST0NLQ0hJUF9JTk5P
X1VTQjIgaXMgbm90IHNldAojIENPTkZJR19QSFlfUk9DS0NISVBfSU5OT19DU0lEUEhZIGlzIG5v
dCBzZXQKIyBDT05GSUdfUEhZX1JPQ0tDSElQX0lOTk9fRFNJRFBIWSBpcyBub3Qgc2V0CiMgQ09O
RklHX1BIWV9ST0NLQ0hJUF9QQ0lFIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1JPQ0tDSElQX1RZ
UEVDIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX0VYWU5PU19EUF9WSURFTyBpcyBub3Qgc2V0CiMg
Q09ORklHX1BIWV9FWFlOT1NfTUlQSV9WSURFTyBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9FWFlO
T1NfUENJRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9TQU1TVU5HX1VGUyBpcyBub3Qgc2V0CiMg
Q09ORklHX1BIWV9TQU1TVU5HX1VTQjIgaXMgbm90IHNldAojIENPTkZJR19QSFlfVU5JUEhJRVJf
VVNCMiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9VTklQSElFUl9VU0IzIGlzIG5vdCBzZXQKIyBD
T05GSUdfUEhZX1VOSVBISUVSX1BDSUUgaXMgbm90IHNldAojIENPTkZJR19QSFlfVU5JUEhJRVJf
QUhDSSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9TVF9TUEVBUjEzMTBfTUlQSFkgaXMgbm90IHNl
dAojIENPTkZJR19QSFlfU1RfU1BFQVIxMzQwX01JUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZ
X1NUTTMyX1VTQlBIWUMgaXMgbm90IHNldAojIENPTkZJR19QSFlfVEVHUkExOTRfUDJVIGlzIG5v
dCBzZXQKIyBDT05GSUdfUEhZX0RBOFhYX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9ETTgx
NlhfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX0FNNjU0X1NFUkRFUyBpcyBub3Qgc2V0CiMg
Q09ORklHX1BIWV9KNzIxRV9XSVogaXMgbm90IHNldAojIENPTkZJR19PTUFQX0NPTlRST0xfUEhZ
IGlzIG5vdCBzZXQKIyBDT05GSUdfVElfUElQRTMgaXMgbm90IHNldApDT05GSUdfUEhZX1RVU0Ix
MjEwPXkKIyBDT05GSUdfUEhZX0lOVEVMX0tFRU1CQVlfRU1NQyBpcyBub3Qgc2V0CiMgQ09ORklH
X1BIWV9JTlRFTF9LRUVNQkFZX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9JTlRFTF9MR01f
Q09NQk8gaXMgbm90IHNldAojIENPTkZJR19QSFlfSU5URUxfTEdNX0VNTUMgaXMgbm90IHNldAoj
IENPTkZJR19QSFlfSU5URUxfVEhVTkRFUkJBWV9FTU1DIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZ
X1hJTElOWF9aWU5RTVAgaXMgbm90IHNldAojIGVuZCBvZiBQSFkgU3Vic3lzdGVtCgpDT05GSUdf
UE9XRVJDQVA9eQojIENPTkZJR19EVFBNIGlzIG5vdCBzZXQKQ09ORklHX01DQj15CkNPTkZJR19N
Q0JfTFBDPXkKQ09ORklHX1JBUz15CgojCiMgQW5kcm9pZAojCiMgQ09ORklHX0FORFJPSUQgaXMg
bm90IHNldAojIGVuZCBvZiBBbmRyb2lkCgpDT05GSUdfREFYPXkKQ09ORklHX05WTUVNPXkKQ09O
RklHX05WTUVNX1NZU0ZTPXkKIyBDT05GSUdfTlZNRU1fSU1YX0lJTSBpcyBub3Qgc2V0CiMgQ09O
RklHX05WTUVNX0lNWF9PQ09UUCBpcyBub3Qgc2V0CiMgQ09ORklHX0paNDc4MF9FRlVTRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX05WTUVNX0xQQzE4WFhfRUVQUk9NIGlzIG5vdCBzZXQKIyBDT05GSUdf
TlZNRU1fTFBDMThYWF9PVFAgaXMgbm90IHNldAojIENPTkZJR19OVk1FTV9NWFNfT0NPVFAgaXMg
bm90IHNldAojIENPTkZJR19NVEtfRUZVU0UgaXMgbm90IHNldAojIENPTkZJR19OVk1FTV9OSU5U
RU5ET19PVFAgaXMgbm90IHNldAojIENPTkZJR19RQ09NX1FGUFJPTSBpcyBub3Qgc2V0CkNPTkZJ
R19OVk1FTV9TUE1JX1NEQU09eQojIENPTkZJR19ST0NLQ0hJUF9FRlVTRSBpcyBub3Qgc2V0CiMg
Q09ORklHX1JPQ0tDSElQX09UUCBpcyBub3Qgc2V0CiMgQ09ORklHX05WTUVNX0JDTV9PQ09UUCBp
cyBub3Qgc2V0CiMgQ09ORklHX05WTUVNX1NUTTMyX1JPTUVNIGlzIG5vdCBzZXQKIyBDT05GSUdf
VU5JUEhJRVJfRUZVU0UgaXMgbm90IHNldAojIENPTkZJR19OVk1FTV9WRjYxMF9PQ09UUCBpcyBu
b3Qgc2V0CiMgQ09ORklHX01FU09OX01YX0VGVVNFIGlzIG5vdCBzZXQKIyBDT05GSUdfTlZNRU1f
U05WU19MUEdQUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NDMjdYWF9FRlVTRSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NQUkRfRUZVU0UgaXMgbm90IHNldAojIENPTkZJR19OVk1FTV9STUVNIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTlZNRU1fQlJDTV9OVlJBTSBpcyBub3Qgc2V0CiMgQ09ORklHX05WTUVNX0xB
WUVSU0NBUEVfU0ZQIGlzIG5vdCBzZXQKIyBDT05GSUdfTlZNRU1fU1VOUExVU19PQ09UUCBpcyBu
b3Qgc2V0CiMgQ09ORklHX05WTUVNX0FQUExFX0VGVVNFUyBpcyBub3Qgc2V0CgojCiMgSFcgdHJh
Y2luZyBzdXBwb3J0CiMKQ09ORklHX1NUTT15CkNPTkZJR19TVE1fUFJPVE9fQkFTSUM9eQpDT05G
SUdfU1RNX1BST1RPX1NZU19UPXkKQ09ORklHX1NUTV9EVU1NWT15CkNPTkZJR19TVE1fU09VUkNF
X0NPTlNPTEU9eQpDT05GSUdfU1RNX1NPVVJDRV9IRUFSVEJFQVQ9eQojIENPTkZJR19TVE1fU09V
UkNFX0ZUUkFDRSBpcyBub3Qgc2V0CkNPTkZJR19JTlRFTF9USD15CkNPTkZJR19JTlRFTF9USF9H
VEg9eQpDT05GSUdfSU5URUxfVEhfU1RIPXkKQ09ORklHX0lOVEVMX1RIX01TVT15CiMgQ09ORklH
X0lOVEVMX1RIX1BUSSBpcyBub3Qgc2V0CkNPTkZJR19JTlRFTF9USF9ERUJVRz15CiMgZW5kIG9m
IEhXIHRyYWNpbmcgc3VwcG9ydAoKQ09ORklHX0ZQR0E9eQojIENPTkZJR19GUEdBX01HUl9TT0NG
UEdBIGlzIG5vdCBzZXQKIyBDT05GSUdfRlBHQV9NR1JfU09DRlBHQV9BMTAgaXMgbm90IHNldApD
T05GSUdfQUxURVJBX1BSX0lQX0NPUkU9eQpDT05GSUdfQUxURVJBX1BSX0lQX0NPUkVfUExBVD15
CkNPTkZJR19GUEdBX01HUl9BTFRFUkFfUFNfU1BJPXkKIyBDT05GSUdfRlBHQV9NR1JfWllOUV9G
UEdBIGlzIG5vdCBzZXQKQ09ORklHX0ZQR0FfTUdSX1hJTElOWF9TUEk9eQojIENPTkZJR19GUEdB
X01HUl9JQ0U0MF9TUEkgaXMgbm90IHNldApDT05GSUdfRlBHQV9NR1JfTUFDSFhPMl9TUEk9eQpD
T05GSUdfRlBHQV9CUklER0U9eQojIENPTkZJR19BTFRFUkFfRlJFRVpFX0JSSURHRSBpcyBub3Qg
c2V0CiMgQ09ORklHX1hJTElOWF9QUl9ERUNPVVBMRVIgaXMgbm90IHNldApDT05GSUdfRlBHQV9S
RUdJT049eQpDT05GSUdfT0ZfRlBHQV9SRUdJT049eQpDT05GSUdfRlBHQV9ERkw9eQpDT05GSUdf
RlBHQV9ERkxfQUZVPXkKQ09ORklHX0ZQR0FfREZMX05JT1NfSU5URUxfUEFDX04zMDAwPXkKIyBD
T05GSUdfRlBHQV9NR1JfWllOUU1QX0ZQR0EgaXMgbm90IHNldAojIENPTkZJR19GUEdBX01HUl9W
RVJTQUxfRlBHQSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZTSSBpcyBub3Qgc2V0CiMgQ09ORklHX1RF
RSBpcyBub3Qgc2V0CkNPTkZJR19NVUxUSVBMRVhFUj15CgojCiMgTXVsdGlwbGV4ZXIgZHJpdmVy
cwojCkNPTkZJR19NVVhfQURHNzkyQT15CkNPTkZJR19NVVhfQURHUzE0MDg9eQpDT05GSUdfTVVY
X0dQSU89eQpDT05GSUdfTVVYX01NSU89eQojIGVuZCBvZiBNdWx0aXBsZXhlciBkcml2ZXJzCgpD
T05GSUdfUE1fT1BQPXkKQ09ORklHX1NJT1g9eQojIENPTkZJR19TSU9YX0JVU19HUElPIGlzIG5v
dCBzZXQKQ09ORklHX1NMSU1CVVM9eQpDT05GSUdfU0xJTV9RQ09NX0NUUkw9eQpDT05GSUdfSU5U
RVJDT05ORUNUPXkKIyBDT05GSUdfSU5URVJDT05ORUNUX0lNWCBpcyBub3Qgc2V0CiMgQ09ORklH
X0lOVEVSQ09OTkVDVF9RQ09NX09TTV9MMyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVSQ09OTkVD
VF9TQU1TVU5HIGlzIG5vdCBzZXQKQ09ORklHX0NPVU5URVI9eQojIENPTkZJR18xMDRfUVVBRF84
IGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URVJSVVBUX0NOVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NU
TTMyX1RJTUVSX0NOVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NUTTMyX0xQVElNRVJfQ05UIGlzIG5v
dCBzZXQKIyBDT05GSUdfVElfRVFFUCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZUTV9RVUFEREVDIGlz
IG5vdCBzZXQKQ09ORklHX01JQ1JPQ0hJUF9UQ0JfQ0FQVFVSRT15CkNPTkZJR19NT1NUPXkKQ09O
RklHX01PU1RfQ0RFVj15CkNPTkZJR19QRUNJPXkKQ09ORklHX1BFQ0lfQ1BVPXkKIyBDT05GSUdf
UEVDSV9BU1BFRUQgaXMgbm90IHNldAojIENPTkZJR19IVEUgaXMgbm90IHNldAojIGVuZCBvZiBE
ZXZpY2UgRHJpdmVycwoKIwojIEZpbGUgc3lzdGVtcwojCiMgQ09ORklHX1ZBTElEQVRFX0ZTX1BB
UlNFUiBpcyBub3Qgc2V0CkNPTkZJR19GU19JT01BUD15CkNPTkZJR19FWFQyX0ZTPXkKIyBDT05G
SUdfRVhUMl9GU19YQVRUUiBpcyBub3Qgc2V0CkNPTkZJR19FWFQzX0ZTPXkKQ09ORklHX0VYVDNf
RlNfUE9TSVhfQUNMPXkKIyBDT05GSUdfRVhUM19GU19TRUNVUklUWSBpcyBub3Qgc2V0CkNPTkZJ
R19FWFQ0X0ZTPXkKQ09ORklHX0VYVDRfRlNfUE9TSVhfQUNMPXkKQ09ORklHX0VYVDRfRlNfU0VD
VVJJVFk9eQpDT05GSUdfRVhUNF9ERUJVRz15CkNPTkZJR19KQkQyPXkKIyBDT05GSUdfSkJEMl9E
RUJVRyBpcyBub3Qgc2V0CkNPTkZJR19GU19NQkNBQ0hFPXkKQ09ORklHX1JFSVNFUkZTX0ZTPXkK
Q09ORklHX1JFSVNFUkZTX0NIRUNLPXkKIyBDT05GSUdfUkVJU0VSRlNfUFJPQ19JTkZPIGlzIG5v
dCBzZXQKIyBDT05GSUdfUkVJU0VSRlNfRlNfWEFUVFIgaXMgbm90IHNldApDT05GSUdfSkZTX0ZT
PXkKQ09ORklHX0pGU19QT1NJWF9BQ0w9eQpDT05GSUdfSkZTX1NFQ1VSSVRZPXkKQ09ORklHX0pG
U19ERUJVRz15CiMgQ09ORklHX0pGU19TVEFUSVNUSUNTIGlzIG5vdCBzZXQKQ09ORklHX1hGU19G
Uz15CiMgQ09ORklHX1hGU19TVVBQT1JUX1Y0IGlzIG5vdCBzZXQKIyBDT05GSUdfWEZTX1FVT1RB
IGlzIG5vdCBzZXQKQ09ORklHX1hGU19QT1NJWF9BQ0w9eQpDT05GSUdfWEZTX1JUPXkKQ09ORklH
X1hGU19PTkxJTkVfU0NSVUI9eQojIENPTkZJR19YRlNfT05MSU5FX1JFUEFJUiBpcyBub3Qgc2V0
CkNPTkZJR19YRlNfREVCVUc9eQpDT05GSUdfWEZTX0FTU0VSVF9GQVRBTD15CkNPTkZJR19HRlMy
X0ZTPXkKIyBDT05GSUdfR0ZTMl9GU19MT0NLSU5HX0RMTSBpcyBub3Qgc2V0CiMgQ09ORklHX09D
RlMyX0ZTIGlzIG5vdCBzZXQKQ09ORklHX0JUUkZTX0ZTPXkKIyBDT05GSUdfQlRSRlNfRlNfUE9T
SVhfQUNMIGlzIG5vdCBzZXQKIyBDT05GSUdfQlRSRlNfRlNfQ0hFQ0tfSU5URUdSSVRZIGlzIG5v
dCBzZXQKQ09ORklHX0JUUkZTX0ZTX1JVTl9TQU5JVFlfVEVTVFM9eQpDT05GSUdfQlRSRlNfREVC
VUc9eQpDT05GSUdfQlRSRlNfQVNTRVJUPXkKQ09ORklHX0JUUkZTX0ZTX1JFRl9WRVJJRlk9eQpD
T05GSUdfTklMRlMyX0ZTPXkKQ09ORklHX0YyRlNfRlM9eQojIENPTkZJR19GMkZTX1NUQVRfRlMg
aXMgbm90IHNldApDT05GSUdfRjJGU19GU19YQVRUUj15CiMgQ09ORklHX0YyRlNfRlNfUE9TSVhf
QUNMIGlzIG5vdCBzZXQKIyBDT05GSUdfRjJGU19GU19TRUNVUklUWSBpcyBub3Qgc2V0CiMgQ09O
RklHX0YyRlNfQ0hFQ0tfRlMgaXMgbm90IHNldAojIENPTkZJR19GMkZTX0ZBVUxUX0lOSkVDVElP
TiBpcyBub3Qgc2V0CkNPTkZJR19GMkZTX0ZTX0NPTVBSRVNTSU9OPXkKIyBDT05GSUdfRjJGU19G
U19MWk8gaXMgbm90IHNldAojIENPTkZJR19GMkZTX0ZTX0xaNCBpcyBub3Qgc2V0CiMgQ09ORklH
X0YyRlNfRlNfWlNURCBpcyBub3Qgc2V0CkNPTkZJR19GMkZTX0lPU1RBVD15CkNPTkZJR19GU19Q
T1NJWF9BQ0w9eQpDT05GSUdfRVhQT1JURlM9eQpDT05GSUdfRVhQT1JURlNfQkxPQ0tfT1BTPXkK
Q09ORklHX0ZJTEVfTE9DS0lORz15CiMgQ09ORklHX0ZTX0VOQ1JZUFRJT04gaXMgbm90IHNldApD
T05GSUdfRlNfVkVSSVRZPXkKQ09ORklHX0ZTX1ZFUklUWV9ERUJVRz15CkNPTkZJR19GU19WRVJJ
VFlfQlVJTFRJTl9TSUdOQVRVUkVTPXkKQ09ORklHX0ZTTk9USUZZPXkKIyBDT05GSUdfRE5PVElG
WSBpcyBub3Qgc2V0CkNPTkZJR19JTk9USUZZX1VTRVI9eQpDT05GSUdfRkFOT1RJRlk9eQojIENP
TkZJR19RVU9UQSBpcyBub3Qgc2V0CiMgQ09ORklHX1FVT1RBX05FVExJTktfSU5URVJGQUNFIGlz
IG5vdCBzZXQKQ09ORklHX1FVT1RBQ1RMPXkKQ09ORklHX0FVVE9GUzRfRlM9eQpDT05GSUdfQVVU
T0ZTX0ZTPXkKIyBDT05GSUdfRlVTRV9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX09WRVJMQVlfRlMg
aXMgbm90IHNldAoKIwojIENhY2hlcwojCkNPTkZJR19ORVRGU19TVVBQT1JUPXkKQ09ORklHX05F
VEZTX1NUQVRTPXkKQ09ORklHX0ZTQ0FDSEU9eQojIENPTkZJR19GU0NBQ0hFX1NUQVRTIGlzIG5v
dCBzZXQKIyBDT05GSUdfRlNDQUNIRV9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19DQUNIRUZJTEVT
PXkKQ09ORklHX0NBQ0hFRklMRVNfREVCVUc9eQojIENPTkZJR19DQUNIRUZJTEVTX0VSUk9SX0lO
SkVDVElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0NBQ0hFRklMRVNfT05ERU1BTkQgaXMgbm90IHNl
dAojIGVuZCBvZiBDYWNoZXMKCiMKIyBDRC1ST00vRFZEIEZpbGVzeXN0ZW1zCiMKQ09ORklHX0lT
Tzk2NjBfRlM9eQpDT05GSUdfSk9MSUVUPXkKIyBDT05GSUdfWklTT0ZTIGlzIG5vdCBzZXQKIyBD
T05GSUdfVURGX0ZTIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ0QtUk9NL0RWRCBGaWxlc3lzdGVtcwoK
IwojIERPUy9GQVQvRVhGQVQvTlQgRmlsZXN5c3RlbXMKIwpDT05GSUdfRkFUX0ZTPXkKQ09ORklH
X01TRE9TX0ZTPXkKQ09ORklHX1ZGQVRfRlM9eQpDT05GSUdfRkFUX0RFRkFVTFRfQ09ERVBBR0U9
NDM3CkNPTkZJR19GQVRfREVGQVVMVF9JT0NIQVJTRVQ9Imlzbzg4NTktMSIKQ09ORklHX0ZBVF9E
RUZBVUxUX1VURjg9eQpDT05GSUdfRVhGQVRfRlM9eQpDT05GSUdfRVhGQVRfREVGQVVMVF9JT0NI
QVJTRVQ9InV0ZjgiCiMgQ09ORklHX05URlNfRlMgaXMgbm90IHNldApDT05GSUdfTlRGUzNfRlM9
eQpDT05GSUdfTlRGUzNfTFpYX1hQUkVTUz15CiMgQ09ORklHX05URlMzX0ZTX1BPU0lYX0FDTCBp
cyBub3Qgc2V0CiMgZW5kIG9mIERPUy9GQVQvRVhGQVQvTlQgRmlsZXN5c3RlbXMKCiMKIyBQc2V1
ZG8gZmlsZXN5c3RlbXMKIwpDT05GSUdfUFJPQ19GUz15CiMgQ09ORklHX1BST0NfS0NPUkUgaXMg
bm90IHNldApDT05GSUdfUFJPQ19TWVNDVEw9eQpDT05GSUdfUFJPQ19QQUdFX01PTklUT1I9eQpD
T05GSUdfUFJPQ19DSElMRFJFTj15CkNPTkZJR19LRVJORlM9eQpDT05GSUdfU1lTRlM9eQpDT05G
SUdfVE1QRlM9eQpDT05GSUdfVE1QRlNfUE9TSVhfQUNMPXkKQ09ORklHX1RNUEZTX1hBVFRSPXkK
Q09ORklHX01FTUZEX0NSRUFURT15CkNPTkZJR19DT05GSUdGU19GUz15CiMgZW5kIG9mIFBzZXVk
byBmaWxlc3lzdGVtcwoKQ09ORklHX01JU0NfRklMRVNZU1RFTVM9eQpDT05GSUdfT1JBTkdFRlNf
RlM9eQpDT05GSUdfQURGU19GUz15CiMgQ09ORklHX0FERlNfRlNfUlcgaXMgbm90IHNldApDT05G
SUdfQUZGU19GUz15CiMgQ09ORklHX0VDUllQVF9GUyBpcyBub3Qgc2V0CkNPTkZJR19IRlNfRlM9
eQpDT05GSUdfSEZTUExVU19GUz15CkNPTkZJR19CRUZTX0ZTPXkKQ09ORklHX0JFRlNfREVCVUc9
eQpDT05GSUdfQkZTX0ZTPXkKQ09ORklHX0VGU19GUz15CkNPTkZJR19DUkFNRlM9eQpDT05GSUdf
Q1JBTUZTX0JMT0NLREVWPXkKIyBDT05GSUdfU1FVQVNIRlMgaXMgbm90IHNldApDT05GSUdfVlhG
U19GUz15CiMgQ09ORklHX01JTklYX0ZTIGlzIG5vdCBzZXQKQ09ORklHX09NRlNfRlM9eQpDT05G
SUdfSFBGU19GUz15CkNPTkZJR19RTlg0RlNfRlM9eQojIENPTkZJR19RTlg2RlNfRlMgaXMgbm90
IHNldApDT05GSUdfUk9NRlNfRlM9eQpDT05GSUdfUk9NRlNfQkFDS0VEX0JZX0JMT0NLPXkKQ09O
RklHX1JPTUZTX09OX0JMT0NLPXkKQ09ORklHX1BTVE9SRT15CkNPTkZJR19QU1RPUkVfREVGQVVM
VF9LTVNHX0JZVEVTPTEwMjQwCiMgQ09ORklHX1BTVE9SRV9ERUZMQVRFX0NPTVBSRVNTIGlzIG5v
dCBzZXQKQ09ORklHX1BTVE9SRV9MWk9fQ09NUFJFU1M9eQpDT05GSUdfUFNUT1JFX0xaNF9DT01Q
UkVTUz15CkNPTkZJR19QU1RPUkVfTFo0SENfQ09NUFJFU1M9eQojIENPTkZJR19QU1RPUkVfODQy
X0NPTVBSRVNTIGlzIG5vdCBzZXQKIyBDT05GSUdfUFNUT1JFX1pTVERfQ09NUFJFU1MgaXMgbm90
IHNldApDT05GSUdfUFNUT1JFX0NPTVBSRVNTPXkKQ09ORklHX1BTVE9SRV9MWk9fQ09NUFJFU1Nf
REVGQVVMVD15CiMgQ09ORklHX1BTVE9SRV9MWjRfQ09NUFJFU1NfREVGQVVMVCBpcyBub3Qgc2V0
CiMgQ09ORklHX1BTVE9SRV9MWjRIQ19DT01QUkVTU19ERUZBVUxUIGlzIG5vdCBzZXQKQ09ORklH
X1BTVE9SRV9DT01QUkVTU19ERUZBVUxUPSJsem8iCkNPTkZJR19QU1RPUkVfQ09OU09MRT15CiMg
Q09ORklHX1BTVE9SRV9QTVNHIGlzIG5vdCBzZXQKIyBDT05GSUdfUFNUT1JFX1JBTSBpcyBub3Qg
c2V0CkNPTkZJR19QU1RPUkVfWk9ORT15CkNPTkZJR19QU1RPUkVfQkxLPXkKQ09ORklHX1BTVE9S
RV9CTEtfQkxLREVWPSIiCkNPTkZJR19QU1RPUkVfQkxLX0tNU0dfU0laRT02NApDT05GSUdfUFNU
T1JFX0JMS19NQVhfUkVBU09OPTIKQ09ORklHX1BTVE9SRV9CTEtfQ09OU09MRV9TSVpFPTY0CiMg
Q09ORklHX1NZU1ZfRlMgaXMgbm90IHNldApDT05GSUdfVUZTX0ZTPXkKQ09ORklHX1VGU19GU19X
UklURT15CkNPTkZJR19VRlNfREVCVUc9eQpDT05GSUdfRVJPRlNfRlM9eQojIENPTkZJR19FUk9G
U19GU19ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19FUk9GU19GU19YQVRUUj15CiMgQ09ORklHX0VS
T0ZTX0ZTX1BPU0lYX0FDTCBpcyBub3Qgc2V0CiMgQ09ORklHX0VST0ZTX0ZTX1NFQ1VSSVRZIGlz
IG5vdCBzZXQKQ09ORklHX0VST0ZTX0ZTX1pJUD15CkNPTkZJR19FUk9GU19GU19aSVBfTFpNQT15
CkNPTkZJR19ORVRXT1JLX0ZJTEVTWVNURU1TPXkKQ09ORklHX05GU19GUz15CkNPTkZJR19ORlNf
VjI9eQpDT05GSUdfTkZTX1YzPXkKIyBDT05GSUdfTkZTX1YzX0FDTCBpcyBub3Qgc2V0CkNPTkZJ
R19ORlNfVjQ9eQpDT05GSUdfTkZTX1Y0XzE9eQpDT05GSUdfTkZTX1Y0XzI9eQpDT05GSUdfUE5G
U19GSUxFX0xBWU9VVD15CkNPTkZJR19QTkZTX0JMT0NLPXkKQ09ORklHX1BORlNfRkxFWEZJTEVf
TEFZT1VUPXkKQ09ORklHX05GU19WNF8xX0lNUExFTUVOVEFUSU9OX0lEX0RPTUFJTj0ia2VybmVs
Lm9yZyIKQ09ORklHX05GU19WNF8xX01JR1JBVElPTj15CiMgQ09ORklHX05GU19GU0NBQ0hFIGlz
IG5vdCBzZXQKQ09ORklHX05GU19VU0VfTEVHQUNZX0ROUz15CkNPTkZJR19ORlNfRElTQUJMRV9V
RFBfU1VQUE9SVD15CiMgQ09ORklHX05GU19WNF8yX1JFQURfUExVUyBpcyBub3Qgc2V0CiMgQ09O
RklHX05GU0QgaXMgbm90IHNldApDT05GSUdfR1JBQ0VfUEVSSU9EPXkKQ09ORklHX0xPQ0tEPXkK
Q09ORklHX0xPQ0tEX1Y0PXkKQ09ORklHX05GU19DT01NT049eQpDT05GSUdfTkZTX1Y0XzJfU1ND
X0hFTFBFUj15CkNPTkZJR19TVU5SUEM9eQpDT05GSUdfU1VOUlBDX0dTUz15CkNPTkZJR19TVU5S
UENfQkFDS0NIQU5ORUw9eQpDT05GSUdfUlBDU0VDX0dTU19LUkI1PXkKIyBDT05GSUdfU1VOUlBD
X0RJU0FCTEVfSU5TRUNVUkVfRU5DVFlQRVMgaXMgbm90IHNldAojIENPTkZJR19TVU5SUENfREVC
VUcgaXMgbm90IHNldApDT05GSUdfQ0VQSF9GUz15CkNPTkZJR19DRVBIX0ZTQ0FDSEU9eQpDT05G
SUdfQ0VQSF9GU19QT1NJWF9BQ0w9eQojIENPTkZJR19DSUZTIGlzIG5vdCBzZXQKIyBDT05GSUdf
U01CX1NFUlZFUiBpcyBub3Qgc2V0CkNPTkZJR19DT0RBX0ZTPXkKQ09ORklHX0FGU19GUz15CkNP
TkZJR19BRlNfREVCVUc9eQpDT05GSUdfQUZTX0ZTQ0FDSEU9eQpDT05GSUdfQUZTX0RFQlVHX0NV
UlNPUj15CiMgQ09ORklHXzlQX0ZTIGlzIG5vdCBzZXQKQ09ORklHX05MUz15CkNPTkZJR19OTFNf
REVGQVVMVD0iaXNvODg1OS0xIgpDT05GSUdfTkxTX0NPREVQQUdFXzQzNz15CkNPTkZJR19OTFNf
Q09ERVBBR0VfNzM3PXkKQ09ORklHX05MU19DT0RFUEFHRV83NzU9eQpDT05GSUdfTkxTX0NPREVQ
QUdFXzg1MD15CkNPTkZJR19OTFNfQ09ERVBBR0VfODUyPXkKQ09ORklHX05MU19DT0RFUEFHRV84
NTU9eQpDT05GSUdfTkxTX0NPREVQQUdFXzg1Nz15CiMgQ09ORklHX05MU19DT0RFUEFHRV84NjAg
aXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODYxIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkxTX0NPREVQQUdFXzg2MiBpcyBub3Qgc2V0CkNPTkZJR19OTFNfQ09ERVBBR0VfODYzPXkKQ09O
RklHX05MU19DT0RFUEFHRV84NjQ9eQojIENPTkZJR19OTFNfQ09ERVBBR0VfODY1IGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg2NiBpcyBub3Qgc2V0CkNPTkZJR19OTFNfQ09ERVBB
R0VfODY5PXkKQ09ORklHX05MU19DT0RFUEFHRV85MzY9eQpDT05GSUdfTkxTX0NPREVQQUdFXzk1
MD15CkNPTkZJR19OTFNfQ09ERVBBR0VfOTMyPXkKIyBDT05GSUdfTkxTX0NPREVQQUdFXzk0OSBp
cyBub3Qgc2V0CkNPTkZJR19OTFNfQ09ERVBBR0VfODc0PXkKIyBDT05GSUdfTkxTX0lTTzg4NTlf
OCBpcyBub3Qgc2V0CkNPTkZJR19OTFNfQ09ERVBBR0VfMTI1MD15CiMgQ09ORklHX05MU19DT0RF
UEFHRV8xMjUxIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0FTQ0lJIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkxTX0lTTzg4NTlfMSBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5XzIgaXMgbm90
IHNldApDT05GSUdfTkxTX0lTTzg4NTlfMz15CkNPTkZJR19OTFNfSVNPODg1OV80PXkKQ09ORklH
X05MU19JU084ODU5XzU9eQpDT05GSUdfTkxTX0lTTzg4NTlfNj15CkNPTkZJR19OTFNfSVNPODg1
OV83PXkKQ09ORklHX05MU19JU084ODU5Xzk9eQojIENPTkZJR19OTFNfSVNPODg1OV8xMyBpcyBu
b3Qgc2V0CkNPTkZJR19OTFNfSVNPODg1OV8xND15CiMgQ09ORklHX05MU19JU084ODU5XzE1IGlz
IG5vdCBzZXQKQ09ORklHX05MU19LT0k4X1I9eQpDT05GSUdfTkxTX0tPSThfVT15CkNPTkZJR19O
TFNfTUFDX1JPTUFOPXkKQ09ORklHX05MU19NQUNfQ0VMVElDPXkKQ09ORklHX05MU19NQUNfQ0VO
VEVVUk89eQpDT05GSUdfTkxTX01BQ19DUk9BVElBTj15CiMgQ09ORklHX05MU19NQUNfQ1lSSUxM
SUMgaXMgbm90IHNldApDT05GSUdfTkxTX01BQ19HQUVMSUM9eQpDT05GSUdfTkxTX01BQ19HUkVF
Sz15CiMgQ09ORklHX05MU19NQUNfSUNFTEFORCBpcyBub3Qgc2V0CkNPTkZJR19OTFNfTUFDX0lO
VUlUPXkKIyBDT05GSUdfTkxTX01BQ19ST01BTklBTiBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19N
QUNfVFVSS0lTSCBpcyBub3Qgc2V0CkNPTkZJR19OTFNfVVRGOD15CkNPTkZJR19ETE09eQojIENP
TkZJR19ETE1fREVCVUcgaXMgbm90IHNldAojIENPTkZJR19VTklDT0RFIGlzIG5vdCBzZXQKQ09O
RklHX0lPX1dRPXkKIyBlbmQgb2YgRmlsZSBzeXN0ZW1zCgojCiMgU2VjdXJpdHkgb3B0aW9ucwoj
CkNPTkZJR19LRVlTPXkKIyBDT05GSUdfS0VZU19SRVFVRVNUX0NBQ0hFIGlzIG5vdCBzZXQKQ09O
RklHX1BFUlNJU1RFTlRfS0VZUklOR1M9eQojIENPTkZJR19CSUdfS0VZUyBpcyBub3Qgc2V0CkNP
TkZJR19UUlVTVEVEX0tFWVM9eQojIENPTkZJR19UUlVTVEVEX0tFWVNfVFBNIGlzIG5vdCBzZXQK
CiMKIyBObyB0cnVzdCBzb3VyY2Ugc2VsZWN0ZWQhCiMKIyBDT05GSUdfRU5DUllQVEVEX0tFWVMg
aXMgbm90IHNldAojIENPTkZJR19LRVlfREhfT1BFUkFUSU9OUyBpcyBub3Qgc2V0CkNPTkZJR19L
RVlfTk9USUZJQ0FUSU9OUz15CkNPTkZJR19TRUNVUklUWV9ETUVTR19SRVNUUklDVD15CiMgQ09O
RklHX1NFQ1VSSVRZIGlzIG5vdCBzZXQKQ09ORklHX1NFQ1VSSVRZRlM9eQpDT05GSUdfSEFWRV9I
QVJERU5FRF9VU0VSQ09QWV9BTExPQ0FUT1I9eQojIENPTkZJR19IQVJERU5FRF9VU0VSQ09QWSBp
cyBub3Qgc2V0CkNPTkZJR19TVEFUSUNfVVNFUk1PREVIRUxQRVI9eQpDT05GSUdfU1RBVElDX1VT
RVJNT0RFSEVMUEVSX1BBVEg9Ii9zYmluL3VzZXJtb2RlLWhlbHBlciIKQ09ORklHX0RFRkFVTFRf
U0VDVVJJVFlfREFDPXkKQ09ORklHX0xTTT0ibGFuZGxvY2ssbG9ja2Rvd24seWFtYSxsb2FkcGlu
LHNhZmVzZXRpZCxpbnRlZ3JpdHksYnBmIgoKIwojIEtlcm5lbCBoYXJkZW5pbmcgb3B0aW9ucwoj
CgojCiMgTWVtb3J5IGluaXRpYWxpemF0aW9uCiMKQ09ORklHX0NDX0hBU19BVVRPX1ZBUl9JTklU
X1BBVFRFUk49eQpDT05GSUdfQ0NfSEFTX0FVVE9fVkFSX0lOSVRfWkVSTz15CiMgQ09ORklHX0lO
SVRfU1RBQ0tfTk9ORSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOSVRfU1RBQ0tfQUxMX1BBVFRFUk4g
aXMgbm90IHNldApDT05GSUdfSU5JVF9TVEFDS19BTExfWkVSTz15CkNPTkZJR19JTklUX09OX0FM
TE9DX0RFRkFVTFRfT049eQojIENPTkZJR19JTklUX09OX0ZSRUVfREVGQVVMVF9PTiBpcyBub3Qg
c2V0CkNPTkZJR19DQ19IQVNfWkVST19DQUxMX1VTRURfUkVHUz15CkNPTkZJR19aRVJPX0NBTExf
VVNFRF9SRUdTPXkKIyBlbmQgb2YgTWVtb3J5IGluaXRpYWxpemF0aW9uCgpDT05GSUdfUkFORFNU
UlVDVF9OT05FPXkKIyBlbmQgb2YgS2VybmVsIGhhcmRlbmluZyBvcHRpb25zCiMgZW5kIG9mIFNl
Y3VyaXR5IG9wdGlvbnMKCkNPTkZJR19YT1JfQkxPQ0tTPXkKQ09ORklHX0FTWU5DX0NPUkU9eQpD
T05GSUdfQVNZTkNfTUVNQ1BZPXkKQ09ORklHX0FTWU5DX1hPUj15CkNPTkZJR19BU1lOQ19QUT15
CkNPTkZJR19BU1lOQ19SQUlENl9SRUNPVj15CkNPTkZJR19DUllQVE89eQoKIwojIENyeXB0byBj
b3JlIG9yIGhlbHBlcgojCkNPTkZJR19DUllQVE9fRklQUz15CkNPTkZJR19DUllQVE9fQUxHQVBJ
PXkKQ09ORklHX0NSWVBUT19BTEdBUEkyPXkKQ09ORklHX0NSWVBUT19BRUFEPXkKQ09ORklHX0NS
WVBUT19BRUFEMj15CkNPTkZJR19DUllQVE9fU0tDSVBIRVI9eQpDT05GSUdfQ1JZUFRPX1NLQ0lQ
SEVSMj15CkNPTkZJR19DUllQVE9fSEFTSD15CkNPTkZJR19DUllQVE9fSEFTSDI9eQpDT05GSUdf
Q1JZUFRPX1JORz15CkNPTkZJR19DUllQVE9fUk5HMj15CkNPTkZJR19DUllQVE9fUk5HX0RFRkFV
TFQ9eQpDT05GSUdfQ1JZUFRPX0FLQ0lQSEVSMj15CkNPTkZJR19DUllQVE9fQUtDSVBIRVI9eQpD
T05GSUdfQ1JZUFRPX0tQUDI9eQpDT05GSUdfQ1JZUFRPX0tQUD15CkNPTkZJR19DUllQVE9fQUNP
TVAyPXkKQ09ORklHX0NSWVBUT19NQU5BR0VSPXkKQ09ORklHX0NSWVBUT19NQU5BR0VSMj15CiMg
Q09ORklHX0NSWVBUT19VU0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX01BTkFHRVJfRElT
QUJMRV9URVNUUyBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fTUFOQUdFUl9FWFRSQV9URVNUUz15
CkNPTkZJR19DUllQVE9fR0YxMjhNVUw9eQpDT05GSUdfQ1JZUFRPX05VTEw9eQpDT05GSUdfQ1JZ
UFRPX05VTEwyPXkKQ09ORklHX0NSWVBUT19DUllQVEQ9eQpDT05GSUdfQ1JZUFRPX0FVVEhFTkM9
eQpDT05GSUdfQ1JZUFRPX0VOR0lORT15CgojCiMgUHVibGljLWtleSBjcnlwdG9ncmFwaHkKIwpD
T05GSUdfQ1JZUFRPX1JTQT15CkNPTkZJR19DUllQVE9fREg9eQojIENPTkZJR19DUllQVE9fREhf
UkZDNzkxOV9HUk9VUFMgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0VDQz15CkNPTkZJR19DUllQ
VE9fRUNESD15CkNPTkZJR19DUllQVE9fRUNEU0E9eQpDT05GSUdfQ1JZUFRPX0VDUkRTQT15CkNP
TkZJR19DUllQVE9fU00yPXkKIyBDT05GSUdfQ1JZUFRPX0NVUlZFMjU1MTkgaXMgbm90IHNldAoK
IwojIEF1dGhlbnRpY2F0ZWQgRW5jcnlwdGlvbiB3aXRoIEFzc29jaWF0ZWQgRGF0YQojCkNPTkZJ
R19DUllQVE9fQ0NNPXkKQ09ORklHX0NSWVBUT19HQ009eQpDT05GSUdfQ1JZUFRPX0NIQUNIQTIw
UE9MWTEzMDU9eQojIENPTkZJR19DUllQVE9fQUVHSVMxMjggaXMgbm90IHNldApDT05GSUdfQ1JZ
UFRPX1NFUUlWPXkKQ09ORklHX0NSWVBUT19FQ0hBSU5JVj15CgojCiMgQmxvY2sgbW9kZXMKIwpD
T05GSUdfQ1JZUFRPX0NCQz15CkNPTkZJR19DUllQVE9fQ0ZCPXkKQ09ORklHX0NSWVBUT19DVFI9
eQpDT05GSUdfQ1JZUFRPX0NUUz15CkNPTkZJR19DUllQVE9fRUNCPXkKIyBDT05GSUdfQ1JZUFRP
X0xSVyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19PRkIgaXMgbm90IHNldApDT05GSUdfQ1JZ
UFRPX1BDQkM9eQpDT05GSUdfQ1JZUFRPX1hUUz15CiMgQ09ORklHX0NSWVBUT19LRVlXUkFQIGlz
IG5vdCBzZXQKQ09ORklHX0NSWVBUT19OSFBPTFkxMzA1PXkKQ09ORklHX0NSWVBUT19BRElBTlRV
TT15CkNPTkZJR19DUllQVE9fRVNTSVY9eQoKIwojIEhhc2ggbW9kZXMKIwpDT05GSUdfQ1JZUFRP
X0NNQUM9eQpDT05GSUdfQ1JZUFRPX0hNQUM9eQpDT05GSUdfQ1JZUFRPX1hDQkM9eQojIENPTkZJ
R19DUllQVE9fVk1BQyBpcyBub3Qgc2V0CgojCiMgRGlnZXN0CiMKQ09ORklHX0NSWVBUT19DUkMz
MkM9eQpDT05GSUdfQ1JZUFRPX0NSQzMyPXkKQ09ORklHX0NSWVBUT19YWEhBU0g9eQpDT05GSUdf
Q1JZUFRPX0JMQUtFMkI9eQojIENPTkZJR19DUllQVE9fQkxBS0UyUyBpcyBub3Qgc2V0CkNPTkZJ
R19DUllQVE9fQ1JDVDEwRElGPXkKQ09ORklHX0NSWVBUT19DUkM2NF9ST0NLU09GVD15CkNPTkZJ
R19DUllQVE9fR0hBU0g9eQpDT05GSUdfQ1JZUFRPX1BPTFkxMzA1PXkKQ09ORklHX0NSWVBUT19N
RDQ9eQpDT05GSUdfQ1JZUFRPX01ENT15CiMgQ09ORklHX0NSWVBUT19NSUNIQUVMX01JQyBpcyBu
b3Qgc2V0CkNPTkZJR19DUllQVE9fUk1EMTYwPXkKQ09ORklHX0NSWVBUT19TSEExPXkKQ09ORklH
X0NSWVBUT19TSEEyNTY9eQpDT05GSUdfQ1JZUFRPX1NIQTUxMj15CiMgQ09ORklHX0NSWVBUT19T
SEEzIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19TTTM9eQojIENPTkZJR19DUllQVE9fU00zX0dF
TkVSSUMgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1NUUkVFQk9HPXkKQ09ORklHX0NSWVBUT19X
UDUxMj15CgojCiMgQ2lwaGVycwojCkNPTkZJR19DUllQVE9fQUVTPXkKQ09ORklHX0NSWVBUT19B
RVNfVEk9eQojIENPTkZJR19DUllQVE9fQU5VQklTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRP
X0FSQzQgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0JMT1dGSVNIPXkKQ09ORklHX0NSWVBUT19C
TE9XRklTSF9DT01NT049eQpDT05GSUdfQ1JZUFRPX0NBTUVMTElBPXkKQ09ORklHX0NSWVBUT19D
QVNUX0NPTU1PTj15CkNPTkZJR19DUllQVE9fQ0FTVDU9eQojIENPTkZJR19DUllQVE9fQ0FTVDYg
aXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0RFUz15CiMgQ09ORklHX0NSWVBUT19GQ1JZUFQgaXMg
bm90IHNldApDT05GSUdfQ1JZUFRPX0tIQVpBRD15CkNPTkZJR19DUllQVE9fQ0hBQ0hBMjA9eQoj
IENPTkZJR19DUllQVE9fU0VFRCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19TRVJQRU5UIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1NNNF9HRU5FUklDIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q1JZUFRPX1RFQSBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fVFdPRklTSD15CkNPTkZJR19DUllQ
VE9fVFdPRklTSF9DT01NT049eQoKIwojIENvbXByZXNzaW9uCiMKQ09ORklHX0NSWVBUT19ERUZM
QVRFPXkKQ09ORklHX0NSWVBUT19MWk89eQojIENPTkZJR19DUllQVE9fODQyIGlzIG5vdCBzZXQK
Q09ORklHX0NSWVBUT19MWjQ9eQpDT05GSUdfQ1JZUFRPX0xaNEhDPXkKQ09ORklHX0NSWVBUT19a
U1REPXkKCiMKIyBSYW5kb20gTnVtYmVyIEdlbmVyYXRpb24KIwojIENPTkZJR19DUllQVE9fQU5T
SV9DUFJORyBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fRFJCR19NRU5VPXkKQ09ORklHX0NSWVBU
T19EUkJHX0hNQUM9eQojIENPTkZJR19DUllQVE9fRFJCR19IQVNIIGlzIG5vdCBzZXQKQ09ORklH
X0NSWVBUT19EUkJHX0NUUj15CkNPTkZJR19DUllQVE9fRFJCRz15CkNPTkZJR19DUllQVE9fSklU
VEVSRU5UUk9QWT15CkNPTkZJR19DUllQVE9fVVNFUl9BUEk9eQpDT05GSUdfQ1JZUFRPX1VTRVJf
QVBJX0hBU0g9eQpDT05GSUdfQ1JZUFRPX1VTRVJfQVBJX1NLQ0lQSEVSPXkKIyBDT05GSUdfQ1JZ
UFRPX1VTRVJfQVBJX1JORyBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fVVNFUl9BUElfQUVBRD15
CkNPTkZJR19DUllQVE9fVVNFUl9BUElfRU5BQkxFX09CU09MRVRFPXkKQ09ORklHX0NSWVBUT19I
QVNIX0lORk89eQpDT05GSUdfQ1JZUFRPX0hXPXkKIyBDT05GSUdfQ1JZUFRPX0RFVl9BTExXSU5O
RVIgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVWX0VYWU5PU19STkcgaXMgbm90IHNldAoj
IENPTkZJR19DUllQVE9fREVWX1M1UCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfQVRN
RUxfQUVTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9BVE1FTF9UREVTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9BVE1FTF9TSEEgaXMgbm90IHNldApDT05GSUdfQ1JZUFRP
X0RFVl9BVE1FTF9JMkM9eQpDT05GSUdfQ1JZUFRPX0RFVl9BVE1FTF9FQ0M9eQpDT05GSUdfQ1JZ
UFRPX0RFVl9BVE1FTF9TSEEyMDRBPXkKIyBDT05GSUdfQ1JZUFRPX0RFVl9RQ0UgaXMgbm90IHNl
dAojIENPTkZJR19DUllQVE9fREVWX1FDT01fUk5HIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRP
X0RFVl9JTUdURUNfSEFTSCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfWllOUU1QX0FF
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfWllOUU1QX1NIQTMgaXMgbm90IHNldApD
T05GSUdfQ1JZUFRPX0RFVl9WSVJUSU89eQojIENPTkZJR19DUllQVE9fREVWX1NBRkVYQ0VMIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9DQ1JFRSBpcyBub3Qgc2V0CiMgQ09ORklHX0NS
WVBUT19ERVZfSElTSV9TRUMgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0RFVl9BTUxPR0lDX0dY
TD15CkNPTkZJR19DUllQVE9fREVWX0FNTE9HSUNfR1hMX0RFQlVHPXkKIyBDT05GSUdfQ1JZUFRP
X0RFVl9TQTJVTCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfS0VFTUJBWV9PQ1NfQUVT
X1NNNCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfS0VFTUJBWV9PQ1NfRUNDIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9LRUVNQkFZX09DU19IQ1UgaXMgbm90IHNldApDT05G
SUdfQVNZTU1FVFJJQ19LRVlfVFlQRT15CkNPTkZJR19BU1lNTUVUUklDX1BVQkxJQ19LRVlfU1VC
VFlQRT15CkNPTkZJR19YNTA5X0NFUlRJRklDQVRFX1BBUlNFUj15CkNPTkZJR19QS0NTOF9QUklW
QVRFX0tFWV9QQVJTRVI9eQpDT05GSUdfUEtDUzdfTUVTU0FHRV9QQVJTRVI9eQpDT05GSUdfUEtD
UzdfVEVTVF9LRVk9eQojIENPTkZJR19TSUdORURfUEVfRklMRV9WRVJJRklDQVRJT04gaXMgbm90
IHNldAoKIwojIENlcnRpZmljYXRlcyBmb3Igc2lnbmF0dXJlIGNoZWNraW5nCiMKQ09ORklHX1NZ
U1RFTV9UUlVTVEVEX0tFWVJJTkc9eQpDT05GSUdfU1lTVEVNX1RSVVNURURfS0VZUz0iIgojIENP
TkZJR19TWVNURU1fRVhUUkFfQ0VSVElGSUNBVEUgaXMgbm90IHNldApDT05GSUdfU0VDT05EQVJZ
X1RSVVNURURfS0VZUklORz15CkNPTkZJR19TWVNURU1fQkxBQ0tMSVNUX0tFWVJJTkc9eQpDT05G
SUdfU1lTVEVNX0JMQUNLTElTVF9IQVNIX0xJU1Q9IiIKQ09ORklHX1NZU1RFTV9SRVZPQ0FUSU9O
X0xJU1Q9eQpDT05GSUdfU1lTVEVNX1JFVk9DQVRJT05fS0VZUz0iIgojIENPTkZJR19TWVNURU1f
QkxBQ0tMSVNUX0FVVEhfVVBEQVRFIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ2VydGlmaWNhdGVzIGZv
ciBzaWduYXR1cmUgY2hlY2tpbmcKCkNPTkZJR19CSU5BUllfUFJJTlRGPXkKCiMKIyBMaWJyYXJ5
IHJvdXRpbmVzCiMKQ09ORklHX1JBSUQ2X1BRPXkKQ09ORklHX1JBSUQ2X1BRX0JFTkNITUFSSz15
CkNPTkZJR19MSU5FQVJfUkFOR0VTPXkKQ09ORklHX1BBQ0tJTkc9eQpDT05GSUdfQklUUkVWRVJT
RT15CkNPTkZJR19HRU5FUklDX1NUUk5DUFlfRlJPTV9VU0VSPXkKQ09ORklHX0dFTkVSSUNfU1RS
TkxFTl9VU0VSPXkKQ09ORklHX0dFTkVSSUNfTkVUX1VUSUxTPXkKIyBDT05GSUdfQ09SRElDIGlz
IG5vdCBzZXQKQ09ORklHX1BSSU1FX05VTUJFUlM9eQpDT05GSUdfUkFUSU9OQUw9eQpDT05GSUdf
R0VORVJJQ19QQ0lfSU9NQVA9eQpDT05GSUdfR0VORVJJQ19JT01BUD15CgojCiMgQ3J5cHRvIGxp
YnJhcnkgcm91dGluZXMKIwpDT05GSUdfQ1JZUFRPX0xJQl9BRVM9eQpDT05GSUdfQ1JZUFRPX0xJ
Ql9BUkM0PXkKQ09ORklHX0NSWVBUT19MSUJfQkxBS0UyU19HRU5FUklDPXkKQ09ORklHX0NSWVBU
T19MSUJfQ0hBQ0hBX0dFTkVSSUM9eQpDT05GSUdfQ1JZUFRPX0xJQl9DSEFDSEE9eQojIENPTkZJ
R19DUllQVE9fTElCX0NVUlZFMjU1MTkgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0xJQl9ERVM9
eQpDT05GSUdfQ1JZUFRPX0xJQl9QT0xZMTMwNV9SU0laRT0xCkNPTkZJR19DUllQVE9fTElCX1BP
TFkxMzA1X0dFTkVSSUM9eQpDT05GSUdfQ1JZUFRPX0xJQl9QT0xZMTMwNT15CkNPTkZJR19DUllQ
VE9fTElCX0NIQUNIQTIwUE9MWTEzMDU9eQpDT05GSUdfQ1JZUFRPX0xJQl9TSEEyNTY9eQojIGVu
ZCBvZiBDcnlwdG8gbGlicmFyeSByb3V0aW5lcwoKQ09ORklHX0NSQ19DQ0lUVD15CkNPTkZJR19D
UkMxNj15CkNPTkZJR19DUkNfVDEwRElGPXkKQ09ORklHX0NSQzY0X1JPQ0tTT0ZUPXkKQ09ORklH
X0NSQ19JVFVfVD15CkNPTkZJR19DUkMzMj15CkNPTkZJR19DUkMzMl9TRUxGVEVTVD15CiMgQ09O
RklHX0NSQzMyX1NMSUNFQlk4IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JDMzJfU0xJQ0VCWTQgaXMg
bm90IHNldApDT05GSUdfQ1JDMzJfU0FSV0FURT15CiMgQ09ORklHX0NSQzMyX0JJVCBpcyBub3Qg
c2V0CkNPTkZJR19DUkM2ND15CkNPTkZJR19DUkM0PXkKQ09ORklHX0NSQzc9eQpDT05GSUdfTElC
Q1JDMzJDPXkKQ09ORklHX0NSQzg9eQpDT05GSUdfWFhIQVNIPXkKQ09ORklHX1JBTkRPTTMyX1NF
TEZURVNUPXkKQ09ORklHX1pMSUJfSU5GTEFURT15CkNPTkZJR19aTElCX0RFRkxBVEU9eQpDT05G
SUdfTFpPX0NPTVBSRVNTPXkKQ09ORklHX0xaT19ERUNPTVBSRVNTPXkKQ09ORklHX0xaNF9DT01Q
UkVTUz15CkNPTkZJR19MWjRIQ19DT01QUkVTUz15CkNPTkZJR19MWjRfREVDT01QUkVTUz15CkNP
TkZJR19aU1REX0NPTVBSRVNTPXkKQ09ORklHX1pTVERfREVDT01QUkVTUz15CkNPTkZJR19YWl9E
RUM9eQpDT05GSUdfWFpfREVDX1g4Nj15CkNPTkZJR19YWl9ERUNfUE9XRVJQQz15CkNPTkZJR19Y
Wl9ERUNfSUE2ND15CkNPTkZJR19YWl9ERUNfQVJNPXkKQ09ORklHX1haX0RFQ19BUk1USFVNQj15
CkNPTkZJR19YWl9ERUNfU1BBUkM9eQpDT05GSUdfWFpfREVDX01JQ1JPTFpNQT15CkNPTkZJR19Y
Wl9ERUNfQkNKPXkKQ09ORklHX1haX0RFQ19URVNUPXkKQ09ORklHX0RFQ09NUFJFU1NfQlpJUDI9
eQpDT05GSUdfREVDT01QUkVTU19MWk1BPXkKQ09ORklHX0RFQ09NUFJFU1NfWFo9eQpDT05GSUdf
REVDT01QUkVTU19MWjQ9eQpDT05GSUdfREVDT01QUkVTU19aU1REPXkKQ09ORklHX0dFTkVSSUNf
QUxMT0NBVE9SPXkKQ09ORklHX1JFRURfU09MT01PTj15CkNPTkZJR19SRUVEX1NPTE9NT05fREVD
OD15CkNPTkZJR19JTlRFUlZBTF9UUkVFPXkKQ09ORklHX0FTU09DSUFUSVZFX0FSUkFZPXkKQ09O
RklHX0hBU19JT01FTT15CkNPTkZJR19IQVNfRE1BPXkKQ09ORklHX0RNQV9ERUNMQVJFX0NPSEVS
RU5UPXkKQ09ORklHX0FSQ0hfSEFTX1NZTkNfRE1BX0ZPUl9ERVZJQ0U9eQojIENPTkZJR19ETUFf
QVBJX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1BX01BUF9CRU5DSE1BUksgaXMgbm90IHNl
dApDT05GSUdfU0dMX0FMTE9DPXkKQ09ORklHX0RRTD15CkNPTkZJR19HTE9CPXkKQ09ORklHX0dM
T0JfU0VMRlRFU1Q9eQpDT05GSUdfTkxBVFRSPXkKQ09ORklHX0dFTkVSSUNfQVRPTUlDNjQ9eQpD
T05GSUdfQ0xaX1RBQj15CkNPTkZJR19JUlFfUE9MTD15CkNPTkZJR19NUElMSUI9eQpDT05GSUdf
RElNTElCPXkKQ09ORklHX0xJQkZEVD15CkNPTkZJR19PSURfUkVHSVNUUlk9eQpDT05GSUdfRk9O
VF9TVVBQT1JUPXkKIyBDT05GSUdfRk9OVFMgaXMgbm90IHNldApDT05GSUdfRk9OVF84eDg9eQpD
T05GSUdfRk9OVF84eDE2PXkKQ09ORklHX1NHX1BPT0w9eQpDT05GSUdfU1RBQ0tERVBPVD15CkNP
TkZJR19TVEFDS19IQVNIX09SREVSPTIwCkNPTkZJR19SRUZfVFJBQ0tFUj15CkNPTkZJR19TQklU
TUFQPXkKIyBDT05GSUdfUEFSTUFOIGlzIG5vdCBzZXQKIyBDT05GSUdfT0JKQUdHIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgTGlicmFyeSByb3V0aW5lcwoKIwojIEtlcm5lbCBoYWNraW5nCiMKCiMKIyBw
cmludGsgYW5kIGRtZXNnIG9wdGlvbnMKIwojIENPTkZJR19QUklOVEtfVElNRSBpcyBub3Qgc2V0
CiMgQ09ORklHX1BSSU5US19DQUxMRVIgaXMgbm90IHNldApDT05GSUdfU1RBQ0tUUkFDRV9CVUlM
RF9JRD15CkNPTkZJR19DT05TT0xFX0xPR0xFVkVMX0RFRkFVTFQ9NwpDT05GSUdfQ09OU09MRV9M
T0dMRVZFTF9RVUlFVD00CkNPTkZJR19NRVNTQUdFX0xPR0xFVkVMX0RFRkFVTFQ9NAojIENPTkZJ
R19EWU5BTUlDX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfRFlOQU1JQ19ERUJVR19DT1JFIGlz
IG5vdCBzZXQKQ09ORklHX1NZTUJPTElDX0VSUk5BTUU9eQojIGVuZCBvZiBwcmludGsgYW5kIGRt
ZXNnIG9wdGlvbnMKCkNPTkZJR19ERUJVR19LRVJORUw9eQojIENPTkZJR19ERUJVR19NSVNDIGlz
IG5vdCBzZXQKCiMKIyBDb21waWxlLXRpbWUgY2hlY2tzIGFuZCBjb21waWxlciBvcHRpb25zCiMK
Q09ORklHX0RFQlVHX0lORk89eQojIENPTkZJR19ERUJVR19JTkZPX05PTkUgaXMgbm90IHNldApD
T05GSUdfREVCVUdfSU5GT19EV0FSRl9UT09MQ0hBSU5fREVGQVVMVD15CiMgQ09ORklHX0RFQlVH
X0lORk9fRFdBUkY0IGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfSU5GT19EV0FSRjUgaXMgbm90
IHNldAojIENPTkZJR19ERUJVR19JTkZPX1JFRFVDRUQgaXMgbm90IHNldAojIENPTkZJR19ERUJV
R19JTkZPX0NPTVBSRVNTRUQgaXMgbm90IHNldApDT05GSUdfREVCVUdfSU5GT19TUExJVD15CkNP
TkZJR19QQUhPTEVfSEFTX1NQTElUX0JURj15CkNPTkZJR19HREJfU0NSSVBUUz15CkNPTkZJR19G
UkFNRV9XQVJOPTEwMjQKQ09ORklHX1NUUklQX0FTTV9TWU1TPXkKQ09ORklHX1JFQURBQkxFX0FT
TT15CiMgQ09ORklHX0hFQURFUlNfSU5TVEFMTCBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19TRUNU
SU9OX01JU01BVENIPXkKQ09ORklHX1NFQ1RJT05fTUlTTUFUQ0hfV0FSTl9PTkxZPXkKQ09ORklH
X0FSQ0hfV0FOVF9GUkFNRV9QT0lOVEVSUz15CkNPTkZJR19GUkFNRV9QT0lOVEVSPXkKQ09ORklH
X0RFQlVHX0ZPUkNFX1dFQUtfUEVSX0NQVT15CiMgZW5kIG9mIENvbXBpbGUtdGltZSBjaGVja3Mg
YW5kIGNvbXBpbGVyIG9wdGlvbnMKCiMKIyBHZW5lcmljIEtlcm5lbCBEZWJ1Z2dpbmcgSW5zdHJ1
bWVudHMKIwojIENPTkZJR19NQUdJQ19TWVNSUSBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19GUz15
CkNPTkZJR19ERUJVR19GU19BTExPV19BTEw9eQojIENPTkZJR19ERUJVR19GU19ESVNBTExPV19N
T1VOVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0ZTX0FMTE9XX05PTkUgaXMgbm90IHNldApD
T05GSUdfVUJTQU49eQpDT05GSUdfQ0NfSEFTX1VCU0FOX0JPVU5EUz15CiMgQ09ORklHX1VCU0FO
X0JPVU5EUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VCU0FOX1NISUZUIGlzIG5vdCBzZXQKIyBDT05G
SUdfVUJTQU5fRElWX1pFUk8gaXMgbm90IHNldApDT05GSUdfVUJTQU5fVU5SRUFDSEFCTEU9eQoj
IENPTkZJR19VQlNBTl9CT09MIGlzIG5vdCBzZXQKQ09ORklHX1VCU0FOX0VOVU09eQpDT05GSUdf
SEFWRV9LQ1NBTl9DT01QSUxFUj15CiMgZW5kIG9mIEdlbmVyaWMgS2VybmVsIERlYnVnZ2luZyBJ
bnN0cnVtZW50cwoKIwojIE5ldHdvcmtpbmcgRGVidWdnaW5nCiMKQ09ORklHX05FVF9ERVZfUkVG
Q05UX1RSQUNLRVI9eQojIENPTkZJR19ORVRfTlNfUkVGQ05UX1RSQUNLRVIgaXMgbm90IHNldApD
T05GSUdfREVCVUdfTkVUPXkKIyBlbmQgb2YgTmV0d29ya2luZyBEZWJ1Z2dpbmcKCiMKIyBNZW1v
cnkgRGVidWdnaW5nCiMKQ09ORklHX1BBR0VfRVhURU5TSU9OPXkKQ09ORklHX0RFQlVHX1BBR0VB
TExPQz15CiMgQ09ORklHX0RFQlVHX1BBR0VBTExPQ19FTkFCTEVfREVGQVVMVCBpcyBub3Qgc2V0
CkNPTkZJR19ERUJVR19TTEFCPXkKQ09ORklHX1BBR0VfT1dORVI9eQpDT05GSUdfUEFHRV9QT0lT
T05JTkc9eQpDT05GSUdfREVCVUdfUEFHRV9SRUY9eQpDT05GSUdfREVCVUdfT0JKRUNUUz15CiMg
Q09ORklHX0RFQlVHX09CSkVDVFNfU0VMRlRFU1QgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19P
QkpFQ1RTX0ZSRUUgaXMgbm90IHNldApDT05GSUdfREVCVUdfT0JKRUNUU19USU1FUlM9eQojIENP
TkZJR19ERUJVR19PQkpFQ1RTX1dPUksgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19PQkpFQ1RT
X1JDVV9IRUFEIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfT0JKRUNUU19QRVJDUFVfQ09VTlRF
UiBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19PQkpFQ1RTX0VOQUJMRV9ERUZBVUxUPTEKQ09ORklH
X0RFQlVHX1NUQUNLX1VTQUdFPXkKIyBDT05GSUdfU0NIRURfU1RBQ0tfRU5EX0NIRUNLIGlzIG5v
dCBzZXQKQ09ORklHX0RFQlVHX1ZNPXkKQ09ORklHX0RFQlVHX1ZNX1ZNQUNBQ0hFPXkKQ09ORklH
X0RFQlVHX1ZNX1JCPXkKIyBDT05GSUdfREVCVUdfVk1fUEdGTEFHUyBpcyBub3Qgc2V0CkNPTkZJ
R19ERUJVR19NRU1PUllfSU5JVD15CkNPTkZJR19IQVZFX0RFQlVHX1NUQUNLT1ZFUkZMT1c9eQoj
IENPTkZJR19ERUJVR19TVEFDS09WRVJGTE9XIGlzIG5vdCBzZXQKQ09ORklHX0NDX0hBU19XT1JL
SU5HX05PU0FOSVRJWkVfQUREUkVTUz15CiMgZW5kIG9mIE1lbW9yeSBEZWJ1Z2dpbmcKCkNPTkZJ
R19ERUJVR19TSElSUT15CgojCiMgRGVidWcgT29wcywgTG9ja3VwcyBhbmQgSGFuZ3MKIwpDT05G
SUdfUEFOSUNfT05fT09QUz15CkNPTkZJR19QQU5JQ19PTl9PT1BTX1ZBTFVFPTEKQ09ORklHX1BB
TklDX1RJTUVPVVQ9MAojIENPTkZJR19TT0ZUTE9DS1VQX0RFVEVDVE9SIGlzIG5vdCBzZXQKQ09O
RklHX0RFVEVDVF9IVU5HX1RBU0s9eQpDT05GSUdfREVGQVVMVF9IVU5HX1RBU0tfVElNRU9VVD0x
MjAKQ09ORklHX0JPT1RQQVJBTV9IVU5HX1RBU0tfUEFOSUM9eQpDT05GSUdfV1FfV0FUQ0hET0c9
eQojIGVuZCBvZiBEZWJ1ZyBPb3BzLCBMb2NrdXBzIGFuZCBIYW5ncwoKIwojIFNjaGVkdWxlciBE
ZWJ1Z2dpbmcKIwpDT05GSUdfU0NIRURfREVCVUc9eQpDT05GSUdfU0NIRURfSU5GTz15CkNPTkZJ
R19TQ0hFRFNUQVRTPXkKIyBlbmQgb2YgU2NoZWR1bGVyIERlYnVnZ2luZwoKIyBDT05GSUdfREVC
VUdfVElNRUtFRVBJTkcgaXMgbm90IHNldAoKIwojIExvY2sgRGVidWdnaW5nIChzcGlubG9ja3Ms
IG11dGV4ZXMsIGV0Yy4uLikKIwpDT05GSUdfTE9DS19ERUJVR0dJTkdfU1VQUE9SVD15CkNPTkZJ
R19QUk9WRV9MT0NLSU5HPXkKQ09ORklHX1BST1ZFX1JBV19MT0NLX05FU1RJTkc9eQojIENPTkZJ
R19MT0NLX1NUQVQgaXMgbm90IHNldApDT05GSUdfREVCVUdfUlRfTVVURVhFUz15CkNPTkZJR19E
RUJVR19TUElOTE9DSz15CkNPTkZJR19ERUJVR19NVVRFWEVTPXkKQ09ORklHX0RFQlVHX1dXX01V
VEVYX1NMT1dQQVRIPXkKQ09ORklHX0RFQlVHX1JXU0VNUz15CkNPTkZJR19ERUJVR19MT0NLX0FM
TE9DPXkKQ09ORklHX0xPQ0tERVA9eQpDT05GSUdfTE9DS0RFUF9CSVRTPTE1CkNPTkZJR19MT0NL
REVQX0NIQUlOU19CSVRTPTE2CkNPTkZJR19MT0NLREVQX1NUQUNLX1RSQUNFX0JJVFM9MTkKQ09O
RklHX0xPQ0tERVBfU1RBQ0tfVFJBQ0VfSEFTSF9CSVRTPTE0CkNPTkZJR19MT0NLREVQX0NJUkNV
TEFSX1FVRVVFX0JJVFM9MTIKQ09ORklHX0RFQlVHX0xPQ0tERVA9eQojIENPTkZJR19ERUJVR19B
VE9NSUNfU0xFRVAgaXMgbm90IHNldApDT05GSUdfREVCVUdfTE9DS0lOR19BUElfU0VMRlRFU1RT
PXkKQ09ORklHX0xPQ0tfVE9SVFVSRV9URVNUPXkKQ09ORklHX1dXX01VVEVYX1NFTEZURVNUPXkK
Q09ORklHX1NDRl9UT1JUVVJFX1RFU1Q9eQojIGVuZCBvZiBMb2NrIERlYnVnZ2luZyAoc3Bpbmxv
Y2tzLCBtdXRleGVzLCBldGMuLi4pCgpDT05GSUdfVFJBQ0VfSVJRRkxBR1M9eQpDT05GSUdfREVC
VUdfSVJRRkxBR1M9eQpDT05GSUdfU1RBQ0tUUkFDRT15CkNPTkZJR19XQVJOX0FMTF9VTlNFRURF
RF9SQU5ET009eQpDT05GSUdfREVCVUdfS09CSkVDVD15CiMgQ09ORklHX0RFQlVHX0tPQkpFQ1Rf
UkVMRUFTRSBpcyBub3Qgc2V0CgojCiMgRGVidWcga2VybmVsIGRhdGEgc3RydWN0dXJlcwojCkNP
TkZJR19ERUJVR19MSVNUPXkKIyBDT05GSUdfREVCVUdfUExJU1QgaXMgbm90IHNldApDT05GSUdf
REVCVUdfU0c9eQojIENPTkZJR19ERUJVR19OT1RJRklFUlMgaXMgbm90IHNldAojIENPTkZJR19C
VUdfT05fREFUQV9DT1JSVVBUSU9OIGlzIG5vdCBzZXQKIyBlbmQgb2YgRGVidWcga2VybmVsIGRh
dGEgc3RydWN0dXJlcwoKQ09ORklHX0RFQlVHX0NSRURFTlRJQUxTPXkKCiMKIyBSQ1UgRGVidWdn
aW5nCiMKQ09ORklHX1BST1ZFX1JDVT15CkNPTkZJR19QUk9WRV9SQ1VfTElTVD15CkNPTkZJR19U
T1JUVVJFX1RFU1Q9eQpDT05GSUdfUkNVX1NDQUxFX1RFU1Q9eQpDT05GSUdfUkNVX1RPUlRVUkVf
VEVTVD15CkNPTkZJR19SQ1VfUkVGX1NDQUxFX1RFU1Q9eQojIENPTkZJR19SQ1VfVFJBQ0UgaXMg
bm90IHNldAojIENPTkZJR19SQ1VfRVFTX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfUkNVX1NU
UklDVF9HUkFDRV9QRVJJT0QgaXMgbm90IHNldAojIGVuZCBvZiBSQ1UgRGVidWdnaW5nCgojIENP
TkZJR19ERUJVR19XUV9GT1JDRV9SUl9DUFUgaXMgbm90IHNldApDT05GSUdfTEFURU5DWVRPUD15
CkNPTkZJR19OT1BfVFJBQ0VSPXkKQ09ORklHX1RSQUNFX0NMT0NLPXkKQ09ORklHX1JJTkdfQlVG
RkVSPXkKQ09ORklHX0VWRU5UX1RSQUNJTkc9eQpDT05GSUdfQ09OVEVYVF9TV0lUQ0hfVFJBQ0VS
PXkKQ09ORklHX1BSRUVNUFRJUlFfVFJBQ0VQT0lOVFM9eQpDT05GSUdfVFJBQ0lORz15CkNPTkZJ
R19UUkFDSU5HX1NVUFBPUlQ9eQojIENPTkZJR19GVFJBQ0UgaXMgbm90IHNldAojIENPTkZJR19T
QU1QTEVTIGlzIG5vdCBzZXQKCiMKIyBvcGVucmlzYyBEZWJ1Z2dpbmcKIwojIGVuZCBvZiBvcGVu
cmlzYyBEZWJ1Z2dpbmcKCiMKIyBLZXJuZWwgVGVzdGluZyBhbmQgQ292ZXJhZ2UKIwojIENPTkZJ
R19LVU5JVCBpcyBub3Qgc2V0CkNPTkZJR19OT1RJRklFUl9FUlJPUl9JTkpFQ1RJT049eQpDT05G
SUdfT0ZfUkVDT05GSUdfTk9USUZJRVJfRVJST1JfSU5KRUNUPXkKQ09ORklHX05FVERFVl9OT1RJ
RklFUl9FUlJPUl9JTkpFQ1Q9eQpDT05GSUdfRkFVTFRfSU5KRUNUSU9OPXkKIyBDT05GSUdfRkFJ
TFNMQUIgaXMgbm90IHNldApDT05GSUdfRkFJTF9QQUdFX0FMTE9DPXkKQ09ORklHX0ZBVUxUX0lO
SkVDVElPTl9VU0VSQ09QWT15CkNPTkZJR19GQUlMX01BS0VfUkVRVUVTVD15CkNPTkZJR19GQUlM
X0lPX1RJTUVPVVQ9eQojIENPTkZJR19GQUlMX0ZVVEVYIGlzIG5vdCBzZXQKQ09ORklHX0ZBVUxU
X0lOSkVDVElPTl9ERUJVR19GUz15CkNPTkZJR19GQUlMX01NQ19SRVFVRVNUPXkKIyBDT05GSUdf
RkFVTFRfSU5KRUNUSU9OX1NUQUNLVFJBQ0VfRklMVEVSIGlzIG5vdCBzZXQKQ09ORklHX0NDX0hB
U19TQU5DT1ZfVFJBQ0VfUEM9eQojIENPTkZJR19SVU5USU1FX1RFU1RJTkdfTUVOVSBpcyBub3Qg
c2V0CiMgZW5kIG9mIEtlcm5lbCBUZXN0aW5nIGFuZCBDb3ZlcmFnZQoKIyBDT05GSUdfV0FSTl9N
SVNTSU5HX0RPQ1VNRU5UUyBpcyBub3Qgc2V0CiMgQ09ORklHX1dBUk5fQUJJX0VSUk9SUyBpcyBu
b3Qgc2V0CiMgZW5kIG9mIEtlcm5lbCBoYWNraW5nCg==

--===============8811470757538030454==--

