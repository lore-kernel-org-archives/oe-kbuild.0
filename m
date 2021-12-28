Content-Type: multipart/mixed; boundary="===============8592563858366771305=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 13/23] counter: Provide alternative counter registration functions
Date: Wed, 29 Dec 2021 03:45:50 +0800
Message-ID: <202112290340.PMwi47LV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8592563858366771305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211227094526.698714-14-u.kleine-koenig@pengutronix.de>
References: <20211227094526.698714-14-u.kleine-koenig@pengutronix.de>
TO: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@pengutronix.de>
TO: William Breathitt Gray <vilhelm.gray@gmail.com>
CC: "Lars-Peter Clausen" <lars@metafoo.de>
CC: kernel(a)pengutronix.de
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: linux-iio(a)vger.kernel.org
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: linux-kernel(a)vger.kernel.org

Hi "Uwe,

I love your patch! Perhaps something to improve:

[auto build test WARNING on a7904a538933c525096ca2ccde1e60d0ee62c08e]

url:    https://github.com/0day-ci/linux/commits/Uwe-Kleine-K-nig/counter-c=
leanups-and-device-lifetime-fixes/20211227-174815
base:   a7904a538933c525096ca2ccde1e60d0ee62c08e
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: i386-randconfig-m021-20211227 (https://download.01.org/0day-ci/arch=
ive/20211229/202112290340.PMwi47LV-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/counter/counter-core.c:175 counter_alloc() error: uninitialized sym=
bol 'id'.

vim +/id +175 drivers/counter/counter-core.c

aaec1a0f76ec25 William Breathitt Gray 2021-08-27  134  =

250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  135  /**
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  136   * counter_allo=
c - allocate a counter_device
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  137   * @sizeof_priv=
: size of the driver private data
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  138   *
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  139   * This is part=
 one of counter registration. The structure is allocated
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  140   * dynamically =
to ensure the right lifetime for the embedded struct device.
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  141   *
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  142   * If this succ=
eeds, call counter_put() to get rid of the counter_device again.
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  143   */
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  144  struct counter_=
device *counter_alloc(size_t sizeof_priv)
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  145  {
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  146  	struct counter=
_device_allochelper *ch;
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  147  	struct counter=
_device *counter;
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  148  	struct device =
*dev;
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  149  	int id, err;
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  150  =

250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  151  	ch =3D kzalloc=
(sizeof(*ch) + sizeof_priv, GFP_KERNEL);
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  152  	if (!ch) {
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  153  		err =3D -ENOM=
EM;
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  154  		goto err_allo=
c_ch;
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  155  	}
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  156  =

250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  157  	counter =3D &c=
h->counter;
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  158  	dev =3D &count=
er->dev;
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  159  =

250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  160  	/* Acquire uni=
que ID */
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  161  	err =3D ida_al=
loc(&counter_ida, GFP_KERNEL);
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  162  	if (err < 0) {
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  163  		goto err_ida_=
alloc;
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  164  	}
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  165  	dev->id =3D er=
r;
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  166  =

250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  167  	err =3D counte=
r_chrdev_add(counter);
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  168  	if (err < 0)
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  169  		goto err_chrd=
ev_add;
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  170  =

250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  171  	device_initial=
ize(dev);
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  172  	/* Configure d=
evice structure for Counter */
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  173  	dev->type =3D =
&counter_device_type;
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  174  	dev->bus =3D &=
counter_bus_type;
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27 @175  	dev->devt =3D =
MKDEV(MAJOR(counter_devt), id);
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  176  =

250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  177  	mutex_init(&co=
unter->ops_exist_lock);
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  178  =

250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  179  	return counter;
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  180  =

250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  181  err_chrdev_add:
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  182  =

250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  183  	ida_free(&coun=
ter_ida, dev->id);
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  184  err_ida_alloc:
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  185  =

250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  186  	kfree(ch);
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  187  err_alloc_ch:
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  188  =

250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  189  	return ERR_PTR=
(err);
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  190  }
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  191  EXPORT_SYMBOL_G=
PL(counter_alloc);
250e0e3d91caea Uwe Kleine-K=C3=B6nig       2021-12-27  192  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8592563858366771305==--

