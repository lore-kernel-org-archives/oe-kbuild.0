Content-Type: multipart/mixed; boundary="===============7178948748184687281=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2712/12265] drivers/net/wireless/microchip/wilc1000/cfg80211.c:1096:9: warning: Identical condition 'ret', second condition is always false
Date: Wed, 29 Jul 2020 15:14:07 +0800
Message-ID: <202007291559.QzFcASS4%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7178948748184687281==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Ajay Singh <ajay.kathat@microchip.com>
CC: Kalle Valo <kvalo@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   e8926783181347365c9f2a9f5b7c4220be6e3b45
commit: 5625f965d7644b4dc6a71d74021cfe093ad34eea [2712/12265] wilc1000: mov=
e wilc driver out of staging
:::::: branch date: 19 hours ago
:::::: commit date: 5 weeks ago
compiler: nds32le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/net/wireless/microchip/wilc1000/cfg80211.c:1096:9: warning: Iden=
tical condition 'ret', second condition is always false [identicalCondition=
AfterEarlyExit]
    return ret;
           ^
   drivers/net/wireless/microchip/wilc1000/cfg80211.c:1081:6: note: first c=
ondition
    if (ret)
        ^
   drivers/net/wireless/microchip/wilc1000/cfg80211.c:1096:9: note: second =
condition
    return ret;
           ^
>> drivers/net/wireless/microchip/wilc1000/cfg80211.c:844:6: warning: Varia=
ble 'ret' is reassigned a value before the old one has been used. [redundan=
tAssignment]
    ret =3D wilc_hif_set_cfg(vif, &cfg_param_val);
        ^
   drivers/net/wireless/microchip/wilc1000/cfg80211.c:787:0: note: Variable=
 'ret' is reassigned a value before the old one has been used.
    int ret =3D -EINVAL;
   ^
   drivers/net/wireless/microchip/wilc1000/cfg80211.c:844:6: note: Variable=
 'ret' is reassigned a value before the old one has been used.
    ret =3D wilc_hif_set_cfg(vif, &cfg_param_val);
        ^
   drivers/net/wireless/microchip/wilc1000/cfg80211.c:1427:6: warning: Vari=
able 'ret' is reassigned a value before the old one has been used. [redunda=
ntAssignment]
    ret =3D wilc_del_station(vif, mac);
        ^
   drivers/net/wireless/microchip/wilc1000/cfg80211.c:1425:7: note: Variabl=
e 'ret' is reassigned a value before the old one has been used.
     ret =3D wilc_del_allstation(vif, info->sta_associated_bss);
         ^
   drivers/net/wireless/microchip/wilc1000/cfg80211.c:1427:6: note: Variabl=
e 'ret' is reassigned a value before the old one has been used.
    ret =3D wilc_del_station(vif, mac);
        ^
>> drivers/net/wireless/microchip/wilc1000/cfg80211.c:953:29: warning: Loca=
l variable e shadows outer variable [shadowVar]
     struct wilc_ch_list_elem *e;
                               ^
   drivers/net/wireless/microchip/wilc1000/cfg80211.c:930:26: note: Shadowe=
d declaration
    struct wilc_attr_entry *e;
                            ^
   drivers/net/wireless/microchip/wilc1000/cfg80211.c:953:29: note: Shadow =
variable
     struct wilc_ch_list_elem *e;
                               ^
--
>> drivers/net/wireless/microchip/wilc1000/netdev.c:703:20: warning: Local =
variable vif shadows outer variable [shadowVar]
     struct wilc_vif *vif;
                      ^
   drivers/net/wireless/microchip/wilc1000/netdev.c:674:19: note: Shadowed =
declaration
    struct wilc_vif *vif =3D netdev_priv(ndev);
                     ^
   drivers/net/wireless/microchip/wilc1000/netdev.c:703:20: note: Shadow va=
riable
     struct wilc_vif *vif;
                      ^
--
>> drivers/net/wireless/microchip/wilc1000/sdio.c:901:7: warning: Local var=
iable reg shadows outer variable [shadowVar]
     u32 reg;
         ^
   drivers/net/wireless/microchip/wilc1000/sdio.c:879:6: note: Shadowed dec=
laration
    u32 reg;
        ^
   drivers/net/wireless/microchip/wilc1000/sdio.c:901:7: note: Shadow varia=
