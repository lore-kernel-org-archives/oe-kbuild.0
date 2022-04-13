Content-Type: multipart/mixed; boundary="===============5735710558753609283=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [saeed:net-next 243/261] net/ipv6/ip6_input.c:169 ip6_rcv_core() error: we previously assumed 'idev' could be null (see line 167)
Date: Thu, 14 Apr 2022 05:21:11 +0800
Message-ID: <202204140552.DxfWehz6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5735710558753609283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Menglong Dong <imagedong@tencent.com>
CC: Jiang Biao <benbjiang@tencent.com>
CC: Hao Peng <flyingpeng@tencent.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git net=
-next
head:   8ac2beba64a8c9072480094c86b9eab8b6cebd99
commit: 4daf841a2ef3b2e987894c8107d309ce2b67c202 [243/261] net: ipv6: add s=
kb drop reasons to ip6_rcv_core()
:::::: branch date: 4 hours ago
:::::: commit date: 9 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
414/202204140552.DxfWehz6-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/ipv6/ip6_input.c:169 ip6_rcv_core() error: we previously assumed 'idev'=
 could be null (see line 167)

Old smatch warnings:
net/ipv6/ip6_input.c:199 ip6_rcv_core() warn: potential spectre issue '_ide=
v->stats.ipv6->mibs' [w]
net/ipv6/ip6_input.c:199 ip6_rcv_core() warn: potential spectre issue 'net-=
>mib.ipv6_statistics->mibs' [w]
net/ipv6/ip6_input.c:382 ip6_protocol_deliver_rcu() warn: potential spectre=
 issue 'inet6_protos' [w]

vim +/idev +169 net/ipv6/ip6_input.c

d8269e2cbf908f Edward Cree              2018-07-05  144  =

d8269e2cbf908f Edward Cree              2018-07-05  145  static struct sk_b=
uff *ip6_rcv_core(struct sk_buff *skb, struct net_device *dev,
d8269e2cbf908f Edward Cree              2018-07-05  146  				    struct net=
 *net)
