Content-Type: multipart/mixed; boundary="===============1922310793506240912=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/qcom/venus/venc.c:807:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 27 Jun 2022 12:32:32 +0800
Message-ID: <202206271232.fPUoogfV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1922310793506240912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/platform/qcom/venus/venc.c:807:3: warning: Value stored to 'ret' is ne=
ver read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Stanimir Varbanov <stanimir.varbanov@linaro.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   03c765b0e3b4cb5063276b086c76f7a612856a9a
commit: f7a3d3dc5831df6f898a5ae2a6ea1d221ea95c8a media: venus: venc: Add su=
pport for intra-refresh period
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220531 (https://download.01.org/0day-ci/archi=
ve/20220627/202206271232.fPUoogfV-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825ab=
d6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df7a3d3dc5831df6f898a5ae2a6ea1d221ea95c8a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f7a3d3dc5831df6f898a5ae2a6ea1d221ea95c8a
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           status |=3D si21_writeregs(state, PLL_DIVISOR_REG, &regs[0], 0x0=
4);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/si21xx.c:830:2: note: Value stored to 'statu=
s' is never read
           status |=3D si21_writeregs(state, PLL_DIVISOR_REG, &regs[0], 0x0=
4);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (1 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/dvb-frontends/stv0900_sw.c:1978:4: warning: Value stored t=
o 'lock' is never read [clang-analyzer-deadcode.DeadStores]
                           lock =3D TRUE;
                           ^
   drivers/media/dvb-frontends/stv0900_sw.c:1978:4: note: Value stored to '=
lock' is never read
   drivers/media/dvb-frontends/stv0900_sw.c:1993:4: warning: Value stored t=
o 'lock' is never read [clang-analyzer-deadcode.DeadStores]
                           lock =3D FALSE;
                           ^
   drivers/media/dvb-frontends/stv0900_sw.c:1993:4: note: Value stored to '=
lock' is never read
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/md/dm-kcopyd.c:246:10: warning: Access to field 'next' results i=
n a dereference of a null pointer (loaded from variable 'pl') [clang-analyz=
er-core.NullDereference]
                   next =3D pl->next;
                          ^
   drivers/md/dm-kcopyd.c:913:6: note: Assuming 'kc' is non-null
           if (!kc)
               ^~~
   drivers/md/dm-kcopyd.c:913:2: note: Taking false branch
           if (!kc)
           ^
   drivers/md/dm-kcopyd.c:916:2: note: Loop condition is false.  Exiting lo=
op
           spin_lock_init(&kc->job_lock);
           ^
   include/linux/spinlock.h:344:34: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(_lock)                  \
                                                   ^
   drivers/md/dm-kcopyd.c:924:6: note: Assuming 'r' is 0
           if (r)
               ^
   drivers/md/dm-kcopyd.c:924:2: note: Taking false branch
           if (r)
           ^
   drivers/md/dm-kcopyd.c:927:2: note: Loop condition is false.  Exiting lo=
op
           INIT_WORK(&kc->kcopyd_work, do_work);
           ^
   include/linux/workqueue.h:250:2: note: expanded from macro 'INIT_WORK'
           __INIT_WORK((_work), (_func), 0)
           ^
   include/linux/workqueue.h:241:2: note: expanded from macro '__INIT_WORK'
           do {                                                            \
           ^
   drivers/md/dm-kcopyd.c:929:6: note: Assuming field 'kcopyd_wq' is non-nu=
ll
           if (!kc->kcopyd_wq) {
               ^~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:929:2: note: Taking false branch
           if (!kc->kcopyd_wq) {
           ^
   drivers/md/dm-kcopyd.c:939:6: note: Calling 'client_reserve_pages'
           r =3D client_reserve_pages(kc, reserve_pages);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:309:20: note: 'pl' initialized to a null pointer =
value
           struct page_list *pl =3D NULL, *next;
                             ^~
   drivers/md/dm-kcopyd.c:311:14: note: Assuming 'i' is >=3D 'nr_pages'
           for (i =3D 0; i < nr_pages; i++) {
                       ^~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:311:2: note: Loop condition is false. Execution c=
ontinues on line 322
           for (i =3D 0; i < nr_pages; i++) {
           ^
   drivers/md/dm-kcopyd.c:323:23: note: Passing null pointer value via 2nd =
parameter 'pl'
           kcopyd_put_pages(kc, pl);
                                ^~
   drivers/md/dm-kcopyd.c:323:2: note: Calling 'kcopyd_put_pages'
           kcopyd_put_pages(kc, pl);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:246:10: note: Access to field 'next' results in a=
 dereference of a null pointer (loaded from variable 'pl')
                   next =3D pl->next;
                          ^~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/media/platform/qcom/venus/venc.c:807:3: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D hfi_session_set_property(inst, ptype, &en);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/venus/venc.c:807:3: note: Value stored to 'r=
et' is never read
                   ret =3D hfi_session_set_property(inst, ptype, &en);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/test-drivers/vidtv/vidtv_bridge.c:123:6: warning: Value st=
ored to 'mux_buf_sz' during its initialization is never read [clang-analyze=
r-deadcode.DeadStores]
           u32 mux_buf_sz =3D mux_buf_sz_pkts * TS_PACKET_LEN;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/test-drivers/vidtv/vidtv_bridge.c:123:6: note: Value store=
d to 'mux_buf_sz' during its initialization is never read
           u32 mux_buf_sz =3D mux_buf_sz_pkts * TS_PACKET_LEN;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (1 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/media/test-drivers/vidtv/vidtv_s302m.c:383:3: warning: Value sto=
red to 'nbytes_per_unit' is never read [clang-analyzer-deadcode.DeadStores]
                   nbytes_per_unit =3D 0;
                   ^                 ~
   drivers/media/test-drivers/vidtv/vidtv_s302m.c:383:3: note: Value stored=
 to 'nbytes_per_unit' is never read
                   nbytes_per_unit =3D 0;
                   ^                 ~
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/btrfs/zstd.c:440:4: warning: Value stored to 'tot_out' is never read =
[clang-analyzer-deadcode.DeadStores]
                           tot_out +=3D workspace->out_buf.pos;
                           ^          ~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zstd.c:440:4: note: Value stored to 'tot_out' is never read
                           tot_out +=3D workspace->out_buf.pos;
                           ^          ~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zstd.c:502:4: warning: Value stored to 'tot_out' is never read =
[clang-analyzer-deadcode.DeadStores]
                           tot_out +=3D workspace->out_buf.pos;
                           ^          ~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zstd.c:502:4: note: Value stored to 'tot_out' is never read
                           tot_out +=3D workspace->out_buf.pos;
                           ^          ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   fs/btrfs/compression.c:254:2: warning: Value stored to 'index' is never =
read [clang-analyzer-deadcode.DeadStores]
           index =3D 0;
           ^       ~
   fs/btrfs/compression.c:254:2: note: Value stored to 'index' is never read
           index =3D 0;
           ^       ~
   fs/btrfs/compression.c:364:2: warning: Value stored to 'index' is never =
read [clang-analyzer-deadcode.DeadStores]
           index =3D 0;
           ^       ~
   fs/btrfs/compression.c:364:2: note: Value stored to 'index' is never read
           index =3D 0;
           ^       ~
   fs/btrfs/compression.c:732:2: warning: Value stored to 'faili' is never =
read [clang-analyzer-deadcode.DeadStores]
           faili =3D nr_pages - 1;
           ^       ~~~~~~~~~~~~
   fs/btrfs/compression.c:732:2: note: Value stored to 'faili' is never read
           faili =3D nr_pages - 1;
           ^       ~~~~~~~~~~~~
   fs/btrfs/compression.c:892:2: warning: 1st function call argument is an =
uninitialized value [clang-analyzer-core.CallAndMessage]
           kfree(workspace->bucket);
           ^
   fs/btrfs/compression.c:1669:30: note: Calling 'get_workspace'
           struct list_head *ws_list =3D get_workspace(0, 0);
                                       ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:1095:2: note: Control jumps to 'case BTRFS_COMPRE=
SS_NONE:'  at line 1096
           switch (type) {
           ^
   fs/btrfs/compression.c:1096:35: note: Calling 'btrfs_get_workspace'
           case BTRFS_COMPRESS_NONE: return btrfs_get_workspace(type, level=
);
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:1035:6: note: Assuming the condition is false
           if (!list_empty(idle_ws)) {
               ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:1035:2: note: Taking false branch
           if (!list_empty(idle_ws)) {
           ^
   fs/btrfs/compression.c:1043:6: note: Assuming the condition is false
           if (atomic_read(total_ws) > cpus) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:1043:2: note: Taking false branch
           if (atomic_read(total_ws) > cpus) {
           ^
   fs/btrfs/compression.c:1062:14: note: Calling 'alloc_workspace'
--
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/soundwire/stream.c:844:2: note: Loop condition is false.  Exitin=
g loop
           list_for_each_entry(m_rt, &stream->master_list, stream_node) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/soundwire/stream.c:844:2: note: Loop condition is true.  Enterin=
g loop body
           list_for_each_entry(m_rt, &stream->master_list, stream_node) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/soundwire/stream.c:846:22: note: Field 'msg' is non-null
                   if (bus->defer_msg.msg) {
                                      ^
   drivers/soundwire/stream.c:846:3: note: Taking true branch
                   if (bus->defer_msg.msg) {
                   ^
   drivers/soundwire/stream.c:847:10: note: Use of memory after it is freed
                           kfree(bus->defer_msg.msg->buf);
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/media/platform/qcom/venus/venc.c:807:3: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D hfi_session_set_property(inst, ptype, &en);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/venus/venc.c:807:3: note: Value stored to 'r=
et' is never read
                   ret =3D hfi_session_set_property(inst, ptype, &en);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/test-drivers/vidtv/vidtv_bridge.c:123:6: warning: Value st=
ored to 'mux_buf_sz' during its initialization is never read [clang-analyze=
r-deadcode.DeadStores]
           u32 mux_buf_sz =3D mux_buf_sz_pkts * TS_PACKET_LEN;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/test-drivers/vidtv/vidtv_bridge.c:123:6: note: Value store=
d to 'mux_buf_sz' during its initialization is never read
           u32 mux_buf_sz =3D mux_buf_sz_pkts * TS_PACKET_LEN;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (1 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/media/test-drivers/vidtv/vidtv_s302m.c:383:3: warning: Value sto=
red to 'nbytes_per_unit' is never read [clang-analyzer-deadcode.DeadStores]
                   nbytes_per_unit =3D 0;
                   ^                 ~
   drivers/media/test-drivers/vidtv/vidtv_s302m.c:383:3: note: Value stored=
 to 'nbytes_per_unit' is never read
                   nbytes_per_unit =3D 0;
                   ^                 ~
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/hid/hid-steam.c:246:15: warning: The left operand of '!=3D' is a=
 garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (reply[0] !=3D 0xae || reply[1] !=3D 0x15 || reply[2] !=3D 0x=
01)
                        ^
   drivers/hid/hid-steam.c:564:31: note: Left side of '&&' is false
           struct steam_device *steam =3D container_of(work, struct steam_d=
evice,
                                        ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/hid/hid-steam.c:564:31: note: Taking false branch
           struct steam_device *steam =3D container_of(work, struct steam_d=
evice,
                                        ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/hid/hid-steam.c:564:31: note: Loop condition is false.  Exiting =
loop
           struct steam_device *steam =3D container_of(work, struct steam_d=
evice,
                                        ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/hid/hid-steam.c:570:2: note: Loop condition is false.  Exiting l=
oop
           spin_lock_irqsave(&steam->lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:274:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'

vim +/ret +807 drivers/media/platform/qcom/venus/venc.c

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  540  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  541  static int venc_set_prope=
rties(struct venus_inst *inst)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  542  {
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  543  	struct venc_controls *ct=
r =3D &inst->controls.enc;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  544  	struct hfi_intra_period =
intra_period;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  545  	struct hfi_framerate fra=
te;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  546  	struct hfi_bitrate brate;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  547  	struct hfi_idr_period id=
rp;
2123cbd687ca0c Kelvin Lawson     2018-11-29  548  	struct hfi_quantization =
quant;
2123cbd687ca0c Kelvin Lawson     2018-11-29  549  	struct hfi_quantization_=
range quant_range;
002c22bd360e07 Dikshita Agarwal  2021-01-08  550  	struct hfi_enable en;
f2fb3f02abe2e6 Dikshita Agarwal  2021-03-24  551  	struct hfi_ltr_mode ltr_=
mode;
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  552  	struct hfi_intra_refresh=
 intra_refresh =3D {};
435c53c3698f41 Stanimir Varbanov 2020-09-08  553  	u32 ptype, rate_control,=
 bitrate;
a7a20f721e812a Stanimir Varbanov 2020-10-27  554  	u32 profile, level;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  555  	int ret;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  556  =

1ad175952bbcaf Dikshita Agarwal  2021-04-02  557  	ret =3D venus_helper_set=
_work_mode(inst);
01165b8484973d Stanimir Varbanov 2018-07-05  558  	if (ret)
01165b8484973d Stanimir Varbanov 2018-07-05  559  		return ret;
01165b8484973d Stanimir Varbanov 2018-07-05  560  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  561  	ptype =3D HFI_PROPERTY_C=
ONFIG_FRAME_RATE;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  562  	frate.buffer_type =3D HF=
I_BUFFER_OUTPUT;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  563  	frate.framerate =3D inst=
->fps * (1 << 16);
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  564  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  565  	ret =3D hfi_session_set_=
property(inst, ptype, &frate);
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  566  	if (ret)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  567  		return ret;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  568  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  569  	if (inst->fmt_cap->pixfm=
t =3D=3D V4L2_PIX_FMT_H264) {
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  570  		struct hfi_h264_vui_tim=
ing_info info;
a7837e11679e01 Loic Poulain      2017-11-24  571  		struct hfi_h264_entropy=
_control entropy;
f7d12fea16cbcc Loic Poulain      2017-11-24  572  		struct hfi_h264_db_cont=
rol deblock;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  573  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  574  		ptype =3D HFI_PROPERTY_=
PARAM_VENC_H264_VUI_TIMING_INFO;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  575  		info.enable =3D 1;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  576  		info.fixed_framerate =
=3D 1;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  577  		info.time_scale =3D NSE=
C_PER_SEC;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  578  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  579  		ret =3D hfi_session_set=
_property(inst, ptype, &info);
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  580  		if (ret)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  581  			return ret;
a7837e11679e01 Loic Poulain      2017-11-24  582  =

a7837e11679e01 Loic Poulain      2017-11-24  583  		ptype =3D HFI_PROPERTY_=
PARAM_VENC_H264_ENTROPY_CONTROL;
a7837e11679e01 Loic Poulain      2017-11-24  584  		entropy.entropy_mode =
=3D venc_v4l2_to_hfi(
a7837e11679e01 Loic Poulain      2017-11-24  585  					  V4L2_CID_MPEG_VIDE=
O_H264_ENTROPY_MODE,
a7837e11679e01 Loic Poulain      2017-11-24  586  					  ctr->h264_entropy_=
mode);
a7837e11679e01 Loic Poulain      2017-11-24  587  		entropy.cabac_model =3D=
 HFI_H264_CABAC_MODEL_0;
a7837e11679e01 Loic Poulain      2017-11-24  588  =

a7837e11679e01 Loic Poulain      2017-11-24  589  		ret =3D hfi_session_set=
_property(inst, ptype, &entropy);
a7837e11679e01 Loic Poulain      2017-11-24  590  		if (ret)
a7837e11679e01 Loic Poulain      2017-11-24  591  			return ret;
f7d12fea16cbcc Loic Poulain      2017-11-24  592  =

f7d12fea16cbcc Loic Poulain      2017-11-24  593  		ptype =3D HFI_PROPERTY_=
PARAM_VENC_H264_DEBLOCK_CONTROL;
f7d12fea16cbcc Loic Poulain      2017-11-24  594  		deblock.mode =3D venc_v=
4l2_to_hfi(
f7d12fea16cbcc Loic Poulain      2017-11-24  595  				      V4L2_CID_MPEG_V=
IDEO_H264_LOOP_FILTER_MODE,
f7d12fea16cbcc Loic Poulain      2017-11-24  596  				      ctr->h264_loop_=
filter_mode);
f7d12fea16cbcc Loic Poulain      2017-11-24  597  		deblock.slice_alpha_off=
set =3D ctr->h264_loop_filter_alpha;
f7d12fea16cbcc Loic Poulain      2017-11-24  598  		deblock.slice_beta_offs=
et =3D ctr->h264_loop_filter_beta;
f7d12fea16cbcc Loic Poulain      2017-11-24  599  =

f7d12fea16cbcc Loic Poulain      2017-11-24  600  		ret =3D hfi_session_set=
_property(inst, ptype, &deblock);
f7d12fea16cbcc Loic Poulain      2017-11-24  601  		if (ret)
f7d12fea16cbcc Loic Poulain      2017-11-24  602  			return ret;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  603  	}
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  604  =

f0ddb4e9911665 Dikshita Agarwal  2020-12-16  605  	if (inst->fmt_cap->pixfm=
t =3D=3D V4L2_PIX_FMT_H264 ||
f0ddb4e9911665 Dikshita Agarwal  2020-12-16  606  	    inst->fmt_cap->pixfm=
t =3D=3D V4L2_PIX_FMT_HEVC) {
8fc58186bb41ff Stanimir Varbanov 2017-12-01  607  		/* IDR periodicity, n:
8fc58186bb41ff Stanimir Varbanov 2017-12-01  608  		 * n =3D 0 - only the f=
irst I-frame is IDR frame
8fc58186bb41ff Stanimir Varbanov 2017-12-01  609  		 * n =3D 1 - all I-fram=
es will be IDR frames
8fc58186bb41ff Stanimir Varbanov 2017-12-01  610  		 * n > 1 - every n-th I=
-frame will be IDR frame
8fc58186bb41ff Stanimir Varbanov 2017-12-01  611  		 */
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  612  		ptype =3D HFI_PROPERTY_=
CONFIG_VENC_IDR_PERIOD;
8fc58186bb41ff Stanimir Varbanov 2017-12-01  613  		idrp.idr_period =3D 0;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  614  		ret =3D hfi_session_set=
_property(inst, ptype, &idrp);
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  615  		if (ret)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  616  			return ret;
f0ddb4e9911665 Dikshita Agarwal  2020-12-16  617  	}
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  618  =

9172652d72f8e9 Stanimir Varbanov 2020-04-23  619  	if (inst->fmt_cap->pixfm=
t =3D=3D V4L2_PIX_FMT_HEVC) {
9172652d72f8e9 Stanimir Varbanov 2020-04-23  620  		struct hfi_hdr10_pq_sei=
 hdr10;
9172652d72f8e9 Stanimir Varbanov 2020-04-23  621  		unsigned int c;
9172652d72f8e9 Stanimir Varbanov 2020-04-23  622  =

9172652d72f8e9 Stanimir Varbanov 2020-04-23  623  		ptype =3D HFI_PROPERTY_=
PARAM_VENC_HDR10_PQ_SEI;
9172652d72f8e9 Stanimir Varbanov 2020-04-23  624  =

9172652d72f8e9 Stanimir Varbanov 2020-04-23  625  		for (c =3D 0; c < 3; c+=
+) {
9172652d72f8e9 Stanimir Varbanov 2020-04-23  626  			hdr10.mastering.displa=
y_primaries_x[c] =3D
9172652d72f8e9 Stanimir Varbanov 2020-04-23  627  				ctr->mastering.displa=
y_primaries_x[c];
9172652d72f8e9 Stanimir Varbanov 2020-04-23  628  			hdr10.mastering.displa=
y_primaries_y[c] =3D
9172652d72f8e9 Stanimir Varbanov 2020-04-23  629  				ctr->mastering.displa=
y_primaries_y[c];
9172652d72f8e9 Stanimir Varbanov 2020-04-23  630  		}
9172652d72f8e9 Stanimir Varbanov 2020-04-23  631  =

9172652d72f8e9 Stanimir Varbanov 2020-04-23  632  		hdr10.mastering.white_p=
oint_x =3D ctr->mastering.white_point_x;
9172652d72f8e9 Stanimir Varbanov 2020-04-23  633  		hdr10.mastering.white_p=
oint_y =3D ctr->mastering.white_point_y;
9172652d72f8e9 Stanimir Varbanov 2020-04-23  634  		hdr10.mastering.max_dis=
play_mastering_luminance =3D
9172652d72f8e9 Stanimir Varbanov 2020-04-23  635  			ctr->mastering.max_dis=
play_mastering_luminance;
9172652d72f8e9 Stanimir Varbanov 2020-04-23  636  		hdr10.mastering.min_dis=
play_mastering_luminance =3D
9172652d72f8e9 Stanimir Varbanov 2020-04-23  637  			ctr->mastering.min_dis=
play_mastering_luminance;
9172652d72f8e9 Stanimir Varbanov 2020-04-23  638  =

9172652d72f8e9 Stanimir Varbanov 2020-04-23  639  		hdr10.cll.max_content_l=
ight =3D ctr->cll.max_content_light_level;
9172652d72f8e9 Stanimir Varbanov 2020-04-23  640  		hdr10.cll.max_pic_avera=
ge_light =3D
9172652d72f8e9 Stanimir Varbanov 2020-04-23  641  			ctr->cll.max_pic_avera=
ge_light_level;
9172652d72f8e9 Stanimir Varbanov 2020-04-23  642  =

9172652d72f8e9 Stanimir Varbanov 2020-04-23  643  		ret =3D hfi_session_set=
_property(inst, ptype, &hdr10);
9172652d72f8e9 Stanimir Varbanov 2020-04-23  644  		if (ret)
9172652d72f8e9 Stanimir Varbanov 2020-04-23  645  			return ret;
9172652d72f8e9 Stanimir Varbanov 2020-04-23  646  	}
9172652d72f8e9 Stanimir Varbanov 2020-04-23  647  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  648  	if (ctr->num_b_frames) {
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  649  		u32 max_num_b_frames =
=3D NUM_B_FRAMES_MAX;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  650  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  651  		ptype =3D HFI_PROPERTY_=
PARAM_VENC_MAX_NUM_B_FRAMES;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  652  		ret =3D hfi_session_set=
_property(inst, ptype, &max_num_b_frames);
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  653  		if (ret)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  654  			return ret;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  655  	}
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  656  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  657  	ptype =3D HFI_PROPERTY_C=
ONFIG_VENC_INTRA_PERIOD;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  658  	intra_period.pframes =3D=
 ctr->num_p_frames;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  659  	intra_period.bframes =3D=
 ctr->num_b_frames;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  660  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  661  	ret =3D hfi_session_set_=
property(inst, ptype, &intra_period);
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  662  	if (ret)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  663  		return ret;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  664  =

6f704b2fbbde0c Jeffrey Kardatzke 2020-02-22  665  	if (!ctr->rc_enable)
6f704b2fbbde0c Jeffrey Kardatzke 2020-02-22  666  		rate_control =3D HFI_RA=
TE_CONTROL_OFF;
6f704b2fbbde0c Jeffrey Kardatzke 2020-02-22  667  	else if (ctr->bitrate_mo=
de =3D=3D V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
94dfb1689c25ed Stanimir Varbanov 2020-07-05  668  		rate_control =3D ctr->f=
rame_skip_mode ? HFI_RATE_CONTROL_VBR_VFR :
94dfb1689c25ed Stanimir Varbanov 2020-07-05  669  						      HFI_RATE_CONT=
ROL_VBR_CFR;
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  670  	else if (ctr->bitrate_mo=
de =3D=3D V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
94dfb1689c25ed Stanimir Varbanov 2020-07-05  671  		rate_control =3D ctr->f=
rame_skip_mode ? HFI_RATE_CONTROL_CBR_VFR :
94dfb1689c25ed Stanimir Varbanov 2020-07-05  672  						      HFI_RATE_CONT=
ROL_CBR_CFR;
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  673  	else if (ctr->bitrate_mo=
de =3D=3D V4L2_MPEG_VIDEO_BITRATE_MODE_CQ)
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  674  		rate_control =3D HFI_RA=
TE_CONTROL_CQ;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  675  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  676  	ptype =3D HFI_PROPERTY_P=
ARAM_VENC_RATE_CONTROL;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  677  	ret =3D hfi_session_set_=
property(inst, ptype, &rate_control);
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  678  	if (ret)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  679  		return ret;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  680  =

69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  681  	if (rate_control =3D=3D =
HFI_RATE_CONTROL_CQ && ctr->const_quality) {
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  682  		struct hfi_heic_frame_q=
uality quality =3D {};
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  683  =

69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  684  		ptype =3D HFI_PROPERTY_=
CONFIG_HEIC_FRAME_QUALITY;
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  685  		quality.frame_quality =
=3D ctr->const_quality;
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  686  		ret =3D hfi_session_set=
_property(inst, ptype, &quality);
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  687  		if (ret)
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  688  			return ret;
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  689  	}
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  690  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  691  	if (!ctr->bitrate)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  692  		bitrate =3D 64000;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  693  	else
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  694  		bitrate =3D ctr->bitrat=
e;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  695  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  696  	ptype =3D HFI_PROPERTY_C=
ONFIG_VENC_TARGET_BITRATE;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  697  	brate.bitrate =3D bitrat=
e;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  698  	brate.layer_id =3D 0;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  699  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  700  	ret =3D hfi_session_set_=
property(inst, ptype, &brate);
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  701  	if (ret)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  702  		return ret;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  703  =

002c22bd360e07 Dikshita Agarwal  2021-01-08  704  	if (inst->fmt_cap->pixfm=
t =3D=3D V4L2_PIX_FMT_H264 ||
002c22bd360e07 Dikshita Agarwal  2021-01-08  705  	    inst->fmt_cap->pixfm=
t =3D=3D V4L2_PIX_FMT_HEVC) {
002c22bd360e07 Dikshita Agarwal  2021-01-08  706  		ptype =3D HFI_PROPERTY_=
CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER;
002c22bd360e07 Dikshita Agarwal  2021-01-08  707  		if (ctr->header_mode =
=3D=3D V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE)
002c22bd360e07 Dikshita Agarwal  2021-01-08  708  			en.enable =3D 0;
002c22bd360e07 Dikshita Agarwal  2021-01-08  709  		else
002c22bd360e07 Dikshita Agarwal  2021-01-08  710  			en.enable =3D 1;
002c22bd360e07 Dikshita Agarwal  2021-01-08  711  =

002c22bd360e07 Dikshita Agarwal  2021-01-08  712  		ret =3D hfi_session_set=
_property(inst, ptype, &en);
002c22bd360e07 Dikshita Agarwal  2021-01-08  713  		if (ret)
002c22bd360e07 Dikshita Agarwal  2021-01-08  714  			return ret;
002c22bd360e07 Dikshita Agarwal  2021-01-08  715  	}
002c22bd360e07 Dikshita Agarwal  2021-01-08  716  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  717  	if (!ctr->bitrate_peak)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  718  		bitrate *=3D 2;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  719  	else
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  720  		bitrate =3D ctr->bitrat=
e_peak;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  721  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  722  	ptype =3D HFI_PROPERTY_C=
ONFIG_VENC_MAX_BITRATE;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  723  	brate.bitrate =3D bitrat=
e;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  724  	brate.layer_id =3D 0;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  725  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  726  	ret =3D hfi_session_set_=
property(inst, ptype, &brate);
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  727  	if (ret)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  728  		return ret;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  729  =

2123cbd687ca0c Kelvin Lawson     2018-11-29  730  	ptype =3D HFI_PROPERTY_P=
ARAM_VENC_SESSION_QP;
74c895974fd356 Dikshita Agarwal  2020-12-24  731  	if (inst->fmt_cap->pixfm=
t =3D=3D V4L2_PIX_FMT_HEVC) {
74c895974fd356 Dikshita Agarwal  2020-12-24  732  		quant.qp_i =3D ctr->hev=
c_i_qp;
74c895974fd356 Dikshita Agarwal  2020-12-24  733  		quant.qp_p =3D ctr->hev=
c_p_qp;
74c895974fd356 Dikshita Agarwal  2020-12-24  734  		quant.qp_b =3D ctr->hev=
c_b_qp;
74c895974fd356 Dikshita Agarwal  2020-12-24  735  	} else {
2123cbd687ca0c Kelvin Lawson     2018-11-29  736  		quant.qp_i =3D ctr->h26=
4_i_qp;
2123cbd687ca0c Kelvin Lawson     2018-11-29  737  		quant.qp_p =3D ctr->h26=
4_p_qp;
2123cbd687ca0c Kelvin Lawson     2018-11-29  738  		quant.qp_b =3D ctr->h26=
4_b_qp;
74c895974fd356 Dikshita Agarwal  2020-12-24  739  	}
2123cbd687ca0c Kelvin Lawson     2018-11-29  740  	quant.layer_id =3D 0;
2123cbd687ca0c Kelvin Lawson     2018-11-29  741  	ret =3D hfi_session_set_=
property(inst, ptype, &quant);
2123cbd687ca0c Kelvin Lawson     2018-11-29  742  	if (ret)
2123cbd687ca0c Kelvin Lawson     2018-11-29  743  		return ret;
2123cbd687ca0c Kelvin Lawson     2018-11-29  744  =

2123cbd687ca0c Kelvin Lawson     2018-11-29  745  	ptype =3D HFI_PROPERTY_P=
ARAM_VENC_SESSION_QP_RANGE;
74c895974fd356 Dikshita Agarwal  2020-12-24  746  	if (inst->fmt_cap->pixfm=
t =3D=3D V4L2_PIX_FMT_HEVC) {
74c895974fd356 Dikshita Agarwal  2020-12-24  747  		quant_range.min_qp =3D =
ctr->hevc_min_qp;
74c895974fd356 Dikshita Agarwal  2020-12-24  748  		quant_range.max_qp =3D =
ctr->hevc_max_qp;
74c895974fd356 Dikshita Agarwal  2020-12-24  749  	} else {
2123cbd687ca0c Kelvin Lawson     2018-11-29  750  		quant_range.min_qp =3D =
ctr->h264_min_qp;
2123cbd687ca0c Kelvin Lawson     2018-11-29  751  		quant_range.max_qp =3D =
ctr->h264_max_qp;
74c895974fd356 Dikshita Agarwal  2020-12-24  752  	}
2123cbd687ca0c Kelvin Lawson     2018-11-29  753  	quant_range.layer_id =3D=
 0;
2123cbd687ca0c Kelvin Lawson     2018-11-29  754  	ret =3D hfi_session_set_=
property(inst, ptype, &quant_range);
2123cbd687ca0c Kelvin Lawson     2018-11-29  755  	if (ret)
2123cbd687ca0c Kelvin Lawson     2018-11-29  756  		return ret;
2123cbd687ca0c Kelvin Lawson     2018-11-29  757  =

f2fb3f02abe2e6 Dikshita Agarwal  2021-03-24  758  	ptype =3D HFI_PROPERTY_P=
ARAM_VENC_LTRMODE;
f2fb3f02abe2e6 Dikshita Agarwal  2021-03-24  759  	ltr_mode.ltr_count =3D c=
tr->ltr_count;
f2fb3f02abe2e6 Dikshita Agarwal  2021-03-24  760  	ltr_mode.ltr_mode =3D HF=
I_LTR_MODE_MANUAL;
f2fb3f02abe2e6 Dikshita Agarwal  2021-03-24  761  	ltr_mode.trust_mode =3D =
1;
f2fb3f02abe2e6 Dikshita Agarwal  2021-03-24  762  	ret =3D hfi_session_set_=
property(inst, ptype, &ltr_mode);
f2fb3f02abe2e6 Dikshita Agarwal  2021-03-24  763  	if (ret)
f2fb3f02abe2e6 Dikshita Agarwal  2021-03-24  764  		return ret;
f2fb3f02abe2e6 Dikshita Agarwal  2021-03-24  765  =

a7a20f721e812a Stanimir Varbanov 2020-10-27  766  	switch (inst->hfi_codec)=
 {
a7a20f721e812a Stanimir Varbanov 2020-10-27  767  	case HFI_VIDEO_CODEC_H26=
4:
a7a20f721e812a Stanimir Varbanov 2020-10-27  768  		profile =3D ctr->profil=
e.h264;
a7a20f721e812a Stanimir Varbanov 2020-10-27  769  		level =3D ctr->level.h2=
64;
a7a20f721e812a Stanimir Varbanov 2020-10-27  770  		break;
a7a20f721e812a Stanimir Varbanov 2020-10-27  771  	case HFI_VIDEO_CODEC_MPE=
G4:
a7a20f721e812a Stanimir Varbanov 2020-10-27  772  		profile =3D ctr->profil=
e.mpeg4;
a7a20f721e812a Stanimir Varbanov 2020-10-27  773  		level =3D ctr->level.mp=
eg4;
a7a20f721e812a Stanimir Varbanov 2020-10-27  774  		break;
a7a20f721e812a Stanimir Varbanov 2020-10-27  775  	case HFI_VIDEO_CODEC_VP8:
a7a20f721e812a Stanimir Varbanov 2020-10-27  776  		profile =3D ctr->profil=
e.vp8;
a7a20f721e812a Stanimir Varbanov 2020-10-27  777  		level =3D 0;
a7a20f721e812a Stanimir Varbanov 2020-10-27  778  		break;
a7a20f721e812a Stanimir Varbanov 2020-10-27  779  	case HFI_VIDEO_CODEC_VP9:
a7a20f721e812a Stanimir Varbanov 2020-10-27  780  		profile =3D ctr->profil=
e.vp9;
a7a20f721e812a Stanimir Varbanov 2020-10-27  781  		level =3D ctr->level.vp=
9;
a7a20f721e812a Stanimir Varbanov 2020-10-27  782  		break;
a7a20f721e812a Stanimir Varbanov 2020-10-27  783  	case HFI_VIDEO_CODEC_HEV=
C:
a7a20f721e812a Stanimir Varbanov 2020-10-27  784  		profile =3D ctr->profil=
e.hevc;
a7a20f721e812a Stanimir Varbanov 2020-10-27  785  		level =3D ctr->level.he=
vc;
a7a20f721e812a Stanimir Varbanov 2020-10-27  786  		break;
a7a20f721e812a Stanimir Varbanov 2020-10-27  787  	case HFI_VIDEO_CODEC_MPE=
G2:
a7a20f721e812a Stanimir Varbanov 2020-10-27  788  	default:
a7a20f721e812a Stanimir Varbanov 2020-10-27  789  		profile =3D 0;
a7a20f721e812a Stanimir Varbanov 2020-10-27  790  		level =3D 0;
a7a20f721e812a Stanimir Varbanov 2020-10-27  791  		break;
a7a20f721e812a Stanimir Varbanov 2020-10-27  792  	}
a7a20f721e812a Stanimir Varbanov 2020-10-27  793  =

a7a20f721e812a Stanimir Varbanov 2020-10-27  794  	ret =3D venus_helper_set=
_profile_level(inst, profile, level);
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  795  	if (ret)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  796  		return ret;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  797  =

08c06797627935 Stanimir Varbanov 2020-11-24  798  	if (inst->fmt_cap->pixfm=
t =3D=3D V4L2_PIX_FMT_H264 ||
08c06797627935 Stanimir Varbanov 2020-11-24  799  	    inst->fmt_cap->pixfm=
t =3D=3D V4L2_PIX_FMT_HEVC) {
08c06797627935 Stanimir Varbanov 2020-11-24  800  		struct hfi_enable en =
=3D {};
08c06797627935 Stanimir Varbanov 2020-11-24  801  =

08c06797627935 Stanimir Varbanov 2020-11-24  802  		ptype =3D HFI_PROPERTY_=
PARAM_VENC_H264_GENERATE_AUDNAL;
08c06797627935 Stanimir Varbanov 2020-11-24  803  =

08c06797627935 Stanimir Varbanov 2020-11-24  804  		if (ctr->aud_enable)
08c06797627935 Stanimir Varbanov 2020-11-24  805  			en.enable =3D 1;
08c06797627935 Stanimir Varbanov 2020-11-24  806  =

08c06797627935 Stanimir Varbanov 2020-11-24 @807  		ret =3D hfi_session_set=
_property(inst, ptype, &en);
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  808  	}
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  809  =

f7a3d3dc5831df Stanimir Varbanov 2021-06-22  810  	if ((inst->fmt_cap->pixf=
mt =3D=3D V4L2_PIX_FMT_H264 ||
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  811  	     inst->fmt_cap->pixf=
mt =3D=3D V4L2_PIX_FMT_HEVC) &&
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  812  	    (rate_control =3D=3D=
 HFI_RATE_CONTROL_CBR_VFR ||
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  813  	     rate_control =3D=3D=
 HFI_RATE_CONTROL_CBR_CFR)) {
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  814  		intra_refresh.mode =3D =
HFI_INTRA_REFRESH_NONE;
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  815  		intra_refresh.cir_mbs =
=3D 0;
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  816  =

f7a3d3dc5831df Stanimir Varbanov 2021-06-22  817  		if (ctr->intra_refresh_=
period) {
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  818  			u32 mbs;
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  819  =

f7a3d3dc5831df Stanimir Varbanov 2021-06-22  820  			mbs =3D ALIGN(inst->wi=
dth, 16) * ALIGN(inst->height, 16);
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  821  			mbs /=3D 16 * 16;
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  822  			if (mbs % ctr->intra_r=
efresh_period)
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  823  				mbs++;
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  824  			mbs /=3D ctr->intra_re=
fresh_period;
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  825  =

f7a3d3dc5831df Stanimir Varbanov 2021-06-22  826  			intra_refresh.mode =3D=
 HFI_INTRA_REFRESH_RANDOM;
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  827  			intra_refresh.cir_mbs =
=3D mbs;
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  828  		}
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  829  =

f7a3d3dc5831df Stanimir Varbanov 2021-06-22  830  		ptype =3D HFI_PROPERTY_=
PARAM_VENC_INTRA_REFRESH;
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  831  =

f7a3d3dc5831df Stanimir Varbanov 2021-06-22  832  		ret =3D hfi_session_set=
_property(inst, ptype, &intra_refresh);
08c06797627935 Stanimir Varbanov 2020-11-24  833  		if (ret)
08c06797627935 Stanimir Varbanov 2020-11-24  834  			return ret;
08c06797627935 Stanimir Varbanov 2020-11-24  835  	}
08c06797627935 Stanimir Varbanov 2020-11-24  836  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  837  	return 0;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  838  }
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  839  =


:::::: The code at line 807 was first introduced by commit
:::::: 08c06797627935d48621359eb95ab8a69d70d5c5 media: venus: venc: Add sup=
port for AUD NALU control

:::::: TO: Stanimir Varbanov <stanimir.varbanov@linaro.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1922310793506240912==--

