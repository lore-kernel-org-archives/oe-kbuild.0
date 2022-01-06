Content-Type: multipart/mixed; boundary="===============7904851104385634820=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ocfs2/dir.c:211:41: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Thu, 06 Jan 2022 19:41:24 +0800
Message-ID: <202201061936.V6HGIfIT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7904851104385634820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   75acfdb6fd922598a408a0d864486aeb167c1a97
commit: a52f8a59aef46b59753e583bf4b28fccb069ce64 fortify: Explicitly disabl=
e Clang support
date:   3 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-c007-20220105 (https://download.01.org/0day-ci/ar=
chive/20220106/202201061936.V6HGIfIT-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d5b6e3=
0ed3acad794dd0aec400e617daffc6cc3d)
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
                                                      ^~~~
   kernel/irq/affinity.c:230:3: note: '?' condition is false
                   if (node_vectors[n].ncpus =3D=3D UINT_MAX)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/irq/affinity.c:230:3: note: '?' condition is false
                   if (node_vectors[n].ncpus =3D=3D UINT_MAX)
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
   kernel/irq/affinity.c:230:3: note: Taking false branch
                   if (node_vectors[n].ncpus =3D=3D UINT_MAX)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/irq/affinity.c:233:3: note: '?' condition is false
                   WARN_ON_ONCE(numvecs =3D=3D 0);
                   ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/irq/affinity.c:233:3: note: '?' condition is true
                   WARN_ON_ONCE(numvecs =3D=3D 0);
                   ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
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
   kernel/irq/affinity.c:233:3: note: Taking true branch
                   WARN_ON_ONCE(numvecs =3D=3D 0);
                   ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/irq/affinity.c:233:3: note: Loop condition is false.  Exiting loop
                   WARN_ON_ONCE(numvecs =3D=3D 0);
                   ^
   include/asm-generic/bug.h:106:3: note: expanded from macro 'WARN_ON_ONCE'
                   __WARN_FLAGS(BUGFLAG_ONCE |                     \
                   ^
   arch/x86/include/asm/bug.h:79:2: note: expanded from macro '__WARN_FLAGS'
           _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));           \
           ^
   arch/x86/include/asm/bug.h:25:37: note: expanded from macro '_BUG_FLAGS'
   #define _BUG_FLAGS(ins, flags)                                          \
                                                                           ^
   kernel/irq/affinity.c:233:3: note: Loop condition is false.  Exiting loop
                   WARN_ON_ONCE(numvecs =3D=3D 0);
                   ^
   include/asm-generic/bug.h:106:3: note: expanded from macro 'WARN_ON_ONCE'
                   __WARN_FLAGS(BUGFLAG_ONCE |                     \
                   ^
   arch/x86/include/asm/bug.h:76:33: note: expanded from macro '__WARN_FLAG=
S'
   #define __WARN_FLAGS(flags)                                     \
                                                                   ^
   kernel/irq/affinity.c:237:22: note: Division by zero
                                    numvecs * ncpus / remaining_ncpus);
                                                    ^
   include/linux/minmax.h:112:59: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                                                   ^
   include/linux/minmax.h:38:17: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                                 ^
   include/linux/minmax.h:32:25: note: expanded from macro '__cmp_once'
                   typeof(y) unique_y =3D (y);               \
                                         ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> fs/ocfs2/dir.c:211:41: warning: Assigned value is garbage or undefined [=
clang-analyzer-core.uninitialized.Assign]
           __u32   a =3D in[0], b =3D in[1], c =3D in[2], d =3D in[3];
                                                    ^
   fs/ocfs2/dir.c:4247:6: note: Assuming 'namelen' is not equal to 0
           if (!namelen) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ocfs2/dir.c:4247:2: note: '?' condition is false
           if (!namelen) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ocfs2/dir.c:4247:7: note: 'namelen' is not equal to 0
           if (!namelen) {
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
   fs/ocfs2/dir.c:4247:2: note: '?' condition is false
           if (!namelen) {
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
   fs/ocfs2/dir.c:4247:2: note: Taking false branch
           if (!namelen) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ocfs2/dir.c:4264:2: note: '?' condition is false
           if (ocfs2_supports_indexed_dirs(osb))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ocfs2/dir.c:4264:2: note: '?' condition is true
           if (ocfs2_supports_indexed_dirs(osb))
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
   fs/ocfs2/dir.c:4264:2: note: Taking true branch
           if (ocfs2_supports_indexed_dirs(osb))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ocfs2/dir.c:4265:3: note: Calling 'ocfs2_dx_dir_name_hash'
                   ocfs2_dx_dir_name_hash(dir, name, namelen, &lookup->dl_h=
info);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   fs/ocfs2/dir.c:262:7: note: Assuming 'len' is not equal to 1
           if ((len =3D=3D 1 && !strncmp(".", name, 1)) ||
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ocfs2/dir.c:262:16: note: Left side of '&&' is false
           if ((len =3D=3D 1 && !strncmp(".", name, 1)) ||
                         ^
   fs/ocfs2/dir.c:263:7: note: Assuming 'len' is not equal to 2
               (len =3D=3D 2 && !strncmp("..", name, 2))) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
--
           list_for_each_entry(rdev, &cfg80211_rdev_list, list) {
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
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   net/wireless/nl80211.c:2879:2: note: Taking false branch
           list_for_each_entry(rdev, &cfg80211_rdev_list, list) {
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
   net/wireless/nl80211.c:2879:2: note: Loop condition is false.  Exiting l=
oop
           list_for_each_entry(rdev, &cfg80211_rdev_list, list) {
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
           do {                                                            \
           ^
   net/wireless/nl80211.c:2879:2: note: Loop condition is true.  Entering l=
oop body
           list_for_each_entry(rdev, &cfg80211_rdev_list, list) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   net/wireless/nl80211.c:2880:3: note: '?' condition is false
                   if (!net_eq(wiphy_net(&rdev->wiphy), sock_net(skb->sk)))
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/wireless/nl80211.c:2880:3: note: '?' condition is false
                   if (!net_eq(wiphy_net(&rdev->wiphy), sock_net(skb->sk)))
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
   net/wireless/nl80211.c:2880:3: note: Taking false branch
                   if (!net_eq(wiphy_net(&rdev->wiphy), sock_net(skb->sk)))
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/wireless/nl80211.c:2882:13: note: The right operand of '<=3D' is a g=
arbage value
                   if (++idx <=3D state->start)
                             ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
>> net/wireless/nl80211.c:8015:2: warning: Potential leak of memory pointed=
 to by 'rd' [clang-analyzer-unix.Malloc]
           kfree(rd);
           ^
   net/wireless/nl80211.c:7951:6: note: Assuming the condition is false
           if (!info->attrs[NL80211_ATTR_REG_ALPHA2])
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/wireless/nl80211.c:7951:2: note: '?' condition is false
           if (!info->attrs[NL80211_ATTR_REG_ALPHA2])
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/wireless/nl80211.c:7951:2: note: '?' condition is false
           if (!info->attrs[NL80211_ATTR_REG_ALPHA2])
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
   net/wireless/nl80211.c:7951:2: note: Taking false branch
           if (!info->attrs[NL80211_ATTR_REG_ALPHA2])
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/wireless/nl80211.c:7954:6: note: Assuming the condition is false
           if (!info->attrs[NL80211_ATTR_REG_RULES])
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/wireless/nl80211.c:7954:2: note: '?' condition is false
           if (!info->attrs[NL80211_ATTR_REG_RULES])
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/wireless/nl80211.c:7954:2: note: '?' condition is false
           if (!info->attrs[NL80211_ATTR_REG_RULES])
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
   net/wireless/nl80211.c:7954:2: note: Taking false branch
           if (!info->attrs[NL80211_ATTR_REG_RULES])
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/wireless/nl80211.c:7959:2: note: Assuming the condition is true
           if (info->attrs[NL80211_ATTR_DFS_REGION])
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/wireless/nl80211.c:7959:2: note: '?' condition is false
           if (info->attrs[NL80211_ATTR_DFS_REGION])
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/wireless/nl80211.c:7959:2: note: '?' condition is false
           if (info->attrs[NL80211_ATTR_DFS_REGION])
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))

vim +211 fs/ocfs2/dir.c

9b7895efac906d Mark Fasheh 2008-11-12  206  =

9b7895efac906d Mark Fasheh 2008-11-12  207  static void TEA_transform(__u32=
 buf[4], __u32 const in[])
9b7895efac906d Mark Fasheh 2008-11-12  208  {
9b7895efac906d Mark Fasheh 2008-11-12  209  	__u32	sum =3D 0;
9b7895efac906d Mark Fasheh 2008-11-12  210  	__u32	b0 =3D buf[0], b1 =3D bu=
f[1];
9b7895efac906d Mark Fasheh 2008-11-12 @211  	__u32	a =3D in[0], b =3D in[1]=
, c =3D in[2], d =3D in[3];
9b7895efac906d Mark Fasheh 2008-11-12  212  	int	n =3D 16;
9b7895efac906d Mark Fasheh 2008-11-12  213  =

9b7895efac906d Mark Fasheh 2008-11-12  214  	do {
9b7895efac906d Mark Fasheh 2008-11-12  215  		sum +=3D DELTA;
9b7895efac906d Mark Fasheh 2008-11-12  216  		b0 +=3D ((b1 << 4)+a) ^ (b1+s=
um) ^ ((b1 >> 5)+b);
9b7895efac906d Mark Fasheh 2008-11-12  217  		b1 +=3D ((b0 << 4)+c) ^ (b0+s=
um) ^ ((b0 >> 5)+d);
9b7895efac906d Mark Fasheh 2008-11-12  218  	} while (--n);
9b7895efac906d Mark Fasheh 2008-11-12  219  =

9b7895efac906d Mark Fasheh 2008-11-12  220  	buf[0] +=3D b0;
9b7895efac906d Mark Fasheh 2008-11-12  221  	buf[1] +=3D b1;
9b7895efac906d Mark Fasheh 2008-11-12  222  }
9b7895efac906d Mark Fasheh 2008-11-12  223  =


:::::: The code at line 211 was first introduced by commit
:::::: 9b7895efac906d66d19856194e1ba61f37e231a4 ocfs2: Add a name indexed b=
-tree to directory inodes

:::::: TO: Mark Fasheh <mfasheh@suse.com>
:::::: CC: Mark Fasheh <mfasheh@suse.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7904851104385634820==--

