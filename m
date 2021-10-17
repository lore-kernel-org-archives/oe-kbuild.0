Content-Type: multipart/mixed; boundary="===============3334835571588406450=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/hw/mlx5/qp.c:2081:3: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Mon, 18 Oct 2021 05:31:15 +0800
Message-ID: <202110180558.ybjdfiiX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3334835571588406450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Aharon Landau <aharonl@nvidia.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Maor Gottlieb <maorg@nvidia.com>
CC: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d999ade1cc86cd2951d41c11ea769cb4452c8811
commit: 2fe8d4b87802dcde7fa015229c84bb726f631b4d RDMA/mlx5: Fail QP creatio=
n if the device can not support the CQE TS
date:   8 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-c007-20211014 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6c76d0=
101193aa4eb891a6954ff047eda2f9cf71)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2fe8d4b87802dcde7fa015229c84bb726f631b4d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2fe8d4b87802dcde7fa015229c84bb726f631b4d
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/infiniband/hw/qib/qib_verbs.c:1666:8: note: Taking false branch
                   tx =3D list_entry(l, struct qib_verbs_txreq, txreq.list);
                        ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/infiniband/hw/qib/qib_verbs.c:1666:8: note: Loop condition is fa=
lse.  Exiting loop
                   tx =3D list_entry(l, struct qib_verbs_txreq, txreq.list);
                        ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/infiniband/hw/qib/qib_verbs.c:1667:3: note: Memory is released
                   kfree(tx);
                   ^~~~~~~~~
   drivers/infiniband/hw/qib/qib_verbs.c:1661:2: note: Loop condition is tr=
