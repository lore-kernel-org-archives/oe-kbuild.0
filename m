Content-Type: multipart/mixed; boundary="===============1694298880599368285=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [leon-rdma:rdma-next 9/87] drivers/infiniband/core/verbs.c:352:9: warning: Identical condition 'ret', second condition is always false
Date: Mon, 07 Sep 2020 06:05:55 +0800
Message-ID: <202009070646.ge2jC9rh%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1694298880599368285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Leon Romanovsky <leonro@mellanox.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git=
 rdma-next
head:   4570aa83f00920ed24eff5c6277ba1a78dbdb2d7
commit: 4e605be4bd64349480660fb7b70527d78b8acd7e [9/87] RDMA: Restore abili=
ty to fail on PD deallocate
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
compiler: mipsel-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/infiniband/core/verbs.c:352:9: warning: Identical condition 'ret=
', second condition is always false [identicalConditionAfterEarlyExit]
    return ret;
           ^
   drivers/infiniband/core/verbs.c:347:6: note: first condition
    if (ret)
        ^
   drivers/infiniband/core/verbs.c:352:9: note: second condition
    return ret;
           ^
>> drivers/infiniband/hw/cxgb4/mem.c:168:24: warning: Either the condition =
'if(data)' is redundant or there is pointer arithmetic with NULL pointer. [=
nullPointerArithmeticRedundantCheck]
     from_dp =3D (u8 *)data + i * C4IW_MAX_INLINE_SIZE;
                          ^
   drivers/infiniband/hw/cxgb4/mem.c:169:6: note: Assuming that condition '=
if(data)' is not redundant
     if (data)
        ^
   drivers/infiniband/hw/cxgb4/mem.c:168:24: note: Null pointer addition
     from_dp =3D (u8 *)data + i * C4IW_MAX_INLINE_SIZE;
                          ^
>> drivers/infiniband/hw/cxgb4/mem.c:552:6: warning: Variable 'err' is reas=
signed a value before the old one has been used. [redundantAssignment]
    err =3D alloc_pbl(mhp, n);
        ^
   drivers/infiniband/hw/cxgb4/mem.c:512:0: note: Variable 'err' is reassig=
ned a value before the old one has been used.
    int err =3D -ENOMEM;
   ^
   drivers/infiniband/hw/cxgb4/mem.c:552:6: note: Variable 'err' is reassig=
ned a value before the old one has been used.
    err =3D alloc_pbl(mhp, n);
        ^
>> drivers/infiniband/hw/cxgb4/t4fw_ri_api.h:769:30: warning: Shifting sign=
ed 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    FW_RI_INIT_RQEQID_SRQ   =3D 1 << 31,
                                ^
>> drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1249:9: warning: Variable 'stat=
us' is reassigned a value before the old one has been used. [redundantAssig=
nment]
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1238:0: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    int status =3D -ENOMEM;
   ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1249:9: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1275:9: warning: Variable 'stat=
us' is reassigned a value before the old one has been used. [redundantAssig=
nment]
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1265:0: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    int status =3D -ENOMEM;
   ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1275:9: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1358:9: warning: Variable 'stat=
us' is reassigned a value before the old one has been used. [redundantAssig=
nment]
    status =3D ocrdma_nonemb_mbx_cmd(dev, mqe, dma.va);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1329:0: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    int status =3D -ENOMEM;
   ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1358:9: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    status =3D ocrdma_nonemb_mbx_cmd(dev, mqe, dma.va);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1385:9: warning: Variable 'stat=
us' is reassigned a value before the old one has been used. [redundantAssig=
nment]
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1378:0: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    int status =3D -ENOMEM;
   ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1385:9: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1412:9: warning: Variable 'stat=
us' is reassigned a value before the old one has been used. [redundantAssig=
nment]
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1398:0: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    int status =3D -ENOMEM;
   ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1412:9: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1442:9: warning: Variable 'stat=
us' is reassigned a value before the old one has been used. [redundantAssig=
nment]
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1430:0: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    int status =3D -ENOMEM;
   ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1442:9: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1473:9: warning: Variable 'stat=
us' is reassigned a value before the old one has been used. [redundantAssig=
nment]
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1464:0: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    int status =3D -ENOMEM;
   ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1473:9: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1500:9: warning: Variable 'stat=
us' is reassigned a value before the old one has been used. [redundantAssig=
nment]
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1493:0: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    int status =3D -ENOMEM;
   ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1500:9: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1544:9: warning: Variable 'stat=
us' is reassigned a value before the old one has been used. [redundantAssig=
nment]
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1508:0: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    int status =3D -ENOMEM;
   ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1544:9: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1700:9: warning: Variable 'stat=
us' is reassigned a value before the old one has been used. [redundantAssig=
nment]
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1646:0: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    int status =3D -ENOMEM;
   ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1700:9: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
>> drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1872:9: warning: Variable 'stat=
us' is reassigned a value before the old one has been used. 'break;' missin=
g? [redundantAssignInSwitch]
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1786:0: note: Variable 'status'=
 is reassigned a value before the old one has been used. 'break;' missing?
    int status =3D -ENOMEM; int max_hw_cqe;
   ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1872:9: note: Variable 'status'=
 is reassigned a value before the old one has been used. 'break;' missing?
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1932:9: warning: Variable 'stat=
us' is reassigned a value before the old one has been used. [redundantAssig=
nment]
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1911:0: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    int status =3D -ENOMEM;
   ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1932:9: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1999:9: warning: Variable 'stat=
us' is reassigned a value before the old one has been used. [redundantAssig=
nment]
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1961:0: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    int status =3D -ENOMEM;
   ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:1999:9: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:2399:9: warning: Variable 'stat=
us' is reassigned a value before the old one has been used. 'break;' missin=
g? [redundantAssignInSwitch]
    status =3D ocrdma_set_create_qp_sq_cmd(cmd, attrs, qp);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:2370:0: note: Variable 'status'=
 is reassigned a value before the old one has been used. 'break;' missing?
    int status =3D -ENOMEM;
   ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:2399:9: note: Variable 'status'=
 is reassigned a value before the old one has been used. 'break;' missing?
    status =3D ocrdma_set_create_qp_sq_cmd(cmd, attrs, qp);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:2476:9: warning: Variable 'stat=
us' is reassigned a value before the old one has been used. [redundantAssig=
nment]
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:2468:0: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    int status =3D -ENOMEM;
   ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:2476:9: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:2705:9: warning: Variable 'stat=
us' is reassigned a value before the old one has been used. [redundantAssig=
nment]
    status =3D ocrdma_set_qp_params(qp, cmd, attrs, attr_mask);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:2684:0: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    int status =3D -ENOMEM;
   ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:2705:9: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    status =3D ocrdma_set_qp_params(qp, cmd, attrs, attr_mask);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:2727:9: warning: Variable 'stat=
us' is reassigned a value before the old one has been used. [redundantAssig=
nment]
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:2719:0: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    int status =3D -ENOMEM;
   ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:2727:9: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:2761:9: warning: Variable 'stat=
us' is reassigned a value before the old one has been used. [redundantAssig=
nment]
    status =3D ocrdma_build_q_conf(&max_rqe_allocated,
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:2746:0: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    int status =3D -ENOMEM;
   ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:2761:9: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    status =3D ocrdma_build_q_conf(&max_rqe_allocated,
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:2830:9: warning: Variable 'stat=
us' is reassigned a value before the old one has been used. [redundantAssig=
nment]
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:2819:0: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    int status =3D -ENOMEM;
   ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:2830:9: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:2845:9: warning: Variable 'stat=
us' is reassigned a value before the old one has been used. [redundantAssig=
nment]
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:2837:0: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    int status =3D -ENOMEM;
   ^
   drivers/infiniband/hw/ocrdma/ocrdma_hw.c:2845:9: note: Variable 'status'=
 is reassigned a value before the old one has been used.
    status =3D ocrdma_mbx_cmd(dev, (struct ocrdma_mqe *)cmd);
           ^
>> drivers/infiniband/hw/ocrdma/ocrdma_hw.c:316:13: warning: Shifting signe=
d 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     val |=3D (1 << OCRDMA_DB_CQ_SOLICIT_SHIFT);
               ^
