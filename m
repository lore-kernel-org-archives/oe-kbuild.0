Content-Type: multipart/mixed; boundary="===============6704905415978930130=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c:127 t7xx_dpmaif_release_tx_buffer() error: potentially dereferencing uninitialized 'cur_drb'.
Date: Mon, 15 Aug 2022 08:30:33 +0800
Message-ID: <202208150838.JRmdTauQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6704905415978930130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Haijun Liu <haijun.liu@mediatek.com>
CC: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>
CC: Ricardo Martinez <ricardo.martinez@linux.intel.com>
CC: Loic Poulain <loic.poulain@linaro.org>
CC: Sergey Ryazanov <ryazanov.s.a@gmail.com>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   568035b01cfb107af8d2e4bd2fb9aea22cf5b868
commit: d642b012df70a76dd5723f2d426b40bffe83ac49 net: wwan: t7xx: Add data =
path interface
date:   3 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 months ago
config: parisc-randconfig-m031-20220807 (https://download.01.org/0day-ci/ar=
chive/20220815/202208150838.JRmdTauQ-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c:127 t7xx_dpmaif_release_tx_buffe=
r() error: potentially dereferencing uninitialized 'cur_drb'.

vim +/cur_drb +127 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c

d642b012df70a7 Haijun Liu 2022-05-06   78  =

d642b012df70a7 Haijun Liu 2022-05-06   79  static unsigned int t7xx_dpmaif_=
release_tx_buffer(struct dpmaif_ctrl *dpmaif_ctrl,
d642b012df70a7 Haijun Liu 2022-05-06   80  						  unsigned int q_num, unsi=
gned int release_cnt)
d642b012df70a7 Haijun Liu 2022-05-06   81  {
d642b012df70a7 Haijun Liu 2022-05-06   82  	struct dpmaif_tx_queue *txq =3D=
 &dpmaif_ctrl->txq[q_num];
d642b012df70a7 Haijun Liu 2022-05-06   83  	struct dpmaif_callbacks *cb =3D=
 dpmaif_ctrl->callbacks;
d642b012df70a7 Haijun Liu 2022-05-06   84  	struct dpmaif_drb_skb *cur_drb_=
skb, *drb_skb_base;
d642b012df70a7 Haijun Liu 2022-05-06   85  	struct dpmaif_drb *cur_drb, *dr=
b_base;
d642b012df70a7 Haijun Liu 2022-05-06   86  	unsigned int drb_cnt, i, cur_id=
x;
d642b012df70a7 Haijun Liu 2022-05-06   87  	unsigned long flags;
d642b012df70a7 Haijun Liu 2022-05-06   88  =

d642b012df70a7 Haijun Liu 2022-05-06   89  	drb_skb_base =3D txq->drb_skb_b=
ase;
d642b012df70a7 Haijun Liu 2022-05-06   90  	drb_base =3D txq->drb_base;
d642b012df70a7 Haijun Liu 2022-05-06   91  =

d642b012df70a7 Haijun Liu 2022-05-06   92  	spin_lock_irqsave(&txq->tx_lock=
, flags);
d642b012df70a7 Haijun Liu 2022-05-06   93  	drb_cnt =3D txq->drb_size_cnt;
d642b012df70a7 Haijun Liu 2022-05-06   94  	cur_idx =3D txq->drb_release_rd=
_idx;
d642b012df70a7 Haijun Liu 2022-05-06   95  	spin_unlock_irqrestore(&txq->tx=
_lock, flags);
d642b012df70a7 Haijun Liu 2022-05-06   96  =

d642b012df70a7 Haijun Liu 2022-05-06   97  	for (i =3D 0; i < release_cnt; =
i++) {
d642b012df70a7 Haijun Liu 2022-05-06   98  		cur_drb =3D drb_base + cur_idx;
d642b012df70a7 Haijun Liu 2022-05-06   99  		if (FIELD_GET(DRB_HDR_DTYP, le=
32_to_cpu(cur_drb->header)) =3D=3D DES_DTYP_PD) {
d642b012df70a7 Haijun Liu 2022-05-06  100  			cur_drb_skb =3D drb_skb_base =
+ cur_idx;
d642b012df70a7 Haijun Liu 2022-05-06  101  			if (!cur_drb_skb->is_msg)
d642b012df70a7 Haijun Liu 2022-05-06  102  				dma_unmap_single(dpmaif_ctrl=
->dev, cur_drb_skb->bus_addr,
d642b012df70a7 Haijun Liu 2022-05-06  103  						 cur_drb_skb->data_len, DM=
A_TO_DEVICE);
d642b012df70a7 Haijun Liu 2022-05-06  104  =

d642b012df70a7 Haijun Liu 2022-05-06  105  			if (!FIELD_GET(DRB_HDR_CONT, =
le32_to_cpu(cur_drb->header))) {
d642b012df70a7 Haijun Liu 2022-05-06  106  				if (!cur_drb_skb->skb) {
d642b012df70a7 Haijun Liu 2022-05-06  107  					dev_err(dpmaif_ctrl->dev,
d642b012df70a7 Haijun Liu 2022-05-06  108  						"txq%u: DRB check fail, in=
valid skb\n", q_num);
d642b012df70a7 Haijun Liu 2022-05-06  109  					continue;
d642b012df70a7 Haijun Liu 2022-05-06  110  				}
d642b012df70a7 Haijun Liu 2022-05-06  111  =

d642b012df70a7 Haijun Liu 2022-05-06  112  				dev_kfree_skb_any(cur_drb_sk=
b->skb);
d642b012df70a7 Haijun Liu 2022-05-06  113  			}
d642b012df70a7 Haijun Liu 2022-05-06  114  =

d642b012df70a7 Haijun Liu 2022-05-06  115  			cur_drb_skb->skb =3D NULL;
d642b012df70a7 Haijun Liu 2022-05-06  116  		}
d642b012df70a7 Haijun Liu 2022-05-06  117  =

d642b012df70a7 Haijun Liu 2022-05-06  118  		spin_lock_irqsave(&txq->tx_loc=
k, flags);
d642b012df70a7 Haijun Liu 2022-05-06  119  		cur_idx =3D t7xx_ring_buf_get_=
next_wr_idx(drb_cnt, cur_idx);
d642b012df70a7 Haijun Liu 2022-05-06  120  		txq->drb_release_rd_idx =3D cu=
r_idx;
d642b012df70a7 Haijun Liu 2022-05-06  121  		spin_unlock_irqrestore(&txq->t=
x_lock, flags);
d642b012df70a7 Haijun Liu 2022-05-06  122  =

d642b012df70a7 Haijun Liu 2022-05-06  123  		if (atomic_inc_return(&txq->tx=
_budget) > txq->drb_size_cnt / 8)
d642b012df70a7 Haijun Liu 2022-05-06  124  			cb->state_notify(dpmaif_ctrl-=
>t7xx_dev, DMPAIF_TXQ_STATE_IRQ, txq->index);
d642b012df70a7 Haijun Liu 2022-05-06  125  	}
d642b012df70a7 Haijun Liu 2022-05-06  126  =

d642b012df70a7 Haijun Liu 2022-05-06 @127  	if (FIELD_GET(DRB_HDR_CONT, le3=
2_to_cpu(cur_drb->header)))
d642b012df70a7 Haijun Liu 2022-05-06  128  		dev_err(dpmaif_ctrl->dev, "txq=
%u: DRB not marked as the last one\n", q_num);
d642b012df70a7 Haijun Liu 2022-05-06  129  =

d642b012df70a7 Haijun Liu 2022-05-06  130  	return i;
d642b012df70a7 Haijun Liu 2022-05-06  131  }
d642b012df70a7 Haijun Liu 2022-05-06  132  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6704905415978930130==--

