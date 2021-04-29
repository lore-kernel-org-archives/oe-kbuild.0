Content-Type: multipart/mixed; boundary="===============0713337550485713510=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH] fix xfrm MTU regression
Date: Fri, 30 Apr 2021 07:17:45 +0800
Message-ID: <202104300738.YRjWCNmt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0713337550485713510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210429170254.5grfgsz2hgy2qjhk@dwarf.suse.cz>
References: <20210429170254.5grfgsz2hgy2qjhk@dwarf.suse.cz>
TO: Jiri Bohac <jbohac@suse.cz>

Hi Jiri,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v5.12 next-20210429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jiri-Bohac/fix-xfrm-MTU-re=
gression/20210430-010412
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
d72cd4ad4174cfd2257c426ad51e4f53bcfde9c9
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: i386-randconfig-m021-20210429 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/ipv6/ip6_output.c:1501 __ip6_append_data() error: uninitialized symbol =
'headersize'.

Old smatch warnings:
net/ipv6/ip6_output.c:292 ip6_xmit() error: we previously assumed 'np' coul=
d be null (see line 286)

vim +/headersize +1501 net/ipv6/ip6_output.c

366e41d9774d70 Vlad Yasevich            2015-01-31  1419  =

0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1420  static int __ip6_=
append_data(struct sock *sk,
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1421  			     struct fl=
owi6 *fl6,
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1422  			     struct sk=
_buff_head *queue,
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1423  			     struct in=
et_cork *cork,
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1424  			     struct in=
et6_cork *v6_cork,
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1425  			     struct pa=
ge_frag *pfrag,
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1426  			     int getfr=
ag(void *from, char *to, int offset,
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1427  					 int len, in=
t odd, struct sk_buff *skb),
366e41d9774d70 Vlad Yasevich            2015-01-31  1428  			     void *fro=
m, int length, int transhdrlen,
5fdaa88dfefa87 Willem de Bruijn         2018-07-06  1429  			     unsigned =
int flags, struct ipcm6_cookie *ipc6)
366e41d9774d70 Vlad Yasevich            2015-01-31  1430  {
366e41d9774d70 Vlad Yasevich            2015-01-31  1431  	struct sk_buff *=
skb, *skb_prev =3D NULL;
10b8a3de603df7 Paolo Abeni              2018-03-23  1432  	unsigned int max=
fraglen, fragheaderlen, mtu, orig_mtu, pmtu;
b5947e5d1e710c Willem de Bruijn         2018-11-30  1433  	struct ubuf_info=
 *uarg =3D NULL;
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1434  	int exthdrlen =
=3D 0;
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1435  	int dst_exthdrle=
n =3D 0;
366e41d9774d70 Vlad Yasevich            2015-01-31  1436  	int hh_len;
366e41d9774d70 Vlad Yasevich            2015-01-31  1437  	int copy;
366e41d9774d70 Vlad Yasevich            2015-01-31  1438  	int err;
366e41d9774d70 Vlad Yasevich            2015-01-31  1439  	int offset =3D 0;
366e41d9774d70 Vlad Yasevich            2015-01-31  1440  	u32 tskey =3D 0;
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1441  	struct rt6_info =
*rt =3D (struct rt6_info *)cork->dst;
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1442  	struct ipv6_txop=
tions *opt =3D v6_cork->opt;
32dce968dd987a Vlad Yasevich            2015-01-31  1443  	int csummode =3D=
 CHECKSUM_NONE;
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1444  	unsigned int max=
nonfragsize, headersize;
1f4c6eb2402968 Eric Dumazet             2018-03-31  1445  	unsigned int wme=
m_alloc_delta =3D 0;
100f6d8e09905c Willem de Bruijn         2019-05-30  1446  	bool paged, extr=
a_uref =3D false;
366e41d9774d70 Vlad Yasevich            2015-01-31  1447  =

0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1448  	skb =3D skb_peek=
_tail(queue);
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1449  	if (!skb) {
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1450  		exthdrlen =3D o=
pt ? opt->opt_flen : 0;
7efdba5bd9a2f3 Romain KUNTZ             2013-01-16  1451  		dst_exthdrlen =
=3D rt->dst.header_len - rt->rt6i_nfheader_len;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1452  	}
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1453  =

15e36f5b8e982d Willem de Bruijn         2018-04-26  1454  	paged =3D !!cork=
->gso_size;
bec1f6f697362c Willem de Bruijn         2018-04-26  1455  	mtu =3D cork->gs=
o_size ? IP6_MAX_MTU : cork->fragsize;
e367c2d03dba4c lucien                   2014-03-17  1456  	orig_mtu =3D mtu;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1457  =

678ca42d688534 Willem de Bruijn         2018-07-06  1458  	if (cork->tx_fla=
gs & SKBTX_ANY_SW_TSTAMP &&
678ca42d688534 Willem de Bruijn         2018-07-06  1459  	    sk->sk_tsfla=
gs & SOF_TIMESTAMPING_OPT_ID)
678ca42d688534 Willem de Bruijn         2018-07-06  1460  		tskey =3D sk->s=
k_tskey++;
678ca42d688534 Willem de Bruijn         2018-07-06  1461  =

d8d1f30b95a635 Changli Gao              2010-06-10  1462  	hh_len =3D LL_RE=
SERVED_SPACE(rt->dst.dev);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1463  =

a1b051405bc162 Masahide NAKAMURA        2007-12-20  1464  	fragheaderlen =
=3D sizeof(struct ipv6hdr) + rt->rt6i_nfheader_len +
b4ce92775c2e7f Herbert Xu               2007-11-13  1465  			(opt ? opt->op=
t_nflen : 0);
f556543e005a1e Jiri Bohac               2021-04-29  1466  =

f556543e005a1e Jiri Bohac               2021-04-29  1467  	if (mtu < fraghe=
aderlen ||
f556543e005a1e Jiri Bohac               2021-04-29  1468  	    ((mtu - frag=
headerlen) & ~7) + fragheaderlen < sizeof(struct frag_hdr))
f556543e005a1e Jiri Bohac               2021-04-29  1469  		goto emsgsize;
f556543e005a1e Jiri Bohac               2021-04-29  1470  =

4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1471  	maxfraglen =3D (=
(mtu - fragheaderlen) & ~7) + fragheaderlen -
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1472  		     sizeof(str=
uct frag_hdr);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1473  =

4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1474  	headersize =3D s=
izeof(struct ipv6hdr) +
3a1cebe7e05027 Hannes Frederic Sowa     2014-05-11  1475  		     (opt ? opt=
->opt_flen + opt->opt_nflen : 0) +
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1476  		     (dst_allfr=
ag(&rt->dst) ?
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1477  		      sizeof(st=
ruct frag_hdr) : 0) +
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1478  		     rt->rt6i_n=
fheader_len;
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1479  =

10b8a3de603df7 Paolo Abeni              2018-03-23  1480  	/* as per RFC 71=
12 section 5, the entire IPv6 Header Chain must fit
10b8a3de603df7 Paolo Abeni              2018-03-23  1481  	 * the first fra=
gment
10b8a3de603df7 Paolo Abeni              2018-03-23  1482  	 */
10b8a3de603df7 Paolo Abeni              2018-03-23  1483  	if (headersize +=
 transhdrlen > mtu)
10b8a3de603df7 Paolo Abeni              2018-03-23  1484  		goto emsgsize;
10b8a3de603df7 Paolo Abeni              2018-03-23  1485  =

26879da58711aa Wei Wang                 2016-05-02  1486  	if (cork->length=
 + length > mtu - headersize && ipc6->dontfrag &&
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1487  	    (sk->sk_prot=
ocol =3D=3D IPPROTO_UDP ||
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1488  	     sk->sk_prot=
ocol =3D=3D IPPROTO_RAW)) {
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1489  		ipv6_local_rxpm=
tu(sk, fl6, mtu - headersize +
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1490  				sizeof(struct=
 ipv6hdr));
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1491  		goto emsgsize;
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1492  	}
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1493  =

682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1494  	if (ip6_sk_ignor=
e_df(sk))
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1495  		maxnonfragsize =
=3D sizeof(struct ipv6hdr) + IPV6_MAXPLEN;
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1496  	else
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1497  		maxnonfragsize =
=3D mtu;
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1498  =

4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1499  	if (cork->length=
 + length > maxnonfragsize - headersize) {
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1500  emsgsize:
10b8a3de603df7 Paolo Abeni              2018-03-23 @1501  		pmtu =3D max_t(=
int, mtu - headersize + sizeof(struct ipv6hdr), 0);
10b8a3de603df7 Paolo Abeni              2018-03-23  1502  		ipv6_local_erro=
r(sk, EMSGSIZE, fl6, pmtu);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1503  		return -EMSGSIZ=
E;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1504  	}
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1505  =

682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1506  	/* CHECKSUM_PART=
IAL only with no extension headers and when
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1507  	 * we are not go=
ing to fragment
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1508  	 */
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1509  	if (transhdrlen =
&& sk->sk_protocol =3D=3D IPPROTO_UDP &&
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1510  	    headersize =
=3D=3D sizeof(struct ipv6hdr) &&
2b89ed65a6f201 Vlad Yasevich            2017-01-29  1511  	    length <=3D =
mtu - headersize &&
bec1f6f697362c Willem de Bruijn         2018-04-26  1512  	    (!(flags & M=
SG_MORE) || cork->gso_size) &&
c8cd0989bd151f Tom Herbert              2015-12-14  1513  	    rt->dst.dev-=
>features & (NETIF_F_IPV6_CSUM | NETIF_F_HW_CSUM))
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1514  		csummode =3D CH=
ECKSUM_PARTIAL;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1515  =

b5947e5d1e710c Willem de Bruijn         2018-11-30  1516  	if (flags & MSG_=
ZEROCOPY && length && sock_flag(sk, SOCK_ZEROCOPY)) {
8c793822c5803e Jonathan Lemon           2021-01-06  1517  		uarg =3D msg_ze=
rocopy_realloc(sk, length, skb_zcopy(skb));
b5947e5d1e710c Willem de Bruijn         2018-11-30  1518  		if (!uarg)
b5947e5d1e710c Willem de Bruijn         2018-11-30  1519  			return -ENOBUF=
S;
522924b583082f Willem de Bruijn         2019-06-07  1520  		extra_uref =3D =
!skb_zcopy(skb);	/* only ref on new uarg */
b5947e5d1e710c Willem de Bruijn         2018-11-30  1521  		if (rt->dst.dev=
->features & NETIF_F_SG &&
b5947e5d1e710c Willem de Bruijn         2018-11-30  1522  		    csummode =
=3D=3D CHECKSUM_PARTIAL) {
b5947e5d1e710c Willem de Bruijn         2018-11-30  1523  			paged =3D true;
b5947e5d1e710c Willem de Bruijn         2018-11-30  1524  		} else {
b5947e5d1e710c Willem de Bruijn         2018-11-30  1525  			uarg->zerocopy=
 =3D 0;
52900d22288e7d Willem de Bruijn         2018-11-30  1526  			skb_zcopy_set(=
skb, uarg, &extra_uref);
b5947e5d1e710c Willem de Bruijn         2018-11-30  1527  		}
b5947e5d1e710c Willem de Bruijn         2018-11-30  1528  	}
b5947e5d1e710c Willem de Bruijn         2018-11-30  1529  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  1530  	/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  1531  	 * Let's try usi=
ng as much space as possible.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1532  	 * Use MTU if to=
tal length of the message fits into the MTU.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1533  	 * Otherwise, we=
 need to reserve fragment header and
^1da177e4c3f41 Linus Torvalds           2005-04-16  1534  	 * fragment alig=
nment (=3D 8-15 octects, in total).
^1da177e4c3f41 Linus Torvalds           2005-04-16  1535  	 *
634a63e73f0594 Randy Dunlap             2020-09-17  1536  	 * Note that we =
may need to "move" the data from the tail
^1da177e4c3f41 Linus Torvalds           2005-04-16  1537  	 * of the buffer=
 to the new fragment when we split
^1da177e4c3f41 Linus Torvalds           2005-04-16  1538  	 * the message.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1539  	 *
^1da177e4c3f41 Linus Torvalds           2005-04-16  1540  	 * FIXME: It may=
 be fragmented into multiple chunks
^1da177e4c3f41 Linus Torvalds           2005-04-16  1541  	 *        at onc=
e if non-fragmentable extension headers
^1da177e4c3f41 Linus Torvalds           2005-04-16  1542  	 *        are to=
o large.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1543  	 * --yoshfuji
^1da177e4c3f41 Linus Torvalds           2005-04-16  1544  	 */
^1da177e4c3f41 Linus Torvalds           2005-04-16  1545  =

2811ebac2521ce Hannes Frederic Sowa     2013-09-21  1546  	cork->length +=
=3D length;
2811ebac2521ce Hannes Frederic Sowa     2013-09-21  1547  	if (!skb)
^1da177e4c3f41 Linus Torvalds           2005-04-16  1548  		goto alloc_new_=
skb;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1549  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  1550  	while (length > =
0) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1551  		/* Check if the=
 remaining data fits into current packet. */
bdc712b4c2baf9 David S. Miller          2011-05-06  1552  		copy =3D (cork-=
>length <=3D mtu && !(cork->flags & IPCORK_ALLFRAG) ? mtu : maxfraglen) - s=
kb->len;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1553  		if (copy < leng=
th)
^1da177e4c3f41 Linus Torvalds           2005-04-16  1554  			copy =3D maxfr=
aglen - skb->len;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1555  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  1556  		if (copy <=3D 0=
) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1557  			char *data;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1558  			unsigned int d=
atalen;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1559  			unsigned int f=
raglen;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1560  			unsigned int f=
raggap;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1561  			unsigned int a=
lloclen;
aba36930a35e7f Willem de Bruijn         2018-11-24  1562  			unsigned int p=
agedlen;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1563  alloc_new_skb:
^1da177e4c3f41 Linus Torvalds           2005-04-16  1564  			/* There's no =
room in the current skb */
0c1833797a5a6e Gao feng                 2012-05-26  1565  			if (skb)
0c1833797a5a6e Gao feng                 2012-05-26  1566  				fraggap =3D s=
kb->len - maxfraglen;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1567  			else
^1da177e4c3f41 Linus Torvalds           2005-04-16  1568  				fraggap =3D 0;
0c1833797a5a6e Gao feng                 2012-05-26  1569  			/* update mtu =
and maxfraglen if necessary */
63159f29be1df7 Ian Morris               2015-03-29  1570  			if (!skb || !s=
kb_prev)
0c1833797a5a6e Gao feng                 2012-05-26  1571  				ip6_append_da=
ta_mtu(&mtu, &maxfraglen,
75a493e60ac4bb Hannes Frederic Sowa     2013-07-02  1572  						    fraghea=
derlen, skb, rt,
e367c2d03dba4c lucien                   2014-03-17  1573  						    orig_mt=
u);
0c1833797a5a6e Gao feng                 2012-05-26  1574  =

0c1833797a5a6e Gao feng                 2012-05-26  1575  			skb_prev =3D s=
kb;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1576  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  1577  			/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  1578  			 * If remainin=
g data exceeds the mtu,
^1da177e4c3f41 Linus Torvalds           2005-04-16  1579  			 * we know we =
need more fragment(s).
^1da177e4c3f41 Linus Torvalds           2005-04-16  1580  			 */
^1da177e4c3f41 Linus Torvalds           2005-04-16  1581  			datalen =3D le=
ngth + fraggap;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1582  =

0c1833797a5a6e Gao feng                 2012-05-26  1583  			if (datalen > =
(cork->length <=3D mtu && !(cork->flags & IPCORK_ALLFRAG) ? mtu : maxfragle=
n) - fragheaderlen)
0c1833797a5a6e Gao feng                 2012-05-26  1584  				datalen =3D m=
axfraglen - fragheaderlen - rt->dst.trailer_len;
15e36f5b8e982d Willem de Bruijn         2018-04-26  1585  			fraglen =3D da=
talen + fragheaderlen;
aba36930a35e7f Willem de Bruijn         2018-11-24  1586  			pagedlen =3D 0;
15e36f5b8e982d Willem de Bruijn         2018-04-26  1587  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  1588  			if ((flags & M=
SG_MORE) &&
d8d1f30b95a635 Changli Gao              2010-06-10  1589  			    !(rt->dst.=
dev->features&NETIF_F_SG))
^1da177e4c3f41 Linus Torvalds           2005-04-16  1590  				alloclen =3D =
mtu;
15e36f5b8e982d Willem de Bruijn         2018-04-26  1591  			else if (!page=
d)
15e36f5b8e982d Willem de Bruijn         2018-04-26  1592  				alloclen =3D =
fraglen;
15e36f5b8e982d Willem de Bruijn         2018-04-26  1593  			else {
15e36f5b8e982d Willem de Bruijn         2018-04-26  1594  				alloclen =3D =
min_t(int, fraglen, MAX_HEADER);
15e36f5b8e982d Willem de Bruijn         2018-04-26  1595  				pagedlen =3D =
fraglen - alloclen;
15e36f5b8e982d Willem de Bruijn         2018-04-26  1596  			}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1597  =

299b0767642a65 Steffen Klassert         2011-10-11  1598  			alloclen +=3D =
dst_exthdrlen;
299b0767642a65 Steffen Klassert         2011-10-11  1599  =

0c1833797a5a6e Gao feng                 2012-05-26  1600  			if (datalen !=
=3D length + fraggap) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1601  				/*
0c1833797a5a6e Gao feng                 2012-05-26  1602  				 * this is no=
t the last fragment, the trailer
0c1833797a5a6e Gao feng                 2012-05-26  1603  				 * space is r=
egarded as data space.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1604  				 */
0c1833797a5a6e Gao feng                 2012-05-26  1605  				datalen +=3D =
rt->dst.trailer_len;
0c1833797a5a6e Gao feng                 2012-05-26  1606  			}
0c1833797a5a6e Gao feng                 2012-05-26  1607  =

