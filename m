Content-Type: multipart/mixed; boundary="===============2079827702085022247=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ogabbay:habanalabs-next 32/33] drivers/misc/habanalabs/common/irq.c:152:20: warning: Value stored to 'hdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 30 Jan 2022 19:35:41 +0800
Message-ID: <202201301958.rLUdGi6P-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2079827702085022247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: farah kassabri <fkassabri@habana.ai>
CC: Oded Gabbay <ogabbay@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git h=
abanalabs-next
head:   c720ae02be190b7639446bba872752a68cb4ba17
commit: 402f801a3488a90a5481524ea87c3da17867e635 [32/33] habanalabs: Timest=
amps buffers registration
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-c006-20220129 (https://download.01.org/0day-ci/arc=
hive/20220130/202201301958.rLUdGi6P-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45e=
e44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git=
/commit/?id=3D402f801a3488a90a5481524ea87c3da17867e635
        git remote add ogabbay https://git.kernel.org/pub/scm/linux/kernel/=
git/ogabbay/linux.git
        git fetch --no-tags ogabbay habanalabs-next
        git checkout 402f801a3488a90a5481524ea87c3da17867e635
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:104:48: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   drivers/hwmon/lm75.h:27:14: note: '?' condition is false
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                                  ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
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
   drivers/hwmon/lm75.h:27:14: note: '__UNIQUE_ID___x181' is < '__UNIQUE_ID=
___y182'
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
                            ^~~
   drivers/hwmon/lm75.h:27:14: note: '?' condition is true
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
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
   drivers/hwmon/lm75.h:29:12: note: 'ntemp' is < 0
           ntemp +=3D (ntemp < 0 ? -250 : 250);
                     ^~~~~
   drivers/hwmon/lm75.h:29:12: note: '?' condition is true
   drivers/hwmon/lm75.h:30:29: note: The result of the left shift is undefi=
ned because the left operand is negative
           return (u16)((ntemp / 500) << 7);
                        ~~~~~~~~~~~~~ ^
   Suppressed 3 warnings (3 in non-user code).
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
   5 warnings generated.
>> drivers/misc/habanalabs/common/irq.c:152:20: warning: Value stored to 'h=
dev' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct hl_device *hdev =3D job->hdev;
                             ^~~~   ~~~~~~~~~
   drivers/misc/habanalabs/common/irq.c:152:20: note: Value stored to 'hdev=
' during its initialization is never read
           struct hl_device *hdev =3D job->hdev;
                             ^~~~   ~~~~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/misc/habanalabs/common/command_submission.c:2488:21: warning: Ac=
cess to field 'timestamp' results in a dereference of a null pointer (loade=
d from variable 'fence') [clang-analyzer-core.NullDereference]
                                           (ktime_compare(fence->timestamp,=
 first_cs_time) < 0))
                                                          ^
   drivers/misc/habanalabs/common/command_submission.c:3284:6: note: Assumi=
ng the condition is false
           if (!hl_device_operational(hpriv->hdev, NULL))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:3284:2: note: Taking=
 false branch
           if (!hl_device_operational(hpriv->hdev, NULL))
           ^
   drivers/misc/habanalabs/common/command_submission.c:3287:6: note: Assumi=
