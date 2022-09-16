Content-Type: multipart/mixed; boundary="===============7229545078688357135=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/rxrpc/peer_event.c:265 rxrpc_encap_err_rcv() error: uninitialized symbol 'err'.
Date: Sat, 17 Sep 2022 01:07:27 +0800
Message-ID: <202209170122.tA85L5qc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7229545078688357135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6879c2d3b96039ff1668b4328a4d0dd3ea952cff
commit: ac56a0b48da86fd1b4389632fb7c4c8a5d86eefa rxrpc: Fix ICMP/ICMP6 erro=
r handling
date:   2 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
config: m68k-randconfig-m031-20220914 (https://download.01.org/0day-ci/arch=
ive/20220917/202209170122.tA85L5qc-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/rxrpc/peer_event.c:265 rxrpc_encap_err_rcv() error: uninitialized symbo=
l 'err'.

vim +/err +265 net/rxrpc/peer_event.c

ac56a0b48da86f David Howells 2022-08-26  151  =

ac56a0b48da86f David Howells 2022-08-26  152  /*
ac56a0b48da86f David Howells 2022-08-26  153   * Handle an error received o=
n the local endpoint as a tunnel.
ac56a0b48da86f David Howells 2022-08-26  154   */
ac56a0b48da86f David Howells 2022-08-26  155  void rxrpc_encap_err_rcv(stru=
ct sock *sk, struct sk_buff *skb,
ac56a0b48da86f David Howells 2022-08-26  156  			 unsigned int udp_offset)
ac56a0b48da86f David Howells 2022-08-26  157  {
ac56a0b48da86f David Howells 2022-08-26  158  	struct sock_extended_err ee;
ac56a0b48da86f David Howells 2022-08-26  159  	struct sockaddr_rxrpc srx;
ac56a0b48da86f David Howells 2022-08-26  160  	struct rxrpc_local *local;
ac56a0b48da86f David Howells 2022-08-26  161  	struct rxrpc_peer *peer;
ac56a0b48da86f David Howells 2022-08-26  162  	unsigned int info =3D 0;
ac56a0b48da86f David Howells 2022-08-26  163  	int err;
ac56a0b48da86f David Howells 2022-08-26  164  	u8 version =3D ip_hdr(skb)->=
version;
ac56a0b48da86f David Howells 2022-08-26  165  	u8 type =3D icmp_hdr(skb)->t=
ype;
ac56a0b48da86f David Howells 2022-08-26  166  	u8 code =3D icmp_hdr(skb)->c=
ode;
ac56a0b48da86f David Howells 2022-08-26  167  =

ac56a0b48da86f David Howells 2022-08-26  168  	rcu_read_lock();
ac56a0b48da86f David Howells 2022-08-26  169  	local =3D rcu_dereference_sk=
_user_data(sk);
ac56a0b48da86f David Howells 2022-08-26  170  	if (unlikely(!local)) {
ac56a0b48da86f David Howells 2022-08-26  171  		rcu_read_unlock();
ac56a0b48da86f David Howells 2022-08-26  172  		return;
ac56a0b48da86f David Howells 2022-08-26  173  	}
ac56a0b48da86f David Howells 2022-08-26  174  =

ac56a0b48da86f David Howells 2022-08-26  175  	rxrpc_new_skb(skb, rxrpc_skb=
_received);
ac56a0b48da86f David Howells 2022-08-26  176  =

ac56a0b48da86f David Howells 2022-08-26  177  	switch (ip_hdr(skb)->version=
) {
ac56a0b48da86f David Howells 2022-08-26  178  	case IPVERSION:
ac56a0b48da86f David Howells 2022-08-26  179  		peer =3D rxrpc_lookup_peer_=
icmp_rcu(local, skb, udp_offset,
ac56a0b48da86f David Howells 2022-08-26  180  						  &info, &srx);
ac56a0b48da86f David Howells 2022-08-26  181  		break;
ac56a0b48da86f David Howells 2022-08-26  182  #ifdef CONFIG_AF_RXRPC_IPV6
ac56a0b48da86f David Howells 2022-08-26  183  	case 6:
ac56a0b48da86f David Howells 2022-08-26  184  		peer =3D rxrpc_lookup_peer_=
icmp6_rcu(local, skb, udp_offset,
ac56a0b48da86f David Howells 2022-08-26  185  						   &info, &srx);
ac56a0b48da86f David Howells 2022-08-26  186  		break;
ac56a0b48da86f David Howells 2022-08-26  187  #endif
ac56a0b48da86f David Howells 2022-08-26  188  	default:
ac56a0b48da86f David Howells 2022-08-26  189  		rcu_read_unlock();
ac56a0b48da86f David Howells 2022-08-26  190  		return;
ac56a0b48da86f David Howells 2022-08-26  191  	}
ac56a0b48da86f David Howells 2022-08-26  192  =

ac56a0b48da86f David Howells 2022-08-26  193  	if (peer && !rxrpc_get_peer_=
maybe(peer))
ac56a0b48da86f David Howells 2022-08-26  194  		peer =3D NULL;
ac56a0b48da86f David Howells 2022-08-26  195  	if (!peer) {
ac56a0b48da86f David Howells 2022-08-26  196  		rcu_read_unlock();
ac56a0b48da86f David Howells 2022-08-26  197  		return;
ac56a0b48da86f David Howells 2022-08-26  198  	}
ac56a0b48da86f David Howells 2022-08-26  199  =

ac56a0b48da86f David Howells 2022-08-26  200  	memset(&ee, 0, sizeof(ee));
ac56a0b48da86f David Howells 2022-08-26  201  =

ac56a0b48da86f David Howells 2022-08-26  202  	switch (version) {
ac56a0b48da86f David Howells 2022-08-26  203  	case IPVERSION:
ac56a0b48da86f David Howells 2022-08-26  204  		switch (type) {
ac56a0b48da86f David Howells 2022-08-26  205  		case ICMP_DEST_UNREACH:
ac56a0b48da86f David Howells 2022-08-26  206  			switch (code) {
ac56a0b48da86f David Howells 2022-08-26  207  			case ICMP_FRAG_NEEDED:
ac56a0b48da86f David Howells 2022-08-26  208  				rxrpc_adjust_mtu(peer, in=
fo);
ac56a0b48da86f David Howells 2022-08-26  209  				rcu_read_unlock();
ac56a0b48da86f David Howells 2022-08-26  210  				rxrpc_put_peer(peer);
ac56a0b48da86f David Howells 2022-08-26  211  				return;
ac56a0b48da86f David Howells 2022-08-26  212  			default:
ac56a0b48da86f David Howells 2022-08-26  213  				break;
ac56a0b48da86f David Howells 2022-08-26  214  			}
ac56a0b48da86f David Howells 2022-08-26  215  =

ac56a0b48da86f David Howells 2022-08-26  216  			err =3D EHOSTUNREACH;
ac56a0b48da86f David Howells 2022-08-26  217  			if (code <=3D NR_ICMP_UNRE=
ACH) {
ac56a0b48da86f David Howells 2022-08-26  218  				/* Might want to do somet=
hing different with
ac56a0b48da86f David Howells 2022-08-26  219  				 * non-fatal errors
ac56a0b48da86f David Howells 2022-08-26  220  				 */
ac56a0b48da86f David Howells 2022-08-26  221  				//harderr =3D icmp_err_co=
nvert[code].fatal;
ac56a0b48da86f David Howells 2022-08-26  222  				err =3D icmp_err_convert[=
code].errno;
ac56a0b48da86f David Howells 2022-08-26  223  			}
ac56a0b48da86f David Howells 2022-08-26  224  			break;
ac56a0b48da86f David Howells 2022-08-26  225  =

ac56a0b48da86f David Howells 2022-08-26  226  		case ICMP_TIME_EXCEEDED:
ac56a0b48da86f David Howells 2022-08-26  227  			err =3D EHOSTUNREACH;
ac56a0b48da86f David Howells 2022-08-26  228  			break;
ac56a0b48da86f David Howells 2022-08-26  229  		default:
ac56a0b48da86f David Howells 2022-08-26  230  			err =3D EPROTO;
ac56a0b48da86f David Howells 2022-08-26  231  			break;
ac56a0b48da86f David Howells 2022-08-26  232  		}
ac56a0b48da86f David Howells 2022-08-26  233  =

ac56a0b48da86f David Howells 2022-08-26  234  		ee.ee_origin =3D SO_EE_ORIG=
IN_ICMP;
ac56a0b48da86f David Howells 2022-08-26  235  		ee.ee_type =3D type;
ac56a0b48da86f David Howells 2022-08-26  236  		ee.ee_code =3D code;
ac56a0b48da86f David Howells 2022-08-26  237  		ee.ee_errno =3D err;
ac56a0b48da86f David Howells 2022-08-26  238  		break;
ac56a0b48da86f David Howells 2022-08-26  239  =

ac56a0b48da86f David Howells 2022-08-26  240  #ifdef CONFIG_AF_RXRPC_IPV6
ac56a0b48da86f David Howells 2022-08-26  241  	case 6:
ac56a0b48da86f David Howells 2022-08-26  242  		switch (type) {
ac56a0b48da86f David Howells 2022-08-26  243  		case ICMPV6_PKT_TOOBIG:
ac56a0b48da86f David Howells 2022-08-26  244  			rxrpc_adjust_mtu(peer, inf=
o);
ac56a0b48da86f David Howells 2022-08-26  245  			rcu_read_unlock();
ac56a0b48da86f David Howells 2022-08-26  246  			rxrpc_put_peer(peer);
ac56a0b48da86f David Howells 2022-08-26  247  			return;
ac56a0b48da86f David Howells 2022-08-26  248  		}
ac56a0b48da86f David Howells 2022-08-26  249  =

ac56a0b48da86f David Howells 2022-08-26  250  		icmpv6_err_convert(type, co=
de, &err);
ac56a0b48da86f David Howells 2022-08-26  251  =

ac56a0b48da86f David Howells 2022-08-26  252  		if (err =3D=3D EACCES)
ac56a0b48da86f David Howells 2022-08-26  253  			err =3D EHOSTUNREACH;
ac56a0b48da86f David Howells 2022-08-26  254  =

ac56a0b48da86f David Howells 2022-08-26  255  		ee.ee_origin =3D SO_EE_ORIG=
IN_ICMP6;
ac56a0b48da86f David Howells 2022-08-26  256  		ee.ee_type =3D type;
ac56a0b48da86f David Howells 2022-08-26  257  		ee.ee_code =3D code;
ac56a0b48da86f David Howells 2022-08-26  258  		ee.ee_errno =3D err;
ac56a0b48da86f David Howells 2022-08-26  259  		break;
ac56a0b48da86f David Howells 2022-08-26  260  #endif
ac56a0b48da86f David Howells 2022-08-26  261  	}
ac56a0b48da86f David Howells 2022-08-26  262  =

ac56a0b48da86f David Howells 2022-08-26  263  	trace_rxrpc_rx_icmp(peer, &e=
e, &srx);
ac56a0b48da86f David Howells 2022-08-26  264  =

ac56a0b48da86f David Howells 2022-08-26 @265  	rxrpc_distribute_error(peer,=
 err, RXRPC_CALL_NETWORK_ERROR);
ac56a0b48da86f David Howells 2022-08-26  266  	rcu_read_unlock();
ac56a0b48da86f David Howells 2022-08-26  267  	rxrpc_put_peer(peer);
ac56a0b48da86f David Howells 2022-08-26  268  }
ac56a0b48da86f David Howells 2022-08-26  269  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7229545078688357135==--