d8d1f30b95a635 Changli Gao              2010-06-10  1608  			alloclen +=3D =
rt->dst.trailer_len;
0c1833797a5a6e Gao feng                 2012-05-26  1609  			fraglen =3D da=
talen + fragheaderlen;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1610  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  1611  			/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  1612  			 * We just res=
erve space for fragment header.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1613  			 * Note: this =
may be overallocation if the message
^1da177e4c3f41 Linus Torvalds           2005-04-16  1614  			 * (without MS=
G_MORE) fits into the MTU.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1615  			 */
^1da177e4c3f41 Linus Torvalds           2005-04-16  1616  			alloclen +=3D =
sizeof(struct frag_hdr);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1617  =

15e36f5b8e982d Willem de Bruijn         2018-04-26  1618  			copy =3D datal=
en - transhdrlen - fraggap - pagedlen;
232cd35d0804cc Eric Dumazet             2017-05-19  1619  			if (copy < 0) {
232cd35d0804cc Eric Dumazet             2017-05-19  1620  				err =3D -EINV=
AL;
232cd35d0804cc Eric Dumazet             2017-05-19  1621  				goto error;
232cd35d0804cc Eric Dumazet             2017-05-19  1622  			}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1623  			if (transhdrle=
n) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1624  				skb =3D sock_=
alloc_send_skb(sk,
^1da177e4c3f41 Linus Torvalds           2005-04-16  1625  						alloclen + =
hh_len,
^1da177e4c3f41 Linus Torvalds           2005-04-16  1626  						(flags & MS=
G_DONTWAIT), &err);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1627  			} else {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1628  				skb =3D NULL;
1f4c6eb2402968 Eric Dumazet             2018-03-31  1629  				if (refcount_=
read(&sk->sk_wmem_alloc) + wmem_alloc_delta <=3D
^1da177e4c3f41 Linus Torvalds           2005-04-16  1630  				    2 * sk->s=
k_sndbuf)
1f4c6eb2402968 Eric Dumazet             2018-03-31  1631  					skb =3D allo=
c_skb(alloclen + hh_len,
^1da177e4c3f41 Linus Torvalds           2005-04-16  1632  							sk->sk_all=
ocation);
63159f29be1df7 Ian Morris               2015-03-29  1633  				if (unlikely(=
!skb))
^1da177e4c3f41 Linus Torvalds           2005-04-16  1634  					err =3D -ENO=
BUFS;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1635  			}
63159f29be1df7 Ian Morris               2015-03-29  1636  			if (!skb)
^1da177e4c3f41 Linus Torvalds           2005-04-16  1637  				goto error;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1638  			/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  1639  			 *	Fill in the=
 control structures
