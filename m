Content-Type: multipart/mixed; boundary="===============7974827224520635471=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2884/3724] drivers/infiniband/hw/mlx4/qp.c:3795 _mlx4_ib_post_send() error: uninitialized symbol 'lso_hdr_sz'.
Date: Thu, 25 Jun 2020 01:18:45 +0800
Message-ID: <202006250138.9vmmGFvp%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7974827224520635471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Kees Cook <keescook@chromium.org>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   cfafde3c949cae39483639c03c5da5fd91bb234e
commit: 21ee4d6893374384a10012dfcaac3ae73d20b370 [2884/3724] treewide: Remo=
ve uninitialized_var() usage
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001-20200624 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/infiniband/hw/mlx4/qp.c:3795 _mlx4_ib_post_send() error: uninitiali=
zed symbol 'lso_hdr_sz'.
drivers/infiniband/core/uverbs_cmd.c:3512 __uverbs_create_xsrq() error: uni=
nitialized symbol 'xrcd_uobj'.

Old smatch warnings:
drivers/infiniband/hw/mlx4/qp.c:2464 __mlx4_ib_modify_qp() warn: Function t=
oo hairy.  No more merges.
drivers/infiniband/hw/mlx4/qp.c:4301 mlx4_ib_modify_wq() warn: unsigned 'cu=
r_state' is never less than zero.

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D21ee4d6893374384a10012dfcaac3ae73d20b370
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout 21ee4d6893374384a10012dfcaac3ae73d20b370
vim +/lso_hdr_sz +3795 drivers/infiniband/hw/mlx4/qp.c

1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3532  =

