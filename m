Content-Type: multipart/mixed; boundary="===============1179180666451303876=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/marvell/mwifiex/cfg80211.c:1307 mwifiex_cfg80211_change_virtual_intf() warn: ignoring unreachable code.
Date: Sun, 21 Nov 2021 08:51:43 +0800
Message-ID: <202111210832.ur2HmiVQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1179180666451303876==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Jonas Dre=C3=9Fler" <verdre@v0yd.nl>
CC: Kalle Valo <kvalo@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   923dcc5eb0c111eccd51cc7ce1658537e3c38b25
commit: abe3a2c9ead8fd95db141ea1df8d96c48cad3893 mwifiex: Use function to c=
heck whether interface type change is allowed
date:   9 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 9 weeks ago
config: mips-randconfig-m031-20211104 (attached as .config)
compiler: mips-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/wireless/marvell/mwifiex/cfg80211.c:1307 mwifiex_cfg80211_chang=
e_virtual_intf() warn: ignoring unreachable code.

vim +1307 drivers/net/wireless/marvell/mwifiex/cfg80211.c

047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1126  =

047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1127  static int
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1128  mwifiex_change_vif_to_ap(struct net_device *dev,
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1129  			 enum nl80211_iftype curr_iftype,
818a986e4ebace drivers/net/wireless/marvell/mwifiex/cfg80211.c Johannes Ber=
g    2017-04-12  1130  			 enum nl80211_iftype type,
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1131  			 struct vif_params *params)
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1132  {
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1133  	struct mwifiex_private *priv;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1134  	struct mwifiex_adapter *adapter;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1135  =

047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1136  	priv =3D mwifiex_netdev_get_priv(dev);
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1137  =

047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1138  	if (!priv)
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1139  		return -1;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1140  =

047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1141  	adapter =3D priv->adapter;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1142  =

acebe8c10a6eab drivers/net/wireless/mwifiex/cfg80211.c         Zhaoyang Liu=
     2015-05-12  1143  	mwifiex_dbg(adapter, INFO,
acebe8c10a6eab drivers/net/wireless/mwifiex/cfg80211.c         Zhaoyang Liu=
     2015-05-12  1144  		    "%s: changing role to AP\n", dev->name);
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1145  =

047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1146  	if (mwifiex_deinit_priv_params(priv))
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1147  		return -1;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1148  	if (mwifiex_init_new_priv_params(priv, dev, type))
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1149  		return -1;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1150  	if (mwifiex_send_cmd(priv, HostCmd_CMD_SET_BSS_MODE,
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1151  			     HostCmd_ACT_GEN_SET, 0, NULL, true))
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1152  		return -1;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1153  	if (mwifiex_sta_init_cmd(priv, false, false))
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1154  		return -1;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1155  =

047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1156  	switch (curr_iftype) {
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1157  	case NL80211_IFTYPE_P2P_CLIENT:
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1158  	case NL80211_IFTYPE_P2P_GO:
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1159  		adapter->curr_iface_comb.p2p_intf--;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1160  		break;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1161  	case NL80211_IFTYPE_STATION:
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1162  	case NL80211_IFTYPE_ADHOC:
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1163  		adapter->curr_iface_comb.sta_intf--;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1164  		break;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1165  	default:
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1166  		break;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1167  	}
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1168  =

047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1169  	adapter->curr_iface_comb.uap_intf++;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1170  	dev->ieee80211_ptr->iftype =3D type;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1171  	return 0;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1172  }
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao   =
     2011-03-21  1173  /*
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao   =
     2011-03-21  1174   * CFG802.11 operation handler to change interface t=
ype.
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao   =
     2011-03-21  1175   */
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao   =
     2011-03-21  1176  static int
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao   =
     2011-03-21  1177  mwifiex_cfg80211_change_virtual_intf(struct wiphy *w=
iphy,
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao   =
     2011-03-21  1178  				     struct net_device *dev,
818a986e4ebace drivers/net/wireless/marvell/mwifiex/cfg80211.c Johannes Ber=
g    2017-04-12  1179  				     enum nl80211_iftype type,
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao   =
     2011-03-21  1180  				     struct vif_params *params)
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao   =
     2011-03-21  1181  {
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao   =
     2011-03-21  1182  	struct mwifiex_private *priv =3D mwifiex_netdev_get=
_priv(dev);
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1183  	enum nl80211_iftype curr_iftype =3D dev->ieee80211_=
ptr->iftype;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao   =
     2011-03-21  1184  =

c61cfe49f0f0f0 drivers/net/wireless/marvell/mwifiex/cfg80211.c Limin Zhu   =
     2017-11-30  1185  	if (priv->scan_request) {
c61cfe49f0f0f0 drivers/net/wireless/marvell/mwifiex/cfg80211.c Limin Zhu   =
     2017-11-30  1186  		mwifiex_dbg(priv->adapter, ERROR,
c61cfe49f0f0f0 drivers/net/wireless/marvell/mwifiex/cfg80211.c Limin Zhu   =
     2017-11-30  1187  			    "change virtual interface: scan in process\n"=
);
c61cfe49f0f0f0 drivers/net/wireless/marvell/mwifiex/cfg80211.c Limin Zhu   =
     2017-11-30  1188  		return -EBUSY;
c61cfe49f0f0f0 drivers/net/wireless/marvell/mwifiex/cfg80211.c Limin Zhu   =
     2017-11-30  1189  	}
c61cfe49f0f0f0 drivers/net/wireless/marvell/mwifiex/cfg80211.c Limin Zhu   =
     2017-11-30  1190  =

babe2a332dc40b drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1191  	if (type =3D=3D NL80211_IFTYPE_UNSPECIFIED) {
babe2a332dc40b drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1192  		mwifiex_dbg(priv->adapter, INFO,
babe2a332dc40b drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1193  			    "%s: no new type specified, keeping old =
type %d\n",
babe2a332dc40b drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1194  			    dev->name, curr_iftype);
babe2a332dc40b drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1195  		return 0;
babe2a332dc40b drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1196  	}
babe2a332dc40b drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1197  =

babe2a332dc40b drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1198  	if (curr_iftype =3D=3D type) {
babe2a332dc40b drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1199  		mwifiex_dbg(priv->adapter, INFO,
babe2a332dc40b drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1200  			    "%s: interface already is of type %d\n",
babe2a332dc40b drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1201  			    dev->name, curr_iftype);
babe2a332dc40b drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1202  		return 0;
babe2a332dc40b drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1203  	}
babe2a332dc40b drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1204  =

abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1205  	if (!is_vif_type_change_allowed(priv->adapter,=
 curr_iftype, type)) {
abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1206  		mwifiex_dbg(priv->adapter, ERROR,
abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1207  			    "%s: change from type %d to %d is not al=
lowed\n",
abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1208  			    dev->name, curr_iftype, type);
abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1209  		return -EOPNOTSUPP;
abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1210  	}
abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1211  =

047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1212  	switch (curr_iftype) {
4f02341ac27f70 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2012-05-08  1213  	case NL80211_IFTYPE_ADHOC:
4f02341ac27f70 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2012-05-08  1214  		switch (type) {
4f02341ac27f70 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2012-05-08  1215  		case NL80211_IFTYPE_STATION:
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1216  			priv->bss_mode =3D type;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1217  			priv->sec_info.authentication_mode =3D
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1218  						   NL80211_AUTHTYPE_OPEN_SYSTEM;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1219  			dev->ieee80211_ptr->iftype =3D type;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1220  			mwifiex_deauthenticate(priv, NULL);
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1221  			return mwifiex_send_cmd(priv, HostCmd_CMD_SET_BSS=
_MODE,
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1222  						HostCmd_ACT_GEN_SET, 0, NULL,
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1223  						true);
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1224  		case NL80211_IFTYPE_P2P_CLIENT:
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1225  		case NL80211_IFTYPE_P2P_GO:
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1226  			return mwifiex_change_vif_to_p2p(dev, curr_iftype,
818a986e4ebace drivers/net/wireless/marvell/mwifiex/cfg80211.c Johannes Ber=
g    2017-04-12  1227  							 type, params);
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1228  		case NL80211_IFTYPE_AP:
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1229  			return mwifiex_change_vif_to_ap(dev, curr_iftype,=
 type,
818a986e4ebace drivers/net/wireless/marvell/mwifiex/cfg80211.c Johannes Ber=
g    2017-04-12  1230  							params);
4f02341ac27f70 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2012-05-08  1231  		default:
abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1232  			goto errnotsupp;
eecd8250e492ff drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao   =
     2011-03-28  1233  		}
abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1234  =

4f02341ac27f70 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2012-05-08  1235  	case NL80211_IFTYPE_STATION:
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao   =
     2011-03-21  1236  		switch (type) {
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao   =
     2011-03-21  1237  		case NL80211_IFTYPE_ADHOC:
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1238  			priv->bss_mode =3D type;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1239  			priv->sec_info.authentication_mode =3D
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1240  						   NL80211_AUTHTYPE_OPEN_SYSTEM;
e1a2b7a394ad8c drivers/net/wireless/mwifiex/cfg80211.c         Stone Piao  =
     2012-09-25  1241  			dev->ieee80211_ptr->iftype =3D type;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1242  			mwifiex_deauthenticate(priv, NULL);
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1243  			return mwifiex_send_cmd(priv, HostCmd_CMD_SET_BSS=
_MODE,
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1244  						HostCmd_ACT_GEN_SET, 0, NULL,
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1245  						true);
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1246  		case NL80211_IFTYPE_P2P_CLIENT:
9197ab9e5f3016 drivers/net/wireless/mwifiex/cfg80211.c         Stone Piao  =
     2012-09-25  1247  		case NL80211_IFTYPE_P2P_GO:
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1248  			return mwifiex_change_vif_to_p2p(dev, curr_iftype,
818a986e4ebace drivers/net/wireless/marvell/mwifiex/cfg80211.c Johannes Ber=
g    2017-04-12  1249  							 type, params);
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1250  		case NL80211_IFTYPE_AP:
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1251  			return mwifiex_change_vif_to_ap(dev, curr_iftype,=
 type,
818a986e4ebace drivers/net/wireless/marvell/mwifiex/cfg80211.c Johannes Ber=
g    2017-04-12  1252  							params);
4f02341ac27f70 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2012-05-08  1253  		default:
abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1254  			goto errnotsupp;
4f02341ac27f70 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2012-05-08  1255  		}
abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1256  =

4f02341ac27f70 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2012-05-08  1257  	case NL80211_IFTYPE_AP:
4f02341ac27f70 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2012-05-08  1258  		switch (type) {
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1259  		case NL80211_IFTYPE_ADHOC:
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1260  			return mwifiex_change_vif_to_sta_adhoc(dev, curr_=
iftype,
818a986e4ebace drivers/net/wireless/marvell/mwifiex/cfg80211.c Johannes Ber=
g    2017-04-12  1261  							       type, params);
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1262  			break;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1263  		case NL80211_IFTYPE_P2P_CLIENT:
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1264  		case NL80211_IFTYPE_P2P_GO:
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1265  			return mwifiex_change_vif_to_p2p(dev, curr_iftype,
818a986e4ebace drivers/net/wireless/marvell/mwifiex/cfg80211.c Johannes Ber=
g    2017-04-12  1266  							 type, params);
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao   =
     2011-03-21  1267  		default:
abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1268  			goto errnotsupp;
4f02341ac27f70 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2012-05-08  1269  		}
abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1270  =

e1a2b7a394ad8c drivers/net/wireless/mwifiex/cfg80211.c         Stone Piao  =
     2012-09-25  1271  	case NL80211_IFTYPE_P2P_CLIENT:
9197ab9e5f3016 drivers/net/wireless/mwifiex/cfg80211.c         Stone Piao  =
     2012-09-25  1272  	case NL80211_IFTYPE_P2P_GO:
e1a2b7a394ad8c drivers/net/wireless/mwifiex/cfg80211.c         Stone Piao  =
     2012-09-25  1273  		switch (type) {
e1a2b7a394ad8c drivers/net/wireless/mwifiex/cfg80211.c         Stone Piao  =
     2012-09-25  1274  		case NL80211_IFTYPE_STATION:
e79801ffe9c862 drivers/net/wireless/mwifiex/cfg80211.c         Aniket Nagar=
naik 2015-07-16  1275  			if (mwifiex_cfg80211_deinit_p2p(priv))
e1a2b7a394ad8c drivers/net/wireless/mwifiex/cfg80211.c         Stone Piao  =
     2012-09-25  1276  				return -EFAULT;
e79801ffe9c862 drivers/net/wireless/mwifiex/cfg80211.c         Aniket Nagar=
naik 2015-07-16  1277  			priv->adapter->curr_iface_comb.p2p_intf--;
e79801ffe9c862 drivers/net/wireless/mwifiex/cfg80211.c         Aniket Nagar=
naik 2015-07-16  1278  			priv->adapter->curr_iface_comb.sta_intf++;
e1a2b7a394ad8c drivers/net/wireless/mwifiex/cfg80211.c         Stone Piao  =
     2012-09-25  1279  			dev->ieee80211_ptr->iftype =3D type;
3d8bd85c2c9e47 drivers/net/wireless/marvell/mwifiex/cfg80211.c Karthik D A =
     2016-09-28  1280  			if (mwifiex_deinit_priv_params(priv))
3d8bd85c2c9e47 drivers/net/wireless/marvell/mwifiex/cfg80211.c Karthik D A =
     2016-09-28  1281  				return -1;
3d8bd85c2c9e47 drivers/net/wireless/marvell/mwifiex/cfg80211.c Karthik D A =
     2016-09-28  1282  			if (mwifiex_init_new_priv_params(priv, dev, type))
3d8bd85c2c9e47 drivers/net/wireless/marvell/mwifiex/cfg80211.c Karthik D A =
     2016-09-28  1283  				return -1;
3d8bd85c2c9e47 drivers/net/wireless/marvell/mwifiex/cfg80211.c Karthik D A =
     2016-09-28  1284  			if (mwifiex_sta_init_cmd(priv, false, false))
3d8bd85c2c9e47 drivers/net/wireless/marvell/mwifiex/cfg80211.c Karthik D A =
     2016-09-28  1285  				return -1;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1286  			break;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1287  		case NL80211_IFTYPE_ADHOC:
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1288  			if (mwifiex_cfg80211_deinit_p2p(priv))
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1289  				return -EFAULT;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1290  			return mwifiex_change_vif_to_sta_adhoc(dev, curr_=
iftype,
818a986e4ebace drivers/net/wireless/marvell/mwifiex/cfg80211.c Johannes Ber=
g    2017-04-12  1291  							       type, params);
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1292  			break;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1293  		case NL80211_IFTYPE_AP:
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1294  			if (mwifiex_cfg80211_deinit_p2p(priv))
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1295  				return -EFAULT;
047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28  1296  			return mwifiex_change_vif_to_ap(dev, curr_iftype,=
 type,
818a986e4ebace drivers/net/wireless/marvell/mwifiex/cfg80211.c Johannes Ber=
g    2017-04-12  1297  							params);
e1a2b7a394ad8c drivers/net/wireless/mwifiex/cfg80211.c         Stone Piao  =
     2012-09-25  1298  		default:
abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1299  			goto errnotsupp;
e1a2b7a394ad8c drivers/net/wireless/mwifiex/cfg80211.c         Stone Piao  =
     2012-09-25  1300  		}
abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1301  =

4f02341ac27f70 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2012-05-08  1302  	default:
abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1303  		goto errnotsupp;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao   =
     2011-03-21  1304  	}
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao   =
     2011-03-21  1305  =

eecd8250e492ff drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao   =
     2011-03-28  1306  =

047eaaf64503c2 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Pati=
l    2015-01-28 @1307  	return 0;
abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1308  =

abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1309  errnotsupp:
abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1310  	mwifiex_dbg(priv->adapter, ERROR,
abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1311  		    "unsupported interface type transition: %=
d to %d\n",
abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1312  		    curr_iftype, type);
abe3a2c9ead8fd drivers/net/wireless/marvell/mwifiex/cfg80211.c Jonas Dre=C3=
=9Fler    2021-09-14  1313  	return -EOPNOTSUPP;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao   =
     2011-03-21  1314  }
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao   =
     2011-03-21  1315  =


:::::: The code at line 1307 was first introduced by commit
:::::: 047eaaf64503c2902d1e054d5b944de18d14b28c mwifiex: support conversion=
 to any virtual interface type

:::::: TO: Avinash Patil <patila@marvell.com>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1179180666451303876==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1179180666451303876==--

