Content-Type: multipart/mixed; boundary="===============3906271688220964163=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-maple 19/44] lib/maple_tree.c:324:2: warning: Value stored to 'node' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 25 Apr 2022 08:49:41 +0800
Message-ID: <202204250811.BQSVLyZ9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3906271688220964163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
CC: David Howells <dhowells@redhat.com>
CC: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-=
maple
head:   931e50676c6598d0eda1954ead465519ff91874d
commit: 6c45be03ed6456efda93c06956d586eecae0e51a [19/44] Maple Tree: add ne=
w data structure
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
425/202204250811.BQSVLyZ9-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/6c45be03ed6456e=
fda93c06956d586eecae0e51a
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/netfs-maple
        git checkout 6c45be03ed6456efda93c06956d586eecae0e51a
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                    ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:300:10: warning: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depreca=
tedOrUnsafeBufferHandling]
                   return sprintf(buf, "%s\n", ps_attr->text_values[value.i=
ntval]);
                          ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:300:10: note: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11
                   return sprintf(buf, "%s\n", ps_attr->text_values[value.i=
ntval]);
                          ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:309:9: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "%s\n", value.strval);
                         ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:309:9: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "%s\n", value.strval);
                         ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:312:9: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "%d\n", value.intval);
                         ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:312:9: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "%d\n", value.intval);
                         ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:416:4: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(power_supply_attrs[i].attr_name, "_err_%=
d", i);
                           ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:416:4: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                           sprintf(power_supply_attrs[i].attr_name, "_err_%=
d", i);
                           ^~~~~~~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/tty/pty.c:405:3: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&tty->termios_locked, 0, sizeof(tty->termios_lock=
ed));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/tty/pty.c:405:3: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                   memset(&tty->termios_locked, 0, sizeof(tty->termios_lock=
ed));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/tty/pty.c:407:3: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&o_tty->termios_locked, 0, sizeof(tty->termios_lo=
cked));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/tty/pty.c:407:3: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                   memset(&o_tty->termios_locked, 0, sizeof(tty->termios_lo=
cked));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   drivers/tty/tty_audit.c:240:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf->data + buf->valid, data, run);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/tty/tty_audit.c:240:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf->data + buf->valid, data, run);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   71 warnings generated.
   lib/kobject_uevent.c:296:2: warning: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandl=