^1da177e4c3f41 Linus Torvalds           2005-04-16  1640  			 */
9c9c9ad5fae7e9 Hannes Frederic Sowa     2013-08-26  1641  			skb->protocol =
=3D htons(ETH_P_IPV6);
32dce968dd987a Vlad Yasevich            2015-01-31  1642  			skb->ip_summed=
 =3D csummode;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1643  			skb->csum =3D =
0;
1f85851e17b64c Gao feng                 2012-03-19  1644  			/* reserve for=
 fragmentation and ipsec header */
1f85851e17b64c Gao feng                 2012-03-19  1645  			skb_reserve(sk=
b, hh_len + sizeof(struct frag_hdr) +
1f85851e17b64c Gao feng                 2012-03-19  1646  				    dst_exthd=
rlen);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1647  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  1648  			/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  1649  			 *	Find where =
to start putting bytes
^1da177e4c3f41 Linus Torvalds           2005-04-16  1650  			 */
15e36f5b8e982d Willem de Bruijn         2018-04-26  1651  			data =3D skb_p=
ut(skb, fraglen - pagedlen);
1f85851e17b64c Gao feng                 2012-03-19  1652  			skb_set_networ=
k_header(skb, exthdrlen);
1f85851e17b64c Gao feng                 2012-03-19  1653  			data +=3D frag=
headerlen;
b0e380b1d8a8e0 Arnaldo Carvalho de Melo 2007-04-10  1654  			skb->transport=
_header =3D (skb->network_header +
b0e380b1d8a8e0 Arnaldo Carvalho de Melo 2007-04-10  1655  						 fragheader=
len);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1656  			if (fraggap) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1657  				skb->csum =3D=
 skb_copy_and_csum_bits(
^1da177e4c3f41 Linus Torvalds           2005-04-16  1658  					skb_prev, ma=
xfraglen,
8d5930dfb7edbf Al Viro                  2020-07-10  1659  					data + trans=
hdrlen, fraggap);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1660  				skb_prev->csu=
m =3D csum_sub(skb_prev->csum,
^1da177e4c3f41 Linus Torvalds           2005-04-16  1661  							  skb->csu=
m);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1662  				data +=3D fra=
ggap;
e9fa4f7bd291c2 Herbert Xu               2006-08-13  1663  				pskb_trim_uni=
que(skb_prev, maxfraglen);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1664  			}
232cd35d0804cc Eric Dumazet             2017-05-19  1665  			if (copy > 0 &&
232cd35d0804cc Eric Dumazet             2017-05-19  1666  			    getfrag(fr=
om, data + transhdrlen, offset,
232cd35d0804cc Eric Dumazet             2017-05-19  1667  				    copy, fra=
ggap, skb) < 0) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1668  				err =3D -EFAU=
LT;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1669  				kfree_skb(skb=
);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1670  				goto error;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1671  			}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1672  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  1673  			offset +=3D co=
py;
15e36f5b8e982d Willem de Bruijn         2018-04-26  1674  			length -=3D co=
py + transhdrlen;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1675  			transhdrlen =
=3D 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1676  			exthdrlen =3D =
0;
299b0767642a65 Steffen Klassert         2011-10-11  1677  			dst_exthdrlen =
=3D 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1678  =