ble
     u32 reg;
         ^

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D5625f965d7644b4dc6a71d74021cfe093ad34eea
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout 5625f965d7644b4dc6a71d74021cfe093ad34eea
vim +/ret +1096 drivers/net/wireless/microchip/wilc1000/cfg80211.c

c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11   927  =

4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   928  static inline void wilc_wfi_cfg_parse_ch_attr(u8 *buf,=
 u32 len, u8 sta_ch)
0a0dac38d4060d drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-03-07   929  {
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   930  	struct wilc_attr_entry *e;
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   931  	struct wilc_attr_ch_list *ch_list;
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   932  	struct wilc_attr_oper_ch *op_ch;
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   933  	u32 index =3D 0;
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   934  	u8 ch_list_idx =3D 0;
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   935  	u8 op_ch_idx =3D 0;
0a0dac38d4060d drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-03-07   936  =

4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   937  	if (sta_ch =3D=3D WILC_INVALID_CHANNEL)
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   938  		return;
0a0dac38d4060d drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-03-07   939  =

4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   940  	while (index + sizeof(*e) <=3D len) {
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   941  		e =3D (struct wilc_attr_entry *)&buf[index];
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   942  		if (e->attr_type =3D=3D IEEE80211_P2P_ATTR_CHANNEL_L=
IST)
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   943  			ch_list_idx =3D index;
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   944  		else if (e->attr_type =3D=3D IEEE80211_P2P_ATTR_OPER=
_CHANNEL)
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   945  			op_ch_idx =3D index;
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   946  		if (ch_list_idx && op_ch_idx)
0a0dac38d4060d drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-03-07   947  			break;
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   948  		index +=3D le16_to_cpu(e->attr_len) + sizeof(*e);
0a0dac38d4060d drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-03-07   949  	}
0a0dac38d4060d drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-03-07   950  =

4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   951  	if (ch_list_idx) {
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   952  		u16 attr_size;
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12  @953  		struct wilc_ch_list_elem *e;
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   954  		int i;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11   955  =

4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   956  		ch_list =3D (struct wilc_attr_ch_list *)&buf[ch_list=
_idx];
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   957  		attr_size =3D le16_to_cpu(ch_list->attr_len);
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   958  		for (i =3D 0; i < attr_size;) {
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   959  			e =3D (struct wilc_ch_list_elem *)(ch_list->elem + =
i);
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   960  			if (e->op_class =3D=3D WILC_WLAN_OPERATING_CLASS_2_=
4GHZ) {
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   961  				memset(e->ch_list, sta_ch, e->no_of_channels);
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   962  				break;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11   963  			}
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   964  			i +=3D e->no_of_channels;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11   965  		}
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11   966  	}
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11   967  =

4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   968  	if (op_ch_idx) {
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   969  		op_ch =3D (struct wilc_attr_oper_ch *)&buf[op_ch_idx=
];
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   970  		op_ch->op_class =3D WILC_WLAN_OPERATING_CLASS_2_4GHZ;
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   971  		op_ch->op_channel =3D sta_ch;
7868ee3b73e773 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-04-23   972  	}
7868ee3b73e773 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-04-23   973  }
7868ee3b73e773 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-04-23   974  =

