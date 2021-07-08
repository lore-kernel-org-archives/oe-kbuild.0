Content-Type: multipart/mixed; boundary="===============4789851804291198458=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/hw/mlx4/qp.c:3795 _mlx4_ib_post_send() error: uninitialized symbol 'lso_hdr_sz'.
Date: Thu, 08 Jul 2021 10:08:55 +0800
Message-ID: <202107081044.8wxrswP3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4789851804291198458==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e9f1cbc0c4114880090c7a578117d3b9cf184ad4
commit: 3f649ab728cda8038259d8f14492fe400fbab911 treewide: Remove uninitial=
ized_var() usage
date:   12 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 12 months ago
config: ia64-randconfig-m031-20210707 (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/infiniband/hw/mlx4/qp.c:3795 _mlx4_ib_post_send() error: uninitiali=
zed symbol 'lso_hdr_sz'.

Old smatch warnings:
drivers/infiniband/hw/mlx4/qp.c:1153 create_qp_common() warn: missing error=
 code 'err'
drivers/infiniband/hw/mlx4/qp.c:2590 __mlx4_ib_modify_qp() warn: Function t=
oo hairy.  No more merges.
drivers/infiniband/hw/mlx4/qp.c:4301 mlx4_ib_modify_wq() warn: unsigned 'cu=
r_state' is never less than zero.

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
3f649ab728cda8 Kees Cook           2020-06-03  3544  	int size;
3f649ab728cda8 Kees Cook           2020-06-03  3545  	unsigned seglen;
0fd7e1d8559f45 Roland Dreier       2009-01-16  3546  	__be32 dummy;
0fd7e1d8559f45 Roland Dreier       2009-01-16  3547  	__be32 *lso_wqe;
3f649ab728cda8 Kees Cook           2020-06-03  3548  	__be32 lso_hdr_sz;
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

--===============4789851804291198458==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4789851804291198458==--

