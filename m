Content-Type: multipart/mixed; boundary="===============2843848895836447860=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c:55 hns3_dbg_queue_info() warn: potential spectre issue 'priv->ring'
Date: Fri, 12 Jun 2020 19:02:07 +0800
Message-ID: <202006121903.Aq4H2scI%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2843848895836447860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Yunsheng Lin <linyunsheng@huawei.com>
CC: Huazhong Tan <tanhuazhong@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b791d1bdf9212d944d749a5c7ff6febdba241771
commit: 5f06b903cb0b85194e66675267b565d40a22026c net: hns3: remove struct h=
ns3_nic_ring_data in hns3_enet module
date:   8 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 months ago
config: powerpc64-randconfig-m031-20200612 (attached as .config)
compiler: powerpc64le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c:55 hns3_dbg_queue_info()=
 warn: potential spectre issue 'priv->ring' [r]
drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c:179 hns3_dbg_bd_info() w=
arn: potential spectre issue 'priv->ring' [r] (local cap)

Old smatch warnings:
drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c:189 hns3_dbg_bd_info() w=
arn: potential spectre issue 'ring->desc' [r] (local cap)

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D5f06b903cb0b85194e66675267b565d40a22026c
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout 5f06b903cb0b85194e66675267b565d40a22026c
vim +55 drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c

b2292360bb2ae5 liuzhongzhu    2018-11-22   14  =

