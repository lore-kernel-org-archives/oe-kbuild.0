Content-Type: multipart/mixed; boundary="===============5608847421190625579=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next 06/19] net: tcp: use kfree_skb_reason() for tcp_v{4, 6}_do_rcv()
Date: Wed, 16 Feb 2022 03:24:10 +0800
Message-ID: <202202160336.QukUwj2F-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5608847421190625579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220215112812.2093852-7-imagedong@tencent.com>
References: <20220215112812.2093852-7-imagedong@tencent.com>
TO: menglong8.dong(a)gmail.com

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20220214]
[cannot apply to net-next/master rostedt-trace/for-next net/master linus/ma=
ster v5.17-rc4 v5.17-rc3 v5.17-rc2 v5.17-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/menglong8-dong-gmail-com/n=
et-add-skb-drop-reasons-for-TCP-IP-dev-and-neigh/20220215-193437
base:    259cbfc98c55ba3b6ef6e61fb7cfc3751dfded1e
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: x86_64-randconfig-m001-20220214 (https://download.01.org/0day-ci/ar=
chive/20220216/202202160336.QukUwj2F-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/ipv6/tcp_ipv6.c:1567 tcp_v6_do_rcv() error: uninitialized symbol 'reaso=
n'.

vim +/reason +1567 net/ipv6/tcp_ipv6.c

^1da177e4c3f415 Linus Torvalds           2005-04-16  1463  =

bbd807dfbf20506 Brian Vazquez            2021-02-01  1464  INDIRECT_CALLABL=
E_DECLARE(struct dst_entry *ipv4_dst_check(struct dst_entry *,
bbd807dfbf20506 Brian Vazquez            2021-02-01  1465  							   u32));
^1da177e4c3f415 Linus Torvalds           2005-04-16  1466  /* The socket mu=
st have it's spinlock held when we get
e994b2f0fb9229a Eric Dumazet             2015-10-02  1467   * here, unless =
it is a TCP_LISTEN socket.
^1da177e4c3f415 Linus Torvalds           2005-04-16  1468   *
^1da177e4c3f415 Linus Torvalds           2005-04-16  1469   * We have a pot=
ential double-lock case here, so even when
^1da177e4c3f415 Linus Torvalds           2005-04-16  1470   * doing backlog=
 processing we use the BH locking scheme.
^1da177e4c3f415 Linus Torvalds           2005-04-16  1471   * This is becau=
se we cannot sleep with the original spinlock
^1da177e4c3f415 Linus Torvalds           2005-04-16  1472   * held.
^1da177e4c3f415 Linus Torvalds           2005-04-16  1473   */
d2489c7b6d7d5ed Eric Dumazet             2021-11-15  1474  INDIRECT_CALLABL=
E_SCOPE
d2489c7b6d7d5ed Eric Dumazet             2021-11-15  1475  int tcp_v6_do_rc=
v(struct sock *sk, struct sk_buff *skb)
^1da177e4c3f415 Linus Torvalds           2005-04-16  1476  {
93a77c11ae79e83 Eric Dumazet             2019-03-19  1477  	struct ipv6_pin=
fo *np =3D tcp_inet6_sk(sk);
^1da177e4c3f415 Linus Torvalds           2005-04-16  1478  	struct sk_buff =
*opt_skb =3D NULL;
8619663f7f150a5 Menglong Dong            2022-02-15  1479  	enum skb_drop_r=
eason reason;
93a77c11ae79e83 Eric Dumazet             2019-03-19  1480  	struct tcp_sock=
 *tp;
^1da177e4c3f415 Linus Torvalds           2005-04-16  1481  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  1482  	/* Imagine: soc=
ket is IPv6. IPv4 packet arrives,
^1da177e4c3f415 Linus Torvalds           2005-04-16  1483  	   goes to IPv4=
 receive handler and backlogged.
^1da177e4c3f415 Linus Torvalds           2005-04-16  1484  	   From backlog=
 it always goes here. Kerboom...
^1da177e4c3f415 Linus Torvalds           2005-04-16  1485  	   Fortunately,=
 tcp_rcv_established and rcv_established
^1da177e4c3f415 Linus Torvalds           2005-04-16  1486  	   handle them =
correctly, but it is not case with
^1da177e4c3f415 Linus Torvalds           2005-04-16  1487  	   tcp_v6_hnd_r=
eq and tcp_v6_send_reset().   --ANK
^1da177e4c3f415 Linus Torvalds           2005-04-16  1488  	 */
^1da177e4c3f415 Linus Torvalds           2005-04-16  1489  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  1490  	if (skb->protoc=
ol =3D=3D htons(ETH_P_IP))
^1da177e4c3f415 Linus Torvalds           2005-04-16  1491  		return tcp_v4_=
do_rcv(sk, skb);
^1da177e4c3f415 Linus Torvalds           2005-04-16  1492  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  1493  	/*
^1da177e4c3f415 Linus Torvalds           2005-04-16  1494  	 *	socket locki=
ng is here for SMP purposes as backlog rcv
^1da177e4c3f415 Linus Torvalds           2005-04-16  1495  	 *	is currently=
 called with bh processing disabled.
^1da177e4c3f415 Linus Torvalds           2005-04-16  1496  	 */
^1da177e4c3f415 Linus Torvalds           2005-04-16  1497  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  1498  	/* Do Stevens' =
IPV6_PKTOPTIONS.
^1da177e4c3f415 Linus Torvalds           2005-04-16  1499  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  1500  	   Yes, guys, i=
t is the only place in our code, where we
^1da177e4c3f415 Linus Torvalds           2005-04-16  1501  	   may make it =
not affecting IPv4.
^1da177e4c3f415 Linus Torvalds           2005-04-16  1502  	   The rest of =
code is protocol independent,
^1da177e4c3f415 Linus Torvalds           2005-04-16  1503  	   and I do not=
 like idea to uglify IPv4.
^1da177e4c3f415 Linus Torvalds           2005-04-16  1504  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  1505  	   Actually, al=
l the idea behind IPV6_PKTOPTIONS
^1da177e4c3f415 Linus Torvalds           2005-04-16  1506  	   looks not ve=
ry well thought. For now we latch
^1da177e4c3f415 Linus Torvalds           2005-04-16  1507  	   options, rec=
eived in the last packet, enqueued
^1da177e4c3f415 Linus Torvalds           2005-04-16  1508  	   by tcp. Feel=
 free to propose better solution.
^1da177e4c3f415 Linus Torvalds           2005-04-16  1509  					       --AN=
K (980728)
^1da177e4c3f415 Linus Torvalds           2005-04-16  1510  	 */
^1da177e4c3f415 Linus Torvalds           2005-04-16  1511  	if (np->rxopt.a=
ll)
7450aaf61f0ae2e Eric Dumazet             2015-11-30  1512  		opt_skb =3D sk=
b_clone(skb, sk_gfp_mask(sk, GFP_ATOMIC));
^1da177e4c3f415 Linus Torvalds           2005-04-16  1513  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  1514  	if (sk->sk_stat=
e =3D=3D TCP_ESTABLISHED) { /* Fast path */
8f905c0e7354ef2 Eric Dumazet             2021-12-20  1515  		struct dst_ent=
ry *dst;
8f905c0e7354ef2 Eric Dumazet             2021-12-20  1516  =

8f905c0e7354ef2 Eric Dumazet             2021-12-20  1517  		dst =3D rcu_de=
reference_protected(sk->sk_rx_dst,
8f905c0e7354ef2 Eric Dumazet             2021-12-20  1518  						lockdep_so=
ck_is_held(sk));
5d299f3d3c8a2fb Eric Dumazet             2012-08-06  1519  =

bdeab991918663a Tom Herbert              2011-08-14  1520  		sock_rps_save_=
rxhash(sk, skb);
3d97379a67486bc Eric Dumazet             2014-11-11  1521  		sk_mark_napi_i=
d(sk, skb);
5d299f3d3c8a2fb Eric Dumazet             2012-08-06  1522  		if (dst) {
0c0a5ef809f9150 Eric Dumazet             2021-10-25  1523  			if (sk->sk_rx=
_dst_ifindex !=3D skb->skb_iif ||
bbd807dfbf20506 Brian Vazquez            2021-02-01  1524  			    INDIRECT_=
CALL_1(dst->ops->check, ip6_dst_check,
ef57c1610dd8fba Eric Dumazet             2021-10-25  1525  					    dst, sk=
->sk_rx_dst_cookie) =3D=3D NULL) {
8f905c0e7354ef2 Eric Dumazet             2021-12-20  1526  				RCU_INIT_POI=
NTER(sk->sk_rx_dst, NULL);
5d299f3d3c8a2fb Eric Dumazet             2012-08-06  1527  				dst_release(=
dst);
5d299f3d3c8a2fb Eric Dumazet             2012-08-06  1528  			}
5d299f3d3c8a2fb Eric Dumazet             2012-08-06  1529  		}
5d299f3d3c8a2fb Eric Dumazet             2012-08-06  1530  =

3d97d88e8091f35 Yafang Shao              2018-05-29  1531  		tcp_rcv_establ=
ished(sk, skb);
^1da177e4c3f415 Linus Torvalds           2005-04-16  1532  		if (opt_skb)
^1da177e4c3f415 Linus Torvalds           2005-04-16  1533  			goto ipv6_pkt=
options;
^1da177e4c3f415 Linus Torvalds           2005-04-16  1534  		return 0;
^1da177e4c3f415 Linus Torvalds           2005-04-16  1535  	}
^1da177e4c3f415 Linus Torvalds           2005-04-16  1536  =

12e25e1041d044d Eric Dumazet             2015-06-03  1537  	if (tcp_checksu=
m_complete(skb))
^1da177e4c3f415 Linus Torvalds           2005-04-16  1538  		goto csum_err;
^1da177e4c3f415 Linus Torvalds           2005-04-16  1539  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  1540  	if (sk->sk_stat=
e =3D=3D TCP_LISTEN) {
079096f103faca2 Eric Dumazet             2015-10-02  1541  		struct sock *n=
sk =3D tcp_v6_cookie_check(sk, skb);
079096f103faca2 Eric Dumazet             2015-10-02  1542  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  1543  		if (!nsk)
^1da177e4c3f415 Linus Torvalds           2005-04-16  1544  			goto discard;
^1da177e4c3f415 Linus Torvalds           2005-04-16  1545  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  1546  		if (nsk !=3D s=
k) {
^1da177e4c3f415 Linus Torvalds           2005-04-16  1547  			if (tcp_child=
_process(sk, nsk, skb))
^1da177e4c3f415 Linus Torvalds           2005-04-16  1548  				goto reset;
^1da177e4c3f415 Linus Torvalds           2005-04-16  1549  			if (opt_skb)
^1da177e4c3f415 Linus Torvalds           2005-04-16  1550  				__kfree_skb(=
opt_skb);
^1da177e4c3f415 Linus Torvalds           2005-04-16  1551  			return 0;
^1da177e4c3f415 Linus Torvalds           2005-04-16  1552  		}
47482f132a689af Neil Horman              2011-04-06  1553  	} else
bdeab991918663a Tom Herbert              2011-08-14  1554  		sock_rps_save_=
rxhash(sk, skb);
^1da177e4c3f415 Linus Torvalds           2005-04-16  1555  =

72ab4a86f7a260d Eric Dumazet             2015-09-29  1556  	if (tcp_rcv_sta=
te_process(sk, skb))
^1da177e4c3f415 Linus Torvalds           2005-04-16  1557  		goto reset;
^1da177e4c3f415 Linus Torvalds           2005-04-16  1558  	if (opt_skb)
^1da177e4c3f415 Linus Torvalds           2005-04-16  1559  		goto ipv6_pkto=
ptions;
^1da177e4c3f415 Linus Torvalds           2005-04-16  1560  	return 0;
^1da177e4c3f415 Linus Torvalds           2005-04-16  1561  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  1562  reset:
cfb6eeb4c860592 YOSHIFUJI Hideaki        2006-11-14  1563  	tcp_v6_send_res=
et(sk, skb);
^1da177e4c3f415 Linus Torvalds           2005-04-16  1564  discard:
^1da177e4c3f415 Linus Torvalds           2005-04-16  1565  	if (opt_skb)
^1da177e4c3f415 Linus Torvalds           2005-04-16  1566  		__kfree_skb(op=
t_skb);
8619663f7f150a5 Menglong Dong            2022-02-15 @1567  	kfree_skb_reaso=
n(skb, reason);
^1da177e4c3f415 Linus Torvalds           2005-04-16  1568  	return 0;
^1da177e4c3f415 Linus Torvalds           2005-04-16  1569  csum_err:
8619663f7f150a5 Menglong Dong            2022-02-15  1570  	reason =3D SKB_=
DROP_REASON_TCP_CSUM;
709c03142399921 Jakub Kicinski           2021-05-14  1571  	trace_tcp_bad_c=
sum(skb);
c10d9310edf5aa4 Eric Dumazet             2016-04-29  1572  	TCP_INC_STATS(s=
ock_net(sk), TCP_MIB_CSUMERRORS);
c10d9310edf5aa4 Eric Dumazet             2016-04-29  1573  	TCP_INC_STATS(s=
ock_net(sk), TCP_MIB_INERRS);
^1da177e4c3f415 Linus Torvalds           2005-04-16  1574  	goto discard;
^1da177e4c3f415 Linus Torvalds           2005-04-16  1575  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  1576  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  1577  ipv6_pktoptions:
^1da177e4c3f415 Linus Torvalds           2005-04-16  1578  	/* Do you ask, =
what is it?
^1da177e4c3f415 Linus Torvalds           2005-04-16  1579  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  1580  	   1. skb was e=
nqueued by tcp.
^1da177e4c3f415 Linus Torvalds           2005-04-16  1581  	   2. skb is ad=
ded to tail of read queue, rather than out of order.
^1da177e4c3f415 Linus Torvalds           2005-04-16  1582  	   3. socket is=
 not in passive state.
^1da177e4c3f415 Linus Torvalds           2005-04-16  1583  	   4. Finally, =
it really contains options, which user wants to receive.
^1da177e4c3f415 Linus Torvalds           2005-04-16  1584  	 */
^1da177e4c3f415 Linus Torvalds           2005-04-16  1585  	tp =3D tcp_sk(s=
k);
^1da177e4c3f415 Linus Torvalds           2005-04-16  1586  	if (TCP_SKB_CB(=
opt_skb)->end_seq =3D=3D tp->rcv_nxt &&
^1da177e4c3f415 Linus Torvalds           2005-04-16  1587  	    !((1 << sk-=
>sk_state) & (TCPF_CLOSE | TCPF_LISTEN))) {
333fad5364d6b45 YOSHIFUJI Hideaki        2005-09-08  1588  		if (np->rxopt.=
bits.rxinfo || np->rxopt.bits.rxoinfo)
870c3151382c980 Eric Dumazet             2014-10-17  1589  			np->mcast_oif=
 =3D tcp_v6_iif(opt_skb);
333fad5364d6b45 YOSHIFUJI Hideaki        2005-09-08  1590  		if (np->rxopt.=
bits.rxhlim || np->rxopt.bits.rxohlim)
0660e03f6b18f19 Arnaldo Carvalho de Melo 2007-04-25  1591  			np->mcast_hop=
s =3D ipv6_hdr(opt_skb)->hop_limit;
82e9f105a28006e Florent Fourcot          2013-12-08  1592  		if (np->rxopt.=
bits.rxflow || np->rxopt.bits.rxtclass)
1397ed35f22d7c3 Florent Fourcot          2013-12-08  1593  			np->rcv_flowi=
nfo =3D ip6_flowinfo(ipv6_hdr(opt_skb));
df3687ffc6653e4 Florent Fourcot          2014-01-17  1594  		if (np->repflo=
w)
df3687ffc6653e4 Florent Fourcot          2014-01-17  1595  			np->flow_labe=
l =3D ip6_flowlabel(ipv6_hdr(opt_skb));
a224772db8420ec Eric Dumazet             2014-09-27  1596  		if (ipv6_opt_a=
ccepted(sk, opt_skb, &TCP_SKB_CB(opt_skb)->header.h6)) {
^1da177e4c3f415 Linus Torvalds           2005-04-16  1597  			skb_set_owner=
_r(opt_skb, sk);
8ce48623f0cf3d6 Eric Dumazet             2016-10-12  1598  			tcp_v6_restor=
e_cb(opt_skb);
^1da177e4c3f415 Linus Torvalds           2005-04-16  1599  			opt_skb =3D x=
chg(&np->pktoptions, opt_skb);
^1da177e4c3f415 Linus Torvalds           2005-04-16  1600  		} else {
^1da177e4c3f415 Linus Torvalds           2005-04-16  1601  			__kfree_skb(o=
pt_skb);
^1da177e4c3f415 Linus Torvalds           2005-04-16  1602  			opt_skb =3D x=
chg(&np->pktoptions, NULL);
^1da177e4c3f415 Linus Torvalds           2005-04-16  1603  		}
^1da177e4c3f415 Linus Torvalds           2005-04-16  1604  	}
^1da177e4c3f415 Linus Torvalds           2005-04-16  1605  =

12c8691de30734a Eric Dumazet             2021-10-25  1606  	consume_skb(opt=
_skb);
^1da177e4c3f415 Linus Torvalds           2005-04-16  1607  	return 0;
^1da177e4c3f415 Linus Torvalds           2005-04-16  1608  }
^1da177e4c3f415 Linus Torvalds           2005-04-16  1609  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5608847421190625579==--

