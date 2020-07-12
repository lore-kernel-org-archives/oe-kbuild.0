Content-Type: multipart/mixed; boundary="===============0759781080136672516=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/en_main.c:522 mlx5e_alloc_rq() error: we previously assumed 'rq->umem' could be null (see line 397)
Date: Mon, 13 Jul 2020 05:25:52 +0800
Message-ID: <202007130544.KGwZ43g3%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0759781080136672516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Bj=C3=B6rn T=C3=B6pel" <bjorn.topel@intel.com>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Maxim Mikityanskiy <maximmi@mellanox.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4437dd6e8f71e8b4b5546924a6e48e7edaf4a8dc
commit: 39d6443c8daf9fefcfcf89de7ae87240956a0b84 mlx5, xsk: Migrate to new =
MEM_TYPE_XSK_BUFF_POOL
date:   7 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-m031-20200713 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-14) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/en_main.c:522 mlx5e_alloc_rq() erro=
r: we previously assumed 'rq->umem' could be null (see line 397)

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D39d6443c8daf9fefcfcf89de7ae87240956a0b84
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout 39d6443c8daf9fefcfcf89de7ae87240956a0b84
vim +522 drivers/net/ethernet/mellanox/mlx5/core/en_main.c

8276ea1353a496 Aya Levin              2019-06-26  365  =

3b77235b94347e Saeed Mahameed         2017-03-25  366  static int mlx5e_all=
oc_rq(struct mlx5e_channel *c,
6a9764efb255f4 Saeed Mahameed         2016-12-21  367  			  struct mlx5e_pa=
rams *params,
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  368  			  struct mlx5e_xs=
k_param *xsk,
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  369  			  struct xdp_umem=
 *umem,
6a9764efb255f4 Saeed Mahameed         2016-12-21  370  			  struct mlx5e_rq=
_param *rqp,
f62b8bb8f2d305 Amir Vadai             2015-05-28  371  			  struct mlx5e_rq=
 *rq)
