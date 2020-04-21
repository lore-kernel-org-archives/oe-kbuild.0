Content-Type: multipart/mixed; boundary="===============2944144906303633281=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [nbd168-wireless:mt76 16/56] drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2545:36: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Wed, 22 Apr 2020 01:22:20 +0800
Message-ID: <202004220135.Tv9fHfCk%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2944144906303633281==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>
CC: Sean Wang <sean.wang@mediatek.com>

tree:   https://github.com/nbd168/wireless mt76
head:   9989a51ad3579201ad0447e46615b3a318307c6e
commit: d25425e4faad2a3315c831e13f9205085936ce3d [16/56] mt76: mt7615: intr=
oduce hw scan support
:::::: branch date: 4 days ago
:::::: commit date: 2 weeks ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2545:36: warning: Boolea=
n result is used in bitwise operation. Clarify expression with parentheses.=
 [clarifyCondition]
    req->seq_num =3D mvif->scan_seq_num | ext_phy << 7;
                                      ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:501:6: warning: Local va=
riable 'pm_number' shadows outer variable [shadowVariable]
     u8 pm_number;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:501:6: note: Shadowed de=
claration
     u8 pm_number;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:501:6: note: Shadow vari=
able
     u8 pm_number;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:502:6: warning: Local va=
riable 'pm_state' shadows outer variable [shadowVariable]
     u8 pm_state;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:502:6: note: Shadowed de=
claration
     u8 pm_state;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:502:6: note: Shadow vari=
able
     u8 pm_state;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:503:6: warning: Local va=
riable 'bssid' shadows outer variable [shadowVariable]
     u8 bssid[ETH_ALEN];
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:503:6: note: Shadowed de=
claration
     u8 bssid[ETH_ALEN];
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:503:6: note: Shadow vari=
able
     u8 bssid[ETH_ALEN];
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:504:6: warning: Local va=
riable 'dtim_period' shadows outer variable [shadowVariable]
     u8 dtim_period;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:504:6: note: Shadowed de=
claration
     u8 dtim_period;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:504:6: note: Shadow vari=
able
     u8 dtim_period;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:505:6: warning: Local va=
riable 'wlan_idx' shadows outer variable [shadowVariable]
     u8 wlan_idx;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:505:6: note: Shadowed de=
claration
     u8 wlan_idx;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:505:6: note: Shadow vari=
able
     u8 wlan_idx;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:506:10: warning: Local v=
ariable 'bcn_interval' shadows outer variable [shadowVariable]
     __le16 bcn_interval;
            ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:506:10: note: Shadowed d=
eclaration
     __le16 bcn_interval;
            ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:506:10: note: Shadow var=
iable
     __le16 bcn_interval;
            ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:507:10: warning: Local v=
ariable 'aid' shadows outer variable [shadowVariable]
     __le32 aid;
            ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:507:10: note: Shadowed d=
eclaration
     __le32 aid;
            ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:507:10: note: Shadow var=
iable
     __le32 aid;
            ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:508:10: warning: Local v=
ariable 'rx_filter' shadows outer variable [shadowVariable]
     __le32 rx_filter;
            ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:508:10: note: Shadowed d=
eclaration
     __le32 rx_filter;
            ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:508:10: note: Shadow var=
iable
     __le32 rx_filter;
            ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:509:6: warning: Local va=
riable 'band_idx' shadows outer variable [shadowVariable]
     u8 band_idx;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:509:6: note: Shadowed de=
claration
     u8 band_idx;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:509:6: note: Shadow vari=
able
     u8 band_idx;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:510:6: warning: Local va=
riable 'rsv' shadows outer variable [shadowVariable]
     u8 rsv[3];
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:510:6: note: Shadowed de=
claration
     u8 rsv[3];
--
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2049:6: warning: Local v=
ariable 'content_format' shadows outer variable [shadowVariable]
     u8 content_format;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2049:6: note: Shadowed d=
eclaration
     u8 content_format;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2049:6: note: Shadow var=
iable
     u8 content_format;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2050:10: warning: Local =
variable 'len' shadows outer variable [shadowVariable]
     __le16 len;
            ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2050:10: note: Shadowed =
declaration
     __le16 len;
            ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2050:10: note: Shadow va=
riable
     __le16 len;
            ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2090:6: warning: Local v=
ariable 'enable' shadows outer argument [shadowArgument]
     u8 enable;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2087:70: note: Shadowed =
declaration
   int mt7615_mcu_set_mac_enable(struct mt7615_dev *dev, int band, bool ena=
ble)
                                                                        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2090:6: note: Shadow var=
iable
     u8 enable;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2091:6: warning: Local v=
