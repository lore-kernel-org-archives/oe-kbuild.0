Content-Type: multipart/mixed; boundary="===============7988875460588656660=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [saeed:net-next 212/260] drivers/net/dsa/mv88e6xxx/chip.c:713 mv88e6185_phylink_get_caps() error: buffer overflow 'mv88e6185_phy_interface_modes' 7 <= 7
Date: Sat, 05 Feb 2022 06:44:02 +0800
Message-ID: <202202050620.I4dSijNP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7988875460588656660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: "Marek Beh=C3=BAn" <kabel@kernel.org> [ fixed 6341 and 6393x ]
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git net=
-next
head:   69dd0fdc44211d799165e6959057b323accc5afe
commit: d4ebf12bcec45378f6b3badb63806761e10a4596 [212/260] net: dsa: mv88e6=
xxx: populate supported_interfaces and mac_capabilities
:::::: branch date: 22 hours ago
:::::: commit date: 33 hours ago
config: nios2-randconfig-m031-20220131 (https://download.01.org/0day-ci/arc=
hive/20220205/202202050620.I4dSijNP-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/dsa/mv88e6xxx/chip.c:713 mv88e6185_phylink_get_caps() error: bu=
ffer overflow 'mv88e6185_phy_interface_modes' 7 <=3D 7

Old smatch warnings:
drivers/net/dsa/mv88e6xxx/chip.c:714 mv88e6185_phylink_get_caps() error: bu=
ffer overflow 'mv88e6185_phy_interface_modes' 7 <=3D 7
drivers/net/dsa/mv88e6xxx/chip.c:3000 mv88e6xxx_serdes_irq_request() warn: =
'irq' not released on lines: 3000.

vim +/mv88e6185_phy_interface_modes +713 drivers/net/dsa/mv88e6xxx/chip.c

6c422e34b1b653 Russell King          2018-08-09  706  =

d4ebf12bcec453 Russell King (Oracle  2022-02-03  707) static void mv88e6185=
_phylink_get_caps(struct mv88e6xxx_chip *chip, int port,
d4ebf12bcec453 Russell King (Oracle  2022-02-03  708) 				       struct phy=
link_config *config)
d4ebf12bcec453 Russell King (Oracle  2022-02-03  709) {
d4ebf12bcec453 Russell King (Oracle  2022-02-03  710) 	u8 cmode =3D chip->p=
orts[port].cmode;
d4ebf12bcec453 Russell King (Oracle  2022-02-03  711) =

d4ebf12bcec453 Russell King (Oracle  2022-02-03  712) 	if (cmode <=3D ARRAY=
_SIZE(mv88e6185_phy_interface_modes) &&
d4ebf12bcec453 Russell King (Oracle  2022-02-03 @713) 	    mv88e6185_phy_in=
terface_modes[cmode])
d4ebf12bcec453 Russell King (Oracle  2022-02-03  714) 		__set_bit(mv88e6185=
_phy_interface_modes[cmode],
d4ebf12bcec453 Russell King (Oracle  2022-02-03  715) 			  config->supporte=
d_interfaces);
d4ebf12bcec453 Russell King (Oracle  2022-02-03  716) =

d4ebf12bcec453 Russell King (Oracle  2022-02-03  717) 	config->mac_capabili=
ties =3D MAC_SYM_PAUSE | MAC_10 | MAC_100 |
d4ebf12bcec453 Russell King (Oracle  2022-02-03  718) 				   MAC_1000FD;
d4ebf12bcec453 Russell King (Oracle  2022-02-03  719) }
d4ebf12bcec453 Russell King (Oracle  2022-02-03  720) =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7988875460588656660==--

