Content-Type: multipart/mixed; boundary="===============1367495690251723768=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 10650/11475] drivers/net/can/janz-ican3.c:1303 ican3_get_echo_skb() error: uninitialized symbol 'dlc'.
Date: Sat, 08 Jan 2022 20:05:00 +0800
Message-ID: <202201081910.06vbmqbD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1367495690251723768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
CC: "Marc Kleine-Budde" <mkl@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b8170452cd5121b11a5726e3ea8dbdfc2d74e771
commit: cc4b08c31b5c51352f258032cc65e884b3e61e6a [10650/11475] can: do not =
increase tx_bytes statistics for RTR frames
:::::: branch date: 20 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021-20220107 (https://download.01.org/0day-ci/arch=
ive/20220108/202201081910.06vbmqbD-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/can/janz-ican3.c:1303 ican3_get_echo_skb() error: uninitialized=
 symbol 'dlc'.

Old smatch warnings:
drivers/net/can/janz-ican3.c:1311 ican3_get_echo_skb() error: uninitialized=
 symbol 'dlc'.

vim +/dlc +1303 drivers/net/can/janz-ican3.c

83702f69272e45 Ira W. Snyder   2012-07-19  1283  =

83702f69272e45 Ira W. Snyder   2012-07-19  1284  static unsigned int ican3_=
get_echo_skb(struct ican3_dev *mod)
83702f69272e45 Ira W. Snyder   2012-07-19  1285  {
83702f69272e45 Ira W. Snyder   2012-07-19  1286  	struct sk_buff *skb =3D s=
kb_dequeue(&mod->echoq);
83702f69272e45 Ira W. Snyder   2012-07-19  1287  	struct can_frame *cf;
83702f69272e45 Ira W. Snyder   2012-07-19  1288  	u8 dlc;
83702f69272e45 Ira W. Snyder   2012-07-19  1289  =

83702f69272e45 Ira W. Snyder   2012-07-19  1290  	/* this should never trig=
ger unless there is a driver bug */
83702f69272e45 Ira W. Snyder   2012-07-19  1291  	if (!skb) {
83702f69272e45 Ira W. Snyder   2012-07-19  1292  		netdev_err(mod->ndev, "B=
UG: echo skb not occupied\n");
83702f69272e45 Ira W. Snyder   2012-07-19  1293  		return 0;
83702f69272e45 Ira W. Snyder   2012-07-19  1294  	}
83702f69272e45 Ira W. Snyder   2012-07-19  1295  =

83702f69272e45 Ira W. Snyder   2012-07-19  1296  	cf =3D (struct can_frame =
*)skb->data;
cc4b08c31b5c51 Vincent Mailhol 2021-12-07  1297  	if (!(cf->can_id & CAN_RT=
R_FLAG))
c7b74967799b1a Oliver Hartkopp 2020-11-20  1298  		dlc =3D cf->len;
83702f69272e45 Ira W. Snyder   2012-07-19  1299  =

83702f69272e45 Ira W. Snyder   2012-07-19  1300  	/* check flag whether thi=
s packet has to be looped back */
83702f69272e45 Ira W. Snyder   2012-07-19  1301  	if (skb->pkt_type !=3D PA=
CKET_LOOPBACK) {
83702f69272e45 Ira W. Snyder   2012-07-19  1302  		kfree_skb(skb);
83702f69272e45 Ira W. Snyder   2012-07-19 @1303  		return dlc;
83702f69272e45 Ira W. Snyder   2012-07-19  1304  	}
83702f69272e45 Ira W. Snyder   2012-07-19  1305  =

83702f69272e45 Ira W. Snyder   2012-07-19  1306  	skb->protocol =3D htons(E=
TH_P_CAN);
83702f69272e45 Ira W. Snyder   2012-07-19  1307  	skb->pkt_type =3D PACKET_=
BROADCAST;
83702f69272e45 Ira W. Snyder   2012-07-19  1308  	skb->ip_summed =3D CHECKS=
UM_UNNECESSARY;
83702f69272e45 Ira W. Snyder   2012-07-19  1309  	skb->dev =3D mod->ndev;
83702f69272e45 Ira W. Snyder   2012-07-19  1310  	netif_receive_skb(skb);
83702f69272e45 Ira W. Snyder   2012-07-19  1311  	return dlc;
83702f69272e45 Ira W. Snyder   2012-07-19  1312  }
83702f69272e45 Ira W. Snyder   2012-07-19  1313  =


:::::: The code at line 1303 was first introduced by commit
:::::: 83702f69272e4591a91a27eb58eade1bcd361dae can: janz-ican3: fix suppor=
t for CAN_RAW_RECV_OWN_MSGS

:::::: TO: Ira W. Snyder <iws@ovro.caltech.edu>
:::::: CC: Marc Kleine-Budde <mkl@pengutronix.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1367495690251723768==--