ariable 'band' shadows outer argument [shadowArgument]
     u8 band;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2087:59: note: Shadowed =
declaration
   int mt7615_mcu_set_mac_enable(struct mt7615_dev *dev, int band, bool ena=
ble)
                                                             ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2091:6: note: Shadow var=
iable
     u8 band;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2092:6: warning: Local v=
ariable 'rsv' shadows outer variable [shadowVariable]
     u8 rsv[2];
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2092:6: note: Shadowed d=
eclaration
     u8 rsv[2];
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2092:6: note: Shadow var=
iable
     u8 rsv[2];
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2106:6: warning: Local v=
ariable 'prot_idx' shadows outer variable [shadowVariable]
     u8 prot_idx;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2106:6: note: Shadowed d=
eclaration
     u8 prot_idx;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2106:6: note: Shadow var=
iable
     u8 prot_idx;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2107:6: warning: Local v=
ariable 'band' shadows outer variable [shadowVariable]
     u8 band;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2107:6: note: Shadowed d=
eclaration
     u8 band;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2107:6: note: Shadow var=
iable
     u8 band;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2108:6: warning: Local v=
ariable 'rsv' shadows outer variable [shadowVariable]
     u8 rsv[2];
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2108:6: note: Shadowed d=
eclaration
     u8 rsv[2];
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2108:6: note: Shadow var=
iable
     u8 rsv[2];
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2109:10: warning: Local =
variable 'len_thresh' shadows outer variable [shadowVariable]
     __le32 len_thresh;
            ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2109:10: note: Shadowed =
declaration
     __le32 len_thresh;
            ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2109:10: note: Shadow va=
riable
     __le32 len_thresh;
            ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2110:10: warning: Local =
variable 'pkt_thresh' shadows outer variable [shadowVariable]
     __le32 pkt_thresh;
            ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2110:10: note: Shadowed =
declaration
     __le32 pkt_thresh;
            ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2110:10: note: Shadow va=
riable
     __le32 pkt_thresh;
            ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2483:4: warning: Local v=
ariable '__packed' shadows outer variable [shadowVariable]
    } __packed;
      ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.h:284:3: note: Shadowed de=
claration
   } __packed;
     ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2483:4: note: Shadow var=
iable
    } __packed;
      ^
>> drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2604:6: warning: Local v=
ariable 'seq_num' shadows outer variable [shadowVariable]
     u8 seq_num;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2604:6: note: Shadowed d=
eclaration
     u8 seq_num;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2604:6: note: Shadow var=
iable
     u8 seq_num;
        ^
>> drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2605:6: warning: Local v=
ariable 'is_ext_channel' shadows outer variable [shadowVariable]
     u8 is_ext_channel;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2605:6: note: Shadowed d=
eclaration
     u8 is_ext_channel;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2605:6: note: Shadow var=
iable
     u8 is_ext_channel;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2606:6: warning: Local v=
ariable 'rsv' shadows outer variable [shadowVariable]
     u8 rsv[2];
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2606:6: note: Shadowed d=
eclaration
     u8 rsv[2];
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2606:6: note: Shadow var=
iable
     u8 rsv[2];
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:98:33: warning: Clarify =
calculation precedence for '&' and '?'. [clarifyCalculation]
    txd_len =3D cmd & MCU_UNI_PREFIX ? sizeof(*uni_txd) : sizeof(*mcu_txd);
                                   ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2483:4: warning: Unused =
variable: __packed [unusedVariable]
    } __packed;
      ^

# https://github.com/nbd168/wireless/commit/d25425e4faad2a3315c831e13f92050=
85936ce3d
git remote add nbd168-wireless https://github.com/nbd168/wireless
git remote update nbd168-wireless
git checkout d25425e4faad2a3315c831e13f9205085936ce3d
vim +2545 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c

d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2516  =

