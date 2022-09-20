Content-Type: multipart/mixed; boundary="===============4507641188091882412=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4378/8235] drivers/net/ethernet/freescale/fman/fman_memac.c:1286 memac_initialization() error: uninitialized symbol 'fixed_link'.
Date: Tue, 20 Sep 2022 22:14:17 +0800
Message-ID: <202209202227.TZKzS00j-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4507641188091882412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Sean Anderson <sean.anderson@seco.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ef08d387bbbc20df740ced8caee0ffac835869ac
commit: 302376feec1d4e351faf31df17fdb22db685961a [4378/8235] net: fman: Mov=
e initialization to mac-specific files
:::::: branch date: 6 hours ago
:::::: commit date: 2 weeks ago
config: csky-randconfig-m041-20220918 (https://download.01.org/0day-ci/arch=
ive/20220920/202209202227.TZKzS00j-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/freescale/fman/fman_memac.c:1286 memac_initialization(=
) error: uninitialized symbol 'fixed_link'.

vim +/fixed_link +1286 drivers/net/ethernet/freescale/fman/fman_memac.c

302376feec1d4e Sean Anderson 2022-09-02  1199  =

302376feec1d4e Sean Anderson 2022-09-02  1200  int memac_initialization(str=
uct mac_device *mac_dev,
302376feec1d4e Sean Anderson 2022-09-02  1201  			 struct device_node *mac_=
node)
302376feec1d4e Sean Anderson 2022-09-02  1202  {
302376feec1d4e Sean Anderson 2022-09-02  1203  	int			 err;
302376feec1d4e Sean Anderson 2022-09-02  1204  	struct fman_mac_params	 par=
ams;
302376feec1d4e Sean Anderson 2022-09-02  1205  	struct fixed_phy_status *fi=
xed_link;
302376feec1d4e Sean Anderson 2022-09-02  1206  =

302376feec1d4e Sean Anderson 2022-09-02  1207  	mac_dev->set_promisc		=3D m=
emac_set_promiscuous;
302376feec1d4e Sean Anderson 2022-09-02  1208  	mac_dev->change_addr		=3D m=
emac_modify_mac_address;
302376feec1d4e Sean Anderson 2022-09-02  1209  	mac_dev->add_hash_mac_addr	=
=3D memac_add_hash_mac_address;
302376feec1d4e Sean Anderson 2022-09-02  1210  	mac_dev->remove_hash_mac_ad=
dr	=3D memac_del_hash_mac_address;
302376feec1d4e Sean Anderson 2022-09-02  1211  	mac_dev->set_tx_pause		=3D =
memac_set_tx_pause_frames;
302376feec1d4e Sean Anderson 2022-09-02  1212  	mac_dev->set_rx_pause		=3D =
memac_accept_rx_pause_frames;
302376feec1d4e Sean Anderson 2022-09-02  1213  	mac_dev->set_exception		=3D=
 memac_set_exception;
302376feec1d4e Sean Anderson 2022-09-02  1214  	mac_dev->set_allmulti		=3D =
memac_set_allmulti;
302376feec1d4e Sean Anderson 2022-09-02  1215  	mac_dev->set_tstamp		=3D me=
mac_set_tstamp;
302376feec1d4e Sean Anderson 2022-09-02  1216  	mac_dev->set_multi		=3D fma=
n_set_multi;
302376feec1d4e Sean Anderson 2022-09-02  1217  	mac_dev->adjust_link       =
     =3D adjust_link_memac;
302376feec1d4e Sean Anderson 2022-09-02  1218  	mac_dev->enable			=3D memac=
_enable;
302376feec1d4e Sean Anderson 2022-09-02  1219  	mac_dev->disable		=3D memac=
_disable;
302376feec1d4e Sean Anderson 2022-09-02  1220  =

302376feec1d4e Sean Anderson 2022-09-02  1221  	err =3D set_fman_mac_params=
(mac_dev, &params);
302376feec1d4e Sean Anderson 2022-09-02  1222  	if (err)
302376feec1d4e Sean Anderson 2022-09-02  1223  		goto _return;
302376feec1d4e Sean Anderson 2022-09-02  1224  	params.internal_phy_node =
=3D of_parse_phandle(mac_node, "pcsphy-handle", 0);
302376feec1d4e Sean Anderson 2022-09-02  1225  =

302376feec1d4e Sean Anderson 2022-09-02  1226  	if (params.max_speed =3D=3D=
 SPEED_10000)
302376feec1d4e Sean Anderson 2022-09-02  1227  		params.phy_if =3D PHY_INTE=
RFACE_MODE_XGMII;
302376feec1d4e Sean Anderson 2022-09-02  1228  =

302376feec1d4e Sean Anderson 2022-09-02  1229  	mac_dev->fman_mac =3D memac=
_config(&params);
302376feec1d4e Sean Anderson 2022-09-02  1230  	if (!mac_dev->fman_mac) {
302376feec1d4e Sean Anderson 2022-09-02  1231  		err =3D -EINVAL;
302376feec1d4e Sean Anderson 2022-09-02  1232  		goto _return;
302376feec1d4e Sean Anderson 2022-09-02  1233  	}
302376feec1d4e Sean Anderson 2022-09-02  1234  =

302376feec1d4e Sean Anderson 2022-09-02  1235  	err =3D memac_cfg_max_frame=
_len(mac_dev->fman_mac, fman_get_max_frm());
302376feec1d4e Sean Anderson 2022-09-02  1236  	if (err < 0)
302376feec1d4e Sean Anderson 2022-09-02  1237  		goto _return_fm_mac_free;
302376feec1d4e Sean Anderson 2022-09-02  1238  =

302376feec1d4e Sean Anderson 2022-09-02  1239  	err =3D memac_cfg_reset_on_=
init(mac_dev->fman_mac, true);
302376feec1d4e Sean Anderson 2022-09-02  1240  	if (err < 0)
302376feec1d4e Sean Anderson 2022-09-02  1241  		goto _return_fm_mac_free;
302376feec1d4e Sean Anderson 2022-09-02  1242  =

302376feec1d4e Sean Anderson 2022-09-02  1243  	if (!mac_dev->phy_node && o=
f_phy_is_fixed_link(mac_node)) {
302376feec1d4e Sean Anderson 2022-09-02  1244  		struct phy_device *phy;
302376feec1d4e Sean Anderson 2022-09-02  1245  =

302376feec1d4e Sean Anderson 2022-09-02  1246  		err =3D of_phy_register_fi=
xed_link(mac_node);
302376feec1d4e Sean Anderson 2022-09-02  1247  		if (err)
302376feec1d4e Sean Anderson 2022-09-02  1248  			goto _return_fm_mac_free;
302376feec1d4e Sean Anderson 2022-09-02  1249  =

302376feec1d4e Sean Anderson 2022-09-02  1250  		fixed_link =3D kzalloc(siz=
eof(*fixed_link), GFP_KERNEL);
302376feec1d4e Sean Anderson 2022-09-02  1251  		if (!fixed_link) {
302376feec1d4e Sean Anderson 2022-09-02  1252  			err =3D -ENOMEM;
302376feec1d4e Sean Anderson 2022-09-02  1253  			goto _return_fm_mac_free;
302376feec1d4e Sean Anderson 2022-09-02  1254  		}
302376feec1d4e Sean Anderson 2022-09-02  1255  =

302376feec1d4e Sean Anderson 2022-09-02  1256  		mac_dev->phy_node =3D of_n=
ode_get(mac_node);
302376feec1d4e Sean Anderson 2022-09-02  1257  		phy =3D of_phy_find_device=
(mac_dev->phy_node);
302376feec1d4e Sean Anderson 2022-09-02  1258  		if (!phy) {
302376feec1d4e Sean Anderson 2022-09-02  1259  			err =3D -EINVAL;
302376feec1d4e Sean Anderson 2022-09-02  1260  			of_node_put(mac_dev->phy_=
node);
302376feec1d4e Sean Anderson 2022-09-02  1261  			goto _return_fixed_link_f=
ree;
302376feec1d4e Sean Anderson 2022-09-02  1262  		}
302376feec1d4e Sean Anderson 2022-09-02  1263  =

302376feec1d4e Sean Anderson 2022-09-02  1264  		fixed_link->link =3D phy->=
link;
302376feec1d4e Sean Anderson 2022-09-02  1265  		fixed_link->speed =3D phy-=
>speed;
302376feec1d4e Sean Anderson 2022-09-02  1266  		fixed_link->duplex =3D phy=
->duplex;
302376feec1d4e Sean Anderson 2022-09-02  1267  		fixed_link->pause =3D phy-=
>pause;
302376feec1d4e Sean Anderson 2022-09-02  1268  		fixed_link->asym_pause =3D=
 phy->asym_pause;
302376feec1d4e Sean Anderson 2022-09-02  1269  =

302376feec1d4e Sean Anderson 2022-09-02  1270  		put_device(&phy->mdio.dev);
302376feec1d4e Sean Anderson 2022-09-02  1271  =

302376feec1d4e Sean Anderson 2022-09-02  1272  		err =3D memac_cfg_fixed_li=
nk(mac_dev->fman_mac, fixed_link);
302376feec1d4e Sean Anderson 2022-09-02  1273  		if (err < 0)
302376feec1d4e Sean Anderson 2022-09-02  1274  			goto _return_fixed_link_f=
ree;
302376feec1d4e Sean Anderson 2022-09-02  1275  	}
302376feec1d4e Sean Anderson 2022-09-02  1276  =

302376feec1d4e Sean Anderson 2022-09-02  1277  	err =3D memac_init(mac_dev-=
>fman_mac);
302376feec1d4e Sean Anderson 2022-09-02  1278  	if (err < 0)
302376feec1d4e Sean Anderson 2022-09-02  1279  		goto _return_fixed_link_fr=
ee;
302376feec1d4e Sean Anderson 2022-09-02  1280  =

302376feec1d4e Sean Anderson 2022-09-02  1281  	dev_info(mac_dev->dev, "FMa=
n MEMAC\n");
302376feec1d4e Sean Anderson 2022-09-02  1282  =

302376feec1d4e Sean Anderson 2022-09-02  1283  	goto _return;
302376feec1d4e Sean Anderson 2022-09-02  1284  =

302376feec1d4e Sean Anderson 2022-09-02  1285  _return_fixed_link_free:
302376feec1d4e Sean Anderson 2022-09-02 @1286  	kfree(fixed_link);

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4507641188091882412==--

