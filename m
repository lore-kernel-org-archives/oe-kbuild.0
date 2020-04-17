Content-Type: multipart/mixed; boundary="===============9022167094968114524=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v12 13/25] RDMA/rtrs: include client and server modules into kernel compilation
Date: Fri, 17 Apr 2020 08:25:30 +0800
Message-ID: <202004170846.kYLcJzCN%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9022167094968114524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200415092045.4729-14-danil.kipnis@cloud.ionos.com>
References: <20200415092045.4729-14-danil.kipnis@cloud.ionos.com>
TO: Danil Kipnis <danil.kipnis@cloud.ionos.com>
TO: linux-block(a)vger.kernel.org
TO: linux-rdma(a)vger.kernel.org
CC: axboe(a)kernel.dk
CC: hch(a)infradead.org
CC: sagi(a)grimberg.me
CC: bvanassche(a)acm.org
CC: leon(a)kernel.org
CC: dledford(a)redhat.com
CC: jgg(a)ziepe.ca
CC: danil.kipnis(a)cloud.ionos.com
CC: jinpu.wang(a)cloud.ionos.com

Hi Danil,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rdma/for-next]
[also build test WARNING on block/for-next driver-core/driver-core-testing =
linus/master v5.7-rc1 next-20200416]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Danil-Kipnis/RTRS-former-I=
BTRS-RDMA-Transport-Library-and-RNBD-former-IBNBD-RDMA-Network-Block-Device=
/20200416-030349
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-n=
ext
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/infiniband/ulp/rtrs/rtrs-srv.c:508:29: warning: Either the condi=
tion '!id' is redundant or there is possible null pointer dereference: id. =
[nullPointerRedundantCheck]
    struct rtrs_srv_con *con =3D id->con;
                               ^
   drivers/infiniband/ulp/rtrs/rtrs-srv.c:513:14: note: Assuming that condi=
tion '!id' is not redundant
    if (WARN_ON(!id))
                ^
   drivers/infiniband/ulp/rtrs/rtrs-srv.c:508:29: note: Null pointer derefe=
rence
    struct rtrs_srv_con *con =3D id->con;
                               ^
>> drivers/infiniband/ulp/rtrs/rtrs-srv.c:1448:3: warning: Statements follo=
wing return, break, continue, goto or throw will never be executed. [unreac=
hableCode]
     fallthrough;
     ^
   drivers/infiniband/ulp/rtrs/rtrs-srv.c:1454:3: warning: Statements follo=
wing return, break, continue, goto or throw will never be executed. [unreac=
hableCode]
     fallthrough;
     ^
   drivers/infiniband/ulp/rtrs/rtrs-srv.c:1460:3: warning: Statements follo=
wing return, break, continue, goto or throw will never be executed. [unreac=
hableCode]
     fallthrough;
     ^
   drivers/infiniband/ulp/rtrs/rtrs-srv.c:145:6: warning: The scope of the =
variable 'i' can be reduced. [variableScope]
    int i;
        ^
   drivers/infiniband/ulp/rtrs/rtrs-srv.c:935:9: warning: The scope of the =
variable 'err' can be reduced. [variableScope]
    int i, err;
           ^
   drivers/infiniband/ulp/rtrs/rtrs-srv.c:951:6: warning: The scope of the =
variable 'err' can be reduced. [variableScope]
    int err, cid;
        ^
   drivers/infiniband/ulp/rtrs/rtrs-srv.c:1209:10: warning: The scope of th=
e variable 'data' can be reduced. [variableScope]
      void *data;
            ^
>> drivers/infiniband/ulp/rtrs/rtrs-srv.c:309:17: warning: Local variable '=
list' shadows outer variable [shadowVariable]
     struct ib_sge list;
                   ^
   drivers/infiniband/ulp/rtrs/rtrs-srv.c:240:17: note: Shadowed declaration
    struct ib_sge *list;
                   ^
   drivers/infiniband/ulp/rtrs/rtrs-srv.c:309:17: note: Shadow variable
     struct ib_sge list;
                   ^
>> drivers/infiniband/ulp/rtrs/rtrs-srv.c:296:65: warning: Clarify calculat=
ion precedence for '%' and '?'. [clarifyCalculation]
    flags =3D atomic_inc_return(&id->con->wr_cnt) % srv->queue_depth ?
                                                                   ^
   drivers/infiniband/ulp/rtrs/rtrs-srv.c:420:61: warning: Clarify calculat=
ion precedence for '%' and '?'. [clarifyCalculation]
    flags =3D atomic_inc_return(&con->wr_cnt) % srv->queue_depth ?
                                                               ^
   drivers/infiniband/ulp/rtrs/rtrs-srv.c:1005:12: warning: 'data' is of ty=
pe 'void *'. When using void pointers in calculations, the behaviour is und=
efined. [arithOperationsOnVoidPointer]
         data + data_len, usr_len);
              ^
   drivers/infiniband/ulp/rtrs/rtrs-srv.c:1058:12: warning: 'data' is of ty=
pe 'void *'. When using void pointers in calculations, the behaviour is und=
efined. [arithOperationsOnVoidPointer]
         data + data_len, usr_len);
              ^
   drivers/infiniband/ulp/rtrs/rtrs-srv.c:315:10: warning: Variable 'rwr.mr=
' is assigned a value that is never used. [unreadVariable]
     rwr.mr =3D srv_mr->mr;
            ^
   drivers/infiniband/ulp/rtrs/rtrs-srv.c:317:11: warning: Variable 'rwr.ke=
y' is assigned a value that is never used. [unreadVariable]
     rwr.key =3D srv_mr->mr->rkey;
             ^
   drivers/infiniband/ulp/rtrs/rtrs-srv.c:318:14: warning: Variable 'rwr.ac=
