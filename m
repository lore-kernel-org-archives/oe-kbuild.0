Content-Type: multipart/mixed; boundary="===============6709296926563618774=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/hw/mlx4/qp.c:1176 create_qp_common() error: uninitialized symbol 'qpn'.
Date: Thu, 08 Jul 2021 15:43:46 +0800
Message-ID: <202107081504.jkvsaFZh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6709296926563618774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Leon Romanovsky <leonro@nvidia.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Maor Gottlieb <maorg@mellanox.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e9f1cbc0c4114880090c7a578117d3b9cf184ad4
commit: 8fd3cd2ae5a09ca1caed4b3990e084cb95bf55af RDMA/mlx4: Prepare QP allo=
cation to remove from the driver
date:   9 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 9 months ago
config: ia64-randconfig-m031-20210707 (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/infiniband/hw/mlx4/qp.c:1176 create_qp_common() error: uninitialize=
d symbol 'qpn'.

Old smatch warnings:
drivers/infiniband/hw/mlx4/qp.c:1103 create_qp_common() warn: missing error=
 code 'err'
drivers/infiniband/hw/mlx4/qp.c:2531 __mlx4_ib_modify_qp() warn: Function t=
oo hairy.  No more merges.
drivers/infiniband/hw/mlx4/qp.c:3747 _mlx4_ib_post_send() error: uninitiali=
zed symbol 'lso_hdr_sz'.
drivers/infiniband/hw/mlx4/qp.c:4254 mlx4_ib_modify_wq() warn: unsigned 'cu=
r_state' is never less than zero.

vim +/qpn +1176 drivers/infiniband/hw/mlx4/qp.c

089b645d19b2de Leon Romanovsky    2019-07-04   951  =

089b645d19b2de Leon Romanovsky    2019-07-04   952  static int create_qp_co=
mmon(struct ib_pd *pd, struct ib_qp_init_attr *init_attr,
8900b894e769dd Leon Romanovsky    2017-05-23   953  			    struct ib_udata =
*udata, int sqpn,
8fd3cd2ae5a09c Leon Romanovsky    2020-09-26   954  			    struct mlx4_ib_q=
p *qp)
225c7b1feef1b4 Roland Dreier      2007-05-08   955  {
089b645d19b2de Leon Romanovsky    2019-07-04   956  	struct mlx4_ib_dev *de=
v =3D to_mdev(pd->device);
a3cdcbfa8fb1fc Yevgeny Petrilin   2008-10-10   957  	int qpn;
225c7b1feef1b4 Roland Dreier      2007-05-08   958  	int err;
89944450547334 Shamir Rabinovitch 2019-02-07   959  	struct mlx4_ib_ucontex=
t *context =3D rdma_udata_to_drv_context(
89944450547334 Shamir Rabinovitch 2019-02-07   960  		udata, struct mlx4_ib=
_ucontext, ibucontext);
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   961  	enum mlx4_ib_qp_type q=
p_type =3D (enum mlx4_ib_qp_type) init_attr->qp_type;
35f05dabf95ac3 Yishai Hadas       2015-02-08   962  	struct mlx4_ib_cq *mcq;
35f05dabf95ac3 Yishai Hadas       2015-02-08   963  	unsigned long flags;
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   964  =

1ffeb2eb8be993 Jack Morgenstein   2012-08-03   965  	/* When tunneling spec=
ial qps, we use a plain UD qp */
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   966  	if (sqpn) {
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   967  		if (mlx4_is_mfunc(dev=
->dev) &&
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   968  		    (!mlx4_is_master(=
dev->dev) ||
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   969  		     !(init_attr->cre=
ate_flags & MLX4_IB_SRIOV_SQP))) {
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   970  			if (init_attr->qp_ty=
pe =3D=3D IB_QPT_GSI)
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   971  				qp_type =3D MLX4_IB=
_QPT_PROXY_GSI;
99ec41d0a48cb6 Jack Morgenstein   2014-05-29   972  			else {
99ec41d0a48cb6 Jack Morgenstein   2014-05-29   973  				if (mlx4_is_master(=
dev->dev) ||
99ec41d0a48cb6 Jack Morgenstein   2014-05-29   974  				    qp0_enabled_vf(=
dev->dev, sqpn))
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   975  					qp_type =3D MLX4_I=
B_QPT_PROXY_SMI_OWNER;
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   976  				else
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   977  					qp_type =3D MLX4_I=
B_QPT_PROXY_SMI;
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   978  			}
99ec41d0a48cb6 Jack Morgenstein   2014-05-29   979  		}
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   980  		qpn =3D sqpn;
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   981  		/* add extra sg entry=
 for tunneling */
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   982  		init_attr->cap.max_re=
cv_sge++;
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   983  	} else if (init_attr->=
create_flags & MLX4_IB_SRIOV_TUNNEL_QP) {
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   984  		struct mlx4_ib_qp_tun=
nel_init_attr *tnl_init =3D
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   985  			container_of(init_at=
tr,
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   986  				     struct mlx4_ib=
_qp_tunnel_init_attr, init_attr);
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   987  		if ((tnl_init->proxy_=
qp_type !=3D IB_QPT_SMI &&
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   988  		     tnl_init->proxy_=
qp_type !=3D IB_QPT_GSI)   ||
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   989  		    !mlx4_is_master(d=
ev->dev))
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   990  			return -EINVAL;
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   991  		if (tnl_init->proxy_q=
p_type =3D=3D IB_QPT_GSI)
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   992  			qp_type =3D MLX4_IB_=
QPT_TUN_GSI;
99ec41d0a48cb6 Jack Morgenstein   2014-05-29   993  		else if (tnl_init->sl=
ave =3D=3D mlx4_master_func_num(dev->dev) ||
99ec41d0a48cb6 Jack Morgenstein   2014-05-29   994  			 mlx4_vf_smi_enabled=
(dev->dev, tnl_init->slave,
99ec41d0a48cb6 Jack Morgenstein   2014-05-29   995  					     tnl_init->por=
t))
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   996  			qp_type =3D MLX4_IB_=
QPT_TUN_SMI_OWNER;
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   997  		else
1ffeb2eb8be993 Jack Morgenstein   2012-08-03   998  			qp_type =3D MLX4_IB_=
QPT_TUN_SMI;
47605df953985c Jack Morgenstein   2012-08-03   999  		/* we are definitely =
in the PPF here, since we are creating
47605df953985c Jack Morgenstein   2012-08-03  1000  		 * tunnel QPs. base_t=
unnel_sqpn is therefore valid. */
47605df953985c Jack Morgenstein   2012-08-03  1001  		qpn =3D dev->dev->phy=
s_caps.base_tunnel_sqpn + 8 * tnl_init->slave
47605df953985c Jack Morgenstein   2012-08-03  1002  			+ tnl_init->proxy_qp=
_type * 2 + tnl_init->port - 1;
1ffeb2eb8be993 Jack Morgenstein   2012-08-03  1003  		sqpn =3D qpn;
1ffeb2eb8be993 Jack Morgenstein   2012-08-03  1004  	}
1ffeb2eb8be993 Jack Morgenstein   2012-08-03  1005  =

8fd3cd2ae5a09c Leon Romanovsky    2020-09-26  1006  	if (init_attr->qp_type=
 =3D=3D IB_QPT_SMI ||
8fd3cd2ae5a09c Leon Romanovsky    2020-09-26  1007  	    init_attr->qp_type=
 =3D=3D IB_QPT_GSI || qp_type =3D=3D MLX4_IB_QPT_SMI ||
8fd3cd2ae5a09c Leon Romanovsky    2020-09-26  1008  	    qp_type =3D=3D MLX=
4_IB_QPT_GSI ||
1ffeb2eb8be993 Jack Morgenstein   2012-08-03  1009  	    (qp_type & (MLX4_I=
B_QPT_PROXY_SMI | MLX4_IB_QPT_PROXY_SMI_OWNER |
1ffeb2eb8be993 Jack Morgenstein   2012-08-03  1010  			MLX4_IB_QPT_PROXY_GS=
I | MLX4_IB_QPT_TUN_SMI_OWNER))) {
915ec7ed911493 Leon Romanovsky    2020-09-26  1011  		qp->sqp =3D kzalloc(s=
izeof(struct mlx4_ib_sqp), GFP_KERNEL);
8fd3cd2ae5a09c Leon Romanovsky    2020-09-26  1012  		if (!qp->sqp)
1ffeb2eb8be993 Jack Morgenstein   2012-08-03  1013  			return -ENOMEM;
089b645d19b2de Leon Romanovsky    2019-07-04  1014  	}
1ffeb2eb8be993 Jack Morgenstein   2012-08-03  1015  =

1ffeb2eb8be993 Jack Morgenstein   2012-08-03  1016  	qp->mlx4_ib_qp_type =
=3D qp_type;
225c7b1feef1b4 Roland Dreier      2007-05-08  1017  =

225c7b1feef1b4 Roland Dreier      2007-05-08  1018  	spin_lock_init(&qp->sq=
.lock);
225c7b1feef1b4 Roland Dreier      2007-05-08  1019  	spin_lock_init(&qp->rq=
.lock);
fa417f7b520ee6 Eli Cohen          2010-10-24  1020  	INIT_LIST_HEAD(&qp->gi=
d_list);
0ff1fb654bec0c Hadar Hen Zion     2012-07-05  1021  	INIT_LIST_HEAD(&qp->st=
eering_rules);
225c7b1feef1b4 Roland Dreier      2007-05-08  1022  =

225c7b1feef1b4 Roland Dreier      2007-05-08  1023  	qp->state =3D IB_QPS_R=
ESET;
ea54b10c777300 Jack Morgenstein   2008-01-28  1024  	if (init_attr->sq_sig_=
type =3D=3D IB_SIGNAL_ALL_WR)
ea54b10c777300 Jack Morgenstein   2008-01-28  1025  		qp->sq_signal_bits =
=3D cpu_to_be32(MLX4_WQE_CTRL_CQ_UPDATE);
225c7b1feef1b4 Roland Dreier      2007-05-08  1026  =

e00b64f7c54c4c Shamir Rabinovitch 2018-12-17  1027  	if (udata) {
089b645d19b2de Leon Romanovsky    2019-07-04  1028  		struct mlx4_ib_create=
_qp ucmd;
400b1ebcfe3127 Guy Levi           2017-07-04  1029  		size_t copy_len;
ed8637d3615b38 Guy Levi           2017-11-02  1030  		int shift;
ed8637d3615b38 Guy Levi           2017-11-02  1031  		int n;
400b1ebcfe3127 Guy Levi           2017-07-04  1032  =

089b645d19b2de Leon Romanovsky    2019-07-04  1033  		copy_len =3D sizeof(s=
truct mlx4_ib_create_qp);
225c7b1feef1b4 Roland Dreier      2007-05-08  1034  =

400b1ebcfe3127 Guy Levi           2017-07-04  1035  		if (ib_copy_from_udat=
a(&ucmd, udata, copy_len)) {
225c7b1feef1b4 Roland Dreier      2007-05-08  1036  			err =3D -EFAULT;
225c7b1feef1b4 Roland Dreier      2007-05-08  1037  			goto err;
225c7b1feef1b4 Roland Dreier      2007-05-08  1038  		}
225c7b1feef1b4 Roland Dreier      2007-05-08  1039  =

089b645d19b2de Leon Romanovsky    2019-07-04  1040  		qp->inl_recv_sz =3D u=
cmd.inl_recv_sz;
400b1ebcfe3127 Guy Levi           2017-07-04  1041  =

6d06c9aa3816c2 Guy Levi           2018-03-15  1042  		if (init_attr->create=
_flags & IB_QP_CREATE_SCATTER_FCS) {
6d06c9aa3816c2 Guy Levi           2018-03-15  1043  			if (!(dev->dev->caps=
.flags &
6d06c9aa3816c2 Guy Levi           2018-03-15  1044  			      MLX4_DEV_CAP_F=
LAG_FCS_KEEP)) {
6d06c9aa3816c2 Guy Levi           2018-03-15  1045  				pr_debug("scatter F=
CS is unsupported\n");
6d06c9aa3816c2 Guy Levi           2018-03-15  1046  				err =3D -EOPNOTSUPP;
6d06c9aa3816c2 Guy Levi           2018-03-15  1047  				goto err;
6d06c9aa3816c2 Guy Levi           2018-03-15  1048  			}
6d06c9aa3816c2 Guy Levi           2018-03-15  1049  =

6d06c9aa3816c2 Guy Levi           2018-03-15  1050  			qp->flags |=3D MLX4_=
IB_QP_SCATTER_FCS;
6d06c9aa3816c2 Guy Levi           2018-03-15  1051  		}
6d06c9aa3816c2 Guy Levi           2018-03-15  1052  =

e00b64f7c54c4c Shamir Rabinovitch 2018-12-17  1053  		err =3D set_rq_size(d=
ev, &init_attr->cap, udata,
400b1ebcfe3127 Guy Levi           2017-07-04  1054  				  qp_has_rq(init_at=
tr), qp, qp->inl_recv_sz);
ea30b966f7dd6b Maor Gottlieb      2017-06-21  1055  		if (err)
ea30b966f7dd6b Maor Gottlieb      2017-06-21  1056  			goto err;
ea30b966f7dd6b Maor Gottlieb      2017-06-21  1057  =

089b645d19b2de Leon Romanovsky    2019-07-04  1058  		qp->sq_no_prefetch =
=3D ucmd.sq_no_prefetch;
0e6e74162164d9 Roland Dreier      2007-06-18  1059  =

089b645d19b2de Leon Romanovsky    2019-07-04  1060  		err =3D set_user_sq_s=
ize(dev, qp, &ucmd);
2446304dd68748 Eli Cohen          2007-05-17  1061  		if (err)
2446304dd68748 Eli Cohen          2007-05-17  1062  			goto err;
2446304dd68748 Eli Cohen          2007-05-17  1063  =

c320e527e15483 Moni Shoua         2020-01-15  1064  		qp->umem =3D
c320e527e15483 Moni Shoua         2020-01-15  1065  			ib_umem_get(pd->devi=
ce, ucmd.buf_addr, qp->buf_size, 0);
225c7b1feef1b4 Roland Dreier      2007-05-08  1066  		if (IS_ERR(qp->umem))=
 {
225c7b1feef1b4 Roland Dreier      2007-05-08  1067  			err =3D PTR_ERR(qp->=
umem);
225c7b1feef1b4 Roland Dreier      2007-05-08  1068  			goto err;
225c7b1feef1b4 Roland Dreier      2007-05-08  1069  		}
225c7b1feef1b4 Roland Dreier      2007-05-08  1070  =

ed8637d3615b38 Guy Levi           2017-11-02  1071  		shift =3D mlx4_ib_ume=
m_calc_optimal_mtt_size(qp->umem, 0, &n);
ed8637d3615b38 Guy Levi           2017-11-02  1072  		err =3D mlx4_mtt_init=
(dev->dev, n, shift, &qp->mtt);
ed8637d3615b38 Guy Levi           2017-11-02  1073  =

225c7b1feef1b4 Roland Dreier      2007-05-08  1074  		if (err)
225c7b1feef1b4 Roland Dreier      2007-05-08  1075  			goto err_buf;
225c7b1feef1b4 Roland Dreier      2007-05-08  1076  =

225c7b1feef1b4 Roland Dreier      2007-05-08  1077  		err =3D mlx4_ib_umem_=
write_mtt(dev, &qp->mtt, qp->umem);
225c7b1feef1b4 Roland Dreier      2007-05-08  1078  		if (err)
225c7b1feef1b4 Roland Dreier      2007-05-08  1079  			goto err_mtt;
225c7b1feef1b4 Roland Dreier      2007-05-08  1080  =

0a1405da9952a7 Sean Hefty         2011-06-02  1081  		if (qp_has_rq(init_at=
tr)) {
089b645d19b2de Leon Romanovsky    2019-07-04  1082  			err =3D mlx4_ib_db_m=
ap_user(udata, ucmd.db_addr, &qp->db);
225c7b1feef1b4 Roland Dreier      2007-05-08  1083  			if (err)
225c7b1feef1b4 Roland Dreier      2007-05-08  1084  				goto err_mtt;
02d89b87081f51 Roland Dreier      2007-05-23  1085  		}
f3301870161ca2 Moshe Shemesh      2017-06-21  1086  		qp->mqp.usage =3D MLX=
4_RES_USAGE_USER_VERBS;
225c7b1feef1b4 Roland Dreier      2007-05-08  1087  	} else {
e00b64f7c54c4c Shamir Rabinovitch 2018-12-17  1088  		err =3D set_rq_size(d=
ev, &init_attr->cap, udata,
ea30b966f7dd6b Maor Gottlieb      2017-06-21  1089  				  qp_has_rq(init_at=
tr), qp, 0);
ea30b966f7dd6b Maor Gottlieb      2017-06-21  1090  		if (err)
ea30b966f7dd6b Maor Gottlieb      2017-06-21  1091  			goto err;
ea30b966f7dd6b Maor Gottlieb      2017-06-21  1092  =

0e6e74162164d9 Roland Dreier      2007-06-18  1093  		qp->sq_no_prefetch =
=3D 0;
0e6e74162164d9 Roland Dreier      2007-06-18  1094  =

b832be1e4007f4 Eli Cohen          2008-04-16  1095  		if (init_attr->create=
_flags & IB_QP_CREATE_IPOIB_UD_LSO)
b832be1e4007f4 Eli Cohen          2008-04-16  1096  			qp->flags |=3D MLX4_=
IB_QP_LSO;
b832be1e4007f4 Eli Cohen          2008-04-16  1097  =

c1c98501121eef Matan Barak        2013-11-07  1098  		if (init_attr->create=
_flags & IB_QP_CREATE_NETIF_QP) {
c1c98501121eef Matan Barak        2013-11-07  1099  			if (dev->steering_su=
pport =3D=3D
c1c98501121eef Matan Barak        2013-11-07  1100  			    MLX4_STEERING_MO=
DE_DEVICE_MANAGED)
c1c98501121eef Matan Barak        2013-11-07  1101  				qp->flags |=3D MLX4=
_IB_QP_NETIF;
c1c98501121eef Matan Barak        2013-11-07  1102  			else
c1c98501121eef Matan Barak        2013-11-07  1103  				goto err;
c1c98501121eef Matan Barak        2013-11-07  1104  		}
c1c98501121eef Matan Barak        2013-11-07  1105  =

f95ccffc715bf0 Jack Morgenstein   2018-07-26  1106  		err =3D set_kernel_sq=
_size(dev, &init_attr->cap, qp_type, qp);
2446304dd68748 Eli Cohen          2007-05-17  1107  		if (err)
2446304dd68748 Eli Cohen          2007-05-17  1108  			goto err;
2446304dd68748 Eli Cohen          2007-05-17  1109  =

0a1405da9952a7 Sean Hefty         2011-06-02  1110  		if (qp_has_rq(init_at=
tr)) {
8900b894e769dd Leon Romanovsky    2017-05-23  1111  			err =3D mlx4_db_allo=
c(dev->dev, &qp->db, 0);
225c7b1feef1b4 Roland Dreier      2007-05-08  1112  			if (err)
225c7b1feef1b4 Roland Dreier      2007-05-08  1113  				goto err;
225c7b1feef1b4 Roland Dreier      2007-05-08  1114  =

225c7b1feef1b4 Roland Dreier      2007-05-08  1115  			*qp->db.db =3D 0;
02d89b87081f51 Roland Dreier      2007-05-23  1116  		}
225c7b1feef1b4 Roland Dreier      2007-05-08  1117  =

f95ccffc715bf0 Jack Morgenstein   2018-07-26  1118  		if (mlx4_buf_alloc(de=
v->dev, qp->buf_size,  PAGE_SIZE * 2,
8900b894e769dd Leon Romanovsky    2017-05-23  1119  				   &qp->buf)) {
225c7b1feef1b4 Roland Dreier      2007-05-08  1120  			err =3D -ENOMEM;
225c7b1feef1b4 Roland Dreier      2007-05-08  1121  			goto err_db;
225c7b1feef1b4 Roland Dreier      2007-05-08  1122  		}
225c7b1feef1b4 Roland Dreier      2007-05-08  1123  =

225c7b1feef1b4 Roland Dreier      2007-05-08  1124  		err =3D mlx4_mtt_init=
(dev->dev, qp->buf.npages, qp->buf.page_shift,
225c7b1feef1b4 Roland Dreier      2007-05-08  1125  				    &qp->mtt);
225c7b1feef1b4 Roland Dreier      2007-05-08  1126  		if (err)
225c7b1feef1b4 Roland Dreier      2007-05-08  1127  			goto err_buf;
225c7b1feef1b4 Roland Dreier      2007-05-08  1128  =

8900b894e769dd Leon Romanovsky    2017-05-23  1129  		err =3D mlx4_buf_writ=
e_mtt(dev->dev, &qp->mtt, &qp->buf);
225c7b1feef1b4 Roland Dreier      2007-05-08  1130  		if (err)
225c7b1feef1b4 Roland Dreier      2007-05-08  1131  			goto err_mtt;
225c7b1feef1b4 Roland Dreier      2007-05-08  1132  =

e9105cdefbf64c Li Dongyang        2017-08-16  1133  		qp->sq.wrid =3D kvmal=
loc_array(qp->sq.wqe_cnt,
e9105cdefbf64c Li Dongyang        2017-08-16  1134  					     sizeof(u64), =
GFP_KERNEL);
e9105cdefbf64c Li Dongyang        2017-08-16  1135  		qp->rq.wrid =3D kvmal=
loc_array(qp->rq.wqe_cnt,
e9105cdefbf64c Li Dongyang        2017-08-16  1136  					     sizeof(u64), =
GFP_KERNEL);
225c7b1feef1b4 Roland Dreier      2007-05-08  1137  		if (!qp->sq.wrid || !=
qp->rq.wrid) {
225c7b1feef1b4 Roland Dreier      2007-05-08  1138  			err =3D -ENOMEM;
225c7b1feef1b4 Roland Dreier      2007-05-08  1139  			goto err_wrid;
225c7b1feef1b4 Roland Dreier      2007-05-08  1140  		}
f3301870161ca2 Moshe Shemesh      2017-06-21  1141  		qp->mqp.usage =3D MLX=
4_RES_USAGE_DRIVER;
225c7b1feef1b4 Roland Dreier      2007-05-08  1142  	}
225c7b1feef1b4 Roland Dreier      2007-05-08  1143  =

a3cdcbfa8fb1fc Yevgeny Petrilin   2008-10-10  1144  	if (sqpn) {
1ffeb2eb8be993 Jack Morgenstein   2012-08-03  1145  		if (qp->mlx4_ib_qp_ty=
pe & (MLX4_IB_QPT_PROXY_SMI_OWNER |
1ffeb2eb8be993 Jack Morgenstein   2012-08-03  1146  		    MLX4_IB_QPT_PROXY=
_SMI | MLX4_IB_QPT_PROXY_GSI)) {
1ffeb2eb8be993 Jack Morgenstein   2012-08-03  1147  			if (alloc_proxy_bufs=
(pd->device, qp)) {
1ffeb2eb8be993 Jack Morgenstein   2012-08-03  1148  				err =3D -ENOMEM;
1ffeb2eb8be993 Jack Morgenstein   2012-08-03  1149  				goto err_wrid;
1ffeb2eb8be993 Jack Morgenstein   2012-08-03  1150  			}
1ffeb2eb8be993 Jack Morgenstein   2012-08-03  1151  		}
a3cdcbfa8fb1fc Yevgeny Petrilin   2008-10-10  1152  	} else {
ddae0349fdb78b Eugenia Emantayev  2014-12-11  1153  		/* Raw packet QPNs ma=
y not have bits 6,7 set in their qp_num;
ddae0349fdb78b Eugenia Emantayev  2014-12-11  1154  		 * otherwise, the WQE=
 BlueFlame setup flow wrongly causes
ddae0349fdb78b Eugenia Emantayev  2014-12-11  1155  		 * VLAN insertion. */
3987a2d3193cf2 Or Gerlitz         2012-01-17  1156  		if (init_attr->qp_typ=
e =3D=3D IB_QPT_RAW_PACKET)
ddae0349fdb78b Eugenia Emantayev  2014-12-11  1157  			err =3D mlx4_qp_rese=
rve_range(dev->dev, 1, 1, &qpn,
d57febe1a47801 Matan Barak        2014-12-11  1158  						    (init_attr->c=
ap.max_send_wr ?
d57febe1a47801 Matan Barak        2014-12-11  1159  						     MLX4_RESERVE=
_ETH_BF_QP : 0) |
d57febe1a47801 Matan Barak        2014-12-11  1160  						    (init_attr->c=
ap.max_recv_wr ?
f3301870161ca2 Moshe Shemesh      2017-06-21  1161  						     MLX4_RESERVE=
_A0_QP : 0),
f3301870161ca2 Moshe Shemesh      2017-06-21  1162  						    qp->mqp.usage=
);
3987a2d3193cf2 Or Gerlitz         2012-01-17  1163  		else
c1c98501121eef Matan Barak        2013-11-07  1164  			if (qp->flags & MLX4=
_IB_QP_NETIF)
c1c98501121eef Matan Barak        2013-11-07  1165  				err =3D mlx4_ib_ste=
er_qp_alloc(dev, 1, &qpn);
c1c98501121eef Matan Barak        2013-11-07  1166  			else
c1c98501121eef Matan Barak        2013-11-07  1167  				err =3D mlx4_qp_res=
erve_range(dev->dev, 1, 1,
f3301870161ca2 Moshe Shemesh      2017-06-21  1168  							    &qpn, 0, qp-=
>mqp.usage);
225c7b1feef1b4 Roland Dreier      2007-05-08  1169  		if (err)
1ffeb2eb8be993 Jack Morgenstein   2012-08-03  1170  			goto err_proxy;
a3cdcbfa8fb1fc Yevgeny Petrilin   2008-10-10  1171  	}
a3cdcbfa8fb1fc Yevgeny Petrilin   2008-10-10  1172  =

fbfb6625ea2d1b Eran Ben Elisha    2015-10-15  1173  	if (init_attr->create_=
flags & IB_QP_CREATE_BLOCK_MULTICAST_LOOPBACK)
fbfb6625ea2d1b Eran Ben Elisha    2015-10-15  1174  		qp->flags |=3D MLX4_I=
B_QP_BLOCK_MULTICAST_LOOPBACK;
fbfb6625ea2d1b Eran Ben Elisha    2015-10-15  1175  =

8900b894e769dd Leon Romanovsky    2017-05-23 @1176  	err =3D mlx4_qp_alloc(=
dev->dev, qpn, &qp->mqp);
a3cdcbfa8fb1fc Yevgeny Petrilin   2008-10-10  1177  	if (err)
a3cdcbfa8fb1fc Yevgeny Petrilin   2008-10-10  1178  		goto err_qpn;
225c7b1feef1b4 Roland Dreier      2007-05-08  1179  =

0a1405da9952a7 Sean Hefty         2011-06-02  1180  	if (init_attr->qp_type=
 =3D=3D IB_QPT_XRC_TGT)
0a1405da9952a7 Sean Hefty         2011-06-02  1181  		qp->mqp.qpn |=3D (1 <=
< 23);
0a1405da9952a7 Sean Hefty         2011-06-02  1182  =

225c7b1feef1b4 Roland Dreier      2007-05-08  1183  	/*
225c7b1feef1b4 Roland Dreier      2007-05-08  1184  	 * Hardware wants QPN =
written in big-endian order (after
225c7b1feef1b4 Roland Dreier      2007-05-08  1185  	 * shifting) for send =
doorbell.  Precompute this value to save
225c7b1feef1b4 Roland Dreier      2007-05-08  1186  	 * a little bit when p=
osting sends.
225c7b1feef1b4 Roland Dreier      2007-05-08  1187  	 */
225c7b1feef1b4 Roland Dreier      2007-05-08  1188  	qp->doorbell_qpn =3D s=
wab32(qp->mqp.qpn << 8);
225c7b1feef1b4 Roland Dreier      2007-05-08  1189  =

089b645d19b2de Leon Romanovsky    2019-07-04  1190  	qp->mqp.event =3D mlx4=
_ib_qp_event;
400b1ebcfe3127 Guy Levi           2017-07-04  1191  =

35f05dabf95ac3 Yishai Hadas       2015-02-08  1192  	spin_lock_irqsave(&dev=
->reset_flow_resource_lock, flags);
35f05dabf95ac3 Yishai Hadas       2015-02-08  1193  	mlx4_ib_lock_cqs(to_mc=
q(init_attr->send_cq),
35f05dabf95ac3 Yishai Hadas       2015-02-08  1194  			 to_mcq(init_attr->r=
ecv_cq));
35f05dabf95ac3 Yishai Hadas       2015-02-08  1195  	/* Maintain device to =
QPs access, needed for further handling
35f05dabf95ac3 Yishai Hadas       2015-02-08  1196  	 * via reset flow
35f05dabf95ac3 Yishai Hadas       2015-02-08  1197  	 */
35f05dabf95ac3 Yishai Hadas       2015-02-08  1198  	list_add_tail(&qp->qps=
_list, &dev->qp_list);
35f05dabf95ac3 Yishai Hadas       2015-02-08  1199  	/* Maintain CQ to QPs =
access, needed for further handling
35f05dabf95ac3 Yishai Hadas       2015-02-08  1200  	 * via reset flow
35f05dabf95ac3 Yishai Hadas       2015-02-08  1201  	 */
35f05dabf95ac3 Yishai Hadas       2015-02-08  1202  	mcq =3D to_mcq(init_at=
tr->send_cq);
35f05dabf95ac3 Yishai Hadas       2015-02-08  1203  	list_add_tail(&qp->cq_=
send_list, &mcq->send_qp_list);
35f05dabf95ac3 Yishai Hadas       2015-02-08  1204  	mcq =3D to_mcq(init_at=
tr->recv_cq);
35f05dabf95ac3 Yishai Hadas       2015-02-08  1205  	list_add_tail(&qp->cq_=
recv_list, &mcq->recv_qp_list);
35f05dabf95ac3 Yishai Hadas       2015-02-08  1206  	mlx4_ib_unlock_cqs(to_=
mcq(init_attr->send_cq),
35f05dabf95ac3 Yishai Hadas       2015-02-08  1207  			   to_mcq(init_attr-=
>recv_cq));
35f05dabf95ac3 Yishai Hadas       2015-02-08  1208  	spin_unlock_irqrestore=
(&dev->reset_flow_resource_lock, flags);
225c7b1feef1b4 Roland Dreier      2007-05-08  1209  	return 0;
225c7b1feef1b4 Roland Dreier      2007-05-08  1210  =

a3cdcbfa8fb1fc Yevgeny Petrilin   2008-10-10  1211  err_qpn:
c1c98501121eef Matan Barak        2013-11-07  1212  	if (!sqpn) {
c1c98501121eef Matan Barak        2013-11-07  1213  		if (qp->flags & MLX4_=
IB_QP_NETIF)
c1c98501121eef Matan Barak        2013-11-07  1214  			mlx4_ib_steer_qp_fre=
e(dev, qpn, 1);
c1c98501121eef Matan Barak        2013-11-07  1215  		else
a3cdcbfa8fb1fc Yevgeny Petrilin   2008-10-10  1216  			mlx4_qp_release_rang=
e(dev->dev, qpn, 1);
c1c98501121eef Matan Barak        2013-11-07  1217  	}
1ffeb2eb8be993 Jack Morgenstein   2012-08-03  1218  err_proxy:
1ffeb2eb8be993 Jack Morgenstein   2012-08-03  1219  	if (qp->mlx4_ib_qp_typ=
e =3D=3D MLX4_IB_QPT_PROXY_GSI)
1ffeb2eb8be993 Jack Morgenstein   2012-08-03  1220  		free_proxy_bufs(pd->d=
evice, qp);
225c7b1feef1b4 Roland Dreier      2007-05-08  1221  err_wrid:
e00b64f7c54c4c Shamir Rabinovitch 2018-12-17  1222  	if (udata) {
0a1405da9952a7 Sean Hefty         2011-06-02  1223  		if (qp_has_rq(init_at=
tr))
89944450547334 Shamir Rabinovitch 2019-02-07  1224  			mlx4_ib_db_unmap_use=
r(context, &qp->db);
23f1b38481596a Roland Dreier      2007-07-20  1225  	} else {
0ef2f05c7e02ff Wengang Wang       2015-10-08  1226  		kvfree(qp->sq.wrid);
0ef2f05c7e02ff Wengang Wang       2015-10-08  1227  		kvfree(qp->rq.wrid);
225c7b1feef1b4 Roland Dreier      2007-05-08  1228  	}
225c7b1feef1b4 Roland Dreier      2007-05-08  1229  =

225c7b1feef1b4 Roland Dreier      2007-05-08  1230  err_mtt:
225c7b1feef1b4 Roland Dreier      2007-05-08  1231  	mlx4_mtt_cleanup(dev->=
dev, &qp->mtt);
225c7b1feef1b4 Roland Dreier      2007-05-08  1232  =

225c7b1feef1b4 Roland Dreier      2007-05-08  1233  err_buf:
836a0fbb3e76f7 Leon Romanovsky    2019-06-16  1234  	if (!qp->umem)
225c7b1feef1b4 Roland Dreier      2007-05-08  1235  		mlx4_buf_free(dev->de=
v, qp->buf_size, &qp->buf);
836a0fbb3e76f7 Leon Romanovsky    2019-06-16  1236  	ib_umem_release(qp->um=
em);
225c7b1feef1b4 Roland Dreier      2007-05-08  1237  =

225c7b1feef1b4 Roland Dreier      2007-05-08  1238  err_db:
e00b64f7c54c4c Shamir Rabinovitch 2018-12-17  1239  	if (!udata && qp_has_r=
q(init_attr))
6296883ca4cd52 Yevgeny Petrilin   2008-04-23  1240  		mlx4_db_free(dev->dev=
, &qp->db);
225c7b1feef1b4 Roland Dreier      2007-05-08  1241  =

225c7b1feef1b4 Roland Dreier      2007-05-08  1242  err:
915ec7ed911493 Leon Romanovsky    2020-09-26  1243  	kfree(qp->sqp);
225c7b1feef1b4 Roland Dreier      2007-05-08  1244  	return err;
225c7b1feef1b4 Roland Dreier      2007-05-08  1245  }
225c7b1feef1b4 Roland Dreier      2007-05-08  1246  =


:::::: The code at line 1176 was first introduced by commit
:::::: 8900b894e769dd88b53e519e3502e0e3c349fe95 {net, IB}/mlx4: Remove gfp =
flags argument

:::::: TO: Leon Romanovsky <leonro@mellanox.com>
:::::: CC: Doug Ledford <dledford@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6709296926563618774==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICJOd5mAAAy5jb25maWcAlDxbc9y2zu/9FTvpS/vQHt/i1vONHyiK2mVXEhWS2l3nReM6m9RT
x5tjr9vm338AqQspQU5PZzqxABAiQRA3Qvv9d98v2Mvx8Pn2eH93+/DwdfFp/7h/uj3uPyw+3j/s
/2+RqkWp7EKk0v4MxPn948s//7m/vbxYvP356ueTn57u3i7W+6fH/cOCHx4/3n96gdH3h8fvvv+O
qzKTy4bzZiO0kapsrNjZ6zc4+qcHZPTTp7u7xQ9Lzn9cXP18/vPJm2CMNA0grr92oOXA5/rq5Pzk
pEPkaQ8/O784cf/1fHJWLnv0ScB+xUzDTNEslVXDSwKELHNZigEl9btmq/QaILC27xdLJ6iHxfP+
+PJlWK0spW1EuWmYhqnJQtrr87OevSoqmQuQg7ED51xxlndzfNPLIKklLM2w3AbAVGSszq17DQFe
KWNLVojrNz88Hh73P76BibYkZsuqxf3z4vFwxDkHiBuzkRUncZUyctcU72pRC5JgyyxfNfN4rpUx
TSEKpW8aZi3jK5KuNiKXCYliNeheiGnhK7YRIGV4vaOAZYAY8257YLsWzy+/P399Pu4/D9uzFKXQ
krvdzMWS8ZtAwwJcpVUiaJRZqe0UU4kylaVTE3oYX8kq1qZUFUyWMczIgiJqVlJoXOtNjM2YsULJ
AQ1SKdMcdGk6icJIenYtYphPL/pw/qlI6mVm4i3aP35YHD6OhN3xd3vDQbvXRtWaiyZllk1fb2Uh
ms2wfZ3qaSGKyjalcqdwUMkWvlF5XVqmb2jF9VSE2nTjuYLhnbbwqv6PvX3+c3G8/7xf3MKqno+3
x+fF7d3d4eXxeP/4aVAhK/m6gQEN444H7Ho4v43UdoRuSmblRhCTSUyKqsYFHBKgtyGjMa7ZnJNL
tcysjWXWUIs1MpId7HRnKlJpWJKLlNzQfyGP4IzDYqVROSxSlSE7J1rN64WZHkQL29AAbthweGjE
rhI6MI0monBjRiBcvBvaqhOBmoDqVFBwqxkn5gSyzXM03YUqY0wpBBhoseRJLkODjriMlaq215cX
UyAYHpZdn15GrBRPUJCzc2q0YGlTJG47212KRTtsiFz7PwiFkOsV8InsQ67Q12Rg12Rmr09/CeG4
tQXbhfiz4SDJ0q7BQWVizOM8stF1CSIEVWsMX4HAnEXoDp65+2P/4eVh/7T4uL89vjztn/15bL0C
+O+icqIg1ZQYPfLkMMXTs18DB7/Uqq6C1VdsKbwtEHqAgsPiy9Fjs4Z/ogOar1t+hKA9wi95YJQx
qRsSwzPTJGC7tzK1q/AtYE2CAfNvqmRqwnEtWKcFmx+UwYl6Hy4cNtwIG8oHLBDybjFjSYI52Ugu
iBcDPVqt+XcnVUZwAycTHH/F1z3KO4/+NRjmmApOB2X3QFR8XSnYfTg3xiod+HKvhay2yjEOEDcG
NiEV4CE4s25zwiApwjWbM9IYa5Ez2iOhtoCwXOSmU5pEKfRLM0cXNFpV4Czle9FkSkPEoeGfgpUj
8Y/IDPxBcEN/a/No8fDsfXZdslwuSzBKEN/pwOhFWza21QV4FQk6EmiTWQpbwOFtBu8+kmiLICaY
+Ugmcl8uGsV4QZPOzhmkYLahKok8A9HqiF/CDMiopl9fQ7ISHFx8hHMQMKxUGK4YEBjLs0hp3Ewz
6syKjShtTGxWYF7oAFgqypKrptaj2IOlGwlLaoVqSG7wloRpDQEjiV7jwJuCki/sPrWRuOUupKBX
WiQiTePDVPHTk4tJoNBmkdX+6ePh6fPt491+If7aP0LUwcDac4w79k/ePbTm/1+O6KayKbzcO3Mf
mUuT14k3P3SShGjvBrzixpFOkN8x2yQuSwzGsoQ6gcAyJlN0AoTj4d0aHFUbvM2ToUHHYKTRcHoU
rU8x4YrpFEInau/Mqs4y8NvOR8KuQ54KpnQiNQwSKqatZNRBAnFZUTjzjYm4zCR3gWLkYjKZd6rc
7m2cXvekSx9J5LCRubk+95pTPR3u9s/Ph6fF8esXH64G0UR3XtjlxfDOy4tEBrbrPSQZDXjK87PA
nhVBNAYRDF/7YMzUVaVCw9clMnAwZKLBO8A2gRcYCFwUBM4TvbTQPjmAcG4gSIvQsGTBg3dWqpAW
dgw8XuOcWmhjcV1gsTnzbi3YpTANg0NqQHo9YYDG5NkRBTwtK2UdBTsFX8syF7Rvc3NwWoLeprlY
04o8Ivt1TR2LEdHp5To6Jav3zenJCckeUGdvTwiWgDg/OZlyoWmvg9qSm0yiczBj9Ujk+WnjRNnG
vJejZZqlbOrN3PpWEM4lDGy4V7J4KL+BELmknDb4c1BADMhRYRUcXH19etrrShEEM6XTM3N9cXIV
TG2lbJXXLswj2DtNEaU7YW3Jph0w0qYJjYa/NpFv9YprCioAdDyMyAUktS2PQsGZGb0FMlR4tHIJ
NO0rRxQZ5JyzSAgOtRGz6Ih7a1cD8dVFcD5LmJ3pkpuT6Fh7eTCd3zRVVjZWNaVMR0ff0SAPZwTF
zorSRBYQTidaBjQM+GJH20zYeFHlWA9wExopZMEZhJ8c9kHfjFAVWKYyUxNNK3gjtIaQ9DdBRuqO
SMQ1hE5/WZE3ZbaduPHs/unz37dP+0X6dP9X57B7wRegGIVEk28VVzkd7ziqiqbqToLUBcSmTigF
q8IJgv2ECCOlkjKws6FU4dF78xGIsxIOGV9JcAqlKh3HDCxrwngYXvLi4pfdrik3YJijsLJFGJh/
QcxiqdQSTk+3hMCReASGqS4VsLHatmiMQlRp1KuonsmEZlOlXfIN61r8IP457h+f739/2A9bJzFw
+nh7t/9xYV6+fDk8HcNdRHFsmKbDS0RyVpkavbTCUsMsGVbBqYgRUJrLs/HyEd4WrWB/JbrrMGD4
XxbT63exa1ITaQ+CDK8nam33n55uFx87ph+ccofB6AxBh54eiw7zWvTiw5vD3/unBcS3t5/2nyG8
dSQMDsji8AWvWoIgp4oUsSqmEe2A4nmgzPDchTG+DBycie07iDq2ELiIDII3iRH0YC+HHYXRy9aQ
z9p8HzphPTNMpUZPSFnI5cq21tOZgpTH9F1c6WeG9U+00H1oNhgTpHVSWMaqGPGquO7VLR4qOFX5
DikYnwxKmIUYjY6VPEFtbZxBxHgry5t2aVPSkDBj5XS1iq/nWbclZUWfS0ciq0LOvbCr0IyYwnmE
/IV09ohHTwtKFcatDt7FI961jZFx1ugZ1caqAujtStFFFEemRVpziD8wuXFuQpX5zdzkWl8fc1gV
jE6zQDZYYdFiKV/bQf93rDXdVcMie9r/92X/ePd18Xx3++BvF15FdvklBAiQuAV3OB0ErPsG79d0
ExfpQnRfwo4q9w6N54e+v+soumsDZBRUnv6HQajNhpHXIOQArCu4Ah8545BSlamA2dD6QI5ALyn0
ZnIt8/ooF9PWVlL2LZJ0XJojKTppzODDxVP4bsmkbF5bIUXbr+t6uA5bfByrYevSogrMjL7+S/S3
HVufi5tK8OvRzfvt090f98f9HbrKnz7svwBXZDI4xV4yypcYKEE4F9PhRwH32t0CmzFUC0sinONy
NYKVUoFv7Rwr5GcQ1OP1/wovc0Yez7o6qdU1JEUQc7qCwyskc4m+5+2HU0R+pqZAR932HJgRC0dS
YiCMVzu8qHZ8tRxxIG45v02BkhjnNCrtsjXBsTYU1F9UCkGkcckRVm+xtD4aLXbSDtIcDoIvw52f
JYiWBbXveAkVlgNNr12QQf30++3z/sPiT19f/PJ0+HjfGuLhahzImrXQpRglMV396jU24yLXNzS5
mzMItMA6dKh5roZtCqzJngbVGi87qojb3r71j6BR3KDHfFdHXSndfUViliQwl8kUjrWppZb25hVU
Y0+jWkxHgCWNmXsRvGgrUuzHaVxST8cuSLZNqBjEvwIClyYz41cbrK9VZOkS0b4NCKJbrm+quG5J
osNE0Ufvt0/He9zHhYXwPjJLrmjqBrF0g86CKsIyCIXZQBqcD5MqQyFcAhyAB3s7mkq4kOIdBnHx
4gCGp1iqCVinYXkEgS7z8J03ariXjZYL46TydaEUTiwKjr6hGOjWNwkZtXf4JHsXLjB+dZ/bsLjx
hJnyNCiQ+B00lSybunRmIeqSafHOqnr8azhy7BbUXswNDpHx6OFy1mfr/+zvXo63mNtia97C3Xkc
IwknsswKi9aS0maPNFzLKjznHlxIE9herB6kdVFFCfbM+90Eiv3nw9PXRTH48kluShf8+rl3tTyI
ampGF4aikt2UrntPX/fzJEExvcMElT1s4XA3l1UuxmW1oIK4wxKnoFAbX4EaioxDCXRMQ0zWlfvW
QlQol7ZG1x0DL6i+s2aCmdRmY3j7/ll0F9mqUaMjUdXtF5SDQ62sU1VfXR4UBlwuH93rYBFfC8zI
o/AADJoerchvq49XAgarGwOmMYXcfHxh46ILqyA7DvarKLCRxkIYESaaaxPsd7dot2UgcMd+VCTn
uWD+moRODeKGih7+vlJkqfJ9UkfRyXvnrRXdcAnzE1pj5dyHeU6G2DJAX6ik3e0chp1rkDJVKnX3
Rhs4e2Ec2JabXeNYOLsldmaAO4P8V9NNN/NHfThUYQvXOhlK3n2UVe6Pfx+e/sS0gojXQZXWgnLk
dSmDS3l8wnryCJJKFmibzU30MHSsBDCrAsAu00X81Kgsw2LmCMrypRqB4v4HB3L3dVmUyjm4qRNI
A3MZtqA6hD8fkSnxA2CvpLGSU3Gdn9BqxEqYajybCo9qyBt2CywQXawyBa2mu7RyzTmC7DqUkQLI
yhtYzkwM7YKeRqvaX2kOil01mUxAq6Vo5nobO75ouF3tzow4OLYtDbMrmoUngkwoUaGtBExVViOG
AGnSFafbqFs81txfJdBM03jcB1nJ15BLjXfLRb2jPImjaGxdluFNGkrJr3Fa/ulxM33hJYxRa0nm
Ef51GxuEjAiq0+kUEJ6pegIYphteZSGSRR1wDgSaTEvVTwSVekYTpyJBYGwkPB2vOnDMHheFiLkX
aLalByIQNgxsuaKqj/hC+HPZn4SQQY9MJH0GewJej0jGBFuYwVapwHz1qBX8Rb51ZSynJDoQ3CRh
Pt7DN2LJDAEvNwQQm4nGYVOPzF99P6TuiuB4I0Ij2INlDkGOktTEUj4nA57SzUDD1iR0Jtp/jmFn
jEVPgEJ8lcKJ8xsUJdUf1qGDzZ8MdUt/lbl+nXknies3f++fwaMfPryJxVSkbw3diFxtLkMrtbls
3QA26GcUponDY4fwnY7oE5s0rgHh+bsEQzJzZi9j19iDAk8/YiUwQ6TPhCfoPWs4wUJWl+PXOD9M
GaVLwnoDj8jIOoiRdgppLnU6gpaYMbmsxt5UYoQk3xXZ6Q5Ck06dbzShOsF2/THY+xsS+A2GlSwM
ZFJn4/eI5WWTb/sZBs6tw0IoS5nHgSBqa/UKV+Uh08FvgbUKIUXlbUdo9B1s5F88LNZ5oMXvyWAK
HGPtUUjmUJAAufolhEBFNYruQ+JM5nauKFa9ggQHnHJapbHf3IbN0fDUpMmyUclvvLRjRGsPfLzg
JI5HP8qG5+jMip3SAcjciJLujnL035rBa28Od9G/fOTUdUqFQqC00RUwPkMWDYMbSXW4BXiILAKP
hHBXR1QTduPwY7hstHSTZ35mqX014Z4uIRQNdFRHXjDRMl3O3pi46MawSJtJABzmZfPrydnpu3HO
0SGZvjo/p/YhJEo0Lybf4IwJ5jHoVPALPZpiabbht3khanZJYhZThD3oIWJt3tMIbfOLZoab4iIP
u3hC3Ds+Myhn5dX5yTmNNL+x09OTtzTSaibzMIXdAK9+/yawZrkJVShAFJtYnVLBSzKlz/Po8MDj
GUHFLAvbVfC+gFXgK2KwrNJ0lLQBAKvzZPFtdxZIIWdVcKFRrZRPYntWl7naVoxqxJBCCFz024vo
1T20KfP2D/fJBNjz0pKVy2CIT65DfmCwPG42P5x8IDQIn1N2KC0Nfh2j8NvjYeUJWBTmbiQia9BD
uz+p3taQKkwOAnjK7AzfknLSAb5oCwjU2PkWnTHRDAPXBkgMV2A1NmAebNgeHQCbzS6PW3BCJN78
ktfvm7Z4Eg7sYHOpZo/PlariVkR/SxNypRFEDQBjGlmu515aVGFy7sOb3IDFDAvVCMEQbvQ1ioPL
ykdRM/a9NFGqvzLUbY9TbidROPfxbPJzOBgG0waP6jm905aOedxbuaEanHT4YaDO3Ge3YbS3C/Ht
Z2nIrtIy8tgBiufMGEnd67nCAX5ZabDTK/yUKHkXBbLusxuIpVlBXH4GzCBv2ba/OBAXWRdHyM2i
PiI36bX11/GxU9YKkjZVSjtuEGurvxOeI0RY0R0ihkKz1MmovRK9+3N/XOjbD/cHvBY/Hu4OD3Gj
MJhmqmuFhXcGcHQ128aAhEcdkAhabkk9QNRvp1fnV9MOLbDy6f6v+7uwhzkYteHxiXewHWd0Nxhi
Tf4aFjT3FVzirmqwZE1/e0/Mtlek2Fzih0kinUkT8KtkynwiPP6wFECFyfCnPOY4vWKNLV4DZvHv
XwAwE8zWrrjpTbTbh+ThZX88HI5/LD749X0Y7waMjGIgeF5xWTNtKVizuiDBCQ9LAQGC2dX5erT0
DodVffqWMmSwvNztXiHawP9z6EJvyJ4EXLKCVNiXKFolmBVVHz9lYGx0nKd0MJeX0slFT+G+EADP
Y+haVE8412+sd+uo4ylr1mG8Htm3AYx3ALoeVfa3Ugv8CIKcyFYWjKqO62wtQxvrnzvdjoGyrGo7
gS6rsA8CbeXV5Brlqmo97oyJvpp84cyZzOInigIHR67PAWsTBKxcVKvG9+QMBqSFYfZj7c381409
IfZahWEhtY4suKGFB4gcltKyyGUhuOSUi0XMissxsVmlOZ8Y4nJ/+7TI7vcP+DHn588vj/d37reF
Fj/AmB9bVQ/MAXKyOvvl6pcTFs8x+lkVBFTl2/NzAtTIMz6ZnL16u8pmvOG/mmFws2kYhEWUpXX3
GFlQGqOKWh0MgwIqojfWf5QW5PhawfbmYRTnvqrfsFym+K3irpCj9NLhi7Dty0UGYoOBYpAi4b0z
3nkH5xWSRxVlE8KuLJB0YWZn2ufcq6stRH1I/pO3CDR+mH6x4NrRJz8ow6XrRYhaBrpmCByBBKGw
8ZnNVM4czlTU5z2IaqqwWcRDbDFm3iRbejz+JE+8mslv9AS4d7XUazNi/sq3zIgFc4s9CN2XfPhr
CDNTMbZO4ve5eHQMZHYkf8FZEUOk2ownCZHz7BQrRgfOiBuVYYNdpLe2/cJkyDNGuEYmdBktJOTV
jLcOicyqmhoyHHh3eDw+HR7wx0o+TL+Mc+qww6+gd025pRw/MscOSjbRIs3ZvJI6rPtdsG+QCKpC
gi/FsZPSWzDfyXzaZfCKFiny3GFmPIvFvmRmR/3a8TsY1rSpHzbpZ2xXdZnidZIYqWGEbbW0NUrP
958et/iRFm4YP8Afw+dv4dvT7UgS6daxnUJFNYVVOSMoETrDxKFENT48YndTKjoMcset2F3OmSdT
CaZPz3fTzWO6YClrfl3PDYW4thL8khjo4BNVo2gmUllJg5ZmZFMKiELGOueOwOnVxQyYkmCPE1E/
42vb7XsaD7/DOb1/QPR+rA5DO9T/c/ZlzY3jSJh/xbEPG90R2zsiKUrURvQDRFIS27yKoCS6Xhie
Kk+XY1xH2O6dnn+/mQAPHAmqYh+62soviftIAHm4ueQEf/z8hJ4pBDwvAm93b3Zat3knVV56RZlW
m/Tb5x/fn7/pAxdW+0T4D7BG0kAnrZZUPlj6h7ObVpIptyn/t/88v3/6Qi966uZyHS522jQ2E3Un
oRYeli5qk2hYnSWqwD4Q+pZnW9+z6eKlFN/a0GtXsDLhYZ9sur7temHDqLbhlIjr9DOlci5QY181
cxgx1LgrqUQLzK6PjVsC6Vvt8cfzZ1R6lk1lNbFS6XDbUYnHNe8dR1T14020UCtMA9Zz365T0wkk
ULvWUebZsuf50yAX3lW2ZuBZmmyc0rx2SGbQTm1Rk0OYt6xMWG47FBRpTiblwvGm1daTAe/Ld5il
r3MjH66DobMitI4kISQn6BpNEYm7tmGz9ff/UDQm5u9Qj5CopcWHKgdwWONqC5slVY7pOd4R4uPJ
qODtaEJx6dRkF2cbD7dSjXkppTHgUjEk00tdYqpTQArVRPImPUqLfu03iGm7rUWUpzWdxlVj4oFW
FNpaMHysKtsnBcP34Eb21kHtTYQOaRlLLdtUbWrHgJXXV3+92UdUNiiEooZn1fS57jig9XpW075T
BNY55E/YPfMMfvS5w48rXhn16T6jntaKUzZ0wHydpBR9umCo4OAZG/5/hHc4MX2o+XYsuaqd3U6O
B2ZDlB+Pr2/akgVc0EhbYcCirbEI7ONiA0KLBKmqAI9iKGQnIC+YQDSCadnSDx4zV9t0WunF+Kh5
PiWtQDBuhMuGBSjJGtF+D4MN1m+eXjYtCeGDTRjvkUZBNj/aoKCRs7aLWs0sWv8Mf4LYglYy0lNW
+/r47e1FXlzkj/+1+mOf38Nct3sjNwzNTaxvtGeRQ0u+Ah1UN3T4q2+u6mdZSX/YHJJe+5bzg+ol
gBc6jMWqqtronclQCu1AxEvSOEgbVvyjqYp/HF4e30AM+fL8w95gxYA7ZGbL/JEmaSxsRB3NA5ui
6WJ4SEq8RlbClIzbIMj7V93byYjsYd96aFO3m+eRMXcwGmzHtCrStnkw88KFc8/K+144quwpvQ2C
zb+RzPrnkolulYa+xiY4A3IlHOqeeVQL04vnCK7JTyJneSpSPWf6EF8X0Fm6PTyKhLcJlRlIN9SB
eIQH+251AdHd1ggS6bBGrMl7npaa4L8wP+Tx6fHHD8VsHO3FJNfjJ/R3olkGYhkrvBjtsKNQ1c21
vKNNkCYeKMTB8JfGoHma9vfV35HuIV5lyVPFR7wK4MCRjll9vdA8Dv0V7WsI4TJtBYfZzC0PQ4cT
M4RF7/eXBqY7Jf2JkuWsHftvPIjeaG/pb/fp5V+/4ZHq8fnb0+c7SMp+XNN3zCIOQ9csR7vKQ870
N3wNGMwbheM/SgVeZ65ao2OL+FT7wb0fbswcOG/9kH6AE3AOreMcQo16NSnyaROTBr/7tmpZLvzQ
SRMxHU0bYXuNqOdH1u7nKwJP8vz279+qb7/F2B+uy2/RFlV8VN4l9uhBHXaCti9+99Y2tf19PQ+A
230rX1XgEKRnihTLOapYpMq0NPxqmJ+lcYyn+BMDEVsz8qMZ0KLIWnTYtV/IhqOLltHVxfjugnUQ
tcnrJGnu/qf8v39Xx8XdV2mgRm7Wgk0v5QfUK5924ymL2wkbIw6L6Zyv532m5wqE/poL5wX8VOWJ
OcAEwz7dDxod/krPDVF0/k9blY4cx/yc7i3pRKRsym4ax+kBzp1wJiAZKurlyXTaVMcoWel+MmfC
fH6QpN4VfmKAWRdF2x29uY88MAUpKcKw4hImXOJwWsCpGU4BtoOemlJIyTiDT+n0zceFwaGB/Zx5
KVL7QhmptmfiwSeC+ISQmfGbybBN/VAgp2tBeowS4IHtmyxWlboENTYIsFsedQVEhYxvMxyG7pns
EZURddVcJRlYHFkDHT+msdFiZ1wO1JaVwsfz2yfl9D3fgCShH3Z9Ulf0e0hyLooHvBmguvrEyrbS
ZCa5UxcZbCotfTZvs0MhupdEoSN2gc/XK1oDHi3iYf/hlGZkWkL7cFSaQT8/qB6kPH3VfZYrFx7i
+B9XWYkvwWr5WZ3wXbTyWU5aWPLc361UPWJJEQLNeMpKS141HESa3AehRk18hPYnb7ulpZ2RRZRj
t6I0N05FvAlC5XIx4d4mUn7XsPLUJ92XMkhHLTQJbD514PaozhvziXK6CNc1lIYXLZ4cUtU8/VKz
Ur3Kjf1hfZP+GlLh//GNcKAoEOhdn1qxZlSzXhjIMmiN+7OCdZtoq+g1D/RdEHcbgtp1a5sMom4f
7U51yjuiCGnqrVaGGvLoI0Kv89Qw+623Ghc5jWYqu8zEHpaYczEdhAcnjH8/vt1l397eX//6Khx9
v315fAVZ5x1vMDDLuxeQfe4+w+x//oF/qmFbev3h4v8jMXvg5hkXOiPUliieKPHcUc9Rib69P73c
FVkMgsXr04uIs0UMkEtV99b2O/o4WUhiunhLy+sHPXwR/BaHBvRLhk5fq2Z2FjudedL4pOr14pMI
y2OMNaCr7AikaXnX16SWz4nBiYn1TJF5MBiEJl9pK/T84QUd32p7Ify0tlJ0WTQKt2/mjir8GRWq
uWvDYIVG73iqFkzMM/1Xrzm1EZRZbUWlilvPwzQqRWGGUkgfnr/AmPn3/7p7f/zx9L/u4uQ3mBO/
KlqLw+bOdadVp0ZSyZAZI3gkP4kpM0dR1GmXMKogjg+s1G9IBZJXx6PL1EwwCPe4jD+Utp6DaIl2
nD5vRpeghEx0Amz0JDkT/1IIxxBtDnqe7TmjP2BWXZEu1AG44yVEcjW1zI6cj2adrea8Cmf17uST
kztdY4hPS4vmzqhFh9GlfNxSTUA5IsZ7OJLQZLY8cj2FwQOCXBp0SKhg6STdY6vI6GNdJWbmtbCH
lSub8pr9n+f3L1Dhb7/xw+Hu2+M7HKfunkcvvcqgETmdYjOnotpjEL28Lkb/GcrhaPpoWu2opfkk
9SO0AYEfHtEJD7WiCRSg2Nv4nVEehm/QY0H19HiW+7TBjkAP1FGqUFpxXCoK/cZPhq9J0tZw261y
4CMII4+jiVgPFRluoHg2xWZahxuNpp5CZqqw2XzQSHF+5oaXj73lZMeodlKIx9g2K+0mSTRBPHG7
OhaJHNT3v5F5eKUoYK86po1wCWiYsBic0qsivgLSrnYwqwzvEjJNcQXINbpahPqj72Rt9gKG8bGa
rE41z+TSENQoCy9ZzU+km11A21MmXhUuGbra0W5jMD1dL3SkwNL3wchFXNm5/R8l+JJIHRcScSVm
JOYKZZCgnxt9rQESxhEjXJ8CgmNPI3xMG71LyfOwSu8/UM9IGgc3W3yGTuTGLAaIFuwDKWcrHdOF
k9L74vnUYD/kzHDJM2N4l9o+GB9I4nDP2jdV1Z7wQpX2vTDza+cZHGCGpdvQJWJEcKtKg0NHIofh
mK5L/G0MH43+J+cDMlDR9yqpNI9grUtqSMIhopwAR4O4+dJiFB3FBmtfZaj0Pu6Oe+ocxvc18enh
zKkoh2i6eecFu/XdL4fn16cr/PerLZkesiZF84W5hCOlr7R9biJDIXyCbNimzvSKP5DSxGL5phsW
YWWgXyUUmeHhR+/TfSXCniojBi9Q5p9YquNZE0smkm2QmX44szz76NA6EUZu1ElLOO9JmWH/jRTh
ZrDfNxVLdPdTOkNTncukAbHCsodTeKyASiQbOsG7pDgaz7UrO9Td2bNcdw9dsPiSq/ZtSGiZYc6M
LEQZRivU4ae0O1V6iTXpWbeMPtLvjyzm6pIA5Y7NWBMzrU8eSlZkOr9uyygsDSsRP7NsG/hDVawp
271l2dJkleY9TP5GrTvzoWVAGhtpz0pbtOpjISD9RYxiEZdYrdYl1XeOwXTWMFqfB0deONy/Y/KX
xnFJbkxcSek933UBOOAr8gluQDUjyIEWq7UeaVWxW/39N5H/gJBL8JhJBos3laS/0u4DDUBXyZf2
TUIhTI9VifS2pX3QCRDPjjx3eI9HhhM385lc144vcO+vz//8C69LBtVDpnhdJmwLQ/UdLgxEEWTZ
dXohND8pAJ+OKYA3bD8DsziMUNokTn9r6KRhD9sfP/j6DEPAuCwfqXDGzz5MHi60QYp40W7DgL6b
nVguUZRuVhsqWtbEk8GEwgjX6OTC6adD49qtt1uyRCaTeb32E19AV/38F9F2F/5EA3QONdmR66Yb
E6ffjQ8xiwiXIWii06Zw6CgyG+QFj91uPlRU15EkOYrENG1ElgvKfBxDc8dbaSmwzKArXrqYxlP5
76om/k/OzTFtWKnR8bqq6GHVAITqpGr6IK4UseBSNVpUz/ahPlXmSB2+ZAmrR630cW2TJKFKgiKX
e/kfkoBT5W2mnMXiwHW6zdmmdCQYedPc8tScUOOXBfu4tFuNXC4/BcJcR28lQdLccakpgRwH644e
VeWDGR6cLEPjEvBGBuz7Sru8yn3tl6f/0kP6AIG+q+/oipzhhKpXQ1D6ch9FZPxA5WMpdqrjb79e
az+k/dm5raRvbAtDWXsJVwhxgR2ispSd0i6x9lDVZsdq0MrXKM6XY0ys09OG+d5Ii77xvCQCMulP
/sCo+yCA3/I7WskZYfRjkTajIz43n1VWajxBH8QsuTkJkccVzUaKU3mXJgxGPe1LTkvqIkNnji07
WJpBB/SqnzmVfnHQ98eOBpqjdncp8+xrUqbPsw9n3RZmpGj5qlU4pTk3XJpIUt9SO9wEKlvRRFtT
NJEx2RHo4v1mbwmP4mRY8w4t+pQBmBgCt5JKkrrFipEFH39uMaXFOU9dHnlHno8obTgKcmAN7Cy0
8KuyoTtFGIg3B7MM9HeLazIauMl4ZtfULU8NXJY/jIHlj8K1KRWsuaRk7G2VCThYWWmjvci7dZ9S
y5RALEU2JLouh6cvDAsmoIfGVYcgGR6BBO1QH5mRofzWWUj5DRznuS5gAMSvbm0RgA+UxbjaXiDZ
qgW851EUaurMkgJpUS2P4nC07sz3XiMDITrfLgfsWqboOqIPjaoOB7+81VG9FQPRVzcsVj4uWYsJ
L+cPf6aNFmKA+/qKdumON+cI/NlUZUXrYClsemMJ8+bhVQF9vWFoROryV03hAuux8iogntwS40Yi
r2MrKarU1T09WzFm3s0lT7reh3yOWek8iI68acnxVky5cK2knEGl/CGvjtnN/PEGEM+Pt/ia5GZS
wwFquQ4NtKh8MJ5f7k7YVGTqDbtQnvTU9NDTWuNoAs4KfiZfjlSmNLV8ZY5QlcPJA/67OXJhbScv
CjUW9Zk84zs9RDZQvN0NCRdPkdr9bZ3FHikWI+fO89SnU6Ssdd14raox3u85nEypjK1Ya24U9KwF
HqvrhyLVXdZgv6TU9W6MDtxKdR3LzuSixh/KqgYhWBE+rnHf5SgyUjRdgFcSatPTudWWFEm51RK3
OS4ZJTQpDNfso3aIkL/7a+jpg2OiBw4zhoFhf+aD3dstrqy0+WwuVj7QhRsuH6hKS+U9It1Dkmjf
JOmho/j4/UET3WDzq13bD99jXHn9YsKKOCKIeuSaga1JTSLe953LTBtDEsjaPdM07oUt9nj6UFQB
gIzOq0hVALQvrzqma2VLMo9jfP0hrSiQoYrxOsL6DibSmmodAQ5nGKPQ4/WCnlBXk4FO6tOD4YcI
CYrnCH4FirZvpglGEsEAwMhsvd1BJe+Q7jaE4QdK3GEJvrfrebEiMfMYkeFOxPpC6rbvzc8ULYnB
6JVMFtBtJ1HtNiDaEkT5HGO013hNYXGHa2+9MouLSa+jyHMUJ85idB+iJTUc13RiAgN1znSeg3UU
RL7vbAzE2zjyXPmL79cRmexmu/TRZqcX8JDBiV8nZXGdwyKk04QGeHdlDzo9R+W71lt5XmwAXWuW
bjgJOUo3oiAiWx+ig5T+2Dk/FacB66vp9tvVyjNH62roScDXa1eKwF4sN6gdpITX3+aYZG20Cjqz
gB/GdIl8x1txLZlBiDOIIImNtdTFDoPSpt6qUx8J04bBRMliI8HxKtso7aAcfoRlxG/wX3dHwNlr
twtVLdM6Vz2P17X+o9/zxAzXhGTYqXLmCNuDuO3yXwGLWg0FISio5GIsqnVdGVxC5VMnIQXf7ZTG
1OrD81OsY5PDClXbSQC80Nx2Cpp4Lce/UOdMLMin72/vv709f366O/P9pHSLFX16+vz0WRg9IjK6
qWWfH3+8P71SStZXQ0KWSvvfRIDD6zO6kfzF9mn76937d+B+unv/MnJZL4dX3Y+L6dpwrmDcJ9zf
hL5mHQ3c1AhC9+Ti3UMben6I3UKOA8WZ+PDiSrJdig7GekBih/MfWcvPvcPJB7Tz2nwfn0Uh9BiQ
GSoZin9ARRcncdgqKd9eYKPYq57eR4ruMTb79uOvd6deuOHXU/w0PIBK2uGAQRDz0a2KhqEyg2Hc
peEy6OK9ZqIskYKBENINyOSI4QVjXk/Kr7rNmfysOsNkWcjxj+pB06CQ1PRiOMQeycY9mNJuLrtU
+eV9+rCvNEWekQKCUExS69CwfdaxiLaON5h2RMVnFowBoL07zlB7v6cK+wE25ZAuFUJb6vSqcPje
hv44GdyoN5uIfk6eOPN7KNkyS1qjZc5SSXR3tBpZjNGUqnsbs83a29BItPYiApHDlgDyIgr8gGwL
hIJgqfiwcG6DcEd+XZBy/wzXjed75Jdlem3J96uJA73z4/0qJ7+vYZ+OuuWGH+5wqLav8uSQ4e2R
cIhDcPC2urKrqi2qQPg3N1yLz/C5vDloIGeRxFLpsw9cKrDbn7eF37fVOT65gkFOnF1rlMXqovZe
tKW9/ojVjN6vxsUMo3nRjy6SRUSHcsRDlQxYCQ4CV0q/bQwlyciWaorMfkIQRNrKS0C6yylBKfYG
5aAqaowU1PfRPFMh3U8G8zKT3/OsQh08yiuJhIKVmUCwthMIQ2s7OD2+fhYOxLJ/VHemJY9eYMLu
2+AQP/ssWq19kwj/mgbhEoA91DXaB4Y4qzlVcwnD+RZgO92GUc8nEhuUKOR3embcRwnZTg4q3xvF
MDgqvLNntSN25dAKeGFipqNxyEVdr9BZQGSyR1YIR8c6OOjaUH07mxYS4pOUSL48vj5+QkHa8mjW
6rroF3pmYmDeHRzL2wdqbZdGrQJVDsoTEebjuWx/98PJQUIu3DWiZsQQrG9wbvL6/PhiC+TYVHAk
TVmTP8Tam5AEIt80XJ7IIF/CcUW44Rq9Mjm7cvzEcBRA8nibMFyx/sKARDtPU7kPeMtwT5ZbWPJV
RuBxtTDkaULlKJv+LLyWrSm0gZbPinRiITMR8Z0T0lOZ1pZXw0G9Dt5stKb1o4jWwlPZYKzVp4w8
/6psea16p1ORQjU1UYHR/7J05/D9229IhfTFsBMnUeKcOSQgbPmXyh5DgbaeR95ASw5L9NDpso/6
9TJudfOIxqai94CDqBZ4q5WD3ll0065uoo45LDUCFjHPWtJR5FDcU881k0CVPA9mn8bds2VgGBcJ
dwF0rQCF6GzBP9QI9ANNuGQ4pqVdkwlxpieVeh1k51c8jsuupmougJ/pHR57m4xv6VcSyQKLxT5t
Eka28XCVvZTFsA3/0TK0EaE3E531Flt26DYdqb08MKADCT1mjAG4p0bHYROiPp2QhRFXwJZ+s/SG
QqQJN7VLbADwwGFQ1GT5ZshZOcGSlYc87c7MltJsDmoEGeOn7Zn+YqwBP5FA3dhLMxKXJnZbkN7+
xl64pPtz76ihBH9iZlTXxbUdJgQpjRkSi1m0uG2mwDNmkorJN1G56Syq3c6qVLnSUe1W9kdOGjpV
H6tCf2U957nTbkM4y+25S4NuqAaa8hquLmbBEi1pSzWc5kzrhVX97xvl4hvpjltv4y5ssO1xD7cM
Tq9woCkTzV5JUBP8L42rJDUA4aU/MdwMSATdxMhbAVde8olYvCY1B832VcCqcYsk8OxgkK4MA+RV
R7NYqE1bHUzu+5j3+0K5t2O8TkHIRbpg2OuO2spaPDRqOPXKKVPZt2QiQNtbVSVHx+lKGNzNb6Z1
jaqL1CCF1ItUNw1PL/dFSieErudsP9fzh+bx9FQ7bh5grBzjU4o2qCAtU6m1MfxXq4rBSMi4ZSQr
qdqVgkLs40Y/rIxY5se2jEnwwHqdlal6ClLR8nypWhMUyZp5juk4soubvZ7IpUV/DU3VPRD1aoPg
Y+2v3YhuxWKhhvZHl+X5g8uBjn2WVccDjjlYus6wI6F3Zelm3b4w92PifUEtoowqAy1awfnxqGki
IlXckw0B7efp4ceDC1NqmUDwBF9pd/1ALM7deCQp/np5f/7x8vQ3VA6LKNxNUuUEsWIvrxUgyTxP
S1X7ckjUuGKeqTJDrdQI5G28DlZUyJGRo47ZLlx71McS+pu+rxt5shI3xIUMoKXtAhd5F9e55j5y
sZ30jKUPfleAJOTghVTlmQYGe/nz++vz+5evb0ab58dqrwbbGol1fKCITC2ykfCU2XSfgz7b564e
AnHcQeGA/uX72/tiLA6ZaeaFQWiWBIibgCB2JrFItrqb1oEaeR4ZZV2iIAX7ekKnrAtPiW+mlEUr
VzIZV30WIKXOsm6tk0qhU2vkJfVuYUyfdTrPeBjuQrMMQN44rCUHeLehTzcIG9p3JlbrSoyiB3EV
oRSSRG6xrgQ9L0z/fXt/+nr3T3TiP/gC/uUrjICX/949ff3n02d8J//HwPXb92+/oZPgX83U5Ubu
LC9rd85O7TpVlVmsdnHhR4HVnKiRlKEzLWc2yHFfle52w+DuvKV0csV6iTqDpvyMAGof0QEKBZry
7FiKWCDmS4ABWybJLsYFZ0Qmp3q5IbDsCLJOrgdeQCA90AcbgR39lbHSpEV6MYY/1TRiVxD+e4ao
n6RPWzlRj6ec6fp8YjoWR5MAu0OtbY+CXNVGBCqk/vFxvY2o07pYz4eIUPre0G5Cx6WChLcb3zVY
i8tm3anGrYLYcWOZkMKvmXElXhIdKVe6CgBSrrmZAizyt4ZGXcAIr60PSY1WgXTG5AOCHKc6WfoE
1e08JjpePzkbtMkySvQXa1IQ+2tvZa2bp8Fpl+uzrDBMbSWV9KIgIO0eQFBa8zdMjsOaIm6tjNpz
QGqtC/BcbuAU5V+tluIP5YczHGBobyXIIe6L+33t8C6HLAuX1SrcGxLCFCLPLNS1cAmPg+6tNYpt
/Wgdzl1l6/J6Z04dDCU4ykLp3yBkf3t8wU3pH1IQeRzUsRxb2uDL2d2erOJwji6sba96/yJFuSEf
Ze8z8xjEQfJo4BSotAFhzyVBGtyjGou38B5G7yLCySlIes49QTge0yPzqAcPJb2A1DDTD0XCf4XD
DA6xKfqJSkun6IjoU6F4fMPem3352cpCwsmjuJjVU0L3COvOLA9rT1tKwUd+ISIRBlvt7UF8tPP6
M9evNZHeSR+T0nbJzGqQQRyZDSg7d3qaw401kZjQyT5xl6uJgav/wElbAQGbGvyCeG7xXiR/0MmD
gbJBHF6MdOosSxj0q+HgVNI0eWOg6eGyRJsKhSSdJu+QtYuKkQzrYkIMPxnm8QDLl/MVAL3od3WP
d8rulrOuRPGsXeD/D65P5KuUQsiL7arP89qg1lG09vqmje1KUTWSGtjwV+yYgTPHwUhSii0mDWUV
K5P23gwtoDdYLdykLYzE4WnI8CSusVQY/rCkVK4FCtKMv7YnQpstjXD8qvdWq3vzs6rJ6Cc2wKAt
A19vFkHq+Qer+UG28enXKABHBXA9rcYasNRTHLobCuLN2uwgHnsRHAJXvlkSFHF4Vh2c7ctJH73y
yxMxsnh2yOiAeaMrJBgX/tbuEpSNXJ/VQq3SrChKRSYJx8raIKKiipUbikeu7EYByRjkna4ZJsaR
iNHq0b5SJwZ/BasHRopxZDgxDcrsegqD/OPOoqrjPDsc8N3PzdR1rg2rQ7tVvapThGSVltdm0VB9
gjP4H5qFO1L/CI0p5pqeGpKLuj9+IIaQ4dBl3saV6y/bezb20HyliPxjRIxh/9dNo8SwygwFZb3J
8nTjd+QD7DiUjYEmRjdepFujTSDS08joUs6R7uybTkmBNBvXXIfBD+1yVirEcTXa7tt4vybIL8/o
O14JYY/etU9MD5NYE2FG2ho+/v7p35TOCIC9F0YRuk/VlSFVKwVpyXWHGuRl2l6rRpjFiIbjLSsw
jJZqrvD4+bOIBggSucj47X8rwXi1DHEGqFKnXdbpO3knO7cfEApViEIG+GsmoK1fg75QTEDKu1SC
4hmUqX6RR2LCdquNb9OLuPYDvor0O3kL1WaTidoI77xwpYfMHpA9e2gblpFx2weW+JQ2zcMlS692
wvkDyDxDYGYDEvZlNnnfVF2rX4VMGbGyrEp0IEvOyIktTVhzgDGzUGaQOeGgqb0HjVAKMmLL9+fm
aGPSizaWgKhPnA6AVaI/8M6xuVnwPL1mIuOFgsOu1GQ8tYNdD3ibHe2cDB7tIkUh+iE5BBDZUqLI
NK54QX33ITn4tMr5VJmkiNYhMRxPfX0ghrekG883Cng4ly4UvzPuCVWoidg2YGuy+gO8XdP34zYf
rTdr89G2STYfGf3J4iLacQa3q+WqMeoa0Wbbe0uZxDcySWlXoBbjljafsfkoecXi2i2XaveThdpR
F9I2V7DQQLv1EhjeKGf4swXd/OQ43W1+qtN3m3C5YKRhkc0W3ajf7meLvaOuOlQ2ftr6q8CVG6Ib
Why32G4NMGAKmLNegEJBfianrX97zRBslOmRxeQYZogFC1i4dWORcwwIlHob15nEo6p8yn/6/PzY
Pv377sfzt0/vr4RWe4pxqor2XhXUnF9N0hcs+5r1/0AQwQSFn3sZbzD0fJXDCPgxfpQ1H0y/ZlKK
M/1NTLBIDOT3AxkvHMFBPtQzk/Ziq1nRQUZi/Pr448fT5zuRm9U+stxFokdRkFTz2lGHFzSxBZ5c
WW004SzWzv5NVThTnfPKGu2jDd92JrUWBmgmtbPaQ32ikvYhqrgiKMNdvNH2WeWsl/JCoJIvXRSG
Bk26/+R7K/2F1wSBf1zAUB3gYJ69p5Ht7PHp4VtQn/7+AQciYiRIk1N7LEi6GfNPZ5LDj1rBZ1g3
q1PpjniCsttQ8SUwm3yg4odWogIjd5MBPkShNa7aOov9SI3nIsl8Pbp9Uh4YjHaUM+6Q2O1LtKTv
LBhrso9Vyaz67BOojldc6QsEOeHgmBdSksWMmgP0D1Z+7Ns2t7LL62gbOKcA9th2E5rt1MRhG0aB
lVhb800YbdwzCvGd55vN/qHooo1JvOab1Xpl5XGO997aPfauRRR49tBDckjvqiO+29FB/IiuHtSJ
shtTTCr7GPXat1FHTI2821OvuzNoNloBh8fqREwH6jZwgLJe+Dn1zLYGJJWQv7ZSbJI48L2ObBui
DaZrshvTQ9jL7Ny7ilxjPLul4iCISI0IWZWMV9xe57uGwagJyEoQhTWn8vHYpEdG637IUlV6hIur
VvCrh7dz1r2V99t/noeX1fkqcf5EvkAKi/OqU5MekYT7azX0p/JNFxv5T594V0q1YubQT8IznR8z
dWEkyq7Wib88/t8nvTrDNeYpbQqjbMM1pksreeLA+q4oOV7niLTiqwC6y0kwGAlZAOTxKFlZT2Xj
/Ninz+YqT3S7/Kqdsg54LiBwFikI+pj0Ia5zRa4EQjIIrcqxjRzl3UaO8kbpau1CvC0xyIbBpBwl
hEtsdqGNTyXapJz0xSJRfq7rXLPUVem2YgDN5vIPXqPPL2TU1qFBJGZJ3O8ZPmtTr4ty/+qniDlz
r0hAJOv4Du1bzVwxcq/zI7yYRzdwKKqsNtqSNZQQA/hEu3VIqxyOTDEIYZRLuAm/+isvpJLHcUIa
o6kM6gjT6J6D7lNZZSU+atIvviMPJyO5jc0EqJrwGCiP/mhMcv8BXyU7u6QDoN/Jm+Ap+eAGk7Y/
w1CDLh78A9nNC7JgsNi8QpRUPx0rC4jnkJiUjw0WgwH2cG9rCHEGRl9haEyW8GGUFER8GL2kg5WR
RQxQqpYZr7EUC59CEaKdfjE0Qig7+9uFb03FjDlNMXIWa5W3wYYMc6QUbJTNiQwQ29H7kVaz3VL5
JYeyn44AjMC1F3YOYEeWCSE/3C4WCXm2Ae0wSOEJIe+bPJHjbnCazcU+WC/VXpxWVjti8Tmy8zFF
Cw9/tybWoNGukBr2TRuuFodq08JyG1INyGN/S4bUOZzTfCgT8ujHi6lJkt1uF1IjXexicy3Ez/6S
aTFWJXFQ3zPcnUvzfxm3lnA2MYS0T6Ds2uFCQdYeGXFQZYjoTwtvRSoz6xzKaVgHNu5USbUGlSPw
XB97W2pYKRw7f72iitRuO11bWIUCjzbanjnWniPVtXoK1YCN78puTd6p6BxUu/JgS5WCx4Mqlwl0
WX9g5ai9QJbGsr0wGdquJjtjj/46HS5YRp4Y/mEZbhENfUc7MgrDSAzpsszFN47b+5nDoxXwJwax
J+tu5DSMaPYsvO9ZsacaAV3wdaSi58Bw2HpwLDnYiSIQ+YcjlephGwbbkPbUIjmK2Au2UUDX45iH
XqT7gZgAf0UCICcykuzb1FN22ngBMQ6zfcFSInWg12lHVTSD0707ts7E1UZLc/6PeE2UEsTyxvN9
csaLeNVH2vZ/4BDbDzEWJLAlU5WQw3mXyaVrV6ngjmhaNHj0QmKKI+B7dEHXvk80jAAcVVv7G0fm
/oZcBFCGpG3uVI7NakPkJxBv5wA2EQ3stiQ9AFGWqKxEAnIUALYxFguaJ1jargTHmlzpBUTK8BrH
jhxNsuRkVIR5EaiDFbXut/EmJMWBIi0PvrcvYufpet6D4o6csnmxoSXfmWFxcwM4IIZYQe13QCV6
G6jE2MiLiBq6RUTmpr+eKnRahJ4ZFjsEYGrCFTuyDLvQD9YOYE3ONgnREvy07sXRNnAoHKg8a3+5
qmUby/vEjNNXsxNj3MJkJWqIwJbqVgC20Ypoqdn2zQCqOO5rQ8NOwYjVH1+mdqpuTKEFQZj4itHo
hRA1/e3Szr5Hb+eH1E4Ttrs+PhxqIrus5PW5wWBMNZlr1gShvyi/AEe02hDDJmtqHq5XxGqQ8XwT
gbhAjygfjveb5UGPm5JDA0jhCSJveWQOO8HSaUSu/CvXVuOvtuSFi85CbZNyNY3oXShYr6kjAx7Q
NxGx1NRdChsXuafAsXa9Wvu0D6CJJQw22x31+TlOdis6qI3C4a+I0nZJnXrUFvgx33jUB/W1wMMB
VYwGTgV7VCFFO5qb4hk/td7SRAGc2qSAHPxN5Q5AvLwrDybzyyeBIoWNf3mNS0GMth6ubB7fW1GX
CgrHBu9giSoWPF5vC3I4jxipxaYz7QNK6OFty7ehI+0CBI/l3d3zoyTyiNHNEr6NfBewpQ/m0ATR
DVEqK5m/WpKkkIFa/IEe+LSYsyUWwvZUxKaPzQEpam+1ODWRgdjJBJ1oEaCTKy7SfbKhAAm95QF3
ydgm2pCmGSNH6/kemfyljXzyFmtkuEbBdhuQh06EIm/pKgA5dl7i+njn3/w4cH67PJmBJYfVu3U5
RFW5NmTQM4Vn429PxIFcIikJjXoPBF0MtUUHGtMkQTc9rtciIWoxRft+IGAsAz1cxgjwlrUZOrDm
NpYWaXNMS3RpO7jk6pM0Zw99wX9fKe9XA7vrMDDi1yYTnrAxtJEuuIwcSSrdOByrCwY5qftr5vC9
TX1xwDsifmINdSSnPkCPxHj3EqdUYX46Sa20rpTQblb8cyMhrUwDnqSXQ5N+cPcuBnQVYWyo3NE0
lmzD+2DkIco0xaKxMkUlPZuKFp8zcYjR8P70gnY8r181H8fzMM/KNlivOoJnel9e5pv9QFNZiXT2
r98fP3/6/pXIZCj64JFFKf78JIARqPhCMyEDb7RPhyI58xWlap/+fnyDYr+9v/71Fc2xyDYYezLD
4IJUKabcbqcnlX4ev7799e3PpQZ3sSjFgVFcLbSJ+opuDIkPfz2+QJssdIYwbW1xsVMb0/ndXKqP
nb/bbBeKJUxJiT4evRBSn/A9LH2cZ3vN2yjfaz8wZdWLgvgqzk6VeNYnvh5RnSj4oZ91qvT1N4VW
p9PTmUhM1xmCYcvUtNQBr8kMs5O2f/317RPa4tlB58YV4JCY8YcPyeAr/ljLK+b5YR4gfIcgL/0w
EAMVjEV8xFo/2q6skMMqi+ptQfsYQ8TtVqTpkoBHvU4r0672V515JauxFOh1jxK3RGXEI79qYzgS
9Yd9TGh4WqBN1BUG7RZjooc2Tb18n2iBRfNUFVKkpd1DWcGZvGaq13FR19gLNH0JhajfSKuALLDe
aLW/IV/xBNhB5g0xbgoMItVyllAX5HDq66HEWawJiUiF/A0vKgOIEQ8y1R8bEjQHbZjrFIdEoQmV
3bioEl2HAKH7tLB8tihwFNVF5IhEOuO0ODvhmxX9xC7HY+etwy19ch0YttsNqfw8w6E1/ySdNAyZ
4Z0xvAQ1WtvUaLfaEjlEO586d06oepCdiZFBbDfBZmXTrI/H2+yZnH4U/h1rndHSUEFik7ZnR1FH
pRdl2g8U/cFtoupr9KBFTayp0PXW9BtUgA2i0GQwaLZiuFin03ghjDsyZOvtpltad3kRqsfYiWTp
2Ajk/iGCAUrrFgkGoSYhVkoiP7bvwrltpg/ZHh3/36iIdI8FQp+rHg88NsLEArVF7wRBEHaw9MTM
EcsbGfM62DlMQCUcbR1xxIZs8uLshGuWF4z0PV3zjbdS9X2kboyqbyAp286qmqA757StZDMWVBgm
GOTBvoDMY0fqRyiwTyQGVGrvmDD3TgkssMbqSiDtNV+vAqf8MJg0EJPumnv+NiCAvAjCwJpPc1QB
d1cLmwpH2Q0TJiGF2OYoCtnxYKxyWFtzzNfbXLcnEFUtQvqGawQ9YywI0wxrIRfUyJlMtF7ZyQTm
Ejbo1BIDYEDc3T/dq1g0W3iSxiXG4tVe15FZHuF6Bka+cJpNQQLgFnKwZsT9iSUMn1+N2a56/HUJ
3dNZPD3iyV/3tDkRnc7TZg4ZM/hS5S07pnQi6Hr+LAKGlPxMewqfmfH6QtxeTOx0oiC/HCOH59mZ
CzWbow0tBSlcSRiQ40xhKeF/ynauIMPcyJPKW8JhG0KNcro2ywZhM59LCVvpsfGgQPWmy6bMYAmp
ekwnATphn1yZDRaygQ6sDIOQzlRgkfqiPmOmUDAjGc93AWmEofFs/K3HqJRxA9YfGAxsuQ2FyrCj
CxALl0uGb5hhtCMLBtBmu6GTRoE9JLcDjccSyjU02qyp45TBsyE7hBDHDfDG4LNEcxOKnGlbmtA0
U+RvyNSHE6a+N+v4Vhd5dTDa0XKowlVHUXijaYFl05H5w6nDcwxIxEjrf50ljFwJ0w1e7zPGSSBm
u7VrBN1cnpQjDfX54fwx9RynWoXtAksCaVFi8NALh4B2JCQuD5u6ODlBdKhFF17AZ77vL3Rwl5mT
OEEpoEt5fGaRSuL05zw/guxFvt0rTELQ2FfV4P6USkewXJr0sD/THv5M3vq6vLMP0lB/KfQIKQoH
nOhW5JOjxhP5a8fqKsAtrSYwc6Hmg7ch/YhrTMZxSMf8gF4E5VnHd3TueIC6XUJxYLpZwtBT3Rga
mGwmGjMOWAa6o0OsqkzjucjCTBlcR0Ky0UxZXkM0sdqYbjnbZ3s17GxsB7KNYemn9bnzjDSbbOIh
2pEqhWdNX6YToNFhOjvoG4U+5QrIH5cpJSJ/fDGsygcyTc7Kh4pGTqypHfkVIE7f75PlPLuiJhPO
pFUIVb+isAHRehjuiBu9wODA36RF1TqiBzR9WpLe0hsyPoYsmCspUWgj9q3RIrBU07llLRw+Mr2u
ZjhSTGJwzK9Q2nujiENsIVcpmjRpWEtf9WCXtk3Kio+O0QsM16zcV2WCpXU2xLFq6vx8NGqrs5yZ
K94EzPUWPs0cY6bpVC030e5Hq5eOjiDEA3i6El/AXHN37REnkDtBnDxmoeT0sKk4nagCx5SMPoEb
Y2jnVVWjNS/9jXSwk+lzRHPej8bGZZcZBZHh4hwLRGbOcfGoSu8rcd/tq65PLo7gJo3LRQ0mW1EW
zHEaG8IyUsqqzQ6ZdquRYqwZxBr9+mWi45nY5f9echEc4lHx+Pr448vzpzfbnys7Kj0NP/psrW7W
SDnVUGdNhLocGYaIopq76PqsPl/Mu7tEdXkEP+CIj05Y95lOTeqenTslkNWUpUCFuV1BxnWbYJ7m
BzTy1hO+L/gQq8nIUHwD2RYcI8PXVV4dH2CtOXAz88MeYxFOyh+OMmBAsB66IoFVsCl0L+tDBeM0
1mltW1gE9MXe1+yIj9BVrsOXhhVkZfA7in5Eb7iQHoVhw7gw/I6fipRO9WKUmsendIq1jfejT98+
ff/89Hr3/fXuy9PLD/gLQwkpj9j4lYjDc9quVhs9NRnhI/dUvemRjh7g24TBGbcze0mDTXNtxYeR
q2xSXaYplEDms3aMQlaL1LBEC5g308QNXd0aDceKRIsoNdNkIEetQgMQZ3SYTIVlyOsW2xFDsYph
f7C9DrO4vvuF/fX5+ftd/L1+/Q5Vffv++iuGdPjX859/vT7i/aiqLTMkjIpyZFv/XIIixeT57cfL
43/v0m9/Pn97srI0MkxiqwGB1p+SmPA3d582ZZr35jvSUMbFjNU8yup8SZnScwNhjEUft924Ats8
oiS/hyR5VJT7PaDhojirldLB+sxpf+RKkYX/jDw7nigPIGIyH1NjOl9gZTDG9Owwf94vR801kIpg
6cxg5yQvNUa2OAH5WL0bHoHkCn1nXBcomNwuOB3CYGLMyrISySyzNUdq65rh+2C12YzFUceYuasU
R3bUNPuR+KEz1ut9FZ+s7WSIMQsz0tEjNSvTSZVrHKL147enF21RMhAt3yZLjsb+I1KdES1x1Ot7
/dfjp6e7/evz5z+f3qyJPvYxK7ttRGr2iD3O7kqF3LPTHjb5JKMC26h8mc8ln7GDDnA8RIQy2sGu
hLZ7qGE+BgKGFcIgl7A+ZLzO2YO1pwBPS8ZaGNE82VMfmSNR7f4gsUZETPtTRSxtS3bJLo7EQF5u
zrz/kOrLBMbrQPjURUG4pZRxRo4sz3a+6hVABQLdsE2F1uQV+shRZCs/Cj60drJNWjNNnhgB3m7D
aENlB8g2CMk4vDisc0+/8x3G+qGpuGvJk4u2IUElB2OANJ4fmQkXR/oEKMqZUfeZcsYzPWnOLoye
n1WTpWUr5Mz+wzlr7o2VGJ2ryli04xw+vD5+fbr751//+hdGXZpkl+Gbwx5kvCSXYY9mmjiDPKgk
5e9BfBXCrPZVom698Bvj4PaXlDN778N84b9DludNGttAXNUPkAezgKyAltnnmf1JA0J4nXVpjkYm
/f6h1avEHzidHQJkdgjQ2R3gBJMdyz4t4WhVGnVuTzN9GgCIwP8kQA4R4IBs2jwlmIxaVKo1IrZ7
ekibJk16dUVEZjiNaT57sRTjdq9RiypJB1FeTxojxWH1YbIdyRH1ZYx6ZimiYreI5UdLsC588zd0
y6HCJRaopTUY5lBValPBIko3UPywTxvYeVfGBxMdRyn9KdNP12IUugKFIDscQqCf9OJmcFrUKWec
AEa6xz19e4ftcWmoW2NAqjotRdxIIzHuJeLdjf5KBqrVJ7eMXWvocsyAS11h5lAHkZpAk13o9Q9b
xuXgH4efcNxIZzmdobSM5CGK1rWZcWc5JbxQUdY+eKrZ3ERyTCAAzd99bLFMOvl5nNiYOcaRuCSd
Y98H5mAI3ON72lW0DwTRqVM9c7A4JkPEI0emz3H43QfWDBRUh1UxwK4gxzjq0gqW4cxZwvsHh0Ma
wALYt+lSX6oqqVRtE6S10cYP9BUQJOLUmOWsuTcWMf2bmDWFuaUONNilGUhtF934QQPjM28r2sEn
pHMtotChkYwl6Zi3oZRw8EvP7pMxviqOSGf7ti7TJTHgXKNtUEPV1oB9AcO8XYfkyyoujLM/MGV7
Y4YfYDFahDYUnUqRwnJSVoXeAeg3XTNJnWnC4e8xMdfDEXUuM/umYgk/pam5wPCsqB0qh6JptuTT
YIFvR5kes3ekjXtR7nCGh3xSRGzr6nQho4Ehz2Gvno1I4VDaaz1++vfL859f3u/+5x2MjVHzzbol
Bgz2aMb58F41Ny8i+fqwWvlrv1UNcQVQcDgBHA+r0KC3lyBcfbjoVHkK6Wxi4K90YptU/rrQaZfj
0V8Hvh5+BoGFAMoIs4IHm93hqF5ADmWHoX1/MOskT1M6rcJHfT9UNuBpRXc024zbGq0zJhXUiILr
LKFPJSwefa95mlCg+fI8I7MpEAVF0WZFl1WApBuZmcdW0tfaYRPs6LTNeBH2xxco8laN1jlj+2Tj
rbZkfZq4i8tSnSo3JsSYBsw8tOVVOhREJti/SAFbv0jKq6P2ioa/0bvVuYNFuqRXYIUHcvZo3x8K
U5yfW9+n3bdbT0FjwXh1LpWxIn72FefGS45O72s4aeUsUy3ytFTKpDe0d5FUx4VF6NM8sYlZGu9U
fSykJwWTQXztdBp2LTItgiU++VYFFBNKXB0O+ECjo39I/9cGBU6X9Rkvyi86BhXHNyC1B5FcwJG0
QZAYpmNVKtW0SyH2+OaclQQ4tpyW1RC5ELIsq8ZhXV8m42G8h722Z67Yr5hPU8U9GW8F0Uva7CuO
3ZyV+ou9KIorXjR+OQWM1ouVfjhjqGLSPRE2ZH1er7z+rIdvLvGFYbftUX8iNgaDMLnkVtHORUFG
q8Wk8A3a6sG2Zo4glQLljnBHslL4+tyfvU1I+w6bKmb0MXRQwUq/WxN1HTxr6+EvbXB6O1gZ/Rpr
fS4jUia/ibcYxR0pcJ4SpucAhPkMkyZW2yJ+uiapw/PjwAELgyAsMslZtk9vpFWj2bB4XHUOHGQT
wwOd2udSAcVKRzLIe+yb6fDsCEdWNbyijssLPUcejrtfnWm6OXEkAsS0Y6XDYafOylYe7RDVYtOi
+RIoRrJeKJPQNPiJEvEsWJH+dY0hZhfGMbiHDWwaxHYdmtRODCozDByq1kUNTVy2NpR2rSPBGsdX
XmEFP6a/b9bahBYBp3vtOk4sEEb03VLoB6TXjLSLEl9URsOgUwIx9XWnaAMyTteFrRHZxp3QRkbd
BypTu/CCnrgGuEDlozCRHADxR5Bbt763K7odStN9wVQLYIO1acPNOiR4WFvASchqqYksZW9ju9/H
BZxJQoFnPtES8cOxtCclfLYJxCmR99dTxtvcuRKl9Q45rXIlKawopbhUtzJWMNlx0oPE9/hOPp7/
6/srHOOent4+Pb483cX1efLtEX//+vX7N4X1+w98uH4jPvk/+rrPxcaf94zrV6Iqxplbcpi+P8Na
R0ZZVxPimd3UAqiT7EBDKeTuKhhIQIcsv1m2FCu3yIUPdViDsyPyN7AhC7CS4vRiFxnJ+OiId+N7
aBLnErjus+b+WlXjAqAloGJweClYwoLtqk9obcW5gu4tWOAYQhj6R+g/5emFvP/Tme/TtNgzYq1A
xzT7Nr7wSRGIYQMNRw3RROzry/c/nz/d/Xh5fIffX9/0QSk0RXuWnfXEB3J3FM8ITqxJksYFttUS
mBT43lMIr/RLTNgAzUHzGGQxZaXZcxpcnd0b+swoz1kxa0gPXTorTiFI1Z2r4MhI57EaX50UVL3k
hn7MzymdxbH72eIePZ9BTzBCkNcYUHxqO2KACaZ2N4ZPGdWMbo8yLauO0xusAI5tHq4094vzzk7M
SvwO71oWZo2iOeNAhh3BSnjCoWd+IgPXajrhBYMdd6UHpLCY5Ia7lN194EfRoM4hhGkyvfsg2O36
Y3OWo2NxFeKs4GfdYZexBard2zx9e3p7fEP0zd7U+GkNiz+5daA/rRvruDMfotBZQwWpm+DqMK2p
dp8gCoc0GtADqqpIdaDqhcigDtZU+3ThWmBihkJV9RC7ydAZtvldeQrdGGLboJnF5vETuwx6jyJq
jz6lijhpCajNJpmpLZ4/vX5/enn69P76/RvedAmbqzvcwR/VHiYGjjDOklIHCZEC4/AVzrymIxtK
MCQHnhT02Pv5Iss99eXlP8/fvj292qNWc2JYjh6hxGrrau9zGWXawdio4bkMVxYDkYlbppFZsEQc
ntAsqRhcu4yr90J9rHNKemyY3QeC7K/ECcmNJoxcZEfYqIGTT3T1wvAVfAEU5nQ2z4EKSo4lmYW3
+C3CsPIS29cEu9P2og0eia3bET1zOEberqHcJ1aOjPCJYRsGC6gRRcrEd/Tzmc7WNlnB8yy2BJOZ
heVxSFsw6nzK1uis7dY1uFSpQc5Ray+xvQbSu1eb9anQ/qcO8OidcAk8z6DD9WECJzqlWMSZMGGX
rIwzjDNj5zGCRbwIX2JKDKlg4o9D1+otARbxnlMKxAaTlFMdDf3P74+vn9/u/vP8/sXd6HT2bJ+O
XmluFUJ/1RmhP7a+l/bpEH1uXN9+diyYqZ3LrD5l5oFEReCkVC2geeJ5C3DdcX8Bhl2aTVfuVoPJ
UN5Ly/7MJPR4XQcshc8hvnbtoT4yU0b+2NkrsQq6lnOA2kVpGo1IWDne2g2DBXdQO5rXeFOV57Kh
yP2F8h9nJjC5GzKAa9HDTkCs5gCwhJqCbB9Jb13WCWu6QnRhiRcFG5K+C4jDmKQbYXF0TA//oGAR
sc5iTLSAGrAsYef+3GY50Q6IecGW3EoEtl2R3rU1ls6RqbfdLCCu2g2oo10QjZypRoupRkup7qjd
aUSWv3PnuV2tiCVCIJ4XuRFpquoCXdldohU5zhCgmwwAQsaAmeF5W1IYZ/drjwxwqTIY4fVmZB1S
alcKQxiEjk9D52PIwLDxqJoAfU1VHelUzwB9S/KHga5ZryDhcq1QgPKpsknJygb2iT9o2Fm57due
x5Qyx8gQ674gJ/KH1WoXXMidKG4q3ovnsoVjDvLxIMyp8kqAqKEE1i4gdAHEIhrztZ9TPSaAkOiy
AaAniwSdyZE9LaCtI5SBwkPHoVAYtsTiLeiOWmwXKrF1LGmIdR2xwgyAM8XAC8jrLYTWjngXKgsZ
72Jm2OYe2e2jcz8KoAcKAJELoI4hEvDpuoVBTsfZGTk6f7Ve0x9jBB7f/fwh5NqP6+16Zc8wktEP
9z/JuSWSNNhyYlqKx0OykwVCRn5RGYhRJd8jSXrgE3uSFXhypJMHc2mx5pKkU771ggXtEsni3xi8
KY8Cj7LHUhl8ouqSTs+nASPerxE9tsVmUbo6JSx2nJQGiBB5MzENqXVa2HeieSa1wGYcTm95ntpI
Xqx365DcjvIqPpXsyNBR1EI9pMNxO2V5ZxARjeq+TRgQYuwIJAi3rowCan0VSLhaU7UT2IYMxKly
7HxXYXY+0dADQgibQymJGTsipj2KhfOEcn+iszlbNXQBGwrgRbTzNv0VlYCpi0+DJ8mOWcsszT9k
q+PC20RLEwE5thGxvgwAPfsEuCNWnwFY/Mo1aRGONm4H+yYf7fNV4QpWK2ICCIBq9wFwjYQRvp0t
NDkxU0bE2TYSJWUOQNEZL51q6Pl/OwFnbgJ09AQ+kPlLkneTgxRNzHmgB2tqmWhaf0sIIUCOiIkM
5B3Rc03rrahTuKATKwXQg5WLTh6kJHJjrjdtGHrksoY3sQ4laJWFjqqlMFB31/Ltk6ZTQrqgE/Ma
6dToF3RigRR0R74bspPCDSWGu26pJZ0e9ohFxHYr6a6JOqBGJxJs29XqZ7g876e4whvDhn6+F4hw
qk/RjwV9lTYi85uVxYAWQD2Dfw1vTjNHcxiuPx23bo47T84Ln5xWCISUCIvAhrqtGQC680eQXMAA
XMO4obqftyy4cWhAFqc+9MAQ+sTkAXq8227IQyzHJxDSK//I0TLuh9TRWAAbB7DdkgcKgBze+lWO
rUeMKwH4rlQ3a3/pPqiFg8fa25EfH9gu2i4dU9v8EvgrlsXUrY0C0p2uMpBDZmYge2iCA4+0V7b5
LAV4C75RUsGyXFbqAluCcBCh7n6GL5O488hHTh4w39/SD49cXlIsVR5ZQnJ7G6ImLH0sn6jsQp0T
5gXUfZUA1kQTCCAiBykIvbsgcER5VHnWSxWVoRzsjK/FSouXMdM9P1z16YXYbK+FT67sQPdpemhY
w2rI0puwGXlhpuuOWRX62pVVFDo180cGaqIKOtGXSKeeT/DBnZLbkO6Ta7hAlgRQZKAEUEF3Jrle
EryEWoCj9PQZHZEt7VVAY1lapJGBEnGAHtFnZ4k4rIINJnLlERoOdEV31JuFoNPdvaPmOtKpGyik
U5KnoNN9uaM2RaRTFw6C7moyI+g4wRA5qk5dhQo6IekIT8eOKu4cRd458t05mpy6oBF04iBlh2TR
kOUm2a2o10Ck01XcbSmpUOrLOOj0tOIsirylpftjjoHriUJ8FC/6u03tEznmxToKHZdDW+qoJADq
jCOubqjDzBxjwARyf+P59F0YOvZfvkGVvv9vsWxIb/ojQ8nOUUhNVwQiakcRgE/ezEtoSUyUHOST
Y1uzDRyzmRFtYdBJ0RUatGTlmQZVuck39xmeAcUwSRoaZomtZXlSHUnBj34vlEEehO/m8tieNLRh
ygPyWX471RG/HkyebI3hH0+fnh9fRBkshQ38kK3bNNYzgwo0544g9YeDQa1r9YpZkM5oEWYWb5/m
96TGPYLxKW2aBz2Z+JTF0huzlk5cnY+MMjVCsGAxy3Prm7qpkuw+faBOSSJNYcNn5fQgbMMc30CH
HKuykVGXB/pMk+2kJZcWHKiO1NI8jdUwroL2EYps93Kxz0ijAoEeGiORY141WaWayCEVEm6rs9np
9w9GT15ZrkUuQtolS6+8KnWdNZHTQ2N5AtYYspgltHcQgTp8uyP2B9uT4U0Ra69ZedLdjskaljyD
SUR6JkaGPBZmlXrlNO8QklBWl8pMHL0+4pxxjsJjFhfQ6Kn5YQEN2jiLVLCHQ8640SvC0ftRdagr
eDN85a8OrUGu0B7HHjbFOW8z0eWOvMs2M7+pmjal3JKLGcVKjGYMg0tbhxSye6zXacvyh7KzZinM
d/Qx4RoFdc7QGQwMPdecrJsM9ki9RTjLDONnSbXMK1S0TtNED1kvyG3KCouU5mjurjsoE9C5rPMz
rXIn+pU0iBYzqUnTknF9RZqIRsPqeRasaf+oHsyM1fmS2eMZJjmHGjuTbU8wlWjfTBJuzryV/g0c
uZ5x/+pr3XOXWGKyzAzroKBdVhaV3uIf06bC6qkJjbSlpvn4kMAO5px7GPS7anpNy1yhS+9Uwy9j
u8trLVw4td9OPsB1QWAqIGpYIkRJJuZnSnj7jJ+cKQrbEmBwp0snMZmVq1mOYgff99UpznSfjYpY
gvHITaeXSIS9rdDd2SEVVltUWKdmIcLnvM50626ZVFmawWq5cGMIVWW8P8WJkY8jeWlrpBUoTkpO
KUsgVrTnQM8SKf2RJce0JQDp31qn4z+npIkJ8pSO6MR6MNO7O7789XSXP/736XWW2aZvMLrGRrs0
mqAzRqgl6ELQkeuhjK6O7ZMU7O7r989PSjh10UBZ1VelLk0hPbnGtM7UANLhzET7nrI6S1LaWwIy
ZLz2tvp5QhQTSymUxWcBdqLXX/779vwJJpxoJlvEFVU5abVAURAkg3TEiC4vq1qgXZxmWuCFIQ4v
fLUwtkTYjos1drF6gaq4KXpR2EvIEhqj36YI8WuYX1ORBs0hoyLTTF5oJK3M4wjUekRSnZ5tTBZ0
NqtvhTYHtTMpXNhsvTju+AQK/dagY8byXMDacDigqxtfyW30PQO/eaU7o5tHzNPr848vT6/QHPH3
b++v319ezPmV13iH3pkVOVTtEQ2CzqS3SVHMBkG945qIbTahfiEi6HBi47Bkwd+uVQfNbLedMZEv
dhZICxJjJS5rK6KV4MXCUHe9CO6TeEhdX4i4eXodmTWTTbESF0kYBpuz7lgQkTJtfZ8MgDmhkbFo
Hav7s5lMevRXlHmmMkqk+YTRRKwL1v7KbjsmxL3+Ivd+fdqQI0UbKNleeE3hmer9TIwVODEXJonz
Pt8b03oYsiY1RUna+p5gPfTVPu1MWmpnnqZ2ec57bm5fB2gqKOcw00zswC1uzcGYpBn3E8PGDX8S
QTawoY+Pn/98er/78fr06fvXH9/fnj7ffVLjThjrOQp8ZvouH/piyIjLFH0Utae+AfnFtRohLhtM
X8r6kozdPg8+q4HOZYzn4oO1LM4I5ubcFBW2pQIrbJYnITn+tU6lFuiWNfA/V+3IwYed79o6pJc0
8kwgpS3pgGecO2Y7V/cZdeiXKMytvrA3GnnQdX6lXblJUrJXIz7NNMLFmwI642uJdR2OOkqTKOvJ
7WE+59Y+1KQisMgBtraeX7M21sZ1UdAqbEVa8DYjY4yV6XX0aTZQ8Jf0FETR+vGGYkpcwUTjwyG+
or21Cs59g74mS3Q/eLpiZKvyqJ88xZoArIokp6fA4LRNG9dLmAebdUiNHAEL/6IrqwKCTEuuM06L
vSO+WS9/D6I6rR8iGJyxeAWKkXPDwLeKPdAtj6A6l8NfqCxYHezWa7s9gEyGXJ6zDTu6OCAdLxcH
uTakH1cBS1+sqPTSns0xaD43C+IUt9wkqkovAzH2/DVfqY9rAiBj2cvxmoBQ4mwIyzus7EvzPUZQ
25hhAFeTmsfhzuvM4ivRtg2yHuZ6Gpzh31bRq9YnXU7LlNLy4Hv7YhL15iknrYZfnr/9+xfvV7Fu
YYSgXE7Tv75hnDDikuPul/mq6FfFVbJoRLxMK4xS10W0CiOr1EXeQW+4Rw/G9XJVqs2gLc7zdYOG
WVF5BZkfi0AqtEyt0L4+//mndoaUCcDKddQ82apk2zmphsJpk58q2tGRxggbPLVOazxFmzgKcUpZ
0+5T1joLQvrWp1ljMhiTxsJA5LhkahgADR7uaRw1lb4Me/1OTvTC84/3x3++PL3dvcuumAde+fT+
r+eXdwxQJzbOu1+wx94fX2Ff/dXaKqa+aVjJMYbMrfrErNAMGzSwZqUqVGkYnF4037jGh/iwZw3I
sQ31oE4YcoDzbA9HGNGu4yPe47//+oGVfvv+8nT39uPp6dMXNfCVg2NMNYN/y2zPVGfEM01MKrTq
cIOyWAsf67KyAouYEwX+VbNjVtJTW+FnSTL0GNFbCl/RnmJGFkgg5g2cgsPAm+mw3qzJ5gEg1AGy
dnGD92d2SZHcN50eUBppPCMj2s5JZnWV7R3ZCayP6cv4/8falTU3jiPpv+Lop5mI7W3ex8M8UCAl
sU1KNEGp5HpReGy1S9G2VWurYrvm1y8ukkgwIbkj9slWfomDOBNAHhM+27VN2xHolJMTDJmPk5ak
W9N7nNj7cP/l/fzo/KJ9I2Oh/H5tiQujHJ/UC6CrLRtMkzWBITfHPpqZtjbzFExSn/NC4RlrQLhP
Z0srCBzMXJ2635TFXvm31qvfbvcqpupws8+rh0isPXs2m4VfC4pLkCNTsf6aXmHZJY4lBrximbWE
ifu4E8SeJ6eu72CGUDqDbjqh0aPYM1uZI0w0iVJU3tA4ktSJLYlNxSALT3yNh4lNCW4M0TO1NCQ+
eg/Vc5S0cj1oqwEhDxf1DSZMA69n2TGGECugIXOu/3ghqeBwdKsJgPiRb803uppvgiauA7dLLvXt
7M73bpFZwoSuMIl2WJ4MSxwHtUoZeoqEnaVGlJ3HUgddeBXHvDZNn4ds2RxycQ1KjSVMcPUoPRcP
VwfuWYrad7zLI7bdMpbLA7/dJolzqeNoWE+bnuZshieDANGU15Yo3sfppWIEA74m+A66JgjkchNx
luDysihYri1WunIgWJLcCB0CqeEHBeneIERtGEeGCKhEg+UlSCzVwRuKTT3P9S43Q02aOMVcEYgd
a+qjh3f5AxMOP7E75dT3UJdgsH4x8rF8+KYE/SiJ7ZdfakTEH14WYNWmPeslaAcyJHQv9yBnCS8N
aL6ZJeF+ntUlfOaEDNcKiZLLezZjib3E1nM9R5Cg2wGHkut1iINL3ZdTL4Bq3QMirkku5y5M+6+y
RJdHbzHHrmWHxaq7deMuwyZNkHS6saZO1/1I6HRdq3ag0zryAnSczu4C44pnOpSbkKCW/T0DH+rI
WjDEFZrkKG+yLhZKiRejRjMDQ8OO+6gU0IcVElPt9PYrP8pfnGgZrVMvQr5AebBDgHIh73qnEPc0
Pu/qfVZlLbIzCafFFvJ+y34im5mPEKVj+Sl92wbuDm10REd2wrPtEiNS27RjNqvIElN75Nhd5uh2
QepfXjdqPP7K0GXS43lyaYTMO/af46JSEFkvU8f1LwpgtKsbbIBlDZYjv/c0YnJOeNTL+qW9pk52
WLcark6HQtc7EBxnoHcesAAY6ZGfIjtZ3cWRh/Dv+KBBJVDhk/bStwrfTZckiC53XeHPYNASp4e3
D+5oGd+vc+54g5+6p6+oDJpt5n20A80l3/2KCK2M8cvoF0HVXr1k4pEgf7Om3RaTqMgKo0U152dg
OkGWRdZYqOJioADOII16D7dgmx0SfnyZB0GMnkPKmqWhpCxhlNEma0XUp0ZFjx/IPGagAv/lGOR2
LdorhGT5VMVXKQqexSUqoj732C/adQhL1vKYeLOKh9tCaq4zABU5DRCPbkha47NUCq1jgZoct7ku
gV46JzVqYSzbO+y1kXHkdVErDphbBv33cBItWrLGleh4WTzi5ORxmgGrottNKtZuUO17jtXzCJq1
bOeWFyceM7MPioVkxmF4Ry0p/H1kg2eYN9ipc7tc025frjtdv0MSWxlGesxBUM0CpD4ed3z9cfrj
fLP8+f3w/uv25vnH4eMMNDzVxLnGOpa3aIv7GaoQTDtxI6uNoDXXEDR/m1epA1Ve4IvloPxa7G9n
//KcILnAxo5AOqdjsNYlJVoEMwjO1vrtrCKqa7hx0kiymtrYdJMMlDIJZtUgSUuaYeNlUgIbyp9g
S7ww3FNswCiGW/nXuI2loac7kVmTjoduFipBq1FNtGRj/uP88Hx8ezY1I7PHx8PL4f30ejgDeS9j
q6obedDVtCKaoap7d70wK5n928PL6fnmfLp5Oj4fzw8v/N2BlW8WFieuJruz356yre7zvpSPXlIP
//v469Px/fDIdwtLmV3sw0IFwXQ605Mnbn9gza6VK3fnh+8Pj4zt7fFgbRKt4NhFvUAwIA4ivXWu
5yu3flEx9kfC9Ofb+dvh42iUmiYWaUVAeHBMa84i69Xh/L+n9z9FU/38z+H9v27K1++HJ1FdgnZN
mKrQrir/T+agRvSZjXCW8vD+/PNGDEY+7kuiF1DECXQioEgWu+Ue7cfGMOJtRcmXiMPH6YW/k3+i
rz3qeuZVoyrlWjaDoj4yy8ciZGRly0lSre/7SYw6NbWe3k/HJ31T6Ul9A/VR2Sa6X/MvXXfPl/N9
t+6ySoRupFr0txEXhpMS9jVN3T7otVVvb0H33Ms1F6w0WWFVMhGSNvqxl8fq1u2g5O99tqhdLwpu
mfA0wWZ5xD1GgZGiIB7POHBmuBmbzhNjRngaQ+jnk3JlsOQpnUd1dvULfY0Ooj0DeohUXyDmQo6x
YKc+jSFIzDDmI4I9ayiGhuRsPgWTCrdZksThhEyj3PEyF6O7bN5M6UXDdkbsu+nSdZ0LFaM0d70k
xVIyxLikxhgiW1L0/KwzhMh3dHHshy2WJUOSdGvPsitX90DG7+kVTTwHG9Eb4kbuhUoyPJ4ErRdA
k7OUMeodWrF8EZoN606bfjUXbodIktQE5FvrUJQgrgpcG0WA9lhJAsYX9qYMxvuvxcPHn4ezil39
oS93BjKuekWVCzME/WH4tiHQ3YoiTJTsezrusq9HDTdiPRlXJrir9CNnv3bq6Yf1tCkb3JK2nue9
a2hcYl22TBQd4sPjYm1dVFW2Wu/QMPID17pqyH63dmNsWi15IFNSaa+F7Ad/bK/W69uNbm6sGHmI
Ubbiaw0gFbxUJrrIrajq3nWy45GX0+OfupZbxj6gPfxxeD9wkeOJyTbP+uVJSWgHqsn6NHGBBPvJ
LPU8ljS31fvi+zXkYwsx1roa07KMQl3fTYMoqUtLFShBh63OUYa+7oPdgEIrpG8MGjKr3UQ3/NAg
kpMidiIco3L2mYe4Hr8Ur1NjWxR1ubrKJY1ErnFRr24outZydHRThZawK/nfRYGLHpyloq7jJRmb
e1VuCSStZSguLq8xrXerzHqAHUZb3XhWOU3UXVgeAOUbkfkX1gO2y/SBIUaVRgYYOA0SwyUrb5nE
2blmcbPO3ROy4c1jLbHnyUv8cl3wkNrj7hfzLXZ523MkMLKBIu95VFx7KgHvFxk0eOjB2/UKt43s
GWQs3ossyxY/5fX4iuKhxUf8cnqKKd9ysGVTZMbdeDQlOl2XJVsZIrL1HdsMEByYHz/IA/yIGlBs
heI0IVvgFQ2ulB54vitowaT10gia2G1mGrvlxDXw+LhnHH3hW3Mz1OE25+358HZ8FKGPpg917BhX
rEqyJ4upfrOOSc/0erVN1Asxs1WTS29JE0ss2M51HGvROzdBnfj1PB2blf2GPpioIy3Sp+N+L+8p
GcQAfIOvD0/Hh+7wJ89jbEx9bRstotGlr/NsiiIGFxqdDfBEcRRai+GgXGPp/fUFWbKTrP4884IU
FPWAM2Wta6D0OWUo68UVjq0M/3RPL39wPV98ulJlUzrZ9Rw52+zzzcL53ezvVMKdfaoS3t/K1Jtd
atA4vVBenMoOu14W47zSc5yjKa5wyGF3uUZb2fufqtO2WF0ZKfwT5wsyvyrzKGY2jz45Aiz6pICL
vwtf+xDGk1rajEP86t7eqoJjWc7tHInr25eOxI2xBzeDR7dHmkDDynOhEMb12QVHMMuh9pmKsTG3
Eadom2RgsKECNsqd5dVnslxhbmGmzHIMXmrGSyunYNheWRUlk5wQn2jn0PT7bjuVgn3Qcv5YTGV8
IP4pfwVXDofSs5L+gcXufrXmdpt1FGisSD49J5u+VJ7x4JM49YkXuI4lE4PN+xRb4F+ukjy6zsvt
RGKX1P18EwbOvmkJGp+Bx2gGtxU6QAkPxWFeY4yQn1nrLipgVTISCD/nXBtCHY9DbDsvLb/QplxV
a9RwuM7KarbWbhd46OsaUMYo65I8ZNwQ9DGm6goedxbkwSPJ77OGUDZTwX0ZP4s0ORHsWPU6Nnjq
/M7ITmhu7Wu6gFQRSduopCi5xKtashZki4t+0pGk0fuRvHnkT0hMgBXgTfPwfBB2bVNvGjI1V3pY
dNlMV9YxkX3VZNfgQTnnAh+bjduYXmXQsxqvTa98FsxTKA9Ay5wekIoBTUZpt2zXmwXuBEH5shKF
obeNPP7sBDYHoWAAI4HH8TaoagG6QB10IcbqNZy8rdFXftaKewoy6ync0lM09OyeNwD70zcIXPFS
tkCQL9bvEwzZ5PP4+DdIckArmnrIfD2dD9/fT4+ocnjBPbOZtlPa8+Ukscz0++vHM5pfw+adrMWC
2wNzAq4+JxilHg5eNChCayz+VMCfKycXv5R9xD/oz4/z4fVm/XZDvh2//5ObSD4e/2DjODcP2/zi
qan3ORtZ5Yrul0XV6L5YINy3Zvb6cnqWp1Xs86V6K8lWW8uFm2IQZ9KMblrMKZ7kWey4R9tyNQeK
SxKrBwxXa0AqKWvPDUafjMoP7UrUBag2jKXXHH7RT7q2QgG6WuvuQxXSeFmfZKzWtHTtFb1LXVEH
05OdidN5O+n52fvp4enx9Gr/MmUvp1cHTSR1HnbNb/P3w+Hj8YEteHen9/Ju0uG9csMVVmnp/N/1
zjZixCfXu6RGe3KSUl4i7Zrgr79sOXJ0t9vf1QvsFk+hq6YAlzDTHKWqmiZRThu233+NFWk1bzMp
Qo/DltGbuiT7Ly2qLMtxShpDaObUyal31I3D6iZqfffj4YV1rGU4SGljzVbjO13vWa5Zxarc695+
JZXOSoNUVYQYJLaiLfU2RWuhj0klamvb1T0l3JFYHIOYqSPVR6nQE/ZIj1Gf3SOuv8lr5BlOJo6l
mMLiYHzgwMO2DHBqyTi9li/q30yDA+w7gIv7kQo8vmtk11I3PFzsiMd4fglOTi1k3fSF65gSXSVG
MkqSUcV6PSsrbGsZBKVFC3SEB/q442Hfx5df+9GP4q8tCpZ+Ie3nQbDXQmhw3MIdgzcV9MAh3L5z
qwHP2W/XVccdByo2yycIbn/CrbUsZ9LdnXFHm2pz6gWB3fHl+GauwYpfeqbbb8lGXw+QFPArvpre
sXuvD5+Sa/rCeTsW23lb3PVVVT9vFifG+HbSa6qg/WK97Z3cr1fSkcP4+ToTE5G4QkC2IoWFgTvc
ptnWAnM3ErTJrKmZkCxP4aDmE9mNy9dqcCgVDvXBGs7PqlZQOuQcoVHO6EE2nPriEdWToZH3xbZY
ddOvEeS+jqs1aa6wNE0NnCBCpmF+5qiFXbHryPjGVPx1fjy93eRC4WXadpJ5n7Fz9e8ZuYUzWUJt
+dX2SqlY5jRLA9RIQzFA772KqA55q84P0ggpmLtv9ENsaR0Z4jjSw5roQBKgAHSmpOhNtwpd3fWS
ooutnDJZReipT+C2S9LYz5C60zoMUR9SCu9dxmrCEjt76QER+LN15TGxWRO0hWAEQglzg6T9vCbe
vpjBl0u5Mu9r9DJDL5j9UH5VMdqezFAy9+S2XtFNbSa7nZdzwQXJyvUNOwxgZcl/dT+KWpoJqyiV
8tVnYPF0Fvql91Sin9kloBLgjaLVsp/IuGr9uEAo5XpcOulRTOTJ8l3l63E2FcHUEuvJuGqZQGPP
yCU2Ih32RBBCblZnri6BsN/gRZz9DpzJ70kegVR702mETSXhPajCqWYeGgJyyjMPxmXLM99iAJ7X
WZuj2qAS0V5qBEG34tecvstK6Gq8Yth0PZDtSmrBuDn+JZx9mYnf7mgOnvkEwexpA7UFLb7dkd9v
XcfFbbJr4ns+rr9Q1xk7NYTWjHscH4AcBeoZjJAEuhs+RkjD0J3oTCo6nidDgL1KvSNsoGF7AUMi
D0QBI0ycA2HHutvEd2F4IUaaZaYK/f+D9YsMmMqWHyZMwlkcO6nb4jb13D7EC6wQerLhhjUwPCin
pFhzCgAsETGIesx+BzG02Ymcye99OWeCGjezyqpKn9kAnpjcsA0am5UCSPYuyCaGs51TbB8U67s+
NzpKYvA79QxzJ3YAxFdhdrDaQdY0iPAnYracC529LMdnirrtssL80ipD/YjL+6yszsLc4yza6kj4
k0TLr+Oge21CuOqNLUNhhwxzyrOUr7OLBlDrHd1XLRf/AHlZMvFJm1TLHQis2GvwgDRMxI5zs5rK
+NvaKFVHvCDGelkg0EOGIKXYeJKINgaYpOc6nkFwXX1dkBTg8omTPNRQgiOGmyWukRtZ9qOaNL5n
8drFsQDVL+BIqrdzr6rEFRfCOOY20qDJV9mGTRqwtK0aNmLwQSGk2W0mnTADdTKBSCv8/W5tdCG/
VeCxntaWbKXTCjgWhJ8KgyRk1XxO87rfCxAEJtmsgnIYsUOFxBMmcRIXH1I9jLq36cGAOrq1iSS7
nusn05JcJ6F4rNQ+WUKB51lFjlwaeZFBpjCEvKTFqX74YLSuIkEYgPsmdY+wm8ykv2tYOX8/vZ1v
ircnXdeQiSptwbbOCtwET1Ood4/vL8c/jsbel/iR9rHLmgTKbmd4iBhSSRH62+FVRKiQHhD0vLoq
Y/L9chJ9RwLF1/UEmdVFBKVZ/tuUNAUNyJiE0MQF7Vxmd3x44teNJPel9QcO8xBkbcnPf4vGIm7R
hlqQ7dck3aFdO2kp6Tzi+NQ7j+AGg+T0+np6g4H+lFgrz01wyhvweNYa4wGh+esjpqYqC6oaWr68
0aZPZ9ZJSMS0GVLJSpki88BgxGeYZmxI2rAyOAZ638DUsqRMbOUkYvPpQc4CXOILnUi7Wma//ciQ
YkIfvRphQOABASgMgsj4nYLfYepxd776k4SiGgTfIDiGhWwYeUFrPVKGUQLrwX5PJbswShFb6hGO
LR6kBIQFhOUAvGIXFMwWjQOxAz8yTqE06TtAREwSPQxPToMAupNgEoSLq29z2SLy9RNN5Pngd7YL
XV3UIA3XuYaEFESKlTteNt0eM2JsjmwzYEQn8ZQPc31vYkAYosKTBGPfdc2cWBN7+qS6OM4HnwNP
P15ff6qbavC8yCeQvCrON3WNhyOaZCBymL8f/ufH4e3x52Bk/h/uUzzP6W9NVfVeDaRam1A/eTif
3n/Ljx/n9+O/f3CrfMPaPTS96QHNOEsW0jPdt4ePw68VYzs83VSn0/ebf7Aq/PPmj6GKH1oVYbHz
wObUS2Cxi9bp75bYp7vSaGDlev75fvp4PH0/sKLNDVZcTDn6hilJ0n2mQTKOmeJOC50pWb5raRCC
bXjhRpPf5rYsaGBhnu8y6jFpXecbaTC9Rgd5aDuckF71a5262fiOXlFFQLcOmRq92xGQ/epHwMjN
T9ktfM9xsHk47TW52R8eXs7fNFGpp76fb9qH8+GmPr0dzydjdM6LIHDwGyGJYYsrv3d3XGjWoWh4
JGW0FhqoV1xW+8fr8el4/okMzNrzdfE4X3b6ErbkwrhjxvvsAznyyDS6Y/plRz19h5W/YRcrmrG7
LbuNhy2rtIwdEHuc/fZAN04+TRn6sAWVR094PTx8/Hg/vB6YPP2DNdVkTgaOM51tQWRbYQSK2twq
DMrEpTEZy3EyjmqWkooLB/PdmiaxforuKeacVFQwI2/rXQRuEbb7ktQBW0wcnGpMRx0xeoxjbA5H
ag5btApHHvzz1LStaB3ldDeZzoqOLhI9ZjgWudDzega8t6B/dp06vpnIiBXH529nZO4QttBkFYXj
53c2QWy35lm+4bck6FJe+SDOJPvNVizNGV/W5DT19Y4TFKA7MVu6cWj8hnd8hAk9LupzlyMw/A2j
+BaHuQyKIvQuedF4WeM4muwlKexbHAdoPZR37LTu8gbEJn5/sqCVlzrw0ghiHibaCsiFbiz0Zwe0
TI2haaGm8u80cz3U/KxtWifUF72+djKc0UivujbUJeJqy/o7ILr3hmzHdgjjxoxTtEPJap1xVxoj
Yd10bFBo+Taspp6jaGObla7rYyYsHDB0mLpb33dR7aVuv9mWVJe0BxKcoyMZrEcdoX7ggmOAIMW4
QWzflB3rzdDi/FZgiR2LUS/0DAlCH4QJDd3E0wSWLVlVsDMkBRoJbYu6ihzU6FJCuibStorAA+BX
1nesq1x9+YJLjdQCfHh+O5zl6wiyCN0maQzqlN06aYpayKuXvzpbaPcSGnG6M42Q5TUqW/iu5W2P
Jyu6dV10RStlQe0pivih4QwNru6iTFzG62t6CUZEwH4wLWsSSlWFyThTkMXhickFRnYPtrUP7rwh
3ZgkEDM2MrTb5YD48XI+fn85/AWtl/n90GYHstAZlVz0+HJ8s40l/YpqRapypXfelEe++e/bdZdx
3wRwF0bKETXoIz/d/Mo9br09sRPw2wF+hYho2G6aDldIkAf3qhHRoMA92oQJsPxfZU+y3Eiu432+
wlGnmYjq9yx5KfvQByqTkljOzWSmLfuS4XapqxRdXsLLvNfv6wcgk5lcQLnmUi4BSO4EARAAU4sN
3zShzHF0SweB4BFEcJ36/e7x+/tP+P/z0+tOZ66LRlWfc8d9Uyt/o39chKddPj+9gSizI9INnsz9
50JyNaMfM0C7yXFoSDFpqDxAYFoxx68DmLmcEwEnIWDmyTJtU6AuQ2lfQa/IHsPou3J7UTbnYxR8
ojjzibE1vGxfURAkWOeiOTw9LFc+y2vmpPUwL9bAzl2/vAbEPJrzNdJ7x2nduJYxkTWzQ/9erClm
rg5mfvu8YoAFQjhAgf3SZr9SnSQvywB1RF+5DkxU94A+U09SCu66mR+eUozztmEgWToWzgHg99AC
AzYYTd8kkT9iur54VtXR+dHJ7+GZ6hEPC+Pp37sHVB1xE37bvZoskPH+RVnyxBenCpEzCf+2vL8i
LxYXs7m70RovBaxcYh5K/xpRySVpHFCb8yM/uThAUglfsBBKHEbR5cgqzqM0cnJUHG6S2Tk/GJ5f
S9M48qi5OvcMXZi00d/CH5RlDo/twzMaFf3t7GsUhwzODV5ScQ5oWD4/C++URdlj0teyNp7I+xUD
LNnZlcXm/PDUF2gNjL4LLUEzcu8n8bfDbFs4i1xRXv92hVK0Cs3OTrwMptSYjNpC6z1yBj9h79PO
TogTOZ0kDnHmKdw2kdgMKXCNN3VFPYaG6LauHScW/QGXSx+in6QbojunhVryfpFIydNcx6+YYZbt
+x+7Zyejs112Rb8U/lX78D48iBxZDx9CHygdz1LJS/JrectmGklqGsdnKPhJz8/ZzcgSZAWPSl+f
mfbR/FpeYsbOZi3wAUGRJ9L8oTc2kKqW03IQoqvWiI8DzEZkQgVZXS5E5cphRQ0TjbFwTYbp8HwP
FBcXLTcrIIaTNDalYdkFzrd3KteY4bRtMjFPcT6dPBXf5Mta8tVok28IfrSyLoIgBoNj7fpL4rUI
g9+o2SH5qoJGL7gEiTkulngrjsIP3gDOIWESJJlEdh4M/X5CWMGqVlzGtRdNNjuj34LQ+PChkAlo
MhX0TC5CNHq8hLBGqJZla9fP2SDGeK+4bcYJJuGnZEgwiV6y7eYeLC5Xy/5lMzshH7QyJHWGmW/D
xuqg/rjAMQ9Ssrzbm8oJcRii/22KKzKdlkUOWbGMRLK+OVDvf7zqYJOJbQ3p/HtAOxLF+mZw1+mU
x+QHBMbgC9CCcyw0bvZAdW4/d8CLrNQp1ACxdswEQ/I0BM/jplRqjvnauQ813YurMGNCwXEnILsx
FXidwlxhwKWqWjeBPg6ArNmwfn5WlbB1BJm31KXBksJ6EIkvMtOflmVzFDfcuP9FYL3CMfRgrcJa
HJSgd0BApRv8MSH5ngNSSKYjwqM2Gm8zXuleHQW4MTAtmtrheNBr7ArOnTpag0NARDhZLklr/NZA
nzzEkuI5nyiOB4pkUWJ9fPgl7p4xBAAYfmQ+Sgcazc5BNZ93PiZnZ2YDBODybHZKwFl5ihnOucy5
o/bpnAnDgeNvGOAnmEI2GOwWysVM5uEYmLAdXpKRJUgwOKohDyobT3fy+Mn4CcaIBc8LlVniMVMy
Fw009NjyLDfDuRWzqlzWYSB5mP18slYw6nTSD9Q6wiH+jJ+fNWAtvQh6b0wUIN63lFJgKIZzsueY
jaGM67D4fWWga6+uxRHY24ueL7sopvlyOVRjx9lutIB4hHulmuqQIwfVDcOklzxmGvY6MoqJuo5k
L66Wp7AbbcHTCrGpD/Z/raorBYO1avwoUeOxmvpUJ4exPTcX1tcHby9391pnD6V46J5jQ21LvKxp
a3TTEhmFwIeU/YQfgIqcZxycqjuZcR34VBe+26zFuY/AjyI9btN2HUOQexJQvD70dYIBsWqph4hG
tCLrAGZL1dzSVRCvQ9v79HjkbamDxDSWhr/7ciWtNEVdXwckPfPvOHU6okaC3B6Fq4yfWiqVDNQJ
STMyq+xIhYyy98W/ETfw0sDONqJLkHE39Tx1WY9kCynyldeToVVLyfktH/DE10PVDRrWo6BoXbTk
K+Fn69LgfEknl/I6XDZ9OEeTTY+TiVC6ohXQis10Ee5cKBD5KDr0SV99OZ+7T78boJodu4/tIDSI
xgRIWQ7PRMXXF1EGhwZ4X+NwPiW8bFPwS0cfD5VMW78QZcqWoK8d4P8Vz2glGiYFSaihqv3sTUHw
r3G/2/3cHpij2DNaXTE0Jra8XyoM9lFkBUudGok5Heabdt77p+EA6jesbalCAH8Uf3KkK66VgInK
KM3Z0iieddLz9wHMce8GkQ6AqbgYlSgleP7q6yKf+79CCiiqXGSwHd3TkgsYPsC4bRqBQJpdEHAd
7DNk+okLMqNJo4huuui4q19t2ybHgtTgexS2JGJ2EB0OHn6Bd3IgFLv+BZtgZPD3ZVe3zAe5vRpb
gQjysS9E1BVwLg6nvOwWflkDBh8XENJHBY1GEFMwdm2/ZC3zKl8tFS5scnjgXImQA2rRymi8LeyD
QR/J9KLRrGEVTkBMLLsK1J4K6PSjaXSDDTVxAHt4MxR7OgVjuuyvuPQejqxEYUbDOyPm+gP6iFAJ
+Tu1idE46+94A+kXmMQQeLKDwyceewQHj/NhfgvMJ3LjUaTax6tM3jR4wUw3E8fA3WMjiOAYA2LR
CTjaKowdrVjbSVdrW6roNc4QIAxAZ9NwPmQj3dT8AaZDkpWOoC+FUpjIn+yu3o1pDL7iopV4fVRh
/CcxJJrSZDGYJJCurZfqmN4mBulxBhTFPUDmaSXD+40uQQ1DW7CbBAwWay4knKt9LjzFgCJhxTUD
kX1ZF0V9TbTX+UZUOd8kytvANOm+7S+i5DBadXNjRZzs7v7H1jugl0ofM6S0PFAb8vw30Ln+mV/l
+qyfjnq7bFR9jlYvd4i+1oXgnnJyC2TkNHX50m5sWzldoblDr9U/gY/+k2/w36qlmwS4gFmUCr6k
18nVSO18bRNMYi7yBh9mPT76QuFFjS+nKujrp93r09nZyflvs0/uRplIu3Z5Ru4B3ZcUJ6tagstZ
cWzfYBjL6+v2/dvTwZ/UIGn5wB8lDboIw9JcJNqL/T2owThEIC3CEVFTEpqmAX2/yCV3rPIXXFbu
wEd2kHW3As6wIKfN/IkOQr4UV0ymRowYj1HWxQdEkXGbh4a9QmuJD/hGE2EZTR61YgD1ktrobBm3
Wp8FqTWwTh90gGqKLtGwBQ/4nwYEx8cioAm/+bocj94AMpR0GMGv4TTio6uxI/FZPL7nas74hGiI
hKorSyZp2XAoyMqwcRUfyZ4DGSWABlT4Hhl6jWA0Zq3Pa2qoDe2t53ltYBKdtSZgtxDBAFsILJor
zICVmyoJguLWU/pGOFZLcdYRr9o8LI5hs5ykw3GpkboVk8AxtOYVSOMsIcdkkpX+SjcQI1blPPGS
jqEpWyqxm7rsmFr7hVqYEbyiY42kMqeyw3wsFq0UZQNCVLXyb+FCCm1IoG9tKUqUkrKGzkM8fpDS
cUeCYYnFXxa3dOYPh4ASGaaab4mx8FfOCD6+QCfJhc5kfssJAl4ueJ5z6tulZKsSs4/paTIFHI1n
cajL4QNbG1/6KgOSdRMALqvNccRhAXiaYuByKnO6IdCwBcsuMNXUjVmw9F1CQEkv26i82jV3Gixw
GF0NAS/deWhU64V2mt8oaBRocLEcKyKAFbAPebwXuc7S6LPjeRqJayiNdRCTSEH3x0pSlIARd5BK
iU10lSqUoHd6/ytfuAPyK/TeGH3cz6iPn37+5+lTRGTt/GFtmCR7X2uA/e5DL1KPItyoq5Sc0qX2
Hpd1tPcsLLYmhASBEWuEUzq+xTnmq7jGW0Heg/H2upYXKfGwSnUOEHlAmPdXtJupwVGukiupEyaB
vFQ7TEAfoI6JZKmi1Ayqq6T/9IGBJMc14806mIsB9IFAZans2PYFW3DK6JqJoHgxGPVSb8dpWQU1
ZlCKdemwHfmKZbTIpsm7JmNFqvJwyWhYlJh/gu5plsbjjVsDmkzqzRVN+GGjpPdUNSidzDvRWHDC
MarNI7CHUVI1LbqdN4mVWjjFw4+JszhqrYO2enEPerH/4Yj5ksa47zl7mDM3yi/A+NmJfBwVuBqQ
pBpz5qfZCHC0o3lARPmBBCRHydqP99ROe8AHRFQaq4DkPFnH+RH9YKxPdEJFDgTlpKeHzpjmN/HL
sT9AQtW46vqzxLjN5smVAqiZj2IqE4Iufxa22iLofe9SUJEoLj6aWItIz6qlSE2pxX+hOxNN89jL
j9o6SzZ2ltpaF7U466XfEA3rwqJKlqEgy+jXaS1FxkFHolyBJoKq5Z2sqeIzWYMKyigVdCS5kaIo
XFcKi1kxXviuviNGck69YGTxAhptklpHn4qqEwmvc3dI9re57eSFeazbQaAd0bHiF6X3IzTvdJXA
nREB+goTbhfiVqvu5LM//fWla5b1LnpNgqbt/fsLRlI8PWN8l2NbxPPQHRX83Ut+2XHVJvVzkHCU
AOEKdEOgl6B/O2dSKztA5bZkK7eZS5QJ7tbY5+u+hkJZymgzSit5yZV2eW2l8GwC0U2nhXhmS1vM
ICYSGAE/K7HwEqCHn/WbpSwJdMNcTVG/bL5mMucV9BqvatDKr0WkDC+fXMqAyLOsRiUsoQhUT4lx
iomR0aqG+S+s4dVspmlKWGDm5Zt9o67KIFG4j0GPkmrV0W8OB6SsaXiVm4uvgpbExi/auqxv6Kfq
Rhooj0Ev9ja/qFne+J7xIQ7W57KWWSrJ20B8w0rKx2jqIluiU7XIE1WBHlBfV5g4IuFetQrVnRE4
XRVSn5bODTr8sI8L9U0me5Fvfp8dOkUCHoOIUGOny+qr1UjhNQZQSqw++tpeo4xFfNo93P32+P2T
X5IlWzO17tWa0QIcRTk/oUUhivaEzJkQUV43J36+4LiskjqaQ7LfP/3rGUr65OK1kR3UMji6bsIq
JGf5gEqUDgtcMuFefrrQfgH6CGboLekFwNRNWXJklgE/RiJg8h3vOZPFjS4nYs38ilqotr9p9hBR
5IySF2Af/P7p593jN0zX9Rn/+fb0r8fPf9893MGvu2/Pu8fPr3d/buGT3bfPu8e37Xc8xD6/PtwB
/ev25+7x/d+f354env5++nz3/Hz38vD08vmP5z8/mVPvYvvyuP158OPu5dtWR19Op9/wuhHQ/32w
e9xhvpbdf+6GFGPj3hMYyoFcq6orfycgCiNUkJmP3a1puckSo/tdknZ81IhskkWnezRmTAxPetub
TS2NzdLVTtVNFWafM7CSl1lzE0I3XmZODWouQwisy/wUFnZWXzmKMh7+KBCai+qXv5/fng7un162
B08vBz+2P591kjmPuF8K15djALJi5T3J6IHnMRz2FwmMSdVFJpq161ARIOJP9I6ngDGpdMNvJxhJ
6BhEg4YnW8JSjb9ompj6wnVctCWgqTImBcmXrYhyB7ifrsegusCDMMQPn45vI0aeSjQ537SSGeKo
NavlbH5WdkWEqLqCBsY9bfTfCKz/EGtIX6iNGVCb9z9+7u5/+2v798G9XtzfX+6ef/wdrWmpWFRU
Hq8h7r4uNsJIQpkrRkwCMN4rPj85mXkavQmYeH/7gTkK7u/ett8O+KNuMGZ9+Nfu7ccBe319ut9p
VH73dhf1IHND7+zwE7BsDcoDmx/C4XbjJwwad+FKKJi2eL/xSxGxDujpmgEnvbIjvtA5Hh+evm1f
4zYu4uHLlosY1sYLOyOWF8/ibwt5HcFqoo6GasymVcScwfGbeB/PLtx1ejRzUFDbLp4HvBAfB219
9/ojNWYli9u5NsCwoRvoU7qVV+Yjm0lj+/oWVyazozkxRwiOB2tD8tlFwS74PB5wA48nEQpvZ4e5
WMbLlyw/OdRlfkzATohxKgUsWl7g330MUZb5jEwi5uB92+eESMnCE8URme3N7rW1+wrgBJyfnFJg
IyRH4KMYWBKwFgSgRb0iOtKuJP3oxYC34rmRHnbPPzy//5GhUJsKoH3i8t9SVN1C7DmAmMyOiYJB
mLpeCkVFytgVx0peFIJkz0y1tHXRIdg7sznf0+QlfZZdrNkty4nmKNDF2b51Yrk5wax5fDiCANB4
r6KNq4IayJZTSrVFXtdLQezOAT7dpJml8fTwjOlaPDl+HLDloNAGjPy2jmBnx/E6L27jba/vmyPo
4IthEpSAevP0cFC9P/yxfbEpiYNMxuM6VKLPGkkmsLCdkAuMhKu6qFKNSfBrg2OKfnrbJcpInxaH
Iqr3q2hbLjkGmboKgyML9pTAbhFWhqaESI230ne6WSOprCjeMqJR7E+XopX8IQjDVVJ+7v54uQOV
7OXp/W33SBycmK2T8fi80XDDOmLEcEjZyPp9NCTO7Me9nxsSGjUKh/tLGMlIdJ7otD04QdhFl6HZ
PpJ91ScP4Kl3e8RLJBoPsnBNrElvT89W0rc3ja8WW2TTLYqBRnWLgWy63J0I26Z0qYgqNyeH533G
ZSuW6JrHh/grt7zmIlNnfSPFFeKxuGSMFpJ+wThZhbdrY1EeFvUnLGWCo2ERX+zmxttOe3sOfoLj
VsCMtn9qheH14E/Q2F933x9Nwp/7H9v7v3aP353oWO124V4DSC/3VIxXv39ybIMD3qh7ztjQhte6
ypm8+bA22EvZRSFU+wsUmhPg/0yzrK/7L4zBkBksxTCMZaTxk6QMsH4B2iSwb0mZ9TGEicle+za7
jlnMRrYMgIUAEQsm0LUW2twdFUfHduF6D2S1zN29B4us5KAdlwsoYgKbaxk3M8yYDyQTYVSgRQVg
1ZbN9ESj3SoyWyN7Bt2j2WRr4ykjuSegZ6BwwgnjgWanPkUs1kP9bdf7X/maBfwkrtIGOGxvvrg5
8xmHg6H9NwcSJq9Z+JKvR7EQlMMY4E69syIUOjMqmQxwuViXyhydOlSeYA3ldUl2nvYNRKhxjvXh
6N6K56UvU92agyGA0u6MCKVKpv0bU46NSE22j3Zm1GCKfnOL4PB3vznzzo8BqjNYNLRSN5AIRr5j
MmCZe4E4wdo1bD6iPgXMnNK4B/Qi+xqV5s+t3ZbE7aPEF+xUXdSln4dpgmJ5ZwkUcC13O4afubhF
5mXzWWu/x1a/L1i6NxMYWnbFih7VRfcAVnUmgBVdcRgpydys/0wHJ7vpOgwIPeZ7jw8hPHdvy+CH
HzNY6R4YRMGrlXulq3GIwMQqeIsaMjPEsTyXfdufHsM+D9BYu7aRI90S3zNvOr8pGNjmt0ddi7ot
Fj5ZVVdZvdZiN76d6eXJ0G3AvEsJ10G1KswycFhG0/XSG6f80mX3Rb3wfxHcoyoCd73itm+Zm95e
XqJI5z5u3AgvDCMXpfe7FrnOOKBa95nkLsOQkzY4xDGHR+EOuMI8M27CP32Tk/PG9d9TMEdev/Ey
mTnboF58ZStPqzA1jwNA3uJEIoB/HWUFJg19ftk9vv1lUlw+bF/dS6pJBoQq2wudTJgS+wwWvRY9
Q73xKoZDdVWAUFCMtwpfkhSXHcYCHo/zM0iSUQkjhb41HOrPecG8+838pmKlIHxYaYo9j6zdlAu8
Iu25lPABHQiZHMfRMLD7uf3tbfcwyGuvmvTewF9ixxhe6cuJskM/GD9wfwkMi/fXTFa/zw+Pz/7L
WRkN8ClME+S7HeMtry6NKdpfew0E+MC1AIZIO5+aIQKBVzsBlUKVrHX5aYjRzcPod39KdCna06Ff
dpX5hBUCU53P6QRM7ifXnF3oR7ij6BgrJP/qMOtJ0daQ3b3dGPn2j/fv3/FWUzy+vr2848MZ3jYo
2UrowEY/X6XfUId1WsjglsyKghgLpe+hNEGJ6TX2DYItCa+Daef5hQqd54aR+aW++g3HoEtONBnj
H6NLneHieCzXiR7FLQzaFL5U6OduMcUhXp8HFGvBb+trL/OmhjW1UHUVhNX7GBilIRcBHaLgE99y
SQU9mSYCF+aZf2XiIRLcmCTFW/hfINOJ22n/JJ8QHcJ+gUxmnd7lH/VxiD2zqV7CxWypBu5kGfJo
Y1FFtzBe+g5rAPaVD44M6HtluVnQ0oSvh15xvMRkCejI4JzeBqjzC+ikXlLqtP1fTbBeuMoM10DJ
ibRbZ1o4wsE0S0evHHHLtThlo458J4lprYeVqXWQ0tbcRSH9Qf30/Pr5AN9he382zGl99/jdjbZm
mBcXY0g9OcwDY86czjFtGSSumbprf3ecrVS9bFGr7VD7bWFkEt7+BtmvMV9hyxRlBLi+BJ4OnD0f
blDGTD/7emW8P4ETf3tH9uuyh6mNen0kxUWN9bPTaJhdZZPrCVFNODM4RBecN0G6DWM4wQvdiTH+
9+vz7hEveaFjD+9v239v4T/bt/t//OMf/+M23xSMgn7X8g3ft2cV1BtGB/oL3RQR7jp5rXgZQUGN
QuFFFdCfEDekFDEW7IE5uUorpiqBtYD+fIGmdn1tWuGK2JNg+f8YIk/ubTEyyakEhQNg+n1X4QUO
TLCxC4TduDD8xtoBzVr7yxxh3+7e7g7w7LpHI9hrPCVoQtszGc0HeEWtRoOyPMdPrIPsEZRO1jIU
JfH5DpHwstrbD7+qTMLwVK0wr2yZK52so87ZYDon4Q84PyYa78MDysHTSwExmGRHP9JM4JCfanlx
5DzzmVfqMOleU/glmfvH5sD3+uYPBTAgIwbKUHHVaJN/BwQNtPN5I4DGoCq7aWvKtUG7SY+yqG6y
5xqNWA3tS30mas8y6dw5GmTmh+MqhpmZ/dBzDbJLmlY0tFc5th8Ot4g/7e5Oj6mJR0sPhv5VHRQ/
Oy1dnRdRWj/q8epV5r4MMzhAXa2bRNJ0/HxYh8ZESjmJTkQ2x/swmUGDXSW03b6+IQfBkyJ7+t/t
y933rbuDL7qKtFKSp71wDUdN+bFIUPEWxpimIwdiSOFia0sLECA2ZPXVsCYax8QhYemgdRt3ETJm
/w61uMhbL1WpvibRtwGqlnSbNEkpKhTrqIWt8crkbLAsynJizdzDHb1Ag1cIdO1pQdiHaycLcOZo
Oj0m7DSuk6aP0Q1e8w3GSUZjMZg9TKwAJcFZKpX58QvmwgkQbU2l+dJovUOWQUtG04xfFIBhzRSU
IK3xXSfyoKSNtRf6JWEOpmWQ4cmnkGg7b3GPpmrzjesaJHIWVWXMSvTSFiCSQ6f2XgDpQpZClnBw
86C+ONGPGQdtj0mVhf69DNoVlBWbu4Zp1TdNJEewxQ3KwaSs8zJpH9vLhCJfZ3u3ZkvWwovOYoau
snXWYZIKb0n+H954d7rEYwIA
--===============6709296926563618774==--

