Content-Type: multipart/mixed; boundary="===============6954498923071661169=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [net-next:master 1212/1217] drivers/net/phy/phy.c:521:6: warning: Redundant initialization for 'err'. The initialized value is overwritten before it is read. [redundantInitialization]
Date: Mon, 11 May 2020 08:36:52 +0800
Message-ID: <202005110848.p5w47SNP%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6954498923071661169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: netdev(a)vger.kernel.org
TO: Andrew Lunn <andrew@lunn.ch>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Michal Kubecek <mkubecek@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
master
head:   bed37f0ba6bc1ff702d87be727d9e740509809aa
commit: 1dd3f212af30b42c90ba252c165f2f6d2ddf5230 [1212/1217] net: ethtool: =
Add infrastructure for reporting cable test results
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/net/phy/phy.c:521:6: warning: Redundant initialization for 'err'=
. The initialized value is overwritten before it is read. [redundantInitial=
ization]
    err =3D ethnl_cable_test_alloc(phydev);
        ^
   drivers/net/phy/phy.c:495:10: note: err is initialized
    int err =3D -ENOMEM;
            ^
   drivers/net/phy/phy.c:521:6: note: err is overwritten
    err =3D ethnl_cable_test_alloc(phydev);
        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/commit=
/?id=3D1dd3f212af30b42c90ba252c165f2f6d2ddf5230
git remote add net-next https://git.kernel.org/pub/scm/linux/kernel/git/dav=
em/net-next.git
git remote update net-next
git checkout 1dd3f212af30b42c90ba252c165f2f6d2ddf5230
vim +/err +521 drivers/net/phy/phy.c

a68a813836e12b Andrew Lunn 2020-05-10  491  =

a68a813836e12b Andrew Lunn 2020-05-10  492  int phy_start_cable_test(struct=
 phy_device *phydev,
a68a813836e12b Andrew Lunn 2020-05-10  493  			 struct netlink_ext_ack *ext=
ack)
a68a813836e12b Andrew Lunn 2020-05-10  494  {
1dd3f212af30b4 Andrew Lunn 2020-05-10  495  	int err =3D -ENOMEM;
a68a813836e12b Andrew Lunn 2020-05-10  496  =

a68a813836e12b Andrew Lunn 2020-05-10  497  	if (!(phydev->drv &&
a68a813836e12b Andrew Lunn 2020-05-10  498  	      phydev->drv->cable_test_=
start &&
a68a813836e12b Andrew Lunn 2020-05-10  499  	      phydev->drv->cable_test_=
get_status)) {
a68a813836e12b Andrew Lunn 2020-05-10  500  		NL_SET_ERR_MSG(extack,
a68a813836e12b Andrew Lunn 2020-05-10  501  			       "PHY driver does not =
support cable testing");
a68a813836e12b Andrew Lunn 2020-05-10  502  		return -EOPNOTSUPP;
a68a813836e12b Andrew Lunn 2020-05-10  503  	}
a68a813836e12b Andrew Lunn 2020-05-10  504  =

a68a813836e12b Andrew Lunn 2020-05-10  505  	mutex_lock(&phydev->lock);
a68a813836e12b Andrew Lunn 2020-05-10  506  	if (phydev->state =3D=3D PHY_C=
ABLETEST) {
a68a813836e12b Andrew Lunn 2020-05-10  507  		NL_SET_ERR_MSG(extack,
a68a813836e12b Andrew Lunn 2020-05-10  508  			       "PHY already performi=
ng a test");
a68a813836e12b Andrew Lunn 2020-05-10  509  		err =3D -EBUSY;
a68a813836e12b Andrew Lunn 2020-05-10  510  		goto out;
a68a813836e12b Andrew Lunn 2020-05-10  511  	}
a68a813836e12b Andrew Lunn 2020-05-10  512  =

a68a813836e12b Andrew Lunn 2020-05-10  513  	if (phydev->state < PHY_UP ||
a68a813836e12b Andrew Lunn 2020-05-10  514  	    phydev->state > PHY_CABLET=
EST) {
a68a813836e12b Andrew Lunn 2020-05-10  515  		NL_SET_ERR_MSG(extack,
a68a813836e12b Andrew Lunn 2020-05-10  516  			       "PHY not configured. =
Try setting interface up");
a68a813836e12b Andrew Lunn 2020-05-10  517  		err =3D -EBUSY;
a68a813836e12b Andrew Lunn 2020-05-10  518  		goto out;
a68a813836e12b Andrew Lunn 2020-05-10  519  	}
a68a813836e12b Andrew Lunn 2020-05-10  520  =

1dd3f212af30b4 Andrew Lunn 2020-05-10 @521  	err =3D ethnl_cable_test_alloc=
(phydev);
1dd3f212af30b4 Andrew Lunn 2020-05-10  522  	if (err)
1dd3f212af30b4 Andrew Lunn 2020-05-10  523  		goto out;
1dd3f212af30b4 Andrew Lunn 2020-05-10  524  =

a68a813836e12b Andrew Lunn 2020-05-10  525  	/* Mark the carrier down until=
 the test is complete */
a68a813836e12b Andrew Lunn 2020-05-10  526  	phy_link_down(phydev, true);
a68a813836e12b Andrew Lunn 2020-05-10  527  =

a68a813836e12b Andrew Lunn 2020-05-10  528  	err =3D phydev->drv->cable_tes=
t_start(phydev);
a68a813836e12b Andrew Lunn 2020-05-10  529  	if (err) {
a68a813836e12b Andrew Lunn 2020-05-10  530  		phy_link_up(phydev);
1dd3f212af30b4 Andrew Lunn 2020-05-10  531  		goto out_free;
a68a813836e12b Andrew Lunn 2020-05-10  532  	}
a68a813836e12b Andrew Lunn 2020-05-10  533  =

a68a813836e12b Andrew Lunn 2020-05-10  534  	phydev->state =3D PHY_CABLETES=
T;
a68a813836e12b Andrew Lunn 2020-05-10  535  =

97c22438963a74 Andrew Lunn 2020-05-10  536  	if (phy_polling_mode(phydev))
97c22438963a74 Andrew Lunn 2020-05-10  537  		phy_trigger_machine(phydev);
1dd3f212af30b4 Andrew Lunn 2020-05-10  538  =

1dd3f212af30b4 Andrew Lunn 2020-05-10  539  	mutex_unlock(&phydev->lock);
1dd3f212af30b4 Andrew Lunn 2020-05-10  540  =

1dd3f212af30b4 Andrew Lunn 2020-05-10  541  	return 0;
1dd3f212af30b4 Andrew Lunn 2020-05-10  542  =

1dd3f212af30b4 Andrew Lunn 2020-05-10  543  out_free:
1dd3f212af30b4 Andrew Lunn 2020-05-10  544  	ethnl_cable_test_free(phydev);
a68a813836e12b Andrew Lunn 2020-05-10  545  out:
a68a813836e12b Andrew Lunn 2020-05-10  546  	mutex_unlock(&phydev->lock);
a68a813836e12b Andrew Lunn 2020-05-10  547  =

a68a813836e12b Andrew Lunn 2020-05-10  548  	return err;
a68a813836e12b Andrew Lunn 2020-05-10  549  }
a68a813836e12b Andrew Lunn 2020-05-10  550  EXPORT_SYMBOL(phy_start_cable_t=
est);
a68a813836e12b Andrew Lunn 2020-05-10  551  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6954498923071661169==--

