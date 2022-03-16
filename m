Content-Type: multipart/mixed; boundary="===============3076647769406518640=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/core/cma.c:4048:3: warning: Null pointer passed as 1st argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
Date: Wed, 16 Mar 2022 10:54:12 +0800
Message-ID: <202203161044.lv767crh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3076647769406518640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "H=C3=A5kon Bugge" <haakon.bugge@oracle.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   09688c0166e76ce2fb85e86b9d99be8b0084cdf9
commit: 8d0d2b0f41b1b2add8a30dbd816051a964efa497 RDMA/cma: Remove open codi=
ng of overflow checking for private_data_len
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220310 (https://download.01.org/0day-ci/archi=
ve/20220316/202203161044.lv767crh-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8d0d2b0f41b1b2add8a30dbd816051a964efa497
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8d0d2b0f41b1b2add8a30dbd816051a964efa497
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/infiniband/core/cma.c:4405:6: note: Loop condition is false.  Ex=
iting loop
           if (READ_ONCE(id_priv->state) !=3D RDMA_CM_CONNECT)
               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/infiniband/core/cma.c:4405:6: note: Assuming the condition is fa=
lse
           if (READ_ONCE(id_priv->state) !=3D RDMA_CM_CONNECT)
               ^
   include/asm-generic/rwonce.h:47:28: note: expanded from macro 'READ_ONCE'
   #define READ_ONCE(x)                                                    \
                                                                           ^
   drivers/infiniband/core/cma.c:4405:2: note: Taking false branch
           if (READ_ONCE(id_priv->state) !=3D RDMA_CM_CONNECT)
           ^
   drivers/infiniband/core/cma.c:4408:6: note: Assuming field 'qp' is non-n=
ull
           if (!id->qp && conn_param) {
               ^~~~~~~
   drivers/infiniband/core/cma.c:4408:14: note: Left side of '&&' is false
           if (!id->qp && conn_param) {
                       ^
   drivers/infiniband/core/cma.c:4413:6: note: Assuming the condition is tr=
ue
           if (rdma_cap_ib_cm(id->device, id->port_num)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4413:2: note: Taking true branch
           if (rdma_cap_ib_cm(id->device, id->port_num)) {
           ^
   drivers/infiniband/core/cma.c:4414:7: note: Assuming field 'qp_type' is =
not equal to IB_QPT_UD
                   if (id->qp_type =3D=3D IB_QPT_UD) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4414:3: note: Taking false branch
                   if (id->qp_type =3D=3D IB_QPT_UD) {
                   ^
   drivers/infiniband/core/cma.c:4424:8: note: Assuming 'conn_param' is null
                           if (conn_param)
                               ^~~~~~~~~~
   drivers/infiniband/core/cma.c:4424:4: note: Taking false branch
                           if (conn_param)
                           ^
   drivers/infiniband/core/cma.c:4427:11: note: Calling 'cma_rep_recv'
                                   ret =3D cma_rep_recv(id_priv);
                                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:1944:8: note: Calling 'cma_modify_qp_rtr'
           ret =3D cma_modify_qp_rtr(id_priv, NULL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:1000:6: note: 'qp_attr_mask' declared with=
out an initial value
           int qp_attr_mask, ret;
               ^~~~~~~~~~~~
   drivers/infiniband/core/cma.c:1003:6: note: Assuming field 'qp' is non-n=
ull
           if (!id_priv->id.qp) {
               ^~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:1003:2: note: Taking false branch
           if (!id_priv->id.qp) {
           ^
   drivers/infiniband/core/cma.c:1010:8: note: Calling 'rdma_init_qp_attr'
           ret =3D rdma_init_qp_attr(&id_priv->id, &qp_attr, &qp_attr_mask);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:1117:6: note: Assuming the condition is fa=
lse
           if (rdma_cap_ib_cm(id->device, id->port_num)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:1117:2: note: Taking false branch
           if (rdma_cap_ib_cm(id->device, id->port_num)) {
           ^
   drivers/infiniband/core/cma.c:1126:13: note: Assuming the condition is f=
alse
           } else if (rdma_cap_iw_cm(id->device, id->port_num)) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:1126:9: note: Taking false branch
           } else if (rdma_cap_iw_cm(id->device, id->port_num)) {
                  ^
   drivers/infiniband/core/cma.c:1139:21: note: The left operand of '&' is =
a garbage value
           if ((*qp_attr_mask & IB_QP_TIMEOUT) && id_priv->timeout_set)
                ~~~~~~~~~~~~~ ^
>> drivers/infiniband/core/cma.c:4048:3: warning: Null pointer passed as 1s=
t argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
                   memcpy(private_data + offset, conn_param->private_data,
                   ^
   drivers/infiniband/core/cma.c:4289:9: note: Calling 'rdma_connect'
           return rdma_connect(id, conn_param);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4266:8: note: Calling 'rdma_connect_locked'
           ret =3D rdma_connect_locked(id, conn_param);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4220:6: note: Assuming the condition is fa=
lse
           if (!cma_comp_exch(id_priv, RDMA_CM_ROUTE_RESOLVED, RDMA_CM_CONN=
ECT))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/infiniband/core/cma.c:4220:2: note: Taking false branch
           if (!cma_comp_exch(id_priv, RDMA_CM_ROUTE_RESOLVED, RDMA_CM_CONN=
ECT))
           ^
   drivers/infiniband/core/cma.c:4223:6: note: Assuming field 'qp' is non-n=
ull
           if (!id->qp) {
               ^~~~~~~
   drivers/infiniband/core/cma.c:4223:2: note: Taking false branch
           if (!id->qp) {
           ^
   drivers/infiniband/core/cma.c:4228:6: note: Assuming the condition is tr=
ue
           if (rdma_cap_ib_cm(id->device, id->port_num)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4228:2: note: Taking true branch
           if (rdma_cap_ib_cm(id->device, id->port_num)) {
           ^
   drivers/infiniband/core/cma.c:4229:7: note: Assuming field 'qp_type' is =
equal to IB_QPT_UD
                   if (id->qp_type =3D=3D IB_QPT_UD)
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4229:3: note: Taking true branch
                   if (id->qp_type =3D=3D IB_QPT_UD)
                   ^
   drivers/infiniband/core/cma.c:4230:10: note: Calling 'cma_resolve_ib_udp'
                           ret =3D cma_resolve_ib_udp(id_priv, conn_param);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4036:6: note: Calling '__must_check_overfl=
ow'
           if (check_add_overflow(offset, conn_param->private_data_len, &re=
q.private_data_len))
               ^
   include/linux/overflow.h:62:37: note: expanded from macro 'check_add_ove=
rflow'
   #define check_add_overflow(a, b, d) __must_check_overflow(({    \
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:51:9: note: Assuming 'overflow' is false
           return unlikely(overflow);
                  ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/overflow.h:51:2: note: Returning zero, which participates =
in a condition later
           return unlikely(overflow);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4036:6: note: Returning from '__must_check=
_overflow'
           if (check_add_overflow(offset, conn_param->private_data_len, &re=
q.private_data_len))
               ^
   include/linux/overflow.h:62:37: note: expanded from macro 'check_add_ove=
rflow'
   #define check_add_overflow(a, b, d) __must_check_overflow(({    \
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4036:2: note: Taking false branch
           if (check_add_overflow(offset, conn_param->private_data_len, &re=
q.private_data_len))
           ^
   drivers/infiniband/core/cma.c:4039:6: note: Assuming field 'private_data=
_len' is 0
           if (req.private_data_len) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4039:2: note: Taking false branch
           if (req.private_data_len) {
           ^
   drivers/infiniband/core/cma.c:4044:3: note: Null pointer value stored to=
 'private_data'
                   private_data =3D NULL;
                   ^~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4047:6: note: Assuming field 'private_data=
' is non-null
           if (conn_param->private_data && conn_param->private_data_len)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4047:6: note: Left side of '&&' is true
   drivers/infiniband/core/cma.c:4047:34: note: Assuming field 'private_dat=
a_len' is not equal to 0
           if (conn_param->private_data && conn_param->private_data_len)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4047:2: note: Taking true branch
           if (conn_param->private_data && conn_param->private_data_len)
           ^
   drivers/infiniband/core/cma.c:4048:3: note: Null pointer passed as 1st a=
rgument to memory copy function
                   memcpy(private_data + offset, conn_param->private_data,
                   ^      ~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4107:3: warning: Null pointer passed as 1s=
t argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
                   memcpy(private_data + offset, conn_param->private_data,
                   ^
   drivers/infiniband/core/cma.c:4289:9: note: Calling 'rdma_connect'
           return rdma_connect(id, conn_param);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4266:8: note: Calling 'rdma_connect_locked'
           ret =3D rdma_connect_locked(id, conn_param);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4220:6: note: Assuming the condition is fa=
lse
           if (!cma_comp_exch(id_priv, RDMA_CM_ROUTE_RESOLVED, RDMA_CM_CONN=
ECT))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/infiniband/core/cma.c:4220:2: note: Taking false branch
           if (!cma_comp_exch(id_priv, RDMA_CM_ROUTE_RESOLVED, RDMA_CM_CONN=
ECT))
           ^
   drivers/infiniband/core/cma.c:4223:6: note: Assuming field 'qp' is non-n=
ull
           if (!id->qp) {
               ^~~~~~~
   drivers/infiniband/core/cma.c:4223:2: note: Taking false branch

vim +4048 drivers/infiniband/core/cma.c

628e5f6d39d5a6 Sean Hefty       2006-11-30  4024  =

628e5f6d39d5a6 Sean Hefty       2006-11-30  4025  static int cma_resolve_ib=
_udp(struct rdma_id_private *id_priv,
628e5f6d39d5a6 Sean Hefty       2006-11-30  4026  			      struct rdma_conn=
_param *conn_param)
628e5f6d39d5a6 Sean Hefty       2006-11-30  4027  {
628e5f6d39d5a6 Sean Hefty       2006-11-30  4028  	struct ib_cm_sidr_req_pa=
ram req;
0c9361fcdeccd3 Jack Morgenstein 2011-07-17  4029  	struct ib_cm_id	*id;
e511d1ae16745b Sean Hefty       2013-07-24  4030  	void *private_data;
c0b64f58e8d495 Bart Van Assche  2017-10-11  4031  	u8 offset;
c0b64f58e8d495 Bart Van Assche  2017-10-11  4032  	int ret;
628e5f6d39d5a6 Sean Hefty       2006-11-30  4033  =

e511d1ae16745b Sean Hefty       2013-07-24  4034  	memset(&req, 0, sizeof r=
eq);
e8160e15930969 Sean Hefty       2013-05-29  4035  	offset =3D cma_user_data=
_offset(id_priv);
8d0d2b0f41b1b2 H=C3=A5kon Bugge      2021-11-23  4036  	if (check_add_overf=
low(offset, conn_param->private_data_len, &req.private_data_len))
04ded167240257 Sean Hefty       2011-12-06  4037  		return -EINVAL;
04ded167240257 Sean Hefty       2011-12-06  4038  =

e8160e15930969 Sean Hefty       2013-05-29  4039  	if (req.private_data_len=
) {
e511d1ae16745b Sean Hefty       2013-07-24  4040  		private_data =3D kzallo=
c(req.private_data_len, GFP_ATOMIC);
e511d1ae16745b Sean Hefty       2013-07-24  4041  		if (!private_data)
628e5f6d39d5a6 Sean Hefty       2006-11-30  4042  			return -ENOMEM;
e8160e15930969 Sean Hefty       2013-05-29  4043  	} else {
e511d1ae16745b Sean Hefty       2013-07-24  4044  		private_data =3D NULL;
e8160e15930969 Sean Hefty       2013-05-29  4045  	}
628e5f6d39d5a6 Sean Hefty       2006-11-30  4046  =

628e5f6d39d5a6 Sean Hefty       2006-11-30  4047  	if (conn_param->private_=
data && conn_param->private_data_len)
e511d1ae16745b Sean Hefty       2013-07-24 @4048  		memcpy(private_data + o=
ffset, conn_param->private_data,
e511d1ae16745b Sean Hefty       2013-07-24  4049  		       conn_param->priv=
ate_data_len);
628e5f6d39d5a6 Sean Hefty       2006-11-30  4050  =

e511d1ae16745b Sean Hefty       2013-07-24  4051  	if (private_data) {
e511d1ae16745b Sean Hefty       2013-07-24  4052  		ret =3D cma_format_hdr(=
private_data, id_priv);
628e5f6d39d5a6 Sean Hefty       2006-11-30  4053  		if (ret)
628e5f6d39d5a6 Sean Hefty       2006-11-30  4054  			goto out;
e511d1ae16745b Sean Hefty       2013-07-24  4055  		req.private_data =3D pr=
ivate_data;
e8160e15930969 Sean Hefty       2013-05-29  4056  	}
628e5f6d39d5a6 Sean Hefty       2006-11-30  4057  =

0c9361fcdeccd3 Jack Morgenstein 2011-07-17  4058  	id =3D ib_create_cm_id(i=
d_priv->id.device, cma_sidr_rep_handler,
0c9361fcdeccd3 Jack Morgenstein 2011-07-17  4059  			     id_priv);
0c9361fcdeccd3 Jack Morgenstein 2011-07-17  4060  	if (IS_ERR(id)) {
0c9361fcdeccd3 Jack Morgenstein 2011-07-17  4061  		ret =3D PTR_ERR(id);
628e5f6d39d5a6 Sean Hefty       2006-11-30  4062  		goto out;
628e5f6d39d5a6 Sean Hefty       2006-11-30  4063  	}
0c9361fcdeccd3 Jack Morgenstein 2011-07-17  4064  	id_priv->cm_id.ib =3D id;
628e5f6d39d5a6 Sean Hefty       2006-11-30  4065  =

f4753834b5d06c Sean Hefty       2013-05-29  4066  	req.path =3D id_priv->id=
.route.path_rec;
815d456ef21a13 Parav Pandit     2018-06-19  4067  	req.sgid_attr =3D id_pri=
v->id.route.addr.dev_addr.sgid_attr;
cf53936f229d81 Sean Hefty       2013-05-29  4068  	req.service_id =3D rdma_=
get_service_id(&id_priv->id, cma_dst_addr(id_priv));
628e5f6d39d5a6 Sean Hefty       2006-11-30  4069  	req.timeout_ms =3D 1 << =
(CMA_CM_RESPONSE_TIMEOUT - 8);
628e5f6d39d5a6 Sean Hefty       2006-11-30  4070  	req.max_cm_retries =3D C=
MA_MAX_CM_RETRIES;
628e5f6d39d5a6 Sean Hefty       2006-11-30  4071  =

ed999f820a6c57 Chuck Lever      2019-12-18  4072  	trace_cm_send_sidr_req(i=
d_priv);
628e5f6d39d5a6 Sean Hefty       2006-11-30  4073  	ret =3D ib_send_cm_sidr_=
req(id_priv->cm_id.ib, &req);
628e5f6d39d5a6 Sean Hefty       2006-11-30  4074  	if (ret) {
628e5f6d39d5a6 Sean Hefty       2006-11-30  4075  		ib_destroy_cm_id(id_pri=
v->cm_id.ib);
628e5f6d39d5a6 Sean Hefty       2006-11-30  4076  		id_priv->cm_id.ib =3D N=
ULL;
628e5f6d39d5a6 Sean Hefty       2006-11-30  4077  	}
628e5f6d39d5a6 Sean Hefty       2006-11-30  4078  out:
e511d1ae16745b Sean Hefty       2013-07-24  4079  	kfree(private_data);
628e5f6d39d5a6 Sean Hefty       2006-11-30  4080  	return ret;
628e5f6d39d5a6 Sean Hefty       2006-11-30  4081  }
628e5f6d39d5a6 Sean Hefty       2006-11-30  4082  =


:::::: The code at line 4048 was first introduced by commit
:::::: e511d1ae16745baca1e6d807c5b963716e8bdd01 RDMA/cma: Fix accessing inv=
alid private data for UD

:::::: TO: Sean Hefty <sean.hefty@intel.com>
:::::: CC: Roland Dreier <roland@purestorage.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3076647769406518640==--

