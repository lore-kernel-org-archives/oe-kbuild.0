Content-Type: multipart/mixed; boundary="===============5905779416658395274=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/netfilter/nf_flow_table_ip.c:312:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Sun, 12 Dec 2021 22:09:59 +0800
Message-ID: <202112122245.4VYxxLtD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5905779416658395274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Pablo Neira Ayuso <pablo@netfilter.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a763d5a5abd65797aec3dd1bf01fe2ccbec32967
commit: 7a27f6ab41356ecba47ec2bec6d635704c169779 netfilter: flowtable: use =
dev_fill_forward_path() to obtain egress device
date:   9 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20211126 (https://download.01.org/0day-ci/archi=
ve/20211212/202112122245.4VYxxLtD-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b5=
58d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D7a27f6ab41356ecba47ec2bec6d635704c169779
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7a27f6ab41356ecba47ec2bec6d635704c169779
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                    ^
   include/linux/byteorder/generic.h:135:21: note: expanded from macro '___=
htons'
   #define ___htons(x) __cpu_to_be16(x)
                       ^
   include/uapi/linux/byteorder/little_endian.h:41:43: note: expanded from =
macro '__cpu_to_be16'
   #define __cpu_to_be16(x) ((__force __be16)__swab16((x)))
                                             ^
   include/uapi/linux/swab.h:105:3: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
            ^
   include/net/llc_pdu.h:266:6: note: Assuming the condition is false
           if (skb->protocol =3D=3D htons(ETH_P_802_2))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/llc_pdu.h:266:2: note: Taking false branch
           if (skb->protocol =3D=3D htons(ETH_P_802_2))
           ^
   net/llc/llc_sap.c:425:2: note: Returning from 'llc_pdu_decode_da'
           llc_pdu_decode_da(skb, laddr.mac);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/llc/llc_sap.c:428:6: note: Calling 'is_multicast_ether_addr'
           if (is_multicast_ether_addr(laddr.mac)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/etherdevice.h:121:2: note: Assigned value is garbage or un=
defined
           u16 a =3D *(const u16 *)addr;
           ^       ~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   net/llc/llc_station.c:57:2: warning: Value stored to 'rc' is never read =
[clang-analyzer-deadcode.DeadStores]
           rc =3D 0;
           ^    ~
   net/llc/llc_station.c:57:2: note: Value stored to 'rc' is never read
           rc =3D 0;
           ^    ~
   net/llc/llc_station.c:86:2: warning: Value stored to 'rc' is never read =
[clang-analyzer-deadcode.DeadStores]
           rc =3D 0;
           ^    ~
   net/llc/llc_station.c:86:2: note: Value stored to 'rc' is never read
           rc =3D 0;
           ^    ~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/net/dsa/bcm_sf2.c:467:17: warning: Value stored to 'dev' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D priv->dev->ds->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/bcm_sf2.c:467:17: note: Value stored to 'dev' during its=
 initialization is never read
           struct device *dev =3D priv->dev->ds->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/bcm_sf2.c:494:2: warning: Value stored to 'reg' is never=
 read [clang-analyzer-deadcode.DeadStores]
           reg =3D reg_readl(priv, REG_CROSSBAR);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/bcm_sf2.c:494:2: note: Value stored to 'reg' is never re=
ad
           reg =3D reg_readl(priv, REG_CROSSBAR);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/bcm_sf2.c:496:3: warning: Value stored to 'shift' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   shift =3D i * priv->num_crossbar_int_ports;
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/bcm_sf2.c:496:3: note: Value stored to 'shift' is never =
read
                   shift =3D i * priv->num_crossbar_int_ports;
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> net/netfilter/nf_flow_table_ip.c:312:2: warning: Undefined or garbage va=
lue returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   net/netfilter/nf_flow_table_ip.c:243:2: note: 'ret' declared without an =
initial value
           int ret;
           ^~~~~~~
   net/netfilter/nf_flow_table_ip.c:245:23: note: '?' condition is true
           if (skb->protocol !=3D htons(ETH_P_IP))
                                ^
   include/linux/byteorder/generic.h:141:18: note: expanded from macro 'hto=
ns'
   #define htons(x) ___htons(x)
                    ^
   include/linux/byteorder/generic.h:135:21: note: expanded from macro '___=
htons'
   #define ___htons(x) __cpu_to_be16(x)
                       ^
   include/uapi/linux/byteorder/little_endian.h:41:43: note: expanded from =
macro '__cpu_to_be16'
   #define __cpu_to_be16(x) ((__force __be16)__swab16((x)))
                                             ^
   include/uapi/linux/swab.h:105:3: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
            ^
   net/netfilter/nf_flow_table_ip.c:245:6: note: Assuming the condition is =
false
           if (skb->protocol !=3D htons(ETH_P_IP))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_flow_table_ip.c:245:2: note: Taking false branch
           if (skb->protocol !=3D htons(ETH_P_IP))
           ^
   net/netfilter/nf_flow_table_ip.c:248:2: note: Taking false branch
           if (nf_flow_tuple_ip(skb, state->in, &tuple, &hdrsize) < 0)
           ^
   net/netfilter/nf_flow_table_ip.c:252:6: note: Assuming 'tuplehash' is no=
t equal to NULL
           if (tuplehash =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~
   net/netfilter/nf_flow_table_ip.c:252:2: note: Taking false branch
           if (tuplehash =3D=3D NULL)
           ^
   net/netfilter/nf_flow_table_ip.c:256:9: note: Left side of '&&' is false
           flow =3D container_of(tuplehash, struct flow_offload, tuplehash[=
dir]);
                  ^
   include/linux/kernel.h:709:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   net/netfilter/nf_flow_table_ip.c:256:9: note: Taking false branch
           flow =3D container_of(tuplehash, struct flow_offload, tuplehash[=
dir]);
                  ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/netfilter/nf_flow_table_ip.c:256:9: note: Loop condition is false.  =
Exiting loop
           flow =3D container_of(tuplehash, struct flow_offload, tuplehash[=
dir]);
                  ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/netfilter/nf_flow_table_ip.c:258:2: note: Taking false branch
           if (unlikely(nf_flow_exceeds_mtu(skb, flow->tuplehash[dir].tuple=
.mtu)))
           ^
   net/netfilter/nf_flow_table_ip.c:263:6: note: Calling 'nf_flow_state_che=
ck'
           if (nf_flow_state_check(flow, iph->protocol, skb, thoff))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_flow_table_ip.c:25:6: note: Assuming 'proto' is not equ=
al to IPPROTO_TCP
           if (proto !=3D IPPROTO_TCP)
               ^~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_flow_table_ip.c:25:2: note: Taking true branch
           if (proto !=3D IPPROTO_TCP)
           ^
   net/netfilter/nf_flow_table_ip.c:26:3: note: Returning zero, which parti=
cipates in a condition later
                   return 0;
                   ^~~~~~~~
   net/netfilter/nf_flow_table_ip.c:263:6: note: Returning from 'nf_flow_st=
ate_check'
           if (nf_flow_state_check(flow, iph->protocol, skb, thoff))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_flow_table_ip.c:263:2: note: Taking false branch
           if (nf_flow_state_check(flow, iph->protocol, skb, thoff))
           ^
   net/netfilter/nf_flow_table_ip.c:266:6: note: Assuming field 'xmit_type'=
 is not equal to FLOW_OFFLOAD_XMIT_NEIGH
           if (tuplehash->tuple.xmit_type =3D=3D FLOW_OFFLOAD_XMIT_NEIGH ||

vim +312 net/netfilter/nf_flow_table_ip.c

7a27f6ab41356e Pablo Neira Ayuso  2021-03-24  227  =

7d208687176292 Felix Fietkau      2018-02-26  228  unsigned int
7d208687176292 Felix Fietkau      2018-02-26  229  nf_flow_offload_ip_hook(=
void *priv, struct sk_buff *skb,
7d208687176292 Felix Fietkau      2018-02-26  230  			const struct nf_hook_=
state *state)
7d208687176292 Felix Fietkau      2018-02-26  231  {
7d208687176292 Felix Fietkau      2018-02-26  232  	struct flow_offload_tup=
le_rhash *tuplehash;
7d208687176292 Felix Fietkau      2018-02-26  233  	struct nf_flowtable *fl=
ow_table =3D priv;
7d208687176292 Felix Fietkau      2018-02-26  234  	struct flow_offload_tup=
le tuple =3D {};
7d208687176292 Felix Fietkau      2018-02-26  235  	enum flow_offload_tuple=
_dir dir;
7d208687176292 Felix Fietkau      2018-02-26  236  	struct flow_offload *fl=
ow;
7d208687176292 Felix Fietkau      2018-02-26  237  	struct net_device *outd=
ev;
2a79fd3908acd8 Jason A. Donenfeld 2018-05-30  238  	struct rtable *rt;
b6f27d322a0a7b Felix Fietkau      2018-02-26  239  	unsigned int thoff;
7d208687176292 Felix Fietkau      2018-02-26  240  	struct iphdr *iph;
7d208687176292 Felix Fietkau      2018-02-26  241  	__be32 nexthop;
2fc11745c3ffa3 Pablo Neira Ayuso  2021-03-17  242  	u32 hdrsize;
7a27f6ab41356e Pablo Neira Ayuso  2021-03-24  243  	int ret;
7d208687176292 Felix Fietkau      2018-02-26  244  =

7d208687176292 Felix Fietkau      2018-02-26  245  	if (skb->protocol !=3D =
htons(ETH_P_IP))
7d208687176292 Felix Fietkau      2018-02-26  246  		return NF_ACCEPT;
7d208687176292 Felix Fietkau      2018-02-26  247  =

2fc11745c3ffa3 Pablo Neira Ayuso  2021-03-17  248  	if (nf_flow_tuple_ip(sk=
b, state->in, &tuple, &hdrsize) < 0)
7d208687176292 Felix Fietkau      2018-02-26  249  		return NF_ACCEPT;
7d208687176292 Felix Fietkau      2018-02-26  250  =

7d208687176292 Felix Fietkau      2018-02-26  251  	tuplehash =3D flow_offl=
oad_lookup(flow_table, &tuple);
7d208687176292 Felix Fietkau      2018-02-26  252  	if (tuplehash =3D=3D NU=
LL)
7d208687176292 Felix Fietkau      2018-02-26  253  		return NF_ACCEPT;
7d208687176292 Felix Fietkau      2018-02-26  254  =

7d208687176292 Felix Fietkau      2018-02-26  255  	dir =3D tuplehash->tupl=
e.dir;
7d208687176292 Felix Fietkau      2018-02-26  256  	flow =3D container_of(t=
uplehash, struct flow_offload, tuplehash[dir]);
7d208687176292 Felix Fietkau      2018-02-26  257  =

e75b3e1c9bc5b9 Florian Westphal   2019-05-21  258  	if (unlikely(nf_flow_ex=
ceeds_mtu(skb, flow->tuplehash[dir].tuple.mtu)))
7d208687176292 Felix Fietkau      2018-02-26  259  		return NF_ACCEPT;
7d208687176292 Felix Fietkau      2018-02-26  260  =

2fc11745c3ffa3 Pablo Neira Ayuso  2021-03-17  261  	iph =3D ip_hdr(skb);
2fc11745c3ffa3 Pablo Neira Ayuso  2021-03-17  262  	thoff =3D iph->ihl * 4;
2fc11745c3ffa3 Pablo Neira Ayuso  2021-03-17  263  	if (nf_flow_state_check=
(flow, iph->protocol, skb, thoff))
b6f27d322a0a7b Felix Fietkau      2018-02-26  264  		return NF_ACCEPT;
b6f27d322a0a7b Felix Fietkau      2018-02-26  265  =

7a27f6ab41356e Pablo Neira Ayuso  2021-03-24  266  	if (tuplehash->tuple.xm=
it_type =3D=3D FLOW_OFFLOAD_XMIT_NEIGH ||
7a27f6ab41356e Pablo Neira Ayuso  2021-03-24  267  	    tuplehash->tuple.xm=
it_type =3D=3D FLOW_OFFLOAD_XMIT_XFRM) {
7a27f6ab41356e Pablo Neira Ayuso  2021-03-24  268  		rt =3D (struct rtable =
*)tuplehash->tuple.dst_cache;
e5075c0badaaac Pablo Neira Ayuso  2021-03-17  269  		if (!dst_check(&rt->ds=
t, 0)) {
589b474a4b7ce4 Florian Westphal   2019-07-30  270  			flow_offload_teardown=
(flow);
589b474a4b7ce4 Florian Westphal   2019-07-30  271  			return NF_ACCEPT;
589b474a4b7ce4 Florian Westphal   2019-07-30  272  		}
7a27f6ab41356e Pablo Neira Ayuso  2021-03-24  273  	}
589b474a4b7ce4 Florian Westphal   2019-07-30  274  =

2babb46c8c825e Pablo Neira Ayuso  2021-03-17  275  	if (skb_try_make_writab=
le(skb, thoff + hdrsize))
2babb46c8c825e Pablo Neira Ayuso  2021-03-17  276  		return NF_DROP;
2babb46c8c825e Pablo Neira Ayuso  2021-03-17  277  =

1b9cd7690a1ef6 Pablo Neira Ayuso  2021-03-17  278  	flow_offload_refresh(fl=
ow_table, flow);
1b9cd7690a1ef6 Pablo Neira Ayuso  2021-03-17  279  =

2babb46c8c825e Pablo Neira Ayuso  2021-03-17  280  	iph =3D ip_hdr(skb);
f4401262b927b8 Pablo Neira Ayuso  2021-03-17  281  	nf_flow_nat_ip(flow, sk=
b, thoff, dir, iph);
7d208687176292 Felix Fietkau      2018-02-26  282  =

7d208687176292 Felix Fietkau      2018-02-26  283  	ip_decrease_ttl(iph);
de20900fbe1c4f Florian Westphal   2019-08-27  284  	skb->tstamp =3D 0;
7d208687176292 Felix Fietkau      2018-02-26  285  =

53c2b2899af7e6 Pablo Neira Ayuso  2020-03-24  286  	if (flow_table->flags &=
 NF_FLOWTABLE_COUNTER)
53c2b2899af7e6 Pablo Neira Ayuso  2020-03-24  287  		nf_ct_acct_update(flow=
->ct, tuplehash->tuple.dir, skb->len);
53c2b2899af7e6 Pablo Neira Ayuso  2020-03-24  288  =

5139c0c007250c Pablo Neira Ayuso  2021-03-24  289  	if (unlikely(tuplehash-=
>tuple.xmit_type =3D=3D FLOW_OFFLOAD_XMIT_XFRM)) {
589b474a4b7ce4 Florian Westphal   2019-07-30  290  		memset(skb->cb, 0, siz=
eof(struct inet_skb_parm));
589b474a4b7ce4 Florian Westphal   2019-07-30  291  		IPCB(skb)->iif =3D skb=
->dev->ifindex;
589b474a4b7ce4 Florian Westphal   2019-07-30  292  		IPCB(skb)->flags =3D I=
PSKB_FORWARDED;
589b474a4b7ce4 Florian Westphal   2019-07-30  293  		return nf_flow_xmit_xf=
rm(skb, state, &rt->dst);
589b474a4b7ce4 Florian Westphal   2019-07-30  294  	}
589b474a4b7ce4 Florian Westphal   2019-07-30  295  =

7a27f6ab41356e Pablo Neira Ayuso  2021-03-24  296  	switch (tuplehash->tupl=
e.xmit_type) {
7a27f6ab41356e Pablo Neira Ayuso  2021-03-24  297  	case FLOW_OFFLOAD_XMIT_=
NEIGH:
5139c0c007250c Pablo Neira Ayuso  2021-03-24  298  		outdev =3D rt->dst.dev;
7d208687176292 Felix Fietkau      2018-02-26  299  		skb->dev =3D outdev;
7d208687176292 Felix Fietkau      2018-02-26  300  		nexthop =3D rt_nexthop=
(rt, flow->tuplehash[!dir].tuple.src_v4.s_addr);
2a79fd3908acd8 Jason A. Donenfeld 2018-05-30  301  		skb_dst_set_noref(skb,=
 &rt->dst);
7d208687176292 Felix Fietkau      2018-02-26  302  		neigh_xmit(NEIGH_ARP_T=
ABLE, outdev, &nexthop, skb);
7a27f6ab41356e Pablo Neira Ayuso  2021-03-24  303  		ret =3D NF_STOLEN;
7a27f6ab41356e Pablo Neira Ayuso  2021-03-24  304  		break;
7a27f6ab41356e Pablo Neira Ayuso  2021-03-24  305  	case FLOW_OFFLOAD_XMIT_=
DIRECT:
7a27f6ab41356e Pablo Neira Ayuso  2021-03-24  306  		ret =3D nf_flow_queue_=
xmit(state->net, skb, tuplehash, ETH_P_IP);
7a27f6ab41356e Pablo Neira Ayuso  2021-03-24  307  		if (ret =3D=3D NF_DROP)
7a27f6ab41356e Pablo Neira Ayuso  2021-03-24  308  			flow_offload_teardown=
(flow);
7a27f6ab41356e Pablo Neira Ayuso  2021-03-24  309  		break;
7a27f6ab41356e Pablo Neira Ayuso  2021-03-24  310  	}
7d208687176292 Felix Fietkau      2018-02-26  311  =

7a27f6ab41356e Pablo Neira Ayuso  2021-03-24 @312  	return ret;
7d208687176292 Felix Fietkau      2018-02-26  313  }
7d208687176292 Felix Fietkau      2018-02-26  314  EXPORT_SYMBOL_GPL(nf_flo=
w_offload_ip_hook);
a908fdec3dda29 Felix Fietkau      2018-02-26  315  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5905779416658395274==--