cess' is assigned a value that is never used. [unreadVariable]
     rwr.access =3D (IB_ACCESS_LOCAL_WRITE |
                ^
   drivers/infiniband/ulp/rtrs/rtrs-srv.c:433:10: warning: Variable 'rwr.mr=
' is assigned a value that is never used. [unreadVariable]
     rwr.mr =3D srv_mr->mr;
            ^
   drivers/infiniband/ulp/rtrs/rtrs-srv.c:434:11: warning: Variable 'rwr.ke=
y' is assigned a value that is never used. [unreadVariable]
     rwr.key =3D srv_mr->mr->rkey;
             ^
   drivers/infiniband/ulp/rtrs/rtrs-srv.c:435:14: warning: Variable 'rwr.ac=
cess' is assigned a value that is never used. [unreadVariable]
     rwr.access =3D (IB_ACCESS_LOCAL_WRITE |
                ^
>> drivers/infiniband/ulp/rtrs/rtrs-srv.c:620:29: warning: Variable 'rsp' i=
s not assigned a value. [unassignedVariable]
     struct rtrs_msg_rkey_rsp *rsp;
                               ^
   drivers/infiniband/ulp/rtrs/rtrs-srv.c:1559:13: warning: Variable 'msg.f=
lags' is assigned a value that is never used. [unreadVariable]
     msg.flags =3D cpu_to_le32(RTRS_MSG_NEW_RKEY_F);
               ^

# https://github.com/0day-ci/linux/commit/5251530e01a7bf307ffa37f99738a9767=
1980bbe
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 5251530e01a7bf307ffa37f99738a97671980bbe
vim +508 drivers/infiniband/ulp/rtrs/rtrs-srv.c

27a5617de6d6eb Jack Wang 2020-04-15  224  =

27a5617de6d6eb Jack Wang 2020-04-15  225  static int rdma_write_sg(struct r=
trs_srv_op *id)
27a5617de6d6eb Jack Wang 2020-04-15  226  {
27a5617de6d6eb Jack Wang 2020-04-15  227  	struct rtrs_sess *s =3D id->con-=
>c.sess;
27a5617de6d6eb Jack Wang 2020-04-15  228  	struct rtrs_srv_sess *sess =3D t=
o_srv_sess(s);
27a5617de6d6eb Jack Wang 2020-04-15  229  	dma_addr_t dma_addr =3D sess->dm=
a_addr[id->msg_id];
27a5617de6d6eb Jack Wang 2020-04-15  230  	struct rtrs_srv_mr *srv_mr;
27a5617de6d6eb Jack Wang 2020-04-15  231  	struct rtrs_srv *srv =3D sess->s=
rv;
27a5617de6d6eb Jack Wang 2020-04-15  232  	struct ib_send_wr inv_wr, imm_wr;
27a5617de6d6eb Jack Wang 2020-04-15  233  	struct ib_rdma_wr *wr =3D NULL;
27a5617de6d6eb Jack Wang 2020-04-15  234  	enum ib_send_flags flags;
27a5617de6d6eb Jack Wang 2020-04-15  235  	size_t sg_cnt;
27a5617de6d6eb Jack Wang 2020-04-15  236  	int err, offset;
27a5617de6d6eb Jack Wang 2020-04-15  237  	bool need_inval;
27a5617de6d6eb Jack Wang 2020-04-15  238  	u32 rkey =3D 0;
27a5617de6d6eb Jack Wang 2020-04-15  239  	struct ib_reg_wr rwr;
27a5617de6d6eb Jack Wang 2020-04-15  240  	struct ib_sge *list;
27a5617de6d6eb Jack Wang 2020-04-15  241  =

27a5617de6d6eb Jack Wang 2020-04-15  242  	sg_cnt =3D le16_to_cpu(id->rd_ms=
g->sg_cnt);
27a5617de6d6eb Jack Wang 2020-04-15  243  	need_inval =3D le16_to_cpu(id->r=
d_msg->flags) & RTRS_MSG_NEED_INVAL_F;
27a5617de6d6eb Jack Wang 2020-04-15  244  	if (unlikely(sg_cnt !=3D 1))
27a5617de6d6eb Jack Wang 2020-04-15  245  		return -EINVAL;
27a5617de6d6eb Jack Wang 2020-04-15  246  =

27a5617de6d6eb Jack Wang 2020-04-15  247  	offset =3D 0;
27a5617de6d6eb Jack Wang 2020-04-15  248  =

27a5617de6d6eb Jack Wang 2020-04-15  249  	wr		=3D &id->tx_wr;
27a5617de6d6eb Jack Wang 2020-04-15  250  	list		=3D &id->tx_sg;
27a5617de6d6eb Jack Wang 2020-04-15  251  	list->addr	=3D dma_addr + offset;
27a5617de6d6eb Jack Wang 2020-04-15  252  	list->length	=3D le32_to_cpu(id-=
>rd_msg->desc[0].len);
27a5617de6d6eb Jack Wang 2020-04-15  253  =

27a5617de6d6eb Jack Wang 2020-04-15  254  	/* WR will fail with length error
27a5617de6d6eb Jack Wang 2020-04-15  255  	 * if this is 0
27a5617de6d6eb Jack Wang 2020-04-15  256  	 */
27a5617de6d6eb Jack Wang 2020-04-15  257  	if (unlikely(list->length =3D=3D=
 0)) {
27a5617de6d6eb Jack Wang 2020-04-15  258  		rtrs_err(s, "Invalid RDMA-Write=
 sg list length 0\n");
27a5617de6d6eb Jack Wang 2020-04-15  259  		return -EINVAL;
27a5617de6d6eb Jack Wang 2020-04-15  260  	}
27a5617de6d6eb Jack Wang 2020-04-15  261  =

27a5617de6d6eb Jack Wang 2020-04-15  262  	list->lkey =3D sess->s.dev->ib_p=
d->local_dma_lkey;
27a5617de6d6eb Jack Wang 2020-04-15  263  	offset +=3D list->length;
27a5617de6d6eb Jack Wang 2020-04-15  264  =

27a5617de6d6eb Jack Wang 2020-04-15  265  	wr->wr.sg_list	=3D list;
27a5617de6d6eb Jack Wang 2020-04-15  266  	wr->wr.num_sge	=3D 1;
27a5617de6d6eb Jack Wang 2020-04-15  267  	wr->remote_addr	=3D le64_to_cpu(=
id->rd_msg->desc[0].addr);
27a5617de6d6eb Jack Wang 2020-04-15  268  	wr->rkey	=3D le32_to_cpu(id->rd_=
msg->desc[0].key);
27a5617de6d6eb Jack Wang 2020-04-15  269  	if (rkey =3D=3D 0)
27a5617de6d6eb Jack Wang 2020-04-15  270  		rkey =3D wr->rkey;
27a5617de6d6eb Jack Wang 2020-04-15  271  	else
27a5617de6d6eb Jack Wang 2020-04-15  272  		/* Only one key is actually use=
d */
27a5617de6d6eb Jack Wang 2020-04-15  273  		WARN_ON_ONCE(rkey !=3D wr->rkey=
);
27a5617de6d6eb Jack Wang 2020-04-15  274  =

27a5617de6d6eb Jack Wang 2020-04-15  275  	wr->wr.opcode =3D IB_WR_RDMA_WRI=
TE;
27a5617de6d6eb Jack Wang 2020-04-15  276  	wr->wr.ex.imm_data =3D 0;
27a5617de6d6eb Jack Wang 2020-04-15  277  	wr->wr.send_flags  =3D 0;
27a5617de6d6eb Jack Wang 2020-04-15  278  =

27a5617de6d6eb Jack Wang 2020-04-15  279  	if (need_inval && always_invalid=
ate) {
27a5617de6d6eb Jack Wang 2020-04-15  280  		wr->wr.next =3D &rwr.wr;
27a5617de6d6eb Jack Wang 2020-04-15  281  		rwr.wr.next =3D &inv_wr;
27a5617de6d6eb Jack Wang 2020-04-15  282  		inv_wr.next =3D &imm_wr;
27a5617de6d6eb Jack Wang 2020-04-15  283  	} else if (always_invalidate) {
27a5617de6d6eb Jack Wang 2020-04-15  284  		wr->wr.next =3D &rwr.wr;
27a5617de6d6eb Jack Wang 2020-04-15  285  		rwr.wr.next =3D &imm_wr;
27a5617de6d6eb Jack Wang 2020-04-15  286  	} else if (need_inval) {
27a5617de6d6eb Jack Wang 2020-04-15  287  		wr->wr.next =3D &inv_wr;
27a5617de6d6eb Jack Wang 2020-04-15  288  		inv_wr.next =3D &imm_wr;
27a5617de6d6eb Jack Wang 2020-04-15  289  	} else {
27a5617de6d6eb Jack Wang 2020-04-15  290  		wr->wr.next =3D &imm_wr;
27a5617de6d6eb Jack Wang 2020-04-15  291  	}
27a5617de6d6eb Jack Wang 2020-04-15  292  	/*
27a5617de6d6eb Jack Wang 2020-04-15  293  	 * From time to time we have to =
post signaled sends,
27a5617de6d6eb Jack Wang 2020-04-15  294  	 * or send queue will fill up an=
d only QP reset can help.
27a5617de6d6eb Jack Wang 2020-04-15  295  	 */
27a5617de6d6eb Jack Wang 2020-04-15  296  	flags =3D atomic_inc_return(&id-=
>con->wr_cnt) % srv->queue_depth ?
27a5617de6d6eb Jack Wang 2020-04-15  297  		0 : IB_SEND_SIGNALED;
27a5617de6d6eb Jack Wang 2020-04-15  298  =

27a5617de6d6eb Jack Wang 2020-04-15  299  	if (need_inval) {
27a5617de6d6eb Jack Wang 2020-04-15  300  		inv_wr.sg_list =3D NULL;
27a5617de6d6eb Jack Wang 2020-04-15  301  		inv_wr.num_sge =3D 0;
27a5617de6d6eb Jack Wang 2020-04-15  302  		inv_wr.opcode =3D IB_WR_SEND_WI=
TH_INV;
27a5617de6d6eb Jack Wang 2020-04-15  303  		inv_wr.send_flags =3D 0;
27a5617de6d6eb Jack Wang 2020-04-15  304  		inv_wr.ex.invalidate_rkey =3D r=
key;
27a5617de6d6eb Jack Wang 2020-04-15  305  	}
27a5617de6d6eb Jack Wang 2020-04-15  306  =

27a5617de6d6eb Jack Wang 2020-04-15  307  	imm_wr.next =3D NULL;
27a5617de6d6eb Jack Wang 2020-04-15  308  	if (always_invalidate) {
27a5617de6d6eb Jack Wang 2020-04-15 @309  		struct ib_sge list;
27a5617de6d6eb Jack Wang 2020-04-15  310  		struct rtrs_msg_rkey_rsp *msg;
27a5617de6d6eb Jack Wang 2020-04-15  311  =

27a5617de6d6eb Jack Wang 2020-04-15  312  		srv_mr =3D &sess->mrs[id->msg_i=
d];
27a5617de6d6eb Jack Wang 2020-04-15  313  		rwr.wr.opcode =3D IB_WR_REG_MR;
27a5617de6d6eb Jack Wang 2020-04-15  314  		rwr.wr.num_sge =3D 0;
27a5617de6d6eb Jack Wang 2020-04-15  315  		rwr.mr =3D srv_mr->mr;
27a5617de6d6eb Jack Wang 2020-04-15  316  		rwr.wr.send_flags =3D 0;
27a5617de6d6eb Jack Wang 2020-04-15  317  		rwr.key =3D srv_mr->mr->rkey;
27a5617de6d6eb Jack Wang 2020-04-15  318  		rwr.access =3D (IB_ACCESS_LOCAL=
_WRITE |
27a5617de6d6eb Jack Wang 2020-04-15  319  			      IB_ACCESS_REMOTE_WRITE);
27a5617de6d6eb Jack Wang 2020-04-15  320  		msg =3D srv_mr->iu->buf;
27a5617de6d6eb Jack Wang 2020-04-15  321  		msg->buf_id =3D cpu_to_le16(id-=
>msg_id);
27a5617de6d6eb Jack Wang 2020-04-15  322  		msg->type =3D cpu_to_le16(RTRS_=
MSG_RKEY_RSP);
27a5617de6d6eb Jack Wang 2020-04-15  323  		msg->rkey =3D cpu_to_le32(srv_m=
r->mr->rkey);
27a5617de6d6eb Jack Wang 2020-04-15  324  =

27a5617de6d6eb Jack Wang 2020-04-15  325  		list.addr   =3D srv_mr->iu->dma=
_addr;
27a5617de6d6eb Jack Wang 2020-04-15  326  		list.length =3D sizeof(*msg);
27a5617de6d6eb Jack Wang 2020-04-15  327  		list.lkey   =3D sess->s.dev->ib=
_pd->local_dma_lkey;
27a5617de6d6eb Jack Wang 2020-04-15  328  		imm_wr.sg_list =3D &list;
27a5617de6d6eb Jack Wang 2020-04-15  329  		imm_wr.num_sge =3D 1;
27a5617de6d6eb Jack Wang 2020-04-15  330  		imm_wr.opcode =3D IB_WR_SEND_WI=
TH_IMM;
27a5617de6d6eb Jack Wang 2020-04-15  331  		ib_dma_sync_single_for_device(s=
ess->s.dev->ib_dev,
27a5617de6d6eb Jack Wang 2020-04-15  332  					      srv_mr->iu->dma_addr,
27a5617de6d6eb Jack Wang 2020-04-15  333  					      srv_mr->iu->size, DMA_=
TO_DEVICE);
27a5617de6d6eb Jack Wang 2020-04-15  334  	} else {
27a5617de6d6eb Jack Wang 2020-04-15  335  		imm_wr.sg_list =3D NULL;
27a5617de6d6eb Jack Wang 2020-04-15  336  		imm_wr.num_sge =3D 0;
27a5617de6d6eb Jack Wang 2020-04-15  337  		imm_wr.opcode =3D IB_WR_RDMA_WR=
ITE_WITH_IMM;
27a5617de6d6eb Jack Wang 2020-04-15  338  	}
27a5617de6d6eb Jack Wang 2020-04-15  339  	imm_wr.send_flags =3D flags;
27a5617de6d6eb Jack Wang 2020-04-15  340  	imm_wr.ex.imm_data =3D cpu_to_be=
32(rtrs_to_io_rsp_imm(id->msg_id,
27a5617de6d6eb Jack Wang 2020-04-15  341  							     0, need_inval));
27a5617de6d6eb Jack Wang 2020-04-15  342  =

27a5617de6d6eb Jack Wang 2020-04-15  343  	imm_wr.wr_cqe   =3D &io_comp_cqe;
27a5617de6d6eb Jack Wang 2020-04-15  344  	ib_dma_sync_single_for_device(se=
ss->s.dev->ib_dev, dma_addr,
27a5617de6d6eb Jack Wang 2020-04-15  345  				      offset, DMA_BIDIRECTION=
AL);
27a5617de6d6eb Jack Wang 2020-04-15  346  =

27a5617de6d6eb Jack Wang 2020-04-15  347  	err =3D ib_post_send(id->con->c.=
qp, &id->tx_wr.wr, NULL);
27a5617de6d6eb Jack Wang 2020-04-15  348  	if (unlikely(err))
27a5617de6d6eb Jack Wang 2020-04-15  349  		rtrs_err(s,
27a5617de6d6eb Jack Wang 2020-04-15  350  			  "Posting RDMA-Write-Request =
to QP failed, err: %d\n",
27a5617de6d6eb Jack Wang 2020-04-15  351  			  err);
27a5617de6d6eb Jack Wang 2020-04-15  352  =

27a5617de6d6eb Jack Wang 2020-04-15  353  	return err;
27a5617de6d6eb Jack Wang 2020-04-15  354  }
27a5617de6d6eb Jack Wang 2020-04-15  355  =

27a5617de6d6eb Jack Wang 2020-04-15  356  /**
27a5617de6d6eb Jack Wang 2020-04-15  357   * send_io_resp_imm() - respond t=
o client with empty IMM on failed READ/WRITE
27a5617de6d6eb Jack Wang 2020-04-15  358   *                      requests =
or on successful WRITE request.
27a5617de6d6eb Jack Wang 2020-04-15  359   * @con:	the connection to send b=
ack result
27a5617de6d6eb Jack Wang 2020-04-15  360   * @id:		the id associated with t=
he IO
27a5617de6d6eb Jack Wang 2020-04-15  361   * @errno:	the error number of th=
e IO.
27a5617de6d6eb Jack Wang 2020-04-15  362   *
27a5617de6d6eb Jack Wang 2020-04-15  363   * Return 0 on success, errno oth=
erwise.
27a5617de6d6eb Jack Wang 2020-04-15  364   */
27a5617de6d6eb Jack Wang 2020-04-15  365  static int send_io_resp_imm(struc=
t rtrs_srv_con *con, struct rtrs_srv_op *id,
27a5617de6d6eb Jack Wang 2020-04-15  366  			    int errno)
27a5617de6d6eb Jack Wang 2020-04-15  367  {
27a5617de6d6eb Jack Wang 2020-04-15  368  	struct rtrs_sess *s =3D con->c.s=
ess;
27a5617de6d6eb Jack Wang 2020-04-15  369  	struct rtrs_srv_sess *sess =3D t=
o_srv_sess(s);
27a5617de6d6eb Jack Wang 2020-04-15  370  	struct ib_send_wr inv_wr, imm_wr=
, *wr =3D NULL;
27a5617de6d6eb Jack Wang 2020-04-15  371  	struct ib_reg_wr rwr;
27a5617de6d6eb Jack Wang 2020-04-15  372  	struct rtrs_srv *srv =3D sess->s=
rv;
27a5617de6d6eb Jack Wang 2020-04-15  373  	struct rtrs_srv_mr *srv_mr;
27a5617de6d6eb Jack Wang 2020-04-15  374  	bool need_inval =3D false;
27a5617de6d6eb Jack Wang 2020-04-15  375  	enum ib_send_flags flags;
27a5617de6d6eb Jack Wang 2020-04-15  376  	u32 imm;
27a5617de6d6eb Jack Wang 2020-04-15  377  	int err;
27a5617de6d6eb Jack Wang 2020-04-15  378  =

27a5617de6d6eb Jack Wang 2020-04-15  379  	if (id->dir =3D=3D READ) {
27a5617de6d6eb Jack Wang 2020-04-15  380  		struct rtrs_msg_rdma_read *rd_m=
sg =3D id->rd_msg;
27a5617de6d6eb Jack Wang 2020-04-15  381  		size_t sg_cnt;
27a5617de6d6eb Jack Wang 2020-04-15  382  =

27a5617de6d6eb Jack Wang 2020-04-15  383  		need_inval =3D le16_to_cpu(rd_m=
sg->flags) &
27a5617de6d6eb Jack Wang 2020-04-15  384  				RTRS_MSG_NEED_INVAL_F;
27a5617de6d6eb Jack Wang 2020-04-15  385  		sg_cnt =3D le16_to_cpu(rd_msg->=
sg_cnt);
27a5617de6d6eb Jack Wang 2020-04-15  386  =

27a5617de6d6eb Jack Wang 2020-04-15  387  		if (need_inval) {
27a5617de6d6eb Jack Wang 2020-04-15  388  			if (likely(sg_cnt)) {
27a5617de6d6eb Jack Wang 2020-04-15  389  				inv_wr.sg_list =3D NULL;
27a5617de6d6eb Jack Wang 2020-04-15  390  				inv_wr.num_sge =3D 0;
27a5617de6d6eb Jack Wang 2020-04-15  391  				inv_wr.opcode =3D IB_WR_SEND_=
WITH_INV;
27a5617de6d6eb Jack Wang 2020-04-15  392  				inv_wr.send_flags =3D 0;
27a5617de6d6eb Jack Wang 2020-04-15  393  				/* Only one key is actually u=
sed */
27a5617de6d6eb Jack Wang 2020-04-15  394  				inv_wr.ex.invalidate_rkey =3D
27a5617de6d6eb Jack Wang 2020-04-15  395  					le32_to_cpu(rd_msg->desc[0].=
key);
27a5617de6d6eb Jack Wang 2020-04-15  396  			} else {
27a5617de6d6eb Jack Wang 2020-04-15  397  				WARN_ON_ONCE(1);
27a5617de6d6eb Jack Wang 2020-04-15  398  				need_inval =3D false;
27a5617de6d6eb Jack Wang 2020-04-15  399  			}
27a5617de6d6eb Jack Wang 2020-04-15  400  		}
27a5617de6d6eb Jack Wang 2020-04-15  401  	}
27a5617de6d6eb Jack Wang 2020-04-15  402  =

27a5617de6d6eb Jack Wang 2020-04-15  403  	if (need_inval && always_invalid=
ate) {
27a5617de6d6eb Jack Wang 2020-04-15  404  		wr =3D &inv_wr;
27a5617de6d6eb Jack Wang 2020-04-15  405  		inv_wr.next =3D &rwr.wr;
27a5617de6d6eb Jack Wang 2020-04-15  406  		rwr.wr.next =3D &imm_wr;
27a5617de6d6eb Jack Wang 2020-04-15  407  	} else if (always_invalidate) {
27a5617de6d6eb Jack Wang 2020-04-15  408  		wr =3D &rwr.wr;
27a5617de6d6eb Jack Wang 2020-04-15  409  		rwr.wr.next =3D &imm_wr;
27a5617de6d6eb Jack Wang 2020-04-15  410  	} else if (need_inval) {
27a5617de6d6eb Jack Wang 2020-04-15  411  		wr =3D &inv_wr;
27a5617de6d6eb Jack Wang 2020-04-15  412  		inv_wr.next =3D &imm_wr;
27a5617de6d6eb Jack Wang 2020-04-15  413  	} else {
27a5617de6d6eb Jack Wang 2020-04-15  414  		wr =3D &imm_wr;
27a5617de6d6eb Jack Wang 2020-04-15  415  	}
27a5617de6d6eb Jack Wang 2020-04-15  416  	/*
27a5617de6d6eb Jack Wang 2020-04-15  417  	 * From time to time we have to =
post signalled sends,
27a5617de6d6eb Jack Wang 2020-04-15  418  	 * or send queue will fill up an=
d only QP reset can help.
27a5617de6d6eb Jack Wang 2020-04-15  419  	 */
27a5617de6d6eb Jack Wang 2020-04-15  420  	flags =3D atomic_inc_return(&con=
->wr_cnt) % srv->queue_depth ?
27a5617de6d6eb Jack Wang 2020-04-15  421  		0 : IB_SEND_SIGNALED;
27a5617de6d6eb Jack Wang 2020-04-15  422  	imm =3D rtrs_to_io_rsp_imm(id->m=
sg_id, errno, need_inval);
27a5617de6d6eb Jack Wang 2020-04-15  423  	imm_wr.next =3D NULL;
27a5617de6d6eb Jack Wang 2020-04-15  424  	if (always_invalidate) {
27a5617de6d6eb Jack Wang 2020-04-15  425  		struct ib_sge list;
27a5617de6d6eb Jack Wang 2020-04-15  426  		struct rtrs_msg_rkey_rsp *msg;
27a5617de6d6eb Jack Wang 2020-04-15  427  =

27a5617de6d6eb Jack Wang 2020-04-15  428  		srv_mr =3D &sess->mrs[id->msg_i=
d];
27a5617de6d6eb Jack Wang 2020-04-15  429  		rwr.wr.next =3D &imm_wr;
27a5617de6d6eb Jack Wang 2020-04-15  430  		rwr.wr.opcode =3D IB_WR_REG_MR;
27a5617de6d6eb Jack Wang 2020-04-15  431  		rwr.wr.num_sge =3D 0;
27a5617de6d6eb Jack Wang 2020-04-15  432  		rwr.wr.send_flags =3D 0;
27a5617de6d6eb Jack Wang 2020-04-15  433  		rwr.mr =3D srv_mr->mr;
27a5617de6d6eb Jack Wang 2020-04-15  434  		rwr.key =3D srv_mr->mr->rkey;
27a5617de6d6eb Jack Wang 2020-04-15  435  		rwr.access =3D (IB_ACCESS_LOCAL=
_WRITE |
27a5617de6d6eb Jack Wang 2020-04-15  436  			      IB_ACCESS_REMOTE_WRITE);
27a5617de6d6eb Jack Wang 2020-04-15  437  		msg =3D srv_mr->iu->buf;
27a5617de6d6eb Jack Wang 2020-04-15  438  		msg->buf_id =3D cpu_to_le16(id-=
>msg_id);
27a5617de6d6eb Jack Wang 2020-04-15  439  		msg->type =3D cpu_to_le16(RTRS_=
MSG_RKEY_RSP);
27a5617de6d6eb Jack Wang 2020-04-15  440  		msg->rkey =3D cpu_to_le32(srv_m=
r->mr->rkey);
27a5617de6d6eb Jack Wang 2020-04-15  441  =

27a5617de6d6eb Jack Wang 2020-04-15  442  		list.addr   =3D srv_mr->iu->dma=
_addr;
27a5617de6d6eb Jack Wang 2020-04-15  443  		list.length =3D sizeof(*msg);
27a5617de6d6eb Jack Wang 2020-04-15  444  		list.lkey   =3D sess->s.dev->ib=
_pd->local_dma_lkey;
27a5617de6d6eb Jack Wang 2020-04-15  445  		imm_wr.sg_list =3D &list;
27a5617de6d6eb Jack Wang 2020-04-15  446  		imm_wr.num_sge =3D 1;
27a5617de6d6eb Jack Wang 2020-04-15  447  		imm_wr.opcode =3D IB_WR_SEND_WI=
TH_IMM;
27a5617de6d6eb Jack Wang 2020-04-15  448  		ib_dma_sync_single_for_device(s=
ess->s.dev->ib_dev,
27a5617de6d6eb Jack Wang 2020-04-15  449  					      srv_mr->iu->dma_addr,
27a5617de6d6eb Jack Wang 2020-04-15  450  					      srv_mr->iu->size, DMA_=
TO_DEVICE);
27a5617de6d6eb Jack Wang 2020-04-15  451  	} else {
27a5617de6d6eb Jack Wang 2020-04-15  452  		imm_wr.sg_list =3D NULL;
27a5617de6d6eb Jack Wang 2020-04-15  453  		imm_wr.num_sge =3D 0;
27a5617de6d6eb Jack Wang 2020-04-15  454  		imm_wr.opcode =3D IB_WR_RDMA_WR=
ITE_WITH_IMM;
27a5617de6d6eb Jack Wang 2020-04-15  455  	}
27a5617de6d6eb Jack Wang 2020-04-15  456  	imm_wr.send_flags =3D flags;
27a5617de6d6eb Jack Wang 2020-04-15  457  	imm_wr.wr_cqe   =3D &io_comp_cqe;
27a5617de6d6eb Jack Wang 2020-04-15  458  =

27a5617de6d6eb Jack Wang 2020-04-15  459  	imm_wr.ex.imm_data =3D cpu_to_be=
32(imm);
27a5617de6d6eb Jack Wang 2020-04-15  460  =

27a5617de6d6eb Jack Wang 2020-04-15  461  	err =3D ib_post_send(id->con->c.=
qp, wr, NULL);
27a5617de6d6eb Jack Wang 2020-04-15  462  	if (unlikely(err))
27a5617de6d6eb Jack Wang 2020-04-15  463  		rtrs_err_rl(s, "Posting RDMA-Re=
ply to QP failed, err: %d\n",
27a5617de6d6eb Jack Wang 2020-04-15  464  			     err);
27a5617de6d6eb Jack Wang 2020-04-15  465  =

27a5617de6d6eb Jack Wang 2020-04-15  466  	return err;
27a5617de6d6eb Jack Wang 2020-04-15  467  }
27a5617de6d6eb Jack Wang 2020-04-15  468  =

27a5617de6d6eb Jack Wang 2020-04-15  469  void close_sess(struct rtrs_srv_s=
ess *sess)
27a5617de6d6eb Jack Wang 2020-04-15  470  {
27a5617de6d6eb Jack Wang 2020-04-15  471  	enum rtrs_srv_state old_state;
27a5617de6d6eb Jack Wang 2020-04-15  472  =

27a5617de6d6eb Jack Wang 2020-04-15  473  	if (rtrs_srv_change_state_get_ol=
d(sess, RTRS_SRV_CLOSING,
27a5617de6d6eb Jack Wang 2020-04-15  474  					   &old_state))
27a5617de6d6eb Jack Wang 2020-04-15  475  		queue_work(rtrs_wq, &sess->clos=
e_work);
27a5617de6d6eb Jack Wang 2020-04-15  476  	WARN_ON(sess->state !=3D RTRS_SR=
V_CLOSING);
27a5617de6d6eb Jack Wang 2020-04-15  477  }
27a5617de6d6eb Jack Wang 2020-04-15  478  =

27a5617de6d6eb Jack Wang 2020-04-15  479  static inline const char *rtrs_sr=
v_state_str(enum rtrs_srv_state state)
27a5617de6d6eb Jack Wang 2020-04-15  480  {
27a5617de6d6eb Jack Wang 2020-04-15  481  	switch (state) {
27a5617de6d6eb Jack Wang 2020-04-15  482  	case RTRS_SRV_CONNECTING:
27a5617de6d6eb Jack Wang 2020-04-15  483  		return "RTRS_SRV_CONNECTING";
27a5617de6d6eb Jack Wang 2020-04-15  484  	case RTRS_SRV_CONNECTED:
27a5617de6d6eb Jack Wang 2020-04-15  485  		return "RTRS_SRV_CONNECTED";
27a5617de6d6eb Jack Wang 2020-04-15  486  	case RTRS_SRV_CLOSING:
27a5617de6d6eb Jack Wang 2020-04-15  487  		return "RTRS_SRV_CLOSING";
27a5617de6d6eb Jack Wang 2020-04-15  488  	case RTRS_SRV_CLOSED:
27a5617de6d6eb Jack Wang 2020-04-15  489  		return "RTRS_SRV_CLOSED";
27a5617de6d6eb Jack Wang 2020-04-15  490  	default:
27a5617de6d6eb Jack Wang 2020-04-15  491  		return "UNKNOWN";
27a5617de6d6eb Jack Wang 2020-04-15  492  	}
27a5617de6d6eb Jack Wang 2020-04-15  493  }
27a5617de6d6eb Jack Wang 2020-04-15  494  =

27a5617de6d6eb Jack Wang 2020-04-15  495  /**
27a5617de6d6eb Jack Wang 2020-04-15  496   * rtrs_srv_resp_rdma() - Finish =
an RDMA request
27a5617de6d6eb Jack Wang 2020-04-15  497   *
27a5617de6d6eb Jack Wang 2020-04-15  498   * @id:		Internal RTRS operation =
identifier
27a5617de6d6eb Jack Wang 2020-04-15  499   * @status:	Response Code sent to=
 the other side for this operation.
27a5617de6d6eb Jack Wang 2020-04-15  500   *		0 =3D success, <=3D0 error
27a5617de6d6eb Jack Wang 2020-04-15  501   * Context: any
27a5617de6d6eb Jack Wang 2020-04-15  502   *
27a5617de6d6eb Jack Wang 2020-04-15  503   * Finish a RDMA operation. A mes=
sage is sent to the client and the
27a5617de6d6eb Jack Wang 2020-04-15  504   * corresponding memory areas wil=
l be released.
27a5617de6d6eb Jack Wang 2020-04-15  505   */
27a5617de6d6eb Jack Wang 2020-04-15  506  bool rtrs_srv_resp_rdma(struct rt=
rs_srv_op *id, int status)
27a5617de6d6eb Jack Wang 2020-04-15  507  {
27a5617de6d6eb Jack Wang 2020-04-15 @508  	struct rtrs_srv_con *con =3D id-=
>con;
27a5617de6d6eb Jack Wang 2020-04-15  509  	struct rtrs_sess *s =3D con->c.s=
ess;
27a5617de6d6eb Jack Wang 2020-04-15  510  	struct rtrs_srv_sess *sess =3D t=
o_srv_sess(s);
27a5617de6d6eb Jack Wang 2020-04-15  511  	int err;
27a5617de6d6eb Jack Wang 2020-04-15  512  =

27a5617de6d6eb Jack Wang 2020-04-15  513  	if (WARN_ON(!id))
27a5617de6d6eb Jack Wang 2020-04-15  514  		return true;
27a5617de6d6eb Jack Wang 2020-04-15  515  =

27a5617de6d6eb Jack Wang 2020-04-15  516  	id->status =3D status;
27a5617de6d6eb Jack Wang 2020-04-15  517  =

27a5617de6d6eb Jack Wang 2020-04-15  518  	if (unlikely(sess->state !=3D RT=
RS_SRV_CONNECTED)) {
27a5617de6d6eb Jack Wang 2020-04-15  519  		rtrs_err_rl(s,
27a5617de6d6eb Jack Wang 2020-04-15  520  			     "Sending I/O response fai=
led,  session is disconnected, sess state %s\n",
27a5617de6d6eb Jack Wang 2020-04-15  521  			     rtrs_srv_state_str(sess->=
state));
27a5617de6d6eb Jack Wang 2020-04-15  522  		goto out;
27a5617de6d6eb Jack Wang 2020-04-15  523  	}
27a5617de6d6eb Jack Wang 2020-04-15  524  	if (always_invalidate) {
27a5617de6d6eb Jack Wang 2020-04-15  525  		struct rtrs_srv_mr *mr =3D &ses=
s->mrs[id->msg_id];
27a5617de6d6eb Jack Wang 2020-04-15  526  =

27a5617de6d6eb Jack Wang 2020-04-15  527  		ib_update_fast_reg_key(mr->mr, =
ib_inc_rkey(mr->mr->rkey));
27a5617de6d6eb Jack Wang 2020-04-15  528  	}
27a5617de6d6eb Jack Wang 2020-04-15  529  	if (unlikely(atomic_sub_return(1,
27a5617de6d6eb Jack Wang 2020-04-15  530  				       &con->sq_wr_avail) < 0=
)) {
27a5617de6d6eb Jack Wang 2020-04-15  531  		pr_err("IB send queue full\n");
27a5617de6d6eb Jack Wang 2020-04-15  532  		atomic_add(1, &con->sq_wr_avail=
);
27a5617de6d6eb Jack Wang 2020-04-15  533  		spin_lock(&con->rsp_wr_wait_loc=
k);
27a5617de6d6eb Jack Wang 2020-04-15  534  		list_add_tail(&id->wait_list, &=
con->rsp_wr_wait_list);
27a5617de6d6eb Jack Wang 2020-04-15  535  		spin_unlock(&con->rsp_wr_wait_l=
ock);
27a5617de6d6eb Jack Wang 2020-04-15  536  		return false;
27a5617de6d6eb Jack Wang 2020-04-15  537  	}
27a5617de6d6eb Jack Wang 2020-04-15  538  =

27a5617de6d6eb Jack Wang 2020-04-15  539  	if (status || id->dir =3D=3D WRI=
TE || !id->rd_msg->sg_cnt)
27a5617de6d6eb Jack Wang 2020-04-15  540  		err =3D send_io_resp_imm(con, i=
d, status);
27a5617de6d6eb Jack Wang 2020-04-15  541  	else
27a5617de6d6eb Jack Wang 2020-04-15  542  		err =3D rdma_write_sg(id);
27a5617de6d6eb Jack Wang 2020-04-15  543  =

27a5617de6d6eb Jack Wang 2020-04-15  544  	if (unlikely(err)) {
27a5617de6d6eb Jack Wang 2020-04-15  545  		rtrs_err_rl(s, "IO response fai=
led: %d\n", err);
27a5617de6d6eb Jack Wang 2020-04-15  546  		close_sess(sess);
27a5617de6d6eb Jack Wang 2020-04-15  547  	}
27a5617de6d6eb Jack Wang 2020-04-15  548  out:
27a5617de6d6eb Jack Wang 2020-04-15  549  	rtrs_srv_put_ops_ids(sess);
27a5617de6d6eb Jack Wang 2020-04-15  550  	return true;
27a5617de6d6eb Jack Wang 2020-04-15  551  }
27a5617de6d6eb Jack Wang 2020-04-15  552  EXPORT_SYMBOL(rtrs_srv_resp_rdma);
27a5617de6d6eb Jack Wang 2020-04-15  553  =

27a5617de6d6eb Jack Wang 2020-04-15  554  /**
27a5617de6d6eb Jack Wang 2020-04-15  555   * rtrs_srv_set_sess_priv() - Set=
 private pointer in rtrs_srv.
27a5617de6d6eb Jack Wang 2020-04-15  556   * @srv:	Session pointer
27a5617de6d6eb Jack Wang 2020-04-15  557   * @priv:	The private pointer tha=
t is associated with the session.
27a5617de6d6eb Jack Wang 2020-04-15  558   */
27a5617de6d6eb Jack Wang 2020-04-15  559  void rtrs_srv_set_sess_priv(struc=
t rtrs_srv *srv, void *priv)
27a5617de6d6eb Jack Wang 2020-04-15  560  {
27a5617de6d6eb Jack Wang 2020-04-15  561  	srv->priv =3D priv;
27a5617de6d6eb Jack Wang 2020-04-15  562  }
27a5617de6d6eb Jack Wang 2020-04-15  563  EXPORT_SYMBOL(rtrs_srv_set_sess_p=
riv);
27a5617de6d6eb Jack Wang 2020-04-15  564  =

27a5617de6d6eb Jack Wang 2020-04-15  565  static void unmap_cont_bufs(struc=
t rtrs_srv_sess *sess)
27a5617de6d6eb Jack Wang 2020-04-15  566  {
27a5617de6d6eb Jack Wang 2020-04-15  567  	int i;
27a5617de6d6eb Jack Wang 2020-04-15  568  =

27a5617de6d6eb Jack Wang 2020-04-15  569  	for (i =3D 0; i < sess->mrs_num;=
 i++) {
27a5617de6d6eb Jack Wang 2020-04-15  570  		struct rtrs_srv_mr *srv_mr;
27a5617de6d6eb Jack Wang 2020-04-15  571  =

27a5617de6d6eb Jack Wang 2020-04-15  572  		srv_mr =3D &sess->mrs[i];
27a5617de6d6eb Jack Wang 2020-04-15  573  		rtrs_iu_free(srv_mr->iu, DMA_TO=
_DEVICE,
27a5617de6d6eb Jack Wang 2020-04-15  574  			      sess->s.dev->ib_dev, 1);
27a5617de6d6eb Jack Wang 2020-04-15  575  		ib_dereg_mr(srv_mr->mr);
27a5617de6d6eb Jack Wang 2020-04-15  576  		ib_dma_unmap_sg(sess->s.dev->ib=
_dev, srv_mr->sgt.sgl,
27a5617de6d6eb Jack Wang 2020-04-15  577  				srv_mr->sgt.nents, DMA_BIDIRE=
CTIONAL);
27a5617de6d6eb Jack Wang 2020-04-15  578  		sg_free_table(&srv_mr->sgt);
27a5617de6d6eb Jack Wang 2020-04-15  579  	}
27a5617de6d6eb Jack Wang 2020-04-15  580  	kfree(sess->mrs);
27a5617de6d6eb Jack Wang 2020-04-15  581  }
27a5617de6d6eb Jack Wang 2020-04-15  582  =

27a5617de6d6eb Jack Wang 2020-04-15  583  static int map_cont_bufs(struct r=
trs_srv_sess *sess)
27a5617de6d6eb Jack Wang 2020-04-15  584  {
27a5617de6d6eb Jack Wang 2020-04-15  585  	struct rtrs_srv *srv =3D sess->s=
rv;
27a5617de6d6eb Jack Wang 2020-04-15  586  	struct rtrs_sess *ss =3D &sess->=
s;
27a5617de6d6eb Jack Wang 2020-04-15  587  	int i, mri, err, mrs_num;
27a5617de6d6eb Jack Wang 2020-04-15  588  	unsigned int chunk_bits;
27a5617de6d6eb Jack Wang 2020-04-15  589  	int chunks_per_mr =3D 1;
27a5617de6d6eb Jack Wang 2020-04-15  590  =

27a5617de6d6eb Jack Wang 2020-04-15  591  	/*
27a5617de6d6eb Jack Wang 2020-04-15  592  	 * Here we map queue_depth chunk=
s to MR.  Firstly we have to
27a5617de6d6eb Jack Wang 2020-04-15  593  	 * figure out how many chunks ca=
n we map per MR.
27a5617de6d6eb Jack Wang 2020-04-15  594  	 */
27a5617de6d6eb Jack Wang 2020-04-15  595  	if (always_invalidate) {
27a5617de6d6eb Jack Wang 2020-04-15  596  		/*
27a5617de6d6eb Jack Wang 2020-04-15  597  		 * in order to do invalidate fo=
r each chunks of memory, we needs
27a5617de6d6eb Jack Wang 2020-04-15  598  		 * more memory regions.
27a5617de6d6eb Jack Wang 2020-04-15  599  		 */
27a5617de6d6eb Jack Wang 2020-04-15  600  		mrs_num =3D srv->queue_depth;
27a5617de6d6eb Jack Wang 2020-04-15  601  	} else {
27a5617de6d6eb Jack Wang 2020-04-15  602  		chunks_per_mr =3D
27a5617de6d6eb Jack Wang 2020-04-15  603  			sess->s.dev->ib_dev->attrs.max=
_fast_reg_page_list_len;
27a5617de6d6eb Jack Wang 2020-04-15  604  		mrs_num =3D DIV_ROUND_UP(srv->q=
ueue_depth, chunks_per_mr);
27a5617de6d6eb Jack Wang 2020-04-15  605  		chunks_per_mr =3D DIV_ROUND_UP(=
srv->queue_depth, mrs_num);
27a5617de6d6eb Jack Wang 2020-04-15  606  	}
27a5617de6d6eb Jack Wang 2020-04-15  607  =

27a5617de6d6eb Jack Wang 2020-04-15  608  	sess->mrs =3D kcalloc(mrs_num, s=
izeof(*sess->mrs), GFP_KERNEL);
27a5617de6d6eb Jack Wang 2020-04-15  609  	if (!sess->mrs)
27a5617de6d6eb Jack Wang 2020-04-15  610  		return -ENOMEM;
27a5617de6d6eb Jack Wang 2020-04-15  611  =

27a5617de6d6eb Jack Wang 2020-04-15  612  	sess->mrs_num =3D mrs_num;
27a5617de6d6eb Jack Wang 2020-04-15  613  =

27a5617de6d6eb Jack Wang 2020-04-15  614  	for (mri =3D 0; mri < mrs_num; m=
ri++) {
27a5617de6d6eb Jack Wang 2020-04-15  615  		struct rtrs_srv_mr *srv_mr =3D =
&sess->mrs[mri];
27a5617de6d6eb Jack Wang 2020-04-15  616  		struct sg_table *sgt =3D &srv_m=
r->sgt;
27a5617de6d6eb Jack Wang 2020-04-15  617  		struct scatterlist *s;
27a5617de6d6eb Jack Wang 2020-04-15  618  		struct ib_mr *mr;
27a5617de6d6eb Jack Wang 2020-04-15  619  		int nr, chunks;
27a5617de6d6eb Jack Wang 2020-04-15 @620  		struct rtrs_msg_rkey_rsp *rsp;
27a5617de6d6eb Jack Wang 2020-04-15  621  =

27a5617de6d6eb Jack Wang 2020-04-15  622  		chunks =3D chunks_per_mr * mri;
27a5617de6d6eb Jack Wang 2020-04-15  623  		if (!always_invalidate)
27a5617de6d6eb Jack Wang 2020-04-15  624  			chunks_per_mr =3D min_t(int, c=
hunks_per_mr,
27a5617de6d6eb Jack Wang 2020-04-15  625  					      srv->queue_depth - chu=
nks);
27a5617de6d6eb Jack Wang 2020-04-15  626  =

27a5617de6d6eb Jack Wang 2020-04-15  627  		err =3D sg_alloc_table(sgt, chu=
nks_per_mr, GFP_KERNEL);
27a5617de6d6eb Jack Wang 2020-04-15  628  		if (err)
27a5617de6d6eb Jack Wang 2020-04-15  629  			goto err;
27a5617de6d6eb Jack Wang 2020-04-15  630  =

27a5617de6d6eb Jack Wang 2020-04-15  631  		for_each_sg(sgt->sgl, s, chunks=
_per_mr, i)
27a5617de6d6eb Jack Wang 2020-04-15  632  			sg_set_page(s, srv->chunks[chu=
nks + i],
27a5617de6d6eb Jack Wang 2020-04-15  633  				    max_chunk_size, 0);
27a5617de6d6eb Jack Wang 2020-04-15  634  =

27a5617de6d6eb Jack Wang 2020-04-15  635  		nr =3D ib_dma_map_sg(sess->s.de=
v->ib_dev, sgt->sgl,
27a5617de6d6eb Jack Wang 2020-04-15  636  				   sgt->nents, DMA_BIDIRECTIO=
NAL);
27a5617de6d6eb Jack Wang 2020-04-15  637  		if (nr < sgt->nents) {
27a5617de6d6eb Jack Wang 2020-04-15  638  			err =3D nr < 0 ? nr : -EINVAL;
27a5617de6d6eb Jack Wang 2020-04-15  639  			goto free_sg;
27a5617de6d6eb Jack Wang 2020-04-15  640  		}
27a5617de6d6eb Jack Wang 2020-04-15  641  		mr =3D ib_alloc_mr(sess->s.dev-=
>ib_pd, IB_MR_TYPE_MEM_REG,
27a5617de6d6eb Jack Wang 2020-04-15  642  				 sgt->nents);
27a5617de6d6eb Jack Wang 2020-04-15  643  		if (IS_ERR(mr)) {
27a5617de6d6eb Jack Wang 2020-04-15  644  			err =3D PTR_ERR(mr);
27a5617de6d6eb Jack Wang 2020-04-15  645  			goto unmap_sg;
27a5617de6d6eb Jack Wang 2020-04-15  646  		}
27a5617de6d6eb Jack Wang 2020-04-15  647  		nr =3D ib_map_mr_sg(mr, sgt->sg=
l, sgt->nents,
27a5617de6d6eb Jack Wang 2020-04-15  648  				  NULL, max_chunk_size);
27a5617de6d6eb Jack Wang 2020-04-15  649  		if (nr < sgt->nents) {
27a5617de6d6eb Jack Wang 2020-04-15  650  			err =3D nr < 0 ? nr : -EINVAL;
27a5617de6d6eb Jack Wang 2020-04-15  651  			goto dereg_mr;
27a5617de6d6eb Jack Wang 2020-04-15  652  		}
27a5617de6d6eb Jack Wang 2020-04-15  653  =

27a5617de6d6eb Jack Wang 2020-04-15  654  		if (always_invalidate) {
27a5617de6d6eb Jack Wang 2020-04-15  655  			srv_mr->iu =3D rtrs_iu_alloc(1=
, sizeof(*rsp), GFP_KERNEL,
27a5617de6d6eb Jack Wang 2020-04-15  656  						    sess->s.dev->ib_dev,
27a5617de6d6eb Jack Wang 2020-04-15  657  						    DMA_TO_DEVICE,
27a5617de6d6eb Jack Wang 2020-04-15  658  						    rtrs_srv_rdma_done);
27a5617de6d6eb Jack Wang 2020-04-15  659  			if (!srv_mr->iu) {
27a5617de6d6eb Jack Wang 2020-04-15  660  				rtrs_err(ss, "rtrs_iu_alloc()=
, err: %d\n",
27a5617de6d6eb Jack Wang 2020-04-15  661  					  -ENOMEM);
27a5617de6d6eb Jack Wang 2020-04-15  662  				goto free_iu;
27a5617de6d6eb Jack Wang 2020-04-15  663  			}
27a5617de6d6eb Jack Wang 2020-04-15  664  		}
27a5617de6d6eb Jack Wang 2020-04-15  665  		/* Eventually dma addr for each=
 chunk can be cached */
27a5617de6d6eb Jack Wang 2020-04-15  666  		for_each_sg(sgt->sgl, s, sgt->o=
rig_nents, i)
27a5617de6d6eb Jack Wang 2020-04-15  667  			sess->dma_addr[chunks + i] =3D=
 sg_dma_address(s);
27a5617de6d6eb Jack Wang 2020-04-15  668  =

27a5617de6d6eb Jack Wang 2020-04-15  669  		ib_update_fast_reg_key(mr, ib_i=
nc_rkey(mr->rkey));
27a5617de6d6eb Jack Wang 2020-04-15  670  		srv_mr->mr =3D mr;
27a5617de6d6eb Jack Wang 2020-04-15  671  =

27a5617de6d6eb Jack Wang 2020-04-15  672  		continue;
27a5617de6d6eb Jack Wang 2020-04-15  673  err:
27a5617de6d6eb Jack Wang 2020-04-15  674  		while (mri--) {
27a5617de6d6eb Jack Wang 2020-04-15  675  			srv_mr =3D &sess->mrs[mri];
27a5617de6d6eb Jack Wang 2020-04-15  676  			sgt =3D &srv_mr->sgt;
27a5617de6d6eb Jack Wang 2020-04-15  677  			mr =3D srv_mr->mr;
27a5617de6d6eb Jack Wang 2020-04-15  678  free_iu:
27a5617de6d6eb Jack Wang 2020-04-15  679  			rtrs_iu_free(srv_mr->iu, DMA_T=
O_DEVICE,
27a5617de6d6eb Jack Wang 2020-04-15  680  				      sess->s.dev->ib_dev, 1);
27a5617de6d6eb Jack Wang 2020-04-15  681  dereg_mr:
27a5617de6d6eb Jack Wang 2020-04-15  682  			ib_dereg_mr(mr);
27a5617de6d6eb Jack Wang 2020-04-15  683  unmap_sg:
27a5617de6d6eb Jack Wang 2020-04-15  684  			ib_dma_unmap_sg(sess->s.dev->i=
b_dev, sgt->sgl,
27a5617de6d6eb Jack Wang 2020-04-15  685  					sgt->nents, DMA_BIDIRECTIONA=
L);
27a5617de6d6eb Jack Wang 2020-04-15  686  free_sg:
27a5617de6d6eb Jack Wang 2020-04-15  687  			sg_free_table(sgt);
27a5617de6d6eb Jack Wang 2020-04-15  688  		}
27a5617de6d6eb Jack Wang 2020-04-15  689  		kfree(sess->mrs);
27a5617de6d6eb Jack Wang 2020-04-15  690  =

27a5617de6d6eb Jack Wang 2020-04-15  691  		return err;
27a5617de6d6eb Jack Wang 2020-04-15  692  	}
27a5617de6d6eb Jack Wang 2020-04-15  693  =

27a5617de6d6eb Jack Wang 2020-04-15  694  	chunk_bits =3D ilog2(srv->queue_=
depth - 1) + 1;
27a5617de6d6eb Jack Wang 2020-04-15  695  	sess->mem_bits =3D (MAX_IMM_PAYL=
_BITS - chunk_bits);
27a5617de6d6eb Jack Wang 2020-04-15  696  =

27a5617de6d6eb Jack Wang 2020-04-15  697  	return 0;
27a5617de6d6eb Jack Wang 2020-04-15  698  }
27a5617de6d6eb Jack Wang 2020-04-15  699  =


:::::: The code at line 508 was first introduced by commit
:::::: 27a5617de6d6ebc88463cd397a321827ac19caf7 RDMA/rtrs: server: main fun=
ctionality

:::::: TO: Jack Wang <jinpu.wang@cloud.ionos.com>
:::::: CC: 0day robot <lkp@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9022167094968114524==--

