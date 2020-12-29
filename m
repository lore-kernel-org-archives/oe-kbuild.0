Content-Type: multipart/mixed; boundary="===============4177563608602295547=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/ulp/rtrs/rtrs-clt.c:1521:28: warning: Variable 'rsp' is not assigned a value.
Date: Tue, 29 Dec 2020 14:26:54 +0800
Message-ID: <202012291449.vlQvXWJ4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4177563608602295547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jack Wang <jinpu.wang@cloud.ionos.com>
CC: Jason Gunthorpe <jgg@mellanox.com>
CC: Danil Kipnis <danil.kipnis@cloud.ionos.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dea8dcf2a9fa8cc540136a6cd885c3beece16ec3
commit: c013fbc1fd341d28269cf0a6b465925186b9a1e1 RDMA/rtrs: include client =
and server modules into kernel compilation
date:   8 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 months ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/infiniband/ulp/rtrs/rtrs-clt.c:1521:28: warning: Variable 'rsp' =
is not assigned a value. [unassignedVariable]
    struct rtrs_msg_rkey_rsp *rsp;
                              ^

vim +/rsp +1521 drivers/infiniband/ulp/rtrs/rtrs-clt.c

6a98d71daea1862 Jack Wang 2020-05-11  1515  =

6a98d71daea1862 Jack Wang 2020-05-11  1516  static int create_con_cq_qp(str=
uct rtrs_clt_con *con)
6a98d71daea1862 Jack Wang 2020-05-11  1517  {
6a98d71daea1862 Jack Wang 2020-05-11  1518  	struct rtrs_clt_sess *sess =3D=
 to_clt_sess(con->c.sess);
6a98d71daea1862 Jack Wang 2020-05-11  1519  	u16 wr_queue_size;
6a98d71daea1862 Jack Wang 2020-05-11  1520  	int err, cq_vector;
6a98d71daea1862 Jack Wang 2020-05-11 @1521  	struct rtrs_msg_rkey_rsp *rsp;
6a98d71daea1862 Jack Wang 2020-05-11  1522  =

6a98d71daea1862 Jack Wang 2020-05-11  1523  	/*
6a98d71daea1862 Jack Wang 2020-05-11  1524  	 * This function can fail, but=
 still destroy_con_cq_qp() should
6a98d71daea1862 Jack Wang 2020-05-11  1525  	 * be called, this is because =
create_con_cq_qp() is called on cm
6a98d71daea1862 Jack Wang 2020-05-11  1526  	 * event path, thus caller/wai=
ter never knows: have we failed before
6a98d71daea1862 Jack Wang 2020-05-11  1527  	 * create_con_cq_qp() or after=
.  To solve this dilemma without
6a98d71daea1862 Jack Wang 2020-05-11  1528  	 * creating any additional fla=
gs just allow destroy_con_cq_qp() be
6a98d71daea1862 Jack Wang 2020-05-11  1529  	 * called many times.
6a98d71daea1862 Jack Wang 2020-05-11  1530  	 */
6a98d71daea1862 Jack Wang 2020-05-11  1531  =

6a98d71daea1862 Jack Wang 2020-05-11  1532  	if (con->c.cid =3D=3D 0) {
6a98d71daea1862 Jack Wang 2020-05-11  1533  		/*
6a98d71daea1862 Jack Wang 2020-05-11  1534  		 * One completion for each re=
ceive and two for each send
6a98d71daea1862 Jack Wang 2020-05-11  1535  		 * (send request + registrati=
on)
6a98d71daea1862 Jack Wang 2020-05-11  1536  		 * + 2 for drain and heartbeat
6a98d71daea1862 Jack Wang 2020-05-11  1537  		 * in case qp gets into error=
 state
6a98d71daea1862 Jack Wang 2020-05-11  1538  		 */
6a98d71daea1862 Jack Wang 2020-05-11  1539  		wr_queue_size =3D SERVICE_CON=
_QUEUE_DEPTH * 3 + 2;
6a98d71daea1862 Jack Wang 2020-05-11  1540  		/* We must be the first here =
*/
6a98d71daea1862 Jack Wang 2020-05-11  1541  		if (WARN_ON(sess->s.dev))
6a98d71daea1862 Jack Wang 2020-05-11  1542  			return -EINVAL;
6a98d71daea1862 Jack Wang 2020-05-11  1543  =

6a98d71daea1862 Jack Wang 2020-05-11  1544  		/*
6a98d71daea1862 Jack Wang 2020-05-11  1545  		 * The whole session uses dev=
ice from user connection.
6a98d71daea1862 Jack Wang 2020-05-11  1546  		 * Be careful not to close us=
er connection before ib dev
6a98d71daea1862 Jack Wang 2020-05-11  1547  		 * is gracefully put.
6a98d71daea1862 Jack Wang 2020-05-11  1548  		 */
6a98d71daea1862 Jack Wang 2020-05-11  1549  		sess->s.dev =3D rtrs_ib_dev_f=
ind_or_add(con->c.cm_id->device,
6a98d71daea1862 Jack Wang 2020-05-11  1550  						       &dev_pd);
6a98d71daea1862 Jack Wang 2020-05-11  1551  		if (!sess->s.dev) {
6a98d71daea1862 Jack Wang 2020-05-11  1552  			rtrs_wrn(sess->clt,
6a98d71daea1862 Jack Wang 2020-05-11  1553  				  "rtrs_ib_dev_find_get_or_=
add(): no memory\n");
6a98d71daea1862 Jack Wang 2020-05-11  1554  			return -ENOMEM;
6a98d71daea1862 Jack Wang 2020-05-11  1555  		}
6a98d71daea1862 Jack Wang 2020-05-11  1556  		sess->s.dev_ref =3D 1;
6a98d71daea1862 Jack Wang 2020-05-11  1557  		query_fast_reg_mode(sess);
6a98d71daea1862 Jack Wang 2020-05-11  1558  	} else {
6a98d71daea1862 Jack Wang 2020-05-11  1559  		/*
6a98d71daea1862 Jack Wang 2020-05-11  1560  		 * Here we assume that sessio=
n members are correctly set.
6a98d71daea1862 Jack Wang 2020-05-11  1561  		 * This is always true if use=
r connection (cid =3D=3D 0) is
6a98d71daea1862 Jack Wang 2020-05-11  1562  		 * established first.
6a98d71daea1862 Jack Wang 2020-05-11  1563  		 */
6a98d71daea1862 Jack Wang 2020-05-11  1564  		if (WARN_ON(!sess->s.dev))
6a98d71daea1862 Jack Wang 2020-05-11  1565  			return -EINVAL;
6a98d71daea1862 Jack Wang 2020-05-11  1566  		if (WARN_ON(!sess->queue_dept=
h))
6a98d71daea1862 Jack Wang 2020-05-11  1567  			return -EINVAL;
6a98d71daea1862 Jack Wang 2020-05-11  1568  =

6a98d71daea1862 Jack Wang 2020-05-11  1569  		/* Shared between connections=
 */
6a98d71daea1862 Jack Wang 2020-05-11  1570  		sess->s.dev_ref++;
6a98d71daea1862 Jack Wang 2020-05-11  1571  		wr_queue_size =3D
6a98d71daea1862 Jack Wang 2020-05-11  1572  			min_t(int, sess->s.dev->ib_d=
ev->attrs.max_qp_wr,
6a98d71daea1862 Jack Wang 2020-05-11  1573  			      /* QD * (REQ + RSP + F=
R REGS or INVS) + drain */
6a98d71daea1862 Jack Wang 2020-05-11  1574  			      sess->queue_depth * 3 =
+ 1);
6a98d71daea1862 Jack Wang 2020-05-11  1575  	}
6a98d71daea1862 Jack Wang 2020-05-11  1576  	/* alloc iu to recv new rkey r=
eply when server reports flags set */
6a98d71daea1862 Jack Wang 2020-05-11  1577  	if (sess->flags =3D=3D RTRS_MS=
G_NEW_RKEY_F || con->c.cid =3D=3D 0) {
6a98d71daea1862 Jack Wang 2020-05-11  1578  		con->rsp_ius =3D rtrs_iu_allo=
c(wr_queue_size, sizeof(*rsp),
6a98d71daea1862 Jack Wang 2020-05-11  1579  					      GFP_KERNEL, sess->s.=
dev->ib_dev,
6a98d71daea1862 Jack Wang 2020-05-11  1580  					      DMA_FROM_DEVICE,
6a98d71daea1862 Jack Wang 2020-05-11  1581  					      rtrs_clt_rdma_done);
6a98d71daea1862 Jack Wang 2020-05-11  1582  		if (!con->rsp_ius)
6a98d71daea1862 Jack Wang 2020-05-11  1583  			return -ENOMEM;
6a98d71daea1862 Jack Wang 2020-05-11  1584  		con->queue_size =3D wr_queue_=
size;
6a98d71daea1862 Jack Wang 2020-05-11  1585  	}
6a98d71daea1862 Jack Wang 2020-05-11  1586  	cq_vector =3D con->cpu % sess-=
>s.dev->ib_dev->num_comp_vectors;
6a98d71daea1862 Jack Wang 2020-05-11  1587  	err =3D rtrs_cq_qp_create(&ses=
s->s, &con->c, sess->max_send_sge,
6a98d71daea1862 Jack Wang 2020-05-11  1588  				 cq_vector, wr_queue_size, =
wr_queue_size,
6a98d71daea1862 Jack Wang 2020-05-11  1589  				 IB_POLL_SOFTIRQ);
6a98d71daea1862 Jack Wang 2020-05-11  1590  	/*
6a98d71daea1862 Jack Wang 2020-05-11  1591  	 * In case of error we do not =
bother to clean previous allocations,
6a98d71daea1862 Jack Wang 2020-05-11  1592  	 * since destroy_con_cq_qp() m=
ust be called.
6a98d71daea1862 Jack Wang 2020-05-11  1593  	 */
6a98d71daea1862 Jack Wang 2020-05-11  1594  =

6a98d71daea1862 Jack Wang 2020-05-11  1595  	if (err)
6a98d71daea1862 Jack Wang 2020-05-11  1596  		return err;
6a98d71daea1862 Jack Wang 2020-05-11  1597  	return err;
6a98d71daea1862 Jack Wang 2020-05-11  1598  }
6a98d71daea1862 Jack Wang 2020-05-11  1599  =


:::::: The code at line 1521 was first introduced by commit
:::::: 6a98d71daea186247005099758af549e6afdd244 RDMA/rtrs: client: main fun=
ctionality

:::::: TO: Jack Wang <jinpu.wang@cloud.ionos.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4177563608602295547==--

