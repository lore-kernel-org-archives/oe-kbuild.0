Content-Type: multipart/mixed; boundary="===============0566592478211851786=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/clk-si5341.c:1491:3: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Fri, 18 Feb 2022 03:45:45 +0800
Message-ID: <202202172219.288l4t6S-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0566592478211851786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Robert Hancock <robert.hancock@calian.com>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f71077a4d84bbe8c7b91b7db7c4ef815755ac5e3
commit: b7bbf6ec4940d1a69811ec354edeeb9751fa8e85 clk: si5341: Allow differe=
nt output VDD_SEL values
date:   8 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 8 months ago
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/clk/clk-si5341.c:1491:3: warning: %d in format string (no. 1) re=
quires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType=
_sint]
     snprintf(reg_name, sizeof(reg_name), "vddo%d", i);
     ^

vim +1491 drivers/clk/clk-si5341.c

692751879ea876d Mike Looijmans 2020-01-07  1450  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1451  static int si5341_probe(st=
ruct i2c_client *client,
3044a860fd09f02 Mike Looijmans 2019-05-17  1452  		const struct i2c_device_=
id *id)
3044a860fd09f02 Mike Looijmans 2019-05-17  1453  {
3044a860fd09f02 Mike Looijmans 2019-05-17  1454  	struct clk_si5341 *data;
3044a860fd09f02 Mike Looijmans 2019-05-17  1455  	struct clk_init_data init;
692751879ea876d Mike Looijmans 2020-01-07  1456  	struct clk *input;
3044a860fd09f02 Mike Looijmans 2019-05-17  1457  	const char *root_clock_na=
me;
3044a860fd09f02 Mike Looijmans 2019-05-17  1458  	const char *synth_clock_n=
ames[SI5341_NUM_SYNTH];
3044a860fd09f02 Mike Looijmans 2019-05-17  1459  	int err;
3044a860fd09f02 Mike Looijmans 2019-05-17  1460  	unsigned int i;
3044a860fd09f02 Mike Looijmans 2019-05-17  1461  	struct clk_si5341_output_=
config config[SI5341_MAX_NUM_OUTPUTS];
3044a860fd09f02 Mike Looijmans 2019-05-17  1462  	bool initialization_requi=
red;
71dcc4d1f7d2ad9 Robert Hancock 2021-03-25  1463  	u32 status;
3044a860fd09f02 Mike Looijmans 2019-05-17  1464  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1465  	data =3D devm_kzalloc(&cl=
ient->dev, sizeof(*data), GFP_KERNEL);
3044a860fd09f02 Mike Looijmans 2019-05-17  1466  	if (!data)
3044a860fd09f02 Mike Looijmans 2019-05-17  1467  		return -ENOMEM;
3044a860fd09f02 Mike Looijmans 2019-05-17  1468  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1469  	data->i2c_client =3D clie=
nt;
3044a860fd09f02 Mike Looijmans 2019-05-17  1470  =

6e7d2de1e000d36 Robert Hancock 2021-03-25  1471  	/* Must be done before ot=
herwise touching hardware */
6e7d2de1e000d36 Robert Hancock 2021-03-25  1472  	err =3D si5341_wait_devic=
e_ready(client);
6e7d2de1e000d36 Robert Hancock 2021-03-25  1473  	if (err)
6e7d2de1e000d36 Robert Hancock 2021-03-25  1474  		return err;
6e7d2de1e000d36 Robert Hancock 2021-03-25  1475  =

692751879ea876d Mike Looijmans 2020-01-07  1476  	for (i =3D 0; i < SI5341_=
NUM_INPUTS; ++i) {
692751879ea876d Mike Looijmans 2020-01-07  1477  		input =3D devm_clk_get(&=
client->dev, si5341_input_clock_names[i]);
692751879ea876d Mike Looijmans 2020-01-07  1478  		if (IS_ERR(input)) {
692751879ea876d Mike Looijmans 2020-01-07  1479  			if (PTR_ERR(input) =3D=
=3D -EPROBE_DEFER)
3044a860fd09f02 Mike Looijmans 2019-05-17  1480  				return -EPROBE_DEFER;
692751879ea876d Mike Looijmans 2020-01-07  1481  			data->input_clk_name[i]=
 =3D si5341_input_clock_names[i];
692751879ea876d Mike Looijmans 2020-01-07  1482  		} else {
692751879ea876d Mike Looijmans 2020-01-07  1483  			data->input_clk[i] =3D =
input;
692751879ea876d Mike Looijmans 2020-01-07  1484  			data->input_clk_name[i]=
 =3D __clk_get_name(input);
692751879ea876d Mike Looijmans 2020-01-07  1485  		}
3044a860fd09f02 Mike Looijmans 2019-05-17  1486  	}
3044a860fd09f02 Mike Looijmans 2019-05-17  1487  =

b7bbf6ec4940d1a Robert Hancock 2021-03-25  1488  	for (i =3D 0; i < SI5341_=
MAX_NUM_OUTPUTS; ++i) {
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1489  		char reg_name[10];
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1490  =

b7bbf6ec4940d1a Robert Hancock 2021-03-25 @1491  		snprintf(reg_name, sizeo=
f(reg_name), "vddo%d", i);
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1492  		data->clk[i].vddo_reg =
=3D devm_regulator_get_optional(
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1493  			&client->dev, reg_name);
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1494  		if (IS_ERR(data->clk[i].=
vddo_reg)) {
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1495  			err =3D PTR_ERR(data->c=
lk[i].vddo_reg);
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1496  			data->clk[i].vddo_reg =
=3D NULL;
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1497  			if (err =3D=3D -ENODEV)
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1498  				continue;
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1499  			goto cleanup;
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1500  		} else {
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1501  			err =3D regulator_enabl=
e(data->clk[i].vddo_reg);
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1502  			if (err) {
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1503  				dev_err(&client->dev,
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1504  					"failed to enable %s =
regulator: %d\n",
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1505  					reg_name, err);
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1506  				data->clk[i].vddo_reg =
=3D NULL;
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1507  				goto cleanup;
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1508  			}
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1509  		}
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1510  	}
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1511  =

b7bbf6ec4940d1a Robert Hancock 2021-03-25  1512  	err =3D si5341_dt_parse_d=
t(data, config);
3044a860fd09f02 Mike Looijmans 2019-05-17  1513  	if (err)
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1514  		goto cleanup;
3044a860fd09f02 Mike Looijmans 2019-05-17  1515  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1516  	if (of_property_read_stri=
ng(client->dev.of_node, "clock-output-names",
3044a860fd09f02 Mike Looijmans 2019-05-17  1517  			&init.name))
3044a860fd09f02 Mike Looijmans 2019-05-17  1518  		init.name =3D client->de=
v.of_node->name;
3044a860fd09f02 Mike Looijmans 2019-05-17  1519  	root_clock_name =3D init.=
name;
3044a860fd09f02 Mike Looijmans 2019-05-17  1520  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1521  	data->regmap =3D devm_reg=
map_init_i2c(client, &si5341_regmap_config);
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1522  	if (IS_ERR(data->regmap))=
 {
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1523  		err =3D PTR_ERR(data->re=
gmap);
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1524  		goto cleanup;
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1525  	}
3044a860fd09f02 Mike Looijmans 2019-05-17  1526  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1527  	i2c_set_clientdata(client=
, data);
3044a860fd09f02 Mike Looijmans 2019-05-17  1528  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1529  	err =3D si5341_probe_chip=
_id(data);
3044a860fd09f02 Mike Looijmans 2019-05-17  1530  	if (err < 0)
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1531  		goto cleanup;
3044a860fd09f02 Mike Looijmans 2019-05-17  1532  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1533  	if (of_property_read_bool=
(client->dev.of_node, "silabs,reprogram")) {
3044a860fd09f02 Mike Looijmans 2019-05-17  1534  		initialization_required =
=3D true;
3044a860fd09f02 Mike Looijmans 2019-05-17  1535  	} else {
3044a860fd09f02 Mike Looijmans 2019-05-17  1536  		err =3D si5341_is_progra=
mmed_already(data);
3044a860fd09f02 Mike Looijmans 2019-05-17  1537  		if (err < 0)
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1538  			goto cleanup;
3044a860fd09f02 Mike Looijmans 2019-05-17  1539  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1540  		initialization_required =
=3D !err;
3044a860fd09f02 Mike Looijmans 2019-05-17  1541  	}
3044a860fd09f02 Mike Looijmans 2019-05-17  1542  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1543  	if (initialization_requir=
ed) {
3044a860fd09f02 Mike Looijmans 2019-05-17  1544  		/* Populate the regmap c=
ache in preparation for "cache only" */
3044a860fd09f02 Mike Looijmans 2019-05-17  1545  		err =3D si5341_read_sett=
ings(data);
3044a860fd09f02 Mike Looijmans 2019-05-17  1546  		if (err < 0)
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1547  			goto cleanup;
3044a860fd09f02 Mike Looijmans 2019-05-17  1548  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1549  		err =3D si5341_send_prea=
mble(data);
3044a860fd09f02 Mike Looijmans 2019-05-17  1550  		if (err < 0)
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1551  			goto cleanup;
3044a860fd09f02 Mike Looijmans 2019-05-17  1552  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1553  		/*
3044a860fd09f02 Mike Looijmans 2019-05-17  1554  		 * We intend to send all=
 'final' register values in a single
3044a860fd09f02 Mike Looijmans 2019-05-17  1555  		 * transaction. So cache=
 all register writes until we're done
3044a860fd09f02 Mike Looijmans 2019-05-17  1556  		 * configuring.
3044a860fd09f02 Mike Looijmans 2019-05-17  1557  		 */
3044a860fd09f02 Mike Looijmans 2019-05-17  1558  		regcache_cache_only(data=
->regmap, true);
3044a860fd09f02 Mike Looijmans 2019-05-17  1559  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1560  		/* Write the configurati=
on pairs from the firmware blob */
3044a860fd09f02 Mike Looijmans 2019-05-17  1561  		err =3D si5341_write_mul=
tiple(data, si5341_reg_defaults,
3044a860fd09f02 Mike Looijmans 2019-05-17  1562  					ARRAY_SIZE(si5341_reg=
_defaults));
3044a860fd09f02 Mike Looijmans 2019-05-17  1563  		if (err < 0)
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1564  			goto cleanup;
692751879ea876d Mike Looijmans 2020-01-07  1565  	}
692751879ea876d Mike Looijmans 2020-01-07  1566  =

692751879ea876d Mike Looijmans 2020-01-07  1567  	/* Input must be up and r=
unning@this point */
692751879ea876d Mike Looijmans 2020-01-07  1568  	err =3D si5341_clk_select=
_active_input(data);
692751879ea876d Mike Looijmans 2020-01-07  1569  	if (err < 0)
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1570  		goto cleanup;
3044a860fd09f02 Mike Looijmans 2019-05-17  1571  =

692751879ea876d Mike Looijmans 2020-01-07  1572  	if (initialization_requir=
ed) {
3044a860fd09f02 Mike Looijmans 2019-05-17  1573  		/* PLL configuration is =
required */
3044a860fd09f02 Mike Looijmans 2019-05-17  1574  		err =3D si5341_initializ=
e_pll(data);
3044a860fd09f02 Mike Looijmans 2019-05-17  1575  		if (err < 0)
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1576  			goto cleanup;
3044a860fd09f02 Mike Looijmans 2019-05-17  1577  	}
3044a860fd09f02 Mike Looijmans 2019-05-17  1578  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1579  	/* Register the PLL */
692751879ea876d Mike Looijmans 2020-01-07  1580  	init.parent_names =3D dat=
a->input_clk_name;
692751879ea876d Mike Looijmans 2020-01-07  1581  	init.num_parents =3D SI53=
41_NUM_INPUTS;
3044a860fd09f02 Mike Looijmans 2019-05-17  1582  	init.ops =3D &si5341_clk_=
ops;
3044a860fd09f02 Mike Looijmans 2019-05-17  1583  	init.flags =3D 0;
3044a860fd09f02 Mike Looijmans 2019-05-17  1584  	data->hw.init =3D &init;
3044a860fd09f02 Mike Looijmans 2019-05-17  1585  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1586  	err =3D devm_clk_hw_regis=
ter(&client->dev, &data->hw);
3044a860fd09f02 Mike Looijmans 2019-05-17  1587  	if (err) {
3044a860fd09f02 Mike Looijmans 2019-05-17  1588  		dev_err(&client->dev, "c=
lock registration failed\n");
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1589  		goto cleanup;
3044a860fd09f02 Mike Looijmans 2019-05-17  1590  	}
3044a860fd09f02 Mike Looijmans 2019-05-17  1591  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1592  	init.num_parents =3D 1;
3044a860fd09f02 Mike Looijmans 2019-05-17  1593  	init.parent_names =3D &ro=
ot_clock_name;
3044a860fd09f02 Mike Looijmans 2019-05-17  1594  	init.ops =3D &si5341_synt=
h_clk_ops;
3044a860fd09f02 Mike Looijmans 2019-05-17  1595  	for (i =3D 0; i < data->n=
um_synth; ++i) {
3044a860fd09f02 Mike Looijmans 2019-05-17  1596  		synth_clock_names[i] =3D=
 devm_kasprintf(&client->dev, GFP_KERNEL,
3044a860fd09f02 Mike Looijmans 2019-05-17  1597  				"%s.N%u", client->dev.=
of_node->name, i);
3044a860fd09f02 Mike Looijmans 2019-05-17  1598  		init.name =3D synth_cloc=
k_names[i];
3044a860fd09f02 Mike Looijmans 2019-05-17  1599  		data->synth[i].index =3D=
 i;
3044a860fd09f02 Mike Looijmans 2019-05-17  1600  		data->synth[i].data =3D =
data;
3044a860fd09f02 Mike Looijmans 2019-05-17  1601  		data->synth[i].hw.init =
=3D &init;
3044a860fd09f02 Mike Looijmans 2019-05-17  1602  		err =3D devm_clk_hw_regi=
ster(&client->dev, &data->synth[i].hw);
3044a860fd09f02 Mike Looijmans 2019-05-17  1603  		if (err) {
3044a860fd09f02 Mike Looijmans 2019-05-17  1604  			dev_err(&client->dev,
3044a860fd09f02 Mike Looijmans 2019-05-17  1605  				"synth N%u registratio=
n failed\n", i);
3044a860fd09f02 Mike Looijmans 2019-05-17  1606  		}
3044a860fd09f02 Mike Looijmans 2019-05-17  1607  	}
3044a860fd09f02 Mike Looijmans 2019-05-17  1608  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1609  	init.num_parents =3D data=
->num_synth;
3044a860fd09f02 Mike Looijmans 2019-05-17  1610  	init.parent_names =3D syn=
th_clock_names;
3044a860fd09f02 Mike Looijmans 2019-05-17  1611  	init.ops =3D &si5341_outp=
ut_clk_ops;
3044a860fd09f02 Mike Looijmans 2019-05-17  1612  	for (i =3D 0; i < data->n=
um_outputs; ++i) {
3044a860fd09f02 Mike Looijmans 2019-05-17  1613  		init.name =3D kasprintf(=
GFP_KERNEL, "%s.%d",
3044a860fd09f02 Mike Looijmans 2019-05-17  1614  			client->dev.of_node->na=
me, i);
3044a860fd09f02 Mike Looijmans 2019-05-17  1615  		init.flags =3D config[i]=
.synth_master ? CLK_SET_RATE_PARENT : 0;
3044a860fd09f02 Mike Looijmans 2019-05-17  1616  		data->clk[i].index =3D i;
3044a860fd09f02 Mike Looijmans 2019-05-17  1617  		data->clk[i].data =3D da=
ta;
3044a860fd09f02 Mike Looijmans 2019-05-17  1618  		data->clk[i].hw.init =3D=
 &init;
3044a860fd09f02 Mike Looijmans 2019-05-17  1619  		if (config[i].out_format=
_drv_bits & 0x07) {
3044a860fd09f02 Mike Looijmans 2019-05-17  1620  			regmap_write(data->regm=
ap,
3044a860fd09f02 Mike Looijmans 2019-05-17  1621  				SI5341_OUT_FORMAT(&dat=
a->clk[i]),
3044a860fd09f02 Mike Looijmans 2019-05-17  1622  				config[i].out_format_d=
rv_bits);
3044a860fd09f02 Mike Looijmans 2019-05-17  1623  			regmap_write(data->regm=
ap,
3044a860fd09f02 Mike Looijmans 2019-05-17  1624  				SI5341_OUT_CM(&data->c=
lk[i]),
3044a860fd09f02 Mike Looijmans 2019-05-17  1625  				config[i].out_cm_ampl_=
bits);
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1626  			regmap_update_bits(data=
->regmap,
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1627  				SI5341_OUT_MUX_SEL(&da=
ta->clk[i]),
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1628  				SI5341_OUT_MUX_VDD_SEL=
_MASK,
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1629  				config[i].vdd_sel_bits=
);
3044a860fd09f02 Mike Looijmans 2019-05-17  1630  		}
3044a860fd09f02 Mike Looijmans 2019-05-17  1631  		err =3D devm_clk_hw_regi=
ster(&client->dev, &data->clk[i].hw);
3044a860fd09f02 Mike Looijmans 2019-05-17  1632  		kfree(init.name); /* clo=
ck framework made a copy of the name */
3044a860fd09f02 Mike Looijmans 2019-05-17  1633  		if (err) {
3044a860fd09f02 Mike Looijmans 2019-05-17  1634  			dev_err(&client->dev,
3044a860fd09f02 Mike Looijmans 2019-05-17  1635  				"output %u registratio=
n failed\n", i);
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1636  			goto cleanup;
3044a860fd09f02 Mike Looijmans 2019-05-17  1637  		}
3044a860fd09f02 Mike Looijmans 2019-05-17  1638  		if (config[i].always_on)
3044a860fd09f02 Mike Looijmans 2019-05-17  1639  			clk_prepare(data->clk[i=
].hw.clk);
3044a860fd09f02 Mike Looijmans 2019-05-17  1640  	}
3044a860fd09f02 Mike Looijmans 2019-05-17  1641  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1642  	err =3D of_clk_add_hw_pro=
vider(client->dev.of_node, of_clk_si5341_get,
3044a860fd09f02 Mike Looijmans 2019-05-17  1643  			data);
3044a860fd09f02 Mike Looijmans 2019-05-17  1644  	if (err) {
3044a860fd09f02 Mike Looijmans 2019-05-17  1645  		dev_err(&client->dev, "u=
nable to add clk provider\n");
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1646  		goto cleanup;
3044a860fd09f02 Mike Looijmans 2019-05-17  1647  	}
3044a860fd09f02 Mike Looijmans 2019-05-17  1648  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1649  	if (initialization_requir=
ed) {
3044a860fd09f02 Mike Looijmans 2019-05-17  1650  		/* Synchronize */
3044a860fd09f02 Mike Looijmans 2019-05-17  1651  		regcache_cache_only(data=
->regmap, false);
3044a860fd09f02 Mike Looijmans 2019-05-17  1652  		err =3D regcache_sync(da=
ta->regmap);
3044a860fd09f02 Mike Looijmans 2019-05-17  1653  		if (err < 0)
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1654  			goto cleanup;
3044a860fd09f02 Mike Looijmans 2019-05-17  1655  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1656  		err =3D si5341_finalize_=
defaults(data);
3044a860fd09f02 Mike Looijmans 2019-05-17  1657  		if (err < 0)
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1658  			goto cleanup;
3044a860fd09f02 Mike Looijmans 2019-05-17  1659  	}
3044a860fd09f02 Mike Looijmans 2019-05-17  1660  =

71dcc4d1f7d2ad9 Robert Hancock 2021-03-25  1661  	/* wait for device to rep=
ort input clock present and PLL lock */
71dcc4d1f7d2ad9 Robert Hancock 2021-03-25  1662  	err =3D regmap_read_poll_=
timeout(data->regmap, SI5341_STATUS, status,
71dcc4d1f7d2ad9 Robert Hancock 2021-03-25  1663  		!(status & (SI5341_STATU=
S_LOSREF | SI5341_STATUS_LOL)),
71dcc4d1f7d2ad9 Robert Hancock 2021-03-25  1664  	       10000, 250000);
71dcc4d1f7d2ad9 Robert Hancock 2021-03-25  1665  	if (err) {
71dcc4d1f7d2ad9 Robert Hancock 2021-03-25  1666  		dev_err(&client->dev, "E=
rror waiting for input clock or PLL lock\n");
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1667  		goto cleanup;
71dcc4d1f7d2ad9 Robert Hancock 2021-03-25  1668  	}
71dcc4d1f7d2ad9 Robert Hancock 2021-03-25  1669  =

71dcc4d1f7d2ad9 Robert Hancock 2021-03-25  1670  	/* clear sticky alarm bit=
s from initialization */
71dcc4d1f7d2ad9 Robert Hancock 2021-03-25  1671  	err =3D regmap_write(data=
->regmap, SI5341_STATUS_STICKY, 0);
71dcc4d1f7d2ad9 Robert Hancock 2021-03-25  1672  	if (err) {
71dcc4d1f7d2ad9 Robert Hancock 2021-03-25  1673  		dev_err(&client->dev, "u=
nable to clear sticky status\n");
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1674  		goto cleanup;
71dcc4d1f7d2ad9 Robert Hancock 2021-03-25  1675  	}
71dcc4d1f7d2ad9 Robert Hancock 2021-03-25  1676  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1677  	/* Free the names, clk fr=
amework makes copies */
3044a860fd09f02 Mike Looijmans 2019-05-17  1678  	for (i =3D 0; i < data->n=
um_synth; ++i)
3044a860fd09f02 Mike Looijmans 2019-05-17  1679  		 devm_kfree(&client->dev=
, (void *)synth_clock_names[i]);
3044a860fd09f02 Mike Looijmans 2019-05-17  1680  =

3044a860fd09f02 Mike Looijmans 2019-05-17  1681  	return 0;
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1682  =

b7bbf6ec4940d1a Robert Hancock 2021-03-25  1683  cleanup:
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1684  	for (i =3D 0; i < SI5341_=
MAX_NUM_OUTPUTS; ++i) {
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1685  		if (data->clk[i].vddo_re=
g)
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1686  			regulator_disable(data-=
>clk[i].vddo_reg);
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1687  	}
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1688  	return err;
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1689  }
b7bbf6ec4940d1a Robert Hancock 2021-03-25  1690  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0566592478211851786==--