d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2517  #define MT7615_SCAN_CHAN=
NEL_TIME	120
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2518  int mt7615_mcu_hw_scan(s=
truct mt7615_phy *phy, struct ieee80211_vif *vif,
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2519  		       struct ieee8021=
1_scan_request *scan_req)
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2520  {
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2521  	struct mt7615_vif *mvif=
 =3D (struct mt7615_vif *)vif->drv_priv;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2522  	struct cfg80211_scan_re=
quest *sreq =3D &scan_req->req;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2523  	int ext_channels_num =
=3D max_t(int, sreq->n_channels - 32, 0);
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2524  	struct ieee80211_channe=
l **scan_list =3D sreq->channels;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2525  	int err, i, duration =
=3D MT7615_SCAN_CHANNEL_TIME;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2526  	struct mt7615_dev *dev =
=3D phy->dev;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2527  	bool ext_phy =3D phy !=
=3D &dev->phy;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2528  	struct mt7615_mcu_scan_=
channel *chan;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2529  	struct mt7615_hw_scan_r=
eq *req;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2530  	struct sk_buff *skb;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2531  =

d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2532  	/* fall-back to sw-scan=
 */
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2533  	if (!mt7615_firmware_of=
fload(dev))
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2534  		return 1;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2535  =

d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2536  	skb =3D mt7615_mcu_msg_=
alloc(NULL, sizeof(*req));
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2537  	if (!skb)
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2538  		return -ENOMEM;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2539  =

d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2540  	set_bit(MT76_HW_SCANNIN=
G, &phy->mt76->state);
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2541  	mvif->scan_seq_num =3D =
(mvif->scan_seq_num + 1) & 0x7f;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2542  =

d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2543  	req =3D (struct mt7615_=
hw_scan_req *)skb_put(skb, sizeof(*req));
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2544  =

d25425e4faad2a3 Lorenzo Bianconi 2020-04-02 @2545  	req->seq_num =3D mvif->=
scan_seq_num | ext_phy << 7;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2546  	req->bss_idx =3D mvif->=
idx;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2547  	req->scan_type =3D 1;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2548  	req->ssid_type =3D 1;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2549  	req->probe_req_num =3D =
2;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2550  	req->version =3D 1;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2551  	req->channel_type =3D 4;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2552  =

d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2553  	for (i =3D 0; i < sreq-=
>n_ssids; i++) {
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2554  		req->ssids[i].ssid_len=
 =3D cpu_to_le32(sreq->ssids[i].ssid_len);
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2555  		memcpy(req->ssids[i].s=
sid, sreq->ssids[i].ssid,
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2556  		       sreq->ssids[i].=
ssid_len);
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2557  	}
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2558  =

d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2559  	req->timeout_value =3D =
cpu_to_le16(sreq->n_channels * duration);
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2560  	req->channel_min_dwell_=
time =3D cpu_to_le16(duration);
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2561  	req->channel_dwell_time=
 =3D cpu_to_le16(duration);
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2562  =

d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2563  	req->channels_num =3D m=
in_t(u8, sreq->n_channels, 32);
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2564  	req->ext_channels_num =
=3D min_t(u8, ext_channels_num, 32);
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2565  	for (i =3D 0; i < req->=
channels_num + req->ext_channels_num; i++) {
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2566  		if (i >=3D 32)
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2567  			chan =3D &req->ext_ch=
annels[i - 32];
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2568  		else
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2569  			chan =3D &req->channe=
ls[i];
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2570  =

d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2571  		chan->band =3D scan_li=
st[i]->band =3D=3D NL80211_BAND_2GHZ ? 1 : 2;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2572  		chan->channel_num =3D =
scan_list[i]->hw_value;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2573  	}
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2574  =

d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2575  	if (sreq->ie_len > 0) {
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2576  		memcpy(req->ies, sreq-=
>ie, sreq->ie_len);
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2577  		req->ies_len =3D cpu_t=
o_le16(sreq->ie_len);
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2578  	}
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2579  =

d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2580  	memcpy(req->bssid, sreq=
->bssid, ETH_ALEN);
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2581  	if (sreq->flags & NL802=
11_SCAN_FLAG_RANDOM_ADDR) {
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2582  		get_random_mask_addr(r=
eq->random_mac, sreq->mac_addr,
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2583  				     sreq->mac_addr_=
mask);
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2584  		req->scan_func =3D 1;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2585  	}
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2586  =

d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2587  	err =3D __mt76_mcu_skb_=
send_msg(&dev->mt76, skb, MCU_CMD_START_HW_SCAN,
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2588  				      false);
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2589  	if (err < 0)
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2590  		clear_bit(MT76_HW_SCAN=
NING, &phy->mt76->state);
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2591  =

d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2592  	return err;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2593  }
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2594  =

d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2595  int mt7615_mcu_cancel_hw=
_scan(struct mt7615_phy *phy,
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2596  			      struct ieee8021=
1_vif *vif)
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2597  {
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2598  	struct mt7615_vif *mvif=
 =3D (struct mt7615_vif *)vif->drv_priv;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2599  	struct mt7615_dev *dev =
=3D phy->dev;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2600  	struct cfg80211_scan_in=
fo info =3D {
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2601  		.aborted =3D true,
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2602  	};
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02  2603  	struct {
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02 @2604  		u8 seq_num;
d25425e4faad2a3 Lorenzo Bianconi 2020-04-02 @2605  		u8 is_ext_channel;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2944144906303633281==--

