Content-Type: multipart/mixed; boundary="===============7530626676987326089=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/sun4i/sun4i_tv.c:491:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119...
Date: Sat, 18 Dec 2021 09:58:42 +0800
Message-ID: <202112180957.qAxTLE5H-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7530626676987326089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Nikita Shubin <nikita.shubin@maquefel.me>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Alexander Sverdlin <alexander.sverdlin@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6441998e2e37131b0a4c310af9156d79d3351c16
commit: 9645ccc7bd7a16cd73c3be9dee70cd702b03be37 ep93xx: clock: convert in-=
place to COMMON_CLK
date:   8 weeks ago
:::::: branch date: 26 hours ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-c002-20211209 (https://download.01.org/0day-ci/archi=
ve/20211218/202112180957.qAxTLE5H-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9645ccc7bd7a16cd73c3be9dee70cd702b03be37
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9645ccc7bd7a16cd73c3be9dee70cd702b03be37
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/btrfs/ref-verify.c:255:3: note: Memory is released
                   kfree(ra);
                   ^~~~~~~~~
   fs/btrfs/ref-verify.c:251:2: note: Loop condition is true.  Entering loo=
p body
           while (!list_empty(&be->actions)) {
           ^
   fs/btrfs/ref-verify.c:252:8: note: Left side of '&&' is false
                   ra =3D list_first_entry(&be->actions, struct ref_action,
                        ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/btrfs/ref-verify.c:252:8: note: Taking false branch
                   ra =3D list_first_entry(&be->actions, struct ref_action,
                        ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/btrfs/ref-verify.c:252:8: note: Loop condition is false.  Exiting loop
                   ra =3D list_first_entry(&be->actions, struct ref_action,
                        ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/btrfs/ref-verify.c:254:3: note: Calling 'list_del'
                   list_del(&ra->list);
                   ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:146:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:132:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:135:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/gpu/drm/sun4i/sun4i_tv.c:491:3: warning: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strc=
py]
                   strcpy(mode->name, tv_mode->name);
                   ^~~~~~
   drivers/gpu/drm/sun4i/sun4i_tv.c:491:3: note: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119
                   strcpy(mode->name, tv_mode->name);
                   ^~~~~~
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:149:2: warning: Value stored to '=
val' is never read [clang-analyzer-deadcode.DeadStores]
           val =3D readl(hdmi->base + SUN4I_HDMI_PAD_CTRL1_REG);
           ^
   drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:149:2: note: Value stored to 'val=
' is never read
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/slimbus/messaging.c:323:3: warning: Undefined or garbage value r=
eturned to caller [clang-analyzer-core.uninitialized.UndefReturn]
                   return buf;
                   ^      ~~~
   drivers/slimbus/messaging.c:317:2: note: 'buf' declared without an initi=
al value
           u8 buf;
           ^~~~~~
   drivers/slimbus/messaging.c:319:8: note: Calling 'slim_read'
           ret =3D slim_read(sdev, addr, 1, &buf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:300:2: note: Calling 'slim_fill_msg'
           slim_fill_msg(&msg, addr, count, val, NULL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:282:1: note: Returning without writing to 'm=
sg->rbuf'
   }
   ^
   drivers/slimbus/messaging.c:300:2: note: Returning from 'slim_fill_msg'
           slim_fill_msg(&msg, addr, count, val, NULL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:302:9: note: Calling 'slim_xfer_msg'
           return slim_xfer_msg(sdev, &msg, SLIM_MSG_MC_REQUEST_VALUE);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:242:6: note: Assuming 'ctrl' is non-null
           if (!ctrl)
               ^~~~~
   drivers/slimbus/messaging.c:242:2: note: Taking false branch
           if (!ctrl)
           ^
   drivers/slimbus/messaging.c:245:8: note: Calling 'slim_val_inf_sanity'
           ret =3D slim_val_inf_sanity(ctrl, msg, mc);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:182:7: note: 'msg' is non-null
           if (!msg || msg->num_bytes > 16 ||
                ^~~
   drivers/slimbus/messaging.c:182:6: note: Left side of '||' is false
           if (!msg || msg->num_bytes > 16 ||
               ^
   drivers/slimbus/messaging.c:182:19: note: Field 'num_bytes' is <=3D 16
           if (!msg || msg->num_bytes > 16 ||
                            ^
   drivers/slimbus/messaging.c:182:6: note: Left side of '||' is false
           if (!msg || msg->num_bytes > 16 ||
               ^
   drivers/slimbus/messaging.c:183:6: note: Assuming the condition is false
               (msg->start_offset + msg->num_bytes) > 0xC00)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:182:2: note: Taking false branch
           if (!msg || msg->num_bytes > 16 ||
           ^
   drivers/slimbus/messaging.c:185:2: note: Control jumps to 'case 96:'  at=
 line 186
           switch (mc) {
           ^
   drivers/slimbus/messaging.c:188:12: note: Field 'rbuf' is not equal to N=
ULL
--
           ^
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->f=
d'
           return res;
           ^
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->f=
d'
           return n;
           ^
   fs/select.c:993:7: note: Returning from 'copy_from_user'
                   if (copy_from_user(walk->entries, ufds + nfds-todo,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/select.c:993:3: note: Taking false branch
                   if (copy_from_user(walk->entries, ufds + nfds-todo,
                   ^
   fs/select.c:998:8: note: 'todo' is 0
                   if (!todo)
                        ^~~~
   fs/select.c:998:3: note: Taking true branch
                   if (!todo)
                   ^
   fs/select.c:999:4: note:  Execution continues on line 1010
                           break;
                           ^
   fs/select.c:1011:12: note: Calling 'do_poll'
           fdcount =3D do_poll(head, &table, end_time);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/select.c:888:23: note: '?' condition is false
           __poll_t busy_flag =3D net_busy_loop_on() ? POLL_BUSY_LOOP : 0;
                                ^
   fs/select.c:892:6: note: 'end_time' is null
           if (end_time && !end_time->tv_sec && !end_time->tv_nsec) {
               ^~~~~~~~
   fs/select.c:892:15: note: Left side of '&&' is false
           if (end_time && !end_time->tv_sec && !end_time->tv_nsec) {
                        ^
   fs/select.c:897:6: note: 'end_time' is null
           if (end_time && !timed_out)
               ^~~~~~~~
   fs/select.c:897:15: note: Left side of '&&' is false
           if (end_time && !timed_out)
                        ^
   fs/select.c:900:2: note: Loop condition is true.  Entering loop body
           for (;;) {
           ^
   fs/select.c:904:3: note: Loop condition is true.  Entering loop body
                   for (walk =3D list; walk !=3D NULL; walk =3D walk->next)=
 {
                   ^
   fs/select.c:909:11: note: 'pfd' is not equal to 'pfd_end'
                           for (; pfd !=3D pfd_end; pfd++) {
                                  ^~~
   fs/select.c:909:4: note: Loop condition is true.  Entering loop body
                           for (; pfd !=3D pfd_end; pfd++) {
                           ^
   fs/select.c:917:9: note: Calling 'do_pollfd'
                                   if (do_pollfd(pfd, pt, &can_busy_loop,
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/select.c:855:2: note: Assigned value is garbage or undefined
           int fd =3D pollfd->fd;
           ^        ~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/gpu/drm/sun4i/sun4i_tcon.c:1426:2: warning: Value stored to 'id'=
 is never read [clang-analyzer-deadcode.DeadStores]
           id =3D sun4i_tcon_of_get_id_from_port(port);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/sun4i/sun4i_tcon.c:1426:2: note: Value stored to 'id' is=
 never read
           id =3D sun4i_tcon_of_get_id_from_port(port);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/crypto/hisilicon/sec/sec_algs.c:214:32: warning: Access to field=
 'entry_sum_in_sgl' results in a dereference of a null pointer (loaded from=
 variable 'sgl_current') [clang-analyzer-core.NullDereference]
           sgl_current->entry_sum_in_sgl =3D count % SEC_MAX_SGE_NUM;
                                         ^
   drivers/crypto/hisilicon/sec/sec_algs.c:869:9: note: Calling 'sec_alg_sk=
cipher_crypto'
           return sec_alg_skcipher_crypto(req, false);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/hisilicon/sec/sec_algs.c:723:15: note: Assuming field 'sr=
c' is equal to field 'dst'
           bool split =3D skreq->src !=3D skreq->dst;
                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/hisilicon/sec/sec_algs.c:724:14: note: Assuming the condi=
tion is false
           gfp_t gfp =3D skreq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ? GFP=
_KERNEL : GFP_ATOMIC;
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/hisilicon/sec/sec_algs.c:724:14: note: '?' condition is f=
alse
   drivers/crypto/hisilicon/sec/sec_algs.c:726:2: note: Loop condition is f=
alse.  Exiting loop
           mutex_init(&sec_req->lock);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/crypto/hisilicon/sec/sec_algs.c:732:8: note: Calling 'sec_alg_al=
loc_and_calc_split_sizes'
           ret =3D sec_alg_alloc_and_calc_split_sizes(skreq->cryptlen, &spl=
it_sizes,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/crypto/hisilicon/sec/sec_algs.c:557:6: note: Assuming 'sizes' is=
 non-null
           if (!sizes)
               ^~~~~~
   drivers/crypto/hisilicon/sec/sec_algs.c:557:2: note: Taking false branch
           if (!sizes)
           ^
   drivers/crypto/hisilicon/sec/sec_algs.c:560:14: note: Assuming the condi=
tion is false
           for (i =3D 0; i < *steps - 1; i++)
                       ^~~~~~~~~~~~~~
   drivers/crypto/hisilicon/sec/sec_algs.c:560:2: note: Loop condition is f=
alse. Execution continues on line 562
           for (i =3D 0; i < *steps - 1; i++)
           ^
   drivers/crypto/hisilicon/sec/sec_algs.c:565:2: note: Returning zero, whi=
ch participates in a condition later
           return 0;
           ^~~~~~~~
   drivers/crypto/hisilicon/sec/sec_algs.c:732:8: note: Returning from 'sec=
_alg_alloc_and_calc_split_sizes'
           ret =3D sec_alg_alloc_and_calc_split_sizes(skreq->cryptlen, &spl=
it_sizes,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/crypto/hisilicon/sec/sec_algs.c:734:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/crypto/hisilicon/sec/sec_algs.c:734:2: note: Taking false branch
           if (ret)
           ^
   drivers/crypto/hisilicon/sec/sec_algs.c:737:8: note: Calling 'sec_map_an=
d_split_sg'
           ret =3D sec_map_and_split_sg(skreq->src, split_sizes, steps, &sp=
lits_in,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/crypto/hisilicon/sec/sec_algs.c:577:6: note: Assuming 'count' is=
 not equal to 0
           if (!count)
               ^~~~~~
   drivers/crypto/hisilicon/sec/sec_algs.c:577:2: note: Taking false branch
           if (!count)
           ^
   drivers/crypto/hisilicon/sec/sec_algs.c:581:6: note: Assuming the condit=
ion is false
           if (!*splits) {
               ^~~~~~~~
   drivers/crypto/hisilicon/sec/sec_algs.c:581:2: note: Taking false branch
           if (!*splits) {
           ^
   drivers/crypto/hisilicon/sec/sec_algs.c:586:6: note: Assuming the condit=
ion is false
           if (!*splits_nents) {
               ^~~~~~~~~~~~~~
   drivers/crypto/hisilicon/sec/sec_algs.c:586:2: note: Taking false branch
           if (!*splits_nents) {
           ^
   drivers/crypto/hisilicon/sec/sec_algs.c:592:8: note: Assigning value, wh=
ich participates in a condition later
           ret =3D sg_split(sgl, count, 0, steps, split_sizes,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/hisilicon/sec/sec_algs.c:594:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/crypto/hisilicon/sec/sec_algs.c:594:2: note: Taking false branch
           if (ret) {
           ^
   drivers/crypto/hisilicon/sec/sec_algs.c:599:2: note: Returning zero, whi=
ch participates in a condition later
           return 0;
           ^~~~~~~~
   drivers/crypto/hisilicon/sec/sec_algs.c:737:8: note: Returning from 'sec=
_map_and_split_sg'
           ret =3D sec_map_and_split_sg(skreq->src, split_sizes, steps, &sp=
lits_in,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/crypto/hisilicon/sec/sec_algs.c:740:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/crypto/hisilicon/sec/sec_algs.c:740:2: note: Taking false branch
--
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/drm_syncobj.c:462:32: note: Loop condition is false.  Ex=
iting loop
           struct drm_syncobj *syncobj =3D container_of(kref,
                                         ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/drm_syncobj.c:466:2: note: Memory is released
           kfree(syncobj);
           ^~~~~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   include/drm/drm_syncobj.h:88:2: note: Returning; memory was released
           kref_put(&obj->refcount, drm_syncobj_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:539:3: note: Returning; memory was release=
d via 1st parameter
                   drm_syncobj_put(syncobj);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:558:8: note: Returning; memory was release=
d via 2nd parameter
           ret =3D drm_syncobj_get_handle(file_private, syncobj, handle);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:559:2: note: Use of memory after it is fre=
ed
           drm_syncobj_put(syncobj);
           ^               ~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   fs/ntfs/compress.c:164:6: warning: Value stored to 'cb_sb_start' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           u8 *cb_sb_start =3D cb;   /* Beginning of the current sb in the =
cb. */
               ^~~~~~~~~~~   ~~
   fs/ntfs/compress.c:164:6: note: Value stored to 'cb_sb_start' during its=
 initialization is never read
           u8 *cb_sb_start =3D cb;   /* Beginning of the current sb in the =
cb. */
               ^~~~~~~~~~~   ~~
   fs/ntfs/compress.c:810:4: warning: Value stored to 'cb_pos' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           cb_pos +=3D cb_max_ofs - cur_ofs;
                           ^         ~~~~~~~~~~~~~~~~~~~~
   fs/ntfs/compress.c:810:4: note: Value stored to 'cb_pos' is never read
                           cb_pos +=3D cb_max_ofs - cur_ofs;
                           ^         ~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/mailbox/bcm-pdc-mailbox.c:523:17: warning: Value stored to 'dev'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct device *dev =3D &pdcs->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mailbox/bcm-pdc-mailbox.c:523:17: note: Value stored to 'dev' du=
ring its initialization is never read
           struct device *dev =3D &pdcs->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mailbox/bcm-pdc-mailbox.c:551:17: warning: Value stored to 'dev'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct device *dev =3D &pdcs->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mailbox/bcm-pdc-mailbox.c:551:17: note: Value stored to 'dev' du=
ring its initialization is never read
           struct device *dev =3D &pdcs->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mailbox/bcm-pdc-mailbox.c:989:17: warning: Value stored to 'dev'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct device *dev =3D &pdcs->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mailbox/bcm-pdc-mailbox.c:989:17: note: Value stored to 'dev' du=
ring its initialization is never read
           struct device *dev =3D &pdcs->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mailbox/bcm-pdc-mailbox.c:1287:2: warning: Value stored to 'dev'=
 is never read [clang-analyzer-deadcode.DeadStores]
           dev =3D &pdev->dev;
           ^     ~~~~~~~~~~
   drivers/mailbox/bcm-pdc-mailbox.c:1287:2: note: Value stored to 'dev' is=
 never read
           dev =3D &pdev->dev;
           ^     ~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/media/platform/exynos4-is/fimc-core.c:803:4: warning: Value stor=
ed to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D PTR_ERR(fimc->clock[i]);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-core.c:803:4: note: Value stored =
to 'ret' is never read
                           ret =3D PTR_ERR(fimc->clock[i]);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/media/platform/exynos4-is/fimc-m2m.c:467:20: warning: Division b=
y zero [clang-analyzer-core.DivideZero]
                                 halign, 64/(ALIGN(depth, 8)));
                                           ^
   drivers/media/platform/exynos4-is/fimc-m2m.c:488:25: note: Left side of =
'&&' is true
           struct fimc_ctx *ctx =3D fh_to_ctx(fh);
                                  ^
   drivers/media/platform/exynos4-is/fimc-core.h:499:25: note: expanded fro=
m macro 'fh_to_ctx'
   #define fh_to_ctx(__fh) container_of(__fh, struct fimc_ctx, fh)
                           ^
   include/linux/kernel.h:495:19: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                            ^
   drivers/media/platform/exynos4-is/fimc-m2m.c:488:25: note: Taking false =
branch
           struct fimc_ctx *ctx =3D fh_to_ctx(fh);
                                  ^
   drivers/media/platform/exynos4-is/fimc-core.h:499:25: note: expanded fro=
m macro 'fh_to_ctx'
   #define fh_to_ctx(__fh) container_of(__fh, struct fimc_ctx, fh)
                           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/media/platform/exynos4-is/fimc-m2m.c:488:25: note: Loop conditio=
n is false.  Exiting loop
           struct fimc_ctx *ctx =3D fh_to_ctx(fh);
                                  ^
   drivers/media/platform/exynos4-is/fimc-core.h:499:25: note: expanded fro=
m macro 'fh_to_ctx'
   #define fh_to_ctx(__fh) container_of(__fh, struct fimc_ctx, fh)
                           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/media/platform/exynos4-is/fimc-m2m.c:493:8: note: Calling 'fimc_=
m2m_try_selection'
           ret =3D fimc_m2m_try_selection(ctx, s);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-m2m.c:435:6: note: Assuming field=
 'top' is >=3D 0
           if (s->r.top < 0 || s->r.left < 0) {
               ^~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-m2m.c:435:6: note: Left side of '=
||' is false
   drivers/media/platform/exynos4-is/fimc-m2m.c:435:22: note: Assuming fiel=
d 'left' is >=3D 0
           if (s->r.top < 0 || s->r.left < 0) {
                               ^~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-m2m.c:435:2: note: Taking false b=
ranch
           if (s->r.top < 0 || s->r.left < 0) {
           ^
   drivers/media/platform/exynos4-is/fimc-m2m.c:440:6: note: Assuming field=
 'type' is equal to V4L2_BUF_TYPE_VIDEO_CAPTURE
           if (s->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-m2m.c:440:2: note: Taking true br=
anch
           if (s->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE) {
           ^
   drivers/media/platform/exynos4-is/fimc-m2m.c:442:7: note: Assuming field=
 'target' is equal to V4L2_SEL_TGT_COMPOSE
                   if (s->target !=3D V4L2_SEL_TGT_COMPOSE)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-m2m.c:442:3: note: Taking false b=
ranch
                   if (s->target !=3D V4L2_SEL_TGT_COMPOSE)
                   ^
   drivers/media/platform/exynos4-is/fimc-m2m.c:452:13: note: '?' condition=
 is false
           min_size =3D (f =3D=3D &ctx->s_frame) ?
                      ^
   drivers/media/platform/exynos4-is/fimc-m2m.c:456:6: note: Assuming field=
 'min_vsize_align' is equal to 1
           if (fimc->variant->min_vsize_align =3D=3D 1)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-m2m.c:456:2: note: Taking true br=
anch
           if (fimc->variant->min_vsize_align =3D=3D 1)
           ^
   drivers/media/platform/exynos4-is/fimc-m2m.c:457:12: note: Assuming the =
condition is false
                   halign =3D fimc_fmt_is_rgb(f->fmt->color) ? 0 : 1;
                            ^
   drivers/media/platform/exynos4-is/fimc-core.h:113:30: note: expanded fro=
m macro 'fimc_fmt_is_rgb'
   #define fimc_fmt_is_rgb(x) (!!((x) & 0x10))
                                ^~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-m2m.c:457:12: note: '?' condition=
 is true
                   halign =3D fimc_fmt_is_rgb(f->fmt->color) ? 0 : 1;
                            ^
   drivers/media/platform/exynos4-is/fimc-core.h:113:28: note: expanded fro=
m macro 'fimc_fmt_is_rgb'
   #define fimc_fmt_is_rgb(x) (!!((x) & 0x10))
                              ^
   drivers/media/platform/exynos4-is/fimc-m2m.c:461:14: note: Assuming 'i' =
is >=3D field 'memplanes'
--
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:379:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   drivers/media/dvb-frontends/drxk_hard.c:3191:3: note: '?' condition is t=
rue
                   pr_err("Error %d on %s\n", status, __func__);
                   ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:383:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   drivers/media/dvb-frontends/drxk_hard.c:3191:3: note: Loop condition is =
false.  Exiting loop
                   pr_err("Error %d on %s\n", status, __func__);
                   ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:369:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   drivers/media/dvb-frontends/drxk_hard.c:3192:2: note: Returning without =
writing to '*packet_err'
           return status;
           ^
   drivers/media/dvb-frontends/drxk_hard.c:6685:2: note: Returning from 'dv=
btqam_get_acc_pkt_err'
           dvbtqam_get_acc_pkt_err(state, &err);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:6686:12: note: Assigned value is=
 garbage or undefined
           *ucblocks =3D (u32) err;
                     ^ ~~~~~~~~~
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   mm/vmalloc.c:298:2: warning: Value stored to 'start' is never read [clan=
g-analyzer-deadcode.DeadStores]
           start =3D addr;
           ^       ~~~~
   mm/vmalloc.c:298:2: note: Value stored to 'start' is never read
           start =3D addr;
           ^       ~~~~
   mm/vmalloc.c:580:18: warning: Value stored to 'nr' during its initializa=
tion is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int i, nr =3D (end - addr) >> PAGE_SHIFT;
                           ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmalloc.c:580:18: note: Value stored to 'nr' during its initializatio=
n is never read
           unsigned int i, nr =3D (end - addr) >> PAGE_SHIFT;
                           ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/gpu/drm/vc4/vc4_bo.c:358:2: warning: Value stored to 'size' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           size =3D roundup(size, PAGE_SIZE);
           ^
   drivers/gpu/drm/vc4/vc4_bo.c:358:2: note: Value stored to 'size' is neve=
r read
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/hwmon/lm73.c:76:62: warning: The result of the left shift is und=
efined because the left operand is negative [clang-analyzer-core.UndefinedB=
inaryOperatorResult]
           value =3D clamp_val(temp / 250, LM73_TEMP_MIN, LM73_TEMP_MAX) <<=
 5;
                                                                       ^
   drivers/hwmon/lm73.c:65:41: note: Left side of '&&' is false
           struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
                                                  ^
   include/linux/hwmon-sysfs.h:17:2: note: expanded from macro 'to_sensor_d=
ev_attr'
           container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/hwmon/lm73.c:65:41: note: Taking false branch
           struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
                                                  ^
   include/linux/hwmon-sysfs.h:17:2: note: expanded from macro 'to_sensor_d=
ev_attr'
           container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/hwmon/lm73.c:65:41: note: Loop condition is false.  Exiting loop
           struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
                                                  ^
   include/linux/hwmon-sysfs.h:17:2: note: expanded from macro 'to_sensor_d=
ev_attr'
           container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
--
                       ^   ~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/media/dvb-frontends/tda10071.c:42:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:42:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:92:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:92:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:137:21: warning: Value stored to =
'client' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:137:21: note: Value stored to 'cl=
ient' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:183:21: warning: Value stored to =
'client' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:183:21: note: Value stored to 'cl=
ient' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:243:21: warning: Value stored to =
'client' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:243:21: note: Value stored to 'cl=
ient' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:303:21: warning: Value stored to =
'client' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:303:21: note: Value stored to 'cl=
ient' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:366:21: warning: Value stored to =
'client' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:366:21: note: Value stored to 'cl=
ient' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:550:21: warning: Value stored to =
'client' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:550:21: note: Value stored to 'cl=
ient' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:696:21: warning: Value stored to =
'client' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:696:21: note: Value stored to 'cl=
ient' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:1041:21: warning: Value stored to=
 'client' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:1041:21: note: Value stored to 'c=
lient' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/usb/chipidea/otg_fsm.c:42:2: warning: Value stored to 'next' is =
never read [clang-analyzer-deadcode.DeadStores]
           next +=3D t;
           ^       ~
   drivers/usb/chipidea/otg_fsm.c:42:2: note: Value stored to 'next' is nev=
er read
           next +=3D t;
           ^       ~
   drivers/usb/chipidea/otg_fsm.c:91:2: warning: Value stored to 'next' is =
never read [clang-analyzer-deadcode.DeadStores]
           next +=3D t;
           ^       ~
   drivers/usb/chipidea/otg_fsm.c:91:2: note: Value stored to 'next' is nev=
er read
           next +=3D t;
           ^       ~
   drivers/usb/chipidea/otg_fsm.c:131:2: warning: Value stored to 'next' is=
 never read [clang-analyzer-deadcode.DeadStores]
           next +=3D t;
           ^       ~
   drivers/usb/chipidea/otg_fsm.c:131:2: note: Value stored to 'next' is ne=
ver read
           next +=3D t;
           ^       ~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> sound/soc/sh/rcar/adg.c:270:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/adg.c:270:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/adg.c:333:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/adg.c:333:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   include/sound/pcm.h:683:20: warning: Access to field 'frame_bits' result=
s in a dereference of a null pointer (loaded from variable 'runtime') [clan=
g-analyzer-core.NullDereference]
           return size * 8 / runtime->frame_bits;
                             ^
   sound/soc/sh/rcar/ssi.c:932:25: note: Left side of '&&' is false
           struct rsnd_ssi *ssi =3D rsnd_mod_to_ssi(mod);
                                  ^
   sound/soc/sh/rcar/ssi.c:112:31: note: expanded from macro 'rsnd_mod_to_s=
si'
   #define rsnd_mod_to_ssi(_mod) container_of((_mod), struct rsnd_ssi, mod)
                                 ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   sound/soc/sh/rcar/ssi.c:932:25: note: Taking false branch
           struct rsnd_ssi *ssi =3D rsnd_mod_to_ssi(mod);
                                  ^
   sound/soc/sh/rcar/ssi.c:112:31: note: expanded from macro 'rsnd_mod_to_s=
si'
   #define rsnd_mod_to_ssi(_mod) container_of((_mod), struct rsnd_ssi, mod)
                                 ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   sound/soc/sh/rcar/ssi.c:932:25: note: Loop condition is false.  Exiting =
loop
           struct rsnd_ssi *ssi =3D rsnd_mod_to_ssi(mod);
                                  ^
   sound/soc/sh/rcar/ssi.c:112:31: note: expanded from macro 'rsnd_mod_to_s=
si'
   #define rsnd_mod_to_ssi(_mod) container_of((_mod), struct rsnd_ssi, mod)
                                 ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   sound/soc/sh/rcar/ssi.c:933:36: note: Assuming field 'substream' is null
           struct snd_pcm_runtime *runtime =3D rsnd_io_to_runtime(io);
                                             ^
   sound/soc/sh/rcar/rsnd.h:529:33: note: expanded from macro 'rsnd_io_to_r=
untime'
   #define rsnd_io_to_runtime(io) ((io)->substream ? \
                                   ^~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:933:36: note: '?' condition is false
           struct snd_pcm_runtime *runtime =3D rsnd_io_to_runtime(io);
                                             ^
   sound/soc/sh/rcar/rsnd.h:529:33: note: expanded from macro 'rsnd_io_to_r=
untime'
   #define rsnd_io_to_runtime(io) ((io)->substream ? \
                                   ^
   sound/soc/sh/rcar/ssi.c:933:2: note: 'runtime' initialized to a null poi=
nter value
           struct snd_pcm_runtime *runtime =3D rsnd_io_to_runtime(io);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:935:38: note: Left side of '||' is false
           *pointer =3D bytes_to_frames(runtime, READ_ONCE(ssi->byte_pos));
                                               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   sound/soc/sh/rcar/ssi.c:935:38: note: Left side of '||' is false
           *pointer =3D bytes_to_frames(runtime, READ_ONCE(ssi->byte_pos));
                                               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   sound/soc/sh/rcar/ssi.c:935:38: note: Left side of '||' is true
           *pointer =3D bytes_to_frames(runtime, READ_ONCE(ssi->byte_pos));
                                               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:291:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   sound/soc/sh/rcar/ssi.c:935:38: note: Taking false branch
           *pointer =3D bytes_to_frames(runtime, READ_ONCE(ssi->byte_pos));
                                               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   sound/soc/sh/rcar/ssi.c:935:38: note: Loop condition is false.  Exiting =
loop
           *pointer =3D bytes_to_frames(runtime, READ_ONCE(ssi->byte_pos));
                                               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   sound/soc/sh/rcar/ssi.c:935:29: note: Passing null pointer value via 1st=
 parameter 'runtime'
           *pointer =3D bytes_to_frames(runtime, READ_ONCE(ssi->byte_pos));
                                      ^~~~~~~
   sound/soc/sh/rcar/ssi.c:935:13: note: Calling 'bytes_to_frames'
           *pointer =3D bytes_to_frames(runtime, READ_ONCE(ssi->byte_pos));
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/pcm.h:683:20: note: Access to field 'frame_bits' results i=
n a dereference of a null pointer (loaded from variable 'runtime')
           return size * 8 / runtime->frame_bits;
                             ^~~~~~~
>> sound/soc/sh/rcar/ssi.c:365:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/ssi.c:365:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   mm/mmap.c:1978:2: warning: Value stored to 'gap_end' is never read [clan=
g-analyzer-deadcode.DeadStores]
           gap_end =3D ULONG_MAX;  /* Only for VM_BUG_ON below */
           ^
   mm/mmap.c:1978:2: note: Value stored to 'gap_end' is never read
   mm/mmap.c:3246:3: warning: Value stored to 'faulted_in_anon_vma' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   faulted_in_anon_vma =3D false;
                   ^                     ~~~~~
   mm/mmap.c:3246:3: note: Value stored to 'faulted_in_anon_vma' is never r=
ead
                   faulted_in_anon_vma =3D false;
                   ^                     ~~~~~
   mm/mmap.c:3688:2: warning: Value stored to 'ret' is never read [clang-an=
alyzer-deadcode.DeadStores]
           ret =3D percpu_counter_init(&vm_committed_as, 0, GFP_KERNEL);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mmap.c:3688:2: note: Value stored to 'ret' is never read
           ret =3D percpu_counter_init(&vm_committed_as, 0, GFP_KERNEL);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   mm/mmu_gather.c:85:3: warning: Value stored to 'batch' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   batch =3D tlb->active;
                   ^       ~~~~~~~~~~~
   mm/mmu_gather.c:85:3: note: Value stored to 'batch' is never read
                   batch =3D tlb->active;
                   ^       ~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   sound/soc/kirkwood/kirkwood-i2s.c:322:2: warning: Value stored to 'value=
' is never read [clang-analyzer-deadcode.DeadStores]
           value =3D readl(priv->io + KIRKWOOD_RECCTL);
           ^
   sound/soc/kirkwood/kirkwood-i2s.c:322:2: note: Value stored to 'value' i=
s never read
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/media/dvb-frontends/cxd2820r_t2.c:14:21: warning: Value stored t=
o 'client' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t2.c:14:21: note: Value stored to '=
client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t2.c:160:21: warning: Value stored =
to 'client' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t2.c:160:21: note: Value stored to =
'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t2.c:279:21: warning: Value stored =
to 'client' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t2.c:279:21: note: Value stored to =
'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t2.c:387:21: warning: Value stored =
to 'client' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t2.c:387:21: note: Value stored to =
'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/hwmon/ad7314.c:37:8: warning: Excessive padding in 'struct ad731=
4_data' (58 padding bytes, where 26 is optimal). =

   Optimal fields order: =

   rx, =

--
   hash_len, =

   key_params, =

   setkey_comp, =

   is_hmac, =

   digest_buff, =

   opad_tmp_keys_buff, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct cc_hash_ctx {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/crypto/ccree/cc_hash.c:83:8: note: Excessive padding in 'struct =
cc_hash_ctx' (43 padding bytes, where 11 is optimal). Optimal fields order:=
 opad_tmp_keys_dma_addr, drvdata, digest_buff_dma_addr, hash_mode, hw_mode,=
 inter_digestsize, hash_len, key_params, setkey_comp, is_hmac, digest_buff,=
 opad_tmp_keys_buff, consider reordering the fields or adding explicit padd=
ing members
   struct cc_hash_ctx {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/crypto/ccree/cc_hash.c:1144:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_hash.c:1144:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_hash.c:1558:8: warning: Excessive padding in 'st=
ruct cc_hash_template' (34 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   template_ahash, =

   blocksize, =

   hash_mode, =

   hw_mode, =

   inter_digestsize, =

   drvdata, =

   min_hw_rev, =

   std_body, =

   is_mac, =

   synchronize, =

   name, =

   driver_name, =

   mac_name, =

   mac_driver_name, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct cc_hash_template {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_hash.c:1558:8: note: Excessive padding in 'struc=
t cc_hash_template' (34 padding bytes, where 2 is optimal). Optimal fields =
order: template_ahash, blocksize, hash_mode, hw_mode, inter_digestsize, drv=
data, min_hw_rev, std_body, is_mac, synchronize, name, driver_name, mac_nam=
e, mac_driver_name, consider reordering the fields or adding explicit paddi=
ng members
   struct cc_hash_template {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_hash.c:2168:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_hash.c:2168:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/crypto/ccree/cc_aead.c:364:17: warning: Value stored to 'dev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:364:17: note: Value stored to 'dev' durin=
g its initialization is never read
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:673:17: warning: Value stored to 'dev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:673:17: note: Value stored to 'dev' durin=
g its initialization is never read
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:1164:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:1164:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:1834:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:1834:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:2111:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:2111:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:2128:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:2128:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:2164:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:2164:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:2184:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:2184:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> drivers/media/platform/exynos4-is/fimc-capture.c:670:16: warning: Divisi=
on by zero [clang-analyzer-core.DivideZero]
                   align_sz =3D 64/ALIGN(depth, 8);
                                ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1643:6: note: Assuming =
field 'pad' is not equal to FIMC_SD_PAD_SOURCE
           if (sel->pad =3D=3D FIMC_SD_PAD_SOURCE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:1643:2: note: Taking fa=
lse branch
           if (sel->pad =3D=3D FIMC_SD_PAD_SOURCE)
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1647:2: note: Calling '=
fimc_capture_try_selection'
           fimc_capture_try_selection(ctx, r, V4L2_SEL_TGT_CROP);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:643:16: note: Assuming =
field 'rotation' is equal to 90
           bool rotate =3D ctx->rotation =3D=3D 90 || ctx->rotation =3D=3D =
270;
                         ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:643:36: note: Left side=
 of '||' is true
           bool rotate =3D ctx->rotation =3D=3D 90 || ctx->rotation =3D=3D =
270;
                                             ^
   drivers/media/platform/exynos4-is/fimc-capture.c:653:6: note: Assuming t=
he condition is true
           if (fimc_fmt_is_user_defined(ctx->d_frame.fmt->color)) {
               ^
   drivers/media/platform/exynos4-is/fimc-core.h:112:39: note: expanded fro=
m macro 'fimc_fmt_is_user_defined'
   #define fimc_fmt_is_user_defined(x) (!!((x) & 0x180))
                                         ^~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:653:2: note: Taking fal=
se branch
           if (fimc_fmt_is_user_defined(ctx->d_frame.fmt->color)) {
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:659:6: note: 'target' i=
s not equal to V4L2_SEL_TGT_COMPOSE
           if (target =3D=3D V4L2_SEL_TGT_COMPOSE) {
               ^~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:659:2: note: Taking fal=
se branch
           if (target =3D=3D V4L2_SEL_TGT_COMPOSE) {
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:670:16: note: Division =
by zero
                   align_sz =3D 64/ALIGN(depth, 8);
                              ~~^~~~~~~~~~~~~~~~
>> drivers/media/platform/exynos4-is/fimc-capture.c:825:3: warning: Value s=
tored to 'ffmt' is never read [clang-analyzer-deadcode.DeadStores]
                   ffmt =3D fimc_capture_try_format(ctx, &tfmt->width, &tfm=
t->height,
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:825:3: note: Value stor=
ed to 'ffmt' is never read
                   ffmt =3D fimc_capture_try_format(ctx, &tfmt->width, &tfm=
t->height,
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
>> drivers/media/platform/exynos4-is/fimc-capture.c:862:22: warning: Assign=
ed value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   fd.entry[i].length =3D plane_fmt[i].sizeimage;
                                      ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1184:2: note: Taking fa=
lse branch
           if (fimc_capture_active(fimc))
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1188:6: note: Assuming =
'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:1188:2: note: Taking fa=
lse branch
           if (ret < 0)
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1192:6: note: Assuming =
'sd' is non-null
           if (sd)
               ^~
   drivers/media/platform/exynos4-is/fimc-capture.c:1192:2: note: Taking tr=
ue branch
           if (sd)
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1195:6: note: Assuming =
'si' is not equal to NULL
           if (si =3D=3D NULL) {
               ^~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:1195:2: note: Taking fa=
lse branch
           if (si =3D=3D NULL) {
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1205:6: note: Assuming =
the condition is false
           if (vc->input =3D=3D GRP_ID_FIMC_IS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:1205:2: note: Taking fa=
lse branch
           if (vc->input =3D=3D GRP_ID_FIMC_IS)
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1208:6: note: Assuming =
field 'user_subdev_api' is true
           if (vc->user_subdev_api) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:1208:2: note: Taking tr=
ue branch
           if (vc->user_subdev_api) {
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1209:9: note: Calling '=
fimc_pipeline_validate'
                   ret =3D fimc_pipeline_validate(fimc);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:1101:28: note: Left sid=
e of '&&' is false
           struct fimc_pipeline *p =3D to_fimc_pipeline(vc->ve.pipe);
                                     ^
   drivers/media/platform/exynos4-is/media-dev.h:62:31: note: expanded from=
 macro 'to_fimc_pipeline'
   #define to_fimc_pipeline(_ep) container_of(_ep, struct fimc_pipeline, ep)
                                 ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1101:28: note: Taking f=
alse branch
           struct fimc_pipeline *p =3D to_fimc_pipeline(vc->ve.pipe);
                                     ^
   drivers/media/platform/exynos4-is/media-dev.h:62:31: note: expanded from=
 macro 'to_fimc_pipeline'
   #define to_fimc_pipeline(_ep) container_of(_ep, struct fimc_pipeline, ep)
                                 ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1101:28: note: Loop con=
dition is false.  Exiting loop
           struct fimc_pipeline *p =3D to_fimc_pipeline(vc->ve.pipe);
                                     ^
   drivers/media/platform/exynos4-is/media-dev.h:62:31: note: expanded from=
 macro 'to_fimc_pipeline'
   #define to_fimc_pipeline(_ep) container_of(_ep, struct fimc_pipeline, ep)
                                 ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1105:2: note: Loop cond=
ition is true.  Entering loop body
           while (1) {
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1113:15: note: Assuming=
 'i' is < field 'num_pads'
                   for (i =3D 0; i < sd->entity.num_pads; i++) {
                               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:1113:3: note: Loop cond=
ition is true.  Entering loop body
                   for (i =3D 0; i < sd->entity.num_pads; i++) {
                   ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1116:8: note: Assuming =
the condition is true
                           if (p->flags & MEDIA_PAD_FL_SINK) {
--
                         ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:370:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   drivers/media/dvb-frontends/stv0297.c:75:4: note: Taking true branch
                           dprintk("%s: readreg error (reg =3D=3D 0x%02x, r=
et =3D=3D %i)\n", __func__, reg, ret);
                           ^
   drivers/media/dvb-frontends/stv0297.c:31:23: note: expanded from macro '=
dprintk'
   #define dprintk(x...) printk(x)
                         ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:370:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   drivers/media/dvb-frontends/stv0297.c:75:4: note: '?' condition is true
                           dprintk("%s: readreg error (reg =3D=3D 0x%02x, r=
et =3D=3D %i)\n", __func__, reg, ret);
                           ^
   drivers/media/dvb-frontends/stv0297.c:31:23: note: expanded from macro '=
dprintk'
   #define dprintk(x...) printk(x)
                         ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:379:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   drivers/media/dvb-frontends/stv0297.c:75:4: note: '?' condition is true
                           dprintk("%s: readreg error (reg =3D=3D 0x%02x, r=
et =3D=3D %i)\n", __func__, reg, ret);
                           ^
   drivers/media/dvb-frontends/stv0297.c:31:23: note: expanded from macro '=
dprintk'
   #define dprintk(x...) printk(x)
                         ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:383:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   drivers/media/dvb-frontends/stv0297.c:75:4: note: Loop condition is fals=
e.  Exiting loop
                           dprintk("%s: readreg error (reg =3D=3D 0x%02x, r=
et =3D=3D %i)\n", __func__, reg, ret);
                           ^
   drivers/media/dvb-frontends/stv0297.c:31:23: note: expanded from macro '=
dprintk'
   #define dprintk(x...) printk(x)
                         ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:369:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   drivers/media/dvb-frontends/stv0297.c:76:4: note: Returning the value -1
                           return -1;
                           ^~~~~~~~~
   drivers/media/dvb-frontends/stv0297.c:130:10: note: Returning from 'stv0=
297_readreg'
                       | (stv0297_readreg(state, 0x58) << 24));
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0297.c:130:39: note: The result of the le=
ft shift is undefined because the left operand is negative
                       | (stv0297_readreg(state, 0x58) << 24));
                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/gpu/drm/vc4/vc4_v3d.c:421:4: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           ret =3D 0;
                           ^     ~
   drivers/gpu/drm/vc4/vc4_v3d.c:421:4: note: Value stored to 'ret' is neve=
r read
                           ret =3D 0;
                           ^     ~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/hwtracing/coresight/coresight-core.c:490:8: warning: Access to f=
ield 'next' results in a dereference of a null pointer (loaded from variabl=
e 'path') [clang-analyzer-core.NullDereference]
                   nd =3D list_first_entry(path, struct coresight_node, lin=
k);
                        ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:494:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/hwtracing/coresight/coresight-core.c:1250:35: note: Left side of=
 '&&' is false
           struct coresight_device *csdev =3D to_coresight_device(dev);
                                            ^
   include/linux/coresight.h:277:32: note: expanded from macro 'to_coresigh=
t_device'
   #define to_coresight_device(d) container_of(d, struct coresight_device, =
dev)
                                  ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/hwtracing/coresight/coresight-core.c:1250:35: note: Taking false=
 branch
           struct coresight_device *csdev =3D to_coresight_device(dev);
                                            ^
   include/linux/coresight.h:277:32: note: expanded from macro 'to_coresigh=
t_device'
   #define to_coresight_device(d) container_of(d, struct coresight_device, =
dev)
                                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/hwtracing/coresight/coresight-core.c:1250:35: note: Loop conditi=
on is false.  Exiting loop
           struct coresight_device *csdev =3D to_coresight_device(dev);
                                            ^
   include/linux/coresight.h:277:32: note: expanded from macro 'to_coresigh=
t_device'
   #define to_coresight_device(d) container_of(d, struct coresight_device, =
dev)
                                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/hwtracing/coresight/coresight-core.c:1253:6: note: Assuming 'ret=
' is 0
           if (ret)
               ^~~
   drivers/hwtracing/coresight/coresight-core.c:1253:2: note: Taking false =
branch
           if (ret)
           ^
   drivers/hwtracing/coresight/coresight-core.c:1256:6: note: Assuming 'val=
' is 0
           if (val) {
               ^~~
   drivers/hwtracing/coresight/coresight-core.c:1256:2: note: Taking false =
branch
           if (val) {
--
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   sound/soc/stm/stm32_i2s.c:307:51: warning: The result of the left shift =
is undefined due to shifting '0' by '24', which is unrepresentable in the u=
nsigned version of the return type 'int' [clang-analyzer-core.UndefinedBina=
ryOperatorResult]
           cgfr =3D I2S_CGFR_I2SDIV_SET(i2s->div) | (i2s->odd << I2S_CGFR_O=
DD_SHIFT);
                                                            ^
   sound/soc/stm/stm32_i2s.c:800:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   sound/soc/stm/stm32_i2s.c:800:2: note: Taking false branch
           if (ret < 0) {
           ^
   sound/soc/stm/stm32_i2s.c:805:6: note: Assuming field 'ms_flg' is equal =
to I2S_MS_MASTER
           if (STM32_I2S_IS_MASTER(i2s))
               ^
   sound/soc/stm/stm32_i2s.c:197:34: note: expanded from macro 'STM32_I2S_I=
S_MASTER'
   #define STM32_I2S_IS_MASTER(x)          ((x)->ms_flg =3D=3D I2S_MS_MASTE=
R)
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:805:2: note: Taking true branch
           if (STM32_I2S_IS_MASTER(i2s))
           ^
   sound/soc/stm/stm32_i2s.c:806:9: note: Calling 'stm32_i2s_configure_cloc=
k'
                   ret =3D stm32_i2s_configure_clock(cpu_dai, params);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:669:6: note: Assuming the condition is false
           if (!(rate % 11025))
               ^~~~~~~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:669:2: note: Taking false branch
           if (!(rate % 11025))
           ^
   sound/soc/stm/stm32_i2s.c:687:6: note: Assuming field 'mclk_rate' is not=
 equal to 0
           if (i2s->mclk_rate) {
               ^~~~~~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:687:2: note: Taking true branch
           if (i2s->mclk_rate) {
           ^
   sound/soc/stm/stm32_i2s.c:688:9: note: Calling 'stm32_i2s_calc_clk_div'
                   ret =3D stm32_i2s_calc_clk_div(i2s, i2s_clock_rate,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:270:10: note: Left side of '||' is true
           ratio =3D DIV_ROUND_CLOSEST(input_rate, output_rate);
                   ^
   include/linux/math.h:89:23: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
                                ^
   sound/soc/stm/stm32_i2s.c:273:2: note: Value assigned to 'odd'
           odd =3D ratio & 0x1;
           ^~~~~~~~~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:279:6: note: Assuming 'div' is not equal to 0
           if (div) {
               ^~~
   sound/soc/stm/stm32_i2s.c:279:2: note: Taking true branch
           if (div) {
           ^
   sound/soc/stm/stm32_i2s.c:281:3: note: Taking false branch
                   dev_dbg(&i2s->pdev->dev, "Divider: 2*%d(div)+%d(odd) =3D=
 %d\n",
                   ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   sound/soc/stm/stm32_i2s.c:286:7: note: Assuming 'div' is equal to 1
           if ((div =3D=3D 1 && odd) || div > I2S_CGFR_I2SDIV_MAX) {
                ^~~~~~~~
   sound/soc/stm/stm32_i2s.c:286:7: note: Left side of '&&' is true
   sound/soc/stm/stm32_i2s.c:286:19: note: Assuming 'odd' is false
           if ((div =3D=3D 1 && odd) || div > I2S_CGFR_I2SDIV_MAX) {
                            ^~~
   sound/soc/stm/stm32_i2s.c:286:6: note: Left side of '||' is false
           if ((div =3D=3D 1 && odd) || div > I2S_CGFR_I2SDIV_MAX) {
               ^
   sound/soc/stm/stm32_i2s.c:286:2: note: Taking false branch
           if ((div =3D=3D 1 && odd) || div > I2S_CGFR_I2SDIV_MAX) {
           ^
   sound/soc/stm/stm32_i2s.c:291:6: note: Assuming the condition is false
           if (input_rate % divider)
               ^~~~~~~~~~~~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:291:2: note: Taking false branch
           if (input_rate % divider)
           ^
   sound/soc/stm/stm32_i2s.c:297:2: note: The value of 'odd' is assigned to=
 field 'odd'
           i2s->odd =3D odd;
           ^~~~~~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:688:9: note: Returning from 'stm32_i2s_calc_cl=
k_div'
                   ret =3D stm32_i2s_calc_clk_div(i2s, i2s_clock_rate,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:690:7: note: 'ret' is 0
                   if (ret)
                       ^~~
   sound/soc/stm/stm32_i2s.c:690:3: note: Taking false branch
                   if (ret)
                   ^
   sound/soc/stm/stm32_i2s.c:710:8: note: Calling 'stm32_i2s_set_clk_div'
           ret =3D stm32_i2s_set_clk_div(i2s);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:307:51: note: The result of the left shift is =
undefined due to shifting '0' by '24', which is unrepresentable in the unsi=
gned version of the return type 'int'
           cgfr =3D I2S_CGFR_I2SDIV_SET(i2s->div) | (i2s->odd << I2S_CGFR_O=
DD_SHIFT);
                                                   ~~~~~~~~ ^
>> sound/soc/stm/stm32_i2s.c:434:2: warning: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(p, "_mclk");
           ^~~~~~
   sound/soc/stm/stm32_i2s.c:434:2: note: Call to function 'strcat' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcat'. CWE-119
           strcat(p, "_mclk");
           ^~~~~~
   sound/soc/stm/stm32_i2s.c:455:26: warning: Value stored to 'pdev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev =3D i2s->pdev;
                                   ^~~~   ~~~~~~~~~
   sound/soc/stm/stm32_i2s.c:455:26: note: Value stored to 'pdev' during it=
s initialization is never read
           struct platform_device *pdev =3D i2s->pdev;
                                   ^~~~   ~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   fs/crypto/fname.c:209:18: warning: The right operand of '|' is a garbage=
 value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   ac =3D (ac << 8) | src[i];
                                  ^
   fs/crypto/fname.c:346:2: note: Taking false branch
           if (fscrypt_is_dot_dotdot(&qname)) {
           ^
   fs/crypto/fname.c:353:6: note: Assuming field 'len' is >=3D FS_CRYPTO_BL=
OCK_SIZE
           if (iname->len < FS_CRYPTO_BLOCK_SIZE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/crypto/fname.c:353:2: note: Taking false branch
           if (iname->len < FS_CRYPTO_BLOCK_SIZE)
           ^
   fs/crypto/fname.c:356:2: note: Taking false branch
           if (fscrypt_has_encryption_key(inode))
           ^
   fs/crypto/fname.c:363:2: note: Taking false branch
           BUILD_BUG_ON(offsetofend(struct fscrypt_nokey_name, dirhash) !=
=3D
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/crypto/fname.c:363:2: note: Loop condition is false.  Exiting loop
           BUILD_BUG_ON(offsetofend(struct fscrypt_nokey_name, dirhash) !=
=3D
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/crypto/fname.c:365:2: note: Taking false branch
           BUILD_BUG_ON(offsetofend(struct fscrypt_nokey_name, bytes) !=3D
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/crypto/fname.c:365:2: note: Loop condition is false.  Exiting loop
           BUILD_BUG_ON(offsetofend(struct fscrypt_nokey_name, bytes) !=3D
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
--
                   if (!(condition))                                       \
                   ^
   fs/ext4/resize.c:1236:13: note: Loop condition is false.  Exiting loop
                           gdb_bh =3D sbi_array_rcu_deref(sbi, s_group_desc,
                                    ^
   fs/ext4/ext4.h:1784:21: note: expanded from macro 'sbi_array_rcu_deref'
           _v =3D ((typeof(_v)*)rcu_dereference((sbi)->field))[index];     =
     \
                              ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/ext4/resize.c:1236:13: note: Left side of '&&' is false
                           gdb_bh =3D sbi_array_rcu_deref(sbi, s_group_desc,
                                    ^
   fs/ext4/ext4.h:1784:21: note: expanded from macro 'sbi_array_rcu_deref'
           _v =3D ((typeof(_v)*)rcu_dereference((sbi)->field))[index];     =
     \
                              ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:390:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:346:48: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   fs/ext4/resize.c:1236:13: note: Loop condition is false.  Exiting loop
                           gdb_bh =3D sbi_array_rcu_deref(sbi, s_group_desc,
                                    ^
   fs/ext4/ext4.h:1784:21: note: expanded from macro 'sbi_array_rcu_deref'
           _v =3D ((typeof(_v)*)rcu_dereference((sbi)->field))[index];     =
     \
                              ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:390:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:346:32: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   fs/ext4/resize.c:1238:4: note: Loop condition is false.  Exiting loop
                           BUFFER_TRACE(gdb_bh, "get_write_access");
                           ^
   include/linux/jbd2.h:1835:32: note: expanded from macro 'BUFFER_TRACE'
   #define BUFFER_TRACE(bh, info)  do {} while (0)
                                   ^
   fs/ext4/resize.c:1242:8: note: Assuming 'err' is 0
                           if (!err && reserved_gdb && ext4_bg_num_gdb(sb, =
group))
                               ^~~~
   fs/ext4/resize.c:1242:8: note: Left side of '&&' is true
   fs/ext4/resize.c:1242:16: note: Assuming 'reserved_gdb' is not equal to 0
                           if (!err && reserved_gdb && ext4_bg_num_gdb(sb, =
group))
                                       ^~~~~~~~~~~~
   fs/ext4/resize.c:1242:8: note: Left side of '&&' is true
                           if (!err && reserved_gdb && ext4_bg_num_gdb(sb, =
group))
                               ^
   fs/ext4/resize.c:1242:32: note: Assuming the condition is true
                           if (!err && reserved_gdb && ext4_bg_num_gdb(sb, =
group))
                                                       ^~~~~~~~~~~~~~~~~~~~=
~~~~~~
   fs/ext4/resize.c:1242:4: note: Taking true branch
                           if (!err && reserved_gdb && ext4_bg_num_gdb(sb, =
group))
                           ^
   fs/ext4/resize.c:1243:38: note: Passing null pointer value via 2nd param=
eter 'inode'
                                   err =3D reserve_backup_gdb(handle, resiz=
e_inode, group);
                                                                    ^~~~~~~=
~~~~~
   fs/ext4/resize.c:1243:11: note: Calling 'reserve_backup_gdb'
                                   err =3D reserve_backup_gdb(handle, resiz=
e_inode, group);
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   fs/ext4/resize.c:992:27: note: Access to field 'i_sb' results in a deref=
erence of a null pointer (loaded from variable 'inode')
           struct super_block *sb =3D inode->i_sb;
                                    ^~~~~
   fs/ext4/resize.c:1929:3: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   err =3D ret;
                   ^     ~~~
   fs/ext4/resize.c:1929:3: note: Value stored to 'err' is never read
                   err =3D ret;
                   ^     ~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/media/platform/exynos4-is/media-dev.c:1018:3: warning: Value sto=
red to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D __fimc_md_create_fimc_sink_links(fmd, source, se=
nsor,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/media/platform/exynos4-is/media-dev.c:1018:3: note: Value stored=
 to 'ret' is never read
                   ret =3D __fimc_md_create_fimc_sink_links(fmd, source, se=
nsor,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/media/platform/exynos4-is/media-dev.c:1031:3: warning: Value sto=
red to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D __fimc_md_create_fimc_sink_links(fmd, source, se=
nsor,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/media/platform/exynos4-is/media-dev.c:1031:3: note: Value stored=
 to 'ret' is never read
                   ret =3D __fimc_md_create_fimc_sink_links(fmd, source, se=
nsor,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/list.h:135:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/media/platform/exynos4-is/media-dev.c:1541:6: note: Assuming 'fm=
d' is non-null
           if (!fmd)
               ^~~~
   drivers/media/platform/exynos4-is/media-dev.c:1541:2: note: Taking false=
 branch
           if (!fmd)
           ^
   drivers/media/platform/exynos4-is/media-dev.c:1551:2: note: Calling 'fim=
c_md_pipelines_free'
           fimc_md_pipelines_free(fmd);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/media-dev.c:389:2: note: Loop conditio=
n is true.  Entering loop body
           while (!list_empty(&fmd->pipelines)) {
           ^
   drivers/media/platform/exynos4-is/media-dev.c:392:7: note: Left side of =
'&&' is false
                   p =3D list_entry(fmd->pipelines.next, typeof(*p), list);
                       ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/media/platform/exynos4-is/media-dev.c:392:7: note: Taking false =
branch
                   p =3D list_entry(fmd->pipelines.next, typeof(*p), list);
                       ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/media/platform/exynos4-is/media-dev.c:392:7: note: Loop conditio=
n is false.  Exiting loop
                   p =3D list_entry(fmd->pipelines.next, typeof(*p), list);
                       ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/media/platform/exynos4-is/media-dev.c:394:3: note: Memory is rel=
eased
                   kfree(p);
                   ^~~~~~~~
   drivers/media/platform/exynos4-is/media-dev.c:389:2: note: Loop conditio=
n is true.  Entering loop body
           while (!list_empty(&fmd->pipelines)) {
           ^
   drivers/media/platform/exynos4-is/media-dev.c:392:7: note: Left side of =
'&&' is false
                   p =3D list_entry(fmd->pipelines.next, typeof(*p), list);
                       ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/media/platform/exynos4-is/media-dev.c:392:7: note: Taking false =
branch
                   p =3D list_entry(fmd->pipelines.next, typeof(*p), list);
                       ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
--
               ^~
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:6: note: Assuming the condition is f=
alse
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:19:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:6: note: Assuming the condition is f=
alse
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is f=
alse
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is f=
alse
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is f=
alse
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   sound/soc/soc-ops.c:485:28: note: Returning from 'fls'
           unsigned int mask =3D (1 << fls(max)) - 1;
                                     ^~~~~~~~
   sound/soc/soc-ops.c:485:25: note: The result of the left shift is undefi=
ned due to shifting by '32', which is greater or equal to the width of type=
 'int'
           unsigned int mask =3D (1 << fls(max)) - 1;
                                  ^  ~~~~~~~~
   sound/soc/soc-ops.c:537:25: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           unsigned int mask =3D (1 << fls(max)) - 1;
                                  ^  ~~~~~~~~
   sound/soc/soc-ops.c:537:28: note: Calling 'fls'
           unsigned int mask =3D (1 << fls(max)) - 1;
                                     ^~~~~~~~
   include/asm-generic/bitops/fls.h:15:2: note: 'r' initialized to 32
           int r =3D 32;
           ^~~~~
   include/asm-generic/bitops/fls.h:17:6: note: Assuming 'x' is not equal t=
o 0, which participates in a condition later
           if (!x)
               ^~
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:6: note: Assuming the condition is f=
alse
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:19:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:6: note: Assuming the condition is f=
alse
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is f=
alse
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is f=
alse
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is f=
alse
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   sound/soc/soc-ops.c:537:28: note: Returning from 'fls'
           unsigned int mask =3D (1 << fls(max)) - 1;
                                     ^~~~~~~~
   sound/soc/soc-ops.c:537:25: note: The result of the left shift is undefi=
ned due to shifting by '32', which is greater or equal to the width of type=
 'int'
           unsigned int mask =3D (1 << fls(max)) - 1;
                                  ^  ~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
>> sound/soc/sh/rcar/core.c:592:2: warning: Value stored to 'dev' is never =
read [clang-analyzer-deadcode.DeadStores]
           dev =3D rsnd_priv_to_dev(priv);
           ^
   sound/soc/sh/rcar/core.c:592:2: note: Value stored to 'dev' is never read
>> sound/soc/sh/rcar/core.c:1082:17: warning: Value stored to 'dev' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/core.c:1082:17: note: Value stored to 'dev' during its=
 initialization is never read
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/core.c:1130:17: warning: Value stored to 'dev' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/core.c:1130:17: note: Value stored to 'dev' during its=
 initialization is never read
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/core.c:1339:17: warning: Value stored to 'dev' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/core.c:1339:17: note: Value stored to 'dev' during its=
 initialization is never read
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/core.c:1510:18: warning: Value stored to 'dev' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   struct device *dev =3D rsnd_priv_to_dev(priv);
                                  ^~~
   sound/soc/sh/rcar/core.c:1510:18: note: Value stored to 'dev' during its=
 initialization is never read
                   struct device *dev =3D rsnd_priv_to_dev(priv);
                                  ^~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> sound/soc/sh/rcar/gen.c:85:17: warning: Value stored to 'dev' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/gen.c:85:17: note: Value stored to 'dev' during its in=
itialization is never read
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/gen.c:105:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/gen.c:105:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/gen.c:122:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/gen.c:122:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   fs/btrfs/zstd.c:440:4: warning: Value stored to 'tot_out' is never read =
[clang-analyzer-deadcode.DeadStores]
                           tot_out +=3D workspace->out_buf.pos;
                           ^          ~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zstd.c:440:4: note: Value stored to 'tot_out' is never read
                           tot_out +=3D workspace->out_buf.pos;
                           ^          ~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zstd.c:500:4: warning: Value stored to 'tot_out' is never read =
[clang-analyzer-deadcode.DeadStores]
                           tot_out +=3D workspace->out_buf.pos;
                           ^          ~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zstd.c:500:4: note: Value stored to 'tot_out' is never read
                           tot_out +=3D workspace->out_buf.pos;
                           ^          ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   fs/btrfs/compression.c:253:2: warning: Value stored to 'index' is never =
read [clang-analyzer-deadcode.DeadStores]
           index =3D 0;
           ^       ~
   fs/btrfs/compression.c:253:2: note: Value stored to 'index' is never read
           index =3D 0;
           ^       ~
   fs/btrfs/compression.c:363:2: warning: Value stored to 'index' is never =
read [clang-analyzer-deadcode.DeadStores]
           index =3D 0;
           ^       ~
   fs/btrfs/compression.c:363:2: note: Value stored to 'index' is never read
           index =3D 0;
           ^       ~
   fs/btrfs/compression.c:743:2: warning: Value stored to 'faili' is never =
read [clang-analyzer-deadcode.DeadStores]
           faili =3D nr_pages - 1;
           ^       ~~~~~~~~~~~~
   fs/btrfs/compression.c:743:2: note: Value stored to 'faili' is never read
           faili =3D nr_pages - 1;
           ^       ~~~~~~~~~~~~
   fs/btrfs/compression.c:903:2: warning: 1st function call argument is an =
uninitialized value [clang-analyzer-core.CallAndMessage]
           kfree(workspace->bucket);
           ^
   fs/btrfs/compression.c:1666:30: note: Calling 'get_workspace'
           struct list_head *ws_list =3D get_workspace(0, 0);
                                       ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:1106:2: note: Control jumps to 'case BTRFS_COMPRE=
SS_NONE:'  at line 1107
           switch (type) {
           ^
   fs/btrfs/compression.c:1107:35: note: Calling 'btrfs_get_workspace'
           case BTRFS_COMPRESS_NONE: return btrfs_get_workspace(type, level=
);
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:1046:6: note: Assuming the condition is false
           if (!list_empty(idle_ws)) {
               ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:1046:2: note: Taking false branch
           if (!list_empty(idle_ws)) {
           ^
   fs/btrfs/compression.c:1054:6: note: Assuming the condition is false
           if (atomic_read(total_ws) > cpus) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:1054:2: note: Taking false branch
           if (atomic_read(total_ws) > cpus) {
           ^
   fs/btrfs/compression.c:1073:14: note: Calling 'alloc_workspace'
           workspace =3D alloc_workspace(type, level);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:949:2: note: Control jumps to 'case BTRFS_COMPRES=
S_NONE:'  at line 950
           switch (type) {
           ^
   fs/btrfs/compression.c:950:35: note: Calling 'alloc_heuristic_ws'
           case BTRFS_COMPRESS_NONE: return alloc_heuristic_ws(level);
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:912:7: note: Calling 'kzalloc'
           ws =3D kzalloc(sizeof(*ws), GFP_KERNEL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Uninitialized value stored to field 'b=
ucket'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:912:7: note: Returning from 'kzalloc'
           ws =3D kzalloc(sizeof(*ws), GFP_KERNEL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:913:6: note: Assuming 'ws' is non-null
           if (!ws)
               ^~~
   fs/btrfs/compression.c:913:2: note: Taking false branch
           if (!ws)
--
                   ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/btrfs/space-info.c:1524:3: warning: Value stored to 'used' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   used +=3D orig_bytes;
                   ^       ~~~~~~~~~~
   fs/btrfs/space-info.c:1524:3: note: Value stored to 'used' is never read
                   used +=3D orig_bytes;
                   ^       ~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   sound/soc/bcm/bcm2835-i2s.c:356:2: warning: Value stored to 'data_delay'=
 is never read [clang-analyzer-deadcode.DeadStores]
           data_delay =3D 0;
           ^            ~
   sound/soc/bcm/bcm2835-i2s.c:356:2: note: Value stored to 'data_delay' is=
 never read
           data_delay =3D 0;
           ^            ~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   sound/soc/bcm/cygnus-pcm.c:356:30: warning: Value stored to 'rtd' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct snd_soc_pcm_runtime *rtd =3D asoc_substream_to_rtd(substr=
eam);
                                       ^~~
   sound/soc/bcm/cygnus-pcm.c:356:30: note: Value stored to 'rtd' during it=
s initialization is never read
           struct snd_soc_pcm_runtime *rtd =3D asoc_substream_to_rtd(substr=
eam);
                                       ^~~
   sound/soc/bcm/cygnus-pcm.c:584:30: warning: Value stored to 'rtd' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct snd_soc_pcm_runtime *rtd =3D asoc_substream_to_rtd(substr=
eam);
                                       ^~~
   sound/soc/bcm/cygnus-pcm.c:584:30: note: Value stored to 'rtd' during it=
s initialization is never read
           struct snd_soc_pcm_runtime *rtd =3D asoc_substream_to_rtd(substr=
eam);
                                       ^~~
   sound/soc/bcm/cygnus-pcm.c:621:30: warning: Value stored to 'rtd' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct snd_soc_pcm_runtime *rtd =3D asoc_substream_to_rtd(substr=
eam);
                                       ^~~
   sound/soc/bcm/cygnus-pcm.c:621:30: note: Value stored to 'rtd' during it=
s initialization is never read
           struct snd_soc_pcm_runtime *rtd =3D asoc_substream_to_rtd(substr=
eam);
                                       ^~~
   sound/soc/bcm/cygnus-pcm.c:642:30: warning: Value stored to 'rtd' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct snd_soc_pcm_runtime *rtd =3D asoc_substream_to_rtd(substr=
eam);
                                       ^~~
   sound/soc/bcm/cygnus-pcm.c:642:30: note: Value stored to 'rtd' during it=
s initialization is never read
           struct snd_soc_pcm_runtime *rtd =3D asoc_substream_to_rtd(substr=
eam);
                                       ^~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> sound/soc/sh/rcar/cmd.c:29:17: warning: Value stored to 'dev' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/cmd.c:29:17: note: Value stored to 'dev' during its in=
itialization is never read
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   sound/soc/sof/loader.c:187:32: warning: Value stored to 'dbg_abi' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct ext_man_dbg_abi *dbg_abi =3D
                                         ^~~~~~~
   sound/soc/sof/loader.c:187:32: note: Value stored to 'dbg_abi' during it=
s initialization is never read
           const struct ext_man_dbg_abi *dbg_abi =3D
                                         ^~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   sound/soc/codecs/cs43130.c:180:8: warning: Excessive padding in 'struct =
cs43130_pll_params' (7 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   pll_in, =

   pll_div_frac, =

   pll_out, =

   sclk_prediv, =

   pll_div_int, =

   pll_mode, =

   pll_divout, =

   pll_cal_ratio, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct cs43130_pll_params {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs43130.c:180:8: note: Excessive padding in 'struct cs4=
3130_pll_params' (7 padding bytes, where 3 is optimal). Optimal fields orde=
r: pll_in, pll_div_frac, pll_out, sclk_prediv, pll_div_int, pll_mode, pll_d=
ivout, pll_cal_ratio, consider reordering the fields or adding explicit pad=
ding members
   struct cs43130_pll_params {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs43130.c:1938:28: warning: Value stored to 'component'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct snd_soc_component *component =3D cs43130->component;
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs43130.c:1938:28: note: Value stored to 'component' du=
ring its initialization is never read
           struct snd_soc_component *component =3D cs43130->component;
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
--
                   ^     ~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/drm_modes.c:1764:4: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(mode->name, drm_named_modes_whitelist[i]);
                           ^~~~~~
   drivers/gpu/drm/drm_modes.c:1764:4: note: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119
                           strcpy(mode->name, drm_named_modes_whitelist[i]);
                           ^~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/most/configfs.c:173:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(mdev_link->direction, page);
           ^~~~~~
   drivers/most/configfs.c:173:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(mdev_link->direction, page);
           ^~~~~~
   drivers/most/configfs.c:192:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(mdev_link->datatype, page);
           ^~~~~~
   drivers/most/configfs.c:192:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(mdev_link->datatype, page);
           ^~~~~~
   drivers/most/configfs.c:446:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(mdev_link->name, name);
           ^~~~~~
   drivers/most/configfs.c:446:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(mdev_link->name, name);
           ^~~~~~
   drivers/most/configfs.c:535:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(mdev_link->name, name);
           ^~~~~~
   drivers/most/configfs.c:535:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(mdev_link->name, name);
           ^~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/gpu/drm/vc4/vc4_dsi.c:818:26: warning: Division by zero [clang-a=
nalyzer-core.DivideZero]
           pll_clock =3D parent_rate / divider;
                       ~~~~~~~~~~~~^~~~~~~~~
   drivers/gpu/drm/vc4/vc4_dsi.c:808:2: note: Loop condition is true.  Ente=
ring loop body
           for (divider =3D 1; divider < 8; divider++) {
           ^
   drivers/gpu/drm/vc4/vc4_dsi.c:809:7: note: Assuming the condition is true
                   if (parent_rate / divider < pll_clock) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vc4/vc4_dsi.c:809:3: note: Taking true branch
                   if (parent_rate / divider < pll_clock) {
                   ^
   drivers/gpu/drm/vc4/vc4_dsi.c:810:4: note: The value 0 is assigned to 'd=
ivider'
                           divider--;
                           ^~~~~~~~~
   drivers/gpu/drm/vc4/vc4_dsi.c:811:4: note:  Execution continues on line =
818
                           break;
                           ^
   drivers/gpu/drm/vc4/vc4_dsi.c:818:26: note: Division by zero
           pll_clock =3D parent_rate / divider;
                       ~~~~~~~~~~~~^~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/mtd/devices/block2mtd.c:395:2: warning: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           strcpy(str, val);
           ^~~~~~
   drivers/mtd/devices/block2mtd.c:395:2: note: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119
           strcpy(str, val);
           ^~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   mm/swap_state.c:165:9: warning: Value stored to 'entry' during its initi=
alization is never read [clang-analyzer-deadcode.DeadStores]
                   void *entry =3D xas_store(&xas, shadow);
                         ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   mm/swap_state.c:165:9: note: Value stored to 'entry' during its initiali=
zation is never read
                   void *entry =3D xas_store(&xas, shadow);
                         ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/rtc/rtc-ab-eoz9.c:552:3: warning: Value stored to 'ret' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   ret =3D device_init_wakeup(dev, true);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-ab-eoz9.c:552:3: note: Value stored to 'ret' is never re=
ad
                   ret =3D device_init_wakeup(dev, true);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   sound/soc/codecs/wm8903.c:434:3: warning: Value stored to 'best' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   best =3D 0;
                   ^      ~
   sound/soc/codecs/wm8903.c:434:3: note: Value stored to 'best' is never r=
ead
                   best =3D 0;
                   ^      ~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> sound/soc/sh/rcar/mix.c:88:17: warning: Value stored to 'dev' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/mix.c:88:17: note: Value stored to 'dev' during its in=
itialization is never read
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   sound/soc/codecs/tas2562.c:69:23: warning: Value stored to 'tas2562' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct tas2562_data *tas2562 =3D
                                ^~~~~~~
   sound/soc/codecs/tas2562.c:69:23: note: Value stored to 'tas2562' during=
 its initialization is never read
           struct tas2562_data *tas2562 =3D
                                ^~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   sound/soc/codecs/tas2764.c:54:23: warning: Value stored to 'tas2764' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct tas2764_priv *tas2764 =3D snd_soc_component_get_drvdata(c=
omponent);
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   sound/soc/codecs/tas2764.c:54:23: note: Value stored to 'tas2764' during=
 its initialization is never read
           struct tas2764_priv *tas2764 =3D snd_soc_component_get_drvdata(c=
omponent);
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   9 warnings generated.
   drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:935:3: warning: Va=
lue stored to 'tsin' is never read [clang-analyzer-deadcode.DeadStores]
                   tsin =3D fei->channel_data[index];
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:935:3: note: Value=
 stored to 'tsin' is never read
                   tsin =3D fei->channel_data[index];
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
   drivers/media/common/videobuf2/videobuf2-core.c:1885:10: warning: Access=
 to field 'state' results in a dereference of a null pointer (loaded from v=
ariable 'vb') [clang-analyzer-core.NullDereference]
           switch (vb->state) {
                   ^~
   drivers/media/common/videobuf2/videobuf2-core.c:1878:2: note: 'vb' initi=
alized to a null pointer value
           struct vb2_buffer *vb =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:1881:8: note: Calling '_=
_vb2_get_done_vb'
           ret =3D __vb2_get_done_vb(q, &vb, pb, nonblocking);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:1823:6: note: Assuming '=
ret' is not equal to 0
           if (ret)
               ^~~
   drivers/media/common/videobuf2/videobuf2-core.c:1823:2: note: Taking tru=
e branch
           if (ret)
           ^
   drivers/media/common/videobuf2/videobuf2-core.c:1824:3: note: Returning =
without writing to '*vb'
                   return ret;
                   ^
   drivers/media/common/videobuf2/videobuf2-core.c:1881:8: note: Returning =
from '__vb2_get_done_vb'
           ret =3D __vb2_get_done_vb(q, &vb, pb, nonblocking);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:1882:6: note: Assuming '=
ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:1882:2: note: Taking fal=
se branch
           if (ret < 0)
           ^
   drivers/media/common/videobuf2/videobuf2-core.c:1885:10: note: Access to=
 field 'state' results in a dereference of a null pointer (loaded from vari=
able 'vb')
           switch (vb->state) {
                   ^~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/usb/gadget/function/f_uac2.c:1579:28: warning: Value stored to '=
cdev' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct usb_composite_dev *cdev =3D agdev->func.config->cdev;
                                     ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uac2.c:1579:28: note: Value stored to 'cde=
v' during its initialization is never read
           struct usb_composite_dev *cdev =3D agdev->func.config->cdev;
                                     ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   sound/soc/codecs/cs42l42.c:570:8: warning: Excessive padding in 'struct =
cs42l42_pll_params' (4 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   sclk, =

   pll_div_frac, =

   mclk_int, =

   mclk_div, =

   mclk_src_sel, =

   sclk_prediv, =

   pll_div_int, =

   pll_mode, =

   pll_divout, =

   pll_cal_ratio, =

   n, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct cs42l42_pll_params {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l42.c:570:8: note: Excessive padding in 'struct cs4=
2l42_pll_params' (4 padding bytes, where 0 is optimal). Optimal fields orde=
r: sclk, pll_div_frac, mclk_int, mclk_div, mclk_src_sel, sclk_prediv, pll_d=
iv_int, pll_mode, pll_divout, pll_cal_ratio, n, consider reordering the fie=
lds or adding explicit padding members
   struct cs42l42_pll_params {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l42.c:1461:28: warning: Value stored to 'component'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct snd_soc_component *component =3D cs42l42->component;
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l42.c:1461:28: note: Value stored to 'component' du=
ring its initialization is never read
           struct snd_soc_component *component =3D cs42l42->component;
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> sound/soc/sh/rcar/dma.c:428:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/dma.c:428:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/dma.c:497:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/dma.c:497:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/dma.c:682:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/dma.c:682:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/reiserfs/super.c:360:4: warning: Value stored to 'truncate' is never =
read [clang-analyzer-deadcode.DeadStores]
                           truncate =3D 0;
                           ^          ~
   fs/reiserfs/super.c:360:4: note: Value stored to 'truncate' is never read
                           truncate =3D 0;
                           ^          ~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   fs/reiserfs/prints.c:260:2: warning: Value stored to 'p' is never read [=
clang-analyzer-deadcode.DeadStores]
           p +=3D vscnprintf(p, end - p, fmt1, args);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/prints.c:260:2: note: Value stored to 'p' is never read
           p +=3D vscnprintf(p, end - p, fmt1, args);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/prints.c:713:2: warning: Value stored to 'h' is never read [=
clang-analyzer-deadcode.DeadStores]
           h =3D 0;
           ^   ~
   fs/reiserfs/prints.c:713:2: note: Value stored to 'h' is never read
           h =3D 0;
           ^   ~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/media/i2c/et8ek8/et8ek8_driver.c:531:3: warning: Value stored to=
 'list' is never read [clang-analyzer-deadcode.DeadStores]
                   list =3D meta->reglist[nlists].ptr;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/et8ek8/et8ek8_driver.c:531:3: note: Value stored to 'l=
ist' is never read
                   list =3D meta->reglist[nlists].ptr;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (8 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/media/i2c/m5mols/m5mols_core.c:1022:3: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D m5mols_init_controls(sd);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/m5mols/m5mols_core.c:1022:3: note: Value stored to 're=
t' is never read
                   ret =3D m5mols_init_controls(sd);

vim +491 drivers/gpu/drm/sun4i/sun4i_tv.c

03c4c71d25b486 Maxime Ripard 2015-10-29  476  =

03c4c71d25b486 Maxime Ripard 2015-10-29  477  static int sun4i_tv_comp_get_=
modes(struct drm_connector *connector)
03c4c71d25b486 Maxime Ripard 2015-10-29  478  {
03c4c71d25b486 Maxime Ripard 2015-10-29  479  	int i;
03c4c71d25b486 Maxime Ripard 2015-10-29  480  =

03c4c71d25b486 Maxime Ripard 2015-10-29  481  	for (i =3D 0; i < ARRAY_SIZE=
(tv_modes); i++) {
e4192089fe5320 Maxime Ripard 2016-09-19  482  		struct drm_display_mode *mo=
de;
15ae0ea4bf4395 Ville Syrj=C3=A4l=C3=A4 2016-09-19  483  		const struct tv_m=
ode *tv_mode =3D &tv_modes[i];
03c4c71d25b486 Maxime Ripard 2015-10-29  484  =

e4192089fe5320 Maxime Ripard 2016-09-19  485  		mode =3D drm_mode_create(co=
nnector->dev);
e4192089fe5320 Maxime Ripard 2016-09-19  486  		if (!mode) {
e4192089fe5320 Maxime Ripard 2016-09-19  487  			DRM_ERROR("Failed to creat=
e a new display mode\n");
e4192089fe5320 Maxime Ripard 2016-09-19  488  			return 0;
e4192089fe5320 Maxime Ripard 2016-09-19  489  		}
e4192089fe5320 Maxime Ripard 2016-09-19  490  =

03c4c71d25b486 Maxime Ripard 2015-10-29 @491  		strcpy(mode->name, tv_mode-=
>name);
03c4c71d25b486 Maxime Ripard 2015-10-29  492  =

03c4c71d25b486 Maxime Ripard 2015-10-29  493  		sun4i_tv_mode_to_drm_mode(t=
v_mode, mode);
03c4c71d25b486 Maxime Ripard 2015-10-29  494  		drm_mode_probed_add(connect=
or, mode);
03c4c71d25b486 Maxime Ripard 2015-10-29  495  	}
03c4c71d25b486 Maxime Ripard 2015-10-29  496  =

03c4c71d25b486 Maxime Ripard 2015-10-29  497  	return i;
03c4c71d25b486 Maxime Ripard 2015-10-29  498  }
03c4c71d25b486 Maxime Ripard 2015-10-29  499  =


:::::: The code at line 491 was first introduced by commit
:::::: 03c4c71d25b4868818deebeaa8943b75aa539512 drm: sun4i: Add composite o=
utput

:::::: TO: Maxime Ripard <maxime.ripard@free-electrons.com>
:::::: CC: Maxime Ripard <maxime.ripard@free-electrons.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7530626676987326089==--

