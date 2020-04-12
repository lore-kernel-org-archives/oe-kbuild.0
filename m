Content-Type: multipart/mixed; boundary="===============1927414743875195362=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [frank-w-bpi-r2-4.14:5.6-main 37/41] drivers/net/wireless/mediatek/mt76_new/mt76x02_mac.c:380:28: sparse: expected restricted __le16 [usertype] rate
Date: Mon, 13 Apr 2020 01:35:05 +0800
Message-ID: <202004130158.4qtZa9lD%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1927414743875195362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 5.6-main
head:   1944ca382365022a8bf3895ee49b47f24e810b5d
commit: 53a7ee94e2f945237664b17bf744c9a2889c81de [37/41] mt7622: add mt76 w=
ireless driver folder from openwrt
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-188-g79f7ac98-dirty
        git checkout 53a7ee94e2f945237664b17bf744c9a2889c81de
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 5 hours ago
:::::: commit date: 24 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/net/wireless/mediatek/mt76_new/mt76x02_mac.c:122:17: sparse: spa=
rse: dubious: x & !y
   drivers/net/wireless/mediatek/mt76_new/mt76x02_mac.c:154:16: sparse: spa=
rse: dubious: x & !y
   drivers/net/wireless/mediatek/mt76_new/mt76x02_mac.c:236:19: sparse: spa=
rse: restricted __le16 degrades to integer
   drivers/net/wireless/mediatek/mt76_new/mt76x02_mac.c:236:19: sparse: spa=
rse: cast from restricted __le16
   drivers/net/wireless/mediatek/mt76_new/mt76x02_mac.c:380:28: sparse: spa=
rse: incorrect type in assignment (different base types) @@    expected res=
tricted __le16 [usertype] rate @@    got 6 [usertype] rate @@
>> drivers/net/wireless/mediatek/mt76_new/mt76x02_mac.c:380:28: sparse:    =
expected restricted __le16 [usertype] rate
>> drivers/net/wireless/mediatek/mt76_new/mt76x02_mac.c:380:28: sparse:    =
got unsigned long
--
   drivers/net/wireless/mediatek/mt76_new/mt7615/mac.c:585:17: sparse: spar=
se: incorrect type in assignment (different base types) @@    expected rest=
ricted __le32 [usertype] @@    got 2 [usertype] @@
>> drivers/net/wireless/mediatek/mt76_new/mt7615/mac.c:585:17: sparse:    e=
xpected restricted __le32 [usertype]
>> drivers/net/wireless/mediatek/mt76_new/mt7615/mac.c:585:17: sparse:    g=
ot unsigned long
   drivers/net/wireless/mediatek/mt76_new/mt7615/mac.c:1042:25: sparse: spa=
rse: incorrect type in assignment (different base types) @@    expected res=
tricted __le16 @@    got ricted __le16 @@
   drivers/net/wireless/mediatek/mt76_new/mt7615/mac.c:1042:25: sparse:    =
expected restricted __le16
   drivers/net/wireless/mediatek/mt76_new/mt7615/mac.c:1042:25: sparse:    =
got unsigned long

# https://github.com/frank-w/BPI-R2-4.14/commit/53a7ee94e2f945237664b17bf74=
4c9a2889c81de
git remote add frank-w-bpi-r2-4.14 https://github.com/frank-w/BPI-R2-4.14
git remote update frank-w-bpi-r2-4.14
git checkout 53a7ee94e2f945237664b17bf744c9a2889c81de
vim +380 drivers/net/wireless/mediatek/mt76_new/mt76x02_mac.c