d34ac5cd3a73aa Bart Van Assche     2018-07-18  3533  static int _mlx4_ib_po=
st_send(struct ib_qp *ibqp, const struct ib_send_wr *wr,
d34ac5cd3a73aa Bart Van Assche     2018-07-18  3534  			      const struct =
ib_send_wr **bad_wr, bool drain)
225c7b1feef1b4 Roland Dreier       2007-05-08  3535  {
225c7b1feef1b4 Roland Dreier       2007-05-08  3536  	struct mlx4_ib_qp *qp=
 =3D to_mqp(ibqp);
225c7b1feef1b4 Roland Dreier       2007-05-08  3537  	void *wqe;
225c7b1feef1b4 Roland Dreier       2007-05-08  3538  	struct mlx4_wqe_ctrl_=
seg *ctrl;
6e694ea33e7a7f Jack Morgenstein    2007-09-19  3539  	struct mlx4_wqe_data_=
seg *dseg;
225c7b1feef1b4 Roland Dreier       2007-05-08  3540  	unsigned long flags;
225c7b1feef1b4 Roland Dreier       2007-05-08  3541  	int nreq;
225c7b1feef1b4 Roland Dreier       2007-05-08  3542  	int err =3D 0;
ea54b10c777300 Jack Morgenstein    2008-01-28  3543  	unsigned ind;
21ee4d68933743 Kees Cook           2020-06-03  3544  	int size;
21ee4d68933743 Kees Cook           2020-06-03  3545  	unsigned seglen;
0fd7e1d8559f45 Roland Dreier       2009-01-16  3546  	__be32 dummy;
0fd7e1d8559f45 Roland Dreier       2009-01-16  3547  	__be32 *lso_wqe;
21ee4d68933743 Kees Cook           2020-06-03  3548  	__be32 lso_hdr_sz;
417608c20a4c83 Eli Cohen           2009-11-12  3549  	__be32 blh;
225c7b1feef1b4 Roland Dreier       2007-05-08  3550  	int i;
35f05dabf95ac3 Yishai Hadas        2015-02-08  3551  	struct mlx4_ib_dev *m=
dev =3D to_mdev(ibqp->device);
225c7b1feef1b4 Roland Dreier       2007-05-08  3552  =

e1b866c677d693 Moni Shoua          2016-01-14  3553  	if (qp->mlx4_ib_qp_ty=
pe =3D=3D MLX4_IB_QPT_GSI) {
e1b866c677d693 Moni Shoua          2016-01-14  3554  		struct mlx4_ib_sqp *=
sqp =3D to_msqp(qp);
e1b866c677d693 Moni Shoua          2016-01-14  3555  =

e1b866c677d693 Moni Shoua          2016-01-14  3556  		if (sqp->roce_v2_gsi=
) {
e1b866c677d693 Moni Shoua          2016-01-14  3557  			struct mlx4_ib_ah *=
ah =3D to_mah(ud_wr(wr)->ah);
a748d60df32ec5 Talat Batheesh      2017-02-14  3558  			enum ib_gid_type gi=
d_type;
e1b866c677d693 Moni Shoua          2016-01-14  3559  			union ib_gid gid;
e1b866c677d693 Moni Shoua          2016-01-14  3560  =

a748d60df32ec5 Talat Batheesh      2017-02-14  3561  			if (!fill_gid_by_hw=
_index(mdev, sqp->qp.port,
a748d60df32ec5 Talat Batheesh      2017-02-14  3562  					   ah->av.ib.gid_=
index,
a748d60df32ec5 Talat Batheesh      2017-02-14  3563  					   &gid, &gid_typ=
e))
a748d60df32ec5 Talat Batheesh      2017-02-14  3564  				qp =3D (gid_type =
=3D=3D IB_GID_TYPE_ROCE_UDP_ENCAP) ?
e1b866c677d693 Moni Shoua          2016-01-14  3565  						to_mqp(sqp->roce=
_v2_gsi) : qp;
a748d60df32ec5 Talat Batheesh      2017-02-14  3566  			else
e1b866c677d693 Moni Shoua          2016-01-14  3567  				pr_err("Failed to =
get gid at index %d. RoCEv2 will not work properly\n",
e1b866c677d693 Moni Shoua          2016-01-14  3568  				       ah->av.ib.g=
id_index);
e1b866c677d693 Moni Shoua          2016-01-14  3569  		}
e1b866c677d693 Moni Shoua          2016-01-14  3570  	}
e1b866c677d693 Moni Shoua          2016-01-14  3571  =

96db0e0335c798 Roland Dreier       2007-10-30  3572  	spin_lock_irqsave(&qp=
->sq.lock, flags);
1975acd9f3fdc0 Yishai Hadas        2018-06-19  3573  	if (mdev->dev->persis=
t->state & MLX4_DEVICE_STATE_INTERNAL_ERROR &&
1975acd9f3fdc0 Yishai Hadas        2018-06-19  3574  	    !drain) {
35f05dabf95ac3 Yishai Hadas        2015-02-08  3575  		err =3D -EIO;
35f05dabf95ac3 Yishai Hadas        2015-02-08  3576  		*bad_wr =3D wr;
35f05dabf95ac3 Yishai Hadas        2015-02-08  3577  		nreq =3D 0;
35f05dabf95ac3 Yishai Hadas        2015-02-08  3578  		goto out;
35f05dabf95ac3 Yishai Hadas        2015-02-08  3579  	}
225c7b1feef1b4 Roland Dreier       2007-05-08  3580  =

ea54b10c777300 Jack Morgenstein    2008-01-28  3581  	ind =3D qp->sq_next_w=
qe;
225c7b1feef1b4 Roland Dreier       2007-05-08  3582  =

225c7b1feef1b4 Roland Dreier       2007-05-08  3583  	for (nreq =3D 0; wr; =
++nreq, wr =3D wr->next) {
0fd7e1d8559f45 Roland Dreier       2009-01-16  3584  		lso_wqe =3D &dummy;
417608c20a4c83 Eli Cohen           2009-11-12  3585  		blh =3D 0;
0fd7e1d8559f45 Roland Dreier       2009-01-16  3586  =

225c7b1feef1b4 Roland Dreier       2007-05-08  3587  		if (mlx4_wq_overflow=
(&qp->sq, nreq, qp->ibqp.send_cq)) {
225c7b1feef1b4 Roland Dreier       2007-05-08  3588  			err =3D -ENOMEM;
225c7b1feef1b4 Roland Dreier       2007-05-08  3589  			*bad_wr =3D wr;
225c7b1feef1b4 Roland Dreier       2007-05-08  3590  			goto out;
225c7b1feef1b4 Roland Dreier       2007-05-08  3591  		}
225c7b1feef1b4 Roland Dreier       2007-05-08  3592  =

225c7b1feef1b4 Roland Dreier       2007-05-08  3593  		if (unlikely(wr->num=
_sge > qp->sq.max_gs)) {
225c7b1feef1b4 Roland Dreier       2007-05-08  3594  			err =3D -EINVAL;
225c7b1feef1b4 Roland Dreier       2007-05-08  3595  			*bad_wr =3D wr;
225c7b1feef1b4 Roland Dreier       2007-05-08  3596  			goto out;
225c7b1feef1b4 Roland Dreier       2007-05-08  3597  		}
225c7b1feef1b4 Roland Dreier       2007-05-08  3598  =

0e6e74162164d9 Roland Dreier       2007-06-18  3599  		ctrl =3D wqe =3D get=
_send_wqe(qp, ind & (qp->sq.wqe_cnt - 1));
ea54b10c777300 Jack Morgenstein    2008-01-28  3600  		qp->sq.wrid[(qp->sq.=
head + nreq) & (qp->sq.wqe_cnt - 1)] =3D wr->wr_id;
225c7b1feef1b4 Roland Dreier       2007-05-08  3601  =

225c7b1feef1b4 Roland Dreier       2007-05-08  3602  		ctrl->srcrb_flags =
=3D
225c7b1feef1b4 Roland Dreier       2007-05-08  3603  			(wr->send_flags & I=
B_SEND_SIGNALED ?
225c7b1feef1b4 Roland Dreier       2007-05-08  3604  			 cpu_to_be32(MLX4_W=
QE_CTRL_CQ_UPDATE) : 0) |
225c7b1feef1b4 Roland Dreier       2007-05-08  3605  			(wr->send_flags & I=
B_SEND_SOLICITED ?
225c7b1feef1b4 Roland Dreier       2007-05-08  3606  			 cpu_to_be32(MLX4_W=
QE_CTRL_SOLICITED) : 0) |
8ff095ec4bce7b Eli Cohen           2008-04-16  3607  			((wr->send_flags & =
IB_SEND_IP_CSUM) ?
8ff095ec4bce7b Eli Cohen           2008-04-16  3608  			 cpu_to_be32(MLX4_W=
QE_CTRL_IP_CSUM |
8ff095ec4bce7b Eli Cohen           2008-04-16  3609  				     MLX4_WQE_CTRL=
_TCP_UDP_CSUM) : 0) |
225c7b1feef1b4 Roland Dreier       2007-05-08  3610  			qp->sq_signal_bits;
225c7b1feef1b4 Roland Dreier       2007-05-08  3611  =

95d04f0735b4fc Roland Dreier       2008-07-23  3612  		ctrl->imm =3D send_i=
eth(wr);
225c7b1feef1b4 Roland Dreier       2007-05-08  3613  =

225c7b1feef1b4 Roland Dreier       2007-05-08  3614  		wqe +=3D sizeof *ctr=
l;
225c7b1feef1b4 Roland Dreier       2007-05-08  3615  		size =3D sizeof *ctr=
l / 16;
225c7b1feef1b4 Roland Dreier       2007-05-08  3616  =

1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3617  		switch (qp->mlx4_ib_=
qp_type) {
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3618  		case MLX4_IB_QPT_RC:
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3619  		case MLX4_IB_QPT_UC:
225c7b1feef1b4 Roland Dreier       2007-05-08  3620  			switch (wr->opcode)=
 {
225c7b1feef1b4 Roland Dreier       2007-05-08  3621  			case IB_WR_ATOMIC_C=
MP_AND_SWP:
225c7b1feef1b4 Roland Dreier       2007-05-08  3622  			case IB_WR_ATOMIC_F=
ETCH_AND_ADD:
6fa8f719844b84 Vladimir Sokolovsky 2010-04-14  3623  			case IB_WR_MASKED_A=
TOMIC_FETCH_AND_ADD:
e622f2f4ad2142 Christoph Hellwig   2015-10-08  3624  				set_raddr_seg(wqe,=
 atomic_wr(wr)->remote_addr,
e622f2f4ad2142 Christoph Hellwig   2015-10-08  3625  					      atomic_wr(w=
r)->rkey);
225c7b1feef1b4 Roland Dreier       2007-05-08  3626  				wqe  +=3D sizeof (=
struct mlx4_wqe_raddr_seg);
225c7b1feef1b4 Roland Dreier       2007-05-08  3627  =

e622f2f4ad2142 Christoph Hellwig   2015-10-08  3628  				set_atomic_seg(wqe=
, atomic_wr(wr));
225c7b1feef1b4 Roland Dreier       2007-05-08  3629  				wqe  +=3D sizeof (=
struct mlx4_wqe_atomic_seg);
0fbfa6a9062c71 Roland Dreier       2007-07-18  3630  =

225c7b1feef1b4 Roland Dreier       2007-05-08  3631  				size +=3D (sizeof =
(struct mlx4_wqe_raddr_seg) +
225c7b1feef1b4 Roland Dreier       2007-05-08  3632  					 sizeof (struct m=
lx4_wqe_atomic_seg)) / 16;
6fa8f719844b84 Vladimir Sokolovsky 2010-04-14  3633  =

6fa8f719844b84 Vladimir Sokolovsky 2010-04-14  3634  				break;
6fa8f719844b84 Vladimir Sokolovsky 2010-04-14  3635  =

6fa8f719844b84 Vladimir Sokolovsky 2010-04-14  3636  			case IB_WR_MASKED_A=
TOMIC_CMP_AND_SWP:
e622f2f4ad2142 Christoph Hellwig   2015-10-08  3637  				set_raddr_seg(wqe,=
 atomic_wr(wr)->remote_addr,
e622f2f4ad2142 Christoph Hellwig   2015-10-08  3638  					      atomic_wr(w=
r)->rkey);
6fa8f719844b84 Vladimir Sokolovsky 2010-04-14  3639  				wqe  +=3D sizeof (=
struct mlx4_wqe_raddr_seg);
6fa8f719844b84 Vladimir Sokolovsky 2010-04-14  3640  =

e622f2f4ad2142 Christoph Hellwig   2015-10-08  3641  				set_masked_atomic_=
seg(wqe, atomic_wr(wr));
6fa8f719844b84 Vladimir Sokolovsky 2010-04-14  3642  				wqe  +=3D sizeof (=
struct mlx4_wqe_masked_atomic_seg);
6fa8f719844b84 Vladimir Sokolovsky 2010-04-14  3643  =

6fa8f719844b84 Vladimir Sokolovsky 2010-04-14  3644  				size +=3D (sizeof =
(struct mlx4_wqe_raddr_seg) +
6fa8f719844b84 Vladimir Sokolovsky 2010-04-14  3645  					 sizeof (struct m=
lx4_wqe_masked_atomic_seg)) / 16;
225c7b1feef1b4 Roland Dreier       2007-05-08  3646  =

225c7b1feef1b4 Roland Dreier       2007-05-08  3647  				break;
225c7b1feef1b4 Roland Dreier       2007-05-08  3648  =

225c7b1feef1b4 Roland Dreier       2007-05-08  3649  			case IB_WR_RDMA_REA=
D:
225c7b1feef1b4 Roland Dreier       2007-05-08  3650  			case IB_WR_RDMA_WRI=
TE:
225c7b1feef1b4 Roland Dreier       2007-05-08  3651  			case IB_WR_RDMA_WRI=
TE_WITH_IMM:
e622f2f4ad2142 Christoph Hellwig   2015-10-08  3652  				set_raddr_seg(wqe,=
 rdma_wr(wr)->remote_addr,
e622f2f4ad2142 Christoph Hellwig   2015-10-08  3653  					      rdma_wr(wr)=
->rkey);
225c7b1feef1b4 Roland Dreier       2007-05-08  3654  				wqe  +=3D sizeof (=
struct mlx4_wqe_raddr_seg);
225c7b1feef1b4 Roland Dreier       2007-05-08  3655  				size +=3D sizeof (=
struct mlx4_wqe_raddr_seg) / 16;
225c7b1feef1b4 Roland Dreier       2007-05-08  3656  				break;
95d04f0735b4fc Roland Dreier       2008-07-23  3657  =

95d04f0735b4fc Roland Dreier       2008-07-23  3658  			case IB_WR_LOCAL_IN=
V:
2ac6bf4ddc87c3 Jack Morgenstein    2009-06-05  3659  				ctrl->srcrb_flags =
|=3D
2ac6bf4ddc87c3 Jack Morgenstein    2009-06-05  3660  					cpu_to_be32(MLX4_=
WQE_CTRL_STRONG_ORDER);
95d04f0735b4fc Roland Dreier       2008-07-23  3661  				set_local_inv_seg(=
wqe, wr->ex.invalidate_rkey);
95d04f0735b4fc Roland Dreier       2008-07-23  3662  				wqe  +=3D sizeof (=
struct mlx4_wqe_local_inval_seg);
95d04f0735b4fc Roland Dreier       2008-07-23  3663  				size +=3D sizeof (=
struct mlx4_wqe_local_inval_seg) / 16;
95d04f0735b4fc Roland Dreier       2008-07-23  3664  				break;
95d04f0735b4fc Roland Dreier       2008-07-23  3665  =

1b2cd0fc673c0b Sagi Grimberg       2015-10-13  3666  			case IB_WR_REG_MR:
1b2cd0fc673c0b Sagi Grimberg       2015-10-13  3667  				ctrl->srcrb_flags =
|=3D
1b2cd0fc673c0b Sagi Grimberg       2015-10-13  3668  					cpu_to_be32(MLX4_=
WQE_CTRL_STRONG_ORDER);
1b2cd0fc673c0b Sagi Grimberg       2015-10-13  3669  				set_reg_seg(wqe, r=
eg_wr(wr));
1b2cd0fc673c0b Sagi Grimberg       2015-10-13  3670  				wqe  +=3D sizeof(s=
truct mlx4_wqe_fmr_seg);
1b2cd0fc673c0b Sagi Grimberg       2015-10-13  3671  				size +=3D sizeof(s=
truct mlx4_wqe_fmr_seg) / 16;
1b2cd0fc673c0b Sagi Grimberg       2015-10-13  3672  				break;
1b2cd0fc673c0b Sagi Grimberg       2015-10-13  3673  =

225c7b1feef1b4 Roland Dreier       2007-05-08  3674  			default:
225c7b1feef1b4 Roland Dreier       2007-05-08  3675  				/* No extra segmen=
ts required for sends */
225c7b1feef1b4 Roland Dreier       2007-05-08  3676  				break;
225c7b1feef1b4 Roland Dreier       2007-05-08  3677  			}
225c7b1feef1b4 Roland Dreier       2007-05-08  3678  			break;
225c7b1feef1b4 Roland Dreier       2007-05-08  3679  =

1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3680  		case MLX4_IB_QPT_TUN=
_SMI_OWNER:
e622f2f4ad2142 Christoph Hellwig   2015-10-08  3681  			err =3D  build_srio=
v_qp0_header(to_msqp(qp), ud_wr(wr),
e622f2f4ad2142 Christoph Hellwig   2015-10-08  3682  					ctrl, &seglen);
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3683  			if (unlikely(err)) {
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3684  				*bad_wr =3D wr;
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3685  				goto out;
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3686  			}
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3687  			wqe  +=3D seglen;
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3688  			size +=3D seglen / =
16;
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3689  			break;
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3690  		case MLX4_IB_QPT_TUN=
_SMI:
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3691  		case MLX4_IB_QPT_TUN=
_GSI:
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3692  			/* this is a UD qp =
used in MAD responses to slaves. */
e622f2f4ad2142 Christoph Hellwig   2015-10-08  3693  			set_datagram_seg(wq=
e, ud_wr(wr));
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3694  			/* set the forced-l=
oopback bit in the data seg av */
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3695  			*(__be32 *) wqe |=
=3D cpu_to_be32(0x80000000);
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3696  			wqe  +=3D sizeof (s=
truct mlx4_wqe_datagram_seg);
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3697  			size +=3D sizeof (s=
truct mlx4_wqe_datagram_seg) / 16;
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3698  			break;
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3699  		case MLX4_IB_QPT_UD:
e622f2f4ad2142 Christoph Hellwig   2015-10-08  3700  			set_datagram_seg(wq=
e, ud_wr(wr));
225c7b1feef1b4 Roland Dreier       2007-05-08  3701  			wqe  +=3D sizeof (s=
truct mlx4_wqe_datagram_seg);
225c7b1feef1b4 Roland Dreier       2007-05-08  3702  			size +=3D sizeof (s=
truct mlx4_wqe_datagram_seg) / 16;
b832be1e4007f4 Eli Cohen           2008-04-16  3703  =

b832be1e4007f4 Eli Cohen           2008-04-16  3704  			if (wr->opcode =3D=
=3D IB_WR_LSO) {
e622f2f4ad2142 Christoph Hellwig   2015-10-08  3705  				err =3D build_lso_=
seg(wqe, ud_wr(wr), qp, &seglen,
e622f2f4ad2142 Christoph Hellwig   2015-10-08  3706  						&lso_hdr_sz, &bl=
h);
b832be1e4007f4 Eli Cohen           2008-04-16  3707  				if (unlikely(err))=
 {
b832be1e4007f4 Eli Cohen           2008-04-16  3708  					*bad_wr =3D wr;
b832be1e4007f4 Eli Cohen           2008-04-16  3709  					goto out;
b832be1e4007f4 Eli Cohen           2008-04-16  3710  				}
0fd7e1d8559f45 Roland Dreier       2009-01-16  3711  				lso_wqe =3D (__be3=
2 *) wqe;
b832be1e4007f4 Eli Cohen           2008-04-16  3712  				wqe  +=3D seglen;
b832be1e4007f4 Eli Cohen           2008-04-16  3713  				size +=3D seglen /=
 16;
b832be1e4007f4 Eli Cohen           2008-04-16  3714  			}
225c7b1feef1b4 Roland Dreier       2007-05-08  3715  			break;
225c7b1feef1b4 Roland Dreier       2007-05-08  3716  =

1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3717  		case MLX4_IB_QPT_PRO=
XY_SMI_OWNER:
e622f2f4ad2142 Christoph Hellwig   2015-10-08  3718  			err =3D build_sriov=
_qp0_header(to_msqp(qp), ud_wr(wr),
e622f2f4ad2142 Christoph Hellwig   2015-10-08  3719  					ctrl, &seglen);
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3720  			if (unlikely(err)) {
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3721  				*bad_wr =3D wr;
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3722  				goto out;
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3723  			}
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3724  			wqe  +=3D seglen;
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3725  			size +=3D seglen / =
16;
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3726  			/* to start tunnel =
header on a cache-line boundary */
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3727  			add_zero_len_inline=
(wqe);
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3728  			wqe +=3D 16;
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3729  			size++;
e622f2f4ad2142 Christoph Hellwig   2015-10-08  3730  			build_tunnel_header=
(ud_wr(wr), wqe, &seglen);
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3731  			wqe  +=3D seglen;
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3732  			size +=3D seglen / =
16;
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3733  			break;
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3734  		case MLX4_IB_QPT_PRO=
XY_SMI:
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3735  		case MLX4_IB_QPT_PRO=
XY_GSI:
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3736  			/* If we are tunnel=
ing special qps, this is a UD qp.
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3737  			 * In this case we =
first add a UD segment targeting
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3738  			 * the tunnel qp, a=
nd then add a header with address
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3739  			 * information */
e622f2f4ad2142 Christoph Hellwig   2015-10-08  3740  			set_tunnel_datagram=
_seg(to_mdev(ibqp->device), wqe,
e622f2f4ad2142 Christoph Hellwig   2015-10-08  3741  						ud_wr(wr),
97982f5a91e91d Jack Morgenstein    2014-05-29  3742  						qp->mlx4_ib_qp_t=
ype);
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3743  			wqe  +=3D sizeof (s=
truct mlx4_wqe_datagram_seg);
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3744  			size +=3D sizeof (s=
truct mlx4_wqe_datagram_seg) / 16;
e622f2f4ad2142 Christoph Hellwig   2015-10-08  3745  			build_tunnel_header=
(ud_wr(wr), wqe, &seglen);
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3746  			wqe  +=3D seglen;
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3747  			size +=3D seglen / =
16;
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3748  			break;
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3749  =

1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3750  		case MLX4_IB_QPT_SMI:
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3751  		case MLX4_IB_QPT_GSI:
e622f2f4ad2142 Christoph Hellwig   2015-10-08  3752  			err =3D build_mlx_h=
eader(to_msqp(qp), ud_wr(wr), ctrl,
e622f2f4ad2142 Christoph Hellwig   2015-10-08  3753  					&seglen);
f438000f7a31fa Roland Dreier       2008-04-16  3754  			if (unlikely(err)) {
225c7b1feef1b4 Roland Dreier       2007-05-08  3755  				*bad_wr =3D wr;
225c7b1feef1b4 Roland Dreier       2007-05-08  3756  				goto out;
225c7b1feef1b4 Roland Dreier       2007-05-08  3757  			}
f438000f7a31fa Roland Dreier       2008-04-16  3758  			wqe  +=3D seglen;
f438000f7a31fa Roland Dreier       2008-04-16  3759  			size +=3D seglen / =
16;
225c7b1feef1b4 Roland Dreier       2007-05-08  3760  			break;
225c7b1feef1b4 Roland Dreier       2007-05-08  3761  =

225c7b1feef1b4 Roland Dreier       2007-05-08  3762  		default:
225c7b1feef1b4 Roland Dreier       2007-05-08  3763  			break;
225c7b1feef1b4 Roland Dreier       2007-05-08  3764  		}
225c7b1feef1b4 Roland Dreier       2007-05-08  3765  =

6e694ea33e7a7f Jack Morgenstein    2007-09-19  3766  		/*
6e694ea33e7a7f Jack Morgenstein    2007-09-19  3767  		 * Write data segmen=
ts in reverse order, so as to
6e694ea33e7a7f Jack Morgenstein    2007-09-19  3768  		 * overwrite cacheli=
ne stamp last within each
6e694ea33e7a7f Jack Morgenstein    2007-09-19  3769  		 * cacheline.  This =
avoids issues with WQE
6e694ea33e7a7f Jack Morgenstein    2007-09-19  3770  		 * prefetching.
6e694ea33e7a7f Jack Morgenstein    2007-09-19  3771  		 */
225c7b1feef1b4 Roland Dreier       2007-05-08  3772  =

6e694ea33e7a7f Jack Morgenstein    2007-09-19  3773  		dseg =3D wqe;
6e694ea33e7a7f Jack Morgenstein    2007-09-19  3774  		dseg +=3D wr->num_sg=
e - 1;
6e694ea33e7a7f Jack Morgenstein    2007-09-19  3775  		size +=3D wr->num_sg=
e * (sizeof (struct mlx4_wqe_data_seg) / 16);
225c7b1feef1b4 Roland Dreier       2007-05-08  3776  =

225c7b1feef1b4 Roland Dreier       2007-05-08  3777  		/* Add one more inli=
ne data segment for ICRC for MLX sends */
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3778  		if (unlikely(qp->mlx=
4_ib_qp_type =3D=3D MLX4_IB_QPT_SMI ||
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3779  			     qp->mlx4_ib_qp=
_type =3D=3D MLX4_IB_QPT_GSI ||
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3780  			     qp->mlx4_ib_qp=
_type &
1ffeb2eb8be993 Jack Morgenstein    2012-08-03  3781  			     (MLX4_IB_QPT_P=
ROXY_SMI_OWNER | MLX4_IB_QPT_TUN_SMI_OWNER))) {
6e694ea33e7a7f Jack Morgenstein    2007-09-19  3782  			set_mlx_icrc_seg(ds=
eg + 1);
225c7b1feef1b4 Roland Dreier       2007-05-08  3783  			size +=3D sizeof (s=
truct mlx4_wqe_data_seg) / 16;
225c7b1feef1b4 Roland Dreier       2007-05-08  3784  		}
225c7b1feef1b4 Roland Dreier       2007-05-08  3785  =

6e694ea33e7a7f Jack Morgenstein    2007-09-19  3786  		for (i =3D wr->num_s=
ge - 1; i >=3D 0; --i, --dseg)
6e694ea33e7a7f Jack Morgenstein    2007-09-19  3787  			set_data_seg(dseg, =
wr->sg_list + i);
6e694ea33e7a7f Jack Morgenstein    2007-09-19  3788  =

0fd7e1d8559f45 Roland Dreier       2009-01-16  3789  		/*
0fd7e1d8559f45 Roland Dreier       2009-01-16  3790  		 * Possibly overwrit=
e stamping in cacheline with LSO
0fd7e1d8559f45 Roland Dreier       2009-01-16  3791  		 * segment only afte=
r making sure all data segments
0fd7e1d8559f45 Roland Dreier       2009-01-16  3792  		 * are written.
0fd7e1d8559f45 Roland Dreier       2009-01-16  3793  		 */
0fd7e1d8559f45 Roland Dreier       2009-01-16  3794  		wmb();
0fd7e1d8559f45 Roland Dreier       2009-01-16 @3795  		*lso_wqe =3D lso_hdr=
_sz;
0fd7e1d8559f45 Roland Dreier       2009-01-16  3796  =

224e92e02a769b Brenden Blanco      2016-07-19  3797  		ctrl->qpn_vlan.fence=
_size =3D (wr->send_flags & IB_SEND_FENCE ?
225c7b1feef1b4 Roland Dreier       2007-05-08  3798  					     MLX4_WQE_CTR=
L_FENCE : 0) | size;
225c7b1feef1b4 Roland Dreier       2007-05-08  3799  =

225c7b1feef1b4 Roland Dreier       2007-05-08  3800  		/*
225c7b1feef1b4 Roland Dreier       2007-05-08  3801  		 * Make sure descrip=
tor is fully written before
225c7b1feef1b4 Roland Dreier       2007-05-08  3802  		 * setting ownership=
 bit (because HW can start
225c7b1feef1b4 Roland Dreier       2007-05-08  3803  		 * executing as soon=
 as we do).
225c7b1feef1b4 Roland Dreier       2007-05-08  3804  		 */
225c7b1feef1b4 Roland Dreier       2007-05-08  3805  		wmb();
225c7b1feef1b4 Roland Dreier       2007-05-08  3806  =

59b0ed121297b5 Roland Dreier       2007-05-19  3807  		if (wr->opcode < 0 |=
| wr->opcode >=3D ARRAY_SIZE(mlx4_ib_opcode)) {
4ba6b8eaa9d67d Eli Cohen           2012-02-09  3808  			*bad_wr =3D wr;
225c7b1feef1b4 Roland Dreier       2007-05-08  3809  			err =3D -EINVAL;
225c7b1feef1b4 Roland Dreier       2007-05-08  3810  			goto out;
225c7b1feef1b4 Roland Dreier       2007-05-08  3811  		}
225c7b1feef1b4 Roland Dreier       2007-05-08  3812  =

225c7b1feef1b4 Roland Dreier       2007-05-08  3813  		ctrl->owner_opcode =
=3D mlx4_ib_opcode[wr->opcode] |
417608c20a4c83 Eli Cohen           2009-11-12  3814  			(ind & qp->sq.wqe_c=
nt ? cpu_to_be32(1 << 31) : 0) | blh;
0e6e74162164d9 Roland Dreier       2007-06-18  3815  =

0e6e74162164d9 Roland Dreier       2007-06-18  3816  		/*
0e6e74162164d9 Roland Dreier       2007-06-18  3817  		 * We can improve la=
tency by not stamping the last
0e6e74162164d9 Roland Dreier       2007-06-18  3818  		 * send queue WQE un=
til after ringing the doorbell, so
0e6e74162164d9 Roland Dreier       2007-06-18  3819  		 * only stamp here i=
f there are still more WQEs to post.
0e6e74162164d9 Roland Dreier       2007-06-18  3820  		 */
f95ccffc715bf0 Jack Morgenstein    2018-07-26  3821  		if (wr->next)
f95ccffc715bf0 Jack Morgenstein    2018-07-26  3822  			stamp_send_wqe(qp, =
ind + qp->sq_spare_wqes);
f95ccffc715bf0 Jack Morgenstein    2018-07-26  3823  		ind++;
225c7b1feef1b4 Roland Dreier       2007-05-08  3824  	}
225c7b1feef1b4 Roland Dreier       2007-05-08  3825  =

225c7b1feef1b4 Roland Dreier       2007-05-08  3826  out:
225c7b1feef1b4 Roland Dreier       2007-05-08  3827  	if (likely(nreq)) {
225c7b1feef1b4 Roland Dreier       2007-05-08  3828  		qp->sq.head +=3D nre=
q;
225c7b1feef1b4 Roland Dreier       2007-05-08  3829  =

225c7b1feef1b4 Roland Dreier       2007-05-08  3830  		/*
225c7b1feef1b4 Roland Dreier       2007-05-08  3831  		 * Make sure that de=
scriptors are written before
225c7b1feef1b4 Roland Dreier       2007-05-08  3832  		 * doorbell record.
225c7b1feef1b4 Roland Dreier       2007-05-08  3833  		 */
225c7b1feef1b4 Roland Dreier       2007-05-08  3834  		wmb();
225c7b1feef1b4 Roland Dreier       2007-05-08  3835  =

97d82a48d7a7ec Sinan Kaya          2018-03-19  3836  		writel_relaxed(qp->d=
oorbell_qpn,
225c7b1feef1b4 Roland Dreier       2007-05-08  3837  			to_mdev(ibqp->devic=
e)->uar_map + MLX4_SEND_DOORBELL);
225c7b1feef1b4 Roland Dreier       2007-05-08  3838  =

f95ccffc715bf0 Jack Morgenstein    2018-07-26  3839  		stamp_send_wqe(qp, i=
nd + qp->sq_spare_wqes - 1);
ea54b10c777300 Jack Morgenstein    2008-01-28  3840  =

ea54b10c777300 Jack Morgenstein    2008-01-28  3841  		qp->sq_next_wqe =3D =
ind;
225c7b1feef1b4 Roland Dreier       2007-05-08  3842  	}
225c7b1feef1b4 Roland Dreier       2007-05-08  3843  =

96db0e0335c798 Roland Dreier       2007-10-30  3844  	spin_unlock_irqrestor=
e(&qp->sq.lock, flags);
225c7b1feef1b4 Roland Dreier       2007-05-08  3845  =

225c7b1feef1b4 Roland Dreier       2007-05-08  3846  	return err;
225c7b1feef1b4 Roland Dreier       2007-05-08  3847  }
225c7b1feef1b4 Roland Dreier       2007-05-08  3848  =


:::::: The code at line 3795 was first introduced by commit
:::::: 0fd7e1d8559f45a6838cee93ea49adc0c5bda8f0 IB/mlx4: Fix memory orderin=
g problem when posting LSO sends

:::::: TO: Roland Dreier <rolandd@cisco.com>
:::::: CC: Roland Dreier <rolandd@cisco.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7974827224520635471==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
FOQZeDEcPFcOOzk3Xjap9mP8D4YrgvgpFAIA
--===============7974827224520635471==--

