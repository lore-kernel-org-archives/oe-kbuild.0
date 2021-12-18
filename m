Content-Type: multipart/mixed; boundary="===============2175064814842229596=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/bluetooth/hci_qca.c:1633:4: warning: Value stored to 'sw_ctrl_state' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 19 Dec 2021 05:20:41 +0800
Message-ID: <202112190546.ctevjqPe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2175064814842229596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
CC: Marcel Holtmann <marcel@holtmann.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9eaa88c7036eda3f6c215f87ca693594cf90559b
commit: d8f97da1b92d2fe89d51c673ecf80c4016119e5c Bluetooth: hci_qca: Add su=
pport for QTI Bluetooth chip wcn6750
date:   6 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20211211 (https://download.01.org/0day-ci/archi=
ve/20211219/202112190546.ctevjqPe-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd8f97da1b92d2fe89d51c673ecf80c4016119e5c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d8f97da1b92d2fe89d51c673ecf80c4016119e5c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   if (!session)
                   ^
   fs/ceph/mds_client.c:4863:7: note: Assuming field 's_state' is equal to =
CEPH_MDS_SESSION_REJECTED
                   if (session->s_state =3D=3D CEPH_MDS_SESSION_REJECTED)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:4863:3: note: Taking true branch
                   if (session->s_state =3D=3D CEPH_MDS_SESSION_REJECTED)
                   ^
   fs/ceph/mds_client.c:4864:4: note: Calling '__unregister_session'
                           __unregister_session(mdsc, session);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:791:2: note: Taking false branch
           dout("__unregister_session mds%d %p\n", s->s_mds, s);
           ^
   include/linux/ceph/ceph_debug.h:25:3: note: expanded from macro 'dout'
                   if (0)                                          \
                   ^
   fs/ceph/mds_client.c:791:2: note: Loop condition is false.  Exiting loop
           dout("__unregister_session mds%d %p\n", s->s_mds, s);
           ^
   include/linux/ceph/ceph_debug.h:24:26: note: expanded from macro 'dout'
   #  define dout(fmt, ...)        do {                            \
                                   ^
   fs/ceph/mds_client.c:792:2: note: Assuming the condition is false
           BUG_ON(mdsc->sessions[s->s_mds] !=3D s);
           ^
   include/asm-generic/bug.h:183:36: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:792:2: note: Taking false branch
           BUG_ON(mdsc->sessions[s->s_mds] !=3D s);
           ^
   include/asm-generic/bug.h:183:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/ceph/mds_client.c:792:2: note: Loop condition is false.  Exiting loop
           BUG_ON(mdsc->sessions[s->s_mds] !=3D s);
           ^
   include/asm-generic/bug.h:183:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/ceph/mds_client.c:795:2: note: Calling 'ceph_put_mds_session'
           ceph_put_mds_session(s);
           ^~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:667:2: note: Taking false branch
           dout("mdsc put_session %p %d -> %d\n", s,
           ^
   include/linux/ceph/ceph_debug.h:25:3: note: expanded from macro 'dout'
                   if (0)                                          \
                   ^
   fs/ceph/mds_client.c:667:2: note: Loop condition is false.  Exiting loop
           dout("mdsc put_session %p %d -> %d\n", s,
           ^
   include/linux/ceph/ceph_debug.h:24:26: note: expanded from macro 'dout'
   #  define dout(fmt, ...)        do {                            \
                                   ^
   fs/ceph/mds_client.c:669:2: note: Taking true branch
           if (refcount_dec_and_test(&s->s_ref)) {
           ^
   fs/ceph/mds_client.c:670:7: note: Assuming field 'authorizer' is null
                   if (s->s_auth.authorizer)
                       ^~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:670:3: note: Taking false branch
                   if (s->s_auth.authorizer)
                   ^
   fs/ceph/mds_client.c:672:3: note: Assuming the condition is false
                   WARN_ON(mutex_is_locked(&s->s_mutex));
                   ^
   include/asm-generic/bug.h:188:23: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                ^~~~~~~~~~~~
   fs/ceph/mds_client.c:674:3: note: Memory is released
                   kfree(s);
                   ^~~~~~~~
   fs/ceph/mds_client.c:795:2: note: Returning; memory was released via 1st=
 parameter
           ceph_put_mds_session(s);
           ^~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:4864:4: note: Returning; memory was released via 2n=
d parameter
                           __unregister_session(mdsc, session);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:4869:3: note: Use of memory after it is freed
                   __close_session(mdsc, session);
                   ^                     ~~~~~~~
   fs/ceph/mds_client.c:5010:2: warning: Value stored to 'maplen' is never =
read [clang-analyzer-deadcode.DeadStores]
           maplen =3D ceph_decode_32(&p);
           ^        ~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:5010:2: note: Value stored to 'maplen' is never read
           maplen =3D ceph_decode_32(&p);
           ^        ~~~~~~~~~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   40 warnings generated.
>> drivers/bluetooth/hci_qca.c:1633:4: warning: Value stored to 'sw_ctrl_st=
ate' is never read [clang-analyzer-deadcode.DeadStores]
                           sw_ctrl_state =3D gpiod_get_value_cansleep(qcade=
v->sw_ctrl);
                           ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1633:4: note: Value stored to 'sw_ctrl_state=
' is never read
                           sw_ctrl_state =3D gpiod_get_value_cansleep(qcade=
v->sw_ctrl);
                           ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1911:4: warning: Value stored to 'sw_ctrl_st=
ate' is never read [clang-analyzer-deadcode.DeadStores]
                           sw_ctrl_state =3D gpiod_get_value_cansleep(qcade=
v->sw_ctrl);
                           ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1911:4: note: Value stored to 'sw_ctrl_state=
' is never read
                           sw_ctrl_state =3D gpiod_get_value_cansleep(qcade=
v->sw_ctrl);
                           ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   net/sched/sch_red.c:142:22: warning: The right operand of '|' is a garba=
ge value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   return NET_XMIT_CN | ret;
                                      ^ ~~~
   net/sched/sch_red.c:75:2: note: 'ret' declared without an initial value
           int ret;
           ^~~~~~~
   net/sched/sch_red.c:81:2: note: Taking false branch
           if (red_is_idling(&q->vars))
           ^
   net/sched/sch_red.c:84:10: note: Calling 'red_action'
           switch (red_action(&q->parms, &q->vars, q->vars.qavg)) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/red.h:419:2: note: Control jumps to 'case RED_ABOVE_MAX_TRES=
H:'  at line 436
           switch (red_cmp_thresh(p, qavg)) {
           ^
   include/net/red.h:438:4: note: Returning the value 2, which participates=
 in a condition later
                           return RED_HARD_MARK;
                           ^~~~~~~~~~~~~~~~~~~~
   net/sched/sch_red.c:84:10: note: Returning from 'red_action'
           switch (red_action(&q->parms, &q->vars, q->vars.qavg)) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_red.c:84:2: note: Control jumps to 'case RED_HARD_MARK:'  =
at line 108
           switch (red_action(&q->parms, &q->vars, q->vars.qavg)) {
           ^
   net/sched/sch_red.c:110:7: note: Assuming the condition is true
                   if (red_use_harddrop(q) || !red_use_ecn(q)) {
                       ^~~~~~~~~~~~~~~~~~~
   net/sched/sch_red.c:110:27: note: Left side of '||' is true
                   if (red_use_harddrop(q) || !red_use_ecn(q)) {
                                           ^
   net/sched/sch_red.c:112:4: note: Control jumps to line 140
                           goto congestion_drop;
                           ^
   net/sched/sch_red.c:140:8: note: Calling 'tcf_qevent_handle'
           skb =3D tcf_qevent_handle(&q->qe_early_drop, sch, skb, to_free, =
&ret);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/net/pkt_cls.h:596:2: note: Returning without writing to '*ret'
           return skb;
           ^
   include/net/pkt_cls.h:596:2: note: Returning pointer (loaded from 'skb')=
, which participates in a condition later
           return skb;
           ^~~~~~~~~~
   net/sched/sch_red.c:140:8: note: Returning from 'tcf_qevent_handle'
           skb =3D tcf_qevent_handle(&q->qe_early_drop, sch, skb, to_free, =
&ret);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   net/sched/sch_red.c:141:6: note: Assuming 'skb' is null
           if (!skb)
               ^~~~
   net/sched/sch_red.c:141:2: note: Taking true branch
           if (!skb)
           ^
   net/sched/sch_red.c:142:22: note: The right operand of '|' is a garbage =
value
                   return NET_XMIT_CN | ret;
                                      ^ ~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/mtd/nand/raw/nand_bbt.c:550:3: warning: Value stored to 'bbtbloc=
ks' is never read [clang-analyzer-deadcode.DeadStores]
                   bbtblocks =3D mtd->size >> this->bbt_erase_shift;
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_bbt.c:550:3: note: Value stored to 'bbtblocks'=
 is never read
                   bbtblocks =3D mtd->size >> this->bbt_erase_shift;
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/mtd/nand/raw/nand_onfi.c:254:6: warning: The result of the left =
shift is undefined because the right operand is negative [clang-analyzer-co=
re.UndefinedBinaryOperatorResult]
                           1 << (fls(le32_to_cpu(p->pages_per_block)) - 1);
                             ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_onfi.c:147:25: note: Calling 'nand_to_mtd'
           struct mtd_info *mtd =3D nand_to_mtd(chip);
                                  ^~~~~~~~~~~~~~~~~
   include/linux/mtd/rawnand.h:1165:2: note: Returning without writing to '=
chip->parameters.model', which participates in a condition later
           return &chip->base.mtd;
           ^
   drivers/mtd/nand/raw/nand_onfi.c:147:25: note: Returning from 'nand_to_m=
td'
           struct mtd_info *mtd =3D nand_to_mtd(chip);
                                  ^~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_onfi.c:161:6: note: Assuming 'ret' is 0
--
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   net/sunrpc/auth.c:835:8: warning: Access to field 'cr_ops' results in a =
dereference of a null pointer (loaded from variable 'cred') [clang-analyzer=
-core.NullDereference]
           err =3D cred->cr_ops->crrefresh(task);
                 ^~~~
   net/sunrpc/auth.c:828:6: note: Assuming 'cred' is equal to NULL
           if (cred =3D=3D NULL) {
               ^~~~~~~~~~~~
   net/sunrpc/auth.c:828:2: note: Taking true branch
           if (cred =3D=3D NULL) {
           ^
   net/sunrpc/auth.c:830:7: note: 'err' is >=3D 0
                   if (err < 0)
                       ^~~
   net/sunrpc/auth.c:830:3: note: Taking false branch
                   if (err < 0)
                   ^
   net/sunrpc/auth.c:832:3: note: Null pointer value stored to 'cred'
                   cred =3D task->tk_rqstp->rq_cred;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth.c:835:8: note: Access to field 'cr_ops' results in a der=
eference of a null pointer (loaded from variable 'cred')
           err =3D cred->cr_ops->crrefresh(task);
                 ^~~~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   net/sunrpc/svc.c:1290:2: warning: Value stored to 'rpc_stat' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           rpc_stat =3D rpc_success;
           ^
   net/sunrpc/svc.c:1290:2: note: Value stored to 'rpc_stat' is never read
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c:1296:4: warning: Value st=
ored to 'offs' is never read [clang-analyzer-deadcode.DeadStores]
                           offs +=3D mvpp2_cls_hek_field_size(MVPP22_CLS_HE=
K_OPT_L4DIP);
                           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c:1296:4: note: Value store=
d to 'offs' is never read
                           offs +=3D mvpp2_cls_hek_field_size(MVPP22_CLS_HE=
K_OPT_L4DIP);
                           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   net/rds/send.c:1246:2: warning: Value stored to 'total_payload_len' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           total_payload_len +=3D rdma_payload_len;
           ^                    ~~~~~~~~~~~~~~~~
   net/rds/send.c:1246:2: note: Value stored to 'total_payload_len' is neve=
r read
           total_payload_len +=3D rdma_payload_len;
           ^                    ~~~~~~~~~~~~~~~~
   Suppressed 17 warnings (16 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   net/ipv4/tcp_timer.c:484:21: warning: Value stored to 'inet' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
                   struct inet_sock *inet =3D inet_sk(sk);
                                     ^~~~   ~~~~~~~~~~~
   net/ipv4/tcp_timer.c:484:21: note: Value stored to 'inet' during its ini=
tialization is never read
                   struct inet_sock *inet =3D inet_sk(sk);
                                     ^~~~   ~~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   40 warnings generated.
>> drivers/bluetooth/hci_qca.c:1633:4: warning: Value stored to 'sw_ctrl_st=
ate' is never read [clang-analyzer-deadcode.DeadStores]
                           sw_ctrl_state =3D gpiod_get_value_cansleep(qcade=
v->sw_ctrl);
                           ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1633:4: note: Value stored to 'sw_ctrl_state=
' is never read
                           sw_ctrl_state =3D gpiod_get_value_cansleep(qcade=
v->sw_ctrl);
                           ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1911:4: warning: Value stored to 'sw_ctrl_st=
ate' is never read [clang-analyzer-deadcode.DeadStores]
                           sw_ctrl_state =3D gpiod_get_value_cansleep(qcade=
v->sw_ctrl);
                           ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1911:4: note: Value stored to 'sw_ctrl_state=
' is never read
                           sw_ctrl_state =3D gpiod_get_value_cansleep(qcade=
v->sw_ctrl);
                           ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   net/sctp/offload.c:47:2: warning: Value stored to 'sh' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           sh =3D sctp_hdr(skb);
           ^    ~~~~~~~~~~~~~
   net/sctp/offload.c:47:2: note: Value stored to 'sh' is never read
           sh =3D sctp_hdr(skb);
           ^    ~~~~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   net/ipv4/esp4.c:100:27: warning: Value stored to 'extra' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           struct esp_output_extra *extra =3D esp_tmp_extra(tmp);
                                    ^~~~~   ~~~~~~~~~~~~~~~~~~
   net/ipv4/esp4.c:100:27: note: Value stored to 'extra' during its initial=
ization is never read
           struct esp_output_extra *extra =3D esp_tmp_extra(tmp);
                                    ^~~~~   ~~~~~~~~~~~~~~~~~~
   net/ipv4/esp4.c:110:2: warning: Value stored to 'extra' is never read [c=
lang-analyzer-deadcode.DeadStores]
           extra =3D esp_tmp_extra(tmp);
           ^       ~~~~~~~~~~~~~~~~~~
   net/ipv4/esp4.c:110:2: note: Value stored to 'extra' is never read
           extra =3D esp_tmp_extra(tmp);
           ^       ~~~~~~~~~~~~~~~~~~
   Suppressed 17 warnings (16 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   net/ipv4/esp4_offload.c:41:7: warning: Although the value stored to 'err=
' is used in the enclosing expression, the value is never actually read fro=
m 'err' [clang-analyzer-deadcode.DeadStores]
           if ((err =3D xfrm_parse_spi(skb, IPPROTO_ESP, &spi, &seq)) !=3D =
0)
                ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/esp4_offload.c:41:7: note: Although the value stored to 'err' i=
s used in the enclosing expression, the value is never actually read from '=
err'
           if ((err =3D xfrm_parse_spi(skb, IPPROTO_ESP, &spi, &seq)) !=3D =
0)
                ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/sw_ctrl_state +1633 drivers/bluetooth/hci_qca.c

c1a74160eaf1ac Venkata Lakshmi Narayana Gubba 2021-03-11  1593  =

d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1594  static int =
qca_regulator_init(struct hci_uart *hu)
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1595  {
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1596  	enum qca_b=
tsoc_type soc_type =3D qca_soc_type(hu);
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1597  	struct qca=
_serdev *qcadev;
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1598  	int ret;
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1599  	bool sw_ct=
rl_state;
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1600  =

3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1601  	/* Check f=
or vregs status, may be hci down has turned
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1602  	 * off the=
 voltage regulator.
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1603  	 */
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1604  	qcadev =3D=
 serdev_device_get_drvdata(hu->serdev);
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1605  	if (!qcade=
v->bt_power->vregs_on) {
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1606  		serdev_de=
vice_close(hu->serdev);
a9314e76da966d Bjorn Andersson                2019-10-17  1607  		ret =3D q=
ca_regulator_enable(qcadev);
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1608  		if (ret)
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1609  			return r=
et;
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1610  =

3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1611  		ret =3D s=
erdev_device_open(hu->serdev);
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1612  		if (ret) {
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1613  			bt_dev_e=
rr(hu->hdev, "failed to open port");
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1614  			return r=
et;
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1615  		}
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1616  	}
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1617  =

d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1618  	if (qca_is=
_wcn399x(soc_type)) {
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1619  		/* Forcef=
ully enable wcn399x to enter in to boot mode. */
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1620  		host_set_=
baudrate(hu, 2400);
9836b80208b225 Matthias Kaehlcke              2019-02-26  1621  		ret =3D q=
ca_send_power_pulse(hu, false);
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1622  		if (ret)
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1623  			return r=
et;
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1624  	}
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1625  =

d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1626  	/* For wcn=
6750 need to enable gpio bt_en */
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1627  	if (qcadev=
->bt_en) {
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1628  		gpiod_set=
_value_cansleep(qcadev->bt_en, 0);
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1629  		msleep(50=
);
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1630  		gpiod_set=
_value_cansleep(qcadev->bt_en, 1);
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1631  		msleep(50=
);
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1632  		if (qcade=
v->sw_ctrl) {
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18 @1633  			sw_ctrl_=
state =3D gpiod_get_value_cansleep(qcadev->sw_ctrl);
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1634  			bt_dev_d=
bg(hu->hdev, "SW_CTRL is %d", sw_ctrl_state);
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1635  		}
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1636  	}
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1637  =

fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1638  	qca_set_sp=
eed(hu, QCA_INIT_SPEED);
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1639  =

d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1640  	if (qca_is=
_wcn399x(soc_type)) {
9836b80208b225 Matthias Kaehlcke              2019-02-26  1641  		ret =3D q=
ca_send_power_pulse(hu, true);
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1642  		if (ret)
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1643  			return r=
et;
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1644  	}
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1645  =

fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1646  	/* Now the=
 device is in ready state to communicate with host.
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1647  	 * To sync=
 host with device we need to reopen port.
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1648  	 * Without=
 this, we will have RTS and CTS synchronization
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1649  	 * issues.
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1650  	 */
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1651  	serdev_dev=
ice_close(hu->serdev);
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1652  	ret =3D se=
rdev_device_open(hu->serdev);
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1653  	if (ret) {
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1654  		bt_dev_er=
r(hu->hdev, "failed to open port");
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1655  		return re=
t;
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1656  	}
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1657  =

fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1658  	hci_uart_s=
et_flow_control(hu, false);
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1659  =

fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1660  	return 0;
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1661  }
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1662  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2175064814842229596==--

