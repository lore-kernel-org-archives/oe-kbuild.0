Content-Type: multipart/mixed; boundary="===============3003641301178698864=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 13555/14055] drivers/clk/clk-si5341.c:1491:3: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Wed, 30 Jun 2021 03:45:06 +0800
Message-ID: <202106300357.CCLHoZRK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3003641301178698864==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Robert Hancock <robert.hancock@calian.com>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   73748627df83aab934c81332ca83a44ab8c7b3e3
commit: b7bbf6ec4940d1a69811ec354edeeb9751fa8e85 [13555/14055] clk: si5341:=
 Allow different output VDD_SEL values
:::::: branch date: 10 hours ago
:::::: commit date: 2 days ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +1491 drivers/clk/clk-si5341.c

692751879ea876 Mike Looijmans 2020-01-07  1450  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1451  static int si5341_probe(str=
uct i2c_client *client,
3044a860fd09f0 Mike Looijmans 2019-05-17  1452  		const struct i2c_device_i=
d *id)
3044a860fd09f0 Mike Looijmans 2019-05-17  1453  {
3044a860fd09f0 Mike Looijmans 2019-05-17  1454  	struct clk_si5341 *data;
3044a860fd09f0 Mike Looijmans 2019-05-17  1455  	struct clk_init_data init;
692751879ea876 Mike Looijmans 2020-01-07  1456  	struct clk *input;
3044a860fd09f0 Mike Looijmans 2019-05-17  1457  	const char *root_clock_nam=
e;
3044a860fd09f0 Mike Looijmans 2019-05-17  1458  	const char *synth_clock_na=
mes[SI5341_NUM_SYNTH];
3044a860fd09f0 Mike Looijmans 2019-05-17  1459  	int err;
3044a860fd09f0 Mike Looijmans 2019-05-17  1460  	unsigned int i;
3044a860fd09f0 Mike Looijmans 2019-05-17  1461  	struct clk_si5341_output_c=
onfig config[SI5341_MAX_NUM_OUTPUTS];
3044a860fd09f0 Mike Looijmans 2019-05-17  1462  	bool initialization_requir=
ed;
71dcc4d1f7d2ad Robert Hancock 2021-03-25  1463  	u32 status;
3044a860fd09f0 Mike Looijmans 2019-05-17  1464  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1465  	data =3D devm_kzalloc(&cli=
ent->dev, sizeof(*data), GFP_KERNEL);
3044a860fd09f0 Mike Looijmans 2019-05-17  1466  	if (!data)
3044a860fd09f0 Mike Looijmans 2019-05-17  1467  		return -ENOMEM;
3044a860fd09f0 Mike Looijmans 2019-05-17  1468  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1469  	data->i2c_client =3D clien=
t;
3044a860fd09f0 Mike Looijmans 2019-05-17  1470  =

6e7d2de1e000d3 Robert Hancock 2021-03-25  1471  	/* Must be done before oth=
erwise touching hardware */
6e7d2de1e000d3 Robert Hancock 2021-03-25  1472  	err =3D si5341_wait_device=
_ready(client);
6e7d2de1e000d3 Robert Hancock 2021-03-25  1473  	if (err)
6e7d2de1e000d3 Robert Hancock 2021-03-25  1474  		return err;
6e7d2de1e000d3 Robert Hancock 2021-03-25  1475  =

692751879ea876 Mike Looijmans 2020-01-07  1476  	for (i =3D 0; i < SI5341_N=
UM_INPUTS; ++i) {
692751879ea876 Mike Looijmans 2020-01-07  1477  		input =3D devm_clk_get(&c=
lient->dev, si5341_input_clock_names[i]);
692751879ea876 Mike Looijmans 2020-01-07  1478  		if (IS_ERR(input)) {
692751879ea876 Mike Looijmans 2020-01-07  1479  			if (PTR_ERR(input) =3D=
=3D -EPROBE_DEFER)
3044a860fd09f0 Mike Looijmans 2019-05-17  1480  				return -EPROBE_DEFER;
692751879ea876 Mike Looijmans 2020-01-07  1481  			data->input_clk_name[i] =
=3D si5341_input_clock_names[i];
692751879ea876 Mike Looijmans 2020-01-07  1482  		} else {
692751879ea876 Mike Looijmans 2020-01-07  1483  			data->input_clk[i] =3D i=
nput;
692751879ea876 Mike Looijmans 2020-01-07  1484  			data->input_clk_name[i] =
=3D __clk_get_name(input);
692751879ea876 Mike Looijmans 2020-01-07  1485  		}
3044a860fd09f0 Mike Looijmans 2019-05-17  1486  	}
3044a860fd09f0 Mike Looijmans 2019-05-17  1487  =

b7bbf6ec4940d1 Robert Hancock 2021-03-25  1488  	for (i =3D 0; i < SI5341_M=
AX_NUM_OUTPUTS; ++i) {
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1489  		char reg_name[10];
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1490  =

b7bbf6ec4940d1 Robert Hancock 2021-03-25 @1491  		snprintf(reg_name, sizeof=
(reg_name), "vddo%d", i);
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1492  		data->clk[i].vddo_reg =3D=
 devm_regulator_get_optional(
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1493  			&client->dev, reg_name);
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1494  		if (IS_ERR(data->clk[i].v=
ddo_reg)) {
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1495  			err =3D PTR_ERR(data->cl=
k[i].vddo_reg);
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1496  			data->clk[i].vddo_reg =
=3D NULL;
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1497  			if (err =3D=3D -ENODEV)
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1498  				continue;
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1499  			goto cleanup;
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1500  		} else {
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1501  			err =3D regulator_enable=
(data->clk[i].vddo_reg);
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1502  			if (err) {
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1503  				dev_err(&client->dev,
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1504  					"failed to enable %s r=
egulator: %d\n",
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1505  					reg_name, err);
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1506  				data->clk[i].vddo_reg =
=3D NULL;
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1507  				goto cleanup;
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1508  			}
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1509  		}
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1510  	}
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1511  =

b7bbf6ec4940d1 Robert Hancock 2021-03-25  1512  	err =3D si5341_dt_parse_dt=
(data, config);
3044a860fd09f0 Mike Looijmans 2019-05-17  1513  	if (err)
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1514  		goto cleanup;
3044a860fd09f0 Mike Looijmans 2019-05-17  1515  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1516  	if (of_property_read_strin=
g(client->dev.of_node, "clock-output-names",
3044a860fd09f0 Mike Looijmans 2019-05-17  1517  			&init.name))
3044a860fd09f0 Mike Looijmans 2019-05-17  1518  		init.name =3D client->dev=
.of_node->name;
3044a860fd09f0 Mike Looijmans 2019-05-17  1519  	root_clock_name =3D init.n=
ame;
3044a860fd09f0 Mike Looijmans 2019-05-17  1520  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1521  	data->regmap =3D devm_regm=
ap_init_i2c(client, &si5341_regmap_config);
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1522  	if (IS_ERR(data->regmap)) {
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1523  		err =3D PTR_ERR(data->reg=
map);
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1524  		goto cleanup;
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1525  	}
3044a860fd09f0 Mike Looijmans 2019-05-17  1526  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1527  	i2c_set_clientdata(client,=
 data);
3044a860fd09f0 Mike Looijmans 2019-05-17  1528  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1529  	err =3D si5341_probe_chip_=
id(data);
3044a860fd09f0 Mike Looijmans 2019-05-17  1530  	if (err < 0)
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1531  		goto cleanup;
3044a860fd09f0 Mike Looijmans 2019-05-17  1532  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1533  	if (of_property_read_bool(=
client->dev.of_node, "silabs,reprogram")) {
3044a860fd09f0 Mike Looijmans 2019-05-17  1534  		initialization_required =
=3D true;
3044a860fd09f0 Mike Looijmans 2019-05-17  1535  	} else {
3044a860fd09f0 Mike Looijmans 2019-05-17  1536  		err =3D si5341_is_program=
med_already(data);
3044a860fd09f0 Mike Looijmans 2019-05-17  1537  		if (err < 0)
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1538  			goto cleanup;
3044a860fd09f0 Mike Looijmans 2019-05-17  1539  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1540  		initialization_required =
=3D !err;
3044a860fd09f0 Mike Looijmans 2019-05-17  1541  	}
3044a860fd09f0 Mike Looijmans 2019-05-17  1542  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1543  	if (initialization_require=
d) {
3044a860fd09f0 Mike Looijmans 2019-05-17  1544  		/* Populate the regmap ca=
che in preparation for "cache only" */
3044a860fd09f0 Mike Looijmans 2019-05-17  1545  		err =3D si5341_read_setti=
ngs(data);
3044a860fd09f0 Mike Looijmans 2019-05-17  1546  		if (err < 0)
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1547  			goto cleanup;
3044a860fd09f0 Mike Looijmans 2019-05-17  1548  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1549  		err =3D si5341_send_pream=
ble(data);
3044a860fd09f0 Mike Looijmans 2019-05-17  1550  		if (err < 0)
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1551  			goto cleanup;
3044a860fd09f0 Mike Looijmans 2019-05-17  1552  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1553  		/*
3044a860fd09f0 Mike Looijmans 2019-05-17  1554  		 * We intend to send all =
'final' register values in a single
3044a860fd09f0 Mike Looijmans 2019-05-17  1555  		 * transaction. So cache =
all register writes until we're done
3044a860fd09f0 Mike Looijmans 2019-05-17  1556  		 * configuring.
3044a860fd09f0 Mike Looijmans 2019-05-17  1557  		 */
3044a860fd09f0 Mike Looijmans 2019-05-17  1558  		regcache_cache_only(data-=
>regmap, true);
3044a860fd09f0 Mike Looijmans 2019-05-17  1559  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1560  		/* Write the configuratio=
n pairs from the firmware blob */
3044a860fd09f0 Mike Looijmans 2019-05-17  1561  		err =3D si5341_write_mult=
iple(data, si5341_reg_defaults,
3044a860fd09f0 Mike Looijmans 2019-05-17  1562  					ARRAY_SIZE(si5341_reg_=
defaults));
3044a860fd09f0 Mike Looijmans 2019-05-17  1563  		if (err < 0)
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1564  			goto cleanup;
692751879ea876 Mike Looijmans 2020-01-07  1565  	}
692751879ea876 Mike Looijmans 2020-01-07  1566  =

692751879ea876 Mike Looijmans 2020-01-07  1567  	/* Input must be up and ru=
nning@this point */
692751879ea876 Mike Looijmans 2020-01-07  1568  	err =3D si5341_clk_select_=
active_input(data);
692751879ea876 Mike Looijmans 2020-01-07  1569  	if (err < 0)
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1570  		goto cleanup;
3044a860fd09f0 Mike Looijmans 2019-05-17  1571  =

692751879ea876 Mike Looijmans 2020-01-07  1572  	if (initialization_require=
d) {
3044a860fd09f0 Mike Looijmans 2019-05-17  1573  		/* PLL configuration is r=
equired */
3044a860fd09f0 Mike Looijmans 2019-05-17  1574  		err =3D si5341_initialize=
_pll(data);
3044a860fd09f0 Mike Looijmans 2019-05-17  1575  		if (err < 0)
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1576  			goto cleanup;
3044a860fd09f0 Mike Looijmans 2019-05-17  1577  	}
3044a860fd09f0 Mike Looijmans 2019-05-17  1578  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1579  	/* Register the PLL */
692751879ea876 Mike Looijmans 2020-01-07  1580  	init.parent_names =3D data=
->input_clk_name;
692751879ea876 Mike Looijmans 2020-01-07  1581  	init.num_parents =3D SI534=
1_NUM_INPUTS;
3044a860fd09f0 Mike Looijmans 2019-05-17  1582  	init.ops =3D &si5341_clk_o=
ps;
3044a860fd09f0 Mike Looijmans 2019-05-17  1583  	init.flags =3D 0;
3044a860fd09f0 Mike Looijmans 2019-05-17  1584  	data->hw.init =3D &init;
3044a860fd09f0 Mike Looijmans 2019-05-17  1585  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1586  	err =3D devm_clk_hw_regist=
er(&client->dev, &data->hw);
3044a860fd09f0 Mike Looijmans 2019-05-17  1587  	if (err) {
3044a860fd09f0 Mike Looijmans 2019-05-17  1588  		dev_err(&client->dev, "cl=
ock registration failed\n");
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1589  		goto cleanup;
3044a860fd09f0 Mike Looijmans 2019-05-17  1590  	}
3044a860fd09f0 Mike Looijmans 2019-05-17  1591  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1592  	init.num_parents =3D 1;
3044a860fd09f0 Mike Looijmans 2019-05-17  1593  	init.parent_names =3D &roo=
t_clock_name;
3044a860fd09f0 Mike Looijmans 2019-05-17  1594  	init.ops =3D &si5341_synth=
_clk_ops;
3044a860fd09f0 Mike Looijmans 2019-05-17  1595  	for (i =3D 0; i < data->nu=
m_synth; ++i) {
3044a860fd09f0 Mike Looijmans 2019-05-17  1596  		synth_clock_names[i] =3D =
devm_kasprintf(&client->dev, GFP_KERNEL,
3044a860fd09f0 Mike Looijmans 2019-05-17  1597  				"%s.N%u", client->dev.o=
f_node->name, i);
3044a860fd09f0 Mike Looijmans 2019-05-17  1598  		init.name =3D synth_clock=
_names[i];
3044a860fd09f0 Mike Looijmans 2019-05-17  1599  		data->synth[i].index =3D =
i;
3044a860fd09f0 Mike Looijmans 2019-05-17  1600  		data->synth[i].data =3D d=
ata;
3044a860fd09f0 Mike Looijmans 2019-05-17  1601  		data->synth[i].hw.init =
=3D &init;
3044a860fd09f0 Mike Looijmans 2019-05-17  1602  		err =3D devm_clk_hw_regis=
ter(&client->dev, &data->synth[i].hw);
3044a860fd09f0 Mike Looijmans 2019-05-17  1603  		if (err) {
3044a860fd09f0 Mike Looijmans 2019-05-17  1604  			dev_err(&client->dev,
3044a860fd09f0 Mike Looijmans 2019-05-17  1605  				"synth N%u registration=
 failed\n", i);
3044a860fd09f0 Mike Looijmans 2019-05-17  1606  		}
3044a860fd09f0 Mike Looijmans 2019-05-17  1607  	}
3044a860fd09f0 Mike Looijmans 2019-05-17  1608  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1609  	init.num_parents =3D data-=
>num_synth;
3044a860fd09f0 Mike Looijmans 2019-05-17  1610  	init.parent_names =3D synt=
h_clock_names;
3044a860fd09f0 Mike Looijmans 2019-05-17  1611  	init.ops =3D &si5341_outpu=
t_clk_ops;
3044a860fd09f0 Mike Looijmans 2019-05-17  1612  	for (i =3D 0; i < data->nu=
m_outputs; ++i) {
3044a860fd09f0 Mike Looijmans 2019-05-17  1613  		init.name =3D kasprintf(G=
FP_KERNEL, "%s.%d",
3044a860fd09f0 Mike Looijmans 2019-05-17  1614  			client->dev.of_node->nam=
e, i);
3044a860fd09f0 Mike Looijmans 2019-05-17  1615  		init.flags =3D config[i].=
synth_master ? CLK_SET_RATE_PARENT : 0;
3044a860fd09f0 Mike Looijmans 2019-05-17  1616  		data->clk[i].index =3D i;
3044a860fd09f0 Mike Looijmans 2019-05-17  1617  		data->clk[i].data =3D dat=
a;
3044a860fd09f0 Mike Looijmans 2019-05-17  1618  		data->clk[i].hw.init =3D =
&init;
3044a860fd09f0 Mike Looijmans 2019-05-17  1619  		if (config[i].out_format_=
drv_bits & 0x07) {
3044a860fd09f0 Mike Looijmans 2019-05-17  1620  			regmap_write(data->regma=
p,
3044a860fd09f0 Mike Looijmans 2019-05-17  1621  				SI5341_OUT_FORMAT(&data=
->clk[i]),
3044a860fd09f0 Mike Looijmans 2019-05-17  1622  				config[i].out_format_dr=
v_bits);
3044a860fd09f0 Mike Looijmans 2019-05-17  1623  			regmap_write(data->regma=
p,
3044a860fd09f0 Mike Looijmans 2019-05-17  1624  				SI5341_OUT_CM(&data->cl=
k[i]),
3044a860fd09f0 Mike Looijmans 2019-05-17  1625  				config[i].out_cm_ampl_b=
its);
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1626  			regmap_update_bits(data-=
>regmap,
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1627  				SI5341_OUT_MUX_SEL(&dat=
a->clk[i]),
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1628  				SI5341_OUT_MUX_VDD_SEL_=
MASK,
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1629  				config[i].vdd_sel_bits);
3044a860fd09f0 Mike Looijmans 2019-05-17  1630  		}
3044a860fd09f0 Mike Looijmans 2019-05-17  1631  		err =3D devm_clk_hw_regis=
ter(&client->dev, &data->clk[i].hw);
3044a860fd09f0 Mike Looijmans 2019-05-17  1632  		kfree(init.name); /* cloc=
k framework made a copy of the name */
3044a860fd09f0 Mike Looijmans 2019-05-17  1633  		if (err) {
3044a860fd09f0 Mike Looijmans 2019-05-17  1634  			dev_err(&client->dev,
3044a860fd09f0 Mike Looijmans 2019-05-17  1635  				"output %u registration=
 failed\n", i);
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1636  			goto cleanup;
3044a860fd09f0 Mike Looijmans 2019-05-17  1637  		}
3044a860fd09f0 Mike Looijmans 2019-05-17  1638  		if (config[i].always_on)
3044a860fd09f0 Mike Looijmans 2019-05-17  1639  			clk_prepare(data->clk[i]=
.hw.clk);
3044a860fd09f0 Mike Looijmans 2019-05-17  1640  	}
3044a860fd09f0 Mike Looijmans 2019-05-17  1641  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1642  	err =3D of_clk_add_hw_prov=
ider(client->dev.of_node, of_clk_si5341_get,
3044a860fd09f0 Mike Looijmans 2019-05-17  1643  			data);
3044a860fd09f0 Mike Looijmans 2019-05-17  1644  	if (err) {
3044a860fd09f0 Mike Looijmans 2019-05-17  1645  		dev_err(&client->dev, "un=
able to add clk provider\n");
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1646  		goto cleanup;
3044a860fd09f0 Mike Looijmans 2019-05-17  1647  	}
3044a860fd09f0 Mike Looijmans 2019-05-17  1648  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1649  	if (initialization_require=
d) {
3044a860fd09f0 Mike Looijmans 2019-05-17  1650  		/* Synchronize */
3044a860fd09f0 Mike Looijmans 2019-05-17  1651  		regcache_cache_only(data-=
>regmap, false);
3044a860fd09f0 Mike Looijmans 2019-05-17  1652  		err =3D regcache_sync(dat=
a->regmap);
3044a860fd09f0 Mike Looijmans 2019-05-17  1653  		if (err < 0)
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1654  			goto cleanup;
3044a860fd09f0 Mike Looijmans 2019-05-17  1655  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1656  		err =3D si5341_finalize_d=
efaults(data);
3044a860fd09f0 Mike Looijmans 2019-05-17  1657  		if (err < 0)
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1658  			goto cleanup;
3044a860fd09f0 Mike Looijmans 2019-05-17  1659  	}
3044a860fd09f0 Mike Looijmans 2019-05-17  1660  =

71dcc4d1f7d2ad Robert Hancock 2021-03-25  1661  	/* wait for device to repo=
rt input clock present and PLL lock */
71dcc4d1f7d2ad Robert Hancock 2021-03-25  1662  	err =3D regmap_read_poll_t=
imeout(data->regmap, SI5341_STATUS, status,
71dcc4d1f7d2ad Robert Hancock 2021-03-25  1663  		!(status & (SI5341_STATUS=
_LOSREF | SI5341_STATUS_LOL)),
71dcc4d1f7d2ad Robert Hancock 2021-03-25  1664  	       10000, 250000);
71dcc4d1f7d2ad Robert Hancock 2021-03-25  1665  	if (err) {
71dcc4d1f7d2ad Robert Hancock 2021-03-25  1666  		dev_err(&client->dev, "Er=
ror waiting for input clock or PLL lock\n");
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1667  		goto cleanup;
71dcc4d1f7d2ad Robert Hancock 2021-03-25  1668  	}
71dcc4d1f7d2ad Robert Hancock 2021-03-25  1669  =

71dcc4d1f7d2ad Robert Hancock 2021-03-25  1670  	/* clear sticky alarm bits=
 from initialization */
71dcc4d1f7d2ad Robert Hancock 2021-03-25  1671  	err =3D regmap_write(data-=
>regmap, SI5341_STATUS_STICKY, 0);
71dcc4d1f7d2ad Robert Hancock 2021-03-25  1672  	if (err) {
71dcc4d1f7d2ad Robert Hancock 2021-03-25  1673  		dev_err(&client->dev, "un=
able to clear sticky status\n");
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1674  		goto cleanup;
71dcc4d1f7d2ad Robert Hancock 2021-03-25  1675  	}
71dcc4d1f7d2ad Robert Hancock 2021-03-25  1676  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1677  	/* Free the names, clk fra=
mework makes copies */
3044a860fd09f0 Mike Looijmans 2019-05-17  1678  	for (i =3D 0; i < data->nu=
m_synth; ++i)
3044a860fd09f0 Mike Looijmans 2019-05-17  1679  		 devm_kfree(&client->dev,=
 (void *)synth_clock_names[i]);
3044a860fd09f0 Mike Looijmans 2019-05-17  1680  =

3044a860fd09f0 Mike Looijmans 2019-05-17  1681  	return 0;
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1682  =

b7bbf6ec4940d1 Robert Hancock 2021-03-25  1683  cleanup:
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1684  	for (i =3D 0; i < SI5341_M=
AX_NUM_OUTPUTS; ++i) {
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1685  		if (data->clk[i].vddo_reg)
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1686  			regulator_disable(data->=
clk[i].vddo_reg);
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1687  	}
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1688  	return err;
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1689  }
b7bbf6ec4940d1 Robert Hancock 2021-03-25  1690  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3003641301178698864==--

