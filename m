Content-Type: multipart/mixed; boundary="===============7338896964175333507=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/veth.c:58:8: warning: Excessive padding in 'struct veth_rq' (67 padding bytes, where 3 is optimal).
Date: Thu, 10 Feb 2022 05:17:03 +0800
Message-ID: <202202100537.lUTZlC9O-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7338896964175333507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f4bc5bbb5fef3cf421ba3485d6d383c27ec473ed
commit: d3256efd8e8b234a6251e4d4580bd2c3c31fdc4c veth: allow enabling NAPI =
even without XDP
date:   10 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-c006-20220208 (https://download.01.org/0day-ci/arc=
hive/20220210/202202100537.lUTZlC9O-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9=
ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd3256efd8e8b234a6251e4d4580bd2c3c31fdc4c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d3256efd8e8b234a6251e4d4580bd2c3c31fdc4c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/printk.h:139:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/ceph/messenger_v1.c:1224:11: note: Field 'state' is not equal to CEP=
H_CON_S_V1_BANNER
           if (con->state =3D=3D CEPH_CON_S_V1_BANNER) {
                    ^
   net/ceph/messenger_v1.c:1224:2: note: Taking false branch
           if (con->state =3D=3D CEPH_CON_S_V1_BANNER) {
           ^
   net/ceph/messenger_v1.c:1248:11: note: Field 'state' is not equal to CEP=
H_CON_S_V1_CONNECT_MSG
           if (con->state =3D=3D CEPH_CON_S_V1_CONNECT_MSG) {
                    ^
   net/ceph/messenger_v1.c:1248:2: note: Taking false branch
           if (con->state =3D=3D CEPH_CON_S_V1_CONNECT_MSG) {
           ^
   net/ceph/messenger_v1.c:1258:2: note: Taking false branch
           WARN_ON(con->state !=3D CEPH_CON_S_OPEN);
           ^
   include/asm-generic/bug.h:120:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   net/ceph/messenger_v1.c:1260:6: note: Assuming field 'in_base_pos' is >=
=3D 0
           if (con->v1.in_base_pos < 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v1.c:1260:2: note: Taking false branch
           if (con->v1.in_base_pos < 0) {
           ^
   net/ceph/messenger_v1.c:1272:6: note: Assuming field 'in_tag' is not equ=
al to CEPH_MSGR_TAG_READY
           if (con->v1.in_tag =3D=3D CEPH_MSGR_TAG_READY) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v1.c:1272:2: note: Taking false branch
           if (con->v1.in_tag =3D=3D CEPH_MSGR_TAG_READY) {
           ^
   net/ceph/messenger_v1.c:1298:6: note: Assuming field 'in_tag' is not equ=
al to CEPH_MSGR_TAG_MSG
           if (con->v1.in_tag =3D=3D CEPH_MSGR_TAG_MSG) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v1.c:1298:2: note: Taking false branch
           if (con->v1.in_tag =3D=3D CEPH_MSGR_TAG_MSG) {
           ^
   net/ceph/messenger_v1.c:1321:6: note: Assuming field 'in_tag' is not equ=
al to CEPH_MSGR_TAG_ACK
           if (con->v1.in_tag =3D=3D CEPH_MSGR_TAG_ACK ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v1.c:1321:6: note: Left side of '||' is false
   net/ceph/messenger_v1.c:1322:6: note: Assuming field 'in_tag' is not equ=
al to CEPH_MSGR_TAG_SEQ
               con->v1.in_tag =3D=3D CEPH_MSGR_TAG_SEQ) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v1.c:1321:2: note: Taking false branch
           if (con->v1.in_tag =3D=3D CEPH_MSGR_TAG_ACK ||
           ^
   net/ceph/messenger_v1.c:1333:6: note: Assuming field 'in_tag' is equal t=
o CEPH_MSGR_TAG_KEEPALIVE2_ACK
           if (con->v1.in_tag =3D=3D CEPH_MSGR_TAG_KEEPALIVE2_ACK) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v1.c:1333:2: note: Taking true branch
           if (con->v1.in_tag =3D=3D CEPH_MSGR_TAG_KEEPALIVE2_ACK) {
           ^
   net/ceph/messenger_v1.c:1334:9: note: Calling 'read_keepalive_ack'
                   ret =3D read_keepalive_ack(con);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v1.c:1197:12: note: Calling 'read_partial'
           int ret =3D read_partial(con, size, size, &ceph_ts);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v1.c:608:9: note: Assuming 'end' is <=3D field 'in_ba=
se_pos'
           while (con->v1.in_base_pos < end) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v1.c:608:2: note: Loop condition is false. Execution =
continues on line 616
           while (con->v1.in_base_pos < end) {
           ^
   net/ceph/messenger_v1.c:616:2: note: Returning without writing to 'objec=
t->tv_sec'
           return 1;
           ^
   net/ceph/messenger_v1.c:1197:12: note: Returning from 'read_partial'
           int ret =3D read_partial(con, size, size, &ceph_ts);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v1.c:1198:6: note: 'ret' is > 0
           if (ret <=3D 0)
               ^~~
   net/ceph/messenger_v1.c:1198:2: note: Taking false branch
           if (ret <=3D 0)
           ^
   net/ceph/messenger_v1.c:1200:2: note: Calling 'ceph_decode_timespec64'
           ceph_decode_timespec64(&con->last_keepalive_ack, &ceph_ts);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ceph/decode.h:208:13: note: Assigned value is garbage or u=
ndefined
           ts->tv_sec =3D (time64_t)le32_to_cpu(tv->tv_sec);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/net/veth.c:58:8: warning: Excessive padding in 'struct veth_rq' =
(67 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   xdp_rxq, =

   xdp_ring, =

   stats, =

   xdp_napi, =

   napi, =

   dev, =

   xdp_prog, =

   xdp_mem, =

   rx_notify_masked, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct veth_rq {
   ~~~~~~~^~~~~~~~~
   drivers/net/veth.c:58:8: note: Excessive padding in 'struct veth_rq' (67=
 padding bytes, where 3 is optimal). Optimal fields order: xdp_rxq, xdp_rin=
g, stats, xdp_napi, napi, dev, xdp_prog, xdp_mem, rx_notify_masked, conside=
r reordering the fields or adding explicit padding members
   struct veth_rq {
   ~~~~~~~^~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/net/vxlan.c:2300:6: warning: Branch condition evaluates to a gar=
bage value [clang-analyzer-core.uninitialized.Branch]
           if (!md->gbp)
               ^
   drivers/net/vxlan.c:2613:6: note: Assuming 'rdst' is null
           if (rdst) {
               ^~~~
   drivers/net/vxlan.c:2613:2: note: Taking false branch
           if (rdst) {
           ^
   drivers/net/vxlan.c:2649:8: note: 'info' is non-null
                   if (!info) {
                        ^~~~
   drivers/net/vxlan.c:2649:3: note: Taking false branch
                   if (!info) {
                   ^
   drivers/net/vxlan.c:2655:20: note: Field 'sa_family' is equal to AF_INET
                   if (remote_ip.sa.sa_family =3D=3D AF_INET) {
                                    ^
   drivers/net/vxlan.c:2655:3: note: Taking true branch
                   if (remote_ip.sa.sa_family =3D=3D AF_INET) {
                   ^
   drivers/net/vxlan.c:2663:14: note: '?' condition is false
                   dst_port =3D info->key.tp_dst ? : vxlan->cfg.dst_port;
                              ^
   drivers/net/vxlan.c:2667:29: note: '?' condition is true
                   if (info->key.tun_flags & TUNNEL_VXLAN_OPT) {
                                             ^
   include/uapi/linux/if_tunnel.h:176:26: note: expanded from macro 'TUNNEL=
_VXLAN_OPT'
   #define TUNNEL_VXLAN_OPT        __cpu_to_be16(0x1000)
                                   ^
   include/uapi/linux/byteorder/little_endian.h:41:43: note: expanded from =
macro '__cpu_to_be16'
   #define __cpu_to_be16(x) ((__force __be16)__swab16((x)))
                                             ^
   include/uapi/linux/swab.h:105:3: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
            ^
   drivers/net/vxlan.c:2667:7: note: Assuming the condition is false
                   if (info->key.tun_flags & TUNNEL_VXLAN_OPT) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/vxlan.c:2667:3: note: Taking false branch
                   if (info->key.tun_flags & TUNNEL_VXLAN_OPT) {
                   ^
   drivers/net/vxlan.c:2675:38: note: '?' condition is true
                   udp_sum =3D !!(info->key.tun_flags & TUNNEL_CSUM);
                                                      ^
   include/uapi/linux/if_tunnel.h:164:22: note: expanded from macro 'TUNNEL=
_CSUM'
   #define TUNNEL_CSUM             __cpu_to_be16(0x01)
                                   ^
   include/uapi/linux/byteorder/little_endian.h:41:43: note: expanded from =
macro '__cpu_to_be16'
   #define __cpu_to_be16(x) ((__force __be16)__swab16((x)))
                                             ^
   include/uapi/linux/swab.h:105:3: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
            ^
   drivers/net/vxlan.c:2675:14: note: Assuming the condition is false
                   udp_sum =3D !!(info->key.tun_flags & TUNNEL_CSUM);
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/vxlan.c:2681:14: note: Field 'sa_family' is equal to AF_INET
           if (dst->sa.sa_family =3D=3D AF_INET) {
                       ^
   drivers/net/vxlan.c:2681:2: note: Taking true branch
           if (dst->sa.sa_family =3D=3D AF_INET) {
           ^
   drivers/net/vxlan.c:2682:30: note: Left side of '||' is false
                   struct vxlan_sock *sock4 =3D rcu_dereference(vxlan->vn4_=
sock);
                                              ^
   include/linux/rcupdate.h:571:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:513:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:374:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^

vim +58 drivers/net/veth.c

4195e54aaf1c8d Toshiaki Makita 2018-10-11  57  =

638264dc90227c Toshiaki Makita 2018-08-03 @58  struct veth_rq {
948d4f214fde43 Toshiaki Makita 2018-08-03  59  	struct napi_struct	xdp_napi;
d3256efd8e8b23 Paolo Abeni     2021-04-09  60  	struct napi_struct __rcu *n=
api; /* points to xdp_napi when the latter is initialized */
948d4f214fde43 Toshiaki Makita 2018-08-03  61  	struct net_device	*dev;
948d4f214fde43 Toshiaki Makita 2018-08-03  62  	struct bpf_prog __rcu	*xdp_=
prog;
d1396004dd8686 Toshiaki Makita 2018-08-03  63  	struct xdp_mem_info	xdp_mem;
4195e54aaf1c8d Toshiaki Makita 2018-10-11  64  	struct veth_rq_stats	stats;
948d4f214fde43 Toshiaki Makita 2018-08-03  65  	bool			rx_notify_masked;
948d4f214fde43 Toshiaki Makita 2018-08-03  66  	struct ptr_ring		xdp_ring;
948d4f214fde43 Toshiaki Makita 2018-08-03  67  	struct xdp_rxq_info	xdp_rxq;
e314dbdc1c0dc6 Pavel Emelyanov 2007-09-25  68  };
e314dbdc1c0dc6 Pavel Emelyanov 2007-09-25  69  =


:::::: The code at line 58 was first introduced by commit
:::::: 638264dc90227cca00d20c26680171addce18e51 veth: Support per queue XDP=
 ring

:::::: TO: Toshiaki Makita <makita.toshiaki@lab.ntt.co.jp>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7338896964175333507==--

