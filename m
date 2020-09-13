Content-Type: multipart/mixed; boundary="===============8641113057856743852=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/hw/mlx4/qp.c:3795 _mlx4_ib_post_send() error: uninitialized symbol 'lso_hdr_sz'.
Date: Sun, 13 Sep 2020 08:29:09 +0800
Message-ID: <202009130816.4BZ1q3MC%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8641113057856743852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   729e3d091984487f7aa1ebfabfe594e5b317ed0f
commit: 3f649ab728cda8038259d8f14492fe400fbab911 treewide: Remove uninitial=
ized_var() usage
date:   8 weeks ago
:::::: branch date: 28 hours ago
:::::: commit date: 8 weeks ago
config: powerpc-randconfig-m031-20200911 (attached as .config)
compiler: powerpc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/infiniband/hw/mlx4/qp.c:3795 _mlx4_ib_post_send() error: uninitiali=
zed symbol 'lso_hdr_sz'.

Old smatch warnings:
drivers/infiniband/hw/mlx4/qp.c:2559 __mlx4_ib_modify_qp() warn: Function t=
oo hairy.  No more merges.
drivers/infiniband/hw/mlx4/qp.c:4301 mlx4_ib_modify_wq() warn: unsigned 'cu=
r_state' is never less than zero.

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D3f649ab728cda8038259d8f14492fe400fbab911
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 3f649ab728cda8038259d8f14492fe400fbab911
vim +/lso_hdr_sz +3795 drivers/infiniband/hw/mlx4/qp.c

1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3532  =

d34ac5cd3a73aac Bart Van Assche     2018-07-18  3533  static int _mlx4_ib_p=
ost_send(struct ib_qp *ibqp, const struct ib_send_wr *wr,
d34ac5cd3a73aac Bart Van Assche     2018-07-18  3534  			      const struct=
 ib_send_wr **bad_wr, bool drain)
225c7b1feef1b41 Roland Dreier       2007-05-08  3535  {
225c7b1feef1b41 Roland Dreier       2007-05-08  3536  	struct mlx4_ib_qp *q=
p =3D to_mqp(ibqp);
225c7b1feef1b41 Roland Dreier       2007-05-08  3537  	void *wqe;
225c7b1feef1b41 Roland Dreier       2007-05-08  3538  	struct mlx4_wqe_ctrl=
_seg *ctrl;
6e694ea33e7a7fa Jack Morgenstein    2007-09-19  3539  	struct mlx4_wqe_data=
_seg *dseg;
225c7b1feef1b41 Roland Dreier       2007-05-08  3540  	unsigned long flags;
225c7b1feef1b41 Roland Dreier       2007-05-08  3541  	int nreq;
225c7b1feef1b41 Roland Dreier       2007-05-08  3542  	int err =3D 0;
ea54b10c7773007 Jack Morgenstein    2008-01-28  3543  	unsigned ind;
3f649ab728cda80 Kees Cook           2020-06-03  3544  	int size;
3f649ab728cda80 Kees Cook           2020-06-03  3545  	unsigned seglen;
0fd7e1d8559f45a Roland Dreier       2009-01-16  3546  	__be32 dummy;
0fd7e1d8559f45a Roland Dreier       2009-01-16  3547  	__be32 *lso_wqe;
3f649ab728cda80 Kees Cook           2020-06-03  3548  	__be32 lso_hdr_sz;
417608c20a4c839 Eli Cohen           2009-11-12  3549  	__be32 blh;
225c7b1feef1b41 Roland Dreier       2007-05-08  3550  	int i;
35f05dabf95ac3e Yishai Hadas        2015-02-08  3551  	struct mlx4_ib_dev *=
mdev =3D to_mdev(ibqp->device);
225c7b1feef1b41 Roland Dreier       2007-05-08  3552  =

e1b866c677d6933 Moni Shoua          2016-01-14  3553  	if (qp->mlx4_ib_qp_t=
ype =3D=3D MLX4_IB_QPT_GSI) {
e1b866c677d6933 Moni Shoua          2016-01-14  3554  		struct mlx4_ib_sqp =
*sqp =3D to_msqp(qp);
e1b866c677d6933 Moni Shoua          2016-01-14  3555  =

e1b866c677d6933 Moni Shoua          2016-01-14  3556  		if (sqp->roce_v2_gs=
i) {
e1b866c677d6933 Moni Shoua          2016-01-14  3557  			struct mlx4_ib_ah =
*ah =3D to_mah(ud_wr(wr)->ah);
a748d60df32ec5d Talat Batheesh      2017-02-14  3558  			enum ib_gid_type g=
id_type;
e1b866c677d6933 Moni Shoua          2016-01-14  3559  			union ib_gid gid;
e1b866c677d6933 Moni Shoua          2016-01-14  3560  =

a748d60df32ec5d Talat Batheesh      2017-02-14  3561  			if (!fill_gid_by_h=
w_index(mdev, sqp->qp.port,
a748d60df32ec5d Talat Batheesh      2017-02-14  3562  					   ah->av.ib.gid=
_index,
a748d60df32ec5d Talat Batheesh      2017-02-14  3563  					   &gid, &gid_ty=
pe))
a748d60df32ec5d Talat Batheesh      2017-02-14  3564  				qp =3D (gid_type =
=3D=3D IB_GID_TYPE_ROCE_UDP_ENCAP) ?
e1b866c677d6933 Moni Shoua          2016-01-14  3565  						to_mqp(sqp->roc=
e_v2_gsi) : qp;
a748d60df32ec5d Talat Batheesh      2017-02-14  3566  			else
e1b866c677d6933 Moni Shoua          2016-01-14  3567  				pr_err("Failed to=
 get gid at index %d. RoCEv2 will not work properly\n",
e1b866c677d6933 Moni Shoua          2016-01-14  3568  				       ah->av.ib.=
gid_index);
e1b866c677d6933 Moni Shoua          2016-01-14  3569  		}
e1b866c677d6933 Moni Shoua          2016-01-14  3570  	}
e1b866c677d6933 Moni Shoua          2016-01-14  3571  =

96db0e0335c7981 Roland Dreier       2007-10-30  3572  	spin_lock_irqsave(&q=
p->sq.lock, flags);
1975acd9f3fdc08 Yishai Hadas        2018-06-19  3573  	if (mdev->dev->persi=
st->state & MLX4_DEVICE_STATE_INTERNAL_ERROR &&
1975acd9f3fdc08 Yishai Hadas        2018-06-19  3574  	    !drain) {
35f05dabf95ac3e Yishai Hadas        2015-02-08  3575  		err =3D -EIO;
35f05dabf95ac3e Yishai Hadas        2015-02-08  3576  		*bad_wr =3D wr;
35f05dabf95ac3e Yishai Hadas        2015-02-08  3577  		nreq =3D 0;
35f05dabf95ac3e Yishai Hadas        2015-02-08  3578  		goto out;
35f05dabf95ac3e Yishai Hadas        2015-02-08  3579  	}
225c7b1feef1b41 Roland Dreier       2007-05-08  3580  =

ea54b10c7773007 Jack Morgenstein    2008-01-28  3581  	ind =3D qp->sq_next_=
wqe;
225c7b1feef1b41 Roland Dreier       2007-05-08  3582  =

225c7b1feef1b41 Roland Dreier       2007-05-08  3583  	for (nreq =3D 0; wr;=
 ++nreq, wr =3D wr->next) {
0fd7e1d8559f45a Roland Dreier       2009-01-16  3584  		lso_wqe =3D &dummy;
417608c20a4c839 Eli Cohen           2009-11-12  3585  		blh =3D 0;
0fd7e1d8559f45a Roland Dreier       2009-01-16  3586  =

225c7b1feef1b41 Roland Dreier       2007-05-08  3587  		if (mlx4_wq_overflo=
w(&qp->sq, nreq, qp->ibqp.send_cq)) {
225c7b1feef1b41 Roland Dreier       2007-05-08  3588  			err =3D -ENOMEM;
225c7b1feef1b41 Roland Dreier       2007-05-08  3589  			*bad_wr =3D wr;
225c7b1feef1b41 Roland Dreier       2007-05-08  3590  			goto out;
225c7b1feef1b41 Roland Dreier       2007-05-08  3591  		}
225c7b1feef1b41 Roland Dreier       2007-05-08  3592  =

225c7b1feef1b41 Roland Dreier       2007-05-08  3593  		if (unlikely(wr->nu=
m_sge > qp->sq.max_gs)) {
225c7b1feef1b41 Roland Dreier       2007-05-08  3594  			err =3D -EINVAL;
225c7b1feef1b41 Roland Dreier       2007-05-08  3595  			*bad_wr =3D wr;
225c7b1feef1b41 Roland Dreier       2007-05-08  3596  			goto out;
225c7b1feef1b41 Roland Dreier       2007-05-08  3597  		}
225c7b1feef1b41 Roland Dreier       2007-05-08  3598  =

0e6e74162164d90 Roland Dreier       2007-06-18  3599  		ctrl =3D wqe =3D ge=
t_send_wqe(qp, ind & (qp->sq.wqe_cnt - 1));
ea54b10c7773007 Jack Morgenstein    2008-01-28  3600  		qp->sq.wrid[(qp->sq=
.head + nreq) & (qp->sq.wqe_cnt - 1)] =3D wr->wr_id;
225c7b1feef1b41 Roland Dreier       2007-05-08  3601  =

225c7b1feef1b41 Roland Dreier       2007-05-08  3602  		ctrl->srcrb_flags =
=3D
225c7b1feef1b41 Roland Dreier       2007-05-08  3603  			(wr->send_flags & =
IB_SEND_SIGNALED ?
225c7b1feef1b41 Roland Dreier       2007-05-08  3604  			 cpu_to_be32(MLX4_=
WQE_CTRL_CQ_UPDATE) : 0) |
225c7b1feef1b41 Roland Dreier       2007-05-08  3605  			(wr->send_flags & =
IB_SEND_SOLICITED ?
225c7b1feef1b41 Roland Dreier       2007-05-08  3606  			 cpu_to_be32(MLX4_=
WQE_CTRL_SOLICITED) : 0) |
8ff095ec4bce7be Eli Cohen           2008-04-16  3607  			((wr->send_flags &=
 IB_SEND_IP_CSUM) ?
8ff095ec4bce7be Eli Cohen           2008-04-16  3608  			 cpu_to_be32(MLX4_=
WQE_CTRL_IP_CSUM |
8ff095ec4bce7be Eli Cohen           2008-04-16  3609  				     MLX4_WQE_CTR=
L_TCP_UDP_CSUM) : 0) |
225c7b1feef1b41 Roland Dreier       2007-05-08  3610  			qp->sq_signal_bits;
225c7b1feef1b41 Roland Dreier       2007-05-08  3611  =

95d04f0735b4fc8 Roland Dreier       2008-07-23  3612  		ctrl->imm =3D send_=
ieth(wr);
225c7b1feef1b41 Roland Dreier       2007-05-08  3613  =

225c7b1feef1b41 Roland Dreier       2007-05-08  3614  		wqe +=3D sizeof *ct=
rl;
225c7b1feef1b41 Roland Dreier       2007-05-08  3615  		size =3D sizeof *ct=
rl / 16;
225c7b1feef1b41 Roland Dreier       2007-05-08  3616  =

1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3617  		switch (qp->mlx4_ib=
_qp_type) {
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3618  		case MLX4_IB_QPT_RC:
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3619  		case MLX4_IB_QPT_UC:
225c7b1feef1b41 Roland Dreier       2007-05-08  3620  			switch (wr->opcode=
) {
225c7b1feef1b41 Roland Dreier       2007-05-08  3621  			case IB_WR_ATOMIC_=
CMP_AND_SWP:
225c7b1feef1b41 Roland Dreier       2007-05-08  3622  			case IB_WR_ATOMIC_=
FETCH_AND_ADD:
6fa8f719844b845 Vladimir Sokolovsky 2010-04-14  3623  			case IB_WR_MASKED_=
ATOMIC_FETCH_AND_ADD:
e622f2f4ad2142d Christoph Hellwig   2015-10-08  3624  				set_raddr_seg(wqe=
, atomic_wr(wr)->remote_addr,
e622f2f4ad2142d Christoph Hellwig   2015-10-08  3625  					      atomic_wr(=
wr)->rkey);
225c7b1feef1b41 Roland Dreier       2007-05-08  3626  				wqe  +=3D sizeof =
(struct mlx4_wqe_raddr_seg);
225c7b1feef1b41 Roland Dreier       2007-05-08  3627  =

e622f2f4ad2142d Christoph Hellwig   2015-10-08  3628  				set_atomic_seg(wq=
e, atomic_wr(wr));
225c7b1feef1b41 Roland Dreier       2007-05-08  3629  				wqe  +=3D sizeof =
(struct mlx4_wqe_atomic_seg);
0fbfa6a9062c71b Roland Dreier       2007-07-18  3630  =

225c7b1feef1b41 Roland Dreier       2007-05-08  3631  				size +=3D (sizeof=
 (struct mlx4_wqe_raddr_seg) +
225c7b1feef1b41 Roland Dreier       2007-05-08  3632  					 sizeof (struct =
mlx4_wqe_atomic_seg)) / 16;
6fa8f719844b845 Vladimir Sokolovsky 2010-04-14  3633  =

6fa8f719844b845 Vladimir Sokolovsky 2010-04-14  3634  				break;
6fa8f719844b845 Vladimir Sokolovsky 2010-04-14  3635  =

6fa8f719844b845 Vladimir Sokolovsky 2010-04-14  3636  			case IB_WR_MASKED_=
ATOMIC_CMP_AND_SWP:
e622f2f4ad2142d Christoph Hellwig   2015-10-08  3637  				set_raddr_seg(wqe=
, atomic_wr(wr)->remote_addr,
e622f2f4ad2142d Christoph Hellwig   2015-10-08  3638  					      atomic_wr(=
wr)->rkey);
6fa8f719844b845 Vladimir Sokolovsky 2010-04-14  3639  				wqe  +=3D sizeof =
(struct mlx4_wqe_raddr_seg);
6fa8f719844b845 Vladimir Sokolovsky 2010-04-14  3640  =

e622f2f4ad2142d Christoph Hellwig   2015-10-08  3641  				set_masked_atomic=
_seg(wqe, atomic_wr(wr));
6fa8f719844b845 Vladimir Sokolovsky 2010-04-14  3642  				wqe  +=3D sizeof =
(struct mlx4_wqe_masked_atomic_seg);
6fa8f719844b845 Vladimir Sokolovsky 2010-04-14  3643  =

6fa8f719844b845 Vladimir Sokolovsky 2010-04-14  3644  				size +=3D (sizeof=
 (struct mlx4_wqe_raddr_seg) +
6fa8f719844b845 Vladimir Sokolovsky 2010-04-14  3645  					 sizeof (struct =
mlx4_wqe_masked_atomic_seg)) / 16;
225c7b1feef1b41 Roland Dreier       2007-05-08  3646  =

225c7b1feef1b41 Roland Dreier       2007-05-08  3647  				break;
225c7b1feef1b41 Roland Dreier       2007-05-08  3648  =

225c7b1feef1b41 Roland Dreier       2007-05-08  3649  			case IB_WR_RDMA_RE=
AD:
225c7b1feef1b41 Roland Dreier       2007-05-08  3650  			case IB_WR_RDMA_WR=
ITE:
225c7b1feef1b41 Roland Dreier       2007-05-08  3651  			case IB_WR_RDMA_WR=
ITE_WITH_IMM:
e622f2f4ad2142d Christoph Hellwig   2015-10-08  3652  				set_raddr_seg(wqe=
, rdma_wr(wr)->remote_addr,
e622f2f4ad2142d Christoph Hellwig   2015-10-08  3653  					      rdma_wr(wr=
)->rkey);
225c7b1feef1b41 Roland Dreier       2007-05-08  3654  				wqe  +=3D sizeof =
(struct mlx4_wqe_raddr_seg);
225c7b1feef1b41 Roland Dreier       2007-05-08  3655  				size +=3D sizeof =
(struct mlx4_wqe_raddr_seg) / 16;
225c7b1feef1b41 Roland Dreier       2007-05-08  3656  				break;
95d04f0735b4fc8 Roland Dreier       2008-07-23  3657  =

95d04f0735b4fc8 Roland Dreier       2008-07-23  3658  			case IB_WR_LOCAL_I=
NV:
2ac6bf4ddc87c3b Jack Morgenstein    2009-06-05  3659  				ctrl->srcrb_flags=
 |=3D
2ac6bf4ddc87c3b Jack Morgenstein    2009-06-05  3660  					cpu_to_be32(MLX4=
_WQE_CTRL_STRONG_ORDER);
95d04f0735b4fc8 Roland Dreier       2008-07-23  3661  				set_local_inv_seg=
(wqe, wr->ex.invalidate_rkey);
95d04f0735b4fc8 Roland Dreier       2008-07-23  3662  				wqe  +=3D sizeof =
(struct mlx4_wqe_local_inval_seg);
95d04f0735b4fc8 Roland Dreier       2008-07-23  3663  				size +=3D sizeof =
(struct mlx4_wqe_local_inval_seg) / 16;
95d04f0735b4fc8 Roland Dreier       2008-07-23  3664  				break;
95d04f0735b4fc8 Roland Dreier       2008-07-23  3665  =

1b2cd0fc673c0bf Sagi Grimberg       2015-10-13  3666  			case IB_WR_REG_MR:
1b2cd0fc673c0bf Sagi Grimberg       2015-10-13  3667  				ctrl->srcrb_flags=
 |=3D
1b2cd0fc673c0bf Sagi Grimberg       2015-10-13  3668  					cpu_to_be32(MLX4=
_WQE_CTRL_STRONG_ORDER);
1b2cd0fc673c0bf Sagi Grimberg       2015-10-13  3669  				set_reg_seg(wqe, =
reg_wr(wr));
1b2cd0fc673c0bf Sagi Grimberg       2015-10-13  3670  				wqe  +=3D sizeof(=
struct mlx4_wqe_fmr_seg);
1b2cd0fc673c0bf Sagi Grimberg       2015-10-13  3671  				size +=3D sizeof(=
struct mlx4_wqe_fmr_seg) / 16;
1b2cd0fc673c0bf Sagi Grimberg       2015-10-13  3672  				break;
1b2cd0fc673c0bf Sagi Grimberg       2015-10-13  3673  =

225c7b1feef1b41 Roland Dreier       2007-05-08  3674  			default:
225c7b1feef1b41 Roland Dreier       2007-05-08  3675  				/* No extra segme=
nts required for sends */
225c7b1feef1b41 Roland Dreier       2007-05-08  3676  				break;
225c7b1feef1b41 Roland Dreier       2007-05-08  3677  			}
225c7b1feef1b41 Roland Dreier       2007-05-08  3678  			break;
225c7b1feef1b41 Roland Dreier       2007-05-08  3679  =

1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3680  		case MLX4_IB_QPT_TU=
N_SMI_OWNER:
e622f2f4ad2142d Christoph Hellwig   2015-10-08  3681  			err =3D  build_sri=
ov_qp0_header(to_msqp(qp), ud_wr(wr),
e622f2f4ad2142d Christoph Hellwig   2015-10-08  3682  					ctrl, &seglen);
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3683  			if (unlikely(err))=
 {
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3684  				*bad_wr =3D wr;
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3685  				goto out;
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3686  			}
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3687  			wqe  +=3D seglen;
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3688  			size +=3D seglen /=
 16;
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3689  			break;
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3690  		case MLX4_IB_QPT_TU=
N_SMI:
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3691  		case MLX4_IB_QPT_TU=
N_GSI:
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3692  			/* this is a UD qp=
 used in MAD responses to slaves. */
e622f2f4ad2142d Christoph Hellwig   2015-10-08  3693  			set_datagram_seg(w=
qe, ud_wr(wr));
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3694  			/* set the forced-=
loopback bit in the data seg av */
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3695  			*(__be32 *) wqe |=
=3D cpu_to_be32(0x80000000);
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3696  			wqe  +=3D sizeof (=
struct mlx4_wqe_datagram_seg);
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3697  			size +=3D sizeof (=
struct mlx4_wqe_datagram_seg) / 16;
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3698  			break;
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3699  		case MLX4_IB_QPT_UD:
e622f2f4ad2142d Christoph Hellwig   2015-10-08  3700  			set_datagram_seg(w=
qe, ud_wr(wr));
225c7b1feef1b41 Roland Dreier       2007-05-08  3701  			wqe  +=3D sizeof (=
struct mlx4_wqe_datagram_seg);
225c7b1feef1b41 Roland Dreier       2007-05-08  3702  			size +=3D sizeof (=
struct mlx4_wqe_datagram_seg) / 16;
b832be1e4007f4a Eli Cohen           2008-04-16  3703  =

b832be1e4007f4a Eli Cohen           2008-04-16  3704  			if (wr->opcode =3D=
=3D IB_WR_LSO) {
e622f2f4ad2142d Christoph Hellwig   2015-10-08  3705  				err =3D build_lso=
_seg(wqe, ud_wr(wr), qp, &seglen,
e622f2f4ad2142d Christoph Hellwig   2015-10-08  3706  						&lso_hdr_sz, &b=
lh);
b832be1e4007f4a Eli Cohen           2008-04-16  3707  				if (unlikely(err)=
) {
b832be1e4007f4a Eli Cohen           2008-04-16  3708  					*bad_wr =3D wr;
b832be1e4007f4a Eli Cohen           2008-04-16  3709  					goto out;
b832be1e4007f4a Eli Cohen           2008-04-16  3710  				}
0fd7e1d8559f45a Roland Dreier       2009-01-16  3711  				lso_wqe =3D (__be=
32 *) wqe;
b832be1e4007f4a Eli Cohen           2008-04-16  3712  				wqe  +=3D seglen;
b832be1e4007f4a Eli Cohen           2008-04-16  3713  				size +=3D seglen =
/ 16;
b832be1e4007f4a Eli Cohen           2008-04-16  3714  			}
225c7b1feef1b41 Roland Dreier       2007-05-08  3715  			break;
225c7b1feef1b41 Roland Dreier       2007-05-08  3716  =

1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3717  		case MLX4_IB_QPT_PR=
OXY_SMI_OWNER:
e622f2f4ad2142d Christoph Hellwig   2015-10-08  3718  			err =3D build_srio=
v_qp0_header(to_msqp(qp), ud_wr(wr),
e622f2f4ad2142d Christoph Hellwig   2015-10-08  3719  					ctrl, &seglen);
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3720  			if (unlikely(err))=
 {
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3721  				*bad_wr =3D wr;
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3722  				goto out;
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3723  			}
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3724  			wqe  +=3D seglen;
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3725  			size +=3D seglen /=
 16;
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3726  			/* to start tunnel=
 header on a cache-line boundary */
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3727  			add_zero_len_inlin=
e(wqe);
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3728  			wqe +=3D 16;
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3729  			size++;
e622f2f4ad2142d Christoph Hellwig   2015-10-08  3730  			build_tunnel_heade=
r(ud_wr(wr), wqe, &seglen);
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3731  			wqe  +=3D seglen;
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3732  			size +=3D seglen /=
 16;
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3733  			break;
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3734  		case MLX4_IB_QPT_PR=
OXY_SMI:
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3735  		case MLX4_IB_QPT_PR=
OXY_GSI:
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3736  			/* If we are tunne=
ling special qps, this is a UD qp.
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3737  			 * In this case we=
 first add a UD segment targeting
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3738  			 * the tunnel qp, =
and then add a header with address
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3739  			 * information */
e622f2f4ad2142d Christoph Hellwig   2015-10-08  3740  			set_tunnel_datagra=
m_seg(to_mdev(ibqp->device), wqe,
e622f2f4ad2142d Christoph Hellwig   2015-10-08  3741  						ud_wr(wr),
97982f5a91e91da Jack Morgenstein    2014-05-29  3742  						qp->mlx4_ib_qp_=
type);
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3743  			wqe  +=3D sizeof (=
struct mlx4_wqe_datagram_seg);
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3744  			size +=3D sizeof (=
struct mlx4_wqe_datagram_seg) / 16;
e622f2f4ad2142d Christoph Hellwig   2015-10-08  3745  			build_tunnel_heade=
r(ud_wr(wr), wqe, &seglen);
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3746  			wqe  +=3D seglen;
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3747  			size +=3D seglen /=
 16;
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3748  			break;
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3749  =

1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3750  		case MLX4_IB_QPT_SM=
I:
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3751  		case MLX4_IB_QPT_GS=
I:
e622f2f4ad2142d Christoph Hellwig   2015-10-08  3752  			err =3D build_mlx_=
header(to_msqp(qp), ud_wr(wr), ctrl,
e622f2f4ad2142d Christoph Hellwig   2015-10-08  3753  					&seglen);
f438000f7a31fad Roland Dreier       2008-04-16  3754  			if (unlikely(err))=
 {
225c7b1feef1b41 Roland Dreier       2007-05-08  3755  				*bad_wr =3D wr;
225c7b1feef1b41 Roland Dreier       2007-05-08  3756  				goto out;
225c7b1feef1b41 Roland Dreier       2007-05-08  3757  			}
f438000f7a31fad Roland Dreier       2008-04-16  3758  			wqe  +=3D seglen;
f438000f7a31fad Roland Dreier       2008-04-16  3759  			size +=3D seglen /=
 16;
225c7b1feef1b41 Roland Dreier       2007-05-08  3760  			break;
225c7b1feef1b41 Roland Dreier       2007-05-08  3761  =

225c7b1feef1b41 Roland Dreier       2007-05-08  3762  		default:
225c7b1feef1b41 Roland Dreier       2007-05-08  3763  			break;
225c7b1feef1b41 Roland Dreier       2007-05-08  3764  		}
225c7b1feef1b41 Roland Dreier       2007-05-08  3765  =

6e694ea33e7a7fa Jack Morgenstein    2007-09-19  3766  		/*
6e694ea33e7a7fa Jack Morgenstein    2007-09-19  3767  		 * Write data segme=
nts in reverse order, so as to
6e694ea33e7a7fa Jack Morgenstein    2007-09-19  3768  		 * overwrite cachel=
ine stamp last within each
6e694ea33e7a7fa Jack Morgenstein    2007-09-19  3769  		 * cacheline.  This=
 avoids issues with WQE
6e694ea33e7a7fa Jack Morgenstein    2007-09-19  3770  		 * prefetching.
6e694ea33e7a7fa Jack Morgenstein    2007-09-19  3771  		 */
225c7b1feef1b41 Roland Dreier       2007-05-08  3772  =

6e694ea33e7a7fa Jack Morgenstein    2007-09-19  3773  		dseg =3D wqe;
6e694ea33e7a7fa Jack Morgenstein    2007-09-19  3774  		dseg +=3D wr->num_s=
ge - 1;
6e694ea33e7a7fa Jack Morgenstein    2007-09-19  3775  		size +=3D wr->num_s=
ge * (sizeof (struct mlx4_wqe_data_seg) / 16);
225c7b1feef1b41 Roland Dreier       2007-05-08  3776  =

225c7b1feef1b41 Roland Dreier       2007-05-08  3777  		/* Add one more inl=
ine data segment for ICRC for MLX sends */
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3778  		if (unlikely(qp->ml=
x4_ib_qp_type =3D=3D MLX4_IB_QPT_SMI ||
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3779  			     qp->mlx4_ib_q=
p_type =3D=3D MLX4_IB_QPT_GSI ||
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3780  			     qp->mlx4_ib_q=
p_type &
1ffeb2eb8be9936 Jack Morgenstein    2012-08-03  3781  			     (MLX4_IB_QPT_=
PROXY_SMI_OWNER | MLX4_IB_QPT_TUN_SMI_OWNER))) {
6e694ea33e7a7fa Jack Morgenstein    2007-09-19  3782  			set_mlx_icrc_seg(d=
seg + 1);
225c7b1feef1b41 Roland Dreier       2007-05-08  3783  			size +=3D sizeof (=
struct mlx4_wqe_data_seg) / 16;
225c7b1feef1b41 Roland Dreier       2007-05-08  3784  		}
225c7b1feef1b41 Roland Dreier       2007-05-08  3785  =

6e694ea33e7a7fa Jack Morgenstein    2007-09-19  3786  		for (i =3D wr->num_=
sge - 1; i >=3D 0; --i, --dseg)
6e694ea33e7a7fa Jack Morgenstein    2007-09-19  3787  			set_data_seg(dseg,=
 wr->sg_list + i);
6e694ea33e7a7fa Jack Morgenstein    2007-09-19  3788  =

0fd7e1d8559f45a Roland Dreier       2009-01-16  3789  		/*
0fd7e1d8559f45a Roland Dreier       2009-01-16  3790  		 * Possibly overwri=
te stamping in cacheline with LSO
0fd7e1d8559f45a Roland Dreier       2009-01-16  3791  		 * segment only aft=
er making sure all data segments
0fd7e1d8559f45a Roland Dreier       2009-01-16  3792  		 * are written.
0fd7e1d8559f45a Roland Dreier       2009-01-16  3793  		 */
0fd7e1d8559f45a Roland Dreier       2009-01-16  3794  		wmb();
0fd7e1d8559f45a Roland Dreier       2009-01-16 @3795  		*lso_wqe =3D lso_hd=
r_sz;
0fd7e1d8559f45a Roland Dreier       2009-01-16  3796  =

224e92e02a769b8 Brenden Blanco      2016-07-19  3797  		ctrl->qpn_vlan.fenc=
e_size =3D (wr->send_flags & IB_SEND_FENCE ?
225c7b1feef1b41 Roland Dreier       2007-05-08  3798  					     MLX4_WQE_CT=
RL_FENCE : 0) | size;
225c7b1feef1b41 Roland Dreier       2007-05-08  3799  =

225c7b1feef1b41 Roland Dreier       2007-05-08  3800  		/*
225c7b1feef1b41 Roland Dreier       2007-05-08  3801  		 * Make sure descri=
ptor is fully written before
225c7b1feef1b41 Roland Dreier       2007-05-08  3802  		 * setting ownershi=
p bit (because HW can start
225c7b1feef1b41 Roland Dreier       2007-05-08  3803  		 * executing as soo=
n as we do).
225c7b1feef1b41 Roland Dreier       2007-05-08  3804  		 */
225c7b1feef1b41 Roland Dreier       2007-05-08  3805  		wmb();
225c7b1feef1b41 Roland Dreier       2007-05-08  3806  =

59b0ed121297b57 Roland Dreier       2007-05-19  3807  		if (wr->opcode < 0 =
|| wr->opcode >=3D ARRAY_SIZE(mlx4_ib_opcode)) {
4ba6b8eaa9d67d0 Eli Cohen           2012-02-09  3808  			*bad_wr =3D wr;
225c7b1feef1b41 Roland Dreier       2007-05-08  3809  			err =3D -EINVAL;
225c7b1feef1b41 Roland Dreier       2007-05-08  3810  			goto out;
225c7b1feef1b41 Roland Dreier       2007-05-08  3811  		}
225c7b1feef1b41 Roland Dreier       2007-05-08  3812  =

225c7b1feef1b41 Roland Dreier       2007-05-08  3813  		ctrl->owner_opcode =
=3D mlx4_ib_opcode[wr->opcode] |
417608c20a4c839 Eli Cohen           2009-11-12  3814  			(ind & qp->sq.wqe_=
cnt ? cpu_to_be32(1 << 31) : 0) | blh;
0e6e74162164d90 Roland Dreier       2007-06-18  3815  =

0e6e74162164d90 Roland Dreier       2007-06-18  3816  		/*
0e6e74162164d90 Roland Dreier       2007-06-18  3817  		 * We can improve l=
atency by not stamping the last
0e6e74162164d90 Roland Dreier       2007-06-18  3818  		 * send queue WQE u=
ntil after ringing the doorbell, so
0e6e74162164d90 Roland Dreier       2007-06-18  3819  		 * only stamp here =
if there are still more WQEs to post.
0e6e74162164d90 Roland Dreier       2007-06-18  3820  		 */
f95ccffc715bf0f Jack Morgenstein    2018-07-26  3821  		if (wr->next)
f95ccffc715bf0f Jack Morgenstein    2018-07-26  3822  			stamp_send_wqe(qp,=
 ind + qp->sq_spare_wqes);
f95ccffc715bf0f Jack Morgenstein    2018-07-26  3823  		ind++;
225c7b1feef1b41 Roland Dreier       2007-05-08  3824  	}
225c7b1feef1b41 Roland Dreier       2007-05-08  3825  =

225c7b1feef1b41 Roland Dreier       2007-05-08  3826  out:
225c7b1feef1b41 Roland Dreier       2007-05-08  3827  	if (likely(nreq)) {
225c7b1feef1b41 Roland Dreier       2007-05-08  3828  		qp->sq.head +=3D nr=
eq;
225c7b1feef1b41 Roland Dreier       2007-05-08  3829  =

225c7b1feef1b41 Roland Dreier       2007-05-08  3830  		/*
225c7b1feef1b41 Roland Dreier       2007-05-08  3831  		 * Make sure that d=
escriptors are written before
225c7b1feef1b41 Roland Dreier       2007-05-08  3832  		 * doorbell record.
225c7b1feef1b41 Roland Dreier       2007-05-08  3833  		 */
225c7b1feef1b41 Roland Dreier       2007-05-08  3834  		wmb();
225c7b1feef1b41 Roland Dreier       2007-05-08  3835  =

97d82a48d7a7eca Sinan Kaya          2018-03-19  3836  		writel_relaxed(qp->=
doorbell_qpn,
225c7b1feef1b41 Roland Dreier       2007-05-08  3837  			to_mdev(ibqp->devi=
ce)->uar_map + MLX4_SEND_DOORBELL);
225c7b1feef1b41 Roland Dreier       2007-05-08  3838  =

f95ccffc715bf0f Jack Morgenstein    2018-07-26  3839  		stamp_send_wqe(qp, =
ind + qp->sq_spare_wqes - 1);
ea54b10c7773007 Jack Morgenstein    2008-01-28  3840  =

ea54b10c7773007 Jack Morgenstein    2008-01-28  3841  		qp->sq_next_wqe =3D=
 ind;
225c7b1feef1b41 Roland Dreier       2007-05-08  3842  	}
225c7b1feef1b41 Roland Dreier       2007-05-08  3843  =

96db0e0335c7981 Roland Dreier       2007-10-30  3844  	spin_unlock_irqresto=
re(&qp->sq.lock, flags);
225c7b1feef1b41 Roland Dreier       2007-05-08  3845  =

225c7b1feef1b41 Roland Dreier       2007-05-08  3846  	return err;
225c7b1feef1b41 Roland Dreier       2007-05-08  3847  }
225c7b1feef1b41 Roland Dreier       2007-05-08  3848  =


