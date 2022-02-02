Content-Type: multipart/mixed; boundary="===============1150208386240378187=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/scsi_error.c:805:27: warning: Access to field 'host' results in a dereference of an undefined pointer value (loaded from field 'device') [clang-analyzer-core.NullDereference]
Date: Wed, 02 Feb 2022 08:47:11 +0800
Message-ID: <202202020852.MzuGCqT8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1150208386240378187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   26291c54e111ff6ba87a164d85d4a4e134b7315c
commit: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: swit=
ch to static_assert
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220121 (https://download.01.org/0day-ci/archi=
ve/20220202/202202020852.MzuGCqT8-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d4baf3=
b1322b84816aa623d8e8cb45a49cb68b84)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De1edc277e6f6dfb372216522dfc57f9381c39e35
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e1edc277e6f6dfb372216522dfc57f9381c39e35
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/mmc/host/davinci_mmc.c:627:6: note: 'mmc_freq' is <=3D 'mmc_req_=
freq'
           if (mmc_freq > mmc_req_freq)
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
   drivers/mmc/host/davinci_mmc.c:627:2: note: '?' condition is false
           if (mmc_freq > mmc_req_freq)
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
   drivers/mmc/host/davinci_mmc.c:627:2: note: Taking false branch
           if (mmc_freq > mmc_req_freq)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/mmc/host/davinci_mmc.c:630:2: note: '?' condition is false
           if (mmc_req_freq <=3D 400000)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/mmc/host/davinci_mmc.c:630:6: note: 'mmc_req_freq' is <=3D 400000
           if (mmc_req_freq <=3D 400000)
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
   drivers/mmc/host/davinci_mmc.c:630:2: note: '?' condition is true
           if (mmc_req_freq <=3D 400000)
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
   drivers/mmc/host/davinci_mmc.c:630:2: note: Taking true branch
           if (mmc_req_freq <=3D 400000)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/mmc/host/davinci_mmc.c:631:37: note: The result of the '/' expre=
