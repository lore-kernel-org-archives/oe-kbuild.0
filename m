Content-Type: multipart/mixed; boundary="===============4590182433634214027=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next] net-core: add InMacErrors counter
Date: Sat, 22 Jan 2022 15:10:14 +0800
Message-ID: <202201221511.oD31tU14-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4590182433634214027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220122000301.1872828-1-jeffreyji@google.com>
References: <20220122000301.1872828-1-jeffreyji@google.com>
TO: Jeffrey Ji <jeffreyjilinux@gmail.com>
TO: Eric Dumazet <edumazet@google.com>
TO: "David S . Miller" <davem@davemloft.net>
CC: Brian Vazquez <brianvv@google.com>
CC: linux-kernel(a)vger.kernel.org
CC: netdev(a)vger.kernel.org
CC: jeffreyjilinux(a)gmail.com
CC: jeffreyji <jeffreyji@google.com>

Hi Jeffrey,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Jeffrey-Ji/net-core-add-In=
MacErrors-counter/20220122-080455
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
8aaaf2f3af2ae212428f4db1af34214225f5cec3
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-randconfig-m001-20220117 (https://download.01.org/0day-ci/ar=
chive/20220122/202201221511.oD31tU14-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/ipv6/ip6_input.c:153 ip6_rcv_core() error: uninitialized symbol 'idev'.

Old smatch warnings:
net/ipv6/ip6_input.c:374 ip6_protocol_deliver_rcu() warn: potential spectre=
 issue 'inet6_protos' [w]

vim +/idev +153 net/ipv6/ip6_input.c

d8269e2cbf908f9 Edward Cree              2018-07-05  144  =

d8269e2cbf908f9 Edward Cree              2018-07-05  145  static struct sk_=
buff *ip6_rcv_core(struct sk_buff *skb, struct net_device *dev,
d8269e2cbf908f9 Edward Cree              2018-07-05  146  				    struct ne=
t *net)
^1da177e4c3f415 Linus Torvalds           2005-04-16  147  {
b71d1d426d263b0 Eric Dumazet             2011-04-22  148  	const struct ipv=
6hdr *hdr;
^1da177e4c3f415 Linus Torvalds           2005-04-16  149  	u32 pkt_len;
a11d206d0f88e09 YOSHIFUJI Hideaki        2006-11-04  150  	struct inet6_dev=
 *idev;
^1da177e4c3f415 Linus Torvalds           2005-04-16  151  =

a11d206d0f88e09 YOSHIFUJI Hideaki        2006-11-04  152  	if (skb->pkt_typ=
e =3D=3D PACKET_OTHERHOST) {
f8ea346d278c116 jeffreyji                2022-01-22 @153  		__IP6_INC_STATS=
(net, idev, IPSTATS_MIB_INMACERRORS);
a11d206d0f88e09 YOSHIFUJI Hideaki        2006-11-04  154  		kfree_skb(skb);
d8269e2cbf908f9 Edward Cree              2018-07-05  155  		return NULL;
a11d206d0f88e09 YOSHIFUJI Hideaki        2006-11-04  156  	}
a11d206d0f88e09 YOSHIFUJI Hideaki        2006-11-04  157  =

a11d206d0f88e09 YOSHIFUJI Hideaki        2006-11-04  158  	rcu_read_lock();
^1da177e4c3f415 Linus Torvalds           2005-04-16  159  =

a11d206d0f88e09 YOSHIFUJI Hideaki        2006-11-04  160  	idev =3D __in6_d=
ev_get(skb->dev);
a11d206d0f88e09 YOSHIFUJI Hideaki        2006-11-04  161  =

c2005eb01044e82 Eric Dumazet             2016-04-27  162  	__IP6_UPD_PO_STA=
TS(net, idev, IPSTATS_MIB_IN, skb->len);
^1da177e4c3f415 Linus Torvalds           2005-04-16  163  =

778d80be5269959 YOSHIFUJI Hideaki        2008-06-28  164  	if ((skb =3D skb=
_share_check(skb, GFP_ATOMIC)) =3D=3D NULL ||
778d80be5269959 YOSHIFUJI Hideaki        2008-06-28  165  	    !idev || unl=
ikely(idev->cnf.disable_ipv6)) {
1d0155035918aa4 Eric Dumazet             2016-04-27  166  		__IP6_INC_STATS=
(net, idev, IPSTATS_MIB_INDISCARDS);
71f6f6dfdf7c7a6 Jesper Nilsson           2009-03-27  167  		goto drop;
^1da177e4c3f415 Linus Torvalds           2005-04-16  168  	}
^1da177e4c3f415 Linus Torvalds           2005-04-16  169  =

6b7fdc3ae18a059 Guillaume Chazarain      2006-07-24  170  	memset(IP6CB(skb=
), 0, sizeof(struct inet6_skb_parm));
6b7fdc3ae18a059 Guillaume Chazarain      2006-07-24  171  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  172  	/*
^1da177e4c3f415 Linus Torvalds           2005-04-16  173  	 * Store incomin=
g device index. When the packet will
^1da177e4c3f415 Linus Torvalds           2005-04-16  174  	 * be queued, we=
 cannot refer to skb->dev anymore.
^1da177e4c3f415 Linus Torvalds           2005-04-16  175  	 *
^1da177e4c3f415 Linus Torvalds           2005-04-16  176  	 * BTW, when we =
send a packet for our own local address on a
^1da177e4c3f415 Linus Torvalds           2005-04-16  177  	 * non-loopback =
interface (e.g. ethX), it is being delivered
de3cb747ffac5f2 Daniel Lezcano           2007-09-25  178  	 * via the loopb=
ack interface (lo) here; skb->dev =3D loopback_dev.
^1da177e4c3f415 Linus Torvalds           2005-04-16  179  	 * It, however, =
should be considered as if it is being
^1da177e4c3f415 Linus Torvalds           2005-04-16  180  	 * arrived via t=
he sending interface (ethX), because of the
^1da177e4c3f415 Linus Torvalds           2005-04-16  181  	 * nature of sco=
ping architecture. --yoshfuji
^1da177e4c3f415 Linus Torvalds           2005-04-16  182  	 */
48fb6b554501914 Wei-Chun Chao            2015-07-22  183  	IP6CB(skb)->iif =
=3D skb_valid_dst(skb) ? ip6_dst_idev(skb_dst(skb))->dev->ifindex : dev->if=
index;
^1da177e4c3f415 Linus Torvalds           2005-04-16  184  =

2889139a6acd294 Herbert Xu               2006-06-30  185  	if (unlikely(!ps=
kb_may_pull(skb, sizeof(*hdr))))
^1da177e4c3f415 Linus Torvalds           2005-04-16  186  		goto err;
^1da177e4c3f415 Linus Torvalds           2005-04-16  187  =

0660e03f6b18f19 Arnaldo Carvalho de Melo 2007-04-25  188  	hdr =3D ipv6_hdr=
(skb);
^1da177e4c3f415 Linus Torvalds           2005-04-16  189  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  190  	if (hdr->version=
 !=3D 6)
^1da177e4c3f415 Linus Torvalds           2005-04-16  191  		goto err;
^1da177e4c3f415 Linus Torvalds           2005-04-16  192  =

1d0155035918aa4 Eric Dumazet             2016-04-27  193  	__IP6_ADD_STATS(=
net, idev,
1f07d03e2069df2 Eric Dumazet             2013-08-06  194  			IPSTATS_MIB_NO=
ECTPKTS +
1f07d03e2069df2 Eric Dumazet             2013-08-06  195  				(ipv6_get_dsf=
ield(hdr) & INET_ECN_MASK),
1f07d03e2069df2 Eric Dumazet             2013-08-06  196  			max_t(unsigned=
 short, 1, skb_shinfo(skb)->gso_segs));
f630e43a215a312 YOSHIFUJI Hideaki        2008-06-19  197  	/*
f630e43a215a312 YOSHIFUJI Hideaki        2008-06-19  198  	 * RFC4291 2.5.3
0aa8c13eb512823 Florian Westphal         2017-04-14  199  	 * The loopback =
address must not be used as the source address in IPv6
0aa8c13eb512823 Florian Westphal         2017-04-14  200  	 * packets that =
are sent outside of a single node. [..]
f630e43a215a312 YOSHIFUJI Hideaki        2008-06-19  201  	 * A packet rece=
ived on an interface with a destination address
f630e43a215a312 YOSHIFUJI Hideaki        2008-06-19  202  	 * of loopback m=
ust be dropped.
f630e43a215a312 YOSHIFUJI Hideaki        2008-06-19  203  	 */
0aa8c13eb512823 Florian Westphal         2017-04-14  204  	if ((ipv6_addr_l=
oopback(&hdr->saddr) ||
0aa8c13eb512823 Florian Westphal         2017-04-14  205  	     ipv6_addr_l=
oopback(&hdr->daddr)) &&
3ede0bbcdfc94cc Robert Shearman          2018-09-19  206  	    !(dev->flags=
 & IFF_LOOPBACK) &&
3ede0bbcdfc94cc Robert Shearman          2018-09-19  207  	    !netif_is_l3=
_master(dev))
f630e43a215a312 YOSHIFUJI Hideaki        2008-06-19  208  		goto err;
f630e43a215a312 YOSHIFUJI Hideaki        2008-06-19  209  =

1c4a154e5253687 Hannes Frederic Sowa     2013-03-26  210  	/* RFC4291 Errat=
a ID: 3480
1c4a154e5253687 Hannes Frederic Sowa     2013-03-26  211  	 * Interface-Loc=
al scope spans only a single interface on a
1c4a154e5253687 Hannes Frederic Sowa     2013-03-26  212  	 * node and is u=
seful only for loopback transmission of
1c4a154e5253687 Hannes Frederic Sowa     2013-03-26  213  	 * multicast.  P=
ackets with interface-local scope received
1c4a154e5253687 Hannes Frederic Sowa     2013-03-26  214  	 * from another =
node must be discarded.
1c4a154e5253687 Hannes Frederic Sowa     2013-03-26  215  	 */
1c4a154e5253687 Hannes Frederic Sowa     2013-03-26  216  	if (!(skb->pkt_t=
ype =3D=3D PACKET_LOOPBACK ||
1c4a154e5253687 Hannes Frederic Sowa     2013-03-26  217  	      dev->flags=
 & IFF_LOOPBACK) &&
1c4a154e5253687 Hannes Frederic Sowa     2013-03-26  218  	    ipv6_addr_is=
_multicast(&hdr->daddr) &&
1c4a154e5253687 Hannes Frederic Sowa     2013-03-26  219  	    IPV6_ADDR_MC=
_SCOPE(&hdr->daddr) =3D=3D 1)
1c4a154e5253687 Hannes Frederic Sowa     2013-03-26  220  		goto err;
1c4a154e5253687 Hannes Frederic Sowa     2013-03-26  221  =

abbc30436d39dfe Johannes Berg            2016-02-04  222  	/* If enabled, d=
rop unicast packets that were encapsulated in link-layer
abbc30436d39dfe Johannes Berg            2016-02-04  223  	 * multicast or =
broadcast to protected against the so-called "hole-196"
abbc30436d39dfe Johannes Berg            2016-02-04  224  	 * attack in 802=
.11 wireless.
abbc30436d39dfe Johannes Berg            2016-02-04  225  	 */
abbc30436d39dfe Johannes Berg            2016-02-04  226  	if (!ipv6_addr_i=
s_multicast(&hdr->daddr) &&
abbc30436d39dfe Johannes Berg            2016-02-04  227  	    (skb->pkt_ty=
pe =3D=3D PACKET_BROADCAST ||
abbc30436d39dfe Johannes Berg            2016-02-04  228  	     skb->pkt_ty=
pe =3D=3D PACKET_MULTICAST) &&
abbc30436d39dfe Johannes Berg            2016-02-04  229  	    idev->cnf.dr=
op_unicast_in_l2_multicast)
abbc30436d39dfe Johannes Berg            2016-02-04  230  		goto err;
abbc30436d39dfe Johannes Berg            2016-02-04  231  =

20314092c1b4189 Hannes Frederic Sowa     2013-02-10  232  	/* RFC4291 2.7
20314092c1b4189 Hannes Frederic Sowa     2013-02-10  233  	 * Nodes must no=
t originate a packet to a multicast address whose scope
20314092c1b4189 Hannes Frederic Sowa     2013-02-10  234  	 * field contain=
s the reserved value 0; if such a packet is received, it
20314092c1b4189 Hannes Frederic Sowa     2013-02-10  235  	 * must be silen=
tly dropped.
20314092c1b4189 Hannes Frederic Sowa     2013-02-10  236  	 */
20314092c1b4189 Hannes Frederic Sowa     2013-02-10  237  	if (ipv6_addr_is=
_multicast(&hdr->daddr) &&
20314092c1b4189 Hannes Frederic Sowa     2013-02-10  238  	    IPV6_ADDR_MC=
_SCOPE(&hdr->daddr) =3D=3D 0)
20314092c1b4189 Hannes Frederic Sowa     2013-02-10  239  		goto err;
20314092c1b4189 Hannes Frederic Sowa     2013-02-10  240  =

c457338d7acd382 Brian Haley              2011-11-08  241  	/*
c457338d7acd382 Brian Haley              2011-11-08  242  	 * RFC4291 2.7
c457338d7acd382 Brian Haley              2011-11-08  243  	 * Multicast add=
resses must not be used as source addresses in IPv6
c457338d7acd382 Brian Haley              2011-11-08  244  	 * packets or ap=
pear in any Routing header.
c457338d7acd382 Brian Haley              2011-11-08  245  	 */
c457338d7acd382 Brian Haley              2011-11-08  246  	if (ipv6_addr_is=
_multicast(&hdr->saddr))
c457338d7acd382 Brian Haley              2011-11-08  247  		goto err;
c457338d7acd382 Brian Haley              2011-11-08  248  =

b0e380b1d8a8e0a Arnaldo Carvalho de Melo 2007-04-10  249  	skb->transport_h=
eader =3D skb->network_header + sizeof(*hdr);
951dbc8ac714b04 Patrick McHardy          2006-01-06  250  	IP6CB(skb)->nhof=
f =3D offsetof(struct ipv6hdr, nexthdr);
951dbc8ac714b04 Patrick McHardy          2006-01-06  251  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  252  	pkt_len =3D ntoh=
s(hdr->payload_len);
^1da177e4c3f415 Linus Torvalds           2005-04-16  253  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  254  	/* pkt_len may b=
e zero if Jumbo payload option is present */
^1da177e4c3f415 Linus Torvalds           2005-04-16  255  	if (pkt_len || h=
dr->nexthdr !=3D NEXTHDR_HOP) {
60e5c166413f17d Mitsuru Chinen           2007-04-04  256  		if (pkt_len + s=
izeof(struct ipv6hdr) > skb->len) {
1d0155035918aa4 Eric Dumazet             2016-04-27  257  			__IP6_INC_STAT=
S(net,
483a47d2fe79432 Denis V. Lunev           2008-10-08  258  					idev, IPSTAT=
S_MIB_INTRUNCATEDPKTS);
60e5c166413f17d Mitsuru Chinen           2007-04-04  259  			goto drop;
60e5c166413f17d Mitsuru Chinen           2007-04-04  260  		}
^1da177e4c3f415 Linus Torvalds           2005-04-16  261  		if (pskb_trim_r=
csum(skb, pkt_len + sizeof(struct ipv6hdr))) {
1d0155035918aa4 Eric Dumazet             2016-04-27  262  			__IP6_INC_STAT=
S(net, idev, IPSTATS_MIB_INHDRERRORS);
^1da177e4c3f415 Linus Torvalds           2005-04-16  263  			goto drop;
^1da177e4c3f415 Linus Torvalds           2005-04-16  264  		}
0660e03f6b18f19 Arnaldo Carvalho de Melo 2007-04-25  265  		hdr =3D ipv6_hd=
r(skb);
^1da177e4c3f415 Linus Torvalds           2005-04-16  266  	}
^1da177e4c3f415 Linus Torvalds           2005-04-16  267  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  268  	if (hdr->nexthdr=
 =3D=3D NEXTHDR_HOP) {
e5bbef20e017efc Herbert Xu               2007-10-15  269  		if (ipv6_parse_=
hopopts(skb) < 0) {
1d0155035918aa4 Eric Dumazet             2016-04-27  270  			__IP6_INC_STAT=
S(net, idev, IPSTATS_MIB_INHDRERRORS);
a11d206d0f88e09 YOSHIFUJI Hideaki        2006-11-04  271  			rcu_read_unloc=
k();
d8269e2cbf908f9 Edward Cree              2018-07-05  272  			return NULL;
^1da177e4c3f415 Linus Torvalds           2005-04-16  273  		}
^1da177e4c3f415 Linus Torvalds           2005-04-16  274  	}
^1da177e4c3f415 Linus Torvalds           2005-04-16  275  =

a11d206d0f88e09 YOSHIFUJI Hideaki        2006-11-04  276  	rcu_read_unlock(=
);
a11d206d0f88e09 YOSHIFUJI Hideaki        2006-11-04  277  =

71f9dacd2e4d233 Herbert Xu               2009-06-26  278  	/* Must drop soc=
ket now because of tproxy. */
cf7fbe660f2dbd7 Joe Stringer             2020-03-29  279  	if (!skb_sk_is_p=
refetched(skb))
71f9dacd2e4d233 Herbert Xu               2009-06-26  280  		skb_orphan(skb);
71f9dacd2e4d233 Herbert Xu               2009-06-26  281  =

d8269e2cbf908f9 Edward Cree              2018-07-05  282  	return skb;
^1da177e4c3f415 Linus Torvalds           2005-04-16  283  err:
1d0155035918aa4 Eric Dumazet             2016-04-27  284  	__IP6_INC_STATS(=
net, idev, IPSTATS_MIB_INHDRERRORS);
^1da177e4c3f415 Linus Torvalds           2005-04-16  285  drop:
a11d206d0f88e09 YOSHIFUJI Hideaki        2006-11-04  286  	rcu_read_unlock(=
);
^1da177e4c3f415 Linus Torvalds           2005-04-16  287  	kfree_skb(skb);
d8269e2cbf908f9 Edward Cree              2018-07-05  288  	return NULL;
d8269e2cbf908f9 Edward Cree              2018-07-05  289  }
d8269e2cbf908f9 Edward Cree              2018-07-05  290  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============4590182433634214027==--

