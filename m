Content-Type: multipart/mixed; boundary="===============7268313181220231921=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:478 mlx5e_htb_root_add() warn: passing a valid pointer to 'PTR_ERR'
Date: Sat, 11 Dec 2021 17:49:25 +0800
Message-ID: <202112111740.0t9cqfhr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7268313181220231921==
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
head:   6f513529296fd4f696afb4354c46508abe646541
commit: 214baf22870cfa437522f3bd4fbae56338674b04 net/mlx5e: Support HTB off=
load
date:   11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-m021-20211209 (https://download.01.org/0day-ci/arch=
ive/20211211/202112111740.0t9cqfhr-lkp(a)intel.com/config)
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

214baf22870cfa Maxim Mikityanskiy 2021-01-19  453  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  454  int mlx5e_htb_root_add(s=
truct mlx5e_priv *priv, u16 htb_maj_id, u16 htb_defcls,
214baf22870cfa Maxim Mikityanskiy 2021-01-19  455  		       struct netlink_=
ext_ack *extack)
214baf22870cfa Maxim Mikityanskiy 2021-01-19  456  {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  457  	struct mlx5e_qos_node *=
root;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  458  	bool opened;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  459  	int err;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  460  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  461  	qos_dbg(priv->mdev, "TC=
_HTB_CREATE handle %04x:, default :%04x\n", htb_maj_id, htb_defcls);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  462  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  463  	if (!mlx5_qos_is_suppor=
ted(priv->mdev)) {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  464  		NL_SET_ERR_MSG_MOD(ext=
ack,
214baf22870cfa Maxim Mikityanskiy 2021-01-19  465  				   "Missing QoS capa=
bilities. Try disabling SRIOV or use a supported device.");
214baf22870cfa Maxim Mikityanskiy 2021-01-19  466  		return -EOPNOTSUPP;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  467  	}
214baf22870cfa Maxim Mikityanskiy 2021-01-19  468  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  469  	opened =3D test_bit(MLX=
5E_STATE_OPENED, &priv->state);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  470  	if (opened) {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  471  		err =3D mlx5e_qos_allo=
c_queues(priv, &priv->channels);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  472  		if (err)
214baf22870cfa Maxim Mikityanskiy 2021-01-19  473  			return err;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  474  	}
214baf22870cfa Maxim Mikityanskiy 2021-01-19  475  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  476  	root =3D mlx5e_sw_node_=
create_root(priv);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  477  	if (IS_ERR(root)) {
214baf22870cfa Maxim Mikityanskiy 2021-01-19 @478  		err =3D PTR_ERR(root);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  479  		goto err_free_queues;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  480  	}
214baf22870cfa Maxim Mikityanskiy 2021-01-19  481  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  482  	err =3D mlx5_qos_create=
_root_node(priv->mdev, &root->hw_id);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  483  	if (err) {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  484  		NL_SET_ERR_MSG_MOD(ext=
ack, "Firmware error. Try upgrading firmware.");
214baf22870cfa Maxim Mikityanskiy 2021-01-19  485  		goto err_sw_node_delet=
e;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  486  	}
214baf22870cfa Maxim Mikityanskiy 2021-01-19  487  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  488  	WRITE_ONCE(priv->htb.de=
fcls, htb_defcls);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  489  	/* Order maj_id after d=
efcls - pairs with
214baf22870cfa Maxim Mikityanskiy 2021-01-19  490  	 * mlx5e_select_queue/m=
lx5e_select_htb_queues.
214baf22870cfa Maxim Mikityanskiy 2021-01-19  491  	 */
214baf22870cfa Maxim Mikityanskiy 2021-01-19  492  	smp_store_release(&priv=
->htb.maj_id, htb_maj_id);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  493  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  494  	return 0;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  495  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  496  err_sw_node_delete:
214baf22870cfa Maxim Mikityanskiy 2021-01-19  497  	mlx5e_sw_node_delete(pr=
iv, root);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  498  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  499  err_free_queues:
214baf22870cfa Maxim Mikityanskiy 2021-01-19  500  	if (opened)
214baf22870cfa Maxim Mikityanskiy 2021-01-19  501  		mlx5e_qos_close_all_qu=
eues(&priv->channels);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  502  	return err;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  503  }
214baf22870cfa Maxim Mikityanskiy 2021-01-19  504  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  505  int mlx5e_htb_root_del(s=
truct mlx5e_priv *priv)
214baf22870cfa Maxim Mikityanskiy 2021-01-19  506  {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  507  	struct mlx5e_qos_node *=
root;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  508  	int err;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  509  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  510  	qos_dbg(priv->mdev, "TC=
_HTB_DESTROY\n");
214baf22870cfa Maxim Mikityanskiy 2021-01-19  511  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  512  	WRITE_ONCE(priv->htb.ma=
j_id, 0);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  513  	synchronize_rcu(); /* S=
ync with mlx5e_select_htb_queue and TX data path. */
214baf22870cfa Maxim Mikityanskiy 2021-01-19  514  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  515  	root =3D mlx5e_sw_node_=
find(priv, MLX5E_HTB_CLASSID_ROOT);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  516  	if (!root) {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  517  		qos_err(priv->mdev, "F=
ailed to find the root node in the QoS tree\n");
214baf22870cfa Maxim Mikityanskiy 2021-01-19  518  		return -ENOENT;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  519  	}
214baf22870cfa Maxim Mikityanskiy 2021-01-19  520  	err =3D mlx5_qos_destro=
y_node(priv->mdev, root->hw_id);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  521  	if (err)
214baf22870cfa Maxim Mikityanskiy 2021-01-19  522  		qos_err(priv->mdev, "F=
ailed to destroy root node %u, err =3D %d\n",
214baf22870cfa Maxim Mikityanskiy 2021-01-19  523  			root->hw_id, err);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  524  	mlx5e_sw_node_delete(pr=
iv, root);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  525  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  526  	mlx5e_qos_deactivate_al=
l_queues(&priv->channels);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  527  	mlx5e_qos_close_all_que=
ues(&priv->channels);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  528  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  529  	return err;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  530  }
214baf22870cfa Maxim Mikityanskiy 2021-01-19  531  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  532  static int mlx5e_htb_con=
vert_rate(struct mlx5e_priv *priv, u64 rate,
214baf22870cfa Maxim Mikityanskiy 2021-01-19  533  				  struct mlx5e_qos_n=
ode *parent, u32 *bw_share)
214baf22870cfa Maxim Mikityanskiy 2021-01-19  534  {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  535  	u64 share =3D 0;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  536  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  537  	while (parent->classid =
!=3D MLX5E_HTB_CLASSID_ROOT && !parent->max_average_bw)
214baf22870cfa Maxim Mikityanskiy 2021-01-19  538  		parent =3D parent->par=
ent;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  539  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  540  	if (parent->max_average=
_bw)
214baf22870cfa Maxim Mikityanskiy 2021-01-19  541  		share =3D div64_u64(di=
v_u64(rate * 100, BYTES_IN_MBIT),
214baf22870cfa Maxim Mikityanskiy 2021-01-19  542  				  parent->max_averag=
e_bw);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  543  	else
214baf22870cfa Maxim Mikityanskiy 2021-01-19  544  		share =3D 101;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  545  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  546  	*bw_share =3D share =3D=
=3D 0 ? 1 : share > 100 ? 0 : share;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  547  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  548  	qos_dbg(priv->mdev, "Co=
nvert: rate %llu, parent ceil %llu -> bw_share %u\n",
214baf22870cfa Maxim Mikityanskiy 2021-01-19  549  		rate, (u64)parent->max=
_average_bw * BYTES_IN_MBIT, *bw_share);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  550  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  551  	return 0;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  552  }
214baf22870cfa Maxim Mikityanskiy 2021-01-19  553  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  554  static void mlx5e_htb_co=
nvert_ceil(struct mlx5e_priv *priv, u64 ceil, u32 *max_average_bw)
214baf22870cfa Maxim Mikityanskiy 2021-01-19  555  {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  556  	*max_average_bw =3D div=
_u64(ceil, BYTES_IN_MBIT);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  557  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  558  	qos_dbg(priv->mdev, "Co=
nvert: ceil %llu -> max_average_bw %u\n",
214baf22870cfa Maxim Mikityanskiy 2021-01-19  559  		ceil, *max_average_bw);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  560  }
214baf22870cfa Maxim Mikityanskiy 2021-01-19  561  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  562  int mlx5e_htb_leaf_alloc=
_queue(struct mlx5e_priv *priv, u16 classid,
214baf22870cfa Maxim Mikityanskiy 2021-01-19  563  			       u32 parent_cla=
ssid, u64 rate, u64 ceil,
214baf22870cfa Maxim Mikityanskiy 2021-01-19  564  			       struct netlink=
_ext_ack *extack)
214baf22870cfa Maxim Mikityanskiy 2021-01-19  565  {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  566  	struct mlx5e_qos_node *=
node, *parent;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  567  	int qid;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  568  	int err;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  569  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  570  	qos_dbg(priv->mdev, "TC=
_HTB_LEAF_ALLOC_QUEUE classid %04x, parent %04x, rate %llu, ceil %llu\n",
214baf22870cfa Maxim Mikityanskiy 2021-01-19  571  		classid, parent_classi=
d, rate, ceil);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  572  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  573  	qid =3D mlx5e_find_unus=
ed_qos_qid(priv);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  574  	if (qid < 0) {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  575  		NL_SET_ERR_MSG_MOD(ext=
ack, "Maximum amount of leaf classes is reached.");
214baf22870cfa Maxim Mikityanskiy 2021-01-19  576  		return qid;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  577  	}
214baf22870cfa Maxim Mikityanskiy 2021-01-19  578  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  579  	parent =3D mlx5e_sw_nod=
e_find(priv, parent_classid);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  580  	if (!parent)
214baf22870cfa Maxim Mikityanskiy 2021-01-19  581  		return -EINVAL;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  582  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  583  	node =3D mlx5e_sw_node_=
create_leaf(priv, classid, qid, parent);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  584  	if (IS_ERR(node))
214baf22870cfa Maxim Mikityanskiy 2021-01-19 @585  		return PTR_ERR(node);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  586  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  587  	node->rate =3D rate;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  588  	mlx5e_htb_convert_rate(=
priv, rate, node->parent, &node->bw_share);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  589  	mlx5e_htb_convert_ceil(=
priv, ceil, &node->max_average_bw);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  590  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  591  	err =3D mlx5_qos_create=
_leaf_node(priv->mdev, node->parent->hw_id,
214baf22870cfa Maxim Mikityanskiy 2021-01-19  592  					node->bw_share, nod=
e->max_average_bw,
214baf22870cfa Maxim Mikityanskiy 2021-01-19  593  					&node->hw_id);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  594  	if (err) {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  595  		NL_SET_ERR_MSG_MOD(ext=
ack, "Firmware error when creating a leaf node.");
214baf22870cfa Maxim Mikityanskiy 2021-01-19  596  		qos_err(priv->mdev, "F=
ailed to create a leaf node (class %04x), err =3D %d\n",
214baf22870cfa Maxim Mikityanskiy 2021-01-19  597  			classid, err);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  598  		mlx5e_sw_node_delete(p=
riv, node);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  599  		return err;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  600  	}
214baf22870cfa Maxim Mikityanskiy 2021-01-19  601  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  602  	if (test_bit(MLX5E_STAT=
E_OPENED, &priv->state)) {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  603  		err =3D mlx5e_open_qos=
_sq(priv, &priv->channels, node);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  604  		if (err) {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  605  			NL_SET_ERR_MSG_MOD(ex=
tack, "Error creating an SQ.");
214baf22870cfa Maxim Mikityanskiy 2021-01-19  606  			qos_warn(priv->mdev, =
"Failed to create a QoS SQ (class %04x), err =3D %d\n",
214baf22870cfa Maxim Mikityanskiy 2021-01-19  607  				 classid, err);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  608  		} else {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  609  			mlx5e_activate_qos_sq=
(priv, node);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  610  		}
214baf22870cfa Maxim Mikityanskiy 2021-01-19  611  	}
214baf22870cfa Maxim Mikityanskiy 2021-01-19  612  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  613  	return mlx5e_qid_from_q=
os(&priv->channels, node->qid);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  614  }
214baf22870cfa Maxim Mikityanskiy 2021-01-19  615  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  616  int mlx5e_htb_leaf_to_in=
ner(struct mlx5e_priv *priv, u16 classid, u16 child_classid,
214baf22870cfa Maxim Mikityanskiy 2021-01-19  617  			    u64 rate, u64 cei=
l, struct netlink_ext_ack *extack)
214baf22870cfa Maxim Mikityanskiy 2021-01-19  618  {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  619  	struct mlx5e_qos_node *=
node, *child;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  620  	int err, tmp_err;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  621  	u32 new_hw_id;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  622  	u16 qid;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  623  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  624  	qos_dbg(priv->mdev, "TC=
_HTB_LEAF_TO_INNER classid %04x, upcoming child %04x, rate %llu, ceil %llu\=
n",
214baf22870cfa Maxim Mikityanskiy 2021-01-19  625  		classid, child_classid=
, rate, ceil);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  626  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  627  	node =3D mlx5e_sw_node_=
find(priv, classid);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  628  	if (!node)
214baf22870cfa Maxim Mikityanskiy 2021-01-19  629  		return -ENOENT;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  630  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  631  	err =3D mlx5_qos_create=
_inner_node(priv->mdev, node->parent->hw_id,
214baf22870cfa Maxim Mikityanskiy 2021-01-19  632  					 node->bw_share, no=
de->max_average_bw,
214baf22870cfa Maxim Mikityanskiy 2021-01-19  633  					 &new_hw_id);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  634  	if (err) {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  635  		NL_SET_ERR_MSG_MOD(ext=
ack, "Firmware error when creating an inner node.");
214baf22870cfa Maxim Mikityanskiy 2021-01-19  636  		qos_err(priv->mdev, "F=
ailed to create an inner node (class %04x), err =3D %d\n",
214baf22870cfa Maxim Mikityanskiy 2021-01-19  637  			classid, err);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  638  		return err;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  639  	}
214baf22870cfa Maxim Mikityanskiy 2021-01-19  640  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  641  	/* Intentionally reuse =
the qid for the upcoming first child. */
214baf22870cfa Maxim Mikityanskiy 2021-01-19  642  	child =3D mlx5e_sw_node=
_create_leaf(priv, child_classid, node->qid, node);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  643  	if (IS_ERR(child)) {
214baf22870cfa Maxim Mikityanskiy 2021-01-19 @644  		err =3D PTR_ERR(child);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  645  		goto err_destroy_hw_no=
de;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  646  	}
214baf22870cfa Maxim Mikityanskiy 2021-01-19  647  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  648  	child->rate =3D rate;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  649  	mlx5e_htb_convert_rate(=
priv, rate, node, &child->bw_share);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  650  	mlx5e_htb_convert_ceil(=
priv, ceil, &child->max_average_bw);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  651  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  652  	err =3D mlx5_qos_create=
_leaf_node(priv->mdev, new_hw_id, child->bw_share,
214baf22870cfa Maxim Mikityanskiy 2021-01-19  653  					child->max_average_=
bw, &child->hw_id);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  654  	if (err) {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  655  		NL_SET_ERR_MSG_MOD(ext=
ack, "Firmware error when creating a leaf node.");
214baf22870cfa Maxim Mikityanskiy 2021-01-19  656  		qos_err(priv->mdev, "F=
ailed to create a leaf node (class %04x), err =3D %d\n",
214baf22870cfa Maxim Mikityanskiy 2021-01-19  657  			classid, err);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  658  		goto err_delete_sw_nod=
e;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  659  	}
214baf22870cfa Maxim Mikityanskiy 2021-01-19  660  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  661  	/* No fail point. */
214baf22870cfa Maxim Mikityanskiy 2021-01-19  662  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  663  	qid =3D node->qid;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  664  	/* Pairs with mlx5e_get=
_txq_by_classid. */
214baf22870cfa Maxim Mikityanskiy 2021-01-19  665  	WRITE_ONCE(node->qid, M=
LX5E_QOS_QID_INNER);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  666  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  667  	if (test_bit(MLX5E_STAT=
E_OPENED, &priv->state)) {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  668  		mlx5e_deactivate_qos_s=
q(priv, qid);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  669  		mlx5e_close_qos_sq(pri=
v, qid);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  670  	}
214baf22870cfa Maxim Mikityanskiy 2021-01-19  671  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  672  	err =3D mlx5_qos_destro=
y_node(priv->mdev, node->hw_id);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  673  	if (err) /* Not fatal. =
*/
214baf22870cfa Maxim Mikityanskiy 2021-01-19  674  		qos_warn(priv->mdev, "=
Failed to destroy leaf node %u (class %04x), err =3D %d\n",
214baf22870cfa Maxim Mikityanskiy 2021-01-19  675  			 node->hw_id, classid=
, err);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  676  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  677  	node->hw_id =3D new_hw_=
id;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  678  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  679  	if (test_bit(MLX5E_STAT=
E_OPENED, &priv->state)) {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  680  		err =3D mlx5e_open_qos=
_sq(priv, &priv->channels, child);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  681  		if (err) {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  682  			NL_SET_ERR_MSG_MOD(ex=
tack, "Error creating an SQ.");
214baf22870cfa Maxim Mikityanskiy 2021-01-19  683  			qos_warn(priv->mdev, =
"Failed to create a QoS SQ (class %04x), err =3D %d\n",
214baf22870cfa Maxim Mikityanskiy 2021-01-19  684  				 classid, err);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  685  		} else {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  686  			mlx5e_activate_qos_sq=
(priv, child);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  687  		}
214baf22870cfa Maxim Mikityanskiy 2021-01-19  688  	}
214baf22870cfa Maxim Mikityanskiy 2021-01-19  689  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  690  	return 0;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  691  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  692  err_delete_sw_node:
214baf22870cfa Maxim Mikityanskiy 2021-01-19  693  	child->qid =3D MLX5E_QO=
S_QID_INNER;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  694  	mlx5e_sw_node_delete(pr=
iv, child);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  695  =

214baf22870cfa Maxim Mikityanskiy 2021-01-19  696  err_destroy_hw_node:
214baf22870cfa Maxim Mikityanskiy 2021-01-19  697  	tmp_err =3D mlx5_qos_de=
stroy_node(priv->mdev, new_hw_id);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  698  	if (tmp_err) /* Not fat=
al. */
214baf22870cfa Maxim Mikityanskiy 2021-01-19  699  		qos_warn(priv->mdev, "=
Failed to roll back creation of an inner node %u (class %04x), err =3D %d\n=
",
214baf22870cfa Maxim Mikityanskiy 2021-01-19  700  			 new_hw_id, classid, =
tmp_err);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  701  	return err;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  702  }
214baf22870cfa Maxim Mikityanskiy 2021-01-19  703  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7268313181220231921==--

