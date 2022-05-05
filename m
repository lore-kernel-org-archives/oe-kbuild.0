Content-Type: multipart/mixed; boundary="===============8460711239964596271=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [daniel-thompson:clang-analyzer/initial_review 7/7] security/apparmor/path.c:60:7: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Fri, 06 May 2022 04:06:22 +0800
Message-ID: <202205060303.K0fJbaUa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8460711239964596271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Thompson <daniel.thompson@linaro.org>

tree:   https://git.linaro.org/people/daniel.thompson/linux.git clang-analy=
zer/initial_review
head:   ad6525bf355a301ca52b1dc3639fa340409c79b9
commit: ad6525bf355a301ca52b1dc3639fa340409c79b9 [7/7] [RFC] linux/err.h: R=
efactor IS_ERR_VALUE(x) to improve clang reasoning
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
506/202205060303.K0fJbaUa-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add daniel-thompson https://git.linaro.org/people/daniel=
.thompson/linux.git
        git fetch --no-tags daniel-thompson clang-analyzer/initial_review
        git checkout ad6525bf355a301ca52b1dc3639fa340409c79b9
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   security/apparmor/label.c:204:2: note: Taking true branch
           AA_BUG(!vec);
           ^
   security/apparmor/include/lib.h:37:3: note: expanded from macro 'AA_BUG'
                   AA_BUG_FMT((X), "" args);                               =
    \
                   ^
   security/apparmor/include/lib.h:44:37: note: expanded from macro 'AA_BUG=
