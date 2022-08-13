Content-Type: multipart/mixed; boundary="===============3992990721259567115=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/sunplus/spl2sw_int.c:115 spl2sw_rx_poll() error: potentially dereferencing uninitialized 'h_desc'.
Date: Sun, 14 Aug 2022 06:49:40 +0800
Message-ID: <202208140657.AR8NqSME-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3992990721259567115==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Wells Lu <wellslutw@gmail.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f6eb0fed6a3957c0b93e3a00c1ffaad84d4ffc31
commit: fd3040b9394c58bcedb83554bcf1a073021d6b36 net: ethernet: Add driver =
for Sunplus SP7021
date:   3 months ago
:::::: branch date: 67 minutes ago
:::::: commit date: 3 months ago
config: s390-randconfig-m031-20220810 (https://download.01.org/0day-ci/arch=
ive/20220814/202208140657.AR8NqSME-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/sunplus/spl2sw_int.c:115 spl2sw_rx_poll() error: poten=
tially dereferencing uninitialized 'h_desc'.

vim +/h_desc +115 drivers/net/ethernet/sunplus/spl2sw_int.c

fd3040b9394c58 Wells Lu 2022-05-08   16  =

fd3040b9394c58 Wells Lu 2022-05-08   17  int spl2sw_rx_poll(struct napi_str=
uct *napi, int budget)
fd3040b9394c58 Wells Lu 2022-05-08   18  {
fd3040b9394c58 Wells Lu 2022-05-08   19  	struct spl2sw_common *comm =3D co=
ntainer_of(napi, struct spl2sw_common, rx_napi);
fd3040b9394c58 Wells Lu 2022-05-08   20  	struct spl2sw_mac_desc *desc, *h_=
desc;
fd3040b9394c58 Wells Lu 2022-05-08   21  	struct net_device_stats *stats;
fd3040b9394c58 Wells Lu 2022-05-08   22  	struct sk_buff *skb, *new_skb;
fd3040b9394c58 Wells Lu 2022-05-08   23  	struct spl2sw_skb_info *sinfo;
fd3040b9394c58 Wells Lu 2022-05-08   24  	int budget_left =3D budget;
fd3040b9394c58 Wells Lu 2022-05-08   25  	unsigned long flags;
fd3040b9394c58 Wells Lu 2022-05-08   26  	u32 rx_pos, pkg_len;
fd3040b9394c58 Wells Lu 2022-05-08   27  	u32 num, rx_count;
fd3040b9394c58 Wells Lu 2022-05-08   28  	s32 queue;
fd3040b9394c58 Wells Lu 2022-05-08   29  	u32 mask;
fd3040b9394c58 Wells Lu 2022-05-08   30  	int port;
fd3040b9394c58 Wells Lu 2022-05-08   31  	u32 cmd;
fd3040b9394c58 Wells Lu 2022-05-08   32  =

fd3040b9394c58 Wells Lu 2022-05-08   33  	/* Process high-priority queue an=
d then low-priority queue. */
fd3040b9394c58 Wells Lu 2022-05-08   34  	for (queue =3D 0; queue < RX_DESC=
_QUEUE_NUM; queue++) {
fd3040b9394c58 Wells Lu 2022-05-08   35  		rx_pos =3D comm->rx_pos[queue];
fd3040b9394c58 Wells Lu 2022-05-08   36  		rx_count =3D comm->rx_desc_num[q=
ueue];
fd3040b9394c58 Wells Lu 2022-05-08   37  =

fd3040b9394c58 Wells Lu 2022-05-08   38  		for (num =3D 0; num < rx_count &=
& budget_left; num++) {
fd3040b9394c58 Wells Lu 2022-05-08   39  			sinfo =3D comm->rx_skb_info[que=
ue] + rx_pos;
fd3040b9394c58 Wells Lu 2022-05-08   40  			desc =3D comm->rx_desc[queue] +=
 rx_pos;
fd3040b9394c58 Wells Lu 2022-05-08   41  			cmd =3D desc->cmd1;
fd3040b9394c58 Wells Lu 2022-05-08   42  =

fd3040b9394c58 Wells Lu 2022-05-08   43  			if (cmd & RXD_OWN)
fd3040b9394c58 Wells Lu 2022-05-08   44  				break;
fd3040b9394c58 Wells Lu 2022-05-08   45  =

fd3040b9394c58 Wells Lu 2022-05-08   46  			port =3D FIELD_GET(RXD_PKT_SP, =
cmd);
fd3040b9394c58 Wells Lu 2022-05-08   47  			if (port < MAX_NETDEV_NUM && co=
mm->ndev[port])
fd3040b9394c58 Wells Lu 2022-05-08   48  				stats =3D &comm->ndev[port]->s=
tats;
fd3040b9394c58 Wells Lu 2022-05-08   49  			else
fd3040b9394c58 Wells Lu 2022-05-08   50  				goto spl2sw_rx_poll_rec_err;
fd3040b9394c58 Wells Lu 2022-05-08   51  =

fd3040b9394c58 Wells Lu 2022-05-08   52  			pkg_len =3D FIELD_GET(RXD_PKT_L=
EN, cmd);
fd3040b9394c58 Wells Lu 2022-05-08   53  			if (unlikely((cmd & RXD_ERR_COD=
E) || pkg_len < ETH_ZLEN + 4)) {
fd3040b9394c58 Wells Lu 2022-05-08   54  				stats->rx_length_errors++;
fd3040b9394c58 Wells Lu 2022-05-08   55  				stats->rx_dropped++;
fd3040b9394c58 Wells Lu 2022-05-08   56  				goto spl2sw_rx_poll_rec_err;
fd3040b9394c58 Wells Lu 2022-05-08   57  			}
fd3040b9394c58 Wells Lu 2022-05-08   58  =

fd3040b9394c58 Wells Lu 2022-05-08   59  			dma_unmap_single(&comm->pdev->d=
ev, sinfo->mapping,
fd3040b9394c58 Wells Lu 2022-05-08   60  					 comm->rx_desc_buff_size, DMA=
_FROM_DEVICE);
fd3040b9394c58 Wells Lu 2022-05-08   61  =

fd3040b9394c58 Wells Lu 2022-05-08   62  			skb =3D sinfo->skb;
fd3040b9394c58 Wells Lu 2022-05-08   63  			skb_put(skb, pkg_len - 4); /* M=
inus FCS */
fd3040b9394c58 Wells Lu 2022-05-08   64  			skb->ip_summed =3D CHECKSUM_NON=
E;
fd3040b9394c58 Wells Lu 2022-05-08   65  			skb->protocol =3D eth_type_tran=
s(skb, comm->ndev[port]);
fd3040b9394c58 Wells Lu 2022-05-08   66  			netif_receive_skb(skb);
fd3040b9394c58 Wells Lu 2022-05-08   67  =

fd3040b9394c58 Wells Lu 2022-05-08   68  			stats->rx_packets++;
fd3040b9394c58 Wells Lu 2022-05-08   69  			stats->rx_bytes +=3D skb->len;
fd3040b9394c58 Wells Lu 2022-05-08   70  =

fd3040b9394c58 Wells Lu 2022-05-08   71  			/* Allocate a new skb for recei=
ving. */
fd3040b9394c58 Wells Lu 2022-05-08   72  			new_skb =3D netdev_alloc_skb(NU=
LL, comm->rx_desc_buff_size);
fd3040b9394c58 Wells Lu 2022-05-08   73  			if (unlikely(!new_skb)) {
fd3040b9394c58 Wells Lu 2022-05-08   74  				desc->cmd2 =3D (rx_pos =3D=3D =
comm->rx_desc_num[queue] - 1) ?
fd3040b9394c58 Wells Lu 2022-05-08   75  					     RXD_EOR : 0;
fd3040b9394c58 Wells Lu 2022-05-08   76  				sinfo->skb =3D NULL;
fd3040b9394c58 Wells Lu 2022-05-08   77  				sinfo->mapping =3D 0;
fd3040b9394c58 Wells Lu 2022-05-08   78  				desc->addr1 =3D 0;
fd3040b9394c58 Wells Lu 2022-05-08   79  				goto spl2sw_rx_poll_alloc_err;
fd3040b9394c58 Wells Lu 2022-05-08   80  			}
fd3040b9394c58 Wells Lu 2022-05-08   81  =

fd3040b9394c58 Wells Lu 2022-05-08   82  			sinfo->mapping =3D dma_map_sing=
le(&comm->pdev->dev, new_skb->data,
fd3040b9394c58 Wells Lu 2022-05-08   83  							comm->rx_desc_buff_size,
fd3040b9394c58 Wells Lu 2022-05-08   84  							DMA_FROM_DEVICE);
fd3040b9394c58 Wells Lu 2022-05-08   85  			if (dma_mapping_error(&comm->pd=
ev->dev, sinfo->mapping)) {
fd3040b9394c58 Wells Lu 2022-05-08   86  				dev_kfree_skb_irq(new_skb);
fd3040b9394c58 Wells Lu 2022-05-08   87  				desc->cmd2 =3D (rx_pos =3D=3D =
comm->rx_desc_num[queue] - 1) ?
fd3040b9394c58 Wells Lu 2022-05-08   88  					     RXD_EOR : 0;
fd3040b9394c58 Wells Lu 2022-05-08   89  				sinfo->skb =3D NULL;
fd3040b9394c58 Wells Lu 2022-05-08   90  				sinfo->mapping =3D 0;
fd3040b9394c58 Wells Lu 2022-05-08   91  				desc->addr1 =3D 0;
fd3040b9394c58 Wells Lu 2022-05-08   92  				goto spl2sw_rx_poll_alloc_err;
fd3040b9394c58 Wells Lu 2022-05-08   93  			}
fd3040b9394c58 Wells Lu 2022-05-08   94  =

fd3040b9394c58 Wells Lu 2022-05-08   95  			sinfo->skb =3D new_skb;
fd3040b9394c58 Wells Lu 2022-05-08   96  			desc->addr1 =3D sinfo->mapping;
fd3040b9394c58 Wells Lu 2022-05-08   97  =

fd3040b9394c58 Wells Lu 2022-05-08   98  spl2sw_rx_poll_rec_err:
fd3040b9394c58 Wells Lu 2022-05-08   99  			desc->cmd2 =3D (rx_pos =3D=3D c=
omm->rx_desc_num[queue] - 1) ?
fd3040b9394c58 Wells Lu 2022-05-08  100  				     RXD_EOR | comm->rx_desc_b=
uff_size :
fd3040b9394c58 Wells Lu 2022-05-08  101  				     comm->rx_desc_buff_size;
fd3040b9394c58 Wells Lu 2022-05-08  102  =

fd3040b9394c58 Wells Lu 2022-05-08  103  			wmb();	/* Set RXD_OWN after oth=
er fields are effective. */
fd3040b9394c58 Wells Lu 2022-05-08  104  			desc->cmd1 =3D RXD_OWN;
fd3040b9394c58 Wells Lu 2022-05-08  105  =

fd3040b9394c58 Wells Lu 2022-05-08  106  spl2sw_rx_poll_alloc_err:
fd3040b9394c58 Wells Lu 2022-05-08  107  			/* Move rx_pos to next position=
 */
fd3040b9394c58 Wells Lu 2022-05-08  108  			rx_pos =3D ((rx_pos + 1) =3D=3D=
 comm->rx_desc_num[queue]) ? 0 : rx_pos + 1;
fd3040b9394c58 Wells Lu 2022-05-08  109  =

fd3040b9394c58 Wells Lu 2022-05-08  110  			budget_left--;
fd3040b9394c58 Wells Lu 2022-05-08  111  =

fd3040b9394c58 Wells Lu 2022-05-08  112  			/* If there are packets in high=
-priority queue,
fd3040b9394c58 Wells Lu 2022-05-08  113  			 * stop processing low-priority=
 queue.
fd3040b9394c58 Wells Lu 2022-05-08  114  			 */
fd3040b9394c58 Wells Lu 2022-05-08 @115  			if (queue =3D=3D 1 && !(h_desc-=
>cmd1 & RXD_OWN))
fd3040b9394c58 Wells Lu 2022-05-08  116  				break;
fd3040b9394c58 Wells Lu 2022-05-08  117  		}
fd3040b9394c58 Wells Lu 2022-05-08  118  =

fd3040b9394c58 Wells Lu 2022-05-08  119  		comm->rx_pos[queue] =3D rx_pos;
fd3040b9394c58 Wells Lu 2022-05-08  120  =

fd3040b9394c58 Wells Lu 2022-05-08  121  		/* Save pointer to last rx descr=
iptor of high-priority queue. */
fd3040b9394c58 Wells Lu 2022-05-08  122  		if (queue =3D=3D 0)
fd3040b9394c58 Wells Lu 2022-05-08  123  			h_desc =3D comm->rx_desc[queue]=
 + rx_pos;
fd3040b9394c58 Wells Lu 2022-05-08  124  	}
fd3040b9394c58 Wells Lu 2022-05-08  125  =

fd3040b9394c58 Wells Lu 2022-05-08  126  	spin_lock_irqsave(&comm->int_mask=
_lock, flags);
fd3040b9394c58 Wells Lu 2022-05-08  127  	mask =3D readl(comm->l2sw_reg_bas=
e + L2SW_SW_INT_MASK_0);
fd3040b9394c58 Wells Lu 2022-05-08  128  	mask &=3D ~MAC_INT_RX;
fd3040b9394c58 Wells Lu 2022-05-08  129  	writel(mask, comm->l2sw_reg_base =
+ L2SW_SW_INT_MASK_0);
fd3040b9394c58 Wells Lu 2022-05-08  130  	spin_unlock_irqrestore(&comm->int=
_mask_lock, flags);
fd3040b9394c58 Wells Lu 2022-05-08  131  =

fd3040b9394c58 Wells Lu 2022-05-08  132  	napi_complete(napi);
fd3040b9394c58 Wells Lu 2022-05-08  133  	return budget - budget_left;
fd3040b9394c58 Wells Lu 2022-05-08  134  }
fd3040b9394c58 Wells Lu 2022-05-08  135  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3992990721259567115==--

