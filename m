Content-Type: multipart/mixed; boundary="===============4714363494854822973=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/3] net:ipv6:Add ndisc_bond_send_na to support sending na by slave directly
Date: Sun, 13 Mar 2022 01:52:42 +0800
Message-ID: <202203130159.VLYBoOIo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4714363494854822973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220311024958.7458-2-sunshouxin@chinatelecom.cn>
References: <20220311024958.7458-2-sunshouxin@chinatelecom.cn>
TO: Sun Shouxin <sunshouxin@chinatelecom.cn>
TO: j.vosburgh(a)gmail.com
TO: vfalico(a)gmail.com
TO: andy(a)greyhouse.net
TO: davem(a)davemloft.net
TO: kuba(a)kernel.org
TO: yoshfuji(a)linux-ipv6.org
TO: dsahern(a)kernel.org
CC: netdev(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: huyd12(a)chinatelecom.cn
CC: sunshouxin(a)chinatelecom.cn

Hi Sun,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 2a9eef868a997ec575c2e6ae885e91313f635d59]

url:    https://github.com/0day-ci/linux/commits/Sun-Shouxin/net-bonding-Ad=
d-support-for-IPV6-RLB-to-balance-alb-mode/20220311-110221
base:   2a9eef868a997ec575c2e6ae885e91313f635d59
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20313/202203130159.VLYBoOIo-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/9bd4966a283f758f100bd97d0=
9967edc92903c76
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sun-Shouxin/net-bonding-Add-suppor=
t-for-IPV6-RLB-to-balance-alb-mode/20220311-110221
        git checkout 9bd4966a283f758f100bd97d09967edc92903c76
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   net/wireless/reg.c:1544:14: note: Assuming 'x' is < field 'n_reg_rules'
           for (x =3D 0; x < rd1->n_reg_rules; x++) {
                       ^~~~~~~~~~~~~~~~~~~~
   net/wireless/reg.c:1544:2: note: Loop condition is true.  Entering loop =
body
           for (x =3D 0; x < rd1->n_reg_rules; x++) {
           ^
   net/wireless/reg.c:1546:15: note: Assuming 'y' is < field 'n_reg_rules'
                   for (y =3D 0; y < rd2->n_reg_rules; y++) {
                               ^~~~~~~~~~~~~~~~~~~~
   net/wireless/reg.c:1546:3: note: Loop condition is true.  Entering loop =
body
                   for (y =3D 0; y < rd2->n_reg_rules; y++) {
                   ^
   net/wireless/reg.c:1548:8: note: Assuming the condition is true
                           if (!reg_rules_intersect(rd1, rd2, rule1, rule2,
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/reg.c:1548:4: note: Taking true branch
                           if (!reg_rules_intersect(rd1, rd2, rule1, rule2,
                           ^
   net/wireless/reg.c:1546:15: note: Assuming 'y' is >=3D field 'n_reg_rule=
s'
                   for (y =3D 0; y < rd2->n_reg_rules; y++) {
                               ^~~~~~~~~~~~~~~~~~~~
   net/wireless/reg.c:1546:3: note: Loop condition is false. Execution cont=
inues on line 1544
                   for (y =3D 0; y < rd2->n_reg_rules; y++) {
                   ^
   net/wireless/reg.c:1544:14: note: Assuming 'x' is >=3D field 'n_reg_rule=
s'
           for (x =3D 0; x < rd1->n_reg_rules; x++) {
                       ^~~~~~~~~~~~~~~~~~~~
   net/wireless/reg.c:1544:2: note: Loop condition is false. Execution cont=
inues on line 1554
           for (x =3D 0; x < rd1->n_reg_rules; x++) {
           ^
   net/wireless/reg.c:1554:7: note: 'num_rules' is 1
           if (!num_rules)
                ^~~~~~~~~
   net/wireless/reg.c:1554:2: note: Taking false branch
           if (!num_rules)
           ^
   net/wireless/reg.c:1557:7: note: Calling 'kzalloc'
           rd =3D kzalloc(struct_size(rd, reg_rules, num_rules), GFP_KERNEL=
);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:714:9: note: Memory is allocated
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/reg.c:1557:7: note: Returned allocated memory
           rd =3D kzalloc(struct_size(rd, reg_rules, num_rules), GFP_KERNEL=
);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/reg.c:1558:6: note: Assuming 'rd' is non-null
           if (!rd)
               ^~~
   net/wireless/reg.c:1558:2: note: Taking false branch
           if (!rd)
           ^
   net/wireless/reg.c:1561:2: note: Loop condition is true.  Entering loop =
body
           for (x =3D 0; x < rd1->n_reg_rules; x++) {
           ^
   net/wireless/reg.c:1563:3: note: Loop condition is true.  Entering loop =
body
                   for (y =3D 0; y < rd2->n_reg_rules; y++) {
                   ^
   net/wireless/reg.c:1571:8: note: Assuming 'r' is not equal to 0
                           if (r)
                               ^
   net/wireless/reg.c:1571:4: note: Taking true branch
                           if (r)
                           ^
   net/wireless/reg.c:1572:5: note:  Execution continues on line 1563
                                   continue;
                                   ^
   net/wireless/reg.c:1563:3: note: Loop condition is false. Execution cont=
inues on line 1561
                   for (y =3D 0; y < rd2->n_reg_rules; y++) {
                   ^
   net/wireless/reg.c:1561:2: note: Loop condition is false. Execution cont=
inues on line 1579
           for (x =3D 0; x < rd1->n_reg_rules; x++) {
           ^
   net/wireless/reg.c:3813:19: note: Returned allocated memory
           intersected_rd =3D regdom_intersect(rd, get_cfg80211_regdom());
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/reg.c:3814:7: note: 'intersected_rd' is non-null
           if (!intersected_rd)
                ^~~~~~~~~~~~~~
   net/wireless/reg.c:3814:2: note: Taking false branch
           if (!intersected_rd)
           ^
   net/wireless/reg.c:3821:2: note: Potential leak of memory pointed to by =
'intersected_rd'
           return 0;
           ^
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   net/ipv6/ip6_fib.c:1403:2: warning: Value stored to 'pn' is never read [=
clang-analyzer-deadcode.DeadStores]
           pn =3D fn;
           ^    ~~
   net/ipv6/ip6_fib.c:1403:2: note: Value stored to 'pn' is never read
           pn =3D fn;
           ^    ~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> net/ipv6/ndisc.c:632:2: warning: Value stored to 'ret' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           ret =3D dev_queue_xmit(skb);
           ^     ~~~~~~~~~~~~~~~~~~~
   net/ipv6/ndisc.c:632:2: note: Value stored to 'ret' is never read
           ret =3D dev_queue_xmit(skb);
           ^     ~~~~~~~~~~~~~~~~~~~
   net/ipv6/ndisc.c:814:14: warning: Although the value stored to 'probes' =
is used in the enclosing expression, the value is never actually read from =
'probes' [clang-analyzer-deadcode.DeadStores]
           } else if ((probes -=3D NEIGH_VAR(neigh->parms, APP_PROBES)) < 0=
) {
                       ^
   net/ipv6/ndisc.c:814:14: note: Although the value stored to 'probes' is =
used in the enclosing expression, the value is never actually read from 'pr=
obes'
   net/ipv6/ndisc.c:918:10: warning: Value stored to 'np' during its initia=
lization is never read [clang-analyzer-deadcode.DeadStores]
                                           u8 *np =3D (u8 *)&nonce;
                                               ^~   ~~~~~~~~~~~~
   net/ipv6/ndisc.c:918:10: note: Value stored to 'np' during its initializ=
ation is never read
                                           u8 *np =3D (u8 *)&nonce;
                                               ^~   ~~~~~~~~~~~~
   net/ipv6/ndisc.c:1935:3: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(warncomm, current->comm);
                   ^~~~~~
   net/ipv6/ndisc.c:1935:3: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                   strcpy(warncomm, current->comm);
                   ^~~~~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   include/linux/skbuff.h:2755:9: warning: Access to field 'head' results i=
n a dereference of a null pointer (loaded from variable 'skb') [clang-analy=
zer-core.NullDereference]
           return skb->head + skb->transport_header;
                  ^
   net/ipv6/raw.c:770:2: note: Taking false branch
           DECLARE_SOCKADDR(struct sockaddr_in6 *, sin6, msg->msg_name);
           ^
   include/linux/net.h:206:16: note: expanded from macro 'DECLARE_SOCKADDR'
           type dst =3D ({ __sockaddr_check_size(sizeof(*dst)); (type) src;=
 })
                         ^
   include/linux/socket.h:19:2: note: expanded from macro '__sockaddr_check=
_size'
           BUILD_BUG_ON(((size) > sizeof(struct __kernel_sockaddr_storage)))
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:349:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:337:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:329:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/ipv6/raw.c:770:2: note: Loop condition is false.  Exiting loop
           DECLARE_SOCKADDR(struct sockaddr_in6 *, sin6, msg->msg_name);
           ^
   include/linux/net.h:206:16: note: expanded from macro 'DECLARE_SOCKADDR'
           type dst =3D ({ __sockaddr_check_size(sizeof(*dst)); (type) src;=
 })
                         ^
   include/linux/socket.h:19:2: note: expanded from macro '__sockaddr_check=
_size'
           BUILD_BUG_ON(((size) > sizeof(struct __kernel_sockaddr_storage)))
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:349:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:337:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:321:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/ipv6/raw.c:789:6: note: Assuming the condition is false
           if (len > INT_MAX)
               ^~~~~~~~~~~~~
   net/ipv6/raw.c:789:2: note: Taking false branch
           if (len > INT_MAX)
           ^
   net/ipv6/raw.c:793:6: note: Assuming the condition is false
           if (msg->msg_flags & MSG_OOB)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/raw.c:793:2: note: Taking false branch
           if (msg->msg_flags & MSG_OOB)
           ^
   net/ipv6/raw.c:801:12: note: Left side of '||' is false
           hdrincl =3D READ_ONCE(hdrincl);
                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:316:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \

vim +/ret +632 net/ipv6/ndisc.c

e1ec7842df5db8 YOSHIFUJI Hideaki 2007-04-24  574  =

9bd4966a283f75 Sun Shouxin       2022-03-10  575  void ndisc_bond_send_na(s=
truct net_device *dev, const struct in6_addr *daddr,
9bd4966a283f75 Sun Shouxin       2022-03-10  576  			const struct in6_addr =
*solicited_addr,
9bd4966a283f75 Sun Shouxin       2022-03-10  577  			bool router, bool soli=
cited, bool override,
9bd4966a283f75 Sun Shouxin       2022-03-10  578  			bool inc_opt, unsigned=
 short vlan_id,
9bd4966a283f75 Sun Shouxin       2022-03-10  579  			const void *mac_dst, c=
onst void *mac_src)
9bd4966a283f75 Sun Shouxin       2022-03-10  580  {
9bd4966a283f75 Sun Shouxin       2022-03-10  581  	struct sk_buff *skb;
9bd4966a283f75 Sun Shouxin       2022-03-10  582  	const struct in6_addr *s=
rc_addr;
9bd4966a283f75 Sun Shouxin       2022-03-10  583  	struct nd_msg *msg;
9bd4966a283f75 Sun Shouxin       2022-03-10  584  	struct net *net =3D dev_=
net(dev);
9bd4966a283f75 Sun Shouxin       2022-03-10  585  	struct sock *sk =3D net-=
>ipv6.ndisc_sk;
9bd4966a283f75 Sun Shouxin       2022-03-10  586  	int optlen =3D 0;
9bd4966a283f75 Sun Shouxin       2022-03-10  587  	int ret;
9bd4966a283f75 Sun Shouxin       2022-03-10  588  =

9bd4966a283f75 Sun Shouxin       2022-03-10  589  	src_addr =3D solicited_a=
ddr;
9bd4966a283f75 Sun Shouxin       2022-03-10  590  	if (!dev->addr_len)
9bd4966a283f75 Sun Shouxin       2022-03-10  591  		inc_opt =3D false;
9bd4966a283f75 Sun Shouxin       2022-03-10  592  	if (inc_opt)
9bd4966a283f75 Sun Shouxin       2022-03-10  593  		optlen +=3D ndisc_opt_a=
ddr_space(dev,
9bd4966a283f75 Sun Shouxin       2022-03-10  594  					       NDISC_NEIGHBO=
UR_ADVERTISEMENT);
9bd4966a283f75 Sun Shouxin       2022-03-10  595  =

9bd4966a283f75 Sun Shouxin       2022-03-10  596  	skb =3D ndisc_alloc_skb(=
dev, sizeof(*msg) + optlen);
9bd4966a283f75 Sun Shouxin       2022-03-10  597  	if (!skb)
9bd4966a283f75 Sun Shouxin       2022-03-10  598  		return;
9bd4966a283f75 Sun Shouxin       2022-03-10  599  =

9bd4966a283f75 Sun Shouxin       2022-03-10  600  	msg =3D skb_put(skb, siz=
eof(*msg));
9bd4966a283f75 Sun Shouxin       2022-03-10  601  	*msg =3D (struct nd_msg)=
 {
9bd4966a283f75 Sun Shouxin       2022-03-10  602  		.icmph =3D {
9bd4966a283f75 Sun Shouxin       2022-03-10  603  			.icmp6_type =3D NDISC_=
NEIGHBOUR_ADVERTISEMENT,
9bd4966a283f75 Sun Shouxin       2022-03-10  604  			.icmp6_router =3D rout=
er,
9bd4966a283f75 Sun Shouxin       2022-03-10  605  			.icmp6_solicited =3D s=
olicited,
9bd4966a283f75 Sun Shouxin       2022-03-10  606  			.icmp6_override =3D ov=
erride,
9bd4966a283f75 Sun Shouxin       2022-03-10  607  		},
9bd4966a283f75 Sun Shouxin       2022-03-10  608  		.target =3D *solicited_=
addr,
9bd4966a283f75 Sun Shouxin       2022-03-10  609  	};
9bd4966a283f75 Sun Shouxin       2022-03-10  610  =

9bd4966a283f75 Sun Shouxin       2022-03-10  611  	if (inc_opt)
9bd4966a283f75 Sun Shouxin       2022-03-10  612  		ndisc_fill_addr_option(=
skb, ND_OPT_TARGET_LL_ADDR,
9bd4966a283f75 Sun Shouxin       2022-03-10  613  				       dev->dev_addr,
9bd4966a283f75 Sun Shouxin       2022-03-10  614  				       NDISC_NEIGHBOU=
R_ADVERTISEMENT);
9bd4966a283f75 Sun Shouxin       2022-03-10  615  =

9bd4966a283f75 Sun Shouxin       2022-03-10  616  	if (vlan_id)
9bd4966a283f75 Sun Shouxin       2022-03-10  617  		__vlan_hwaccel_put_tag(=
skb, htons(ETH_P_8021Q),
9bd4966a283f75 Sun Shouxin       2022-03-10  618  				       vlan_id);
9bd4966a283f75 Sun Shouxin       2022-03-10  619  =

9bd4966a283f75 Sun Shouxin       2022-03-10  620  	msg->icmph.icmp6_cksum =
=3D csum_ipv6_magic(src_addr, daddr, skb->len,
9bd4966a283f75 Sun Shouxin       2022-03-10  621  						 IPPROTO_ICMPV6,
9bd4966a283f75 Sun Shouxin       2022-03-10  622  						 csum_partial(&msg-=
>icmph,
9bd4966a283f75 Sun Shouxin       2022-03-10  623  							      skb->len, 0)=
);
9bd4966a283f75 Sun Shouxin       2022-03-10  624  =

9bd4966a283f75 Sun Shouxin       2022-03-10  625  	ip6_nd_hdr(skb, src_addr=
, daddr, inet6_sk(sk)->hop_limit, skb->len);
9bd4966a283f75 Sun Shouxin       2022-03-10  626  =

9bd4966a283f75 Sun Shouxin       2022-03-10  627  	skb->protocol =3D htons(=
ETH_P_IPV6);
9bd4966a283f75 Sun Shouxin       2022-03-10  628  	skb->dev =3D dev;
9bd4966a283f75 Sun Shouxin       2022-03-10  629  	if (dev_hard_header(skb,=
 dev, ETH_P_IPV6, mac_dst, mac_src, skb->len) < 0)
9bd4966a283f75 Sun Shouxin       2022-03-10  630  		return;
9bd4966a283f75 Sun Shouxin       2022-03-10  631  =

9bd4966a283f75 Sun Shouxin       2022-03-10 @632  	ret =3D dev_queue_xmit(s=
kb);
9bd4966a283f75 Sun Shouxin       2022-03-10  633  }
9bd4966a283f75 Sun Shouxin       2022-03-10  634  EXPORT_SYMBOL(ndisc_bond_=
send_na);
9bd4966a283f75 Sun Shouxin       2022-03-10  635  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============4714363494854822973==--

