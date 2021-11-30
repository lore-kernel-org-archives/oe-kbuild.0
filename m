Content-Type: multipart/mixed; boundary="===============6235524389912170584=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC][PATCH v6 1/5] trace: Add trace any kernel object
Date: Wed, 01 Dec 2021 03:50:09 +0800
Message-ID: <202112010332.H8xSohUr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6235524389912170584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211129164951.220511-2-xiehuan09@gmail.com>
References: <20211129164951.220511-2-xiehuan09@gmail.com>
TO: Jeff Xie <xiehuan09@gmail.com>

Hi Jeff,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on rostedt-trace/for-next]
[also build test WARNING on linux/master linus/master v5.16-rc3 next-202111=
30]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jeff-Xie/trace-Introduce-o=
bjtrace-trigger-to-trace-the-kernel-object/20211130-041958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace=
.git for-next
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: x86_64-randconfig-c007-20211128 (https://download.01.org/0day-ci/ar=
chive/20211201/202112010332.H8xSohUr-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7f=
a01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/88ea43d691b0980bf49b4e579=
c39303cf3c9cd72
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jeff-Xie/trace-Introduce-objtrace-=
trigger-to-trace-the-kernel-object/20211130-041958
        git checkout 88ea43d691b0980bf49b4e579c39303cf3c9cd72
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (function !=3D ACPI_READ && function !=3D ACPI_WRITE)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/ec.c:1283:6: note: Left side of '&&' is true
   drivers/acpi/ec.c:1283:31: note: Assuming 'function' is equal to ACPI_WR=
ITE
           if (function !=3D ACPI_READ && function !=3D ACPI_WRITE)
                                        ^~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/ec.c:1283:2: note: Taking false branch
           if (function !=3D ACPI_READ && function !=3D ACPI_WRITE)
           ^
   drivers/acpi/ec.c:1286:6: note: Assuming field 'busy_polling' is true
           if (ec->busy_polling || bits > 8)
               ^~~~~~~~~~~~~~~~
   drivers/acpi/ec.c:1286:23: note: Left side of '||' is true
           if (ec->busy_polling || bits > 8)
                                ^
   drivers/acpi/ec.c:1289:14: note: Assuming 'i' is < 'bytes'
           for (i =3D 0; i < bytes; ++i, ++address, ++value)
                       ^~~~~~~~~
   drivers/acpi/ec.c:1289:2: note: Loop condition is true.  Entering loop b=
ody
           for (i =3D 0; i < bytes; ++i, ++address, ++value)
           ^
   drivers/acpi/ec.c:1290:13: note: 'function' is not equal to ACPI_READ
                   result =3D (function =3D=3D ACPI_READ) ?
                             ^~~~~~~~
   drivers/acpi/ec.c:1290:12: note: '?' condition is false
                   result =3D (function =3D=3D ACPI_READ) ?
                            ^
   drivers/acpi/ec.c:1292:4: note: Calling 'acpi_ec_write'
                           acpi_ec_write(ec, address, *value);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/ec.c:872:9: note: Calling 'acpi_ec_transaction'
           return acpi_ec_transaction(ec, &t);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/ec.c:807:2: note: 'glk' declared without an initial value
           u32 glk;
           ^~~~~~~
   drivers/acpi/ec.c:809:7: note: 'ec' is non-null
           if (!ec || (!t) || (t->wlen && !t->wdata) || (t->rlen && !t->rda=
ta))
                ^~
   drivers/acpi/ec.c:809:6: note: Left side of '||' is false
           if (!ec || (!t) || (t->wlen && !t->wdata) || (t->rlen && !t->rda=
ta))
               ^
   drivers/acpi/ec.c:809:15: note: 't' is non-null
           if (!ec || (!t) || (t->wlen && !t->wdata) || (t->rlen && !t->rda=
ta))
                        ^
   drivers/acpi/ec.c:809:6: note: Left side of '||' is false
           if (!ec || (!t) || (t->wlen && !t->wdata) || (t->rlen && !t->rda=
ta))
               ^
   drivers/acpi/ec.c:809:25: note: Field 'wlen' is 2
           if (!ec || (!t) || (t->wlen && !t->wdata) || (t->rlen && !t->rda=
ta))
                                  ^
   drivers/acpi/ec.c:809:22: note: Left side of '&&' is true
           if (!ec || (!t) || (t->wlen && !t->wdata) || (t->rlen && !t->rda=
ta))
                               ^
   drivers/acpi/ec.c:809:37: note: Field 'wdata' is non-null
           if (!ec || (!t) || (t->wlen && !t->wdata) || (t->rlen && !t->rda=
ta))
                                              ^
   drivers/acpi/ec.c:809:6: note: Left side of '||' is false
           if (!ec || (!t) || (t->wlen && !t->wdata) || (t->rlen && !t->rda=
ta))
               ^
   drivers/acpi/ec.c:809:51: note: Field 'rlen' is 0
           if (!ec || (!t) || (t->wlen && !t->wdata) || (t->rlen && !t->rda=
ta))
                                                            ^
   drivers/acpi/ec.c:809:56: note: Left side of '&&' is false
           if (!ec || (!t) || (t->wlen && !t->wdata) || (t->rlen && !t->rda=
ta))
                                                                 ^
   drivers/acpi/ec.c:811:9: note: Field 'rdata' is null
           if (t->rdata)
                  ^
   drivers/acpi/ec.c:811:2: note: Taking false branch
           if (t->rdata)
           ^
   drivers/acpi/ec.c:815:6: note: Assuming field 'global_lock' is false
           if (ec->global_lock) {
               ^~~~~~~~~~~~~~~
   drivers/acpi/ec.c:815:2: note: Taking false branch
           if (ec->global_lock) {
           ^
   drivers/acpi/ec.c:825:6: note: Assuming field 'global_lock' is true
           if (ec->global_lock)
               ^~~~~~~~~~~~~~~
   drivers/acpi/ec.c:825:2: note: Taking true branch
           if (ec->global_lock)
           ^
   drivers/acpi/ec.c:826:3: note: 1st function call argument is an uninitia=
lized value
                   acpi_release_global_lock(glk);
                   ^                        ~~~
   drivers/acpi/ec.c:1576:2: warning: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_name(device), ACPI_EC_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/ec.c:1576:2: note: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119
           strcpy(acpi_device_name(device), ACPI_EC_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/ec.c:1577:2: warning: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_class(device), ACPI_EC_CLASS);
           ^~~~~~
   drivers/acpi/ec.c:1577:2: note: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119
           strcpy(acpi_device_class(device), ACPI_EC_CLASS);
           ^~~~~~
   3 warnings generated.
>> kernel/trace/trace_object.c:99:2: warning: Use of memory after it is fre=
ed [clang-analyzer-unix.Malloc]
           list_for_each_entry_rcu(inst, head, active_list)
           ^
   include/linux/rculist.h:393:9: note: expanded from macro 'list_for_each_=
entry_rcu'
                   pos =3D list_entry_rcu(pos->member.next, typeof(*pos), m=
ember))
                         ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   kernel/trace/trace_object.c:298:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:310:15: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   kernel/trace/trace_object.c:298:2: note: Left side of '&&' is false
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:27: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   kernel/trace/trace_object.c:298:2: note: Taking false branch
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   kernel/trace/trace_object.c:298:2: note: Loop condition is false.  Exiti=
ng loop
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   kernel/trace/trace_object.c:300:2: note: Loop condition is false. Execut=
ion continues on line 307
           list_for_each_entry(test, &file->triggers, list) {
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   kernel/trace/trace_object.c:307:6: note: Assuming field 'init' is null
           if (data->ops->init) {
               ^~~~~~~~~~~~~~~
   kernel/trace/trace_object.c:307:2: note: Taking false branch
           if (data->ops->init) {
           ^
   kernel/trace/trace_object.c:317:6: note: Assuming the condition is false
           if (trace_event_trigger_enable_disable(file, 1) < 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_object.c:317:2: note: Taking false branch
           if (trace_event_trigger_enable_disable(file, 1) < 0) {
           ^
   kernel/trace/trace_object.c:322:2: note: Calling 'init_trace_object'
           init_trace_object();
           ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_object.c:495:6: note: Assuming the condition is false
           if (atomic_inc_return(&trace_object_ref) !=3D 1) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_object.c:495:2: note: Taking false branch
           if (atomic_inc_return(&trace_object_ref) !=3D 1) {
           ^
   kernel/trace/trace_object.c:500:8: note: Calling 'init_object_pool'
           ret =3D init_object_pool();
                 ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace_object.c:117:6: note: Assuming 'obj_pool' is non-null
           if (!obj_pool) {
               ^~~~~~~~~
   kernel/trace/trace_object.c:117:2: note: Taking false branch
           if (!obj_pool) {
           ^
   kernel/trace/trace_object.c:124:2: note: Loop condition is true.  Enteri=
ng loop body
           for (i =3D 0; i < max_obj_pool; i++) {
           ^
   kernel/trace/trace_object.c:126:7: note: Assuming 'inst' is null
                   if (!inst) {
                       ^~~~~
   kernel/trace/trace_object.c:126:3: note: Taking true branch
                   if (!inst) {
--
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/trace/trace_object.c:99:2: note: Left side of '||' is false
           list_for_each_entry_rcu(inst, head, active_list)
           ^
   include/linux/rculist.h:393:9: note: expanded from macro 'list_for_each_=
entry_rcu'
                   pos =3D list_entry_rcu(pos->member.next, typeof(*pos), m=
ember))
                         ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
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
   kernel/trace/trace_object.c:99:2: note: Left side of '||' is true
           list_for_each_entry_rcu(inst, head, active_list)
           ^
   include/linux/rculist.h:393:9: note: expanded from macro 'list_for_each_=
entry_rcu'
                   pos =3D list_entry_rcu(pos->member.next, typeof(*pos), m=
ember))
                         ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   kernel/trace/trace_object.c:99:2: note: Taking false branch
           list_for_each_entry_rcu(inst, head, active_list)
           ^
   include/linux/rculist.h:393:9: note: expanded from macro 'list_for_each_=
entry_rcu'
                   pos =3D list_entry_rcu(pos->member.next, typeof(*pos), m=
ember))
                         ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
                   ^
   kernel/trace/trace_object.c:99:2: note: Loop condition is false.  Exitin=
g loop
           list_for_each_entry_rcu(inst, head, active_list)
           ^
   include/linux/rculist.h:393:9: note: expanded from macro 'list_for_each_=
entry_rcu'
                   pos =3D list_entry_rcu(pos->member.next, typeof(*pos), m=
ember))
                         ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   kernel/trace/trace_object.c:99:2: note: Use of memory after it is freed
           list_for_each_entry_rcu(inst, head, active_list)
           ^
   include/linux/rculist.h:393:9: note: expanded from macro 'list_for_each_=
entry_rcu'
                   pos =3D list_entry_rcu(pos->member.next, typeof(*pos), m=
ember))
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
           ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   include/linux/container_of.h:18:26: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                   ^~~
>> kernel/trace/trace_object.c:533:2: warning: Undefined or garbage value r=
eturned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^
   kernel/trace/trace_object.c:334:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:310:15: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   kernel/trace/trace_object.c:334:2: note: Left side of '&&' is false
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:27: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   kernel/trace/trace_object.c:334:2: note: Taking false branch
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   kernel/trace/trace_object.c:334:2: note: Loop condition is false.  Exiti=
ng loop
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   kernel/trace/trace_object.c:336:2: note: Loop condition is true.  Enteri=
ng loop body
           list_for_each_entry(data, &file->triggers, list) {
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   kernel/trace/trace_object.c:337:7: note: Assuming 'data->cmd_ops->trigge=
r_type' is equal to 'test->cmd_ops->trigger_type'
                   if (data->cmd_ops->trigger_type =3D=3D test->cmd_ops->tr=
igger_type) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   kernel/trace/trace_object.c:337:3: note: Taking true branch
                   if (data->cmd_ops->trigger_type =3D=3D test->cmd_ops->tr=
igger_type) {
                   ^
   kernel/trace/trace_object.c:342:4: note:  Execution continues on line 346
                           break;
                           ^
   kernel/trace/trace_object.c:346:6: note: 'unregistered' is true
           if (unregistered && data->ops->free) {
               ^~~~~~~~~~~~
   kernel/trace/trace_object.c:346:6: note: Left side of '&&' is true
   kernel/trace/trace_object.c:346:22: note: Assuming field 'free' is non-n=
ull
           if (unregistered && data->ops->free) {
                               ^~~~~~~~~~~~~~~
   kernel/trace/trace_object.c:346:2: note: Taking true branch
           if (unregistered && data->ops->free) {
           ^
   kernel/trace/trace_object.c:348:3: note: Calling 'exit_trace_object'
                   exit_trace_object();
                   ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_object.c:516:2: note: 'ret' declared without an initi=
al value
           int ret;
           ^~~~~~~
   kernel/trace/trace_object.c:518:19: note: Assuming the condition is true
           if (WARN_ON_ONCE(atomic_read(&trace_object_ref) <=3D 0))
                            ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   kernel/trace/trace_object.c:518:6: note: Taking true branch
           if (WARN_ON_ONCE(atomic_read(&trace_object_ref) <=3D 0))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   kernel/trace/trace_object.c:518:6: note: Loop condition is false.  Exiti=
ng loop
           if (WARN_ON_ONCE(atomic_read(&trace_object_ref) <=3D 0))
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
   kernel/trace/trace_object.c:518:6: note: Loop condition is false.  Exiti=
ng loop

vim +99 kernel/trace/trace_object.c

88ea43d691b0980 Jeff Xie 2021-11-30   94  =

88ea43d691b0980 Jeff Xie 2021-11-30   95  static inline void free_active_li=
st_objects(struct list_head *head)
88ea43d691b0980 Jeff Xie 2021-11-30   96  {
88ea43d691b0980 Jeff Xie 2021-11-30   97  	struct object_instance *inst;
88ea43d691b0980 Jeff Xie 2021-11-30   98  =

88ea43d691b0980 Jeff Xie 2021-11-30  @99  	list_for_each_entry_rcu(inst, he=
ad, active_list)
88ea43d691b0980 Jeff Xie 2021-11-30  100  		kfree(inst);
88ea43d691b0980 Jeff Xie 2021-11-30  101  }
88ea43d691b0980 Jeff Xie 2021-11-30  102  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============6235524389912170584==--

