Content-Type: multipart/mixed; boundary="===============5048540274353716312=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/marvell/mwifiex/cfg80211.c:1307 mwifiex_cfg80211_change_virtual_intf() warn: ignoring unreachable code.
Date: Thu, 21 Apr 2022 20:20:22 +0800
Message-ID: <202204212030.4RUXt44G-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5048540274353716312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Jonas Dre=C3=9Fler" <verdre@v0yd.nl>
CC: Kalle Valo <kvalo@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b253435746d9a4a701b5f09211b9c14d3370d0da
commit: abe3a2c9ead8fd95db141ea1df8d96c48cad3893 mwifiex: Use function to c=
heck whether interface type change is allowed
date:   7 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-m001-20220418 (https://download.01.org/0day-ci/ar=
chive/20220421/202204212030.4RUXt44G-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

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

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5048540274353716312==--

