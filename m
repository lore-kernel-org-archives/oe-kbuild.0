Content-Type: multipart/mixed; boundary="===============0445715428127615414=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2545:36: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses.
Date: Thu, 17 Sep 2020 15:11:38 +0800
Message-ID: <202009171530.aYSQ87r1%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0445715428127615414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>
CC: Sean Wang <sean.wang@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5925fa68fe8244651b3f78a88c4af99190a88f0d
commit: fcdfc29e58ee3b4db894f356fb6b12a6546f57bd mt76: mt7615: introduce hw=
 scan support
date:   4 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 months ago
compiler: hppa-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2545:36: warning: Boolea=
n result is used in bitwise operation. Clarify expression with parentheses.=
 [clarifyCondition]
    req->seq_num =3D mvif->scan_seq_num | ext_phy << 7;
                                      ^
>> drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:98:52: warning: Same val=
ue in both branches of ternary operator. [duplicateValueTernary]
    txd_len =3D cmd & MCU_UNI_PREFIX ? sizeof(*uni_txd) : sizeof(*mcu_txd);
                                                      ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:501:6: warning: Local va=
riable pm_number shadows outer variable [shadowVar]
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
riable pm_state shadows outer variable [shadowVar]
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
riable bssid shadows outer variable [shadowVar]
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
riable dtim_period shadows outer variable [shadowVar]
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
riable wlan_idx shadows outer variable [shadowVar]
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
ariable bcn_interval shadows outer variable [shadowVar]
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
ariable aid shadows outer variable [shadowVar]
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
ariable rx_filter shadows outer variable [shadowVar]
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
riable band_idx shadows outer variable [shadowVar]
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
riable rsv shadows outer variable [shadowVar]
     u8 rsv[3];
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:510:6: note: Shadowed de=
claration
     u8 rsv[3];
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:510:6: note: Shadow vari=
able
     u8 rsv[3];
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:511:10: warning: Local v=
ariable feature shadows outer variable [shadowVar]
     __le32 feature;
            ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:511:10: note: Shadowed d=
eclaration
     __le32 feature;
            ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:511:10: note: Shadow var=
iable
     __le32 feature;
            ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:512:6: warning: Local va=
riable omac_idx shadows outer variable [shadowVar]
     u8 omac_idx;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:512:6: note: Shadowed de=
claration
     u8 omac_idx;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:512:6: note: Shadow vari=
able
     u8 omac_idx;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:513:6: warning: Local va=
riable wmm_idx shadows outer variable [shadowVar]
     u8 wmm_idx;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:513:6: note: Shadowed de=
claration
     u8 wmm_idx;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:513:6: note: Shadow vari=
able
     u8 wmm_idx;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:514:6: warning: Local va=
riable bcn_loss_cnt shadows outer variable [shadowVar]
     u8 bcn_loss_cnt;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:514:6: note: Shadowed de=
claration
     u8 bcn_loss_cnt;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:514:6: note: Shadow vari=
able
     u8 bcn_loss_cnt;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:515:6: warning: Local va=
riable bcn_sp_duration shadows outer variable [shadowVar]
     u8 bcn_sp_duration;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:515:6: note: Shadowed de=
claration
     u8 bcn_sp_duration;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:515:6: note: Shadow vari=
able
     u8 bcn_sp_duration;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2048:6: warning: Local v=
ariable buffer_mode shadows outer variable [shadowVar]
     u8 buffer_mode;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2048:6: note: Shadowed d=
eclaration
     u8 buffer_mode;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2048:6: note: Shadow var=
iable
     u8 buffer_mode;
        ^
>> drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2049:6: warning: Local v=
ariable content_format shadows outer variable [shadowVar]
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
variable len shadows outer variable [shadowVar]
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
ariable enable shadows outer variable [shadowVar]
     u8 enable;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2090:6: note: Shadowed d=
eclaration
     u8 enable;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2090:6: note: Shadow var=
iable
     u8 enable;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2091:6: warning: Local v=
ariable band shadows outer variable [shadowVar]
     u8 band;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2091:6: note: Shadowed d=
eclaration
     u8 band;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2091:6: note: Shadow var=
iable
     u8 band;
        ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2092:6: warning: Local v=
