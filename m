Content-Type: multipart/mixed; boundary="===============5828147860359253978=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next 05/18] gve: Add Gvnic stats AQ command and ethtool show/set-priv-flags.
Date: Fri, 21 Aug 2020 02:59:10 +0800
Message-ID: <202008210239.0PMNcBRa%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5828147860359253978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200818194417.2003932-6-awogbemila@google.com>
References: <20200818194417.2003932-6-awogbemila@google.com>
TO: David Awogbemila <awogbemila@google.com>
TO: netdev(a)vger.kernel.org
CC: Kuo Zhao <kuozhao@google.com>
CC: Yangchun Fu <yangchun@google.com>
CC: David Awogbemila <awogbemila@google.com>

Hi David,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/David-Awogbemila/GVE-Drive=
r-v1-1-0-Features/20200819-034639
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
bfdd5aaa54b0a44d9df550fe4c9db7e1470a11b8
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001-20200820 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/google/gve/gve_ethtool.c:331 gve_get_ethtool_stats() w=
arn: we never enter this loop

# https://github.com/0day-ci/linux/commit/e0120fadf9a1ed059d6fdc06980f3f428=
9aacdfc
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review David-Awogbemila/GVE-Driver-v1-1-0-Feature=
s/20200819-034639
git checkout e0120fadf9a1ed059d6fdc06980f3f4289aacdfc
vim +331 drivers/net/ethernet/google/gve/gve_ethtool.c

e5b845dc79838e1 Catherine Sullivan 2019-07-01  134  =

