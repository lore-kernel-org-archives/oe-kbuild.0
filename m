Content-Type: multipart/mixed; boundary="===============4820398200402196614=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 3/3 v2] rtc: abx80x: Add support for autocalibration filter capacitor
Date: Mon, 15 Jun 2020 12:47:02 +0300
Message-ID: <20200615094702.GI4151@kadam>
In-Reply-To: <20200612223551.282113-3-kevin+linux@km6g.us>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4820398200402196614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi "Kevin,

Thank you for the patch! Perhaps something to improve:

url:    https://github.com/0day-ci/linux/commits/Kevin-P-Fleming/dt-binding=
s-abx80x-Add-autocal-filter-property/20200613-063944
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git =
rtc-next
config: i386-randconfig-m021-20200612 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/rtc/rtc-abx80x.c:821 abx80x_probe() error: uninitialized symbol 'tr=
ickle_cfg'.

# https://github.com/0day-ci/linux/commit/bbd3b3445f48810231c5f004a975116f1=
9b37331
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout bbd3b3445f48810231c5f004a975116f19b37331
vim +/trickle_cfg +821 drivers/rtc/rtc-abx80x.c

4d61ff6b9960cb Philippe De Muyter 2015-05-05  700  static int abx80x_probe(=
struct i2c_client *client,
4d61ff6b9960cb Philippe De Muyter 2015-05-05  701  			const struct i2c_devi=
ce_id *id)
4d61ff6b9960cb Philippe De Muyter 2015-05-05  702  {
4d61ff6b9960cb Philippe De Muyter 2015-05-05  703  	struct device_node *np =
=3D client->dev.of_node;
af69f9a7878413 Jeremy Gebben      2018-09-11  704  	struct abx80x_priv *pri=
v;
bbd3b3445f4881 Kevin P. Fleming   2020-06-12  705  	int i, data, err, trick=
le_cfg, filter_cfg =3D -EINVAL;
                                                                          ^=
^^^^^^^^^^

4d61ff6b9960cb Philippe De Muyter 2015-05-05  706  	char buf[7];
4d61ff6b9960cb Philippe De Muyter 2015-05-05  707  	unsigned int part =3D i=
d->driver_data;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  708  	unsigned int partnumber;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  709  	unsigned int majrev, mi=
nrev;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  710  	unsigned int lot;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  711  	unsigned int wafer;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  712  	unsigned int uid;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  713  =

4d61ff6b9960cb Philippe De Muyter 2015-05-05  714  	if (!i2c_check_function=
ality(client->adapter, I2C_FUNC_I2C))
4d61ff6b9960cb Philippe De Muyter 2015-05-05  715  		return -ENODEV;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  716  =

4d61ff6b9960cb Philippe De Muyter 2015-05-05  717  	err =3D i2c_smbus_read_=
i2c_block_data(client, ABX8XX_REG_ID0,
4d61ff6b9960cb Philippe De Muyter 2015-05-05  718  					    sizeof(buf), bu=
f);
4d61ff6b9960cb Philippe De Muyter 2015-05-05  719  	if (err < 0) {
4d61ff6b9960cb Philippe De Muyter 2015-05-05  720  		dev_err(&client->dev, =
"Unable to read partnumber\n");
4d61ff6b9960cb Philippe De Muyter 2015-05-05  721  		return -EIO;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  722  	}
4d61ff6b9960cb Philippe De Muyter 2015-05-05  723  =

4d61ff6b9960cb Philippe De Muyter 2015-05-05  724  	partnumber =3D (buf[0] =
<< 8) | buf[1];
4d61ff6b9960cb Philippe De Muyter 2015-05-05  725  	majrev =3D buf[2] >> 3;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  726  	minrev =3D buf[2] & 0x7;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  727  	lot =3D ((buf[4] & 0x80=
) << 2) | ((buf[6] & 0x80) << 1) | buf[3];
4d61ff6b9960cb Philippe De Muyter 2015-05-05  728  	uid =3D ((buf[4] & 0x7f=
) << 8) | buf[5];
4d61ff6b9960cb Philippe De Muyter 2015-05-05  729  	wafer =3D (buf[6] & 0x7=
c) >> 2;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  730  	dev_info(&client->dev, =
"model %04x, revision %u.%u, lot %x, wafer %x, uid %x\n",
4d61ff6b9960cb Philippe De Muyter 2015-05-05  731  		 partnumber, majrev, m=
inrev, lot, wafer, uid);
4d61ff6b9960cb Philippe De Muyter 2015-05-05  732  =

4d61ff6b9960cb Philippe De Muyter 2015-05-05  733  	data =3D i2c_smbus_read=
_byte_data(client, ABX8XX_REG_CTRL1);
4d61ff6b9960cb Philippe De Muyter 2015-05-05  734  	if (data < 0) {
4d61ff6b9960cb Philippe De Muyter 2015-05-05  735  		dev_err(&client->dev, =
"Unable to read control register\n");
4d61ff6b9960cb Philippe De Muyter 2015-05-05  736  		return -EIO;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  737  	}
4d61ff6b9960cb Philippe De Muyter 2015-05-05  738  =

4d61ff6b9960cb Philippe De Muyter 2015-05-05  739  	err =3D i2c_smbus_write=
_byte_data(client, ABX8XX_REG_CTRL1,
718a820a303ca6 Alexandre Belloni  2015-12-17  740  					((data & ~(ABX8XX_C=
TRL_12_24 |
718a820a303ca6 Alexandre Belloni  2015-12-17  741  						   ABX8XX_CTRL_ARS=
T)) |
4d61ff6b9960cb Philippe De Muyter 2015-05-05  742  					 ABX8XX_CTRL_WRITE)=
);
4d61ff6b9960cb Philippe De Muyter 2015-05-05  743  	if (err < 0) {
4d61ff6b9960cb Philippe De Muyter 2015-05-05  744  		dev_err(&client->dev, =
"Unable to write control register\n");
4d61ff6b9960cb Philippe De Muyter 2015-05-05  745  		return -EIO;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  746  	}
4d61ff6b9960cb Philippe De Muyter 2015-05-05  747  =

75455e258ea2b3 Marek Vasut        2019-01-29  748  	/* Configure RV1805 spe=
cifics */
75455e258ea2b3 Marek Vasut        2019-01-29  749  	if (part =3D=3D RV1805)=
 {
75455e258ea2b3 Marek Vasut        2019-01-29  750  		/*
75455e258ea2b3 Marek Vasut        2019-01-29  751  		 * Avoid accidentally =
entering test mode. This can happen
75455e258ea2b3 Marek Vasut        2019-01-29  752  		 * on the RV1805 in ca=
se the reserved bit 5 in control2
75455e258ea2b3 Marek Vasut        2019-01-29  753  		 * register is set. RV=
-1805-C3 datasheet indicates that
75455e258ea2b3 Marek Vasut        2019-01-29  754  		 * the bit should be c=
leared in section 11h - Control2.
75455e258ea2b3 Marek Vasut        2019-01-29  755  		 */
75455e258ea2b3 Marek Vasut        2019-01-29  756  		data =3D i2c_smbus_rea=
d_byte_data(client, ABX8XX_REG_CTRL2);
75455e258ea2b3 Marek Vasut        2019-01-29  757  		if (data < 0) {
75455e258ea2b3 Marek Vasut        2019-01-29  758  			dev_err(&client->dev,
75455e258ea2b3 Marek Vasut        2019-01-29  759  				"Unable to read cont=
rol2 register\n");
75455e258ea2b3 Marek Vasut        2019-01-29  760  			return -EIO;
75455e258ea2b3 Marek Vasut        2019-01-29  761  		}
75455e258ea2b3 Marek Vasut        2019-01-29  762  =

75455e258ea2b3 Marek Vasut        2019-01-29  763  		err =3D i2c_smbus_writ=
e_byte_data(client, ABX8XX_REG_CTRL2,
75455e258ea2b3 Marek Vasut        2019-01-29  764  						data & ~ABX8XX_CTR=
L2_RSVD);
75455e258ea2b3 Marek Vasut        2019-01-29  765  		if (err < 0) {
75455e258ea2b3 Marek Vasut        2019-01-29  766  			dev_err(&client->dev,
75455e258ea2b3 Marek Vasut        2019-01-29  767  				"Unable to write con=
trol2 register\n");
75455e258ea2b3 Marek Vasut        2019-01-29  768  			return -EIO;
75455e258ea2b3 Marek Vasut        2019-01-29  769  		}
75455e258ea2b3 Marek Vasut        2019-01-29  770  =

75455e258ea2b3 Marek Vasut        2019-01-29  771  		/*
75455e258ea2b3 Marek Vasut        2019-01-29  772  		 * Avoid extra power l=
eakage. The RV1805 uses smaller
75455e258ea2b3 Marek Vasut        2019-01-29  773  		 * 10pin package and t=
he EXTI input is not present.
75455e258ea2b3 Marek Vasut        2019-01-29  774  		 * Disable it to avoid=
 leakage.
75455e258ea2b3 Marek Vasut        2019-01-29  775  		 */
75455e258ea2b3 Marek Vasut        2019-01-29  776  		data =3D i2c_smbus_rea=
d_byte_data(client, ABX8XX_REG_OUT_CTRL);
75455e258ea2b3 Marek Vasut        2019-01-29  777  		if (data < 0) {
75455e258ea2b3 Marek Vasut        2019-01-29  778  			dev_err(&client->dev,
75455e258ea2b3 Marek Vasut        2019-01-29  779  				"Unable to read outp=
ut control register\n");
75455e258ea2b3 Marek Vasut        2019-01-29  780  			return -EIO;
75455e258ea2b3 Marek Vasut        2019-01-29  781  		}
75455e258ea2b3 Marek Vasut        2019-01-29  782  =

75455e258ea2b3 Marek Vasut        2019-01-29  783  		/*
75455e258ea2b3 Marek Vasut        2019-01-29  784  		 * Write the configura=
tion key register to enable access to
75455e258ea2b3 Marek Vasut        2019-01-29  785  		 * the config2 register
75455e258ea2b3 Marek Vasut        2019-01-29  786  		 */
fee83bca1a1fde Kevin P. Fleming   2020-06-12  787  		if (abx80x_write_confi=
g_key(client, ABX8XX_CFG_KEY_MISC) < 0)
75455e258ea2b3 Marek Vasut        2019-01-29  788  			return -EIO;
75455e258ea2b3 Marek Vasut        2019-01-29  789  =

75455e258ea2b3 Marek Vasut        2019-01-29  790  		err =3D i2c_smbus_writ=
e_byte_data(client, ABX8XX_REG_OUT_CTRL,
75455e258ea2b3 Marek Vasut        2019-01-29  791  						data | ABX8XX_OUT_=
CTRL_EXDS);
75455e258ea2b3 Marek Vasut        2019-01-29  792  		if (err < 0) {
75455e258ea2b3 Marek Vasut        2019-01-29  793  			dev_err(&client->dev,
75455e258ea2b3 Marek Vasut        2019-01-29  794  				"Unable to write out=
put control register\n");
75455e258ea2b3 Marek Vasut        2019-01-29  795  			return -EIO;
75455e258ea2b3 Marek Vasut        2019-01-29  796  		}
75455e258ea2b3 Marek Vasut        2019-01-29  797  	}
75455e258ea2b3 Marek Vasut        2019-01-29  798  =

4d61ff6b9960cb Philippe De Muyter 2015-05-05  799  	/* part autodetection */
4d61ff6b9960cb Philippe De Muyter 2015-05-05  800  	if (part =3D=3D ABX80X)=
 {
4d61ff6b9960cb Philippe De Muyter 2015-05-05  801  		for (i =3D 0; abx80x_c=
aps[i].pn; i++)
4d61ff6b9960cb Philippe De Muyter 2015-05-05  802  			if (partnumber =3D=3D=
 abx80x_caps[i].pn)
4d61ff6b9960cb Philippe De Muyter 2015-05-05  803  				break;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  804  		if (abx80x_caps[i].pn =
=3D=3D 0) {
4d61ff6b9960cb Philippe De Muyter 2015-05-05  805  			dev_err(&client->dev,=
 "Unknown part: %04x\n",
4d61ff6b9960cb Philippe De Muyter 2015-05-05  806  				partnumber);
4d61ff6b9960cb Philippe De Muyter 2015-05-05  807  			return -EINVAL;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  808  		}
4d61ff6b9960cb Philippe De Muyter 2015-05-05  809  		part =3D i;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  810  	}
4d61ff6b9960cb Philippe De Muyter 2015-05-05  811  =

4d61ff6b9960cb Philippe De Muyter 2015-05-05  812  	if (partnumber !=3D abx=
80x_caps[part].pn) {
4d61ff6b9960cb Philippe De Muyter 2015-05-05  813  		dev_err(&client->dev, =
"partnumber mismatch %04x !=3D %04x\n",
4d61ff6b9960cb Philippe De Muyter 2015-05-05  814  			partnumber, abx80x_ca=
ps[part].pn);
4d61ff6b9960cb Philippe De Muyter 2015-05-05  815  		return -EINVAL;
4d61ff6b9960cb Philippe De Muyter 2015-05-05  816  	}
4d61ff6b9960cb Philippe De Muyter 2015-05-05  817  =

4d61ff6b9960cb Philippe De Muyter 2015-05-05  818  	if (np && abx80x_caps[p=
art].has_tc)
6e429f6b8c6b8f Kevin P. Fleming   2020-05-30  819  		trickle_cfg =3D abx80x=
_dt_trickle_cfg(client);
                                                                ^^^^^^^^^^^=
^^
Not initialized on else path.

4d61ff6b9960cb Philippe De Muyter 2015-05-05  820  =

4d61ff6b9960cb Philippe De Muyter 2015-05-05 @821  	if (trickle_cfg > 0) {
                                                            ^^^^^^^^^^^

4d61ff6b9960cb Philippe De Muyter 2015-05-05  822  		dev_info(&client->dev,=
 "Enabling trickle charger: %02x\n",
4d61ff6b9960cb Philippe De Muyter 2015-05-05  823  			 trickle_cfg);
4d61ff6b9960cb Philippe De Muyter 2015-05-05  824  		abx80x_enable_trickle_=
charger(client, trickle_cfg);
4d61ff6b9960cb Philippe De Muyter 2015-05-05  825  	}
4d61ff6b9960cb Philippe De Muyter 2015-05-05  826  =

718a820a303ca6 Alexandre Belloni  2015-12-17  827  	err =3D i2c_smbus_write=
_byte_data(client, ABX8XX_REG_CD_TIMER_CTL,
718a820a303ca6 Alexandre Belloni  2015-12-17  828  					BIT(2));
718a820a303ca6 Alexandre Belloni  2015-12-17  829  	if (err)
718a820a303ca6 Alexandre Belloni  2015-12-17  830  		return err;
718a820a303ca6 Alexandre Belloni  2015-12-17  831  =

af69f9a7878413 Jeremy Gebben      2018-09-11  832  	priv =3D devm_kzalloc(&=
client->dev, sizeof(*priv), GFP_KERNEL);
af69f9a7878413 Jeremy Gebben      2018-09-11  833  	if (priv =3D=3D NULL)
af69f9a7878413 Jeremy Gebben      2018-09-11  834  		return -ENOMEM;
af69f9a7878413 Jeremy Gebben      2018-09-11  835  =

af69f9a7878413 Jeremy Gebben      2018-09-11  836  	priv->rtc =3D devm_rtc_=
allocate_device(&client->dev);
af69f9a7878413 Jeremy Gebben      2018-09-11  837  	if (IS_ERR(priv->rtc))
af69f9a7878413 Jeremy Gebben      2018-09-11  838  		return PTR_ERR(priv->r=
tc);
4d61ff6b9960cb Philippe De Muyter 2015-05-05  839  =

af69f9a7878413 Jeremy Gebben      2018-09-11  840  	priv->rtc->ops =3D &abx=
80x_rtc_ops;
af69f9a7878413 Jeremy Gebben      2018-09-11  841  	priv->client =3D client;
9360a6a81862d3 Alexandre Belloni  2017-10-13  842  =

af69f9a7878413 Jeremy Gebben      2018-09-11  843  	i2c_set_clientdata(clie=
nt, priv);
4d61ff6b9960cb Philippe De Muyter 2015-05-05  844  =

749e36d0a0d725 Jeremy Gebben      2018-09-11  845  	if (abx80x_caps[part].h=
as_wdog) {
749e36d0a0d725 Jeremy Gebben      2018-09-11  846  		err =3D abx80x_setup_w=
atchdog(priv);
749e36d0a0d725 Jeremy Gebben      2018-09-11  847  		if (err)
749e36d0a0d725 Jeremy Gebben      2018-09-11  848  			return err;
749e36d0a0d725 Jeremy Gebben      2018-09-11  849  	}
749e36d0a0d725 Jeremy Gebben      2018-09-11  850  =

bbd3b3445f4881 Kevin P. Fleming   2020-06-12  851  	if (of_property_read_u3=
2(np, "abracon,autocal_filter", &filter_cfg) =3D=3D 0) {
bbd3b3445f4881 Kevin P. Fleming   2020-06-12  852  		err =3D abx80x_set_aut=
ocal_filter(client,
bbd3b3445f4881 Kevin P. Fleming   2020-06-12  853  						filter_cfg ?
bbd3b3445f4881 Kevin P. Fleming   2020-06-12  854  						ABX8XX_AUTOCAL_FIL=
TER_ENABLE :
bbd3b3445f4881 Kevin P. Fleming   2020-06-12  855  						ABX8XX_AUTOCAL_FIL=
TER_DISABLE);
bbd3b3445f4881 Kevin P. Fleming   2020-06-12  856  		if (err)
bbd3b3445f4881 Kevin P. Fleming   2020-06-12  857  			return err;
bbd3b3445f4881 Kevin P. Fleming   2020-06-12  858  	}
bbd3b3445f4881 Kevin P. Fleming   2020-06-12  859  =

718a820a303ca6 Alexandre Belloni  2015-12-17  860  	if (client->irq > 0) {
718a820a303ca6 Alexandre Belloni  2015-12-17  861  		dev_info(&client->dev,=
 "IRQ %d supplied\n", client->irq);
718a820a303ca6 Alexandre Belloni  2015-12-17  862  		err =3D devm_request_t=
hreaded_irq(&client->dev, client->irq, NULL,
718a820a303ca6 Alexandre Belloni  2015-12-17  863  						abx80x_handle_irq,
718a820a303ca6 Alexandre Belloni  2015-12-17  864  						IRQF_SHARED | IRQF=
_ONESHOT,
718a820a303ca6 Alexandre Belloni  2015-12-17  865  						"abx8xx",
718a820a303ca6 Alexandre Belloni  2015-12-17  866  						client);
718a820a303ca6 Alexandre Belloni  2015-12-17  867  		if (err) {
718a820a303ca6 Alexandre Belloni  2015-12-17  868  			dev_err(&client->dev,=
 "unable to request IRQ, alarms disabled\n");
718a820a303ca6 Alexandre Belloni  2015-12-17  869  			client->irq =3D 0;
718a820a303ca6 Alexandre Belloni  2015-12-17  870  		}
718a820a303ca6 Alexandre Belloni  2015-12-17  871  	}
718a820a303ca6 Alexandre Belloni  2015-12-17  872  =

559e883e0f7768 Alexandre Belloni  2019-03-06  873  	err =3D rtc_add_group(p=
riv->rtc, &rtc_calib_attr_group);
59a8383adb7545 Myl=C3=A8ne Josserand   2016-03-21  874  	if (err) {
59a8383adb7545 Myl=C3=A8ne Josserand   2016-03-21  875  		dev_err(&client->=
dev, "Failed to create sysfs group: %d\n",
59a8383adb7545 Myl=C3=A8ne Josserand   2016-03-21  876  			err);
59a8383adb7545 Myl=C3=A8ne Josserand   2016-03-21  877  		return err;
59a8383adb7545 Myl=C3=A8ne Josserand   2016-03-21  878  	}
59a8383adb7545 Myl=C3=A8ne Josserand   2016-03-21  879  =

559e883e0f7768 Alexandre Belloni  2019-03-06  880  	return rtc_register_dev=
ice(priv->rtc);
4d61ff6b9960cb Philippe De Muyter 2015-05-05  881  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4820398200402196614==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4820398200402196614==--