ssion is undefined
                   host->ns_in_one_cycle =3D (1000000) / (((mmc_pclk
                                           ~~~~~~~~~~^~~~~~~~~~~~~
   drivers/mmc/host/davinci_mmc.c:873:3: warning: Value stored to 'status' =
is never read [clang-analyzer-deadcode.DeadStores]
                   status =3D readl(host->base + DAVINCI_MMCST0);
                   ^
   drivers/mmc/host/davinci_mmc.c:873:3: note: Value stored to 'status' is =
never read
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
>> drivers/scsi/scsi_error.c:805:27: warning: Access to field 'host' result=
s in a dereference of an undefined pointer value (loaded from field 'device=
') [clang-analyzer-core.NullDereference]
           struct Scsi_Host *host =3D scmd->device->host;
                                    ^
   drivers/scsi/scsi_error.c:2204:2: note: Loop condition is true.  Enterin=
g loop body
           while (true) {
           ^
   drivers/scsi/scsi_error.c:2211:3: note: Loop condition is false.  Exitin=
g loop
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:210:3: note: expanded from macro 'set_current_stat=
e'
                   debug_normal_state_change((state_value));               \
                   ^
   include/linux/sched.h:159:42: note: expanded from macro 'debug_normal_st=
ate_change'
   # define debug_normal_state_change(cond)        do { } while (0)
                                                   ^
   drivers/scsi/scsi_error.c:2211:3: note: Left side of '||' is false
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:211:3: note: expanded from macro 'set_current_stat=
e'
                   smp_store_mb(current->__state, (state_value));          \
                   ^
   include/asm-generic/barrier.h:148:40: note: expanded from macro 'smp_sto=
re_mb'
   #define smp_store_mb(var, value)  do { WRITE_ONCE(var, value); barrier()=
; } while (0)
                                          ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/scsi/scsi_error.c:2211:3: note: Left side of '||' is false
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:211:3: note: expanded from macro 'set_current_stat=
e'
                   smp_store_mb(current->__state, (state_value));          \
                   ^
   include/asm-generic/barrier.h:148:40: note: expanded from macro 'smp_sto=
re_mb'
   #define smp_store_mb(var, value)  do { WRITE_ONCE(var, value); barrier()=
; } while (0)
                                          ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/scsi/scsi_error.c:2211:3: note: Left side of '||' is true
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:211:3: note: expanded from macro 'set_current_stat=
e'
                   smp_store_mb(current->__state, (state_value));          \
                   ^
   include/asm-generic/barrier.h:148:40: note: expanded from macro 'smp_sto=
re_mb'
   #define smp_store_mb(var, value)  do { WRITE_ONCE(var, value); barrier()=
; } while (0)
                                          ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:303:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   drivers/scsi/scsi_error.c:2211:3: note: '?' condition is true
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:211:3: note: expanded from macro 'set_current_stat=
e'
                   smp_store_mb(current->__state, (state_value));          \
                   ^
   include/asm-generic/barrier.h:148:40: note: expanded from macro 'smp_sto=
re_mb'
   #define smp_store_mb(var, value)  do { WRITE_ONCE(var, value); barrier()=
; } while (0)
                                          ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:314:3: note: expanded from macro '__compi=
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
   drivers/scsi/scsi_error.c:2211:3: note: Left side of '||' is false
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:211:3: note: expanded from macro 'set_current_stat=
e'
                   smp_store_mb(current->__state, (state_value));          \
                   ^
   include/asm-generic/barrier.h:148:40: note: expanded from macro 'smp_sto=
re_mb'
   #define smp_store_mb(var, value)  do { WRITE_ONCE(var, value); barrier()=
; } while (0)
                                          ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
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
   drivers/scsi/scsi_error.c:2095:2: note: '?' condition is true
           if (!scsi_eh_stu(shost, work_q, done_q))
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
   drivers/scsi/scsi_error.c:2095:2: note: Taking true branch
           if (!scsi_eh_stu(shost, work_q, done_q))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/scsi_error.c:2096:7: note: Assuming the condition is false
                   if (!scsi_eh_bus_device_reset(shost, work_q, done_q))
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/scsi/scsi_error.c:2096:3: note: '?' condition is false
                   if (!scsi_eh_bus_device_reset(shost, work_q, done_q))
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/scsi_error.c:2096:7: note: Assuming the condition is true
                   if (!scsi_eh_bus_device_reset(shost, work_q, done_q))
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
   drivers/scsi/scsi_error.c:2096:3: note: '?' condition is true
                   if (!scsi_eh_bus_device_reset(shost, work_q, done_q))
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
   drivers/scsi/scsi_error.c:2096:3: note: Taking true branch
                   if (!scsi_eh_bus_device_reset(shost, work_q, done_q))
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/scsi_error.c:2097:9: note: Calling 'scsi_eh_target_reset'
                           if (!scsi_eh_target_reset(shost, work_q, done_q))
                                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/scsi/scsi_error.c:1563:9: note: Assuming the condition is false
           while (!list_empty(&tmp_list)) {
                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_error.c:1563:2: note: Loop condition is false. Executi=
on continues on line 1607
           while (!list_empty(&tmp_list)) {
           ^
   drivers/scsi/scsi_error.c:1607:9: note: Calling 'scsi_eh_test_devices'
           return scsi_eh_test_devices(&check_list, work_q, done_q, 0);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_error.c:1357:9: note: Assuming the condition is true
           while (!list_empty(cmd_list)) {
                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_error.c:1357:2: note: Loop condition is true.  Enterin=
g loop body
           while (!list_empty(cmd_list)) {
           ^
   drivers/scsi/scsi_error.c:1359:8: note: Assigned value is garbage or und=
efined
                   sdev =3D scmd->device;
                        ^ ~~~~~~~~~~~~
>> drivers/scsi/scsi_error.c:1576:4: warning: Address of stack memory assoc=
iated with local variable 'check_list' is still referred to by the stack va=
riable 'eh_work_q' upon returning to the caller.  This will be a dangling r=
eference [clang-analyzer-core.StackAddressEscape]
                           return list_empty(work_q);
                           ^
   drivers/scsi/scsi_error.c:2204:2: note: Loop condition is true.  Enterin=
g loop body
           while (true) {
           ^
   drivers/scsi/scsi_error.c:2211:3: note: Loop condition is false.  Exitin=
g loop
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:210:3: note: expanded from macro 'set_current_stat=
e'
                   debug_normal_state_change((state_value));               \
                   ^
   include/linux/sched.h:159:42: note: expanded from macro 'debug_normal_st=
ate_change'
   # define debug_normal_state_change(cond)        do { } while (0)
                                                   ^
   drivers/scsi/scsi_error.c:2211:3: note: Left side of '||' is false
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:211:3: note: expanded from macro 'set_current_stat=
e'
                   smp_store_mb(current->__state, (state_value));          \
                   ^
   include/asm-generic/barrier.h:148:40: note: expanded from macro 'smp_sto=
re_mb'
   #define smp_store_mb(var, value)  do { WRITE_ONCE(var, value); barrier()=
; } while (0)
                                          ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/scsi/scsi_error.c:2211:3: note: Left side of '||' is false
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:211:3: note: expanded from macro 'set_current_stat=
e'
                   smp_store_mb(current->__state, (state_value));          \
                   ^
   include/asm-generic/barrier.h:148:40: note: expanded from macro 'smp_sto=
re_mb'
   #define smp_store_mb(var, value)  do { WRITE_ONCE(var, value); barrier()=
; } while (0)
                                          ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/scsi/scsi_error.c:2211:3: note: Left side of '||' is true
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:211:3: note: expanded from macro 'set_current_stat=
e'
                   smp_store_mb(current->__state, (state_value));          \
                   ^
   include/asm-generic/barrier.h:148:40: note: expanded from macro 'smp_sto=
re_mb'
   #define smp_store_mb(var, value)  do { WRITE_ONCE(var, value); barrier()=
; } while (0)
                                          ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:303:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   drivers/scsi/scsi_error.c:2211:3: note: '?' condition is true
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:211:3: note: expanded from macro 'set_current_stat=
e'
                   smp_store_mb(current->__state, (state_value));          \
                   ^
   include/asm-generic/barrier.h:148:40: note: expanded from macro 'smp_sto=
re_mb'
   #define smp_store_mb(var, value)  do { WRITE_ONCE(var, value); barrier()=
; } while (0)
                                          ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:314:3: note: expanded from macro '__compi=
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
   drivers/scsi/scsi_error.c:2211:3: note: Left side of '||' is false
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:211:3: note: expanded from macro 'set_current_stat=
e'
                   smp_store_mb(current->__state, (state_value));          \
                   ^
   include/asm-generic/barrier.h:148:40: note: expanded from macro 'smp_sto=
re_mb'
   #define smp_store_mb(var, value)  do { WRITE_ONCE(var, value); barrier()=
; } while (0)
                                          ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
