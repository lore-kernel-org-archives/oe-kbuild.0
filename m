Content-Type: multipart/mixed; boundary="===============4311439445558899696=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/phy/sfp.c:473 sfp_soft_get_state() warn: passing zero to 'ERR_PTR'
Date: Mon, 28 Mar 2022 18:13:09 +0800
Message-ID: <202203281846.5kkgr5L7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4311439445558899696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ae085d7f9365de7da27ab5c0d16b12d51ea7fca9
commit: 9ae1ef4b1634547d7ab7d15a9ffd48df8ce6883c net: sfp: use %pe for prin=
ting errors
date:   4 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-m001-20220328 (https://download.01.org/0day-ci/ar=
chive/20220328/202203281846.5kkgr5L7-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/phy/sfp.c:473 sfp_soft_get_state() warn: passing zero to 'ERR_P=
TR'
drivers/net/phy/sfp.c:1713 sfp_sm_mod_hpower() warn: passing zero to 'ERR_P=
TR'
drivers/net/phy/sfp.c:1797 sfp_cotsworks_fixup_check() warn: passing zero t=
o 'ERR_PTR'
drivers/net/phy/sfp.c:1830 sfp_sm_mod_probe() warn: passing zero to 'ERR_PT=
R'

Old smatch warnings:
drivers/net/phy/sfp.c:1731 sfp_sm_mod_hpower() warn: passing zero to 'ERR_P=
TR'
drivers/net/phy/sfp.c:1857 sfp_sm_mod_probe() warn: passing zero to 'ERR_PT=
R'
drivers/net/phy/sfp.c:1906 sfp_sm_mod_probe() warn: passing zero to 'ERR_PT=
R'

vim +/ERR_PTR +473 drivers/net/phy/sfp.c

73970055450eeb Russell King          2017-07-25  459  =

f3c9a666b28572 Russell King          2019-11-20  460  static unsigned int s=
fp_soft_get_state(struct sfp *sfp)
73970055450eeb Russell King          2017-07-25  461  {
f3c9a666b28572 Russell King          2019-11-20  462  	unsigned int state =
=3D 0;
f3c9a666b28572 Russell King          2019-11-20  463  	u8 status;
0dea4d039a7fdd Russell King          2019-12-17  464  	int ret;
f3c9a666b28572 Russell King          2019-11-20  465  =

0dea4d039a7fdd Russell King          2019-12-17  466  	ret =3D sfp_read(sfp=
, true, SFP_STATUS, &status, sizeof(status));
0dea4d039a7fdd Russell King          2019-12-17  467  	if (ret =3D=3D sizeo=
f(status)) {
f3c9a666b28572 Russell King          2019-11-20  468  		if (status & SFP_ST=
ATUS_RX_LOS)
f3c9a666b28572 Russell King          2019-11-20  469  			state |=3D SFP_F_L=
OS;
f3c9a666b28572 Russell King          2019-11-20  470  		if (status & SFP_ST=
ATUS_TX_FAULT)
f3c9a666b28572 Russell King          2019-11-20  471  			state |=3D SFP_F_T=
X_FAULT;
0dea4d039a7fdd Russell King          2019-12-17  472  	} else {
0dea4d039a7fdd Russell King          2019-12-17 @473  		dev_err_ratelimited=
(sfp->dev,
9ae1ef4b163454 Russell King (Oracle  2022-03-01  474) 				    "failed to re=
ad SFP soft status: %pe\n",
9ae1ef4b163454 Russell King (Oracle  2022-03-01  475) 				    ERR_PTR(ret));
0dea4d039a7fdd Russell King          2019-12-17  476  		/* Preserve the cur=
rent state */
0dea4d039a7fdd Russell King          2019-12-17  477  		state =3D sfp->stat=
e;
73970055450eeb Russell King          2017-07-25  478  	}
73970055450eeb Russell King          2017-07-25  479  =

f3c9a666b28572 Russell King          2019-11-20  480  	return state & sfp->=
state_soft_mask;
f3c9a666b28572 Russell King          2019-11-20  481  }
f3c9a666b28572 Russell King          2019-11-20  482  =


:::::: The code at line 473 was first introduced by commit
:::::: 0dea4d039a7fdd97790a71da37c1ce67a5b52769 net: sfp: report error on f=
ailure to read sfp soft status

:::::: TO: Russell King <rmk+kernel@armlinux.org.uk>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4311439445558899696==--