e5b845dc79838e1 Catherine Sullivan 2019-07-01  135  static void
e5b845dc79838e1 Catherine Sullivan 2019-07-01  136  gve_get_ethtool_stats(s=
truct net_device *netdev,
e5b845dc79838e1 Catherine Sullivan 2019-07-01  137  		      struct ethtool_=
stats *stats, u64 *data)
e5b845dc79838e1 Catherine Sullivan 2019-07-01  138  {
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  139  	u64 rx_pkts, rx_bytes,=
 rx_skb_alloc_fail, rx_buf_alloc_fail,
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  140  		rx_desc_err_dropped_p=
kt, tx_pkts,
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  141  		tx_bytes;
f26405b8d9ba771 Kuo Zhao           2020-08-18  142  	u64 tmp_rx_pkts, tmp_r=
x_bytes, tmp_rx_skb_alloc_fail,
f26405b8d9ba771 Kuo Zhao           2020-08-18  143  		tmp_rx_buf_alloc_fail=
, tmp_rx_desc_err_dropped_pkt,
f26405b8d9ba771 Kuo Zhao           2020-08-18  144  		tmp_tx_pkts, tmp_tx_b=
ytes;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  145  	int stats_idx, base_st=
ats_idx, max_stats_idx;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  146  	struct gve_priv *priv =
=3D netdev_priv(netdev);
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  147  	struct stats *report_s=
tats;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  148  	int *rx_qid_to_stats_i=
dx;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  149  	int *tx_qid_to_stats_i=
dx;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  150  	bool skip_nic_stats;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  151  	unsigned int start;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  152  	int ring;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  153  	int i, j;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  154  =

e5b845dc79838e1 Catherine Sullivan 2019-07-01  155  	ASSERT_RTNL();
e5b845dc79838e1 Catherine Sullivan 2019-07-01  156  =

e0120fadf9a1ed0 Kuo Zhao           2020-08-18  157  	report_stats =3D priv-=
>stats_report->stats;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  158  	rx_qid_to_stats_idx =
=3D kmalloc_array(priv->rx_cfg.num_queues,
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  159  					    sizeof(int), G=
FP_KERNEL);
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  160  	if (!rx_qid_to_stats_i=
dx)
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  161  		return;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  162  	tx_qid_to_stats_idx =
=3D kmalloc_array(priv->tx_cfg.num_queues,
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  163  					    sizeof(int), G=
FP_KERNEL);
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  164  	if (!tx_qid_to_stats_i=
dx) {
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  165  		kfree(rx_qid_to_stats=
_idx);
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  166  		return;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  167  	}
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  168  =

f26405b8d9ba771 Kuo Zhao           2020-08-18  169  	for (rx_pkts =3D 0, rx=
_bytes =3D 0, rx_skb_alloc_fail =3D 0,
f26405b8d9ba771 Kuo Zhao           2020-08-18  170  	     rx_buf_alloc_fail=
 =3D 0, rx_desc_err_dropped_pkt =3D 0, ring =3D 0;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  171  	     ring < priv->rx_c=
fg.num_queues; ring++) {
e5b845dc79838e1 Catherine Sullivan 2019-07-01  172  		if (priv->rx) {
e5b845dc79838e1 Catherine Sullivan 2019-07-01  173  			do {
f26405b8d9ba771 Kuo Zhao           2020-08-18  174  				struct gve_rx_ring =
*rx =3D &priv->rx[ring];
3c13ce74b6f885c Catherine Sullivan 2019-07-02  175  				start =3D
e5b845dc79838e1 Catherine Sullivan 2019-07-01  176  				  u64_stats_fetch_b=
egin(&priv->rx[ring].statss);
f26405b8d9ba771 Kuo Zhao           2020-08-18  177  				tmp_rx_pkts =3D rx-=
>rpackets;
f26405b8d9ba771 Kuo Zhao           2020-08-18  178  				tmp_rx_bytes =3D rx=
->rbytes;
f26405b8d9ba771 Kuo Zhao           2020-08-18  179  				tmp_rx_skb_alloc_fa=
il =3D rx->rx_skb_alloc_fail;
f26405b8d9ba771 Kuo Zhao           2020-08-18  180  				tmp_rx_buf_alloc_fa=
il =3D rx->rx_buf_alloc_fail;
f26405b8d9ba771 Kuo Zhao           2020-08-18  181  				tmp_rx_desc_err_dro=
pped_pkt =3D
f26405b8d9ba771 Kuo Zhao           2020-08-18  182  					rx->rx_desc_err_dr=
opped_pkt;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  183  			} while (u64_stats_f=
etch_retry(&priv->rx[ring].statss,
e5b845dc79838e1 Catherine Sullivan 2019-07-01  184  						       start));
f26405b8d9ba771 Kuo Zhao           2020-08-18  185  			rx_pkts +=3D tmp_rx_=
pkts;
f26405b8d9ba771 Kuo Zhao           2020-08-18  186  			rx_bytes +=3D tmp_rx=
_bytes;
f26405b8d9ba771 Kuo Zhao           2020-08-18  187  			rx_skb_alloc_fail +=
=3D tmp_rx_skb_alloc_fail;
f26405b8d9ba771 Kuo Zhao           2020-08-18  188  			rx_buf_alloc_fail +=
=3D tmp_rx_buf_alloc_fail;
f26405b8d9ba771 Kuo Zhao           2020-08-18  189  			rx_desc_err_dropped_=
pkt +=3D tmp_rx_desc_err_dropped_pkt;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  190  		}
e5b845dc79838e1 Catherine Sullivan 2019-07-01  191  	}
e5b845dc79838e1 Catherine Sullivan 2019-07-01  192  	for (tx_pkts =3D 0, tx=
_bytes =3D 0, ring =3D 0;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  193  	     ring < priv->tx_c=
fg.num_queues; ring++) {
e5b845dc79838e1 Catherine Sullivan 2019-07-01  194  		if (priv->tx) {
e5b845dc79838e1 Catherine Sullivan 2019-07-01  195  			do {
3c13ce74b6f885c Catherine Sullivan 2019-07-02  196  				start =3D
e5b845dc79838e1 Catherine Sullivan 2019-07-01  197  				  u64_stats_fetch_b=
egin(&priv->tx[ring].statss);
f26405b8d9ba771 Kuo Zhao           2020-08-18  198  				tmp_tx_pkts =3D pri=
v->tx[ring].pkt_done;
f26405b8d9ba771 Kuo Zhao           2020-08-18  199  				tmp_tx_bytes =3D pr=
iv->tx[ring].bytes_done;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  200  			} while (u64_stats_f=
etch_retry(&priv->tx[ring].statss,
e5b845dc79838e1 Catherine Sullivan 2019-07-01  201  						       start));
f26405b8d9ba771 Kuo Zhao           2020-08-18  202  			tx_pkts +=3D tmp_tx_=
pkts;
f26405b8d9ba771 Kuo Zhao           2020-08-18  203  			tx_bytes +=3D tmp_tx=
_bytes;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  204  		}
e5b845dc79838e1 Catherine Sullivan 2019-07-01  205  	}
e5b845dc79838e1 Catherine Sullivan 2019-07-01  206  =

e5b845dc79838e1 Catherine Sullivan 2019-07-01  207  	i =3D 0;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  208  	data[i++] =3D rx_pkts;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  209  	data[i++] =3D tx_pkts;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  210  	data[i++] =3D rx_bytes;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  211  	data[i++] =3D tx_bytes;
f26405b8d9ba771 Kuo Zhao           2020-08-18  212  	/* total rx dropped pa=
ckets */
f26405b8d9ba771 Kuo Zhao           2020-08-18  213  	data[i++] =3D rx_skb_a=
lloc_fail + rx_buf_alloc_fail +
f26405b8d9ba771 Kuo Zhao           2020-08-18  214  		    rx_desc_err_dropp=
ed_pkt;
f26405b8d9ba771 Kuo Zhao           2020-08-18  215  	/* Skip tx_dropped */
f26405b8d9ba771 Kuo Zhao           2020-08-18  216  	i++;
f26405b8d9ba771 Kuo Zhao           2020-08-18  217  =

e5b845dc79838e1 Catherine Sullivan 2019-07-01  218  	data[i++] =3D priv->tx=
_timeo_cnt;
f26405b8d9ba771 Kuo Zhao           2020-08-18  219  	data[i++] =3D rx_skb_a=
lloc_fail;
f26405b8d9ba771 Kuo Zhao           2020-08-18  220  	data[i++] =3D rx_buf_a=
lloc_fail;
f26405b8d9ba771 Kuo Zhao           2020-08-18  221  	data[i++] =3D rx_desc_=
err_dropped_pkt;
f26405b8d9ba771 Kuo Zhao           2020-08-18  222  	data[i++] =3D priv->in=
terface_up_cnt;
f26405b8d9ba771 Kuo Zhao           2020-08-18  223  	data[i++] =3D priv->in=
terface_down_cnt;
f26405b8d9ba771 Kuo Zhao           2020-08-18  224  	data[i++] =3D priv->re=
set_cnt;
f26405b8d9ba771 Kuo Zhao           2020-08-18  225  	data[i++] =3D priv->pa=
ge_alloc_fail;
f26405b8d9ba771 Kuo Zhao           2020-08-18  226  	data[i++] =3D priv->dm=
a_mapping_error;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  227  	i =3D GVE_MAIN_STATS_L=
EN;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  228  =

e0120fadf9a1ed0 Kuo Zhao           2020-08-18  229  	/* For rx cross-report=
ing stats, start from nic rx stats in report */
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  230  	base_stats_idx =3D GVE=
_TX_STATS_REPORT_NUM * priv->tx_cfg.num_queues +
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  231  		GVE_RX_STATS_REPORT_N=
UM * priv->rx_cfg.num_queues;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  232  	max_stats_idx =3D NIC_=
RX_STATS_REPORT_NUM * priv->rx_cfg.num_queues +
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  233  		base_stats_idx;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  234  	/* Preprocess the stat=
s report for rx, map queue id to start index */
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  235  	skip_nic_stats =3D fal=
se;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  236  	for (stats_idx =3D bas=
e_stats_idx; stats_idx < max_stats_idx;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  237  		stats_idx +=3D NIC_RX=
_STATS_REPORT_NUM) {
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  238  		u32 stat_name =3D be3=
2_to_cpu(report_stats[stats_idx].stat_name);
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  239  		u32 queue_id =3D be32=
_to_cpu(report_stats[stats_idx].queue_id);
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  240  =

e0120fadf9a1ed0 Kuo Zhao           2020-08-18  241  		if (stat_name =3D=3D =
0) {
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  242  			/* no stats written =
by NIC yet */
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  243  			skip_nic_stats =3D t=
rue;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  244  			break;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  245  		}
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  246  		rx_qid_to_stats_idx[q=
ueue_id] =3D stats_idx;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  247  	}
e5b845dc79838e1 Catherine Sullivan 2019-07-01  248  	/* walk RX rings */
e5b845dc79838e1 Catherine Sullivan 2019-07-01  249  	if (priv->rx) {
e5b845dc79838e1 Catherine Sullivan 2019-07-01  250  		for (ring =3D 0; ring=
 < priv->rx_cfg.num_queues; ring++) {
e5b845dc79838e1 Catherine Sullivan 2019-07-01  251  			struct gve_rx_ring *=
rx =3D &priv->rx[ring];
e5b845dc79838e1 Catherine Sullivan 2019-07-01  252  =

438b43bdb95d318 Catherine Sullivan 2019-08-01  253  			data[i++] =3D rx->fi=
ll_cnt;
f26405b8d9ba771 Kuo Zhao           2020-08-18  254  			data[i++] =3D rx->cn=
t;
f26405b8d9ba771 Kuo Zhao           2020-08-18  255  			do {
f26405b8d9ba771 Kuo Zhao           2020-08-18  256  				start =3D
f26405b8d9ba771 Kuo Zhao           2020-08-18  257  				  u64_stats_fetch_b=
egin(&priv->rx[ring].statss);
f26405b8d9ba771 Kuo Zhao           2020-08-18  258  				tmp_rx_bytes =3D rx=
->rbytes;
f26405b8d9ba771 Kuo Zhao           2020-08-18  259  				tmp_rx_skb_alloc_fa=
il =3D rx->rx_skb_alloc_fail;
f26405b8d9ba771 Kuo Zhao           2020-08-18  260  				tmp_rx_buf_alloc_fa=
il =3D rx->rx_buf_alloc_fail;
f26405b8d9ba771 Kuo Zhao           2020-08-18  261  				tmp_rx_desc_err_dro=
pped_pkt =3D
f26405b8d9ba771 Kuo Zhao           2020-08-18  262  					rx->rx_desc_err_dr=
opped_pkt;
f26405b8d9ba771 Kuo Zhao           2020-08-18  263  			} while (u64_stats_f=
etch_retry(&priv->rx[ring].statss,
f26405b8d9ba771 Kuo Zhao           2020-08-18  264  						       start));
f26405b8d9ba771 Kuo Zhao           2020-08-18  265  			data[i++] =3D tmp_rx=
_bytes;
f26405b8d9ba771 Kuo Zhao           2020-08-18  266  			/* rx dropped packet=
s */
f26405b8d9ba771 Kuo Zhao           2020-08-18  267  			data[i++] =3D tmp_rx=
_skb_alloc_fail +
f26405b8d9ba771 Kuo Zhao           2020-08-18  268  				tmp_rx_buf_alloc_fa=
il +
f26405b8d9ba771 Kuo Zhao           2020-08-18  269  				tmp_rx_desc_err_dro=
pped_pkt;
f26405b8d9ba771 Kuo Zhao           2020-08-18  270  			data[i++] =3D rx->rx=
_copybreak_pkt;
f26405b8d9ba771 Kuo Zhao           2020-08-18  271  			data[i++] =3D rx->rx=
_copied_pkt;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  272  			/* stats from NIC */
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  273  			if (skip_nic_stats) {
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  274  				/* skip NIC rx stat=
s */
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  275  				i +=3D NIC_RX_STATS=
_REPORT_NUM;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  276  				continue;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  277  			}
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  278  			for (j =3D 0; j < NI=
C_RX_STATS_REPORT_NUM; j++) {
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  279  				u64 value =3D
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  280  				be64_to_cpu(report_=
stats[rx_qid_to_stats_idx[ring] + j].value);
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  281  =

e0120fadf9a1ed0 Kuo Zhao           2020-08-18  282  				data[i++] =3D value;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  283  			}
e5b845dc79838e1 Catherine Sullivan 2019-07-01  284  		}
e5b845dc79838e1 Catherine Sullivan 2019-07-01  285  	} else {
e5b845dc79838e1 Catherine Sullivan 2019-07-01  286  		i +=3D priv->rx_cfg.n=
um_queues * NUM_GVE_RX_CNTS;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  287  	}
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  288  =

e0120fadf9a1ed0 Kuo Zhao           2020-08-18  289  	/* For tx cross-report=
ing stats, start from nic tx stats in report */
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  290  	base_stats_idx =3D max=
_stats_idx;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  291  	max_stats_idx =3D NIC_=
TX_STATS_REPORT_NUM * priv->tx_cfg.num_queues +
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  292  		max_stats_idx;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  293  	/* Preprocess the stat=
s report for tx, map queue id to start index */
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  294  	skip_nic_stats =3D fal=
se;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  295  	for (stats_idx =3D bas=
e_stats_idx; stats_idx < max_stats_idx;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  296  		stats_idx +=3D NIC_TX=
_STATS_REPORT_NUM) {
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  297  		u32 stat_name =3D be3=
2_to_cpu(report_stats[stats_idx].stat_name);
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  298  		u32 queue_id =3D be32=
_to_cpu(report_stats[stats_idx].queue_id);
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  299  =

e0120fadf9a1ed0 Kuo Zhao           2020-08-18  300  		if (stat_name =3D=3D =
0) {
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  301  			/* no stats written =
by NIC yet */
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  302  			skip_nic_stats =3D t=
rue;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  303  			break;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  304  		}
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  305  		tx_qid_to_stats_idx[q=
ueue_id] =3D stats_idx;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  306  	}
e5b845dc79838e1 Catherine Sullivan 2019-07-01  307  	/* walk TX rings */
e5b845dc79838e1 Catherine Sullivan 2019-07-01  308  	if (priv->tx) {
e5b845dc79838e1 Catherine Sullivan 2019-07-01  309  		for (ring =3D 0; ring=
 < priv->tx_cfg.num_queues; ring++) {
e5b845dc79838e1 Catherine Sullivan 2019-07-01  310  			struct gve_tx_ring *=
tx =3D &priv->tx[ring];
e5b845dc79838e1 Catherine Sullivan 2019-07-01  311  =

e5b845dc79838e1 Catherine Sullivan 2019-07-01  312  			data[i++] =3D tx->re=
q;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  313  			data[i++] =3D tx->do=
ne;
f26405b8d9ba771 Kuo Zhao           2020-08-18  314  			do {
f26405b8d9ba771 Kuo Zhao           2020-08-18  315  				start =3D
f26405b8d9ba771 Kuo Zhao           2020-08-18  316  				  u64_stats_fetch_b=
egin(&priv->tx[ring].statss);
f26405b8d9ba771 Kuo Zhao           2020-08-18  317  				tmp_tx_bytes =3D tx=
->bytes_done;
f26405b8d9ba771 Kuo Zhao           2020-08-18  318  			} while (u64_stats_f=
etch_retry(&priv->tx[ring].statss,
f26405b8d9ba771 Kuo Zhao           2020-08-18  319  						       start));
f26405b8d9ba771 Kuo Zhao           2020-08-18  320  			data[i++] =3D tmp_tx=
_bytes;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  321  			data[i++] =3D tx->wa=
ke_queue;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  322  			data[i++] =3D tx->st=
op_queue;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  323  			data[i++] =3D be32_t=
o_cpu(gve_tx_load_event_counter(priv,
e5b845dc79838e1 Catherine Sullivan 2019-07-01  324  									  tx));
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  325  			/* stats from NIC */
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  326  			if (skip_nic_stats) {
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  327  				/* skip NIC tx stat=
s */
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  328  				i +=3D NIC_TX_STATS=
_REPORT_NUM;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  329  				continue;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  330  			}
e0120fadf9a1ed0 Kuo Zhao           2020-08-18 @331  			for (j =3D 0; j < NI=
C_TX_STATS_REPORT_NUM; j++) {
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  332  				u64 value =3D
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  333  				be64_to_cpu(report_=
stats[tx_qid_to_stats_idx[ring] + j].value);
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  334  =

e0120fadf9a1ed0 Kuo Zhao           2020-08-18  335  				data[i++] =3D value;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  336  			}
e5b845dc79838e1 Catherine Sullivan 2019-07-01  337  		}
e5b845dc79838e1 Catherine Sullivan 2019-07-01  338  	} else {
e5b845dc79838e1 Catherine Sullivan 2019-07-01  339  		i +=3D priv->tx_cfg.n=
um_queues * NUM_GVE_TX_CNTS;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  340  	}
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  341  =

e0120fadf9a1ed0 Kuo Zhao           2020-08-18  342  	kfree(rx_qid_to_stats_=
idx);
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  343  	kfree(tx_qid_to_stats_=
idx);
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  344  =

f26405b8d9ba771 Kuo Zhao           2020-08-18  345  	/* AQ Stats */
f26405b8d9ba771 Kuo Zhao           2020-08-18  346  	data[i++] =3D priv->ad=
minq_prod_cnt;
f26405b8d9ba771 Kuo Zhao           2020-08-18  347  	data[i++] =3D priv->ad=
minq_cmd_fail;
f26405b8d9ba771 Kuo Zhao           2020-08-18  348  	data[i++] =3D priv->ad=
minq_timeouts;
f26405b8d9ba771 Kuo Zhao           2020-08-18  349  	data[i++] =3D priv->ad=
minq_describe_device_cnt;
f26405b8d9ba771 Kuo Zhao           2020-08-18  350  	data[i++] =3D priv->ad=
minq_cfg_device_resources_cnt;
f26405b8d9ba771 Kuo Zhao           2020-08-18  351  	data[i++] =3D priv->ad=
minq_register_page_list_cnt;
f26405b8d9ba771 Kuo Zhao           2020-08-18  352  	data[i++] =3D priv->ad=
minq_unregister_page_list_cnt;
f26405b8d9ba771 Kuo Zhao           2020-08-18  353  	data[i++] =3D priv->ad=
minq_create_tx_queue_cnt;
f26405b8d9ba771 Kuo Zhao           2020-08-18  354  	data[i++] =3D priv->ad=
minq_create_rx_queue_cnt;
f26405b8d9ba771 Kuo Zhao           2020-08-18  355  	data[i++] =3D priv->ad=
minq_destroy_tx_queue_cnt;
f26405b8d9ba771 Kuo Zhao           2020-08-18  356  	data[i++] =3D priv->ad=
minq_destroy_rx_queue_cnt;
f26405b8d9ba771 Kuo Zhao           2020-08-18  357  	data[i++] =3D priv->ad=
minq_dcfg_device_resources_cnt;
f26405b8d9ba771 Kuo Zhao           2020-08-18  358  	data[i++] =3D priv->ad=
minq_set_driver_parameter_cnt;
e0120fadf9a1ed0 Kuo Zhao           2020-08-18  359  	data[i++] =3D priv->ad=
minq_report_stats_cnt;
e5b845dc79838e1 Catherine Sullivan 2019-07-01  360  }
e5b845dc79838e1 Catherine Sullivan 2019-07-01  361  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5828147860359253978==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
fyMGwVaUUc//AXWoqvaaKwIA
--===============5828147860359253978==--

