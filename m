Content-Type: multipart/mixed; boundary="===============5336795694328340557=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ti:ti-rt-linux-5.10.y 15881/15918] drivers/i2c/i2c-core-base.c:952 i2c_new_client_device() warn: passing zero to 'ERR_PTR'
Date: Sun, 12 Jun 2022 11:57:01 +0800
Message-ID: <202206121144.5jxQnuwF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5336795694328340557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: vigneshr(a)ti.com
CC: nm(a)ti.com
CC: Vignesh Raghavendra <vigneshr@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.=
10.y
head:   61a16f0e26b5e043e3555a0923e0ab75c5cb2239
commit: c0310e2d8c4fd7df44bc194a295314dd104df623 [15881/15918] i2c: core: l=
et adapters be notified of client attach/detach
:::::: branch date: 19 hours ago
:::::: commit date: 12 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20612/202206121144.5jxQnuwF-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/i2c/i2c-core-base.c:952 i2c_new_client_device() warn: passing zero =
to 'ERR_PTR'

vim +/ERR_PTR +952 drivers/i2c/i2c-core-base.c

4124c4eba40256 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-03-01  85=
4  =

9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  85=
5  /**
7159dbdae3c58d drivers/i2c/i2c-core-base.c Heiner Kallweit   2019-05-16  85=
6   * i2c_new_client_device - instantiate an i2c device
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  85=
7   * @adap: the adapter managing the device
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  85=
8   * @info: describes one I2C device; bus_num is ignored
d64f73be1b59b9 drivers/i2c/i2c-core.c      David Brownell    2007-07-12  85=
9   * Context: can sleep
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  86=
0   *
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  86=
1   * Create an i2c device. Binding is handled through driver model
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  86=
2   * probe()/remove() methods.  A driver may be bound to this device when =
we
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  86=
3   * return from this function, or any later moment (e.g. maybe hotpluggin=
g will
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  86=
4   * load the driver module).  This call is not appropriate for use by mai=
nboard
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  86=
5   * initialization logic, which usually runs during an arch_initcall() lo=
ng
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  86=
6   * before any i2c_adapter could exist.
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  86=
7   *
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  86=
8   * This returns the new i2c client, which may be saved for later use with
7159dbdae3c58d drivers/i2c/i2c-core-base.c Heiner Kallweit   2019-05-16  86=
9   * i2c_unregister_device(); or an ERR_PTR to describe the error.
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  87=
0   */
550113d4e9f5c7 drivers/i2c/i2c-core-base.c Wolfram Sang      2019-06-24  87=
1  struct i2c_client *
7159dbdae3c58d drivers/i2c/i2c-core-base.c Heiner Kallweit   2019-05-16  87=
2  i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info co=
nst *info)
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  87=
3  {
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  87=
4  	struct i2c_client	*client;
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  87=
5  	int			status;
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  87=
6  =

9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  87=
7  	client =3D kzalloc(sizeof *client, GFP_KERNEL);
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  87=
8  	if (!client)
7159dbdae3c58d drivers/i2c/i2c-core-base.c Heiner Kallweit   2019-05-16  87=
9  		return ERR_PTR(-ENOMEM);
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  88=
0  =

9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  88=
1  	client->adapter =3D adap;
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  88=
2  =

9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  88=
3  	client->dev.platform_data =3D info->platform_data;
ee35425c8eb115 drivers/i2c/i2c-core.c      Marc Pignat       2008-08-28  88=
4  	client->flags =3D info->flags;
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  88=
5  	client->addr =3D info->addr;
4124c4eba40256 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-03-01  88=
6  =

93b6604c5a669d drivers/i2c/i2c-core-base.c Jim Broadus       2019-02-19  88=
7  	client->init_irq =3D info->irq;
93b6604c5a669d drivers/i2c/i2c-core-base.c Jim Broadus       2019-02-19  88=
8  	if (!client->init_irq)
93b6604c5a669d drivers/i2c/i2c-core-base.c Jim Broadus       2019-02-19  88=
9  		client->init_irq =3D i2c_dev_irq_from_resources(info->resources,
4124c4eba40256 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-03-01  89=
0  							 info->num_resources);
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  89=
1  =

9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  89=
2  	strlcpy(client->name, info->type, sizeof(client->name));
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  89=
3  =

c4019b7040eaf8 drivers/i2c/i2c-core.c      Wolfram Sang      2015-07-17  89=
4  	status =3D i2c_check_addr_validity(client->addr, client->flags);
3a89db5f305766 drivers/i2c/i2c-core.c      Jean Delvare      2010-06-03  89=
5  	if (status) {
3a89db5f305766 drivers/i2c/i2c-core.c      Jean Delvare      2010-06-03  89=
6  		dev_err(&adap->dev, "Invalid %d-bit I2C address 0x%02hx\n",
3a89db5f305766 drivers/i2c/i2c-core.c      Jean Delvare      2010-06-03  89=
7  			client->flags & I2C_CLIENT_TEN ? 10 : 7, client->addr);
3a89db5f305766 drivers/i2c/i2c-core.c      Jean Delvare      2010-06-03  89=
8  		goto out_err_silent;
3a89db5f305766 drivers/i2c/i2c-core.c      Jean Delvare      2010-06-03  89=
9  	}
3a89db5f305766 drivers/i2c/i2c-core.c      Jean Delvare      2010-06-03  90=
0  =

f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  90=
1  	/* Check for address business */
9bccc70a127cfe drivers/i2c/i2c-core.c      Wolfram Sang      2015-07-17  90=
2  	status =3D i2c_check_addr_busy(adap, i2c_encode_flags_to_addr(client));
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  90=
3  	if (status)
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  90=
4  		goto out_err;
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  90=
5  =

f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  90=
6  	client->dev.parent =3D &client->adapter->dev;
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  90=
7  	client->dev.bus =3D &i2c_bus_type;
51298d1257b9f0 drivers/i2c/i2c-core.c      Jean Delvare      2009-09-18  90=
8  	client->dev.type =3D &i2c_client_type;
04782265641839 drivers/i2c/i2c-core-base.c Boris Brezillon   2018-03-25  90=
9  	client->dev.of_node =3D of_node_get(info->of_node);
ce793486e23e01 drivers/i2c/i2c-core.c      Rafael J. Wysocki 2015-03-16  91=
0  	client->dev.fwnode =3D info->fwnode;
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  91=
1  =

728fe6cef27444 drivers/i2c/i2c-core-base.c Hans de Goede     2017-10-11  91=
2  	i2c_dev_set_name(adap, client, info);
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  91=
3  =

d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  91=
4  	if (info->properties) {
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  91=
5  		status =3D device_add_properties(&client->dev, info->properties);
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  91=
6  		if (status) {
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  91=
7  			dev_err(&adap->dev,
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  91=
8  				"Failed to add properties to client %s: %d\n",
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  91=
9  				client->name, status);
04782265641839 drivers/i2c/i2c-core-base.c Boris Brezillon   2018-03-25  92=
0  			goto out_err_put_of_node;
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  92=
1  		}
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  92=
2  	}
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  92=
3  =

c0310e2d8c4fd7 drivers/i2c/i2c-core-base.c Luca Ceresoli     2022-04-13  92=
4  	if (adap->attach_ops &&
c0310e2d8c4fd7 drivers/i2c/i2c-core-base.c Luca Ceresoli     2022-04-13  92=
5  	    adap->attach_ops->attach_client &&
c0310e2d8c4fd7 drivers/i2c/i2c-core-base.c Luca Ceresoli     2022-04-13  92=
6  	    adap->attach_ops->attach_client(adap, info, client) !=3D 0)
c0310e2d8c4fd7 drivers/i2c/i2c-core-base.c Luca Ceresoli     2022-04-13  92=
7  		goto out_free_props;
c0310e2d8c4fd7 drivers/i2c/i2c-core-base.c Luca Ceresoli     2022-04-13  92=
8  =

f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  92=
9  	status =3D device_register(&client->dev);
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  93=
0  	if (status)
c0310e2d8c4fd7 drivers/i2c/i2c-core-base.c Luca Ceresoli     2022-04-13  93=
1  		goto out_detach_client;
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  93=
2  =

f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  93=
3  	dev_dbg(&adap->dev, "client [%s] registered with bus id %s\n",
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  93=
4  		client->name, dev_name(&client->dev));
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  93=
5  =

9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  93=
6  	return client;
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  93=
7  =

c0310e2d8c4fd7 drivers/i2c/i2c-core-base.c Luca Ceresoli     2022-04-13  93=
8  out_detach_client:
c0310e2d8c4fd7 drivers/i2c/i2c-core-base.c Luca Ceresoli     2022-04-13  93=
9  	if (adap->attach_ops && adap->attach_ops->detach_client)
c0310e2d8c4fd7 drivers/i2c/i2c-core-base.c Luca Ceresoli     2022-04-13  94=
0  		adap->attach_ops->detach_client(adap, client);
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  94=
1  out_free_props:
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  94=
2  	if (info->properties)
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  94=
3  		device_remove_properties(&client->dev);
04782265641839 drivers/i2c/i2c-core-base.c Boris Brezillon   2018-03-25  94=
4  out_err_put_of_node:
04782265641839 drivers/i2c/i2c-core-base.c Boris Brezillon   2018-03-25  94=
5  	of_node_put(info->of_node);
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  94=
6  out_err:
b93d3d37392467 drivers/i2c/i2c-core.c      Andy Shevchenko   2016-08-25  94=
7  	dev_err(&adap->dev,
b93d3d37392467 drivers/i2c/i2c-core.c      Andy Shevchenko   2016-08-25  94=
8  		"Failed to register i2c client %s at 0x%02x (%d)\n",
b93d3d37392467 drivers/i2c/i2c-core.c      Andy Shevchenko   2016-08-25  94=
9  		client->name, client->addr, status);
3a89db5f305766 drivers/i2c/i2c-core.c      Jean Delvare      2010-06-03  95=
0  out_err_silent:
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  95=
1  	kfree(client);
7159dbdae3c58d drivers/i2c/i2c-core-base.c Heiner Kallweit   2019-05-16 @95=
2  	return ERR_PTR(status);
7159dbdae3c58d drivers/i2c/i2c-core-base.c Heiner Kallweit   2019-05-16  95=
3  }
7159dbdae3c58d drivers/i2c/i2c-core-base.c Heiner Kallweit   2019-05-16  95=
4  EXPORT_SYMBOL_GPL(i2c_new_client_device);
7159dbdae3c58d drivers/i2c/i2c-core-base.c Heiner Kallweit   2019-05-16  95=
5  =


:::::: The code at line 952 was first introduced by commit
:::::: 7159dbdae3c58d0200ae2550fab977a19a3c497a i2c: core: improve return v=
alue handling of i2c_new_device and i2c_new_dummy

:::::: TO: Heiner Kallweit <hkallweit1@gmail.com>
:::::: CC: Wolfram Sang <wsa@the-dreams.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5336795694328340557==--

