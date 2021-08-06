Content-Type: multipart/mixed; boundary="===============2151772790790613143=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:478 mlx5e_htb_root_add() warn: passing a valid pointer to 'PTR_ERR'
Date: Fri, 06 Aug 2021 09:22:59 +0800
Message-ID: <202108060953.uVCOBp4G-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2151772790790613143==
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
head:   902e7f373fff2476b53824264c12e4e76c7ec02a
commit: 214baf22870cfa437522f3bd4fbae56338674b04 net/mlx5e: Support HTB off=
load
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-m021-20210804 (attached as .config)
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

--===============2151772790790613143==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
nTPZfoU+AgA=
--===============2151772790790613143==--

