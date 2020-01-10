Content-Type: multipart/mixed; boundary="===============7908209997207276280=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2 1/2] i2c: Enable compile testing for some of drivers
Date: Fri, 10 Jan 2020 14:40:07 +0300
Message-ID: <20200110114007.GH1770@kadam>
In-Reply-To: <1578384779-15487-1-git-send-email-krzk@kernel.org>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7908209997207276280==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

url:    https://github.com/0day-ci/linux/commits/Krzysztof-Kozlowski/i2c-En=
able-compile-testing-for-some-of-drivers/20200107-164808
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/f=
or-next

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/i2c/busses/i2c-iop3xx.c:437 iop3xx_i2c_probe() warn: possible memor=
y leak of 'new_adapter'

Old smatch warnings:
drivers/i2c/busses/i2c-iop3xx.c:442 iop3xx_i2c_probe() warn: possible memor=
y leak of 'new_adapter'

# https://github.com/0day-ci/linux/commit/16f23a6a6c2387ec6252ffba16d110ace=
21c85cf
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 16f23a6a6c2387ec6252ffba16d110ace21c85cf
vim +/new_adapter +437 drivers/i2c/busses/i2c-iop3xx.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  413  static int
3ae5eaec1d2d9c Russell King     2005-11-09  414  iop3xx_i2c_probe(struct pl=
atform_device *pdev)
^1da177e4c3f41 Linus Torvalds   2005-04-16  415  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  416  	struct resource *res;
489447380a2921 David Vrabel     2006-01-19  417  	int ret, irq;
^1da177e4c3f41 Linus Torvalds   2005-04-16  418  	struct i2c_adapter *new_a=
dapter;
^1da177e4c3f41 Linus Torvalds   2005-04-16  419  	struct i2c_algo_iop3xx_da=
ta *adapter_data;
^1da177e4c3f41 Linus Torvalds   2005-04-16  420  =