ng the condition is false
           if (flags & HL_WAIT_CS_FLAGS_INTERRUPT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:3287:2: note: Taking=
 false branch
           if (flags & HL_WAIT_CS_FLAGS_INTERRUPT)
           ^
   drivers/misc/habanalabs/common/command_submission.c:3289:11: note: Assum=
ing the condition is true
           else if (flags & HL_WAIT_CS_FLAGS_MULTI_CS)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:3289:7: note: Taking=
 true branch
           else if (flags & HL_WAIT_CS_FLAGS_MULTI_CS)
                ^
   drivers/misc/habanalabs/common/command_submission.c:3290:8: note: Callin=
g 'hl_multi_cs_wait_ioctl'
                   rc =3D hl_multi_cs_wait_ioctl(hpriv, data);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2678:6: note: Assumi=
ng field 'supports_wait_for_multi_cs' is not equal to 0
           if (!hdev->supports_wait_for_multi_cs) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2678:2: note: Taking=
 false branch
           if (!hdev->supports_wait_for_multi_cs) {
           ^
   drivers/misc/habanalabs/common/command_submission.c:2685:6: note: Assumi=
ng 'seq_arr_len' is <=3D HL_WAIT_MULTI_CS_LIST_MAX_LEN
           if (seq_arr_len > HL_WAIT_MULTI_CS_LIST_MAX_LEN) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2685:2: note: Taking=
 false branch
           if (seq_arr_len > HL_WAIT_MULTI_CS_LIST_MAX_LEN) {
           ^
   drivers/misc/habanalabs/common/command_submission.c:2693:3: note: Callin=
g 'kmalloc_array'
                   kmalloc_array(seq_arr_len, sizeof(*cs_seq_arr), GFP_KERN=
EL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/slab.h:617:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/slab.h:619:30: note: Left side of '&&' is false
           if (__builtin_constant_p(n) && __builtin_constant_p(size))
                                       ^
   include/linux/slab.h:621:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2693:3: note: Return=
ing from 'kmalloc_array'
                   kmalloc_array(seq_arr_len, sizeof(*cs_seq_arr), GFP_KERN=
EL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/misc/habanalabs/common/command_submission.c:2694:6: note: Assumi=
ng 'cs_seq_arr' is non-null
           if (!cs_seq_arr)
               ^~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2694:2: note: Taking=
 false branch
           if (!cs_seq_arr)
           ^
   drivers/misc/habanalabs/common/command_submission.c:2700:6: note: Callin=
g 'copy_from_user'
           if (copy_from_user(cs_seq_arr, seq_arr, size_to_copy)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:13: note: Calling 'check_copy_size'
           if (likely(check_copy_size(to, n, false)))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/thread_info.h:221:15: note: Assuming 'sz' is >=3D 0
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:221:15: note: Left side of '&&' is true
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                        ^
   include/linux/thread_info.h:221:26: note: Assuming 'sz' is < 'bytes'
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                                   ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:221:2: note: Taking true branch
           if (unlikely(sz >=3D 0 && sz < bytes)) {
--
           ^~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2700:6: note: Return=
ing from 'copy_from_user'
           if (copy_from_user(cs_seq_arr, seq_arr, size_to_copy)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2700:6: note: Assumi=
ng the condition is false
           if (copy_from_user(cs_seq_arr, seq_arr, size_to_copy)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2700:2: note: Taking=
 false branch
           if (copy_from_user(cs_seq_arr, seq_arr, size_to_copy)) {
           ^
   drivers/misc/habanalabs/common/command_submission.c:2707:14: note: Calli=
ng 'kmalloc_array'
           fence_arr =3D kmalloc_array(seq_arr_len, sizeof(*fence_arr), GFP=
_KERNEL);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   include/linux/slab.h:617:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/slab.h:619:30: note: Left side of '&&' is false
           if (__builtin_constant_p(n) && __builtin_constant_p(size))
                                       ^
   include/linux/slab.h:621:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2707:14: note: Retur=
ning from 'kmalloc_array'
           fence_arr =3D kmalloc_array(seq_arr_len, sizeof(*fence_arr), GFP=
_KERNEL);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2708:6: note: Assumi=
ng 'fence_arr' is non-null
           if (!fence_arr) {
               ^~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2708:2: note: Taking=
 false branch
           if (!fence_arr) {
           ^
   drivers/misc/habanalabs/common/command_submission.c:2724:6: note: Callin=
g 'IS_ERR'
           if (IS_ERR(mcs_compl)) {
               ^~~~~~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2724:6: note: Return=
ing from 'IS_ERR'
           if (IS_ERR(mcs_compl)) {
               ^~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2724:2: note: Taking=
 false branch
           if (IS_ERR(mcs_compl)) {
           ^
   drivers/misc/habanalabs/common/command_submission.c:2731:7: note: Callin=
g 'hl_cs_poll_fences'
           rc =3D hl_cs_poll_fences(&mcs_data, mcs_compl);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2407:6: note: Assumi=
ng 'rc' is 0
           if (rc)
               ^~
   drivers/misc/habanalabs/common/command_submission.c:2407:2: note: Taking=
 false branch
           if (rc)
           ^
   drivers/misc/habanalabs/common/command_submission.c:2426:14: note: 'i' i=
s < 'arr_len'
           for (i =3D 0; i < arr_len; i++, fence_ptr++) {
                       ^
   drivers/misc/habanalabs/common/command_submission.c:2426:2: note: Loop c=
ondition is true.  Entering loop body
           for (i =3D 0; i < arr_len; i++, fence_ptr++) {
           ^
   drivers/misc/habanalabs/common/command_submission.c:2427:3: note: 'fence=
' initialized here
                   struct hl_fence *fence =3D *fence_ptr;
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2441:7: note: Assumi=
ng 'fence' is null
                   if (fence)
                       ^~~~~
   drivers/misc/habanalabs/common/command_submission.c:2441:3: note: Taking=
 false branch
                   if (fence)
                   ^
   drivers/misc/habanalabs/common/command_submission.c:2450:7: note: Assumi=
ng 'rc' is 0
                   if (rc) {
                       ^~
   drivers/misc/habanalabs/common/command_submission.c:2450:3: note: Taking=
 false branch
                   if (rc) {
                   ^
   drivers/misc/habanalabs/common/command_submission.c:2457:3: note: Contro=
l jumps to 'case CS_WAIT_STATUS_COMPLETED:' @line 2461
                   switch (status) {
                   ^
   drivers/misc/habanalabs/common/command_submission.c:2470:8: note: 'fence=
' is null
                           if (fence && !fence->mcs_handling_done) {
                               ^~~~~
   drivers/misc/habanalabs/common/command_submission.c:2470:14: note: Left =
side of '&&' is false
                           if (fence && !fence->mcs_handling_done) {
                                     ^
   drivers/misc/habanalabs/common/command_submission.c:2487:18: note: Field=
 'update_ts' is 1
                           if (mcs_data->update_ts &&
                                         ^
   drivers/misc/habanalabs/common/command_submission.c:2487:8: note: Left s=
ide of '&&' is true
                           if (mcs_data->update_ts &&
                               ^
   drivers/misc/habanalabs/common/command_submission.c:2488:21: note: Acces=
s to field 'timestamp' results in a dereference of a null pointer (loaded f=
rom variable 'fence')
                                           (ktime_compare(fence->timestamp,=
 first_cs_time) < 0))
                                                          ^~~~~
>> drivers/misc/habanalabs/common/command_submission.c:3267:6: warning: Bra=
nch condition evaluates to a garbage value [clang-analyzer-core.uninitializ=
ed.Branch]
           if (timestamp) {
               ^
   drivers/misc/habanalabs/common/command_submission.c:3284:6: note: Assumi=
ng the condition is false
           if (!hl_device_operational(hpriv->hdev, NULL))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:3284:2: note: Taking=
 false branch
           if (!hl_device_operational(hpriv->hdev, NULL))
           ^
   drivers/misc/habanalabs/common/command_submission.c:3287:6: note: Assumi=
ng the condition is true
           if (flags & HL_WAIT_CS_FLAGS_INTERRUPT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:3287:2: note: Taking=
 true branch
           if (flags & HL_WAIT_CS_FLAGS_INTERRUPT)
           ^
   drivers/misc/habanalabs/common/command_submission.c:3288:8: note: Callin=
g 'hl_interrupt_wait_ioctl'
                   rc =3D hl_interrupt_wait_ioctl(hpriv, data);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:3221:2: note: 'times=
tamp' declared without an initial value
           u64 timestamp;
           ^~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:3226:6: note: Assumi=
ng field 'user_interrupt_count' is not equal to 0
           if (!prop->user_interrupt_count) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:3226:2: note: Taking=
 false branch
           if (!prop->user_interrupt_count) {
           ^
   drivers/misc/habanalabs/common/command_submission.c:3231:17: note: Takin=
g false branch
           interrupt_id =3D FIELD_GET(HL_WAIT_CS_FLAGS_INTERRUPT_MASK, args=
->in.flags);
                          ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:62:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/misc/habanalabs/common/command_submission.c:3231:17: note: Loop =
condition is false.  Exiting loop
           interrupt_id =3D FIELD_GET(HL_WAIT_CS_FLAGS_INTERRUPT_MASK, args=
->in.flags);
                          ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:62:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/misc/habanalabs/common/command_submission.c:3231:17: note: -1048=
576 is not equal to 0
           interrupt_id =3D FIELD_GET(HL_WAIT_CS_FLAGS_INTERRUPT_MASK, args=
->in.flags);
                          ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:64:20: note: expanded from macro '__BF_FIELD_CH=
ECK'
                   BUILD_BUG_ON_MSG((_mask) =3D=3D 0, _pfx "mask is zero");=
    \
                   ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler_types.h:346:22: note: expanded from macro 'compil=
etime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   include/linux/compiler_types.h:334:23: note: expanded from macro '_compi=
letime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:326:9: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:3231:17: note: Takin=
g false branch
           interrupt_id =3D FIELD_GET(HL_WAIT_CS_FLAGS_INTERRUPT_MASK, args=
->in.flags);
                          ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:64:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG((_mask) =3D=3D 0, _pfx "mask is zero");=
    \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)

vim +/hdev +152 drivers/misc/habanalabs/common/irq.c

9494a8dd8d22cb drivers/misc/habanalabs/irq.c        Oded Gabbay    2019-02-=
16  139  =

402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  140  /*
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  141   * hl_ts_free_objects - handler of the free objects workqueue.
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  142   * This function should put refcount to objects that the registrat=
ion node
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  143   * took refcount to them.
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  144   * @work: workqueue object pointer
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  145   */
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  146  static void hl_ts_free_objects(struct work_struct *work)
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  147  {
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  148  	struct timestamp_reg_work_obj *job =3D
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  149  			container_of(work, struct timestamp_reg_work_obj, free_obj);
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  150  	struct timestamp_reg_free_node *free_obj, *temp_free_obj;
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  151  	struct list_head *free_list_head =3D job->free_obj_head;
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23 @152  	struct hl_device *hdev =3D job->hdev;
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  153  =

402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  154  	list_for_each_entry_safe(free_obj, temp_free_obj, free_list_head,=
 free_objects_node) {
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  155  		dev_dbg(hdev->dev, "About to put refcount to ts_buff (%p) cq_cb(=
%p)\n",
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  156  					free_obj->ts_buff,
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  157  					free_obj->cq_cb);
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  158  =

402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  159  		hl_ts_put(free_obj->ts_buff);
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  160  		hl_cb_put(free_obj->cq_cb);
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  161  		kfree(free_obj);
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  162  	}
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  163  =

402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  164  	kfree(free_list_head);
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  165  	kfree(job);
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  166  }
402f801a3488a9 drivers/misc/habanalabs/common/irq.c farah kassabri 2021-12-=
23  167  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2079827702085022247==--

