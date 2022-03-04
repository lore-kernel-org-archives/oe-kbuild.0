Content-Type: multipart/mixed; boundary="===============0143685848519665982=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tnguy-next-queue:100GbE 131/215] drivers/net/phy/sfp.c:473 sfp_soft_get_state() warn: passing zero to 'ERR_PTR'
Date: Fri, 04 Mar 2022 14:02:00 +0800
Message-ID: <202203041347.nDcWivR4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0143685848519665982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
CC: linux-kernel(a)vger.kernel.org
TO: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.gi=
t 100GbE
head:   3d5985a185e6abfc0b38ed187819016a79eca864
commit: 9ae1ef4b1634547d7ab7d15a9ffd48df8ce6883c [131/215] net: sfp: use %p=
e for printing errors
:::::: branch date: 10 hours ago
:::::: commit date: 24 hours ago
config: m68k-randconfig-m031-20220304 (https://download.01.org/0day-ci/arch=
ive/20220304/202203041347.nDcWivR4-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0

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
drivers/net/phy/sfp.c:2505 sfp_probe() warn: passing a valid pointer to 'PT=
R_ERR'

vim +/ERR_PTR +473 drivers/net/phy/sfp.c

73970055450eebc Russell King          2017-07-25  459  =

f3c9a666b28572b Russell King          2019-11-20  460  static unsigned int =
sfp_soft_get_state(struct sfp *sfp)
73970055450eebc Russell King          2017-07-25  461  {
f3c9a666b28572b Russell King          2019-11-20  462  	unsigned int state =
=3D 0;
f3c9a666b28572b Russell King          2019-11-20  463  	u8 status;
0dea4d039a7fdd9 Russell King          2019-12-17  464  	int ret;
f3c9a666b28572b Russell King          2019-11-20  465  =

0dea4d039a7fdd9 Russell King          2019-12-17  466  	ret =3D sfp_read(sf=
p, true, SFP_STATUS, &status, sizeof(status));
0dea4d039a7fdd9 Russell King          2019-12-17  467  	if (ret =3D=3D size=
of(status)) {
f3c9a666b28572b Russell King          2019-11-20  468  		if (status & SFP_S=
TATUS_RX_LOS)
f3c9a666b28572b Russell King          2019-11-20  469  			state |=3D SFP_F_=
LOS;
f3c9a666b28572b Russell King          2019-11-20  470  		if (status & SFP_S=
TATUS_TX_FAULT)
f3c9a666b28572b Russell King          2019-11-20  471  			state |=3D SFP_F_=
TX_FAULT;
0dea4d039a7fdd9 Russell King          2019-12-17  472  	} else {
0dea4d039a7fdd9 Russell King          2019-12-17 @473  		dev_err_ratelimite=
d(sfp->dev,
9ae1ef4b1634547 Russell King (Oracle  2022-03-01  474) 				    "failed to r=
ead SFP soft status: %pe\n",
9ae1ef4b1634547 Russell King (Oracle  2022-03-01  475) 				    ERR_PTR(ret)=
);
0dea4d039a7fdd9 Russell King          2019-12-17  476  		/* Preserve the cu=
rrent state */
0dea4d039a7fdd9 Russell King          2019-12-17  477  		state =3D sfp->sta=
te;
73970055450eebc Russell King          2017-07-25  478  	}
73970055450eebc Russell King          2017-07-25  479  =

f3c9a666b28572b Russell King          2019-11-20  480  	return state & sfp-=
>state_soft_mask;
f3c9a666b28572b Russell King          2019-11-20  481  }
f3c9a666b28572b Russell King          2019-11-20  482  =


:::::: The code at line 473 was first introduced by commit
:::::: 0dea4d039a7fdd97790a71da37c1ce67a5b52769 net: sfp: report error on f=
ailure to read sfp soft status

:::::: TO: Russell King <rmk+kernel@armlinux.org.uk>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0143685848519665982==--

