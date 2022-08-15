Content-Type: multipart/mixed; boundary="===============0973494521825719174=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/en/htb.c:196 mlx5e_htb_root_add() warn: passing a valid pointer to 'PTR_ERR'
Date: Mon, 15 Aug 2022 14:01:50 +0800
Message-ID: <202208151424.UUpBioJg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0973494521825719174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Moshe Tal <moshet@nvidia.com>
CC: Saeed Mahameed <saeedm@nvidia.com>
CC: Tariq Toukan <tariqt@nvidia.com>
CC: Maxim Mikityanskiy <maximmi@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   568035b01cfb107af8d2e4bd2fb9aea22cf5b868
commit: 462b0059993696eaf863c23c2a12658e4fe0ccbf net/mlx5e: HTB, move htb f=
unctions to a new file
date:   4 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 weeks ago
config: parisc-randconfig-m031-20220807 (https://download.01.org/0day-ci/ar=
chive/20220815/202208151424.UUpBioJg-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/en/htb.c:196 mlx5e_htb_root_add() w=
arn: passing a valid pointer to 'PTR_ERR'
drivers/net/ethernet/mellanox/mlx5/core/en/htb.c:310 mlx5e_htb_leaf_alloc_q=
ueue() warn: passing a valid pointer to 'PTR_ERR'
drivers/net/ethernet/mellanox/mlx5/core/en/htb.c:371 mlx5e_htb_leaf_to_inne=
r() warn: passing a valid pointer to 'PTR_ERR'

Old smatch warnings:
arch/parisc/include/asm/hash.h:44 __hash_32() warn: inconsistent indenting

vim +/PTR_ERR +196 drivers/net/ethernet/mellanox/mlx5/core/en/htb.c

462b0059993696 Moshe Tal 2022-05-02  173  =

462b0059993696 Moshe Tal 2022-05-02  174  static int
462b0059993696 Moshe Tal 2022-05-02  175  mlx5e_htb_root_add(struct mlx5e_h=
tb *htb, u16 htb_maj_id, u16 htb_defcls,
462b0059993696 Moshe Tal 2022-05-02  176  		   struct netlink_ext_ack *exta=
ck)
462b0059993696 Moshe Tal 2022-05-02  177  {
462b0059993696 Moshe Tal 2022-05-02  178  	struct mlx5e_priv *priv =3D htb-=
>priv;
462b0059993696 Moshe Tal 2022-05-02  179  	struct mlx5e_qos_node *root;
462b0059993696 Moshe Tal 2022-05-02  180  	bool opened;
462b0059993696 Moshe Tal 2022-05-02  181  	int err;
462b0059993696 Moshe Tal 2022-05-02  182  =

462b0059993696 Moshe Tal 2022-05-02  183  	qos_dbg(htb->mdev, "TC_HTB_CREAT=
E handle %04x:, default :%04x\n", htb_maj_id, htb_defcls);
462b0059993696 Moshe Tal 2022-05-02  184  =

462b0059993696 Moshe Tal 2022-05-02  185  	mlx5e_selq_prepare_htb(htb->selq=
, htb_maj_id, htb_defcls);
462b0059993696 Moshe Tal 2022-05-02  186  =

462b0059993696 Moshe Tal 2022-05-02  187  	opened =3D test_bit(MLX5E_STATE_=
OPENED, &priv->state);
462b0059993696 Moshe Tal 2022-05-02  188  	if (opened) {
462b0059993696 Moshe Tal 2022-05-02  189  		err =3D mlx5e_qos_alloc_queues(=
priv, &priv->channels);
462b0059993696 Moshe Tal 2022-05-02  190  		if (err)
462b0059993696 Moshe Tal 2022-05-02  191  			goto err_cancel_selq;
462b0059993696 Moshe Tal 2022-05-02  192  	}
462b0059993696 Moshe Tal 2022-05-02  193  =

462b0059993696 Moshe Tal 2022-05-02  194  	root =3D mlx5e_htb_node_create_r=
oot(htb);
462b0059993696 Moshe Tal 2022-05-02  195  	if (IS_ERR(root)) {
462b0059993696 Moshe Tal 2022-05-02 @196  		err =3D PTR_ERR(root);
462b0059993696 Moshe Tal 2022-05-02  197  		goto err_free_queues;
462b0059993696 Moshe Tal 2022-05-02  198  	}
462b0059993696 Moshe Tal 2022-05-02  199  =

462b0059993696 Moshe Tal 2022-05-02  200  	err =3D mlx5_qos_create_root_nod=
e(htb->mdev, &root->hw_id);
462b0059993696 Moshe Tal 2022-05-02  201  	if (err) {
462b0059993696 Moshe Tal 2022-05-02  202  		NL_SET_ERR_MSG_MOD(extack, "Fir=
mware error. Try upgrading firmware.");
462b0059993696 Moshe Tal 2022-05-02  203  		goto err_sw_node_delete;
462b0059993696 Moshe Tal 2022-05-02  204  	}
462b0059993696 Moshe Tal 2022-05-02  205  =

462b0059993696 Moshe Tal 2022-05-02  206  	mlx5e_selq_apply(htb->selq);
462b0059993696 Moshe Tal 2022-05-02  207  =

462b0059993696 Moshe Tal 2022-05-02  208  	return 0;
462b0059993696 Moshe Tal 2022-05-02  209  =

462b0059993696 Moshe Tal 2022-05-02  210  err_sw_node_delete:
462b0059993696 Moshe Tal 2022-05-02  211  	mlx5e_htb_node_delete(htb, root);
462b0059993696 Moshe Tal 2022-05-02  212  =

462b0059993696 Moshe Tal 2022-05-02  213  err_free_queues:
462b0059993696 Moshe Tal 2022-05-02  214  	if (opened)
462b0059993696 Moshe Tal 2022-05-02  215  		mlx5e_qos_close_all_queues(&pri=
v->channels);
462b0059993696 Moshe Tal 2022-05-02  216  err_cancel_selq:
462b0059993696 Moshe Tal 2022-05-02  217  	mlx5e_selq_cancel(htb->selq);
462b0059993696 Moshe Tal 2022-05-02  218  	return err;
462b0059993696 Moshe Tal 2022-05-02  219  }
462b0059993696 Moshe Tal 2022-05-02  220  =

462b0059993696 Moshe Tal 2022-05-02  221  static int mlx5e_htb_root_del(str=
uct mlx5e_htb *htb)
462b0059993696 Moshe Tal 2022-05-02  222  {
462b0059993696 Moshe Tal 2022-05-02  223  	struct mlx5e_priv *priv =3D htb-=
>priv;
462b0059993696 Moshe Tal 2022-05-02  224  	struct mlx5e_qos_node *root;
462b0059993696 Moshe Tal 2022-05-02  225  	int err;
462b0059993696 Moshe Tal 2022-05-02  226  =

462b0059993696 Moshe Tal 2022-05-02  227  	qos_dbg(htb->mdev, "TC_HTB_DESTR=
OY\n");
462b0059993696 Moshe Tal 2022-05-02  228  =

462b0059993696 Moshe Tal 2022-05-02  229  	/* Wait until real_num_tx_queues=
 is updated for mlx5e_select_queue,
462b0059993696 Moshe Tal 2022-05-02  230  	 * so that we can safely switch =
to its non-HTB non-PTP fastpath.
462b0059993696 Moshe Tal 2022-05-02  231  	 */
462b0059993696 Moshe Tal 2022-05-02  232  	synchronize_net();
462b0059993696 Moshe Tal 2022-05-02  233  =

462b0059993696 Moshe Tal 2022-05-02  234  	mlx5e_selq_prepare_htb(htb->selq=
, 0, 0);
462b0059993696 Moshe Tal 2022-05-02  235  	mlx5e_selq_apply(htb->selq);
462b0059993696 Moshe Tal 2022-05-02  236  =

462b0059993696 Moshe Tal 2022-05-02  237  	root =3D mlx5e_htb_node_find(htb=
, MLX5E_HTB_CLASSID_ROOT);
462b0059993696 Moshe Tal 2022-05-02  238  	if (!root) {
462b0059993696 Moshe Tal 2022-05-02  239  		qos_err(htb->mdev, "Failed to f=
ind the root node in the QoS tree\n");
462b0059993696 Moshe Tal 2022-05-02  240  		return -ENOENT;
462b0059993696 Moshe Tal 2022-05-02  241  	}
462b0059993696 Moshe Tal 2022-05-02  242  	err =3D mlx5_qos_destroy_node(ht=
b->mdev, root->hw_id);
462b0059993696 Moshe Tal 2022-05-02  243  	if (err)
462b0059993696 Moshe Tal 2022-05-02  244  		qos_err(htb->mdev, "Failed to d=
estroy root node %u, err =3D %d\n",
462b0059993696 Moshe Tal 2022-05-02  245  			root->hw_id, err);
462b0059993696 Moshe Tal 2022-05-02  246  	mlx5e_htb_node_delete(htb, root);
462b0059993696 Moshe Tal 2022-05-02  247  =

462b0059993696 Moshe Tal 2022-05-02  248  	mlx5e_qos_deactivate_all_queues(=
&priv->channels);
462b0059993696 Moshe Tal 2022-05-02  249  	mlx5e_qos_close_all_queues(&priv=
->channels);
462b0059993696 Moshe Tal 2022-05-02  250  =

462b0059993696 Moshe Tal 2022-05-02  251  	return err;
462b0059993696 Moshe Tal 2022-05-02  252  }
462b0059993696 Moshe Tal 2022-05-02  253  =

462b0059993696 Moshe Tal 2022-05-02  254  static int mlx5e_htb_convert_rate=
(struct mlx5e_htb *htb, u64 rate,
462b0059993696 Moshe Tal 2022-05-02  255  				  struct mlx5e_qos_node *pare=
nt, u32 *bw_share)
462b0059993696 Moshe Tal 2022-05-02  256  {
462b0059993696 Moshe Tal 2022-05-02  257  	u64 share =3D 0;
462b0059993696 Moshe Tal 2022-05-02  258  =

462b0059993696 Moshe Tal 2022-05-02  259  	while (parent->classid !=3D MLX5=
E_HTB_CLASSID_ROOT && !parent->max_average_bw)
462b0059993696 Moshe Tal 2022-05-02  260  		parent =3D parent->parent;
462b0059993696 Moshe Tal 2022-05-02  261  =

462b0059993696 Moshe Tal 2022-05-02  262  	if (parent->max_average_bw)
462b0059993696 Moshe Tal 2022-05-02  263  		share =3D div64_u64(div_u64(rat=
e * 100, BYTES_IN_MBIT),
462b0059993696 Moshe Tal 2022-05-02  264  				  parent->max_average_bw);
462b0059993696 Moshe Tal 2022-05-02  265  	else
462b0059993696 Moshe Tal 2022-05-02  266  		share =3D 101;
462b0059993696 Moshe Tal 2022-05-02  267  =

462b0059993696 Moshe Tal 2022-05-02  268  	*bw_share =3D share =3D=3D 0 ? 1=
 : share > 100 ? 0 : share;
462b0059993696 Moshe Tal 2022-05-02  269  =

462b0059993696 Moshe Tal 2022-05-02  270  	qos_dbg(htb->mdev, "Convert: rat=
e %llu, parent ceil %llu -> bw_share %u\n",
462b0059993696 Moshe Tal 2022-05-02  271  		rate, (u64)parent->max_average_=
bw * BYTES_IN_MBIT, *bw_share);
462b0059993696 Moshe Tal 2022-05-02  272  =

462b0059993696 Moshe Tal 2022-05-02  273  	return 0;
462b0059993696 Moshe Tal 2022-05-02  274  }
462b0059993696 Moshe Tal 2022-05-02  275  =

462b0059993696 Moshe Tal 2022-05-02  276  static void mlx5e_htb_convert_cei=
l(struct mlx5e_htb *htb, u64 ceil, u32 *max_average_bw)
462b0059993696 Moshe Tal 2022-05-02  277  {
462b0059993696 Moshe Tal 2022-05-02  278  	/* Hardware treats 0 as "unlimit=
ed", set at least 1. */
462b0059993696 Moshe Tal 2022-05-02  279  	*max_average_bw =3D max_t(u32, d=
iv_u64(ceil, BYTES_IN_MBIT), 1);
462b0059993696 Moshe Tal 2022-05-02  280  =

462b0059993696 Moshe Tal 2022-05-02  281  	qos_dbg(htb->mdev, "Convert: cei=
l %llu -> max_average_bw %u\n",
462b0059993696 Moshe Tal 2022-05-02  282  		ceil, *max_average_bw);
462b0059993696 Moshe Tal 2022-05-02  283  }
462b0059993696 Moshe Tal 2022-05-02  284  =

462b0059993696 Moshe Tal 2022-05-02  285  int
462b0059993696 Moshe Tal 2022-05-02  286  mlx5e_htb_leaf_alloc_queue(struct=
 mlx5e_htb *htb, u16 classid,
462b0059993696 Moshe Tal 2022-05-02  287  			   u32 parent_classid, u64 rat=
e, u64 ceil,
462b0059993696 Moshe Tal 2022-05-02  288  			   struct netlink_ext_ack *ext=
ack)
462b0059993696 Moshe Tal 2022-05-02  289  {
462b0059993696 Moshe Tal 2022-05-02  290  	struct mlx5e_qos_node *node, *pa=
rent;
462b0059993696 Moshe Tal 2022-05-02  291  	struct mlx5e_priv *priv =3D htb-=
>priv;
462b0059993696 Moshe Tal 2022-05-02  292  	int qid;
462b0059993696 Moshe Tal 2022-05-02  293  	int err;
462b0059993696 Moshe Tal 2022-05-02  294  =

462b0059993696 Moshe Tal 2022-05-02  295  	qos_dbg(htb->mdev, "TC_HTB_LEAF_=
ALLOC_QUEUE classid %04x, parent %04x, rate %llu, ceil %llu\n",
462b0059993696 Moshe Tal 2022-05-02  296  		classid, parent_classid, rate, =
ceil);
462b0059993696 Moshe Tal 2022-05-02  297  =

462b0059993696 Moshe Tal 2022-05-02  298  	qid =3D mlx5e_htb_find_unused_qo=
s_qid(htb);
462b0059993696 Moshe Tal 2022-05-02  299  	if (qid < 0) {
462b0059993696 Moshe Tal 2022-05-02  300  		NL_SET_ERR_MSG_MOD(extack, "Max=
imum amount of leaf classes is reached.");
462b0059993696 Moshe Tal 2022-05-02  301  		return qid;
462b0059993696 Moshe Tal 2022-05-02  302  	}
462b0059993696 Moshe Tal 2022-05-02  303  =

462b0059993696 Moshe Tal 2022-05-02  304  	parent =3D mlx5e_htb_node_find(h=
tb, parent_classid);
462b0059993696 Moshe Tal 2022-05-02  305  	if (!parent)
462b0059993696 Moshe Tal 2022-05-02  306  		return -EINVAL;
462b0059993696 Moshe Tal 2022-05-02  307  =

462b0059993696 Moshe Tal 2022-05-02  308  	node =3D mlx5e_htb_node_create_l=
eaf(htb, classid, qid, parent);
462b0059993696 Moshe Tal 2022-05-02  309  	if (IS_ERR(node))
462b0059993696 Moshe Tal 2022-05-02 @310  		return PTR_ERR(node);
462b0059993696 Moshe Tal 2022-05-02  311  =

462b0059993696 Moshe Tal 2022-05-02  312  	node->rate =3D rate;
462b0059993696 Moshe Tal 2022-05-02  313  	mlx5e_htb_convert_rate(htb, rate=
, node->parent, &node->bw_share);
462b0059993696 Moshe Tal 2022-05-02  314  	mlx5e_htb_convert_ceil(htb, ceil=
, &node->max_average_bw);
462b0059993696 Moshe Tal 2022-05-02  315  =

462b0059993696 Moshe Tal 2022-05-02  316  	err =3D mlx5_qos_create_leaf_nod=
e(htb->mdev, node->parent->hw_id,
462b0059993696 Moshe Tal 2022-05-02  317  					node->bw_share, node->max_av=
erage_bw,
462b0059993696 Moshe Tal 2022-05-02  318  					&node->hw_id);
462b0059993696 Moshe Tal 2022-05-02  319  	if (err) {
462b0059993696 Moshe Tal 2022-05-02  320  		NL_SET_ERR_MSG_MOD(extack, "Fir=
mware error when creating a leaf node.");
462b0059993696 Moshe Tal 2022-05-02  321  		qos_err(htb->mdev, "Failed to c=
reate a leaf node (class %04x), err =3D %d\n",
462b0059993696 Moshe Tal 2022-05-02  322  			classid, err);
462b0059993696 Moshe Tal 2022-05-02  323  		mlx5e_htb_node_delete(htb, node=
);
462b0059993696 Moshe Tal 2022-05-02  324  		return err;
462b0059993696 Moshe Tal 2022-05-02  325  	}
462b0059993696 Moshe Tal 2022-05-02  326  =

462b0059993696 Moshe Tal 2022-05-02  327  	if (test_bit(MLX5E_STATE_OPENED,=
 &priv->state)) {
462b0059993696 Moshe Tal 2022-05-02  328  		err =3D mlx5e_open_qos_sq(priv,=
 &priv->channels, node->qid, node->hw_id);
462b0059993696 Moshe Tal 2022-05-02  329  		if (err) {
462b0059993696 Moshe Tal 2022-05-02  330  			NL_SET_ERR_MSG_MOD(extack, "Er=
ror creating an SQ.");
462b0059993696 Moshe Tal 2022-05-02  331  			qos_warn(htb->mdev, "Failed to=
 create a QoS SQ (class %04x), err =3D %d\n",
462b0059993696 Moshe Tal 2022-05-02  332  				 classid, err);
462b0059993696 Moshe Tal 2022-05-02  333  		} else {
462b0059993696 Moshe Tal 2022-05-02  334  			mlx5e_activate_qos_sq(priv, no=
de->qid, node->hw_id);
462b0059993696 Moshe Tal 2022-05-02  335  		}
462b0059993696 Moshe Tal 2022-05-02  336  	}
462b0059993696 Moshe Tal 2022-05-02  337  =

462b0059993696 Moshe Tal 2022-05-02  338  	return mlx5e_qid_from_qos(&priv-=
>channels, node->qid);
462b0059993696 Moshe Tal 2022-05-02  339  }
462b0059993696 Moshe Tal 2022-05-02  340  =

462b0059993696 Moshe Tal 2022-05-02  341  int
462b0059993696 Moshe Tal 2022-05-02  342  mlx5e_htb_leaf_to_inner(struct ml=
x5e_htb *htb, u16 classid, u16 child_classid,
462b0059993696 Moshe Tal 2022-05-02  343  			u64 rate, u64 ceil, struct net=
link_ext_ack *extack)
462b0059993696 Moshe Tal 2022-05-02  344  {
462b0059993696 Moshe Tal 2022-05-02  345  	struct mlx5e_qos_node *node, *ch=
ild;
462b0059993696 Moshe Tal 2022-05-02  346  	struct mlx5e_priv *priv =3D htb-=
>priv;
462b0059993696 Moshe Tal 2022-05-02  347  	int err, tmp_err;
462b0059993696 Moshe Tal 2022-05-02  348  	u32 new_hw_id;
462b0059993696 Moshe Tal 2022-05-02  349  	u16 qid;
462b0059993696 Moshe Tal 2022-05-02  350  =

462b0059993696 Moshe Tal 2022-05-02  351  	qos_dbg(htb->mdev, "TC_HTB_LEAF_=
TO_INNER classid %04x, upcoming child %04x, rate %llu, ceil %llu\n",
462b0059993696 Moshe Tal 2022-05-02  352  		classid, child_classid, rate, c=
eil);
462b0059993696 Moshe Tal 2022-05-02  353  =

462b0059993696 Moshe Tal 2022-05-02  354  	node =3D mlx5e_htb_node_find(htb=
, classid);
462b0059993696 Moshe Tal 2022-05-02  355  	if (!node)
462b0059993696 Moshe Tal 2022-05-02  356  		return -ENOENT;
462b0059993696 Moshe Tal 2022-05-02  357  =

462b0059993696 Moshe Tal 2022-05-02  358  	err =3D mlx5_qos_create_inner_no=
de(htb->mdev, node->parent->hw_id,
462b0059993696 Moshe Tal 2022-05-02  359  					 node->bw_share, node->max_a=
verage_bw,
462b0059993696 Moshe Tal 2022-05-02  360  					 &new_hw_id);
462b0059993696 Moshe Tal 2022-05-02  361  	if (err) {
462b0059993696 Moshe Tal 2022-05-02  362  		NL_SET_ERR_MSG_MOD(extack, "Fir=
mware error when creating an inner node.");
462b0059993696 Moshe Tal 2022-05-02  363  		qos_err(htb->mdev, "Failed to c=
reate an inner node (class %04x), err =3D %d\n",
462b0059993696 Moshe Tal 2022-05-02  364  			classid, err);
462b0059993696 Moshe Tal 2022-05-02  365  		return err;
462b0059993696 Moshe Tal 2022-05-02  366  	}
462b0059993696 Moshe Tal 2022-05-02  367  =

462b0059993696 Moshe Tal 2022-05-02  368  	/* Intentionally reuse the qid f=
or the upcoming first child. */
462b0059993696 Moshe Tal 2022-05-02  369  	child =3D mlx5e_htb_node_create_=
leaf(htb, child_classid, node->qid, node);
462b0059993696 Moshe Tal 2022-05-02  370  	if (IS_ERR(child)) {
462b0059993696 Moshe Tal 2022-05-02 @371  		err =3D PTR_ERR(child);
462b0059993696 Moshe Tal 2022-05-02  372  		goto err_destroy_hw_node;
462b0059993696 Moshe Tal 2022-05-02  373  	}
462b0059993696 Moshe Tal 2022-05-02  374  =

462b0059993696 Moshe Tal 2022-05-02  375  	child->rate =3D rate;
462b0059993696 Moshe Tal 2022-05-02  376  	mlx5e_htb_convert_rate(htb, rate=
, node, &child->bw_share);
462b0059993696 Moshe Tal 2022-05-02  377  	mlx5e_htb_convert_ceil(htb, ceil=
, &child->max_average_bw);
462b0059993696 Moshe Tal 2022-05-02  378  =

462b0059993696 Moshe Tal 2022-05-02  379  	err =3D mlx5_qos_create_leaf_nod=
e(htb->mdev, new_hw_id, child->bw_share,
462b0059993696 Moshe Tal 2022-05-02  380  					child->max_average_bw, &chil=
d->hw_id);
462b0059993696 Moshe Tal 2022-05-02  381  	if (err) {
462b0059993696 Moshe Tal 2022-05-02  382  		NL_SET_ERR_MSG_MOD(extack, "Fir=
mware error when creating a leaf node.");
462b0059993696 Moshe Tal 2022-05-02  383  		qos_err(htb->mdev, "Failed to c=
reate a leaf node (class %04x), err =3D %d\n",
462b0059993696 Moshe Tal 2022-05-02  384  			classid, err);
462b0059993696 Moshe Tal 2022-05-02  385  		goto err_delete_sw_node;
462b0059993696 Moshe Tal 2022-05-02  386  	}
462b0059993696 Moshe Tal 2022-05-02  387  =

462b0059993696 Moshe Tal 2022-05-02  388  	/* No fail point. */
462b0059993696 Moshe Tal 2022-05-02  389  =

462b0059993696 Moshe Tal 2022-05-02  390  	qid =3D node->qid;
462b0059993696 Moshe Tal 2022-05-02  391  	/* Pairs with mlx5e_htb_get_txq_=
by_classid. */
462b0059993696 Moshe Tal 2022-05-02  392  	WRITE_ONCE(node->qid, MLX5E_QOS_=
QID_INNER);
462b0059993696 Moshe Tal 2022-05-02  393  =

462b0059993696 Moshe Tal 2022-05-02  394  	if (test_bit(MLX5E_STATE_OPENED,=
 &priv->state)) {
462b0059993696 Moshe Tal 2022-05-02  395  		mlx5e_deactivate_qos_sq(priv, q=
id);
462b0059993696 Moshe Tal 2022-05-02  396  		mlx5e_close_qos_sq(priv, qid);
462b0059993696 Moshe Tal 2022-05-02  397  	}
462b0059993696 Moshe Tal 2022-05-02  398  =

462b0059993696 Moshe Tal 2022-05-02  399  	err =3D mlx5_qos_destroy_node(ht=
b->mdev, node->hw_id);
462b0059993696 Moshe Tal 2022-05-02  400  	if (err) /* Not fatal. */
462b0059993696 Moshe Tal 2022-05-02  401  		qos_warn(htb->mdev, "Failed to =
destroy leaf node %u (class %04x), err =3D %d\n",
462b0059993696 Moshe Tal 2022-05-02  402  			 node->hw_id, classid, err);
462b0059993696 Moshe Tal 2022-05-02  403  =

462b0059993696 Moshe Tal 2022-05-02  404  	node->hw_id =3D new_hw_id;
462b0059993696 Moshe Tal 2022-05-02  405  =

462b0059993696 Moshe Tal 2022-05-02  406  	if (test_bit(MLX5E_STATE_OPENED,=
 &priv->state)) {
462b0059993696 Moshe Tal 2022-05-02  407  		err =3D mlx5e_open_qos_sq(priv,=
 &priv->channels, child->qid, child->hw_id);
462b0059993696 Moshe Tal 2022-05-02  408  		if (err) {
462b0059993696 Moshe Tal 2022-05-02  409  			NL_SET_ERR_MSG_MOD(extack, "Er=
ror creating an SQ.");
462b0059993696 Moshe Tal 2022-05-02  410  			qos_warn(htb->mdev, "Failed to=
 create a QoS SQ (class %04x), err =3D %d\n",
462b0059993696 Moshe Tal 2022-05-02  411  				 classid, err);
462b0059993696 Moshe Tal 2022-05-02  412  		} else {
462b0059993696 Moshe Tal 2022-05-02  413  			mlx5e_activate_qos_sq(priv, ch=
ild->qid, child->hw_id);
462b0059993696 Moshe Tal 2022-05-02  414  		}
462b0059993696 Moshe Tal 2022-05-02  415  	}
462b0059993696 Moshe Tal 2022-05-02  416  =

462b0059993696 Moshe Tal 2022-05-02  417  	return 0;
462b0059993696 Moshe Tal 2022-05-02  418  =

462b0059993696 Moshe Tal 2022-05-02  419  err_delete_sw_node:
462b0059993696 Moshe Tal 2022-05-02  420  	child->qid =3D MLX5E_QOS_QID_INN=
ER;
462b0059993696 Moshe Tal 2022-05-02  421  	mlx5e_htb_node_delete(htb, child=
);
462b0059993696 Moshe Tal 2022-05-02  422  =

462b0059993696 Moshe Tal 2022-05-02  423  err_destroy_hw_node:
462b0059993696 Moshe Tal 2022-05-02  424  	tmp_err =3D mlx5_qos_destroy_nod=
e(htb->mdev, new_hw_id);
462b0059993696 Moshe Tal 2022-05-02  425  	if (tmp_err) /* Not fatal. */
462b0059993696 Moshe Tal 2022-05-02  426  		qos_warn(htb->mdev, "Failed to =
roll back creation of an inner node %u (class %04x), err =3D %d\n",
462b0059993696 Moshe Tal 2022-05-02  427  			 new_hw_id, classid, tmp_err);
462b0059993696 Moshe Tal 2022-05-02  428  	return err;
462b0059993696 Moshe Tal 2022-05-02  429  }
462b0059993696 Moshe Tal 2022-05-02  430  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0973494521825719174==--