^1da177e4c3f41 Linus Torvalds           2005-04-16  147  {
4daf841a2ef3b2 Menglong Dong            2022-04-13  148  	enum skb_drop_rea=
son reason;
b71d1d426d263b Eric Dumazet             2011-04-22  149  	const struct ipv6=
hdr *hdr;
^1da177e4c3f41 Linus Torvalds           2005-04-16  150  	u32 pkt_len;
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  151  	struct inet6_dev =
*idev;
^1da177e4c3f41 Linus Torvalds           2005-04-16  152  =

a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  153  	if (skb->pkt_type=
 =3D=3D PACKET_OTHERHOST) {
794c24e9921f32 Jeffrey Ji               2022-04-06  154  		dev_core_stats_r=
x_otherhost_dropped_inc(skb->dev);
4daf841a2ef3b2 Menglong Dong            2022-04-13  155  		kfree_skb_reason=
(skb, SKB_DROP_REASON_OTHERHOST);
d8269e2cbf908f Edward Cree              2018-07-05  156  		return NULL;
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  157  	}
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  158  =

a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  159  	rcu_read_lock();
^1da177e4c3f41 Linus Torvalds           2005-04-16  160  =

a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  161  	idev =3D __in6_de=
v_get(skb->dev);
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  162  =

c2005eb01044e8 Eric Dumazet             2016-04-27  163  	__IP6_UPD_PO_STAT=
S(net, idev, IPSTATS_MIB_IN, skb->len);
^1da177e4c3f41 Linus Torvalds           2005-04-16  164  =

4daf841a2ef3b2 Menglong Dong            2022-04-13  165  	SKB_DR_SET(reason=
, NOT_SPECIFIED);
778d80be526995 YOSHIFUJI Hideaki        2008-06-28  166  	if ((skb =3D skb_=
share_check(skb, GFP_ATOMIC)) =3D=3D NULL ||
778d80be526995 YOSHIFUJI Hideaki        2008-06-28 @167  	    !idev || unli=
kely(idev->cnf.disable_ipv6)) {
1d0155035918aa Eric Dumazet             2016-04-27  168  		__IP6_INC_STATS(=
net, idev, IPSTATS_MIB_INDISCARDS);
4daf841a2ef3b2 Menglong Dong            2022-04-13 @169  		if (unlikely(ide=
v->cnf.disable_ipv6))
4daf841a2ef3b2 Menglong Dong            2022-04-13  170  			SKB_DR_SET(reas=
on, IPV6DISABLED);
71f6f6dfdf7c7a Jesper Nilsson           2009-03-27  171  		goto drop;
^1da177e4c3f41 Linus Torvalds           2005-04-16  172  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  173  =

6b7fdc3ae18a05 Guillaume Chazarain      2006-07-24  174  	memset(IP6CB(skb)=
, 0, sizeof(struct inet6_skb_parm));
6b7fdc3ae18a05 Guillaume Chazarain      2006-07-24  175  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  176  	/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  177  	 * Store incoming=
 device index. When the packet will
^1da177e4c3f41 Linus Torvalds           2005-04-16  178  	 * be queued, we =
cannot refer to skb->dev anymore.
^1da177e4c3f41 Linus Torvalds           2005-04-16  179  	 *
^1da177e4c3f41 Linus Torvalds           2005-04-16  180  	 * BTW, when we s=
end a packet for our own local address on a
^1da177e4c3f41 Linus Torvalds           2005-04-16  181  	 * non-loopback i=
nterface (e.g. ethX), it is being delivered
de3cb747ffac5f Daniel Lezcano           2007-09-25  182  	 * via the loopba=
ck interface (lo) here; skb->dev =3D loopback_dev.
^1da177e4c3f41 Linus Torvalds           2005-04-16  183  	 * It, however, s=
hould be considered as if it is being
^1da177e4c3f41 Linus Torvalds           2005-04-16  184  	 * arrived via th=
e sending interface (ethX), because of the
^1da177e4c3f41 Linus Torvalds           2005-04-16  185  	 * nature of scop=
ing architecture. --yoshfuji
^1da177e4c3f41 Linus Torvalds           2005-04-16  186  	 */
48fb6b55450191 Wei-Chun Chao            2015-07-22  187  	IP6CB(skb)->iif =
=3D skb_valid_dst(skb) ? ip6_dst_idev(skb_dst(skb))->dev->ifindex : dev->if=
index;
^1da177e4c3f41 Linus Torvalds           2005-04-16  188  =

2889139a6acd29 Herbert Xu               2006-06-30  189  	if (unlikely(!psk=
b_may_pull(skb, sizeof(*hdr))))
^1da177e4c3f41 Linus Torvalds           2005-04-16  190  		goto err;
^1da177e4c3f41 Linus Torvalds           2005-04-16  191  =

0660e03f6b18f1 Arnaldo Carvalho de Melo 2007-04-25  192  	hdr =3D ipv6_hdr(=
skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  193  =

4daf841a2ef3b2 Menglong Dong            2022-04-13  194  	if (hdr->version =
!=3D 6) {
4daf841a2ef3b2 Menglong Dong            2022-04-13  195  		SKB_DR_SET(reaso=
n, UNHANDLED_PROTO);
^1da177e4c3f41 Linus Torvalds           2005-04-16  196  		goto err;
4daf841a2ef3b2 Menglong Dong            2022-04-13  197  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  198  =

1d0155035918aa Eric Dumazet             2016-04-27  199  	__IP6_ADD_STATS(n=
et, idev,
1f07d03e2069df Eric Dumazet             2013-08-06  200  			IPSTATS_MIB_NOE=
CTPKTS +
1f07d03e2069df Eric Dumazet             2013-08-06  201  				(ipv6_get_dsfi=
eld(hdr) & INET_ECN_MASK),
1f07d03e2069df Eric Dumazet             2013-08-06  202  			max_t(unsigned =
short, 1, skb_shinfo(skb)->gso_segs));
f630e43a215a31 YOSHIFUJI Hideaki        2008-06-19  203  	/*
f630e43a215a31 YOSHIFUJI Hideaki        2008-06-19  204  	 * RFC4291 2.5.3
0aa8c13eb51282 Florian Westphal         2017-04-14  205  	 * The loopback a=
ddress must not be used as the source address in IPv6
0aa8c13eb51282 Florian Westphal         2017-04-14  206  	 * packets that a=
re sent outside of a single node. [..]
f630e43a215a31 YOSHIFUJI Hideaki        2008-06-19  207  	 * A packet recei=
ved on an interface with a destination address
f630e43a215a31 YOSHIFUJI Hideaki        2008-06-19  208  	 * of loopback mu=
st be dropped.
f630e43a215a31 YOSHIFUJI Hideaki        2008-06-19  209  	 */
0aa8c13eb51282 Florian Westphal         2017-04-14  210  	if ((ipv6_addr_lo=
opback(&hdr->saddr) ||
0aa8c13eb51282 Florian Westphal         2017-04-14  211  	     ipv6_addr_lo=
opback(&hdr->daddr)) &&
3ede0bbcdfc94c Robert Shearman          2018-09-19  212  	    !(dev->flags =
& IFF_LOOPBACK) &&
3ede0bbcdfc94c Robert Shearman          2018-09-19  213  	    !netif_is_l3_=
master(dev))
f630e43a215a31 YOSHIFUJI Hideaki        2008-06-19  214  		goto err;
f630e43a215a31 YOSHIFUJI Hideaki        2008-06-19  215  =

1c4a154e525368 Hannes Frederic Sowa     2013-03-26  216  	/* RFC4291 Errata=
 ID: 3480
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  217  	 * Interface-Loca=
l scope spans only a single interface on a
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  218  	 * node and is us=
eful only for loopback transmission of
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  219  	 * multicast.  Pa=
ckets with interface-local scope received
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  220  	 * from another n=
ode must be discarded.
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  221  	 */
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  222  	if (!(skb->pkt_ty=
pe =3D=3D PACKET_LOOPBACK ||
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  223  	      dev->flags =
& IFF_LOOPBACK) &&
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  224  	    ipv6_addr_is_=
multicast(&hdr->daddr) &&
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  225  	    IPV6_ADDR_MC_=
SCOPE(&hdr->daddr) =3D=3D 1)
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  226  		goto err;
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  227  =

abbc30436d39df Johannes Berg            2016-02-04  228  	/* If enabled, dr=
op unicast packets that were encapsulated in link-layer
abbc30436d39df Johannes Berg            2016-02-04  229  	 * multicast or b=
roadcast to protected against the so-called "hole-196"
abbc30436d39df Johannes Berg            2016-02-04  230  	 * attack in 802.=
11 wireless.
abbc30436d39df Johannes Berg            2016-02-04  231  	 */
abbc30436d39df Johannes Berg            2016-02-04  232  	if (!ipv6_addr_is=
_multicast(&hdr->daddr) &&
abbc30436d39df Johannes Berg            2016-02-04  233  	    (skb->pkt_typ=
e =3D=3D PACKET_BROADCAST ||
abbc30436d39df Johannes Berg            2016-02-04  234  	     skb->pkt_typ=
e =3D=3D PACKET_MULTICAST) &&
4daf841a2ef3b2 Menglong Dong            2022-04-13  235  	    idev->cnf.dro=
p_unicast_in_l2_multicast) {
4daf841a2ef3b2 Menglong Dong            2022-04-13  236  		SKB_DR_SET(reaso=
n, UNICAST_IN_L2_MULTICAST);
abbc30436d39df Johannes Berg            2016-02-04  237  		goto err;
4daf841a2ef3b2 Menglong Dong            2022-04-13  238  	}
abbc30436d39df Johannes Berg            2016-02-04  239  =

20314092c1b418 Hannes Frederic Sowa     2013-02-10  240  	/* RFC4291 2.7
20314092c1b418 Hannes Frederic Sowa     2013-02-10  241  	 * Nodes must not=
 originate a packet to a multicast address whose scope
20314092c1b418 Hannes Frederic Sowa     2013-02-10  242  	 * field contains=
 the reserved value 0; if such a packet is received, it
20314092c1b418 Hannes Frederic Sowa     2013-02-10  243  	 * must be silent=
ly dropped.
20314092c1b418 Hannes Frederic Sowa     2013-02-10  244  	 */
20314092c1b418 Hannes Frederic Sowa     2013-02-10  245  	if (ipv6_addr_is_=
multicast(&hdr->daddr) &&
20314092c1b418 Hannes Frederic Sowa     2013-02-10  246  	    IPV6_ADDR_MC_=
SCOPE(&hdr->daddr) =3D=3D 0)
20314092c1b418 Hannes Frederic Sowa     2013-02-10  247  		goto err;
20314092c1b418 Hannes Frederic Sowa     2013-02-10  248  =

c457338d7acd38 Brian Haley              2011-11-08  249  	/*
c457338d7acd38 Brian Haley              2011-11-08  250  	 * RFC4291 2.7
c457338d7acd38 Brian Haley              2011-11-08  251  	 * Multicast addr=
esses must not be used as source addresses in IPv6
c457338d7acd38 Brian Haley              2011-11-08  252  	 * packets or app=
ear in any Routing header.
c457338d7acd38 Brian Haley              2011-11-08  253  	 */
c457338d7acd38 Brian Haley              2011-11-08  254  	if (ipv6_addr_is_=
multicast(&hdr->saddr))
c457338d7acd38 Brian Haley              2011-11-08  255  		goto err;
c457338d7acd38 Brian Haley              2011-11-08  256  =

b0e380b1d8a8e0 Arnaldo Carvalho de Melo 2007-04-10  257  	skb->transport_he=
ader =3D skb->network_header + sizeof(*hdr);
951dbc8ac714b0 Patrick McHardy          2006-01-06  258  	IP6CB(skb)->nhoff=
 =3D offsetof(struct ipv6hdr, nexthdr);
951dbc8ac714b0 Patrick McHardy          2006-01-06  259  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  260  	pkt_len =3D ntohs=
(hdr->payload_len);
^1da177e4c3f41 Linus Torvalds           2005-04-16  261  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  262  	/* pkt_len may be=
 zero if Jumbo payload option is present */
^1da177e4c3f41 Linus Torvalds           2005-04-16  263  	if (pkt_len || hd=
r->nexthdr !=3D NEXTHDR_HOP) {
60e5c166413f17 Mitsuru Chinen           2007-04-04  264  		if (pkt_len + si=
zeof(struct ipv6hdr) > skb->len) {
1d0155035918aa Eric Dumazet             2016-04-27  265  			__IP6_INC_STATS=
(net,
483a47d2fe7943 Denis V. Lunev           2008-10-08  266  					idev, IPSTATS=
_MIB_INTRUNCATEDPKTS);
4daf841a2ef3b2 Menglong Dong            2022-04-13  267  			SKB_DR_SET(reas=
on, PKT_TOO_SMALL);
60e5c166413f17 Mitsuru Chinen           2007-04-04  268  			goto drop;
60e5c166413f17 Mitsuru Chinen           2007-04-04  269  		}
4daf841a2ef3b2 Menglong Dong            2022-04-13  270  		if (pskb_trim_rc=
sum(skb, pkt_len + sizeof(struct ipv6hdr)))
4daf841a2ef3b2 Menglong Dong            2022-04-13  271  			goto err;
0660e03f6b18f1 Arnaldo Carvalho de Melo 2007-04-25  272  		hdr =3D ipv6_hdr=
(skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  273  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  274  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  275  	if (hdr->nexthdr =
=3D=3D NEXTHDR_HOP) {
e5bbef20e017ef Herbert Xu               2007-10-15  276  		if (ipv6_parse_h=
opopts(skb) < 0) {
1d0155035918aa Eric Dumazet             2016-04-27  277  			__IP6_INC_STATS=
(net, idev, IPSTATS_MIB_INHDRERRORS);
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  278  			rcu_read_unlock=
();
d8269e2cbf908f Edward Cree              2018-07-05  279  			return NULL;
^1da177e4c3f41 Linus Torvalds           2005-04-16  280  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  281  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  282  =

a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  283  	rcu_read_unlock();
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  284  =

71f9dacd2e4d23 Herbert Xu               2009-06-26  285  	/* Must drop sock=
et now because of tproxy. */
cf7fbe660f2dbd Joe Stringer             2020-03-29  286  	if (!skb_sk_is_pr=
efetched(skb))
71f9dacd2e4d23 Herbert Xu               2009-06-26  287  		skb_orphan(skb);
71f9dacd2e4d23 Herbert Xu               2009-06-26  288  =

d8269e2cbf908f Edward Cree              2018-07-05  289  	return skb;
^1da177e4c3f41 Linus Torvalds           2005-04-16  290  err:
1d0155035918aa Eric Dumazet             2016-04-27  291  	__IP6_INC_STATS(n=
et, idev, IPSTATS_MIB_INHDRERRORS);
4daf841a2ef3b2 Menglong Dong            2022-04-13  292  	SKB_DR_OR(reason,=
 IP_INHDR);
^1da177e4c3f41 Linus Torvalds           2005-04-16  293  drop:
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  294  	rcu_read_unlock();
4daf841a2ef3b2 Menglong Dong            2022-04-13  295  	kfree_skb_reason(=
skb, reason);
d8269e2cbf908f Edward Cree              2018-07-05  296  	return NULL;
d8269e2cbf908f Edward Cree              2018-07-05  297  }
d8269e2cbf908f Edward Cree              2018-07-05  298  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5735710558753609283==--

