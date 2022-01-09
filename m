Content-Type: multipart/mixed; boundary="===============5392651063393829248=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/vxlan.c:3487:16: warning: Access to field 'sk' results in a dereference of an undefined pointer value (loaded from variable 'sock') [clang-analyzer-core.NullDereference]
Date: Sun, 09 Jan 2022 14:10:09 +0800
Message-ID: <202201091423.EyhtrXR9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5392651063393829248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Paolo Abeni <pabeni@redhat.com>
CC: Willem de Bruijn <willemb@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4634129ad9fdc89d10b597fc6f8f4336fb61e105
commit: d18931a92a0b5feddd8a39d097b90ae2867db02f vxlan: allow L4 GRO passth=
rough
date:   9 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20220107 (https://download.01.org/0day-ci/archi=
ve/20220109/202201091423.EyhtrXR9-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167b=
fe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd18931a92a0b5feddd8a39d097b90ae2867db02f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d18931a92a0b5feddd8a39d097b90ae2867db02f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/rcupdate.h:513:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:375:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:345:32: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   drivers/net/vxlan.c:2686:8: note: 'ifindex' is 0
                   if (!ifindex)
                        ^~~~~~~
   drivers/net/vxlan.c:2686:3: note: Taking true branch
                   if (!ifindex)
                   ^
   drivers/net/vxlan.c:2694:3: note: Taking false branch
                   if (IS_ERR(rt)) {
                   ^
   drivers/net/vxlan.c:2699:8: note: 'info' is non-null
                   if (!info) {
                        ^~~~
   drivers/net/vxlan.c:2699:3: note: Taking false branch
                   if (!info) {
                   ^
   drivers/net/vxlan.c:2717:14: note: Assuming the condition is false
                   } else if (info->key.tun_flags & TUNNEL_DONT_FRAGMENT) {
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/vxlan.c:2717:10: note: Taking false branch
                   } else if (info->key.tun_flags & TUNNEL_DONT_FRAGMENT) {
                          ^
   drivers/net/vxlan.c:2724:7: note: Assuming 'err' is >=3D 0
                   if (err < 0) {
                       ^~~~~~~
   drivers/net/vxlan.c:2724:3: note: Taking false branch
                   if (err < 0) {
                   ^
   drivers/net/vxlan.c:2726:14: note: Assuming 'err' is 0
                   } else if (err) {
                              ^~~
   drivers/net/vxlan.c:2726:10: note: Taking false branch
                   } else if (err) {
                          ^
   drivers/net/vxlan.c:2741:9: note: '?' condition is true
                   ttl =3D ttl ? : ip4_dst_hoplimit(&rt->dst);
                         ^
   drivers/net/vxlan.c:2742:9: note: Calling 'vxlan_build_skb'
                   err =3D vxlan_build_skb(skb, ndst, sizeof(struct iphdr),
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/vxlan.c:2335:13: note: 'udp_sum' is true
           int type =3D udp_sum ? SKB_GSO_UDP_TUNNEL_CSUM : SKB_GSO_UDP_TUN=
NEL;
                      ^~~~~~~
   drivers/net/vxlan.c:2335:13: note: '?' condition is true
   drivers/net/vxlan.c:2338:7: note: Assuming the condition is false
           if ((vxflags & VXLAN_F_REMCSUM_TX) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/vxlan.c:2338:37: note: Left side of '&&' is false
           if ((vxflags & VXLAN_F_REMCSUM_TX) &&
                                              ^
   drivers/net/vxlan.c:2354:6: note: Assuming 'err' is 0
           if (unlikely(err))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/net/vxlan.c:2354:2: note: Taking false branch
           if (unlikely(err))
           ^
   drivers/net/vxlan.c:2358:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   drivers/net/vxlan.c:2358:2: note: Taking false branch
           if (err)
           ^
   drivers/net/vxlan.c:2365:2: note: Taking false branch
           if (type & SKB_GSO_TUNNEL_REMCSUM) {
           ^
   drivers/net/vxlan.c:2378:6: note: Assuming the condition is true
           if (vxflags & VXLAN_F_GBP)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/vxlan.c:2378:2: note: Taking true branch
           if (vxflags & VXLAN_F_GBP)
           ^
   drivers/net/vxlan.c:2379:3: note: Calling 'vxlan_build_gbp_hdr'
                   vxlan_build_gbp_hdr(vxh, vxflags, md);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/vxlan.c:2300:6: note: Branch condition evaluates to a garbag=
e value
           if (!md->gbp)
               ^~~~~~~~
   drivers/net/vxlan.c:2647:3: warning: Value stored to 'label' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                   label =3D vxlan->cfg.label;
                   ^       ~~~~~~~~~~~~~~~~
   drivers/net/vxlan.c:2647:3: note: Value stored to 'label' is never read
                   label =3D vxlan->cfg.label;
                   ^       ~~~~~~~~~~~~~~~~
   drivers/net/vxlan.c:2674:3: warning: Value stored to 'label' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                   label =3D info->key.label;
                   ^       ~~~~~~~~~~~~~~~
   drivers/net/vxlan.c:2674:3: note: Value stored to 'label' is never read
                   label =3D info->key.label;
                   ^       ~~~~~~~~~~~~~~~
>> drivers/net/vxlan.c:3487:16: warning: Access to field 'sk' results in a =
dereference of an undefined pointer value (loaded from variable 'sock') [cl=
ang-analyzer-core.NullDereference]
           udp_allow_gso(sock->sk);
                         ^~~~
   drivers/net/vxlan.c:3464:2: note: 'sock' declared without an initial val=
ue
           struct socket *sock;
           ^~~~~~~~~~~~~~~~~~~
   drivers/net/vxlan.c:3470:6: note: Assuming 'ipv6' is true
           if (ipv6) {
               ^~~~
   drivers/net/vxlan.c:3470:2: note: Taking true branch
           if (ipv6) {
           ^
   drivers/net/vxlan.c:3473:7: note: Assuming the condition is false
                       !(flags & VXLAN_F_UDP_ZERO_CSUM6_RX);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/vxlan.c:3483:8: note: Calling 'udp_sock_create'
           err =3D udp_sock_create(net, &udp_conf, &sock);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/udp_tunnel.h:58:11: note: Field 'family' is not equal to AF_=
INET
           if (cfg->family =3D=3D AF_INET)
                    ^
   include/net/udp_tunnel.h:58:2: note: Taking false branch
           if (cfg->family =3D=3D AF_INET)
           ^
   include/net/udp_tunnel.h:61:11: note: Field 'family' is equal to AF_INET6
           if (cfg->family =3D=3D AF_INET6)
                    ^
   include/net/udp_tunnel.h:61:2: note: Taking true branch
           if (cfg->family =3D=3D AF_INET6)
           ^
   include/net/udp_tunnel.h:62:10: note: Calling 'udp_sock_create6'
                   return udp_sock_create6(net, cfg, sockp);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/udp_tunnel.h:50:2: note: Returning without writing to '*sock=
p'
           return 0;
           ^
   include/net/udp_tunnel.h:62:10: note: Returning from 'udp_sock_create6'
                   return udp_sock_create6(net, cfg, sockp);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/udp_tunnel.h:62:3: note: Returning without writing to '*sock=
p'
                   return udp_sock_create6(net, cfg, sockp);
                   ^
   drivers/net/vxlan.c:3483:8: note: Returning from 'udp_sock_create'
           err =3D udp_sock_create(net, &udp_conf, &sock);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/vxlan.c:3484:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   drivers/net/vxlan.c:3484:2: note: Taking false branch
           if (err < 0)
           ^
   drivers/net/vxlan.c:3487:16: note: Access to field 'sk' results in a der=
eference of an undefined pointer value (loaded from variable 'sock')
           udp_allow_gso(sock->sk);
                         ^~~~
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/nvme/target/fcloop.c:1226:3: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -EINVAL;
                   ^     ~~~~~~~
   drivers/nvme/target/fcloop.c:1226:3: note: Value stored to 'ret' is neve=
r read
                   ret =3D -EINVAL;
                   ^     ~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/nvme/target/tcp.c:630:2: warning: Attempt to free released memor=
y [clang-analyzer-unix.Malloc]
           kfree(cmd->iov);
           ^
   drivers/nvme/target/tcp.c:1222:3: note: Left side of '&&' is false
                   container_of(w, struct nvmet_tcp_queue, io_work);
                   ^
   include/linux/kernel.h:709:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/nvme/target/tcp.c:1222:3: note: Taking false branch
                   container_of(w, struct nvmet_tcp_queue, io_work);
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
   drivers/nvme/target/tcp.c:1222:3: note: Loop condition is false.  Exitin=
g loop
                   container_of(w, struct nvmet_tcp_queue, io_work);
                   ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^

vim +3487 drivers/net/vxlan.c

1b13c97fae9c61 Yan Burman        2013-01-29  3460  =

3ee64f39bebe1a Tom Herbert       2014-07-13  3461  static struct socket *vx=
lan_create_sock(struct net *net, bool ipv6,
aab8cc3630e325 Alexis Bauvin     2018-12-03  3462  					__be16 port, u32 fl=
ags, int ifindex)
e4c7ed415387cf Cong Wang         2013-08-31  3463  {
e4c7ed415387cf Cong Wang         2013-08-31  3464  	struct socket *sock;
3ee64f39bebe1a Tom Herbert       2014-07-13  3465  	struct udp_port_cfg udp=
_conf;
3ee64f39bebe1a Tom Herbert       2014-07-13  3466  	int err;
e4c7ed415387cf Cong Wang         2013-08-31  3467  =

3ee64f39bebe1a Tom Herbert       2014-07-13  3468  	memset(&udp_conf, 0, si=
zeof(udp_conf));
e4c7ed415387cf Cong Wang         2013-08-31  3469  =

3ee64f39bebe1a Tom Herbert       2014-07-13  3470  	if (ipv6) {
3ee64f39bebe1a Tom Herbert       2014-07-13  3471  		udp_conf.family =3D AF=
_INET6;
3ee64f39bebe1a Tom Herbert       2014-07-13  3472  		udp_conf.use_udp6_rx_c=
hecksums =3D
3dc2b6a8d38cf6 Alexander Duyck   2014-11-24  3473  		    !(flags & VXLAN_F_=
UDP_ZERO_CSUM6_RX);
a43a9ef6a2e510 Jiri Benc         2015-08-28  3474  		udp_conf.ipv6_v6only =
=3D 1;
3ee64f39bebe1a Tom Herbert       2014-07-13  3475  	} else {
3ee64f39bebe1a Tom Herbert       2014-07-13  3476  		udp_conf.family =3D AF=
_INET;
553675fb5e9ce3 stephen hemminger 2013-05-16  3477  	}
553675fb5e9ce3 stephen hemminger 2013-05-16  3478  =

3ee64f39bebe1a Tom Herbert       2014-07-13  3479  	udp_conf.local_udp_port=
 =3D port;
aab8cc3630e325 Alexis Bauvin     2018-12-03  3480  	udp_conf.bind_ifindex =
=3D ifindex;
553675fb5e9ce3 stephen hemminger 2013-05-16  3481  =

3ee64f39bebe1a Tom Herbert       2014-07-13  3482  	/* Open UDP socket */
3ee64f39bebe1a Tom Herbert       2014-07-13  3483  	err =3D udp_sock_create=
(net, &udp_conf, &sock);
3ee64f39bebe1a Tom Herbert       2014-07-13  3484  	if (err < 0)
3ee64f39bebe1a Tom Herbert       2014-07-13  3485  		return ERR_PTR(err);
e4c7ed415387cf Cong Wang         2013-08-31  3486  =

d18931a92a0b5f Paolo Abeni       2021-03-30 @3487  	udp_allow_gso(sock->sk);
39deb2c7db420b Zhi Yong Wu       2013-10-28  3488  	return sock;
e4c7ed415387cf Cong Wang         2013-08-31  3489  }
e4c7ed415387cf Cong Wang         2013-08-31  3490  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5392651063393829248==--

