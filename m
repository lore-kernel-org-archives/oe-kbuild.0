Content-Type: multipart/mixed; boundary="===============6863642540395307304=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/phy/micrel.c:2613 lan8814_ptp_probe_once() warn: passing zero to 'PTR_ERR'
Date: Mon, 27 Jun 2022 03:04:30 +0000
Message-ID: <202206260706.X0Nor7WW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6863642540395307304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Divya Koppera <Divya.Koppera@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0840a7914caa14315a3191178a9f72c742477860
commit: ece19502834d84ece2e056db28257ca2aa6e4d48 net: phy: micrel: 1588 sup=
port for LAN8814 phy
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
config: arc-randconfig-m031-20220626
compiler: arc-elf-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/phy/micrel.c:2613 lan8814_ptp_probe_once() warn: passing zero t=
o 'PTR_ERR'

Old smatch warnings:
drivers/net/phy/micrel.c:1750 ksz886x_cable_test_get_status() error: uninit=
ialized symbol 'ret'.

vim +/PTR_ERR +2613 drivers/net/phy/micrel.c

ece19502834d84 Divya Koppera 2022-03-04  2588  =

ece19502834d84 Divya Koppera 2022-03-04  2589  static int lan8814_ptp_probe=
_once(struct phy_device *phydev)
ece19502834d84 Divya Koppera 2022-03-04  2590  {
ece19502834d84 Divya Koppera 2022-03-04  2591  	struct lan8814_shared_priv =
*shared =3D phydev->shared->priv;
ece19502834d84 Divya Koppera 2022-03-04  2592  =

ece19502834d84 Divya Koppera 2022-03-04  2593  	/* Initialise shared lock f=
or clock*/
ece19502834d84 Divya Koppera 2022-03-04  2594  	mutex_init(&shared->shared_=
lock);
ece19502834d84 Divya Koppera 2022-03-04  2595  =

ece19502834d84 Divya Koppera 2022-03-04  2596  	shared->ptp_clock_info.owne=
r =3D THIS_MODULE;
ece19502834d84 Divya Koppera 2022-03-04  2597  	snprintf(shared->ptp_clock_=
info.name, 30, "%s", phydev->drv->name);
ece19502834d84 Divya Koppera 2022-03-04  2598  	shared->ptp_clock_info.max_=
adj =3D 31249999;
ece19502834d84 Divya Koppera 2022-03-04  2599  	shared->ptp_clock_info.n_al=
arm =3D 0;
ece19502834d84 Divya Koppera 2022-03-04  2600  	shared->ptp_clock_info.n_ex=
t_ts =3D 0;
ece19502834d84 Divya Koppera 2022-03-04  2601  	shared->ptp_clock_info.n_pi=
ns =3D 0;
ece19502834d84 Divya Koppera 2022-03-04  2602  	shared->ptp_clock_info.pps =
=3D 0;
ece19502834d84 Divya Koppera 2022-03-04  2603  	shared->ptp_clock_info.pin_=
config =3D NULL;
ece19502834d84 Divya Koppera 2022-03-04  2604  	shared->ptp_clock_info.adjf=
ine =3D lan8814_ptpci_adjfine;
ece19502834d84 Divya Koppera 2022-03-04  2605  	shared->ptp_clock_info.adjt=
ime =3D lan8814_ptpci_adjtime;
ece19502834d84 Divya Koppera 2022-03-04  2606  	shared->ptp_clock_info.gett=
ime64 =3D lan8814_ptpci_gettime64;
ece19502834d84 Divya Koppera 2022-03-04  2607  	shared->ptp_clock_info.sett=
ime64 =3D lan8814_ptpci_settime64;
ece19502834d84 Divya Koppera 2022-03-04  2608  	shared->ptp_clock_info.getc=
rosststamp =3D NULL;
ece19502834d84 Divya Koppera 2022-03-04  2609  =

ece19502834d84 Divya Koppera 2022-03-04  2610  	shared->ptp_clock =3D ptp_c=
lock_register(&shared->ptp_clock_info,
ece19502834d84 Divya Koppera 2022-03-04  2611  					       &phydev->mdio.de=
v);
ece19502834d84 Divya Koppera 2022-03-04  2612  	if (IS_ERR_OR_NULL(shared->=
ptp_clock)) {
ece19502834d84 Divya Koppera 2022-03-04 @2613  		phydev_err(phydev, "ptp_cl=
ock_register failed %lu\n",
ece19502834d84 Divya Koppera 2022-03-04  2614  			   PTR_ERR(shared->ptp_cl=
ock));
ece19502834d84 Divya Koppera 2022-03-04  2615  		return -EINVAL;
ece19502834d84 Divya Koppera 2022-03-04  2616  	}
ece19502834d84 Divya Koppera 2022-03-04  2617  =

ece19502834d84 Divya Koppera 2022-03-04  2618  	phydev_dbg(phydev, "success=
fully registered ptp clock\n");
ece19502834d84 Divya Koppera 2022-03-04  2619  =

ece19502834d84 Divya Koppera 2022-03-04  2620  	shared->phydev =3D phydev;
ece19502834d84 Divya Koppera 2022-03-04  2621  =

ece19502834d84 Divya Koppera 2022-03-04  2622  	/* The EP.4 is shared betwe=
en all the PHYs in the package and also it
ece19502834d84 Divya Koppera 2022-03-04  2623  	 * can be accessed by any o=
f the PHYs
ece19502834d84 Divya Koppera 2022-03-04  2624  	 */
ece19502834d84 Divya Koppera 2022-03-04  2625  	lanphy_write_page_reg(phyde=
v, 4, LTC_HARD_RESET, LTC_HARD_RESET_);
ece19502834d84 Divya Koppera 2022-03-04  2626  	lanphy_write_page_reg(phyde=
v, 4, PTP_OPERATING_MODE,
ece19502834d84 Divya Koppera 2022-03-04  2627  			      PTP_OPERATING_MODE_=
STANDALONE_);
ece19502834d84 Divya Koppera 2022-03-04  2628  =

ece19502834d84 Divya Koppera 2022-03-04  2629  	return 0;
ece19502834d84 Divya Koppera 2022-03-04  2630  }
ece19502834d84 Divya Koppera 2022-03-04  2631  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6863642540395307304==--