--
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/scsi/scsi_error.c:2095:2: note: Taking true branch
           if (!scsi_eh_stu(shost, work_q, done_q))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/scsi_error.c:2096:3: note: '?' condition is false
                   if (!scsi_eh_bus_device_reset(shost, work_q, done_q))
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/scsi_error.c:2096:3: note: '?' condition is true
                   if (!scsi_eh_bus_device_reset(shost, work_q, done_q))
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
   drivers/scsi/scsi_error.c:2096:3: note: Taking true branch
                   if (!scsi_eh_bus_device_reset(shost, work_q, done_q))
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/scsi_error.c:2097:9: note: Calling 'scsi_eh_target_reset'
                           if (!scsi_eh_target_reset(shost, work_q, done_q))
                                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/scsi/scsi_error.c:1563:2: note: Loop condition is true.  Enterin=
g loop body
           while (!list_empty(&tmp_list)) {
           ^
   drivers/scsi/scsi_error.c:1568:3: note: '?' condition is false
                   if (scsi_host_eh_past_deadline(shost)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/scsi_error.c:1568:3: note: Assuming the condition is false
                   if (scsi_host_eh_past_deadline(shost)) {
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
   drivers/scsi/scsi_error.c:1568:3: note: '?' condition is true
                   if (scsi_host_eh_past_deadline(shost)) {
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
   drivers/scsi/scsi_error.c:1568:3: note: Taking true branch
                   if (scsi_host_eh_past_deadline(shost)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/scsi_error.c:1572:4: note: Loop condition is false.  Exitin=
g loop
                           SCSI_LOG_ERROR_RECOVERY(3,
                           ^
   drivers/scsi/scsi_logging.h:65:9: note: expanded from macro 'SCSI_LOG_ER=
ROR_RECOVERY'
           SCSI_CHECK_LOGGING(SCSI_LOG_ERROR_SHIFT, SCSI_LOG_ERROR_BITS, LE=
VEL,CMD);
           ^
   drivers/scsi/scsi_logging.h:56:53: note: expanded from macro 'SCSI_CHECK=
_LOGGING'
   #define SCSI_CHECK_LOGGING(SHIFT, BITS, LEVEL, CMD) do { } while (0)
                                                       ^
   drivers/scsi/scsi_error.c:1576:4: note: Address of stack memory associat=
ed with local variable 'check_list' is still referred to by the stack varia=
ble 'eh_work_q' upon returning to the caller.  This will be a dangling refe=
rence
                           return list_empty(work_q);
                           ^
>> drivers/scsi/scsi_error.c:1576:4: warning: Address of stack memory assoc=
iated with local variable 'tmp_list' is still referred to by the stack vari=
able 'eh_work_q' upon returning to the caller.  This will be a dangling ref=
erence [clang-analyzer-core.StackAddressEscape]
                           return list_empty(work_q);
                           ^
   drivers/scsi/scsi_error.c:2204:2: note: Loop condition is true.  Enterin=
g loop body
           while (true) {
           ^
   drivers/scsi/scsi_error.c:2211:3: note: Loop condition is false.  Exitin=
g loop
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:210:3: note: expanded from macro 'set_current_stat=
e'
                   debug_normal_state_change((state_value));               \
                   ^
   include/linux/sched.h:159:42: note: expanded from macro 'debug_normal_st=
ate_change'
   # define debug_normal_state_change(cond)        do { } while (0)
                                                   ^
   drivers/scsi/scsi_error.c:2211:3: note: Left side of '||' is false
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:211:3: note: expanded from macro 'set_current_stat=
e'
                   smp_store_mb(current->__state, (state_value));          \
                   ^
   include/asm-generic/barrier.h:148:40: note: expanded from macro 'smp_sto=
re_mb'
   #define smp_store_mb(var, value)  do { WRITE_ONCE(var, value); barrier()=
; } while (0)
                                          ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/scsi/scsi_error.c:2211:3: note: Left side of '||' is false
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:211:3: note: expanded from macro 'set_current_stat=
e'
                   smp_store_mb(current->__state, (state_value));          \
                   ^
   include/asm-generic/barrier.h:148:40: note: expanded from macro 'smp_sto=
re_mb'
   #define smp_store_mb(var, value)  do { WRITE_ONCE(var, value); barrier()=
; } while (0)
                                          ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/scsi/scsi_error.c:2211:3: note: Left side of '||' is true
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:211:3: note: expanded from macro 'set_current_stat=
e'
                   smp_store_mb(current->__state, (state_value));          \
                   ^
   include/asm-generic/barrier.h:148:40: note: expanded from macro 'smp_sto=
re_mb'
   #define smp_store_mb(var, value)  do { WRITE_ONCE(var, value); barrier()=
; } while (0)
                                          ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:303:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   drivers/scsi/scsi_error.c:2211:3: note: '?' condition is true
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:211:3: note: expanded from macro 'set_current_stat=
e'
                   smp_store_mb(current->__state, (state_value));          \
                   ^
   include/asm-generic/barrier.h:148:40: note: expanded from macro 'smp_sto=
re_mb'
   #define smp_store_mb(var, value)  do { WRITE_ONCE(var, value); barrier()=
; } while (0)
                                          ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:314:3: note: expanded from macro '__compi=
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
   drivers/scsi/scsi_error.c:2211:3: note: Left side of '||' is false
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:211:3: note: expanded from macro 'set_current_stat=
e'
                   smp_store_mb(current->__state, (state_value));          \
                   ^
   include/asm-generic/barrier.h:148:40: note: expanded from macro 'smp_sto=
re_mb'
   #define smp_store_mb(var, value)  do { WRITE_ONCE(var, value); barrier()=
; } while (0)
                                          ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'

vim +805 drivers/scsi/scsi_error.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  796  =

292148f8bb2b5d Brian King         2007-01-30  797  /**
292148f8bb2b5d Brian King         2007-01-30  798   * scsi_try_host_reset -=
 ask host adapter to reset itself
c2b3ebd0d21a10 Geert Uytterhoeven 2013-05-17  799   * @scmd:	SCSI cmd to se=
nd host reset.
dc8875e1078961 Randy Dunlap       2007-11-15  800   */
b8e162f9e7e2da Bart Van Assche    2021-04-15  801  static enum scsi_disposi=
tion scsi_try_host_reset(struct scsi_cmnd *scmd)
292148f8bb2b5d Brian King         2007-01-30  802  {
292148f8bb2b5d Brian King         2007-01-30  803  	unsigned long flags;
b8e162f9e7e2da Bart Van Assche    2021-04-15  804  	enum scsi_disposition r=
tn;
0bf8c869701039 Jesper Juhl        2011-03-21 @805  	struct Scsi_Host *host =
=3D scmd->device->host;
0bf8c869701039 Jesper Juhl        2011-03-21  806  	struct scsi_host_templa=
te *hostt =3D host->hostt;
292148f8bb2b5d Brian King         2007-01-30  807  =

91921e016a2199 Hannes Reinecke    2014-06-25  808  	SCSI_LOG_ERROR_RECOVERY=
(3,
91921e016a2199 Hannes Reinecke    2014-06-25  809  		shost_printk(KERN_INFO=
, host, "Snd Host RST\n"));
292148f8bb2b5d Brian King         2007-01-30  810  =

0bf8c869701039 Jesper Juhl        2011-03-21  811  	if (!hostt->eh_host_res=
et_handler)
292148f8bb2b5d Brian King         2007-01-30  812  		return FAILED;
292148f8bb2b5d Brian King         2007-01-30  813  =

0bf8c869701039 Jesper Juhl        2011-03-21  814  	rtn =3D hostt->eh_host_=
reset_handler(scmd);
292148f8bb2b5d Brian King         2007-01-30  815  =

292148f8bb2b5d Brian King         2007-01-30  816  	if (rtn =3D=3D SUCCESS)=
 {
0bf8c869701039 Jesper Juhl        2011-03-21  817  		if (!hostt->skip_settl=
e_delay)
292148f8bb2b5d Brian King         2007-01-30  818  			ssleep(HOST_RESET_SET=
TLE_TIME);
0bf8c869701039 Jesper Juhl        2011-03-21  819  		spin_lock_irqsave(host=
->host_lock, flags);
0bf8c869701039 Jesper Juhl        2011-03-21  820  		scsi_report_bus_reset(=
host, scmd_channel(scmd));
0bf8c869701039 Jesper Juhl        2011-03-21  821  		spin_unlock_irqrestore=
(host->host_lock, flags);
292148f8bb2b5d Brian King         2007-01-30  822  	}
292148f8bb2b5d Brian King         2007-01-30  823  =

292148f8bb2b5d Brian King         2007-01-30  824  	return rtn;
292148f8bb2b5d Brian King         2007-01-30  825  }
292148f8bb2b5d Brian King         2007-01-30  826  =


:::::: The code at line 805 was first introduced by commit
:::::: 0bf8c869701039b12c3520cb1bb1689595ab108b Reduce sequential pointer d=
erefs in scsi_error.c and reduce size as well

:::::: TO: Jesper Juhl <jj@chaosbits.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1150208386240378187==--