9bc061e8805487 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-06-26   975  void wilc_wfi_p2p_rx(struct wilc_vif *vif, u8 *buff, u=
32 size)
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11   976  {
0d0f0b06a13e44 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05   977  	struct wilc *wl =3D vif->wilc;
9bc061e8805487 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-06-26   978  	struct wilc_priv *priv =3D &vif->priv;
9bc061e8805487 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-06-26   979  	struct host_if_drv *wfi_drv =3D priv->hif_drv;
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   980  	struct ieee80211_mgmt *mgmt;
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   981  	struct wilc_vendor_specific_ie *p;
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   982  	struct wilc_p2p_pub_act_frame *d;
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   983  	int ie_offset =3D offsetof(struct ieee80211_mgmt, u) =
+ sizeof(*d);
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   984  	const u8 *vendor_ie;
4e4467fdd6e89f drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Chaehyun L=
im 2015-06-11   985  	u32 header, pkt_offset;
34db1aac17ff8f drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-04-23   986  	s32 freq;
8dfaafd6398ec4 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Chaehyun L=
im 2015-08-18   987  =

7a047abbb6ef8a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Chuhong Yu=
an 2019-07-25   988  	header =3D get_unaligned_le32(buff - HOST_HDR_OFFSET);
38f193dff5cc8e drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-14   989  	pkt_offset =3D FIELD_GET(WILC_PKT_HDR_OFFSET_FIELD, h=
eader);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11   990  =

c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11   991  	if (pkt_offset & IS_MANAGMEMENT_CALLBACK) {
7868ee3b73e773 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-04-23   992  		bool ack =3D false;
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   993  		struct ieee80211_hdr *hdr =3D (struct ieee80211_hdr =
*)buff;
7868ee3b73e773 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-04-23   994  =

4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12   995  		if (ieee80211_is_probe_resp(hdr->frame_control) ||
7868ee3b73e773 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-04-23   996  		    pkt_offset & IS_MGMT_STATUS_SUCCES)
7868ee3b73e773 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-04-23   997  			ack =3D true;
7868ee3b73e773 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-04-23   998  =

9bc061e8805487 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-06-26   999  		cfg80211_mgmt_tx_status(&priv->wdev, priv->tx_cookie=
, buff,
9bc061e8805487 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-06-26  1000  					size, ack, GFP_KERNEL);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1001  		return;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1002  	}
7868ee3b73e773 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-04-23  1003  =

0d0f0b06a13e44 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05  1004  	freq =3D ieee80211_channel_to_frequency(wl->op_ch, NL=
80211_BAND_2GHZ);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1005  =

4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12  1006  	mgmt =3D (struct ieee80211_mgmt *)buff;
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12  1007  	if (!ieee80211_is_action(mgmt->frame_control))
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12  1008  		goto out_rx_mgmt;
7868ee3b73e773 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-04-23  1009  =

7868ee3b73e773 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-04-23  1010  	if (priv->cfg_scanning &&
7868ee3b73e773 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-04-23  1011  	    time_after_eq(jiffies, (unsigned long)wfi_drv->p2=
p_timeout)) {
9bc061e8805487 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-06-26  1012  		netdev_dbg(vif->ndev, "Receiving action wrong ch\n");
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1013  		return;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1014  	}
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1015  =

4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12  1016  	if (!ieee80211_is_public_action((struct ieee80211_hdr=
 *)buff, size))
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12  1017  		goto out_rx_mgmt;
7868ee3b73e773 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-04-23  1018  =

4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12  1019  	d =3D (struct wilc_p2p_pub_act_frame *)(&mgmt->u.acti=
on);
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12  1020  	if (d->oui_subtype !=3D GO_NEG_REQ && d->oui_subtype =
!=3D GO_NEG_RSP &&
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12  1021  	    d->oui_subtype !=3D P2P_INV_REQ && d->oui_subtype=
 !=3D P2P_INV_RSP)
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12  1022  		goto out_rx_mgmt;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1023  =

4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12  1024  	vendor_ie =3D cfg80211_find_vendor_ie(WLAN_OUI_WFA, W=
LAN_OUI_TYPE_WFA_P2P,
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12  1025  					    buff + ie_offset, size - ie_offset);
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12  1026  	if (!vendor_ie)
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12  1027  		goto out_rx_mgmt;
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12  1028  =

4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12  1029  	p =3D (struct wilc_vendor_specific_ie *)vendor_ie;
4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12  1030  	wilc_wfi_cfg_parse_ch_attr(p->attr, p->tag_len - 4, v=
if->wilc->sta_ch);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1031  =

4fb8b5aa2a1126 drivers/staging/wilc1000/cfg80211.c               Ajay Singh=
   2020-02-12  1032  out_rx_mgmt:
9bc061e8805487 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-06-26  1033  	cfg80211_rx_mgmt(&priv->wdev, freq, 0, buff, size, 0);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1034  }
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1035  =

8c9fee22470452 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-01-16  1036  static void wilc_wfi_mgmt_tx_complete(void *priv, int =
status)
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1037  {
f5436edeedfbd1 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-07  1038  	struct wilc_p2p_mgmt_data *pv_data =3D priv;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1039  =

c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1040  	kfree(pv_data->buff);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1041  	kfree(pv_data);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1042  }
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1043  =

