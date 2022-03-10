Content-Type: multipart/mixed; boundary="===============1046385982752826986=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mkl-can-next:testing 4/29] drivers/net/can/vxcan.c:60 vxcan_xmit() error: use kfree_skb() here instead of kfree(oskb)
Date: Fri, 11 Mar 2022 04:50:05 +0800
Message-ID: <202203110433.qIHMpuS5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1046385982752826986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-can(a)vger.kernel.org
TO: Oliver Hartkopp <socketcan@hartkopp.net>
CC: "Marc Kleine-Budde" <mkl@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.=
git testing
head:   0691a4b55c89055c1efb61a7696f4bc6aa5cf630
commit: 1574481bb3de11c9d44f5405c17e948b76794f39 [4/29] vxcan: remove sk re=
ference in peer skb
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arc-randconfig-m031-20220310 (https://download.01.org/0day-ci/archi=
ve/20220311/202203110433.qIHMpuS5-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/can/vxcan.c:60 vxcan_xmit() error: use kfree_skb() here instead=
 of kfree(oskb)

Old smatch warnings:
arch/arc/include/asm/thread_info.h:65 current_thread_info() error: uninitia=
lized symbol 'sp'.

vim +60 drivers/net/can/vxcan.c

a8f820a380a2a0 Oliver Hartkopp           2017-04-25  35  =

1574481bb3de11 Oliver Hartkopp           2022-03-09  36  static netdev_tx_t=
 vxcan_xmit(struct sk_buff *oskb, struct net_device *dev)
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  37  {
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  38  	struct vxcan_priv=
 *priv =3D netdev_priv(dev);
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  39  	struct net_device=
 *peer;
1574481bb3de11 Oliver Hartkopp           2022-03-09  40  	struct canfd_fram=
e *cfd =3D (struct canfd_frame *)oskb->data;
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  41  	struct net_device=
_stats *peerstats, *srcstats =3D &dev->stats;
1574481bb3de11 Oliver Hartkopp           2022-03-09  42  	struct sk_buff *s=
kb;
75854cad5d8097 Vincent Mailhol           2021-01-20  43  	u8 len;
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  44  =

1574481bb3de11 Oliver Hartkopp           2022-03-09  45  	if (can_dropped_i=
nvalid_skb(dev, oskb))
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  46  		return NETDEV_TX=
_OK;
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  47  =

a8f820a380a2a0 Oliver Hartkopp           2017-04-25  48  	rcu_read_lock();
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  49  	peer =3D rcu_dere=
ference(priv->peer);
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  50  	if (unlikely(!pee=
r)) {
1574481bb3de11 Oliver Hartkopp           2022-03-09  51  		kfree_skb(oskb);
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  52  		dev->stats.tx_dr=
opped++;
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  53  		goto out_unlock;
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  54  	}
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  55  =

1574481bb3de11 Oliver Hartkopp           2022-03-09  56  	skb =3D skb_clone=
(oskb, GFP_ATOMIC);
1574481bb3de11 Oliver Hartkopp           2022-03-09  57  	if (skb) {
1574481bb3de11 Oliver Hartkopp           2022-03-09  58  		consume_skb(oskb=
);
1574481bb3de11 Oliver Hartkopp           2022-03-09  59  	} else {
1574481bb3de11 Oliver Hartkopp           2022-03-09 @60  		kfree(oskb);
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  61  		goto out_unlock;
1574481bb3de11 Oliver Hartkopp           2022-03-09  62  	}
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  63  =

a8f820a380a2a0 Oliver Hartkopp           2017-04-25  64  	/* reset CAN GW h=
op counter */
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  65  	skb->csum_start =
=3D 0;
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  66  	skb->pkt_type   =
=3D PACKET_BROADCAST;
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  67  	skb->dev        =
=3D peer;
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  68  	skb->ip_summed  =
=3D CHECKSUM_UNNECESSARY;
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  69  =

cc4b08c31b5c51 Vincent Mailhol           2021-12-07  70  	len =3D cfd->can_=
id & CAN_RTR_FLAG ? 0 : cfd->len;
00f4a0afb7eafd Sebastian Andrzej Siewior 2022-03-05  71  	if (netif_rx(skb)=
 =3D=3D NET_RX_SUCCESS) {
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  72  		srcstats->tx_pac=
kets++;
75854cad5d8097 Vincent Mailhol           2021-01-20  73  		srcstats->tx_byt=
es +=3D len;
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  74  		peerstats =3D &p=
eer->stats;
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  75  		peerstats->rx_pa=
ckets++;
75854cad5d8097 Vincent Mailhol           2021-01-20  76  		peerstats->rx_by=
tes +=3D len;
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  77  	}
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  78  =

a8f820a380a2a0 Oliver Hartkopp           2017-04-25  79  out_unlock:
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  80  	rcu_read_unlock();
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  81  	return NETDEV_TX_=
OK;
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  82  }
a8f820a380a2a0 Oliver Hartkopp           2017-04-25  83  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1046385982752826986==--