ebaf1908772e05 Weihang Li     2019-06-13   15  static int hns3_dbg_queue_in=
fo(struct hnae3_handle *h,
ebaf1908772e05 Weihang Li     2019-06-13   16  			       const char *cmd_bu=
f)
57ceee2ca71c65 liuzhongzhu    2018-11-22   17  {
57ceee2ca71c65 liuzhongzhu    2018-11-22   18  	struct hns3_nic_priv *priv =
=3D h->priv;
57ceee2ca71c65 liuzhongzhu    2018-11-22   19  	struct hns3_enet_ring *ring;
57ceee2ca71c65 liuzhongzhu    2018-11-22   20  	u32 base_add_l, base_add_h;
57ceee2ca71c65 liuzhongzhu    2018-11-22   21  	u32 queue_num, queue_max;
57ceee2ca71c65 liuzhongzhu    2018-11-22   22  	u32 value, i =3D 0;
57ceee2ca71c65 liuzhongzhu    2018-11-22   23  	int cnt;
57ceee2ca71c65 liuzhongzhu    2018-11-22   24  =

5f06b903cb0b85 Yunsheng Lin   2019-10-19   25  	if (!priv->ring) {
5f06b903cb0b85 Yunsheng Lin   2019-10-19   26  		dev_err(&h->pdev->dev, "pr=
iv->ring is NULL\n");
57ceee2ca71c65 liuzhongzhu    2018-11-22   27  		return -EFAULT;
57ceee2ca71c65 liuzhongzhu    2018-11-22   28  	}
57ceee2ca71c65 liuzhongzhu    2018-11-22   29  =

57ceee2ca71c65 liuzhongzhu    2018-11-22   30  	queue_max =3D h->kinfo.num_=
tqps;
57ceee2ca71c65 liuzhongzhu    2018-11-22   31  	cnt =3D kstrtouint(&cmd_buf=
[11], 0, &queue_num);
57ceee2ca71c65 liuzhongzhu    2018-11-22   32  	if (cnt)
57ceee2ca71c65 liuzhongzhu    2018-11-22   33  		queue_num =3D 0;
57ceee2ca71c65 liuzhongzhu    2018-11-22   34  	else
57ceee2ca71c65 liuzhongzhu    2018-11-22   35  		queue_max =3D queue_num + =
1;
57ceee2ca71c65 liuzhongzhu    2018-11-22   36  =

57ceee2ca71c65 liuzhongzhu    2018-11-22   37  	dev_info(&h->pdev->dev, "qu=
eue info\n");
57ceee2ca71c65 liuzhongzhu    2018-11-22   38  =

57ceee2ca71c65 liuzhongzhu    2018-11-22   39  	if (queue_num >=3D h->kinfo=
.num_tqps) {
57ceee2ca71c65 liuzhongzhu    2018-11-22   40  		dev_err(&h->pdev->dev,
ed5b255ba679a2 Yufeng Mo      2019-08-28   41  			"Queue number(%u) is out =
of range(0-%u)\n", queue_num,
57ceee2ca71c65 liuzhongzhu    2018-11-22   42  			h->kinfo.num_tqps - 1);
57ceee2ca71c65 liuzhongzhu    2018-11-22   43  		return -EINVAL;
57ceee2ca71c65 liuzhongzhu    2018-11-22   44  	}
57ceee2ca71c65 liuzhongzhu    2018-11-22   45  =

57ceee2ca71c65 liuzhongzhu    2018-11-22   46  	for (i =3D queue_num; i < q=
ueue_max; i++) {
57ceee2ca71c65 liuzhongzhu    2018-11-22   47  		/* Each cycle needs to det=
ermine whether the instance is reset,
57ceee2ca71c65 liuzhongzhu    2018-11-22   48  		 * to prevent reference to=
 invalid memory. And need to ensure
57ceee2ca71c65 liuzhongzhu    2018-11-22   49  		 * that the following code=
 is executed within 100ms.
57ceee2ca71c65 liuzhongzhu    2018-11-22   50  		 */
7737f1fbb5ba15 liuzhongzhu    2018-12-15   51  		if (!test_bit(HNS3_NIC_STA=
TE_INITED, &priv->state) ||
57ceee2ca71c65 liuzhongzhu    2018-11-22   52  		    test_bit(HNS3_NIC_STAT=
E_RESETTING, &priv->state))
57ceee2ca71c65 liuzhongzhu    2018-11-22   53  			return -EPERM;
57ceee2ca71c65 liuzhongzhu    2018-11-22   54  =

5f06b903cb0b85 Yunsheng Lin   2019-10-19  @55  		ring =3D &priv->ring[(u32)=
(i + h->kinfo.num_tqps)];
57ceee2ca71c65 liuzhongzhu    2018-11-22   56  		base_add_h =3D readl_relax=
ed(ring->tqp->io_base +
57ceee2ca71c65 liuzhongzhu    2018-11-22   57  					   HNS3_RING_RX_RING_BA=
SEADDR_H_REG);
57ceee2ca71c65 liuzhongzhu    2018-11-22   58  		base_add_l =3D readl_relax=
ed(ring->tqp->io_base +
57ceee2ca71c65 liuzhongzhu    2018-11-22   59  					   HNS3_RING_RX_RING_BA=
SEADDR_L_REG);
57ceee2ca71c65 liuzhongzhu    2018-11-22   60  		dev_info(&h->pdev->dev, "R=
X(%d) BASE ADD: 0x%08x%08x\n", i,
57ceee2ca71c65 liuzhongzhu    2018-11-22   61  			 base_add_h, base_add_l);
57ceee2ca71c65 liuzhongzhu    2018-11-22   62  =

57ceee2ca71c65 liuzhongzhu    2018-11-22   63  		value =3D readl_relaxed(ri=
ng->tqp->io_base +
57ceee2ca71c65 liuzhongzhu    2018-11-22   64  				      HNS3_RING_RX_RING_=
BD_NUM_REG);
57ceee2ca71c65 liuzhongzhu    2018-11-22   65  		dev_info(&h->pdev->dev, "R=
X(%d) RING BD NUM: %u\n", i, value);
57ceee2ca71c65 liuzhongzhu    2018-11-22   66  =

57ceee2ca71c65 liuzhongzhu    2018-11-22   67  		value =3D readl_relaxed(ri=
ng->tqp->io_base +
57ceee2ca71c65 liuzhongzhu    2018-11-22   68  				      HNS3_RING_RX_RING_=
BD_LEN_REG);
57ceee2ca71c65 liuzhongzhu    2018-11-22   69  		dev_info(&h->pdev->dev, "R=
X(%d) RING BD LEN: %u\n", i, value);
57ceee2ca71c65 liuzhongzhu    2018-11-22   70  =

57ceee2ca71c65 liuzhongzhu    2018-11-22   71  		value =3D readl_relaxed(ri=
ng->tqp->io_base +
57ceee2ca71c65 liuzhongzhu    2018-11-22   72  				      HNS3_RING_RX_RING_=
TAIL_REG);
57ceee2ca71c65 liuzhongzhu    2018-11-22   73  		dev_info(&h->pdev->dev, "R=
X(%d) RING TAIL: %u\n", i, value);
57ceee2ca71c65 liuzhongzhu    2018-11-22   74  =

57ceee2ca71c65 liuzhongzhu    2018-11-22   75  		value =3D readl_relaxed(ri=
ng->tqp->io_base +
57ceee2ca71c65 liuzhongzhu    2018-11-22   76  				      HNS3_RING_RX_RING_=
HEAD_REG);
57ceee2ca71c65 liuzhongzhu    2018-11-22   77  		dev_info(&h->pdev->dev, "R=
X(%d) RING HEAD: %u\n", i, value);
57ceee2ca71c65 liuzhongzhu    2018-11-22   78  =

57ceee2ca71c65 liuzhongzhu    2018-11-22   79  		value =3D readl_relaxed(ri=
ng->tqp->io_base +
57ceee2ca71c65 liuzhongzhu    2018-11-22   80  				      HNS3_RING_RX_RING_=
FBDNUM_REG);
57ceee2ca71c65 liuzhongzhu    2018-11-22   81  		dev_info(&h->pdev->dev, "R=
X(%d) RING FBDNUM: %u\n", i, value);
57ceee2ca71c65 liuzhongzhu    2018-11-22   82  =

57ceee2ca71c65 liuzhongzhu    2018-11-22   83  		value =3D readl_relaxed(ri=
ng->tqp->io_base +
57ceee2ca71c65 liuzhongzhu    2018-11-22   84  				      HNS3_RING_RX_RING_=
PKTNUM_RECORD_REG);
57ceee2ca71c65 liuzhongzhu    2018-11-22   85  		dev_info(&h->pdev->dev, "R=
X(%d) RING PKTNUM: %u\n", i, value);
57ceee2ca71c65 liuzhongzhu    2018-11-22   86  =

5f06b903cb0b85 Yunsheng Lin   2019-10-19   87  		ring =3D &priv->ring[i];
57ceee2ca71c65 liuzhongzhu    2018-11-22   88  		base_add_h =3D readl_relax=
ed(ring->tqp->io_base +
57ceee2ca71c65 liuzhongzhu    2018-11-22   89  					   HNS3_RING_TX_RING_BA=
SEADDR_H_REG);
57ceee2ca71c65 liuzhongzhu    2018-11-22   90  		base_add_l =3D readl_relax=
ed(ring->tqp->io_base +
57ceee2ca71c65 liuzhongzhu    2018-11-22   91  					   HNS3_RING_TX_RING_BA=
SEADDR_L_REG);
57ceee2ca71c65 liuzhongzhu    2018-11-22   92  		dev_info(&h->pdev->dev, "T=
X(%d) BASE ADD: 0x%08x%08x\n", i,
57ceee2ca71c65 liuzhongzhu    2018-11-22   93  			 base_add_h, base_add_l);
57ceee2ca71c65 liuzhongzhu    2018-11-22   94  =

57ceee2ca71c65 liuzhongzhu    2018-11-22   95  		value =3D readl_relaxed(ri=
ng->tqp->io_base +
57ceee2ca71c65 liuzhongzhu    2018-11-22   96  				      HNS3_RING_TX_RING_=
BD_NUM_REG);
57ceee2ca71c65 liuzhongzhu    2018-11-22   97  		dev_info(&h->pdev->dev, "T=
X(%d) RING BD NUM: %u\n", i, value);
57ceee2ca71c65 liuzhongzhu    2018-11-22   98  =

57ceee2ca71c65 liuzhongzhu    2018-11-22   99  		value =3D readl_relaxed(ri=
ng->tqp->io_base +
57ceee2ca71c65 liuzhongzhu    2018-11-22  100  				      HNS3_RING_TX_RING_=
TC_REG);
57ceee2ca71c65 liuzhongzhu    2018-11-22  101  		dev_info(&h->pdev->dev, "T=
X(%d) RING TC: %u\n", i, value);
57ceee2ca71c65 liuzhongzhu    2018-11-22  102  =

57ceee2ca71c65 liuzhongzhu    2018-11-22  103  		value =3D readl_relaxed(ri=
ng->tqp->io_base +
57ceee2ca71c65 liuzhongzhu    2018-11-22  104  				      HNS3_RING_TX_RING_=
TAIL_REG);
57ceee2ca71c65 liuzhongzhu    2018-11-22  105  		dev_info(&h->pdev->dev, "T=
X(%d) RING TAIL: %u\n", i, value);
57ceee2ca71c65 liuzhongzhu    2018-11-22  106  =

57ceee2ca71c65 liuzhongzhu    2018-11-22  107  		value =3D readl_relaxed(ri=
ng->tqp->io_base +
57ceee2ca71c65 liuzhongzhu    2018-11-22  108  				      HNS3_RING_TX_RING_=
HEAD_REG);
57ceee2ca71c65 liuzhongzhu    2018-11-22  109  		dev_info(&h->pdev->dev, "T=
X(%d) RING HEAD: %u\n", i, value);
57ceee2ca71c65 liuzhongzhu    2018-11-22  110  =

57ceee2ca71c65 liuzhongzhu    2018-11-22  111  		value =3D readl_relaxed(ri=
ng->tqp->io_base +
57ceee2ca71c65 liuzhongzhu    2018-11-22  112  				      HNS3_RING_TX_RING_=
FBDNUM_REG);
57ceee2ca71c65 liuzhongzhu    2018-11-22  113  		dev_info(&h->pdev->dev, "T=
X(%d) RING FBDNUM: %u\n", i, value);
57ceee2ca71c65 liuzhongzhu    2018-11-22  114  =

57ceee2ca71c65 liuzhongzhu    2018-11-22  115  		value =3D readl_relaxed(ri=
ng->tqp->io_base +
57ceee2ca71c65 liuzhongzhu    2018-11-22  116  				      HNS3_RING_TX_RING_=
OFFSET_REG);
57ceee2ca71c65 liuzhongzhu    2018-11-22  117  		dev_info(&h->pdev->dev, "T=
X(%d) RING OFFSET: %u\n", i, value);
57ceee2ca71c65 liuzhongzhu    2018-11-22  118  =

57ceee2ca71c65 liuzhongzhu    2018-11-22  119  		value =3D readl_relaxed(ri=
ng->tqp->io_base +
57ceee2ca71c65 liuzhongzhu    2018-11-22  120  				      HNS3_RING_TX_RING_=
PKTNUM_RECORD_REG);
57ceee2ca71c65 liuzhongzhu    2018-11-22  121  		dev_info(&h->pdev->dev, "T=
X(%d) RING PKTNUM: %u\n\n", i,
57ceee2ca71c65 liuzhongzhu    2018-11-22  122  			 value);
57ceee2ca71c65 liuzhongzhu    2018-11-22  123  	}
57ceee2ca71c65 liuzhongzhu    2018-11-22  124  =

57ceee2ca71c65 liuzhongzhu    2018-11-22  125  	return 0;
57ceee2ca71c65 liuzhongzhu    2018-11-22  126  }
57ceee2ca71c65 liuzhongzhu    2018-11-22  127  =

0c29d1912b81a0 liuzhongzhu    2018-12-15  128  static int hns3_dbg_queue_ma=
p(struct hnae3_handle *h)
0c29d1912b81a0 liuzhongzhu    2018-12-15  129  {
0c29d1912b81a0 liuzhongzhu    2018-12-15  130  	struct hns3_nic_priv *priv =
=3D h->priv;
0c29d1912b81a0 liuzhongzhu    2018-12-15  131  	int i;
0c29d1912b81a0 liuzhongzhu    2018-12-15  132  =

0c29d1912b81a0 liuzhongzhu    2018-12-15  133  	if (!h->ae_algo->ops->get_g=
lobal_queue_id)
0c29d1912b81a0 liuzhongzhu    2018-12-15  134  		return -EOPNOTSUPP;
0c29d1912b81a0 liuzhongzhu    2018-12-15  135  =

0c29d1912b81a0 liuzhongzhu    2018-12-15  136  	dev_info(&h->pdev->dev, "ma=
p info for queue id and vector id\n");
0c29d1912b81a0 liuzhongzhu    2018-12-15  137  	dev_info(&h->pdev->dev,
0c29d1912b81a0 liuzhongzhu    2018-12-15  138  		 "local queue id | global =
queue id | vector id\n");
0c29d1912b81a0 liuzhongzhu    2018-12-15  139  	for (i =3D 0; i < h->kinfo.=
num_tqps; i++) {
0c29d1912b81a0 liuzhongzhu    2018-12-15  140  		u16 global_qid;
0c29d1912b81a0 liuzhongzhu    2018-12-15  141  =

0c29d1912b81a0 liuzhongzhu    2018-12-15  142  		global_qid =3D h->ae_algo-=
>ops->get_global_queue_id(h, i);
5f06b903cb0b85 Yunsheng Lin   2019-10-19  143  		if (!priv->ring || !priv->=
ring[i].tqp_vector)
0c29d1912b81a0 liuzhongzhu    2018-12-15  144  			continue;
0c29d1912b81a0 liuzhongzhu    2018-12-15  145  =

0c29d1912b81a0 liuzhongzhu    2018-12-15  146  		dev_info(&h->pdev->dev,
0c29d1912b81a0 liuzhongzhu    2018-12-15  147  			 "      %4d            %4=
d            %4d\n",
5f06b903cb0b85 Yunsheng Lin   2019-10-19  148  			 i, global_qid, priv->rin=
g[i].tqp_vector->vector_irq);
0c29d1912b81a0 liuzhongzhu    2018-12-15  149  	}
0c29d1912b81a0 liuzhongzhu    2018-12-15  150  =

0c29d1912b81a0 liuzhongzhu    2018-12-15  151  	return 0;
0c29d1912b81a0 liuzhongzhu    2018-12-15  152  }
0c29d1912b81a0 liuzhongzhu    2018-12-15  153  =

ebaf1908772e05 Weihang Li     2019-06-13  154  static int hns3_dbg_bd_info(=
struct hnae3_handle *h, const char *cmd_buf)
122bedc56a6c4f liuzhongzhu    2018-12-15  155  {
122bedc56a6c4f liuzhongzhu    2018-12-15  156  	struct hns3_nic_priv *priv =
=3D h->priv;
122bedc56a6c4f liuzhongzhu    2018-12-15  157  	struct hns3_desc *rx_desc, =
*tx_desc;
122bedc56a6c4f liuzhongzhu    2018-12-15  158  	struct device *dev =3D &h->=
pdev->dev;
122bedc56a6c4f liuzhongzhu    2018-12-15  159  	struct hns3_enet_ring *ring;
122bedc56a6c4f liuzhongzhu    2018-12-15  160  	u32 tx_index, rx_index;
122bedc56a6c4f liuzhongzhu    2018-12-15  161  	u32 q_num, value;
96e65abb770027 Guangbin Huang 2019-09-11  162  	dma_addr_t addr;
122bedc56a6c4f liuzhongzhu    2018-12-15  163  	int cnt;
122bedc56a6c4f liuzhongzhu    2018-12-15  164  =

122bedc56a6c4f liuzhongzhu    2018-12-15  165  	cnt =3D sscanf(&cmd_buf[8],=
 "%u %u", &q_num, &tx_index);
122bedc56a6c4f liuzhongzhu    2018-12-15  166  	if (cnt =3D=3D 2) {
122bedc56a6c4f liuzhongzhu    2018-12-15  167  		rx_index =3D tx_index;
122bedc56a6c4f liuzhongzhu    2018-12-15  168  	} else if (cnt !=3D 1) {
122bedc56a6c4f liuzhongzhu    2018-12-15  169  		dev_err(dev, "bd info: bad=
 command string, cnt=3D%d\n", cnt);
122bedc56a6c4f liuzhongzhu    2018-12-15  170  		return -EINVAL;
122bedc56a6c4f liuzhongzhu    2018-12-15  171  	}
122bedc56a6c4f liuzhongzhu    2018-12-15  172  =

122bedc56a6c4f liuzhongzhu    2018-12-15  173  	if (q_num >=3D h->kinfo.num=
_tqps) {
ed5b255ba679a2 Yufeng Mo      2019-08-28  174  		dev_err(dev, "Queue number=
(%u) is out of range(0-%u)\n", q_num,
122bedc56a6c4f liuzhongzhu    2018-12-15  175  			h->kinfo.num_tqps - 1);
122bedc56a6c4f liuzhongzhu    2018-12-15  176  		return -EINVAL;
122bedc56a6c4f liuzhongzhu    2018-12-15  177  	}
122bedc56a6c4f liuzhongzhu    2018-12-15  178  =

5f06b903cb0b85 Yunsheng Lin   2019-10-19 @179  	ring  =3D &priv->ring[q_num=
];
122bedc56a6c4f liuzhongzhu    2018-12-15  180  	value =3D readl_relaxed(rin=
g->tqp->io_base + HNS3_RING_TX_RING_TAIL_REG);
122bedc56a6c4f liuzhongzhu    2018-12-15  181  	tx_index =3D (cnt =3D=3D 1)=
 ? value : tx_index;
122bedc56a6c4f liuzhongzhu    2018-12-15  182  =

122bedc56a6c4f liuzhongzhu    2018-12-15  183  	if (tx_index >=3D ring->des=
c_num) {
ed5b255ba679a2 Yufeng Mo      2019-08-28  184  		dev_err(dev, "bd index(%u)=
 is out of range(0-%u)\n", tx_index,
122bedc56a6c4f liuzhongzhu    2018-12-15  185  			ring->desc_num - 1);
122bedc56a6c4f liuzhongzhu    2018-12-15  186  		return -EINVAL;
122bedc56a6c4f liuzhongzhu    2018-12-15  187  	}
122bedc56a6c4f liuzhongzhu    2018-12-15  188  =

122bedc56a6c4f liuzhongzhu    2018-12-15  189  	tx_desc =3D &ring->desc[tx_=
index];
96e65abb770027 Guangbin Huang 2019-09-11  190  	addr =3D le64_to_cpu(tx_des=
c->addr);
122bedc56a6c4f liuzhongzhu    2018-12-15  191  	dev_info(dev, "TX Queue Num=
: %u, BD Index: %u\n", q_num, tx_index);
96e65abb770027 Guangbin Huang 2019-09-11  192  	dev_info(dev, "(TX)addr: %p=
ad\n", &addr);
122bedc56a6c4f liuzhongzhu    2018-12-15  193  	dev_info(dev, "(TX)vlan_tag=
: %u\n", tx_desc->tx.vlan_tag);
122bedc56a6c4f liuzhongzhu    2018-12-15  194  	dev_info(dev, "(TX)send_siz=
e: %u\n", tx_desc->tx.send_size);
122bedc56a6c4f liuzhongzhu    2018-12-15  195  	dev_info(dev, "(TX)vlan_tso=
: %u\n", tx_desc->tx.type_cs_vlan_tso);
122bedc56a6c4f liuzhongzhu    2018-12-15  196  	dev_info(dev, "(TX)l2_len: =
%u\n", tx_desc->tx.l2_len);
122bedc56a6c4f liuzhongzhu    2018-12-15  197  	dev_info(dev, "(TX)l3_len: =
%u\n", tx_desc->tx.l3_len);
122bedc56a6c4f liuzhongzhu    2018-12-15  198  	dev_info(dev, "(TX)l4_len: =
%u\n", tx_desc->tx.l4_len);
122bedc56a6c4f liuzhongzhu    2018-12-15  199  	dev_info(dev, "(TX)vlan_tag=
: %u\n", tx_desc->tx.outer_vlan_tag);
122bedc56a6c4f liuzhongzhu    2018-12-15  200  	dev_info(dev, "(TX)tv: %u\n=
", tx_desc->tx.tv);
122bedc56a6c4f liuzhongzhu    2018-12-15  201  	dev_info(dev, "(TX)vlan_mse=
c: %u\n", tx_desc->tx.ol_type_vlan_msec);
122bedc56a6c4f liuzhongzhu    2018-12-15  202  	dev_info(dev, "(TX)ol2_len:=
 %u\n", tx_desc->tx.ol2_len);
122bedc56a6c4f liuzhongzhu    2018-12-15  203  	dev_info(dev, "(TX)ol3_len:=
 %u\n", tx_desc->tx.ol3_len);
122bedc56a6c4f liuzhongzhu    2018-12-15  204  	dev_info(dev, "(TX)ol4_len:=
 %u\n", tx_desc->tx.ol4_len);
122bedc56a6c4f liuzhongzhu    2018-12-15  205  	dev_info(dev, "(TX)paylen: =
%u\n", tx_desc->tx.paylen);
122bedc56a6c4f liuzhongzhu    2018-12-15  206  	dev_info(dev, "(TX)vld_ra_r=
i: %u\n", tx_desc->tx.bdtp_fe_sc_vld_ra_ri);
122bedc56a6c4f liuzhongzhu    2018-12-15  207  	dev_info(dev, "(TX)mss: %u\=
n", tx_desc->tx.mss);
122bedc56a6c4f liuzhongzhu    2018-12-15  208  =

5f06b903cb0b85 Yunsheng Lin   2019-10-19  209  	ring  =3D &priv->ring[q_num=
 + h->kinfo.num_tqps];
122bedc56a6c4f liuzhongzhu    2018-12-15  210  	value =3D readl_relaxed(rin=
g->tqp->io_base + HNS3_RING_RX_RING_TAIL_REG);
122bedc56a6c4f liuzhongzhu    2018-12-15  211  	rx_index =3D (cnt =3D=3D 1)=
 ? value : tx_index;
122bedc56a6c4f liuzhongzhu    2018-12-15  212  	rx_desc	 =3D &ring->desc[rx=
_index];
122bedc56a6c4f liuzhongzhu    2018-12-15  213  =

96e65abb770027 Guangbin Huang 2019-09-11  214  	addr =3D le64_to_cpu(rx_des=
c->addr);
122bedc56a6c4f liuzhongzhu    2018-12-15  215  	dev_info(dev, "RX Queue Num=
: %u, BD Index: %u\n", q_num, rx_index);
96e65abb770027 Guangbin Huang 2019-09-11  216  	dev_info(dev, "(RX)addr: %p=
ad\n", &addr);
ed5b255ba679a2 Yufeng Mo      2019-08-28  217  	dev_info(dev, "(RX)l234_inf=
o: %u\n", rx_desc->rx.l234_info);
122bedc56a6c4f liuzhongzhu    2018-12-15  218  	dev_info(dev, "(RX)pkt_len:=
 %u\n", rx_desc->rx.pkt_len);
122bedc56a6c4f liuzhongzhu    2018-12-15  219  	dev_info(dev, "(RX)size: %u=
\n", rx_desc->rx.size);
122bedc56a6c4f liuzhongzhu    2018-12-15  220  	dev_info(dev, "(RX)rss_hash=
: %u\n", rx_desc->rx.rss_hash);
122bedc56a6c4f liuzhongzhu    2018-12-15  221  	dev_info(dev, "(RX)fd_id: %=
u\n", rx_desc->rx.fd_id);
122bedc56a6c4f liuzhongzhu    2018-12-15  222  	dev_info(dev, "(RX)vlan_tag=
: %u\n", rx_desc->rx.vlan_tag);
122bedc56a6c4f liuzhongzhu    2018-12-15  223  	dev_info(dev, "(RX)o_dm_vla=
n_id_fb: %u\n", rx_desc->rx.o_dm_vlan_id_fb);
122bedc56a6c4f liuzhongzhu    2018-12-15  224  	dev_info(dev, "(RX)ot_vlan_=
tag: %u\n", rx_desc->rx.ot_vlan_tag);
122bedc56a6c4f liuzhongzhu    2018-12-15  225  	dev_info(dev, "(RX)bd_base_=
info: %u\n", rx_desc->rx.bd_base_info);
122bedc56a6c4f liuzhongzhu    2018-12-15  226  =

122bedc56a6c4f liuzhongzhu    2018-12-15  227  	return 0;
122bedc56a6c4f liuzhongzhu    2018-12-15  228  }
122bedc56a6c4f liuzhongzhu    2018-12-15  229  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2843848895836447860==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============2843848895836447860==--