b6c6cd11c7a633 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05  1044  static void wilc_wfi_remain_on_channel_expired(void *d=
ata, u64 cookie)
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1045  {
9bc061e8805487 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-06-26  1046  	struct wilc_vif *vif =3D data;
9bc061e8805487 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-06-26  1047  	struct wilc_priv *priv =3D &vif->priv;
4d03c3d51bbfe2 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-05-11  1048  	struct wilc_wfi_p2p_listen_params *params =3D &priv->=
remain_on_ch_params;
8dfaafd6398ec4 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Chaehyun L=
im 2015-08-18  1049  =

b6c6cd11c7a633 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05  1050  	if (cookie !=3D params->listen_cookie)
4d03c3d51bbfe2 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-05-11  1051  		return;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1052  =

3b127bd9b7a3d9 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-01-16  1053  	priv->p2p_listen_state =3D false;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1054  =

9bc061e8805487 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-06-26  1055  	cfg80211_remain_on_channel_expired(&priv->wdev, param=
s->listen_cookie,
4d03c3d51bbfe2 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-05-11  1056  					   params->listen_ch, GFP_KERNEL);
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1057  }
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1058  =

6d19d695e091c2 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Chaehyun L=
im 2015-09-14  1059  static int remain_on_channel(struct wiphy *wiphy,
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1060  			     struct wireless_dev *wdev,
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1061  			     struct ieee80211_channel *chan,
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1062  			     unsigned int duration, u64 *cookie)
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1063  {
82120ec7afc3d6 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-07-19  1064  	int ret =3D 0;
9bc061e8805487 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-06-26  1065  	struct wilc_vif *vif =3D netdev_priv(wdev->netdev);
9bc061e8805487 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-06-26  1066  	struct wilc_priv *priv =3D &vif->priv;
b6c6cd11c7a633 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05  1067  	u64 id;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1068  =

c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1069  	if (wdev->iftype =3D=3D NL80211_IFTYPE_AP) {
e3f16965c9d473 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Chris Park=
   2016-02-04  1070  		netdev_dbg(vif->ndev, "Required while in AP mode\n");
ffde26700840c7 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-01-16  1071  		return ret;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1072  	}
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1073  =

b6c6cd11c7a633 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05  1074  	id =3D ++priv->inc_roc_cookie;
b6c6cd11c7a633 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05  1075  	if (id =3D=3D 0)
b6c6cd11c7a633 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05  1076  		id =3D ++priv->inc_roc_cookie;
b6c6cd11c7a633 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05  1077  =

b6c6cd11c7a633 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05  1078  	ret =3D wilc_remain_on_channel(vif, id, duration, cha=
n->hw_value,
b6c6cd11c7a633 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05  1079  				     wilc_wfi_remain_on_channel_expired,
9bc061e8805487 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-06-26  1080  				     (void *)vif);
b6c6cd11c7a633 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05  1081  	if (ret)
b6c6cd11c7a633 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05  1082  		return ret;
b6c6cd11c7a633 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05  1083  =

0d0f0b06a13e44 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05  1084  	vif->wilc->op_ch =3D chan->hw_value;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1085  =

3378860c12a0f0 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-01-16  1086  	priv->remain_on_ch_params.listen_ch =3D chan;
b6c6cd11c7a633 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05  1087  	priv->remain_on_ch_params.listen_cookie =3D id;
b6c6cd11c7a633 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05  1088  	*cookie =3D id;
b6c6cd11c7a633 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05  1089  	priv->p2p_listen_state =3D true;
3378860c12a0f0 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2018-01-16  1090  	priv->remain_on_ch_params.listen_duration =3D duratio=
n;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1091  =

b6c6cd11c7a633 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05  1092  	cfg80211_ready_on_channel(wdev, *cookie, chan, durati=
on, GFP_KERNEL);
b6c6cd11c7a633 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05  1093  	mod_timer(&vif->hif_drv->remain_on_ch_timer,
3a4cffe67f2fae drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-10-18  1094  		  jiffies + msecs_to_jiffies(duration + 1000));
b6c6cd11c7a633 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05  1095  =

b6c6cd11c7a633 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Ajay Singh=
   2019-02-05 @1096  	return ret;
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1097  }
c5c77ba18ea66a drivers/staging/wilc1000/wilc_wfi_cfgoperations.c Johnny Kim=
   2015-05-11  1098  =


:::::: The code at line 1096 was first introduced by commit
:::::: b6c6cd11c7a633a1194fd23f07322579da79d4ee staging: wilc1000: refactor=
 code to use cookie information

:::::: TO: Ajay Singh <ajay.kathat@microchip.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7178948748184687281==--