f62b8bb8f2d305 Amir Vadai             2015-05-28  372  {
60bbf7eeef10dc Jesper Dangaard Brouer 2018-04-17  373  	struct page_pool_pa=
rams pp_params =3D { 0 };
a43b25daef7861 Saeed Mahameed         2017-03-14  374  	struct mlx5_core_de=
v *mdev =3D c->mdev;
6a9764efb255f4 Saeed Mahameed         2016-12-21  375  	void *rqc =3D rqp->=
rqc;
f62b8bb8f2d305 Amir Vadai             2015-05-28  376  	void *rqc_wq =3D ML=
X5_ADDR_OF(rqc, rqc, wq);
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  377  	u32 rq_xdp_ix;
069d11465a802a Tariq Toukan           2018-05-02  378  	u32 pool_size;
f62b8bb8f2d305 Amir Vadai             2015-05-28  379  	int wq_sz;
f62b8bb8f2d305 Amir Vadai             2015-05-28  380  	int err;
f62b8bb8f2d305 Amir Vadai             2015-05-28  381  	int i;
f62b8bb8f2d305 Amir Vadai             2015-05-28  382  =

231243c8279342 Saeed Mahameed         2017-11-10  383  	rqp->wq.db_numa_nod=
e =3D cpu_to_node(c->cpu);
311c7c71c9bb87 Saeed Mahameed         2015-07-23  384  =

6a9764efb255f4 Saeed Mahameed         2016-12-21  385  	rq->wq_type =3D par=
ams->rq_wq_type;
7e426671704d22 Tariq Toukan           2016-09-15  386  	rq->pdev    =3D c->=
pdev;
7e426671704d22 Tariq Toukan           2016-09-15  387  	rq->netdev  =3D c->=
netdev;
a43b25daef7861 Saeed Mahameed         2017-03-14  388  	rq->tstamp  =3D c->=
tstamp;
7c39afb394c79e Feras Daoud            2017-08-15  389  	rq->clock   =3D &md=
ev->clock;
7e426671704d22 Tariq Toukan           2016-09-15  390  	rq->channel =3D c;
7e426671704d22 Tariq Toukan           2016-09-15  391  	rq->ix      =3D c->=
ix;
a43b25daef7861 Saeed Mahameed         2017-03-14  392  	rq->mdev    =3D mde=
v;
0073c8f72736b4 Moshe Shemesh          2018-10-11  393  	rq->hw_mtu  =3D MLX=
5E_SW2HW_MTU(params, params->sw_mtu);
b9673cf5558c0a Maxim Mikityanskiy     2019-06-26  394  	rq->xdpsq   =3D &c-=
>rq_xdpsq;
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  395  	rq->umem    =3D ume=
m;
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  396  =

db05815b36cbd4 Maxim Mikityanskiy     2019-06-26 @397  	if (rq->umem)
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  398  		rq->stats =3D &c->=
priv->channel_stats[c->ix].xskrq;
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  399  	else
05909babce5328 Eran Ben Elisha        2018-04-12  400  		rq->stats =3D &c->=
priv->channel_stats[c->ix].rq;
8276ea1353a496 Aya Levin              2019-06-26  401  	INIT_WORK(&rq->reco=
ver_work, mlx5e_rq_err_cqe_work);
97bc402db78212 Daniel Borkmann        2016-11-19  402  =

85192dbf4de087 Andrii Nakryiko        2019-11-17  403  	if (params->xdp_pro=
g)
85192dbf4de087 Andrii Nakryiko        2019-11-17  404  		bpf_prog_inc(param=
s->xdp_prog);
85192dbf4de087 Andrii Nakryiko        2019-11-17  405  	rq->xdp_prog =3D pa=
rams->xdp_prog;
7e426671704d22 Tariq Toukan           2016-09-15  406  =

db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  407  	rq_xdp_ix =3D rq->i=
x;
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  408  	if (xsk)
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  409  		rq_xdp_ix +=3D par=
ams->num_channels * MLX5E_RQ_GROUP_XSK;
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  410  	err =3D xdp_rxq_inf=
o_reg(&rq->xdp_rxq, rq->netdev, rq_xdp_ix);
e213f5b6dd5d1a Wei Yongjun            2018-01-10  411  	if (err < 0)
0ddf543226acac Jesper Dangaard Brouer 2018-01-03  412  		goto err_rq_wq_des=
troy;
0ddf543226acac Jesper Dangaard Brouer 2018-01-03  413  =

bce2b2bf66825a Tariq Toukan           2017-01-31  414  	rq->buff.map_dir =
=3D rq->xdp_prog ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  415  	rq->buff.headroom =
=3D mlx5e_get_rq_headroom(mdev, params, xsk);
60bbf7eeef10dc Jesper Dangaard Brouer 2018-04-17  416  	pool_size =3D 1 << =
params->log_rq_mtu_frames;
b5503b994ed5ed Saeed Mahameed         2016-09-21  417  =

6a9764efb255f4 Saeed Mahameed         2016-12-21  418  	switch (rq->wq_type=
) {
461017cb006aa1 Tariq Toukan           2016-04-20  419  	case MLX5_WQ_TYPE_L=
INKED_LIST_STRIDING_RQ:
422d4c401edd18 Tariq Toukan           2018-04-02  420  		err =3D mlx5_wq_ll=
_create(mdev, &rqp->wq, rqc_wq, &rq->mpwqe.wq,
422d4c401edd18 Tariq Toukan           2018-04-02  421  					&rq->wq_ctrl);
422d4c401edd18 Tariq Toukan           2018-04-02  422  		if (err)
422d4c401edd18 Tariq Toukan           2018-04-02  423  			return err;
422d4c401edd18 Tariq Toukan           2018-04-02  424  =

422d4c401edd18 Tariq Toukan           2018-04-02  425  		rq->mpwqe.wq.db =
=3D &rq->mpwqe.wq.db[MLX5_RCV_DBR];
422d4c401edd18 Tariq Toukan           2018-04-02  426  =

422d4c401edd18 Tariq Toukan           2018-04-02  427  		wq_sz =3D mlx5_wq_=
ll_get_size(&rq->mpwqe.wq);
60bbf7eeef10dc Jesper Dangaard Brouer 2018-04-17  428  =

db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  429  		pool_size =3D MLX5=
_MPWRQ_PAGES_PER_WQE <<
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  430  			mlx5e_mpwqe_get_l=
og_rq_size(params, xsk);
422d4c401edd18 Tariq Toukan           2018-04-02  431  =

7cc6d77bb56de3 Tariq Toukan           2017-07-17  432  		rq->post_wqes =3D =
mlx5e_post_rx_mpwqes;
6cd392a082deca Daniel Jurgens         2016-06-30  433  		rq->dealloc_wqe =
=3D mlx5e_dealloc_rx_mpwqe;
461017cb006aa1 Tariq Toukan           2016-04-20  434  =

20fd0c193ff638 Saeed Mahameed         2017-04-13  435  		rq->handle_rx_cqe =
=3D c->priv->profile->rx_handlers.handle_rx_cqe_mpwqe;
899a59d301bc0c Ilan Tayari            2017-06-19  436  #ifdef CONFIG_MLX5_E=
N_IPSEC
899a59d301bc0c Ilan Tayari            2017-06-19  437  		if (MLX5_IPSEC_DEV=
(mdev)) {
899a59d301bc0c Ilan Tayari            2017-06-19  438  			err =3D -EINVAL;
899a59d301bc0c Ilan Tayari            2017-06-19  439  			netdev_err(c->net=
dev, "MPWQE RQ with IPSec offload not supported\n");
899a59d301bc0c Ilan Tayari            2017-06-19  440  			goto err_rq_wq_de=
stroy;
899a59d301bc0c Ilan Tayari            2017-06-19  441  		}
899a59d301bc0c Ilan Tayari            2017-06-19  442  #endif
20fd0c193ff638 Saeed Mahameed         2017-04-13  443  		if (!rq->handle_rx=
_cqe) {
20fd0c193ff638 Saeed Mahameed         2017-04-13  444  			err =3D -EINVAL;
20fd0c193ff638 Saeed Mahameed         2017-04-13  445  			netdev_err(c->net=
dev, "RX handler of MPWQE RQ is not set, err %d\n", err);
20fd0c193ff638 Saeed Mahameed         2017-04-13  446  			goto err_rq_wq_de=
stroy;
20fd0c193ff638 Saeed Mahameed         2017-04-13  447  		}
20fd0c193ff638 Saeed Mahameed         2017-04-13  448  =

db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  449  		rq->mpwqe.skb_from=
_cqe_mpwrq =3D xsk ?
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  450  			mlx5e_xsk_skb_fro=
m_cqe_mpwrq_linear :
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  451  			mlx5e_rx_mpwqe_is=
_linear_skb(mdev, params, NULL) ?
619a8f2a42f103 Tariq Toukan           2018-02-07  452  				mlx5e_skb_from_c=
qe_mpwrq_linear :
619a8f2a42f103 Tariq Toukan           2018-02-07  453  				mlx5e_skb_from_c=
qe_mpwrq_nonlinear;
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  454  =

db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  455  		rq->mpwqe.log_stri=
de_sz =3D mlx5e_mpwqe_get_log_stride_size(mdev, params, xsk);
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  456  		rq->mpwqe.num_stri=
des =3D
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  457  			BIT(mlx5e_mpwqe_g=
et_log_num_strides(mdev, params, xsk));
1bfecfca565c05 Saeed Mahameed         2016-09-21  458  =

d628ee4fef1dbd Jesper Dangaard Brouer 2020-05-14  459  		rq->buff.frame0_sz=
 =3D (1 << rq->mpwqe.log_stride_sz);
d628ee4fef1dbd Jesper Dangaard Brouer 2020-05-14  460  =

a43b25daef7861 Saeed Mahameed         2017-03-14  461  		err =3D mlx5e_crea=
te_rq_umr_mkey(mdev, rq);
7e426671704d22 Tariq Toukan           2016-09-15  462  		if (err)
7e426671704d22 Tariq Toukan           2016-09-15  463  			goto err_rq_wq_de=
stroy;
ec8b9981ad3f3e Tariq Toukan           2016-11-30  464  		rq->mkey_be =3D cp=
u_to_be32(rq->umr_mkey.key);
ec8b9981ad3f3e Tariq Toukan           2016-11-30  465  =

ec8b9981ad3f3e Tariq Toukan           2016-11-30  466  		err =3D mlx5e_rq_a=
lloc_mpwqe_info(rq, c);
ec8b9981ad3f3e Tariq Toukan           2016-11-30  467  		if (err)
069d11465a802a Tariq Toukan           2018-05-02  468  			goto err_free;
461017cb006aa1 Tariq Toukan           2016-04-20  469  		break;
99cbfa93a6122b Tariq Toukan           2018-04-02  470  	default: /* MLX5_WQ=
_TYPE_CYCLIC */
99cbfa93a6122b Tariq Toukan           2018-04-02  471  		err =3D mlx5_wq_cy=
c_create(mdev, &rqp->wq, rqc_wq, &rq->wqe.wq,
422d4c401edd18 Tariq Toukan           2018-04-02  472  					 &rq->wq_ctrl);
422d4c401edd18 Tariq Toukan           2018-04-02  473  		if (err)
422d4c401edd18 Tariq Toukan           2018-04-02  474  			return err;
422d4c401edd18 Tariq Toukan           2018-04-02  475  =

422d4c401edd18 Tariq Toukan           2018-04-02  476  		rq->wqe.wq.db =3D =
&rq->wqe.wq.db[MLX5_RCV_DBR];
422d4c401edd18 Tariq Toukan           2018-04-02  477  =

99cbfa93a6122b Tariq Toukan           2018-04-02  478  		wq_sz =3D mlx5_wq_=
cyc_get_size(&rq->wqe.wq);
422d4c401edd18 Tariq Toukan           2018-04-02  479  =

069d11465a802a Tariq Toukan           2018-05-02  480  		rq->wqe.info =3D r=
qp->frags_info;
d628ee4fef1dbd Jesper Dangaard Brouer 2020-05-14  481  		rq->buff.frame0_sz=
 =3D rq->wqe.info.arr[0].frag_stride;
d628ee4fef1dbd Jesper Dangaard Brouer 2020-05-14  482  =

069d11465a802a Tariq Toukan           2018-05-02  483  		rq->wqe.frags =3D
84ca176bf54a61 Kees Cook              2018-06-12  484  			kvzalloc_node(arr=
ay_size(sizeof(*rq->wqe.frags),
84ca176bf54a61 Kees Cook              2018-06-12  485  					(wq_sz << rq->w=
qe.info.log_num_frags)),
231243c8279342 Saeed Mahameed         2017-11-10  486  				      GFP_KERNEL=
, cpu_to_node(c->cpu));
47a6ca3f972f5b Wei Yongjun            2018-06-05  487  		if (!rq->wqe.frags=
) {
47a6ca3f972f5b Wei Yongjun            2018-06-05  488  			err =3D -ENOMEM;
069d11465a802a Tariq Toukan           2018-05-02  489  			goto err_free;
47a6ca3f972f5b Wei Yongjun            2018-06-05  490  		}
069d11465a802a Tariq Toukan           2018-05-02  491  =

83b2fd64bac36c Maxim Mikityanskiy     2019-03-07  492  		err =3D mlx5e_init=
_di_list(rq, wq_sz, c->cpu);
069d11465a802a Tariq Toukan           2018-05-02  493  		if (err)
069d11465a802a Tariq Toukan           2018-05-02  494  			goto err_free;
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  495  =

7cc6d77bb56de3 Tariq Toukan           2017-07-17  496  		rq->post_wqes =3D =
mlx5e_post_rx_wqes;
6cd392a082deca Daniel Jurgens         2016-06-30  497  		rq->dealloc_wqe =
=3D mlx5e_dealloc_rx_wqe;
f62b8bb8f2d305 Amir Vadai             2015-05-28  498  =

899a59d301bc0c Ilan Tayari            2017-06-19  499  #ifdef CONFIG_MLX5_E=
N_IPSEC
899a59d301bc0c Ilan Tayari            2017-06-19  500  		if (c->priv->ipsec)
899a59d301bc0c Ilan Tayari            2017-06-19  501  			rq->handle_rx_cqe=
 =3D mlx5e_ipsec_handle_rx_cqe;
899a59d301bc0c Ilan Tayari            2017-06-19  502  		else
899a59d301bc0c Ilan Tayari            2017-06-19  503  #endif
20fd0c193ff638 Saeed Mahameed         2017-04-13  504  			rq->handle_rx_cqe=
 =3D c->priv->profile->rx_handlers.handle_rx_cqe;
20fd0c193ff638 Saeed Mahameed         2017-04-13  505  		if (!rq->handle_rx=
_cqe) {
20fd0c193ff638 Saeed Mahameed         2017-04-13  506  			err =3D -EINVAL;
20fd0c193ff638 Saeed Mahameed         2017-04-13  507  			netdev_err(c->net=
dev, "RX handler of RQ is not set, err %d\n", err);
069d11465a802a Tariq Toukan           2018-05-02  508  			goto err_free;
20fd0c193ff638 Saeed Mahameed         2017-04-13  509  		}
20fd0c193ff638 Saeed Mahameed         2017-04-13  510  =

db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  511  		rq->wqe.skb_from_c=
qe =3D xsk ?
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  512  			mlx5e_xsk_skb_fro=
m_cqe_linear :
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  513  			mlx5e_rx_is_linea=
r_skb(params, NULL) ?
069d11465a802a Tariq Toukan           2018-05-02  514  				mlx5e_skb_from_c=
qe_linear :
069d11465a802a Tariq Toukan           2018-05-02  515  				mlx5e_skb_from_c=
qe_nonlinear;
7e426671704d22 Tariq Toukan           2016-09-15  516  		rq->mkey_be =3D c-=
>mkey_be;
461017cb006aa1 Tariq Toukan           2016-04-20  517  	}
f62b8bb8f2d305 Amir Vadai             2015-05-28  518  =

db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  519  	if (xsk) {
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  520  		err =3D xdp_rxq_in=
fo_reg_mem_model(&rq->xdp_rxq,
39d6443c8daf9f Bj=C3=B6rn T=C3=B6pel            2020-05-20  521  						 MEM=
_TYPE_XSK_BUFF_POOL, NULL);
39d6443c8daf9f Bj=C3=B6rn T=C3=B6pel            2020-05-20 @522  		xsk_buff=
_set_rxq_info(rq->umem, &rq->xdp_rxq);
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  523  	} else {
60bbf7eeef10dc Jesper Dangaard Brouer 2018-04-17  524  		/* Create a page_p=
ool and register it with rxq */
069d11465a802a Tariq Toukan           2018-05-02  525  		pp_params.order   =
  =3D 0;
60bbf7eeef10dc Jesper Dangaard Brouer 2018-04-17  526  		pp_params.flags   =
  =3D 0; /* No-internal DMA mapping in page_pool */
60bbf7eeef10dc Jesper Dangaard Brouer 2018-04-17  527  		pp_params.pool_siz=
e =3D pool_size;
60bbf7eeef10dc Jesper Dangaard Brouer 2018-04-17  528  		pp_params.nid     =
  =3D cpu_to_node(c->cpu);
60bbf7eeef10dc Jesper Dangaard Brouer 2018-04-17  529  		pp_params.dev     =
  =3D c->pdev;
60bbf7eeef10dc Jesper Dangaard Brouer 2018-04-17  530  		pp_params.dma_dir =
  =3D rq->buff.map_dir;
60bbf7eeef10dc Jesper Dangaard Brouer 2018-04-17  531  =

60bbf7eeef10dc Jesper Dangaard Brouer 2018-04-17  532  		/* page_pool can b=
e used even when there is no rq->xdp_prog,
60bbf7eeef10dc Jesper Dangaard Brouer 2018-04-17  533  		 * given page_pool=
 does not handle DMA mapping there is no
60bbf7eeef10dc Jesper Dangaard Brouer 2018-04-17  534  		 * required state =
to clear. And page_pool gracefully handle
60bbf7eeef10dc Jesper Dangaard Brouer 2018-04-17  535  		 * elevated refcnt.
60bbf7eeef10dc Jesper Dangaard Brouer 2018-04-17  536  		 */
60bbf7eeef10dc Jesper Dangaard Brouer 2018-04-17  537  		rq->page_pool =3D =
page_pool_create(&pp_params);
60bbf7eeef10dc Jesper Dangaard Brouer 2018-04-17  538  		if (IS_ERR(rq->pag=
e_pool)) {
60bbf7eeef10dc Jesper Dangaard Brouer 2018-04-17  539  			err =3D PTR_ERR(r=
q->page_pool);
60bbf7eeef10dc Jesper Dangaard Brouer 2018-04-17  540  			rq->page_pool =3D=
 NULL;
069d11465a802a Tariq Toukan           2018-05-02  541  			goto err_free;
60bbf7eeef10dc Jesper Dangaard Brouer 2018-04-17  542  		}
84f5e3fb790547 Jesper Dangaard Brouer 2018-04-17  543  		err =3D xdp_rxq_in=
fo_reg_mem_model(&rq->xdp_rxq,
60bbf7eeef10dc Jesper Dangaard Brouer 2018-04-17  544  						 MEM_TYPE_PAGE=
_POOL, rq->page_pool);
e54cfd7e1745e5 Jesper Dangaard Brouer 2019-06-18  545  	}
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  546  	if (err)
db05815b36cbd4 Maxim Mikityanskiy     2019-06-26  547  		goto err_free;
84f5e3fb790547 Jesper Dangaard Brouer 2018-04-17  548  =

f62b8bb8f2d305 Amir Vadai             2015-05-28  549  	for (i =3D 0; i < w=
q_sz; i++) {
4c2af5cc2bee32 Tariq Toukan           2017-06-25  550  		if (rq->wq_type =
=3D=3D MLX5_WQ_TYPE_LINKED_LIST_STRIDING_RQ) {
99cbfa93a6122b Tariq Toukan           2018-04-02  551  			struct mlx5e_rx_w=
qe_ll *wqe =3D
422d4c401edd18 Tariq Toukan           2018-04-02  552  				mlx5_wq_ll_get_w=
qe(&rq->mpwqe.wq, i);
069d11465a802a Tariq Toukan           2018-05-02  553  			u32 byte_count =
=3D
069d11465a802a Tariq Toukan           2018-05-02  554  				rq->mpwqe.num_st=
rides << rq->mpwqe.log_stride_sz;
b8a98a4cf3221d Tariq Toukan           2017-12-20  555  			u64 dma_offset =
=3D mlx5e_get_mpwqe_offset(rq, i);
4c2af5cc2bee32 Tariq Toukan           2017-06-25  556  =

99cbfa93a6122b Tariq Toukan           2018-04-02  557  			wqe->data[0].addr=
 =3D cpu_to_be64(dma_offset + rq->buff.headroom);
99cbfa93a6122b Tariq Toukan           2018-04-02  558  			wqe->data[0].byte=
_count =3D cpu_to_be32(byte_count);
99cbfa93a6122b Tariq Toukan           2018-04-02  559  			wqe->data[0].lkey=
 =3D rq->mkey_be;
422d4c401edd18 Tariq Toukan           2018-04-02  560  		} else {
99cbfa93a6122b Tariq Toukan           2018-04-02  561  			struct mlx5e_rx_w=
qe_cyc *wqe =3D
99cbfa93a6122b Tariq Toukan           2018-04-02  562  				mlx5_wq_cyc_get_=
wqe(&rq->wqe.wq, i);
069d11465a802a Tariq Toukan           2018-05-02  563  			int f;
4c2af5cc2bee32 Tariq Toukan           2017-06-25  564  =

069d11465a802a Tariq Toukan           2018-05-02  565  			for (f =3D 0; f <=
 rq->wqe.info.num_frags; f++) {
069d11465a802a Tariq Toukan           2018-05-02  566  				u32 frag_size =
=3D rq->wqe.info.arr[f].frag_size |
069d11465a802a Tariq Toukan           2018-05-02  567  					MLX5_HW_START_P=
ADDING;
069d11465a802a Tariq Toukan           2018-05-02  568  =

069d11465a802a Tariq Toukan           2018-05-02  569  				wqe->data[f].byt=
e_count =3D cpu_to_be32(frag_size);
069d11465a802a Tariq Toukan           2018-05-02  570  				wqe->data[f].lke=
y =3D rq->mkey_be;
069d11465a802a Tariq Toukan           2018-05-02  571  			}
069d11465a802a Tariq Toukan           2018-05-02  572  			/* check if num_f=
rags is not a pow of two */
069d11465a802a Tariq Toukan           2018-05-02  573  			if (rq->wqe.info.=
num_frags < (1 << rq->wqe.info.log_num_frags)) {
069d11465a802a Tariq Toukan           2018-05-02  574  				wqe->data[f].byt=
e_count =3D 0;
069d11465a802a Tariq Toukan           2018-05-02  575  				wqe->data[f].lke=
y =3D cpu_to_be32(MLX5_INVALID_LKEY);
069d11465a802a Tariq Toukan           2018-05-02  576  				wqe->data[f].add=
r =3D 0;
069d11465a802a Tariq Toukan           2018-05-02  577  			}
f62b8bb8f2d305 Amir Vadai             2015-05-28  578  		}
422d4c401edd18 Tariq Toukan           2018-04-02  579  	}
f62b8bb8f2d305 Amir Vadai             2015-05-28  580  =

9a31742531018c Andy Gospodarek        2018-01-09  581  	INIT_WORK(&rq->dim.=
work, mlx5e_rx_dim_work);
9a31742531018c Andy Gospodarek        2018-01-09  582  =

9a31742531018c Andy Gospodarek        2018-01-09  583  	switch (params->rx_=
cq_moderation.cq_period_mode) {
9a31742531018c Andy Gospodarek        2018-01-09  584  	case MLX5_CQ_PERIOD=
_MODE_START_FROM_CQE:
c002bd529d7198 Tal Gilboa             2018-11-05  585  		rq->dim.mode =3D D=
IM_CQ_PERIOD_MODE_START_FROM_CQE;
9a31742531018c Andy Gospodarek        2018-01-09  586  		break;
9a31742531018c Andy Gospodarek        2018-01-09  587  	case MLX5_CQ_PERIOD=
_MODE_START_FROM_EQE:
9a31742531018c Andy Gospodarek        2018-01-09  588  	default:
c002bd529d7198 Tal Gilboa             2018-11-05  589  		rq->dim.mode =3D D=
IM_CQ_PERIOD_MODE_START_FROM_EQE;
9a31742531018c Andy Gospodarek        2018-01-09  590  	}
9a31742531018c Andy Gospodarek        2018-01-09  591  =

4415a0319f92ea Tariq Toukan           2016-09-15  592  	rq->page_cache.head=
 =3D 0;
4415a0319f92ea Tariq Toukan           2016-09-15  593  	rq->page_cache.tail=
 =3D 0;
4415a0319f92ea Tariq Toukan           2016-09-15  594  =

f62b8bb8f2d305 Amir Vadai             2015-05-28  595  	return 0;
f62b8bb8f2d305 Amir Vadai             2015-05-28  596  =

069d11465a802a Tariq Toukan           2018-05-02  597  err_free:
069d11465a802a Tariq Toukan           2018-05-02  598  	switch (rq->wq_type=
) {
069d11465a802a Tariq Toukan           2018-05-02  599  	case MLX5_WQ_TYPE_L=
INKED_LIST_STRIDING_RQ:
ca11b798998a62 Tariq Toukan           2018-06-05  600  		kvfree(rq->mpwqe.i=
nfo);
ec8b9981ad3f3e Tariq Toukan           2016-11-30  601  		mlx5_core_destroy_=
mkey(mdev, &rq->umr_mkey);
069d11465a802a Tariq Toukan           2018-05-02  602  		break;
069d11465a802a Tariq Toukan           2018-05-02  603  	default: /* MLX5_WQ=
_TYPE_CYCLIC */
069d11465a802a Tariq Toukan           2018-05-02  604  		kvfree(rq->wqe.fra=
gs);
069d11465a802a Tariq Toukan           2018-05-02  605  		mlx5e_free_di_list=
(rq);
069d11465a802a Tariq Toukan           2018-05-02  606  	}
ec8b9981ad3f3e Tariq Toukan           2016-11-30  607  =

f62b8bb8f2d305 Amir Vadai             2015-05-28  608  err_rq_wq_destroy:
97bc402db78212 Daniel Borkmann        2016-11-19  609  	if (rq->xdp_prog)
97bc402db78212 Daniel Borkmann        2016-11-19  610  		bpf_prog_put(rq->x=
dp_prog);
0ddf543226acac Jesper Dangaard Brouer 2018-01-03  611  	xdp_rxq_info_unreg(=
&rq->xdp_rxq);
1da4bbeffe41ba Ivan Khoronzhuk        2019-07-09  612  	page_pool_destroy(r=
q->page_pool);
f62b8bb8f2d305 Amir Vadai             2015-05-28  613  	mlx5_wq_destroy(&rq=
->wq_ctrl);
f62b8bb8f2d305 Amir Vadai             2015-05-28  614  =

f62b8bb8f2d305 Amir Vadai             2015-05-28  615  	return err;
f62b8bb8f2d305 Amir Vadai             2015-05-28  616  }
f62b8bb8f2d305 Amir Vadai             2015-05-28  617  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0759781080136672516==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
T7LJY8uLW6E8J/4HOhGKfGs7AgA=
--===============0759781080136672516==--

