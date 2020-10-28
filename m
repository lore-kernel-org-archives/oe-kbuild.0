Content-Type: multipart/mixed; boundary="===============1942607645815001488=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c:226 chcr_ktls_act_open_req() warn: should << 23' be a 64 bit
Date: Thu, 29 Oct 2020 06:08:08 +0800
Message-ID: <202010290604.pXxMTJuR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1942607645815001488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Rohit Maheshwari <rohitm@chelsio.com>

Hi Rohit,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   23859ae44402f4d935b9ee548135dd1e65e2cbf4
commit: a8c16e8ed624f24b2b082fb9a193e0132a5fd108 crypto/chcr: move nic TLS =
functionality to drivers/net
date:   7 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 weeks ago
config: parisc-randconfig-m031-20201028 (attached as .config)
compiler: hppa64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c:226 chcr_ktl=
s_act_open_req() warn: should '(tx_info->adap->params.tp.tx_modq[tx_info->t=
x_chan]) << 23' be a 64 bit type?
drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c:277 chcr_ktl=
s_act_open_req6() warn: should '(tx_info->adap->params.tp.tx_modq[tx_info->=
tx_chan]) << 23' be a 64 bit type?

vim +226 drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c

8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  127  =

8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  128  static int chcr_ktls_update_connec=
tion_state(struct chcr_ktls_info *tx_info,
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  129  					     int new_state)
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  130  {
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  131  	/* This function can be called fr=
om both rx (interrupt context) and tx
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  132  	 * queue contexts.
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  133  	 */
d97793af11e4816 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-04-23  134  	spin_lock_bh(&tx_info->lock);
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  135  	switch (tx_info->connection_state=
) {
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  136  	case KTLS_CONN_CLOSED:
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  137  		tx_info->connection_state =3D ne=
w_state;
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  138  		break;
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  139  =

8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  140  	case KTLS_CONN_ACT_OPEN_REQ:
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  141  		/* only go forward if state is g=
reater than current state. */
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  142  		if (new_state <=3D tx_info->conn=
ection_state)
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  143  			break;
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  144  		/* update to the next state and =
also initialize TCB */
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  145  		tx_info->connection_state =3D ne=
w_state;
df561f6688fef77 drivers/crypto/chelsio/chcr_ktls.c                         =
    Gustavo A. R. Silva 2020-08-23  146  		fallthrough;
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  147  	case KTLS_CONN_ACT_OPEN_RPL:
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  148  		/* if we are stuck in this state=
, means tcb init might not
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  149  		 * received by HW, try sending i=
t again.
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  150  		 */
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  151  		if (!chcr_init_tcb_fields(tx_inf=
o))
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  152  			tx_info->connection_state =3D K=
TLS_CONN_SET_TCB_REQ;
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  153  		break;
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  154  =

8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  155  	case KTLS_CONN_SET_TCB_REQ:
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  156  		/* only go forward if state is g=
reater than current state. */
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  157  		if (new_state <=3D tx_info->conn=
ection_state)
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  158  			break;
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  159  		/* update to the next state and =
check if l2t_state is valid  */
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  160  		tx_info->connection_state =3D ne=
w_state;
df561f6688fef77 drivers/crypto/chelsio/chcr_ktls.c                         =
    Gustavo A. R. Silva 2020-08-23  161  		fallthrough;
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  162  	case KTLS_CONN_SET_TCB_RPL:
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  163  		/* Check if l2t state is valid, =
then move to ready state. */
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  164  		if (cxgb4_check_l2t_valid(tx_inf=
o->l2te)) {
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  165  			tx_info->connection_state =3D K=
TLS_CONN_TX_READY;
a8c16e8ed624f24 drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktl=
s.c Rohit Maheshwari    2020-09-10  166  			atomic64_inc(&tx_info->adap->ch=
_ktls_stats.ktls_tx_ctx);
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  167  		}
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  168  		break;
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  169  =

8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  170  	case KTLS_CONN_TX_READY:
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  171  		/* nothing to be done here */
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  172  		break;
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  173  =

8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  174  	default:
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  175  		pr_err("unknown KTLS connection =
state\n");
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  176  		break;
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  177  	}
d97793af11e4816 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-04-23  178  	spin_unlock_bh(&tx_info->lock);
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  179  =

8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  180  	return tx_info->connection_state;
8a30923e1598c05 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  181  }
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  182  /*
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  183   * chcr_ktls_act_open_req: creates=
 TCB entry for ipv4 connection.
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  184   * @sk - tcp socket.
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  185   * @tx_info - driver specific tls =
info.
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  186   * @atid - connection active tid.
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  187   * return - send success/failure.
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  188   */
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  189  static int chcr_ktls_act_open_req(=
struct sock *sk,
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  190  				  struct chcr_ktls_info *tx_in=
fo,
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  191  				  int atid)
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  192  {
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  193  	struct inet_sock *inet =3D inet_s=
k(sk);
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  194  	struct cpl_t6_act_open_req *cpl6;
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  195  	struct cpl_act_open_req *cpl;
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  196  	struct sk_buff *skb;
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  197  	unsigned int len;
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  198  	int qid_atid;
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  199  	u64 options;
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  200  =

34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  201  	len =3D sizeof(*cpl6);
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  202  	skb =3D alloc_skb(len, GFP_KERNEL=
);
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  203  	if (unlikely(!skb))
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  204  		return -ENOMEM;
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  205  	/* mark it a control pkt */
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  206  	set_wr_txq(skb, CPL_PRIORITY_CONT=
ROL, tx_info->port_id);
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  207  =

34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  208  	cpl6 =3D __skb_put_zero(skb, len);
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  209  	cpl =3D (struct cpl_act_open_req =
*)cpl6;
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  210  	INIT_TP_WR(cpl6, 0);
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  211  	qid_atid =3D TID_QID_V(tx_info->r=
x_qid) |
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  212  		   TID_TID_V(atid);
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  213  	OPCODE_TID(cpl) =3D htonl(MK_OPCO=
DE_TID(CPL_ACT_OPEN_REQ, qid_atid));
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  214  	cpl->local_port =3D inet->inet_sp=
ort;
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  215  	cpl->peer_port =3D inet->inet_dpo=
rt;
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  216  	cpl->local_ip =3D inet->inet_rcv_=
saddr;
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  217  	cpl->peer_ip =3D inet->inet_daddr;
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  218  =

34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  219  	/* fill first 64 bit option field=
. */
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  220  	options =3D TCAM_BYPASS_F | ULP_M=
ODE_V(ULP_MODE_NONE) | NON_OFFLOAD_F |
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  221  		  SMAC_SEL_V(tx_info->smt_idx) |=
 TX_CHAN_V(tx_info->tx_chan);
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  222  	cpl->opt0 =3D cpu_to_be64(options=
);
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  223  =

34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  224  	/* next 64 bit option field. */
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  225  	options =3D
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07 @226  		TX_QUEUE_V(tx_info->adap->params=
.tp.tx_modq[tx_info->tx_chan]);
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  227  	cpl->opt2 =3D htonl(options);
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  228  =

34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  229  	return cxgb4_l2t_send(tx_info->ne=
tdev, skb, tx_info->l2te);
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  230  }
34aba2c45024a08 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  231  =

76d7728db724466 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-06-01  232  #if IS_ENABLED(CONFIG_IPV6)
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  233  /*
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  234   * chcr_ktls_act_open_req6: create=
s TCB entry for ipv6 connection.
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  235   * @sk - tcp socket.
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  236   * @tx_info - driver specific tls =
info.
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  237   * @atid - connection active tid.
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  238   * return - send success/failure.
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  239   */
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  240  static int chcr_ktls_act_open_req6=
(struct sock *sk,
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  241  				   struct chcr_ktls_info *tx_i=
nfo,
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  242  				   int atid)
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  243  {
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  244  	struct inet_sock *inet =3D inet_s=
k(sk);
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  245  	struct cpl_t6_act_open_req6 *cpl6;
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  246  	struct cpl_act_open_req6 *cpl;
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  247  	struct sk_buff *skb;
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  248  	unsigned int len;
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  249  	int qid_atid;
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  250  	u64 options;
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  251  =

62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  252  	len =3D sizeof(*cpl6);
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  253  	skb =3D alloc_skb(len, GFP_KERNEL=
);
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  254  	if (unlikely(!skb))
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  255  		return -ENOMEM;
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  256  	/* mark it a control pkt */
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  257  	set_wr_txq(skb, CPL_PRIORITY_CONT=
ROL, tx_info->port_id);
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  258  =

62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  259  	cpl6 =3D __skb_put_zero(skb, len);
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  260  	cpl =3D (struct cpl_act_open_req6=
 *)cpl6;
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  261  	INIT_TP_WR(cpl6, 0);
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  262  	qid_atid =3D TID_QID_V(tx_info->r=
x_qid) | TID_TID_V(atid);
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  263  	OPCODE_TID(cpl) =3D htonl(MK_OPCO=
DE_TID(CPL_ACT_OPEN_REQ6, qid_atid));
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  264  	cpl->local_port =3D inet->inet_sp=
ort;
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  265  	cpl->peer_port =3D inet->inet_dpo=
rt;
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  266  	cpl->local_ip_hi =3D *(__be64 *)&=
sk->sk_v6_rcv_saddr.in6_u.u6_addr8[0];
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  267  	cpl->local_ip_lo =3D *(__be64 *)&=
sk->sk_v6_rcv_saddr.in6_u.u6_addr8[8];
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  268  	cpl->peer_ip_hi =3D *(__be64 *)&s=
k->sk_v6_daddr.in6_u.u6_addr8[0];
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  269  	cpl->peer_ip_lo =3D *(__be64 *)&s=
k->sk_v6_daddr.in6_u.u6_addr8[8];
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  270  =

62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  271  	/* first 64 bit option field. */
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  272  	options =3D TCAM_BYPASS_F | ULP_M=
ODE_V(ULP_MODE_NONE) | NON_OFFLOAD_F |
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  273  		  SMAC_SEL_V(tx_info->smt_idx) |=
 TX_CHAN_V(tx_info->tx_chan);
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  274  	cpl->opt0 =3D cpu_to_be64(options=
);
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  275  	/* next 64 bit option field. */
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  276  	options =3D
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07 @277  		TX_QUEUE_V(tx_info->adap->params=
.tp.tx_modq[tx_info->tx_chan]);
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  278  	cpl->opt2 =3D htonl(options);
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  279  =

62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  280  	return cxgb4_l2t_send(tx_info->ne=
tdev, skb, tx_info->l2te);
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  281  }
76d7728db724466 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-06-01  282  #endif /* #if IS_ENABLED(CONFIG_IP=
V6) */
62370a4f346dda9 drivers/crypto/chelsio/chcr_ktls.c                         =
    Rohit Maheshwari    2020-03-07  283  =


:::::: The code at line 226 was first introduced by commit
:::::: 34aba2c45024a0899776c2146d4ab105912d728d cxgb4/chcr : Register to tl=
s add and del callback

:::::: TO: Rohit Maheshwari <rohitm@chelsio.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1942607645815001488==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1942607645815001488==--

