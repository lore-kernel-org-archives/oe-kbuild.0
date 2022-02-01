Content-Type: multipart/mixed; boundary="===============1857173304717074382=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/microchip/sparx5/sparx5_packet.c:147 sparx5_xtr_grp() error: dereferencing freed memory 'skb'
Date: Tue, 01 Feb 2022 17:14:38 +0800
Message-ID: <202202011757.Azj3HHCb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1857173304717074382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Steen Hegelund <steen.hegelund@microchip.com>
CC: Bjarni Jonasson <bjarni.jonasson@microchip.com>
CC: Lars Povlsen <lars.povlsen@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   26291c54e111ff6ba87a164d85d4a4e134b7315c
commit: f3cad2611a77f0229dc16aa7bd2ef63e35ea9fb6 net: sparx5: add hostmode =
with phylink support
date:   7 months ago
:::::: branch date: 2 days ago
:::::: commit date: 7 months ago
config: nios2-randconfig-m031-20220130 (https://download.01.org/0day-ci/arc=
hive/20220201/202202011757.Azj3HHCb-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/microchip/sparx5/sparx5_packet.c:147 sparx5_xtr_grp() =
error: dereferencing freed memory 'skb'

vim +/skb +147 drivers/net/ethernet/microchip/sparx5/sparx5_packet.c

f3cad2611a77f0 Steen Hegelund 2021-06-24   52  =

f3cad2611a77f0 Steen Hegelund 2021-06-24   53  static void sparx5_xtr_grp(s=
truct sparx5 *sparx5, u8 grp, bool byte_swap)
f3cad2611a77f0 Steen Hegelund 2021-06-24   54  {
f3cad2611a77f0 Steen Hegelund 2021-06-24   55  	bool eof_flag =3D false, pr=
uned_flag =3D false, abort_flag =3D false;
f3cad2611a77f0 Steen Hegelund 2021-06-24   56  	struct net_device *netdev;
f3cad2611a77f0 Steen Hegelund 2021-06-24   57  	struct sparx5_port *port;
f3cad2611a77f0 Steen Hegelund 2021-06-24   58  	struct frame_info fi;
f3cad2611a77f0 Steen Hegelund 2021-06-24   59  	int i, byte_cnt =3D 0;
f3cad2611a77f0 Steen Hegelund 2021-06-24   60  	struct sk_buff *skb;
f3cad2611a77f0 Steen Hegelund 2021-06-24   61  	u32 ifh[IFH_LEN];
f3cad2611a77f0 Steen Hegelund 2021-06-24   62  	u32 *rxbuf;
f3cad2611a77f0 Steen Hegelund 2021-06-24   63  =

f3cad2611a77f0 Steen Hegelund 2021-06-24   64  	/* Get IFH */
f3cad2611a77f0 Steen Hegelund 2021-06-24   65  	for (i =3D 0; i < IFH_LEN; =
i++)
f3cad2611a77f0 Steen Hegelund 2021-06-24   66  		ifh[i] =3D spx5_rd(sparx5,=
 QS_XTR_RD(grp));
f3cad2611a77f0 Steen Hegelund 2021-06-24   67  =

f3cad2611a77f0 Steen Hegelund 2021-06-24   68  	/* Decode IFH (whats needed=
) */
f3cad2611a77f0 Steen Hegelund 2021-06-24   69  	sparx5_ifh_parse(ifh, &fi);
f3cad2611a77f0 Steen Hegelund 2021-06-24   70  =

f3cad2611a77f0 Steen Hegelund 2021-06-24   71  	/* Map to port netdev */
f3cad2611a77f0 Steen Hegelund 2021-06-24   72  	port =3D fi.src_port < SPX5=
_PORTS ?
f3cad2611a77f0 Steen Hegelund 2021-06-24   73  		sparx5->ports[fi.src_port]=
 : NULL;
f3cad2611a77f0 Steen Hegelund 2021-06-24   74  	if (!port || !port->ndev) {
f3cad2611a77f0 Steen Hegelund 2021-06-24   75  		dev_err(sparx5->dev, "Data=
 on inactive port %d\n", fi.src_port);
f3cad2611a77f0 Steen Hegelund 2021-06-24   76  		sparx5_xtr_flush(sparx5, g=
rp);
f3cad2611a77f0 Steen Hegelund 2021-06-24   77  		return;
f3cad2611a77f0 Steen Hegelund 2021-06-24   78  	}
f3cad2611a77f0 Steen Hegelund 2021-06-24   79  =

f3cad2611a77f0 Steen Hegelund 2021-06-24   80  	/* Have netdev, get skb */
f3cad2611a77f0 Steen Hegelund 2021-06-24   81  	netdev =3D port->ndev;
f3cad2611a77f0 Steen Hegelund 2021-06-24   82  	skb =3D netdev_alloc_skb(ne=
tdev, netdev->mtu + ETH_HLEN);
f3cad2611a77f0 Steen Hegelund 2021-06-24   83  	if (!skb) {
f3cad2611a77f0 Steen Hegelund 2021-06-24   84  		sparx5_xtr_flush(sparx5, g=
rp);
f3cad2611a77f0 Steen Hegelund 2021-06-24   85  		dev_err(sparx5->dev, "No s=
kb allocated\n");
f3cad2611a77f0 Steen Hegelund 2021-06-24   86  		netdev->stats.rx_dropped++;
f3cad2611a77f0 Steen Hegelund 2021-06-24   87  		return;
f3cad2611a77f0 Steen Hegelund 2021-06-24   88  	}
f3cad2611a77f0 Steen Hegelund 2021-06-24   89  	rxbuf =3D (u32 *)skb->data;
f3cad2611a77f0 Steen Hegelund 2021-06-24   90  =

f3cad2611a77f0 Steen Hegelund 2021-06-24   91  	/* Now, pull frame data */
f3cad2611a77f0 Steen Hegelund 2021-06-24   92  	while (!eof_flag) {
f3cad2611a77f0 Steen Hegelund 2021-06-24   93  		u32 val =3D spx5_rd(sparx5=
, QS_XTR_RD(grp));
f3cad2611a77f0 Steen Hegelund 2021-06-24   94  		u32 cmp =3D val;
f3cad2611a77f0 Steen Hegelund 2021-06-24   95  =

f3cad2611a77f0 Steen Hegelund 2021-06-24   96  		if (byte_swap)
f3cad2611a77f0 Steen Hegelund 2021-06-24   97  			cmp =3D ntohl((__force __=
be32)val);
f3cad2611a77f0 Steen Hegelund 2021-06-24   98  =

f3cad2611a77f0 Steen Hegelund 2021-06-24   99  		switch (cmp) {
f3cad2611a77f0 Steen Hegelund 2021-06-24  100  		case XTR_NOT_READY:
f3cad2611a77f0 Steen Hegelund 2021-06-24  101  			break;
f3cad2611a77f0 Steen Hegelund 2021-06-24  102  		case XTR_ABORT:
f3cad2611a77f0 Steen Hegelund 2021-06-24  103  			/* No accompanying data */
f3cad2611a77f0 Steen Hegelund 2021-06-24  104  			abort_flag =3D true;
f3cad2611a77f0 Steen Hegelund 2021-06-24  105  			eof_flag =3D true;
f3cad2611a77f0 Steen Hegelund 2021-06-24  106  			break;
f3cad2611a77f0 Steen Hegelund 2021-06-24  107  		case XTR_EOF_0:
f3cad2611a77f0 Steen Hegelund 2021-06-24  108  		case XTR_EOF_1:
f3cad2611a77f0 Steen Hegelund 2021-06-24  109  		case XTR_EOF_2:
f3cad2611a77f0 Steen Hegelund 2021-06-24  110  		case XTR_EOF_3:
f3cad2611a77f0 Steen Hegelund 2021-06-24  111  			/* This assumes STATUS_WO=
RD_POS =3D=3D 1, Status
f3cad2611a77f0 Steen Hegelund 2021-06-24  112  			 * just after last data
f3cad2611a77f0 Steen Hegelund 2021-06-24  113  			 */
f3cad2611a77f0 Steen Hegelund 2021-06-24  114  			byte_cnt -=3D (4 - XTR_VA=
LID_BYTES(val));
f3cad2611a77f0 Steen Hegelund 2021-06-24  115  			eof_flag =3D true;
f3cad2611a77f0 Steen Hegelund 2021-06-24  116  			break;
f3cad2611a77f0 Steen Hegelund 2021-06-24  117  		case XTR_PRUNED:
f3cad2611a77f0 Steen Hegelund 2021-06-24  118  			/* But get the last 4 byt=
es as well */
f3cad2611a77f0 Steen Hegelund 2021-06-24  119  			eof_flag =3D true;
f3cad2611a77f0 Steen Hegelund 2021-06-24  120  			pruned_flag =3D true;
f3cad2611a77f0 Steen Hegelund 2021-06-24  121  			fallthrough;
f3cad2611a77f0 Steen Hegelund 2021-06-24  122  		case XTR_ESCAPE:
f3cad2611a77f0 Steen Hegelund 2021-06-24  123  			*rxbuf =3D spx5_rd(sparx5=
, QS_XTR_RD(grp));
f3cad2611a77f0 Steen Hegelund 2021-06-24  124  			byte_cnt +=3D 4;
f3cad2611a77f0 Steen Hegelund 2021-06-24  125  			rxbuf++;
f3cad2611a77f0 Steen Hegelund 2021-06-24  126  			break;
f3cad2611a77f0 Steen Hegelund 2021-06-24  127  		default:
f3cad2611a77f0 Steen Hegelund 2021-06-24  128  			*rxbuf =3D val;
f3cad2611a77f0 Steen Hegelund 2021-06-24  129  			byte_cnt +=3D 4;
f3cad2611a77f0 Steen Hegelund 2021-06-24  130  			rxbuf++;
f3cad2611a77f0 Steen Hegelund 2021-06-24  131  		}
f3cad2611a77f0 Steen Hegelund 2021-06-24  132  	}
f3cad2611a77f0 Steen Hegelund 2021-06-24  133  =

f3cad2611a77f0 Steen Hegelund 2021-06-24  134  	if (abort_flag || pruned_fl=
ag || !eof_flag) {
f3cad2611a77f0 Steen Hegelund 2021-06-24  135  		netdev_err(netdev, "Discar=
ded frame: abort:%d pruned:%d eof:%d\n",
f3cad2611a77f0 Steen Hegelund 2021-06-24  136  			   abort_flag, pruned_fla=
g, eof_flag);
f3cad2611a77f0 Steen Hegelund 2021-06-24  137  		kfree_skb(skb);
f3cad2611a77f0 Steen Hegelund 2021-06-24  138  		netdev->stats.rx_dropped++;
f3cad2611a77f0 Steen Hegelund 2021-06-24  139  		return;
f3cad2611a77f0 Steen Hegelund 2021-06-24  140  	}
f3cad2611a77f0 Steen Hegelund 2021-06-24  141  =

f3cad2611a77f0 Steen Hegelund 2021-06-24  142  	/* Finish up skb */
f3cad2611a77f0 Steen Hegelund 2021-06-24  143  	skb_put(skb, byte_cnt - ETH=
_FCS_LEN);
f3cad2611a77f0 Steen Hegelund 2021-06-24  144  	eth_skb_pad(skb);
f3cad2611a77f0 Steen Hegelund 2021-06-24  145  	skb->protocol =3D eth_type_=
trans(skb, netdev);
f3cad2611a77f0 Steen Hegelund 2021-06-24  146  	netif_rx(skb);
f3cad2611a77f0 Steen Hegelund 2021-06-24 @147  	netdev->stats.rx_bytes +=3D=
 skb->len;
f3cad2611a77f0 Steen Hegelund 2021-06-24  148  	netdev->stats.rx_packets++;
f3cad2611a77f0 Steen Hegelund 2021-06-24  149  }
f3cad2611a77f0 Steen Hegelund 2021-06-24  150  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1857173304717074382==--

