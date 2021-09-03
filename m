Content-Type: multipart/mixed; boundary="===============4281132719474119865=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 10155/11721] security/keys/encrypted-keys/encrypted.c:935:2: warning: Potential leak of memory pointed to by 'ret' [clang-analyzer-unix.Malloc]
Date: Sat, 04 Sep 2021 01:44:14 +0800
Message-ID: <202109040109.vfESwUvs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4281132719474119865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   14c6345e6e6ca0570f3897214f24748ef6009761
commit: 6bea7154887de1e7ddd3673a03505de911dfb6c4 [10155/11721] fortify: Exp=
licitly disable Clang support
:::::: branch date: 12 hours ago
:::::: commit date: 9 days ago
config: i386-randconfig-c001-20210901 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c9948e=
9254fbb6ea00f66c7b4542311d21e060be)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D6bea7154887de1e7ddd3673a03505de911dfb6c4
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6bea7154887de1e7ddd3673a03505de911dfb6c4
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   security/keys/encrypted-keys/encrypted.c:646:2: note: Taking false branch
           if (!epayload)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/encrypted-keys/encrypted.c:806:13: note: Returned allocate=
d memory
           epayload =3D encrypted_key_alloc(key, format, master_desc,
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/encrypted-keys/encrypted.c:808:2: note: '?' condition is f=
alse
           if (IS_ERR(epayload)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/keys/encrypted-keys/encrypted.c:808:2: note: '?' condition is f=
alse
           if (IS_ERR(epayload)) {
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
   security/keys/encrypted-keys/encrypted.c:808:2: note: Taking false branch
           if (IS_ERR(epayload)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/encrypted-keys/encrypted.c:814:6: note: 'ret' is < 0
           if (ret < 0) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/keys/encrypted-keys/encrypted.c:814:2: note: '?' condition is f=
alse
           if (ret < 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/keys/encrypted-keys/encrypted.c:814:6: note: 'ret' is < 0
           if (ret < 0) {
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
   security/keys/encrypted-keys/encrypted.c:814:2: note: '?' condition is t=
rue
           if (ret < 0) {
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
   security/keys/encrypted-keys/encrypted.c:814:2: note: Taking true branch
           if (ret < 0) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/encrypted-keys/encrypted.c:816:3: note: Control jumps to l=
ine 821
                   goto out;
                   ^
   security/keys/encrypted-keys/encrypted.c:821:2: note: Potential leak of =
memory pointed to by 'epayload'
           kfree_sensitive(datablob);
           ^
>> security/keys/encrypted-keys/encrypted.c:935:2: warning: Potential leak =
of memory pointed to by 'ret' [clang-analyzer-unix.Malloc]
           if (ret < 0)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/keys/encrypted-keys/encrypted.c:912:13: note: Left side of '&&'=
 is false
           epayload =3D dereference_key_locked(key);
                      ^
   include/linux/key.h:471:3: note: expanded from macro 'dereference_key_lo=
cked'
           (rcu_dereference_protected((KEY)->payload.rcu_data0,            \
            ^
   include/linux/rcupdate.h:587:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:396:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:318:11: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                           ^
   security/keys/encrypted-keys/encrypted.c:912:13: note: '?' condition is =
false
           epayload =3D dereference_key_locked(key);
                      ^
   include/linux/key.h:471:3: note: expanded from macro 'dereference_key_lo=
cked'
           (rcu_dereference_protected((KEY)->payload.rcu_data0,            \
            ^
   include/linux/rcupdate.h:587:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:396:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:318:3: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/keys/encrypted-keys/encrypted.c:912:13: note: Left side of '&&'=
 is false
           epayload =3D dereference_key_locked(key);
                      ^
   include/linux/key.h:471:3: note: expanded from macro 'dereference_key_lo=
cked'
           (rcu_dereference_protected((KEY)->payload.rcu_data0,            \
            ^
   include/linux/rcupdate.h:587:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:396:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:318:11: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                           ^
   security/keys/encrypted-keys/encrypted.c:912:13: note: '?' condition is =
false
           epayload =3D dereference_key_locked(key);
                      ^
   include/linux/key.h:471:3: note: expanded from macro 'dereference_key_lo=
cked'
           (rcu_dereference_protected((KEY)->payload.rcu_data0,            \
            ^
   include/linux/rcupdate.h:587:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:396:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   security/keys/encrypted-keys/encrypted.c:912:13: note: Taking false bran=
ch
           epayload =3D dereference_key_locked(key);
                      ^
   include/linux/key.h:471:3: note: expanded from macro 'dereference_key_lo=
cked'
           (rcu_dereference_protected((KEY)->payload.rcu_data0,            \
            ^
   include/linux/rcupdate.h:587:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:396:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:318:3: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/encrypted-keys/encrypted.c:912:13: note: Loop condition is=
 false.  Exiting loop
--
   kernel/locking/lockdep.c:1983:6: note: Assuming the condition is false
           if (!debug_locks_off_graph_unlock() || debug_locks_silent)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:1983:6: note: Left side of '||' is false
   kernel/locking/lockdep.c:1983:41: note: Assuming 'debug_locks_silent' is=
 0
           if (!debug_locks_off_graph_unlock() || debug_locks_silent)
                                                  ^~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:1983:2: note: Taking false branch
           if (!debug_locks_off_graph_unlock() || debug_locks_silent)
           ^
   kernel/locking/lockdep.c:1987:6: note: Assuming field 'trace' is non-null
           if (!this->trace)
               ^~~~~~~~~~~~
   kernel/locking/lockdep.c:1987:2: note: Taking false branch
           if (!this->trace)
           ^
   kernel/locking/lockdep.c:1990:10: note: Value assigned to field 'parent'
           depth =3D get_lock_depth(target);
                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:1992:2: note: Calling 'print_circular_bug_heade=
r'
           print_circular_bug_header(target, depth, check_src, check_tgt);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:1890:6: note: Assuming 'debug_locks_silent' is =
not equal to 0
           if (debug_locks_silent)
               ^~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:1890:2: note: Taking true branch
           if (debug_locks_silent)
           ^
   kernel/locking/lockdep.c:1891:3: note: Returning without writing to 'ent=
ry->parent'
                   return;
                   ^
   kernel/locking/lockdep.c:1992:2: note: Returning from 'print_circular_bu=
g_header'
           print_circular_bug_header(target, depth, check_src, check_tgt);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:1994:11: note: Calling 'get_lock_parent'
           parent =3D get_lock_parent(target);
                    ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:1489:2: note: Returning without writing to 'chi=
ld->parent'
           return child->parent;
           ^
   kernel/locking/lockdep.c:1489:2: note: Returning pointer
           return child->parent;
           ^~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:1994:11: note: Returning from 'get_lock_parent'
           parent =3D get_lock_parent(target);
                    ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:1994:2: note: Value assigned to 'parent'
           parent =3D get_lock_parent(target);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:1995:2: note: The value of 'parent' is assigned=
 to 'first_parent'
           first_parent =3D parent;
           ^~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:1997:9: note: Assuming pointer value is null
           while (parent) {
                  ^~~~~~
   kernel/locking/lockdep.c:1997:2: note: Loop condition is false. Executio=
n continues on line 2002
           while (parent) {
           ^
   kernel/locking/lockdep.c:2004:10: note: Passing null pointer value via 3=
rd parameter 'prt'
                                        first_parent);
                                        ^~~~~~~~~~~~
   kernel/locking/lockdep.c:2003:2: note: Calling 'print_circular_lock_scen=
ario'
           print_circular_lock_scenario(check_src, check_tgt,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:1836:30: note: Access to field 'class' results =
in a dereference of a null pointer (loaded from variable 'prt')
           struct lock_class *parent =3D prt->class;
                                       ^~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   crypto/drbg.c:245:17: warning: Value stored to 'entropylen' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned short entropylen =3D drbg_sec_strength(drbg->core->flag=
s);
                          ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/drbg.c:245:17: note: Value stored to 'entropylen' during its init=
ialization is never read
           unsigned short entropylen =3D drbg_sec_strength(drbg->core->flag=
s);
                          ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   crypto/tcrypt.c:292:2: warning: Value stored to 'ret' is never read [cla=
ng-analyzer-deadcode.DeadStores]
           ret =3D crypto_aead_setauthsize(tfm, authsize);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/tcrypt.c:292:2: note: Value stored to 'ret' is never read
           ret =3D crypto_aead_setauthsize(tfm, authsize);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/tcrypt.c:614:4: warning: Value stored to 'ret' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                           ret =3D crypto_aead_setkey(tfm, key, *keysize);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/tcrypt.c:614:4: note: Value stored to 'ret' is never read
                           ret =3D crypto_aead_setkey(tfm, key, *keysize);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> crypto/tcrypt.c:687:2: warning: Potential leak of memory pointed to by '=
req' [clang-analyzer-unix.Malloc]
           crypto_free_aead(tfm);
           ^
   crypto/tcrypt.c:544:6: note: Assuming 'iv' is non-null
           if (!iv)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   crypto/tcrypt.c:544:2: note: '?' condition is false
           if (!iv)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   crypto/tcrypt.c:544:7: note: 'iv' is non-null
           if (!iv)
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
   crypto/tcrypt.c:544:2: note: '?' condition is false
           if (!iv)
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
   crypto/tcrypt.c:544:2: note: Taking false branch
           if (!iv)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   crypto/tcrypt.c:547:6: note: Assuming the condition is false
           if (aad_size >=3D PAGE_SIZE) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   crypto/tcrypt.c:547:2: note: '?' condition is false
           if (aad_size >=3D PAGE_SIZE) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   crypto/tcrypt.c:547:2: note: '?' condition is false
           if (aad_size >=3D PAGE_SIZE) {
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
   crypto/tcrypt.c:547:2: note: Taking false branch
           if (aad_size >=3D PAGE_SIZE) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   crypto/tcrypt.c:552:6: note: Assuming 'enc' is not equal to 1
           if (enc =3D=3D ENCRYPT)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   crypto/tcrypt.c:552:2: note: '?' condition is false
           if (enc =3D=3D ENCRYPT)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
                                                      ^~~~
   arch/x86/kernel/apic/io_apic.c:1295:34: note: Left side of '&&' is false
           if (reg_01.bits.version >=3D 0x10 && reg_02.raw !=3D reg_01.raw)=
 {
                                           ^
   arch/x86/kernel/apic/io_apic.c:1295:2: note: '?' condition is false
           if (reg_01.bits.version >=3D 0x10 && reg_02.raw !=3D reg_01.raw)=
 {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   arch/x86/kernel/apic/io_apic.c:1295:6: note: Assuming field 'version' is=
 < 16
           if (reg_01.bits.version >=3D 0x10 && reg_02.raw !=3D reg_01.raw)=
 {
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
   arch/x86/kernel/apic/io_apic.c:1295:34: note: Left side of '&&' is false
           if (reg_01.bits.version >=3D 0x10 && reg_02.raw !=3D reg_01.raw)=
 {
                                           ^
   arch/x86/kernel/apic/io_apic.c:1295:2: note: '?' condition is false
           if (reg_01.bits.version >=3D 0x10 && reg_02.raw !=3D reg_01.raw)=
 {
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
   arch/x86/kernel/apic/io_apic.c:1295:2: note: Taking false branch
           if (reg_01.bits.version >=3D 0x10 && reg_02.raw !=3D reg_01.raw)=
 {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   arch/x86/kernel/apic/io_apic.c:1305:6: note: Assuming field 'version' is=
 >=3D 32
           if (reg_01.bits.version >=3D 0x20 && reg_03.raw !=3D reg_02.raw =
&&
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   arch/x86/kernel/apic/io_apic.c:1305:6: note: Left side of '&&' is true
           if (reg_01.bits.version >=3D 0x20 && reg_03.raw !=3D reg_02.raw =
&&
               ^
   arch/x86/kernel/apic/io_apic.c:1305:48: note: The right operand of '!=3D=
' is a garbage value
           if (reg_01.bits.version >=3D 0x20 && reg_03.raw !=3D reg_02.raw =
&&
                                                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (3 in non-user code, 40 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/acpi/acpica/rscreate.c:327:5: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcpy(user_prt->source,
                                   ^~~~~~
   drivers/acpi/acpica/rscreate.c:327:5: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
                                   strcpy(user_prt->source,
                                   ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/mtd/lpddr/qinfo_probe.c:173:10: warning: Potential leak of memor=
y pointed to by 'lpddr.qinfo' [clang-analyzer-unix.Malloc]
                   return NULL;
                          ^
   include/linux/stddef.h:8:23: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                         ^
   drivers/mtd/lpddr/qinfo_probe.c:190:10: note: Calling 'lpddr_probe_chip'
           lpddr =3D lpddr_probe_chip(map);
                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/lpddr/qinfo_probe.c:152:6: note: Assuming the condition is f=
alse
           if ((map->pfow_base + 0x1000) >=3D map->size) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/mtd/lpddr/qinfo_probe.c:152:2: note: '?' condition is false
           if ((map->pfow_base + 0x1000) >=3D map->size) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/mtd/lpddr/qinfo_probe.c:152:2: note: '?' condition is false
           if ((map->pfow_base + 0x1000) >=3D map->size) {
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
   drivers/mtd/lpddr/qinfo_probe.c:152:2: note: Taking false branch
           if ((map->pfow_base + 0x1000) >=3D map->size) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/mtd/lpddr/qinfo_probe.c:159:6: note: Assuming the condition is f=
alse
           if (!lpddr_pfow_present(map, &lpddr))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/mtd/lpddr/qinfo_probe.c:159:2: note: '?' condition is false
           if (!lpddr_pfow_present(map, &lpddr))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/mtd/lpddr/qinfo_probe.c:159:6: note: Assuming the condition is f=
alse
           if (!lpddr_pfow_present(map, &lpddr))
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
   drivers/mtd/lpddr/qinfo_probe.c:159:2: note: '?' condition is false
           if (!lpddr_pfow_present(map, &lpddr))
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
   drivers/mtd/lpddr/qinfo_probe.c:159:2: note: Taking false branch
           if (!lpddr_pfow_present(map, &lpddr))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/mtd/lpddr/qinfo_probe.c:162:2: note: '?' condition is false
           if (!lpddr_chip_setup(map, &lpddr))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
--
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/spi/spi-dw-dma.c:597:6: note: Left side of '||' is false
           if (!dws->dma_sg_burst || !xfer->rx_buf || nents <=3D dws->dma_s=
g_burst)
               ^
   drivers/spi/spi-dw-dma.c:597:28: note: Assuming field 'rx_buf' is non-nu=
ll
           if (!dws->dma_sg_burst || !xfer->rx_buf || nents <=3D dws->dma_s=
g_burst)
                                     ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/spi/spi-dw-dma.c:597:6: note: Left side of '||' is false
           if (!dws->dma_sg_burst || !xfer->rx_buf || nents <=3D dws->dma_s=
g_burst)
               ^
   drivers/spi/spi-dw-dma.c:597:45: note: Assuming 'nents' is > field 'dma_=
sg_burst'
           if (!dws->dma_sg_burst || !xfer->rx_buf || nents <=3D dws->dma_s=
g_burst)
                                                      ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/spi/spi-dw-dma.c:597:2: note: '?' condition is false
           if (!dws->dma_sg_burst || !xfer->rx_buf || nents <=3D dws->dma_s=
g_burst)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/spi/spi-dw-dma.c:597:12: note: Field 'dma_sg_burst' is not equal=
 to 0
           if (!dws->dma_sg_burst || !xfer->rx_buf || nents <=3D dws->dma_s=
g_burst)
                     ^
   drivers/spi/spi-dw-dma.c:597:6: note: Left side of '||' is false
           if (!dws->dma_sg_burst || !xfer->rx_buf || nents <=3D dws->dma_s=
g_burst)
               ^
   drivers/spi/spi-dw-dma.c:597:35: note: Field 'rx_buf' is non-null
           if (!dws->dma_sg_burst || !xfer->rx_buf || nents <=3D dws->dma_s=
g_burst)
                                            ^
   drivers/spi/spi-dw-dma.c:597:6: note: Left side of '||' is false
           if (!dws->dma_sg_burst || !xfer->rx_buf || nents <=3D dws->dma_s=
g_burst)
               ^
   drivers/spi/spi-dw-dma.c:597:45: note: 'nents' is > field 'dma_sg_burst'
           if (!dws->dma_sg_burst || !xfer->rx_buf || nents <=3D dws->dma_s=
g_burst)
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
   drivers/spi/spi-dw-dma.c:597:2: note: '?' condition is false
           if (!dws->dma_sg_burst || !xfer->rx_buf || nents <=3D dws->dma_s=
g_burst)
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
   drivers/spi/spi-dw-dma.c:597:2: note: Taking false branch
           if (!dws->dma_sg_burst || !xfer->rx_buf || nents <=3D dws->dma_s=
g_burst)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/spi/spi-dw-dma.c:600:9: note: Calling 'dw_spi_dma_transfer_one'
                   ret =3D dw_spi_dma_transfer_one(dws, xfer);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-dw-dma.c:520:2: note: 'ret' declared without an initial =
value
           int ret;
           ^~~~~~~
   drivers/spi/spi-dw-dma.c:525:26: note: Assuming 'base' is >=3D field 'le=
n'
           for (base =3D 0, len =3D 0; base < xfer->len; base +=3D len) {
                                   ^~~~~~~~~~~~~~~~
   drivers/spi/spi-dw-dma.c:525:2: note: Loop condition is false. Execution=
 continues on line 578
           for (base =3D 0, len =3D 0; base < xfer->len; base +=3D len) {
           ^
   drivers/spi/spi-dw-dma.c:580:2: note: Undefined or garbage value returne=
d to caller
           return ret;
           ^      ~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> mm/vmscan.c:2090:2: warning: Address of stack memory associated with loc=
al variable 'pages_to_free' is still referred to by the stack variable 'l_a=
ctive' upon returning to the caller.  This will be a dangling reference [cl=
ang-analyzer-core.StackAddressEscape]
           return nr_moved;
           ^
   mm/vmscan.c:2244:2: note: '?' condition is false
           if (!cgroup_reclaim(sc))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   mm/vmscan.c:2244:2: note: '?' condition is true
           if (!cgroup_reclaim(sc))
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
   mm/vmscan.c:2244:2: note: Taking true branch
           if (!cgroup_reclaim(sc))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   mm/vmscan.c:2250:9: note: Assuming the condition is false
           while (!list_empty(&l_hold)) {
                  ^~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:2250:2: note: Loop condition is false. Execution continues o=
n line 2294
           while (!list_empty(&l_hold)) {
           ^
   mm/vmscan.c:2296:16: note: Calling 'move_pages_to_lru'
           nr_activate =3D move_pages_to_lru(lruvec, &l_active);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:2036:9: note: Assuming the condition is false
           while (!list_empty(list)) {
                  ^~~~~~~~~~~~~~~~~
   mm/vmscan.c:2036:2: note: Loop condition is false. Execution continues o=
n line 2088
           while (!list_empty(list)) {
           ^
   mm/vmscan.c:2090:2: note: Address of stack memory associated with local =
variable 'pages_to_free' is still referred to by the stack variable 'l_acti=
ve' upon returning to the caller.  This will be a dangling reference
           return nr_moved;
           ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   mm/shmem.c:1061:24: warning: Value stored to 'sbinfo' during its initial=
ization is never read [clang-analyzer-deadcode.DeadStores]
           struct shmem_sb_info *sbinfo =3D SHMEM_SB(inode->i_sb);
                                 ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~
   mm/shmem.c:1061:24: note: Value stored to 'sbinfo' during its initializa=
tion is never read
           struct shmem_sb_info *sbinfo =3D SHMEM_SB(inode->i_sb);
                                 ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~
   mm/shmem.c:1221:11: warning: 2nd function call argument is an uninitiali=
zed value [clang-analyzer-core.CallAndMessage]
                   error =3D shmem_swapin_page(inode, indices[i],
                           ^
   mm/shmem.c:1294:2: note: '?' condition is false
           if (list_empty(&shmem_swaplist))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   mm/shmem.c:1294:2: note: Assuming the condition is false
           if (list_empty(&shmem_swaplist))
           ^
   include/linux/compiler.h:56:44: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   mm/shmem.c:1294:2: note: '?' condition is false
           if (list_empty(&shmem_swaplist))
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
   mm/shmem.c:1294:2: note: Taking false branch
           if (list_empty(&shmem_swaplist))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   mm/shmem.c:1298:2: note: Left side of '&&' is false
           list_for_each_entry_safe(info, next, &shmem_swaplist, swaplist) {
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
   drivers/mtd/nand/spi/gigadevice.c:186:3: note: '?' condition is false
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
   drivers/mtd/nand/spi/gigadevice.c:186:3: note: Taking false branch
                   if (ret)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/mtd/nand/spi/gigadevice.c:195:14: note: The left operand of '&' =
is a garbage value
                           ((status2 & STATUS_ECC_MASK) >> 4);
                             ~~~~~~~ ^
   drivers/mtd/nand/spi/gigadevice.c:235:20: warning: The left operand of '=
&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   return ((status2 & STATUS_ECC_MASK) >> 4) + 1;
                            ~~~~~~~ ^
   drivers/mtd/nand/spi/gigadevice.c:213:2: note: 'status2' declared withou=
t an initial value
           u8 status2;
           ^~~~~~~~~~
   drivers/mtd/nand/spi/gigadevice.c:218:2: note: Control jumps to 'case 16=
:'  at line 222
           switch (status & STATUS_ECC_MASK) {
           ^
   drivers/mtd/nand/spi/gigadevice.c:228:3: note: Assuming 'ret' is 0
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
   drivers/mtd/nand/spi/gigadevice.c:228:3: note: '?' condition is false
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
   drivers/mtd/nand/spi/gigadevice.c:228:7: note: 'ret' is 0
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
   drivers/mtd/nand/spi/gigadevice.c:228:3: note: '?' condition is false
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
   drivers/mtd/nand/spi/gigadevice.c:228:3: note: Taking false branch
                   if (ret)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/mtd/nand/spi/gigadevice.c:235:20: note: The left operand of '&' =
is a garbage value
                   return ((status2 & STATUS_ECC_MASK) >> 4) + 1;
                            ~~~~~~~ ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> mm/vmstat.c:1606:14: warning: The result of the left shift is undefined =
because the right operand is negative [clang-analyzer-core.UndefinedBinaryO=
peratorResult]
                                   pages /=3D HPAGE_PMD_NR;
                                            ^
   include/linux/huge_mm.h:105:24: note: expanded from macro 'HPAGE_PMD_NR'
   #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
                          ^ ~~~~~~~~~~~~~~~
   mm/vmstat.c:1600:2: note: Assuming the condition is false
           if (is_zone_first_populated(pgdat, zone)) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   mm/vmstat.c:1600:2: note: '?' condition is false
           if (is_zone_first_populated(pgdat, zone)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   mm/vmstat.c:1600:2: note: Assuming the condition is false
           if (is_zone_first_populated(pgdat, zone)) {
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
   mm/vmstat.c:1600:2: note: '?' condition is true
           if (is_zone_first_populated(pgdat, zone)) {
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
   mm/vmstat.c:1600:2: note: Taking true branch
           if (is_zone_first_populated(pgdat, zone)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   mm/vmstat.c:1602:3: note: Loop condition is true.  Entering loop body
                   for (i =3D 0; i < NR_VM_NODE_STAT_ITEMS; i++) {
                   ^
   mm/vmstat.c:1605:4: note: '?' condition is false
                           if (vmstat_item_print_in_thp(i))
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   mm/vmstat.c:1605:4: note: Assuming the condition is false
                           if (vmstat_item_print_in_thp(i))
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
   mm/vmstat.c:1605:4: note: '?' condition is true
                           if (vmstat_item_print_in_thp(i))
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
   mm/vmstat.c:1605:4: note: Taking true branch
                           if (vmstat_item_print_in_thp(i))
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   mm/vmstat.c:1606:14: note: '?' condition is true
                                   pages /=3D HPAGE_PMD_NR;
                                            ^
   include/linux/huge_mm.h:105:26: note: expanded from macro 'HPAGE_PMD_NR'
   #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
--
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/spi/spi-axi-spi-engine.c:268:2: note: Taking false branch
           if (xfer) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/spi/spi-axi-spi-engine.c:272:3: note: Null pointer value stored =
to field 'tx_buf'
                   spi_engine->tx_buf =3D NULL;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-axi-spi-engine.c:274:1: note: Returning without writing =
to 'spi_engine->tx_length', which participates in a condition later
   }
   ^
   drivers/spi/spi-axi-spi-engine.c:446:2: note: Returning from 'spi_engine=
_tx_next'
           spi_engine_tx_next(spi_engine);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-axi-spi-engine.c:447:6: note: Calling 'spi_engine_write_=
tx_fifo'
           if (spi_engine_write_tx_fifo(spi_engine))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/spi/spi-axi-spi-engine.c:320:9: note: Assuming 'n' is not equal =
to 0
           while (n && spi_engine->tx_length) {
                  ^
   drivers/spi/spi-axi-spi-engine.c:320:9: note: Left side of '&&' is true
   drivers/spi/spi-axi-spi-engine.c:320:2: note: Loop condition is true.  E=
ntering loop body
           while (n && spi_engine->tx_length) {
           ^
   drivers/spi/spi-axi-spi-engine.c:321:7: note: Assuming '__UNIQUE_ID___x2=
62' is >=3D '__UNIQUE_ID___y263'
                   m =3D min(n, spi_engine->tx_length);
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
   drivers/spi/spi-axi-spi-engine.c:321:7: note: '?' condition is false
                   m =3D min(n, spi_engine->tx_length);
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
   drivers/spi/spi-axi-spi-engine.c:322:3: note: Null pointer value stored =
to 'buf'
                   buf =3D spi_engine->tx_buf;
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-axi-spi-engine.c:323:15: note: 'i' is < 'm'
                   for (i =3D 0; i < m; i++)
                               ^
   drivers/spi/spi-axi-spi-engine.c:323:3: note: Loop condition is true.  E=
ntering loop body
                   for (i =3D 0; i < m; i++)
                   ^
   drivers/spi/spi-axi-spi-engine.c:324:19: note: Array access (from variab=
le 'buf') results in a null pointer dereference
                           writel_relaxed(buf[i], addr);
                                          ^
   arch/x86/include/asm/io.h:88:39: note: expanded from macro 'writel_relax=
ed'
   #define writel_relaxed(v, a) __writel(v, a)
                                         ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/usb/gadget/udc/bdc/bdc_udc.c:349:2: warning: Value stored to 'sr=
r_int' is never read [clang-analyzer-deadcode.DeadStores]
           srr_int =3D bdc_readl(bdc->regs, BDC_SRRINT(0));
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/bdc/bdc_udc.c:349:2: note: Value stored to 'srr_i=
nt' is never read
           srr_int =3D bdc_readl(bdc->regs, BDC_SRRINT(0));
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
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
                                 ^
   sound/soc/codecs/sti-sas.c:422:7: note: 'drvdata' is non-null
           if (!drvdata)
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
   sound/soc/codecs/sti-sas.c:422:7: note: 'drvdata' is non-null
           if (!drvdata)
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
   sound/soc/codecs/sti-sas.c:422:2: note: '?' condition is false
           if (!drvdata)
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
   sound/soc/codecs/sti-sas.c:422:2: note: Taking false branch
           if (!drvdata)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/soc/codecs/sti-sas.c:426:2: note: Null pointer value stored to 'of=
_id'
           of_id =3D of_match_node(sti_sas_dev_match, pnode);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/sti-sas.c:427:7: note: Access to field 'data' results i=
n a dereference of a null pointer (loaded from variable 'of_id')
           if (!of_id->data) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   net/sunrpc/auth_gss/gss_krb5_wrap.c:429:8: warning: Although the value s=
tored to 'plainhdr' is used in the enclosing expression, the value is never=
 actually read from 'plainhdr' [clang-analyzer-deadcode.DeadStores]
           ptr =3D plainhdr =3D buf->head[0].iov_base + offset;
                 ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_krb5_wrap.c:429:8: note: Although the value stor=
ed to 'plainhdr' is used in the enclosing expression, the value is never ac=
tually read from 'plainhdr'
           ptr =3D plainhdr =3D buf->head[0].iov_base + offset;
                 ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> net/sunrpc/auth_gss/gss_krb5_crypto.c:225:2: warning: Potential leak of =
memory pointed to by 'req' [clang-analyzer-unix.Malloc]
           crypto_free_ahash(tfm);
           ^
   net/sunrpc/auth_gss/gss_krb5_crypto.c:158:6: note: Assuming field 'len' =
is >=3D field 'cksumlength'
           if (cksumout->len < kctx->gk5e->cksumlength) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/sunrpc/auth_gss/gss_krb5_crypto.c:158:2: note: '?' condition is false
           if (cksumout->len < kctx->gk5e->cksumlength) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/sunrpc/auth_gss/gss_krb5_crypto.c:158:16: note: Field 'len' is >=3D =
field 'cksumlength'
           if (cksumout->len < kctx->gk5e->cksumlength) {
                         ^
   net/sunrpc/auth_gss/gss_krb5_crypto.c:158:2: note: '?' condition is false
           if (cksumout->len < kctx->gk5e->cksumlength) {
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
   net/sunrpc/auth_gss/gss_krb5_crypto.c:158:2: note: Taking false branch
           if (cksumout->len < kctx->gk5e->cksumlength) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/sunrpc/auth_gss/gss_krb5_crypto.c:165:6: note: Assuming 'checksumdat=
a' is not equal to null
           if (checksumdata =3D=3D NULL)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/sunrpc/auth_gss/gss_krb5_crypto.c:165:2: note: '?' condition is false
           if (checksumdata =3D=3D NULL)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/sunrpc/auth_gss/gss_krb5_crypto.c:165:6: note: 'checksumdata' is not=
 equal to null
           if (checksumdata =3D=3D NULL)
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
   net/sunrpc/auth_gss/gss_krb5_crypto.c:165:2: note: '?' condition is false
           if (checksumdata =3D=3D NULL)
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
   net/sunrpc/auth_gss/gss_krb5_crypto.c:165:2: note: Taking false branch
           if (checksumdata =3D=3D NULL)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/sunrpc/auth_gss/gss_krb5_crypto.c:169:2: note: '?' condition is false
           if (IS_ERR(tfm))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/sunrpc/auth_gss/gss_krb5_crypto.c:169:2: note: '?' condition is false
           if (IS_ERR(tfm))
--
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/sunrpc/auth_gss/auth_gss_internal.h:19:15: note: 'q' is <=3D 'end'
           if (unlikely(q > end || q < p))
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
   net/sunrpc/auth_gss/auth_gss_internal.h:19:15: note: Left side of '||' i=
s false
           if (unlikely(q > end || q < p))
                        ^
   net/sunrpc/auth_gss/auth_gss_internal.h:19:15: note: 'q' is <=3D 'end'
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
   net/sunrpc/auth_gss/auth_gss_internal.h:19:15: note: Left side of '||' i=
s false
           if (unlikely(q > end || q < p))
                        ^
   net/sunrpc/auth_gss/auth_gss_internal.h:19:2: note: '?' condition is fal=
se
           if (unlikely(q > end || q < p))
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
   net/sunrpc/auth_gss/auth_gss_internal.h:19:2: note: Taking false branch
           if (unlikely(q > end || q < p))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/sunrpc/auth_gss/auth_gss.c:714:6: note: Returning from 'simple_get_b=
ytes'
           p =3D simple_get_bytes(buf, end, &id, sizeof(id));
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:715:2: note: '?' condition is false
           if (IS_ERR(p)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/sunrpc/auth_gss/auth_gss.c:715:2: note: '?' condition is true
           if (IS_ERR(p)) {
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
   net/sunrpc/auth_gss/auth_gss.c:715:2: note: Taking true branch
           if (IS_ERR(p)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/sunrpc/auth_gss/auth_gss.c:717:3: note: Control jumps to line 775
                   goto err;
                   ^
   net/sunrpc/auth_gss/auth_gss.c:775:2: note: Memory is released
           kfree(buf);
           ^~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:777:2: note: Use of memory after it is fr=
eed
           return err;
           ^      ~~~
>> net/sunrpc/auth_gss/auth_gss.c:1006:2: warning: Potential leak of memory=
 pointed to by 'gss_auth' [clang-analyzer-unix.Malloc]
           if (!(gss_auth =3D kmalloc(sizeof(*gss_auth), GFP_KERNEL)))
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
   net/sunrpc/auth_gss/auth_gss.c:1004:2: note: '?' condition is false
           if (!try_module_get(THIS_MODULE))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/sunrpc/auth_gss/auth_gss.c:1004:2: note: '?' condition is false
           if (!try_module_get(THIS_MODULE))
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
   net/sunrpc/auth_gss/auth_gss.c:1004:2: note: Taking false branch
           if (!try_module_get(THIS_MODULE))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/sunrpc/auth_gss/auth_gss.c:1006:19: note: Memory is allocated
           if (!(gss_auth =3D kmalloc(sizeof(*gss_auth), GFP_KERNEL)))
                            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/sunrpc/auth_gss/auth_gss.c:1006:8: note: Assuming 'gss_auth' is non-=
null
           if (!(gss_auth =3D kmalloc(sizeof(*gss_auth), GFP_KERNEL)))
                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/sunrpc/auth_gss/auth_gss.c:1006:2: note: '?' condition is false
           if (!(gss_auth =3D kmalloc(sizeof(*gss_auth), GFP_KERNEL)))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/sunrpc/auth_gss/auth_gss.c:1006:8: note: Assuming 'gss_auth' is non-=
null
           if (!(gss_auth =3D kmalloc(sizeof(*gss_auth), GFP_KERNEL)))
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
   net/sunrpc/auth_gss/auth_gss.c:1006:2: note: '?' condition is false
           if (!(gss_auth =3D kmalloc(sizeof(*gss_auth), GFP_KERNEL)))
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
   net/sunrpc/auth_gss/auth_gss.c:1006:2: note: Potential leak of memory po=
inted to by 'gss_auth'
           if (!(gss_auth =3D kmalloc(sizeof(*gss_auth), GFP_KERNEL)))
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
>> net/sunrpc/auth_gss/auth_gss.c:1354:2: warning: Potential leak of memory=
 pointed to by 'cred' [clang-analyzer-unix.Malloc]
           if (!(cred =3D kzalloc(sizeof(*cred), gfp)))
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
   net/sunrpc/auth_gss/auth_gss.c:1350:30: note: Left side of '&&' is false
           struct gss_auth *gss_auth =3D container_of(auth, struct gss_auth=
, rpc_auth);
                                       ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   net/sunrpc/auth_gss/auth_gss.c:1350:30: note: '?' condition is true
           struct gss_auth *gss_auth =3D container_of(auth, struct gss_auth=
, rpc_auth);
                                       ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:324:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:304:3: note: expanded from macro '__compi=
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
   net/sunrpc/auth_gss/auth_gss.c:1350:30: note: Left side of '&&' is false
           struct gss_auth *gss_auth =3D container_of(auth, struct gss_auth=
, rpc_auth);
                                       ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   net/sunrpc/auth_gss/auth_gss.c:1350:30: note: Taking false branch
           struct gss_auth *gss_auth =3D container_of(auth, struct gss_auth=
, rpc_auth);
                                       ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:324:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:312:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/sunrpc/auth_gss/auth_gss.c:1350:30: note: Loop condition is false.  =
Exiting loop
           struct gss_auth *gss_auth =3D container_of(auth, struct gss_auth=
, rpc_auth);
                                       ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:324:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:312:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/sunrpc/auth_gss/auth_gss.c:1354:15: note: Calling 'kzalloc'
           if (!(cred =3D kzalloc(sizeof(*cred), gfp)))
                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   include/linux/slab.h:721:9: note: Memory is allocated
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1354:15: note: Returned allocated memory
           if (!(cred =3D kzalloc(sizeof(*cred), gfp)))
                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'

vim +/ret +935 security/keys/encrypted-keys/encrypted.c

7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  891  =

7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  892  /*
d3ec10aa95819b security/keys/encrypted-keys/encrypted.c Waiman Long   2020-=
03-21  893   * encrypted_read - format and copy out the encrypted data
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  894   *
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  895   * The resulting datablob format is:
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  896   * <master-key name> <decrypted data length> <encrypted iv> <en=
crypted data>
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  897   *
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  898   * On success, return to userspace the encrypted key datablob s=
ize.
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  899   */
d3ec10aa95819b security/keys/encrypted-keys/encrypted.c Waiman Long   2020-=
03-21  900  static long encrypted_read(const struct key *key, char *buffer,
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  901  			   size_t buflen)
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  902  {
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  903  	struct encrypted_key_payload *epayload;
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  904  	struct key *mkey;
146aa8b1453bd8 security/keys/encrypted-keys/encrypted.c David Howells 2015-=
10-21  905  	const u8 *master_key;
3b1826cebe1d53 security/keys/encrypted_defined.c        Mimi Zohar    2010-=
12-13  906  	size_t master_keylen;
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  907  	char derived_key[HASH_SIZE];
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  908  	char *ascii_buf;
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  909  	size_t asciiblob_len;
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  910  	int ret;
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  911  =

0837e49ab3fa8d security/keys/encrypted-keys/encrypted.c David Howells 2017-=
03-01  912  	epayload =3D dereference_key_locked(key);
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  913  =

7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  914  	/* returns the hex encoded iv, encrypted-data, and hmac as asc=
ii */
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  915  	asciiblob_len =3D epayload->datablob_len + ivsize + 1
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  916  	    + roundup(epayload->decrypted_datalen, blksize)
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  917  	    + (HASH_SIZE * 2);
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  918  =

7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  919  	if (!buffer || buflen < asciiblob_len)
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  920  		return asciiblob_len;
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  921  =

7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  922  	mkey =3D request_master_key(epayload, &master_key, &master_key=
len);
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  923  	if (IS_ERR(mkey))
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  924  		return PTR_ERR(mkey);
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  925  =

7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  926  	ret =3D get_derived_key(derived_key, ENC_KEY, master_key, mast=
er_keylen);
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  927  	if (ret < 0)
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  928  		goto out;
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  929  =

7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  930  	ret =3D derived_key_encrypt(epayload, derived_key, sizeof deri=
ved_key);
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  931  	if (ret < 0)
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  932  		goto out;
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  933  =

7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  934  	ret =3D datablob_hmac_append(epayload, master_key, master_keyl=
en);
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23 @935  	if (ret < 0)
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  936  		goto out;
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  937  =

7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  938  	ascii_buf =3D datablob_format(epayload, asciiblob_len);
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  939  	if (!ascii_buf) {
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  940  		ret =3D -ENOMEM;
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  941  		goto out;
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  942  	}
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  943  =

7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  944  	up_read(&mkey->sem);
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  945  	key_put(mkey);
a9dd74b252e04b security/keys/encrypted-keys/encrypted.c Eric Biggers  2017-=
06-08  946  	memzero_explicit(derived_key, sizeof(derived_key));
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  947  =

d3ec10aa95819b security/keys/encrypted-keys/encrypted.c Waiman Long   2020-=
03-21  948  	memcpy(buffer, ascii_buf, asciiblob_len);
453431a54934d9 security/keys/encrypted-keys/encrypted.c Waiman Long   2020-=
08-06  949  	kfree_sensitive(ascii_buf);
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  950  =

7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  951  	return asciiblob_len;
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  952  out:
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  953  	up_read(&mkey->sem);
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  954  	key_put(mkey);
a9dd74b252e04b security/keys/encrypted-keys/encrypted.c Eric Biggers  2017-=
06-08  955  	memzero_explicit(derived_key, sizeof(derived_key));
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  956  	return ret;
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  957  }
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-=
11-23  958  =


:::::: The code at line 935 was first introduced by commit
:::::: 7e70cb4978507cf31d76b90e4cfb4c28cad87f0c keys: add new key-type encr=
ypted

:::::: TO: Mimi Zohar <zohar@linux.vnet.ibm.com>
:::::: CC: James Morris <jmorris@namei.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4281132719474119865==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4281132719474119865==--

