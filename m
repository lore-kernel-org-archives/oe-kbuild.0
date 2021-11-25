Content-Type: multipart/mixed; boundary="===============9123457164836964584=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [arm:zii 70/161] drivers/net/phy/phylink.c:1287 phylink_set_pcs() error: we previously assumed 'pcs' could be null (see line 1283)
Date: Thu, 25 Nov 2021 22:24:08 +0800
Message-ID: <202111252259.X7Tr9l1K-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9123457164836964584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git zii
head:   1c86335a03ee0102daaefede1fb25cdbb367b14c
commit: 8eca4525ad01e4504dba39f4783f9d5885243941 [70/161] net: phylink: add=
 mac_select_pcs() method to phylink_mac_ops
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: s390-randconfig-m031-20211124 (https://download.01.org/0day-ci/arch=
ive/20211125/202111252259.X7Tr9l1K-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/phy/phylink.c:1287 phylink_set_pcs() error: we previously assum=
ed 'pcs' could be null (see line 1283)

Old smatch warnings:
drivers/net/phy/phylink.c:850 phylink_change_inband_advert() error: we prev=
iously assumed 'pl->pcs_ops' could be null (see line 833)

vim +/pcs +1287 drivers/net/phy/phylink.c

9525ae83959b60 Russell King          2017-07-25  1255  =

7137e18f6f889a Russell King          2020-07-21  1256  /**
7137e18f6f889a Russell King          2020-07-21  1257   * phylink_set_pcs()=
 - set the current PCS for phylink to use
7137e18f6f889a Russell King          2020-07-21  1258   * @pl: a pointer to=
 a &struct phylink returned from phylink_create()
7137e18f6f889a Russell King          2020-07-21  1259   * @pcs: a pointer t=
o the &struct phylink_pcs
7137e18f6f889a Russell King          2020-07-21  1260   *
7137e18f6f889a Russell King          2020-07-21  1261   * Bind the MAC PCS =
to phylink.  This may be called after phylink_create(),
7137e18f6f889a Russell King          2020-07-21  1262   * in mac_prepare() =
or mac_config() methods if it is desired to dynamically
7137e18f6f889a Russell King          2020-07-21  1263   * change the PCS.
7137e18f6f889a Russell King          2020-07-21  1264   *
b01e3d443ba5bd Russell King (Oracle  2021-11-22  1265)  * Please note that =
for legacy phylink users, there are behavioural changes
b01e3d443ba5bd Russell King (Oracle  2021-11-22  1266)  * with the mac_conf=
ig() callback if a PCS is present (denoting a newer setup)
b01e3d443ba5bd Russell King (Oracle  2021-11-22  1267)  * so removing a PCS=
 is not supported. If a PCS is going to be used, it must
b01e3d443ba5bd Russell King (Oracle  2021-11-22  1268)  * be registered by =
calling phylink_set_pcs() at the latest in the first
b01e3d443ba5bd Russell King (Oracle  2021-11-22  1269)  * mac_config() call.
b01e3d443ba5bd Russell King (Oracle  2021-11-22  1270)  *
b01e3d443ba5bd Russell King (Oracle  2021-11-22  1271)  * For modern driver=
s, this may be called with a NULL pcs argument to
b01e3d443ba5bd Russell King (Oracle  2021-11-22  1272)  * disconnect the PC=
S from phylink.
7137e18f6f889a Russell King          2020-07-21  1273   */
7137e18f6f889a Russell King          2020-07-21  1274  void phylink_set_pcs=
(struct phylink *pl, struct phylink_pcs *pcs)
4c0d6d3a7a81fc Russell King          2020-03-30  1275  {
b01e3d443ba5bd Russell King (Oracle  2021-11-22  1276) 	if (pl->config->leg=
acy_pre_march2020 && pl->pcs && !pcs) {
b01e3d443ba5bd Russell King (Oracle  2021-11-22  1277) 		phylink_warn(pl,
b01e3d443ba5bd Russell King (Oracle  2021-11-22  1278) 			     "Removing PC=
S is not supported in a legacy driver");
b01e3d443ba5bd Russell King (Oracle  2021-11-22  1279) 		return;
b01e3d443ba5bd Russell King (Oracle  2021-11-22  1280) 	}
b01e3d443ba5bd Russell King (Oracle  2021-11-22  1281) =

7137e18f6f889a Russell King          2020-07-21  1282  	pl->pcs =3D pcs;
b01e3d443ba5bd Russell King (Oracle  2021-11-22 @1283) 	pl->pcs_ops =3D pcs=
 ? pcs->ops : NULL;
8eca4525ad01e4 Russell King (Oracle  2021-10-07  1284) =

8eca4525ad01e4 Russell King (Oracle  2021-10-07  1285) 	if (!pl->phylink_di=
sable_state &&
8eca4525ad01e4 Russell King (Oracle  2021-10-07  1286) 	    pl->cfg_link_an=
_mode =3D=3D MLO_AN_INBAND) {
8eca4525ad01e4 Russell King (Oracle  2021-10-07 @1287) 		if (pl->config->pc=
s_poll || pcs->poll)
8eca4525ad01e4 Russell King (Oracle  2021-10-07  1288) 			mod_timer(&pl->li=
nk_poll, jiffies + HZ);
8eca4525ad01e4 Russell King (Oracle  2021-10-07  1289) 		else
8eca4525ad01e4 Russell King (Oracle  2021-10-07  1290) 			del_timer(&pl->li=
nk_poll);
8eca4525ad01e4 Russell King (Oracle  2021-10-07  1291) 	}
4c0d6d3a7a81fc Russell King          2020-03-30  1292  }
7137e18f6f889a Russell King          2020-07-21  1293  EXPORT_SYMBOL_GPL(ph=
ylink_set_pcs);
4c0d6d3a7a81fc Russell King          2020-03-30  1294  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9123457164836964584==--

