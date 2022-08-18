Content-Type: multipart/mixed; boundary="===============2597117975365889368=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ksmbd/smb_common.c:28:8: warning: Excessive padding in 'struct smb_protocol' (10 padding bytes, where 2 is optimal). Optimal fields order: name, prot, index, prot_id, consider reordering the fields or adding explicit padding members [clang-analyzer-opt...
Date: Thu, 18 Aug 2022 15:26:32 +0800
Message-ID: <202208181521.WAUaG2iH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2597117975365889368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Namjae Jeon <namjae.jeon@samsung.com>
CC: Christoph Hellwig <hch@lst.de>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3b06a2755758937add738545ba4a544fc5a1c56d
commit: 1a93084b9a89818aec0ac7b59a5a51f2112bf203 ksmbd: move fs/cifsd to fs=
/ksmbd
date:   1 year, 2 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 1 year, 2 months ago
config: s390-randconfig-c005-20220816 (https://download.01.org/0day-ci/arch=
ive/20220818/202208181521.WAUaG2iH-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project aed5e3=
bea138ce581d682158eb61c27b3cfdd6ec)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D1a93084b9a89818aec0ac7b59a5a51f2112bf203
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1a93084b9a89818aec0ac7b59a5a51f2112bf203
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
   block/blk-mq.c:1945:9: note: Loop condition is false.  Exiting loop
                           rq =3D list_entry_rq(pos);
                                ^
   include/linux/blkdev.h:684:28: note: expanded from macro 'list_entry_rq'
   #define list_entry_rq(ptr)      list_entry((ptr), struct request, queuel=
ist)
                                   ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
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
   block/blk-mq.c:1946:11: note: Assuming field 'q' is non-null
                           BUG_ON(!rq->q);
                                  ^
   include/asm-generic/bug.h:63:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   block/blk-mq.c:1946:16: note: Field 'q' is non-null
                           BUG_ON(!rq->q);
                                       ^
   block/blk-mq.c:1946:4: note: Taking false branch
                           BUG_ON(!rq->q);
                           ^
   include/asm-generic/bug.h:63:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   block/blk-mq.c:1946:4: note: Loop condition is false.  Exiting loop
                           BUG_ON(!rq->q);
                           ^
   include/asm-generic/bug.h:63:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   block/blk-mq.c:1947:8: note: Assuming 'this_hctx' is not equal to field =