:::::: The code at line 3795 was first introduced by commit
:::::: 0fd7e1d8559f45a6838cee93ea49adc0c5bda8f0 IB/mlx4: Fix memory orderin=
g problem when posting LSO sends

:::::: TO: Roland Dreier <rolandd@cisco.com>
:::::: CC: Roland Dreier <rolandd@cisco.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8641113057856743852==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICNosXV8AAy5jb25maWcAlFxLd9w2st7nV/RxNjOLJHpZ1zn3aAGSIBtpkqAAsFutDY8itxOd
kSWPHjPx/fW3CuCjAIKyk0XsrioU3lVfFYr+8YcfV+z15fHzzcvd7c39/dfVH4eHw9PNy+Hj6tPd
/eF/V5lc1dKseCbMzyBc3j28/vXLl8f/Hp6+3K7e//zh56Ofnm5PV5vD08PhfpU+Pny6++MVFNw9
Pvzw4w+prHNRdGnabbnSQtad4Vfm4l2v4Pzsp3tU+NMft7erfxRp+s/Vrz+f/nz0jjQUugPGxdeB
VEzKLn49Oj06GhhlNtJPTs+O7H+jnpLVxcg+IurXTHdMV10hjZw6IQxRl6LmE0uoy24n1WaiJK0o
MyMq3hmWlLzTUpmJa9aKswzU5BL+ByIam8La/Lgq7Frfr54PL69fptUStTAdr7cdUzArUQlzcXoC
4sPYZNUI6MZwbVZ3z6uHxxfUMC6DTFk5zPTduxi5Yy2drB1/p1lpiPyabXm34armZVdci2YSp5zy
umJLHOxhHDTRRMcc8lFfZE6ezp6W8Zy1pbGrRcY9kNdSm5pV/OLdPx4eHw7/HAX0jpHJ6L3eiiad
EfDP1JQTvZFaXHXVZctbHqfOmuyYSddd0CJVUuuu4pVU+44Zw9I1XadW81IkkSVgLdzAYKmZAv2W
gV2zkvQdUO1xg5O7en79/fnr88vh83TcCl5zJVJ7sPVa7shVCzhdybe8jPMrUShm8MxF2aL+jafL
7HRNTxhSMlkxUfs0LSqfkEuV8qy/YqIuyDY2TGmOQvEOM560Ra7t0h8ePq4ePwXLEzay93s7W+eB
ncL92sDq1EaTTcD9QTtiRLrpEiVZljJt3mz9plglddc2GTN82FNz9/nw9BzbVtunrDlsHFFVy259
jSakslsxnjsgNtCHzEQavZ+unchKHjmbjpm3dGHgDzT1nVEs3XhbE3LcLgZD9MYminWnuLZ7oLQ/
vn7zZusw3lDFedUY0GqN+Kh0oG9l2daGqX102r1UZM5D+1RC82E30qb9xdw8/2v1AsNZ3cDQnl9u
Xp5XN7e3j68PL3cPf0z7sxUKWjdtx1Krw1ujCBNPgX/67ZGMtbbGQadruBpsW/SXYJyTY5g1VxUr
cR5at4pHp5/oDARkCiLYkYkKoUfThhkdX0Etohv2HUs1HhhYB6FlOZgXu9QqbVc6cuphWzrg0QnD
z45fwfGO7aN2wrR5QMLpWR39NYywZqQ24zE6HvmAgYph9cpyupSEU3PYKs2LNCkFtQiWJ9ME14ba
MH9VfAefiPqEDF5s3F/mFLvllLwG6woXbyKVEpXm4BREbi5Ojigdd6tiV4R/fDJdGlGbDUCNnAc6
jk/dturbPw8fX+8PT6tPh5uX16fDsyX304twA8QG+o9PPhBjUyjZNmToDSu4u7RcTVTwx2kR/AyQ
gqNt4A+CnMpN30PYY7dTwvAELBw9iT3P3sDIWezZjcj0TJ/KKNLqiTkc12s7j7CLdVtwUybRKwk7
pPnCde2bZ3wr0rhN6CVAyaJF6EWSJl+epHXAxF+DAxxZzDA6JYRx4M/BCsXUrXm6aSTsO7oIIxWf
2zqEu1Z1dLTg03MN4wFLmIJnjW2M4iXb+9sOK2Shp8rITcHfrAJtWrbo0yZYqrIARQMhAcKJR/Hh
NBCuPEdoJWRsfMg4IwOUEj2Tf73hhsgGfIa45uhy0d/DHxWrU2/JQjENf4l0aX0MWJUMg5tUgr3D
bes4xiv1YKlHpW8KxqxyAKXdb7DiKW+MDSPRkpIJN/n0w9l6cnMhHhBw5Ml913A7KjDJ3QTogvPQ
MyJjy9esBhwUBgEOnBCqtXU0yiJ7wcsc1kLRGTCAqz6EylvAScFPMA5ESyOpvBZFzcqcHEg7Jkqw
GJMS9NoZtHH2TMjoLRGya2FGRSw0ybZC82HFyBKA6oQpJejKb1BkX+k5pfOA9Ui1C4MX0Iitv+Pd
DI0j8TcInlm5Y3vdUW86sIb4kPLwbFgqXZkRvE+z6LA3tOnau5WaX0ZWBVrxLONEo70yeOu6MVCY
YFJ6fHRGtVi312dVmsPTp8enzzcPt4cV/8/hAWASA4eYIlAC1OugZ69nUh+FXd+pcVK4rZy6wWfG
bLAu22Q06NM9QmrvSe2V8m+6l89gBuKeTdw8lywWD6N2vzcZF2M4CAVOv995cvaRhy4UsVWn4FbL
yldJ+WumMgCAMfeg122el9xhCzgiEvyIVLO1QGQEYakRrFwINmQuyvgds/bOujkvZvUzSKPpadLz
swEoN0+Pt4fn58cnCI6+fHl8evGOS5Ois9ic6u78LBblDHzenRP/MgakjQe0+fv3R0dIjE6Pn0e4
s36IrQJxYk5BAilV6tPyhoDpXJd47+wt8LA06uZBQ5ANu2wMzjOhiZZmvdchjZVoi4KBVBVCcjAY
a5/eLx+wCR1k7Z0gh7Ei4KBWFqRh2o9oyqRUCe+dVX8A5rs7hpCZlqcEXuDpS3BZ60wwsjTB3Lxx
WhtYVQzgZ40BhNEI7cmwYgKivjj+EBcYrvqg6Ph/vkMO9R37oS03CJO5ciGy4gQ02YhpYFkb3OVC
wf1N12298ZYY4mJ98X6KTupKdIL6V4jL0o2L2XTbNH5a15JBRV6yQs/5mNEBTDlnDHdnveOiWBvv
sAQnp/c6tdQNPW2cqXI/wxcNq/s0lWwhnvowJbntYnpYymY4Z3SLlWUFTjIHFAvmDM0N9d1uk9i+
92Rwh7JgyG2WFN3xOdgB0gpTkbbtfBE8UDS45lZUYEhDTywSrhxeRMClRVKGIv1SY4pMyYRrf2iA
UpyPAjBRLPIES/XFSZyXvcXbAu+I8jK2I0t3LWvwQBTdN4V7LbA5VX1xRm0YQsOag09Km2q04/c3
L+iziRkfN05WJKFJ9EBUNZo+z+ZfcrBAaE5jEVXf+SzdsQEsULSc5iF4wxqFTo1hxirsReYuEsGg
CKCqqGOBBAqC8QOUfgXHz7t/VWO7H3Xib4dpF/S44ay3XaxhpQs1Q1jojvKnw79fDw+3X1fPtzf3
XpIOjQggAJJEHihdIbeYv1dojRbYYUZnZGK6zIu5BsZwBbA1ic+WwvhII7kDjAbX8/ubIPq14XXs
LMQayDrjMKzsmzMAHujeWuT+/eOxdqg1IhZ7ecu7FMB6Mt+3Ht+9Dt+c/9+b9+J8x8P5KTycq49P
d/9xqH/S5hbRP4c9rWsgdMr4duJdSiUuB4mLz15ONnIZhqGIj/eHvnMgjQNEMoWUNlsbvBN4PbgG
hEIVj2PkXdEI7wkR7FGnTBrVOzOONHx6/IKv0V6YtL7ujn3jR1kn72N2ERinFpEGWuKyF+RlumJm
DVikLWd5EZ9j4/+ItkBqvevaWlRNySsIzLh3Dsusw2wtWBgMOPABMjY6aZqyLXr4Tl2oDVHQeWLE
zSHyDvi8tj6rf77s9XxLRsHfaOi+4VcUztifANJm/hyDb8dsWlVgSEVycDA+DLOYgwFTMD6RZw/k
0xFVgNK7rK3iCUF8W7EJeYDg8cewNvpK7UAIrFtqhtlXMqMPplYCAKMBdr9OIYax75YxNsC2CeH0
6V3q70VZ8gIfdBxq67asbPnF0V/vPx5uPv5+OHw68ksiHJhzw7Rb7kOis40NZwOgZCPcMKvfVzj0
5BHI2DRfKGvf+uz7ACIiCSG1wtx/kLDV1cLGVRmiCEQVUe/g2CTtyq8Ae3SGQfwPgTOpbujRJPdS
OgEzuKsUgeqaNfiwimngGBap4AJmLtg3fh0GskrOSbA3UPwQEKiYtp7L7tgGzzgdMKX2BSNglwgW
o/wijQ7Yw249nIzPLC29N43dpXOyHc9zkQpMFfXePJ4FAFBZ9BcjlkrhKcYlNMQNrPh43jVDQN0x
ixitcU9en4mxD0KNXt4/zwKCYYX3tUkJ7uyhs09wEuM8kFQmcW9ExzEGl4AJAPXBQFwxCw3c4E7J
PEccefTX7ZH/32QlbQkM6FBviWG6QsCZHgVnAjDrUiSdAjcxK+oBgA/Gzy/GoJw8zGb29E5BzDl/
gt4MyUPaDolVJWREttLCl9vmVA4pYdDqjSLZN0zrCHNr8wR6X8OOS+9hAcOWlpXiOqhdgVZ+xzaM
gtCCngE7vysIbvG5JJq2sxJB1srO1AUoXhXYzdPtn3cvh1t81/zp4+ELHKbDw8v8QDvv5b8eODcZ
o/EyDxYEouvQBVu6dPlHz51uXCQdvcm/gf/sSpZE77HVOFmEtoY1Lmp8i0uxmiDwegC97SM1nKEu
8Z9d3ZBhYpgbgtHM9j6M9R1VcRNlyCZO79V0CMKCtyXLz9vali91XCmpYuVMU0WWbb+G8zLPd2Cg
i+C495kRwAMO0oh8P7wgBup1hZazL+ML54B5jQ7iEpe36le6t4+enKYBbfgqgWmwGNfPmkx0DJv6
HhFRxRZkOilenrEDTLeGxg6tYaI9ysZah2+IOFgirucIEoaAaT1bcZBWzVW6DuHqjrPNgHZhzS5b
oUI1OwZHWFj4g0VlQ3FlRKhPXH6XrCwzIh9bt94ZIjb28nBLdJccxa3AiwIHVBJmXyDhs4eyqEHx
QtugkTZKzox9uljwZdlwqDE9fh2Q36yCWpLwS6GchfhmPRTcmwFi81TkNLEFrLaEy49mCF9m8bUx
ot+aejABthTRuNKO8Pra5vYlyTuN0556yfIwterxpiR6pDXJkC8poSJBAj2VzX6A7aYMr7VVU28V
q8Bc0kqUEpOYCJZ3TNESFTzJWhS6haWtiVHrR9CzWWAwe+7pSeI8aCz8s68vRvbAbYpysVqEPEvq
WeqkSOX2p99vng8fV/9y+PHL0+Onuz67N+UUQKyHVksBHQ7DivXusWP+C8xbPXnLioXrGC6L2nv5
JeQomPxOeDDGxRB7YqEA9XD2CV1XOPCj4Mx7yQhL6kO0UrIs6vZ7qbZ+S2LwUG9p0Cod69HL+Ivo
ICmKt9h4kLCK8S0ZfJXddZXQGu3HWFEEYMgG1JHNb2swB3Bw91UivaKG3ljYUsESvDwt/krwZNKf
4Fou3ZNwcMSRpVMtwNhc+jn1oboo0UWUCOh9TseYv1DCRKuUelZnjr301SCAkXh8JwcJMBXSmIWn
aVsE1wfm1ukpfwy7xIS99oVeAms6eZ3ul7QOYqkMFwiUdtXlfDb4FpPHttOuN75vNawMm7lPPCA0
TdW+CSuS3OPLzdPLHV60lfn65eBXXAxBPr4GYS46ViFQ6Uxqkg+YHlBy4ZGnjGbQo3fCZmEQzqK6
9KPYnob+k0ZRPdmvJ0Ti9NQk5FRp6c0V2gnpUjRYzrXwokOkNvvEL08cGEl+GbV2ftdj0DoWcQOM
EH6ZFevLBQebrevj6Vdb93urGwgt0GbNvPaYU2MGnHbaqYp8AWFNqWsMGyx3NT3caqd5tcS027TA
m0qLIA7ekdsc/h4Fa1QC1rJkTYMGjGUZWrzOGjGSpxjrQe2u8b8Ot68vN7/fH+zHXCtb8vNCQslE
1Hll/BhxhA1zFvxIgwJL/G1x//iEgwioLxiOXUOnVqdKNL5ZcAyw0LH8FHbTRxfjUVmanZ16dfj8
+PR1Vd083Pxx+ByNo+OZ2inB06dpK1a3LJqqGlO1ToTA5YETQtAh28o1r01E3uYrOXUTE2sL/0No
N8sLhxJh5Mq06QrqpOyp2mDGEUvb/CvRD5GW2/ucWc7fp/fD8WCFLzAV4IXmI9LCPR1EF78E1NgY
Zw2xVuYsqChLF0pLbayoON55L0iIfMCEIQ2uF7pvYnEQk+IF7ExYPJMAGE2DEHWwWV5aRVeRkQ0r
Y7e5ErXt5OLs6NfzCYFz8DAMLCi98zBKP2eSeqXiFQuLrUcSfT9AIpbS6IuxKOe6VzuO2xJGvAWR
4DBk+BNdeXQ3FxsFtczfbvDh7OTv9nD2txusY/ZnscG1NiTgWRK7ePd/zy8f34UDuG6kLCdVSRtH
YVHh0xzCqsWRBsIW+9MzHJHCMX6+ub9/vH3nS8UqZm1L8hOGTn7ZsdHOxu7JnBxtLIOpnGdbWIBe
GDPokTkP2TVXGNUnC6f+YQJcKcTyRrWY60cLYD8bpcAkGwo4hwRGrPTb1kVtg+xIwxXmJ+w3UCTl
h19AAKRcV0zFMgVYa2hTESx8IEQuPvA1GXV3yx5taFzTQhSs4IFJKC/ZikQe0PQmQbfD6yGlaP1n
fXj57+PTv7DeIPJ8DtZ1w2M7AXiLVKzjL3D13tuSpWWCxXfalDHQcJUr4krxF76XYPwZUFlZeCUD
logJymhnlmsfS3O2UGNjRXSbdFi+FI1TrITzHTwYjX3v0UakOhzmOiBAMBpQRGOfwT7Tndvw/Yyw
0DVH5GlS+qFzlU6N4Yfdg4lylTX2GxxOjzAhBuLCO2uicd9Y+F+tAnWIiOz7UBAIYPoygcsmeLf8
9eCguSn7j+tjxwOErP5elJm1NwjHA/CcSFrPAJymbsLfXbZOm2CcSMY6toVqASegmGoiY7PXsKHv
aY5SIGzmVXvl7ygoM23tPQ+O8rZSZ6Zk/Fw4vjCVm31YiTZygqlWdCG/seaNqDSAzmN/CR3xhOrV
+xoGIDciqslNZWuEP+U2iy9FLr2S8540LdzCOUI5tl7mwYWJzdINzr+KlmhvWT8+nxMO2hLt7fFJ
cDtjZJx3hKzYLkZGEpwjTMiTzA+qhr8W4/2LsBJB7MFITdvE+8B1oO+gi52UMUVrNDNzTWvtmZ+J
vk9KL5c7cra8YLEDMgrU22g7/AYIj2ncoQxSZfz2kt7rOBodJfacxYqpRr4oIaCRQkcWI0vdIs2V
ptmCIxz3KYk7rwGV2R17I5iYrffAGLb0Te0qWJWAPYzy4t2fX3+/v3lHJ15l77X3dXGzPfd/9V4B
4+E8xrH/ZkrAcJ8molPtMpb5t+Hcc6yO4nnWkTSHDyNrcJueeTjvjUDUEMKoKtGc+2bgfG4HUNAz
c5aiAYZ+DindufdZKVLrTOgUgsmMm33DA+bYF7HlQC5ULHS2LGdGvTn4Nj8cZptgwjskj05kTvyG
QuIovH54cd6Vu+jiWR7A6TRG974AdWeoKSOaqsazS/bncDZJvThSsavlIkLYZPxngPAxFhH+gmdr
TIP/+JDWIt8Hfsu2btZ7+zAAEKhajH9A2D31xhJqzfgKTB15lqbx0wrm0hB7jb86/GhDJr+lXk7K
MgYjY723WxC4155zX5LTa3Yc/6BvqQW+RcdSPSg/H8ESF/sNvKTr0QHYqVI0izob7ykef3UVh6Yd
fXQhZHDXnlOyH9bgK0LMbFquD6SZqbwfcFiE5ykGGv6zKCJdqFhFoZJFVw9ZiTo5/3Dm9+NocCDC
IoLyhJ4P/DXmisiwLH17GtsuQ65XAaiYXDblLVaiRFYsfltu4Y32vuyKE8C+FN2Ho5PjyziLqV9P
T499nD3wEpVWAzgO4DUVWbjcnhbwYvb1O9pPoXeiibNwSlEGd5zooCqzZHAGiY2+ji+HTHkpTbzL
y3RheeFw/Xp6dBpvpX9jx8dH7+MtjWKipOdrC7rC7ZpoXbGlJ4YwKo+R8RRD0M/+7ynOHI5pmXo/
TuglYOWGKth2rAF35ZNFk2XefbQEfCpkMft6dUKWoWQNMRrNWnojPi/lrmH1jDDPzA6Mep3OpYFo
AwA6RsrLFSvwM4HIYKnYWjZx3dY1RjmVTESJL85R7lARujAssJtvjKgACawlWmcqPrLCqYgz0Eza
Qc96pnqzJcceE8ZV/M7xOkQ0HSDOOR7g92eehx6pXV32f7H/bIXAvVr4Ppw0clmZmIOfZGYHDLxj
PxLvGtsH2SHvd/l6eD3cPfzxS/8K630N10t3aRKYWiSuTRJaK0vO9cK/KNYLgDN6k98oEfOlA9ui
zMtYzyr6Ev//nD3JcutGkvf5Cp4muiPaY4KkKPLQBxALWRY2oUAS8gUh68m2Yt7Te/Ekd7f/fipr
ASqrsiDHHLQgM2vfsrJyMVieHxx+TIMpXw4G22X3hd/y7pBT5SeHkLgDsIKl84ZBbJjQWr8Ewcin
PjTlWLRs4OJvVlI1SluKgxx78p4unN8daERyQkb1Bnyf31M9mwQ0/g0+v1ckfq8k8Z0n/FIpZrI7
nYj+bVhGVU0ULTAzmRlBup8hPIV60Az79hi73zeLUEL1z49vby+/vjw5XlMhXVJ4WQkQaHSRt36D
7xJWpVnv9hqg5P5E+XowBPmVSnZe029vY7b8QvOmNsF2rlixXeGuBKjrXWvsAHnd8wqBTMhrkiEo
wSTOcfgj5X9lwFbOJIyTzk0Tw1sSvAvQoidDAoqPswQla9uAApYh4TGY+82SVOTT2FjPDLkPHfNl
ZeOOtoTfHSDBTIYJP5d+fqKWzioBKHBxPpQYQl10GZBKGRKWz3eFuvPD88hMA45x5+0qXWKew+Y2
KpajR6Y0oRzPpBUHh2Q1+Nyd+ukgTrtYaopRMPNvAInleBYmjekJZpFU1G5h4Uv8dmNnbnlKDWA/
Kly6OpkvHx5dkTpGLS5TF3Fr6rB/XAvsirdGmot+s6LHsGDVnSNKl7MWzWWAiEsbGmcJ02xtYHpU
tvOXE2+dw1FWG5liA7hYi12JgyAUW2m3HRLqwPfAS3plSKSY9qF6JRwZr8H3UGcl6G0OR2hvTM2P
1tb+bnPpA9SWpfVIO1wpa0qhF2IXLISShDmsTAu+IvnDgJ2ZHe59v17OSxBo9CprR/xovXh/fnv3
GNfmrgOzAXyDbetG3GMqBu/5liG8l5GDsJ/Fp149xWUbpyS3mtgboPiA9xx78wHQgZQzAOZ4xYl/
ivbrvQAp7iGuFunzv16enhep5xkANhOv7EuvQKh0XkBGdPkwL1EOSVwkYFig7N6soRa4vMio/I9t
OP+7SwxGRE3Csjx1EyaDkxBjk9tb0omJwLGcwd88xZUv/dGQIOkoARxKuDUoebjqDVgPjRW3+/On
GHwDuHllJQfyQG75LtouI5zR1DluXqbsYOc0RT+L13UE09hAhQxFqGt4nbvbIcJr5zjSmyht3kBM
X+sMoc7hOBdbRtsgdSIDk+IKWkQ6UkjTvaGoOXVAjGSeO7u2v4upC6VIcZdYrBDv2iwuPU14UHZo
XYuLKwPDM7IiVwYOsr6gT92dygv7aB3U5nesKJBoW0JES5szzRhoAvCwETgx9g7PvW8mRXLEMu2V
a9ogP7ZvgrbkScxye66z3FNUBJjIxdmAGFgdHixI1pwGZRYxzT4NA7ls1z0E62DIwPbL4dmmduS0
CKPx2XKr5YJLtWSB3kOUgeCXqxQ8lWEFT3F8imoWLosiPeaWto2IPNGyCzA4ltgRVNq0tt5Y8Txm
BaiTk63KulMHeoGaVwrJ57PpUJbnUOgM0r7CrHdP90P7+ucYSHhmhX0W9HYPAb8cgI95Qx2jgBqa
rnSyA5NzmnoAQ1Ds6FNWNeQXIQFLHqWlqB2g4CAbskkd9lkJMHBjKsCBLJFGIQCyJC4xhNUXL8+W
3vMlLhYMGIk1CtrOiaHsXwTs6evr+/evn8H79uSCCOWdd+J3RDrEATSE5JgeW1yEcTf2BQ1ZDw4x
+2mOvb389np9/P4sa5R8Ff9wy6ulPlPmyJR1wNdfRANePgP6OZjNDJVq+eOnZ3CgKtFT77z5Htpk
U5I4zZB2uA2VfRBAweE7gzJJ0TLAFFlDn70fNmC0RqLHf5wb2eunb19fXnGTwdWk9EbjTGEN1Q6q
c3eGixXRZbpFVvFjEWOhb/9+eX/6/S/MS37Vd68uC7iPms1tql0Stynu6TJh9NkHpM4+pSv+w9Pj
90+LX76/fPrt2donH0DwP81++TnUln6EgoglUqMbsQJ39IrXyJqf2IHi8ZQ/gLhhqX1jM4AvDmCQ
OijGxeTa8jBjCPTWJ650nWA9A5aVY25lLBIcGQ7MMWIDO+1U1LlUclC/nqB0Xflgaes5JIqbUFEk
Hr+9fAKbMzX4xPwxaTvObm57mpsypTZ86PuZKkMe2x1RXZFQbH8rxMNpXNtL3Jqct4HqT25FXp70
gbyofS3us7KgPmVFQ8pMRT91ZYNFPwYmbs1n8lGRd3GVxoUfbUWWlbO2vMat8vaReosjf/n+5d+w
bX/+Kram79PiyK/SIBkx1AYkWZwUYklMSOX3yZRmuV+aUkm/FartiDWiCATDpLxEkeM/JZm1RBZk
krMjR9Jt+cj3x9Kf0sW2gDMXD2nSTOMcqDV88j7WshDzN17Y2oDXF0UAG7TOZvBttCZ1GCBTfnc0
sXSzQkwby6O0ZJwcj2Q2+nIuxEcsH5+ZrVfWZkdk96G+B2ZHPdEwXrBS7M7WUlTwa+SBsK8ik6cd
V8rkKVZECjc6LwueJAcPyNZWtWAr5Ke4VfM4t+c5oHJ5lBu/NNg1gL/ER19YnyRLbps8Sq+B4MRL
NX6SbZ7Y4HHVljcrk9N4barF1SVRUjMzRBXH3gQ66racdlara/QAUOdgHNIFwtoJLJiYdcgFjAAq
mx8SdVcffkKA9KGKS4YqYCxpEQyNbp1jwxrxXaLTsgaHIeDvUwyeE0xBoJTVLvUQARWShnhGE+6U
tcgsVLnzACfRo8PlJm6xN2kD+OIABLE9vgYqqhn0Pj8mlC8cH9Hws4wXRrH6mijud7vb/davWrTa
bbwWgJ3kYOvead8D6N1BuyOozkUBH/S7gybK6VuOKI6lgWhXOiXwz5yLwexYs1719KH/cxvTegsm
l7OYC7MERV3TL6aGIG0P824Zqg/w/O4DfL+bxYeamKRtXYJAPUkvdAng+hFmPggT6DcaKUz6cBA/
6oGWB4ZnJBB9BPqTjgYUTScXse8jurqUmXU/1CkB6sZwMeMiUOhpEUhH4yRKXAQEeXxoka2YhLaO
6xtFSr79AwYZYyiIdH5JAuUUpDGyWBKTJzTcWDiYlxK709Sl++XtyTqSprmS3qxu+kFcCql9X3Aw
5QPekZuTYIpwqI6O5aUcDEolKuH79YpvbMG6OE+LGsLeyTEH4fSEO4mzubAuP3GT8v1uuYrtp23G
i9V+aWtEKsgKSfx5VvG65YLxL1Y3pFNhQ3E4Rbe3ZFpZ/H5JT/NTmWzXNyuq33i03Vm3R97GnvBr
vIkHldyV+GXgaZ6RbkMvDUQdsCSxK308Kf8TmWDjSl8couBik1ht7BZrMLixJU0tNb6M++3u1tKz
1PD9Oumt00ZDWdoNu/2pyXjvpciyaLnc2LPWqfHYrMNttHQWu4K5AusJKPheLrjvzraq7Z7/8/i2
YK9v79//+CKj7rz9Lpj+T4v374+vb1Dk4vPL6/Pik1gqL9/gX3uhdCBBJFm0/0e+/kQrGF8Ds0y9
cYCKeAx3u6YwV2f2+v78eSHYqcV/L74/f5Yho4kIM5e6CXKWc1lMOQje/3pPLewsOVnLFDyHiIom
tfdWJjFtx73HMLOI4kNcxUOMEkF0O/qqhvYxJEgRjMU0FdSHDt3w/Pj2LHJ5XqRfn+QISVWvH18+
PcPP/3x/ewf3JYvfnz9/+/Hl9devi6+vC2BT5I3eYuAFbOjF9UC6K0FlaR+kHAPFOdww/4ACFEdu
cwByRG+vCgI5UHvqiGwYxaEJfDJ/cgsKkZjcr6ExEJvNuGpFVYLYlI6HJzUdRW89/f7yTQDMHPrx
lz9++/XlP/i0GZk8/aJJqaVMVZT3sjwfB1LMH6sgQtJrpUXPHOobJqBYDIPye030W53nhzpu57tO
X4Znag5WctuVdd45TXJ8GRtsnCXbFSnBGikKFt30azJxmd5uZhMnZbrdIJ3E0b9Yy0BtYCbtqenW
263foJ/E7tGiSE9mfJntiWBsf7eLbldEv3S7VUQ2S2Lmalbx3e0muqGa1aTJaik6dKBddXhkVXb1
q8YvV/wMNSKYjJMzz+EXu1USLW9mSudFsl9m263fWV1bCo6GatiFxSLffna0u2S3TZbLiNx9FFOr
Ir4mnOntlAptwxnsdbbMlKUy7orFjAEV/sKeviVEP2faPSnhoQ1F1ktXaPH+57fnxd/E8fm//1i8
P357/sciSX8QnMLfqa2Fk7FdT61CdlSHckr+OiaxVIxHWHJyWjyytA48kY7HnXCDElPUxyOtyybR
oPWihHdoqDrDUrw5w8QbRg2MuDCQYCZ/Uxge8yC8YAfxB/HJUxLqpBrR8pERudhXqLYZC5viDDsN
/S/cbVelgTFt7hKOrl4KJKMfqUBvzqD0x8NaEXltAdxG4ci1rXKu+pVPY2ZVtmJ4TZh5tr4OYtX2
chU5VTo1tiGaBAnqvaD2odQQxEno3FLoOIFCQyMUs+QWFaUBcGhwGc9NKRHZsec0BQjfQEZexA9D
yf95s7RDHxgiFQLbPAhQLK4mVLy7F5sDYSFy7D+JQtrsqNVNVHS2ucbu3cbuP2zs/q80dj/bWI/U
bm6gV/az7d5/0G5nFrBkTzMJaqe/qJnlwdx7loUBVrHIOm93Ky/nklocqh7gGEMsTH8Wt0nJ6acR
tcuKIlfUZl2KW6s8m8QhrtxTT/cPgyopbnPEqnuvdaExCKJPBDdEQlfQI6Apxo/ZP6PVjko1h1/5
uYKRUdfc+/vUOeenAJOvNxRx9w2E3JbFPbSU2ovY4XMku5aAmp7GqoYVo/WzNCfQr6N9FNx5cqV9
5B5aCupeJSXumAaEmupca8gQuRJVgZtX9xysGOhYeqU0TfA4Y2XpZvIza4asaaKttw4kisNTYdJR
E1d1YZe52zx/KG/WyU4s71UQI+OvqAcU8EoqL6VRiNb4DInFJTXaBqhgbkqK7cYd5YmmDMSo1v0f
bOW94HhYAu8PfnffFzEtVh2x9GldNAHlQDX5kvX+5j8z+yG0aX9LmWNJ/DW9jfbuyKi90Jsv5ewB
25S7pS0BVVxEHiN5rgRqPU+HYTllBWf1ACvRrc7Jm3PpaWjTeK5fTiBm5ddZiqwMjofAxsU59ng2
5x4xHmO2Zg0IPlx1q1iq0DgCFABqt2Eq7AfSOBZI6SmdbgKgG+ytQV0VLC2rf7+8/y6wrz/wPF+8
Pr6//Ot58QLxt399fEKCP5lbfCKFVyPO1tE2dQRwkl1iByQDADodkvPCgYiNKYm2q94BSz5P5uMg
OCtWyMkEEp1AG5/cxj/98fb+9ctC6g9bDTejkkKE1dIdunuO3p1V2b1T8qG0r5hwNSArIMmmEuWo
geAA555e0YFkYDKwQUj3eSQK6TFJgvLiFFVdvJJAIs34zDzjZKhMjeJuT12uDuRcMK/MCyMPH4Xq
xHafGTFw82HfWk+vMH2KgG6qRAbMmxSy7WrKaYBCdmLYkCmjBje7bUBtSxIomVQo1+ShwXa/EioO
stYBueKpEXjbe3UCcL+iXRMb9JpOtXanm02hZVhffGDvAI3QDEMFn3fJisKBVlmXZNi8QMFZ9VO8
pl6eFHqUitlQsWDw8lJQwSiiZS6hSip26xLDpgDeZTEU7K4cdl7BU/LZSi4EW4KiIPL5F9wyuSMu
VthW8gwY6JcX1rRUaCXndDISi82BXFl1qKUvGbXGWP3D19fPf7rrzNoqx7m81CwrGlnd6c4IyiEi
lbXNqHhpZqTmqr9/1kZPSAXx18fPn395fPrfxY+Lz8+/PT79SSlaQvKwZFvm7t2QUl+4WKY2fgAf
4/ZqFSDgkhD/p2ERUaxBLb0cNjdbBJt8j9pQyfKiGg9JcQZjT0s2o+w9nG/fAEnDtZSPz5neKkql
eCcu54yDF56atqIbtU2oQdVv+/jls0vKgSm/8V9sGETHsRlHgDVYDgUg0Ku0rhSggwCqlZOiwvTg
CZnSXKQWuckk1El1aIj88jOngnuAz5RFtN5vFn/LX74/X8XP331RdM7a7IpigxnIUCNmaASLSqwI
cIWFFRO85g+4reaZdK5+1jQGC2rYgLSuZcD+WRvjTc0oGbYN1uNN9eq5OmYl+KxDnHALrpcCakDl
TGWUxZdCI9MtgHcdpQIgUSBo5kV8QTo2E+ahoqeMpDiRAlOJGu89ytTk5e39+8svf8CbtFavjq0I
TNQOdrhZkwUbd1gHMZ15Th2ZhsLRxzHQuOrY/ehDzMu37G5v1tQ+PhJcdrtsu9wuHVsxQAEnAAE/
wWGY5yaYpNpvbm//AgnWuyXJdrd7wmuYqq0SBvttNcjhWNSHuJjrzZInyZBnBev9Ph2dwnkl3Cfx
bs65Glh5ddndwEvm152LMi1naV7mNj6ga0GSlsgcw5BoVny48OR23fd+dRyC6YpoKRH/1Ylu8s4g
4iLSiNXqsKixl6xK63ZYixkVXBOaJk7jxjPMIciOGbkp2SRFnLSiydhlBC9YQhv7oqRdhsI0JhlS
bFLfg7iJQay6I0QBtDXxpXpMxz2HIib3Mv6ZDEaCaOxwoGW6i6IIOtvi5WCfXa8CXR3fn2GfCFvi
Grr2466GIa4/6rFzW7d24CX5PVSH3W7pbDQ6hXJVXlv2i4eNdW0XH8rmEcJey9g8iBBwMtrQDN4C
JCUwkzZJ1VuncYJGV47o2v0eTle0G0IOvfM58FYZYJrJ9iCYuxKrZAtC58tNJWHKd5Hlmng6WAAt
KzM/JKKDwezPztfzIKlJtXngRzMhiS/sHHJ/aWiUaNBSgtOywi5Cp/oIHSLSEtvg10ROGwp2yX0o
Co5nV1IwjFYV5eIm6WRYIKRxK1geVrFx3yO7LK1INtTKOM2cArtzwZDFzipabnoPIPZxK2qjk0h+
DuWVeSBktKJglaOrNUHF3BIHs5j0sRszaWpgtukpLRJ9Ux12G+uKlJb7aIms2URRN6stJWexuwhb
rqfFyvoSvGcKvuyRqErDvBcBP+9M3M8ye/FmK4cPVxD4Q7+oK+SaSFJAHUjfzArP7x5O8fWOnG/Z
zzjauvoeqgae6Spx5oE/yAHvZFZyCPgGZvL2rYQXQ47MH2X0+nvvmAZwf1QOlcnuO7K4QqIuSJE2
cYyPJYBCBRPDpVAbybGujzMOzDTV6RxfM4pBt2jYbnXj8joGVXXYC3pGG6NnUkjh0C3p2rHjIQS/
5DSmDyURiEAhm2Dp9GH9U/kBK2SEeROTdsFWS/zuiCw04TssqwYknKcg87KyeLCfBsWX+0xvV0jU
Jq7qHj2MF/1GTB1K7gIYN9agBIaqOKZQlrR/WvAbldMXBHJcWUlY3hxjIuVgR5uW0KwSbJRtuG6g
bV/liVPnmwEMZslhVMmUbTrdJl0D1tTYvclYX3hvDjDPgoZfQ3d5gcwdf4tmpMQVDS+jO75zQq9Z
iJtI5GVJjeFet9v0ro6pU4C8A34whYGMZ/Y1S97olANrbdGP5HgeVn99UM5DaxchvqLl0d5QxYWv
ojecKu50Bad2KhBVJN+td9g+xM4q68Ce7gMOT/zb1lVdZnR17BspE5t79pcOkd16jxj21R3mpe0S
LixliDuSb6BpRps1TQnrOytDQV0ngX5QocW0X4APriBNVnGItW5p4tWKsaNyVq//8zmKO1QBQhA7
i/sETEUCHvLKKuvIVdSmttXxdrmh70RammCXt4vWezJ4AyC6unZpBWhoAhoRBt+dq2zorox3Abtv
Q7iLVvtA0fK5s9UqaFbbdtF2H2hbBepSNA5cNLaBkeJxCaLGj7gFnmX3H9LUhdipi5AanE3JCtLL
GyKxTz/G947aDuPRfvlhOSUZ4RbVORHzOOs9h7MG38mt8YNMzkgH7RQ3zUOZ0YFspVgXS2BBoYd+
qK3Y+YOSH6q6gce4iZO/JkNfAKtp3RFGGH6wsjLqstPZjpejv0lSm4yBQ42rDK3C7TO+K2IvyoNO
T793WwRX9jPaPtX3cL2JbGHHCF1j/lLDwfQjZW2WUCeSRcMqRRXIIq5Cfm11ZUenSWNqbccX9yy0
k2mKohDdjELs5GmKDrg0y2kFzrvcDj3MGtvwCCQ/Lbg7Q0t+goo7VAtheUEBh3yGkw5hpE4sEjtK
PwYOBJ6YKobaoBCsO8SVpUtvMhggDJ+XLUClhzzEdtlIuHW2GcmMIjIdB6nPWqdsJV1xipZFYroT
A43EDK0fiWDN/WYZ7X3obrndOPlK7qhkrPTaUycg+ww1ozuJWzYeNwnvm4QaKrHqHAd0ALCEMvyq
3o+UTTBjC/Fp9LaIRxWeB0LepKCdeXqgkWXq4gxGS0nlI5YdZkc5KzgEkolJJTW8VdUn4O5WA63X
21K5m3WabYSfHvXNJoJHewe62+x2kVvJhCVxGgdbrWVXgSakYrKZ8qeduQGedOUWBOAu2UVRKC9I
ttnhWkvg9pYoYLvHwJz1WYpBLGkKsV4wDK7zQ3+NH9wnxwI0sbtoGUVJsDeKvgvUXt+Nce0NUPD+
bm+oC1GwoOlJK1DciO8ip0xzw3FLrKQgLvbKNOhe5AVBd8bJZ7247pbrPljXe1Maxcvqhy00BpqH
c4CCeTMNthY2PFhhSJdFyx4HyMraWCwPlvBALcyTFcpIH05HsV2sWvhtPYoUdmCl/2Psyprj1nH1
X/HbzFTdM0f78siW1N2KtUVUL8lLl0/sOXGNHadspyb595cgKYmkQHUesjTwcV8EkCDQdfqPy4bm
evROIMpo5TrRjIMFtLrrtANHToPt3OIYk/FbEdFLTdJi+nfXDZ2Jg6BauKkaK5dYL7aBy009jDtz
9QYM0ydoxQMK8d12//L2/sfb4/3DzYFupmdvkObh4f7hnr9OBs7oGZvc331/f3jFXnyfDDma806P
NTnfgOnC08Pb283m9eXu/q+7b/eKQwjhMuDb3V9PeiXeX27g5bTIARjqV0JeYl7NXqkeKuUrcXNG
i4RnhLclt0W1QVn7Ey21kT/WZ7ivQwpjjQgupuLIxBsjA/iMrHpqLWmOaixHNTLDkW35m0rTMEfa
8jBNvuz//uPd+iSTexVWN2n281IVuWbCIajbLThEMh0cGyBw+87avoKg3JfybU0sAZg5qCZDX55N
EG/P4e3h9Qkmw2RjrEkYMn17oMV6PT60n9YBxfEa397dNve5IuVt8Ym/C9dO5SSNiUL4vqAAujBM
cF8/BghT/mfIcLvBq/CRfYxDXPXVMPFVjOdGVzC5jODQR0m4jqxuby3+gyaI6QIbR/BJagnRMgGH
jESBi3sfV0FJ4F4ZCjGXr7StTnwPtzfSMP4VDNs3Yz9Mr4AyfAXPgK53PTzc54RpitNguV2cMBDe
Aw6srxS3dkA0g4b2RE4E/yTOqENzdZK0bFcJro2rzxbPlTEbau8ytIdsb0SmQZCnKnD8KwvhPFyt
eUY6kBLXQUbgCWR0ByYV1ujZqbJ5Kvom/Lx01ENIF1KpUUNm+uZTjpHh0Jb923UYk0k9pBs0p1kI
k0mm+jHBBBnt+xEWOFu8Hb0Xz7L+xC/AKq/I8IeASiUKUGJKywXNXBqfFWjApRm0bTOQ0LM92lrZ
RiPzFYd/AiBiXkLxKyBQU41XagYi+0Q63PRI8KG7TIM3A3KkTMMma5lYN2vZ1mnA1wuacSBNrn7v
IdA47qFOQHhoa9wkRAKgZynTHwt855Prp7QESezrMljc4AmB/e71njuMLf9sb0x3DIUWgAfxI2kg
+M9LmTiBZxLZ37rHSUFmIhnIAs8GNYO1alKrcqPtBYIqIuBoJKnmnTt6QbKRVnaCM+s2omDq1UZo
PT1tn+EJSQd1s6YTH3+1LgfRddPvHakLvYNGyqWhTKBaIi9VgICL+uA6ty7C2daJIyxVpbKDDf3s
UguR3YW0+/Xu9e4L6GwLt7BMb1R3jiPWj4emPKfJpRvUg33xIMNKZDP3wPZPL5xe+1bcgzhY8Ekb
N/E+7+H18e5J0euUMSCVcPGaqZZ4kpF4oYMSmWLDNvaM6fg5f8fSqsElVJwbhaFDLkfCSKaLFAW2
haMoTOFXQYxEW9USR6uQ5o9GYWg3rSqjOJPeVp+6aJhMhr2eV1FNfzmQnrUqwLg9G5qyLtYgxXko
mrzIrdUgzaell3cUSmhXsME4QmlXqs39IEuPj2heeTFABB+GuFpsj0Y20oaWVtZyLM+T1fwHL0lw
8UrC2i36aEo4Fn359gdkwyh8AfDjDuRERWYFfVeVA/oyQyD0dzoKUZmcZq4fKC79STYtt6XFu7dE
fFzl0ixrzhYvECPCjUoaW6RUCZKb/4eB7MwpZIFeg8mPDfvWXM3QYjEt2X2HR0aVbDCPq7prZXBU
2cDrwGvQDO6GuVv4cldmbCO1uCsRaNgqPrs+rimPI9CZnnvGN/X6xmxMrDob+mpxRSaZjXA7lduc
AnVMCik60vWX/ZHJ/iDWWsK8NZedZYo27ee2ttxSg4to23kod6TOZnaDi3b7IwQX3+DqpWwevJiz
hSGa/OCgR8TAUG8Cqw5bnF1nO0qSnpNlGlyoZMoaE/WavLIdHHb1Rt6n8luWfksstuD7ExPUmrzF
bMBBdSgz3REvy9Twez0zbg3v6M3R5mCayYZIkII5J13gYi3dZfsCnhCyD1qvvyBkf9CAUGz5V58M
L/gjjW3a6HJYilBqlaGX2NQ60IH7/RIhIZanfUw1WZ6pqk+l2I8L17vZdtDqZLjKIJpCyqnsg2nM
FoUrLrfFbeuPp/fH708PP1kLoB7Z18fvaGXYlrcRsi8Pllw0O+0aRGZrix83s7WL9ZFcDVngO5HZ
CmB1GUnDAHuIqyN+KifwI6NsYDtaMvpipxPzQsUjtairc9ZV+I642oV6VjJ0CAi7lgZRGYNimhjk
6e+X18f3r89vxnBUu3ajxj8diV22xYiaYxQj46mwSY2AAA/zLJCOTm9Y5Rj968vbOx5hSSu0dEM/
NGvCiJFvdrD0IGrpEXAiGkZGRuItlE4sE9WZDadQ9WAEKPDqPdBBDTdX9MzJLMwa2YTFTJv4SJVM
l0uNFjJi5DtmA8EuLMJlGWAfLS+0JK/T7brmLePX2/vD881fEItDDMHNP5/Z2Dz9unl4/uvhHu7o
/pSoP5hYCR5q/6WPUgY7m25dIpYDLXcND8qjm0kbTPHi9peFiwUINSGo/xoAFXVx9PSCZT21vPiG
JJxIiSCeLfZ5AORtUbMFbGw9ekQMILWLo2Z19mQEcakDnP7WPy9HvR5QF+nAlPZYcqEXP9kX5BsT
qxjrT7HK7uRtKrq65hAfWokDaemFfW0X06V9/yo2J5m5Mmf0jLfSnZWyT6B7gtFSPFohZ8kpouMr
Hi1SOFa3zXzhX9A86EIgsL9dgVi9jStf3qnWvmYtnEEEUEaTAbnRgvLTNQTtUEdNTCib59GeKmr/
nrsKnb/44oCPloavj5n89AhO3pUYm9xDF9GsF/TQlR3iL0Ls9B0d88NUT0gowmdcbrl0ZRHmJxQ/
4cHk3hmyjFkz8+S6n6r2N7gQuXt/eV1+ooaOVfzly3+RcItDd3HDJAFfGZlqiqbRJzdYquGBMNu6
gdviphjAFwy3I4WmM3Wm7sBfrjRIYMuMLdz7R/DkzlYzr8vbv7XO08sr8yHxOh/79i2RmfZIe9nY
KeUkx0jCGCpLMi48+roaY7FsNLFMwYPwsz2wZPqBGeTE/ocXIRiK/A9LUJaNNVTWilA/9rTv8MQ5
d56D30eOkDrrPJ86yUr+4I/Q0KhGztkNLdE0JshQb1GfUJLfkapW/WSO9P42ccIlWTxC0fuTNwMU
BLLEZzSIKzdcJuCMxMZQH3HAMtLMDyWBfT7pAF5qLlVZM4EydCcPs+12VOWNJGX/UX+jKMbY1Pv5
15n7OkZ6jjPHCK9aCeIC2pl1lIfnl9dfN893378zkYZrGIuPF08HzubFO9dnjS6OfwziGHtVp+Yn
0m3UOcipcPBqa8J2gH8c1+jqeUWoDhY0QG9Rljh3X51yI0f+WOW46KxNEtH4bFKL5rPrxUbrmMCT
nM8mlpKahLkHL0Y2ByMFhFxW3YJx4iS8aJ0Mvo2km4VRM7IP3CTFcurDz+9se10OqLRSWXSdpJvn
vTqk6cwROV061U2YMtfMweNUb9GpgmoeRIsbIdBCfWyLkOxtEi5GaejKzEtcR+00pFPEKtjmVzqr
Lz+3+ut+Tt/ksZt42M4o2WkYu/XpaK4EkjphaBClFG12Yb5cXtBXcRQ6i+qIndJWG2k0segnyrJK
okVmnOG51sZxfup6RuWGj/U5iUyiMLAwiz5V+kstTj3Vie+eF5OAkdM0QEVNZPim+CGrw7oZEt3v
jZxP5YUHg9WtiwxIITBeYFS/zzPfk/VX4h0v6qcvut2uL3YEV7HEmDNB5aAY1qqhM08unE+OW7r7
x/8epUpR3zEFVW01QwpJmhs9tVrbZ15OvSDBbmlViHuq8dSWnXcG0J2mCCH1VdtBn+60mDwsH6Hj
gIOIWusEQadw7rkkQ6NUcUFnJEZbVBaYaudmOFoMqrqD1POIrNl7mHyqIoSMgydG3VDpCNdSJd+3
5+pfsh5TKnRUgufMpD2cEasuHXWGa6tLUjiYs2Yd4sbIdJLTZhLduLMXctTUNP7UNOssShZPwV9f
YrIp59JD11WK4bxKNR/nd/CUBPjK1ijFGJJnlw0Z2NpQXiuIbfAC8+6gma5LBs8LvxCBMMB2tizp
kiRdnUQO9lkF5XYH/cVkASfSRmdMTbIhSYMQu+8dIdnJc4xIPZIDgx5hc1cF6F7DNQ52ZK0BNK9N
I6cqdkzcPOIWmiOIbvBbprFLbHzx8tvOH/PffPRiPJLP1OmgkZ3RPucc7GqIM+T0+qVSmSC3PRRM
LSUH/VJhzJPJEm7MPsIrPSohikmRxtEc3o6NYDIZmzm+dh498liqJHWwfW9ELMSFkVF1SezFWKZW
Y7W5VD5AK6VWgx+F7rJQaGUQxrH2NkzyhHFEK0FRiEkMSj6j2Ib1SJosGWy2BG54xkrmLMv7ZxXj
hfFKnQAR+yFaMhMWkbrSeuMH8bKXhByJpZCCZIxNPz4v4Y7KS9GLqBHXD6Hj+8u8+4FtQkj1Dxl1
HcdbVpOJ5GkaKvcUwuuY/vNyLLXgfIIoT00NTxrCtES4k8ceVI5xRfM4cNHAAypAE0NmTu06HtY7
OkLpBp0R2RiptTgfty5XMW6MTSwFkXoBHmI1HyyekHWEa00c4SaECsIS3JWzMMdaE4L6lqQ0iyOL
zf2EOZeXLWlAGGfCNW4GPOcHFlprNRnOHdoD/KYevN6tJM5p5DnLUYcotR6eKddIV2tchrcXUuMW
vCNmG4d+HNrs0wRmhx5Yj9w6c/048UEmwuq5q0I3sZpQTRjPuYZh8gduqzbxvWX/ySuxZsnZl/vI
9dGZU8KJk+lNcIH6kAU2uyYBYB/33vW8tWXDvW/rn/mJxXfYtZkvEPGyaZLBrSZwZopMNTA7cEMX
Z3gusldxhof0OmcEthSRpXAvQic6fKcjJ1qf6hzkYo+zNESULIsGRhpbSvbdGFXZFEikBRLVGD66
XXMW6i5KQ4RIN3FGigy5qCo2rHXW+Q5WwyGLwgCdeXWEiXozO/aRAaxjbLzrGJufdYyMQ1Un6GqE
R1qr1UlCS7K1r11Vp5bS0rWRYWy08Wno+YGFEWBrijPQijdDJk5KSoqfLk3AbGAqF7L8mo57Y1gy
+LlrqlSnqw0LrwlZ24z3VIHCW/0yb8AnwLZYVqPcMCV+u+0owmpod+jBZxvK7f3Qwz+HjAU+Pda/
h31Hw8BZFwlKWkUJ+6KtTgKPqUqIjMb31hgVCSULrK0OleXYUMH6Cbbhyq0QmWhid3NsG6jnXN3G
GATb/MXGgi8x4AUBqokqkCRK0B7pzgXbstcSMzUkYFosMsMZJ/SjOF1yDlmeiggbCMPDGOe8K1ys
kM9VZMadG6t+qkGoWJ1HdD+4a6uD8fGZzBi+JSLajMjWJ7E0x1opvmBiW+AgexljeK6FEcH5EFrn
mmZBXLureycdBirmGJK+jqJVKT/PXC/JExf5cJCcxomHK2KszsmqIlY2xHOQeQR0/aZB4fjeap5D
FiNLdNjXWYhOp6HumGq3OqAcsvYZ5AC0DxjH2PMQACog1F3o+liWx5JESWSJ6zVihsTz14o9JX4c
+zssf2AleERKBZG6+bLSnOHltlzTtT7kAHSnExxY8xazDQVYsd1yQD5eghU1eIv5ETGSMZcEiOqk
TRDYaiJDSfW3vSOvqIt+VzTwyAwOGNvtdo6Iq4SnHeGmNbfBPvUlf8YJ0Zk6i0W/hI4xLHctBPIu
usvJCMy2gt+Sshdvm9TTQgwJTwzB6UW2lvX1LH+3koADx2j8L1tGeJ3m8z1utiQTIGXlxXHbFx/t
ww3+ubnTI6wCFvfe6m3FmLF6LUGGbJ+3qD9jumFTh9JSC/LMqNoPeBejRivgqbKSBxJHU49cI5e8
bFfSjGydKl4/TDEP8KQ6COXpJj2brCZIXkCeFzQHiQpDVMkZPZ+Vqgj8cmFC0BY7XOH8ufpGDce6
g3PIrG4WRStts+Yt77rmdw//+fHtC5jqLX3NyXT1Njce0AFlvFYyqNSPVZP0keZp9zzgM0GYr3j4
sThPRgYviR278SsHDTXTNuB1WIY+xZkx+ypTPc8Cg7/ed1SFiVOXpiA8F3HZ82tJ01+pAN20BZlp
+tkM79nJqE1rGCf7mGg0cVWDt4mYOmhOKS5m8IGAE0UfN/yD9PzA0bME5ZkAiwYANcJLndj4BZ9k
uyGmIwBzR4aCRyOEE0qj5zPXP5sjKomy77Vy6s6LUMe+wNyXEROQeCeprWNS+KUjtMwwmQKYrBxh
ZT8lqTpGRV2ZA4fqcXmg6PIjjTz7mHwgzWe2A7R4fAJATJb+Wjp+k+zY15zg22bdeA9tTvblpZuk
x3GEHoPObPWwa6bqNk4zPbVPGA5IglVAkjrxOt+zNV3c+8WLlvPLQJ04RH5ktorR0mUHFc3Wczdo
MGfg98Vw0PNR7mrHBSwp/BRe3WFHuuVbwPOf7J9U4nh9p1W1z8IhRI/jOPc2cRK9pn0TDpGbmPOP
FpnV7z6wyyCOzsjHhtahroBOxBXfJwC5/ZSwyWnfhixOp8nmHDqOURGy8d2ZOGUjya3FRSEvhalU
1jYL21KtuQMEQPf98HwZaGbcrwC/6vx0ZarD3XuCWQPKvKvanFfCbnsWPjsauY5+my1ujdFzG8GK
jZk0mSsiVNUke6IaF89jZVljVr5OEhGipwhK1skia6AnlgdpEyBFG6ywPaQhjCplAjNDtveiurE0
o1hG9thOLq8u5IDv9tI2E017qlwv9teWXFX7oXpdz0s0zU850bAWBdrxnCw//Ezj2Tdkh9qKc6FJ
Wuj+QohYt3H5xcMu5HkL69B1vEW7GdU6ctw+NV4mgb3cOhsYO0Bj5kimb26k0vgLaRBwQmdFoBIG
tMa+3O5rYcR8PpsZjjwmptlW/ZzcW6wEOoCEgx8syt1ra18mpyxP/cDgq4+CbfrFWL3pZHxu8EQy
TfNmhnCVfGyrwbhHnSHgEOAg/ELQg+2F1gwHTZ4r8r+bgIlDO9sGoqFAaMLuFWYQKFNJFGINnfQs
tI0kD/0UG3QFwr9P88JVOHLRVXnrrvHZ7ABLSRRi6Hs6R9f6FN7CPA4BjdrZauOQKW0wLe5TVJTU
91YLMh8CaBxPffdicFy8C7akCf3QYsgxw6zSzQwRWspvgY6hxXXiDCxplfrOtWrBZZkXu5hdxgxi
n5bIP+NDAxJMfK3SHITdLKiQJPbO2LBwqSC0lC6+cOs5M0wUR9i4KhoPygsTWzJD49F4SRSklmRJ
FDn4NOIqiEW+NVDp+ha0UGbMiqsff4On3UabPA/vDKmT60/rdX6c+Pj4ATNB75xUTOeyzvbQwrsw
cPFqdUkSpmiFGCdCZ1rdfYxTDx9Wpvjp1nE6D31ToENCy+YmdMrV5NNzTCT5qCCuZ7A9fC60QC4K
75gkToS2mrMSe6oUT3WqMTI3/dffiM9MQ/NUGJP+uWQxUQjvE6H7XllLtNpBbBtMFFRATO10IoLV
jLESLzjjyxnut102LVYzV7QzlOeJ8wc8e1gS15o46nO/BUswQ2oTlFq2L851/Wv716geXi/Jc9Hp
oChrWPYrToUVcdK8AkQw1us8DSKE+zm59Uwkk8cliipQgD8WoINEJrw9TRkd4KblUNEiAQRaVYD0
pGzonuTtyYRphcwFYORFWIiRu8n7ox6KWj5fvn+8G1WA91/f1YdislGkhgNypF2CTxpStUzdPY4Q
a83B/9vABP8ZusytJ/AmEMnJwNG8/w3U+Lz5N6D8zQ8Km94LL3pqbN6xzAse72kxIVpux1ypA5If
N+Pk4SNwfLx/eAmqx28/ft68fAeNTBkCkfMxqJTv5UzTbzgUOgx3wYZbD6AsACQ/WoOSCoTQ4eqy
gb2XNLtCOYLi2W8rQvcQQ+GSsf8pd+uCe2ravFCfb2JNVGaf4q5p0QFmP0L3qVlbc+D5549/P77f
Pd0MRyXnqT9gJGojAIPC0uKncSw5s94j3QDRNtxIZeWfGgJ3NrzTtCdynMs9eNGCO6q4VC2l8Fwe
nYwAP1RIZNupxUib1JU83RKKDpC+l/7z+PT+8Ppwf3P3xnJ7evjyDv9/v/nHljNuntXE/1A7SS6k
rFxZ3nzabA5bzxAbZzqfwQi9LupWtSxUUtSkqtop3sv28fUBwqXc/BNCmNy4fhr8awzqshjUbdkX
+XBcW8bqS39Buvv25fHp6e71F3LTKja6YSD8RognIj/uH1/YdvDlBZ4j/9/N99eXLw9vb+D4BZyx
PD/+1LIQK2s48tNCc80OOYkDX/MuMjHSJMC/gBPCZSoE9m2TgAKiPISLfYLTVelYkGva+YEeDFAw
Mur7qAeTkR36qoX5TK18j5j0oTr6nkPKzPM3y6IOrE0+apAt+OxTHcfhMh3QfUx7lDtj58W07s5m
T9C2+XTZDNsL8JR3sL83wnwy9DmdgOaYU0Ki0U2EzFmDzx8BNYvlph27CSbcqnzf7GcgB8mixUCO
nP9n7Mp6HEdy9F/Jp0EPFoPWYV0LzIMsyXaUdZVCdsr1YuRUZ08XtiqzkVW9mN5fv2ToioOh7Ic6
zI+huBhBxkXuTHmbAIv9sfLEO0MfTWRMavbMvo/JxwALGoRmYYAc0tFJRvzMHdejbM9Jkss4hNqE
kfll6JKI3oeW8cGsh9ifiHbU6mwe4G3g7owGF2TZ9/dCjpQ3dhP50YudnUlNEscn5gikU8b+CrvG
ML+2g++J0S+JH0r1kyL0piCKprEsQaYxP3iBMWfJhgAp+s8v1tETKa5iJLJ6C1oaCJaoPTIHvZO2
cviWczyJw3LqvXIELr2TNnMkfpxQrukm/BzHpAyeeOzpdwWU9l3aUmrfL99g+vrf52/PLz8e0Nei
0dCXNg9hteWmutyNQOwbBh3xzVUz/jyyfH4FHpg08ZyBzBZnxyjwTlz+/PYXRhf8effw448XMF3m
z65OoDVo1PFfvn9+BvX+8vyKXkKfv/6uJNVbOPLJ273TzBJ4UWIMZuUG0VQ5jJTRstzxZL2yUZSx
LE/fnt+eINsX0DVm8INJOtoxdGZZGuqsYmnbUsiJBUFoChSrBs+lX2pIDLSHs5UhoM/oVoaIOipc
4YSwOYDuv5exH1AnzCPcXL1wZ3QUUoPEnDqQHm/NHIJha+IAhmjTWmuuQfg+w1aFADYmw+Yaar6M
Vu7IruUEHJitE4QJQY08+TnKQlV2+RdquDM0DlIjihpRPRSPFoFGTcjvJpbKu34c2A3WKw9Dz1Cy
VZ9UjuOSZF9fwQiy6xrNAuQWZlJTngHoHfLu/4q7LpXN1SGzudKFuroukTvvHN9pM8uG2shTN03t
uO9xVUHVlPTN85Gh+xDs6i3lx4NzaAmdJDHYp2CAd0V2NG354Bzs0wM9J+rUoo+Ls2KY01OvmJVL
oJkrw1mVB6CSDYv4HPnm+Mofk8jd6Z0G1NiJ7lfVi6aS57gM/vr0/TerTsjxaMVYBOBVktAoHZ4C
7kI5N/Xbo5ZtmakrZzWrY+pqub+MwdNHlfbH9x+v37783zPuWgjdbKyuBT+6JW5LY191xHCpq0bQ
0dDYS7ZA5SKU8d3ItaJJHEcWsEiDSH0mbcLUEkXmqnrPGSxlQ0w9YzRQ8vafyuSFofXzrjpRySgG
wKRv60hMQ+Y5Xkx/fsgCx7F0yZDtrFg1lJAwkPaFTDQydsAnNNvteOz4FjQFUyYMrB0mRIH02Cez
HTLHcS3yIjDPloFALTcEzXJQWyAyW7Fz1AeRalZgk73Xe1UcdzyEr1has7+kiaIP1cHquYFlZLA+
cdVLBjLawXRpPydYutl33O5glc7KzV1oTnKjyGDcQx13ylRPTEnyXPX9+SG/7h8Ob68vPyDJsqMq
7k59/wFr5ae3Xx5++v70A2z5Lz+e//7wq8Q6FQM3I3m/d+JEOrueiKFy+2ckXp3E+Q9BlO+xTMTQ
dQWrsvE50mnFK3awYehYLt4IOI5z7msPG6lafxa+p//r4cfzG6zNfmDQHbX+6vZ3N1Ce/xCa597M
y3OtikwMVG0nvarjeBfR55IrbpYfsH/wv9Jb2eDtXFfrGEH0fJVY9b58yxRJn0roUz+kiIlWu+Dk
Kruvc1d7qkPZWVYcy+OAJVlCL5MkYdlMn5AH51MPxU6s1R27zdFcns7MXmiXv2vB3YF88ylSTzNH
7jrqDvQKjt1j/YDIftDKekn1d+NrR1P7ZisaUWJglAwllbwOJ3LnoB6NJDDK6KsKQrD2cZi6mhSN
LS6MlEWg+4ef/toA5C1YMLbsBDjoJYS6epG1iCPqETItr0emsZ/rTV/CGpb0QLhWdGcUqB56fRSo
gzHw9Hxw5PmBTVhytsdOqPZqLWZyptWD7SMkk9TWoCaKbSPVyxjd6SFxrAJdZK7+HRytvrqpPfZI
7oFSJeNPzfDO1c+hu770Yt8YGyOZ0qvLzBxrk1zugrLGg84mnzeVUUSzSVdsCCfOCbHlveHacOQD
fwn2ialUXCYftyR7DiWpX99+/PaQwhLvy+enl5/Pr2/PTy8P/TqEfs6EXsv7q1U/gBh6jqNNMU0X
uNqN0pnsWptxn8G6TFfs5THvfV91XinRqZ0hCQ5T/WsYnd6Yr3CcOtRxjJDHSxx42sgeaXdoF0N6
R+S6Ix9Rz5m5y7TFeL49b8lJE881xmbs6FaTmC49Z41LhVmouv5v7+erilyGTyttHSdsjJ2/xMeZ
D+Slbz+8vnz9c7Iqf27LUs8ASJs6ECoKk71FBwpQ9Vs5LtaLbL4IMa/iH359fRttH8Im85Ph9sEm
UPX+5AWaNCEt0csE1NY6OAWoCRPeUVb8SC9E1f/KSqbXS0L8YMlvR8sjj4+lfcwAKq+7xQf7PRjB
vmOYO2EY/Eerx+AFTnDVhBHXU55jmhs4zZO3OhE8Nd2F+6mRhmdN71EX0ESioizqYhbC7PXbt9eX
BwYC/fbr0+fnh5+KOnA8z/37ZjS0WTc4iW6gtsqZhXVRpF6rMO9QiMId355+/+3L5+9m5Jv0KOnO
6zHFQH7STtVIEBdvju1FuXQjey6HH+KgBewq6Wk+UvMWpqhhjjioyC6iwh8pL8oD3v6i2hmYzhWf
QuOpGSL9sJ8hNVfxXci74hhRvW3K5ni7d8WBq3wHcUtLdiVhgM216MaLMKDl1NKPDGWRipA/XLht
p8cCMGN0xzssinO8HFNhfDMrK5SbPv9HsO+1dgcCBou+t+kR3T40pVoLDJlJNh+mo+jHoroLZwxE
u2KT2zBMx0/QBCR6rdTfPDsVi6GCL76mM9MHmC9th4OYbgxfCTYfuXCYGDgrXdkp2Eyvh1ZsJyax
qt91OKAPd7eKOVo5XSVtDSvfPzdVkafkZ+VUcom7NC+EX1/lQyNVPMpqe0vAMWBLq5wOTohg3Vyu
RXqRPz2R5ljsWT9sXDebmcdHaAFJnh3U/NM3MxkZquqd8gnP8SU7nnpNlo6FNgauIJh6Q6XWCaU6
pkdP0xDYslnaYbC2U24JEbwwldecClGC+MehVIu2b7KTUbYpJK+9h9q0Lsplqfnl++9fn/58aJ9e
nr/KumNmhDkavll0HGaxslDznxj4hd8/OQ7MhlXQBvcalmtBEurlGpn3TXE/MXz34kUJ5XRKZe2v
ruM+XqDbypDKG1uLzmg8bLC29chUlCxP7+fcD3qXVuAL66FgA6vvZyjPnVXePpWf3yhsN3RfdLiB
ieftcuaFqe/kFCvD8Oln/CeJYzcjWeq6KTE+rBMln7KUrumHnN3LHrKrCiew7iUt7GdWH3PGW3RR
dc6dJMod+n6A1MpFmmNRy/4MOZx8dxc+bjaWlABKdMphDZjQha+ba4qcQmhs+1gLd1OyqhjuZZbj
f+sL9Aj1OltK0DGOPuhP96ZHJxyJpQ0bnuMf6NzeC+LoHvi9bRSOCeDvlDc1y+7X6+A6B8ff1eaw
H3m7lLf7outuYMT0zQXGbNYVBe3RUE51yxlIfleFkZtYtt0obvMCkcndZGfRKh9OThDVjm2LUEpQ
75t7twcpy31LNXla8QuIPg9zN8zfK8LKXfin1LLpS3GH/gdncCwLAypBHKcO6Cy+C7ziQB7Q08nS
1FbRgp2b+85/vB5c6qK9xAmmaXsvP4JcdS4f5CjBBhN3/Oga5Y+qzw2Cbef3blm8VxHWQ58x0LR9
FFnyxauxaTbsvF16bulM++5S3qYZPbo/fhyO9Ln+muLKOFi7zYCSmGg71wYzjN+2gOYe2tYJgsyL
lHWJppsUzdex/FioqnvSGjOiqLd16bR/+/LLv581TSdCreacqc2UnaAJe/gmGoWyvwZhSE9TKJBq
EeNChVExAZYX2rxeoQ10Yi166MzbAV9jgmm9jwPn6t8Pj3ov1I/lsvixGTRgWbZ97e9CQlzRoru3
PA7pDQ+VZ2d8AIxd+MNi2qPQyMESxzNMXiR7PnUpbERRN89dpa4cTqzG4FVZ6EMTuqBCNbzhJ7ZP
p8u64U7PWMOp43mCLTY+AzP1oaXDMEw4r8MAeiU2DB1M2+auxx3SJ62wH8WzKhidaT2EytV6HY1i
2bGWgubGmBUByqm7qdqAMkeDnEHR1+mVXdVcJ6LpM1EUqcva40UvTTXwA3UDVgwt1nVgNX4sZK84
YtyINYL6+T4/GALWuaTbjckEV7/JGVcJV6ZzpNdUl8TFgCjqXqzg7x8vrDsvW5GHt6dvzw//+uPX
X2GhluuXdg57WMzmGHJgrQvQ6qZnh5tMkv4/rd3FSl5JlctO9OD3vml63Fon3gtivgd8JFOW3fgS
UAWypr1BHqkBgE1+LPZgkioIv3H6WwiQ30KA/tah6Qp2rO9FnbNU8aMoqtSfJoToVmSAf8iUkE0P
k8lWWlGLRo47jI1aHMAmK/K7/GQHma/HVIlWe8A9KvT7VkhihCUyV5DICnzTLoWaHy6fsE16Vi++
IBUZ+m0Od25s5GEXiQGj5N9Wnv4b+urQoGqatJLWVNkNzFDPtkQABtU57UpPQRFA6+rfYxXv6WeX
AEIzuvQLDwAvKL10Xg1YBPjSTG097uajk0FlNF0ZdLpWqJFo8fSz4pqTmxWgu7VjVz0jJNmzEaiZ
iSDLWSjtGZH+3YUAiniUKvtIBPugLIsajH9bY898N96zjxdqy3llOtJ52KtpbCQtxPcSWZthgm3v
WFEe+5sr30tbSNZvAmxrHk4t/JE+KoU/DZL6Mnclp1lWlCrAuFYOoNx9crE1g6pbUpTLooH5lNFv
ywE/3zpqEQyIrynOiTQW1PY5waF1nTKumyZvGno9inAP1iK9OsNJEEw+0KeWXu3OWtXbytI3WdpV
o25V5reRCuo7BYvlSjp/VniyC+9lp8qopXgJE+hF7cbJE6I0UvfV/Tj0u0A+sMTaj+6vFFpV4FKs
qfTS4tmmZ7mwJYRB38CSMI5H8pGSDa+iydfCfOWXMlCE2tk/ff6fr1/+/duPh789lFk+v3s3DnBw
n0U8Asfn7yyTxgIiUnjxiboMPkuqFV+jry9VXsHRPR5R85UF/ZYQnxV+Sx7LIqdA3WHciqQ5+plx
6NIIkLxgs/IsTlq/UV/YcPuiVDr0HdnztQolVMHLNg4CskpgveZNl9JVolx7UDUXfsY2Sz159KY6
8Rp4TlRS7+9Xpn0eurIYS3l32ZDVNdkcRS6L+TvCPKcHcwS9+EvSKK7K0+YabtNLwt4cG/XXXWw+
gq1XK7WXIMP6MVmy8tJ7nnJv1ThLnZPx5lJLQi1+3tHVgOZrXaHfWzDby5TJXuOVr9ToyrOSj9OQ
1GaVQbgXZW4SWZElQazS8yot6iPOsPidbzLEi4/zlKDQP0DXqh9Byp3V7aVXHW/wsXZ4qKoSKzYU
HULql7GQSDRKjk3UlhcoJwESbWK4gJDzTgfUKjn/p++tsiAqPLltacoc3XWQw01k2jUZKB5CXBC9
Ft2+4dibrO61hpoNTOVz4xHYlMyaadaXd1CRLBeLW0ve0GUXMMflc9ylJy9VdTPII7fZE5iiAvsa
1DLof3meFCUWPvQtMbBEryiNJ5TYKf+HeEoqP1tZaHLWJwwtDctUPGgHrfqp+Ge4U7q8zfQWRB8T
j4x0DyQq02Ra7eDLcwAIdQD8qbOlFbrxb830CGSf7nkaeW5SDUnsBxEuPE96Y0nMXY8vCgWXpaij
H36ywBU7dw2KVdM3eh77rAp94b2d3x9PjMMKmwyiJaSNw6pebFwAt9GzKwrNYV5res0mVwx4menw
9vz8/fPT1+eHrL0sl/Kn2y8r6+QZhUjy36vtMtcS7bmUd0T9EeEpo4Hqoy7A87cuoBsGy9e45Wu8
zdmBhgp7EVh2YKUlFV0lVg2igBetgCIyDTq9X32urM056RqtOWFUPPzr9entF9Go68OwrQ6Ts0TJ
ObHQcx1KLMbCktFQZunsz/d9n115TqXlzQHv3pQwm5SmUPXVl89vr8ITztvrC+pTIPneA4b/eJLr
rNTsr6fSyzow0OjDVE8aE65hcAusEiGbqTpNnEJWNhpm6A/tMVUz+zTc+1zXtk02bgjj/1u23CXD
MwkyFPM8tWRJNJ5cbBQizdPL/dKzkqgxYq5y5qQigxUJNxAtwKqECi8bNOJqIaM17H6ijrENLjrn
885VAqSt9F1A0wMtBOiKhJZnYzILHcR0YQh82VeoRA/I0pRZEMr3qmdgn3vxCBiF2Pd3nlE7DTND
xv2gVD0dqRAZD0zhIBtohCwxaRUeer9x5dl55WYzCo6AkMIJ0KOZqLAlqpzC8xdKGG03084LA7qA
8gt8hW6pUGQZVIgNAyE1E2BN5bs+XQR/51qazd+RcYQXBnQxRX0TQ2h6hBoW5hMh16NZRRUC1PnW
TIdLweUg10hc8Mj1LYFQVxZvZ4kgubDEvmWvXGbxYsuW6mKC9lVIzbt4jejenX18vmaagSnYmk5M
dLdAwApNLVDg7CxIGFmAxLMhfkROOiOWUNsvao4OmZpXceKG6C9/Ojfd+o7EPHmzNMsKRqwbxqQ0
IxTFiXXvVOFLbHvqMpfi+1gD6EEIoK84CNYAeyqoFdHPM2JNF7jef6wAnQoE0fcIcetKUDyE9HY9
TCvxneePVKvjEuidsYMsdHRMiSEmbIiRPuVsYJFDtLMgW1O4ZPWAbE9BzPWCbGsPfuxL/RagzsKO
VZpzYg06I3THLWhXwH/I5OJeRwp/swMzNg0ER3eYbGHtcszCQS+VOK883yEaA4GQMgAnwFIVXu0C
apbifepTegXpAdHfHG+CpOT6pk+5F7xjFAiecMskQY6I0uwABA5l8yEQuYOlSEFE3uWROMDSJM0w
4cjS4rFp4TmkSRxtqXTJOyRR9BWk+21h8N2B6KUV9gZCNynwexnQDTjCeTa4FldPCyf3U8+LNraQ
MM6UMKiIUiASEDUQ3jN9AhARYfyAKvNjFdtu1sospFt8hYGUCkQsjrUkFvocQWagNILw+UlMmYJO
DF6k7yz8AWkgCGR77SUcklJb+TIDpT2AHlMW0ki3LSXQVbnldqvCQt2tkxlog0ggW9MNMkR0oZOI
7qIkpsWOp+jjcLMmn8TGSBK25PVE2cCL5AARC4ChGoj+XkI4mPSQMo5qfOm6swCxS7akgDaLPXJQ
01CbwoLfSdVHeMq+jJJk1Kp4xEBuuaywXs5R0R67tD0J3NxDZ7l56ntiSghL+Hnfi02rG2i7rqiP
/YnsVGDs0kcSumBGZkvhp9eT4HHv7vfnz/jGFhMQm1SYIt3h1XVbEe5p1l1oqRNoa3sVItALnhNY
4X1Rnhl9bx/h7ISX/DdgBr828OaiBXBT4CrN0rK0J2+7Jmfn4kafoogMhOMcO3xru4Lbk0PvHpu6
Y5YzJWQp8NkkHeBcwGWhRQxW4U9QfCt6LKo9U2VYxQ+d/dPHsulYc7FXDnIWTzPsDDd7tR/Tsm/o
SJQIX1nxKN6K2It364xTOIWBZWluz5/1duxDuu/sfd4/svqU2vM9FzVnMOI3ilZm4nTBjhf2PiuL
urnSsbYE3MAqfGusi3tRFfSrvf4V9E23UfwqvYmIB1aGrhgF3/4FlnUNbw70TUjB0dQwfW7IdnUp
e7Ytf3VPnx8j1nR9cbaibVrjrW0YAfaOaIs+LW+1fd5sYe7C2xVWvExr8eIks4+xtsOHf1aYp2yr
GtPTHDveFgVeuN74Ql+k9ikC0KLkoIsKew2gAG25MYt0ltedYozjm6+Ub0zAvEq7/kNz28yiZxsD
BmYhXmyMN3xdcbQ3QX/qLryvUmgK+3i+oJa/t5y2UcV0yFjVbExJA6srex0+FV2z2QKfbjno+I0B
yWHSwvB7l72VJS1bLYP5FJCwP5Z35Kq5tHwQT9k0A0d5160kW64qSMTZHsJAQc0pY+qd9vUOAeKW
EESXsmX3vaXV/p+1Z1luHMnxvl+hmFNPxPaWRIqydJgDRVISy3yZST1cF4bb1lQpyra8thzbnq9f
IDNJIpOgq2djD11tAcgH8wkg8UAC+DMbSkyNeL8MNvXGF/UmCK3KB0oUQdxwbUgk35CtDCUIL358
vJ3uYUiTuw8jSkXbRJYXssJDEMW7wQ/Avte7oU+s/M0utzvbDvYn/bAa8cN1xB/k1W3xWX6nHOZL
7OOKtcRIU2IwXOxLtIaJOKAOkfpECtbLJKf2US2oMUaaE6Yf+f2tz6dpgnIYCaOZM/j9RYRfsMho
c367jIIulEjYS5IChS1jdgSJcBPEDKiGbqCRsRCGtVSHx7VDw0cCAoSAfIN/sWNMiibVKh34vv1S
GIsXYX4S5PxpJkckXqVQ8UB9wfKKBnFC0E7mp0rTwO7/FroXz2AdsGE5sbKbTf+rN+JmuG/aSc2y
fiIUaXVN1gpw31UcGDbUDaxvTK+T4zydXz/E5XT/k0uMo8tuM+GvImCEMEEvGQ0BIkdvdQoNeeq3
MLzK+v2V85JyJnEtyVfJeGW1Oz/0B6EuvQXRyWTRHhlRshbxl85wxcBUFiw6WRK3LNECNYN1XW/2
GHgmW0d9qRo5XuaYkzU0lsLMh0m871cTZzHutexn7tjxFjzzoCiEO5t6nxHsnaHwtOrj0OaL9arr
0FSrIqHSVrvfXQnmlCMd1u3XNKOZZ1rgwjkw0PHkYFWgcnv2ulIE/sIbyHYoCQbT/aq2Cncx5ZRt
LdZz7C8pPE9mWU1TGvenxdHIZx3QZYCz3ngUc8MVoQFa1uvdh3uDKw3RmCrYbEBnUEdT6a3oj+We
O3klqssobnYODUrGvRGqXG/h9nqs888OT0YV+Jgkc6gPVRJ4C/UwYFWsswAP1zycrbddsd6fvXqv
q9CZsTlxJToW7mSVuJNFv0caZfl/WMeHtLH74/H0/PO3yd8lE1OulyMtUL8/Y6wghl8d/dax+n/v
HUBLFJF4EUDixS06Dw59UZocYKKtNYPxgixQBTxsuu22QO90mH061jOH6qBVjb0ErKq769SdTNtc
Rzg21evp+3fu7K3g9F4PmRkrdiVeYlSWW6ZrMfybwW1MDeg7mBwDWESGCtZGqyY+rbv2w7CEjvrU
Lp1F1wq5MhzMCGVabQLOw5KQBIf1kiTJgLmdsp8JCI8inpi68qAMU5p7F8OGlYeIjoeEiZizuSM1
xUUeLweGUeLqgDuEelQ903ieog79ir80Cb0oee2eScJx3bRRQV/ECaKsSn62EQH8SKws5gfwUOuO
7r8IpOMaDmJ0VxBBuV1aKEaARDjT97IKauUJ3U0hgCSDxJDD7CrvDhoIr4X154Pgdjx7ChR9z3pc
RMrA3mimcb2TXFkW0VcSxOZGqHkf0+j6wF+usQnmU/a1f4ixoMHmS99AtoC0yTY2AEJK33xKiWU0
kRjoZrzNWJEc7AZanPRt22DhOl2n3FrrKMi37+VXWH5CGmrMhibkhQ2xqgtVbzsxwePp+HwhE+OL
2wyEFvkFxtRoqbM3f834NFUut6t+jlhZ6SqmeUPEXkINLYUuzq5KQNRpvou66At0DSK2iRLJXw2a
aBP5A0ojq+/tgGwPOkoM9SybTq/mBsOMqQ7Z5JtxioMaxDG6W9ISm2oyu2ataQu/lB5HhYzx9tSB
VcwqifzH2AKXuRxfzwQr6QYEKiEMN+hCB2fLqxb3t791fcNonOgdukxgz3ETQgkM1oAgehp52nb3
WbpEB9jGhifLFs2MWGN6xBSYNHsdZXF5YxcKMdSkQg0U9k17UATBQRzkA2pR2V4QN6+dgzRZVHEM
uyxeboWw20xXM2cgu9uKVfXBF9XL2wJF3NTPYPLIzYEnaOOKRfyf4SDb7Hhq0/lTRx5Mo4wLPbgL
C5p+EH6htqubu90mF1Ud51WytIElhsywYNiK0biEZgPKO4UVgeD18wqNfeI6LpH4xiO0RraLUqPT
D96/nt/O/7yMNh8vx9ffd6Pv78e3C+dk8ivSps11Gd0ut9TRsPLXKnBIt18w7Cd3WJeV8JzxvDms
Y1gIb5e776fn77Z+1r+/Pz4eX89PxzbTchM41MQo6ue7x/P30eU8etBRse/Pz1Bdr+xndLSmBv3H
6feH0+vx/iLzQNI6m5M0rK5cmjVBA3QkBrvlX9WrMzG+3N0D2TNmfB/4pLa1q4lpPwSQq+mMvQx+
Xa+OTIYda+OLi4/ny4/j28kYyEEaSZQdL/9zfv0pP/rjX8fX/xzFTy/HB9lwwH4FyNxGps+/WINe
KhdYOlDy+Pr9YySXBS6oOKBiFjB0V3Nvyo7LcAUqy/Lx7fyIMu8vl9evKNunF2bdE15ORkzwmEjr
L8e7n+8vWCW0cxy9vRyP9z8MTzGegqjh1Wate/YWevE/vJ5PD+aOUSBrt8Mti1Y9NGyEdkzFyyYe
sFRZixo9xPCG5u+ZLAYhXxQDtiZKZgcu/7o+JBm6qV/vvw08HafyZMzTIs9ARuG5J32UKWOkTymw
x+WAfUhDwxsSNVgrbk8LztccMC+Whud5g5H2DN1904BLf9+n3cXLUmq9ehgV3S7E8N39umTchKf+
5/E+AW3H9ilXSPxqYO0XIRW3/e7t5/FixJRuohCYmKYXhzhBqUjIIFOEP4ijJMRWDE/9TYo6a2xd
1MZFhoEdNAZVGDDhSULZCiwoOVK4yrtxuy4Cx8obpEFSsmHGrEEbsXoaoJJQOtEqWfOv1es8CVcx
y4pufBAoYG90lcMPGbM9z6+3JB1lQ4g+6LDnCCfd7TTrWm/2n1LGcjw0IDciHCqn1J1z3ivCpFtM
B5LeErLyes7KJ4RExB76eDGfJlHeIGoyHcJMpwNfBzg2HAshCcIguhoT23gLt3C8gcoDoRYVF7cE
8dU+mY2pqSgCb/IyvmG/o/CT1PQOoMg9f9YRkl3AhZAkBEtgTeamxptgV/EBTqA0ZUWBzV4Ucaaf
79Qt/ni+/zkS5/fXeyYKnQyLoRQpBgR26zIytoEoA9koUSHiUx3GPa2LuJpNl5QLYVttC/pxsjQj
nzVxh+p0w8kZjW7HKqUrqgeSQcQwaFsM0kEUcRLUqcvUqYn8y+l+JJGj4u778SLTCok+r/8rUrMd
qQGztLkaIWPd1yizVZsy36654yhfKXKDWRAo85uR8DWv9XS+HF9ez/f9WS4jtN3BiCR0jpgSqqaX
p7fvTCVFKtaG6hcBUl7n5BWJlNqrNb5OEC2yhUGAjdVyKDGlNjvV8lQYGwd5p3+0ERDenx/2wGL3
dYwtrWy7LZAHo9/Ex9vl+DTKn0fBj9PL35H5uz/9E6Y5tESrJ5BEAIwBE+hjcMPxMWhVDrnJh8Fi
fayK6PV6vnu4Pz8NlWPxSoo4FF+6MA4359f4xqqErCYQkGm0Tw1Bw+fgWkmnBLVMQVLWuj9jTbYI
OygOoblpC1v615uhwgNUwEqz9/fNNg6CTpHcyUS/GA85aKf/Sg9DQ93DSeTN+90jjP/gBLH4bjmi
oUpzBB1Oj6fnP/lJ0jEkdsGWfhNXohVm/tKibhVwmP9mtyqjm1Zvq36O1mcgfD6bz24aCXzUrvFT
yLMwgslhUz8Q6iIqZbCMLDCekAwSZNMFcFe/qArf3kDaCYz4e0ZFcLLGZjXGpzF2Kt04qIBGTBei
QxVIBacsF/15AXFRnzRcjYocJOhARr9iV3ZDU8bf8ox/JdAkK+EDZ8e/d2uSAVtAjQXWcDL1roxU
hB3KdT2ea+xIBl7TNYHmiz56JYsq8yYex95pgrKaL67MdFoaI1LPG3Nv8RrfGBEaxkJ5eWueWihO
gOhRB8QJNaasDPwAiWa1okJLB6uDpVGuARuPMiZcn0EcFo2M8gzNrqzGrmWgX6AywfqFG3g+rofq
T5qnipTpkcpWBW7ElsShJGLfBXPrWBaF0AX6qo++vrHh2sJD4k69Qed5ib9yBgRkuFEmc8KUw+/p
uPfbdrlbpgEstX401OaI8B1aZ+i71H0bJq4Mx2bwdwliMx4gxvQjkyNVqcZrF+VqTog9iNAIWiEB
A4NwfQi+YnoaYliVBq5Dw2ekqX819bwewPSFReBsZtg9+vOp5xiAhedNrFdFDTUqAgDN1i4Tw3sG
YOZ4BCCq67k7od6UAFj63thQ8/5flNPtQroaLyYlf3wB0hlItQKo2XhWxyu4SGTShCQZiKELlIsF
J7X7YSyfleGM777PPxTO+NCHzecS1olVmC12PDGBUbaLkryIYCdWKglFp3Y4GNEG4sx3DlYzSRU4
UxocRgLmhmgsQQs+UijeEe5sIOG9f1jMBpKVp0HhTlnXyTTK6m8T/emd8aa/vVI2ZN39K+8POM6B
cPi1XBRpXMe/Jtn9mgQo+CVTZl41m8gec+/mobzR0zy0jeMqWefYSPwkYQK2sGfCUrhvm7lrG672
yXTsjtHoiGtZKioALYeIltutZpPxQHc1+3hQi+zff9CRuSNHkZV1FY+6MhKBb3temtWTwlqCenkE
JtT2AE2DqePx9XQFVIkfxydp8S+Oz29n4ymkSmD1FBvtKkJ2nkRE3/IeZplGszk5E9VvU70YBGI+
Iaqu2L+RJyR1y0WHuhKzSYh14Q74zRfC5Tig3bf54mBoTuwPVE69pwcNkE8gKnyiESWTJaB3eyr0
9wv9gUr+FUVTrl9pH2kwC5VVIY/T98l/GJl3z6M7tUD4pzlvPCM6RPjtzq2nOm9qP9V1KG/hcioJ
wMxobA38vZiZ12RY5BVwBaYVjZhOHc5aOJ05ruuYCqmDN+FYZETMqY0wnJfTK1NjCacCtOx5V/wJ
q/a4ZdVFnhU/Gdn2yfjh/empSfXajbecMCXJNQFgTZaG4JRoxL8K9WgVw8r2t9cbnTvj+N/vx+f7
j/Zd9F9o/BqGQidlJipNqYq7u5xfv4QnTOL8xzs+CdPl+ymdJCx+3L0df0+A7PgwSs7nl9Fv0A4m
mm768Ub6Qev+d0t2Adw//UJjl3z/eD2/3Z9fjjB01mG3TNeTmXFy4W8ricHBFw6mWifru4NZ7GGx
dcceZQ8VgN3Z69syV+wtj0LfuQbdLY5q7faS2FmLt//B6vA73j1efpATv4G+Xkbl3eU4Ss/Pp4ul
pvBX0XQ6kAURpd3xhI2npFFGGAe2JYKknVNde386PZwuH2Teun6ljjvh2Y5wUw1wV5sQOUWO/9xU
wnEIu6d+m5O7qbaOketexFdjNjU9IhyDLe99ijpLYEtd0ET96Xj39v56fDrCLf8OQ2N86jKN9aLk
FIKHXMyNcFsNxOz8dXqYGaHZ4myHq3OmVyen91drMRHpLBSH3hrVcHZptzjXYJY++V5loi5j1fd2
qR9+DWuhRExyQW0PsMC4xecnuPbIxZe4GJmIAIpQLNzx2IIsjKNgM7EC4yBkQG8UpK4zmXNxfBDj
EvEQfrvUnyVAfx3C0+LvGRUU14XjFxjG9cOEwAeNx4blbstFiMRZjCdznoEyiFiXJomamJfqV+FP
nAknl5RFOTbcdpoWep5MVYn+OVSA2sE0TQPWk80/wLFjZg3VMD7KVpb7E5fdjHlRwVSTES3gU5yx
hBmbeWLluTVQ04EYq9W167Kp8GAXbHexcGhctgZka1uqQLjTCccbScwVlfn16FYwSd6MLCQJmBuO
Qwi6uuImDTBTzyWTthXeZO4YlrS7IEumfLQ8hXKNFbKLUilV8UyXRLJP07tkNqHCwzeYL5ieCT03
zHNBGRbefX8+XpSagzkxrmWopg/jt0d/jxcLKo5ofVfqr2lejQ5ozxjA4DwacGd1PWfKKbRkRUP6
rGZiQYjz5lO3P+MaYcVm08gyhVU47m9CBbdtAdnBU8P6/ng5vTwe/zQkCSn3bA/0MjcI9WV2/3h6
7s0IOfwZvCRovJJGv6NR2vMD8N3PR1tKRgeBstwWFadBpeN8K1aCaG7b9vlW9L3zDLwJcPwP8N/3
90f4++X8dpK2kcyX/BVygwN9OV/gpjuxul3PYXdoKGBXUPUgSD5TlxwEKPnAIW+KQsaeropEsmBk
DAY6xHYWBom6MCRpsZg0J/JAdaqIEglej294xTN7c1mMZ+N0TfdZ4Zgqavxtb7kw2cAZwj6OFcAc
GAZQm2LMuQDEQTFBhpUy7MlkQpWu8rfJ0wDMNYmEN6OHh/ptFQKYe9VjjGQYKR5qlq+8KZ3+TeGM
ZwT9rfCBrZj1APZO701Dx2c9o/Enu7ptpJ7Q85+nJ2Rhcd0/nN6UGW9veiX3YF/0ceiXGLkjqnes
bnM5cejaLpRRe6dIXKFN8XggXmi54iP+HRbWqgCIx0d/hSqI9zZeb65i4NtLynOT8aE/up+Oyf+v
8a46Ko9PLyiGmzuru5aSw2I8mwyIaxI54O5dpcBkcqEcJYIs5AoO2PHE+u0Yaae4TrYK68pwYISf
dRzyxriIU2FDKjbhAuJxpRQ5dYFAaJXnid0KvpoPNiPdRtGWiWNQ0kibacqRhp86NXA/FAiSVsAt
TsmxjLCVf92a1sjymDyEe+nepTHSg5hhsJttwd4bOWlka/hQGlng4Ie6Fw1bsX06mEcScSo9ziYJ
wkBb1xIkPgevKsPkFsHScX7AahLx1Z57TdQYmb2sccwob0b3P04v/RCMgEFjOSrd1auYnrx+iEZu
jetSw33YFbb1FZhQS01wJ+qhcTlcoEHc07W0DBYamaO3bFANGJvDoY6P5a0hb29Gi83tSLz/8SYt
TLovbLIloXX0BwPUWc8N9DJI6+s88/El3zHtqrEEhsjLAliceVlGGTEDp0hdYzdhBCf8ZMeZRCAN
roU4PczTG2zdWBKys4co6brMLw2gKw5+7cyztN6ImNvtBg1+Za+rsPiKfpgj2hW/KDZ5FtVpmM5m
AxOLhHkQJTmq3svQjnjWnPzG1LV9RLMb6AVlyowBgZ9DIWsAkxSEsy99wifAV02brUF9JJotkIVl
PhBlq/WfILfxMtuFccq5ioc+UfRkcKyk1s/+OaLB+BIoQr+fx2qzH11e7+4lQ2FvZlHRzDxVqjJu
1Usf1oDxNNSiMF81d0ojhZ12DUAi35awfAEi8iSyq9TYTeSX1TLyh+rVZCu4JWh+PuWyXG0M9ayG
Dcxyi15Xm35F0BgHTQVJudo1UMUMtPMkbxSP/dFvFYXF2rAV0tbBRQmn2pDrgMyvlK7LhjjYkVj3
Eql8O8jzkCJclVH0Leph9asqtBlGQb4tEnqHyfrKaB3nRCjPVxa8M25EcLjibpiVIIMFP2TQI/RI
yPLQzD0LOBXkb8gIjFBstsuBsr6MuDhQWii7WaOcWEZotsQdDBj/EsblIKVZW0hnQlNt8Tl8fbVw
iFUVAm2/GoTZ5u+ceN8zuSzSOi8KU3eWc0p1kcSpdbEiSJkOBFXJX5tS0A9UknbWwH+bVcYqgR16
s/VDI2UCel8Zgq/JOKlXshM6qMkTnLJSKu8jbHeBtixG/BYAxXlKz/foUDkAtkzuEFQf/KrilBSA
d/tFXNleLmJMQc0t4YZGRMG2jKtbow9TVaEJ6Krr0dJaaC+mgxzh12Vo3Lj4ezgNuQCRLvCDDdnp
ZYRBPgBDe9oCpZl0180WLtN/xtnKcKYmVQ2O8lfV0gf9zYzH14GxQHjv6wwshoGKMZ4a/4h7kO0z
HVuvhGOMgQbU6G2Cjo1hQu7cPNDkPUidO8GSAbcmvZhEV1j59Foq7D3XO0Wgor/AWXat3AOt8gq9
4j98WZVDn57Fif01K8eaJwnA3tUml6EJB+db4uUq4gpKW04YE7bHqmrpSBJnX+HUGYo23fQBvTpR
YzNIJ5CP4vcFuydR8qSD0EB0MMu8oAMUJ1GzVqjQk4VoRHVr42mngJMvb4vhzxOYGJcP8bQSTIAQ
BWLZHIlpol91LfiDRW62eWU6HiIAgxZI5xZ5KayGZlCm/9Ul9n6ZxRl3Kim8FapTASvgTghslVb1
znhtVCBOdyUrCKqE9t3fVvlKTIe2iELze2QFY2ZsiAAAxjuLiiTBFs5h/hL/1jwvWhiG645LWN81
/O9zAj/Z+8Bor0BuzfcsaZyFkeFERnAZrrWDrU7hKA+wUuRw/IowjWCQ88JYOTpUwf0P6p60Es29
Q9a1BPXPvB4FZvPN16XPSUYNjbV+GnC+xJMDZCsaz0eicEOS476D9cM+ERzbFRJIQX61GoHw9zJP
v4S7UHI0PYYmFvkCpF3jzvmaJ3FkOB99A7KB5boNV72V3PSDb1u9J+Tiy8qvvkQH/Der+N6tmpO+
OcgElDMgO5sEfzeef5gapMA4O1P3isPHOTrWif+t7MiW48Zx7/sVrjztVmWmYsdx7Ic8qCV2S9u6
TEnutl9UHbsn6Zr4KB81O/v1C4CixANUsg8ppwGIN0GAxAF9fXd4eTw//3Tx2/E7kyFNpF275J/M
qQOBE611ji8COEuEYHJjiaNzY6Puhl72b3ePR39wYzbkRLcuQBC0DihthMTgha1x6hAQhw5D8GeW
fTSh4jTLEymMIJ1rIUuzr/omYPjZFrXdJgLMyrSKgo5046mjWwHTX5hFDyBqrrFURLFM+liC4m55
juMfPS3ThY0/nmM5WaPCaEGHWlFYfagkRnrymLXxfjeDW4aYvKBz2Fo4I2iIHGWd7qkjNsNvDANv
FbAQU59NUEhGX+gyp3Ueam4MbMguWUGUeAJqNKf7gUrWpGajNURJKIpLm5qhhVbnEH/zqgnxxqCo
e0zCkbO5xBxC0qTZKk0CfCiI626+ak8K9Ulu8oy/iRwp8hv22WpCG55VU803bA9umpYPQzJSnGKg
66sFBQm44cWokVYUCwH6NHeBMU2TjFaFALFrOFyh0C8fR5699RZjkZXAB3ixpXC4aFo7gMtye+rs
AQCd8SCH/Upd/L0NwQAn6A127cbpVuiqdOE1nMjSWrMKgidIjjcGWi/gWLCihDkdqdyCcT3MItM4
jD4/PQkjcXGEsQbC7ZjZXH1O8gK434NfpDc69StfmP3k6Gc6rsmDAzASvPvvy+vdO6/uWF0ih6sj
z35/FJdh1XOg4CVO3YnK9IAcgLCPORj+w1gz794xuDWGBKB9enbKoItoCwpA1FTl5MxooGvmazgw
r6x92nmHioL0GxlKxNTNnFFCVv4pNcB++pErV4xwUwX3i9W3QbwoqKluMi4KCmirm0quHWFCI11R
EfXtE+e3Zb+nIAHZiZBW2kmENJuID8eryHveLlpixMoyIMaU6lJpCOwHWj8rCA9EKCOKHInsjiVZ
Ey3gXO+SmouyCyR87CryKBQyq4yYyyR0OD9xKKwK3QjzTVfKOnZ/9ys7buQADS2tAb2tZUsRmy2R
SNRpQHzKLH0+09dvJw4wQmUbFGtagWIKpDhVgVQbEWF4HMxHw8VuIJquxnx43qehuzNCOqfmBHOb
OYSG7kBgwpR6Xi3J2IBQVU2xGAQ872PpRGYbhfokso7wyJMvotkb2xHbw9g2gaQnF3VAy8vN1Zwb
BwWnUyKBVkt7UEv5AicSla6V//zzZ86i2SI5t43UHRx3Y+WQGAbKDuZzCHM2U+UZZwXvkJwEC/4Y
xJzOVMkbnDhEvJ+bQ8R5qFskFx/PAk28MHNgO9+cBBt/cRqwZ7fa9Zm36EKirKlwCfacJb9VyPHJ
zEoBZGjeKMyyxayNWvnzxKTgzc1MCs5S08SfhioPT7um4AzaTLyzwjX4ggcff7TZwAg/DdB/csd7
XWXnPc98RjSveiIaY5CDchJxKSg0Phagw8Z2exS8bEUnK7sHhJFV1Kpcal5t8bXM8jxjre8GklUk
cq5CzOm3dvuPiAyayAe5GSnKLmu5T6nz2Wz/206usya1u4lXexMEH9jujR/+PWxXZrgz2CtP69VY
+f7ub9+e0QjUC9Duno/4G2Tsyw6jL5HezGsFQjYZSI+gXMMXGOGZvURSrzki0dVMlfRJ2ldQCiVO
dVD0ApPFI2qSfQbBFyN8N2S91sosdAfDCMkOytLnMc5jGslElEIl/MC7fBJ4YjtCqEc0g+qXUIAd
ptSnQe7W1PbqXoL0ic9Tyq6H7yC+7sZUTAErIRV5zXoc6MvjafAiQ8jMm+LLO/SevXv86+H937v7
3fsfj7u7p8PD+5fdH3so53D3/vDwuv+G6+f916c/3qkltd4/P+x/HH3fPd/tyRR7Wlr/mFKHHR0e
DuhOd/jvbvDZHerNyoyie8VrmG4zGQQhMEwSjvzYeFNO1hRor2MTTLYhfOUaHW776A/vbhhd+baS
6tLFlPQoy8EQK8CCFaKI62sXurViFhCovnQhmF3hDJZ4XF0ZLzO4nZBBqmeV57+fXh+Pbh+f90eP
z0ff9z+eTGdvRQwDubICI1rgEx8uooQF+qTNOs7q1LQ+cRD+J6gSsECfVJrXyxOMJfQvTnTDgy2J
Qo1f17VPva5rvwS8lfFJvVD7Ntz/wLaKtqlHrZTyW3ifrpbHJ+dFl3uIsst5oF99TX+9BtAfZiV0
bSrK2IMPwf7Uw9Db1x+H29/+3P99dEtL9Nvz7un7397KlE3klZP4y0PEsdc6EScpA5RJY9kL6r50
8kqcfPp0bAmyylT17fU7Ogbd7l73d0figRqMXlJ/HV6/H0UvL4+3B0Ilu9ed14M4Lvw5YWBxCidp
dPKhrvJr9AH1mh6JVdbAXPpbSVxmV8yQpBGwwSvNCRYU/+D+8c58Z9Z1L/zZipcLH9b6azZuG2aU
/W9zufFg1dIyPRxX24IP1jPgt6zNj96F4nojI38nluk4sN56xYwPbedPCRrHjOOX7l6+h4aviPzx
SzngVo2026Orwg7koT3Z9i+vfmUy/njCFaIQ/VVdNB13EWuSMZ9vt6G7GIVf5NFanPjzquD+GoB6
2uMPSbbkm6pwP23tij0NgnukSE494iLxpxxgfV3781NksGvI0N/nJ7JIuN2H4LMPHPXJpzOO+qPp
kqW3cBodM+OEYGxneHyAgqsGwJ+OuVkGBKeoamzx0S8KrYoW1crrYbuSxxf+WbGpVc1K/Dg8fbfs
ekde5h9UAOtbRggpu0XWMBw7kjH38jguy2qzzJi1oxHe3apem1EhQFmM/AUdqVQI/EdN668yhJ4x
k+C4Y9jIpT5r3a/WaXQTcQqnnqgob+D88Ns9HCzMuSH8wxsEjdrKRjcujVN/BYiI6V27qdyI+mot
PN4/oR+nJeOPI0Jvj/6hYb4eD7DzU3/R5Tf+vqdnOQ+Kj2l6dcrdw93j/VH5dv91/6xDA3HNi8om
6+Nalv4uSORipVMVMRj2FFAYjrERhjtlEeEB/521rUBPKGmpmIbMSPHO3SZrhGqCv9BGvJbR5w7j
kViW/J21S4d6whxhyKbXUAS0KbWp4fw4fH3egT73/Pj2enhgDuk8W7Bsh+DASljEcLhpvzVmsAyq
cKORSG3DsSSuNkXizRehRvF0voSRjEUngf7r8xTEbXwaPZ4jmaveELG4cXJF3PkBG482t6iUyy8K
GnFRCLzrofuh9ro2uImBrLtFPtA03cIm2376cNHHQg5XS8LznKjXcXOOdrpXiMUyOIrPOm3ehFUr
FcMG/UFqxAsl/n05fHtQ/sW33/e3fx4evhk+ZfTw2rcSrd8TfYM2VeTjG+O9fMCKbYveTVOPvO89
CvU4fvrh4mykFPCfJJLXP20M7IN4jbajv0BB+5jsTCm3oLbE/IUh0kUushIbRVbTSz3GeZANqMsS
8xJFQ/oFaKvAqKVxBZdnpYhkT3ZzprFJ5FisLzIQjzCdnjG02skVJKcyxgs+WRVOCmWTJBdlAItR
qrs2M9/t4kompmwKvS8EaO3FAlP6GV3Di9Eo98vEHIWO9w9wv5SeveOi3sapeouWYmlu8Rj0WDht
TN4UH5/ZFKO4b8CytuutK5fYCiOFP8fcnPZWJwxsVbG45g1aLRL+ZWkgieQmajmLF4WHObSadGZJ
OvGp0y42rXW2GPWyidIIxqC0K7MkWFpJVRjdZ4rl7aEQqmz9bDja6uHRaEtSN4rxO1DehAuhXMm8
TVfImAup2fbxBlwE5ui3Nwg2x0xB+m0g8dGAJv/lmr9CGEiyUH7eAR9JTiedkG0KO85taY8Z12IP
uoj/zfQhMOPTOPSrGzM+gIFYAOKExeQ3VmLeCUH2lhz9qc8hmPcM8lu5inLHwyRqmirOgNVcCRgU
aWXBjcjJ0HS8ViBKXmuxH4RbCYVL0Ev6RuURBua4alMHRxmSo5pERbM5yMcQp3Ko92en1s4m9FBZ
jzEN0DPMGJYCvWriPCIbuVTYEQZ0/mnbi6nZqGymdr5hEnODxjerXI2wMbqUBUg9zhj8g7zAmmxV
Rm1nJRWrO2w5Jt+lxxEL00trbJNL8wjIK6up+HuO+5S5bXoW5zd9GxnLHlPNgixnVFHUmconruvP
Cus3/FgmxrBWWUIu0HAOGounwRgEVc5MXY1O+tZTxYgCjBS4KnB1R+j8A0PH0HUYkB/W/jLvmlTb
b4eIiriJlqbUhAOeiLoy+tDAKrMGHV8cy5V9rI1RiRzxxH4n0zIgQZ+eDw+vf6qYPPf7l2/+wyyJ
PmtK0mXO6wBG2yX2tS9WFqCYNDEH2SUfX0Y+BykuO3S0GS0mtXzrlXBqbITrMsIM9aGNYOF1XOjp
5fK6WFQoqAspgY7PAIMfwj8QvxZVY+X4CY7deBNx+LH/7fVwP8iVL0R6q+DP/kiruga104Ohx1kX
CyuPp4HV7Fbweq9B2dR5xj9VG0TJJpJL/vRaJbChY5nVrAYtSnomKjq8x7I9lZcSxpicDr+cH1+c
mC/IUBoweoyYUfCWlRIUeioYqJhaU4GRbNDVDjaPyStUlxrlqYruK0XUxgardzHUvL4q82u3jGWF
gS2USSEmaKmt3Ei/PNv/MNO/DXsy2X99+0YJZrOHl9fnN4z1aoYpiFYZOSVJIzugARzfntXYf/nw
n2PDl8Cg87O92j10zRCIU61hvs01h7851XjkaosmKkEcLrMWlLzeMa4kLGss8ktjYjdYWdD6GwK9
lLybweEpfizX4HDIZUBHxZj65rUrwatNaanepHFXWVOVlopmw/uyUiNwHaS4EdLb5kSidCKnR8pl
ko2FmXcLTWRZbhAidM9F0zsMIpxpOaxqv1KNmeEVynCiQz7N24YAC0gGKlEmiiPMrR5V7FXR16uW
FrPXqis+26X74S9UApJWFzHLZ0AE94nK90TmH+bHA1gZDQGHgEOlkoObfLCsgZWgpOnuPmOE0bt3
abkXzyLjmLq5jnAn+ldpCovW92qpTnsVRFpLOVIlKAHw2LNqmbaStyxSjCHmvTUi/VH1+PTy/gjD
2L89KR6Z7h6+2WnRoEExWtZUIAhz3h4mHqOQdMD0RumvitddzaSyaapl6yPHSjFtNCbkKUxCqonz
CAwSj80xhgQr69MOBrsFmZopbnMJ5w6cPokdQoIyD6rCWZY5P6DK4A7Oors3PIAYxqd2p2PNroC2
FEIw4iXmmceVba9PFBrXQtSKVaq7MzQQmJj7P1+eDg9oNABduH973f9nD//Zv97+/vvv/zICqmJo
ByqS8pkzXhG1hG2gYzlwdydYAvbA3UKoKHat2JoXcMMintLa2tt/JHdW/WajcMB6qw1oB+kMo5Kb
RhTc2lZoaq6jwSkH0tqvd0AECwM1G2XgJhehr3FQ6S1m0Ca4hlGTYM+gnujl45y6zmh6k2Lyf8y9
pQypaGLjSJCMBqPTdyU+L8JyVfdczBGmDs4AK/pTiRp3u9fdEcoYt3gH7GSepCHK3A7ZPPwn+IZ/
s1JIfVwEIsTQsd4nURuh9oIxnb2QJBYzCHTJXhAxqBKibEEWHEN1yrjjOERovoGcooSGbpgQb317
b2LwwCM5nRhE1bVfTo6tL+3pRpC4NGNA6CiwVqO97Xg5yOySjtiZOVChY0ACRLdffiaxySnw/Fyd
uuTBSsEquZ0C6DK+bitDXS+rWnVLOqf8siuVBjKPXcmoTnkareMunWFTBRCwLygUGFlxysQhwWgH
NBdICQJq2bqSSDx8qEqZkKo55A3p1K1qjR1nYWQzbkZJSu5D9JY8jaOLE6KC2nodN4oafMHQm8+u
3ypP3zu6BQ2ExpGilVXdI0tAwPWqv2Fm3p/MyZCam8mZGwt3Nsfv4aRDn0mrcCVg+2WOBCCOgaCy
DFerTn1vfW1gLXOdUfM7rBzutBiWRlOCXJtW/prRiFEAtudvAQwdpn3oq7bMNk97gkclsM8IXwvV
B24EUpccVjlHqCvNye9/jIBlHPzDpKhMVO4iCe2u5rps0+mbsTkYr0ZH3Q+O3bAxlPrgDB9tUutB
cWLMxsYYCdhB0bVEOV1z4wCxdHqu2wjYee0xfLbmEPE4H0IUcJLR1QVGLXIzdBsjhzs3XGkTYe4v
bhANZY+CrmaD06h9gab8NgYaT0p4evxr//x0y94ZoOvrYBK9IU3P0PQpxJbakyCXtanpRA7fiQKz
OCq92F4Z6EkDagRwPPNul2M0rYQZ28IQc++aRZP16r44II8ZjcFJQB2GHiqC96jbwr5cwN8zMQUU
GoanASl3kV+HPu1lhUktgxevK5vt0OBFMr8OthMp6hYdbq2LWm8ezRvxdv/yiuIoak4xph/ffbMy
aqy7MmNfLjhFP7PHqS5++T6gWhIDCRdteXmJVoVk/UnZ0y4Ox+xzN8waPT3c24IGuGZ1NTCN2nov
RXpOBASWSKclrD5czYP52vhZvk5a/ipHqb3IJJtQXDQiKbISL355J36iCH6/0EoFbZAZprbAx8gZ
PL0iVnmFizpIZb1shslUNJ0wXulxZ6fzm9r02gkS0eikYos7ZWb41BuTejRkT6qBqlHORfbXa0C0
drBbm0AZ1YTxioXN4mHx5/yDB1F0nRvp28Ru6Tk5jNcXa2EKifYW3nWjM8qOwbuNzZIoNK75uvDG
FLrsXInZ+KuCLg1mRgQtJN3ogE4d9dycoG1Vis92TiyridNkZYLt5MUPs6xlJgtQ5Q1nNbWedPQ1
p+UkKoQXITkhkoWaO2jo/AZiLHdBor/FKxD7Nld/mfHMHzDus+vsceJ5/KlX2P8B6HC8PawqAgA=
--===============8641113057856743852==--