ue.  Entering loop body
           while (!list_empty(&dev->txreq_free)) {
           ^
   drivers/infiniband/hw/qib/qib_verbs.c:1665:3: note: Use of memory after =
it is freed
                   list_del(l);
                   ^        ~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/infiniband/hw/mlx5/main.c:1189:22: warning: Value stored to 'dev=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct mlx5_ib_dev *dev =3D to_mdev(ibdev);
                               ^~~   ~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/main.c:1189:22: note: Value stored to 'dev' d=
uring its initialization is never read
           struct mlx5_ib_dev *dev =3D to_mdev(ibdev);
                               ^~~   ~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/main.c:1587:6: warning: Value stored to 'ref_=
bfregs' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           int ref_bfregs =3D req->total_num_bfregs;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/main.c:1587:6: note: Value stored to 'ref_bfr=
egs' during its initialization is never read
           int ref_bfregs =3D req->total_num_bfregs;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/infiniband/hw/mlx5/mr.c:2375:3: warning: Value stored to 'sg' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   sg =3D meta_sgl;
                   ^    ~~~~~~~~
   drivers/infiniband/hw/mlx5/mr.c:2375:3: note: Value stored to 'sg' is ne=
ver read
                   sg =3D meta_sgl;
                   ^    ~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/infiniband/hw/mlx5/qp.c:1672:2: warning: Value stored to 'hfso' =
is never read [clang-analyzer-deadcode.DeadStores]
           hfso =3D MLX5_ADDR_OF(tirc, tirc, rx_hash_field_selector_outer);
           ^
   drivers/infiniband/hw/mlx5/qp.c:1672:2: note: Value stored to 'hfso' is =
never read
>> drivers/infiniband/hw/mlx5/qp.c:2081:3: warning: Assigned value is garba=
ge or undefined [clang-analyzer-core.uninitialized.Assign]
                   MLX5_SET(qpc, qpc, ts_format, ts_format);
                   ^
   include/linux/mlx5/device.h:74:2: note: expanded from macro 'MLX5_SET'
           u32 _v =3D v; \
           ^        ~
   drivers/infiniband/hw/mlx5/qp.c:1987:2: note: 'ts_format' declared witho=
ut an initial value
           int ts_format;
           ^~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/qp.c:1993:2: note: Loop condition is false.  =
Exiting loop
           spin_lock_init(&qp->sq.lock);
           ^
   include/linux/spinlock.h:334:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/infiniband/hw/mlx5/qp.c:1994:2: note: Loop condition is false.  =
Exiting loop
           spin_lock_init(&qp->rq.lock);
           ^
   include/linux/spinlock.h:334:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/infiniband/hw/mlx5/qp.c:1997:6: note: 'mlx5_st' is >=3D 0
           if (mlx5_st < 0)
               ^~~~~~~
   drivers/infiniband/hw/mlx5/qp.c:1997:2: note: Taking false branch
           if (mlx5_st < 0)
           ^
   drivers/infiniband/hw/mlx5/qp.c:2000:6: note: Assuming field 'sq_sig_typ=
e' is not equal to IB_SIGNAL_ALL_WR
           if (init_attr->sq_sig_type =3D=3D IB_SIGNAL_ALL_WR)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/qp.c:2000:2: note: Taking false branch
           if (init_attr->sq_sig_type =3D=3D IB_SIGNAL_ALL_WR)
           ^
   drivers/infiniband/hw/mlx5/qp.c:2003:6: note: Assuming the condition is =
false
           if (qp->flags & IB_QP_CREATE_SOURCE_QPN)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/qp.c:2003:2: note: Taking false branch
           if (qp->flags & IB_QP_CREATE_SOURCE_QPN)
           ^
   drivers/infiniband/hw/mlx5/qp.c:2006:10: note: Assuming field 'qp_type' =
is not equal to IB_QPT_RAW_PACKET
           base =3D (init_attr->qp_type =3D=3D IB_QPT_RAW_PACKET ||
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/qp.c:2006:10: note: Left side of '||' is false
   drivers/infiniband/hw/mlx5/qp.c:2006:9: note: '?' condition is false
           base =3D (init_attr->qp_type =3D=3D IB_QPT_RAW_PACKET ||
                  ^
   drivers/infiniband/hw/mlx5/qp.c:2013:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   drivers/infiniband/hw/mlx5/qp.c:2013:2: note: Taking false branch
           if (err) {
           ^
   drivers/infiniband/hw/mlx5/qp.c:2018:6: note: Assuming field 'rq_wqe_shi=
ft' is equal to field 'wqe_shift'
           if (ucmd->rq_wqe_shift !=3D qp->rq.wqe_shift ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/qp.c:2018:6: note: Left side of '||' is false
   drivers/infiniband/hw/mlx5/qp.c:2019:6: note: Assuming field 'rq_wqe_cou=
nt' is equal to field 'wqe_cnt'
               ucmd->rq_wqe_count !=3D qp->rq.wqe_cnt)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/qp.c:2018:2: note: Taking false branch
           if (ucmd->rq_wqe_shift !=3D qp->rq.wqe_shift ||
           ^
   drivers/infiniband/hw/mlx5/qp.c:2022:33: note: '?' condition is false
           if (ucmd->sq_wqe_count > (1 << MLX5_CAP_GEN(mdev, log_max_qp_sz)=
))
                                          ^
   include/linux/mlx5/device.h:1198:2: note: expanded from macro 'MLX5_CAP_=
GEN'
           MLX5_GET(cmd_hca_cap, mdev->caps.hca_cur[MLX5_CAP_GENERAL], cap)
           ^
   include/linux/mlx5/device.h:95:33: note: expanded from macro 'MLX5_GET'
   #define MLX5_GET(typ, p, fld) ((be32_to_cpu(*((__be32 *)(p) +\
                                   ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:40:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   drivers/infiniband/hw/mlx5/qp.c:2022:6: note: Assuming the condition is =
false
           if (ucmd->sq_wqe_count > (1 << MLX5_CAP_GEN(mdev, log_max_qp_sz)=
))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/qp.c:2022:2: note: Taking false branch
           if (ucmd->sq_wqe_count > (1 << MLX5_CAP_GEN(mdev, log_max_qp_sz)=
))
           ^
   drivers/infiniband/hw/mlx5/qp.c:2025:6: note: Assuming field 'qp_type' i=
s equal to IB_QPT_RAW_PACKET
           if (init_attr->qp_type !=3D IB_QPT_RAW_PACKET) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/qp.c:2025:2: note: Taking false branch
           if (init_attr->qp_type !=3D IB_QPT_RAW_PACKET) {
           ^
   drivers/infiniband/hw/mlx5/qp.c:2034:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   drivers/infiniband/hw/mlx5/qp.c:2034:2: note: Taking false branch
           if (err)
           ^
   drivers/infiniband/hw/mlx5/qp.c:2037:2: note: Taking false branch
           if (is_sqp(init_attr->qp_type))
           ^

vim +2081 drivers/infiniband/hw/mlx5/qp.c

04bcc1c2d0d7bf Leon Romanovsky   2020-04-27  1970  =

98fc1126c41614 Leon Romanovsky   2020-04-27  1971  static int create_user_q=
p(struct mlx5_ib_dev *dev, struct ib_pd *pd,
f78d358cec9088 Leon Romanovsky   2020-04-27  1972  			  struct mlx5_ib_qp *=
qp,
f78d358cec9088 Leon Romanovsky   2020-04-27  1973  			  struct mlx5_create_=
qp_params *params)
e126ba97dba9ed Eli Cohen         2013-07-07  1974  {
f78d358cec9088 Leon Romanovsky   2020-04-27  1975  	struct ib_qp_init_attr =
*init_attr =3D params->attr;
f78d358cec9088 Leon Romanovsky   2020-04-27  1976  	struct mlx5_ib_create_q=
p *ucmd =3D params->ucmd;
3e09a427ae7ac3 Leon Romanovsky   2020-05-26  1977  	u32 out[MLX5_ST_SZ_DW(c=
reate_qp_out)] =3D {};
f78d358cec9088 Leon Romanovsky   2020-04-27  1978  	struct ib_udata *udata =
=3D params->udata;
f78d358cec9088 Leon Romanovsky   2020-04-27  1979  	u32 uidx =3D params->ui=
dx;
e126ba97dba9ed Eli Cohen         2013-07-07  1980  	struct mlx5_ib_resource=
s *devr =3D &dev->devr;
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  1981  	int inlen =3D MLX5_ST_S=
Z_BYTES(create_qp_in);
938fe83c8dcbbf Saeed Mahameed    2015-05-28  1982  	struct mlx5_core_dev *m=
dev =3D dev->mdev;
89ea94a7b6c40e Maor Gottlieb     2016-06-17  1983  	struct mlx5_ib_cq *send=
_cq;
89ea94a7b6c40e Maor Gottlieb     2016-06-17  1984  	struct mlx5_ib_cq *recv=
_cq;
89ea94a7b6c40e Maor Gottlieb     2016-06-17  1985  	unsigned long flags;
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  1986  	struct mlx5_ib_qp_base =
*base;
2fe8d4b87802dc Aharon Landau     2021-02-09  1987  	int ts_format;
e7b169f34403be Noa Osherovich    2018-02-25  1988  	int mlx5_st;
cfb5e088e26ae0 Haggai Abramovsky 2016-01-14  1989  	void *qpc;
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  1990  	u32 *in;
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  1991  	int err;
e126ba97dba9ed Eli Cohen         2013-07-07  1992  =

e126ba97dba9ed Eli Cohen         2013-07-07  1993  	spin_lock_init(&qp->sq.=
lock);
e126ba97dba9ed Eli Cohen         2013-07-07  1994  	spin_lock_init(&qp->rq.=
lock);
e126ba97dba9ed Eli Cohen         2013-07-07  1995  =

7aede1a25f4b84 Leon Romanovsky   2020-04-27  1996  	mlx5_st =3D to_mlx5_st(=
qp->type);
e7b169f34403be Noa Osherovich    2018-02-25  1997  	if (mlx5_st < 0)
e7b169f34403be Noa Osherovich    2018-02-25  1998  		return -EINVAL;
e7b169f34403be Noa Osherovich    2018-02-25  1999  =

e126ba97dba9ed Eli Cohen         2013-07-07  2000  	if (init_attr->sq_sig_t=
ype =3D=3D IB_SIGNAL_ALL_WR)
e126ba97dba9ed Eli Cohen         2013-07-07  2001  		qp->sq_signal_bits =3D=
 MLX5_WQE_CTRL_CQ_UPDATE;
e126ba97dba9ed Eli Cohen         2013-07-07  2002  =

2978975ce7f161 Leon Romanovsky   2020-04-27  2003  	if (qp->flags & IB_QP_C=
REATE_SOURCE_QPN)
2978975ce7f161 Leon Romanovsky   2020-04-27  2004  		qp->underlay_qpn =3D i=
nit_attr->source_qpn;
2978975ce7f161 Leon Romanovsky   2020-04-27  2005  =

c2e53b2ce1ba35 Yishai Hadas      2017-06-08  2006  	base =3D (init_attr->qp=
_type =3D=3D IB_QPT_RAW_PACKET ||
2be08c308f102e Leon Romanovsky   2020-04-27  2007  		qp->flags & IB_QP_CREA=
TE_SOURCE_QPN) ?
c2e53b2ce1ba35 Yishai Hadas      2017-06-08  2008  	       &qp->raw_packet_=
qp.rq.base :
c2e53b2ce1ba35 Yishai Hadas      2017-06-08  2009  	       &qp->trans_qp.ba=
se;
c2e53b2ce1ba35 Yishai Hadas      2017-06-08  2010  =

e126ba97dba9ed Eli Cohen         2013-07-07  2011  	qp->has_rq =3D qp_has_r=
q(init_attr);
2dfac92dbb5d6e Leon Romanovsky   2020-04-27  2012  	err =3D set_rq_size(dev=
, &init_attr->cap, qp->has_rq, qp, ucmd);
e126ba97dba9ed Eli Cohen         2013-07-07  2013  	if (err) {
e126ba97dba9ed Eli Cohen         2013-07-07  2014  		mlx5_ib_dbg(dev, "err =
%d\n", err);
e126ba97dba9ed Eli Cohen         2013-07-07  2015  		return err;
e126ba97dba9ed Eli Cohen         2013-07-07  2016  	}
e126ba97dba9ed Eli Cohen         2013-07-07  2017  =

2dfac92dbb5d6e Leon Romanovsky   2020-04-27  2018  	if (ucmd->rq_wqe_shift =
!=3D qp->rq.wqe_shift ||
98fc1126c41614 Leon Romanovsky   2020-04-27  2019  	    ucmd->rq_wqe_count =
!=3D qp->rq.wqe_cnt)
e126ba97dba9ed Eli Cohen         2013-07-07  2020  		return -EINVAL;
98fc1126c41614 Leon Romanovsky   2020-04-27  2021  =

98fc1126c41614 Leon Romanovsky   2020-04-27  2022  	if (ucmd->sq_wqe_count =
> (1 << MLX5_CAP_GEN(mdev, log_max_qp_sz)))
e126ba97dba9ed Eli Cohen         2013-07-07  2023  		return -EINVAL;
e126ba97dba9ed Eli Cohen         2013-07-07  2024  =

2fe8d4b87802dc Aharon Landau     2021-02-09  2025  	if (init_attr->qp_type =
!=3D IB_QPT_RAW_PACKET) {
2fe8d4b87802dc Aharon Landau     2021-02-09  2026  		ts_format =3D get_qp_t=
s_format(dev, to_mcq(init_attr->send_cq),
2fe8d4b87802dc Aharon Landau     2021-02-09  2027  					     to_mcq(init_at=
tr->recv_cq));
2fe8d4b87802dc Aharon Landau     2021-02-09  2028  		if (ts_format < 0)
2fe8d4b87802dc Aharon Landau     2021-02-09  2029  			return ts_format;
2fe8d4b87802dc Aharon Landau     2021-02-09  2030  	}
2fe8d4b87802dc Aharon Landau     2021-02-09  2031  =

08d53976609aec Leon Romanovsky   2020-04-27  2032  	err =3D _create_user_qp=
(dev, pd, qp, udata, init_attr, &in, &params->resp,
08d53976609aec Leon Romanovsky   2020-04-27  2033  			      &inlen, base, u=
cmd);
e126ba97dba9ed Eli Cohen         2013-07-07  2034  	if (err)
e126ba97dba9ed Eli Cohen         2013-07-07  2035  		return err;
e126ba97dba9ed Eli Cohen         2013-07-07  2036  =

e126ba97dba9ed Eli Cohen         2013-07-07  2037  	if (is_sqp(init_attr->q=
p_type))
e126ba97dba9ed Eli Cohen         2013-07-07  2038  		qp->port =3D init_attr=
->port_num;
e126ba97dba9ed Eli Cohen         2013-07-07  2039  =

e383085c242558 Leon Romanovsky   2020-05-26  2040  	if (MLX5_CAP_GEN(mdev, =
ece_support))
e383085c242558 Leon Romanovsky   2020-05-26  2041  		MLX5_SET(create_qp_in,=
 in, ece, ucmd->ece_options);
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2042  	qpc =3D MLX5_ADDR_OF(cr=
eate_qp_in, in, qpc);
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2043  =

e7b169f34403be Noa Osherovich    2018-02-25  2044  	MLX5_SET(qpc, qpc, st, =
mlx5_st);
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2045  	MLX5_SET(qpc, qpc, pm_s=
tate, MLX5_QP_PM_MIGRATED);
98fc1126c41614 Leon Romanovsky   2020-04-27  2046  	MLX5_SET(qpc, qpc, pd, =
to_mpd(pd)->pdn);
e126ba97dba9ed Eli Cohen         2013-07-07  2047  =

c95e6d53970254 Leon Romanovsky   2020-04-27  2048  	if (qp->flags_en & MLX5=
_QP_FLAG_SIGNATURE)
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2049  		MLX5_SET(qpc, qpc, wq_=
signature, 1);
e126ba97dba9ed Eli Cohen         2013-07-07  2050  =

2be08c308f102e Leon Romanovsky   2020-04-27  2051  	if (qp->flags & IB_QP_C=
REATE_BLOCK_MULTICAST_LOOPBACK)
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2052  		MLX5_SET(qpc, qpc, blo=
ck_lb_mc, 1);
f360d88a2efddf Eli Cohen         2014-04-02  2053  =

2be08c308f102e Leon Romanovsky   2020-04-27  2054  	if (qp->flags & IB_QP_C=
REATE_CROSS_CHANNEL)
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2055  		MLX5_SET(qpc, qpc, cd_=
master, 1);
2be08c308f102e Leon Romanovsky   2020-04-27  2056  	if (qp->flags & IB_QP_C=
REATE_MANAGED_SEND)
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2057  		MLX5_SET(qpc, qpc, cd_=
slave_send, 1);
2be08c308f102e Leon Romanovsky   2020-04-27  2058  	if (qp->flags & IB_QP_C=
REATE_MANAGED_RECV)
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2059  		MLX5_SET(qpc, qpc, cd_=
slave_receive, 1);
2be08c308f102e Leon Romanovsky   2020-04-27  2060  	if (qp->flags_en & MLX5=
_QP_FLAG_PACKET_BASED_CREDIT_MODE)
569c665150156e Danit Goldberg    2018-11-30  2061  		MLX5_SET(qpc, qpc, req=
_e2e_credit_mode, 1);
90ecb37a751b69 Leon Romanovsky   2020-04-27  2062  	if ((qp->flags_en & MLX=
5_QP_FLAG_SCATTER_CQE) &&
90ecb37a751b69 Leon Romanovsky   2020-04-27  2063  	    (init_attr->qp_type=
 =3D=3D IB_QPT_RC ||
8bde2c509e4035 Leon Romanovsky   2020-04-27  2064  	     init_attr->qp_type=
 =3D=3D IB_QPT_UC)) {
52c81f47f0d268 Colin Ian King    2020-05-07  2065  		int rcqe_sz =3D mlx5_i=
b_get_cqe_size(init_attr->recv_cq);
8bde2c509e4035 Leon Romanovsky   2020-04-27  2066  =

8bde2c509e4035 Leon Romanovsky   2020-04-27  2067  		MLX5_SET(qpc, qpc, cs_=
res,
8bde2c509e4035 Leon Romanovsky   2020-04-27  2068  			 rcqe_sz =3D=3D 128 ?=
 MLX5_RES_SCAT_DATA64_CQE :
8bde2c509e4035 Leon Romanovsky   2020-04-27  2069  					  MLX5_RES_SCAT_DAT=
A32_CQE);
8bde2c509e4035 Leon Romanovsky   2020-04-27  2070  	}
90ecb37a751b69 Leon Romanovsky   2020-04-27  2071  	if ((qp->flags_en & MLX=
5_QP_FLAG_SCATTER_CQE) &&
7aede1a25f4b84 Leon Romanovsky   2020-04-27  2072  	    (qp->type =3D=3D ML=
X5_IB_QPT_DCI || qp->type =3D=3D IB_QPT_RC))
81530ab08ef002 Leon Romanovsky   2020-07-28  2073  		configure_requester_sc=
at_cqe(dev, qp, init_attr, qpc);
e126ba97dba9ed Eli Cohen         2013-07-07  2074  =

e126ba97dba9ed Eli Cohen         2013-07-07  2075  	if (qp->rq.wqe_cnt) {
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2076  		MLX5_SET(qpc, qpc, log=
_rq_stride, qp->rq.wqe_shift - 4);
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2077  		MLX5_SET(qpc, qpc, log=
_rq_size, ilog2(qp->rq.wqe_cnt));
e126ba97dba9ed Eli Cohen         2013-07-07  2078  	}
e126ba97dba9ed Eli Cohen         2013-07-07  2079  =

2fe8d4b87802dc Aharon Landau     2021-02-09  2080  	if (init_attr->qp_type =
!=3D IB_QPT_RAW_PACKET)
2fe8d4b87802dc Aharon Landau     2021-02-09 @2081  		MLX5_SET(qpc, qpc, ts_=
format, ts_format);
2fe8d4b87802dc Aharon Landau     2021-02-09  2082  =

09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2083  	MLX5_SET(qpc, qpc, rq_t=
ype, get_rx_type(qp, init_attr));
e126ba97dba9ed Eli Cohen         2013-07-07  2084  =

3fd3307ef34fc9 Artemy Kovalyov   2017-08-17  2085  	if (qp->sq.wqe_cnt) {
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2086  		MLX5_SET(qpc, qpc, log=
_sq_size, ilog2(qp->sq.wqe_cnt));
3fd3307ef34fc9 Artemy Kovalyov   2017-08-17  2087  	} else {
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2088  		MLX5_SET(qpc, qpc, no_=
sq, 1);
3fd3307ef34fc9 Artemy Kovalyov   2017-08-17  2089  		if (init_attr->srq &&
3fd3307ef34fc9 Artemy Kovalyov   2017-08-17  2090  		    init_attr->srq->sr=
q_type =3D=3D IB_SRQT_TM)
3fd3307ef34fc9 Artemy Kovalyov   2017-08-17  2091  			MLX5_SET(qpc, qpc, of=
fload_type,
3fd3307ef34fc9 Artemy Kovalyov   2017-08-17  2092  				 MLX5_QPC_OFFLOAD_TY=
PE_RNDV);
3fd3307ef34fc9 Artemy Kovalyov   2017-08-17  2093  	}
e126ba97dba9ed Eli Cohen         2013-07-07  2094  =

e126ba97dba9ed Eli Cohen         2013-07-07  2095  	/* Set default resource=
s */
e126ba97dba9ed Eli Cohen         2013-07-07  2096  	switch (init_attr->qp_t=
ype) {
e126ba97dba9ed Eli Cohen         2013-07-07  2097  	case IB_QPT_XRC_INI:
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2098  		MLX5_SET(qpc, qpc, cqn=
_rcv, to_mcq(devr->c0)->mcq.cqn);
f4375443b7861c Leon Romanovsky   2020-07-06  2099  		MLX5_SET(qpc, qpc, xrc=
d, devr->xrcdn1);
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2100  		MLX5_SET(qpc, qpc, srq=
n_rmpn_xrqn, to_msrq(devr->s0)->msrq.srqn);
e126ba97dba9ed Eli Cohen         2013-07-07  2101  		break;
e126ba97dba9ed Eli Cohen         2013-07-07  2102  	default:
e126ba97dba9ed Eli Cohen         2013-07-07  2103  		if (init_attr->srq) {
f4375443b7861c Leon Romanovsky   2020-07-06  2104  			MLX5_SET(qpc, qpc, xr=
cd, devr->xrcdn0);
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2105  			MLX5_SET(qpc, qpc, sr=
qn_rmpn_xrqn, to_msrq(init_attr->srq)->msrq.srqn);
e126ba97dba9ed Eli Cohen         2013-07-07  2106  		} else {
f4375443b7861c Leon Romanovsky   2020-07-06  2107  			MLX5_SET(qpc, qpc, xr=
cd, devr->xrcdn1);
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2108  			MLX5_SET(qpc, qpc, sr=
qn_rmpn_xrqn, to_msrq(devr->s1)->msrq.srqn);
e126ba97dba9ed Eli Cohen         2013-07-07  2109  		}
e126ba97dba9ed Eli Cohen         2013-07-07  2110  	}
e126ba97dba9ed Eli Cohen         2013-07-07  2111  =

e126ba97dba9ed Eli Cohen         2013-07-07  2112  	if (init_attr->send_cq)
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2113  		MLX5_SET(qpc, qpc, cqn=
_snd, to_mcq(init_attr->send_cq)->mcq.cqn);
e126ba97dba9ed Eli Cohen         2013-07-07  2114  =

e126ba97dba9ed Eli Cohen         2013-07-07  2115  	if (init_attr->recv_cq)
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2116  		MLX5_SET(qpc, qpc, cqn=
_rcv, to_mcq(init_attr->recv_cq)->mcq.cqn);
e126ba97dba9ed Eli Cohen         2013-07-07  2117  =

09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2118  	MLX5_SET64(qpc, qpc, db=
r_addr, qp->db.dma);
e126ba97dba9ed Eli Cohen         2013-07-07  2119  =

cfb5e088e26ae0 Haggai Abramovsky 2016-01-14  2120  	/* 0xffffff means we as=
k to work with cqe version 0 */
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2121  	if (MLX5_CAP_GEN(mdev, =
cqe_version) =3D=3D MLX5_CQE_VERSION_V1)
cfb5e088e26ae0 Haggai Abramovsky 2016-01-14  2122  		MLX5_SET(qpc, qpc, use=
r_index, uidx);
09a7d9eca1a6cf Saeed Mahameed    2016-07-19  2123  =

2978975ce7f161 Leon Romanovsky   2020-04-27  2124  	if (qp->flags & IB_QP_C=
REATE_PCI_WRITE_END_PADDING &&
2978975ce7f161 Leon Romanovsky   2020-04-27  2125  	    init_attr->qp_type =
!=3D IB_QPT_RAW_PACKET) {
b1383aa6412177 Noa Osherovich    2017-10-29  2126  		MLX5_SET(qpc, qpc, end=
_padding_mode,
b1383aa6412177 Noa Osherovich    2017-10-29  2127  			 MLX5_WQ_END_PAD_MODE=
_ALIGN);
2978975ce7f161 Leon Romanovsky   2020-04-27  2128  		/* Special case to cle=
an flag */
2978975ce7f161 Leon Romanovsky   2020-04-27  2129  		qp->flags &=3D ~IB_QP_=
CREATE_PCI_WRITE_END_PADDING;
b1383aa6412177 Noa Osherovich    2017-10-29  2130  	}
b1383aa6412177 Noa Osherovich    2017-10-29  2131  =

c2e53b2ce1ba35 Yishai Hadas      2017-06-08  2132  	if (init_attr->qp_type =
=3D=3D IB_QPT_RAW_PACKET ||
2be08c308f102e Leon Romanovsky   2020-04-27  2133  	    qp->flags & IB_QP_C=
REATE_SOURCE_QPN) {
2dfac92dbb5d6e Leon Romanovsky   2020-04-27  2134  		qp->raw_packet_qp.sq.u=
buffer.buf_addr =3D ucmd->sq_buf_addr;
0fb2ed66a14c8c majd(a)mellanox.com 2016-01-14  2135  		raw_packet_qp_copy_i=
nfo(qp, &qp->raw_packet_qp);
7f72052cb48efb Yishai Hadas      2018-09-20  2136  		err =3D create_raw_pac=
ket_qp(dev, qp, in, inlen, pd, udata,
2fe8d4b87802dc Aharon Landau     2021-02-09  2137  					   &params->resp, i=
nit_attr);
04bcc1c2d0d7bf Leon Romanovsky   2020-04-27  2138  	} else
3e09a427ae7ac3 Leon Romanovsky   2020-05-26  2139  		err =3D mlx5_qpc_creat=
e_qp(dev, &base->mqp, in, inlen, out);
e126ba97dba9ed Eli Cohen         2013-07-07  2140  =

479163f4608214 Al Viro           2014-11-20  2141  	kvfree(in);
04bcc1c2d0d7bf Leon Romanovsky   2020-04-27  2142  	if (err)
04bcc1c2d0d7bf Leon Romanovsky   2020-04-27  2143  		goto err_create;
e126ba97dba9ed Eli Cohen         2013-07-07  2144  =

19098df2da784c majd(a)mellanox.com 2016-01-14  2145  	base->container_mibqp=
 =3D qp;
19098df2da784c majd(a)mellanox.com 2016-01-14  2146  	base->mqp.event =3D m=
lx5_ib_qp_event;
92cd667c0e8a67 Leon Romanovsky   2020-06-02  2147  	if (MLX5_CAP_GEN(mdev, =
ece_support))
3e09a427ae7ac3 Leon Romanovsky   2020-05-26  2148  		params->resp.ece_optio=
ns =3D MLX5_GET(create_qp_out, out, ece);
e126ba97dba9ed Eli Cohen         2013-07-07  2149  =

7aede1a25f4b84 Leon Romanovsky   2020-04-27  2150  	get_cqs(qp->type, init_=
attr->send_cq, init_attr->recv_cq,
89ea94a7b6c40e Maor Gottlieb     2016-06-17  2151  		&send_cq, &recv_cq);
89ea94a7b6c40e Maor Gottlieb     2016-06-17  2152  	spin_lock_irqsave(&dev-=
>reset_flow_resource_lock, flags);
89ea94a7b6c40e Maor Gottlieb     2016-06-17  2153  	mlx5_ib_lock_cqs(send_c=
q, recv_cq);
89ea94a7b6c40e Maor Gottlieb     2016-06-17  2154  	/* Maintain device to Q=
Ps access, needed for further handling via reset
89ea94a7b6c40e Maor Gottlieb     2016-06-17  2155  	 * flow
89ea94a7b6c40e Maor Gottlieb     2016-06-17  2156  	 */
89ea94a7b6c40e Maor Gottlieb     2016-06-17  2157  	list_add_tail(&qp->qps_=
list, &dev->qp_list);
89ea94a7b6c40e Maor Gottlieb     2016-06-17  2158  	/* Maintain CQ to QPs a=
ccess, needed for further handling via reset flow
89ea94a7b6c40e Maor Gottlieb     2016-06-17  2159  	 */
89ea94a7b6c40e Maor Gottlieb     2016-06-17  2160  	if (send_cq)
89ea94a7b6c40e Maor Gottlieb     2016-06-17  2161  		list_add_tail(&qp->cq_=
send_list, &send_cq->list_send_qp);
89ea94a7b6c40e Maor Gottlieb     2016-06-17  2162  	if (recv_cq)
89ea94a7b6c40e Maor Gottlieb     2016-06-17  2163  		list_add_tail(&qp->cq_=
recv_list, &recv_cq->list_recv_qp);
89ea94a7b6c40e Maor Gottlieb     2016-06-17  2164  	mlx5_ib_unlock_cqs(send=
_cq, recv_cq);
89ea94a7b6c40e Maor Gottlieb     2016-06-17  2165  	spin_unlock_irqrestore(=
&dev->reset_flow_resource_lock, flags);
89ea94a7b6c40e Maor Gottlieb     2016-06-17  2166  =

e126ba97dba9ed Eli Cohen         2013-07-07  2167  	return 0;
e126ba97dba9ed Eli Cohen         2013-07-07  2168  =

e126ba97dba9ed Eli Cohen         2013-07-07  2169  err_create:
747c519cdbe4a3 Leon Romanovsky   2020-04-27  2170  	destroy_qp(dev, qp, bas=
e, udata);
e126ba97dba9ed Eli Cohen         2013-07-07  2171  	return err;
e126ba97dba9ed Eli Cohen         2013-07-07  2172  }
e126ba97dba9ed Eli Cohen         2013-07-07  2173  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3334835571588406450==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3334835571588406450==--