ing]
           sprintf(scratch, "%s@%s", action_string, devpath);
           ^~~~~~~
   lib/kobject_uevent.c:296:2: note: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11
           sprintf(scratch, "%s@%s", action_string, devpath);
           ^~~~~~~
   lib/kobject_uevent.c:435:4: warning: Call to function 'memmove' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memmove(env->envp[i], env->envp[i + 1],
                           ^~~~~~~
   lib/kobject_uevent.c:435:4: note: Call to function 'memmove' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memmove_s' in case of C11
                           memmove(env->envp[i], env->envp[i + 1],
                           ^~~~~~~
   lib/kobject_uevent.c:665:8: warning: Call to function 'vsnprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D vsnprintf(&env->buf[env->buflen],
                 ^~~~~~~~~
   lib/kobject_uevent.c:665:8: note: Call to function 'vsnprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'vsnprintf_s' in case of C11
           len =3D vsnprintf(&env->buf[env->buflen],
                 ^~~~~~~~~
   lib/kobject_uevent.c:691:8: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D snprintf(buf, sizeof(buf), "SEQNUM=3D%llu", ++uevent_seq=
num);
                 ^~~~~~~~
   lib/kobject_uevent.c:691:8: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
           ret =3D snprintf(buf, sizeof(buf), "SEQNUM=3D%llu", ++uevent_seq=
num);
                 ^~~~~~~~
   Suppressed 67 warnings (67 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   87 warnings generated.
>> lib/maple_tree.c:324:2: warning: Value stored to 'node' is never read [c=
lang-analyzer-deadcode.DeadStores]
           node =3D (void *)((unsigned long)node & ~MAPLE_ENODE_NULL);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:324:2: note: Value stored to 'node' is never read
           node =3D (void *)((unsigned long)node & ~MAPLE_ENODE_NULL);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:329:2: warning: Value stored to 'node' is never read [c=
lang-analyzer-deadcode.DeadStores]
           node =3D (void *)((unsigned long)node | MAPLE_ENODE_NULL);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:329:2: note: Value stored to 'node' is never read
           node =3D (void *)((unsigned long)node | MAPLE_ENODE_NULL);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:1172:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(reuse, 0, sizeof(*reuse));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:1172:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(reuse, 0, sizeof(*reuse));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
>> lib/maple_tree.c:1204:23: warning: Value stored to 'nodep' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           struct maple_alloc **nodep =3D &mas->alloc;
                                ^~~~~   ~~~~~~~~~~~
   lib/maple_tree.c:1204:23: note: Value stored to 'nodep' during its initi=
alization is never read
           struct maple_alloc **nodep =3D &mas->alloc;
                                ^~~~~   ~~~~~~~~~~~
>> lib/maple_tree.c:1688:3: warning: Dereference of null pointer [clang-ana=
lyzer-core.NullDereference]
                   rcu_assign_pointer(slots[offset], mas->node);
                   ^
   include/linux/rcupdate.h:455:3: note: expanded from macro 'rcu_assign_po=
inter'
                   smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p_=
_v)); \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/asm-generic/barrier.h:190:2: note: expanded from macro 'smp_stor=
e_release'
           WRITE_ONCE(*p, v);                                              \
           ^~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   lib/maple_tree.c:1668:2: note: 'slots' initialized to a null pointer val=
ue
           void __rcu **slots =3D NULL;
           ^~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:1670:2: note: '?' condition is false
           if (ma_is_root(mn)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   lib/maple_tree.c:1670:2: note: Assuming the condition is true
           if (ma_is_root(mn)) {
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
   lib/maple_tree.c:1670:2: note: '?' condition is true
           if (ma_is_root(mn)) {
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
   lib/maple_tree.c:1670:2: note: Taking true branch
           if (ma_is_root(mn)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   lib/maple_tree.c:1679:6: note: Assuming 'advanced' is true
           if (!advanced && !mte_is_leaf(mas->node))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   lib/maple_tree.c:1679:16: note: Left side of '&&' is false
           if (!advanced && !mte_is_leaf(mas->node))
                         ^
   lib/maple_tree.c:1679:2: note: '?' condition is false
           if (!advanced && !mte_is_leaf(mas->node))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   lib/maple_tree.c:1679:7: note: 'advanced' is true
           if (!advanced && !mte_is_leaf(mas->node))
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
   lib/maple_tree.c:1679:16: note: Left side of '&&' is false
           if (!advanced && !mte_is_leaf(mas->node))
                         ^
   lib/maple_tree.c:1679:2: note: '?' condition is false
           if (!advanced && !mte_is_leaf(mas->node))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
--
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:332:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   lib/maple_tree.c:1688:3: note: Loop condition is false.  Exiting loop
                   rcu_assign_pointer(slots[offset], mas->node);
                   ^
   include/linux/rcupdate.h:455:3: note: expanded from macro 'rcu_assign_po=
inter'
                   smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p_=
_v)); \
                   ^
   include/asm-generic/barrier.h:190:2: note: expanded from macro 'smp_stor=
e_release'
           WRITE_ONCE(*p, v);                                              \
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:324:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   lib/maple_tree.c:1688:3: note: Dereference of null pointer
                   rcu_assign_pointer(slots[offset], mas->node);
                   ^
   include/linux/rcupdate.h:455:3: note: expanded from macro 'rcu_assign_po=
inter'
                   smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p_=
_v)); \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/asm-generic/barrier.h:190:2: note: expanded from macro 'smp_stor=
e_release'
           WRITE_ONCE(*p, v);                                              \
           ^~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   lib/maple_tree.c:1741:2: warning: Call to function 'memmove' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(b_node->pivot + shift, b_node->pivot, size);
           ^~~~~~~
   lib/maple_tree.c:1741:2: note: Call to function 'memmove' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memmove_s' in case of C11
           memmove(b_node->pivot + shift, b_node->pivot, size);
           ^~~~~~~
   lib/maple_tree.c:1742:2: warning: Call to function 'memmove' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(b_node->slot + shift, b_node->slot, size);
           ^~~~~~~
   lib/maple_tree.c:1742:2: note: Call to function 'memmove' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memmove_s' in case of C11
           memmove(b_node->slot + shift, b_node->slot, size);
           ^~~~~~~
   lib/maple_tree.c:1744:3: warning: Call to function 'memmove' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(b_node->gap + shift, b_node->gap, size);
                   ^~~~~~~
   lib/maple_tree.c:1744:3: note: Call to function 'memmove' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memmove_s' in case of C11
                   memmove(b_node->gap + shift, b_node->gap, size);
                   ^~~~~~~
   lib/maple_tree.c:1912:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(b_node->slot + mab_start, slots + mas_start, sizeof(void =
*) * j);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:1912:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(b_node->slot + mab_start, slots + mas_start, sizeof(void =
*) * j);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:1915:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(b_node->gap + mab_start, gaps + mas_start,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:1915:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(b_node->gap + mab_start, gaps + mas_start,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:1978:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(slots, b_node->slot + mab_start,
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:1978:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(slots, b_node->slot + mab_start,
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
>> lib/maple_tree.c:2800:2: warning: Value stored to 'last' is never read [=
clang-analyzer-deadcode.DeadStores]
           last =3D next =3D mas->node;
           ^      ~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2800:2: note: Value stored to 'last' is never read
           last =3D next =3D mas->node;
           ^      ~~~~~~~~~~~~~~~~
>> lib/maple_tree.c:2801:2: warning: Value stored to 'prev_min' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           prev_min =3D min =3D mas->min;
           ^          ~~~~~~~~~~~~~~
   lib/maple_tree.c:2801:2: note: Value stored to 'prev_min' is never read
           prev_min =3D min =3D mas->min;
           ^          ~~~~~~~~~~~~~~
   lib/maple_tree.c:2926:3: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(mast->bn, 0, sizeof(struct maple_big_node));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:2926:3: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                   memset(mast->bn, 0, sizeof(struct maple_big_node));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:3103:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(slots, l_slots + split + 1, sizeof(void *) * tmp);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:3103:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(slots, l_slots + split + 1, sizeof(void *) * tmp);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:3104:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pivs, l_pivs + split + 1, sizeof(unsigned long) * tmp);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:3104:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(pivs, l_pivs + split + 1, sizeof(unsigned long) * tmp);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:3106:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(slots + tmp, ma_slots(node, mt), sizeof(void *) * end);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:3106:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(slots + tmp, ma_slots(node, mt), sizeof(void *) * end);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:3107:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pivs + tmp, ma_pivots(node, mt), sizeof(unsigned long) * =
end);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:3107:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(pivs + tmp, ma_pivots(node, mt), sizeof(unsigned long) * =
end);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:3119:4: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(pivs + tmp, 0,
                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:3119:4: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                           memset(pivs + tmp, 0,
                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:3123:4: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(slots + tmp, 0, sizeof(void *) * (max_s -=
 tmp));
                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:3123:4: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                           memset(slots + tmp, 0, sizeof(void *) * (max_s -=
 tmp));
                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:3125:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(node, newnode, sizeof(struct maple_node));
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:3125:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(node, newnode, sizeof(struct maple_node));
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
--
                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:3924:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&b_node, 0, sizeof(struct maple_big_node));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:3924:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&b_node, 0, sizeof(struct maple_big_node));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:4004:3: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&reuse, 0, sizeof(struct maple_node));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:4004:3: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                   memset(&reuse, 0, sizeof(struct maple_node));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:4012:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst_pivots, wr_mas->pivots, sizeof(unsigned long) * (offs=
et + 1));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:4012:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(dst_pivots, wr_mas->pivots, sizeof(unsigned long) * (offs=
et + 1));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:4013:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst_slots, wr_mas->slots, sizeof(void *) * (offset + 1));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:4013:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(dst_slots, wr_mas->slots, sizeof(void *) * (offset + 1));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:4035:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst_slots + dst_offset, wr_mas->slots + wr_mas->offset_en=
d,
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:4035:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(dst_slots + dst_offset, wr_mas->slots + wr_mas->offset_en=
d,
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:4040:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst_pivots + dst_offset, wr_mas->pivots + wr_mas-=
>offset_end,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:4040:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(dst_pivots + dst_offset, wr_mas->pivots + wr_mas-=
>offset_end,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:4053:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(wr_mas->node, newnode, sizeof(struct maple_node));
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:4053:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(wr_mas->node, newnode, sizeof(struct maple_node));
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:4240:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&b_node, 0, sizeof(struct maple_big_node));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:4240:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&b_node, 0, sizeof(struct maple_big_node));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
>> lib/maple_tree.c:4882:5: warning: Value stored to 'count' is never read =
[clang-analyzer-deadcode.DeadStores]
                                   count =3D mt_slots[type];
                                   ^       ~~~~~~~~~~~~~~
   lib/maple_tree.c:4882:5: note: Value stored to 'count' is never read
                                   count =3D mt_slots[type];
                                   ^       ~~~~~~~~~~~~~~
   Suppressed 47 warnings (44 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   mm/shuffle.c:17:9: warning: Call to function 'sprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buffer, "%c\n", shuffle_param ? 'Y' : 'N');
                  ^~~~~~~
   mm/shuffle.c:17:9: note: Call to function 'sprintf' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'sprintf_s' in case of C11
           return sprintf(buffer, "%c\n", shuffle_param ? 'Y' : 'N');
                  ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   mm/memblock.c:342:2: warning: Call to function 'memmove' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memmove_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(&type->regions[r], &type->regions[r + 1],
           ^~~~~~~
   mm/memblock.c:342:2: note: Call to function 'memmove' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memmove_s' in case of C11
           memmove(&type->regions[r], &type->regions[r + 1],
           ^~~~~~~
   mm/memblock.c:470:2: warning: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           memcpy(new_array, type->regions, old_size);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   mm/memblock.c:470:2: note: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11
           memcpy(new_array, type->regions, old_size);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   mm/memblock.c:471:2: warning: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           memset(new_array + type->max, 0, old_size);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   mm/memblock.c:471:2: note: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11
           memset(new_array + type->max, 0, old_size);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   mm/memblock.c:522:3: warning: Call to function 'memmove' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memmove_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(next, next + 1, (type->cnt - (i + 2)) * sizeof(*=
next));
                   ^~~~~~~
   mm/memblock.c:522:3: note: Call to function 'memmove' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memmove_s' in case of C11
                   memmove(next, next + 1, (type->cnt - (i + 2)) * sizeof(*=
next));
                   ^~~~~~~
   mm/memblock.c:548:2: warning: Call to function 'memmove' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memmove_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(rgn + 1, rgn, (type->cnt - idx) * sizeof(*rgn));
           ^~~~~~~
   mm/memblock.c:548:2: note: Call to function 'memmove' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memmove_s' in case of C11
           memmove(rgn + 1, rgn, (type->cnt - idx) * sizeof(*rgn));
           ^~~~~~~
   mm/memblock.c:1191:36: warning: The result of the '<<' expression is und=
efined [clang-analyzer-core.UndefinedBinaryOperatorResult]
                                   *idx =3D (u32)idx_a | (u64)idx_b << 32;
                                                       ~~~~~~~~~~~^~~~~
   mm/memblock.c:1129:16: note: Assuming the condition is false
           if (WARN_ONCE(nid =3D=3D MAX_NUMNODES, "Usage of MAX_NUMNODES is=
 deprecated. Use NUMA_NO_NODE instead\n"))
                         ^
   include/asm-generic/bug.h:150:18: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
                           ^
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   bool __ret_do_once =3D !!(condition);                   =
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
   mm/memblock.c:1129:6: note: '__ret_do_once' is false
           if (WARN_ONCE(nid =3D=3D MAX_NUMNODES, "Usage of MAX_NUMNODES is=
 deprecated. Use NUMA_NO_NODE instead\n"))
               ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'

vim +/node +324 lib/maple_tree.c

6c45be03ed6456e Liam R. Howlett 2022-04-13  321  =

6c45be03ed6456e Liam R. Howlett 2022-04-13  322  static inline void mte_set=
_full(const struct maple_enode *node)
6c45be03ed6456e Liam R. Howlett 2022-04-13  323  {
6c45be03ed6456e Liam R. Howlett 2022-04-13 @324  	node =3D (void *)((unsign=
ed long)node & ~MAPLE_ENODE_NULL);
6c45be03ed6456e Liam R. Howlett 2022-04-13  325  }
6c45be03ed6456e Liam R. Howlett 2022-04-13  326  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3906271688220964163==--

