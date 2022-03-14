Content-Type: multipart/mixed; boundary="===============8796523817761311463=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hare-scsi-devel:tls-upcall.v4 118/156] crypto/hkdf.c:93:4: warning: Null pointer passed as 1st argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
Date: Mon, 14 Mar 2022 18:49:09 +0800
Message-ID: <202203141824.5kfxfqgd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8796523817761311463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git=
 tls-upcall.v4
head:   d2416ecdb6b03fc2e4aa40b20cdf919322713224
commit: ea4c6fc32e5e02a1e4c841f462c3a931b8838f33 [118/156] crypto,fs: Separ=
ate out hkdf_extract() and hkdf_expand()
:::::: branch date: 4 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20314/202203141824.5kfxfqgd-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0467eb=
2cb7654c15ae366967ef35093c5724c416)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.g=
it/commit/?id=3Dea4c6fc32e5e02a1e4c841f462c3a931b8838f33
        git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux=
/kernel/git/hare/scsi-devel.git
        git fetch --no-tags hare-scsi-devel tls-upcall.v4
        git checkout ea4c6fc32e5e02a1e4c841f462c3a931b8838f33
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   kernel/time/ntp.c:315:2: note: The value -500000000 is assigned to 'offs=
et'
           offset =3D clamp(offset, -MAXPHASE, MAXPHASE);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/ntp.c:322:6: note: Assuming the condition is true
           if (unlikely(time_status & STA_FREQHOLD))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   kernel/time/ntp.c:322:2: note: Taking false branch
           if (unlikely(time_status & STA_FREQHOLD))
           ^
   kernel/time/ntp.c:327:2: note: The value -500000000 is assigned to 'offs=
et64'
           offset64    =3D offset;
           ^~~~~~~~~~~~~~~~~~~~
   kernel/time/ntp.c:335:15: note: Assuming the condition is false
           if (unlikely(secs > 1 << (SHIFT_PLL + 1 + time_constant)))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   kernel/time/ntp.c:335:2: note: Taking false branch
           if (unlikely(secs > 1 << (SHIFT_PLL + 1 + time_constant)))
           ^
   kernel/time/ntp.c:341:16: note: Assuming '__UNIQUE_ID___x416' is >=3D '_=
_UNIQUE_ID___y417'
           freq_adj    =3D min(freq_adj + time_freq, MAXFREQ_SCALED);
                         ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   kernel/time/ntp.c:341:16: note: '?' condition is false
           freq_adj    =3D min(freq_adj + time_freq, MAXFREQ_SCALED);
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
   kernel/time/ntp.c:343:16: note: '__UNIQUE_ID___x418' is > '__UNIQUE_ID__=
_y419'
           time_freq   =3D max(freq_adj, -MAXFREQ_SCALED);
                         ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   kernel/time/ntp.c:343:16: note: '?' condition is true
           time_freq   =3D max(freq_adj, -MAXFREQ_SCALED);
                         ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
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
   kernel/time/ntp.c:345:33: note: The result of the left shift is undefine=
d because the left operand is negative
           time_offset =3D div_s64(offset64 << NTP_SCALE_SHIFT, NTP_INTERVA=
L_FREQ);
                                 ~~~~~~~~ ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> crypto/hkdf.c:93:4: warning: Null pointer passed as 1st argument to memo=
