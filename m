Content-Type: multipart/mixed; boundary="===============4099802558668776929=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7915/mac.c:530 mt7915_mac_fill_rx() error: uninitialized symbol 'msta'.
Date: Mon, 15 Aug 2022 23:06:01 +0800
Message-ID: <202208152309.KWThoihf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4099802558668776929==
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
head:   568035b01cfb107af8d2e4bd2fb9aea22cf5b868
commit: 0880d40871d1d0155c157a68add961d8dbcca2a3 mt76: connac: move mt76_co=
nnac2_reverse_frag0_hdr_trans in mt76-connac module
date:   5 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 5 weeks ago
config: ia64-randconfig-m031-20220814 (https://download.01.org/0day-ci/arch=
ive/20220815/202208152309.KWThoihf-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7915/mac.c:530 mt7915_mac_fill_rx() er=
ror: uninitialized symbol 'msta'.
drivers/net/wireless/mediatek/mt76/mt7921/mac.c:506 mt7921_mac_fill_rx() er=
ror: uninitialized symbol 'msta'.

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7915/mac.c:2108 mt7915_mac_twt_sched_l=
ist_add() error: uninitialized symbol 'start_tsf'.

vim +/msta +530 drivers/net/wireless/mediatek/mt76/mt7915/mac.c

1c9db0aa23fd11 Bo Jiao          2021-12-20  318  =

338330bd26b1fe Felix Fietkau    2021-05-07  319  static int
338330bd26b1fe Felix Fietkau    2021-05-07  320  mt7915_mac_fill_rx(struct =
mt7915_dev *dev, struct sk_buff *skb)
e57b7901469fc0 Ryder Lee        2020-04-25  321  {
e57b7901469fc0 Ryder Lee        2020-04-25  322  	struct mt76_rx_status *st=
atus =3D (struct mt76_rx_status *)skb->cb;
e57b7901469fc0 Ryder Lee        2020-04-25  323  	struct mt76_phy *mphy =3D=
 &dev->mt76.phy;
e57b7901469fc0 Ryder Lee        2020-04-25  324  	struct mt7915_phy *phy =
=3D &dev->phy;
e57b7901469fc0 Ryder Lee        2020-04-25  325  	struct ieee80211_supporte=
d_band *sband;
e57b7901469fc0 Ryder Lee        2020-04-25  326  	__le32 *rxd =3D (__le32 *=
)skb->data;
0d4b6909987723 Ryder Lee        2020-07-01  327  	__le32 *rxv =3D NULL;
94244d2ea50345 Felix Fietkau    2020-12-16  328  	u32 rxd0 =3D le32_to_cpu(=
rxd[0]);
e57b7901469fc0 Ryder Lee        2020-04-25  329  	u32 rxd1 =3D le32_to_cpu(=
rxd[1]);
e57b7901469fc0 Ryder Lee        2020-04-25  330  	u32 rxd2 =3D le32_to_cpu(=
rxd[2]);
e57b7901469fc0 Ryder Lee        2020-04-25  331  	u32 rxd3 =3D le32_to_cpu(=
rxd[3]);
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  332  	u32 rxd4 =3D le32_to_cpu(=
rxd[4]);
94244d2ea50345 Felix Fietkau    2020-12-16  333  	u32 csum_mask =3D MT_RXD0=
_NORMAL_IP_SUM | MT_RXD0_NORMAL_UDP_TCP_SUM;
e57b7901469fc0 Ryder Lee        2020-04-25  334  	bool unicast, insert_ccmp=
_hdr =3D false;
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  335  	u8 remove_pad, amsdu_info;
05268cf1789d99 Lorenzo Bianconi 2022-04-04  336  	u8 mode =3D 0, qos_ctl =
=3D 0;
0880d40871d1d0 Lorenzo Bianconi 2022-06-08  337  	struct mt7915_sta *msta;
90e3abf07c80a7 Felix Fietkau    2020-12-16  338  	bool hdr_trans;
dc5399a50b45fa Xing Song        2021-11-10  339  	u16 hdr_gap;
90e3abf07c80a7 Felix Fietkau    2020-12-16  340  	u16 seq_ctrl =3D 0;
90e3abf07c80a7 Felix Fietkau    2020-12-16  341  	__le16 fc =3D 0;
4550fb9e98104f Felix Fietkau    2022-02-04  342  	int idx;
e57b7901469fc0 Ryder Lee        2020-04-25  343  =

e57b7901469fc0 Ryder Lee        2020-04-25  344  	memset(status, 0, sizeof(=
*status));
e57b7901469fc0 Ryder Lee        2020-04-25  345  =

006b9d4ad5bf04 Bo Jiao          2022-02-09  346  	if ((rxd1 & MT_RXD1_NORMA=
L_BAND_IDX) && !phy->band_idx) {
e57b7901469fc0 Ryder Lee        2020-04-25  347  		mphy =3D dev->mt76.phy2;
e57b7901469fc0 Ryder Lee        2020-04-25  348  		if (!mphy)
e57b7901469fc0 Ryder Lee        2020-04-25  349  			return -EINVAL;
e57b7901469fc0 Ryder Lee        2020-04-25  350  =

e57b7901469fc0 Ryder Lee        2020-04-25  351  		phy =3D mphy->priv;
e57b7901469fc0 Ryder Lee        2020-04-25  352  		status->ext_phy =3D true;
e57b7901469fc0 Ryder Lee        2020-04-25  353  	}
e57b7901469fc0 Ryder Lee        2020-04-25  354  =

e57b7901469fc0 Ryder Lee        2020-04-25  355  	if (!test_bit(MT76_STATE_=
RUNNING, &mphy->state))
e57b7901469fc0 Ryder Lee        2020-04-25  356  		return -EINVAL;
e57b7901469fc0 Ryder Lee        2020-04-25  357  =

cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  358  	if (rxd2 & MT_RXD2_NORMAL=
_AMSDU_ERR)
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  359  		return -EINVAL;
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  360  =

dd28dea52ad937 Xing Song        2021-11-19  361  	hdr_trans =3D rxd2 & MT_R=
XD2_NORMAL_HDR_TRANS;
dd28dea52ad937 Xing Song        2021-11-19  362  	if (hdr_trans && (rxd1 & =
MT_RXD1_NORMAL_CM))
dd28dea52ad937 Xing Song        2021-11-19  363  		return -EINVAL;
dd28dea52ad937 Xing Song        2021-11-19  364  =

dd28dea52ad937 Xing Song        2021-11-19  365  	/* ICV error or CCMP/BIP/=
WPI MIC error */
dd28dea52ad937 Xing Song        2021-11-19  366  	if (rxd1 & MT_RXD1_NORMAL=
_ICV_ERR)
dd28dea52ad937 Xing Song        2021-11-19  367  		status->flag |=3D RX_FLA=
G_ONLY_MONITOR;
dd28dea52ad937 Xing Song        2021-11-19  368  =

e57b7901469fc0 Ryder Lee        2020-04-25  369  	unicast =3D FIELD_GET(MT_=
RXD3_NORMAL_ADDR_TYPE, rxd3) =3D=3D MT_RXD3_NORMAL_U2M;
e57b7901469fc0 Ryder Lee        2020-04-25  370  	idx =3D FIELD_GET(MT_RXD1=
_NORMAL_WLAN_IDX, rxd1);
e57b7901469fc0 Ryder Lee        2020-04-25  371  	status->wcid =3D mt7915_r=
x_get_wcid(dev, idx, unicast);
e57b7901469fc0 Ryder Lee        2020-04-25  372  =

e57b7901469fc0 Ryder Lee        2020-04-25  373  	if (status->wcid) {
e57b7901469fc0 Ryder Lee        2020-04-25  374  		msta =3D container_of(st=
atus->wcid, struct mt7915_sta, wcid);
e57b7901469fc0 Ryder Lee        2020-04-25  375  		spin_lock_bh(&dev->sta_p=
oll_lock);
e57b7901469fc0 Ryder Lee        2020-04-25  376  		if (list_empty(&msta->po=
ll_list))
e57b7901469fc0 Ryder Lee        2020-04-25  377  			list_add_tail(&msta->po=
ll_list, &dev->sta_poll_list);
e57b7901469fc0 Ryder Lee        2020-04-25  378  		spin_unlock_bh(&dev->sta=
_poll_lock);
e57b7901469fc0 Ryder Lee        2020-04-25  379  	}
e57b7901469fc0 Ryder Lee        2020-04-25  380  =

e57b7901469fc0 Ryder Lee        2020-04-25  381  	status->freq =3D mphy->ch=
andef.chan->center_freq;
e57b7901469fc0 Ryder Lee        2020-04-25  382  	status->band =3D mphy->ch=
andef.chan->band;
e57b7901469fc0 Ryder Lee        2020-04-25  383  	if (status->band =3D=3D N=
L80211_BAND_5GHZ)
e57b7901469fc0 Ryder Lee        2020-04-25  384  		sband =3D &mphy->sband_5=
g.sband;
b4d093e321bd15 MeiChia Chiu     2022-03-07  385  	else if (status->band =3D=
=3D NL80211_BAND_6GHZ)
b4d093e321bd15 MeiChia Chiu     2022-03-07  386  		sband =3D &mphy->sband_6=
g.sband;
e57b7901469fc0 Ryder Lee        2020-04-25  387  	else
e57b7901469fc0 Ryder Lee        2020-04-25  388  		sband =3D &mphy->sband_2=
g.sband;
e57b7901469fc0 Ryder Lee        2020-04-25  389  =

e57b7901469fc0 Ryder Lee        2020-04-25  390  	if (!sband->channels)
e57b7901469fc0 Ryder Lee        2020-04-25  391  		return -EINVAL;
e57b7901469fc0 Ryder Lee        2020-04-25  392  =

94244d2ea50345 Felix Fietkau    2020-12-16  393  	if ((rxd0 & csum_mask) =
=3D=3D csum_mask)
94244d2ea50345 Felix Fietkau    2020-12-16  394  		skb->ip_summed =3D CHECK=
SUM_UNNECESSARY;
94244d2ea50345 Felix Fietkau    2020-12-16  395  =

e57b7901469fc0 Ryder Lee        2020-04-25  396  	if (rxd1 & MT_RXD1_NORMAL=
_FCS_ERR)
e57b7901469fc0 Ryder Lee        2020-04-25  397  		status->flag |=3D RX_FLA=
G_FAILED_FCS_CRC;
e57b7901469fc0 Ryder Lee        2020-04-25  398  =

e57b7901469fc0 Ryder Lee        2020-04-25  399  	if (rxd1 & MT_RXD1_NORMAL=
_TKIP_MIC_ERR)
e57b7901469fc0 Ryder Lee        2020-04-25  400  		status->flag |=3D RX_FLA=
G_MMIC_ERROR;
e57b7901469fc0 Ryder Lee        2020-04-25  401  =

e57b7901469fc0 Ryder Lee        2020-04-25  402  	if (FIELD_GET(MT_RXD1_NOR=
MAL_SEC_MODE, rxd1) !=3D 0 &&
e57b7901469fc0 Ryder Lee        2020-04-25  403  	    !(rxd1 & (MT_RXD1_NOR=
MAL_CLM | MT_RXD1_NORMAL_CM))) {
e57b7901469fc0 Ryder Lee        2020-04-25  404  		status->flag |=3D RX_FLA=
G_DECRYPTED;
e57b7901469fc0 Ryder Lee        2020-04-25  405  		status->flag |=3D RX_FLA=
G_IV_STRIPPED;
e57b7901469fc0 Ryder Lee        2020-04-25  406  		status->flag |=3D RX_FLA=
G_MMIC_STRIPPED | RX_FLAG_MIC_STRIPPED;
e57b7901469fc0 Ryder Lee        2020-04-25  407  	}
e57b7901469fc0 Ryder Lee        2020-04-25  408  =

e57b7901469fc0 Ryder Lee        2020-04-25  409  	remove_pad =3D FIELD_GET(=
MT_RXD2_NORMAL_HDR_OFFSET, rxd2);
e57b7901469fc0 Ryder Lee        2020-04-25  410  =

e57b7901469fc0 Ryder Lee        2020-04-25  411  	if (rxd2 & MT_RXD2_NORMAL=
_MAX_LEN_ERROR)
e57b7901469fc0 Ryder Lee        2020-04-25  412  		return -EINVAL;
e57b7901469fc0 Ryder Lee        2020-04-25  413  =

e57b7901469fc0 Ryder Lee        2020-04-25  414  	rxd +=3D 6;
e57b7901469fc0 Ryder Lee        2020-04-25  415  	if (rxd1 & MT_RXD1_NORMAL=
_GROUP_4) {
90e3abf07c80a7 Felix Fietkau    2020-12-16  416  		u32 v0 =3D le32_to_cpu(r=
xd[0]);
90e3abf07c80a7 Felix Fietkau    2020-12-16  417  		u32 v2 =3D le32_to_cpu(r=
xd[2]);
90e3abf07c80a7 Felix Fietkau    2020-12-16  418  =

90e3abf07c80a7 Felix Fietkau    2020-12-16  419  		fc =3D cpu_to_le16(FIELD=
_GET(MT_RXD6_FRAME_CONTROL, v0));
90e3abf07c80a7 Felix Fietkau    2020-12-16  420  		qos_ctl =3D FIELD_GET(MT=
_RXD8_QOS_CTL, v2);
90e3abf07c80a7 Felix Fietkau    2020-12-16  421  		seq_ctrl =3D FIELD_GET(M=
T_RXD8_SEQ_CTRL, v2);
90e3abf07c80a7 Felix Fietkau    2020-12-16  422  =

e57b7901469fc0 Ryder Lee        2020-04-25  423  		rxd +=3D 4;
e57b7901469fc0 Ryder Lee        2020-04-25  424  		if ((u8 *)rxd - skb->dat=
a >=3D skb->len)
e57b7901469fc0 Ryder Lee        2020-04-25  425  			return -EINVAL;
e57b7901469fc0 Ryder Lee        2020-04-25  426  	}
e57b7901469fc0 Ryder Lee        2020-04-25  427  =

e57b7901469fc0 Ryder Lee        2020-04-25  428  	if (rxd1 & MT_RXD1_NORMAL=
_GROUP_1) {
e57b7901469fc0 Ryder Lee        2020-04-25  429  		u8 *data =3D (u8 *)rxd;
e57b7901469fc0 Ryder Lee        2020-04-25  430  =

e57b7901469fc0 Ryder Lee        2020-04-25  431  		if (status->flag & RX_FL=
AG_DECRYPTED) {
c368362c36d3d4 Ryder Lee        2021-06-17  432  			switch (FIELD_GET(MT_RX=
D1_NORMAL_SEC_MODE, rxd1)) {
c368362c36d3d4 Ryder Lee        2021-06-17  433  			case MT_CIPHER_AES_CCMP:
c368362c36d3d4 Ryder Lee        2021-06-17  434  			case MT_CIPHER_CCMP_CCX:
c368362c36d3d4 Ryder Lee        2021-06-17  435  			case MT_CIPHER_CCMP_256:
c368362c36d3d4 Ryder Lee        2021-06-17  436  				insert_ccmp_hdr =3D
c368362c36d3d4 Ryder Lee        2021-06-17  437  					FIELD_GET(MT_RXD2_NOR=
MAL_FRAG, rxd2);
c368362c36d3d4 Ryder Lee        2021-06-17  438  				fallthrough;
c368362c36d3d4 Ryder Lee        2021-06-17  439  			case MT_CIPHER_TKIP:
c368362c36d3d4 Ryder Lee        2021-06-17  440  			case MT_CIPHER_TKIP_NO_=
MIC:
c368362c36d3d4 Ryder Lee        2021-06-17  441  			case MT_CIPHER_GCMP:
c368362c36d3d4 Ryder Lee        2021-06-17  442  			case MT_CIPHER_GCMP_256:
e57b7901469fc0 Ryder Lee        2020-04-25  443  				status->iv[0] =3D data=
[5];
e57b7901469fc0 Ryder Lee        2020-04-25  444  				status->iv[1] =3D data=
[4];
e57b7901469fc0 Ryder Lee        2020-04-25  445  				status->iv[2] =3D data=
[3];
e57b7901469fc0 Ryder Lee        2020-04-25  446  				status->iv[3] =3D data=
[2];
e57b7901469fc0 Ryder Lee        2020-04-25  447  				status->iv[4] =3D data=
[1];
e57b7901469fc0 Ryder Lee        2020-04-25  448  				status->iv[5] =3D data=
[0];
c368362c36d3d4 Ryder Lee        2021-06-17  449  				break;
c368362c36d3d4 Ryder Lee        2021-06-17  450  			default:
c368362c36d3d4 Ryder Lee        2021-06-17  451  				break;
c368362c36d3d4 Ryder Lee        2021-06-17  452  			}
e57b7901469fc0 Ryder Lee        2020-04-25  453  		}
e57b7901469fc0 Ryder Lee        2020-04-25  454  		rxd +=3D 4;
e57b7901469fc0 Ryder Lee        2020-04-25  455  		if ((u8 *)rxd - skb->dat=
a >=3D skb->len)
e57b7901469fc0 Ryder Lee        2020-04-25  456  			return -EINVAL;
e57b7901469fc0 Ryder Lee        2020-04-25  457  	}
e57b7901469fc0 Ryder Lee        2020-04-25  458  =

e57b7901469fc0 Ryder Lee        2020-04-25  459  	if (rxd1 & MT_RXD1_NORMAL=
_GROUP_2) {
0fda6d7bb5a29b Ryder Lee        2021-03-30  460  		status->timestamp =3D le=
32_to_cpu(rxd[0]);
0fda6d7bb5a29b Ryder Lee        2021-03-30  461  		status->flag |=3D RX_FLA=
G_MACTIME_START;
0fda6d7bb5a29b Ryder Lee        2021-03-30  462  =

0fda6d7bb5a29b Ryder Lee        2021-03-30  463  		if (!(rxd2 & MT_RXD2_NOR=
MAL_NON_AMPDU)) {
0fda6d7bb5a29b Ryder Lee        2021-03-30  464  			status->flag |=3D RX_FL=
AG_AMPDU_DETAILS;
0fda6d7bb5a29b Ryder Lee        2021-03-30  465  =

0fda6d7bb5a29b Ryder Lee        2021-03-30  466  			/* all subframes of an =
A-MPDU have the same timestamp */
0fda6d7bb5a29b Ryder Lee        2021-03-30  467  			if (phy->rx_ampdu_ts !=
=3D status->timestamp) {
0fda6d7bb5a29b Ryder Lee        2021-03-30  468  				if (!++phy->ampdu_ref)
0fda6d7bb5a29b Ryder Lee        2021-03-30  469  					phy->ampdu_ref++;
0fda6d7bb5a29b Ryder Lee        2021-03-30  470  			}
0fda6d7bb5a29b Ryder Lee        2021-03-30  471  			phy->rx_ampdu_ts =3D st=
atus->timestamp;
0fda6d7bb5a29b Ryder Lee        2021-03-30  472  =

0fda6d7bb5a29b Ryder Lee        2021-03-30  473  			status->ampdu_ref =3D p=
hy->ampdu_ref;
0fda6d7bb5a29b Ryder Lee        2021-03-30  474  		}
0fda6d7bb5a29b Ryder Lee        2021-03-30  475  =

e57b7901469fc0 Ryder Lee        2020-04-25  476  		rxd +=3D 2;
e57b7901469fc0 Ryder Lee        2020-04-25  477  		if ((u8 *)rxd - skb->dat=
a >=3D skb->len)
e57b7901469fc0 Ryder Lee        2020-04-25  478  			return -EINVAL;
e57b7901469fc0 Ryder Lee        2020-04-25  479  	}
e57b7901469fc0 Ryder Lee        2020-04-25  480  =

e57b7901469fc0 Ryder Lee        2020-04-25  481  	/* RXD Group 3 - P-RXV */
e57b7901469fc0 Ryder Lee        2020-04-25  482  	if (rxd1 & MT_RXD1_NORMAL=
_GROUP_3) {
1c9db0aa23fd11 Bo Jiao          2021-12-20  483  		u32 v0, v1;
1c9db0aa23fd11 Bo Jiao          2021-12-20  484  		int ret;
b62db09aa81c14 Ryder Lee        2020-05-19  485  =

0d4b6909987723 Ryder Lee        2020-07-01  486  		rxv =3D rxd;
e57b7901469fc0 Ryder Lee        2020-04-25  487  		rxd +=3D 2;
e57b7901469fc0 Ryder Lee        2020-04-25  488  		if ((u8 *)rxd - skb->dat=
a >=3D skb->len)
e57b7901469fc0 Ryder Lee        2020-04-25  489  			return -EINVAL;
e57b7901469fc0 Ryder Lee        2020-04-25  490  =

0d4b6909987723 Ryder Lee        2020-07-01  491  		v0 =3D le32_to_cpu(rxv[0=
]);
0d4b6909987723 Ryder Lee        2020-07-01  492  		v1 =3D le32_to_cpu(rxv[1=
]);
b62db09aa81c14 Ryder Lee        2020-05-19  493  =

b62db09aa81c14 Ryder Lee        2020-05-19  494  		if (v0 & MT_PRXV_HT_AD_C=
ODE)
e57b7901469fc0 Ryder Lee        2020-04-25  495  			status->enc_flags |=3D =
RX_ENC_FLAG_LDPC;
e57b7901469fc0 Ryder Lee        2020-04-25  496  =

e57b7901469fc0 Ryder Lee        2020-04-25  497  		status->chains =3D mphy-=
>antenna_mask;
b62db09aa81c14 Ryder Lee        2020-05-19  498  		status->chain_signal[0] =
=3D to_rssi(MT_PRXV_RCPI0, v1);
b62db09aa81c14 Ryder Lee        2020-05-19  499  		status->chain_signal[1] =
=3D to_rssi(MT_PRXV_RCPI1, v1);
b62db09aa81c14 Ryder Lee        2020-05-19  500  		status->chain_signal[2] =
=3D to_rssi(MT_PRXV_RCPI2, v1);
b62db09aa81c14 Ryder Lee        2020-05-19  501  		status->chain_signal[3] =
=3D to_rssi(MT_PRXV_RCPI3, v1);
e57b7901469fc0 Ryder Lee        2020-04-25  502  =

e57b7901469fc0 Ryder Lee        2020-04-25  503  		/* RXD Group 5 - C-RXV */
e57b7901469fc0 Ryder Lee        2020-04-25  504  		if (rxd1 & MT_RXD1_NORMA=
L_GROUP_5) {
e57b7901469fc0 Ryder Lee        2020-04-25  505  			rxd +=3D 18;
e57b7901469fc0 Ryder Lee        2020-04-25  506  			if ((u8 *)rxd - skb->da=
ta >=3D skb->len)
e57b7901469fc0 Ryder Lee        2020-04-25  507  				return -EINVAL;
e57b7901469fc0 Ryder Lee        2020-04-25  508  		}
e57b7901469fc0 Ryder Lee        2020-04-25  509  =

b1481b336d3ccd Wan Jiabing      2022-02-23  510  		if (!is_mt7915(&dev->mt7=
6) || (rxd1 & MT_RXD1_NORMAL_GROUP_5)) {
05268cf1789d99 Lorenzo Bianconi 2022-04-04  511  			ret =3D mt7915_mac_fill=
_rx_rate(dev, status, sband, rxv,
05268cf1789d99 Lorenzo Bianconi 2022-04-04  512  						      &mode);
1c9db0aa23fd11 Bo Jiao          2021-12-20  513  			if (ret < 0)
1c9db0aa23fd11 Bo Jiao          2021-12-20  514  				return ret;
e57b7901469fc0 Ryder Lee        2020-04-25  515  		}
e57b7901469fc0 Ryder Lee        2020-04-25  516  	}
e57b7901469fc0 Ryder Lee        2020-04-25  517  =

cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  518  	amsdu_info =3D FIELD_GET(=
MT_RXD4_NORMAL_PAYLOAD_FORMAT, rxd4);
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  519  	status->amsdu =3D !!amsdu=
_info;
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  520  	if (status->amsdu) {
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  521  		status->first_amsdu =3D =
amsdu_info =3D=3D MT_RXD4_FIRST_AMSDU_FRAME;
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  522  		status->last_amsdu =3D a=
msdu_info =3D=3D MT_RXD4_LAST_AMSDU_FRAME;
dc5399a50b45fa Xing Song        2021-11-10  523  	}
dc5399a50b45fa Xing Song        2021-11-10  524  =

dc5399a50b45fa Xing Song        2021-11-10  525  	hdr_gap =3D (u8 *)rxd - s=
kb->data + 2 * remove_pad;
dc5399a50b45fa Xing Song        2021-11-10  526  	if (hdr_trans && ieee8021=
1_has_morefrags(fc)) {
0880d40871d1d0 Lorenzo Bianconi 2022-06-08  527  		struct ieee80211_vif *vi=
f;
0880d40871d1d0 Lorenzo Bianconi 2022-06-08  528  		int err;
0880d40871d1d0 Lorenzo Bianconi 2022-06-08  529  =

0880d40871d1d0 Lorenzo Bianconi 2022-06-08 @530  		if (!msta || !msta->vif)
dc5399a50b45fa Xing Song        2021-11-10  531  			return -EINVAL;
0880d40871d1d0 Lorenzo Bianconi 2022-06-08  532  =

0880d40871d1d0 Lorenzo Bianconi 2022-06-08  533  		vif =3D container_of((vo=
id *)msta->vif, struct ieee80211_vif,
0880d40871d1d0 Lorenzo Bianconi 2022-06-08  534  				   drv_priv);
0880d40871d1d0 Lorenzo Bianconi 2022-06-08  535  		err =3D mt76_connac2_rev=
erse_frag0_hdr_trans(vif, skb, hdr_gap);
0880d40871d1d0 Lorenzo Bianconi 2022-06-08  536  		if (err)
0880d40871d1d0 Lorenzo Bianconi 2022-06-08  537  			return err;
0880d40871d1d0 Lorenzo Bianconi 2022-06-08  538  =

dc5399a50b45fa Xing Song        2021-11-10  539  		hdr_trans =3D false;
dc5399a50b45fa Xing Song        2021-11-10  540  	} else {
1eeff0b4c1a6c6 Felix Fietkau    2021-11-23  541  		int pad_start =3D 0;
1eeff0b4c1a6c6 Felix Fietkau    2021-11-23  542  =

dc5399a50b45fa Xing Song        2021-11-10  543  		skb_pull(skb, hdr_gap);
dc5399a50b45fa Xing Song        2021-11-10  544  		if (!hdr_trans && status=
->amsdu) {
1eeff0b4c1a6c6 Felix Fietkau    2021-11-23  545  			pad_start =3D ieee80211=
_get_hdrlen_from_skb(skb);
1eeff0b4c1a6c6 Felix Fietkau    2021-11-23  546  		} else if (hdr_trans && =
(rxd2 & MT_RXD2_NORMAL_HDR_TRANS_ERROR)) {
1eeff0b4c1a6c6 Felix Fietkau    2021-11-23  547  			/*
1eeff0b4c1a6c6 Felix Fietkau    2021-11-23  548  			 * When header translat=
ion failure is indicated,
1eeff0b4c1a6c6 Felix Fietkau    2021-11-23  549  			 * the hardware will in=
sert an extra 2-byte field
1eeff0b4c1a6c6 Felix Fietkau    2021-11-23  550  			 * containing the data =
length after the protocol
1eeff0b4c1a6c6 Felix Fietkau    2021-11-23  551  			 * type field.
1eeff0b4c1a6c6 Felix Fietkau    2021-11-23  552  			 */
1eeff0b4c1a6c6 Felix Fietkau    2021-11-23  553  			pad_start =3D 12;
1eeff0b4c1a6c6 Felix Fietkau    2021-11-23  554  			if (get_unaligned_be16(=
skb->data + pad_start) =3D=3D ETH_P_8021Q)
1eeff0b4c1a6c6 Felix Fietkau    2021-11-23  555  				pad_start +=3D 4;
1eeff0b4c1a6c6 Felix Fietkau    2021-11-23  556  =

1eeff0b4c1a6c6 Felix Fietkau    2021-11-23  557  			if (get_unaligned_be16(=
skb->data + pad_start) !=3D
1eeff0b4c1a6c6 Felix Fietkau    2021-11-23  558  			    skb->len - pad_star=
t - 2)
1eeff0b4c1a6c6 Felix Fietkau    2021-11-23  559  				pad_start =3D 0;
1eeff0b4c1a6c6 Felix Fietkau    2021-11-23  560  		}
1eeff0b4c1a6c6 Felix Fietkau    2021-11-23  561  =

1eeff0b4c1a6c6 Felix Fietkau    2021-11-23  562  		if (pad_start) {
1eeff0b4c1a6c6 Felix Fietkau    2021-11-23  563  			memmove(skb->data + 2, =
skb->data, pad_start);
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  564  			skb_pull(skb, 2);
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  565  		}
90e3abf07c80a7 Felix Fietkau    2020-12-16  566  	}
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  567  =

c23fa1bbc5d604 Ryder Lee        2021-11-15  568  	if (!hdr_trans) {
087baf9b6d373f Ryder Lee        2021-12-03  569  		struct ieee80211_hdr *hd=
r;
c23fa1bbc5d604 Ryder Lee        2021-11-15  570  =

c23fa1bbc5d604 Ryder Lee        2021-11-15  571  		if (insert_ccmp_hdr) {
e57b7901469fc0 Ryder Lee        2020-04-25  572  			u8 key_id =3D FIELD_GET=
(MT_RXD1_NORMAL_KEY_ID, rxd1);
e57b7901469fc0 Ryder Lee        2020-04-25  573  =

e57b7901469fc0 Ryder Lee        2020-04-25  574  			mt76_insert_ccmp_hdr(sk=
b, key_id);
e57b7901469fc0 Ryder Lee        2020-04-25  575  		}
e57b7901469fc0 Ryder Lee        2020-04-25  576  =

087baf9b6d373f Ryder Lee        2021-12-03  577  		hdr =3D mt76_skb_get_hdr=
(skb);
90e3abf07c80a7 Felix Fietkau    2020-12-16  578  		fc =3D hdr->frame_contro=
l;
90e3abf07c80a7 Felix Fietkau    2020-12-16  579  		if (ieee80211_is_data_qo=
s(fc)) {
90e3abf07c80a7 Felix Fietkau    2020-12-16  580  			seq_ctrl =3D le16_to_cp=
u(hdr->seq_ctrl);
90e3abf07c80a7 Felix Fietkau    2020-12-16  581  			qos_ctl =3D *ieee80211_=
get_qos_ctl(hdr);
90e3abf07c80a7 Felix Fietkau    2020-12-16  582  		}
90e3abf07c80a7 Felix Fietkau    2020-12-16  583  	} else {
90e3abf07c80a7 Felix Fietkau    2020-12-16  584  		status->flag |=3D RX_FLA=
G_8023;
90e3abf07c80a7 Felix Fietkau    2020-12-16  585  	}
90e3abf07c80a7 Felix Fietkau    2020-12-16  586  =

c23fa1bbc5d604 Ryder Lee        2021-11-15  587  	if (rxv && mode >=3D MT_P=
HY_TYPE_HE_SU && !(status->flag & RX_FLAG_8023))
f71662de66a63e Lorenzo Bianconi 2022-06-08  588  		mt76_connac2_mac_decode_=
he_radiotap(&dev->mt76, skb, rxv, mode);
a82dd24d128d63 Ryder Lee        2020-04-25  589  =

90e3abf07c80a7 Felix Fietkau    2020-12-16  590  	if (!status->wcid || !iee=
e80211_is_data_qos(fc))
e57b7901469fc0 Ryder Lee        2020-04-25  591  		return 0;
e57b7901469fc0 Ryder Lee        2020-04-25  592  =

e57b7901469fc0 Ryder Lee        2020-04-25  593  	status->aggr =3D unicast =
&&
90e3abf07c80a7 Felix Fietkau    2020-12-16  594  		       !ieee80211_is_qos=
_nullfunc(fc);
90e3abf07c80a7 Felix Fietkau    2020-12-16  595  	status->qos_ctl =3D qos_c=
tl;
90e3abf07c80a7 Felix Fietkau    2020-12-16  596  	status->seqno =3D IEEE802=
11_SEQ_TO_SN(seq_ctrl);
e57b7901469fc0 Ryder Lee        2020-04-25  597  =

e57b7901469fc0 Ryder Lee        2020-04-25  598  	return 0;
e57b7901469fc0 Ryder Lee        2020-04-25  599  }
e57b7901469fc0 Ryder Lee        2020-04-25  600  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4099802558668776929==--

