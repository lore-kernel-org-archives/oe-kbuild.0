Content-Type: multipart/mixed; boundary="===============1611349154370139212=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/afs-testing 7/25] net/rxrpc/output.c:193 rxrpc_send_ack_packet() error: uninitialized symbol 'pkt'.
Date: Sat, 10 Sep 2022 20:05:27 +0800
Message-ID: <202209101916.RQciPpLB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1611349154370139212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/afs-te=
sting
head:   2bf929f6fa4538b542f38c93177e4cd5860d90d7
commit: 6a54a9d0ea0f8bf65b344122998933a9c307a0f0 [7/25] rxrpc: Allocate ACK=
 records at proposal and queue for transmission
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: parisc-randconfig-m031-20220908 (https://download.01.org/0day-ci/ar=
chive/20220910/202209101916.RQciPpLB-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/rxrpc/output.c:193 rxrpc_send_ack_packet() error: uninitialized symbol =
'pkt'.
net/rxrpc/recvmsg.c:604 rxrpc_recvmsg() error: we previously assumed 'call-=
>peer' could be null (see line 586)

Old smatch warnings:
net/rxrpc/output.c:228 rxrpc_send_ack_packet() error: uninitialized symbol =
'pkt'.
net/rxrpc/recvmsg.c:571 rxrpc_recvmsg() warn: bitwise AND condition is fals=
e here

vim +/pkt +193 net/rxrpc/output.c

4700c4d80b7bb1 David Howells 2020-08-19  159  =

8d94aa381dab19 David Howells 2016-09-07  160  /*
26cb02aa6d3efe David Howells 2016-10-06  161   * Send an ACK call packet.
8d94aa381dab19 David Howells 2016-09-07  162   */
6a54a9d0ea0f8b David Howells 2020-01-30  163  static int rxrpc_send_ack_pac=
ket(struct rxrpc_local *local, struct rxrpc_txbuf *txb)
8d94aa381dab19 David Howells 2016-09-07  164  {
5273a191dca65a David Howells 2020-01-30  165  	struct rxrpc_connection *con=
n;
26cb02aa6d3efe David Howells 2016-10-06  166  	struct rxrpc_ack_buffer *pkt;
6a54a9d0ea0f8b David Howells 2020-01-30  167  	struct rxrpc_call *call =3D =
txb->call;
8d94aa381dab19 David Howells 2016-09-07  168  	struct msghdr msg;
6a54a9d0ea0f8b David Howells 2020-01-30  169  	struct kvec iov[1];
8d94aa381dab19 David Howells 2016-09-07  170  	rxrpc_serial_t serial;
805b21b929e291 David Howells 2016-09-24  171  	rxrpc_seq_t hard_ack, top;
8d94aa381dab19 David Howells 2016-09-07  172  	size_t len, n;
4700c4d80b7bb1 David Howells 2020-08-19  173  	int ret, rtt_slot =3D -1;
8d94aa381dab19 David Howells 2016-09-07  174  =

5273a191dca65a David Howells 2020-01-30  175  	if (test_bit(RXRPC_CALL_DISC=
ONNECTED, &call->flags))
8d94aa381dab19 David Howells 2016-09-07  176  		return -ECONNRESET;
8d94aa381dab19 David Howells 2016-09-07  177  =

5273a191dca65a David Howells 2020-01-30  178  	conn =3D call->conn;
8d94aa381dab19 David Howells 2016-09-07  179  =

8d94aa381dab19 David Howells 2016-09-07  180  	msg.msg_name	=3D &call->peer=
->srx.transport;
8d94aa381dab19 David Howells 2016-09-07  181  	msg.msg_namelen	=3D call->pe=
er->srx.transport_len;
8d94aa381dab19 David Howells 2016-09-07  182  	msg.msg_control	=3D NULL;
8d94aa381dab19 David Howells 2016-09-07  183  	msg.msg_controllen =3D 0;
8d94aa381dab19 David Howells 2016-09-07  184  	msg.msg_flags	=3D 0;
8d94aa381dab19 David Howells 2016-09-07  185  =

6a54a9d0ea0f8b David Howells 2020-01-30  186  	if (txb->ack.reason =3D=3D R=
XRPC_ACK_PING)
6a54a9d0ea0f8b David Howells 2020-01-30  187  		txb->wire.flags |=3D RXRPC_=
REQUEST_ACK;
8d94aa381dab19 David Howells 2016-09-07  188  =

8d94aa381dab19 David Howells 2016-09-07  189  	spin_lock_bh(&call->lock);
6a54a9d0ea0f8b David Howells 2020-01-30  190  	n =3D rxrpc_fill_out_ack(con=
n, call, txb, &hard_ack, &top);
8d94aa381dab19 David Howells 2016-09-07  191  	spin_unlock_bh(&call->lock);
9a3dedcf18096e David Howells 2022-05-21  192  	if (n =3D=3D 0) {
9a3dedcf18096e David Howells 2022-05-21 @193  		kfree(pkt);
9a3dedcf18096e David Howells 2022-05-21  194  		return 0;
9a3dedcf18096e David Howells 2022-05-21  195  	}
8d94aa381dab19 David Howells 2016-09-07  196  =

6a54a9d0ea0f8b David Howells 2020-01-30  197  	iov[0].iov_base	=3D &txb->wi=
re;
6a54a9d0ea0f8b David Howells 2020-01-30  198  	iov[0].iov_len	=3D sizeof(tx=
b->wire) + sizeof(txb->ack) + n;
6a54a9d0ea0f8b David Howells 2020-01-30  199  	len =3D iov[0].iov_len;
8d94aa381dab19 David Howells 2016-09-07  200  =

b86e218e0d4224 David Howells 2016-09-23  201  	serial =3D atomic_inc_return=
(&conn->serial);
6a54a9d0ea0f8b David Howells 2020-01-30  202  	txb->wire.serial =3D htonl(s=
erial);
4764c0da69dc50 David Howells 2018-07-23  203  	trace_rxrpc_tx_ack(call->deb=
ug_id, serial,
6a54a9d0ea0f8b David Howells 2020-01-30  204  			   ntohl(txb->ack.firstPac=
ket),
6a54a9d0ea0f8b David Howells 2020-01-30  205  			   ntohl(txb->ack.serial),=
 txb->ack.reason, txb->ack.nAcks);
6a54a9d0ea0f8b David Howells 2020-01-30  206  	if (txb->ack_why =3D=3D rxrp=
c_propose_ack_ping_for_lost_ack)
6a54a9d0ea0f8b David Howells 2020-01-30  207  		call->acks_lost_ping =3D se=
rial;
b86e218e0d4224 David Howells 2016-09-23  208  =

6a54a9d0ea0f8b David Howells 2020-01-30  209  	if (txb->ack.reason =3D=3D R=
XRPC_ACK_PING)
4700c4d80b7bb1 David Howells 2020-08-19  210  		rtt_slot =3D rxrpc_begin_rt=
t_probe(call, serial, rxrpc_rtt_tx_ping);
26cb02aa6d3efe David Howells 2016-10-06  211  =

6a54a9d0ea0f8b David Howells 2020-01-30  212  	ret =3D kernel_sendmsg(local=
->socket, &msg, iov, 1, len);
6a54a9d0ea0f8b David Howells 2020-01-30  213  	call->peer->last_tx_at =3D k=
time_get_seconds();
6b47fe1d1ca3ae David Howells 2018-05-10  214  	if (ret < 0)
6b47fe1d1ca3ae David Howells 2018-05-10  215  		trace_rxrpc_tx_fail(call->d=
ebug_id, serial, ret,
4764c0da69dc50 David Howells 2018-07-23  216  				    rxrpc_tx_point_call_a=
ck);
4764c0da69dc50 David Howells 2018-07-23  217  	else
6a54a9d0ea0f8b David Howells 2020-01-30  218  		trace_rxrpc_tx_packet(call-=
>debug_id, &txb->wire,
4764c0da69dc50 David Howells 2018-07-23  219  				      rxrpc_tx_point_call=
_ack);
c7e86acfcee307 David Howells 2018-11-01  220  	rxrpc_tx_backoff(call, ret);
8d94aa381dab19 David Howells 2016-09-07  221  =

26cb02aa6d3efe David Howells 2016-10-06  222  	if (call->state < RXRPC_CALL=
_COMPLETE) {
6a54a9d0ea0f8b David Howells 2020-01-30  223  		if (ret < 0)
4700c4d80b7bb1 David Howells 2020-08-19  224  			rxrpc_cancel_rtt_probe(cal=
l, serial, rtt_slot);
415f44e43282a1 David Howells 2017-11-24  225  		rxrpc_set_keepalive(call);
248f219cb8bcbf David Howells 2016-09-08  226  	}
248f219cb8bcbf David Howells 2016-09-08  227  =

8d94aa381dab19 David Howells 2016-09-07  228  	kfree(pkt);
8d94aa381dab19 David Howells 2016-09-07  229  	return ret;
8d94aa381dab19 David Howells 2016-09-07  230  }
8d94aa381dab19 David Howells 2016-09-07  231  =


:::::: The code@line 193 was first introduced by commit
:::::: 9a3dedcf18096e8f7f22b8777d78c4acfdea1651 rxrpc: Fix decision on when=
 to generate an IDLE ACK

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1611349154370139212==--

