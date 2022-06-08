Content-Type: multipart/mixed; boundary="===============0117249676900634939=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/phy/micrel.c:1537:9: warning: Uninitialized variable: ret [uninitvar]
Date: Thu, 09 Jun 2022 02:24:42 +0800
Message-ID: <202206090202.xk3QiLxj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0117249676900634939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/n=
et/phy/micrel.c:1537:9: warning: Uninitialized variable: ret [uninitvar]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Oleksij Rempel <o.rempel@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9886142c7a2226439c1e3f7d9b69f9c7094c3ef6
commit: 49011e0c1555dd7a689d0f32fd78c1ecd43e59cd net: phy: micrel: ksz886x/=
ksz8081: add cabletest support
date:   12 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 12 months ago
compiler: alpha-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 49011e0c1555dd7a689d0f32fd78c1ecd43e59cd
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/phy/micrel.c:1537:9: warning: Uninitialized variable: ret [u=
ninitvar]
    return ret;
           ^
   drivers/net/phy/micrel.c:1518:19: note: Assuming condition is false
    while (pair_mask && retries--) {
                     ^
   drivers/net/phy/micrel.c:1537:9: note: Uninitialized variable: ret
    return ret;
           ^

vim +1537 drivers/net/phy/micrel.c

49011e0c1555dd Oleksij Rempel 2021-06-14  1507  =

49011e0c1555dd Oleksij Rempel 2021-06-14  1508  static int ksz886x_cable_te=
st_get_status(struct phy_device *phydev,
49011e0c1555dd Oleksij Rempel 2021-06-14  1509  					 bool *finished)
49011e0c1555dd Oleksij Rempel 2021-06-14  1510  {
49011e0c1555dd Oleksij Rempel 2021-06-14  1511  	unsigned long pair_mask =
=3D 0x3;
49011e0c1555dd Oleksij Rempel 2021-06-14  1512  	int retries =3D 20;
49011e0c1555dd Oleksij Rempel 2021-06-14  1513  	int pair, ret;
49011e0c1555dd Oleksij Rempel 2021-06-14  1514  =

49011e0c1555dd Oleksij Rempel 2021-06-14  1515  	*finished =3D false;
49011e0c1555dd Oleksij Rempel 2021-06-14  1516  =

49011e0c1555dd Oleksij Rempel 2021-06-14  1517  	/* Try harder if link part=
ner is active */
49011e0c1555dd Oleksij Rempel 2021-06-14  1518  	while (pair_mask && retrie=
s--) {
49011e0c1555dd Oleksij Rempel 2021-06-14  1519  		for_each_set_bit(pair, &p=
air_mask, 4) {
49011e0c1555dd Oleksij Rempel 2021-06-14  1520  			ret =3D ksz886x_cable_te=
st_one_pair(phydev, pair);
49011e0c1555dd Oleksij Rempel 2021-06-14  1521  			if (ret =3D=3D -EAGAIN)
49011e0c1555dd Oleksij Rempel 2021-06-14  1522  				continue;
49011e0c1555dd Oleksij Rempel 2021-06-14  1523  			if (ret < 0)
49011e0c1555dd Oleksij Rempel 2021-06-14  1524  				return ret;
49011e0c1555dd Oleksij Rempel 2021-06-14  1525  			clear_bit(pair, &pair_ma=
sk);
49011e0c1555dd Oleksij Rempel 2021-06-14  1526  		}
49011e0c1555dd Oleksij Rempel 2021-06-14  1527  		/* If link partner is in =
autonegotiation mode it will send 2ms
49011e0c1555dd Oleksij Rempel 2021-06-14  1528  		 * of FLPs with@least =
6ms of silence.
49011e0c1555dd Oleksij Rempel 2021-06-14  1529  		 * Add 2ms sleep to have =
better chances to hit this silence.
49011e0c1555dd Oleksij Rempel 2021-06-14  1530  		 */
49011e0c1555dd Oleksij Rempel 2021-06-14  1531  		if (pair_mask)
49011e0c1555dd Oleksij Rempel 2021-06-14  1532  			msleep(2);
49011e0c1555dd Oleksij Rempel 2021-06-14  1533  	}
49011e0c1555dd Oleksij Rempel 2021-06-14  1534  =

49011e0c1555dd Oleksij Rempel 2021-06-14  1535  	*finished =3D true;
49011e0c1555dd Oleksij Rempel 2021-06-14  1536  =

49011e0c1555dd Oleksij Rempel 2021-06-14 @1537  	return ret;
49011e0c1555dd Oleksij Rempel 2021-06-14  1538  }
49011e0c1555dd Oleksij Rempel 2021-06-14  1539  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0117249676900634939==--

