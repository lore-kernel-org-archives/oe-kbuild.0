Content-Type: multipart/mixed; boundary="===============8676300571038280119=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 942/1024] drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1641:17-20: ERROR: reference preceded by free on line 1618
Date: Sun, 27 Mar 2022 00:20:37 +0800
Message-ID: <202203270040.MJCkyEOu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8676300571038280119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Harini Katakam <harini.katakam@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Swati Agarwal <swati.agarwal@xilinx.com>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   aceb8dba4813e07934d2847fdaf8bdfaaf9f622c
commit: 8bb7c59151794fc747f9e9faba7a0cec067a0252 [942/1024] net: axienet: H=
andle dma mapping errors in RX datapath
:::::: branch date: 3 days ago
:::::: commit date: 4 weeks ago
config: ia64-randconfig-c004-20220324 (https://download.01.org/0day-ci/arch=
ive/20220327/202203270040.MJCkyEOu-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1641:17-20: ERROR: ref=
erence preceded by free on line 1618

vim +1641 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1533  =

ee94241b2118ddd Saurabh Sengar               2021-01-22  1534  		dma_unmap_=
single(ndev->dev.parent, cur_p->phys,
ee94241b2118ddd Saurabh Sengar               2021-01-22  1535  				 lp->max=
_frm_size,
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1536  				 DMA_FRO=
M_DEVICE);
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1537  =

ee94241b2118ddd Saurabh Sengar               2021-01-22  1538  		skb =3D (s=
truct sk_buff *)(cur_p->sw_id_offset);
f6420dd2cc68a93 Appana Durga Kedareswara Rao 2020-01-24  1539  =

c8f87454e38ff93 Appana Durga Kedareswara Rao 2020-01-24  1540  		if (lp->et=
h_hasnobuf ||
c8f87454e38ff93 Appana Durga Kedareswara Rao 2020-01-24  1541  		    lp->ax=
ienet_config->mactype !=3D XAXIENET_1G)
f6420dd2cc68a93 Appana Durga Kedareswara Rao 2020-01-24  1542  			length =
=3D cur_p->status & XAXIDMA_BD_STS_ACTUAL_LEN_MASK;
f6420dd2cc68a93 Appana Durga Kedareswara Rao 2020-01-24  1543  		else
23e6b2dc93630b6 Robert Hancock               2019-06-06  1544  			length =
=3D cur_p->app4 & 0x0000FFFF;
23e6b2dc93630b6 Robert Hancock               2019-06-06  1545  =

8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1546  		skb_put(sk=
b, length);
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1547  #ifdef CONFI=
G_XILINX_AXI_EMAC_HWTSTAMP
a7ae7ddafe91c16 Saurabh Sengar               2021-01-22  1548  	if (!lp->is=
_tsn) {
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1549  		if ((lp->t=
stamp_config.rx_filter =3D=3D HWTSTAMP_FILTER_ALL ||
146b2ba5b5d5e97 Harini Katakam               2021-01-22  1550  			lp->eth_h=
asptp) &&
146b2ba5b5d5e97 Harini Katakam               2021-01-22  1551  			(lp->axie=
net_config->mactype !=3D XAXIENET_10G_25G) &&
146b2ba5b5d5e97 Harini Katakam               2021-01-22  1552  			(lp->axie=
net_config->mactype !=3D XAXIENET_MRMAC)) {
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1553  			u32 sec, =
nsec;
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1554  			u64 time6=
4;
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1555  			struct sk=
b_shared_hwtstamps *shhwtstamps;
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1556  =

bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1557  			if (lp->a=
xienet_config->mactype =3D=3D XAXIENET_1G ||
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1558  			    lp->a=
xienet_config->mactype =3D=3D XAXIENET_2_5G) {
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1559  				/* The f=
irst 8 bytes will be the timestamp */
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1560  				memcpy(&=
sec, &skb->data[0], 4);
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1561  				memcpy(&=
nsec, &skb->data[4], 4);
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1562  =

bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1563  				sec =3D =
cpu_to_be32(sec);
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1564  				nsec =3D=
 cpu_to_be32(nsec);
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1565  			} else {
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1566  				/* The f=
irst 8 bytes will be the timestamp */
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1567  				memcpy(&=
nsec, &skb->data[0], 4);
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1568  				memcpy(&=
sec, &skb->data[4], 4);
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1569  			}
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1570  =

bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1571  			/* Remove=
 these 8 bytes from the buffer */
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1572  			skb_pull(=
skb, 8);
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1573  			time64 =
=3D sec * NS_PER_SEC + nsec;
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1574  			shhwtstam=
ps =3D skb_hwtstamps(skb);
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1575  			shhwtstam=
ps->hwtstamp =3D ns_to_ktime(time64);
e74bff7aa33454c Harini Katakam               2021-01-22  1576  		} else if =
(lp->axienet_config->mactype =3D=3D XAXIENET_10G_25G ||
e74bff7aa33454c Harini Katakam               2021-01-22  1577  			   lp->ax=
ienet_config->mactype =3D=3D XAXIENET_MRMAC) {
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1578  			axienet_r=
x_hwtstamp(lp, skb);
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1579  		}
a7ae7ddafe91c16 Saurabh Sengar               2021-01-22  1580  	}
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1581  #endif
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1582  		skb->proto=
col =3D eth_type_trans(skb, ndev);
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1583  		/*skb_chec=
ksum_none_assert(skb);*/
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1584  		skb->ip_su=
mmed =3D CHECKSUM_NONE;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1585  =

8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1586  		/* if we'r=
e doing Rx csum offload, set it up */
f6420dd2cc68a93 Appana Durga Kedareswara Rao 2020-01-24  1587  		if (lp->fe=
atures & XAE_FEATURE_FULL_RX_CSUM &&
c8f87454e38ff93 Appana Durga Kedareswara Rao 2020-01-24  1588  		    (lp->a=
xienet_config->mactype =3D=3D XAXIENET_1G) &&
f6420dd2cc68a93 Appana Durga Kedareswara Rao 2020-01-24  1589  		    !lp->e=
th_hasnobuf) {
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1590  			csumstatu=
s =3D (cur_p->app2 &
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1591  				      XA=
E_FULL_CSUM_STATUS_MASK) >> 3;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1592  			if ((csum=
status =3D=3D XAE_IP_TCP_CSUM_VALIDATED) ||
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1593  			    (csum=
status =3D=3D XAE_IP_UDP_CSUM_VALIDATED)) {
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1594  				skb->ip_=
summed =3D CHECKSUM_UNNECESSARY;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1595  			}
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1596  		} else if =
((lp->features & XAE_FEATURE_PARTIAL_RX_CSUM) !=3D 0 &&
ceffc4acfc8c4cf Joe Perches                  2014-03-12  1597  			   skb->p=
rotocol =3D=3D htons(ETH_P_IP) &&
c8f87454e38ff93 Appana Durga Kedareswara Rao 2020-01-24  1598  			   skb->l=
en > 64 && !lp->eth_hasnobuf &&
c8f87454e38ff93 Appana Durga Kedareswara Rao 2020-01-24  1599  			   (lp->a=
xienet_config->mactype =3D=3D XAXIENET_1G)) {
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1600  			skb->csum=
 =3D be32_to_cpu(cur_p->app3 & 0xFFFF);
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1601  			skb->ip_s=
ummed =3D CHECKSUM_COMPLETE;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1602  		}
65f1c62ef6567bb Pranavi Somisetty            2021-01-22  1603  #ifdef CONFI=
G_XILINX_TSN
65f1c62ef6567bb Pranavi Somisetty            2021-01-22  1604  		if (unlike=
ly(q->flags & MCDMA_MGMT_CHAN)) {
65f1c62ef6567bb Pranavi Somisetty            2021-01-22  1605  			struct ne=
t_device *ndev =3D NULL;
65f1c62ef6567bb Pranavi Somisetty            2021-01-22  1606  =

65f1c62ef6567bb Pranavi Somisetty            2021-01-22  1607  			/* receiv=
ed packet on mgmt channel */
65f1c62ef6567bb Pranavi Somisetty            2021-01-22  1608  			if (q->fl=
ags & MCDMA_MGMT_CHAN_PORT0)
65f1c62ef6567bb Pranavi Somisetty            2021-01-22  1609  				ndev =3D=
 lp->slaves[0];
65f1c62ef6567bb Pranavi Somisetty            2021-01-22  1610  			else if (=
q->flags & MCDMA_MGMT_CHAN_PORT1)
65f1c62ef6567bb Pranavi Somisetty            2021-01-22  1611  				ndev =3D=
 lp->slaves[1];
65f1c62ef6567bb Pranavi Somisetty            2021-01-22  1612  =

65f1c62ef6567bb Pranavi Somisetty            2021-01-22  1613  			/* send t=
o one of the front panel port */
65f1c62ef6567bb Pranavi Somisetty            2021-01-22  1614  			if (ndev =
&& netif_running(ndev)) {
65f1c62ef6567bb Pranavi Somisetty            2021-01-22  1615  				skb->dev=
 =3D ndev;
65f1c62ef6567bb Pranavi Somisetty            2021-01-22  1616  				netif_re=
ceive_skb(skb);
65f1c62ef6567bb Pranavi Somisetty            2021-01-22  1617  			} else {
65f1c62ef6567bb Pranavi Somisetty            2021-01-22 @1618  				kfree(sk=
b); /* dont send up the stack */
65f1c62ef6567bb Pranavi Somisetty            2021-01-22  1619  			}
65f1c62ef6567bb Pranavi Somisetty            2021-01-22  1620  		} else {
65f1c62ef6567bb Pranavi Somisetty            2021-01-22  1621  			netif_rec=
eive_skb(skb); /* send on normal data path */
65f1c62ef6567bb Pranavi Somisetty            2021-01-22  1622  		}
65f1c62ef6567bb Pranavi Somisetty            2021-01-22  1623  #else
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1624  =

ec9a60a97272571 Appana Durga Kedareswara Rao 2020-01-24  1625  		netif_rece=
ive_skb(skb);
65f1c62ef6567bb Pranavi Somisetty            2021-01-22  1626  #endif
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1627  =

8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1628  		size +=3D =
length;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1629  		packets++;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1630  =

244a92b6cc6f9ae Appana Durga Kedareswara Rao 2020-01-24  1631  		/* Ensure =
that the skb is completely updated
244a92b6cc6f9ae Appana Durga Kedareswara Rao 2020-01-24  1632  		 * prio to=
 mapping the DMA
244a92b6cc6f9ae Appana Durga Kedareswara Rao 2020-01-24  1633  		 */
244a92b6cc6f9ae Appana Durga Kedareswara Rao 2020-01-24  1634  		wmb();
244a92b6cc6f9ae Appana Durga Kedareswara Rao 2020-01-24  1635  =

ee94241b2118ddd Saurabh Sengar               2021-01-22  1636  		cur_p->phy=
s =3D dma_map_single(ndev->dev.parent, new_skb->data,
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1637  					     lp=
->max_frm_size,
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1638  					   DMA_=
FROM_DEVICE);
8bb7c59151794fc Harini Katakam               2022-02-22  1639  		if (unlike=
ly(dma_mapping_error(ndev->dev.parent, cur_p->phys))) {
8bb7c59151794fc Harini Katakam               2022-02-22  1640  			cur_p->ph=
ys =3D 0;
8bb7c59151794fc Harini Katakam               2022-02-22 @1641  			dev_kfree=
_skb(skb);
8bb7c59151794fc Harini Katakam               2022-02-22  1642  			dev_err(l=
p->dev, "RX buffer map failed\n");
8bb7c59151794fc Harini Katakam               2022-02-22  1643  			break;
8bb7c59151794fc Harini Katakam               2022-02-22  1644  		}
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1645  		cur_p->cnt=
rl =3D lp->max_frm_size;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1646  		cur_p->sta=
tus =3D 0;
ee94241b2118ddd Saurabh Sengar               2021-01-22  1647  		cur_p->sw_=
id_offset =3D (phys_addr_t)new_skb;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1648  =

ee94241b2118ddd Saurabh Sengar               2021-01-22  1649  		if (++q->r=
x_bd_ci >=3D lp->rx_bd_num)
ee94241b2118ddd Saurabh Sengar               2021-01-22  1650  			q->rx_bd_=
ci =3D 0;
244a92b6cc6f9ae Appana Durga Kedareswara Rao 2020-01-24  1651  =

244a92b6cc6f9ae Appana Durga Kedareswara Rao 2020-01-24  1652  		/* Get rel=
evat BD status value */
244a92b6cc6f9ae Appana Durga Kedareswara Rao 2020-01-24  1653  		rmb();
ee94241b2118ddd Saurabh Sengar               2021-01-22  1654  #ifdef CONFI=
G_AXIENET_HAS_MCDMA
ee94241b2118ddd Saurabh Sengar               2021-01-22  1655  		cur_p =3D =
&q->rxq_bd_v[q->rx_bd_ci];
ee94241b2118ddd Saurabh Sengar               2021-01-22  1656  #else
ee94241b2118ddd Saurabh Sengar               2021-01-22  1657  		cur_p =3D =
&q->rx_bd_v[q->rx_bd_ci];
ee94241b2118ddd Saurabh Sengar               2021-01-22  1658  #endif
ec9a60a97272571 Appana Durga Kedareswara Rao 2020-01-24  1659  		numbdfree+=
+;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1660  	}
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1661  =