'mq_hctx'
                           if (rq->mq_hctx !=3D this_hctx || rq->mq_ctx !=
=3D this_ctx)
                               ^~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:1947:33: note: Left side of '||' is true
                           if (rq->mq_hctx !=3D this_hctx || rq->mq_ctx !=
=3D this_ctx)
                                                        ^
   block/blk-mq.c:1948:5: note:  Execution continues on line 1952
                                   break;
                                   ^
   block/blk-mq.c:1953:41: note: Assuming 'from_schedule' is true
                   trace_block_unplug(head_rq->q, depth, !from_schedule);
                                                         ^~~~~~~~~~~~~~
   block/blk-mq.c:1953:3: note: Calling 'trace_block_unplug'
                   trace_block_unplug(head_rq->q, depth, !from_schedule);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/block.h:401:1: note: Taking true branch
   DEFINE_EVENT(block_unplug, block_unplug,
   ^
   include/linux/tracepoint.h:532:2: note: expanded from macro 'DEFINE_EVEN=
T'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:409:2: note: expanded from macro 'DECLARE_TRA=
CE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:237:3: note: expanded from macro '__DECLARE_T=
RACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                   ^
   include/trace/events/block.h:401:1: note: Dereference of null pointer
   DEFINE_EVENT(block_unplug, block_unplug,
   ^
   include/linux/tracepoint.h:532:2: note: expanded from macro 'DEFINE_EVEN=
T'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:410:15: note: expanded from macro 'DECLARE_TR=
ACE'
                           cpu_online(raw_smp_processor_id()),             \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:15:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   include/linux/tracepoint.h:240:18: note: expanded from macro '__DECLARE_=
TRACE'
                                   TP_CONDITION(cond), 0);                 \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/tracepoint.h:139:31: note: expanded from macro 'TP_CONDITI=
ON'
   #define TP_CONDITION(args...)   args
                                   ^
   include/linux/tracepoint.h:178:9: note: expanded from macro '__DO_TRACE'
                   if (!(cond))                                            \
                         ^~~~
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
>> fs/ksmbd/smb_common.c:28:8: warning: Excessive padding in 'struct smb_pr=
otocol' (10 padding bytes, where 2 is optimal). Optimal fields order: name,=
 prot, index, prot_id, consider reordering the fields or adding explicit pa=
dding members [clang-analyzer-optin.performance.Padding]
   struct smb_protocol {
   ~~~~~~~^~~~~~~~~~~~~~
   fs/ksmbd/smb_common.c:28:8: note: Excessive padding in 'struct smb_proto=
col' (10 padding bytes, where 2 is optimal). Optimal fields order: name, pr=
ot, index, prot_id, consider reordering the fields or adding explicit paddi=
ng members
   struct smb_protocol {
   ~~~~~~~^~~~~~~~~~~~~~
>> fs/ksmbd/smb_common.c:595:26: warning: Dereference of null pointer [clan=
g-analyzer-core.NullDereference]
           cred->fsuid =3D make_kuid(current_user_ns(), uid);
                                   ^
   include/linux/cred.h:391:28: note: expanded from macro 'current_user_ns'
   #define current_user_ns()       (current_cred_xxx(user_ns))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cred.h:375:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^~~~~~~~~~~~~~
   include/linux/cred.h:297:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/rcupdate.h:563:31: note: expanded from macro 'rcu_derefere=
nce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
   include/linux/rcupdate.h:384:35: note: expanded from macro '__rcu_derefe=
rence_protected'
           ((typeof(*p) __force __kernel *)(p)); \
                                            ^
   fs/ksmbd/smb_common.c:586:6: note: Assuming the condition is false
           if (share->force_uid !=3D KSMBD_SHARE_INVALID_UID)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/smb_common.c:586:2: note: Taking false branch
           if (share->force_uid !=3D KSMBD_SHARE_INVALID_UID)
           ^
   fs/ksmbd/smb_common.c:588:6: note: Assuming the condition is false
           if (share->force_gid !=3D KSMBD_SHARE_INVALID_GID)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/smb_common.c:588:2: note: Taking false branch
           if (share->force_gid !=3D KSMBD_SHARE_INVALID_GID)
           ^
   fs/ksmbd/smb_common.c:592:6: note: Assuming 'cred' is non-null
           if (!cred)
               ^~~~~
   fs/ksmbd/smb_common.c:592:2: note: Taking false branch
           if (!cred)
           ^
   fs/ksmbd/smb_common.c:595:26: note: Assuming the condition is false
           cred->fsuid =3D make_kuid(current_user_ns(), uid);
                                   ^
   include/linux/cred.h:391:28: note: expanded from macro 'current_user_ns'
   #define current_user_ns()       (current_cred_xxx(user_ns))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cred.h:375:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^~~~~~~~~~~~~~
   include/linux/cred.h:297:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:563:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:382:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   include/linux/rcupdate.h:318:7: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
                   if (debug_lockdep_rcu_enabled() && !__warned && (c)) {  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/smb_common.c:595:26: note: Left side of '&&' is false
           cred->fsuid =3D make_kuid(current_user_ns(), uid);
                                   ^
   include/linux/cred.h:391:28: note: expanded from macro 'current_user_ns'
   #define current_user_ns()       (current_cred_xxx(user_ns))
                                    ^
   include/linux/cred.h:375:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^
   include/linux/cred.h:297:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:563:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:382:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:318:35: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if (debug_lockdep_rcu_enabled() && !__warned && (c)) {  \
                                                   ^
   fs/ksmbd/smb_common.c:595:26: note: Loop condition is false.  Exiting lo=
op
           cred->fsuid =3D make_kuid(current_user_ns(), uid);
                                   ^
   include/linux/cred.h:391:28: note: expanded from macro 'current_user_ns'
   #define current_user_ns()       (current_cred_xxx(user_ns))
                                    ^
   include/linux/cred.h:375:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^
   include/linux/cred.h:297:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:563:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:382:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:316:2: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
--
   fs/f2fs/checkpoint.c:1185:2: note: Taking false branch
           if (__need_flush_quota(sbi)) {
           ^
   fs/f2fs/checkpoint.c:1206:6: note: Assuming the condition is true
           if (get_pages(sbi, F2FS_DIRTY_DENTS)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/checkpoint.c:1206:2: note: Taking true branch
           if (get_pages(sbi, F2FS_DIRTY_DENTS)) {
           ^
   fs/f2fs/checkpoint.c:1208:9: note: Calling 'f2fs_sync_dirty_inodes'
                   err =3D f2fs_sync_dirty_inodes(sbi, DIR_INODE);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/checkpoint.c:1050:20: note: 'is_dir' is true
                                   get_pages(sbi, is_dir ?
                                                  ^~~~~~
   fs/f2fs/checkpoint.c:1050:20: note: '?' condition is true
   fs/f2fs/checkpoint.c:1049:2: note: Calling 'trace_f2fs_sync_dirty_inodes=
_enter'
           trace_f2fs_sync_dirty_inodes_enter(sbi->sb, is_dir,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/f2fs.h:1689:1: note: Taking true branch
   DEFINE_EVENT(f2fs_sync_dirty_inodes, f2fs_sync_dirty_inodes_enter,
   ^
   include/linux/tracepoint.h:532:2: note: expanded from macro 'DEFINE_EVEN=
T'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:409:2: note: expanded from macro 'DECLARE_TRA=
CE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:237:3: note: expanded from macro '__DECLARE_T=
RACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                   ^
   include/trace/events/f2fs.h:1689:1: note: Dereference of null pointer
   DEFINE_EVENT(f2fs_sync_dirty_inodes, f2fs_sync_dirty_inodes_enter,
   ^
   include/linux/tracepoint.h:532:2: note: expanded from macro 'DEFINE_EVEN=
T'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:410:15: note: expanded from macro 'DECLARE_TR=
ACE'
                           cpu_online(raw_smp_processor_id()),             \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:15:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   include/linux/tracepoint.h:240:18: note: expanded from macro '__DECLARE_=
TRACE'
                                   TP_CONDITION(cond), 0);                 \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/tracepoint.h:139:31: note: expanded from macro 'TP_CONDITI=
ON'
   #define TP_CONDITION(args...)   args
                                   ^
   include/linux/tracepoint.h:178:9: note: expanded from macro '__DO_TRACE'
                   if (!(cond))                                            \
                         ^~~~
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/misc/enclosure.c:186:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(name, "enclosure_device:");
           ^~~~~~
   drivers/misc/enclosure.c:186:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(name, "enclosure_device:");
           ^~~~~~
   drivers/misc/enclosure.c:187:2: warning: Call to function 'strcat' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(name, dev_name(&cdev->cdev));
           ^~~~~~
   drivers/misc/enclosure.c:187:2: note: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119
           strcat(name, dev_name(&cdev->cdev));
           ^~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
>> fs/ksmbd/vfs.c:438:2: warning: Null pointer passed as 1st argument to me=
mory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(&stream_buf[*pos], buf, count);
           ^
   fs/ksmbd/vfs.c:476:6: note: Assuming field 'connection_type' is 0
           if (sess->conn->connection_type) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:476:2: note: Taking false branch
           if (sess->conn->connection_type) {
           ^
   fs/ksmbd/vfs.c:486:2: note: Taking true branch
           if (ksmbd_stream_fd(fp)) {
           ^
   fs/ksmbd/vfs.c:487:9: note: Calling 'ksmbd_vfs_stream_write'
                   err =3D ksmbd_vfs_stream_write(fp, buf, pos, count);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:406:2: note: Assuming the condition is false
           ksmbd_debug(VFS, "write stream data pos : %llu, count : %zd\n",
           ^
   fs/ksmbd/mgmt/../glob.h:43:7: note: expanded from macro 'ksmbd_debug'
                   if (ksmbd_debug_types & KSMBD_DEBUG_##type)     \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:406:2: note: Taking false branch
           ksmbd_debug(VFS, "write stream data pos : %llu, count : %zd\n",
           ^
   fs/ksmbd/mgmt/../glob.h:43:3: note: expanded from macro 'ksmbd_debug'
                   if (ksmbd_debug_types & KSMBD_DEBUG_##type)     \
                   ^
   fs/ksmbd/vfs.c:406:2: note: Loop condition is false.  Exiting loop
           ksmbd_debug(VFS, "write stream data pos : %llu, count : %zd\n",
           ^
   fs/ksmbd/mgmt/../glob.h:42:2: note: expanded from macro 'ksmbd_debug'
           do {                                                    \
           ^
   fs/ksmbd/vfs.c:410:6: note: Assuming 'size' is <=3D XATTR_SIZE_MAX
           if (size > XATTR_SIZE_MAX) {
               ^~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:410:2: note: Taking false branch
           if (size > XATTR_SIZE_MAX) {
           ^
   fs/ksmbd/vfs.c:415:10: note: Calling 'ksmbd_vfs_getcasexattr'
           v_len =3D ksmbd_vfs_getcasexattr(fp->filp->f_path.dentry,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:248:6: note: Assuming 'xattr_list_len' is > 0
           if (xattr_list_len <=3D 0)
               ^~~~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:248:2: note: Taking false branch
           if (xattr_list_len <=3D 0)
           ^
   fs/ksmbd/vfs.c:251:2: note: Loop condition is true.  Entering loop body
           for (name =3D xattr_list; name - xattr_list < xattr_list_len;
           ^
   fs/ksmbd/vfs.c:253:3: note: Assuming the condition is false
                   ksmbd_debug(VFS, "%s, len %zd\n", name, strlen(name));
                   ^
   fs/ksmbd/mgmt/../glob.h:43:7: note: expanded from macro 'ksmbd_debug'
                   if (ksmbd_debug_types & KSMBD_DEBUG_##type)     \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:253:3: note: Taking false branch
                   ksmbd_debug(VFS, "%s, len %zd\n", name, strlen(name));
                   ^
   fs/ksmbd/mgmt/../glob.h:43:3: note: expanded from macro 'ksmbd_debug'
                   if (ksmbd_debug_types & KSMBD_DEBUG_##type)     \
                   ^
   fs/ksmbd/vfs.c:253:3: note: Loop condition is false.  Exiting loop
                   ksmbd_debug(VFS, "%s, len %zd\n", name, strlen(name));
                   ^
   fs/ksmbd/mgmt/../glob.h:42:2: note: expanded from macro 'ksmbd_debug'
           do {                                                    \
           ^
   fs/ksmbd/vfs.c:254:7: note: Assuming the condition is false
                   if (strncasecmp(attr_name, name, attr_name_len))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:254:3: note: Taking false branch
                   if (strncasecmp(attr_name, name, attr_name_len))
                   ^
   fs/ksmbd/vfs.c:257:15: note: Calling 'ksmbd_vfs_getxattr'
                   value_len =3D ksmbd_vfs_getxattr(dentry,
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:942:2: note: Null pointer value stored to 'stream_buf'
           *xattr_buf =3D NULL;
           ^~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:944:6: note: Assuming 'xattr_len' is >=3D 0
           if (xattr_len < 0)
               ^~~~~~~~~~~~~
   fs/ksmbd/vfs.c:944:2: note: Taking false branch
           if (xattr_len < 0)
           ^
   fs/ksmbd/vfs.c:948:6: note: Assuming 'buf' is non-null
           if (!buf)
               ^~~~
   fs/ksmbd/vfs.c:948:2: note: Taking false branch
           if (!buf)
           ^
   fs/ksmbd/vfs.c:953:6: note: Assuming 'xattr_len' is <=3D 0
           if (xattr_len > 0)
               ^~~~~~~~~~~~~
   fs/ksmbd/vfs.c:953:2: note: Taking false branch
           if (xattr_len > 0)
           ^
   fs/ksmbd/vfs.c:257:15: note: Returning from 'ksmbd_vfs_getxattr'
                   value_len =3D ksmbd_vfs_getxattr(dentry,
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:260:7: note: Assuming 'value_len' is >=3D 0
                   if (value_len < 0)
                       ^~~~~~~~~~~~~
   fs/ksmbd/vfs.c:260:3: note: Taking false branch
                   if (value_len < 0)
                   ^
   fs/ksmbd/vfs.c:262:3: note:  Execution continues on line 266
                   break;
                   ^
   fs/ksmbd/vfs.c:415:10: note: Returning from 'ksmbd_vfs_getcasexattr'
           v_len =3D ksmbd_vfs_getcasexattr(fp->filp->f_path.dentry,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:419:6: note: 'v_len' is >=3D 0
           if ((int)v_len < 0) {
               ^~~~~~~~~~
   fs/ksmbd/vfs.c:419:2: note: Taking false branch
           if ((int)v_len < 0) {
           ^
   fs/ksmbd/vfs.c:425:6: note: Assuming 'v_len' is >=3D 'size'
           if (v_len < size) {
               ^~~~~~~~~~~~
   fs/ksmbd/vfs.c:425:2: note: Taking false branch
           if (v_len < size) {
           ^
   fs/ksmbd/vfs.c:438:2: note: Null pointer passed as 1st argument to memor=
y copy function
           memcpy(&stream_buf[*pos], buf, count);
           ^      ~~~~~~~~~~~~~~~~~
>> fs/ksmbd/vfs.c:1150:2: warning: Value stored to 'err' is never read [cla=
ng-analyzer-deadcode.DeadStores]
           err =3D iterate_dir(fp->filp, &readdir_data.ctx);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:1150:2: note: Value stored to 'err' is never read
           err =3D iterate_dir(fp->filp, &readdir_data.ctx);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/ksmbd/vfs.c:1196:34: warning: Dereference of null pointer [clang-anal=
yzer-core.NullDereference]
           dfilp =3D dentry_open(dir, flags, current_cred());
                                           ^
   include/linux/cred.h:297:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
                                     ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/ksmbd/vfs.c:1221:6: note: Assuming the condition is false
           if (name[0] !=3D '/')
               ^~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:1221:2: note: Taking false branch
           if (name[0] !=3D '/')
           ^
   fs/ksmbd/vfs.c:1225:6: note: Assuming 'err' is not equal to 0
           if (!err)
               ^~~~
   fs/ksmbd/vfs.c:1225:2: note: Taking false branch
           if (!err)
           ^
   fs/ksmbd/vfs.c:1228:6: note: Assuming 'caseless' is true
           if (caseless) {
               ^~~~~~~~
   fs/ksmbd/vfs.c:1228:2: note: Taking true branch
           if (caseless) {
           ^
   fs/ksmbd/vfs.c:1234:7: note: Assuming 'filepath' is non-null
                   if (!filepath)
                       ^~~~~~~~~
   fs/ksmbd/vfs.c:1234:3: note: Taking false branch
                   if (!filepath)
                   ^
   fs/ksmbd/vfs.c:1241:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   fs/ksmbd/vfs.c:1241:3: note: Taking false branch
                   if (err)
                   ^
   fs/ksmbd/vfs.c:1244:3: note: Loop condition is true.  Entering loop body
                   while (d_can_lookup(parent.dentry)) {
                   ^
   fs/ksmbd/vfs.c:1248:19: note: Assuming the condition is false
                           bool is_last =3D !next[0];
                                          ^~~~~~~~
   fs/ksmbd/vfs.c:1250:8: note: Assuming 'filename_len' is not equal to 0
                           if (filename_len =3D=3D 0)
                               ^~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:1250:4: note: Taking false branch
                           if (filename_len =3D=3D 0)
                           ^
   fs/ksmbd/vfs.c:1253:10: note: Calling 'ksmbd_vfs_lookup_in_dir'
                           err =3D ksmbd_vfs_lookup_in_dir(&parent, filenam=
e,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:1196:34: note: Assuming the condition is false
           dfilp =3D dentry_open(dir, flags, current_cred());
                                           ^
   include/linux/cred.h:297:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:563:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:382:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   include/linux/rcupdate.h:318:7: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
                   if (debug_lockdep_rcu_enabled() && !__warned && (c)) {  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:1196:34: note: Left side of '&&' is false
           dfilp =3D dentry_open(dir, flags, current_cred());
                                           ^
   include/linux/cred.h:297:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:563:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:382:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:318:35: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if (debug_lockdep_rcu_enabled() && !__warned && (c)) {  \
                                                   ^
   fs/ksmbd/vfs.c:1196:34: note: Loop condition is false.  Exiting loop
           dfilp =3D dentry_open(dir, flags, current_cred());
                                           ^
   include/linux/cred.h:297:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:563:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:382:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:316:2: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
           do {                                                            \
--
   net/x25/af_x25.c:1109:2: note: Taking false branch
           if (!(msg->msg_flags & (MSG_EOR|MSG_OOB)))
           ^
   net/x25/af_x25.c:1113:6: note: Assuming the condition is false
           if (sock_flag(sk, SOCK_ZAPPED))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/x25/af_x25.c:1113:2: note: Taking false branch
           if (sock_flag(sk, SOCK_ZAPPED))
           ^
   net/x25/af_x25.c:1117:6: note: Assuming the condition is true
           if (sk->sk_shutdown & SEND_SHUTDOWN) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/x25/af_x25.c:1117:2: note: Taking true branch
           if (sk->sk_shutdown & SEND_SHUTDOWN) {
           ^
   net/x25/af_x25.c:1118:21: note: Dereference of null pointer
                   send_sig(SIGPIPE, current, 0);
                                     ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   fs/ksmbd/smb2pdu.c:1717:16: warning: Branch condition evaluates to a gar=
bage value [clang-analyzer-core.uninitialized.Branch]
           if (rc < 0 && sess) {
                         ^~~~
   fs/ksmbd/smb2pdu.c:1551:2: note: 'sess' declared without an initial value
           struct ksmbd_session *sess;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/smb2pdu.c:1555:2: note: Assuming the condition is false
           ksmbd_debug(SMB, "Received request for session setup\n");
           ^
   fs/ksmbd/mgmt/../glob.h:43:7: note: expanded from macro 'ksmbd_debug'
                   if (ksmbd_debug_types & KSMBD_DEBUG_##type)     \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/smb2pdu.c:1555:2: note: Taking false branch
           ksmbd_debug(SMB, "Received request for session setup\n");
           ^
   fs/ksmbd/mgmt/../glob.h:43:3: note: expanded from macro 'ksmbd_debug'
                   if (ksmbd_debug_types & KSMBD_DEBUG_##type)     \
                   ^
   fs/ksmbd/smb2pdu.c:1555:2: note: Loop condition is false.  Exiting loop
           ksmbd_debug(SMB, "Received request for session setup\n");
           ^
   fs/ksmbd/mgmt/../glob.h:42:2: note: expanded from macro 'ksmbd_debug'
           do {                                                    \
           ^
   fs/ksmbd/smb2pdu.c:1563:6: note: Assuming field 'SessionId' is not equal=
 to 0
           if (!req->hdr.SessionId) {
               ^~~~~~~~~~~~~~~~~~~
   fs/ksmbd/smb2pdu.c:1563:2: note: Taking false branch
           if (!req->hdr.SessionId) {
           ^
   fs/ksmbd/smb2pdu.c:1571:13: note: Assuming field 'dialect' is < SMB30_PR=
OT_ID
           } else if (conn->dialect >=3D SMB30_PROT_ID &&
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/smb2pdu.c:1571:44: note: Left side of '&&' is false
           } else if (conn->dialect >=3D SMB30_PROT_ID &&
                                                     ^
   fs/ksmbd/smb2pdu.c:1614:20: note: Field 'dialect' is < SMB30_PROT_ID
           } else if ((conn->dialect < SMB30_PROT_ID ||
                             ^
   fs/ksmbd/smb2pdu.c:1614:44: note: Left side of '||' is true
           } else if ((conn->dialect < SMB30_PROT_ID ||
                                                     ^
   fs/ksmbd/smb2pdu.c:1616:7: note: Assuming the condition is true
                      (req->Flags & SMB2_SESSION_REQ_FLAG_BINDING)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/smb2pdu.c:1614:9: note: Taking true branch
           } else if ((conn->dialect < SMB30_PROT_ID ||
                  ^
   fs/ksmbd/smb2pdu.c:1618:3: note: Control jumps to line 1701
                   goto out_err;
                   ^
   fs/ksmbd/smb2pdu.c:1701:2: note: Taking false branch
           if (rc =3D=3D -EINVAL)
           ^
   fs/ksmbd/smb2pdu.c:1703:7: note: Taking false branch
           else if (rc =3D=3D -ENOENT)
                ^
   fs/ksmbd/smb2pdu.c:1705:7: note: Taking true branch
           else if (rc =3D=3D -EACCES)
                ^
   fs/ksmbd/smb2pdu.c:1712:6: note: Assuming field 'use_spnego' is false
           if (conn->use_spnego && conn->mechToken) {
               ^~~~~~~~~~~~~~~~
   fs/ksmbd/smb2pdu.c:1712:23: note: Left side of '&&' is false
           if (conn->use_spnego && conn->mechToken) {
                                ^
   fs/ksmbd/smb2pdu.c:1717:6: note: 'rc' is < 0
           if (rc < 0 && sess) {
               ^~
   fs/ksmbd/smb2pdu.c:1717:6: note: Left side of '&&' is true
   fs/ksmbd/smb2pdu.c:1717:16: note: Branch condition evaluates to a garbag=
e value
           if (rc < 0 && sess) {
                         ^~~~
>> fs/ksmbd/smb2pdu.c:2721:5: warning: Value stored to 'rc' is never read [=
clang-analyzer-deadcode.DeadStores]
                                   rc =3D 0;
                                   ^    ~
   fs/ksmbd/smb2pdu.c:2721:5: note: Value stored to 'rc' is never read
                                   rc =3D 0;
                                   ^    ~
>> fs/ksmbd/smb2pdu.c:2751:40: warning: Dereference of null pointer [clang-=
analyzer-core.NullDereference]
           filp =3D dentry_open(&path, open_flags, current_cred());
                                                 ^
   include/linux/cred.h:297:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/rcupdate.h:563:31: note: expanded from macro 'rcu_derefere=
nce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
   include/linux/rcupdate.h:384:35: note: expanded from macro '__rcu_derefe=
rence_protected'
           ((typeof(*p) __force __kernel *)(p)); \
                                            ^
   fs/ksmbd/smb2pdu.c:2373:2: note: Calling '__wbuf'
           WORK_BUFFERS(work, req, rsp);
           ^
   fs/ksmbd/smb2pdu.c:51:33: note: expanded from macro 'WORK_BUFFERS'
   #define WORK_BUFFERS(w, rq, rs) __wbuf((w), (void **)&(rq), (void **)&(r=
s))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/ksmbd/smb2pdu.c:42:6: note: Assuming field 'next_smb2_rcv_hdr_off' is=
 0
           if (work->next_smb2_rcv_hdr_off) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/smb2pdu.c:42:2: note: Taking false branch
           if (work->next_smb2_rcv_hdr_off) {
           ^
   fs/ksmbd/smb2pdu.c:49:1: note: Returning without writing to '(*req)->hdr=
.NextCommand', which participates in a condition later
   }
   ^
   fs/ksmbd/smb2pdu.c:49:1: note: Returning without writing to '(*req)->Nam=
eLength', which participates in a condition later
   fs/ksmbd/smb2pdu.c:49:1: note: Returning without writing to '(*req)->Cre=
ateOptions', which participates in a condition later
   fs/ksmbd/smb2pdu.c:49:1: note: Returning without writing to '(*req)->Fil=
eAttributes', which participates in a condition later
   fs/ksmbd/smb2pdu.c:49:1: note: Returning without writing to '(*req)->Cre=
ateContextsOffset', which participates in a condition later
   fs/ksmbd/smb2pdu.c:2373:2: note: Returning from '__wbuf'
           WORK_BUFFERS(work, req, rsp);
           ^
   fs/ksmbd/smb2pdu.c:51:33: note: expanded from macro 'WORK_BUFFERS'
   #define WORK_BUFFERS(w, rq, rs) __wbuf((w), (void **)&(rq), (void **)&(r=
s))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/ksmbd/smb2pdu.c:2375:6: note: Assuming field 'NextCommand' is 0
           if (req->hdr.NextCommand && !work->next_smb2_rcv_hdr_off &&
               ^~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/smb2pdu.c:2375:27: note: Left side of '&&' is false
           if (req->hdr.NextCommand && !work->next_smb2_rcv_hdr_off &&
                                    ^
   fs/ksmbd/smb2pdu.c:2383:6: note: Assuming the condition is false
           if (test_share_config_flag(share, KSMBD_SHARE_FLAG_PIPE)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/smb2pdu.c:2383:2: note: Taking false branch
           if (test_share_config_flag(share, KSMBD_SHARE_FLAG_PIPE)) {
           ^
   fs/ksmbd/smb2pdu.c:2388:6: note: Assuming field 'NameLength' is 0
           if (req->NameLength) {
               ^~~~~~~~~~~~~~~
   fs/ksmbd/smb2pdu.c:2388:2: note: Taking false branch
           if (req->NameLength) {
           ^
   fs/ksmbd/smb2pdu.c:2431:3: note: Assuming the condition is false
                   ksmbd_debug(SMB, "share path len %d\n", len);
                   ^
   fs/ksmbd/mgmt/../glob.h:43:7: note: expanded from macro 'ksmbd_debug'
                   if (ksmbd_debug_types & KSMBD_DEBUG_##type)     \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/smb2pdu.c:2431:3: note: Taking false branch
                   ksmbd_debug(SMB, "share path len %d\n", len);
                   ^
   fs/ksmbd/mgmt/../glob.h:43:3: note: expanded from macro 'ksmbd_debug'
                   if (ksmbd_debug_types & KSMBD_DEBUG_##type)     \
                   ^
   fs/ksmbd/smb2pdu.c:2431:3: note: Loop condition is false.  Exiting loop
                   ksmbd_debug(SMB, "share path len %d\n", len);
                   ^
   fs/ksmbd/mgmt/../glob.h:42:2: note: expanded from macro 'ksmbd_debug'
           do {                                                    \
           ^
   fs/ksmbd/smb2pdu.c:2432:10: note: Calling 'kmalloc'
                   name =3D kmalloc(len + 1, GFP_KERNEL);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:544:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:561:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/smb2pdu.c:2432:10: note: Returning from 'kmalloc'
                   name =3D kmalloc(len + 1, GFP_KERNEL);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/smb2pdu.c:2433:7: note: Assuming 'name' is non-null
                   if (!name) {
                       ^~~~~
   fs/ksmbd/smb2pdu.c:2433:3: note: Taking false branch
                   if (!name) {
                   ^
   fs/ksmbd/smb2pdu.c:2444:6: note: Assuming 'req_op_level' is not equal to=
 SMB2_OPLOCK_LEVEL_LEASE
           if (req_op_level =3D=3D SMB2_OPLOCK_LEVEL_LEASE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/smb2pdu.c:2444:2: note: Taking false branch
--
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
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
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   net/netlabel/netlabel_user.h:37:30: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
           security_task_getsecid_subj(current, &audit_info->secid);
                                       ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   net/netlabel/netlabel_calipso.c:287:6: note: Assuming the condition is f=
alse
           if (!info->attrs[NLBL_CALIPSO_A_DOI])
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netlabel/netlabel_calipso.c:287:2: note: Taking false branch
           if (!info->attrs[NLBL_CALIPSO_A_DOI])
           ^
   net/netlabel/netlabel_calipso.c:290:2: note: Calling 'netlbl_netlink_aud=
itinfo'
           netlbl_netlink_auditinfo(skb, &audit_info);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netlabel/netlabel_user.h:37:30: note: Dereference of null pointer
           security_task_getsecid_subj(current, &audit_info->secid);
                                       ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   net/rfkill/core.c:978:2: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(rfkill->name, name);
           ^~~~~~
   net/rfkill/core.c:978:2: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
           strcpy(rfkill->name, name);
           ^~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (16 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (16 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
>> fs/ksmbd/transport_ipc.c:473:2: warning: Value stored to 'ret' is never =
read [clang-analyzer-deadcode.DeadStores]
           ret =3D wait_event_interruptible_timeout(entry.wait,
           ^
   fs/ksmbd/transport_ipc.c:473:2: note: Value stored to 'ret' is never read
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   net/x25/x25_proc.c:45:20: warning: Value stored to 'rt' during its initi=
alization is never read [clang-analyzer-deadcode.DeadStores]
           struct x25_route *rt =3D list_entry(v, struct x25_route, node);
                             ^~
   net/x25/x25_proc.c:45:20: note: Value stored to 'rt' during its initiali=
zation is never read
           struct x25_route *rt =3D list_entry(v, struct x25_route, node);
                             ^~
   net/x25/x25_proc.c:94:26: warning: Although the value stored to 'dev' is=
 used in the enclosing expression, the value is never actually read from 'd=
ev' [clang-analyzer-deadcode.DeadStores]
           if (!x25->neighbour || (dev =3D x25->neighbour->dev) =3D=3D NULL)
                                   ^     ~~~~~~~~~~~~~~~~~~~
   net/x25/x25_proc.c:94:26: note: Although the value stored to 'dev' is us=
ed in the enclosing expression, the value is never actually read from 'dev'
           if (!x25->neighbour || (dev =3D x25->neighbour->dev) =3D=3D NULL)
                                   ^     ~~~~~~~~~~~~~~~~~~~
   net/x25/x25_proc.c:133:22: warning: Value stored to 'f' during its initi=
alization is never read [clang-analyzer-deadcode.DeadStores]
           struct x25_forward *f =3D list_entry(v, struct x25_forward, node=
);
                               ^
   net/x25/x25_proc.c:133:22: note: Value stored to 'f' during its initiali=
zation is never read
           struct x25_forward *f =3D list_entry(v, struct x25_forward, node=
);
                               ^
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   lib/zstd/fse_compress.c:114:2: warning: Value stored to 'workspace' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           workspace =3D (U32 *)workspace + spaceUsed32;
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/zstd/fse_compress.c:114:2: note: Value stored to 'workspace' is neve=
r read
           workspace =3D (U32 *)workspace + spaceUsed32;
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/zstd/fse_compress.c:115:2: warning: Value stored to 'workspaceSize' =
is never read [clang-analyzer-deadcode.DeadStores]
           workspaceSize -=3D (spaceUsed32 << 2);
           ^                ~~~~~~~~~~~~~~~~~~
   lib/zstd/fse_compress.c:115:2: note: Value stored to 'workspaceSize' is =
never read
           workspaceSize -=3D (spaceUsed32 << 2);
           ^                ~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (8 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> fs/ksmbd/ndr.c:260:3: warning: Value stored to 'ref_id' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   ref_id +=3D 4;
                   ^         ~
   fs/ksmbd/ndr.c:260:3: note: Value stored to 'ref_id' is never read
                   ref_id +=3D 4;
                   ^         ~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
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
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
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
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   include/linux/sbitmap.h:459:9: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           *cpu =3D get_cpu();
                  ^
   include/linux/smp.h:268:42: note: expanded from macro 'get_cpu'
   #define get_cpu()               ({ preempt_disable(); __smp_processor_id=
(); })

vim +28 fs/ksmbd/smb_common.c

e2f34481b24db2 fs/cifsd/smb_common.c Namjae Jeon 2021-03-16  27  =

e2f34481b24db2 fs/cifsd/smb_common.c Namjae Jeon 2021-03-16 @28  struct smb=
_protocol {
e2f34481b24db2 fs/cifsd/smb_common.c Namjae Jeon 2021-03-16  29  	int		inde=
x;
e2f34481b24db2 fs/cifsd/smb_common.c Namjae Jeon 2021-03-16  30  	char		*na=
me;
e2f34481b24db2 fs/cifsd/smb_common.c Namjae Jeon 2021-03-16  31  	char		*pr=
ot;
e2f34481b24db2 fs/cifsd/smb_common.c Namjae Jeon 2021-03-16  32  	__u16		pr=
ot_id;
e2f34481b24db2 fs/cifsd/smb_common.c Namjae Jeon 2021-03-16  33  };
e2f34481b24db2 fs/cifsd/smb_common.c Namjae Jeon 2021-03-16  34  =


:::::: The code at line 28 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side proc=
edures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2597117975365889368==--

