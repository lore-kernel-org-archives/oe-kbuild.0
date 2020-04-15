Content-Type: multipart/mixed; boundary="===============1289727270920967139=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v1] ethtool: provide UAPI for PHY master/slave configuration.
Date: Thu, 16 Apr 2020 05:59:23 +0800
Message-ID: <202004160539.2QO9aIUH%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1289727270920967139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200415121209.12197-1-o.rempel@pengutronix.de>
References: <20200415121209.12197-1-o.rempel@pengutronix.de>
TO: Oleksij Rempel <o.rempel@pengutronix.de>
TO: Andrew Lunn <andrew@lunn.ch>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev(a)vger.kernel.org
TO: Florian Fainelli <f.fainelli@gmail.com>
TO: Heiner Kallweit <hkallweit1@gmail.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Michal Kubecek <mkubecek@suse.cz>
TO: Oleksij Rempel <o.rempel@pengutronix.de>
TO: David Jander <david@protonic.nl>
TO: kernel(a)pengutronix.de
TO: linux-kernel(a)vger.kernel.org
TO: netdev(a)vger.kernel.org
TO: Russell King <linux@armlinux.org.uk>
TO: mkl(a)pengutronix.de
TO: Oleksij Rempel <o.rempel@pengutronix.de>
TO: David Jander <david@protonic.nl>
TO: kernel(a)pengutronix.de
TO: linux-kernel(a)vger.kernel.org
TO: netdev(a)vger.kernel.org
TO: Russell King <linux@armlinux.org.uk>
TO: mkl(a)pengutronix.de
CC: Oleksij Rempel <o.rempel@pengutronix.de>
CC: David Jander <david@protonic.nl>
CC: kernel(a)pengutronix.de
CC: linux-kernel(a)vger.kernel.org
CC: netdev(a)vger.kernel.org
CC: Russell King <linux@armlinux.org.uk>

Hi Oleksij,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]
[also build test WARNING on net/master linus/master v5.7-rc1 next-20200415]
[cannot apply to sparc-next/master]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Oleksij-Rempel/ethtool-pro=
vide-UAPI-for-PHY-master-slave-configuration/20200416-035217
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
7f80ccfe996871ca69648efee74a60ae7ad0dcd9
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/phy/phy_device.c:1812 genphy_read_master_slave() warn: impossib=
le condition '(ctl < 0) =3D> (0-u16max < 0)'
drivers/net/phy/phy_device.c:1816 genphy_read_master_slave() warn: impossib=
le condition '(stat < 0) =3D> (0-u16max < 0)'

Old smatch warnings:
drivers/net/phy/phy_device.c:2521 phy_probe() warn: inconsistent indenting

# https://github.com/0day-ci/linux/commit/effcba6cc15a16b619237177fed9bd60c=
5fa5b82
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout effcba6cc15a16b619237177fed9bd60c5fa5b82
vim +1812 drivers/net/phy/phy_device.c

effcba6cc15a16 Oleksij Rempel 2020-04-15  1803  =

effcba6cc15a16 Oleksij Rempel 2020-04-15  1804  static int genphy_read_mast=
er_slave(struct phy_device *phydev)
effcba6cc15a16 Oleksij Rempel 2020-04-15  1805  {
effcba6cc15a16 Oleksij Rempel 2020-04-15  1806  	u16 ctl, stat;
effcba6cc15a16 Oleksij Rempel 2020-04-15  1807  =

effcba6cc15a16 Oleksij Rempel 2020-04-15  1808  	if (!phydev->is_gigabit_ca=
pable)
effcba6cc15a16 Oleksij Rempel 2020-04-15  1809  		return 0;
effcba6cc15a16 Oleksij Rempel 2020-04-15  1810  =

effcba6cc15a16 Oleksij Rempel 2020-04-15  1811  	ctl =3D phy_read(phydev, M=
II_CTRL1000);
effcba6cc15a16 Oleksij Rempel 2020-04-15 @1812  	if (ctl < 0)
effcba6cc15a16 Oleksij Rempel 2020-04-15  1813  		return ctl;
effcba6cc15a16 Oleksij Rempel 2020-04-15  1814  =

effcba6cc15a16 Oleksij Rempel 2020-04-15  1815  	stat =3D phy_read(phydev, =
MII_STAT1000);
effcba6cc15a16 Oleksij Rempel 2020-04-15 @1816  	if (stat < 0)
effcba6cc15a16 Oleksij Rempel 2020-04-15  1817  		return stat;
effcba6cc15a16 Oleksij Rempel 2020-04-15  1818  =

effcba6cc15a16 Oleksij Rempel 2020-04-15  1819  	if (ctl & CTL1000_ENABLE_M=
ASTER) {
effcba6cc15a16 Oleksij Rempel 2020-04-15  1820  		if (stat & LPA_1000MSRES)
effcba6cc15a16 Oleksij Rempel 2020-04-15  1821  			phydev->master_slave =3D=
 PORT_MODE_MASTER_FORCE;
effcba6cc15a16 Oleksij Rempel 2020-04-15  1822  		else
effcba6cc15a16 Oleksij Rempel 2020-04-15  1823  			phydev->master_slave =3D=
 PORT_MODE_SLAVE_FORCE;
effcba6cc15a16 Oleksij Rempel 2020-04-15  1824  	} else {
effcba6cc15a16 Oleksij Rempel 2020-04-15  1825  		if (stat & LPA_1000MSRES)
effcba6cc15a16 Oleksij Rempel 2020-04-15  1826  			phydev->master_slave =3D=
 PORT_MODE_MASTER;
effcba6cc15a16 Oleksij Rempel 2020-04-15  1827  		else
effcba6cc15a16 Oleksij Rempel 2020-04-15  1828  			phydev->master_slave =3D=
 PORT_MODE_SLAVE;
effcba6cc15a16 Oleksij Rempel 2020-04-15  1829  	}
effcba6cc15a16 Oleksij Rempel 2020-04-15  1830  =

effcba6cc15a16 Oleksij Rempel 2020-04-15  1831  	return 0;
effcba6cc15a16 Oleksij Rempel 2020-04-15  1832  }
effcba6cc15a16 Oleksij Rempel 2020-04-15  1833  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1289727270920967139==--