8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1662  	ndev->stats=
.rx_packets +=3D packets;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1663  	ndev->stats=
.rx_bytes +=3D size;
ee94241b2118ddd Saurabh Sengar               2021-01-22  1664  	q->rx_packe=
ts +=3D packets;
ee94241b2118ddd Saurabh Sengar               2021-01-22  1665  	q->rx_bytes=
 +=3D size;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1666  =

ee94241b2118ddd Saurabh Sengar               2021-01-22  1667  	if (tail_p)=
 {
ee94241b2118ddd Saurabh Sengar               2021-01-22  1668  #ifdef CONFI=
G_AXIENET_HAS_MCDMA
ee94241b2118ddd Saurabh Sengar               2021-01-22  1669  		axienet_dm=
a_bdout(q, XMCDMA_CHAN_TAILDESC_OFFSET(q->chan_id) +
ee94241b2118ddd Saurabh Sengar               2021-01-22  1670  				  q->rx_=
offset, tail_p);
ee94241b2118ddd Saurabh Sengar               2021-01-22  1671  #else
ee94241b2118ddd Saurabh Sengar               2021-01-22  1672  		axienet_dm=
a_bdout(q, XAXIDMA_RX_TDESC_OFFSET, tail_p);
ee94241b2118ddd Saurabh Sengar               2021-01-22  1673  #endif
ee94241b2118ddd Saurabh Sengar               2021-01-22  1674  	}
ec9a60a97272571 Appana Durga Kedareswara Rao 2020-01-24  1675  =

ec9a60a97272571 Appana Durga Kedareswara Rao 2020-01-24  1676  	return numb=
dfree;
ec9a60a97272571 Appana Durga Kedareswara Rao 2020-01-24  1677  }
ec9a60a97272571 Appana Durga Kedareswara Rao 2020-01-24  1678  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8676300571038280119==--

