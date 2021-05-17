Content-Type: multipart/mixed; boundary="===============1971757582562204031=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:478 mlx5e_htb_root_add() warn: passing a valid pointer to 'PTR_ERR'
Date: Mon, 17 May 2021 12:00:17 +0800
Message-ID: <202105171213.fRoA1BYA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1971757582562204031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Maxim Mikityanskiy <maximmi@mellanox.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Tariq Toukan <tariqt@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d07f6ca923ea0927a1024dfccafc5b53b61cfecc
commit: 214baf22870cfa437522f3bd4fbae56338674b04 net/mlx5e: Support HTB off=
load
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-m021-20210517 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:478 mlx5e_htb_root_add() w=
arn: passing a valid pointer to 'PTR_ERR'
drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:585 mlx5e_htb_leaf_alloc_q=
ueue() warn: passing a valid pointer to 'PTR_ERR'
drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:644 mlx5e_htb_leaf_to_inne=
r() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +478 drivers/net/ethernet/mellanox/mlx5/core/en/qos.c

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  453  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  454  int mlx5e_htb_root_add(=
struct mlx5e_priv *priv, u16 htb_maj_id, u16 htb_defcls,
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  455  		       struct netlink=
_ext_ack *extack)
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  456  {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  457  	struct mlx5e_qos_node =
*root;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  458  	bool opened;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  459  	int err;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  460  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  461  	qos_dbg(priv->mdev, "T=
C_HTB_CREATE handle %04x:, default :%04x\n", htb_maj_id, htb_defcls);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  462  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  463  	if (!mlx5_qos_is_suppo=
rted(priv->mdev)) {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  464  		NL_SET_ERR_MSG_MOD(ex=
tack,
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  465  				   "Missing QoS cap=
abilities. Try disabling SRIOV or use a supported device.");
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  466  		return -EOPNOTSUPP;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  467  	}
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  468  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  469  	opened =3D test_bit(ML=
X5E_STATE_OPENED, &priv->state);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  470  	if (opened) {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  471  		err =3D mlx5e_qos_all=
oc_queues(priv, &priv->channels);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  472  		if (err)
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  473  			return err;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  474  	}
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  475  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  476  	root =3D mlx5e_sw_node=
_create_root(priv);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  477  	if (IS_ERR(root)) {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19 @478  		err =3D PTR_ERR(root);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  479  		goto err_free_queues;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  480  	}
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  481  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  482  	err =3D mlx5_qos_creat=
e_root_node(priv->mdev, &root->hw_id);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  483  	if (err) {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  484  		NL_SET_ERR_MSG_MOD(ex=
tack, "Firmware error. Try upgrading firmware.");
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  485  		goto err_sw_node_dele=
te;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  486  	}
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  487  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  488  	WRITE_ONCE(priv->htb.d=
efcls, htb_defcls);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  489  	/* Order maj_id after =
defcls - pairs with
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  490  	 * mlx5e_select_queue/=
mlx5e_select_htb_queues.
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  491  	 */
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  492  	smp_store_release(&pri=
v->htb.maj_id, htb_maj_id);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  493  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  494  	return 0;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  495  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  496  err_sw_node_delete:
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  497  	mlx5e_sw_node_delete(p=
riv, root);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  498  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  499  err_free_queues:
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  500  	if (opened)
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  501  		mlx5e_qos_close_all_q=
ueues(&priv->channels);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  502  	return err;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  503  }
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  504  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  505  int mlx5e_htb_root_del(=
struct mlx5e_priv *priv)
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  506  {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  507  	struct mlx5e_qos_node =
*root;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  508  	int err;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  509  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  510  	qos_dbg(priv->mdev, "T=
C_HTB_DESTROY\n");
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  511  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  512  	WRITE_ONCE(priv->htb.m=
aj_id, 0);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  513  	synchronize_rcu(); /* =
Sync with mlx5e_select_htb_queue and TX data path. */
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  514  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  515  	root =3D mlx5e_sw_node=
_find(priv, MLX5E_HTB_CLASSID_ROOT);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  516  	if (!root) {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  517  		qos_err(priv->mdev, "=
Failed to find the root node in the QoS tree\n");
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  518  		return -ENOENT;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  519  	}
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  520  	err =3D mlx5_qos_destr=
oy_node(priv->mdev, root->hw_id);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  521  	if (err)
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  522  		qos_err(priv->mdev, "=
Failed to destroy root node %u, err =3D %d\n",
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  523  			root->hw_id, err);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  524  	mlx5e_sw_node_delete(p=
riv, root);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  525  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  526  	mlx5e_qos_deactivate_a=
ll_queues(&priv->channels);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  527  	mlx5e_qos_close_all_qu=
eues(&priv->channels);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  528  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  529  	return err;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  530  }
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  531  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  532  static int mlx5e_htb_co=
nvert_rate(struct mlx5e_priv *priv, u64 rate,
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  533  				  struct mlx5e_qos_=
node *parent, u32 *bw_share)
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  534  {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  535  	u64 share =3D 0;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  536  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  537  	while (parent->classid=
 !=3D MLX5E_HTB_CLASSID_ROOT && !parent->max_average_bw)
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  538  		parent =3D parent->pa=
rent;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  539  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  540  	if (parent->max_averag=
e_bw)
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  541  		share =3D div64_u64(d=
iv_u64(rate * 100, BYTES_IN_MBIT),
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  542  				  parent->max_avera=
ge_bw);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  543  	else
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  544  		share =3D 101;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  545  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  546  	*bw_share =3D share =
=3D=3D 0 ? 1 : share > 100 ? 0 : share;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  547  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  548  	qos_dbg(priv->mdev, "C=
onvert: rate %llu, parent ceil %llu -> bw_share %u\n",
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  549  		rate, (u64)parent->ma=
x_average_bw * BYTES_IN_MBIT, *bw_share);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  550  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  551  	return 0;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  552  }
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  553  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  554  static void mlx5e_htb_c=
onvert_ceil(struct mlx5e_priv *priv, u64 ceil, u32 *max_average_bw)
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  555  {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  556  	*max_average_bw =3D di=
v_u64(ceil, BYTES_IN_MBIT);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  557  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  558  	qos_dbg(priv->mdev, "C=
onvert: ceil %llu -> max_average_bw %u\n",
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  559  		ceil, *max_average_bw=
);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  560  }
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  561  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  562  int mlx5e_htb_leaf_allo=
c_queue(struct mlx5e_priv *priv, u16 classid,
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  563  			       u32 parent_cl=
assid, u64 rate, u64 ceil,
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  564  			       struct netlin=
k_ext_ack *extack)
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  565  {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  566  	struct mlx5e_qos_node =
*node, *parent;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  567  	int qid;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  568  	int err;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  569  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  570  	qos_dbg(priv->mdev, "T=
C_HTB_LEAF_ALLOC_QUEUE classid %04x, parent %04x, rate %llu, ceil %llu\n",
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  571  		classid, parent_class=
id, rate, ceil);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  572  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  573  	qid =3D mlx5e_find_unu=
sed_qos_qid(priv);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  574  	if (qid < 0) {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  575  		NL_SET_ERR_MSG_MOD(ex=
tack, "Maximum amount of leaf classes is reached.");
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  576  		return qid;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  577  	}
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  578  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  579  	parent =3D mlx5e_sw_no=
de_find(priv, parent_classid);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  580  	if (!parent)
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  581  		return -EINVAL;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  582  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  583  	node =3D mlx5e_sw_node=
_create_leaf(priv, classid, qid, parent);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  584  	if (IS_ERR(node))
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19 @585  		return PTR_ERR(node);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  586  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  587  	node->rate =3D rate;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  588  	mlx5e_htb_convert_rate=
(priv, rate, node->parent, &node->bw_share);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  589  	mlx5e_htb_convert_ceil=
(priv, ceil, &node->max_average_bw);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  590  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  591  	err =3D mlx5_qos_creat=
e_leaf_node(priv->mdev, node->parent->hw_id,
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  592  					node->bw_share, no=
de->max_average_bw,
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  593  					&node->hw_id);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  594  	if (err) {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  595  		NL_SET_ERR_MSG_MOD(ex=
tack, "Firmware error when creating a leaf node.");
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  596  		qos_err(priv->mdev, "=
Failed to create a leaf node (class %04x), err =3D %d\n",
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  597  			classid, err);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  598  		mlx5e_sw_node_delete(=
priv, node);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  599  		return err;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  600  	}
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  601  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  602  	if (test_bit(MLX5E_STA=
TE_OPENED, &priv->state)) {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  603  		err =3D mlx5e_open_qo=
s_sq(priv, &priv->channels, node);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  604  		if (err) {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  605  			NL_SET_ERR_MSG_MOD(e=
xtack, "Error creating an SQ.");
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  606  			qos_warn(priv->mdev,=
 "Failed to create a QoS SQ (class %04x), err =3D %d\n",
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  607  				 classid, err);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  608  		} else {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  609  			mlx5e_activate_qos_s=
q(priv, node);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  610  		}
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  611  	}
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  612  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  613  	return mlx5e_qid_from_=
qos(&priv->channels, node->qid);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  614  }
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  615  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  616  int mlx5e_htb_leaf_to_i=
nner(struct mlx5e_priv *priv, u16 classid, u16 child_classid,
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  617  			    u64 rate, u64 ce=
il, struct netlink_ext_ack *extack)
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  618  {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  619  	struct mlx5e_qos_node =
*node, *child;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  620  	int err, tmp_err;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  621  	u32 new_hw_id;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  622  	u16 qid;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  623  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  624  	qos_dbg(priv->mdev, "T=
C_HTB_LEAF_TO_INNER classid %04x, upcoming child %04x, rate %llu, ceil %llu=
\n",
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  625  		classid, child_classi=
d, rate, ceil);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  626  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  627  	node =3D mlx5e_sw_node=
_find(priv, classid);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  628  	if (!node)
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  629  		return -ENOENT;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  630  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  631  	err =3D mlx5_qos_creat=
e_inner_node(priv->mdev, node->parent->hw_id,
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  632  					 node->bw_share, n=
ode->max_average_bw,
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  633  					 &new_hw_id);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  634  	if (err) {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  635  		NL_SET_ERR_MSG_MOD(ex=
tack, "Firmware error when creating an inner node.");
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  636  		qos_err(priv->mdev, "=
Failed to create an inner node (class %04x), err =3D %d\n",
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  637  			classid, err);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  638  		return err;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  639  	}
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  640  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  641  	/* Intentionally reuse=
 the qid for the upcoming first child. */
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  642  	child =3D mlx5e_sw_nod=
e_create_leaf(priv, child_classid, node->qid, node);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  643  	if (IS_ERR(child)) {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19 @644  		err =3D PTR_ERR(child=
);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  645  		goto err_destroy_hw_n=
ode;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  646  	}
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  647  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  648  	child->rate =3D rate;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  649  	mlx5e_htb_convert_rate=
(priv, rate, node, &child->bw_share);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  650  	mlx5e_htb_convert_ceil=
(priv, ceil, &child->max_average_bw);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  651  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  652  	err =3D mlx5_qos_creat=
e_leaf_node(priv->mdev, new_hw_id, child->bw_share,
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  653  					child->max_average=
_bw, &child->hw_id);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  654  	if (err) {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  655  		NL_SET_ERR_MSG_MOD(ex=
tack, "Firmware error when creating a leaf node.");
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  656  		qos_err(priv->mdev, "=
Failed to create a leaf node (class %04x), err =3D %d\n",
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  657  			classid, err);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  658  		goto err_delete_sw_no=
de;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  659  	}
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  660  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  661  	/* No fail point. */
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  662  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  663  	qid =3D node->qid;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  664  	/* Pairs with mlx5e_ge=
t_txq_by_classid. */
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  665  	WRITE_ONCE(node->qid, =
MLX5E_QOS_QID_INNER);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  666  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  667  	if (test_bit(MLX5E_STA=
TE_OPENED, &priv->state)) {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  668  		mlx5e_deactivate_qos_=
sq(priv, qid);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  669  		mlx5e_close_qos_sq(pr=
iv, qid);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  670  	}
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  671  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  672  	err =3D mlx5_qos_destr=
oy_node(priv->mdev, node->hw_id);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  673  	if (err) /* Not fatal.=
 */
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  674  		qos_warn(priv->mdev, =
"Failed to destroy leaf node %u (class %04x), err =3D %d\n",
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  675  			 node->hw_id, classi=
d, err);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  676  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  677  	node->hw_id =3D new_hw=
_id;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  678  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  679  	if (test_bit(MLX5E_STA=
TE_OPENED, &priv->state)) {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  680  		err =3D mlx5e_open_qo=
s_sq(priv, &priv->channels, child);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  681  		if (err) {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  682  			NL_SET_ERR_MSG_MOD(e=
xtack, "Error creating an SQ.");
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  683  			qos_warn(priv->mdev,=
 "Failed to create a QoS SQ (class %04x), err =3D %d\n",
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  684  				 classid, err);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  685  		} else {
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  686  			mlx5e_activate_qos_s=
q(priv, child);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  687  		}
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  688  	}
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  689  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  690  	return 0;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  691  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  692  err_delete_sw_node:
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  693  	child->qid =3D MLX5E_Q=
OS_QID_INNER;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  694  	mlx5e_sw_node_delete(p=
riv, child);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  695  =

214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  696  err_destroy_hw_node:
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  697  	tmp_err =3D mlx5_qos_d=
estroy_node(priv->mdev, new_hw_id);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  698  	if (tmp_err) /* Not fa=
tal. */
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  699  		qos_warn(priv->mdev, =
"Failed to roll back creation of an inner node %u (class %04x), err =3D %d\=
n",
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  700  			 new_hw_id, classid,=
 tmp_err);
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  701  	return err;
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  702  }
214baf22870cfa4 Maxim Mikityanskiy 2021-01-19  703  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1971757582562204031==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
bsfs4RhV63Pe0X89sUi30fkBAA==
--===============1971757582562204031==--

