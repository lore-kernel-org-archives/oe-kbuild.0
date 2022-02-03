Content-Type: multipart/mixed; boundary="===============6654969850767254333=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c:1460:36: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Thu, 03 Feb 2022 13:23:16 +0800
Message-ID: <202202031358.8M4dKkHT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6654969850767254333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sean Wang <sean.wang@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   88808fbbead481aedb46640a5ace69c58287f56a
commit: 48fab5bbef4092d925ab3214773ad12e68807223 mt76: mt7921: introduce mt=
7921s support
date:   4 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 4 months ago
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c:1460:36: warning: B=
oolean result is used in bitwise operation. Clarify expression with parenth=
eses. [clarifyCondition]
    req->seq_num =3D mvif->scan_seq_num | ext_phy << 7;
                                      ^
   drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c:1581:36: warning: B=
oolean result is used in bitwise operation. Clarify expression with parenth=
eses. [clarifyCondition]
    req->seq_num =3D mvif->scan_seq_num | ext_phy << 7;
                                      ^

vim +1460 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c

d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  1435  =

399090ef96059d Lorenzo Bianconi 2021-01-26  1436  #define MT76_CONNAC_SCAN_=
CHANNEL_TIME		60
399090ef96059d Lorenzo Bianconi 2021-01-26  1437  int mt76_connac_mcu_hw_sc=
an(struct mt76_phy *phy, struct ieee80211_vif *vif,
399090ef96059d Lorenzo Bianconi 2021-01-26  1438  			    struct ieee80211_s=
can_request *scan_req)
399090ef96059d Lorenzo Bianconi 2021-01-26  1439  {
399090ef96059d Lorenzo Bianconi 2021-01-26  1440  	struct mt76_vif *mvif =
=3D (struct mt76_vif *)vif->drv_priv;
399090ef96059d Lorenzo Bianconi 2021-01-26  1441  	struct cfg80211_scan_req=
uest *sreq =3D &scan_req->req;
9db419f0cb39a6 Sean Wang        2021-04-06  1442  	int n_ssids =3D 0, err, =
i, duration;
399090ef96059d Lorenzo Bianconi 2021-01-26  1443  	int ext_channels_num =3D=
 max_t(int, sreq->n_channels - 32, 0);
399090ef96059d Lorenzo Bianconi 2021-01-26  1444  	struct ieee80211_channel=
 **scan_list =3D sreq->channels;
399090ef96059d Lorenzo Bianconi 2021-01-26  1445  	struct mt76_dev *mdev =
=3D phy->dev;
399090ef96059d Lorenzo Bianconi 2021-01-26  1446  	bool ext_phy =3D phy =3D=
=3D mdev->phy2;
399090ef96059d Lorenzo Bianconi 2021-01-26  1447  	struct mt76_connac_mcu_s=
can_channel *chan;
399090ef96059d Lorenzo Bianconi 2021-01-26  1448  	struct mt76_connac_hw_sc=
an_req *req;
399090ef96059d Lorenzo Bianconi 2021-01-26  1449  	struct sk_buff *skb;
399090ef96059d Lorenzo Bianconi 2021-01-26  1450  =

399090ef96059d Lorenzo Bianconi 2021-01-26  1451  	skb =3D mt76_mcu_msg_all=
oc(mdev, NULL, sizeof(*req));
399090ef96059d Lorenzo Bianconi 2021-01-26  1452  	if (!skb)
399090ef96059d Lorenzo Bianconi 2021-01-26  1453  		return -ENOMEM;
399090ef96059d Lorenzo Bianconi 2021-01-26  1454  =

399090ef96059d Lorenzo Bianconi 2021-01-26  1455  	set_bit(MT76_HW_SCANNING=
, &phy->state);
399090ef96059d Lorenzo Bianconi 2021-01-26  1456  	mvif->scan_seq_num =3D (=
mvif->scan_seq_num + 1) & 0x7f;
399090ef96059d Lorenzo Bianconi 2021-01-26  1457  =

399090ef96059d Lorenzo Bianconi 2021-01-26  1458  	req =3D (struct mt76_con=
nac_hw_scan_req *)skb_put(skb, sizeof(*req));
399090ef96059d Lorenzo Bianconi 2021-01-26  1459  =

399090ef96059d Lorenzo Bianconi 2021-01-26 @1460  	req->seq_num =3D mvif->s=
can_seq_num | ext_phy << 7;
399090ef96059d Lorenzo Bianconi 2021-01-26  1461  	req->bss_idx =3D mvif->i=
dx;
399090ef96059d Lorenzo Bianconi 2021-01-26  1462  	req->scan_type =3D sreq-=
>n_ssids ? 1 : 0;
399090ef96059d Lorenzo Bianconi 2021-01-26  1463  	req->probe_req_num =3D s=
req->n_ssids ? 2 : 0;
399090ef96059d Lorenzo Bianconi 2021-01-26  1464  	req->version =3D 1;
399090ef96059d Lorenzo Bianconi 2021-01-26  1465  =

399090ef96059d Lorenzo Bianconi 2021-01-26  1466  	for (i =3D 0; i < sreq->=
n_ssids; i++) {
399090ef96059d Lorenzo Bianconi 2021-01-26  1467  		if (!sreq->ssids[i].ssi=
d_len)
399090ef96059d Lorenzo Bianconi 2021-01-26  1468  			continue;
399090ef96059d Lorenzo Bianconi 2021-01-26  1469  =

399090ef96059d Lorenzo Bianconi 2021-01-26  1470  		req->ssids[i].ssid_len =
=3D cpu_to_le32(sreq->ssids[i].ssid_len);
399090ef96059d Lorenzo Bianconi 2021-01-26  1471  		memcpy(req->ssids[i].ss=
id, sreq->ssids[i].ssid,
399090ef96059d Lorenzo Bianconi 2021-01-26  1472  		       sreq->ssids[i].s=
sid_len);
399090ef96059d Lorenzo Bianconi 2021-01-26  1473  		n_ssids++;
399090ef96059d Lorenzo Bianconi 2021-01-26  1474  	}
399090ef96059d Lorenzo Bianconi 2021-01-26  1475  	req->ssid_type =3D n_ssi=
ds ? BIT(2) : BIT(0);
399090ef96059d Lorenzo Bianconi 2021-01-26  1476  	req->ssid_type_ext =3D n=
_ssids ? BIT(0) : 0;
399090ef96059d Lorenzo Bianconi 2021-01-26  1477  	req->ssids_num =3D n_ssi=
ds;
399090ef96059d Lorenzo Bianconi 2021-01-26  1478  =

9db419f0cb39a6 Sean Wang        2021-04-06  1479  	duration =3D is_mt7921(p=
hy->dev) ? 0 : MT76_CONNAC_SCAN_CHANNEL_TIME;
399090ef96059d Lorenzo Bianconi 2021-01-26  1480  	/* increase channel time=
 for passive scan */
399090ef96059d Lorenzo Bianconi 2021-01-26  1481  	if (!sreq->n_ssids)
399090ef96059d Lorenzo Bianconi 2021-01-26  1482  		duration *=3D 2;
399090ef96059d Lorenzo Bianconi 2021-01-26  1483  	req->timeout_value =3D c=
pu_to_le16(sreq->n_channels * duration);
399090ef96059d Lorenzo Bianconi 2021-01-26  1484  	req->channel_min_dwell_t=
ime =3D cpu_to_le16(duration);
399090ef96059d Lorenzo Bianconi 2021-01-26  1485  	req->channel_dwell_time =
=3D cpu_to_le16(duration);
399090ef96059d Lorenzo Bianconi 2021-01-26  1486  =

399090ef96059d Lorenzo Bianconi 2021-01-26  1487  	req->channels_num =3D mi=
n_t(u8, sreq->n_channels, 32);
399090ef96059d Lorenzo Bianconi 2021-01-26  1488  	req->ext_channels_num =
=3D min_t(u8, ext_channels_num, 32);
399090ef96059d Lorenzo Bianconi 2021-01-26  1489  	for (i =3D 0; i < req->c=
hannels_num + req->ext_channels_num; i++) {
399090ef96059d Lorenzo Bianconi 2021-01-26  1490  		if (i >=3D 32)
399090ef96059d Lorenzo Bianconi 2021-01-26  1491  			chan =3D &req->ext_cha=
nnels[i - 32];
399090ef96059d Lorenzo Bianconi 2021-01-26  1492  		else
399090ef96059d Lorenzo Bianconi 2021-01-26  1493  			chan =3D &req->channel=
s[i];
399090ef96059d Lorenzo Bianconi 2021-01-26  1494  =

212e5197eec24e Lorenzo Bianconi 2021-08-24  1495  		switch (scan_list[i]->b=
and) {
212e5197eec24e Lorenzo Bianconi 2021-08-24  1496  		case NL80211_BAND_2GHZ:
212e5197eec24e Lorenzo Bianconi 2021-08-24  1497  			chan->band =3D 1;
212e5197eec24e Lorenzo Bianconi 2021-08-24  1498  			break;
212e5197eec24e Lorenzo Bianconi 2021-08-24  1499  		case NL80211_BAND_6GHZ:
212e5197eec24e Lorenzo Bianconi 2021-08-24  1500  			chan->band =3D 3;
212e5197eec24e Lorenzo Bianconi 2021-08-24  1501  			break;
212e5197eec24e Lorenzo Bianconi 2021-08-24  1502  		default:
212e5197eec24e Lorenzo Bianconi 2021-08-24  1503  			chan->band =3D 2;
212e5197eec24e Lorenzo Bianconi 2021-08-24  1504  			break;
212e5197eec24e Lorenzo Bianconi 2021-08-24  1505  		}
399090ef96059d Lorenzo Bianconi 2021-01-26  1506  		chan->channel_num =3D s=
can_list[i]->hw_value;
399090ef96059d Lorenzo Bianconi 2021-01-26  1507  	}
399090ef96059d Lorenzo Bianconi 2021-01-26  1508  	req->channel_type =3D sr=
eq->n_channels ? 4 : 0;
399090ef96059d Lorenzo Bianconi 2021-01-26  1509  =

399090ef96059d Lorenzo Bianconi 2021-01-26  1510  	if (sreq->ie_len > 0) {
399090ef96059d Lorenzo Bianconi 2021-01-26  1511  		memcpy(req->ies, sreq->=
ie, sreq->ie_len);
399090ef96059d Lorenzo Bianconi 2021-01-26  1512  		req->ies_len =3D cpu_to=
_le16(sreq->ie_len);
399090ef96059d Lorenzo Bianconi 2021-01-26  1513  	}
399090ef96059d Lorenzo Bianconi 2021-01-26  1514  =

4da64fe086d95d Sean Wang        2021-04-06  1515  	if (is_mt7921(phy->dev))
4da64fe086d95d Sean Wang        2021-04-06  1516  		req->scan_func |=3D SCA=
N_FUNC_SPLIT_SCAN;
4da64fe086d95d Sean Wang        2021-04-06  1517  =

399090ef96059d Lorenzo Bianconi 2021-01-26  1518  	memcpy(req->bssid, sreq-=
>bssid, ETH_ALEN);
399090ef96059d Lorenzo Bianconi 2021-01-26  1519  	if (sreq->flags & NL8021=
1_SCAN_FLAG_RANDOM_ADDR) {
399090ef96059d Lorenzo Bianconi 2021-01-26  1520  		get_random_mask_addr(re=
q->random_mac, sreq->mac_addr,
399090ef96059d Lorenzo Bianconi 2021-01-26  1521  				     sreq->mac_addr_m=
ask);
4da64fe086d95d Sean Wang        2021-04-06  1522  		req->scan_func |=3D SCA=
N_FUNC_RANDOM_MAC;
399090ef96059d Lorenzo Bianconi 2021-01-26  1523  	}
399090ef96059d Lorenzo Bianconi 2021-01-26  1524  =

399090ef96059d Lorenzo Bianconi 2021-01-26  1525  	err =3D mt76_mcu_skb_sen=
d_msg(mdev, skb, MCU_CMD_START_HW_SCAN, false);
399090ef96059d Lorenzo Bianconi 2021-01-26  1526  	if (err < 0)
399090ef96059d Lorenzo Bianconi 2021-01-26  1527  		clear_bit(MT76_HW_SCANN=
ING, &phy->state);
399090ef96059d Lorenzo Bianconi 2021-01-26  1528  =

399090ef96059d Lorenzo Bianconi 2021-01-26  1529  	return err;
399090ef96059d Lorenzo Bianconi 2021-01-26  1530  }
399090ef96059d Lorenzo Bianconi 2021-01-26  1531  EXPORT_SYMBOL_GPL(mt76_co=
nnac_mcu_hw_scan);
399090ef96059d Lorenzo Bianconi 2021-01-26  1532  =


:::::: The code at line 1460 was first introduced by commit
:::::: 399090ef96059da9cc6459e2d68347a27254bbf5 mt76: mt76_connac: move hw_=
scan and sched_scan routine in mt76_connac_mcu module

:::::: TO: Lorenzo Bianconi <lorenzo@kernel.org>
:::::: CC: Felix Fietkau <nbd@nbd.name>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6654969850767254333==--

