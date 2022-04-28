Content-Type: multipart/mixed; boundary="===============5354403425649191990=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/smc/smc_sysctl.c:47:3: warning: Argument to kfree() is the address of the global variable 'smc_table', which is not memory allocated by malloc() [clang-analyzer-unix.Malloc]
Date: Fri, 29 Apr 2022 06:43:47 +0800
Message-ID: <202204290637.j7kbHNbK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5354403425649191990==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dust Li <dust.li@linux.alibaba.com>
CC: Tony Lu <tonylu@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   249aca0d3d631660aa3583c6a3559b75b6e971b4
commit: 462791bbfa350189e309a5a94541f6b63cd874e8 net/smc: add sysctl interf=
ace for SMC
date:   8 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-c006-20220428 (https://download.01.org/0day-ci/arc=
hive/20220429/202204290637.j7kbHNbK-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c59473=
aacce38cd7dd77eebceaf3c98c5707ab3b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D462791bbfa350189e309a5a94541f6b63cd874e8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 462791bbfa350189e309a5a94541f6b63cd874e8
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   net/vmw_vsock/virtio_transport_common.c:437:20: note: '?' condition is t=
rue
                           bytes_to_copy =3D min(user_buf_len, pkt_len);
                                           ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   net/vmw_vsock/virtio_transport_common.c:439:8: note: Assuming 'bytes_to_=
copy' is not equal to 0
                           if (bytes_to_copy) {
                               ^~~~~~~~~~~~~
   net/vmw_vsock/virtio_transport_common.c:439:4: note: Taking true branch
                           if (bytes_to_copy) {
                           ^
   net/vmw_vsock/virtio_transport_common.c:448:9: note: 'err' is -14
                                   if (err) {
                                       ^~~
   net/vmw_vsock/virtio_transport_common.c:448:5: note: Taking true branch
                                   if (err) {
                                   ^
   net/vmw_vsock/virtio_transport_common.c:460:8: note: 'dequeued_len' is <=
 0
                           if (dequeued_len >=3D 0)
                               ^~~~~~~~~~~~
   net/vmw_vsock/virtio_transport_common.c:460:4: note: Taking false branch
                           if (dequeued_len >=3D 0)
                           ^
   net/vmw_vsock/virtio_transport_common.c:464:7: note: Assuming the condit=
ion is false
                   if (le32_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_SEQ_EOM) {
                       ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:35:26: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                            ^
   net/vmw_vsock/virtio_transport_common.c:464:3: note: Taking false branch
                   if (le32_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_SEQ_EOM) {
                   ^
   net/vmw_vsock/virtio_transport_common.c:429:2: note: Loop condition is t=
rue.  Entering loop body
           while (!msg_ready) {
           ^
   net/vmw_vsock/virtio_transport_common.c:432:7: note: 'dequeued_len' is <=
 0
                   if (dequeued_len >=3D 0) {
                       ^~~~~~~~~~~~
   net/vmw_vsock/virtio_transport_common.c:432:3: note: Taking false branch
                   if (dequeued_len >=3D 0) {
                   ^
   net/vmw_vsock/virtio_transport_common.c:464:7: note: Assuming the condit=
ion is false
                   if (le32_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_SEQ_EOM) {
                       ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:35:26: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                            ^
   net/vmw_vsock/virtio_transport_common.c:464:3: note: Taking false branch
                   if (le32_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_SEQ_EOM) {
                   ^
   net/vmw_vsock/virtio_transport_common.c:474:3: note: Calling 'virtio_tra=
nsport_free_pkt'
                   virtio_transport_free_pkt(pkt);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/vmw_vsock/virtio_transport_common.c:1346:2: note: Memory is released
           kfree(pkt);
           ^~~~~~~~~~
   net/vmw_vsock/virtio_transport_common.c:474:3: note: Returning; memory w=
as released
                   virtio_transport_free_pkt(pkt);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/vmw_vsock/virtio_transport_common.c:429:2: note: Loop condition is t=
rue.  Entering loop body
           while (!msg_ready) {
           ^
   net/vmw_vsock/virtio_transport_common.c:432:7: note: 'dequeued_len' is <=
 0
                   if (dequeued_len >=3D 0) {
                       ^~~~~~~~~~~~
   net/vmw_vsock/virtio_transport_common.c:432:3: note: Taking false branch
                   if (dequeued_len >=3D 0) {
                   ^
   net/vmw_vsock/virtio_transport_common.c:464:7: note: Use of memory after=
 it is freed
                   if (le32_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_SEQ_EOM) {
                       ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:35:50: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                    ^~~
   Suppressed 21 warnings (14 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
>> net/smc/smc_sysctl.c:47:3: warning: Argument to kfree() is the address o=
f the global variable 'smc_table', which is not memory allocated by malloc(=
) [clang-analyzer-unix.Malloc]
                   kfree(table);
                   ^     ~~~~~
   net/smc/smc_sysctl.c:28:6: note: Assuming the condition is false
           if (!net_eq(net, &init_net)) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/smc/smc_sysctl.c:28:2: note: Taking false branch
           if (!net_eq(net, &init_net)) {
           ^
   net/smc/smc_sysctl.c:40:6: note: Assuming field 'smc_hdr' is null
           if (!net->smc.smc_hdr)
               ^~~~~~~~~~~~~~~~~
   net/smc/smc_sysctl.c:40:2: note: Taking true branch
           if (!net->smc.smc_hdr)
           ^
   net/smc/smc_sysctl.c:41:3: note: Control jumps to line 46
                   goto err_reg;
                   ^
   net/smc/smc_sysctl.c:46:6: note: Assuming the condition is true
           if (!net_eq(net, &init_net))
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/smc/smc_sysctl.c:46:2: note: Taking true branch
           if (!net_eq(net, &init_net))
           ^
   net/smc/smc_sysctl.c:47:3: note: Argument to kfree() is the address of t=
he global variable 'smc_table', which is not memory allocated by malloc()
                   kfree(table);
                   ^     ~~~~~
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   net/smc/smc_diag.c:176:17: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
                   dinfo.token =3D conn->rmb_desc->token;
                                 ^
   net/smc/smc_diag.c:229:7: note: Calling 'smc_diag_dump_proto'
           rc =3D smc_diag_dump_proto(&smc_proto, skb, cb, SMCPROTO_SMC);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/smc/smc_diag.c:204:2: note: Taking false branch
           if (hlist_empty(head))
           ^
   net/smc/smc_diag.c:207:2: note: '____ptr' is non-null
           sk_for_each(sk, head) {
           ^
   include/net/sock.h:826:2: note: expanded from macro 'sk_for_each'
           hlist_for_each_entry(__sk, list, sk_node)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:1003:13: note: expanded from macro 'hlist_for_each_=
entry'
           for (pos =3D hlist_entry_safe((head)->first, typeof(*(pos)), mem=
ber);\
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/list.h:993:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^~~~~~~
   net/smc/smc_diag.c:207:2: note: '?' condition is true
           sk_for_each(sk, head) {
           ^
   include/net/sock.h:826:2: note: expanded from macro 'sk_for_each'
           hlist_for_each_entry(__sk, list, sk_node)
           ^
   include/linux/list.h:1003:13: note: expanded from macro 'hlist_for_each_=
entry'
           for (pos =3D hlist_entry_safe((head)->first, typeof(*(pos)), mem=
ber);\
                      ^
   include/linux/list.h:993:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^
   net/smc/smc_diag.c:207:2: note: Loop condition is true.  Entering loop b=
ody
           sk_for_each(sk, head) {
           ^
   include/net/sock.h:826:2: note: expanded from macro 'sk_for_each'
           hlist_for_each_entry(__sk, list, sk_node)
           ^
   include/linux/list.h:1003:2: note: expanded from macro 'hlist_for_each_e=
ntry'
           for (pos =3D hlist_entry_safe((head)->first, typeof(*(pos)), mem=
ber);\
           ^
   net/smc/smc_diag.c:208:3: note: Taking false branch
                   if (!net_eq(sock_net(sk), net))
                   ^
   net/smc/smc_diag.c:210:7: note: Assuming 'num' is >=3D 'snum'
                   if (num < snum)
                       ^~~~~~~~~~
   net/smc/smc_diag.c:210:3: note: Taking false branch
                   if (num < snum)
                   ^
   net/smc/smc_diag.c:212:8: note: Calling '__smc_diag_dump'
                   rc =3D __smc_diag_dump(sk, skb, cb, nlmsg_data(cb->nlh),=
 bc);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   net/smc/smc_diag.c:82:8: note: Calling 'nlmsg_put'
           nlh =3D nlmsg_put(skb, NETLINK_CB(cb->skb).portid, cb->nlh->nlms=
g_seq,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/net/netlink.h:917:15: note: Assuming the condition is false
           if (unlikely(skb_tailroom(skb) < nlmsg_total_size(payload)))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/net/netlink.h:917:2: note: Taking false branch
           if (unlikely(skb_tailroom(skb) < nlmsg_total_size(payload)))
           ^
   include/net/netlink.h:920:2: note: Returning pointer, which participates=
 in a condition later
           return __nlmsg_put(skb, portid, seq, type, payload, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/smc/smc_diag.c:82:8: note: Returning from 'nlmsg_put'
           nlh =3D nlmsg_put(skb, NETLINK_CB(cb->skb).portid, cb->nlh->nlms=
g_seq,

vim +/smc_table +47 net/smc/smc_sysctl.c

462791bbfa35018 Dust Li 2022-03-01  22  =

462791bbfa35018 Dust Li 2022-03-01  23  static __net_init int smc_sysctl_in=
it_net(struct net *net)
462791bbfa35018 Dust Li 2022-03-01  24  {
462791bbfa35018 Dust Li 2022-03-01  25  	struct ctl_table *table;
462791bbfa35018 Dust Li 2022-03-01  26  =

462791bbfa35018 Dust Li 2022-03-01  27  	table =3D smc_table;
462791bbfa35018 Dust Li 2022-03-01  28  	if (!net_eq(net, &init_net)) {
462791bbfa35018 Dust Li 2022-03-01  29  		int i;
462791bbfa35018 Dust Li 2022-03-01  30  =

462791bbfa35018 Dust Li 2022-03-01  31  		table =3D kmemdup(table, sizeof(s=
mc_table), GFP_KERNEL);
462791bbfa35018 Dust Li 2022-03-01  32  		if (!table)
462791bbfa35018 Dust Li 2022-03-01  33  			goto err_alloc;
462791bbfa35018 Dust Li 2022-03-01  34  =

462791bbfa35018 Dust Li 2022-03-01  35  		for (i =3D 0; i < ARRAY_SIZE(smc_=
table) - 1; i++)
462791bbfa35018 Dust Li 2022-03-01  36  			table[i].data +=3D (void *)net -=
 (void *)&init_net;
462791bbfa35018 Dust Li 2022-03-01  37  	}
462791bbfa35018 Dust Li 2022-03-01  38  =

462791bbfa35018 Dust Li 2022-03-01  39  	net->smc.smc_hdr =3D register_net_=
sysctl(net, "net/smc", table);
462791bbfa35018 Dust Li 2022-03-01  40  	if (!net->smc.smc_hdr)
462791bbfa35018 Dust Li 2022-03-01  41  		goto err_reg;
462791bbfa35018 Dust Li 2022-03-01  42  =

462791bbfa35018 Dust Li 2022-03-01  43  	return 0;
462791bbfa35018 Dust Li 2022-03-01  44  =

462791bbfa35018 Dust Li 2022-03-01  45  err_reg:
462791bbfa35018 Dust Li 2022-03-01  46  	if (!net_eq(net, &init_net))
462791bbfa35018 Dust Li 2022-03-01 @47  		kfree(table);
462791bbfa35018 Dust Li 2022-03-01  48  err_alloc:
462791bbfa35018 Dust Li 2022-03-01  49  	return -ENOMEM;
462791bbfa35018 Dust Li 2022-03-01  50  }
462791bbfa35018 Dust Li 2022-03-01  51  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5354403425649191990==--