52900d22288e7d Willem de Bruijn         2018-11-30  1679  			/* Only the in=
itial fragment is time stamped */
52900d22288e7d Willem de Bruijn         2018-11-30  1680  			skb_shinfo(skb=
)->tx_flags =3D cork->tx_flags;
52900d22288e7d Willem de Bruijn         2018-11-30  1681  			cork->tx_flags=
 =3D 0;
52900d22288e7d Willem de Bruijn         2018-11-30  1682  			skb_shinfo(skb=
)->tskey =3D tskey;
52900d22288e7d Willem de Bruijn         2018-11-30  1683  			tskey =3D 0;
52900d22288e7d Willem de Bruijn         2018-11-30  1684  			skb_zcopy_set(=
skb, uarg, &extra_uref);
52900d22288e7d Willem de Bruijn         2018-11-30  1685  =

0dec879f636f11 Julian Anastasov         2017-02-06  1686  			if ((flags & M=
SG_CONFIRM) && !skb_prev)
0dec879f636f11 Julian Anastasov         2017-02-06  1687  				skb_set_dst_p=
ending_confirm(skb, 1);
0dec879f636f11 Julian Anastasov         2017-02-06  1688  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  1689  			/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  1690  			 * Put the pac=
ket on the pending queue
^1da177e4c3f41 Linus Torvalds           2005-04-16  1691  			 */
1f4c6eb2402968 Eric Dumazet             2018-03-31  1692  			if (!skb->dest=
ructor) {
1f4c6eb2402968 Eric Dumazet             2018-03-31  1693  				skb->destruct=
or =3D sock_wfree;
1f4c6eb2402968 Eric Dumazet             2018-03-31  1694  				skb->sk =3D s=
k;
1f4c6eb2402968 Eric Dumazet             2018-03-31  1695  				wmem_alloc_de=
lta +=3D skb->truesize;
1f4c6eb2402968 Eric Dumazet             2018-03-31  1696  			}
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1697  			__skb_queue_ta=
il(queue, skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1698  			continue;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1699  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1700  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  1701  		if (copy > leng=
th)
^1da177e4c3f41 Linus Torvalds           2005-04-16  1702  			copy =3D lengt=
h;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1703  =

113f99c3358564 Willem de Bruijn         2018-05-17  1704  		if (!(rt->dst.d=
ev->features&NETIF_F_SG) &&
113f99c3358564 Willem de Bruijn         2018-05-17  1705  		    skb_tailroo=
m(skb) >=3D copy) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1706  			unsigned int o=
ff;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1707  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  1708  			off =3D skb->l=
en;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1709  			if (getfrag(fr=
om, skb_put(skb, copy),
^1da177e4c3f41 Linus Torvalds           2005-04-16  1710  						offset, cop=
y, off, skb) < 0) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1711  				__skb_trim(sk=
b, off);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1712  				err =3D -EFAU=
LT;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1713  				goto error;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1714  			}
b5947e5d1e710c Willem de Bruijn         2018-11-30  1715  		} else if (!uar=
g || !uarg->zerocopy) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1716  			int i =3D skb_=
shinfo(skb)->nr_frags;
5640f7685831e0 Eric Dumazet             2012-09-23  1717  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  1718  			err =3D -ENOME=
M;
5640f7685831e0 Eric Dumazet             2012-09-23  1719  			if (!sk_page_f=
rag_refill(sk, pfrag))
^1da177e4c3f41 Linus Torvalds           2005-04-16  1720  				goto error;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1721  =

