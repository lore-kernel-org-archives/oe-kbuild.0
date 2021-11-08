Content-Type: multipart/mixed; boundary="===============3493438322220557230=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/dlm/plock.c:97:17: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Mon, 08 Nov 2021 20:49:26 +0800
Message-ID: <202111082009.TDH4EZyh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3493438322220557230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6b75d88fa81b122cce37ebf17428a849ccd3d0f1
commit: a52f8a59aef46b59753e583bf4b28fccb069ce64 fortify: Explicitly disabl=
e Clang support
date:   6 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-c007-20211002 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 962e50=
3cc8bc411f7523cc393acae8aae425b1c4)
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
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   fs/xfs/libxfs/xfs_defer.c:492:9: note: Loop condition is false.  Exiting=
 loop
                   dfp =3D list_first_entry(&dop_pending, struct xfs_defer_=
pending,
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
   fs/xfs/libxfs/xfs_defer.c:494:11: note: Calling 'xfs_defer_finish_one'
                   error =3D xfs_defer_finish_one(*tp, dfp);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_defer.c:413:2: note: 'error' declared without an initi=
al value
           int                             error;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_defer.c:418:2: note: Loop condition is false. Executio=
n continues on line 441
           list_for_each_safe(li, n, &dfp->dfp_work) {
           ^
   include/linux/list.h:598:2: note: expanded from macro 'list_for_each_saf=
e'
           for (pos =3D (head)->next, n =3D pos->next; pos !=3D (head); \
           ^
   fs/xfs/libxfs/xfs_defer.c:444:2: note: Assuming field 'finish_cleanup' i=
s null
           if (ops->finish_cleanup)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/xfs/libxfs/xfs_defer.c:444:2: note: '?' condition is false
           if (ops->finish_cleanup)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/xfs/libxfs/xfs_defer.c:444:11: note: Field 'finish_cleanup' is null
           if (ops->finish_cleanup)
                    ^
   fs/xfs/libxfs/xfs_defer.c:444:2: note: '?' condition is false
           if (ops->finish_cleanup)
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
   fs/xfs/libxfs/xfs_defer.c:444:2: note: Taking false branch
           if (ops->finish_cleanup)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/xfs/libxfs/xfs_defer.c:446:2: note: Undefined or garbage value return=
ed to caller
           return error;
           ^      ~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> fs/dlm/plock.c:97:17: warning: The left expression of the compound assig=
nment is an uninitialized value. The computed value will also be garbage [c=
lang-analyzer-core.uninitialized.Assign]
           op->info.flags |=3D DLM_PLOCK_FL_CLOSE;
                          ^
   fs/dlm/plock.c:110:6: note: Assuming 'ls' is non-null
           if (!ls)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/dlm/plock.c:110:2: note: '?' condition is false
           if (!ls)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/dlm/plock.c:110:7: note: 'ls' is non-null
           if (!ls)
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
   fs/dlm/plock.c:110:2: note: '?' condition is false
           if (!ls)
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
   fs/dlm/plock.c:110:2: note: Taking false branch
           if (!ls)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/dlm/plock.c:114:6: note: Assuming 'xop' is non-null
           if (!xop) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/dlm/plock.c:114:2: note: '?' condition is false
           if (!xop) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/dlm/plock.c:114:7: note: 'xop' is non-null
           if (!xop) {
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
   fs/dlm/plock.c:114:2: note: '?' condition is false
           if (!xop) {
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
   fs/dlm/plock.c:114:2: note: Taking false branch
           if (!xop) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/dlm/plock.c:122:18: note: Assuming field 'fl_type' is equal to F_WRLCK
           op->info.ex             =3D (fl->fl_type =3D=3D F_WRLCK);
--
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ecryptfs/keystore.c:1888:4: note: Control jumps to line 1898
                           goto found_matching_auth_tok;
                           ^
   fs/ecryptfs/keystore.c:1898:6: note: Assuming field 'token_type' is not =
equal to ECRYPTFS_PRIVATE_KEY
           if (candidate_auth_tok->token_type =3D=3D ECRYPTFS_PRIVATE_KEY) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ecryptfs/keystore.c:1898:2: note: '?' condition is false
           if (candidate_auth_tok->token_type =3D=3D ECRYPTFS_PRIVATE_KEY) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ecryptfs/keystore.c:1898:26: note: Field 'token_type' is not equal to=
 ECRYPTFS_PRIVATE_KEY
           if (candidate_auth_tok->token_type =3D=3D ECRYPTFS_PRIVATE_KEY) {
                                   ^
   fs/ecryptfs/keystore.c:1898:2: note: '?' condition is false
           if (candidate_auth_tok->token_type =3D=3D ECRYPTFS_PRIVATE_KEY) {
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
   fs/ecryptfs/keystore.c:1898:2: note: Taking false branch
           if (candidate_auth_tok->token_type =3D=3D ECRYPTFS_PRIVATE_KEY) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ecryptfs/keystore.c:1906:13: note: Assuming field 'token_type' is equ=
al to ECRYPTFS_PASSWORD
           } else if (candidate_auth_tok->token_type =3D=3D ECRYPTFS_PASSWO=
RD) {
                      ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ecryptfs/keystore.c:1906:9: note: '?' condition is false
           } else if (candidate_auth_tok->token_type =3D=3D ECRYPTFS_PASSWO=
RD) {
                  ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ecryptfs/keystore.c:1906:33: note: Field 'token_type' is equal to ECR=
YPTFS_PASSWORD
           } else if (candidate_auth_tok->token_type =3D=3D ECRYPTFS_PASSWO=
RD) {
                                          ^
   fs/ecryptfs/keystore.c:1906:9: note: '?' condition is true
           } else if (candidate_auth_tok->token_type =3D=3D ECRYPTFS_PASSWO=
RD) {
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
   fs/ecryptfs/keystore.c:1906:9: note: Taking true branch
           } else if (candidate_auth_tok->token_type =3D=3D ECRYPTFS_PASSWO=
RD) {
                  ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ecryptfs/keystore.c:1907:3: note: Null pointer passed as 2nd argument=
 to memory copy function
                   memcpy(&(candidate_auth_tok->token.password),
                   ^
   fs/ecryptfs/keystore.c:2302:2: warning: Value stored to 'rc' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           rc =3D 0;
           ^    ~
   fs/ecryptfs/keystore.c:2302:2: note: Value stored to 'rc' is never read
           rc =3D 0;
           ^    ~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> fs/buffer.c:726:11: warning: Assigned value is garbage or undefined [cla=
ng-analyzer-core.uninitialized.Assign]
                   mapping =3D bh->b_assoc_map;
                           ^ ~~~~~~~~~~~~~~~
   fs/buffer.c:681:2: note: Calling 'INIT_LIST_HEAD'
           INIT_LIST_HEAD(&tmp);
           ^~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:35:2: note: Left side of '||' is false
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
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
   include/linux/list.h:35:2: note: Left side of '||' is false
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
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
   include/linux/list.h:35:2: note: Left side of '||' is false
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
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
   include/linux/list.h:35:2: note: Left side of '||' is true
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   include/linux/list.h:35:2: note: '?' condition is true
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
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
   include/linux/list.h:35:2: note: Left side of '||' is false
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
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
   include/linux/list.h:35:2: note: Left side of '||' is false
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
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
   include/linux/list.h:35:2: note: Left side of '||' is false
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
--
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
   fs/splice.c:632:16: note: 'array' is non-null
           if (unlikely(!array))
                         ^
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
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
   fs/splice.c:632:2: note: '?' condition is false
           if (unlikely(!array))
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
   fs/splice.c:632:2: note: Taking false branch
           if (unlikely(!array))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/splice.c:638:2: note: Loop condition is false. Execution continues on=
 line 717
           while (sd.total_len) {
           ^
   fs/splice.c:722:2: note: '?' condition is false
           if (sd.num_spliced)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/splice.c:722:9: note: Field 'num_spliced' is 0
           if (sd.num_spliced)
                  ^
   fs/splice.c:722:2: note: '?' condition is false
           if (sd.num_spliced)
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
   fs/splice.c:722:2: note: Taking false branch
           if (sd.num_spliced)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/splice.c:725:2: note: Undefined or garbage value returned to caller
           return ret;
           ^      ~~~
   fs/splice.c:853:2: warning: Value stored to 'ret' is never read [clang-a=
nalyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   fs/splice.c:853:2: note: Value stored to 'ret' is never read
           ret =3D 0;
           ^     ~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   fs/ocfs2/cluster/nodemanager.c:593:2: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(node->nd_name, name); /* use item.ci_namebuf instead? */
           ^~~~~~
   fs/ocfs2/cluster/nodemanager.c:593:2: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
           strcpy(node->nd_name, name); /* use item.ci_namebuf instead? */
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> fs/ocfs2/cluster/tcp.c:1884:2: warning: Use of memory after it is freed =
[clang-analyzer-unix.Malloc]
           o2net_sendpage(sc, o2net_hand, sizeof(*o2net_hand));
           ^              ~~
   fs/ocfs2/cluster/tcp.c:1791:9: note: Assuming 'sock' is not equal to null
           BUG_ON(sock =3D=3D NULL);
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ocfs2/cluster/tcp.c:1791:9: note: 'sock' is not equal to null
           BUG_ON(sock =3D=3D NULL);
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ocfs2/cluster/tcp.c:1791:2: note: '?' condition is false
           BUG_ON(sock =3D=3D NULL);
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ocfs2/cluster/tcp.c:1791:9: note: 'sock' is not equal to null
           BUG_ON(sock =3D=3D NULL);
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
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
   fs/ocfs2/cluster/tcp.c:1791:9: note: 'sock' is not equal to null
           BUG_ON(sock =3D=3D NULL);
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
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
   fs/ocfs2/cluster/tcp.c:1791:2: note: '?' condition is false
           BUG_ON(sock =3D=3D NULL);
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
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
   fs/ext4/mballoc.c:3356:4: note: Taking false branch
                           if (grp !=3D load_grp) {
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/mballoc.c:3371:4: note: Calling 'ext4_try_to_trim_range'
                           ext4_try_to_trim_range(sb, &e4b, fd->efd_start_c=
luster,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   fs/ext4/mballoc.c:6304:9: note: Assigned value is garbage or undefined
           bitmap =3D e4b->bd_bitmap;
                  ^ ~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6320:4: warning: Value stored to 'ret' is never read [=
clang-analyzer-deadcode.DeadStores]
                           ret =3D 0;
                           ^     ~
   fs/ext4/mballoc.c:6320:4: note: Value stored to 'ret' is never read
                           ret =3D 0;
                           ^     ~
   Suppressed 2 warnings (2 in non-user code).
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
   arch/x86/kernel/signal.c:472:2: warning: Value stored to 'uc_flags' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           uc_flags =3D frame_uc_flags(regs);
           ^          ~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/signal.c:472:2: note: Value stored to 'uc_flags' is neve=
r read
           uc_flags =3D frame_uc_flags(regs);
           ^          ~~~~~~~~~~~~~~~~~~~~
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/btrfs/xattr.c:486:3: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, XATTR_SECURITY_PREFIX);
                   ^~~~~~
   fs/btrfs/xattr.c:486:3: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
                   strcpy(name, XATTR_SECURITY_PREFIX);
                   ^~~~~~
   fs/btrfs/xattr.c:487:3: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name + XATTR_SECURITY_PREFIX_LEN, xattr->name);
                   ^~~~~~
   fs/btrfs/xattr.c:487:3: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
                   strcpy(name + XATTR_SECURITY_PREFIX_LEN, xattr->name);
                   ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> arch/x86/include/asm/atomic.h:29:2: warning: Undefined or garbage value =
returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return __READ_ONCE((v)->counter);
           ^
   fs/btrfs/ordered-data.c:688:2: note: Calling 'INIT_LIST_HEAD'
           INIT_LIST_HEAD(&splice);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:35:2: note: Left side of '||' is false
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
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
   include/linux/list.h:35:2: note: Left side of '||' is false
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
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
   include/linux/list.h:35:2: note: Left side of '||' is false
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
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
   include/linux/list.h:35:2: note: Left side of '||' is true
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   include/linux/list.h:35:2: note: '?' condition is true
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
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
   include/linux/list.h:35:2: note: Left side of '||' is false
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
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
   include/linux/list.h:35:2: note: Left side of '||' is false
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
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
   include/linux/list.h:35:2: note: Left side of '||' is false
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
--
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
   13 warnings generated.
   crypto/sm3_generic.c:121:2: warning: Value stored to 'a' is never read [=
clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:2: note: Value stored to 'a' is never read
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:6: warning: Although the value stored to 'b' is=
 used in the enclosing expression, the value is never actually read from 'b=
' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:6: note: Although the value stored to 'b' is us=
ed in the enclosing expression, the value is never actually read from 'b'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:10: warning: Although the value stored to 'c' i=
s used in the enclosing expression, the value is never actually read from '=
c' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:10: note: Although the value stored to 'c' is u=
sed in the enclosing expression, the value is never actually read from 'c'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:14: warning: Although the value stored to 'd' i=
s used in the enclosing expression, the value is never actually read from '=
d' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:14: note: Although the value stored to 'd' is u=
sed in the enclosing expression, the value is never actually read from 'd'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:18: warning: Although the value stored to 'e' i=
s used in the enclosing expression, the value is never actually read from '=
e' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:18: note: Although the value stored to 'e' is u=
sed in the enclosing expression, the value is never actually read from 'e'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:22: warning: Although the value stored to 'f' i=
s used in the enclosing expression, the value is never actually read from '=
f' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:22: note: Although the value stored to 'f' is u=
sed in the enclosing expression, the value is never actually read from 'f'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:26: warning: Although the value stored to 'g' i=
s used in the enclosing expression, the value is never actually read from '=
g' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:26: note: Although the value stored to 'g' is u=
sed in the enclosing expression, the value is never actually read from 'g'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:30: warning: Although the value stored to 'h' i=
s used in the enclosing expression, the value is never actually read from '=
h' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:30: note: Although the value stored to 'h' is u=
sed in the enclosing expression, the value is never actually read from 'h'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:34: warning: Although the value stored to 'ss1'=
 is used in the enclosing expression, the value is never actually read from=
 'ss1' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                           ^     ~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:34: note: Although the value stored to 'ss1' is=
 used in the enclosing expression, the value is never actually read from 's=
s1'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                           ^     ~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:40: warning: Although the value stored to 'ss2'=
 is used in the enclosing expression, the value is never actually read from=
 'ss2' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                                 ^     ~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:40: note: Although the value stored to 'ss2' is=
 used in the enclosing expression, the value is never actually read from 's=
s2'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                                 ^     ~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:46: warning: Although the value stored to 'tt1'=
 is used in the enclosing expression, the value is never actually read from=
 'tt1' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                                       ^     ~~~~~~~
   crypto/sm3_generic.c:121:46: note: Although the value stored to 'tt1' is=
 used in the enclosing expression, the value is never actually read from 't=
t1'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                                       ^     ~~~~~~~
   crypto/sm3_generic.c:121:52: warning: Although the value stored to 'tt2'=
 is used in the enclosing expression, the value is never actually read from=
 'tt2' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                                             ^     ~
   crypto/sm3_generic.c:121:52: note: Although the value stored to 'tt2' is=
 used in the enclosing expression, the value is never actually read from 't=
t2'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                                             ^     ~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> fs/hpfs/dnode.c:252:2: warning: Potential leak of memory pointed to by '=
nname' [clang-analyzer-unix.Malloc]
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   fs/hpfs/dnode.c:252:16: note: Memory is allocated
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:252:8: note: Assuming 'nname' is non-null
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:252:2: note: '?' condition is false
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:252:8: note: Assuming 'nname' is non-null
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
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
   fs/hpfs/dnode.c:252:2: note: '?' condition is false
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
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
   fs/hpfs/dnode.c:252:2: note: Potential leak of memory pointed to by 'nna=
me'
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
>> fs/hpfs/dnode.c:289:11: warning: Potential leak of memory pointed to by =
'nd' [clang-analyzer-unix.Malloc]
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
                    ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   fs/hpfs/dnode.c:252:8: note: Assuming 'nname' is null
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:252:2: note: '?' condition is false
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:252:8: note: Assuming 'nname' is non-null
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
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
   fs/hpfs/dnode.c:252:2: note: '?' condition is false
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
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
   fs/hpfs/dnode.c:252:2: note: Taking false branch
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/dnode.c:257:6: note: Assuming 'namelen' is < 256
           if (namelen >=3D 256) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:257:2: note: '?' condition is false
           if (namelen >=3D 256) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:257:6: note: 'namelen' is < 256
           if (namelen >=3D 256) {
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
   fs/hpfs/dnode.c:257:2: note: '?' condition is false
           if (namelen >=3D 256) {
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
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:289:7: note: 'nd' is null
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
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
   fs/hpfs/dnode.c:289:2: note: '?' condition is true
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
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
   fs/hpfs/dnode.c:289:2: note: Taking true branch
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/dnode.c:289:22: note: Memory is allocated
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:289:17: note: Assuming 'nd' is non-null
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
                          ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:289:11: note: '?' condition is false
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
                    ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:289:17: note: Assuming 'nd' is non-null
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
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
   fs/hpfs/dnode.c:289:11: note: '?' condition is false
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
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
   fs/hpfs/dnode.c:289:11: note: Potential leak of memory pointed to by 'nd'
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
                    ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
>> fs/hpfs/dnode.c:496:2: warning: Potential leak of memory pointed to by '=
nde' [clang-analyzer-unix.Malloc]
           if (!(nde =3D kmalloc(le16_to_cpu(de->length), GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   fs/hpfs/dnode.c:444:2: note: Loop condition is true.  Entering loop body
           while (1) {
           ^
   fs/hpfs/dnode.c:445:3: note: Assuming field 'sb_chk' is 0
                   if (hpfs_sb(i->i_sb)->sb_chk)
                   ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:445:3: note: '?' condition is false
                   if (hpfs_sb(i->i_sb)->sb_chk)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:445:25: note: Field 'sb_chk' is 0
                   if (hpfs_sb(i->i_sb)->sb_chk)
                                         ^
   fs/hpfs/dnode.c:445:3: note: '?' condition is false
                   if (hpfs_sb(i->i_sb)->sb_chk)
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
   fs/hpfs/dnode.c:445:3: note: Taking false branch
                   if (hpfs_sb(i->i_sb)->sb_chk)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/dnode.c:448:9: note: Assuming 'dnode' is non-null
                   if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) ret=
urn 0;
                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:448:3: note: '?' condition is false
                   if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) ret=
urn 0;
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:448:9: note: Assuming 'dnode' is non-null
                   if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) ret=
urn 0;
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
   fs/hpfs/dnode.c:448:3: note: '?' condition is false
                   if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) ret=
urn 0;
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
   fs/hpfs/dnode.c:448:3: note: Taking false branch
                   if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) ret=
urn 0;
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:463:12: note: Field 'down' is 0
                   if (!de->down) break;
                            ^
   fs/hpfs/dnode.c:463:3: note: '?' condition is true
                   if (!de->down) break;
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
   fs/hpfs/dnode.c:463:3: note: Taking true branch
                   if (!de->down) break;
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/dnode.c:463:18: note:  Execution continues on line 467
                   if (!de->down) break;
                                  ^
   fs/hpfs/dnode.c:467:11: note: Assuming 'de' is non-null
           while (!(de =3D dnode_pre_last_de(dnode))) {
                    ^~
   fs/hpfs/dnode.c:467:2: note: Loop condition is false. Execution continue=
s on line 493
           while (!(de =3D dnode_pre_last_de(dnode))) {
           ^
   fs/hpfs/dnode.c:496:14: note: Memory is allocated
           if (!(nde =3D kmalloc(le16_to_cpu(de->length), GFP_NOFS))) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:496:8: note: Assuming 'nde' is non-null
           if (!(nde =3D kmalloc(le16_to_cpu(de->length), GFP_NOFS))) {
                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:496:2: note: '?' condition is false
           if (!(nde =3D kmalloc(le16_to_cpu(de->length), GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:496:8: note: Assuming 'nde' is non-null
           if (!(nde =3D kmalloc(le16_to_cpu(de->length), GFP_NOFS))) {
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
   fs/hpfs/dnode.c:496:2: note: '?' condition is false
           if (!(nde =3D kmalloc(le16_to_cpu(de->length), GFP_NOFS))) {
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
   fs/hpfs/dnode.c:496:2: note: Potential leak of memory pointed to by 'nde'
           if (!(nde =3D kmalloc(le16_to_cpu(de->length), GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
>> fs/hpfs/dnode.c:610:3: warning: Potential leak of memory pointed to by '=
de_cp' [clang-analyzer-unix.Malloc]
                   if (!(de_cp =3D kmalloc(le16_to_cpu(de->length), GFP_NOF=
S))) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   fs/hpfs/dnode.c:528:2: note: Assuming the condition is false
           if (hpfs_stop_cycles(i->i_sb, dno, &c1, &c2, "delete_empty_dnode=
")) return;
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:528:2: note: '?' condition is false
           if (hpfs_stop_cycles(i->i_sb, dno, &c1, &c2, "delete_empty_dnode=
")) return;
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:528:2: note: Assuming the condition is true
           if (hpfs_stop_cycles(i->i_sb, dno, &c1, &c2, "delete_empty_dnode=
")) return;
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
   fs/hpfs/dnode.c:528:2: note: '?' condition is false
           if (hpfs_stop_cycles(i->i_sb, dno, &c1, &c2, "delete_empty_dnode=
")) return;
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
   fs/hpfs/dnode.c:528:2: note: Taking false branch
           if (hpfs_stop_cycles(i->i_sb, dno, &c1, &c2, "delete_empty_dnode=
")) return;
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/dnode.c:529:8: note: Assuming 'dnode' is non-null
           if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) return;
                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:529:2: note: '?' condition is false
           if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) return;
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:529:8: note: Assuming 'dnode' is non-null
           if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) return;
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
   fs/hpfs/dnode.c:529:2: note: '?' condition is false
           if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) return;
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
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/encrypted-keys/encrypted.c:360:16: note: Returned allocate=
d memory
           derived_buf =3D kzalloc(derived_buf_len, GFP_KERNEL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/encrypted-keys/encrypted.c:361:6: note: Assuming 'derived_=
buf' is non-null
           if (!derived_buf)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/keys/encrypted-keys/encrypted.c:361:2: note: '?' condition is f=
alse
           if (!derived_buf)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/keys/encrypted-keys/encrypted.c:361:7: note: 'derived_buf' is n=
on-null
           if (!derived_buf)
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
   security/keys/encrypted-keys/encrypted.c:361:2: note: '?' condition is f=
alse
           if (!derived_buf)
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
   security/keys/encrypted-keys/encrypted.c:361:2: note: Taking false branch
           if (!derived_buf)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/encrypted-keys/encrypted.c:364:2: note: '?' condition is f=
alse
           if (key_type)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/keys/encrypted-keys/encrypted.c:364:6: note: 'key_type' is 0
           if (key_type)
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
   security/keys/encrypted-keys/encrypted.c:364:2: note: '?' condition is f=
alse
           if (key_type)
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
   security/keys/encrypted-keys/encrypted.c:364:2: note: Taking false branch
           if (key_type)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/encrypted-keys/encrypted.c:374:2: note: Potential leak of =
memory pointed to by 'derived_buf'
           return ret;
           ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
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
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
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
   4 warnings generated.
>> fs/hpfs/ea.c:54:2: warning: Potential leak of memory pointed to by 'ret'=
 [clang-analyzer-unix.Malloc]
           if (!(ret =3D kmalloc(size + 1, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   fs/hpfs/ea.c:138:29: note: Assuming 'ea' is < 'ea_end'
           for (ea =3D fnode_ea(fnode); ea < ea_end; ea =3D next_ea(ea))
                                      ^~~~~~~~~~~
   fs/hpfs/ea.c:138:2: note: Loop condition is true.  Entering loop body
           for (ea =3D fnode_ea(fnode); ea < ea_end; ea =3D next_ea(ea))
           ^
   fs/hpfs/ea.c:139:3: note: '?' condition is false
                   if (!strcmp(ea->name, key)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/ea.c:139:7: note: Assuming the condition is false
                   if (!strcmp(ea->name, key)) {
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
   fs/hpfs/ea.c:139:3: note: '?' condition is false
                   if (!strcmp(ea->name, key)) {
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
   fs/hpfs/ea.c:139:3: note: Taking false branch
                   if (!strcmp(ea->name, key)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/ea.c:138:29: note: Assuming 'ea' is < 'ea_end'
           for (ea =3D fnode_ea(fnode); ea < ea_end; ea =3D next_ea(ea))
                                      ^~~~~~~~~~~
   fs/hpfs/ea.c:138:2: note: Loop condition is true.  Entering loop body
           for (ea =3D fnode_ea(fnode); ea < ea_end; ea =3D next_ea(ea))
           ^
   fs/hpfs/ea.c:139:3: note: '?' condition is false
                   if (!strcmp(ea->name, key)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/ea.c:139:7: note: Assuming the condition is false
                   if (!strcmp(ea->name, key)) {
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
   fs/hpfs/ea.c:139:3: note: '?' condition is false
                   if (!strcmp(ea->name, key)) {
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
   fs/hpfs/ea.c:139:3: note: Taking false branch
                   if (!strcmp(ea->name, key)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
   include/linux/slab.h:721:9: note: Storing uninitialized value
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/assoc_array.c:1093:9: note: Returning from 'kzalloc'
           edit =3D kzalloc(sizeof(struct assoc_array_edit), GFP_KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/assoc_array.c:1094:6: note: Assuming 'edit' is non-null
           if (!edit)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   lib/assoc_array.c:1094:2: note: '?' condition is false
           if (!edit)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   lib/assoc_array.c:1094:7: note: 'edit' is non-null
           if (!edit)
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
   lib/assoc_array.c:1094:2: note: '?' condition is false
           if (!edit)
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
   lib/assoc_array.c:1094:2: note: Taking false branch
           if (!edit)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   lib/assoc_array.c:1100:2: note: Control jumps to 'case assoc_array_walk_=
found_wrong_shortcut:'  at line 1118
           switch (assoc_array_walk(array, ops, index_key, &result)) {
           ^
   lib/assoc_array.c:1120:3: note: Calling 'assoc_array_cancel_edit'
                   assoc_array_cancel_edit(edit);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/assoc_array.c:1415:2: note: '?' condition is true
           pr_devel("-->%s()\n", __func__);
           ^
   include/linux/printk.h:548:2: note: expanded from macro 'pr_devel'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   lib/assoc_array.c:1415:2: note: Taking false branch
           pr_devel("-->%s()\n", __func__);
           ^
   include/linux/printk.h:548:2: note: expanded from macro 'pr_devel'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   lib/assoc_array.c:1418:7: note: The value 0 is assigned to 'i'
           for (i =3D 0; i < ARRAY_SIZE(edit->new_meta); i++) {
                ^~~~~
   lib/assoc_array.c:1418:2: note: Loop condition is true.  Entering loop b=
ody
           for (i =3D 0; i < ARRAY_SIZE(edit->new_meta); i++) {
           ^
   lib/assoc_array.c:1419:7: note: Assigned value is garbage or undefined
                   ptr =3D edit->new_meta[i];
                       ^ ~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> arch/x86/kernel/cpu/sgx/main.c:80:2: warning: Address of stack memory as=
sociated with local variable 'dirty' is still referred to by the global var=
iable 'sgx_dirty_page_list' upon returning to the caller.  This will be a d=
angling reference [clang-analyzer-core.StackAddressEscape]
           list_splice(&dirty, dirty_page_list);
           ^
   arch/x86/kernel/cpu/sgx/main.c:424:2: note: Calling '__sgx_sanitize_page=
s'
           __sgx_sanitize_pages(&sgx_dirty_page_list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/sgx/main.c:58:9: note: Assuming the condition is fal=
se
           while (!list_empty(dirty_page_list)) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/sgx/main.c:58:2: note: Loop condition is false. Exec=
ution continues on line 80
           while (!list_empty(dirty_page_list)) {
           ^
   arch/x86/kernel/cpu/sgx/main.c:80:2: note: Address of stack memory assoc=
iated with local variable 'dirty' is still referred to by the global variab=
le 'sgx_dirty_page_list' upon returning to the caller.  This will be a dang=
ling reference
           list_splice(&dirty, dirty_page_list);
           ^
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
   lib/ts_bm.c:83:11: warning: Although the value stored to 'consumed' is u=
sed in the enclosing expression, the value is never actually read from 'con=
sumed' [clang-analyzer-deadcode.DeadStores]
                           return consumed +=3D (shift-(bm->patlen-1));
                                  ^           ~~~~~~~~~~~~~~~~~~~~~~
   lib/ts_bm.c:83:11: note: Although the value stored to 'consumed' is used=
 in the enclosing expression, the value is never actually read from 'consum=
ed'
                           return consumed +=3D (shift-(bm->patlen-1));
                                  ^           ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   lib/ts_fsm.c:128:2: warning: Access to field 'type' results in a derefer=
ence of a null pointer (loaded from variable 't') [clang-analyzer-core.Null=
Dereference]
           if (t->type)
           ^
   include/linux/compiler.h:56:46: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                ^
   lib/ts_fsm.c:157:6: note: 'block_idx' is >=3D 'block_len'
           if (end_of_data())
               ^
   lib/ts_fsm.c:155:32: note: expanded from macro 'end_of_data'
   #define end_of_data() unlikely(block_idx >=3D block_len && !GET_NEXT_BLO=
CK())
                                  ^~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   lib/ts_fsm.c:157:6: note: Left side of '&&' is true
           if (end_of_data())
               ^
   lib/ts_fsm.c:155:32: note: expanded from macro 'end_of_data'
   #define end_of_data() unlikely(block_idx >=3D block_len && !GET_NEXT_BLO=
CK())
                                  ^
   lib/ts_fsm.c:157:6: note: Assuming the condition is false
           if (end_of_data())
               ^
   lib/ts_fsm.c:155:58: note: expanded from macro 'end_of_data'
   #define end_of_data() unlikely(block_idx >=3D block_len && !GET_NEXT_BLO=
CK())
                                                            ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   lib/ts_fsm.c:157:6: note: 'block_idx' is < 'block_len'
           if (end_of_data())
               ^
   lib/ts_fsm.c:155:32: note: expanded from macro 'end_of_data'
   #define end_of_data() unlikely(block_idx >=3D block_len && !GET_NEXT_BLO=
CK())
                                  ^~~~~~~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
--
   include/asm-generic/bug.h:131:2: note: expanded from macro 'WARN'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   lib/math/reciprocal_div.c:47:2: note: Loop condition is false.  Exiting =
loop
           WARN(l =3D=3D 32,
           ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN'
                   __WARN_printf(TAINT_WARN, format);                      \
                   ^
   include/asm-generic/bug.h:98:3: note: expanded from macro '__WARN_printf'
                   instrumentation_begin();                                \
                   ^
   include/linux/instrumentation.h:57:34: note: expanded from macro 'instru=
mentation_begin'
   # define instrumentation_begin()        do { } while(0)
                                           ^
   lib/math/reciprocal_div.c:47:2: note: Loop condition is false.  Exiting =
loop
           WARN(l =3D=3D 32,
           ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN'
                   __WARN_printf(TAINT_WARN, format);                      \
                   ^
   include/asm-generic/bug.h:100:3: note: expanded from macro '__WARN_print=
f'
                   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint))=
;\
                   ^
   arch/x86/include/asm/bug.h:78:2: note: expanded from macro '__WARN_FLAGS'
           instrumentation_begin();                                \
           ^
   include/linux/instrumentation.h:57:34: note: expanded from macro 'instru=
mentation_begin'
   # define instrumentation_begin()        do { } while(0)
                                           ^
   lib/math/reciprocal_div.c:47:2: note: Loop condition is false.  Exiting =
loop
           WARN(l =3D=3D 32,
           ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN'
                   __WARN_printf(TAINT_WARN, format);                      \
                   ^
   include/asm-generic/bug.h:100:3: note: expanded from macro '__WARN_print=
f'
                   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint))=
;\
                   ^
   arch/x86/include/asm/bug.h:79:2: note: expanded from macro '__WARN_FLAGS'
           _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));           \
           ^
   arch/x86/include/asm/bug.h:25:37: note: expanded from macro '_BUG_FLAGS'
   #define _BUG_FLAGS(ins, flags)                                          \
                                                                           ^
   lib/math/reciprocal_div.c:47:2: note: Loop condition is false.  Exiting =
loop
           WARN(l =3D=3D 32,
           ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN'
                   __WARN_printf(TAINT_WARN, format);                      \
                   ^
   include/asm-generic/bug.h:100:3: note: expanded from macro '__WARN_print=
f'
                   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint))=
;\
                   ^
   arch/x86/include/asm/bug.h:81:2: note: expanded from macro '__WARN_FLAGS'
           instrumentation_end();                                  \
           ^
   include/linux/instrumentation.h:58:33: note: expanded from macro 'instru=
mentation_end'
   # define instrumentation_end()          do { } while(0)
                                           ^
   lib/math/reciprocal_div.c:47:2: note: Loop condition is false.  Exiting =
loop
           WARN(l =3D=3D 32,
           ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN'
                   __WARN_printf(TAINT_WARN, format);                      \
                   ^
   include/asm-generic/bug.h:100:3: note: expanded from macro '__WARN_print=
f'
                   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint))=
;\
                   ^
   arch/x86/include/asm/bug.h:76:33: note: expanded from macro '__WARN_FLAG=
S'
   #define __WARN_FLAGS(flags)                                     \
                                                                   ^
   lib/math/reciprocal_div.c:47:2: note: Loop condition is false.  Exiting =
loop
           WARN(l =3D=3D 32,
           ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN'
                   __WARN_printf(TAINT_WARN, format);                      \
                   ^
   include/asm-generic/bug.h:101:3: note: expanded from macro '__WARN_print=
f'
                   instrumentation_end();                                  \
                   ^
   include/linux/instrumentation.h:58:33: note: expanded from macro 'instru=
mentation_end'
   # define instrumentation_end()          do { } while(0)
                                           ^
   lib/math/reciprocal_div.c:47:2: note: Loop condition is false.  Exiting =
loop
           WARN(l =3D=3D 32,
           ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN'
                   __WARN_printf(TAINT_WARN, format);                      \
                   ^
   include/asm-generic/bug.h:97:38: note: expanded from macro '__WARN_print=
f'
   #define __WARN_printf(taint, arg...) do {                               \
                                        ^
   lib/math/reciprocal_div.c:51:14: note: The result of the left shift is u=
ndefined due to shifting by '64', which is greater or equal to the width of=
 type 'unsigned long long'
           mlow =3D 1ULL << (32 + l);
                       ^  ~~~~~~~~
   1 warning generated.
>> fs/hpfs/name.c:67:2: warning: Potential leak of memory pointed to by 'to=
' [clang-analyzer-unix.Malloc]
           if (!(to =3D kmalloc(len, GFP_KERNEL))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   fs/hpfs/name.c:59:6: note: Assuming field 'sb_chk' is >=3D 2
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/name.c:59:2: note: '?' condition is false
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/name.c:59:18: note: Field 'sb_chk' is >=3D 2
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
                           ^
   fs/hpfs/name.c:59:2: note: '?' condition is true
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
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
   fs/hpfs/name.c:59:2: note: Taking true branch
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/name.c:59:35: note: Assuming the condition is false
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
                                            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/name.c:59:31: note: '?' condition is false
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
                                        ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/name.c:59:35: note: Assuming the condition is false
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
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
   fs/hpfs/name.c:59:31: note: '?' condition is false
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
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
   fs/hpfs/name.c:59:31: note: Taking false branch
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
                                        ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/name.c:66:6: note: Assuming 'lc' is not equal to 0
           if (!lc) return from;
--
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   block/blk-mq.c:1919:34: note: '?' condition is true
                   struct request *rq, *head_rq =3D list_entry_rq(list.next=
);
                                                  ^
   include/linux/blkdev.h:639:28: note: expanded from macro 'list_entry_rq'
   #define list_entry_rq(ptr)      list_entry((ptr), struct request, queuel=
ist)
                                   ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
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
   block/blk-mq.c:1919:34: note: Left side of '&&' is false
                   struct request *rq, *head_rq =3D list_entry_rq(list.next=
);
                                                  ^
   include/linux/blkdev.h:639:28: note: expanded from macro 'list_entry_rq'
   #define list_entry_rq(ptr)      list_entry((ptr), struct request, queuel=
ist)
                                   ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   block/blk-mq.c:1919:34: note: Taking false branch
                   struct request *rq, *head_rq =3D list_entry_rq(list.next=
);
                                                  ^
   include/linux/blkdev.h:639:28: note: expanded from macro 'list_entry_rq'
   #define list_entry_rq(ptr)      list_entry((ptr), struct request, queuel=
ist)
                                   ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
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
   block/blk-mq.c:1919:34: note: Loop condition is false.  Exiting loop
                   struct request *rq, *head_rq =3D list_entry_rq(list.next=
);
                                                  ^
   include/linux/blkdev.h:639:28: note: expanded from macro 'list_entry_rq'
   #define list_entry_rq(ptr)      list_entry((ptr), struct request, queuel=
ist)
                                   ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
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
   block/blk-mq.c:1921:3: note: Assigned value is garbage or undefined
                   struct blk_mq_hw_ctx *this_hctx =3D head_rq->mq_hctx;
                   ^                                 ~~~~~~~~~~~~~~~~
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
>> drivers/dax/bus.c:585:6: warning: Use of memory after it is freed [clang=
-analyzer-unix.Malloc]
           if (devm_add_action_or_reset(parent, dax_region_unregister, dax_=
region))
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
   drivers/dax/bus.c:553:2: note: Assuming the condition is true
           if (dev_get_drvdata(parent)) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/dax/bus.c:553:2: note: '?' condition is false
           if (dev_get_drvdata(parent)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/dax/bus.c:553:2: note: '?' condition is false
           if (dev_get_drvdata(parent)) {
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
   drivers/dax/bus.c:553:2: note: Taking false branch
           if (dev_get_drvdata(parent)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/dax/bus.c:558:7: note: Assuming the condition is true
           if (!IS_ALIGNED(range->start, align)
                ^
   include/linux/align.h:13:28: note: expanded from macro 'IS_ALIGNED'
   #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) =
=3D=3D 0)
                                            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/dax/bus.c:558:6: note: Left side of '||' is false
           if (!IS_ALIGNED(range->start, align)
               ^
   drivers/dax/bus.c:559:8: note: Assuming the condition is true
                           || !IS_ALIGNED(range_len(range), align))
                               ^
   include/linux/align.h:13:28: note: expanded from macro 'IS_ALIGNED'
   #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) =
=3D=3D 0)
                                            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/dax/bus.c:558:2: note: '?' condition is false
           if (!IS_ALIGNED(range->start, align)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/dax/bus.c:558:6: note: Left side of '||' is false
           if (!IS_ALIGNED(range->start, align)
               ^
   drivers/dax/bus.c:558:2: note: '?' condition is false
           if (!IS_ALIGNED(range->start, align)
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
   drivers/dax/bus.c:558:2: note: Taking false branch
           if (!IS_ALIGNED(range->start, align)
--
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/btrfs/scrub.c:1656:14: note: Field 'wr_curr_bio' is non-null
                   if (!sctx->wr_curr_bio) {
                              ^
   fs/btrfs/scrub.c:1656:3: note: '?' condition is false
                   if (!sctx->wr_curr_bio) {
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
   fs/btrfs/scrub.c:1656:3: note: Taking false branch
                   if (!sctx->wr_curr_bio) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/btrfs/scrub.c:1664:2: note: '?' condition is false
           if (sbio->page_count =3D=3D 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/btrfs/scrub.c:1664:12: note: Field 'page_count' is equal to 0
           if (sbio->page_count =3D=3D 0) {
                     ^
   fs/btrfs/scrub.c:1664:2: note: '?' condition is true
           if (sbio->page_count =3D=3D 0) {
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
   fs/btrfs/scrub.c:1664:2: note: Taking true branch
           if (sbio->page_count =3D=3D 0) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/btrfs/scrub.c:1669:3: note: '?' condition is false
                   if (ret) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/btrfs/scrub.c:1669:7: note: 'ret' is 0
                   if (ret) {
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
   fs/btrfs/scrub.c:1669:3: note: '?' condition is false
                   if (ret) {
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
   fs/btrfs/scrub.c:1669:3: note: Taking false branch
                   if (ret) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/btrfs/scrub.c:1677:7: note: Assigned value is garbage or undefined
                   bio =3D sbio->bio;
                       ^ ~~~~~~~~~
>> fs/btrfs/scrub.c:2318:3: warning: The expression is an uninitialized val=
ue. The computed value will also be garbage [clang-analyzer-core.uninitiali=
zed.Assign]
                   sblock->page_count++;
                   ^~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:2269:11: note: Calling 'kzalloc'
           sblock =3D kzalloc(sizeof(*sblock), GFP_KERNEL);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Uninitialized value stored to field 'p=
age_count'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:2269:11: note: Returning from 'kzalloc'
           sblock =3D kzalloc(sizeof(*sblock), GFP_KERNEL);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:2270:6: note: Assuming 'sblock' is non-null
           if (!sblock) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/btrfs/scrub.c:2270:2: note: '?' condition is false
           if (!sblock) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/btrfs/scrub.c:2270:7: note: 'sblock' is non-null
           if (!sblock) {
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
   fs/btrfs/scrub.c:2270:2: note: '?' condition is false
           if (!sblock) {
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
   fs/btrfs/scrub.c:2270:2: note: Taking false branch
           if (!sblock) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/btrfs/scrub.c:2283:18: note: Assuming 'len' is > 0
           for (index =3D 0; len > 0; index++) {
                           ^~~~~~~
   fs/btrfs/scrub.c:2283:2: note: Loop condition is true.  Entering loop bo=
dy
           for (index =3D 0; len > 0; index++) {
           ^
   fs/btrfs/scrub.c:2290:11: note: Assuming '__UNIQUE_ID___x1676' is >=3D '=
__UNIQUE_ID___y1677'
                   u32 l =3D min(sectorsize, len);
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
   fs/btrfs/scrub.c:2290:11: note: '?' condition is false
                   u32 l =3D min(sectorsize, len);
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
   fs/btrfs/scrub.c:2293:7: note: Assuming 'spage' is non-null
                   if (!spage) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
                         ^
   drivers/char/pcmcia/synclink_cs.c:869:31: note: The value 1 is assigned =
to 'i'
                   for (i =3D 0; i < read_count; i++) {
                                               ^~~
   drivers/char/pcmcia/synclink_cs.c:869:3: note: Loop condition is true.  =
Entering loop body
                   for (i =3D 0; i < read_count; i++) {
                   ^
   drivers/char/pcmcia/synclink_cs.c:870:8: note: Assuming field 'count' is=
 < field 'max_frame_size'
                           if (buf->count >=3D info->max_frame_size) {
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/char/pcmcia/synclink_cs.c:870:4: note: '?' condition is false
                           if (buf->count >=3D info->max_frame_size) {
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/char/pcmcia/synclink_cs.c:870:13: note: Field 'count' is < field=
 'max_frame_size'
                           if (buf->count >=3D info->max_frame_size) {
                                    ^
   drivers/char/pcmcia/synclink_cs.c:870:4: note: '?' condition is false
                           if (buf->count >=3D info->max_frame_size) {
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
   drivers/char/pcmcia/synclink_cs.c:870:4: note: Taking false branch
                           if (buf->count >=3D info->max_frame_size) {
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/char/pcmcia/synclink_cs.c:876:30: note: Assigned value is garbag=
e or undefined
                           *(buf->data + buf->count) =3D data[i];
                                                     ^ ~~~~~~~
   drivers/char/pcmcia/synclink_cs.c:2544:3: warning: Call to function 'str=
cat' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
                   strcat(stat_buf, "|RTS");
                   ^~~~~~
   drivers/char/pcmcia/synclink_cs.c:2544:3: note: Call to function 'strcat=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcat'. CWE-119
                   strcat(stat_buf, "|RTS");
                   ^~~~~~
   drivers/char/pcmcia/synclink_cs.c:2546:3: warning: Call to function 'str=
cat' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
                   strcat(stat_buf, "|CTS");
                   ^~~~~~
   drivers/char/pcmcia/synclink_cs.c:2546:3: note: Call to function 'strcat=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcat'. CWE-119
                   strcat(stat_buf, "|CTS");
                   ^~~~~~
   drivers/char/pcmcia/synclink_cs.c:2548:3: warning: Call to function 'str=
cat' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
                   strcat(stat_buf, "|DTR");
                   ^~~~~~
   drivers/char/pcmcia/synclink_cs.c:2548:3: note: Call to function 'strcat=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcat'. CWE-119
                   strcat(stat_buf, "|DTR");
                   ^~~~~~
   drivers/char/pcmcia/synclink_cs.c:2550:3: warning: Call to function 'str=
cat' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
                   strcat(stat_buf, "|DSR");
                   ^~~~~~
   drivers/char/pcmcia/synclink_cs.c:2550:3: note: Call to function 'strcat=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcat'. CWE-119
                   strcat(stat_buf, "|DSR");
                   ^~~~~~
   drivers/char/pcmcia/synclink_cs.c:2552:3: warning: Call to function 'str=
cat' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
                   strcat(stat_buf, "|CD");
                   ^~~~~~
   drivers/char/pcmcia/synclink_cs.c:2552:3: note: Call to function 'strcat=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcat'. CWE-119
                   strcat(stat_buf, "|CD");
                   ^~~~~~
   drivers/char/pcmcia/synclink_cs.c:2554:3: warning: Call to function 'str=
cat' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
                   strcat(stat_buf, "|RI");
                   ^~~~~~
   drivers/char/pcmcia/synclink_cs.c:2554:3: note: Call to function 'strcat=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcat'. CWE-119
                   strcat(stat_buf, "|RI");
                   ^~~~~~
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
   7 warnings generated.
>> drivers/net/slip/slip.c:182:10: warning: Potential leak of memory pointe=
d to by '__ret' [clang-analyzer-unix.Malloc]
           xbuff =3D xchg(&sl->xbuff, xbuff);
                   ^
   include/linux/atomic/atomic-instrumented.h:1760:2: note: expanded from m=
acro 'xchg'
           typeof(ptr) __ai_ptr =3D (ptr); \
           ^
   drivers/net/slip/slip.c:793:6: note: Assuming the condition is false
           if (!capable(CAP_NET_ADMIN))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/net/slip/slip.c:793:2: note: '?' condition is false
           if (!capable(CAP_NET_ADMIN))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/net/slip/slip.c:793:6: note: Assuming the condition is false
           if (!capable(CAP_NET_ADMIN))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/net/slip/slip.c:793:2: note: '?' condition is false
           if (!capable(CAP_NET_ADMIN))
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
   drivers/net/slip/slip.c:793:2: note: Taking false branch
           if (!capable(CAP_NET_ADMIN))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/net/slip/slip.c:796:6: note: Assuming field 'write' is not equal=
 to null
           if (tty->ops->write =3D=3D NULL)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/net/slip/slip.c:796:2: note: '?' condition is false
           if (tty->ops->write =3D=3D NULL)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/net/slip/slip.c:796:16: note: Field 'write' is not equal to null
           if (tty->ops->write =3D=3D NULL)
                         ^
   drivers/net/slip/slip.c:796:2: note: '?' condition is false
           if (tty->ops->write =3D=3D NULL)
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
   drivers/net/slip/slip.c:796:2: note: Taking false branch
           if (tty->ops->write =3D=3D NULL)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/net/slip/slip.c:812:6: note: Assuming 'sl' is null
           if (sl && sl->magic =3D=3D SLIP_MAGIC)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
--
                         ^
   drivers/net/dsa/mv88e6xxx/chip.c:1746:2: note: Calling 'ether_addr_copy'
           ether_addr_copy(entry.mac, addr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mv88e6xxx/chip.c:1746:2: note: Returning from 'ether_add=
r_copy'
           ether_addr_copy(entry.mac, addr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mv88e6xxx/chip.c:1747:2: note: Calling 'eth_addr_dec'
           eth_addr_dec(entry.mac);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/etherdevice.h:463:10: note: Calling 'ether_addr_to_u64'
           u64 u =3D ether_addr_to_u64(addr);
                   ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/etherdevice.h:435:2: note: Loop condition is true.  Enteri=
ng loop body
           for (i =3D 0; i < ETH_ALEN; i++)
           ^
   include/linux/etherdevice.h:435:28: note: The value 1 is assigned to 'i'
           for (i =3D 0; i < ETH_ALEN; i++)
                                     ^~~
   include/linux/etherdevice.h:435:2: note: Loop condition is true.  Enteri=
ng loop body
           for (i =3D 0; i < ETH_ALEN; i++)
           ^
   include/linux/etherdevice.h:436:14: note: The right operand of '|' is a =
garbage value
                   u =3D u << 8 | addr[i];
                              ^ ~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
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
   Suppressed 2 warnings (2 in non-user code).
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
   drivers/usb/usbip/vhci_hcd.c:436:4: warning: Value stored to 'retval' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           retval =3D -EPIPE;
                           ^        ~~~~~~
   drivers/usb/usbip/vhci_hcd.c:436:4: note: Value stored to 'retval' is ne=
ver read
                           retval =3D -EPIPE;
                           ^        ~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/usb/usbip/stub_rx.c:450:2: warning: Undefined or garbage value r=
eturned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^
   drivers/usb/usbip/stub_rx.c:470:6: note: Assuming the condition is false
           if (pipe =3D=3D -1)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/usb/usbip/stub_rx.c:470:2: note: '?' condition is false
           if (pipe =3D=3D -1)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/usb/usbip/stub_rx.c:470:2: note: '?' condition is false
           if (pipe =3D=3D -1)
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
   drivers/usb/usbip/stub_rx.c:470:2: note: Taking false branch
           if (pipe =3D=3D -1)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/usb/usbip/stub_rx.c:479:7: note: 'priv' is non-null
           if (!priv)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/usb/usbip/stub_rx.c:479:2: note: '?' condition is false
           if (!priv)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/usb/usbip/stub_rx.c:479:7: note: 'priv' is non-null
           if (!priv)
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
   drivers/usb/usbip/stub_rx.c:479:2: note: '?' condition is false
           if (!priv)
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
   drivers/usb/usbip/stub_rx.c:479:2: note: Taking false branch
           if (!priv)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/usb/usbip/stub_rx.c:484:6: note: Assuming 'use_sg' is 0
           if (use_sg && !buf_len) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/usb/usbip/stub_rx.c:484:13: note: Left side of '&&' is false
           if (use_sg && !buf_len) {
                      ^
   drivers/usb/usbip/stub_rx.c:484:2: note: '?' condition is false
           if (use_sg && !buf_len) {
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
   drivers/net/ethernet/intel/e1000/e1000_hw.c:5008:9: note: Taking false b=
ranch
           } else if (hw->phy_type =3D=3D e1000_phy_igp) {
                  ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:5041:2: note: Returning with=
out writing to '*polarity'
           return E1000_SUCCESS;
           ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3340:12: note: Returning fro=
m 'e1000_check_polarity'
           ret_val =3D e1000_check_polarity(hw, &polarity);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3341:2: note: '?' condition =
is false
           if (ret_val)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3341:6: note: 'ret_val' is 0
           if (ret_val)
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
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3341:2: note: '?' condition =
is false
           if (ret_val)
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
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3341:2: note: Taking false b=
ranch
           if (ret_val)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3343:27: note: Assigned valu=
e is garbage or undefined
           phy_info->cable_polarity =3D polarity;
                                    ^ ~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   5 warnings generated.
   drivers/usb/gadget/function/f_mass_storage.c:924:2: warning: Value store=
d to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
           rc =3D invalidate_mapping_pages(inode->i_mapping, 0, -1);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_mass_storage.c:924:2: note: Value stored t=
o 'rc' is never read
           rc =3D invalidate_mapping_pages(inode->i_mapping, 0, -1);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_mass_storage.c:1583:3: warning: Value stor=
ed to 'sdinfo' is never read [clang-analyzer-deadcode.DeadStores]
                   sdinfo =3D curlun->sense_data_info;
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_mass_storage.c:1583:3: note: Value stored =
to 'sdinfo' is never read
                   sdinfo =3D curlun->sense_data_info;
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_mass_storage.c:1592:3: warning: Value stor=
ed to 'sd' is never read [clang-analyzer-deadcode.DeadStores]
                   sd =3D SS_INVALID_COMMAND;
                   ^
   drivers/usb/gadget/function/f_mass_storage.c:1592:3: note: Value stored =
to 'sd' is never read
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/usb/gadget/function/f_fs.c:1050:8: warning: Potential leak of me=
mory pointed to by 'data' [clang-analyzer-unix.Malloc]
                   WARN(1, "%s: data_len =3D=3D -EINVAL\n", __func__);
                        ^
   drivers/usb/gadget/function/f_fs.c:951:14: note: Assuming field 'state' =
is equal to FFS_ACTIVE
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
                       ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/usb/gadget/function/f_fs.c:951:6: note: '?' condition is false
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/usb/gadget/function/f_fs.c:951:6: note: '?' condition is false
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
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
   drivers/usb/gadget/function/f_fs.c:951:6: note: Taking false branch
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/usb/gadget/function/f_fs.c:951:2: note: '?' condition is false
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/usb/gadget/function/f_fs.c:951:6: note: '?' condition is false
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/usb/gadget/function/f_fs.c:951:6: note: '?' condition is false
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
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
   drivers/usb/gadget/function/f_fs.c:951:6: note: Taking false branch
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/usb/gadget/function/f_fs.c:951:2: note: '?' condition is false
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/leds/uleds.c:150:4: warning: Value stored to 'retval' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/uleds.c:150:4: note: Value stored to 'retval' is never read
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (1 in non-user code, 5 with check filters).
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
   4 warnings generated.
>> net/core/bpf_sk_storage.c:554:14: warning: The expression is an uninitia=
lized value. The computed value will also be garbage [clang-analyzer-core.u=
ninitialized.Assign]
                   diag->maps[diag->nr_maps++] =3D map;
                              ^~~~~~~~~~~~~
   net/core/bpf_sk_storage.c:519:2: note: '?' condition is false
           if (!bpf_capable())
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/core/bpf_sk_storage.c:519:2: note: '?' condition is false
           if (!bpf_capable())
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
   net/core/bpf_sk_storage.c:519:2: note: Taking false branch
           if (!bpf_capable())
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/core/bpf_sk_storage.c:522:2: note: Loop condition is true.  Entering=
 loop body
           nla_for_each_nested(nla, nla_stgs, rem) {
           ^
   include/net/netlink.h:1932:2: note: expanded from macro 'nla_for_each_ne=
sted'
           nla_for_each_attr(pos, nla_data(nla), nla_len(nla), rem)
           ^
   include/net/netlink.h:1921:2: note: expanded from macro 'nla_for_each_at=
tr'
           for (pos =3D head, rem =3D len; \
           ^
   net/core/bpf_sk_storage.c:523:7: note: Assuming the condition is true
                   if (nla_type(nla) =3D=3D SK_DIAG_BPF_STORAGE_REQ_MAP_FD)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/core/bpf_sk_storage.c:523:3: note: '?' condition is false
                   if (nla_type(nla) =3D=3D SK_DIAG_BPF_STORAGE_REQ_MAP_FD)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/core/bpf_sk_storage.c:523:3: note: '?' condition is true
                   if (nla_type(nla) =3D=3D SK_DIAG_BPF_STORAGE_REQ_MAP_FD)
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
   net/core/bpf_sk_storage.c:523:3: note: Taking true branch
                   if (nla_type(nla) =3D=3D SK_DIAG_BPF_STORAGE_REQ_MAP_FD)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/core/bpf_sk_storage.c:522:2: note: Loop condition is false. Executio=
n continues on line 527
           nla_for_each_nested(nla, nla_stgs, rem) {
           ^
   include/net/netlink.h:1932:2: note: expanded from macro 'nla_for_each_ne=
sted'
           nla_for_each_attr(pos, nla_data(nla), nla_len(nla), rem)
           ^
   include/net/netlink.h:1921:2: note: expanded from macro 'nla_for_each_at=
tr'
           for (pos =3D head, rem =3D len; \
           ^
   net/core/bpf_sk_storage.c:527:9: note: Calling 'kzalloc'
           diag =3D kzalloc(struct_size(diag, maps, nr_maps), GFP_KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Uninitialized value stored to field 'n=
r_maps'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/bpf_sk_storage.c:527:9: note: Returning from 'kzalloc'
           diag =3D kzalloc(struct_size(diag, maps, nr_maps), GFP_KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/bpf_sk_storage.c:528:6: note: Assuming 'diag' is non-null
           if (!diag)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
--
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/platform/chrome/cros_ec_sensorhub_ring.c:734:4: note: '?' condit=
ion is false
                           if (out->sensor_id !=3D i)
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/platform/chrome/cros_ec_sensorhub_ring.c:734:26: note: 'i' is eq=
ual to field 'sensor_id'
                           if (out->sensor_id !=3D i)
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
   drivers/platform/chrome/cros_ec_sensorhub_ring.c:734:4: note: '?' condit=
ion is false
                           if (out->sensor_id !=3D i)
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
   drivers/platform/chrome/cros_ec_sensorhub_ring.c:734:4: note: Taking fal=
se branch
                           if (out->sensor_id !=3D i)
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/platform/chrome/cros_ec_sensorhub_ring.c:732:3: note: Loop condi=
tion is false. Execution continues on line 738
                   for (; out < last_out; out++) {
                   ^
   drivers/platform/chrome/cros_ec_sensorhub_ring.c:738:3: note: '?' condit=
ion is false
                   if (count =3D=3D 0)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/platform/chrome/cros_ec_sensorhub_ring.c:738:7: note: 'count' is=
 not equal to 0
                   if (count =3D=3D 0)
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
   drivers/platform/chrome/cros_ec_sensorhub_ring.c:738:3: note: '?' condit=
ion is false
                   if (count =3D=3D 0)
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
   drivers/platform/chrome/cros_ec_sensorhub_ring.c:738:3: note: Taking fal=
se branch
                   if (count =3D=3D 0)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/platform/chrome/cros_ec_sensorhub_ring.c:742:43: note: The right=
 operand of '-' is a garbage value
                   time_period =3D div_s64(current_timestamp - timestamp, c=
ount);
                                                           ^ ~~~~~~~~~
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
   4 warnings generated.
>> net/sched/cls_u32.c:241:5: warning: Assigned value is garbage or undefin=
ed [clang-analyzer-core.uninitialized.Assign]
                   n =3D stack[sdepth].knode;
                     ^ ~~~~~~~~~~~~~~~~~~~
   net/sched/cls_u32.c:111:26: note: Left side of '||' is false
           struct tc_u_hnode *ht =3D rcu_dereference_bh(tp->root);
                                   ^
   include/linux/rcupdate.h:604:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:543:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_bh_held(), __r=
cu)
           ^
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
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
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/sched/cls_u32.c:111:26: note: Left side of '||' is false
           struct tc_u_hnode *ht =3D rcu_dereference_bh(tp->root);
                                   ^
   include/linux/rcupdate.h:604:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:543:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_bh_held(), __r=
cu)
           ^
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
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
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/sched/cls_u32.c:111:26: note: Left side of '||' is false
           struct tc_u_hnode *ht =3D rcu_dereference_bh(tp->root);
                                   ^
   include/linux/rcupdate.h:604:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:543:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_bh_held(), __r=
cu)
           ^
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
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
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/sched/cls_u32.c:111:26: note: Left side of '||' is true
           struct tc_u_hnode *ht =3D rcu_dereference_bh(tp->root);
                                   ^
   include/linux/rcupdate.h:604:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:543:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_bh_held(), __r=
cu)
           ^
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   net/sched/cls_u32.c:111:26: note: '?' condition is true
           struct tc_u_hnode *ht =3D rcu_dereference_bh(tp->root);
                                   ^
   include/linux/rcupdate.h:604:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:543:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_bh_held(), __r=
cu)
           ^
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
--
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/sched/cls_u32.c:123:6: note: Loop condition is false.  Exiting loop
           n =3D rcu_dereference_bh(ht->ht[sel]);
               ^
   include/linux/rcupdate.h:604:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:543:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_bh_held(), __r=
cu)
           ^
   include/linux/rcupdate.h:390:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:316:2: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
           do {                                                            \
           ^
   net/sched/cls_u32.c:126:2: note: Assuming 'n' is null
           if (n) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/sched/cls_u32.c:126:2: note: '?' condition is false
           if (n) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/sched/cls_u32.c:126:6: note: 'n' is null
           if (n) {
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
   net/sched/cls_u32.c:126:2: note: '?' condition is false
           if (n) {
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
   net/sched/cls_u32.c:126:2: note: Taking false branch
           if (n) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/sched/cls_u32.c:240:2: note: '?' condition is false
           if (sdepth--) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/sched/cls_u32.c:240:2: note: '?' condition is true
           if (sdepth--) {
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
   net/sched/cls_u32.c:240:2: note: Taking true branch
           if (sdepth--) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/sched/cls_u32.c:241:5: note: Assigned value is garbage or undefined
                   n =3D stack[sdepth].knode;
                     ^ ~~~~~~~~~~~~~~~~~~~
   net/sched/cls_u32.c:242:3: warning: Value stored to 'ht' is never read [=
clang-analyzer-deadcode.DeadStores]
                   ht =3D rcu_dereference_bh(n->ht_up);
                   ^
   net/sched/cls_u32.c:242:3: note: Value stored to 'ht' is never read
>> net/sched/cls_u32.c:360:2: warning: The expression is an uninitialized v=
alue. The computed value will also be garbage [clang-analyzer-core.uninitia=
lized.Assign]
           root_ht->refcnt++;
           ^~~~~~~~~~~~~~~
   net/sched/cls_u32.c:356:12: note: Calling 'kzalloc'
           root_ht =3D kzalloc(struct_size(root_ht, ht, 1), GFP_KERNEL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Uninitialized value stored to field 'r=
efcnt'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/cls_u32.c:356:12: note: Returning from 'kzalloc'
           root_ht =3D kzalloc(struct_size(root_ht, ht, 1), GFP_KERNEL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/cls_u32.c:357:6: note: Assuming 'root_ht' is not equal to null
           if (root_ht =3D=3D NULL)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/sched/cls_u32.c:357:2: note: '?' condition is false
           if (root_ht =3D=3D NULL)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/sched/cls_u32.c:357:6: note: 'root_ht' is not equal to null
           if (root_ht =3D=3D NULL)
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
   net/sched/cls_u32.c:357:2: note: '?' condition is false
           if (root_ht =3D=3D NULL)
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
   net/sched/cls_u32.c:357:2: note: Taking false branch
           if (root_ht =3D=3D NULL)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/sched/cls_u32.c:360:2: note: The expression is an uninitialized valu=
e. The computed value will also be garbage
           root_ht->refcnt++;
           ^~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/input/misc/yealink.c:979:2: warning: Value stored to 'ret' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           ret =3D sysfs_create_group(&intf->dev.kobj, &yld_attr_group);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/yealink.c:979:2: note: Value stored to 'ret' is never=
 read
           ret =3D sysfs_create_group(&intf->dev.kobj, &yld_attr_group);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
   drivers/most/core.c:195:3: note: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119
                   strcat(buf, "async ");
                   ^~~~~~
   drivers/most/core.c:197:3: warning: Call to function 'strcat' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "sync ");
                   ^~~~~~
   drivers/most/core.c:197:3: note: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119
                   strcat(buf, "sync ");
                   ^~~~~~
   drivers/most/core.c:199:3: warning: Call to function 'strcat' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "isoc ");
                   ^~~~~~
   drivers/most/core.c:199:3: note: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119
                   strcat(buf, "isoc ");
                   ^~~~~~
   drivers/most/core.c:200:2: warning: Call to function 'strcat' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, "\n");
           ^~~~~~
   drivers/most/core.c:200:2: note: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119
           strcat(buf, "\n");
           ^~~~~~
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
   net/caif/cfserl.c:131:5: warning: Value stored to 'expectlen' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                                   expectlen =3D 0;
                                   ^           ~
   net/caif/cfserl.c:131:5: note: Value stored to 'expectlen' is never read
                                   expectlen =3D 0;
                                   ^           ~
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
   6 warnings generated.
>> drivers/staging/ks7010/ks_hostif.c:251:2: warning: Potential leak of mem=
ory pointed to by 'desc' [clang-analyzer-unix.Malloc]
           crypto_free_shash(tfm);
           ^
   drivers/staging/ks7010/ks_hostif.c:1071:6: note: Assuming 'skb_len' is <=
=3D 1514
           if (skb_len > ETH_FRAME_LEN) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/staging/ks7010/ks_hostif.c:1071:2: note: '?' condition is false
           if (skb_len > ETH_FRAME_LEN) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/staging/ks7010/ks_hostif.c:1071:6: note: 'skb_len' is <=3D 1514
           if (skb_len > ETH_FRAME_LEN) {
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
   drivers/staging/ks7010/ks_hostif.c:1071:2: note: '?' condition is false
           if (skb_len > ETH_FRAME_LEN) {
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
   drivers/staging/ks7010/ks_hostif.c:1071:2: note: Taking false branch
           if (skb_len > ETH_FRAME_LEN) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/staging/ks7010/ks_hostif.c:1077:6: note: Assuming the condition =
is true
           if (is_disconnect_status(priv->connect_status) ||
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/staging/ks7010/ks_hostif.c:1077:49: note: Left side of '||' is t=
rue
           if (is_disconnect_status(priv->connect_status) ||
                                                          ^
   drivers/staging/ks7010/ks_hostif.c:1077:2: note: '?' condition is false
           if (is_disconnect_status(priv->connect_status) ||
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/staging/ks7010/ks_hostif.c:1077:6: note: Assuming the condition =
is false
           if (is_disconnect_status(priv->connect_status) ||
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
   drivers/staging/ks7010/ks_hostif.c:1077:6: note: Left side of '||' is fa=
lse
           if (is_disconnect_status(priv->connect_status) ||
               ^
   drivers/staging/ks7010/ks_hostif.c:1078:7: note: Assuming the condition =
is false
               (priv->connect_status & FORCE_DISCONNECT) ||
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/staging/ks7010/ks_hostif.c:1077:6: note: Left side of '||' is fa=
lse
           if (is_disconnect_status(priv->connect_status) ||
--
   fs/btrfs/lzo.c:324:6: note: Left side of '||' is false
           if (len_in > min_t(size_t, BTRFS_MAX_COMPRESSED, cb->compressed_=
len) ||
               ^
   fs/btrfs/lzo.c:325:6: note: Assuming the condition is false
               round_up(len_in, sectorsize) < cb->compressed_len) {
               ^
   include/linux/math.h:24:24: note: expanded from macro 'round_up'
   #define round_up(x, y) ((((x)-1) | __round_mask(x, y))+1)
                          ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/btrfs/lzo.c:324:2: note: '?' condition is false
           if (len_in > min_t(size_t, BTRFS_MAX_COMPRESSED, cb->compressed_=
len) ||
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/btrfs/lzo.c:324:15: note: '__UNIQUE_ID___x1623' is >=3D '__UNIQUE_ID_=
__y1624'
           if (len_in > min_t(size_t, BTRFS_MAX_COMPRESSED, cb->compressed_=
len) ||
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
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
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
   fs/btrfs/lzo.c:324:15: note: '?' condition is false
           if (len_in > min_t(size_t, BTRFS_MAX_COMPRESSED, cb->compressed_=
len) ||
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
   fs/btrfs/lzo.c:324:6: note: Left side of '||' is false
           if (len_in > min_t(size_t, BTRFS_MAX_COMPRESSED, cb->compressed_=
len) ||
               ^
   fs/btrfs/lzo.c:324:2: note: '?' condition is false
           if (len_in > min_t(size_t, BTRFS_MAX_COMPRESSED, cb->compressed_=
len) ||
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
   fs/btrfs/lzo.c:324:2: note: Taking false branch
           if (len_in > min_t(size_t, BTRFS_MAX_COMPRESSED, cb->compressed_=
len) ||
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/btrfs/lzo.c:333:9: note: Assuming 'cur_in' is >=3D 'len_in'
           while (cur_in < len_in) {
                  ^~~~~~~~~~~~~~~
   fs/btrfs/lzo.c:333:2: note: Loop condition is false. Execution continues=
 on line 382
           while (cur_in < len_in) {
           ^
   fs/btrfs/lzo.c:382:2: note: 1st function call argument is an uninitializ=
ed value
           if (!ret)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^                    ~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> net/decnet/dn_dev.c:471:4: warning: Potential leak of memory pointed to =
by 'ifa' [clang-analyzer-unix.Malloc]
                           if ((ifa =3D dn_dev_alloc_ifa()) =3D=3D NULL) {
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   net/decnet/dn_dev.c:423:2: note: '?' condition is false
           if (copy_from_user(ifr, arg, DN_IFREQ_SIZE))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/decnet/dn_dev.c:423:2: note: Assuming the condition is true
           if (copy_from_user(ifr, arg, DN_IFREQ_SIZE))
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
   net/decnet/dn_dev.c:423:2: note: '?' condition is false
           if (copy_from_user(ifr, arg, DN_IFREQ_SIZE))
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
   net/decnet/dn_dev.c:423:2: note: Taking false branch
           if (copy_from_user(ifr, arg, DN_IFREQ_SIZE))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/decnet/dn_dev.c:429:2: note: Control jumps to 'case 35094:'  at line=
 432
           switch (cmd) {
           ^
   net/decnet/dn_dev.c:433:7: note: Assuming the condition is false
                   if (!capable(CAP_NET_ADMIN))
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/decnet/dn_dev.c:433:3: note: '?' condition is false
                   if (!capable(CAP_NET_ADMIN))
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/decnet/dn_dev.c:433:7: note: Assuming the condition is false
                   if (!capable(CAP_NET_ADMIN))
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
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
   net/decnet/dn_dev.c:433:3: note: '?' condition is false
                   if (!capable(CAP_NET_ADMIN))
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
   net/decnet/dn_dev.c:433:3: note: Taking false branch
                   if (!capable(CAP_NET_ADMIN))
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
           ^
   net/decnet/dn_dev.c:639:2: note: '?' condition is false
           if ((dn_db =3D rtnl_dereference(dev->dn_ptr)) =3D=3D NULL) {
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
   net/decnet/dn_dev.c:639:2: note: Taking false branch
           if ((dn_db =3D rtnl_dereference(dev->dn_ptr)) =3D=3D NULL) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/decnet/dn_dev.c:645:13: note: Calling 'dn_dev_alloc_ifa'
           if ((ifa =3D dn_dev_alloc_ifa()) =3D=3D NULL)
                      ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/decnet/dn_dev.c:319:8: note: Calling 'kzalloc'
           ifa =3D kzalloc(sizeof(*ifa), GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Memory is allocated
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/decnet/dn_dev.c:319:8: note: Returned allocated memory
           ifa =3D kzalloc(sizeof(*ifa), GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/decnet/dn_dev.c:645:13: note: Returned allocated memory
           if ((ifa =3D dn_dev_alloc_ifa()) =3D=3D NULL)
                      ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/decnet/dn_dev.c:645:6: note: Assuming the condition is false
           if ((ifa =3D dn_dev_alloc_ifa()) =3D=3D NULL)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/decnet/dn_dev.c:645:2: note: '?' condition is false
           if ((ifa =3D dn_dev_alloc_ifa()) =3D=3D NULL)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/decnet/dn_dev.c:645:6: note: Assuming the condition is false
           if ((ifa =3D dn_dev_alloc_ifa()) =3D=3D NULL)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
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
   net/decnet/dn_dev.c:645:2: note: '?' condition is false
           if ((ifa =3D dn_dev_alloc_ifa()) =3D=3D NULL)
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
   net/decnet/dn_dev.c:645:2: note: Potential leak of memory pointed to by =
'ifa'
           if ((ifa =3D dn_dev_alloc_ifa()) =3D=3D NULL)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
>> net/decnet/dn_dev.c:1090:2: warning: Potential leak of memory pointed to=
 by 'dn_db' [clang-analyzer-unix.Malloc]
           if ((dn_db =3D kzalloc(sizeof(struct dn_dev), GFP_ATOMIC)) =3D=
=3D NULL)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   net/decnet/dn_dev.c:1080:2: note: Loop condition is true.  Entering loop=
 body
           for(i =3D 0; i < DN_DEV_LIST_SIZE; i++, p++) {
           ^
   net/decnet/dn_dev.c:1081:7: note: Assuming 'p->type' is equal to 'dev->t=
ype'
                   if (p->type =3D=3D dev->type)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/decnet/dn_dev.c:1081:3: note: '?' condition is false
                   if (p->type =3D=3D dev->type)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/decnet/dn_dev.c:1081:10: note: 'p->type' is equal to 'dev->type'
                   if (p->type =3D=3D dev->type)
                          ^
   net/decnet/dn_dev.c:1081:3: note: '?' condition is true
                   if (p->type =3D=3D dev->type)
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
   net/decnet/dn_dev.c:1081:3: note: Taking true branch
                   if (p->type =3D=3D dev->type)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/decnet/dn_dev.c:1082:4: note:  Execution continues on line 1085
                           break;
                           ^
   net/decnet/dn_dev.c:1086:2: note: '?' condition is false
           if (i =3D=3D DN_DEV_LIST_SIZE)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/decnet/dn_dev.c:1086:2: note: '?' condition is false
           if (i =3D=3D DN_DEV_LIST_SIZE)
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
   net/decnet/dn_dev.c:1086:2: note: Taking false branch
           if (i =3D=3D DN_DEV_LIST_SIZE)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/decnet/dn_dev.c:1090:15: note: Calling 'kzalloc'
           if ((dn_db =3D kzalloc(sizeof(struct dn_dev), GFP_ATOMIC)) =3D=
=3D NULL)
                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   include/linux/slab.h:721:9: note: Memory is allocated
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/decnet/dn_dev.c:1090:15: note: Returned allocated memory
           if ((dn_db =3D kzalloc(sizeof(struct dn_dev), GFP_ATOMIC)) =3D=
=3D NULL)
                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )

vim +97 fs/dlm/plock.c

869d81df53ad28 fs/gfs2/locking/dlm/plock.c David Teigland  2006-01-17   70  =

901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   71 =
 /* If a process was killed while waiting for the only plock on a file,
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   72 =
    locks_remove_posix will not see any lock on the file so it won't
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   73 =
    send an unlock-close to us to pass on to userspace to clean up the
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   74 =
    abandoned waiter.  So, we have to insert the unlock-close when the
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   75 =
    lock call is interrupted. */
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   76  =

901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   77 =
 static void do_unlock_close(struct dlm_ls *ls, u64 number,
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   78 =
 			    struct file *file, struct file_lock *fl)
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   79 =
 {
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   80 =
 	struct plock_op *op;
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   81  =

901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   82 =
 	op =3D kzalloc(sizeof(*op), GFP_NOFS);
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   83 =
 	if (!op)
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   84 =
 		return;
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   85  =

901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   86 =
 	op->info.optype		=3D DLM_PLOCK_OP_UNLOCK;
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   87 =
 	op->info.pid		=3D fl->fl_pid;
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   88 =
 	op->info.fsid		=3D ls->ls_global_id;
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   89 =
 	op->info.number		=3D number;
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   90 =
 	op->info.start		=3D 0;
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   91 =
 	op->info.end		=3D OFFSET_MAX;
8fb47a4fbf858a fs/dlm/plock.c              J. Bruce Fields 2011-07-20   92 =
 	if (fl->fl_lmops && fl->fl_lmops->lm_grant)
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   93 =
 		op->info.owner	=3D (__u64) fl->fl_pid;
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   94 =
 	else
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   95 =
 		op->info.owner	=3D (__u64)(long) fl->fl_owner;
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   96  =

901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02  @97 =
 	op->info.flags |=3D DLM_PLOCK_FL_CLOSE;
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   98 =
 	send_op(op);
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02   99 =
 }
901025d2f3194b fs/dlm/plock.c              David Teigland  2011-03-02  100  =


:::::: The code at line 97 was first introduced by commit
:::::: 901025d2f3194b4868980c8ba80df4cc0aa1282c dlm: make plock operation k=
illable

:::::: TO: David Teigland <teigland@redhat.com>
:::::: CC: David Teigland <teigland@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3493438322220557230==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3493438322220557230==--

