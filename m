Content-Type: multipart/mixed; boundary="===============3765784696389305824=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next v3 4/4] net/mlx5e: Support HTB offload
Date: Mon, 28 Dec 2020 08:57:16 +0800
Message-ID: <202012280823.gOqwrL4F-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3765784696389305824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20201215074213.32652-6-maximmi@mellanox.com>
References: <20201215074213.32652-6-maximmi@mellanox.com>
TO: Maxim Mikityanskiy <maximmi@mellanox.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev(a)vger.kernel.org
TO: Jamal Hadi Salim <jhs@mojatatu.com>
TO: Cong Wang <xiyou.wangcong@gmail.com>
TO: Jiri Pirko <jiri@resnulli.us>
TO: David Ahern <dsahern@gmail.com>
CC: Saeed Mahameed <saeedm@nvidia.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Tariq Toukan <tariqt@nvidia.com>
CC: Yossi Kuperman <yossiku@nvidia.com>

Hi Maxim,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Maxim-Mikityanskiy/net-sch=
ed-Add-multi-queue-support-to-sch_tree_lock/20201215-164306
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
efd5a1584537698220578227e6467638307c2a0b
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: i386-randconfig-m021-20201227 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:474 mlx5e_htb_root_add() w=
arn: passing a valid pointer to 'PTR_ERR'
drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:576 mlx5e_htb_leaf_alloc_q=
ueue() warn: passing a valid pointer to 'PTR_ERR'
drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:631 mlx5e_htb_leaf_to_inne=
r() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +474 drivers/net/ethernet/mellanox/mlx5/core/en/qos.c

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  453  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  454  int mlx5e_htb_root_add(=
struct mlx5e_priv *priv, u16 htb_maj_id, u16 htb_defcls)
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  455  {
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  456  	struct mlx5e_qos_node =
*root;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  457  	bool opened;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  458  	int err;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  459  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  460  	qos_dbg(priv->mdev, "T=
C_HTB_CREATE handle %04x:, default :%04x\n", htb_maj_id, htb_defcls);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  461  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  462  	if (!mlx5_qos_is_suppo=
rted(priv->mdev))
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  463  		return -EOPNOTSUPP;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  464  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  465  	opened =3D test_bit(ML=
X5E_STATE_OPENED, &priv->state);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  466  	if (opened) {
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  467  		err =3D mlx5e_qos_all=
oc_queues(priv, &priv->channels);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  468  		if (err)
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  469  			return err;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  470  	}
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  471  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  472  	root =3D mlx5e_sw_node=
_create_root(priv);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  473  	if (IS_ERR(root)) {
d34a73d10048450 Maxim Mikityanskiy 2020-12-15 @474  		err =3D PTR_ERR(root);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  475  		goto err_free_queues;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  476  	}
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  477  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  478  	err =3D mlx5_qos_creat=
e_root_node(priv->mdev, &root->hw_id);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  479  	if (err)
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  480  		goto err_sw_node_dele=
te;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  481  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  482  	WRITE_ONCE(priv->htb.d=
efcls, htb_defcls);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  483  	/* Order maj_id after =
defcls - pairs with
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  484  	 * mlx5e_select_queue/=
mlx5e_select_htb_queues.
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  485  	 */
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  486  	smp_store_release(&pri=
v->htb.maj_id, htb_maj_id);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  487  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  488  	return 0;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  489  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  490  err_sw_node_delete:
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  491  	mlx5e_sw_node_delete(p=
riv, root);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  492  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  493  err_free_queues:
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  494  	if (opened)
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  495  		mlx5e_qos_close_all_q=
ueues(&priv->channels);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  496  	return err;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  497  }
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  498  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  499  int mlx5e_htb_root_del(=
struct mlx5e_priv *priv)
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  500  {
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  501  	struct mlx5e_qos_node =
*root;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  502  	int err;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  503  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  504  	qos_dbg(priv->mdev, "T=
C_HTB_DESTROY\n");
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  505  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  506  	WRITE_ONCE(priv->htb.m=
aj_id, 0);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  507  	synchronize_rcu(); /* =
Sync with mlx5e_select_htb_queue and TX data path. */
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  508  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  509  	root =3D mlx5e_sw_node=
_find(priv, MLX5E_HTB_CLASSID_ROOT);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  510  	if (!root) {
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  511  		qos_warn(priv->mdev, =
"Failed to find the root node in the QoS tree\n");
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  512  		return -ENOENT;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  513  	}
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  514  	err =3D mlx5_qos_destr=
oy_node(priv->mdev, root->hw_id);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  515  	if (err)
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  516  		qos_warn(priv->mdev, =
"Failed to destroy root node %u, err =3D %d\n",
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  517  			 root->hw_id, err);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  518  	mlx5e_sw_node_delete(p=
riv, root);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  519  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  520  	mlx5e_qos_deactivate_a=
ll_queues(&priv->channels);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  521  	mlx5e_qos_close_all_qu=
eues(&priv->channels);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  522  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  523  	return err;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  524  }
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  525  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  526  static int mlx5e_htb_co=
nvert_rate(struct mlx5e_priv *priv, u64 rate,
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  527  				  struct mlx5e_qos_=
node *parent, u32 *bw_share)
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  528  {
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  529  	u64 share =3D 0;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  530  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  531  	while (parent->classid=
 !=3D MLX5E_HTB_CLASSID_ROOT && !parent->max_average_bw)
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  532  		parent =3D parent->pa=
rent;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  533  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  534  	if (parent->max_averag=
e_bw)
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  535  		share =3D div64_u64(d=
iv_u64(rate * 100, BYTES_IN_MBIT),
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  536  				  parent->max_avera=
ge_bw);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  537  	else
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  538  		share =3D 101;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  539  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  540  	*bw_share =3D share =
=3D=3D 0 ? 1 : share > 100 ? 0 : share;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  541  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  542  	qos_dbg(priv->mdev, "C=
onvert: rate %llu, parent ceil %llu -> bw_share %u\n",
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  543  		rate, (u64)parent->ma=
x_average_bw * BYTES_IN_MBIT, *bw_share);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  544  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  545  	return 0;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  546  }
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  547  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  548  static void mlx5e_htb_c=
onvert_ceil(struct mlx5e_priv *priv, u64 ceil, u32 *max_average_bw)
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  549  {
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  550  	*max_average_bw =3D di=
v_u64(ceil, BYTES_IN_MBIT);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  551  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  552  	qos_dbg(priv->mdev, "C=
onvert: ceil %llu -> max_average_bw %u\n",
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  553  		ceil, *max_average_bw=
);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  554  }
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  555  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  556  int mlx5e_htb_leaf_allo=
c_queue(struct mlx5e_priv *priv, u16 classid,
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  557  			       u32 parent_cl=
assid, u64 rate, u64 ceil)
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  558  {
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  559  	struct mlx5e_qos_node =
*node, *parent;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  560  	int qid;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  561  	int err;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  562  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  563  	qos_dbg(priv->mdev, "T=
C_HTB_LEAF_ALLOC_QUEUE classid %04x, parent %04x, rate %llu, ceil %llu\n",
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  564  		classid, parent_class=
id, rate, ceil);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  565  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  566  	qid =3D mlx5e_find_unu=
sed_qos_qid(priv);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  567  	if (qid < 0)
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  568  		return qid;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  569  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  570  	parent =3D mlx5e_sw_no=
de_find(priv, parent_classid);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  571  	if (!parent)
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  572  		return -EINVAL;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  573  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  574  	node =3D mlx5e_sw_node=
_create_leaf(priv, classid, qid, parent);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  575  	if (IS_ERR(node))
d34a73d10048450 Maxim Mikityanskiy 2020-12-15 @576  		return PTR_ERR(node);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  577  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  578  	node->rate =3D rate;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  579  	mlx5e_htb_convert_rate=
(priv, rate, node->parent, &node->bw_share);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  580  	mlx5e_htb_convert_ceil=
(priv, ceil, &node->max_average_bw);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  581  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  582  	err =3D mlx5_qos_creat=
e_leaf_node(priv->mdev, node->parent->hw_id,
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  583  					node->bw_share, no=
de->max_average_bw,
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  584  					&node->hw_id);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  585  	if (err) {
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  586  		qos_warn(priv->mdev, =
"Failed to create a leaf node (class %04x), err =3D %d\n",
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  587  			 classid, err);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  588  		mlx5e_sw_node_delete(=
priv, node);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  589  		return err;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  590  	}
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  591  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  592  	if (test_bit(MLX5E_STA=
TE_OPENED, &priv->state)) {
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  593  		err =3D mlx5e_open_qo=
s_sq(priv, &priv->channels, node);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  594  		if (err)
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  595  			qos_warn(priv->mdev,=
 "Failed to create a QoS SQ (class %04x), err =3D %d\n",
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  596  				 classid, err);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  597  		else
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  598  			mlx5e_activate_qos_s=
q(priv, node);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  599  	}
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  600  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  601  	return mlx5e_qid_from_=
qos(&priv->channels, node->qid);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  602  }
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  603  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  604  int mlx5e_htb_leaf_to_i=
nner(struct mlx5e_priv *priv, u16 classid, u16 child_classid,
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  605  			    u64 rate, u64 ce=
il)
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  606  {
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  607  	struct mlx5e_qos_node =
*node, *child;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  608  	int err, tmp_err;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  609  	u32 new_hw_id;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  610  	u16 qid;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  611  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  612  	qos_dbg(priv->mdev, "T=
C_HTB_LEAF_TO_INNER classid %04x, upcoming child %04x, rate %llu, ceil %llu=
\n",
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  613  		classid, child_classi=
d, rate, ceil);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  614  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  615  	node =3D mlx5e_sw_node=
_find(priv, classid);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  616  	if (!node)
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  617  		return -ENOENT;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  618  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  619  	err =3D mlx5_qos_creat=
e_inner_node(priv->mdev, node->parent->hw_id,
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  620  					 node->bw_share, n=
ode->max_average_bw,
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  621  					 &new_hw_id);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  622  	if (err) {
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  623  		qos_warn(priv->mdev, =
"Failed to create an inner node (class %04x), err =3D %d\n",
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  624  			 classid, err);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  625  		return err;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  626  	}
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  627  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  628  	/* Intentionally reuse=
 the qid for the upcoming first child. */
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  629  	child =3D mlx5e_sw_nod=
e_create_leaf(priv, child_classid, node->qid, node);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  630  	if (IS_ERR(child)) {
d34a73d10048450 Maxim Mikityanskiy 2020-12-15 @631  		err =3D PTR_ERR(child=
);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  632  		goto err_destroy_hw_n=
ode;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  633  	}
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  634  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  635  	child->rate =3D rate;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  636  	mlx5e_htb_convert_rate=
(priv, rate, node, &child->bw_share);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  637  	mlx5e_htb_convert_ceil=
(priv, ceil, &child->max_average_bw);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  638  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  639  	err =3D mlx5_qos_creat=
e_leaf_node(priv->mdev, new_hw_id, child->bw_share,
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  640  					child->max_average=
_bw, &child->hw_id);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  641  	if (err) {
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  642  		qos_warn(priv->mdev, =
"Failed to create a leaf node (class %04x), err =3D %d\n",
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  643  			 classid, err);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  644  		goto err_delete_sw_no=
de;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  645  	}
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  646  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  647  	/* No fail point. */
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  648  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  649  	qid =3D node->qid;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  650  	/* Pairs with mlx5e_ge=
t_txq_by_classid. */
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  651  	WRITE_ONCE(node->qid, =
MLX5E_QOS_QID_INNER);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  652  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  653  	if (test_bit(MLX5E_STA=
TE_OPENED, &priv->state)) {
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  654  		mlx5e_deactivate_qos_=
sq(priv, qid);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  655  		mlx5e_close_qos_sq(pr=
iv, qid);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  656  	}
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  657  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  658  	err =3D mlx5_qos_destr=
oy_node(priv->mdev, node->hw_id);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  659  	if (err) /* Not fatal.=
 */
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  660  		qos_warn(priv->mdev, =
"Failed to destroy leaf node %u (class %04x), err =3D %d\n",
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  661  			 node->hw_id, classi=
d, err);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  662  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  663  	node->hw_id =3D new_hw=
_id;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  664  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  665  	if (test_bit(MLX5E_STA=
TE_OPENED, &priv->state)) {
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  666  		err =3D mlx5e_open_qo=
s_sq(priv, &priv->channels, child);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  667  		if (err)
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  668  			qos_warn(priv->mdev,=
 "Failed to create a QoS SQ (class %04x), err =3D %d\n",
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  669  				 classid, err);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  670  		else
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  671  			mlx5e_activate_qos_s=
q(priv, child);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  672  	}
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  673  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  674  	return 0;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  675  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  676  err_delete_sw_node:
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  677  	child->qid =3D MLX5E_Q=
OS_QID_INNER;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  678  	mlx5e_sw_node_delete(p=
riv, child);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  679  =

d34a73d10048450 Maxim Mikityanskiy 2020-12-15  680  err_destroy_hw_node:
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  681  	tmp_err =3D mlx5_qos_d=
estroy_node(priv->mdev, new_hw_id);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  682  	if (tmp_err) /* Not fa=
tal. */
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  683  		qos_warn(priv->mdev, =
"Failed to roll back creation of an inner node %u (class %04x), err =3D %d\=
n",
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  684  			 new_hw_id, classid,=
 tmp_err);
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  685  	return err;
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  686  }
d34a73d10048450 Maxim Mikityanskiy 2020-12-15  687  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3765784696389305824==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
w5MtBi0kk6egFw+rHRT+B4A9MIXa2wEA
--===============3765784696389305824==--