5640f7685831e0 Eric Dumazet             2012-09-23  1722  			if (!skb_can_c=
oalesce(skb, i, pfrag->page,
5640f7685831e0 Eric Dumazet             2012-09-23  1723  					      pfrag-=
>offset)) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1724  				err =3D -EMSG=
SIZE;
5640f7685831e0 Eric Dumazet             2012-09-23  1725  				if (i =3D=3D =
MAX_SKB_FRAGS)
^1da177e4c3f41 Linus Torvalds           2005-04-16  1726  					goto error;
5640f7685831e0 Eric Dumazet             2012-09-23  1727  =

5640f7685831e0 Eric Dumazet             2012-09-23  1728  				__skb_fill_pa=
ge_desc(skb, i, pfrag->page,
5640f7685831e0 Eric Dumazet             2012-09-23  1729  						     pfrag-=
>offset, 0);
5640f7685831e0 Eric Dumazet             2012-09-23  1730  				skb_shinfo(sk=
b)->nr_frags =3D ++i;
5640f7685831e0 Eric Dumazet             2012-09-23  1731  				get_page(pfra=
g->page);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1732  			}
5640f7685831e0 Eric Dumazet             2012-09-23  1733  			copy =3D min_t=
(int, copy, pfrag->size - pfrag->offset);
9e903e085262ff Eric Dumazet             2011-10-18  1734  			if (getfrag(fr=
om,
5640f7685831e0 Eric Dumazet             2012-09-23  1735  				    page_addr=
ess(pfrag->page) + pfrag->offset,
5640f7685831e0 Eric Dumazet             2012-09-23  1736  				    offset, c=
opy, skb->len, skb) < 0)
5640f7685831e0 Eric Dumazet             2012-09-23  1737  				goto error_ef=
ault;
5640f7685831e0 Eric Dumazet             2012-09-23  1738  =

