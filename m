Content-Type: multipart/mixed; boundary="===============5388201602764826300=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/of/irq.c:567:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Thu, 17 Mar 2022 04:08:39 +0800
Message-ID: <202203170319.8YVxWJ4d-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5388201602764826300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   56e337f2cf1326323844927a04e9dbce9a244835
commit: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: swit=
ch to static_assert
date:   4 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220308 (https://download.01.org/0day-ci/archi=
ve/20220317/202203170319.8YVxWJ4d-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
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
   include/linux/printk.h:370:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   drivers/of/irq.c:559:4: note: Taking true branch
                           pr_err("of_irq_init: children remain, but no par=
ents\n");
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
   include/linux/printk.h:370:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/of/irq.c:559:4: note: '?' condition is true
                           pr_err("of_irq_init: children remain, but no par=
ents\n");
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
   include/linux/printk.h:379:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   drivers/of/irq.c:559:4: note: '?' condition is true
                           pr_err("of_irq_init: children remain, but no par=
ents\n");
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
   drivers/of/irq.c:559:4: note: Loop condition is false.  Exiting loop
                           pr_err("of_irq_init: children remain, but no par=
ents\n");
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
   drivers/of/irq.c:560:4: note:  Execution continues on line 567
                           break;
                           ^
   drivers/of/irq.c:567:27: note: Null pointer value stored to 'desc'
           list_for_each_entry_safe(desc, temp_desc, &intc_parent_list, lis=
t) {
                                    ^
   include/linux/list.h:717:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/of/irq.c:567:2: note: Dereference of null pointer
           list_for_each_entry_safe(desc, temp_desc, &intc_parent_list, lis=
t) {
           ^
   include/linux/list.h:718:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:557:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
>> drivers/of/irq.c:567:2: warning: Use of memory after it is freed [clang-=
analyzer-unix.Malloc]
           list_for_each_entry_safe(desc, temp_desc, &intc_parent_list, lis=
t) {
           ^
   include/linux/list.h:718:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:557:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   drivers/of/irq.c:489:2: note: Loop condition is true.  Entering loop body
           for_each_matching_node_and_match(np, matches, &match) {
           ^
   include/linux/of.h:1297:2: note: expanded from macro 'for_each_matching_=
node_and_match'
           for (dn =3D of_find_matching_node_and_match(NULL, matches, match=
); \
           ^
   drivers/of/irq.c:490:58: note: Left side of '||' is true
                   if (!of_property_read_bool(np, "interrupt-controller") ||
                                                                          ^
   drivers/of/irq.c:490:3: note: '?' condition is false
                   if (!of_property_read_bool(np, "interrupt-controller") ||
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/of/irq.c:490:7: note: Left side of '||' is false
                   if (!of_property_read_bool(np, "interrupt-controller") ||
                       ^
   drivers/of/irq.c:491:5: note: Assuming the condition is false
                                   !of_device_is_available(np))
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
   drivers/of/irq.c:490:3: note: '?' condition is false
                   if (!of_property_read_bool(np, "interrupt-controller") ||
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
   drivers/of/irq.c:490:3: note: Taking false branch
                   if (!of_property_read_bool(np, "interrupt-controller") ||
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/of/irq.c:494:12: note: Assuming field 'data' is non-null
                   if (WARN(!match->data, "of_irq_init: no init function fo=
r %s\n",
                            ^
   include/asm-generic/bug.h:130:25: note: expanded from macro 'WARN'
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
   drivers/of/irq.c:494:7: note: '?' condition is false
                   if (WARN(!match->data, "of_irq_init: no init function fo=
r %s\n",
                       ^
   include/asm-generic/bug.h:131:2: note: expanded from macro 'WARN'
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
   drivers/of/irq.c:494:7: note: '?' condition is false
                   if (WARN(!match->data, "of_irq_init: no init function fo=
r %s\n",
                       ^
   include/asm-generic/bug.h:131:2: note: expanded from macro 'WARN'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
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
--
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/usb/host/bcma-hcd.c:134:4: warning: Value stored to 'tmp' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                           tmp =3D bcma_read32(dev, 0x524);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:134:4: note: Value stored to 'tmp' is never =
read
                           tmp =3D bcma_read32(dev, 0x524);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:138:4: warning: Value stored to 'tmp' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                           tmp =3D bcma_read32(dev, 0x524);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:138:4: note: Value stored to 'tmp' is never =
read
                           tmp =3D bcma_read32(dev, 0x524);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:142:4: warning: Value stored to 'tmp' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                           tmp =3D bcma_read32(dev, 0x524);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:142:4: note: Value stored to 'tmp' is never =
read
                           tmp =3D bcma_read32(dev, 0x524);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:146:4: warning: Value stored to 'tmp' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                           tmp =3D bcma_read32(dev, 0x524);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:146:4: note: Value stored to 'tmp' is never =
read
                           tmp =3D bcma_read32(dev, 0x524);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:154:4: warning: Value stored to 'tmp' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                           tmp =3D bcma_read32(dev, 0x314);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:154:4: note: Value stored to 'tmp' is never =
read
                           tmp =3D bcma_read32(dev, 0x314);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/usb/host/fotg210-hcd.c:735:2: warning: Value stored to 'next' is=
 never read [clang-analyzer-deadcode.DeadStores]
           next +=3D temp;
           ^       ~~~~
   drivers/usb/host/fotg210-hcd.c:735:2: note: Value stored to 'next' is ne=
ver read
           next +=3D temp;
           ^       ~~~~
>> drivers/usb/host/fotg210-hcd.c:2987:10: warning: Assigned value is garba=
ge or undefined [clang-analyzer-core.uninitialized.Assign]
                           token =3D qtd->hw_token;
                                 ^
   drivers/usb/host/fotg210-hcd.c:3835:2: note: Loop condition is false.  E=
xiting loop
           spin_lock_irqsave(&fotg210->lock, flags);
           ^
   include/linux/spinlock.h:392:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:277:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:214:3: note: expanded from macro 'local_irq_sav=
e'
                   raw_local_irq_save(flags);              \
                   ^
   include/linux/irqflags.h:169:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   drivers/usb/host/fotg210-hcd.c:3835:2: note: Assuming the condition is f=
alse
           spin_lock_irqsave(&fotg210->lock, flags);
           ^
   include/linux/spinlock.h:392:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:277:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/irqflags.h:215:7: note: expanded from macro 'local_irq_sav=
e'
                   if (!raw_irqs_disabled_flags(flags))    \
                   ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/usb/host/fotg210-hcd.c:3835:2: note: '?' condition is false
           spin_lock_irqsave(&fotg210->lock, flags);
           ^
   include/linux/spinlock.h:392:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:277:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/irqflags.h:215:3: note: expanded from macro 'local_irq_sav=
e'
                   if (!raw_irqs_disabled_flags(flags))    \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/usb/host/fotg210-hcd.c:3835:2: note: '?' condition is false
           spin_lock_irqsave(&fotg210->lock, flags);
           ^
   include/linux/spinlock.h:392:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:277:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/usb/host/fotg210-hcd.c:3835:2: note: Taking false branch
           spin_lock_irqsave(&fotg210->lock, flags);
           ^
   include/linux/spinlock.h:392:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:277:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)

vim +567 drivers/of/irq.c

c71a54b0820179e Rob Herring        2011-09-20  471  =

c71a54b0820179e Rob Herring        2011-09-20  472  /**
c71a54b0820179e Rob Herring        2011-09-20  473   * of_irq_init - Scan a=
nd init matching interrupt controllers in DT
c71a54b0820179e Rob Herring        2011-09-20  474   * @matches: 0 terminat=
ed array of nodes to match and init function to call
c71a54b0820179e Rob Herring        2011-09-20  475   *
c71a54b0820179e Rob Herring        2011-09-20  476   * This function scans =
the device tree for matching interrupt controller nodes,
c71a54b0820179e Rob Herring        2011-09-20  477   * and calls their init=
ialization functions in order with parents first.
c71a54b0820179e Rob Herring        2011-09-20  478   */
c71a54b0820179e Rob Herring        2011-09-20  479  void __init of_irq_init=
(const struct of_device_id *matches)
c71a54b0820179e Rob Herring        2011-09-20  480  {
264041e37961330 Masahiro Yamada    2015-11-24  481  	const struct of_device=
_id *match;
c71a54b0820179e Rob Herring        2011-09-20  482  	struct device_node *np=
, *parent =3D NULL;
48a9b733e644ab4 Geert Uytterhoeven 2015-06-26  483  	struct of_intc_desc *d=
esc, *temp_desc;
c71a54b0820179e Rob Herring        2011-09-20  484  	struct list_head intc_=
desc_list, intc_parent_list;
c71a54b0820179e Rob Herring        2011-09-20  485  =

c71a54b0820179e Rob Herring        2011-09-20  486  	INIT_LIST_HEAD(&intc_d=
esc_list);
c71a54b0820179e Rob Herring        2011-09-20  487  	INIT_LIST_HEAD(&intc_p=
arent_list);
c71a54b0820179e Rob Herring        2011-09-20  488  =

264041e37961330 Masahiro Yamada    2015-11-24  489  	for_each_matching_node=
_and_match(np, matches, &match) {
6a245d959c74707 Sergei Shtylyov    2017-07-08  490  		if (!of_property_read=
_bool(np, "interrupt-controller") ||
bf49be02d6f92b9 Peter Crosthwaite  2013-11-27  491  				!of_device_is_avail=
able(np))
c71a54b0820179e Rob Herring        2011-09-20  492  			continue;
264041e37961330 Masahiro Yamada    2015-11-24  493  =

264041e37961330 Masahiro Yamada    2015-11-24  494  		if (WARN(!match->data=
, "of_irq_init: no init function for %s\n",
264041e37961330 Masahiro Yamada    2015-11-24  495  			 match->compatible))
264041e37961330 Masahiro Yamada    2015-11-24  496  			continue;
264041e37961330 Masahiro Yamada    2015-11-24  497  =

c71a54b0820179e Rob Herring        2011-09-20  498  		/*
48a9b733e644ab4 Geert Uytterhoeven 2015-06-26  499  		 * Here, we allocate =
and populate an of_intc_desc with the node
c71a54b0820179e Rob Herring        2011-09-20  500  		 * pointer, interrupt=
-parent device_node etc.
c71a54b0820179e Rob Herring        2011-09-20  501  		 */
c71a54b0820179e Rob Herring        2011-09-20  502  		desc =3D kzalloc(size=
of(*desc), GFP_KERNEL);
6f7dc9a37f2b325 Geert Uytterhoeven 2019-05-02  503  		if (!desc) {
8363ccb917c6bd4 Julia Lawall       2015-10-22  504  			of_node_put(np);
c71a54b0820179e Rob Herring        2011-09-20  505  			goto err;
8363ccb917c6bd4 Julia Lawall       2015-10-22  506  		}
c71a54b0820179e Rob Herring        2011-09-20  507  =

264041e37961330 Masahiro Yamada    2015-11-24  508  		desc->irq_init_cb =3D=
 match->data;
8363ccb917c6bd4 Julia Lawall       2015-10-22  509  		desc->dev =3D of_node=
_get(np);
c71a54b0820179e Rob Herring        2011-09-20  510  		desc->interrupt_paren=
t =3D of_irq_find_parent(np);
d7fb6d0adb86ed1 Rob Herring        2011-11-27  511  		if (desc->interrupt_p=
arent =3D=3D np)
d7fb6d0adb86ed1 Rob Herring        2011-11-27  512  			desc->interrupt_pare=
nt =3D NULL;
c71a54b0820179e Rob Herring        2011-09-20  513  		list_add_tail(&desc->=
list, &intc_desc_list);
c71a54b0820179e Rob Herring        2011-09-20  514  	}
c71a54b0820179e Rob Herring        2011-09-20  515  =

c71a54b0820179e Rob Herring        2011-09-20  516  	/*
c71a54b0820179e Rob Herring        2011-09-20  517  	 * The root irq contro=
ller is the one without an interrupt-parent.
c71a54b0820179e Rob Herring        2011-09-20  518  	 * That one goes first=
, followed by the controllers that reference it,
c71a54b0820179e Rob Herring        2011-09-20  519  	 * followed by the one=
s that reference the 2nd level controllers, etc.
c71a54b0820179e Rob Herring        2011-09-20  520  	 */
c71a54b0820179e Rob Herring        2011-09-20  521  	while (!list_empty(&in=
tc_desc_list)) {
c71a54b0820179e Rob Herring        2011-09-20  522  		/*
c71a54b0820179e Rob Herring        2011-09-20  523  		 * Process all contro=
llers with the current 'parent'.
c71a54b0820179e Rob Herring        2011-09-20  524  		 * First pass will be=
 looking for NULL as the parent.
c71a54b0820179e Rob Herring        2011-09-20  525  		 * The assumption is =
that NULL parent means a root controller.
c71a54b0820179e Rob Herring        2011-09-20  526  		 */
c71a54b0820179e Rob Herring        2011-09-20  527  		list_for_each_entry_s=
afe(desc, temp_desc, &intc_desc_list, list) {
c71a54b0820179e Rob Herring        2011-09-20  528  			int ret;
c71a54b0820179e Rob Herring        2011-09-20  529  =

c71a54b0820179e Rob Herring        2011-09-20  530  			if (desc->interrupt_=
parent !=3D parent)
c71a54b0820179e Rob Herring        2011-09-20  531  				continue;
c71a54b0820179e Rob Herring        2011-09-20  532  =

c71a54b0820179e Rob Herring        2011-09-20  533  			list_del(&desc->list=
);
c71a54b0820179e Rob Herring        2011-09-20  534  =

e55aeb6ba4e8cc3 Philipp Zabel      2016-08-09  535  			of_node_set_flag(des=
c->dev, OF_POPULATED);
e55aeb6ba4e8cc3 Philipp Zabel      2016-08-09  536  =

0d638a07d3a1e98 Rob Herring        2017-06-01  537  			pr_debug("of_irq_ini=
t: init %pOF (%p), parent %p\n",
0d638a07d3a1e98 Rob Herring        2017-06-01  538  				 desc->dev,
c71a54b0820179e Rob Herring        2011-09-20  539  				 desc->dev, desc->i=
nterrupt_parent);
264041e37961330 Masahiro Yamada    2015-11-24  540  			ret =3D desc->irq_in=
it_cb(desc->dev,
264041e37961330 Masahiro Yamada    2015-11-24  541  						desc->interrupt_p=
arent);
c71a54b0820179e Rob Herring        2011-09-20  542  			if (ret) {
e55aeb6ba4e8cc3 Philipp Zabel      2016-08-09  543  				of_node_clear_flag(=
desc->dev, OF_POPULATED);
c71a54b0820179e Rob Herring        2011-09-20  544  				kfree(desc);
c71a54b0820179e Rob Herring        2011-09-20  545  				continue;
c71a54b0820179e Rob Herring        2011-09-20  546  			}
c71a54b0820179e Rob Herring        2011-09-20  547  =

c71a54b0820179e Rob Herring        2011-09-20  548  			/*
c71a54b0820179e Rob Herring        2011-09-20  549  			 * This one is now s=
et up; add it to the parent list so
c71a54b0820179e Rob Herring        2011-09-20  550  			 * its children can =
get processed in a subsequent pass.
c71a54b0820179e Rob Herring        2011-09-20  551  			 */
c71a54b0820179e Rob Herring        2011-09-20  552  			list_add_tail(&desc-=
>list, &intc_parent_list);
c71a54b0820179e Rob Herring        2011-09-20  553  		}
c71a54b0820179e Rob Herring        2011-09-20  554  =

c71a54b0820179e Rob Herring        2011-09-20  555  		/* Get the next pendi=
ng parent that might have children */
c0cdfaa0a5e7a34 Axel Lin           2013-06-23  556  		desc =3D list_first_e=
ntry_or_null(&intc_parent_list,
c0cdfaa0a5e7a34 Axel Lin           2013-06-23  557  						typeof(*desc), li=
st);
c0cdfaa0a5e7a34 Axel Lin           2013-06-23  558  		if (!desc) {
c71a54b0820179e Rob Herring        2011-09-20  559  			pr_err("of_irq_init:=
 children remain, but no parents\n");
c71a54b0820179e Rob Herring        2011-09-20  560  			break;
c71a54b0820179e Rob Herring        2011-09-20  561  		}
c71a54b0820179e Rob Herring        2011-09-20  562  		list_del(&desc->list);
c71a54b0820179e Rob Herring        2011-09-20  563  		parent =3D desc->dev;
c71a54b0820179e Rob Herring        2011-09-20  564  		kfree(desc);
c71a54b0820179e Rob Herring        2011-09-20  565  	}
c71a54b0820179e Rob Herring        2011-09-20  566  =

c71a54b0820179e Rob Herring        2011-09-20 @567  	list_for_each_entry_sa=
fe(desc, temp_desc, &intc_parent_list, list) {
c71a54b0820179e Rob Herring        2011-09-20  568  		list_del(&desc->list);
c71a54b0820179e Rob Herring        2011-09-20  569  		kfree(desc);
c71a54b0820179e Rob Herring        2011-09-20  570  	}
c71a54b0820179e Rob Herring        2011-09-20  571  err:
c71a54b0820179e Rob Herring        2011-09-20  572  	list_for_each_entry_sa=
fe(desc, temp_desc, &intc_desc_list, list) {
c71a54b0820179e Rob Herring        2011-09-20  573  		list_del(&desc->list);
8363ccb917c6bd4 Julia Lawall       2015-10-22  574  		of_node_put(desc->dev=
);
c71a54b0820179e Rob Herring        2011-09-20  575  		kfree(desc);
c71a54b0820179e Rob Herring        2011-09-20  576  	}
c71a54b0820179e Rob Herring        2011-09-20  577  }
c706c239af5bc29 Marc Zyngier       2015-07-28  578  =


:::::: The code at line 567 was first introduced by commit
:::::: c71a54b0820179e53483d5220cdef1a0df8d5bd1 of/irq: introduce of_irq_in=
it

:::::: TO: Rob Herring <rob.herring@calxeda.com>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5388201602764826300==--

