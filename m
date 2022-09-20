Content-Type: multipart/mixed; boundary="===============3418785855291464665=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/microchip/ksz_common.c:1308 ksz_switch_register() warn: potentially one past the end of array 'dev->ports[port_num]'
Date: Tue, 20 Sep 2022 14:28:23 +0800
Message-ID: <202209201432.sI8ai1Lv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3418785855291464665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arun Ramadoss <arun.ramadoss@microchip.com>

Hi Arun,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   521a547ced6477c54b4b0cc206000406c221b4d6
commit: 07bca160469b4d19ca0a35bc83b26ed18fcbd96d net: dsa: microchip: commo=
n menuconfig for ksz series switch
date:   3 months ago
:::::: branch date: 33 hours ago
:::::: commit date: 3 months ago
config: csky-randconfig-m041-20220918 (https://download.01.org/0day-ci/arch=
ive/20220920/202209201432.sI8ai1Lv-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/dsa/microchip/ksz_common.c:1308 ksz_switch_register() warn: pot=
entially one past the end of array 'dev->ports[port_num]'

vim +1308 drivers/net/dsa/microchip/ksz_common.c

b987e98e50ab90 Woojung Huh       2017-05-31  1211  =

c2e866911e2540 Tristram Ha       2018-11-20  1212  int ksz_switch_register(=
struct ksz_device *dev,
c2e866911e2540 Tristram Ha       2018-11-20  1213  			const struct ksz_dev_=
ops *ops)
b987e98e50ab90 Woojung Huh       2017-05-31  1214  {
462d525018f068 Arun Ramadoss     2022-05-17  1215  	const struct ksz_chip_d=
ata *info;
912aae27c6af66 Helmut Grohne     2020-09-24  1216  	struct device_node *por=
t, *ports;
0c65b2b90d13c1 Andrew Lunn       2019-11-04  1217  	phy_interface_t interfa=
ce;
edecfa98f602a5 Helmut Grohne     2020-09-08  1218  	unsigned int port_num;
b987e98e50ab90 Woojung Huh       2017-05-31  1219  	int ret;
198b34783ab10d Arun Ramadoss     2022-05-17  1220  	int i;
b987e98e50ab90 Woojung Huh       2017-05-31  1221  =

b987e98e50ab90 Woojung Huh       2017-05-31  1222  	if (dev->pdata)
b987e98e50ab90 Woojung Huh       2017-05-31  1223  		dev->chip_id =3D dev->=
pdata->chip_id;
b987e98e50ab90 Woojung Huh       2017-05-31  1224  =

924352c3d6347d Marek Vasut       2018-12-10  1225  	dev->reset_gpio =3D dev=
m_gpiod_get_optional(dev->dev, "reset",
924352c3d6347d Marek Vasut       2018-12-10  1226  						  GPIOD_OUT_LOW);
924352c3d6347d Marek Vasut       2018-12-10  1227  	if (IS_ERR(dev->reset_g=
pio))
924352c3d6347d Marek Vasut       2018-12-10  1228  		return PTR_ERR(dev->re=
set_gpio);
924352c3d6347d Marek Vasut       2018-12-10  1229  =

924352c3d6347d Marek Vasut       2018-12-10  1230  	if (dev->reset_gpio) {
22e72b5e049b95 Marek Vasut       2019-06-23  1231  		gpiod_set_value_cansle=
ep(dev->reset_gpio, 1);
5b797980908ac8 Paul Barker       2020-09-09  1232  		usleep_range(10000, 12=
000);
22e72b5e049b95 Marek Vasut       2019-06-23  1233  		gpiod_set_value_cansle=
ep(dev->reset_gpio, 0);
1c45ba93d34cd6 Marek Vasut       2021-01-20  1234  		msleep(100);
924352c3d6347d Marek Vasut       2018-12-10  1235  	}
924352c3d6347d Marek Vasut       2018-12-10  1236  =

7049f9b5d0529a Tristram Ha       2019-02-22  1237  	mutex_init(&dev->dev_mu=
tex);
013572a236ef53 Marek Vasut       2019-10-16  1238  	mutex_init(&dev->regmap=
_mutex);
284fb78ed75721 Tristram Ha       2018-11-02  1239  	mutex_init(&dev->alu_mu=
tex);
284fb78ed75721 Tristram Ha       2018-11-02  1240  	mutex_init(&dev->vlan_m=
utex);
284fb78ed75721 Tristram Ha       2018-11-02  1241  =

91a98917a88399 Arun Ramadoss     2022-06-17  1242  	ret =3D ksz_switch_dete=
ct(dev);
91a98917a88399 Arun Ramadoss     2022-06-17  1243  	if (ret)
91a98917a88399 Arun Ramadoss     2022-06-17  1244  		return ret;
b987e98e50ab90 Woojung Huh       2017-05-31  1245  =

462d525018f068 Arun Ramadoss     2022-05-17  1246  	info =3D ksz_lookup_inf=
o(dev->chip_id);
462d525018f068 Arun Ramadoss     2022-05-17  1247  	if (!info)
462d525018f068 Arun Ramadoss     2022-05-17  1248  		return -ENODEV;
462d525018f068 Arun Ramadoss     2022-05-17  1249  =

462d525018f068 Arun Ramadoss     2022-05-17  1250  	/* Update the compatibl=
e info with the probed one */
462d525018f068 Arun Ramadoss     2022-05-17  1251  	dev->info =3D info;
462d525018f068 Arun Ramadoss     2022-05-17  1252  =

91a98917a88399 Arun Ramadoss     2022-06-17  1253  	dev_info(dev->dev, "fou=
nd switch: %s, rev %i\n",
91a98917a88399 Arun Ramadoss     2022-06-17  1254  		 dev->info->dev_name, =
dev->chip_rev);
91a98917a88399 Arun Ramadoss     2022-06-17  1255  =

eee16b147121ce Arun Ramadoss     2022-05-17  1256  	ret =3D ksz_check_devic=
e_id(dev);
eee16b147121ce Arun Ramadoss     2022-05-17  1257  	if (ret)
eee16b147121ce Arun Ramadoss     2022-05-17  1258  		return ret;
eee16b147121ce Arun Ramadoss     2022-05-17  1259  =

91a98917a88399 Arun Ramadoss     2022-06-17  1260  	dev->dev_ops =3D ops;
91a98917a88399 Arun Ramadoss     2022-06-17  1261  =

c2e866911e2540 Tristram Ha       2018-11-20  1262  	ret =3D dev->dev_ops->i=
nit(dev);
b987e98e50ab90 Woojung Huh       2017-05-31  1263  	if (ret)
b987e98e50ab90 Woojung Huh       2017-05-31  1264  		return ret;
b987e98e50ab90 Woojung Huh       2017-05-31  1265  =

198b34783ab10d Arun Ramadoss     2022-05-17  1266  	dev->ports =3D devm_kza=
lloc(dev->dev,
198b34783ab10d Arun Ramadoss     2022-05-17  1267  				  dev->info->port_cn=
t * sizeof(struct ksz_port),
198b34783ab10d Arun Ramadoss     2022-05-17  1268  				  GFP_KERNEL);
198b34783ab10d Arun Ramadoss     2022-05-17  1269  	if (!dev->ports)
198b34783ab10d Arun Ramadoss     2022-05-17  1270  		return -ENOMEM;
198b34783ab10d Arun Ramadoss     2022-05-17  1271  =

198b34783ab10d Arun Ramadoss     2022-05-17  1272  	for (i =3D 0; i < dev->=
info->port_cnt; i++) {
198b34783ab10d Arun Ramadoss     2022-05-17  1273  		spin_lock_init(&dev->p=
orts[i].mib.stats64_lock);
198b34783ab10d Arun Ramadoss     2022-05-17  1274  		mutex_init(&dev->ports=
[i].mib.cnt_mutex);
198b34783ab10d Arun Ramadoss     2022-05-17  1275  		dev->ports[i].mib.coun=
ters =3D
198b34783ab10d Arun Ramadoss     2022-05-17  1276  			devm_kzalloc(dev->dev,
198b34783ab10d Arun Ramadoss     2022-05-17  1277  				     sizeof(u64) * (=
dev->info->mib_cnt + 1),
198b34783ab10d Arun Ramadoss     2022-05-17  1278  				     GFP_KERNEL);
198b34783ab10d Arun Ramadoss     2022-05-17  1279  		if (!dev->ports[i].mib=
.counters)
198b34783ab10d Arun Ramadoss     2022-05-17  1280  			return -ENOMEM;
198b34783ab10d Arun Ramadoss     2022-05-17  1281  	}
198b34783ab10d Arun Ramadoss     2022-05-17  1282  =

198b34783ab10d Arun Ramadoss     2022-05-17  1283  	/* set the real number =
of ports */
198b34783ab10d Arun Ramadoss     2022-05-17  1284  	dev->ds->num_ports =3D =
dev->info->port_cnt;
198b34783ab10d Arun Ramadoss     2022-05-17  1285  =

8c29bebb1f8a68 Tristram Ha       2019-02-28  1286  	/* Host port interface =
will be self detected, or specifically set in
8c29bebb1f8a68 Tristram Ha       2019-02-28  1287  	 * device tree.
8c29bebb1f8a68 Tristram Ha       2019-02-28  1288  	 */
462d525018f068 Arun Ramadoss     2022-05-17  1289  	for (port_num =3D 0; po=
rt_num < dev->info->port_cnt; ++port_num)
edecfa98f602a5 Helmut Grohne     2020-09-08  1290  		dev->ports[port_num].i=
nterface =3D PHY_INTERFACE_MODE_NA;
c2e866911e2540 Tristram Ha       2018-11-20  1291  	if (dev->dev->of_node) {
0c65b2b90d13c1 Andrew Lunn       2019-11-04  1292  		ret =3D of_get_phy_mod=
e(dev->dev->of_node, &interface);
0c65b2b90d13c1 Andrew Lunn       2019-11-04  1293  		if (ret =3D=3D 0)
edecfa98f602a5 Helmut Grohne     2020-09-08  1294  			dev->compat_interface=
 =3D interface;
44e53c88828f2b Christian Eggers  2020-11-20  1295  		ports =3D of_get_child=
_by_name(dev->dev->of_node, "ethernet-ports");
44e53c88828f2b Christian Eggers  2020-11-20  1296  		if (!ports)
912aae27c6af66 Helmut Grohne     2020-09-24  1297  			ports =3D of_get_chil=
d_by_name(dev->dev->of_node, "ports");
912aae27c6af66 Helmut Grohne     2020-09-24  1298  		if (ports)
912aae27c6af66 Helmut Grohne     2020-09-24  1299  			for_each_available_ch=
ild_of_node(ports, port) {
912aae27c6af66 Helmut Grohne     2020-09-24  1300  				if (of_property_read=
_u32(port, "reg",
912aae27c6af66 Helmut Grohne     2020-09-24  1301  							 &port_num))
edecfa98f602a5 Helmut Grohne     2020-09-08  1302  					continue;
84f7e0bb4809f4 kernel test robot 2021-07-11  1303  				if (!(dev->port_mask=
 & BIT(port_num))) {
84f7e0bb4809f4 kernel test robot 2021-07-11  1304  					of_node_put(port);
edecfa98f602a5 Helmut Grohne     2020-09-08  1305  					return -EINVAL;
84f7e0bb4809f4 kernel test robot 2021-07-11  1306  				}
912aae27c6af66 Helmut Grohne     2020-09-24  1307  				of_get_phy_mode(port,
912aae27c6af66 Helmut Grohne     2020-09-24 @1308  						&dev->ports[port_n=
um].interface);
edecfa98f602a5 Helmut Grohne     2020-09-08  1309  			}
79c8bd15b61eca Robert Hancock    2019-06-12  1310  		dev->synclko_125 =3D o=
f_property_read_bool(dev->dev->of_node,
79c8bd15b61eca Robert Hancock    2019-06-12  1311  							 "microchip,syncl=
ko-125");
48bf8b8a04c9cd Robert Hancock    2022-01-27  1312  		dev->synclko_disable =
=3D of_property_read_bool(dev->dev->of_node,
48bf8b8a04c9cd Robert Hancock    2022-01-27  1313  							     "microchip,s=
ynclko-disable");
48bf8b8a04c9cd Robert Hancock    2022-01-27  1314  		if (dev->synclko_125 &=
& dev->synclko_disable) {
48bf8b8a04c9cd Robert Hancock    2022-01-27  1315  			dev_err(dev->dev, "in=
consistent synclko settings\n");
48bf8b8a04c9cd Robert Hancock    2022-01-27  1316  			return -EINVAL;
48bf8b8a04c9cd Robert Hancock    2022-01-27  1317  		}
c2e866911e2540 Tristram Ha       2018-11-20  1318  	}
c2e866911e2540 Tristram Ha       2018-11-20  1319  =

c2e866911e2540 Tristram Ha       2018-11-20  1320  	ret =3D dsa_register_sw=
itch(dev->ds);
c2e866911e2540 Tristram Ha       2018-11-20  1321  	if (ret) {
c2e866911e2540 Tristram Ha       2018-11-20  1322  		dev->dev_ops->exit(dev=
);
c2e866911e2540 Tristram Ha       2018-11-20  1323  		return ret;
c2e866911e2540 Tristram Ha       2018-11-20  1324  	}
c2e866911e2540 Tristram Ha       2018-11-20  1325  =

8098bd69bc4e92 Christian Eggers  2020-10-12  1326  	/* Read MIB counters ev=
ery 30 seconds to avoid overflow. */
12c740c8683fed Oleksij Rempel    2022-02-21  1327  	dev->mib_read_interval =
=3D msecs_to_jiffies(5000);
8098bd69bc4e92 Christian Eggers  2020-10-12  1328  =

8098bd69bc4e92 Christian Eggers  2020-10-12  1329  	/* Start the MIB timer.=
 */
8098bd69bc4e92 Christian Eggers  2020-10-12  1330  	schedule_delayed_work(&=
dev->mib_read, 0);
8098bd69bc4e92 Christian Eggers  2020-10-12  1331  =

7a8988a17c48bc Arun Ramadoss     2022-06-22  1332  	return ret;
b987e98e50ab90 Woojung Huh       2017-05-31  1333  }
b987e98e50ab90 Woojung Huh       2017-05-31  1334  EXPORT_SYMBOL(ksz_switch=
_register);
b987e98e50ab90 Woojung Huh       2017-05-31  1335  =


:::::: The code at line 1308 was first introduced by commit
:::::: 912aae27c6af6605eae967ab540c5e26bd76d421 net: dsa: microchip: really=
 look for phy-mode in port nodes

:::::: TO: Helmut Grohne <helmut.grohne@intenta.de>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3418785855291464665==--

