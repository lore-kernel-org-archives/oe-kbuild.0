Content-Type: multipart/mixed; boundary="===============4971439503168174627=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/google/gve/gve_ethtool.c:331 gve_get_ethtool_stats() warn: we never enter this loop
Date: Thu, 14 Jan 2021 14:39:07 +0800
Message-ID: <202101141403.MUujqeng-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4971439503168174627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: David Awogbemila <awogbemila@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   65f0d2414b7079556fbbcc070b3d1c9f9587606d
commit: 2f523dc34ac8c355609e9b847852bf25bbdb30bf gve: NIC stats for report-=
stats and for ethtool
date:   4 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 4 months ago
config: s390-randconfig-m031-20210114 (attached as .config)
compiler: s390-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/google/gve/gve_ethtool.c:331 gve_get_ethtool_stats() w=
arn: we never enter this loop

vim +331 drivers/net/ethernet/google/gve/gve_ethtool.c

e5b845dc79838e Catherine Sullivan 2019-07-01  134  =

e5b845dc79838e Catherine Sullivan 2019-07-01  135  static void
e5b845dc79838e Catherine Sullivan 2019-07-01  136  gve_get_ethtool_stats(st=
ruct net_device *netdev,
e5b845dc79838e Catherine Sullivan 2019-07-01  137  		      struct ethtool_s=
tats *stats, u64 *data)
e5b845dc79838e Catherine Sullivan 2019-07-01  138  {
433e274b8f7b03 Kuo Zhao           2020-09-11  139  	u64 tmp_rx_pkts, tmp_rx=
_bytes, tmp_rx_skb_alloc_fail,	tmp_rx_buf_alloc_fail,
433e274b8f7b03 Kuo Zhao           2020-09-11  140  		tmp_rx_desc_err_droppe=
d_pkt, tmp_tx_pkts, tmp_tx_bytes;
433e274b8f7b03 Kuo Zhao           2020-09-11  141  	u64 rx_buf_alloc_fail, =
rx_desc_err_dropped_pkt, rx_pkts,
433e274b8f7b03 Kuo Zhao           2020-09-11  142  		rx_skb_alloc_fail, rx_=
bytes, tx_pkts, tx_bytes;
2f523dc34ac8c3 David Awogbemila   2020-09-11  143  	int stats_idx, base_sta=
ts_idx, max_stats_idx;
2f523dc34ac8c3 David Awogbemila   2020-09-11  144  	struct stats *report_st=
ats;
2f523dc34ac8c3 David Awogbemila   2020-09-11  145  	int *rx_qid_to_stats_id=
x;
2f523dc34ac8c3 David Awogbemila   2020-09-11  146  	int *tx_qid_to_stats_id=
x;
433e274b8f7b03 Kuo Zhao           2020-09-11  147  	struct gve_priv *priv;
2f523dc34ac8c3 David Awogbemila   2020-09-11  148  	bool skip_nic_stats;
e5b845dc79838e Catherine Sullivan 2019-07-01  149  	unsigned int start;
e5b845dc79838e Catherine Sullivan 2019-07-01  150  	int ring;
2f523dc34ac8c3 David Awogbemila   2020-09-11  151  	int i, j;
e5b845dc79838e Catherine Sullivan 2019-07-01  152  =

e5b845dc79838e Catherine Sullivan 2019-07-01  153  	ASSERT_RTNL();
e5b845dc79838e Catherine Sullivan 2019-07-01  154  =

433e274b8f7b03 Kuo Zhao           2020-09-11  155  	priv =3D netdev_priv(ne=
tdev);
2f523dc34ac8c3 David Awogbemila   2020-09-11  156  	report_stats =3D priv->=
stats_report->stats;
2f523dc34ac8c3 David Awogbemila   2020-09-11  157  	rx_qid_to_stats_idx =3D=
 kmalloc_array(priv->rx_cfg.num_queues,
2f523dc34ac8c3 David Awogbemila   2020-09-11  158  					    sizeof(int), GF=
P_KERNEL);
2f523dc34ac8c3 David Awogbemila   2020-09-11  159  	if (!rx_qid_to_stats_id=
x)
2f523dc34ac8c3 David Awogbemila   2020-09-11  160  		return;
2f523dc34ac8c3 David Awogbemila   2020-09-11  161  	tx_qid_to_stats_idx =3D=
 kmalloc_array(priv->tx_cfg.num_queues,
2f523dc34ac8c3 David Awogbemila   2020-09-11  162  					    sizeof(int), GF=
P_KERNEL);
2f523dc34ac8c3 David Awogbemila   2020-09-11  163  	if (!tx_qid_to_stats_id=
x) {
2f523dc34ac8c3 David Awogbemila   2020-09-11  164  		kfree(rx_qid_to_stats_=
idx);
2f523dc34ac8c3 David Awogbemila   2020-09-11  165  		return;
2f523dc34ac8c3 David Awogbemila   2020-09-11  166  	}
433e274b8f7b03 Kuo Zhao           2020-09-11  167  	for (rx_pkts =3D 0, rx_=
bytes =3D 0, rx_skb_alloc_fail =3D 0,
433e274b8f7b03 Kuo Zhao           2020-09-11  168  	     rx_buf_alloc_fail =
=3D 0, rx_desc_err_dropped_pkt =3D 0, ring =3D 0;
e5b845dc79838e Catherine Sullivan 2019-07-01  169  	     ring < priv->rx_cf=
g.num_queues; ring++) {
e5b845dc79838e Catherine Sullivan 2019-07-01  170  		if (priv->rx) {
e5b845dc79838e Catherine Sullivan 2019-07-01  171  			do {
433e274b8f7b03 Kuo Zhao           2020-09-11  172  				struct gve_rx_ring *=
rx =3D &priv->rx[ring];
433e274b8f7b03 Kuo Zhao           2020-09-11  173  =

3c13ce74b6f885 Catherine Sullivan 2019-07-02  174  				start =3D
e5b845dc79838e Catherine Sullivan 2019-07-01  175  				  u64_stats_fetch_be=
gin(&priv->rx[ring].statss);
433e274b8f7b03 Kuo Zhao           2020-09-11  176  				tmp_rx_pkts =3D rx->=
rpackets;
433e274b8f7b03 Kuo Zhao           2020-09-11  177  				tmp_rx_bytes =3D rx-=
>rbytes;
433e274b8f7b03 Kuo Zhao           2020-09-11  178  				tmp_rx_skb_alloc_fai=
l =3D rx->rx_skb_alloc_fail;
433e274b8f7b03 Kuo Zhao           2020-09-11  179  				tmp_rx_buf_alloc_fai=
l =3D rx->rx_buf_alloc_fail;
433e274b8f7b03 Kuo Zhao           2020-09-11  180  				tmp_rx_desc_err_drop=
ped_pkt =3D
433e274b8f7b03 Kuo Zhao           2020-09-11  181  					rx->rx_desc_err_dro=
pped_pkt;
e5b845dc79838e Catherine Sullivan 2019-07-01  182  			} while (u64_stats_fe=
tch_retry(&priv->rx[ring].statss,
e5b845dc79838e Catherine Sullivan 2019-07-01  183  						       start));
433e274b8f7b03 Kuo Zhao           2020-09-11  184  			rx_pkts +=3D tmp_rx_p=
kts;
433e274b8f7b03 Kuo Zhao           2020-09-11  185  			rx_bytes +=3D tmp_rx_=
bytes;
433e274b8f7b03 Kuo Zhao           2020-09-11  186  			rx_skb_alloc_fail +=
=3D tmp_rx_skb_alloc_fail;
433e274b8f7b03 Kuo Zhao           2020-09-11  187  			rx_buf_alloc_fail +=
=3D tmp_rx_buf_alloc_fail;
433e274b8f7b03 Kuo Zhao           2020-09-11  188  			rx_desc_err_dropped_p=
kt +=3D tmp_rx_desc_err_dropped_pkt;
e5b845dc79838e Catherine Sullivan 2019-07-01  189  		}
e5b845dc79838e Catherine Sullivan 2019-07-01  190  	}
e5b845dc79838e Catherine Sullivan 2019-07-01  191  	for (tx_pkts =3D 0, tx_=
bytes =3D 0, ring =3D 0;
e5b845dc79838e Catherine Sullivan 2019-07-01  192  	     ring < priv->tx_cf=
g.num_queues; ring++) {
e5b845dc79838e Catherine Sullivan 2019-07-01  193  		if (priv->tx) {
e5b845dc79838e Catherine Sullivan 2019-07-01  194  			do {
3c13ce74b6f885 Catherine Sullivan 2019-07-02  195  				start =3D
e5b845dc79838e Catherine Sullivan 2019-07-01  196  				  u64_stats_fetch_be=
gin(&priv->tx[ring].statss);
433e274b8f7b03 Kuo Zhao           2020-09-11  197  				tmp_tx_pkts =3D priv=
->tx[ring].pkt_done;
433e274b8f7b03 Kuo Zhao           2020-09-11  198  				tmp_tx_bytes =3D pri=
v->tx[ring].bytes_done;
e5b845dc79838e Catherine Sullivan 2019-07-01  199  			} while (u64_stats_fe=
tch_retry(&priv->tx[ring].statss,
e5b845dc79838e Catherine Sullivan 2019-07-01  200  						       start));
433e274b8f7b03 Kuo Zhao           2020-09-11  201  			tx_pkts +=3D tmp_tx_p=
kts;
433e274b8f7b03 Kuo Zhao           2020-09-11  202  			tx_bytes +=3D tmp_tx_=
bytes;
e5b845dc79838e Catherine Sullivan 2019-07-01  203  		}
e5b845dc79838e Catherine Sullivan 2019-07-01  204  	}
e5b845dc79838e Catherine Sullivan 2019-07-01  205  =

e5b845dc79838e Catherine Sullivan 2019-07-01  206  	i =3D 0;
e5b845dc79838e Catherine Sullivan 2019-07-01  207  	data[i++] =3D rx_pkts;
e5b845dc79838e Catherine Sullivan 2019-07-01  208  	data[i++] =3D tx_pkts;
e5b845dc79838e Catherine Sullivan 2019-07-01  209  	data[i++] =3D rx_bytes;
e5b845dc79838e Catherine Sullivan 2019-07-01  210  	data[i++] =3D tx_bytes;
433e274b8f7b03 Kuo Zhao           2020-09-11  211  	/* total rx dropped pac=
kets */
433e274b8f7b03 Kuo Zhao           2020-09-11  212  	data[i++] =3D rx_skb_al=
loc_fail + rx_buf_alloc_fail +
433e274b8f7b03 Kuo Zhao           2020-09-11  213  		    rx_desc_err_droppe=
d_pkt;
433e274b8f7b03 Kuo Zhao           2020-09-11  214  	/* Skip tx_dropped */
433e274b8f7b03 Kuo Zhao           2020-09-11  215  	i++;
433e274b8f7b03 Kuo Zhao           2020-09-11  216  =

e5b845dc79838e Catherine Sullivan 2019-07-01  217  	data[i++] =3D priv->tx_=
timeo_cnt;
433e274b8f7b03 Kuo Zhao           2020-09-11  218  	data[i++] =3D rx_skb_al=
loc_fail;
433e274b8f7b03 Kuo Zhao           2020-09-11  219  	data[i++] =3D rx_buf_al=
loc_fail;
433e274b8f7b03 Kuo Zhao           2020-09-11  220  	data[i++] =3D rx_desc_e=
rr_dropped_pkt;
433e274b8f7b03 Kuo Zhao           2020-09-11  221  	data[i++] =3D priv->int=
erface_up_cnt;
433e274b8f7b03 Kuo Zhao           2020-09-11  222  	data[i++] =3D priv->int=
erface_down_cnt;
433e274b8f7b03 Kuo Zhao           2020-09-11  223  	data[i++] =3D priv->res=
et_cnt;
433e274b8f7b03 Kuo Zhao           2020-09-11  224  	data[i++] =3D priv->pag=
e_alloc_fail;
433e274b8f7b03 Kuo Zhao           2020-09-11  225  	data[i++] =3D priv->dma=
_mapping_error;
24aeb56f2d38ed Kuo Zhao           2020-09-11  226  	data[i++] =3D priv->sta=
ts_report_trigger_cnt;
e5b845dc79838e Catherine Sullivan 2019-07-01  227  	i =3D GVE_MAIN_STATS_LE=
N;
e5b845dc79838e Catherine Sullivan 2019-07-01  228  =

2f523dc34ac8c3 David Awogbemila   2020-09-11  229  	/* For rx cross-reporti=
ng stats, start from nic rx stats in report */
2f523dc34ac8c3 David Awogbemila   2020-09-11  230  	base_stats_idx =3D GVE_=
TX_STATS_REPORT_NUM * priv->tx_cfg.num_queues +
2f523dc34ac8c3 David Awogbemila   2020-09-11  231  		GVE_RX_STATS_REPORT_NU=
M * priv->rx_cfg.num_queues;
2f523dc34ac8c3 David Awogbemila   2020-09-11  232  	max_stats_idx =3D NIC_R=
X_STATS_REPORT_NUM * priv->rx_cfg.num_queues +
2f523dc34ac8c3 David Awogbemila   2020-09-11  233  		base_stats_idx;
2f523dc34ac8c3 David Awogbemila   2020-09-11  234  	/* Preprocess the stats=
 report for rx, map queue id to start index */
2f523dc34ac8c3 David Awogbemila   2020-09-11  235  	skip_nic_stats =3D fals=
e;
2f523dc34ac8c3 David Awogbemila   2020-09-11  236  	for (stats_idx =3D base=
_stats_idx; stats_idx < max_stats_idx;
2f523dc34ac8c3 David Awogbemila   2020-09-11  237  		stats_idx +=3D NIC_RX_=
STATS_REPORT_NUM) {
2f523dc34ac8c3 David Awogbemila   2020-09-11  238  		u32 stat_name =3D be32=
_to_cpu(report_stats[stats_idx].stat_name);
2f523dc34ac8c3 David Awogbemila   2020-09-11  239  		u32 queue_id =3D be32_=
to_cpu(report_stats[stats_idx].queue_id);
2f523dc34ac8c3 David Awogbemila   2020-09-11  240  =

2f523dc34ac8c3 David Awogbemila   2020-09-11  241  		if (stat_name =3D=3D 0=
) {
2f523dc34ac8c3 David Awogbemila   2020-09-11  242  			/* no stats written b=
y NIC yet */
2f523dc34ac8c3 David Awogbemila   2020-09-11  243  			skip_nic_stats =3D tr=
ue;
2f523dc34ac8c3 David Awogbemila   2020-09-11  244  			break;
2f523dc34ac8c3 David Awogbemila   2020-09-11  245  		}
2f523dc34ac8c3 David Awogbemila   2020-09-11  246  		rx_qid_to_stats_idx[qu=
eue_id] =3D stats_idx;
2f523dc34ac8c3 David Awogbemila   2020-09-11  247  	}
e5b845dc79838e Catherine Sullivan 2019-07-01  248  	/* walk RX rings */
e5b845dc79838e Catherine Sullivan 2019-07-01  249  	if (priv->rx) {
e5b845dc79838e Catherine Sullivan 2019-07-01  250  		for (ring =3D 0; ring =
< priv->rx_cfg.num_queues; ring++) {
e5b845dc79838e Catherine Sullivan 2019-07-01  251  			struct gve_rx_ring *r=
x =3D &priv->rx[ring];
e5b845dc79838e Catherine Sullivan 2019-07-01  252  =

438b43bdb95d31 Catherine Sullivan 2019-08-01  253  			data[i++] =3D rx->fil=
l_cnt;
433e274b8f7b03 Kuo Zhao           2020-09-11  254  			data[i++] =3D rx->cnt;
433e274b8f7b03 Kuo Zhao           2020-09-11  255  			do {
433e274b8f7b03 Kuo Zhao           2020-09-11  256  				start =3D
433e274b8f7b03 Kuo Zhao           2020-09-11  257  				  u64_stats_fetch_be=
gin(&priv->rx[ring].statss);
433e274b8f7b03 Kuo Zhao           2020-09-11  258  				tmp_rx_bytes =3D rx-=
>rbytes;
433e274b8f7b03 Kuo Zhao           2020-09-11  259  				tmp_rx_skb_alloc_fai=
l =3D rx->rx_skb_alloc_fail;
433e274b8f7b03 Kuo Zhao           2020-09-11  260  				tmp_rx_buf_alloc_fai=
l =3D rx->rx_buf_alloc_fail;
433e274b8f7b03 Kuo Zhao           2020-09-11  261  				tmp_rx_desc_err_drop=
ped_pkt =3D
433e274b8f7b03 Kuo Zhao           2020-09-11  262  					rx->rx_desc_err_dro=
pped_pkt;
433e274b8f7b03 Kuo Zhao           2020-09-11  263  			} while (u64_stats_fe=
tch_retry(&priv->rx[ring].statss,
433e274b8f7b03 Kuo Zhao           2020-09-11  264  						       start));
433e274b8f7b03 Kuo Zhao           2020-09-11  265  			data[i++] =3D tmp_rx_=
bytes;
433e274b8f7b03 Kuo Zhao           2020-09-11  266  			/* rx dropped packets=
 */
433e274b8f7b03 Kuo Zhao           2020-09-11  267  			data[i++] =3D tmp_rx_=
skb_alloc_fail +
433e274b8f7b03 Kuo Zhao           2020-09-11  268  				tmp_rx_buf_alloc_fai=
l +
433e274b8f7b03 Kuo Zhao           2020-09-11  269  				tmp_rx_desc_err_drop=
ped_pkt;
433e274b8f7b03 Kuo Zhao           2020-09-11  270  			data[i++] =3D rx->rx_=
copybreak_pkt;
433e274b8f7b03 Kuo Zhao           2020-09-11  271  			data[i++] =3D rx->rx_=
copied_pkt;
2f523dc34ac8c3 David Awogbemila   2020-09-11  272  			/* stats from NIC */
2f523dc34ac8c3 David Awogbemila   2020-09-11  273  			if (skip_nic_stats) {
2f523dc34ac8c3 David Awogbemila   2020-09-11  274  				/* skip NIC rx stats=
 */
2f523dc34ac8c3 David Awogbemila   2020-09-11  275  				i +=3D NIC_RX_STATS_=
REPORT_NUM;
2f523dc34ac8c3 David Awogbemila   2020-09-11  276  				continue;
2f523dc34ac8c3 David Awogbemila   2020-09-11  277  			}
2f523dc34ac8c3 David Awogbemila   2020-09-11  278  			for (j =3D 0; j < NIC=
_RX_STATS_REPORT_NUM; j++) {
2f523dc34ac8c3 David Awogbemila   2020-09-11  279  				u64 value =3D
2f523dc34ac8c3 David Awogbemila   2020-09-11  280  				be64_to_cpu(report_s=
tats[rx_qid_to_stats_idx[ring] + j].value);
2f523dc34ac8c3 David Awogbemila   2020-09-11  281  =

2f523dc34ac8c3 David Awogbemila   2020-09-11  282  				data[i++] =3D value;
2f523dc34ac8c3 David Awogbemila   2020-09-11  283  			}
e5b845dc79838e Catherine Sullivan 2019-07-01  284  		}
e5b845dc79838e Catherine Sullivan 2019-07-01  285  	} else {
e5b845dc79838e Catherine Sullivan 2019-07-01  286  		i +=3D priv->rx_cfg.nu=
m_queues * NUM_GVE_RX_CNTS;
e5b845dc79838e Catherine Sullivan 2019-07-01  287  	}
2f523dc34ac8c3 David Awogbemila   2020-09-11  288  =

2f523dc34ac8c3 David Awogbemila   2020-09-11  289  	/* For tx cross-reporti=
ng stats, start from nic tx stats in report */
2f523dc34ac8c3 David Awogbemila   2020-09-11  290  	base_stats_idx =3D max_=
stats_idx;
2f523dc34ac8c3 David Awogbemila   2020-09-11  291  	max_stats_idx =3D NIC_T=
X_STATS_REPORT_NUM * priv->tx_cfg.num_queues +
2f523dc34ac8c3 David Awogbemila   2020-09-11  292  		max_stats_idx;
2f523dc34ac8c3 David Awogbemila   2020-09-11  293  	/* Preprocess the stats=
 report for tx, map queue id to start index */
2f523dc34ac8c3 David Awogbemila   2020-09-11  294  	skip_nic_stats =3D fals=
e;
2f523dc34ac8c3 David Awogbemila   2020-09-11  295  	for (stats_idx =3D base=
_stats_idx; stats_idx < max_stats_idx;
2f523dc34ac8c3 David Awogbemila   2020-09-11  296  		stats_idx +=3D NIC_TX_=
STATS_REPORT_NUM) {
2f523dc34ac8c3 David Awogbemila   2020-09-11  297  		u32 stat_name =3D be32=
_to_cpu(report_stats[stats_idx].stat_name);
2f523dc34ac8c3 David Awogbemila   2020-09-11  298  		u32 queue_id =3D be32_=
to_cpu(report_stats[stats_idx].queue_id);
2f523dc34ac8c3 David Awogbemila   2020-09-11  299  =

2f523dc34ac8c3 David Awogbemila   2020-09-11  300  		if (stat_name =3D=3D 0=
) {
2f523dc34ac8c3 David Awogbemila   2020-09-11  301  			/* no stats written b=
y NIC yet */
2f523dc34ac8c3 David Awogbemila   2020-09-11  302  			skip_nic_stats =3D tr=
ue;
2f523dc34ac8c3 David Awogbemila   2020-09-11  303  			break;
2f523dc34ac8c3 David Awogbemila   2020-09-11  304  		}
2f523dc34ac8c3 David Awogbemila   2020-09-11  305  		tx_qid_to_stats_idx[qu=
eue_id] =3D stats_idx;
2f523dc34ac8c3 David Awogbemila   2020-09-11  306  	}
e5b845dc79838e Catherine Sullivan 2019-07-01  307  	/* walk TX rings */
e5b845dc79838e Catherine Sullivan 2019-07-01  308  	if (priv->tx) {
e5b845dc79838e Catherine Sullivan 2019-07-01  309  		for (ring =3D 0; ring =
< priv->tx_cfg.num_queues; ring++) {
e5b845dc79838e Catherine Sullivan 2019-07-01  310  			struct gve_tx_ring *t=
x =3D &priv->tx[ring];
e5b845dc79838e Catherine Sullivan 2019-07-01  311  =

e5b845dc79838e Catherine Sullivan 2019-07-01  312  			data[i++] =3D tx->req;
e5b845dc79838e Catherine Sullivan 2019-07-01  313  			data[i++] =3D tx->don=
e;
433e274b8f7b03 Kuo Zhao           2020-09-11  314  			do {
433e274b8f7b03 Kuo Zhao           2020-09-11  315  				start =3D
433e274b8f7b03 Kuo Zhao           2020-09-11  316  				  u64_stats_fetch_be=
gin(&priv->tx[ring].statss);
433e274b8f7b03 Kuo Zhao           2020-09-11  317  				tmp_tx_bytes =3D tx-=
>bytes_done;
433e274b8f7b03 Kuo Zhao           2020-09-11  318  			} while (u64_stats_fe=
tch_retry(&priv->tx[ring].statss,
433e274b8f7b03 Kuo Zhao           2020-09-11  319  						       start));
433e274b8f7b03 Kuo Zhao           2020-09-11  320  			data[i++] =3D tmp_tx_=
bytes;
e5b845dc79838e Catherine Sullivan 2019-07-01  321  			data[i++] =3D tx->wak=
e_queue;
e5b845dc79838e Catherine Sullivan 2019-07-01  322  			data[i++] =3D tx->sto=
p_queue;
e5b845dc79838e Catherine Sullivan 2019-07-01  323  			data[i++] =3D be32_to=
_cpu(gve_tx_load_event_counter(priv,
e5b845dc79838e Catherine Sullivan 2019-07-01  324  									  tx));
2f523dc34ac8c3 David Awogbemila   2020-09-11  325  			/* stats from NIC */
2f523dc34ac8c3 David Awogbemila   2020-09-11  326  			if (skip_nic_stats) {
2f523dc34ac8c3 David Awogbemila   2020-09-11  327  				/* skip NIC tx stats=
 */
2f523dc34ac8c3 David Awogbemila   2020-09-11  328  				i +=3D NIC_TX_STATS_=
REPORT_NUM;
2f523dc34ac8c3 David Awogbemila   2020-09-11  329  				continue;
2f523dc34ac8c3 David Awogbemila   2020-09-11  330  			}
2f523dc34ac8c3 David Awogbemila   2020-09-11 @331  			for (j =3D 0; j < NIC=
_TX_STATS_REPORT_NUM; j++) {
2f523dc34ac8c3 David Awogbemila   2020-09-11  332  				u64 value =3D
2f523dc34ac8c3 David Awogbemila   2020-09-11  333  				be64_to_cpu(report_s=
tats[tx_qid_to_stats_idx[ring] + j].value);
2f523dc34ac8c3 David Awogbemila   2020-09-11  334  				data[i++] =3D value;
2f523dc34ac8c3 David Awogbemila   2020-09-11  335  			}
e5b845dc79838e Catherine Sullivan 2019-07-01  336  		}
e5b845dc79838e Catherine Sullivan 2019-07-01  337  	} else {
e5b845dc79838e Catherine Sullivan 2019-07-01  338  		i +=3D priv->tx_cfg.nu=
m_queues * NUM_GVE_TX_CNTS;
e5b845dc79838e Catherine Sullivan 2019-07-01  339  	}
2f523dc34ac8c3 David Awogbemila   2020-09-11  340  =

2f523dc34ac8c3 David Awogbemila   2020-09-11  341  	kfree(rx_qid_to_stats_i=
dx);
2f523dc34ac8c3 David Awogbemila   2020-09-11  342  	kfree(tx_qid_to_stats_i=
dx);
433e274b8f7b03 Kuo Zhao           2020-09-11  343  	/* AQ Stats */
433e274b8f7b03 Kuo Zhao           2020-09-11  344  	data[i++] =3D priv->adm=
inq_prod_cnt;
433e274b8f7b03 Kuo Zhao           2020-09-11  345  	data[i++] =3D priv->adm=
inq_cmd_fail;
433e274b8f7b03 Kuo Zhao           2020-09-11  346  	data[i++] =3D priv->adm=
inq_timeouts;
433e274b8f7b03 Kuo Zhao           2020-09-11  347  	data[i++] =3D priv->adm=
inq_describe_device_cnt;
433e274b8f7b03 Kuo Zhao           2020-09-11  348  	data[i++] =3D priv->adm=
inq_cfg_device_resources_cnt;
433e274b8f7b03 Kuo Zhao           2020-09-11  349  	data[i++] =3D priv->adm=
inq_register_page_list_cnt;
433e274b8f7b03 Kuo Zhao           2020-09-11  350  	data[i++] =3D priv->adm=
inq_unregister_page_list_cnt;
433e274b8f7b03 Kuo Zhao           2020-09-11  351  	data[i++] =3D priv->adm=
inq_create_tx_queue_cnt;
433e274b8f7b03 Kuo Zhao           2020-09-11  352  	data[i++] =3D priv->adm=
inq_create_rx_queue_cnt;
433e274b8f7b03 Kuo Zhao           2020-09-11  353  	data[i++] =3D priv->adm=
inq_destroy_tx_queue_cnt;
433e274b8f7b03 Kuo Zhao           2020-09-11  354  	data[i++] =3D priv->adm=
inq_destroy_rx_queue_cnt;
433e274b8f7b03 Kuo Zhao           2020-09-11  355  	data[i++] =3D priv->adm=
inq_dcfg_device_resources_cnt;
433e274b8f7b03 Kuo Zhao           2020-09-11  356  	data[i++] =3D priv->adm=
inq_set_driver_parameter_cnt;
24aeb56f2d38ed Kuo Zhao           2020-09-11  357  	data[i++] =3D priv->adm=
inq_report_stats_cnt;
e5b845dc79838e Catherine Sullivan 2019-07-01  358  }
e5b845dc79838e Catherine Sullivan 2019-07-01  359  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4971439503168174627==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4971439503168174627==--