ariable rsv shadows outer variable [shadowVar]
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
ariable prot_idx shadows outer variable [shadowVar]
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
ariable band shadows outer variable [shadowVar]
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
ariable rsv shadows outer variable [shadowVar]
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
variable len_thresh shadows outer variable [shadowVar]
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
variable pkt_thresh shadows outer variable [shadowVar]
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
ariable __packed shadows outer variable [shadowVar]
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
ariable seq_num shadows outer variable [shadowVar]
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
ariable is_ext_channel shadows outer variable [shadowVar]
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
ariable rsv shadows outer variable [shadowVar]
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
>> drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2483:4: warning: Unused =
variable: __packed [unusedVariable]
    } __packed;
      ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dfcdfc29e58ee3b4db894f356fb6b12a6546f57bd
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout fcdfc29e58ee3b4db894f356fb6b12a6546f57bd
vim +2545 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c

bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2455  =

bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2456  int mt7615_mcu_set_channe=
l_domain(struct mt7615_phy *phy)
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2457  {
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2458  	struct mt76_phy *mphy =
=3D phy->mt76;
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2459  	struct mt7615_dev *dev =
=3D phy->dev;
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2460  	struct mt7615_mcu_channe=
l_domain {
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2461  		__le32 country_code; /*=
 regulatory_request.alpha2 */
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2462  		u8 bw_2g; /* BW_20_40M	=
	0
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2463  			   * BW_20M		1
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2464  			   * BW_20_40_80M	2
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2465  			   * BW_20_40_80_160M	3
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2466  			   * BW_20_40_80_8080M=
	4
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2467  			   */
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2468  		u8 bw_5g;
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2469  		__le16 pad;
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2470  		u8 n_2ch;
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2471  		u8 n_5ch;
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2472  		__le16 pad2;
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2473  	} __packed hdr =3D {
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2474  		.bw_2g =3D 0,
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2475  		.bw_5g =3D 3,
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2476  		.n_2ch =3D mphy->sband_=
2g.sband.n_channels,
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2477  		.n_5ch =3D mphy->sband_=
5g.sband.n_channels,
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2478  	};
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2479  	struct mt7615_mcu_chan {
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2480  		__le16 hw_value;
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2481  		__le16 pad;
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2482  		__le32 flags;
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02 @2483  	} __packed;
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2484  	int i, n_channels =3D hd=
r.n_2ch + hdr.n_5ch;
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2485  	int len =3D sizeof(hdr) =
+ n_channels * sizeof(struct mt7615_mcu_chan);
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2486  	struct sk_buff *skb;
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2487  =

bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2488  	if (!mt7615_firmware_off=
load(dev))
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2489  		return 0;
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2490  =

bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2491  	skb =3D mt7615_mcu_msg_a=
lloc(NULL, len);
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2492  	if (!skb)
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2493  		return -ENOMEM;
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2494  =

bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2495  	skb_put_data(skb, &hdr, =
sizeof(hdr));
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2496  =

bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2497  	for (i =3D 0; i < n_chan=
nels; i++) {
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2498  		struct ieee80211_channe=
l *chan;
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2499  		struct mt7615_mcu_chan =
channel;
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2500  =

bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2501  		if (i < hdr.n_2ch)
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2502  			chan =3D &mphy->sband_=
2g.sband.channels[i];
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2503  		else
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2504  			chan =3D &mphy->sband_=
5g.sband.channels[i - hdr.n_2ch];
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2505  =

bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2506  		channel.hw_value =3D cp=
u_to_le16(chan->hw_value);
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2507  		channel.flags =3D cpu_t=
o_le32(chan->flags);
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2508  		channel.pad =3D 0;
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2509  =

bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2510  		skb_put_data(skb, &chan=
nel, sizeof(channel));
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2511  	}
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2512  =

bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2513  	return __mt76_mcu_skb_se=
nd_msg(&dev->mt76, skb,
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2514  				       MCU_CMD_SET_CH=
AN_DOMAIN, false);
bf18fcdc9a4ba0 Lorenzo Bianconi 2020-04-02  2515  }
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2516  =

fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2517  #define MT7615_SCAN_CHANN=
EL_TIME	120
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2518  int mt7615_mcu_hw_scan(st=
ruct mt7615_phy *phy, struct ieee80211_vif *vif,
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2519  		       struct ieee80211=
_scan_request *scan_req)
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2520  {
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2521  	struct mt7615_vif *mvif =
=3D (struct mt7615_vif *)vif->drv_priv;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2522  	struct cfg80211_scan_req=
uest *sreq =3D &scan_req->req;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2523  	int ext_channels_num =3D=
 max_t(int, sreq->n_channels - 32, 0);
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2524  	struct ieee80211_channel=
 **scan_list =3D sreq->channels;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2525  	int err, i, duration =3D=
 MT7615_SCAN_CHANNEL_TIME;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2526  	struct mt7615_dev *dev =
=3D phy->dev;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2527  	bool ext_phy =3D phy !=
=3D &dev->phy;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2528  	struct mt7615_mcu_scan_c=
hannel *chan;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2529  	struct mt7615_hw_scan_re=
q *req;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2530  	struct sk_buff *skb;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2531  =

fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2532  	/* fall-back to sw-scan =
*/
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2533  	if (!mt7615_firmware_off=
load(dev))
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2534  		return 1;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2535  =

fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2536  	skb =3D mt7615_mcu_msg_a=
lloc(NULL, sizeof(*req));
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2537  	if (!skb)
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2538  		return -ENOMEM;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2539  =

fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2540  	set_bit(MT76_HW_SCANNING=
, &phy->mt76->state);
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2541  	mvif->scan_seq_num =3D (=
mvif->scan_seq_num + 1) & 0x7f;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2542  =

fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2543  	req =3D (struct mt7615_h=
w_scan_req *)skb_put(skb, sizeof(*req));
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2544  =

fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02 @2545  	req->seq_num =3D mvif->s=
can_seq_num | ext_phy << 7;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2546  	req->bss_idx =3D mvif->i=
dx;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2547  	req->scan_type =3D 1;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2548  	req->ssid_type =3D 1;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2549  	req->probe_req_num =3D 2;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2550  	req->version =3D 1;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2551  	req->channel_type =3D 4;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2552  =

fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2553  	for (i =3D 0; i < sreq->=
n_ssids; i++) {
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2554  		req->ssids[i].ssid_len =
=3D cpu_to_le32(sreq->ssids[i].ssid_len);
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2555  		memcpy(req->ssids[i].ss=
id, sreq->ssids[i].ssid,
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2556  		       sreq->ssids[i].s=
sid_len);
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2557  	}
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2558  =

fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2559  	req->timeout_value =3D c=
pu_to_le16(sreq->n_channels * duration);
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2560  	req->channel_min_dwell_t=
ime =3D cpu_to_le16(duration);
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2561  	req->channel_dwell_time =
=3D cpu_to_le16(duration);
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2562  =

fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2563  	req->channels_num =3D mi=
n_t(u8, sreq->n_channels, 32);
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2564  	req->ext_channels_num =
=3D min_t(u8, ext_channels_num, 32);
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2565  	for (i =3D 0; i < req->c=
hannels_num + req->ext_channels_num; i++) {
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2566  		if (i >=3D 32)
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2567  			chan =3D &req->ext_cha=
nnels[i - 32];
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2568  		else
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2569  			chan =3D &req->channel=
s[i];
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2570  =

fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2571  		chan->band =3D scan_lis=
t[i]->band =3D=3D NL80211_BAND_2GHZ ? 1 : 2;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2572  		chan->channel_num =3D s=
can_list[i]->hw_value;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2573  	}
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2574  =

fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2575  	if (sreq->ie_len > 0) {
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2576  		memcpy(req->ies, sreq->=
ie, sreq->ie_len);
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2577  		req->ies_len =3D cpu_to=
_le16(sreq->ie_len);
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2578  	}
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2579  =

fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2580  	memcpy(req->bssid, sreq-=
>bssid, ETH_ALEN);
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2581  	if (sreq->flags & NL8021=
1_SCAN_FLAG_RANDOM_ADDR) {
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2582  		get_random_mask_addr(re=
q->random_mac, sreq->mac_addr,
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2583  				     sreq->mac_addr_m=
ask);
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2584  		req->scan_func =3D 1;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2585  	}
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2586  =

fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2587  	err =3D __mt76_mcu_skb_s=
end_msg(&dev->mt76, skb, MCU_CMD_START_HW_SCAN,
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2588  				      false);
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2589  	if (err < 0)
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2590  		clear_bit(MT76_HW_SCANN=
ING, &phy->mt76->state);
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2591  =

fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2592  	return err;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2593  }
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2594  =

fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2595  int mt7615_mcu_cancel_hw_=
scan(struct mt7615_phy *phy,
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2596  			      struct ieee80211=
_vif *vif)
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2597  {
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2598  	struct mt7615_vif *mvif =
=3D (struct mt7615_vif *)vif->drv_priv;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2599  	struct mt7615_dev *dev =
=3D phy->dev;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2600  	struct cfg80211_scan_inf=
o info =3D {
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2601  		.aborted =3D true,
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2602  	};
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02  2603  	struct {
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02 @2604  		u8 seq_num;
fcdfc29e58ee3b Lorenzo Bianconi 2020-04-02 @2605  		u8 is_ext_channel;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0445715428127615414==--