53a7ee94e2f945 Frank Wunderlich 2020-04-11  333  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  334  void mt76x02_mac_write_txw=
i(struct mt76x02_dev *dev, struct mt76x02_txwi *txwi,
53a7ee94e2f945 Frank Wunderlich 2020-04-11  335  			    struct sk_buff *skb=
, struct mt76_wcid *wcid,
53a7ee94e2f945 Frank Wunderlich 2020-04-11  336  			    struct ieee80211_st=
a *sta, int len)
53a7ee94e2f945 Frank Wunderlich 2020-04-11  337  {
53a7ee94e2f945 Frank Wunderlich 2020-04-11  338  	struct ieee80211_hdr *hdr=
 =3D (struct ieee80211_hdr *)skb->data;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  339  	struct ieee80211_tx_info =
*info =3D IEEE80211_SKB_CB(skb);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  340  	struct ieee80211_tx_rate =
*rate =3D &info->control.rates[0];
53a7ee94e2f945 Frank Wunderlich 2020-04-11  341  	struct ieee80211_key_conf=
 *key =3D info->control.hw_key;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  342  	u32 wcid_tx_info;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  343  	u16 rate_ht_mask =3D FIEL=
D_PREP(MT_RXWI_RATE_PHY, BIT(1) | BIT(2));
53a7ee94e2f945 Frank Wunderlich 2020-04-11  344  	u16 txwi_flags =3D 0;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  345  	u8 nss;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  346  	s8 txpwr_adj, max_txpwr_a=
dj;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  347  	u8 ccmp_pn[8], nstreams =
=3D dev->chainmask & 0xf;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  348  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  349  	memset(txwi, 0, sizeof(*t=
xwi));
53a7ee94e2f945 Frank Wunderlich 2020-04-11  350  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  351  	if (!info->control.hw_key=
 && wcid && wcid->hw_key_idx !=3D 0xff &&
53a7ee94e2f945 Frank Wunderlich 2020-04-11  352  	    ieee80211_has_protect=
ed(hdr->frame_control)) {
53a7ee94e2f945 Frank Wunderlich 2020-04-11  353  		wcid =3D NULL;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  354  		ieee80211_get_tx_rates(i=
nfo->control.vif, sta, skb,
53a7ee94e2f945 Frank Wunderlich 2020-04-11  355  				       info->control.r=
ates, 1);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  356  	}
53a7ee94e2f945 Frank Wunderlich 2020-04-11  357  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  358  	if (wcid)
53a7ee94e2f945 Frank Wunderlich 2020-04-11  359  		txwi->wcid =3D wcid->idx;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  360  	else
53a7ee94e2f945 Frank Wunderlich 2020-04-11  361  		txwi->wcid =3D 0xff;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  362  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  363  	if (wcid && wcid->sw_iv &=
& key) {
53a7ee94e2f945 Frank Wunderlich 2020-04-11  364  		u64 pn =3D atomic64_inc_=
return(&key->tx_pn);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  365  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  366  		ccmp_pn[0] =3D pn;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  367  		ccmp_pn[1] =3D pn >> 8;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  368  		ccmp_pn[2] =3D 0;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  369  		ccmp_pn[3] =3D 0x20 | (k=
ey->keyidx << 6);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  370  		ccmp_pn[4] =3D pn >> 16;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  371  		ccmp_pn[5] =3D pn >> 24;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  372  		ccmp_pn[6] =3D pn >> 32;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  373  		ccmp_pn[7] =3D pn >> 40;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  374  		txwi->iv =3D *((__le32 *=
)&ccmp_pn[0]);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  375  		txwi->eiv =3D *((__le32 =
*)&ccmp_pn[4]);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  376  	}
53a7ee94e2f945 Frank Wunderlich 2020-04-11  377  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  378  	if (wcid && (rate->idx < =
0 || !rate->count)) {
53a7ee94e2f945 Frank Wunderlich 2020-04-11  379  		wcid_tx_info =3D wcid->t=
x_info;
53a7ee94e2f945 Frank Wunderlich 2020-04-11 @380  		txwi->rate =3D FIELD_GET=
(MT_WCID_TX_INFO_RATE, wcid_tx_info);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  381  		max_txpwr_adj =3D FIELD_=
GET(MT_WCID_TX_INFO_TXPWR_ADJ,
53a7ee94e2f945 Frank Wunderlich 2020-04-11  382  					  wcid_tx_info);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  383  		nss =3D FIELD_GET(MT_WCI=
D_TX_INFO_NSS, wcid_tx_info);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  384  	} else {
53a7ee94e2f945 Frank Wunderlich 2020-04-11  385  		txwi->rate =3D mt76x02_m=
ac_tx_rate_val(dev, rate, &nss);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  386  		max_txpwr_adj =3D mt76x0=
2_tx_get_max_txpwr_adj(dev, rate);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  387  	}
53a7ee94e2f945 Frank Wunderlich 2020-04-11  388  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  389  	txpwr_adj =3D mt76x02_tx_=
get_txpwr_adj(dev, dev->txpower_conf,
53a7ee94e2f945 Frank Wunderlich 2020-04-11  390  					     max_txpwr_adj);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  391  	txwi->ctl2 =3D FIELD_PREP=
(MT_TX_PWR_ADJ, txpwr_adj);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  392  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  393  	if (nstreams > 1 && mt76_=
rev(&dev->mt76) >=3D MT76XX_REV_E4)
53a7ee94e2f945 Frank Wunderlich 2020-04-11  394  		txwi->txstream =3D 0x13;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  395  	else if (nstreams > 1 && =
mt76_rev(&dev->mt76) >=3D MT76XX_REV_E3 &&
53a7ee94e2f945 Frank Wunderlich 2020-04-11  396  		 !(txwi->rate & cpu_to_l=
e16(rate_ht_mask)))
53a7ee94e2f945 Frank Wunderlich 2020-04-11  397  		txwi->txstream =3D 0x93;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  398  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  399  	if (is_mt76x2(dev) && (in=
fo->flags & IEEE80211_TX_CTL_LDPC))
53a7ee94e2f945 Frank Wunderlich 2020-04-11  400  		txwi->rate |=3D cpu_to_l=
e16(MT_RXWI_RATE_LDPC);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  401  	if ((info->flags & IEEE80=
211_TX_CTL_STBC) && nss =3D=3D 1)
53a7ee94e2f945 Frank Wunderlich 2020-04-11  402  		txwi->rate |=3D cpu_to_l=
e16(MT_RXWI_RATE_STBC);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  403  	if (nss > 1 && sta && sta=
->smps_mode =3D=3D IEEE80211_SMPS_DYNAMIC)
53a7ee94e2f945 Frank Wunderlich 2020-04-11  404  		txwi_flags |=3D MT_TXWI_=
FLAGS_MMPS;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  405  	if (!(info->flags & IEEE8=
0211_TX_CTL_NO_ACK))
53a7ee94e2f945 Frank Wunderlich 2020-04-11  406  		txwi->ack_ctl |=3D MT_TX=
WI_ACK_CTL_REQ;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  407  	if (info->flags & IEEE802=
11_TX_CTL_ASSIGN_SEQ)
53a7ee94e2f945 Frank Wunderlich 2020-04-11  408  		txwi->ack_ctl |=3D MT_TX=
WI_ACK_CTL_NSEQ;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  409  	if ((info->flags & IEEE80=
211_TX_CTL_AMPDU) && sta) {
53a7ee94e2f945 Frank Wunderlich 2020-04-11  410  		u8 ba_size =3D IEEE80211=
_MIN_AMPDU_BUF;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  411  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  412  		ba_size <<=3D sta->ht_ca=
p.ampdu_factor;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  413  		ba_size =3D min_t(int, 6=
3, ba_size - 1);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  414  		if (info->flags & IEEE80=
211_TX_CTL_RATE_CTRL_PROBE)
53a7ee94e2f945 Frank Wunderlich 2020-04-11  415  			ba_size =3D 0;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  416  		txwi->ack_ctl |=3D FIELD=
_PREP(MT_TXWI_ACK_CTL_BA_WINDOW, ba_size);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  417  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  418  		txwi_flags |=3D MT_TXWI_=
FLAGS_AMPDU |
53a7ee94e2f945 Frank Wunderlich 2020-04-11  419  			 FIELD_PREP(MT_TXWI_FLA=
GS_MPDU_DENSITY,
53a7ee94e2f945 Frank Wunderlich 2020-04-11  420  				    sta->ht_cap.ampdu_=
density);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  421  	}
53a7ee94e2f945 Frank Wunderlich 2020-04-11  422  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  423  	if (ieee80211_is_probe_re=
sp(hdr->frame_control) ||
53a7ee94e2f945 Frank Wunderlich 2020-04-11  424  	    ieee80211_is_beacon(h=
dr->frame_control))
53a7ee94e2f945 Frank Wunderlich 2020-04-11  425  		txwi_flags |=3D MT_TXWI_=
FLAGS_TS;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  426  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  427  	txwi->flags |=3D cpu_to_l=
e16(txwi_flags);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  428  	txwi->len_ctl =3D cpu_to_=
le16(len);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  429  }
53a7ee94e2f945 Frank Wunderlich 2020-04-11  430  EXPORT_SYMBOL_GPL(mt76x02_=
mac_write_txwi);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  431  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1927414743875195362==--

