Content-Type: multipart/mixed; boundary="===============3761960428315056949=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/google/gve/gve_ethtool.c:331 gve_get_ethtool_stats() warn: we never enter this loop
Date: Sun, 08 Aug 2021 19:34:49 +0800
Message-ID: <202108081945.OfkT03tu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3761960428315056949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: David Awogbemila <awogbemila@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   85a90500f9a1717c4e142ce92e6c1cb1a339ec78
commit: 2f523dc34ac8c355609e9b847852bf25bbdb30bf gve: NIC stats for report-=
stats and for ethtool
date:   11 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-m021-20210807 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

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

--===============3761960428315056949==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
4RaEVdX/AYke5AHmOwIA
--===============3761960428315056949==--

