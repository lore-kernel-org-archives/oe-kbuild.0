Content-Type: multipart/mixed; boundary="===============1962374778524891158=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net v2 3/6] net: dsa: mv88e6xxx: Save power by disabling SerDes trasmitter and receiver
Date: Thu, 02 Dec 2021 18:37:01 +0800
Message-ID: <202112021828.M2Es3NN7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1962374778524891158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211130170151.7741-4-kabel@kernel.org>
References: <20211130170151.7741-4-kabel@kernel.org>
TO: "Marek Beh=C3=BAn" <kabel@kernel.org>

Hi "Marek,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net/master]

url:    https://github.com/0day-ci/linux/commits/Marek-Beh-n/mv88e6xxx-fixe=
s-mainly-88E6393X-family/20211201-011600
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 34d87=
78a943761121f391b7921f79a7adbe1feaf
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-m031-20211128 (https://download.01.org/0day-ci/archi=
ve/20211202/202112021828.M2Es3NN7-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/dsa/mv88e6xxx/serdes.c:1409 mv88e6393x_serdes_power() error: un=
initialized symbol 'err'.

vim +/err +1409 drivers/net/dsa/mv88e6xxx/serdes.c

de776d0d316f72 Pavana Sharma 2021-03-17  1377  =

de776d0d316f72 Pavana Sharma 2021-03-17  1378  int mv88e6393x_serdes_power(=
struct mv88e6xxx_chip *chip, int port, int lane,
de776d0d316f72 Pavana Sharma 2021-03-17  1379  			    bool on)
de776d0d316f72 Pavana Sharma 2021-03-17  1380  {
de776d0d316f72 Pavana Sharma 2021-03-17  1381  	u8 cmode =3D chip->ports[po=
rt].cmode;
4ac5ae42775ac2 Marek Beh=C3=BAn   2021-11-30  1382  	int err;
de776d0d316f72 Pavana Sharma 2021-03-17  1383  =

de776d0d316f72 Pavana Sharma 2021-03-17  1384  	if (port !=3D 0 && port !=
=3D 9 && port !=3D 10)
de776d0d316f72 Pavana Sharma 2021-03-17  1385  		return -EOPNOTSUPP;
de776d0d316f72 Pavana Sharma 2021-03-17  1386  =

4ac5ae42775ac2 Marek Beh=C3=BAn   2021-11-30  1387  	if (on) {
4ac5ae42775ac2 Marek Beh=C3=BAn   2021-11-30  1388  		err =3D mv88e6393x_se=
rdes_erratum_4_8(chip, lane);
4ac5ae42775ac2 Marek Beh=C3=BAn   2021-11-30  1389  		if (err)
4ac5ae42775ac2 Marek Beh=C3=BAn   2021-11-30  1390  			return err;
89085d6bbe9f67 Marek Beh=C3=BAn   2021-11-30  1391  =

89085d6bbe9f67 Marek Beh=C3=BAn   2021-11-30  1392  		err =3D mv88e6393x_se=
rdes_power_lane(chip, lane, true);
89085d6bbe9f67 Marek Beh=C3=BAn   2021-11-30  1393  		if (err)
89085d6bbe9f67 Marek Beh=C3=BAn   2021-11-30  1394  			return err;
4ac5ae42775ac2 Marek Beh=C3=BAn   2021-11-30  1395  	}
4ac5ae42775ac2 Marek Beh=C3=BAn   2021-11-30  1396  =

de776d0d316f72 Pavana Sharma 2021-03-17  1397  	switch (cmode) {
de776d0d316f72 Pavana Sharma 2021-03-17  1398  	case MV88E6XXX_PORT_STS_CMO=
DE_SGMII:
de776d0d316f72 Pavana Sharma 2021-03-17  1399  	case MV88E6XXX_PORT_STS_CMO=
DE_1000BASEX:
de776d0d316f72 Pavana Sharma 2021-03-17  1400  	case MV88E6XXX_PORT_STS_CMO=
DE_2500BASEX:
89085d6bbe9f67 Marek Beh=C3=BAn   2021-11-30  1401  		err =3D mv88e6390_ser=
des_power_sgmii(chip, lane, on);
89085d6bbe9f67 Marek Beh=C3=BAn   2021-11-30  1402  		break;
de776d0d316f72 Pavana Sharma 2021-03-17  1403  	case MV88E6393X_PORT_STS_CM=
ODE_5GBASER:
de776d0d316f72 Pavana Sharma 2021-03-17  1404  	case MV88E6393X_PORT_STS_CM=
ODE_10GBASER:
89085d6bbe9f67 Marek Beh=C3=BAn   2021-11-30  1405  		err =3D mv88e6390_ser=
des_power_10g(chip, lane, on);
89085d6bbe9f67 Marek Beh=C3=BAn   2021-11-30  1406  		break;
de776d0d316f72 Pavana Sharma 2021-03-17  1407  	}
de776d0d316f72 Pavana Sharma 2021-03-17  1408  =

89085d6bbe9f67 Marek Beh=C3=BAn   2021-11-30 @1409  	if (err)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1962374778524891158==--

