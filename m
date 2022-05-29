Content-Type: multipart/mixed; boundary="===============5682981899290338733=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/microchip/ksz_common.c:931 ksz_switch_register() warn: potentially one past the end of array 'dev->ports[port_num]'
Date: Mon, 30 May 2022 03:50:05 +0800
Message-ID: <202205300357.juh0cu2M-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5682981899290338733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arun Ramadoss <arun.ramadoss@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b00ed48bb0a7c295facf9036135a573a5cdbe7de
commit: 198b34783ab10d0c58bf2ae2574e7fc704129058 net: dsa: microchip: move =
port memory allocation to ksz_common
date:   11 days ago
:::::: branch date: 62 minutes ago
:::::: commit date: 11 days ago
config: arc-randconfig-m031-20220524 (https://download.01.org/0day-ci/archi=
ve/20220530/202205300357.juh0cu2M-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/dsa/microchip/ksz_common.c:931 ksz_switch_register() warn: pote=
ntially one past the end of array 'dev->ports[port_num]'

vim +931 drivers/net/dsa/microchip/ksz_common.c

b987e98e50ab90 Woojung Huh       2017-05-31  838  =

c2e866911e2540 Tristram Ha       2018-11-20  839  int ksz_switch_register(s=
truct ksz_device *dev,
c2e866911e2540 Tristram Ha       2018-11-20  840  			const struct ksz_dev_o=
ps *ops)
b987e98e50ab90 Woojung Huh       2017-05-31  841  {
462d525018f068 Arun Ramadoss     2022-05-17  842  	const struct ksz_chip_da=
ta *info;
912aae27c6af66 Helmut Grohne     2020-09-24  843  	struct device_node *port=
, *ports;
0c65b2b90d13c1 Andrew Lunn       2019-11-04  844  	phy_interface_t interfac=
e;
edecfa98f602a5 Helmut Grohne     2020-09-08  845  	unsigned int port_num;
b987e98e50ab90 Woojung Huh       2017-05-31  846  	int ret;
198b34783ab10d Arun Ramadoss     2022-05-17  847  	int i;
b987e98e50ab90 Woojung Huh       2017-05-31  848  =

b987e98e50ab90 Woojung Huh       2017-05-31  849  	if (dev->pdata)
b987e98e50ab90 Woojung Huh       2017-05-31  850  		dev->chip_id =3D dev->p=
data->chip_id;
b987e98e50ab90 Woojung Huh       2017-05-31  851  =

924352c3d6347d Marek Vasut       2018-12-10  852  	dev->reset_gpio =3D devm=
_gpiod_get_optional(dev->dev, "reset",
924352c3d6347d Marek Vasut       2018-12-10  853  						  GPIOD_OUT_LOW);
924352c3d6347d Marek Vasut       2018-12-10  854  	if (IS_ERR(dev->reset_gp=
io))
924352c3d6347d Marek Vasut       2018-12-10  855  		return PTR_ERR(dev->res=
et_gpio);
924352c3d6347d Marek Vasut       2018-12-10  856  =

924352c3d6347d Marek Vasut       2018-12-10  857  	if (dev->reset_gpio) {
22e72b5e049b95 Marek Vasut       2019-06-23  858  		gpiod_set_value_canslee=
p(dev->reset_gpio, 1);
5b797980908ac8 Paul Barker       2020-09-09  859  		usleep_range(10000, 120=
00);
22e72b5e049b95 Marek Vasut       2019-06-23  860  		gpiod_set_value_canslee=
p(dev->reset_gpio, 0);
1c45ba93d34cd6 Marek Vasut       2021-01-20  861  		msleep(100);
924352c3d6347d Marek Vasut       2018-12-10  862  	}
924352c3d6347d Marek Vasut       2018-12-10  863  =

7049f9b5d0529a Tristram Ha       2019-02-22  864  	mutex_init(&dev->dev_mut=
ex);
013572a236ef53 Marek Vasut       2019-10-16  865  	mutex_init(&dev->regmap_=
mutex);
284fb78ed75721 Tristram Ha       2018-11-02  866  	mutex_init(&dev->alu_mut=
ex);
284fb78ed75721 Tristram Ha       2018-11-02  867  	mutex_init(&dev->vlan_mu=
tex);
284fb78ed75721 Tristram Ha       2018-11-02  868  =

c2e866911e2540 Tristram Ha       2018-11-20  869  	dev->dev_ops =3D ops;
c2e866911e2540 Tristram Ha       2018-11-20  870  =

c2e866911e2540 Tristram Ha       2018-11-20  871  	if (dev->dev_ops->detect=
(dev))
b987e98e50ab90 Woojung Huh       2017-05-31  872  		return -EINVAL;
b987e98e50ab90 Woojung Huh       2017-05-31  873  =

462d525018f068 Arun Ramadoss     2022-05-17  874  	info =3D ksz_lookup_info=
(dev->chip_id);
462d525018f068 Arun Ramadoss     2022-05-17  875  	if (!info)
462d525018f068 Arun Ramadoss     2022-05-17  876  		return -ENODEV;
462d525018f068 Arun Ramadoss     2022-05-17  877  =

462d525018f068 Arun Ramadoss     2022-05-17  878  	/* Update the compatible=
 info with the probed one */
462d525018f068 Arun Ramadoss     2022-05-17  879  	dev->info =3D info;
462d525018f068 Arun Ramadoss     2022-05-17  880  =

eee16b147121ce Arun Ramadoss     2022-05-17  881  	ret =3D ksz_check_device=
_id(dev);
eee16b147121ce Arun Ramadoss     2022-05-17  882  	if (ret)
eee16b147121ce Arun Ramadoss     2022-05-17  883  		return ret;
eee16b147121ce Arun Ramadoss     2022-05-17  884  =

c2e866911e2540 Tristram Ha       2018-11-20  885  	ret =3D dev->dev_ops->in=
it(dev);
b987e98e50ab90 Woojung Huh       2017-05-31  886  	if (ret)
b987e98e50ab90 Woojung Huh       2017-05-31  887  		return ret;
b987e98e50ab90 Woojung Huh       2017-05-31  888  =

198b34783ab10d Arun Ramadoss     2022-05-17  889  	dev->ports =3D devm_kzal=
loc(dev->dev,
198b34783ab10d Arun Ramadoss     2022-05-17  890  				  dev->info->port_cnt=
 * sizeof(struct ksz_port),
198b34783ab10d Arun Ramadoss     2022-05-17  891  				  GFP_KERNEL);
198b34783ab10d Arun Ramadoss     2022-05-17  892  	if (!dev->ports)
198b34783ab10d Arun Ramadoss     2022-05-17  893  		return -ENOMEM;
198b34783ab10d Arun Ramadoss     2022-05-17  894  =

198b34783ab10d Arun Ramadoss     2022-05-17  895  	for (i =3D 0; i < dev->i=
nfo->port_cnt; i++) {
198b34783ab10d Arun Ramadoss     2022-05-17  896  		spin_lock_init(&dev->po=
rts[i].mib.stats64_lock);
198b34783ab10d Arun Ramadoss     2022-05-17  897  		mutex_init(&dev->ports[=
i].mib.cnt_mutex);
198b34783ab10d Arun Ramadoss     2022-05-17  898  		dev->ports[i].mib.count=
ers =3D
198b34783ab10d Arun Ramadoss     2022-05-17  899  			devm_kzalloc(dev->dev,
198b34783ab10d Arun Ramadoss     2022-05-17  900  				     sizeof(u64) * (d=
ev->info->mib_cnt + 1),
198b34783ab10d Arun Ramadoss     2022-05-17  901  				     GFP_KERNEL);
198b34783ab10d Arun Ramadoss     2022-05-17  902  		if (!dev->ports[i].mib.=
counters)
198b34783ab10d Arun Ramadoss     2022-05-17  903  			return -ENOMEM;
198b34783ab10d Arun Ramadoss     2022-05-17  904  	}
198b34783ab10d Arun Ramadoss     2022-05-17  905  =

198b34783ab10d Arun Ramadoss     2022-05-17  906  	/* set the real number o=
f ports */
198b34783ab10d Arun Ramadoss     2022-05-17  907  	dev->ds->num_ports =3D d=
ev->info->port_cnt;
198b34783ab10d Arun Ramadoss     2022-05-17  908  =

8c29bebb1f8a68 Tristram Ha       2019-02-28  909  	/* Host port interface w=
ill be self detected, or specifically set in
8c29bebb1f8a68 Tristram Ha       2019-02-28  910  	 * device tree.
8c29bebb1f8a68 Tristram Ha       2019-02-28  911  	 */
462d525018f068 Arun Ramadoss     2022-05-17  912  	for (port_num =3D 0; por=
t_num < dev->info->port_cnt; ++port_num)
edecfa98f602a5 Helmut Grohne     2020-09-08  913  		dev->ports[port_num].in=
terface =3D PHY_INTERFACE_MODE_NA;
c2e866911e2540 Tristram Ha       2018-11-20  914  	if (dev->dev->of_node) {
0c65b2b90d13c1 Andrew Lunn       2019-11-04  915  		ret =3D of_get_phy_mode=
(dev->dev->of_node, &interface);
0c65b2b90d13c1 Andrew Lunn       2019-11-04  916  		if (ret =3D=3D 0)
edecfa98f602a5 Helmut Grohne     2020-09-08  917  			dev->compat_interface =
=3D interface;
44e53c88828f2b Christian Eggers  2020-11-20  918  		ports =3D of_get_child_=
by_name(dev->dev->of_node, "ethernet-ports");
44e53c88828f2b Christian Eggers  2020-11-20  919  		if (!ports)
912aae27c6af66 Helmut Grohne     2020-09-24  920  			ports =3D of_get_child=
_by_name(dev->dev->of_node, "ports");
912aae27c6af66 Helmut Grohne     2020-09-24  921  		if (ports)
912aae27c6af66 Helmut Grohne     2020-09-24  922  			for_each_available_chi=
ld_of_node(ports, port) {
912aae27c6af66 Helmut Grohne     2020-09-24  923  				if (of_property_read_=
u32(port, "reg",
912aae27c6af66 Helmut Grohne     2020-09-24  924  							 &port_num))
edecfa98f602a5 Helmut Grohne     2020-09-08  925  					continue;
84f7e0bb4809f4 kernel test robot 2021-07-11  926  				if (!(dev->port_mask =
& BIT(port_num))) {
84f7e0bb4809f4 kernel test robot 2021-07-11  927  					of_node_put(port);
edecfa98f602a5 Helmut Grohne     2020-09-08  928  					return -EINVAL;
84f7e0bb4809f4 kernel test robot 2021-07-11  929  				}
912aae27c6af66 Helmut Grohne     2020-09-24  930  				of_get_phy_mode(port,
912aae27c6af66 Helmut Grohne     2020-09-24 @931  						&dev->ports[port_nu=
m].interface);
edecfa98f602a5 Helmut Grohne     2020-09-08  932  			}
79c8bd15b61eca Robert Hancock    2019-06-12  933  		dev->synclko_125 =3D of=
_property_read_bool(dev->dev->of_node,
79c8bd15b61eca Robert Hancock    2019-06-12  934  							 "microchip,synclk=
o-125");
48bf8b8a04c9cd Robert Hancock    2022-01-27  935  		dev->synclko_disable =
=3D of_property_read_bool(dev->dev->of_node,
48bf8b8a04c9cd Robert Hancock    2022-01-27  936  							     "microchip,sy=
nclko-disable");
48bf8b8a04c9cd Robert Hancock    2022-01-27  937  		if (dev->synclko_125 &&=
 dev->synclko_disable) {
48bf8b8a04c9cd Robert Hancock    2022-01-27  938  			dev_err(dev->dev, "inc=
onsistent synclko settings\n");
48bf8b8a04c9cd Robert Hancock    2022-01-27  939  			return -EINVAL;
48bf8b8a04c9cd Robert Hancock    2022-01-27  940  		}
c2e866911e2540 Tristram Ha       2018-11-20  941  	}
c2e866911e2540 Tristram Ha       2018-11-20  942  =

c2e866911e2540 Tristram Ha       2018-11-20  943  	ret =3D dsa_register_swi=
tch(dev->ds);
c2e866911e2540 Tristram Ha       2018-11-20  944  	if (ret) {
c2e866911e2540 Tristram Ha       2018-11-20  945  		dev->dev_ops->exit(dev);
c2e866911e2540 Tristram Ha       2018-11-20  946  		return ret;
c2e866911e2540 Tristram Ha       2018-11-20  947  	}
c2e866911e2540 Tristram Ha       2018-11-20  948  =

8098bd69bc4e92 Christian Eggers  2020-10-12  949  	/* Read MIB counters eve=
ry 30 seconds to avoid overflow. */
12c740c8683fed Oleksij Rempel    2022-02-21  950  	dev->mib_read_interval =
=3D msecs_to_jiffies(5000);
8098bd69bc4e92 Christian Eggers  2020-10-12  951  =

8098bd69bc4e92 Christian Eggers  2020-10-12  952  	/* Start the MIB timer. =
*/
8098bd69bc4e92 Christian Eggers  2020-10-12  953  	schedule_delayed_work(&d=
ev->mib_read, 0);
8098bd69bc4e92 Christian Eggers  2020-10-12  954  =

c2e866911e2540 Tristram Ha       2018-11-20  955  	return 0;
b987e98e50ab90 Woojung Huh       2017-05-31  956  }
b987e98e50ab90 Woojung Huh       2017-05-31  957  EXPORT_SYMBOL(ksz_switch_=
register);
b987e98e50ab90 Woojung Huh       2017-05-31  958  =


:::::: The code at line 931 was first introduced by commit
:::::: 912aae27c6af6605eae967ab540c5e26bd76d421 net: dsa: microchip: really=
 look for phy-mode in port nodes

:::::: TO: Helmut Grohne <helmut.grohne@intenta.de>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5682981899290338733==--

