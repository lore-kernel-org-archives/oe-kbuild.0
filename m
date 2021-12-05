Content-Type: multipart/mixed; boundary="===============0181233821100178165=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ceph/dir.c:1431:10: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 05 Dec 2021 15:09:59 +0800
Message-ID: <202112051536.0gERrERv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0181233821100178165==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   79a72162048e42a677bc7336a9f5d86fc3ff9558
commit: a52f8a59aef46b59753e583bf4b28fccb069ce64 fortify: Explicitly disabl=
e Clang support
date:   2 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 2 months ago
config: x86_64-randconfig-c007-20211204 (https://download.01.org/0day-ci/ar=
chive/20211205/202112051536.0gERrERv-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d18=
54eb1450d352663ee732235893c5782237)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da52f8a59aef46b59753e583bf4b28fccb069ce64
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a52f8a59aef46b59753e583bf4b28fccb069ce64
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/ocfs2/dir.c:4275:2: note: Assuming the condition is false
           if (OCFS2_I(dir)->ip_dyn_features & OCFS2_INLINE_DATA_FL) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ocfs2/dir.c:4275:2: note: '?' condition is false
           if (OCFS2_I(dir)->ip_dyn_features & OCFS2_INLINE_DATA_FL) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ocfs2/dir.c:4275:2: note: Assuming the condition is false
           if (OCFS2_I(dir)->ip_dyn_features & OCFS2_INLINE_DATA_FL) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/ocfs2/dir.c:4275:2: note: '?' condition is true
           if (OCFS2_I(dir)->ip_dyn_features & OCFS2_INLINE_DATA_FL) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/ocfs2/dir.c:4275:2: note: Taking true branch
           if (OCFS2_I(dir)->ip_dyn_features & OCFS2_INLINE_DATA_FL) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ocfs2/dir.c:4276:9: note: Calling 'ocfs2_find_dir_space_id'
                   ret =3D ocfs2_find_dir_space_id(dir, parent_fe_bh, name,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/dir.c:3343:31: note: 'last_de' initialized to a null pointer va=
lue
           struct ocfs2_dir_entry *de, *last_de =3D NULL;
                                        ^~~~~~~
   fs/ocfs2/dir.c:3352:2: note: '?' condition is false
           if (ocfs2_new_dir_wants_trailer(dir))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ocfs2/dir.c:3352:2: note: '?' condition is true
           if (ocfs2_new_dir_wants_trailer(dir))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/ocfs2/dir.c:3352:2: note: Taking true branch
           if (ocfs2_new_dir_wants_trailer(dir))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ocfs2/dir.c:3361:9: note: Assuming 'de_buf' is >=3D 'limit'
           while (de_buf < limit) {
                  ^~~~~~~~~~~~~~
   fs/ocfs2/dir.c:3361:2: note: Loop condition is false. Execution continue=
s on line 3396
           while (de_buf < limit) {
           ^
   fs/ocfs2/dir.c:3397:16: note: Access to field 'rec_len' results in a der=
eference of a null pointer (loaded from variable 'last_de')
           new_rec_len =3D le16_to_cpu(last_de->rec_len) + free_space;
                         ^
   include/linux/byteorder/generic.h:91:21: note: expanded from macro 'le16=
_to_cpu'
   #define le16_to_cpu __le16_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:36:50: note: expanded from =
macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                    ^~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> fs/ceph/dir.c:1431:10: warning: Assigned value is garbage or undefined [=
clang-analyzer-core.uninitialized.Assign]
                   dentry =3D di->dentry;
                          ^ ~~~~~~~~~~
   fs/ceph/dir.c:1380:9: note: Assuming field 'dir_lease' is true
           list =3D lwc->dir_lease ? &mdsc->dentry_dir_leases : &mdsc->dent=
ry_leases;
                  ^~~~~~~~~~~~~~
   fs/ceph/dir.c:1380:9: note: '?' condition is true
   fs/ceph/dir.c:1382:2: note: Left side of '&&' is false
           list_for_each_entry_safe(di, tmp, list, lease_list) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
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
   fs/ceph/dir.c:1382:2: note: '?' condition is true
           list_for_each_entry_safe(di, tmp, list, lease_list) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ceph/dir.c:1382:2: note: Left side of '&&' is false
           list_for_each_entry_safe(di, tmp, list, lease_list) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
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
   fs/ceph/dir.c:1382:2: note: Taking false branch
           list_for_each_entry_safe(di, tmp, list, lease_list) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ceph/dir.c:1382:2: note: Loop condition is false.  Exiting loop
           list_for_each_entry_safe(di, tmp, list, lease_list) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
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
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:2: note: expanded from macro '__compi=
letime_assert'
--
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/infiniband/core/cq.c:438:2: note: Taking false branch
           if (poll_ctx > IB_POLL_LAST_POOL_TYPE) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/infiniband/core/cq.c:444:3: note: Assuming '__UNIQUE_ID___x1215'=
 is < '__UNIQUE_ID___y1216'
                   min_t(unsigned int, dev->num_comp_vectors, num_online_cp=
us());
                   ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/infiniband/core/cq.c:444:3: note: '?' condition is true
                   min_t(unsigned int, dev->num_comp_vectors, num_online_cp=
us());
                   ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
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
   drivers/infiniband/core/cq.c:443:2: note: The value 0 is assigned to 'nu=
m_comp_vectors'
           num_comp_vectors =3D
           ^~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cq.c:446:6: note: Assuming 'comp_vector_hint' is=
 >=3D 0
           if (comp_vector_hint < 0) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/infiniband/core/cq.c:446:2: note: '?' condition is false
           if (comp_vector_hint < 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/infiniband/core/cq.c:446:6: note: 'comp_vector_hint' is >=3D 0
           if (comp_vector_hint < 0) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/infiniband/core/cq.c:446:2: note: '?' condition is false
           if (comp_vector_hint < 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/infiniband/core/cq.c:446:2: note: Taking false branch
           if (comp_vector_hint < 0) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/infiniband/core/cq.c:451:28: note: Division by zero
           vector =3D comp_vector_hint % num_comp_vectors;
                    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   6 warnings generated.
>> drivers/target/iscsi/iscsi_target.c:360:15: warning: The left expression=
 of the compound assignment is an uninitialized value. The computed value w=
ill also be garbage [clang-analyzer-core.uninitialized.Assign]
           np->np_flags |=3D NPF_IP_NETWORK;
           ~~~~~~~~~~~~ ^
   drivers/target/iscsi/iscsi_target.c:349:2: note: Assuming 'np' is null
           if (np) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/target/iscsi/iscsi_target.c:349:2: note: '?' condition is false
           if (np) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/target/iscsi/iscsi_target.c:349:6: note: 'np' is null
           if (np) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/target/iscsi/iscsi_target.c:349:2: note: '?' condition is false
           if (np) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/target/iscsi/iscsi_target.c:349:2: note: Taking false branch
           if (np) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/target/iscsi/iscsi_target.c:354:7: note: Calling 'kzalloc'
           np =3D kzalloc(sizeof(*np), GFP_KERNEL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Uninitialized value stored to field 'n=
p_flags'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:354:7: note: Returning from 'kzalloc'
           np =3D kzalloc(sizeof(*np), GFP_KERNEL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:355:6: note: Assuming 'np' is non-nu=
ll
           if (!np) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/target/iscsi/iscsi_target.c:355:2: note: '?' condition is false
           if (!np) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/target/iscsi/iscsi_target.c:355:7: note: 'np' is non-null
           if (!np) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/target/iscsi/iscsi_target.c:355:2: note: '?' condition is false
           if (!np) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
--
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/sg.c:1830:2: note: Assuming field 'rq' is null
           if (srp->rq) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/scsi/sg.c:1830:2: note: '?' condition is false
           if (srp->rq) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/sg.c:1830:11: note: Field 'rq' is null
           if (srp->rq) {
                    ^
   drivers/scsi/sg.c:1830:2: note: '?' condition is false
           if (srp->rq) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/scsi/sg.c:1830:2: note: Taking false branch
           if (srp->rq) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/sg.c:1835:2: note: Assuming field 'res_used' is not equal t=
o 0
           if (srp->res_used)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/scsi/sg.c:1835:2: note: '?' condition is false
           if (srp->res_used)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/sg.c:1835:11: note: Field 'res_used' is not equal to 0
           if (srp->res_used)
                    ^
   drivers/scsi/sg.c:1835:2: note: '?' condition is true
           if (srp->res_used)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/scsi/sg.c:1835:2: note: Taking true branch
           if (srp->res_used)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/sg.c:1836:21: note: Passing null pointer value via 1st para=
meter 'sfp'
                   sg_unlink_reserve(sfp, srp);
                                     ^~~
   drivers/scsi/sg.c:1836:3: note: Calling 'sg_unlink_reserve'
                   sg_unlink_reserve(sfp, srp);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/sg.c:2044:2: note: Loop condition is false.  Exiting loop
           SCSI_LOG_TIMEOUT(4, sg_printk(KERN_INFO, srp->parentfp->parentdp,
           ^
   drivers/scsi/scsi_logging.h:67:9: note: expanded from macro 'SCSI_LOG_TI=
MEOUT'
           SCSI_CHECK_LOGGING(SCSI_LOG_TIMEOUT_SHIFT, SCSI_LOG_TIMEOUT_BITS=
, LEVEL,CMD);
           ^
   drivers/scsi/scsi_logging.h:56:53: note: expanded from macro 'SCSI_CHECK=
_LOGGING'
   #define SCSI_CHECK_LOGGING(SHIFT, BITS, LEVEL, CMD) do { } while (0)
                                                       ^
   drivers/scsi/sg.c:2054:18: note: Access to field 'res_in_use' results in=
 a dereference of a null pointer (loaded from variable 'sfp')
           sfp->res_in_use =3D 0;
           ~~~             ^
   4 warnings generated.
>> drivers/nvme/host/tcp.c:1267:17: warning: The left expression of the com=
pound assignment is an uninitialized value. The computed value will also be=
 garbage [clang-analyzer-core.uninitialized.Assign]
                   icreq->digest |=3D NVME_TCP_HDR_DIGEST_ENABLE;
                   ~~~~~~~~~~~~~ ^
   drivers/nvme/host/tcp.c:1249:10: note: Calling 'kzalloc'
           icreq =3D kzalloc(sizeof(*icreq), GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Uninitialized value stored to field 'd=
igest'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:1249:10: note: Returning from 'kzalloc'
           icreq =3D kzalloc(sizeof(*icreq), GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:1250:6: note: Assuming 'icreq' is non-null
           if (!icreq)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/nvme/host/tcp.c:1250:2: note: '?' condition is false
           if (!icreq)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/tcp.c:1250:7: note: 'icreq' is non-null
           if (!icreq)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/nvme/host/tcp.c:1250:2: note: '?' condition is false
           if (!icreq)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/nvme/host/tcp.c:1250:2: note: Taking false branch
           if (!icreq)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/nvme/host/tcp.c:1254:6: note: Assuming 'icresp' is non-null
           if (!icresp) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/nvme/host/tcp.c:1254:2: note: '?' condition is false
           if (!icresp) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/tcp.c:1254:7: note: 'icresp' is non-null
           if (!icresp) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/nvme/host/tcp.c:1254:2: note: '?' condition is false
           if (!icresp) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \

vim +1431 fs/ceph/dir.c

37c4efc1ddf98b Yan, Zheng 2019-01-31  1367  =

37c4efc1ddf98b Yan, Zheng 2019-01-31  1368  static unsigned long
37c4efc1ddf98b Yan, Zheng 2019-01-31  1369  __dentry_leases_walk(struct cep=
h_mds_client *mdsc,
37c4efc1ddf98b Yan, Zheng 2019-01-31  1370  		     struct ceph_lease_walk_c=
ontrol *lwc,
37c4efc1ddf98b Yan, Zheng 2019-01-31  1371  		     int (*check)(struct dent=
ry*, void*))
37c4efc1ddf98b Yan, Zheng 2019-01-31  1372  {
37c4efc1ddf98b Yan, Zheng 2019-01-31  1373  	struct ceph_dentry_info *di, *=
tmp;
37c4efc1ddf98b Yan, Zheng 2019-01-31  1374  	struct dentry *dentry, *last =
=3D NULL;
37c4efc1ddf98b Yan, Zheng 2019-01-31  1375  	struct list_head* list;
37c4efc1ddf98b Yan, Zheng 2019-01-31  1376          LIST_HEAD(dispose);
37c4efc1ddf98b Yan, Zheng 2019-01-31  1377  	unsigned long freed =3D 0;
37c4efc1ddf98b Yan, Zheng 2019-01-31  1378  	int ret =3D 0;
37c4efc1ddf98b Yan, Zheng 2019-01-31  1379  =

37c4efc1ddf98b Yan, Zheng 2019-01-31  1380  	list =3D lwc->dir_lease ? &mds=
c->dentry_dir_leases : &mdsc->dentry_leases;
37c4efc1ddf98b Yan, Zheng 2019-01-31  1381  	spin_lock(&mdsc->dentry_list_l=
ock);
37c4efc1ddf98b Yan, Zheng 2019-01-31  1382  	list_for_each_entry_safe(di, t=
mp, list, lease_list) {
37c4efc1ddf98b Yan, Zheng 2019-01-31  1383  		if (!lwc->nr_to_scan)
37c4efc1ddf98b Yan, Zheng 2019-01-31  1384  			break;
37c4efc1ddf98b Yan, Zheng 2019-01-31  1385  		--lwc->nr_to_scan;
37c4efc1ddf98b Yan, Zheng 2019-01-31  1386  =

37c4efc1ddf98b Yan, Zheng 2019-01-31  1387  		dentry =3D di->dentry;
37c4efc1ddf98b Yan, Zheng 2019-01-31  1388  		if (last =3D=3D dentry)
37c4efc1ddf98b Yan, Zheng 2019-01-31  1389  			break;
37c4efc1ddf98b Yan, Zheng 2019-01-31  1390  =

37c4efc1ddf98b Yan, Zheng 2019-01-31  1391  		if (!spin_trylock(&dentry->d_=
lock))
37c4efc1ddf98b Yan, Zheng 2019-01-31  1392  			continue;
37c4efc1ddf98b Yan, Zheng 2019-01-31  1393  =

516162b92d1b72 Al Viro    2019-06-27  1394  		if (__lockref_is_dead(&dentry=
->d_lockref)) {
37c4efc1ddf98b Yan, Zheng 2019-01-31  1395  			list_del_init(&di->lease_lis=
t);
37c4efc1ddf98b Yan, Zheng 2019-01-31  1396  			goto next;
37c4efc1ddf98b Yan, Zheng 2019-01-31  1397  		}
37c4efc1ddf98b Yan, Zheng 2019-01-31  1398  =

37c4efc1ddf98b Yan, Zheng 2019-01-31  1399  		ret =3D check(dentry, lwc);
37c4efc1ddf98b Yan, Zheng 2019-01-31  1400  		if (ret & TOUCH) {
37c4efc1ddf98b Yan, Zheng 2019-01-31  1401  			/* move it into tail of dir =
lease list */
37c4efc1ddf98b Yan, Zheng 2019-01-31  1402  			__dentry_dir_lease_touch(mds=
c, di);
37c4efc1ddf98b Yan, Zheng 2019-01-31  1403  			if (!last)
37c4efc1ddf98b Yan, Zheng 2019-01-31  1404  				last =3D dentry;
37c4efc1ddf98b Yan, Zheng 2019-01-31  1405  		}
37c4efc1ddf98b Yan, Zheng 2019-01-31  1406  		if (ret & DELETE) {
37c4efc1ddf98b Yan, Zheng 2019-01-31  1407  			/* stale lease */
37c4efc1ddf98b Yan, Zheng 2019-01-31  1408  			di->flags &=3D ~CEPH_DENTRY_=
REFERENCED;
37c4efc1ddf98b Yan, Zheng 2019-01-31  1409  			if (dentry->d_lockref.count =
> 0) {
37c4efc1ddf98b Yan, Zheng 2019-01-31  1410  				/* update_dentry_lease() wi=
ll re-add
37c4efc1ddf98b Yan, Zheng 2019-01-31  1411  				 * it to lease list, or
37c4efc1ddf98b Yan, Zheng 2019-01-31  1412  				 * ceph_d_delete() will ret=
urn 1 when
37c4efc1ddf98b Yan, Zheng 2019-01-31  1413  				 * last reference is droppe=
d */
37c4efc1ddf98b Yan, Zheng 2019-01-31  1414  				list_del_init(&di->lease_li=
st);
37c4efc1ddf98b Yan, Zheng 2019-01-31  1415  			} else {
37c4efc1ddf98b Yan, Zheng 2019-01-31  1416  				di->flags |=3D CEPH_DENTRY_=
SHRINK_LIST;
37c4efc1ddf98b Yan, Zheng 2019-01-31  1417  				list_move_tail(&di->lease_l=
ist, &dispose);
37c4efc1ddf98b Yan, Zheng 2019-01-31  1418  				dget_dlock(dentry);
37c4efc1ddf98b Yan, Zheng 2019-01-31  1419  			}
37c4efc1ddf98b Yan, Zheng 2019-01-31  1420  		}
37c4efc1ddf98b Yan, Zheng 2019-01-31  1421  next:
37c4efc1ddf98b Yan, Zheng 2019-01-31  1422  		spin_unlock(&dentry->d_lock);
37c4efc1ddf98b Yan, Zheng 2019-01-31  1423  		if (ret & STOP)
37c4efc1ddf98b Yan, Zheng 2019-01-31  1424  			break;
37c4efc1ddf98b Yan, Zheng 2019-01-31  1425  	}
37c4efc1ddf98b Yan, Zheng 2019-01-31  1426  	spin_unlock(&mdsc->dentry_list=
_lock);
37c4efc1ddf98b Yan, Zheng 2019-01-31  1427  =

37c4efc1ddf98b Yan, Zheng 2019-01-31  1428  	while (!list_empty(&dispose)) {
37c4efc1ddf98b Yan, Zheng 2019-01-31  1429  		di =3D list_first_entry(&disp=
ose, struct ceph_dentry_info,
37c4efc1ddf98b Yan, Zheng 2019-01-31  1430  				      lease_list);
37c4efc1ddf98b Yan, Zheng 2019-01-31 @1431  		dentry =3D di->dentry;
37c4efc1ddf98b Yan, Zheng 2019-01-31  1432  		spin_lock(&dentry->d_lock);
37c4efc1ddf98b Yan, Zheng 2019-01-31  1433  =

37c4efc1ddf98b Yan, Zheng 2019-01-31  1434  		list_del_init(&di->lease_list=
);
37c4efc1ddf98b Yan, Zheng 2019-01-31  1435  		di->flags &=3D ~CEPH_DENTRY_S=
HRINK_LIST;
37c4efc1ddf98b Yan, Zheng 2019-01-31  1436  		if (di->flags & CEPH_DENTRY_R=
EFERENCED) {
37c4efc1ddf98b Yan, Zheng 2019-01-31  1437  			spin_lock(&mdsc->dentry_list=
_lock);
37c4efc1ddf98b Yan, Zheng 2019-01-31  1438  			if (di->flags & CEPH_DENTRY_=
LEASE_LIST) {
37c4efc1ddf98b Yan, Zheng 2019-01-31  1439  				list_add_tail(&di->lease_li=
st,
37c4efc1ddf98b Yan, Zheng 2019-01-31  1440  					      &mdsc->dentry_leases=
);
37c4efc1ddf98b Yan, Zheng 2019-01-31  1441  			} else {
37c4efc1ddf98b Yan, Zheng 2019-01-31  1442  				__dentry_dir_lease_touch(md=
sc, di);
37c4efc1ddf98b Yan, Zheng 2019-01-31  1443  			}
37c4efc1ddf98b Yan, Zheng 2019-01-31  1444  			spin_unlock(&mdsc->dentry_li=
st_lock);
37c4efc1ddf98b Yan, Zheng 2019-01-31  1445  		} else {
37c4efc1ddf98b Yan, Zheng 2019-01-31  1446  			freed++;
37c4efc1ddf98b Yan, Zheng 2019-01-31  1447  		}
37c4efc1ddf98b Yan, Zheng 2019-01-31  1448  =

37c4efc1ddf98b Yan, Zheng 2019-01-31  1449  		spin_unlock(&dentry->d_lock);
37c4efc1ddf98b Yan, Zheng 2019-01-31  1450  		/* ceph_d_delete() does the t=
rick */
37c4efc1ddf98b Yan, Zheng 2019-01-31  1451  		dput(dentry);
37c4efc1ddf98b Yan, Zheng 2019-01-31  1452  	}
37c4efc1ddf98b Yan, Zheng 2019-01-31  1453  	return freed;
37c4efc1ddf98b Yan, Zheng 2019-01-31  1454  }
37c4efc1ddf98b Yan, Zheng 2019-01-31  1455  =


:::::: The code at line 1431 was first introduced by commit
:::::: 37c4efc1ddf98ba8b234d116d863a9464445901e ceph: periodically trim sta=
le dentries

:::::: TO: Yan, Zheng <zyan@redhat.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0181233821100178165==--

