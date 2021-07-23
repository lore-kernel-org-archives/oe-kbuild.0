Content-Type: multipart/mixed; boundary="===============8305378029453894749=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/google/gve/gve_ethtool.c:331 gve_get_ethtool_stats() warn: we never enter this loop
Date: Fri, 23 Jul 2021 19:19:42 +0800
Message-ID: <202107231934.JwkH0u9u-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8305378029453894749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: David Awogbemila <awogbemila@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8baef6386baaefb776bdd09b5c7630cf057c51c6
commit: 2f523dc34ac8c355609e9b847852bf25bbdb30bf gve: NIC stats for report-=
stats and for ethtool
date:   11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-m001-20210723 (attached as .config)
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0

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

--===============8305378029453894749==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8305378029453894749==--

