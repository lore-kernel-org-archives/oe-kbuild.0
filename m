Content-Type: multipart/mixed; boundary="===============0506524926036759377=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/freescale/fec_main.c:3271 fec_enet_select_queue() warn: potential spectre issue 'fec_enet_vlan_pri_to_queue' [w]
Date: Wed, 11 May 2022 18:05:32 +0800
Message-ID: <202205111842.rLd6mFpi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0506524926036759377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Fugang Duan <fugang.duan@nxp.com>
CC: Joakim Zhang <qiangqing.zhang@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   feb9c5e19e913b53cb536a7aa7c9f20107bb51ec
commit: 52c4a1a85f4b346c39c896c0168f4a843b3385ff net: fec: add ndo_select_q=
ueue to fix TX bandwidth fluctuations
date:   11 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 11 months ago
config: csky-randconfig-m031-20220508 (https://download.01.org/0day-ci/arch=
ive/20220511/202205111842.rLd6mFpi-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/freescale/fec_main.c:3271 fec_enet_select_queue() warn=
: potential spectre issue 'fec_enet_vlan_pri_to_queue' [w]

Old smatch warnings:
drivers/net/ethernet/freescale/fec_main.c:3848 fec_drv_remove() error: Usin=
g 'fep' after free_{netdev,candev}(ndev);
drivers/net/ethernet/freescale/fec_main.c:3849 fec_drv_remove() error: Usin=
g 'fep' after free_{netdev,candev}(ndev);

vim +/fec_enet_vlan_pri_to_queue +3271 drivers/net/ethernet/freescale/fec_m=
ain.c

52c4a1a85f4b34 Fugang Duan 2021-06-21  3257  =

52c4a1a85f4b34 Fugang Duan 2021-06-21  3258  static u16 fec_enet_select_que=
ue(struct net_device *ndev, struct sk_buff *skb,
52c4a1a85f4b34 Fugang Duan 2021-06-21  3259  				 struct net_device *sb_dev)
52c4a1a85f4b34 Fugang Duan 2021-06-21  3260  {
52c4a1a85f4b34 Fugang Duan 2021-06-21  3261  	struct fec_enet_private *fep =
=3D netdev_priv(ndev);
52c4a1a85f4b34 Fugang Duan 2021-06-21  3262  	u16 vlan_tag;
52c4a1a85f4b34 Fugang Duan 2021-06-21  3263  =

52c4a1a85f4b34 Fugang Duan 2021-06-21  3264  	if (!(fep->quirks & FEC_QUIRK=
_HAS_AVB))
52c4a1a85f4b34 Fugang Duan 2021-06-21  3265  		return netdev_pick_tx(ndev, =
skb, NULL);
52c4a1a85f4b34 Fugang Duan 2021-06-21  3266  =

52c4a1a85f4b34 Fugang Duan 2021-06-21  3267  	vlan_tag =3D fec_enet_get_raw=
_vlan_tci(skb);
52c4a1a85f4b34 Fugang Duan 2021-06-21  3268  	if (!vlan_tag)
52c4a1a85f4b34 Fugang Duan 2021-06-21  3269  		return vlan_tag;
52c4a1a85f4b34 Fugang Duan 2021-06-21  3270  =

52c4a1a85f4b34 Fugang Duan 2021-06-21 @3271  	return fec_enet_vlan_pri_to_q=
ueue[vlan_tag >> 13];
52c4a1a85f4b34 Fugang Duan 2021-06-21  3272  }
52c4a1a85f4b34 Fugang Duan 2021-06-21  3273  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0506524926036759377==--