_FMT'
   #define AA_BUG_FMT(X, fmt, args...) no_printk(fmt, ##args)
                                       ^
   include/linux/printk.h:132:3: note: expanded from macro 'no_printk'
                   printk(fmt, ##__VA_ARGS__);             \
                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:370:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/apparmor/label.c:204:2: note: Loop condition is false.  Exiting=
 loop
           AA_BUG(!vec);
           ^
   security/apparmor/include/lib.h:37:3: note: expanded from macro 'AA_BUG'
                   AA_BUG_FMT((X), "" args);                               =
    \
                   ^
   security/apparmor/include/lib.h:44:37: note: expanded from macro 'AA_BUG=
_FMT'
   #define AA_BUG_FMT(X, fmt, args...) no_printk(fmt, ##args)
                                       ^
   include/linux/printk.h:132:3: note: expanded from macro 'no_printk'
                   printk(fmt, ##__VA_ARGS__);             \
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
   security/apparmor/label.c:204:2: note: Loop condition is false.  Exiting=
 loop
           AA_BUG(!vec);
           ^
   security/apparmor/include/lib.h:35:2: note: expanded from macro 'AA_BUG'
           do {                                                            =
    \
           ^
   security/apparmor/label.c:206:2: note: Loop condition is false. Executio=
n continues on line 211
           for (i =3D 0; i < n; i++) {
           ^
   security/apparmor/label.c:1100:6: note: Returning from 'vec_unconfined'
           if (vec_unconfined(new->vec, new->size))
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
   security/apparmor/label.c:1100:2: note: '?' condition is true
           if (vec_unconfined(new->vec, new->size))
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
   security/apparmor/label.c:1100:2: note: Taking true branch
           if (vec_unconfined(new->vec, new->size))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/apparmor/label.c:1102:7: note: Access to field 'ns' results in =
a dereference of a null pointer
           ls =3D labels_set(new);
                ^
   security/apparmor/include/label.h:146:25: note: expanded from macro 'lab=
els_set'
   #define labels_set(X) (&labels_ns(X)->labels)
                           ^~~~~~~~~~~~
   security/apparmor/include/label.h:145:22: note: expanded from macro 'lab=
els_ns'
   #define labels_ns(X) (vec_ns(&((X)->vec[0]), (X)->size))
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   security/apparmor/lib.c:501:4: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(hname, name);
                           ^~~~~~
   security/apparmor/lib.c:501:4: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
                           strcpy(hname, name);
                           ^~~~~~
   4 warnings generated.
>> security/apparmor/path.c:60:7: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
                   if (**name =3D=3D '/')
                       ^
   security/apparmor/path.c:94:15: note: Assuming the condition is false
           int isdir =3D (flags & PATH_IS_DIR) ? 1 : 0;
                        ^~~~~~~~~~~~~~~~~~~
   security/apparmor/path.c:94:14: note: '?' condition is false
           int isdir =3D (flags & PATH_IS_DIR) ? 1 : 0;
                       ^
   security/apparmor/path.c:97:2: note: Assuming the condition is false
           if (path->mnt->mnt_flags & MNT_INTERNAL) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/apparmor/path.c:97:2: note: '?' condition is false
           if (path->mnt->mnt_flags & MNT_INTERNAL) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/apparmor/path.c:97:2: note: '?' condition is true
           if (path->mnt->mnt_flags & MNT_INTERNAL) {
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
   security/apparmor/path.c:97:2: note: Taking true branch
           if (path->mnt->mnt_flags & MNT_INTERNAL) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/apparmor/path.c:99:3: note: Value assigned to 'res'
                   res =3D dentry_path(path->dentry, buf, buflen);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/apparmor/path.c:100:3: note: Assigning the value of 'res'
                   *name =3D res;
                   ^~~~~~~~~~~
   security/apparmor/path.c:101:7: note: Calling 'IS_ERR'
                   if (IS_ERR(res)) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   include/linux/err.h:89:9: note: Assuming '_l' is equal to 0
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:3: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                   ^~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/err.h:89:9: note: Left side of '&&' is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:11: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                           ^
   include/linux/err.h:89:9: note: '_l' is equal to 0
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:3: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                   ^~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   include/linux/err.h:89:9: note: Left side of '&&' is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:11: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                           ^
   security/apparmor/path.c:101:7: note: Returning from 'IS_ERR'
                   if (IS_ERR(res)) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
                         ^
   security/apparmor/path.c:105:7: note: Assuming field 's_magic' is not eq=
ual to 40864
                   if (path->dentry->d_sb->s_magic =3D=3D PROC_SUPER_MAGIC =
&&
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/apparmor/path.c:105:55: note: Left side of '&&' is false
                   if (path->dentry->d_sb->s_magic =3D=3D PROC_SUPER_MAGIC =
&&
                                                                       ^
   security/apparmor/path.c:105:3: note: '?' condition is false
                   if (path->dentry->d_sb->s_magic =3D=3D PROC_SUPER_MAGIC =
&&
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/apparmor/path.c:105:27: note: Field 's_magic' is not equal to 4=
0864
                   if (path->dentry->d_sb->s_magic =3D=3D PROC_SUPER_MAGIC =
&&
                                           ^
   security/apparmor/path.c:105:55: note: Left side of '&&' is false
                   if (path->dentry->d_sb->s_magic =3D=3D PROC_SUPER_MAGIC =
&&
                                                                       ^
   security/apparmor/path.c:105:3: note: '?' condition is false
                   if (path->dentry->d_sb->s_magic =3D=3D PROC_SUPER_MAGIC =
&&
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
   security/apparmor/path.c:105:3: note: Taking false branch
                   if (path->dentry->d_sb->s_magic =3D=3D PROC_SUPER_MAGIC =
&&
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/apparmor/path.c:113:12: note: Calling 'disconnect'
                           error =3D disconnect(path, buf, name, flags,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/apparmor/path.c:53:6: note: Assuming the condition is false
           if (!(flags & PATH_CONNECT_PATH) &&
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/apparmor/path.c:53:35: note: Left side of '&&' is false
           if (!(flags & PATH_CONNECT_PATH) &&
                                            ^
   security/apparmor/path.c:53:2: note: '?' condition is false
           if (!(flags & PATH_CONNECT_PATH) &&
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/apparmor/path.c:53:35: note: Left side of '&&' is false
           if (!(flags & PATH_CONNECT_PATH) &&
                                            ^
   security/apparmor/path.c:53:2: note: '?' condition is false
           if (!(flags & PATH_CONNECT_PATH) &&
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
   security/apparmor/path.c:53:2: note: Taking false branch
           if (!(flags & PATH_CONNECT_PATH) &&
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/apparmor/path.c:63:7: note: Dereference of null pointer
                   if (**name !=3D '/')
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
>> security/apparmor/path.c:106:7: warning: Null pointer passed as 1st argu=
ment to string comparison function [clang-analyzer-unix.cstring.NullArg]
                       strncmp(*name, "/sys/", 5) =3D=3D 0) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/apparmor/path.c:94:15: note: Assuming the condition is false
           int isdir =3D (flags & PATH_IS_DIR) ? 1 : 0;
                        ^~~~~~~~~~~~~~~~~~~
   security/apparmor/path.c:94:14: note: '?' condition is false
           int isdir =3D (flags & PATH_IS_DIR) ? 1 : 0;
                       ^
   security/apparmor/path.c:97:2: note: Assuming the condition is false
           if (path->mnt->mnt_flags & MNT_INTERNAL) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/apparmor/path.c:97:2: note: '?' condition is false
           if (path->mnt->mnt_flags & MNT_INTERNAL) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/apparmor/path.c:97:2: note: '?' condition is true
           if (path->mnt->mnt_flags & MNT_INTERNAL) {
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
   security/apparmor/path.c:97:2: note: Taking true branch
           if (path->mnt->mnt_flags & MNT_INTERNAL) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/apparmor/path.c:99:3: note: Value assigned to 'res'
                   res =3D dentry_path(path->dentry, buf, buflen);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/apparmor/path.c:100:3: note: Assigning the value of 'res'
                   *name =3D res;
                   ^~~~~~~~~~~
   security/apparmor/path.c:101:7: note: Calling 'IS_ERR'
                   if (IS_ERR(res)) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   include/linux/err.h:89:9: note: Assuming '_l' is equal to 0
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:3: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                   ^~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/err.h:89:9: note: Left side of '&&' is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:11: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                           ^
   include/linux/err.h:89:9: note: '_l' is equal to 0
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:3: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                   ^~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   include/linux/err.h:89:9: note: Left side of '&&' is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:11: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
--
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/nvdimm/namespace_devs.c:2275:2: note: Taking false branch
           if (!nsblk)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/nvdimm/namespace_devs.c:2285:6: note: Assuming field 'uuid' is n=
on-null
           if (!nsblk->uuid)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/nvdimm/namespace_devs.c:2285:2: note: '?' condition is false
           if (!nsblk->uuid)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvdimm/namespace_devs.c:2285:14: note: Field 'uuid' is non-null
           if (!nsblk->uuid)
                       ^
   drivers/nvdimm/namespace_devs.c:2285:2: note: '?' condition is false
           if (!nsblk->uuid)
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
   drivers/nvdimm/namespace_devs.c:2285:2: note: Taking false branch
           if (!nsblk->uuid)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/nvdimm/namespace_devs.c:2288:2: note: Assuming the condition is =
true
           if (name[0]) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/nvdimm/namespace_devs.c:2288:2: note: '?' condition is false
           if (name[0]) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvdimm/namespace_devs.c:2288:2: note: '?' condition is false
           if (name[0]) {
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
   drivers/nvdimm/namespace_devs.c:2288:2: note: Taking false branch
           if (name[0]) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/nvdimm/namespace_devs.c:2293:8: note: Calling 'nsblk_add_resourc=
e'
           res =3D nsblk_add_resource(nd_region, ndd, nsblk,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/namespace_devs.c:2089:43: note: The left operand of '+' i=
s a garbage value
                           sizeof(void *) * (nsblk->num_resources + 1),
                                             ~~~~~~~~~~~~~~~~~~~~ ^
   1 warning generated.
   kernel/trace/trace_printk.c:77:5: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcpy(fmt, *iter);
                                   ^~~~~~
   kernel/trace/trace_printk.c:77:5: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                                   strcpy(fmt, *iter);
                                   ^~~~~~
   1 warning generated.
>> fs/autofs/waitq.c:358:14: warning: Null pointer passed as 1st argument t=
o string length function [clang-analyzer-unix.cstring.NullArg]
                   qstr.len =3D strlen(p);
                              ^      ~
   fs/autofs/waitq.c:315:2: note: Assuming the condition is true
           if (sbi->flags & AUTOFS_SBI_CATATONIC)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/autofs/waitq.c:315:2: note: '?' condition is false
           if (sbi->flags & AUTOFS_SBI_CATATONIC)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/autofs/waitq.c:315:2: note: '?' condition is false
           if (sbi->flags & AUTOFS_SBI_CATATONIC)
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
   fs/autofs/waitq.c:315:2: note: Taking false branch
           if (sbi->flags & AUTOFS_SBI_CATATONIC)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/autofs/waitq.c:325:6: note: Assuming 'pid' is not equal to 0
           if (pid =3D=3D 0 || tgid =3D=3D 0)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/autofs/waitq.c:325:6: note: Left side of '||' is false
           if (pid =3D=3D 0 || tgid =3D=3D 0)
               ^
   fs/autofs/waitq.c:325:18: note: Assuming 'tgid' is not equal to 0
           if (pid =3D=3D 0 || tgid =3D=3D 0)
                           ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/autofs/waitq.c:325:2: note: '?' condition is false
           if (pid =3D=3D 0 || tgid =3D=3D 0)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/autofs/waitq.c:325:6: note: 'pid' is not equal to 0
           if (pid =3D=3D 0 || tgid =3D=3D 0)
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
   fs/autofs/waitq.c:325:6: note: Left side of '||' is false
           if (pid =3D=3D 0 || tgid =3D=3D 0)
               ^
   fs/autofs/waitq.c:325:18: note: 'tgid' is not equal to 0
           if (pid =3D=3D 0 || tgid =3D=3D 0)
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
   fs/autofs/waitq.c:325:2: note: '?' condition is false
           if (pid =3D=3D 0 || tgid =3D=3D 0)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
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
   include/linux/hid.h:1036:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
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
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/linux/hid.h:1036:3: note: '?' condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
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
   include/linux/hid.h:1036:3: note: '?' condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
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
   include/linux/hid.h:1036:3: note: Loop condition is false.  Exiting loop
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
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
   include/linux/hid.h:1037:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:656:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:640:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   1 warning generated.
>> drivers/hid/uhid.c:519:2: warning: Null pointer passed as 1st argument t=
o string copy function [clang-analyzer-unix.cstring.NullArg]
           strncpy(hid->name, ev->u.create2.name, len);
           ^
   drivers/hid/uhid.c:729:6: note: Assuming the condition is false
           if (count < sizeof(__u32))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/hid/uhid.c:729:2: note: '?' condition is false
           if (count < sizeof(__u32))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/hid/uhid.c:729:2: note: '?' condition is false
           if (count < sizeof(__u32))
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
   drivers/hid/uhid.c:729:2: note: Taking false branch
           if (count < sizeof(__u32))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/hid/uhid.c:733:2: note: Assuming 'ret' is 0
           if (ret)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/hid/uhid.c:733:2: note: '?' condition is false
           if (ret)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/hid/uhid.c:733:6: note: 'ret' is 0
           if (ret)
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
   drivers/hid/uhid.c:733:2: note: '?' condition is false
           if (ret)
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
   drivers/hid/uhid.c:733:2: note: Taking false branch
           if (ret)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/hid/uhid.c:737:8: note: Assuming '__UNIQUE_ID___x231' is >=3D '_=
_UNIQUE_ID___y232'
           len =3D min(count, sizeof(uhid->input_buf));
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
--
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/soc/soc-dapm.c:1655:6: note: 'power_up' is true
           if (power_up)
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
   sound/soc/soc-dapm.c:1655:2: note: '?' condition is true
           if (power_up)
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
   sound/soc/soc-dapm.c:1655:2: note: Taking true branch
           if (power_up)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/soc/soc-dapm.c:1660:2: note: Loop condition is false. Execution co=
ntinues on line 1729
           list_for_each_entry_safe(w, n, list, power_list) {
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   sound/soc/soc-dapm.c:1729:6: note: Assuming the condition is false
           if (!list_empty(&pending))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   sound/soc/soc-dapm.c:1729:2: note: '?' condition is false
           if (!list_empty(&pending))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/soc/soc-dapm.c:1729:6: note: Assuming the condition is true
           if (!list_empty(&pending))
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
   sound/soc/soc-dapm.c:1729:2: note: '?' condition is true
           if (!list_empty(&pending))
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
   sound/soc/soc-dapm.c:1729:2: note: Taking true branch
           if (!list_empty(&pending))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/soc/soc-dapm.c:1730:3: note: Calling 'dapm_seq_run_coalesced'
                   dapm_seq_run_coalesced(card, &pending);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-dapm.c:1594:6: note: Assigned value is garbage or undefined
           reg =3D w->reg;
               ^ ~~~~~~
   1 warning generated.
   drivers/nvme/target/core.c:1124:10: warning: Although the value stored t=
o 'cc_css' is used in the enclosing expression, the value is never actually=
 read from 'cc_css' [clang-analyzer-deadcode.DeadStores]
           switch (cc_css <<=3D NVME_CC_CSS_SHIFT) {
                   ^          ~~~~~~~~~~~~~~~~~
   drivers/nvme/target/core.c:1124:10: note: Although the value stored to '=
cc_css' is used in the enclosing expression, the value is never actually re=
ad from 'cc_css'
           switch (cc_css <<=3D NVME_CC_CSS_SHIFT) {
                   ^          ~~~~~~~~~~~~~~~~~
   2 warnings generated.
>> include/net/neighbour.h:592:3: warning: Null pointer passed as 2nd argum=
ent to memory copy function [clang-analyzer-unix.cstring.NullArg]
                   memcpy(dst, n->ha, dev->addr_len);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^
   net/sched/sch_teql.c:265:6: note: Left side of '||' is false
           if (rcu_access_pointer(txq->qdisc) =3D=3D &noop_qdisc)
               ^
   include/linux/rcupdate.h:495:31: note: expanded from macro 'rcu_access_p=
ointer'
   #define rcu_access_pointer(p) __rcu_access_pointer((p), __UNIQUE_ID(rcu)=
, __rcu)
                                 ^
   include/linux/rcupdate.h:384:43: note: expanded from macro '__rcu_access=
_pointer'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/sched/sch_teql.c:265:6: note: Left side of '||' is false
           if (rcu_access_pointer(txq->qdisc) =3D=3D &noop_qdisc)
               ^
   include/linux/rcupdate.h:495:31: note: expanded from macro 'rcu_access_p=
ointer'
   #define rcu_access_pointer(p) __rcu_access_pointer((p), __UNIQUE_ID(rcu)=
, __rcu)
                                 ^
   include/linux/rcupdate.h:384:43: note: expanded from macro '__rcu_access=
_pointer'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/sched/sch_teql.c:265:6: note: Left side of '||' is true
           if (rcu_access_pointer(txq->qdisc) =3D=3D &noop_qdisc)
               ^
   include/linux/rcupdate.h:495:31: note: expanded from macro 'rcu_access_p=
ointer'
   #define rcu_access_pointer(p) __rcu_access_pointer((p), __UNIQUE_ID(rcu)=
, __rcu)
                                 ^
   include/linux/rcupdate.h:384:43: note: expanded from macro '__rcu_access=
_pointer'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:314:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   net/sched/sch_teql.c:265:6: note: '?' condition is true
           if (rcu_access_pointer(txq->qdisc) =3D=3D &noop_qdisc)
               ^
   include/linux/rcupdate.h:495:31: note: expanded from macro 'rcu_access_p=
ointer'
   #define rcu_access_pointer(p) __rcu_access_pointer((p), __UNIQUE_ID(rcu)=
, __rcu)
                                 ^
   include/linux/rcupdate.h:384:43: note: expanded from macro '__rcu_access=
_pointer'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
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
   net/sched/sch_teql.c:265:6: note: Left side of '||' is false
           if (rcu_access_pointer(txq->qdisc) =3D=3D &noop_qdisc)
               ^
   include/linux/rcupdate.h:495:31: note: expanded from macro 'rcu_access_p=
ointer'
   #define rcu_access_pointer(p) __rcu_access_pointer((p), __UNIQUE_ID(rcu)=
, __rcu)
                                 ^
   include/linux/rcupdate.h:384:43: note: expanded from macro '__rcu_access=
_pointer'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/sched/sch_teql.c:265:6: note: Left side of '||' is false

vim +60 security/apparmor/path.c

cdff264264254e John Johansen    2010-07-29   36  =

bd35db8b8ca6e2 John Johansen    2014-07-25   37  /* If the path is not conn=
ected to the expected root,
bd35db8b8ca6e2 John Johansen    2014-07-25   38   * check if it is a sysctl=
 and handle specially else remove any
bd35db8b8ca6e2 John Johansen    2014-07-25   39   * leading / that __d_path=
 may have returned.
bd35db8b8ca6e2 John Johansen    2014-07-25   40   * Unless
bd35db8b8ca6e2 John Johansen    2014-07-25   41   *     specifically direct=
ed to connect the path,
bd35db8b8ca6e2 John Johansen    2014-07-25   42   * OR
bd35db8b8ca6e2 John Johansen    2014-07-25   43   *     if in a chroot and =
doing chroot relative paths and the path
bd35db8b8ca6e2 John Johansen    2014-07-25   44   *     resolves to the nam=
espace root (would be connected outside
bd35db8b8ca6e2 John Johansen    2014-07-25   45   *     of chroot) and spec=
ifically directed to connect paths to
bd35db8b8ca6e2 John Johansen    2014-07-25   46   *     namespace root.
bd35db8b8ca6e2 John Johansen    2014-07-25   47   */
bd35db8b8ca6e2 John Johansen    2014-07-25   48  static int disconnect(cons=
t struct path *path, char *buf, char **name,
72c8a768641dc6 John Johansen    2017-05-22   49  		      int flags, const c=
har *disconnected)
bd35db8b8ca6e2 John Johansen    2014-07-25   50  {
bd35db8b8ca6e2 John Johansen    2014-07-25   51  	int error =3D 0;
bd35db8b8ca6e2 John Johansen    2014-07-25   52  =

bd35db8b8ca6e2 John Johansen    2014-07-25   53  	if (!(flags & PATH_CONNEC=
T_PATH) &&
bd35db8b8ca6e2 John Johansen    2014-07-25   54  	    !(((flags & CHROOT_NS=
CONNECT) =3D=3D CHROOT_NSCONNECT) &&
bd35db8b8ca6e2 John Johansen    2014-07-25   55  	      our_mnt(path->mnt))=
) {
bd35db8b8ca6e2 John Johansen    2014-07-25   56  		/* disconnected path, do=
n't return pathname starting
bd35db8b8ca6e2 John Johansen    2014-07-25   57  		 * with '/'
bd35db8b8ca6e2 John Johansen    2014-07-25   58  		 */
bd35db8b8ca6e2 John Johansen    2014-07-25   59  		error =3D -EACCES;
bd35db8b8ca6e2 John Johansen    2014-07-25  @60  		if (**name =3D=3D '/')
bd35db8b8ca6e2 John Johansen    2014-07-25   61  			*name =3D *name + 1;
72c8a768641dc6 John Johansen    2017-05-22   62  	} else {
72c8a768641dc6 John Johansen    2017-05-22   63  		if (**name !=3D '/')
bd35db8b8ca6e2 John Johansen    2014-07-25   64  			/* CONNECT_PATH with mi=
ssing root */
bd35db8b8ca6e2 John Johansen    2014-07-25   65  			error =3D prepend(name,=
 *name - buf, "/", 1);
72c8a768641dc6 John Johansen    2017-05-22   66  		if (!error && disconnect=
ed)
72c8a768641dc6 John Johansen    2017-05-22   67  			error =3D prepend(name,=
 *name - buf, disconnected,
72c8a768641dc6 John Johansen    2017-05-22   68  					strlen(disconnected));
72c8a768641dc6 John Johansen    2017-05-22   69  	}
bd35db8b8ca6e2 John Johansen    2014-07-25   70  =

bd35db8b8ca6e2 John Johansen    2014-07-25   71  	return error;
bd35db8b8ca6e2 John Johansen    2014-07-25   72  }
bd35db8b8ca6e2 John Johansen    2014-07-25   73  =

cdff264264254e John Johansen    2010-07-29   74  /**
cdff264264254e John Johansen    2010-07-29   75   * d_namespace_path - look=
up a name associated with a given path
cdff264264254e John Johansen    2010-07-29   76   * @path: path to lookup  =
(NOT NULL)
cdff264264254e John Johansen    2010-07-29   77   * @buf:  buffer to store =
path to  (NOT NULL)
cdff264264254e John Johansen    2010-07-29   78   * @name: Returns - pointe=
r for start of path name with in @buf (NOT NULL)
cdff264264254e John Johansen    2010-07-29   79   * @flags: flags controlli=
ng path lookup
72c8a768641dc6 John Johansen    2017-05-22   80   * @disconnected: string t=
o prefix to disconnected paths
cdff264264254e John Johansen    2010-07-29   81   *
cdff264264254e John Johansen    2010-07-29   82   * Handle path name lookup.
cdff264264254e John Johansen    2010-07-29   83   *
cdff264264254e John Johansen    2010-07-29   84   * Returns: %0 else error =
code if path lookup fails
cdff264264254e John Johansen    2010-07-29   85   *          When no error =
the path name is returned in @name which points to
4af7c863fc85ad Randy Dunlap     2020-08-07   86   *          a position in =
@buf
cdff264264254e John Johansen    2010-07-29   87   */
4227c333f65cdd John Johansen    2017-05-23   88  static int d_namespace_pat=
h(const struct path *path, char *buf, char **name,
4227c333f65cdd John Johansen    2017-05-23   89  			    int flags, const ch=
ar *disconnected)
cdff264264254e John Johansen    2010-07-29   90  {
cdff264264254e John Johansen    2010-07-29   91  	char *res;
02125a826459a6 Al Viro          2011-12-05   92  	int error =3D 0;
02125a826459a6 Al Viro          2011-12-05   93  	int connected =3D 1;
4227c333f65cdd John Johansen    2017-05-23   94  	int isdir =3D (flags & PA=
TH_IS_DIR) ? 1 : 0;
4227c333f65cdd John Johansen    2017-05-23   95  	int buflen =3D aa_g_path_=
max - isdir;
cdff264264254e John Johansen    2010-07-29   96  =

02125a826459a6 Al Viro          2011-12-05   97  	if (path->mnt->mnt_flags =
& MNT_INTERNAL) {
02125a826459a6 Al Viro          2011-12-05   98  		/* it's not mounted anyw=
here */
02125a826459a6 Al Viro          2011-12-05   99  		res =3D dentry_path(path=
->dentry, buf, buflen);
02125a826459a6 Al Viro          2011-12-05  100  		*name =3D res;
02125a826459a6 Al Viro          2011-12-05  101  		if (IS_ERR(res)) {
02125a826459a6 Al Viro          2011-12-05  102  			*name =3D buf;
02125a826459a6 Al Viro          2011-12-05  103  			return PTR_ERR(res);
02125a826459a6 Al Viro          2011-12-05  104  		}
02125a826459a6 Al Viro          2011-12-05  105  		if (path->dentry->d_sb->=
s_magic =3D=3D PROC_SUPER_MAGIC &&
02125a826459a6 Al Viro          2011-12-05 @106  		    strncmp(*name, "/sys=
/", 5) =3D=3D 0) {
02125a826459a6 Al Viro          2011-12-05  107  			/* TODO: convert over t=
o using a per namespace
02125a826459a6 Al Viro          2011-12-05  108  			 * control instead of h=
ard coded /proc
02125a826459a6 Al Viro          2011-12-05  109  			 */
4227c333f65cdd John Johansen    2017-05-23  110  			error =3D prepend(name,=
 *name - buf, "/proc", 5);
4227c333f65cdd John Johansen    2017-05-23  111  			goto out;
bd35db8b8ca6e2 John Johansen    2014-07-25  112  		} else
4227c333f65cdd John Johansen    2017-05-23  113  			error =3D disconnect(pa=
th, buf, name, flags,
72c8a768641dc6 John Johansen    2017-05-22  114  					   disconnected);
4227c333f65cdd John Johansen    2017-05-23  115  		goto out;
02125a826459a6 Al Viro          2011-12-05  116  	}
02125a826459a6 Al Viro          2011-12-05  117  =

02125a826459a6 Al Viro          2011-12-05  118  	/* resolve paths relative=
 to chroot?*/
cdff264264254e John Johansen    2010-07-29  119  	if (flags & PATH_CHROOT_R=
EL) {
02125a826459a6 Al Viro          2011-12-05  120  		struct path root;
44672e4fbd40e2 Nicholas Piggin  2010-08-18  121  		get_fs_root(current->fs,=
 &root);
02125a826459a6 Al Viro          2011-12-05  122  		res =3D __d_path(path, &=
root, buf, buflen);
02125a826459a6 Al Viro          2011-12-05  123  		path_put(&root);
3372b68a3c9826 John Johansen    2012-02-16  124  	} else {
02125a826459a6 Al Viro          2011-12-05  125  		res =3D d_absolute_path(=
path, buf, buflen);
3372b68a3c9826 John Johansen    2012-02-16  126  		if (!our_mnt(path->mnt))
3372b68a3c9826 John Johansen    2012-02-16  127  			connected =3D 0;
3372b68a3c9826 John Johansen    2012-02-16  128  	}
cdff264264254e John Johansen    2010-07-29  129  =

cdff264264254e John Johansen    2010-07-29  130  	/* handle error condition=
s - and still allow a partial path to
cdff264264254e John Johansen    2010-07-29  131  	 * be returned.
cdff264264254e John Johansen    2010-07-29  132  	 */
3372b68a3c9826 John Johansen    2012-02-16  133  	if (!res || IS_ERR(res)) {
4227c333f65cdd John Johansen    2017-05-23  134  		if (PTR_ERR(res) =3D=3D =
-ENAMETOOLONG) {
4227c333f65cdd John Johansen    2017-05-23  135  			error =3D -ENAMETOOLONG;
4227c333f65cdd John Johansen    2017-05-23  136  			*name =3D buf;
4227c333f65cdd John Johansen    2017-05-23  137  			goto out;
4227c333f65cdd John Johansen    2017-05-23  138  		}
3372b68a3c9826 John Johansen    2012-02-16  139  		connected =3D 0;
fbba8d89acea5d John Johansen    2012-02-16  140  		res =3D dentry_path_raw(=
path->dentry, buf, buflen);
cdff264264254e John Johansen    2010-07-29  141  		if (IS_ERR(res)) {
cdff264264254e John Johansen    2010-07-29  142  			error =3D PTR_ERR(res);
cdff264264254e John Johansen    2010-07-29  143  			*name =3D buf;
cdff264264254e John Johansen    2010-07-29  144  			goto out;
e4f4e6ba5eaadb Vasyl Gomonovych 2019-07-26  145  		}
fbba8d89acea5d John Johansen    2012-02-16  146  	} else if (!our_mnt(path-=
>mnt))
02125a826459a6 Al Viro          2011-12-05  147  		connected =3D 0;
cdff264264254e John Johansen    2010-07-29  148  =

fbba8d89acea5d John Johansen    2012-02-16  149  	*name =3D res;
fbba8d89acea5d John Johansen    2012-02-16  150  =

4227c333f65cdd John Johansen    2017-05-23  151  	if (!connected)
4227c333f65cdd John Johansen    2017-05-23  152  		error =3D disconnect(pat=
h, buf, name, flags, disconnected);
4227c333f65cdd John Johansen    2017-05-23  153  =

e819ff519b2d74 John Johansen    2010-08-27  154  	/* Handle two cases:
e819ff519b2d74 John Johansen    2010-08-27  155  	 * 1. A deleted dentry &&=
 profile is not allowing mediation of deleted
e819ff519b2d74 John Johansen    2010-08-27  156  	 * 2. On some filesystems=
, newly allocated dentries appear to the
e819ff519b2d74 John Johansen    2010-08-27  157  	 *    security_path hooks=
 as a deleted dentry except without an inode
e819ff519b2d74 John Johansen    2010-08-27  158  	 *    allocated.
e819ff519b2d74 John Johansen    2010-08-27  159  	 */
729b8a3dee2bc8 David Howells    2015-01-29  160  	if (d_unlinked(path->dent=
ry) && d_is_positive(path->dentry) &&
4227c333f65cdd John Johansen    2017-05-23  161  	    !(flags & (PATH_MEDIA=
TE_DELETED | PATH_DELEGATE_DELETED))) {
cdff264264254e John Johansen    2010-07-29  162  			error =3D -ENOENT;
cdff264264254e John Johansen    2010-07-29  163  			goto out;
cdff264264254e John Johansen    2010-07-29  164  	}
cdff264264254e John Johansen    2010-07-29  165  =

cdff264264254e John Johansen    2010-07-29  166  out:
cdff264264254e John Johansen    2010-07-29  167  	/*
cdff264264254e John Johansen    2010-07-29  168  	 * Append "/" to the path=
name.  The root directory is a special
cdff264264254e John Johansen    2010-07-29  169  	 * case; it already ends =
in slash.
cdff264264254e John Johansen    2010-07-29  170  	 */
4227c333f65cdd John Johansen    2017-05-23  171  	if (!error && isdir && ((=
*name)[1] !=3D '\0' || (*name)[0] !=3D '/'))
4227c333f65cdd John Johansen    2017-05-23  172  		strcpy(&buf[aa_g_path_ma=
x - 2], "/");
57fa1e18091e66 John Johansen    2012-02-16  173  =

cdff264264254e John Johansen    2010-07-29  174  	return error;
cdff264264254e John Johansen    2010-07-29  175  }
cdff264264254e John Johansen    2010-07-29  176  =


:::::: The code at line 60 was first introduced by commit
:::::: bd35db8b8ca6e27fc17a9057ef78e1ddfc0de351 apparmor: internal paths sh=
ould be treated as disconnected

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: John Johansen <john.johansen@canonical.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8460711239964596271==--

