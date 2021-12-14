Content-Type: multipart/mixed; boundary="===============7577946124730494016=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 4/4] i2c-mux-pca954x: Add regulator support
Date: Wed, 15 Dec 2021 02:46:17 +0800
Message-ID: <202112150247.RE72OaYJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7577946124730494016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211214095021.572799-4-patrick.rudolph@9elements.com>
References: <20211214095021.572799-4-patrick.rudolph@9elements.com>
TO: Patrick Rudolph <patrick.rudolph@9elements.com>
TO: Peter Rosin <peda@axentia.se>
CC: Patrick Rudolph <patrick.rudolph@9elements.com>
CC: linux-i2c(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Patrick,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on robh/for-next linux/master linus/master v5.16-r=
c5 next-20211213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Patrick-Rudolph/dt-binding=
s-i2c-Update-PCA954x/20211214-175258
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/f=
or-next
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: i386-randconfig-m021-20211214 (https://download.01.org/0day-ci/arch=
ive/20211215/202112150247.RE72OaYJ-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/i2c/muxes/i2c-mux-pca954x.c:502 pca954x_probe() error: uninitialize=
d symbol 'ret'.

vim +/ret +502 drivers/i2c/muxes/i2c-mux-pca954x.c

e65e228eb0963b drivers/i2c/muxes/i2c-mux-pca954x.c Biwen Li         2019-12=
-25  470  =

7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  471  /*
7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  472   * I2C init/probing/exit functions
7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  473   */
db79f2a1d259a9 drivers/i2c/muxes/pca954x.c         Guenter Roeck    2010-10=
-24  474  static int pca954x_probe(struct i2c_client *client,
7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  475  			 const struct i2c_device_id *id)
7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  476  {
f2e0821377a37a drivers/i2c/muxes/i2c-mux-pca954x.c Luca Ceresoli    2018-10=
-03  477  	struct i2c_adapter *adap =3D client->adapter;
6856909ce542dd drivers/i2c/muxes/i2c-mux-pca954x.c Linus Walleij    2018-06=
-05  478  	struct device *dev =3D &client->dev;
4807e8459bce42 drivers/i2c/muxes/i2c-mux-pca954x.c Laurent Pinchart 2014-06=
-03  479  	struct gpio_desc *gpio;
7fcac980717532 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2016-04=
-20  480  	struct i2c_mux_core *muxc;
7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  481  	struct pca954x *data;
ddd7c492d419ea drivers/i2c/muxes/i2c-mux-pca954x.c Robert Shearman  2019-02=
-28  482  	int num;
bc12cfc87f1028 drivers/i2c/muxes/i2c-mux-pca954x.c Laurent Pinchart 2013-11=
-29  483  	int ret;
7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  484  =

7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  485  	if (!i2c_check_functionality(adap, I2C_FUNC_SMBUS_BYTE))
bc12cfc87f1028 drivers/i2c/muxes/i2c-mux-pca954x.c Laurent Pinchart 2013-11=
-29  486  		return -ENODEV;
7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  487  =

6856909ce542dd drivers/i2c/muxes/i2c-mux-pca954x.c Linus Walleij    2018-06=
-05  488  	muxc =3D i2c_mux_alloc(adap, dev, PCA954X_MAX_NCHANS, sizeof(*da=
ta), 0,
7fcac980717532 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2016-04=
-20  489  			     pca954x_select_chan, pca954x_deselect_mux);
7fcac980717532 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2016-04=
-20  490  	if (!muxc)
bc12cfc87f1028 drivers/i2c/muxes/i2c-mux-pca954x.c Laurent Pinchart 2013-11=
-29  491  		return -ENOMEM;
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  492  =

7fcac980717532 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2016-04=
-20  493  	data =3D i2c_mux_priv(muxc);
7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  494  =

7fcac980717532 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2016-04=
-20  495  	i2c_set_clientdata(client, muxc);
7fcac980717532 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2016-04=
-20  496  	data->client =3D client;
7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  497  =

3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  498  	data->supply =3D devm_regulator_get(dev, "vcc");
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  499  	if (IS_ERR(data->supply)) {
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  500  		if ((PTR_ERR(data->supply) =3D=3D -EPROBE_DEFER))
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  501  			return -EPROBE_DEFER;
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14 @502  		dev_warn(dev, "Failed to get regulator for vcc: %d\n", ret);
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  503  	} else {
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  504  		ret =3D regulator_enable(data->supply);
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  505  		if (ret) {
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  506  			dev_err(dev, "Failed to enable regulator vcc\n");
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  507  			return ret;
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  508  		}
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  509  	}
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  510  =

a2f8445d4ca279 drivers/i2c/muxes/i2c-mux-pca954x.c Mike Looijmans   2018-05=
-01  511  	/* Reset the mux if a reset GPIO is specified. */
6856909ce542dd drivers/i2c/muxes/i2c-mux-pca954x.c Linus Walleij    2018-06=
-05  512  	gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  513  	if (IS_ERR(gpio)) {
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  514  		ret =3D PTR_ERR(gpio);
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  515  		goto fail_cleanup;
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  516  	}
a2f8445d4ca279 drivers/i2c/muxes/i2c-mux-pca954x.c Mike Looijmans   2018-05=
-01  517  	if (gpio) {
a2f8445d4ca279 drivers/i2c/muxes/i2c-mux-pca954x.c Mike Looijmans   2018-05=
-01  518  		udelay(1);
a2f8445d4ca279 drivers/i2c/muxes/i2c-mux-pca954x.c Mike Looijmans   2018-05=
-01  519  		gpiod_set_value_cansleep(gpio, 0);
a2f8445d4ca279 drivers/i2c/muxes/i2c-mux-pca954x.c Mike Looijmans   2018-05=
-01  520  		/* Give the chip some time to recover. */
a2f8445d4ca279 drivers/i2c/muxes/i2c-mux-pca954x.c Mike Looijmans   2018-05=
-01  521  		udelay(1);
a2f8445d4ca279 drivers/i2c/muxes/i2c-mux-pca954x.c Mike Looijmans   2018-05=
-01  522  	}
12097957a9ed13 drivers/i2c/muxes/i2c-mux-pca954x.c Laurent Pinchart 2013-11=
-29  523  =

753aa3694382c5 drivers/i2c/muxes/i2c-mux-pca954x.c Andy Shevchenko  2020-04=
-25  524  	data->chip =3D device_get_match_data(dev);
b10d7a1fd6fcb1 drivers/i2c/muxes/i2c-mux-pca954x.c Julia Lawall     2018-05=
-21  525  	if (!data->chip)
2d74187d5b4e29 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2018-01=
-22  526  		data->chip =3D &chips[id->driver_data];
2d74187d5b4e29 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2018-01=
-22  527  =

2d74187d5b4e29 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2018-01=
-22  528  	if (data->chip->id.manufacturer_id !=3D I2C_DEVICE_ID_NONE) {
2d74187d5b4e29 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2018-01=
-22  529  		struct i2c_device_identity id;
2d74187d5b4e29 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2018-01=
-22  530  =

2d74187d5b4e29 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2018-01=
-22  531  		ret =3D i2c_get_device_id(client, &id);
2d74187d5b4e29 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2018-01=
-22  532  		if (ret && ret !=3D -EOPNOTSUPP)
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  533  			goto fail_cleanup;
2d74187d5b4e29 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2018-01=
-22  534  =

2d74187d5b4e29 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2018-01=
-22  535  		if (!ret &&
2d74187d5b4e29 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2018-01=
-22  536  		    (id.manufacturer_id !=3D data->chip->id.manufacturer_id ||
2d74187d5b4e29 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2018-01=
-22  537  		     id.part_id !=3D data->chip->id.part_id)) {
6856909ce542dd drivers/i2c/muxes/i2c-mux-pca954x.c Linus Walleij    2018-06=
-05  538  			dev_warn(dev, "unexpected device id %03x-%03x-%x\n",
2d74187d5b4e29 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2018-01=
-22  539  				 id.manufacturer_id, id.part_id,
2d74187d5b4e29 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2018-01=
-22  540  				 id.die_revision);
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  541  			ret =3D -ENODEV;
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  542  			goto fail_cleanup;
2d74187d5b4e29 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2018-01=
-22  543  		}
2d74187d5b4e29 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2018-01=
-22  544  	}
2d74187d5b4e29 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2018-01=
-22  545  =

e65e228eb0963b drivers/i2c/muxes/i2c-mux-pca954x.c Biwen Li         2019-12=
-25  546  	data->idle_state =3D MUX_IDLE_AS_IS;
753aa3694382c5 drivers/i2c/muxes/i2c-mux-pca954x.c Andy Shevchenko  2020-04=
-25  547  	if (device_property_read_u32(dev, "idle-state", &data->idle_stat=
e)) {
753aa3694382c5 drivers/i2c/muxes/i2c-mux-pca954x.c Andy Shevchenko  2020-04=
-25  548  		if (device_property_read_bool(dev, "i2c-mux-idle-disconnect"))
e65e228eb0963b drivers/i2c/muxes/i2c-mux-pca954x.c Biwen Li         2019-12=
-25  549  			data->idle_state =3D MUX_IDLE_DISCONNECT;
e65e228eb0963b drivers/i2c/muxes/i2c-mux-pca954x.c Biwen Li         2019-12=
-25  550  	}
e65e228eb0963b drivers/i2c/muxes/i2c-mux-pca954x.c Biwen Li         2019-12=
-25  551  =

e65e228eb0963b drivers/i2c/muxes/i2c-mux-pca954x.c Biwen Li         2019-12=
-25  552  	/*
e65e228eb0963b drivers/i2c/muxes/i2c-mux-pca954x.c Biwen Li         2019-12=
-25  553  	 * Write the mux register at addr to verify
cd823db8b1161e drivers/i2c/muxes/pca954x.c         Petri Gynther    2011-06=
-29  554  	 * that the mux is in fact present. This also
e65e228eb0963b drivers/i2c/muxes/i2c-mux-pca954x.c Biwen Li         2019-12=
-25  555  	 * initializes the mux to a channel
e65e228eb0963b drivers/i2c/muxes/i2c-mux-pca954x.c Biwen Li         2019-12=
-25  556  	 * or disconnected state.
7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  557  	 */
e65e228eb0963b drivers/i2c/muxes/i2c-mux-pca954x.c Biwen Li         2019-12=
-25  558  	ret =3D pca954x_init(client, data);
e65e228eb0963b drivers/i2c/muxes/i2c-mux-pca954x.c Biwen Li         2019-12=
-25  559  	if (ret < 0) {
6856909ce542dd drivers/i2c/muxes/i2c-mux-pca954x.c Linus Walleij    2018-06=
-05  560  		dev_warn(dev, "probe failed\n");
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  561  		ret =3D -ENODEV;
3498c52eb6aec0 drivers/i2c/muxes/i2c-mux-pca954x.c Patrick Rudolph  2021-12=
-14  562  		goto fail_cleanup;
7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  563  	}
7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  564  =

f2114795f721bd drivers/i2c/muxes/i2c-mux-pca954x.c Phil Reid        2017-01=
-25  565  	ret =3D pca954x_irq_setup(muxc);
f2114795f721bd drivers/i2c/muxes/i2c-mux-pca954x.c Phil Reid        2017-01=
-25  566  	if (ret)
148baf1ddfb650 drivers/i2c/muxes/i2c-mux-pca954x.c Phil Reid        2017-08=
-24  567  		goto fail_cleanup;
f2114795f721bd drivers/i2c/muxes/i2c-mux-pca954x.c Phil Reid        2017-01=
-25  568  =

7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  569  	/* Now create an adapter for each channel */
8a191a7ad4ca90 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2016-07=
-09  570  	for (num =3D 0; num < data->chip->nchans; num++) {
ddd7c492d419ea drivers/i2c/muxes/i2c-mux-pca954x.c Robert Shearman  2019-02=
-28  571  		ret =3D i2c_mux_add_adapter(muxc, 0, num, 0);
0756ac32357340 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2017-04=
-03  572  		if (ret)
148baf1ddfb650 drivers/i2c/muxes/i2c-mux-pca954x.c Phil Reid        2017-08=
-24  573  			goto fail_cleanup;
148baf1ddfb650 drivers/i2c/muxes/i2c-mux-pca954x.c Phil Reid        2017-08=
-24  574  	}
148baf1ddfb650 drivers/i2c/muxes/i2c-mux-pca954x.c Phil Reid        2017-08=
-24  575  =

148baf1ddfb650 drivers/i2c/muxes/i2c-mux-pca954x.c Phil Reid        2017-08=
-24  576  	if (data->irq) {
6856909ce542dd drivers/i2c/muxes/i2c-mux-pca954x.c Linus Walleij    2018-06=
-05  577  		ret =3D devm_request_threaded_irq(dev, data->client->irq,
148baf1ddfb650 drivers/i2c/muxes/i2c-mux-pca954x.c Phil Reid        2017-08=
-24  578  						NULL, pca954x_irq_handler,
148baf1ddfb650 drivers/i2c/muxes/i2c-mux-pca954x.c Phil Reid        2017-08=
-24  579  						IRQF_ONESHOT | IRQF_SHARED,
148baf1ddfb650 drivers/i2c/muxes/i2c-mux-pca954x.c Phil Reid        2017-08=
-24  580  						"pca954x", data);
148baf1ddfb650 drivers/i2c/muxes/i2c-mux-pca954x.c Phil Reid        2017-08=
-24  581  		if (ret)
148baf1ddfb650 drivers/i2c/muxes/i2c-mux-pca954x.c Phil Reid        2017-08=
-24  582  			goto fail_cleanup;
7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  583  	}
7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  584  =

f1fb64b04bf414 drivers/i2c/muxes/i2c-mux-pca954x.c Robert Shearman  2019-02=
-28  585  	/*
f1fb64b04bf414 drivers/i2c/muxes/i2c-mux-pca954x.c Robert Shearman  2019-02=
-28  586  	 * The attr probably isn't going to be needed in most cases,
f1fb64b04bf414 drivers/i2c/muxes/i2c-mux-pca954x.c Robert Shearman  2019-02=
-28  587  	 * so don't fail completely on error.
f1fb64b04bf414 drivers/i2c/muxes/i2c-mux-pca954x.c Robert Shearman  2019-02=
-28  588  	 */
f1fb64b04bf414 drivers/i2c/muxes/i2c-mux-pca954x.c Robert Shearman  2019-02=
-28  589  	device_create_file(dev, &dev_attr_idle_state);
f1fb64b04bf414 drivers/i2c/muxes/i2c-mux-pca954x.c Robert Shearman  2019-02=
-28  590  =

6856909ce542dd drivers/i2c/muxes/i2c-mux-pca954x.c Linus Walleij    2018-06=
-05  591  	dev_info(dev, "registered %d multiplexed busses for I2C %s %s\n",
8a191a7ad4ca90 drivers/i2c/muxes/i2c-mux-pca954x.c Peter Rosin      2016-07=
-09  592  		 num, data->chip->muxtype =3D=3D pca954x_ismux
7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  593  				? "mux" : "switch", client->name);
7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  594  =

7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  595  	return 0;
7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  596  =

148baf1ddfb650 drivers/i2c/muxes/i2c-mux-pca954x.c Phil Reid        2017-08=
-24  597  fail_cleanup:
148baf1ddfb650 drivers/i2c/muxes/i2c-mux-pca954x.c Phil Reid        2017-08=
-24  598  	pca954x_cleanup(muxc);
7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  599  	return ret;
7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  600  }
7f528135da9704 drivers/i2c/muxes/pca954x.c         Michael Lawnick  2010-08=
-11  601  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7577946124730494016==--

