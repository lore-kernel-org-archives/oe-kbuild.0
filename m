Content-Type: multipart/mixed; boundary="===============6942477216798644344=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/core/uverbs_main.c:116:9: warning: Identical condition 'ret', second condition is always false
Date: Sat, 14 Nov 2020 21:26:15 +0800
Message-ID: <202011142107.Sgefr8JD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6942477216798644344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Leon Romanovsky <leonro@mellanox.com>
CC: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f01c30de86f1047e9bae1b1b1417b0ce8dcd15b1
commit: d18bb3e15201918b8d07e85a6e010ca5ed28dad5 RDMA: Clean MW allocation =
and free flows
date:   8 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 8 weeks ago
compiler: aarch64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/infiniband/hw/mthca/mthca_qp.c:793:6: warning: Variable 'err' is=
 reassigned a value before the old one has been used. 'break;' missing? [re=
dundantAssignInSwitch]
    err =3D mthca_MODIFY_QP(dev, cur_state, new_state, qp->qpn, 0,
        ^
   drivers/infiniband/hw/mthca/mthca_qp.c:570:0: note: Variable 'err' is re=
assigned a value before the old one has been used. 'break;' missing?
    int err =3D -EINVAL;
   ^
   drivers/infiniband/hw/mthca/mthca_qp.c:793:6: note: Variable 'err' is re=
assigned a value before the old one has been used. 'break;' missing?
    err =3D mthca_MODIFY_QP(dev, cur_state, new_state, qp->qpn, 0,
        ^
   drivers/infiniband/hw/mthca/mthca_qp.c:1068:6: warning: Variable 'err' i=
s reassigned a value before the old one has been used. 'break;' missing? [r=
edundantAssignInSwitch]
    err =3D mthca_buf_alloc(dev, size, MTHCA_MAX_DIRECT_QP_SIZE,
        ^
   drivers/infiniband/hw/mthca/mthca_qp.c:993:0: note: Variable 'err' is re=
assigned a value before the old one has been used. 'break;' missing?
    int err =3D -ENOMEM;
   ^
   drivers/infiniband/hw/mthca/mthca_qp.c:1068:6: note: Variable 'err' is r=
eassigned a value before the old one has been used. 'break;' missing?
    err =3D mthca_buf_alloc(dev, size, MTHCA_MAX_DIRECT_QP_SIZE,
        ^
>> drivers/infiniband/hw/mthca/mthca_qp.c:791:17: warning: Shifting signed =
32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     sqd_event =3D 1 << 31;
                   ^
   drivers/infiniband/hw/mthca/mthca_qp.c:1766:20: warning: Shifting signed=
 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
       cpu_to_be32((1 << 31) | 4);
                      ^
   drivers/infiniband/hw/mthca/mthca_qp.c:2096:20: warning: Shifting signed=
 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
       cpu_to_be32((1 << 31) | 4);
                      ^
>> drivers/infiniband/ulp/rtrs/rtrs.c:518:42: warning: Boolean result is us=
ed in bitwise operation. Clarify expression with parentheses. [clarifyCondi=
tion]
    WARN_ON(pool->ops && (!pool->ops->alloc ^ !pool->ops->free));
                                            ^
>> drivers/infiniband/sw/rxe/rxe_req.c:364:8: warning: Local variable qp_nu=
m shadows outer function [shadowFunction]
    u32   qp_num;
          ^
   drivers/infiniband/sw/rxe/rxe_loc.h:147:19: note: Shadowed declaration
   static inline int qp_num(struct rxe_qp *qp)
                     ^
   drivers/infiniband/sw/rxe/rxe_req.c:364:8: note: Shadow variable
    u32   qp_num;
          ^
>> drivers/infiniband/core/uverbs_main.c:116:9: warning: Identical conditio=
n 'ret', second condition is always false [identicalConditionAfterEarlyExit]
    return ret;
           ^
   drivers/infiniband/core/uverbs_main.c:111:6: note: first condition
    if (ret)
        ^
   drivers/infiniband/core/uverbs_main.c:116:9: note: second condition
    return ret;
           ^

vim +/ret +116 drivers/infiniband/core/uverbs_main.c

7dc08dcfc8c86cb Yishai Hadas      2018-06-17  104  =

feb7c1e38bccfd1 Christoph Hellwig 2015-12-23  105  int uverbs_dealloc_mw(st=
ruct ib_mw *mw)
feb7c1e38bccfd1 Christoph Hellwig 2015-12-23  106  {
feb7c1e38bccfd1 Christoph Hellwig 2015-12-23  107  	struct ib_pd *pd =3D mw=
->pd;
feb7c1e38bccfd1 Christoph Hellwig 2015-12-23  108  	int ret;
feb7c1e38bccfd1 Christoph Hellwig 2015-12-23  109  =

3023a1e93656c02 Kamal Heib        2018-12-10  110  	ret =3D mw->device->ops=
.dealloc_mw(mw);
d18bb3e15201918 Leon Romanovsky   2020-09-02  111  	if (ret)
d18bb3e15201918 Leon Romanovsky   2020-09-02  112  		return ret;
d18bb3e15201918 Leon Romanovsky   2020-09-02  113  =

feb7c1e38bccfd1 Christoph Hellwig 2015-12-23  114  	atomic_dec(&pd->usecnt);
d18bb3e15201918 Leon Romanovsky   2020-09-02  115  	kfree(mw);
feb7c1e38bccfd1 Christoph Hellwig 2015-12-23 @116  	return ret;
feb7c1e38bccfd1 Christoph Hellwig 2015-12-23  117  }
feb7c1e38bccfd1 Christoph Hellwig 2015-12-23  118  =


:::::: The code at line 116 was first introduced by commit
:::::: feb7c1e38bccfd18cc06677cb648ed2340788fe8 IB: remove in-kernel suppor=
t for memory windows

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Doug Ledford <dledford@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6942477216798644344==--

