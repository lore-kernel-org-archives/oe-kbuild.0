Content-Type: multipart/mixed; boundary="===============5024548225938829027=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/netfilter/nf_flow_table_ip.c:312:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Mon, 31 Jan 2022 06:28:42 +0800
Message-ID: <202201310554.R5dGFZGh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5024548225938829027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Pablo Neira Ayuso <pablo@netfilter.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   26291c54e111ff6ba87a164d85d4a4e134b7315c
commit: 7a27f6ab41356ecba47ec2bec6d635704c169779 netfilter: flowtable: use =
dev_fill_forward_path() to obtain egress device
date:   10 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-c006-20220129 (https://download.01.org/0day-ci/arc=
hive/20220131/202201310554.R5dGFZGh-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45e=
e44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D7a27f6ab41356ecba47ec2bec6d635704c169779
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7a27f6ab41356ecba47ec2bec6d635704c169779
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/hwmon/lm63.c:1017:17: warning: Value stored to 'dev' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &client->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/hwmon/lm63.c:1017:17: note: Value stored to 'dev' during its ini=
tialization is never read
           struct device *dev =3D &client->dev;
                          ^~~   ~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   net/openvswitch/actions.c:136:17: warning: Dereference of null pointer (=
loaded from variable 'key') [clang-analyzer-core.NullDereference]
                   da->pkt_key =3D *key;
                                 ^
   net/openvswitch/actions.c:1451:8: note: Assuming 'last' is true
           skb =3D last ? skb : skb_clone(skb, GFP_ATOMIC);
                 ^~~~
   net/openvswitch/actions.c:1451:8: note: '?' condition is true
   net/openvswitch/actions.c:1452:6: note: Assuming 'skb' is non-null
           if (!skb) {
               ^~~~
   net/openvswitch/actions.c:1452:2: note: Taking false branch
           if (!skb) {
           ^
   net/openvswitch/actions.c:1464:10: note: Assuming 'clone_flow_key' is fa=
lse
           clone =3D clone_flow_key ? clone_key(key) : key;
                   ^~~~~~~~~~~~~~
   net/openvswitch/actions.c:1464:10: note: '?' condition is false
   net/openvswitch/actions.c:1465:6: note: Assuming 'clone' is null
           if (clone) {
               ^~~~~
   net/openvswitch/actions.c:1465:2: note: Taking false branch
           if (clone) {
           ^
   net/openvswitch/actions.c:1485:33: note: Passing null pointer value via =
2nd parameter 'key'
           da =3D add_deferred_actions(skb, key, actions, len);
                                          ^~~
   net/openvswitch/actions.c:1485:7: note: Calling 'add_deferred_actions'
           da =3D add_deferred_actions(skb, key, actions, len);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/openvswitch/actions.c:130:9: note: Loop condition is false.  Exiting=
 loop
           fifo =3D this_cpu_ptr(action_fifos);
                  ^
   include/linux/percpu-defs.h:265:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
                                   ^
   include/linux/percpu-defs.h:264:26: note: expanded from macro 'raw_cpu_p=
tr'
   #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
                                   ^
   include/linux/percpu-defs.h:263:47: note: expanded from macro 'per_cpu_p=
tr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); =
})
                                                   ^
   include/linux/percpu-defs.h:259:2: note: expanded from macro 'VERIFY_PER=
CPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   net/openvswitch/actions.c:131:7: note: Calling 'action_fifo_put'
           da =3D action_fifo_put(fifo);
                ^~~~~~~~~~~~~~~~~~~~~
   net/openvswitch/actions.c:115:6: note: Assuming the condition is false
           if (fifo->head >=3D DEFERRED_ACTION_FIFO_SIZE - 1)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/openvswitch/actions.c:115:2: note: Taking false branch
           if (fifo->head >=3D DEFERRED_ACTION_FIFO_SIZE - 1)
           ^
   net/openvswitch/actions.c:118:2: note: Returning pointer, which particip=
ates in a condition later
           return &fifo->fifo[fifo->head++];
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/openvswitch/actions.c:131:7: note: Returning from 'action_fifo_put'
           da =3D action_fifo_put(fifo);
                ^~~~~~~~~~~~~~~~~~~~~
   net/openvswitch/actions.c:132:6: note: 'da' is non-null
           if (da) {
               ^~
   net/openvswitch/actions.c:132:2: note: Taking true branch
           if (da) {
           ^
   net/openvswitch/actions.c:136:17: note: Dereference of null pointer (loa=
ded from variable 'key')
                   da->pkt_key =3D *key;
                                 ^~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
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
--===============5024548225938829027==--

