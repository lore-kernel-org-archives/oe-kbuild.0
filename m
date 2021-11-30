Content-Type: multipart/mixed; boundary="===============1925539933486187553=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [arnd-playground:randconfig-5.16-min 169/191] drivers/char/tpm/st33zp24/i2c.c:123 st33zp24_i2c_acpi_request_resources() error: uninitialized symbol 'gpiod_lpcpd'.
Date: Wed, 01 Dec 2021 01:47:19 +0800
Message-ID: <202112010127.gh8qvdja-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1925539933486187553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git=
 randconfig-5.16-min
head:   7a16665b8fd19f170c0c15f1432c90e4750183f2
commit: 19074a13cd9fb8cd329d4f09ac0c28a6323abc9a [169/191] tpm: st33zp24: c=
onvert to gpio descriptors
:::::: branch date: 6 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-m001-20211128 (https://download.01.org/0day-ci/ar=
chive/20211201/202112010127.gh8qvdja-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/char/tpm/st33zp24/i2c.c:123 st33zp24_i2c_acpi_request_resources() e=
rror: uninitialized symbol 'gpiod_lpcpd'.

vim +/gpiod_lpcpd +123 drivers/char/tpm/st33zp24/i2c.c

2d2e376f05f23f Andy Shevchenko   2017-03-15  107  =

740ec346f32b34 Christophe Ricard 2016-02-23  108  static int st33zp24_i2c_a=
cpi_request_resources(struct i2c_client *client)
22eb90db936755 Christophe Ricard 2016-02-13  109  {
9e0d39d8a6a0a8 Christophe Ricard 2016-03-31  110  	struct tpm_chip *chip =
=3D i2c_get_clientdata(client);
9e0d39d8a6a0a8 Christophe Ricard 2016-03-31  111  	struct st33zp24_dev *tpm=
_dev =3D dev_get_drvdata(&chip->dev);
9e0d39d8a6a0a8 Christophe Ricard 2016-03-31  112  	struct st33zp24_i2c_phy =
*phy =3D tpm_dev->phy_id;
22eb90db936755 Christophe Ricard 2016-02-13  113  	struct gpio_desc *gpiod_=
lpcpd;
32da5633dcb911 Christophe Ricard 2016-03-23  114  	struct device *dev =3D &=
client->dev;
2d2e376f05f23f Andy Shevchenko   2017-03-15  115  	int ret;
2d2e376f05f23f Andy Shevchenko   2017-03-15  116  =

23c3beae581f7c Andy Shevchenko   2017-06-12  117  	ret =3D devm_acpi_dev_ad=
d_driver_gpios(dev, acpi_st33zp24_gpios);
2d2e376f05f23f Andy Shevchenko   2017-03-15  118  	if (ret)
2d2e376f05f23f Andy Shevchenko   2017-03-15  119  		return ret;
22eb90db936755 Christophe Ricard 2016-02-13  120  =

22eb90db936755 Christophe Ricard 2016-02-13  121  	/* Get LPCPD GPIO from A=
CPI */
19074a13cd9fb8 Arnd Bergmann     2021-11-11  122  	phy->io_lpcpd =3D devm_g=
piod_get_optional(dev, "lpcpd", GPIOD_OUT_HIGH);
22eb90db936755 Christophe Ricard 2016-02-13 @123  	if (IS_ERR(gpiod_lpcpd))=
 {
22eb90db936755 Christophe Ricard 2016-02-13  124  		dev_err(&client->dev,
22eb90db936755 Christophe Ricard 2016-02-13  125  			"Failed to retrieve lp=
cpd-gpios from acpi.\n");
19074a13cd9fb8 Arnd Bergmann     2021-11-11  126  		phy->io_lpcpd =3D NULL;
22eb90db936755 Christophe Ricard 2016-02-13  127  		/*
22eb90db936755 Christophe Ricard 2016-02-13  128  		 * lpcpd pin is not spe=
cified. This is not an issue as
22eb90db936755 Christophe Ricard 2016-02-13  129  		 * power management can=
 be also managed by TPM specific
22eb90db936755 Christophe Ricard 2016-02-13  130  		 * commands. So leave w=
ith a success status code.
22eb90db936755 Christophe Ricard 2016-02-13  131  		 */
22eb90db936755 Christophe Ricard 2016-02-13  132  		return 0;
22eb90db936755 Christophe Ricard 2016-02-13  133  	}
22eb90db936755 Christophe Ricard 2016-02-13  134  =

22eb90db936755 Christophe Ricard 2016-02-13  135  	return 0;
22eb90db936755 Christophe Ricard 2016-02-13  136  }
22eb90db936755 Christophe Ricard 2016-02-13  137  =


:::::: The code at line 123 was first introduced by commit
:::::: 22eb90db936755e5d600a4561a0cc7a82c791eb9 tpm/st33zp24: Add support f=
or acpi probing for i2c device.

:::::: TO: Christophe RICARD <christophe.ricard@gmail.com>
:::::: CC: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1925539933486187553==--