--
>> drivers/infiniband/hw/cxgb4/cq.c:1110:7: warning: Variable 'ret' is reas=
signed a value before the old one has been used. [redundantAssignment]
     ret =3D ib_copy_to_udata(udata, &uresp,
         ^
   drivers/infiniband/hw/cxgb4/cq.c:1086:7: note: Variable 'ret' is reassig=
ned a value before the old one has been used.
     ret =3D -ENOMEM;
         ^
   drivers/infiniband/hw/cxgb4/cq.c:1110:7: note: Variable 'ret' is reassig=
ned a value before the old one has been used.
     ret =3D ib_copy_to_udata(udata, &uresp,
         ^
>> drivers/infiniband/hw/cxgb4/t4fw_ri_api.h:769:30: warning: Shifting sign=
ed 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    FW_RI_INIT_RQEQID_SRQ   =3D 1 << 31,
                                ^
>> drivers/infiniband/hw/cxgb4/qp.c:2623:6: warning: Variable 'ret' is reas=
signed a value before the old one has been used. [redundantAssignment]
    ret =3D c4iw_ref_send_wait(rdev, skb, wr_waitp, 0, wq->qid, __func__);
        ^
   drivers/infiniband/hw/cxgb4/qp.c:2528:0: note: Variable 'ret' is reassig=
ned a value before the old one has been used.
    int ret =3D -ENOMEM;
   ^
   drivers/infiniband/hw/cxgb4/qp.c:2623:6: note: Variable 'ret' is reassig=
ned a value before the old one has been used.
    ret =3D c4iw_ref_send_wait(rdev, skb, wr_waitp, 0, wq->qid, __func__);
        ^
>> drivers/infiniband/hw/cxgb4/t4fw_ri_api.h:769:30: warning: Shifting sign=
ed 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    FW_RI_INIT_RQEQID_SRQ   =3D 1 << 31,
                                ^
>> drivers/infiniband/hw/cxgb4/qp.c:339:3: warning: Shifting signed 32-bit =
value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     FW_RI_RES_WR_DCAEN_V(0) |
     ^
   drivers/infiniband/hw/cxgb4/qp.c:369:16: warning: Shifting signed 32-bit=
 value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
      cpu_to_be32(FW_RI_RES_WR_DCAEN_V(0) |
                  ^
   drivers/infiniband/hw/cxgb4/qp.c:2607:15: warning: Shifting signed 32-bi=
t value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     cpu_to_be32(FW_RI_RES_WR_DCAEN_V(0) |
                 ^

# https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/commi=
t/?id=3D4e605be4bd64349480660fb7b70527d78b8acd7e
git remote add leon-rdma https://git.kernel.org/pub/scm/linux/kernel/git/le=
on/linux-rdma.git
git fetch --no-tags leon-rdma rdma-next
git checkout 4e605be4bd64349480660fb7b70527d78b8acd7e
vim +/ret +352 drivers/infiniband/core/verbs.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  322  =

7dd78647a2c2c2 Jason Gunthorpe    2015-08-05  323  /**
91f571293e26af Israel Rukshin     2019-05-15  324   * ib_dealloc_pd_user - =
Deallocates a protection domain.
7dd78647a2c2c2 Jason Gunthorpe    2015-08-05  325   * @pd: The protection d=
omain to deallocate.
c4367a26357be5 Shamir Rabinovitch 2019-03-31  326   * @udata: Valid user da=
ta or NULL for kernel object
7dd78647a2c2c2 Jason Gunthorpe    2015-08-05  327   *
7dd78647a2c2c2 Jason Gunthorpe    2015-08-05  328   * It is an error to cal=
l this function while any resources in the pd still
7dd78647a2c2c2 Jason Gunthorpe    2015-08-05  329   * exist.  The caller is=
 responsible to synchronously destroy them and
7dd78647a2c2c2 Jason Gunthorpe    2015-08-05  330   * guarantee no new allo=
cations will happen.
7dd78647a2c2c2 Jason Gunthorpe    2015-08-05  331   */
4e605be4bd6434 Leon Romanovsky    2020-07-08  332  int ib_dealloc_pd_user(s=
truct ib_pd *pd, struct ib_udata *udata)
^1da177e4c3f41 Linus Torvalds     2005-04-16  333  {
7dd78647a2c2c2 Jason Gunthorpe    2015-08-05  334  	int ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16  335  =

50d46335b03baa Christoph Hellwig  2016-09-05  336  	if (pd->__internal_mr) {
c4367a26357be5 Shamir Rabinovitch 2019-03-31  337  		ret =3D pd->device->op=
s.dereg_mr(pd->__internal_mr, NULL);
7dd78647a2c2c2 Jason Gunthorpe    2015-08-05  338  		WARN_ON(ret);
50d46335b03baa Christoph Hellwig  2016-09-05  339  		pd->__internal_mr =3D =
NULL;
96249d70dd7049 Jason Gunthorpe    2015-08-05  340  	}
96249d70dd7049 Jason Gunthorpe    2015-08-05  341  =

7dd78647a2c2c2 Jason Gunthorpe    2015-08-05  342  	/* uverbs manipulates u=
secnt with proper locking, while the kabi
7dd78647a2c2c2 Jason Gunthorpe    2015-08-05  343  	   requires the caller =
to guarantee we can't race here. */
7dd78647a2c2c2 Jason Gunthorpe    2015-08-05  344  	WARN_ON(atomic_read(&pd=
->usecnt));
^1da177e4c3f41 Linus Torvalds     2005-04-16  345  =

4e605be4bd6434 Leon Romanovsky    2020-07-08  346  	ret =3D pd->device->ops=
.dealloc_pd(pd, udata);
4e605be4bd6434 Leon Romanovsky    2020-07-08  347  	if (ret)
4e605be4bd6434 Leon Romanovsky    2020-07-08  348  		return ret;
4e605be4bd6434 Leon Romanovsky    2020-07-08  349  =

9d5f8c209b3f29 Leon Romanovsky    2018-01-28  350  	rdma_restrack_del(&pd->=
res);
21a428a019c9a6 Leon Romanovsky    2019-02-03  351  	kfree(pd);
4e605be4bd6434 Leon Romanovsky    2020-07-08 @352  	return ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16  353  }
c4367a26357be5 Shamir Rabinovitch 2019-03-31  354  EXPORT_SYMBOL(ib_dealloc=
_pd_user);
^1da177e4c3f41 Linus Torvalds     2005-04-16  355  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1694298880599368285==--