5640f7685831e0 Eric Dumazet             2012-09-23  1739  			pfrag->offset =
+=3D copy;
5640f7685831e0 Eric Dumazet             2012-09-23  1740  			skb_frag_size_=
add(&skb_shinfo(skb)->frags[i - 1], copy);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1741  			skb->len +=3D =
copy;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1742  			skb->data_len =
+=3D copy;
f945fa7ad9c12a Herbert Xu               2008-01-22  1743  			skb->truesize =
+=3D copy;
1f4c6eb2402968 Eric Dumazet             2018-03-31  1744  			wmem_alloc_del=
ta +=3D copy;
b5947e5d1e710c Willem de Bruijn         2018-11-30  1745  		} else {
b5947e5d1e710c Willem de Bruijn         2018-11-30  1746  			err =3D skb_ze=
rocopy_iter_dgram(skb, from, copy);
b5947e5d1e710c Willem de Bruijn         2018-11-30  1747  			if (err < 0)
b5947e5d1e710c Willem de Bruijn         2018-11-30  1748  				goto error;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1749  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1750  		offset +=3D cop=
y;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1751  		length -=3D cop=
y;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1752  	}
5640f7685831e0 Eric Dumazet             2012-09-23  1753  =

9e8445a56c253f Paolo Abeni              2018-04-04  1754  	if (wmem_alloc_d=
elta)
1f4c6eb2402968 Eric Dumazet             2018-03-31  1755  		refcount_add(wm=
em_alloc_delta, &sk->sk_wmem_alloc);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1756  	return 0;
5640f7685831e0 Eric Dumazet             2012-09-23  1757  =