ry copy function [clang-analyzer-unix.cstring.NullArg]
                           memcpy(&okm[i], tmp, okmlen - i);
                           ^      ~~~~~~~
   crypto/hkdf.c:63:14: note: Assuming the condition is false
           if (WARN_ON(okmlen > 255 * hashlen))
                       ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   crypto/hkdf.c:63:6: note: Taking false branch
           if (WARN_ON(okmlen > 255 * hashlen))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   crypto/hkdf.c:63:2: note: Taking false branch
           if (WARN_ON(okmlen > 255 * hashlen))
           ^
   crypto/hkdf.c:66:8: note: Calling 'kzalloc'
           tmp =3D kzalloc(hashlen, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:578:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:595:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/hkdf.c:66:8: note: Returning from 'kzalloc'
           tmp =3D kzalloc(hashlen, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/hkdf.c:67:6: note: Assuming 'tmp' is non-null
           if (!tmp)
               ^~~~
   crypto/hkdf.c:67:2: note: Taking false branch
           if (!tmp)
           ^
   crypto/hkdf.c:72:14: note: Assuming 'i' is < 'okmlen'
           for (i =3D 0; i < okmlen; i +=3D hashlen) {
                       ^~~~~~~~~~
   crypto/hkdf.c:72:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < okmlen; i +=3D hashlen) {
           ^
   crypto/hkdf.c:74:9: note: Calling 'crypto_shash_init'
                   err =3D crypto_shash_init(desc);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/crypto/hash.h:946:6: note: Assuming the condition is false
           if (crypto_shash_get_flags(tfm) & CRYPTO_TFM_NEED_KEY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/crypto/hash.h:946:2: note: Taking false branch
           if (crypto_shash_get_flags(tfm) & CRYPTO_TFM_NEED_KEY)
           ^
   include/crypto/hash.h:949:2: note: Returning value, which participates i=
n a condition later
           return crypto_shash_alg(tfm)->init(desc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/hkdf.c:74:9: note: Returning from 'crypto_shash_init'
                   err =3D crypto_shash_init(desc);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   crypto/hkdf.c:75:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   crypto/hkdf.c:75:3: note: Taking false branch
                   if (err)
                   ^
   crypto/hkdf.c:78:7: note: 'prev' is null
                   if (prev) {
                       ^~~~
   crypto/hkdf.c:78:3: note: Taking false branch
                   if (prev) {
                   ^
   crypto/hkdf.c:85:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   crypto/hkdf.c:85:3: note: Taking false branch
                   if (err)
                   ^
   crypto/hkdf.c:88:3: note: Taking false branch
                   BUILD_BUG_ON(sizeof(counter) !=3D 1);
                   ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
--
                   ^
   block/blk-mq.h:395:2: note: expanded from macro 'blk_mq_run_dispatch_ops'
           __blk_mq_run_dispatch_ops(q, true, dispatch_ops)        \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq.h:380:6: note: expanded from macro '__blk_mq_run_dispatch_o=
ps'
           if (!blk_queue_has_srcu(q)) {                           \
               ^~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:2525:3: note: Taking true branch
                   blk_mq_run_dispatch_ops(q,
                   ^
   block/blk-mq.h:395:2: note: expanded from macro 'blk_mq_run_dispatch_ops'
           __blk_mq_run_dispatch_ops(q, true, dispatch_ops)        \
           ^
   block/blk-mq.h:380:2: note: expanded from macro '__blk_mq_run_dispatch_o=
ps'
           if (!blk_queue_has_srcu(q)) {                           \
           ^
   block/blk-mq.c:2526:5: note: Calling 'blk_mq_plug_issue_direct'
                                   blk_mq_plug_issue_direct(plug, false));
                                   ^
   block/blk-mq.h:395:37: note: expanded from macro 'blk_mq_run_dispatch_op=
s'
           __blk_mq_run_dispatch_ops(q, true, dispatch_ops)        \
                                              ^~~~~~~~~~~~
   block/blk-mq.h:382:4: note: expanded from macro '__blk_mq_run_dispatch_o=
ps'
                   (dispatch_ops);                                 \
                    ^~~~~~~~~~~~
   block/blk-mq.c:2471:2: note: 'hctx' initialized to a null pointer value
           struct blk_mq_hw_ctx *hctx =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:2476:15: note: Left side of '&&' is true
           while ((rq =3D rq_list_pop(&plug->mq_list))) {
                        ^
   include/linux/blkdev.h:1350:6: note: expanded from macro 'rq_list_pop'
           if ((listptr) && *(listptr))    {               \
               ^
   block/blk-mq.c:2476:15: note: Taking true branch
           while ((rq =3D rq_list_pop(&plug->mq_list))) {
                        ^
   include/linux/blkdev.h:1350:2: note: expanded from macro 'rq_list_pop'
           if ((listptr) && *(listptr))    {               \
           ^
   block/blk-mq.c:2476:2: note: Loop condition is true.  Entering loop body
           while ((rq =3D rq_list_pop(&plug->mq_list))) {
           ^
   block/blk-mq.c:2477:15: note: Assuming field 'mq_list' is equal to null
                   bool last =3D rq_list_empty(plug->mq_list);
                               ^
   include/linux/blkdev.h:1369:30: note: expanded from macro 'rq_list_empty'
   #define rq_list_empty(list)     ((list) =3D=3D (struct request *) NULL)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:2480:7: note: Assuming 'hctx' is equal to field 'mq_hctx'
                   if (hctx !=3D rq->mq_hctx) {
                       ^~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:2480:3: note: Taking false branch
                   if (hctx !=3D rq->mq_hctx) {
                   ^
   block/blk-mq.c:2487:3: note: Control jumps to the 'default' case at line=
 2496
                   switch (ret) {
                   ^
   block/blk-mq.c:2499:4: note:  Execution continues on line 2476
                           break;
                           ^
   block/blk-mq.c:2476:15: note: Left side of '&&' is true
           while ((rq =3D rq_list_pop(&plug->mq_list))) {
                        ^
   include/linux/blkdev.h:1350:6: note: expanded from macro 'rq_list_pop'
           if ((listptr) && *(listptr))    {               \
               ^
   block/blk-mq.c:2476:15: note: Taking false branch
           while ((rq =3D rq_list_pop(&plug->mq_list))) {
                        ^
   include/linux/blkdev.h:1350:2: note: expanded from macro 'rq_list_pop'
           if ((listptr) && *(listptr))    {               \
           ^
   block/blk-mq.c:2476:2: note: Loop condition is false. Execution continue=
s on line 2507
           while ((rq =3D rq_list_pop(&plug->mq_list))) {
           ^
   block/blk-mq.c:2507:6: note: 'errors' is 1
           if (errors)
               ^~~~~~
   block/blk-mq.c:2507:2: note: Taking true branch
           if (errors)
           ^
   block/blk-mq.c:2508:21: note: Passing null pointer value via 1st paramet=
er 'hctx'
                   blk_mq_commit_rqs(hctx, &queued, from_schedule);
                                     ^~~~
   block/blk-mq.c:2508:3: note: Calling 'blk_mq_commit_rqs'
                   blk_mq_commit_rqs(hctx, &queued, from_schedule);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:2338:6: note: Access to field 'queue' results in a derefe=
rence of a null pointer (loaded from variable 'hctx')
           if (hctx->queue->mq_ops->commit_rqs) {
               ^~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> crypto/hkdf.c:93:4: warning: Null pointer passed as 1st argument to memo=
ry copy function [clang-analyzer-unix.cstring.NullArg]
                           memcpy(&okm[i], tmp, okmlen - i);
                           ^      ~~~~~~~
   crypto/hkdf.c:63:14: note: Assuming the condition is false
           if (WARN_ON(okmlen > 255 * hashlen))
                       ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   crypto/hkdf.c:63:6: note: Taking false branch
           if (WARN_ON(okmlen > 255 * hashlen))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   crypto/hkdf.c:63:2: note: Taking false branch
           if (WARN_ON(okmlen > 255 * hashlen))
           ^
   crypto/hkdf.c:66:8: note: Calling 'kzalloc'
           tmp =3D kzalloc(hashlen, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:578:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:595:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/hkdf.c:66:8: note: Returning from 'kzalloc'
           tmp =3D kzalloc(hashlen, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/hkdf.c:67:6: note: Assuming 'tmp' is non-null
           if (!tmp)
               ^~~~
   crypto/hkdf.c:67:2: note: Taking false branch
           if (!tmp)
           ^
   crypto/hkdf.c:72:14: note: Assuming 'i' is < 'okmlen'
           for (i =3D 0; i < okmlen; i +=3D hashlen) {
                       ^~~~~~~~~~
   crypto/hkdf.c:72:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < okmlen; i +=3D hashlen) {
           ^
   crypto/hkdf.c:74:9: note: Calling 'crypto_shash_init'
                   err =3D crypto_shash_init(desc);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/crypto/hash.h:946:6: note: Assuming the condition is false
           if (crypto_shash_get_flags(tfm) & CRYPTO_TFM_NEED_KEY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/crypto/hash.h:946:2: note: Taking false branch
           if (crypto_shash_get_flags(tfm) & CRYPTO_TFM_NEED_KEY)
           ^
   include/crypto/hash.h:949:2: note: Returning value, which participates i=
n a condition later
           return crypto_shash_alg(tfm)->init(desc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/hkdf.c:74:9: note: Returning from 'crypto_shash_init'
                   err =3D crypto_shash_init(desc);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   crypto/hkdf.c:75:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   crypto/hkdf.c:75:3: note: Taking false branch
                   if (err)
                   ^
   crypto/hkdf.c:78:7: note: 'prev' is null
                   if (prev) {
                       ^~~~
   crypto/hkdf.c:78:3: note: Taking false branch
                   if (prev) {
                   ^
   crypto/hkdf.c:85:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   crypto/hkdf.c:85:3: note: Taking false branch
                   if (err)
                   ^
   crypto/hkdf.c:88:3: note: Taking false branch
                   BUILD_BUG_ON(sizeof(counter) !=3D 1);
                   ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \

vim +93 crypto/hkdf.c

ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  44  =

ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  45  /*
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  46   * HKDF-Expand (RFC 5869 se=
ction 2.3).
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  47   * This expands the pseudor=
andom key, which was already keyed into @hmac_tfm,
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  48   * into @okmlen bytes of ou=
tput keying material parameterized by the
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  49   * application-specific @in=
fo of length @infolen bytes.
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  50   * This is thread-safe and =
may be called by multiple threads in parallel.
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  51   */
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  52  int hkdf_expand(struct cryp=
to_shash *hmac_tfm,
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  53  		const u8 *info, unsigned =
int infolen,
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  54  		u8 *okm, unsigned int okm=
len)
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  55  {
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  56  	SHASH_DESC_ON_STACK(desc, =
hmac_tfm);
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  57  	unsigned int i, hashlen =
=3D crypto_shash_digestsize(hmac_tfm);
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  58  	int err;
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  59  	const u8 *prev =3D NULL;
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  60  	u8 counter =3D 1;
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  61  	u8 *tmp;
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  62  =

ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  63  	if (WARN_ON(okmlen > 255 *=
 hashlen))
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  64  		return -EINVAL;
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  65  =

ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  66  	tmp =3D kzalloc(hashlen, G=
FP_KERNEL);
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  67  	if (!tmp)
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  68  		return -ENOMEM;
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  69  =

ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  70  	desc->tfm =3D hmac_tfm;
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  71  =

ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  72  	for (i =3D 0; i < okmlen; =
i +=3D hashlen) {
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  73  =

ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  74  		err =3D crypto_shash_init=
(desc);
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  75  		if (err)
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  76  			goto out;
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  77  =

ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  78  		if (prev) {
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  79  			err =3D crypto_shash_upd=
ate(desc, prev, hashlen);
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  80  			if (err)
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  81  				goto out;
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  82  		}
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  83  =

ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  84  		err =3D crypto_shash_upda=
te(desc, info, infolen);
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  85  		if (err)
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  86  			goto out;
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  87  =

ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  88  		BUILD_BUG_ON(sizeof(count=
er) !=3D 1);
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  89  		if (okmlen - i < hashlen)=
 {
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  90  			err =3D crypto_shash_fin=
up(desc, &counter, 1, tmp);
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  91  			if (err)
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10  92  				goto out;
ea4c6fc32e5e02a Hannes Reinecke 2022-01-10 @93  			memcpy(&okm[i], tmp, okm=
len - i);

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============8796523817761311463==--