5263ebb51eb098 Deepak Saxena    2005-10-17  421  	new_adapter =3D kzalloc(s=
izeof(struct i2c_adapter), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds   2005-04-16  422  	if (!new_adapter) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  423  		ret =3D -ENOMEM;
^1da177e4c3f41 Linus Torvalds   2005-04-16  424  		goto out;
^1da177e4c3f41 Linus Torvalds   2005-04-16  425  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  426  =

5263ebb51eb098 Deepak Saxena    2005-10-17  427  	adapter_data =3D kzalloc(=
sizeof(struct i2c_algo_iop3xx_data), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds   2005-04-16  428  	if (!adapter_data) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  429  		ret =3D -ENOMEM;
^1da177e4c3f41 Linus Torvalds   2005-04-16  430  		goto free_adapter;
^1da177e4c3f41 Linus Torvalds   2005-04-16  431  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  432  =

fdb7e884ad617f Linus Walleij    2019-06-01  433  	adapter_data->gpio_scl =
=3D devm_gpiod_get_optional(&pdev->dev,
fdb7e884ad617f Linus Walleij    2019-06-01  434  							 "scl",
fdb7e884ad617f Linus Walleij    2019-06-01  435  							 GPIOD_ASIS);
fdb7e884ad617f Linus Walleij    2019-06-01  436  	if (IS_ERR(adapter_data->=
gpio_scl))
fdb7e884ad617f Linus Walleij    2019-06-01 @437  		return PTR_ERR(adapter_d=
ata->gpio_scl);
                                                                ^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^
leak

fdb7e884ad617f Linus Walleij    2019-06-01  438  	adapter_data->gpio_sda =
=3D devm_gpiod_get_optional(&pdev->dev,
fdb7e884ad617f Linus Walleij    2019-06-01  439  							 "sda",
fdb7e884ad617f Linus Walleij    2019-06-01  440  							 GPIOD_ASIS);
fdb7e884ad617f Linus Walleij    2019-06-01  441  	if (IS_ERR(adapter_data->=
gpio_sda))
fdb7e884ad617f Linus Walleij    2019-06-01  442  		return PTR_ERR(adapter_d=
ata->gpio_sda);
                                                                ^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^

fdb7e884ad617f Linus Walleij    2019-06-01  443  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  444  	res =3D platform_get_reso=
urce(pdev, IORESOURCE_MEM, 0);
^1da177e4c3f41 Linus Torvalds   2005-04-16  445  	if (!res) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  446  		ret =3D -ENODEV;
^1da177e4c3f41 Linus Torvalds   2005-04-16  447  		goto free_both;
^1da177e4c3f41 Linus Torvalds   2005-04-16  448  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  449  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  450  	if (!request_mem_region(r=
es->start, IOP3XX_I2C_IO_SIZE, pdev->name)) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  451  		ret =3D -EBUSY;
^1da177e4c3f41 Linus Torvalds   2005-04-16  452  		goto free_both;
^1da177e4c3f41 Linus Torvalds   2005-04-16  453  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  454  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  455  	/* set the adapter enumer=
ation # */
^1da177e4c3f41 Linus Torvalds   2005-04-16  456  	adapter_data->id =3D i2c_=
id++;
^1da177e4c3f41 Linus Torvalds   2005-04-16  457  =

747fcc91cb5bad Aaro Koskinen    2010-11-29  458  	adapter_data->ioaddr =3D =
ioremap(res->start, IOP3XX_I2C_IO_SIZE);
^1da177e4c3f41 Linus Torvalds   2005-04-16  459  	if (!adapter_data->ioaddr=
) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  460  		ret =3D -ENOMEM;
^1da177e4c3f41 Linus Torvalds   2005-04-16  461  		goto release_region;
^1da177e4c3f41 Linus Torvalds   2005-04-16  462  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  463  =

489447380a2921 David Vrabel     2006-01-19  464  	irq =3D platform_get_irq(=
pdev, 0);
489447380a2921 David Vrabel     2006-01-19  465  	if (irq < 0) {
489447380a2921 David Vrabel     2006-01-19  466  		ret =3D -ENXIO;
489447380a2921 David Vrabel     2006-01-19  467  		goto unmap;
489447380a2921 David Vrabel     2006-01-19  468  	}
489447380a2921 David Vrabel     2006-01-19  469  	ret =3D request_irq(irq, =
iop3xx_i2c_irq_handler, 0,
^1da177e4c3f41 Linus Torvalds   2005-04-16  470  				pdev->name, adapter_da=
ta);
fbd9a6d7a927b2 Dan Williams     2005-11-01  471  =

fbd9a6d7a927b2 Dan Williams     2005-11-01  472  	if (ret) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  473  		ret =3D -EIO;
^1da177e4c3f41 Linus Torvalds   2005-04-16  474  		goto unmap;
^1da177e4c3f41 Linus Torvalds   2005-04-16  475  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  476  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  477  	memcpy(new_adapter->name,=
 pdev->name, strlen(pdev->name));
^1da177e4c3f41 Linus Torvalds   2005-04-16  478  	new_adapter->owner =3D TH=
IS_MODULE;
3401b2fff38fbb Jean Delvare     2008-07-14  479  	new_adapter->class =3D I2=
C_CLASS_HWMON | I2C_CLASS_SPD;
^1da177e4c3f41 Linus Torvalds   2005-04-16  480  	new_adapter->dev.parent =
=3D &pdev->dev;
cac28ac2a87c38 Linus Walleij    2019-01-28  481  	new_adapter->dev.of_node =
=3D pdev->dev.of_node;
757ba4c697244d Martin Michlmayr 2007-07-12  482  	new_adapter->nr =3D pdev-=
>id;
^1da177e4c3f41 Linus Torvalds   2005-04-16  483  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  484  	/*
^1da177e4c3f41 Linus Torvalds   2005-04-16  485  	 * Default values...shoul=
d these come in from board code?
^1da177e4c3f41 Linus Torvalds   2005-04-16  486  	 */
8a52c6b4d55b29 Jean Delvare     2009-03-28  487  	new_adapter->timeout =3D =
HZ;
^1da177e4c3f41 Linus Torvalds   2005-04-16  488  	new_adapter->algo =3D &io=
p3xx_i2c_algo;
^1da177e4c3f41 Linus Torvalds   2005-04-16  489  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  490  	init_waitqueue_head(&adap=
ter_data->waitq);
^1da177e4c3f41 Linus Torvalds   2005-04-16  491  	spin_lock_init(&adapter_d=
ata->lock);
^1da177e4c3f41 Linus Torvalds   2005-04-16  492  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  493  	iop3xx_i2c_reset(adapter_=
data);
^1da177e4c3f41 Linus Torvalds   2005-04-16  494  	iop3xx_i2c_enable(adapter=
_data);
^1da177e4c3f41 Linus Torvalds   2005-04-16  495  =

3ae5eaec1d2d9c Russell King     2005-11-09  496  	platform_set_drvdata(pdev=
, new_adapter);
^1da177e4c3f41 Linus Torvalds   2005-04-16  497  	new_adapter->algo_data =
=3D adapter_data;
^1da177e4c3f41 Linus Torvalds   2005-04-16  498  =

757ba4c697244d Martin Michlmayr 2007-07-12  499  	i2c_add_numbered_adapter(=
new_adapter);
^1da177e4c3f41 Linus Torvalds   2005-04-16  500  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  501  	return 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  502  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  503  unmap:
747fcc91cb5bad Aaro Koskinen    2010-11-29  504  	iounmap(adapter_data->ioa=
ddr);
^1da177e4c3f41 Linus Torvalds   2005-04-16  505  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  506  release_region:
^1da177e4c3f41 Linus Torvalds   2005-04-16  507  	release_mem_region(res->s=
tart, IOP3XX_I2C_IO_SIZE);
^1da177e4c3f41 Linus Torvalds   2005-04-16  508  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  509  free_both:
^1da177e4c3f41 Linus Torvalds   2005-04-16  510  	kfree(adapter_data);
^1da177e4c3f41 Linus Torvalds   2005-04-16  511  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  512  free_adapter:
^1da177e4c3f41 Linus Torvalds   2005-04-16  513  	kfree(new_adapter);
^1da177e4c3f41 Linus Torvalds   2005-04-16  514  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  515  out:
^1da177e4c3f41 Linus Torvalds   2005-04-16  516  	return ret;
^1da177e4c3f41 Linus Torvalds   2005-04-16  517  }

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============7908209997207276280==--