5640f7685831e0 Eric Dumazet             2012-09-23  1758  error_efault:
5640f7685831e0 Eric Dumazet             2012-09-23  1759  	err =3D -EFAULT;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1760  error:
8e0449172497a9 Jonathan Lemon           2021-01-06  1761  	net_zcopy_put_ab=
ort(uarg, extra_uref);
bdc712b4c2baf9 David S. Miller          2011-05-06  1762  	cork->length -=
=3D length;
3bd653c8455bc7 Denis V. Lunev           2008-10-08  1763  	IP6_INC_STATS(so=
ck_net(sk), rt->rt6i_idev, IPSTATS_MIB_OUTDISCARDS);
1f4c6eb2402968 Eric Dumazet             2018-03-31  1764  	refcount_add(wme=
m_alloc_delta, &sk->sk_wmem_alloc);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1765  	return err;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1766  }
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1767  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0713337550485713510==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICEQti2AAAy5jb25maWcAjFxLk9w2Dr7nV3Q5l+QQ77zXqa05sCmqm2lJlEmqH3NRTcZt71TG
M9l5bOJ/vwAptUgKam8OzogA3yDwAQT7xx9+nLG316evt6/3d7cPD99mX/aP++fb1/2n2ef7h/2/
ZpmaVcrORCbte2Au7h/f/v7H/fmHq9nl+9Oz9yez1f75cf8w40+Pn++/vEHV+6fHH378gasql4uW
83YttJGqaq3Y2ut3X+7ufvl19lO2//3+9nH26/vz9ye/nJ397P96F1STpl1wfv2tL1oMTV3/enJ+
cnLgLVi1OJAOxUWGTczzbGgCinq2s/PLk7NDeUA4CYbAWdUWsloNLQSFrbHMSh7Rlsy0zJTtQllF
EmQFVUVAUpWxuuFWaTOUSv2x3Sgd9DtvZJFZWYrWsnkhWqO0Hah2qQWD6Va5gn+AxWBV2IQfZwu3
nQ+zl/3r25/Dtsy1WomqhV0xZR10XEnbimrdMg2rIktpr8/PoJXDaMtaQu9WGDu7f5k9Pr1iw4dl
VJwV/Tq+e0cVt6wJV8ZNqzWssAH/kq1FuxK6EkW7uJHB8ELKHChnNKm4KRlN2d5M1VBThAuacGMs
CtZhaYLxhiuT0t2ojzHg2I/RtzfHaytiX6K5pFVwIkSdTOSsKayTiGBv+uKlMrZipbh+99Pj0+P+
53dDu2Zn1rLm5DBrZeS2LT82ohFEpxtm+bJ11OCIaGVMW4pS6V3LrGV8ORAbIwo5D6fFGtBURNtu
85iG9h0HjBKksuiPCZy42cvb7y/fXl73X4djshCV0JK7A1lrNQ+GFZLMUm1oiqx+E9zieQikSGdA
Mq3ZtFoYUWV0Vb4MRR9LMlUyWcVlRpYUU7uUQuNsd3TjJbMadgJWAA4nKB+aC4en1wzH35YqE3FP
udJcZJ3ykdVioJqaaSOQiW43E/NmkRu3bfvHT7Onz8kGDKpd8ZVRDXTkhSNTQTduN0MWJ6zfqMpr
VsiMWdEWzNiW73hBbKXTr+tBMhKya0+sRWXNUSIqV5Zx6Og4WwnbxLLfGpKvVKZtahxyon/8EeJ1
44arjdP2vbVwsmzvv+6fXyhxXt60NTSvMme2DkemUkiRWUGdSUcMuZdysUTJ6PqPz3m3m6Mh9K3V
WoiyttCqs4KDYujK16poKsv0jlYfnosYZV+fK6jeLwQs0j/s7csfs1cYzuwWhvbyevv6Mru9u3t6
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
UPIxOnB7R8kJ8ZWuEv8D6w4sTh/NAQA=
--===============0713337550485713510==--

