Content-Type: multipart/mixed; boundary="===============1560945777528836969=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/cpufreq/cpufreq-dt.c:49:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sat, 11 Dec 2021 16:27:33 +0800
Message-ID: <202112111641.ipuKVlB9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1560945777528836969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6f513529296fd4f696afb4354c46508abe646541
commit: a52f8a59aef46b59753e583bf4b28fccb069ce64 fortify: Explicitly disabl=
e Clang support
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-c001-20211210 (https://download.01.org/0day-ci/arch=
ive/20211211/202112111641.ipuKVlB9-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
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
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/hwmon-sysfs.h:51:2: note: expanded from macro 'to_sensor_d=
ev_attr_2'
           container_of(_dev_attr, struct sensor_device_attribute_2, dev_at=
tr)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
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
   drivers/hwmon/f71882fg.c:1794:2: note: Assuming the condition is true
           if (data->pwm_enable & (1 << (2 * nr)))
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/hwmon/f71882fg.c:1794:2: note: '?' condition is false
           if (data->pwm_enable & (1 << (2 * nr)))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/hwmon/f71882fg.c:1794:2: note: '?' condition is false
           if (data->pwm_enable & (1 << (2 * nr)))
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
   drivers/hwmon/f71882fg.c:1794:2: note: Taking false branch
           if (data->pwm_enable & (1 << (2 * nr)))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/hwmon/f71882fg.c:1800:6: note: Calling 'fan_from_reg'
                           / fan_from_reg(data->fan_full_speed[nr]);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/f71882fg.c:1147:9: note: Assuming 'reg' is 0
           return reg ? (1500000 / reg) : 0;
                  ^~~
   drivers/hwmon/f71882fg.c:1147:9: note: '?' condition is false
   drivers/hwmon/f71882fg.c:1147:2: note: Returning zero
           return reg ? (1500000 / reg) : 0;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/f71882fg.c:1800:6: note: Returning from 'fan_from_reg'
                           / fan_from_reg(data->fan_full_speed[nr]);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/f71882fg.c:1800:4: note: Division by zero
                           / fan_from_reg(data->fan_full_speed[nr]);
   ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
>> drivers/cpufreq/cpufreq-dt.c:49:2: warning: Dereference of null pointer =
[clang-analyzer-core.NullDereference]
           list_for_each_entry(priv, &priv_list, node) {
           ^
   include/linux/list.h:630:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
                      ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:494:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/cpufreq/cpufreq-dt.c:200:2: note: Assuming the condition is true
           if (cpufreq_dt_find_data(cpu))
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/cpufreq/cpufreq-dt.c:200:2: note: '?' condition is false
           if (cpufreq_dt_find_data(cpu))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/cpufreq/cpufreq-dt.c:200:6: note: Calling 'cpufreq_dt_find_data'
           if (cpufreq_dt_find_data(cpu))
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
   drivers/cpufreq/cpufreq-dt.c:49:2: note: Left side of '&&' is false
           list_for_each_entry(priv, &priv_list, node) {
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
   drivers/cpufreq/cpufreq-dt.c:49:2: note: '?' condition is true
           list_for_each_entry(priv, &priv_list, node) {
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
   drivers/cpufreq/cpufreq-dt.c:49:2: note: Left side of '&&' is false
           list_for_each_entry(priv, &priv_list, node) {
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
   drivers/cpufreq/cpufreq-dt.c:49:2: note: Taking false branch
           list_for_each_entry(priv, &priv_list, node) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
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
   drivers/crypto/qat/qat_common/qat_uclo.c:264:7: note: 'init_header' is n=
ull
           if (!init_header) {
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
   drivers/crypto/qat/qat_common/qat_uclo.c:264:2: note: '?' condition is t=
rue
           if (!init_header) {
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
   drivers/crypto/qat/qat_common/qat_uclo.c:264:2: note: Taking true branch
           if (!init_header) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/crypto/qat/qat_common/qat_uclo.c:265:17: note: Calling 'kzalloc'
                   init_header =3D kzalloc(sizeof(*init_header), GFP_KERNEL=
);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Uninitialized value stored to field 'n=
ext', which participates in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Uninitialized value stored to field 'n=
ext'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/qat/qat_common/qat_uclo.c:265:17: note: Returning from 'k=
zalloc'
                   init_header =3D kzalloc(sizeof(*init_header), GFP_KERNEL=
);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/qat/qat_common/qat_uclo.c:266:7: note: Assuming 'init_hea=
der' is non-null
                   if (!init_header)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/crypto/qat/qat_common/qat_uclo.c:266:3: note: '?' condition is f=
alse
                   if (!init_header)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/crypto/qat/qat_common/qat_uclo.c:266:8: note: 'init_header' is n=
on-null
                   if (!init_header)
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
   drivers/crypto/qat/qat_common/qat_uclo.c:266:3: note: '?' condition is f=
alse
                   if (!init_header)
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
   drivers/crypto/qat/qat_common/qat_uclo.c:266:3: note: Taking false branch
                   if (!init_header)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/crypto/qat/qat_common/qat_uclo.c:273:9: note: Branch condition e=
valuates to a garbage value
           while (tail_old->next)
                  ^~~~~~~~~~~~~~
>> drivers/crypto/qat/qat_common/qat_uclo.c:1690:11: warning: Assigned valu=
e is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           sobj_hdr =3D (struct icp_qat_mof_obj_hdr *)mobj_handle->sobjs_hd=
r;
                    ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1798:6: note: Assuming 'file_id=
' is not equal to 50882
           if (file_id =3D=3D ICP_QAT_UOF_FID || file_id =3D=3D ICP_QAT_SUO=
F_FID) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/crypto/qat/qat_common/qat_uclo.c:1798:6: note: Left side of '||'=
 is false
           if (file_id =3D=3D ICP_QAT_UOF_FID || file_id =3D=3D ICP_QAT_SUO=
F_FID) {
               ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1798:36: note: Assuming 'file_i=
d' is not equal to 1398099782
           if (file_id =3D=3D ICP_QAT_UOF_FID || file_id =3D=3D ICP_QAT_SUO=
F_FID) {
                                             ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/crypto/qat/qat_common/qat_uclo.c:1798:2: note: '?' condition is =
false
           if (file_id =3D=3D ICP_QAT_UOF_FID || file_id =3D=3D ICP_QAT_SUO=
F_FID) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1798:6: note: 'file_id' is not =
equal to 50882
           if (file_id =3D=3D ICP_QAT_UOF_FID || file_id =3D=3D ICP_QAT_SUO=
F_FID) {
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
   drivers/crypto/qat/qat_common/qat_uclo.c:1798:6: note: Left side of '||'=
 is false
           if (file_id =3D=3D ICP_QAT_UOF_FID || file_id =3D=3D ICP_QAT_SUO=
F_FID) {
               ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1798:36: note: 'file_id' is not=
 equal to 1398099782
           if (file_id =3D=3D ICP_QAT_UOF_FID || file_id =3D=3D ICP_QAT_SUO=
F_FID) {
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
   drivers/crypto/qat/qat_common/qat_uclo.c:1798:2: note: '?' condition is =
false
           if (file_id =3D=3D ICP_QAT_UOF_FID || file_id =3D=3D ICP_QAT_SUO=
F_FID) {
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
   drivers/crypto/qat/qat_common/qat_uclo.c:1798:2: note: Taking false bran=
ch
           if (file_id =3D=3D ICP_QAT_UOF_FID || file_id =3D=3D ICP_QAT_SUO=
F_FID) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1805:2: note: Assuming the cond=
ition is false
           if (qat_uclo_check_mof_format(mof_ptr))
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/crypto/qat/qat_common/qat_uclo.c:1805:2: note: '?' condition is =
false
           if (qat_uclo_check_mof_format(mof_ptr))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1805:2: note: Assuming the cond=
ition is true
           if (qat_uclo_check_mof_format(mof_ptr))
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1754:2: note: '?' condition is =
true
           if (!strncmp(chunk_id, ICP_QAT_MOF_SYM_OBJS, ICP_QAT_MOF_OBJ_ID_=
LEN))
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
   drivers/crypto/qat/qat_common/qat_uclo.c:1754:2: note: Taking true branch
           if (!strncmp(chunk_id, ICP_QAT_MOF_SYM_OBJS, ICP_QAT_MOF_OBJ_ID_=
LEN))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1755:3: note: Calling 'qat_uclo=
_map_mof_symobjs'
                   qat_uclo_map_mof_symobjs(mobj_handle, mof_chunkhdr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/qat/qat_common/qat_uclo.c:1747:1: note: Returning without=
 writing to 'mobj_handle->sobjs_hdr'
   }
   ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1755:3: note: Returning from 'q=
at_uclo_map_mof_symobjs'
                   qat_uclo_map_mof_symobjs(mobj_handle, mof_chunkhdr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/qat/qat_common/qat_uclo.c:1762:1: note: Returning without=
 writing to 'mobj_handle->sobjs_hdr'
   }
   ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1822:3: note: Returning from 'q=
at_uclo_map_mof_chunk'
                   qat_uclo_map_mof_chunk(mobj_handle, &mof_chunkhdr[i]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/qat/qat_common/qat_uclo.c:1821:14: note: Assuming 'i' is =
>=3D 'chunks_num'
           for (i =3D 0; i < chunks_num; i++)
                       ^~~~~~~~~~~~~~
   drivers/crypto/qat/qat_common/qat_uclo.c:1821:2: note: Loop condition is=
 false. Execution continues on line 1825
           for (i =3D 0; i < chunks_num; i++)
           ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1825:20: note: Field 'sym_str' =
is non-null
           if (!mobj_handle->sym_str ||
                             ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1825:6: note: Left side of '||'=
 is false
           if (!mobj_handle->sym_str ||
               ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1826:21: note: Field 'uobjs_hdr=
' is non-null
               (!mobj_handle->uobjs_hdr && !mobj_handle->sobjs_hdr))
                              ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1826:31: note: Left side of '&&=
' is false
               (!mobj_handle->uobjs_hdr && !mobj_handle->sobjs_hdr))
                                        ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1825:2: note: '?' condition is =
false
           if (!mobj_handle->sym_str ||
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1825:20: note: Field 'sym_str' =
is non-null
           if (!mobj_handle->sym_str ||
                             ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1825:6: note: Left side of '||'=
 is false
           if (!mobj_handle->sym_str ||
               ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1826:21: note: Field 'uobjs_hdr=
' is non-null
               (!mobj_handle->uobjs_hdr && !mobj_handle->sobjs_hdr))
                              ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1826:31: note: Left side of '&&=
' is false
               (!mobj_handle->uobjs_hdr && !mobj_handle->sobjs_hdr))
                                        ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1825:2: note: '?' condition is =
false
           if (!mobj_handle->sym_str ||
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
   drivers/crypto/qat/qat_common/qat_uclo.c:1825:2: note: Taking false bran=
ch
           if (!mobj_handle->sym_str ||
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1829:8: note: Calling 'qat_uclo=
_map_objs_from_mof'
           ret =3D qat_uclo_map_objs_from_mof(mobj_handle);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/qat/qat_common/qat_uclo.c:1690:11: note: Assigned value i=
s garbage or undefined
           sobj_hdr =3D (struct icp_qat_mof_obj_hdr *)mobj_handle->sobjs_hd=
r;
                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/crypto/qat/qat_common/qat_uclo.c:1711:8: warning: Array subscrip=
t is undefined [clang-analyzer-core.uninitialized.ArraySubscript]
                                                   &mobj_hdr[*valid_chunk],
                                                    ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1798:6: note: Assuming 'file_id=
' is not equal to 50882
           if (file_id =3D=3D ICP_QAT_UOF_FID || file_id =3D=3D ICP_QAT_SUO=
F_FID) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/crypto/qat/qat_common/qat_uclo.c:1798:6: note: Left side of '||'=
 is false
           if (file_id =3D=3D ICP_QAT_UOF_FID || file_id =3D=3D ICP_QAT_SUO=
F_FID) {
               ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1798:36: note: Assuming 'file_i=
d' is not equal to 1398099782
           if (file_id =3D=3D ICP_QAT_UOF_FID || file_id =3D=3D ICP_QAT_SUO=
F_FID) {
                                             ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/crypto/qat/qat_common/qat_uclo.c:1798:2: note: '?' condition is =
false
           if (file_id =3D=3D ICP_QAT_UOF_FID || file_id =3D=3D ICP_QAT_SUO=
F_FID) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1798:6: note: 'file_id' is not =
equal to 50882
           if (file_id =3D=3D ICP_QAT_UOF_FID || file_id =3D=3D ICP_QAT_SUO=
F_FID) {
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
   drivers/crypto/qat/qat_common/qat_uclo.c:1798:6: note: Left side of '||'=
 is false
           if (file_id =3D=3D ICP_QAT_UOF_FID || file_id =3D=3D ICP_QAT_SUO=
F_FID) {
               ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1798:36: note: 'file_id' is not=
 equal to 1398099782
           if (file_id =3D=3D ICP_QAT_UOF_FID || file_id =3D=3D ICP_QAT_SUO=
F_FID) {
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
   drivers/crypto/qat/qat_common/qat_uclo.c:1798:2: note: '?' condition is =
false
           if (file_id =3D=3D ICP_QAT_UOF_FID || file_id =3D=3D ICP_QAT_SUO=
F_FID) {
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
   drivers/crypto/qat/qat_common/qat_uclo.c:1798:2: note: Taking false bran=
ch
           if (file_id =3D=3D ICP_QAT_UOF_FID || file_id =3D=3D ICP_QAT_SUO=
F_FID) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1805:2: note: Assuming the cond=
ition is false
           if (qat_uclo_check_mof_format(mof_ptr))
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/crypto/qat/qat_common/qat_uclo.c:1805:2: note: '?' condition is =
false
           if (qat_uclo_check_mof_format(mof_ptr))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1805:2: note: Assuming the cond=
ition is true
           if (qat_uclo_check_mof_format(mof_ptr))
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
                                   ~~~~       ^
   6 warnings generated.
   drivers/misc/habanalabs/gaudi/gaudi.c:1215:2: warning: Value stored to '=
cb_size' is never read [clang-analyzer-deadcode.DeadStores]
           cb_size +=3D gaudi_gen_wait_cb(hdev, &wait_prop);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/gaudi/gaudi.c:1215:2: note: Value stored to 'cb_=
size' is never read
           cb_size +=3D gaudi_gen_wait_cb(hdev, &wait_prop);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/gaudi/gaudi.c:1262:2: warning: Value stored to '=
cb_size' is never read [clang-analyzer-deadcode.DeadStores]
           cb_size +=3D gaudi_gen_signal_cb(hdev, job->user_cb,
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/gaudi/gaudi.c:1262:2: note: Value stored to 'cb_=
size' is never read
           cb_size +=3D gaudi_gen_signal_cb(hdev, job->user_cb,
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/gaudi/gaudi.c:3738:28: warning: Although the val=
ue stored to 'qman_offset' is used in the enclosing expression, the value i=
s never actually read from 'qman_offset' [clang-analyzer-deadcode.DeadStore=
s]
           for (i =3D GAUDI_PCI_DMA_1, qman_offset =3D 0 ; i < GAUDI_HBM_DM=
A_1 ; i++) {
                                     ^             ~
   drivers/misc/habanalabs/gaudi/gaudi.c:3738:28: note: Although the value =
stored to 'qman_offset' is used in the enclosing expression, the value is n=
ever actually read from 'qman_offset'
           for (i =3D GAUDI_PCI_DMA_1, qman_offset =3D 0 ; i < GAUDI_HBM_DM=
A_1 ; i++) {
                                     ^             ~
   drivers/misc/habanalabs/gaudi/gaudi.c:5248:6: warning: Value stored to '=
dst_addr' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           u64 dst_addr =3D (le64_to_cpu(user_dma_pkt->dst_addr) &
               ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/gaudi/gaudi.c:5248:6: note: Value stored to 'dst=
_addr' during its initialization is never read
           u64 dst_addr =3D (le64_to_cpu(user_dma_pkt->dst_addr) &
               ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/of/property.c:920:19: warning: Access to field 'full_name' resul=
ts in a dereference of a null pointer [clang-analyzer-core.NullDereference]
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:920:19: note: '?' condition is false
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/of/property.c:920:19: note: Access to field 'full_name' results =
in a dereference of a null pointer
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:926:7: warning: Access to field 'parent' results i=
n a dereference of a null pointer [clang-analyzer-core.NullDereference]
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/of/property.c:926:7: note: '?' condition is false
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/of/property.c:926:7: note: Access to field 'parent' results in a=
 dereference of a null pointer
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/of/property.c:1443:22: warning: Value stored to 'con_np' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *con_np =3D to_of_node(fwnode);
                               ^~~~~~
   drivers/of/property.c:1443:22: note: Value stored to 'con_np' during its=
 initialization is never read
           struct device_node *con_np =3D to_of_node(fwnode);
                               ^~~~~~
   3 warnings generated.
   drivers/pci/hotplug/ibmphp_ebda.c:322:4: warning: Value stored to 'rc' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           rc =3D readw(io_mem + sub_addr);  /* next sub bl=
k */
                           ^
   drivers/pci/hotplug/ibmphp_ebda.c:322:4: note: Value stored to 'rc' is n=
ever read
>> drivers/pci/hotplug/ibmphp_ebda.c:748:31: warning: The left expression o=
f the compound assignment is an uninitialized value. The computed value wil=
l also be garbage [clang-analyzer-core.uninitialized.Assign]
                                   bus_info_ptr1->slot_count +=3D 1;
                                   ~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/pci/hotplug/ibmphp_ebda.c:696:17: note: Assuming 'ctlr' is < fie=
ld 'num_ctlrs'
           for (ctlr =3D 0; ctlr < hpc_list_ptr->num_ctlrs; ctlr++) {
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/hotplug/ibmphp_ebda.c:696:2: note: Loop condition is true.  =
Entering loop body
           for (ctlr =3D 0; ctlr < hpc_list_ptr->num_ctlrs; ctlr++) {
           ^
   drivers/pci/hotplug/ibmphp_ebda.c:716:8: note: 'hpc_ptr' is non-null
                   if (!hpc_ptr) {
                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/pci/hotplug/ibmphp_ebda.c:716:3: note: '?' condition is false
                   if (!hpc_ptr) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/pci/hotplug/ibmphp_ebda.c:716:8: note: 'hpc_ptr' is non-null
                   if (!hpc_ptr) {
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
   drivers/pci/hotplug/ibmphp_ebda.c:716:3: note: '?' condition is false
                   if (!hpc_ptr) {
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
   drivers/pci/hotplug/ibmphp_ebda.c:716:3: note: Taking false branch
                   if (!hpc_ptr) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/pci/hotplug/ibmphp_ebda.c:723:3: note: Assuming 'ibmphp_debug' i=
s not equal to 1
                   debug("now enter ctlr data structure ---\n");
                   ^
   drivers/pci/hotplug/ibmphp.h:28:37: note: expanded from macro 'debug'
   #define debug(fmt, arg...) do { if (ibmphp_debug =3D=3D 1) printk(KERN_D=
EBUG "%s: " fmt, MY_NAME, ## arg); } while (0)
                                       ^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/pci/hotplug/ibmphp_ebda.c:723:3: note: '?' condition is false
                   debug("now enter ctlr data structure ---\n");
                   ^
   drivers/pci/hotplug/ibmphp.h:28:33: note: expanded from macro 'debug'
   #define debug(fmt, arg...) do { if (ibmphp_debug =3D=3D 1) printk(KERN_D=
EBUG "%s: " fmt, MY_NAME, ## arg); } while (0)
                                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/pci/hotplug/ibmphp_ebda.c:723:3: note: 'ibmphp_debug' is not equ=
al to 1
                   debug("now enter ctlr data structure ---\n");
                   ^
   drivers/pci/hotplug/ibmphp.h:28:37: note: expanded from macro 'debug'
   #define debug(fmt, arg...) do { if (ibmphp_debug =3D=3D 1) printk(KERN_D=
EBUG "%s: " fmt, MY_NAME, ## arg); } while (0)
                                       ^~~~~~~~~~~~
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
   drivers/pci/hotplug/ibmphp_ebda.c:723:3: note: '?' condition is false
                   debug("now enter ctlr data structure ---\n");
                   ^
   drivers/pci/hotplug/ibmphp.h:28:33: note: expanded from macro 'debug'
   #define debug(fmt, arg...) do { if (ibmphp_debug =3D=3D 1) printk(KERN_D=
EBUG "%s: " fmt, MY_NAME, ## arg); } while (0)
--
                                                      ^~~~
   drivers/gpu/drm/ttm/ttm_tt.c:372:2: note: '?' condition is false
           if (ttm->page_flags & TTM_PAGE_FLAG_SG)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/gpu/drm/ttm/ttm_tt.c:372:2: note: '?' condition is false
           if (ttm->page_flags & TTM_PAGE_FLAG_SG)
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
   drivers/gpu/drm/ttm/ttm_tt.c:372:2: note: Taking false branch
           if (ttm->page_flags & TTM_PAGE_FLAG_SG)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/gpu/drm/ttm/ttm_tt.c:375:14: note: 'i' is < field 'num_pages'
           for (i =3D 0; i < ttm->num_pages; ++i) {
                       ^
   drivers/gpu/drm/ttm/ttm_tt.c:375:2: note: Loop condition is true.  Enter=
ing loop body
           for (i =3D 0; i < ttm->num_pages; ++i) {
           ^
   drivers/gpu/drm/ttm/ttm_tt.c:376:20: note: Dereference of null pointer
                   (*page)->mapping =3D NULL;
                   ~~~~~~~~~~~~~~~~~^~~~~~
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/pci/hotplug/ibmphp_pci.c:164:23: warning: Assigned value is garb=
age or undefined [clang-analyzer-core.uninitialized.Assign]
                                                   newfunc->irq[j] =3D cur_=
func->irq[j];
                                                                   ^ ~~~~~~=
~~~~~~~~~~
   drivers/pci/hotplug/ibmphp_pci.c:81:2: note: Assuming 'ibmphp_debug' is =
equal to 1
           debug("inside configure_card, func->busno =3D %x\n", func->busno=
);
           ^
   drivers/pci/hotplug/ibmphp.h:28:37: note: expanded from macro 'debug'
   #define debug(fmt, arg...) do { if (ibmphp_debug =3D=3D 1) printk(KERN_D=
EBUG "%s: " fmt, MY_NAME, ## arg); } while (0)
                                       ^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/pci/hotplug/ibmphp_pci.c:81:2: note: '?' condition is false
           debug("inside configure_card, func->busno =3D %x\n", func->busno=
);
           ^
   drivers/pci/hotplug/ibmphp.h:28:33: note: expanded from macro 'debug'
   #define debug(fmt, arg...) do { if (ibmphp_debug =3D=3D 1) printk(KERN_D=
EBUG "%s: " fmt, MY_NAME, ## arg); } while (0)
                                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/pci/hotplug/ibmphp_pci.c:81:2: note: 'ibmphp_debug' is equal to 1
           debug("inside configure_card, func->busno =3D %x\n", func->busno=
);
           ^
   drivers/pci/hotplug/ibmphp.h:28:37: note: expanded from macro 'debug'
   #define debug(fmt, arg...) do { if (ibmphp_debug =3D=3D 1) printk(KERN_D=
EBUG "%s: " fmt, MY_NAME, ## arg); } while (0)
                                       ^~~~~~~~~~~~
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
   drivers/pci/hotplug/ibmphp_pci.c:81:2: note: '?' condition is true
           debug("inside configure_card, func->busno =3D %x\n", func->busno=
);
           ^
   drivers/pci/hotplug/ibmphp.h:28:33: note: expanded from macro 'debug'
   #define debug(fmt, arg...) do { if (ibmphp_debug =3D=3D 1) printk(KERN_D=
EBUG "%s: " fmt, MY_NAME, ## arg); } while (0)
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
   drivers/pci/hotplug/ibmphp_pci.c:81:2: note: Taking true branch
           debug("inside configure_card, func->busno =3D %x\n", func->busno=
);
           ^
   drivers/pci/hotplug/ibmphp.h:28:33: note: expanded from macro 'debug'
   #define debug(fmt, arg...) do { if (ibmphp_debug =3D=3D 1) printk(KERN_D=
EBUG "%s: " fmt, MY_NAME, ## arg); } while (0)
                                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/pci/hotplug/ibmphp_pci.c:81:2: note: Left side of '&&' is true
           debug("inside configure_card, func->busno =3D %x\n", func->busno=
);
           ^
   drivers/pci/hotplug/ibmphp.h:28:56: note: expanded from macro 'debug'
   #define debug(fmt, arg...) do { if (ibmphp_debug =3D=3D 1) printk(KERN_D=
EBUG "%s: " fmt, MY_NAME, ## arg); } while (0)
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
   drivers/pci/hotplug/ibmphp_pci.c:81:2: note: '?' condition is true
           debug("inside configure_card, func->busno =3D %x\n", func->busno=
);
           ^
   drivers/pci/hotplug/ibmphp.h:28:56: note: expanded from macro 'debug'
   #define debug(fmt, arg...) do { if (ibmphp_debug =3D=3D 1) printk(KERN_D=
EBUG "%s: " fmt, MY_NAME, ## arg); } while (0)
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
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
--
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/pci/hotplug/ibmphp_pci.c:148:10: note: 'rc' is >=3D 0
                                           if (rc < 0) {
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
   drivers/pci/hotplug/ibmphp_pci.c:148:6: note: '?' condition is false
                                           if (rc < 0) {
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
   drivers/pci/hotplug/ibmphp_pci.c:148:6: note: Taking false branch
                                           if (rc < 0) {
                                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/pci/hotplug/ibmphp_pci.c:155:16: note: Calling 'kzalloc'
                                           newfunc =3D kzalloc(sizeof(*newf=
unc), GFP_KERNEL);
                                                     ^~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Storing uninitialized value
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/hotplug/ibmphp_pci.c:155:16: note: Returning from 'kzalloc'
                                           newfunc =3D kzalloc(sizeof(*newf=
unc), GFP_KERNEL);
                                                     ^~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
   drivers/pci/hotplug/ibmphp_pci.c:156:10: note: Assuming 'newfunc' is non=
-null
                                           if (!newfunc)
                                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/pci/hotplug/ibmphp_pci.c:156:6: note: '?' condition is false
                                           if (!newfunc)
                                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/pci/hotplug/ibmphp_pci.c:156:11: note: 'newfunc' is non-null
                                           if (!newfunc)
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
   drivers/pci/hotplug/ibmphp_pci.c:156:6: note: '?' condition is false
                                           if (!newfunc)
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
   drivers/pci/hotplug/ibmphp_pci.c:156:6: note: Taking false branch
                                           if (!newfunc)
                                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/pci/hotplug/ibmphp_pci.c:163:11: note: The value 0 is assigned t=
o 'j'
                                           for (j =3D 0; j < 4; j++)
                                                ^~~~~
   drivers/pci/hotplug/ibmphp_pci.c:163:6: note: Loop condition is true.  E=
ntering loop body
                                           for (j =3D 0; j < 4; j++)
                                           ^
   drivers/pci/hotplug/ibmphp_pci.c:164:23: note: Assigned value is garbage=
 or undefined
                                                   newfunc->irq[j] =3D cur_=
func->irq[j];
                                                                   ^ ~~~~~~=
~~~~~~~~~~
>> drivers/pci/hotplug/ibmphp_pci.c:1134:18: warning: The left expression o=
f the compound assignment is an uninitialized value. The computed value wil=
l also be garbage [clang-analyzer-core.uninitialized.Assign]
                                                   amount->io +=3D len[coun=
t];
                                                   ~~~~~~~~~~ ^
   drivers/pci/hotplug/ibmphp_pci.c:1067:11: note: Calling 'kzalloc'
           amount =3D kzalloc(sizeof(*amount), GFP_KERNEL);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Uninitialized value stored to field 'i=
o'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/hotplug/ibmphp_pci.c:1067:11: note: Returning from 'kzalloc'
           amount =3D kzalloc(sizeof(*amount), GFP_KERNEL);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/hotplug/ibmphp_pci.c:1068:6: note: Assuming 'amount' is not =
equal to null
           if (amount =3D=3D NULL)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/pci/hotplug/ibmphp_pci.c:1068:2: note: '?' condition is false
           if (amount =3D=3D NULL)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/pci/hotplug/ibmphp_pci.c:1068:6: note: 'amount' is not equal to =
null
           if (amount =3D=3D NULL)
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
   drivers/pci/hotplug/ibmphp_pci.c:1068:2: note: '?' condition is false
           if (amount =3D=3D NULL)
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
   drivers/pci/hotplug/ibmphp_pci.c:1068:2: note: Taking false branch
           if (amount =3D=3D NULL)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/pci/hotplug/ibmphp_pci.c:1073:2: note: Assuming 'ibmphp_debug' i=
s not equal to 1
           debug("the bus_no behind the bridge is %x\n", busno);
           ^
   drivers/pci/hotplug/ibmphp.h:28:37: note: expanded from macro 'debug'
   #define debug(fmt, arg...) do { if (ibmphp_debug =3D=3D 1) printk(KERN_D=
EBUG "%s: " fmt, MY_NAME, ## arg); } while (0)
                                       ^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/pci/hotplug/ibmphp_pci.c:1073:2: note: '?' condition is false
           debug("the bus_no behind the bridge is %x\n", busno);
           ^
   drivers/pci/hotplug/ibmphp.h:28:33: note: expanded from macro 'debug'
   #define debug(fmt, arg...) do { if (ibmphp_debug =3D=3D 1) printk(KERN_D=
EBUG "%s: " fmt, MY_NAME, ## arg); } while (0)
                                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/pci/hotplug/ibmphp_pci.c:1073:2: note: 'ibmphp_debug' is not equ=
al to 1
           debug("the bus_no behind the bridge is %x\n", busno);
           ^
   drivers/pci/hotplug/ibmphp.h:28:37: note: expanded from macro 'debug'
   #define debug(fmt, arg...) do { if (ibmphp_debug =3D=3D 1) printk(KERN_D=
EBUG "%s: " fmt, MY_NAME, ## arg); } while (0)
                                       ^~~~~~~~~~~~
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
   drivers/pci/hotplug/ibmphp_pci.c:1073:2: note: '?' condition is false
           debug("the bus_no behind the bridge is %x\n", busno);
--
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/media/tuners/tda18250.c:439:2: note: '?' condition is false
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
   drivers/media/tuners/tda18250.c:439:2: note: Taking false branch
           if (ret)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/tuners/tda18250.c:443:6: note: Assuming 'exp' is > 5
           if (exp > 5)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/tuners/tda18250.c:443:2: note: '?' condition is false
           if (exp > 5)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/tuners/tda18250.c:443:6: note: 'exp' is > 5
           if (exp > 5)
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
   drivers/media/tuners/tda18250.c:443:6: note: 'exp' is > 5
           if (exp > 5)
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
   drivers/media/tuners/tda18250.c:443:2: note: '?' condition is true
           if (exp > 5)
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
   drivers/media/tuners/tda18250.c:443:2: note: Taking true branch
           if (exp > 5)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/tuners/tda18250.c:445:11: note: The result of the left shi=
ft is undefined due to shifting by '4294967295', which is greater or equal =
to the width of type 'int'
           lopd =3D 1 << (exp - 1);
                    ^  ~~~~~~~~~
   drivers/media/tuners/tda18250.c:695:2: warning: Value stored to 'ret' is=
 never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_write_bits(dev->regmap, R46_CPUMP, 0x07, buf[2]);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/tda18250.c:695:2: note: Value stored to 'ret' is ne=
ver read
           ret =3D regmap_write_bits(dev->regmap, R46_CPUMP, 0x07, buf[2]);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   3 warnings generated.
>> drivers/block/null_blk/main.c:904:2: warning: Potential leak of memory p=
ointed to by 't_page' [clang-analyzer-unix.Malloc]
           spin_lock_irq(&nullb->lock);
           ^
   drivers/block/null_blk/main.c:1018:9: note: Assuming 'count' is < 'n'
           while (count < n) {
                  ^~~~~~~~~
   drivers/block/null_blk/main.c:1018:2: note: Loop condition is true.  Ent=
ering loop body
           while (count < n) {
           ^
   drivers/block/null_blk/main.c:1019:10: note: Assuming '__UNIQUE_ID___x31=
0' is >=3D '__UNIQUE_ID___y311'
                   temp =3D min_t(size_t, nullb->dev->blocksize, n - count);
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
   drivers/block/null_blk/main.c:1019:10: note: '?' condition is false
                   temp =3D min_t(size_t, nullb->dev->blocksize, n - count);
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
   drivers/block/null_blk/main.c:1021:7: note: Assuming the condition is fa=
lse
                   if (null_cache_active(nullb) && !is_fua)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/block/null_blk/main.c:1021:32: note: Left side of '&&' is false
                   if (null_cache_active(nullb) && !is_fua)
                                                ^
   drivers/block/null_blk/main.c:1021:3: note: '?' condition is false
                   if (null_cache_active(nullb) && !is_fua)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/block/null_blk/main.c:1021:7: note: Assuming the condition is fa=
lse
                   if (null_cache_active(nullb) && !is_fua)
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
   drivers/block/null_blk/main.c:1021:32: note: Left side of '&&' is false
                   if (null_cache_active(nullb) && !is_fua)
                                                ^
   drivers/block/null_blk/main.c:1021:3: note: '?' condition is false
                   if (null_cache_active(nullb) && !is_fua)
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
   drivers/block/null_blk/main.c:1021:3: note: Taking false branch
                   if (null_cache_active(nullb) && !is_fua)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/block/null_blk/main.c:1026:4: note: Assuming the condition is tr=
ue
                           !null_cache_active(nullb) || is_fua);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/null_blk/main.c:1026:30: note: Left side of '||' is true
                           !null_cache_active(nullb) || is_fua);
                                                     ^
   drivers/block/null_blk/main.c:1025:12: note: Calling 'null_insert_page'
                   t_page =3D null_insert_page(nullb, sector,
--
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/nfs/nfs4session.c:130:4: note: '?' condition is false
                           if (*p =3D=3D NULL)
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
   fs/nfs/nfs4session.c:130:4: note: Taking false branch
                           if (*p =3D=3D NULL)
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/nfs/nfs4session.c:135:7: note: Assuming 'slotid' is not equal to fiel=
d 'slot_nr'
                   if (slot->slot_nr =3D=3D slotid)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/nfs/nfs4session.c:135:3: note: '?' condition is false
                   if (slot->slot_nr =3D=3D slotid)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/nfs/nfs4session.c:135:24: note: 'slotid' is not equal to field 'slot_=
nr'
                   if (slot->slot_nr =3D=3D slotid)
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
   fs/nfs/nfs4session.c:135:3: note: '?' condition is false
                   if (slot->slot_nr =3D=3D slotid)
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
   fs/nfs/nfs4session.c:135:3: note: Taking false branch
                   if (slot->slot_nr =3D=3D slotid)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/nfs/nfs4session.c:126:2: note: Loop condition is true.  Entering loop=
 body
           for (;;) {
           ^
   fs/nfs/nfs4session.c:127:10: note: The left operand of '=3D=3D' is a gar=
bage value
                   if (*p =3D=3D NULL) {
                          ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   Suppressed 3 warnings (3 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/scsi/libsas/sas_ata.c:808:26: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
                           struct ata_port *ap =3D eh_dev->sata_dev.ap;
                                                 ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_ata.c:794:3: note: Null pointer value stored to =
'eh_dev'
                   eh_dev =3D NULL;
                   ^~~~~~~~~~~~~
   drivers/scsi/libsas/sas_ata.c:796:3: note: Left side of '&&' is false
                   list_for_each_entry_safe(cmd, n, work_q, eh_entry) {
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
   drivers/scsi/libsas/sas_ata.c:796:3: note: '?' condition is true
                   list_for_each_entry_safe(cmd, n, work_q, eh_entry) {
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
   drivers/scsi/libsas/sas_ata.c:796:3: note: Left side of '&&' is false
                   list_for_each_entry_safe(cmd, n, work_q, eh_entry) {
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
   drivers/scsi/libsas/sas_ata.c:796:3: note: Taking false branch
                   list_for_each_entry_safe(cmd, n, work_q, eh_entry) {
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
   drivers/scsi/libsas/sas_ata.c:796:3: note: Loop condition is false.  Exi=
ting loop
                   list_for_each_entry_safe(cmd, n, work_q, eh_entry) {
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
           do {                                                            \
--
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
   drivers/pci/hotplug/ibmphp_res.c:1980:9: note: '?' condition is true
                                                                   if (!ran=
ge_exists_already(range, bus_sec, IO)) {
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
   drivers/pci/hotplug/ibmphp_res.c:1980:9: note: Taking true branch
                                                                   if (!ran=
ge_exists_already(range, bus_sec, IO)) {
                                                                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/pci/hotplug/ibmphp_res.c:1981:10: note: Calling 'add_bus_range'
                                                                           =
add_bus_range(IO, range, bus_sec);
                                                                           =
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/hotplug/ibmphp_res.c:375:2: note: Control jumps to 'case 1:'=
  at line 384
           switch (type) {
           ^
   drivers/pci/hotplug/ibmphp_res.c:385:4: note: Value assigned to 'range_c=
ur'
                           range_cur =3D bus_cur->rangeIO;
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/hotplug/ibmphp_res.c:387:4: note:  Execution continues on li=
ne 390
                           break;
                           ^
   drivers/pci/hotplug/ibmphp_res.c:391:9: note: Assuming pointer value is =
null
           while (range_cur) {
                  ^~~~~~~~~
   drivers/pci/hotplug/ibmphp_res.c:391:2: note: Loop condition is false. E=
xecution continues on line 398
           while (range_cur) {
           ^
   drivers/pci/hotplug/ibmphp_res.c:398:2: note: '?' condition is false
           if (!count) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/pci/hotplug/ibmphp_res.c:398:7: note: 'count' is 0
           if (!count) {
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
   drivers/pci/hotplug/ibmphp_res.c:398:2: note: '?' condition is true
           if (!count) {
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
   drivers/pci/hotplug/ibmphp_res.c:398:2: note: Taking true branch
           if (!count) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/pci/hotplug/ibmphp_res.c:400:3: note: Control jumps to 'case 1:'=
  at line 407
                   switch (type) {
                   ^
   drivers/pci/hotplug/ibmphp_res.c:409:5: note:  Execution continues on li=
ne 411
                                   break;
                                   ^
   drivers/pci/hotplug/ibmphp_res.c:428:23: note: Assuming 'count' is < 'no=
Ranges'
           for (count =3D i_init; count < noRanges; ++count) {
                                ^~~~~~~~~~~~~~~~
   drivers/pci/hotplug/ibmphp_res.c:428:2: note: Loop condition is true.  E=
ntering loop body
           for (count =3D i_init; count < noRanges; ++count) {
           ^
   drivers/pci/hotplug/ibmphp_res.c:429:3: note: Access to field 'rangeno' =
results in a dereference of a null pointer (loaded from variable 'range_cur=
')
                   ++range_cur->rangeno;
                   ^ ~~~~~~~~~
>> drivers/pci/hotplug/ibmphp_res.c:521:11: warning: Assigned value is garb=
age or undefined [clang-analyzer-core.uninitialized.Assign]
                                   range =3D range->next;
                                         ^
   drivers/pci/hotplug/ibmphp_res.c:1920:6: note: Assuming 'bus_cur' is non=
-null
           if (!bus_cur)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/pci/hotplug/ibmphp_res.c:1920:2: note: '?' condition is false
           if (!bus_cur)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/pci/hotplug/ibmphp_res.c:1920:7: note: 'bus_cur' is non-null
           if (!bus_cur)
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
   drivers/pci/hotplug/ibmphp_res.c:1920:2: note: '?' condition is false
           if (!bus_cur)
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
   drivers/pci/hotplug/ibmphp_res.c:1920:2: note: Taking false branch
           if (!bus_cur)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/pci/hotplug/ibmphp_res.c:1924:2: note: Assuming 'ibmphp_debug' i=
s not equal to 1
           debug("inside %s\n", __func__);
           ^
   drivers/pci/hotplug/ibmphp.h:28:37: note: expanded from macro 'debug'
   #define debug(fmt, arg...) do { if (ibmphp_debug =3D=3D 1) printk(KERN_D=
EBUG "%s: " fmt, MY_NAME, ## arg); } while (0)
                                       ^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/pci/hotplug/ibmphp_res.c:1924:2: note: '?' condition is false
           debug("inside %s\n", __func__);
           ^
   drivers/pci/hotplug/ibmphp.h:28:33: note: expanded from macro 'debug'
   #define debug(fmt, arg...) do { if (ibmphp_debug =3D=3D 1) printk(KERN_D=
EBUG "%s: " fmt, MY_NAME, ## arg); } while (0)
                                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/pci/hotplug/ibmphp_res.c:1924:2: note: 'ibmphp_debug' is not equ=
al to 1
           debug("inside %s\n", __func__);
           ^
   drivers/pci/hotplug/ibmphp.h:28:37: note: expanded from macro 'debug'
   #define debug(fmt, arg...) do { if (ibmphp_debug =3D=3D 1) printk(KERN_D=
EBUG "%s: " fmt, MY_NAME, ## arg); } while (0)
                                       ^~~~~~~~~~~~
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
   drivers/pci/hotplug/ibmphp_res.c:1924:2: note: '?' condition is false
           debug("inside %s\n", __func__);
           ^
   drivers/pci/hotplug/ibmphp.h:28:33: note: expanded from macro 'debug'
   #define debug(fmt, arg...) do { if (ibmphp_debug =3D=3D 1) printk(KERN_D=
EBUG "%s: " fmt, MY_NAME, ## arg); } while (0)
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
   fs/gfs2/recovery.c:114:8: note: Left side of '&&' is false
                   rr =3D list_first_entry(head, struct gfs2_revoke_replay,=
 rr_list);
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
   fs/gfs2/recovery.c:114:8: note: '?' condition is true
                   rr =3D list_first_entry(head, struct gfs2_revoke_replay,=
 rr_list);
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
   fs/gfs2/recovery.c:114:8: note: Left side of '&&' is false
                   rr =3D list_first_entry(head, struct gfs2_revoke_replay,=
 rr_list);
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
   fs/gfs2/recovery.c:114:8: note: Taking false branch
                   rr =3D list_first_entry(head, struct gfs2_revoke_replay,=
 rr_list);
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
   fs/gfs2/recovery.c:114:8: note: Loop condition is false.  Exiting loop
                   rr =3D list_first_entry(head, struct gfs2_revoke_replay,=
 rr_list);
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
   fs/gfs2/recovery.c:115:3: note: Calling 'list_del'
                   list_del(&rr->rr_list);
                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:147:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> sound/pci/ctxfi/ctdaio.c:179:2: warning: Potential leak of memory pointe=
d to by 'entry' [clang-analyzer-unix.Malloc]
           input->ops->master(input);
           ^
   sound/pci/ctxfi/ctdaio.c:162:10: note: Calling 'kzalloc'
           entry =3D kzalloc((sizeof(*entry) * daio->rscl.msr), GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Memory is allocated
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ctxfi/ctdaio.c:162:10: note: Returned allocated memory
           entry =3D kzalloc((sizeof(*entry) * daio->rscl.msr), GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ctxfi/ctdaio.c:163:6: note: Assuming 'entry' is non-null
           if (!entry)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   sound/pci/ctxfi/ctdaio.c:163:2: note: '?' condition is false
           if (!entry)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/pci/ctxfi/ctdaio.c:163:7: note: 'entry' is non-null
           if (!entry)
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
   sound/pci/ctxfi/ctdaio.c:163:7: note: 'entry' is non-null
           if (!entry)
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
   sound/pci/ctxfi/ctdaio.c:163:2: note: '?' condition is false
           if (!entry)
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
   sound/pci/ctxfi/ctdaio.c:163:2: note: Taking false branch
           if (!entry)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/pci/ctxfi/ctdaio.c:170:14: note: Assuming 'i' is >=3D field 'msr'
           for (i =3D 0; i < daio->rscl.msr; i++, entry++) {
                       ^~~~~~~~~~~~~~~~~~
   sound/pci/ctxfi/ctdaio.c:170:2: note: Loop condition is false. Execution=
 continues on line 179
           for (i =3D 0; i < daio->rscl.msr; i++, entry++) {
           ^
   sound/pci/ctxfi/ctdaio.c:179:2: note: Potential leak of memory pointed t=
o by 'entry'
           input->ops->master(input);
           ^
   sound/pci/ctxfi/ctdaio.c:208:2: warning: Potential leak of memory pointe=
d to by 'entry' [clang-analyzer-unix.Malloc]
           input->ops->master(input);
           ^
   sound/pci/ctxfi/ctdaio.c:191:10: note: Calling 'kzalloc'
           entry =3D kzalloc((sizeof(*entry) * daio->rscr.msr), GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Memory is allocated
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ctxfi/ctdaio.c:191:10: note: Returned allocated memory
           entry =3D kzalloc((sizeof(*entry) * daio->rscr.msr), GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ctxfi/ctdaio.c:192:6: note: Assuming 'entry' is non-null
           if (!entry)
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
   drivers/md/dm-crypt.c:2908:2: note: Taking false branch
           if (ret < 0) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/dm-crypt.c:2913:6: note: Calling 'crypt_integrity_aead'
           if (crypt_integrity_aead(cc))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm-crypt.c:1117:2: note: Returning without writing to 'cc->ci=
pher_tfm.tfms'
           return test_bit(CRYPT_MODE_INTEGRITY_AEAD, &cc->cipher_flags);
           ^
   drivers/md/dm-crypt.c:2913:6: note: Returning from 'crypt_integrity_aead'
           if (crypt_integrity_aead(cc))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm-crypt.c:2913:2: note: '?' condition is false
           if (crypt_integrity_aead(cc))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/dm-crypt.c:2913:6: note: Calling 'crypt_integrity_aead'
           if (crypt_integrity_aead(cc))
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
   drivers/md/dm-crypt.c:1117:2: note: Returning without writing to 'cc->ci=
pher_tfm.tfms'
           return test_bit(CRYPT_MODE_INTEGRITY_AEAD, &cc->cipher_flags);
           ^
   drivers/md/dm-crypt.c:2913:6: note: Returning from 'crypt_integrity_aead'
           if (crypt_integrity_aead(cc))
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
   drivers/md/dm-crypt.c:2913:2: note: Assuming the condition is false
           if (crypt_integrity_aead(cc))
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
   drivers/md/dm-crypt.c:2913:2: note: '?' condition is false
           if (crypt_integrity_aead(cc))
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
   drivers/md/dm-crypt.c:2913:2: note: Taking false branch
           if (crypt_integrity_aead(cc))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/dm-crypt.c:2916:40: note: Calling 'any_tfm'
                   cc->iv_size =3D crypto_skcipher_ivsize(any_tfm(cc));
                                                        ^~~~~~~~~~~
   drivers/md/dm-crypt.c:246:2: note: Undefined or garbage value returned t=
o caller
           return cc->cipher_tfm.tfms[0];
           ^      ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/md/dm-crypt.c:251:9: warning: Array access (via field 'tfms_aead=
') results in a null pointer dereference [clang-analyzer-core.NullDereferen=
ce]
           return cc->cipher_tfm.tfms_aead[0];
                  ^
   drivers/md/dm-crypt.c:2865:2: note: Assuming the condition is false
           if (*ivopts) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm-crypt.c:2865:2: note: '?' condition is false
           if (*ivopts) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/dm-crypt.c:2865:2: note: '?' condition is true
           if (*ivopts) {
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
   drivers/md/dm-crypt.c:2865:2: note: Taking true branch
           if (*ivopts) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/dm-crypt.c:2871:2: note: Assuming the condition is true
           if (*ivmode) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm-crypt.c:2871:2: note: '?' condition is false
           if (*ivmode) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/dm-crypt.c:2871:2: note: '?' condition is false
           if (*ivmode) {
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
   drivers/md/dm-crypt.c:2871:2: note: Taking false branch
           if (*ivmode) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/dm-crypt.c:2879:6: note: Calling 'crypt_integrity_aead'
           if (crypt_integrity_aead(cc)) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm-crypt.c:1117:2: note: Returning without writing to 'cc->ci=
pher_tfm.tfms_aead'
           return test_bit(CRYPT_MODE_INTEGRITY_AEAD, &cc->cipher_flags);
           ^
   drivers/md/dm-crypt.c:2879:6: note: Returning from 'crypt_integrity_aead'
           if (crypt_integrity_aead(cc)) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm-crypt.c:2879:2: note: '?' condition is false
           if (crypt_integrity_aead(cc)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
           ^
   drivers/md/dm-crypt.c:2908:2: note: Taking false branch
           if (ret < 0) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/dm-crypt.c:2913:6: note: Calling 'crypt_integrity_aead'
           if (crypt_integrity_aead(cc))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm-crypt.c:1117:2: note: Returning without writing to 'cc->ci=
pher_tfm.tfms_aead'
           return test_bit(CRYPT_MODE_INTEGRITY_AEAD, &cc->cipher_flags);
           ^
   drivers/md/dm-crypt.c:2913:6: note: Returning from 'crypt_integrity_aead'
           if (crypt_integrity_aead(cc))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm-crypt.c:2913:2: note: '?' condition is false
           if (crypt_integrity_aead(cc))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/dm-crypt.c:2913:6: note: Calling 'crypt_integrity_aead'
           if (crypt_integrity_aead(cc))
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
   drivers/md/dm-crypt.c:1117:2: note: Returning without writing to 'cc->ci=
pher_tfm.tfms_aead'
           return test_bit(CRYPT_MODE_INTEGRITY_AEAD, &cc->cipher_flags);
           ^
   drivers/md/dm-crypt.c:2913:6: note: Returning from 'crypt_integrity_aead'
           if (crypt_integrity_aead(cc))
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
   drivers/md/dm-crypt.c:2913:2: note: Assuming the condition is true
           if (crypt_integrity_aead(cc))
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
   drivers/md/dm-crypt.c:2913:2: note: '?' condition is true
           if (crypt_integrity_aead(cc))
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
   drivers/md/dm-crypt.c:2913:2: note: Taking true branch
           if (crypt_integrity_aead(cc))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/dm-crypt.c:2914:36: note: Calling 'any_tfm_aead'
                   cc->iv_size =3D crypto_aead_ivsize(any_tfm_aead(cc));
                                                    ^~~~~~~~~~~~~~~~
   drivers/md/dm-crypt.c:251:9: note: Array access (via field 'tfms_aead') =
results in a null pointer dereference
           return cc->cipher_tfm.tfms_aead[0];
                  ^              ~~~~~~~~~
>> drivers/md/dm-crypt.c:1005:2: warning: Potential leak of memory pointed =
to by 'ks' [clang-analyzer-unix.Malloc]
           kfree_sensitive(es);
           ^
   drivers/md/dm-crypt.c:948:7: note: Calling 'kzalloc'
           ks =3D kzalloc(32, GFP_NOIO); /* Elephant sector key */
                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Memory is allocated
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-crypt.c:948:7: note: Returned allocated memory
           ks =3D kzalloc(32, GFP_NOIO); /* Elephant sector key */
                ^~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-crypt.c:950:7: note: 'req' is null
           if (!req || !es || !ks) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm-crypt.c:950:11: note: Left side of '||' is true
           if (!req || !es || !ks) {
                    ^
   drivers/md/dm-crypt.c:950:2: note: '?' condition is false
           if (!req || !es || !ks) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/dm-crypt.c:950:7: note: 'req' is null
           if (!req || !es || !ks) {
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
   drivers/md/dm-crypt.c:950:11: note: Left side of '||' is true
           if (!req || !es || !ks) {
                    ^
   drivers/md/dm-crypt.c:950:2: note: '?' condition is true
           if (!req || !es || !ks) {
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
   drivers/md/dm-crypt.c:950:2: note: Taking true branch
           if (!req || !es || !ks) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/dm-crypt.c:952:3: note: Control jumps to line 1004
                   goto out;
                   ^
   drivers/md/dm-crypt.c:1005:2: note: Potential leak of memory pointed to =
by 'ks'
           kfree_sensitive(es);
           ^
>> drivers/md/dm-crypt.c:1006:2: warning: Potential leak of memory pointed =
to by 'es' [clang-analyzer-unix.Malloc]
           skcipher_request_free(req);
           ^
   drivers/md/dm-crypt.c:947:7: note: Calling 'kzalloc'
           es =3D kzalloc(16, GFP_NOIO); /* Key for AES */
                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Memory is allocated
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-crypt.c:947:7: note: Returned allocated memory
           es =3D kzalloc(16, GFP_NOIO); /* Key for AES */
                ^~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-crypt.c:950:7: note: 'req' is null
           if (!req || !es || !ks) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm-crypt.c:950:11: note: Left side of '||' is true
           if (!req || !es || !ks) {
                    ^
   drivers/md/dm-crypt.c:950:2: note: '?' condition is false
           if (!req || !es || !ks) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/dm-crypt.c:950:7: note: 'req' is null
           if (!req || !es || !ks) {
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
   drivers/md/dm-crypt.c:950:11: note: Left side of '||' is true
           if (!req || !es || !ks) {
                    ^
   drivers/md/dm-crypt.c:950:2: note: '?' condition is true
           if (!req || !es || !ks) {
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
   drivers/md/dm-crypt.c:950:2: note: Taking true branch
           if (!req || !es || !ks) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/dm-crypt.c:952:3: note: Control jumps to line 1004
                   goto out;
                   ^
   drivers/md/dm-crypt.c:1006:2: note: Potential leak of memory pointed to =
by 'es'
           skcipher_request_free(req);
           ^
>> drivers/md/dm-crypt.c:1007:2: warning: Potential leak of memory pointed =
to by 'req' [clang-analyzer-unix.Malloc]
           return r;
           ^
   drivers/md/dm-crypt.c:946:8: note: Calling 'skcipher_request_alloc'
           req =3D skcipher_request_alloc(elephant->tfm, GFP_NOIO);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/crypto/skcipher.h:498:8: note: Memory is allocated
           req =3D kmalloc(sizeof(struct skcipher_request) +
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/crypto/skcipher.h:501:6: note: Assuming 'req' is non-null
           if (likely(req))
               ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
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
   include/crypto/skcipher.h:501:2: note: '?' condition is false
           if (likely(req))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/crypto/skcipher.h:501:13: note: 'req' is non-null
           if (likely(req))
                      ^
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
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
   include/crypto/skcipher.h:501:2: note: '?' condition is true
           if (likely(req))
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
   include/crypto/skcipher.h:501:2: note: Taking true branch
           if (likely(req))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/dm-crypt.c:946:8: note: Returned allocated memory
           req =3D skcipher_request_alloc(elephant->tfm, GFP_NOIO);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-crypt.c:950:7: note: 'req' is non-null
           if (!req || !es || !ks) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm-crypt.c:950:6: note: Left side of '||' is false
           if (!req || !es || !ks) {
               ^
   drivers/md/dm-crypt.c:950:14: note: Assuming 'es' is null
           if (!req || !es || !ks) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm-crypt.c:950:18: note: Left side of '||' is true
           if (!req || !es || !ks) {
                           ^
   drivers/md/dm-crypt.c:950:2: note: '?' condition is false
           if (!req || !es || !ks) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/dm-crypt.c:950:7: note: 'req' is non-null
           if (!req || !es || !ks) {
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
   drivers/md/dm-crypt.c:950:6: note: Left side of '||' is false
           if (!req || !es || !ks) {
               ^
   drivers/md/dm-crypt.c:950:15: note: 'es' is null
           if (!req || !es || !ks) {
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
   drivers/md/dm-crypt.c:950:18: note: Left side of '||' is true
           if (!req || !es || !ks) {
                           ^
   drivers/md/dm-crypt.c:950:2: note: '?' condition is true
           if (!req || !es || !ks) {
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
   drivers/md/dm-crypt.c:950:2: note: Taking true branch
           if (!req || !es || !ks) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/dm-crypt.c:952:3: note: Control jumps to line 1004
                   goto out;
                   ^
   drivers/md/dm-crypt.c:1007:2: note: Potential leak of memory pointed to =
by 'req'
           return r;
           ^
   drivers/md/dm-crypt.c:1165:24: warning: Value stored to 'md' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct mapped_device *md =3D dm_table_get_md(ti->table);
                                 ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-crypt.c:1165:24: note: Value stored to 'md' during its ini=
tialization is never read
           struct mapped_device *md =3D dm_table_get_md(ti->table);
                                 ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/md/dm-crypt.c:2266:7: warning: Branch condition evaluates to a g=
arbage value [clang-analyzer-core.uninitialized.Branch]
                   if (cc->cipher_tfm.tfms[i] && !IS_ERR(cc->cipher_tfm.tfm=
s[i])) {
                       ^
   drivers/md/dm-crypt.c:2930:6: note: Assuming the condition is true
           if (strchr(cipher_in, '(') || crypt_integrity_aead(cc)) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm-crypt.c:2930:29: note: Left side of '||' is true
           if (strchr(cipher_in, '(') || crypt_integrity_aead(cc)) {
                                      ^
   drivers/md/dm-crypt.c:2930:2: note: '?' condition is false
           if (strchr(cipher_in, '(') || crypt_integrity_aead(cc)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/dm-crypt.c:2930:6: note: Assuming the condition is false
           if (strchr(cipher_in, '(') || crypt_integrity_aead(cc)) {
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
   drivers/md/dm-crypt.c:2930:6: note: Left side of '||' is false
           if (strchr(cipher_in, '(') || crypt_integrity_aead(cc)) {
               ^
   drivers/md/dm-crypt.c:2930:2: note: Assuming the condition is false
           if (strchr(cipher_in, '(') || crypt_integrity_aead(cc)) {
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
   drivers/md/dm-crypt.c:2930:2: note: '?' condition is false
           if (strchr(cipher_in, '(') || crypt_integrity_aead(cc)) {
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
   drivers/md/dm-crypt.c:2930:2: note: Taking false branch
           if (strchr(cipher_in, '(') || crypt_integrity_aead(cc)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/dm-crypt.c:2943:6: note: Assuming 'keycount' is null
           if (!keycount)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm-crypt.c:2943:2: note: '?' condition is false
           if (!keycount)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/dm-crypt.c:2943:7: note: 'keycount' is null
           if (!keycount)
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
   drivers/md/dm-crypt.c:2943:2: note: '?' condition is true
           if (!keycount)
--
   sound/pci/oxygen/xonar_dg.c:102:13: note: Value stored to 'data' during =
its initialization is never read
           struct dg *data =3D chip->model_data;
                      ^~~~   ~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/xfs/xfs_icache.c:746:2: warning: Value stored to 'error' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           error =3D 0;
           ^       ~
   fs/xfs/xfs_icache.c:746:2: note: Value stored to 'error' is never read
           error =3D 0;
           ^       ~
   fs/xfs/xfs_icache.c:1667:2: warning: Value stored to 'nr_found' is never=
 read [clang-analyzer-deadcode.DeadStores]
           nr_found =3D 0;
           ^          ~
   fs/xfs/xfs_icache.c:1667:2: note: Value stored to 'nr_found' is never re=
ad
           nr_found =3D 0;
           ^          ~
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
   2 warnings generated.
   drivers/scsi/vmw_pvscsi.c:254:3: warning: 3rd function call argument is =
an uninitialized value [clang-analyzer-core.CallAndMessage]
                   pvscsi_reg_write(adapter,
                   ^
   drivers/scsi/vmw_pvscsi.c:988:2: note: Loop condition is false.  Exiting=
 loop
           spin_lock_irqsave(&adapter->hw_lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/scsi/vmw_pvscsi.c:988:2: note: Loop condition is false.  Exiting=
 loop
           spin_lock_irqsave(&adapter->hw_lock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/scsi/vmw_pvscsi.c:991:2: note: Calling 'll_device_reset'
           ll_device_reset(adapter, cmd->device->id);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/vmw_pvscsi.c:319:2: note: '?' condition is true
           dev_dbg(pvscsi_dev(adapter), "Resetting device: target=3D%u\n", =
target);
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/vmw_pvscsi.c:319:2: note: Taking false branch
           dev_dbg(pvscsi_dev(adapter), "Resetting device: target=3D%u\n", =
target);
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/vmw_pvscsi.c:323:2: note: Calling 'pvscsi_write_cmd_desc'
           pvscsi_write_cmd_desc(adapter, PVSCSI_CMD_RESET_DEVICE,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/vmw_pvscsi.c:253:2: note: Loop condition is true.  Entering=
 loop body
           for (i =3D 0; i < len; i++)
           ^
   drivers/scsi/vmw_pvscsi.c:253:23: note: The value 1 is assigned to 'i'
           for (i =3D 0; i < len; i++)
                                ^~~
   drivers/scsi/vmw_pvscsi.c:253:2: note: Loop condition is true.  Entering=
 loop body
           for (i =3D 0; i < len; i++)
           ^
   drivers/scsi/vmw_pvscsi.c:254:3: note: 3rd function call argument is an =
uninitialized value
                   pvscsi_reg_write(adapter,
                   ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/scsi/scsi_debug.c:2020:21: warning: The left expression of the c=
ompound assignment is an uninitialized value. The computed value will also =
be garbage [clang-analyzer-core.uninitialized.Assign]
                                   arr[offset + 5] |=3D 0x2;
                                   ~~~~~~~~~~~~~~~ ^
   drivers/scsi/scsi_debug.c:1982:10: note: Assuming the condition is false
           rctd =3D !!(cmd[2] & 0x80);
                   ^~~~~~~~~~~~~~~~
   drivers/scsi/scsi_debug.c:1987:6: note: Assuming 'alloc_len' is >=3D 4
           if (alloc_len < 4 || alloc_len > 0xffff) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/scsi/scsi_debug.c:1987:6: note: Left side of '||' is false
           if (alloc_len < 4 || alloc_len > 0xffff) {
               ^
   drivers/scsi/scsi_debug.c:1987:23: note: Assuming 'alloc_len' is <=3D 65=
535
           if (alloc_len < 4 || alloc_len > 0xffff) {
                                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/scsi/scsi_debug.c:1987:2: note: '?' condition is false
           if (alloc_len < 4 || alloc_len > 0xffff) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/scsi_debug.c:1987:6: note: 'alloc_len' is >=3D 4
           if (alloc_len < 4 || alloc_len > 0xffff) {
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
   drivers/scsi/scsi_debug.c:1987:6: note: Left side of '||' is false
           if (alloc_len < 4 || alloc_len > 0xffff) {
               ^
   drivers/scsi/scsi_debug.c:1987:23: note: 'alloc_len' is <=3D 65535
           if (alloc_len < 4 || alloc_len > 0xffff) {
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
   drivers/scsi/scsi_debug.c:1987:2: note: '?' condition is false
           if (alloc_len < 4 || alloc_len > 0xffff) {
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
   drivers/scsi/scsi_debug.c:1987:2: note: Taking false branch
           if (alloc_len < 4 || alloc_len > 0xffff) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/scsi_debug.c:1991:6: note: Assuming 'alloc_len' is > 8192
           if (alloc_len > 8192)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/scsi/scsi_debug.c:1991:2: note: '?' condition is false
           if (alloc_len > 8192)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/scsi_debug.c:1991:6: note: 'alloc_len' is > 8192
           if (alloc_len > 8192)
--
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/xprt.c:1765:2: note: Loop condition is true.  Entering loop b=
ody
           while (!list_empty(&xprt->free)) {
           ^
   net/sunrpc/xprt.c:1766:9: note: Left side of '&&' is false
                   req =3D list_first_entry(&xprt->free, struct rpc_rqst, r=
q_list);
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
   net/sunrpc/xprt.c:1766:9: note: '?' condition is true
                   req =3D list_first_entry(&xprt->free, struct rpc_rqst, r=
q_list);
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
   net/sunrpc/xprt.c:1766:9: note: Left side of '&&' is false
                   req =3D list_first_entry(&xprt->free, struct rpc_rqst, r=
q_list);
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
   net/sunrpc/xprt.c:1766:9: note: Taking false branch
                   req =3D list_first_entry(&xprt->free, struct rpc_rqst, r=
q_list);
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
   net/sunrpc/xprt.c:1766:9: note: Loop condition is false.  Exiting loop
                   req =3D list_first_entry(&xprt->free, struct rpc_rqst, r=
q_list);
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
   net/sunrpc/xprt.c:1767:3: note: Calling 'list_del'
                   list_del(&req->rq_list);
                   ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:147:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
>> net/sunrpc/xprt.c:1736:22: warning: Potential leak of memory pointed to =
by 'req' [clang-analyzer-unix.Malloc]
                   task->tk_status =3D -EAGAIN;
                                      ^
   include/uapi/asm-generic/errno-base.h:15:17: note: expanded from macro '=
EAGAIN'
   #define EAGAIN          11      /* Try again */
                           ^
   net/sunrpc/xprt.c:1717:6: note: Assuming the condition is false
           if (!list_empty(&xprt->free)) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/sunrpc/xprt.c:1717:2: note: '?' condition is false
           if (!list_empty(&xprt->free)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/sunrpc/xprt.c:1717:6: note: Assuming the condition is false
           if (!list_empty(&xprt->free)) {
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
   net/sunrpc/xprt.c:1717:2: note: '?' condition is false
           if (!list_empty(&xprt->free)) {
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
   net/sunrpc/xprt.c:1717:2: note: Taking false branch
           if (!list_empty(&xprt->free)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/sunrpc/xprt.c:1722:8: note: Calling 'xprt_dynamic_alloc_slot'
           req =3D xprt_dynamic_alloc_slot(xprt);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/xprt.c:1688:6: note: Assuming field 'num_reqs' is < field 'ma=
x_reqs'
           if (xprt->num_reqs >=3D xprt->max_reqs)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/sunrpc/xprt.c:1688:2: note: '?' condition is false
           if (xprt->num_reqs >=3D xprt->max_reqs)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/sunrpc/xprt.c:1688:12: note: Field 'num_reqs' is < field 'max_reqs'
           if (xprt->num_reqs >=3D xprt->max_reqs)
                     ^
   net/sunrpc/xprt.c:1688:2: note: '?' condition is false
           if (xprt->num_reqs >=3D xprt->max_reqs)
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
   net/sunrpc/xprt.c:1688:2: note: Taking false branch
           if (xprt->num_reqs >=3D xprt->max_reqs)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/sunrpc/xprt.c:1692:8: note: Calling 'kzalloc'
           req =3D kzalloc(sizeof(struct rpc_rqst), GFP_NOFS);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Memory is allocated
           return kmalloc(size, flags | __GFP_ZERO);
--
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
   drivers/gpu/drm/drm_dp_mst_topology.c:3142:3: note: Taking false branch
                   if (!found_port)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/gpu/drm/drm_dp_mst_topology.c:3145:3: note: Assuming the conditi=
on is false
                   if (drm_dp_mst_topology_try_get_mstb(found_port->parent)=
) {
                   ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:3145:3: note: '?' condition is fal=
se
                   if (drm_dp_mst_topology_try_get_mstb(found_port->parent)=
) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/gpu/drm/drm_dp_mst_topology.c:3145:3: note: Assuming the conditi=
on is true
                   if (drm_dp_mst_topology_try_get_mstb(found_port->parent)=
) {
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
   drivers/gpu/drm/drm_dp_mst_topology.c:3145:3: note: '?' condition is fal=
se
                   if (drm_dp_mst_topology_try_get_mstb(found_port->parent)=
) {
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
   drivers/gpu/drm/drm_dp_mst_topology.c:3145:3: note: Taking false branch
                   if (drm_dp_mst_topology_try_get_mstb(found_port->parent)=
) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/gpu/drm/drm_dp_mst_topology.c:3150:4: note: Null pointer value s=
tored to 'mstb'
                           mstb =3D found_port->parent;
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:3140:2: note: Loop condition is tr=
ue. Execution continues on line 3141
           do {
           ^
   drivers/gpu/drm/drm_dp_mst_topology.c:3141:55: note: Passing null pointe=
r value via 1st parameter 'mstb'
                   found_port =3D drm_dp_get_last_connected_port_to_mstb(ms=
tb);
                                                                       ^~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:3141:16: note: Calling 'drm_dp_get=
_last_connected_port_to_mstb'
                   found_port =3D drm_dp_get_last_connected_port_to_mstb(ms=
tb);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:3111:7: note: Access to field 'por=
t_parent' results in a dereference of a null pointer (loaded from variable =
'mstb')
           if (!mstb->port_parent)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/pci/ddbridge/ddbridge-main.c:215:3: warning: Value stored =
to 'stat' is never read [clang-analyzer-deadcode.DeadStores]
                   stat =3D -ENOMEM;
                   ^      ~~~~~~~
   drivers/media/pci/ddbridge/ddbridge-main.c:215:3: note: Value stored to =
'stat' is never read
                   stat =3D -ENOMEM;
                   ^      ~~~~~~~
   drivers/media/pci/ddbridge/ddbridge-main.c:220:3: warning: Value stored =
to 'stat' is never read [clang-analyzer-deadcode.DeadStores]
                   stat =3D -ENODEV;
                   ^      ~~~~~~~
   drivers/media/pci/ddbridge/ddbridge-main.c:220:3: note: Value stored to =
'stat' is never read
                   stat =3D -ENODEV;
                   ^      ~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/media/pci/ddbridge/ddbridge-core.c:2628:8: warning: Assigned val=
ue is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   data <<=3D shift;
                        ^   ~~~~~
   drivers/media/pci/ddbridge/ddbridge-core.c:2601:6: note: Assuming 'wlen'=
 is <=3D 4
           if (wlen > 4)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/pci/ddbridge/ddbridge-core.c:2601:2: note: '?' condition i=
s false
           if (wlen > 4)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/pci/ddbridge/ddbridge-core.c:2601:6: note: 'wlen' is <=3D 4
           if (wlen > 4)
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
   drivers/media/pci/ddbridge/ddbridge-core.c:2601:2: note: '?' condition i=
s false
           if (wlen > 4)
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
   drivers/media/pci/ddbridge/ddbridge-core.c:2601:2: note: Taking false br=
anch
           if (wlen > 4)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/pci/ddbridge/ddbridge-core.c:2603:9: note: 'wlen' is <=3D 4
           while (wlen > 4) {
                  ^~~~
   drivers/media/pci/ddbridge/ddbridge-core.c:2603:2: note: Loop condition =
is false. Execution continues on line 2612
           while (wlen > 4) {
           ^
   drivers/media/pci/ddbridge/ddbridge-core.c:2612:2: note: Assuming 'rlen'=
 is 0
           if (rlen)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/pci/ddbridge/ddbridge-core.c:2612:2: note: '?' condition i=
s false
           if (rlen)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/pci/ddbridge/ddbridge-core.c:2612:6: note: 'rlen' is 0
           if (rlen)
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
   drivers/media/pci/ddbridge/ddbridge-core.c:2612:2: note: '?' condition i=
s false
           if (rlen)
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
   drivers/media/pci/ddbridge/ddbridge-core.c:2612:2: note: Taking false br=
anch
           if (rlen)

vim +49 drivers/cpufreq/cpufreq-dt.c

21c36d35711d24 Bartlomiej Zolnierkiewicz 2015-08-07  44  =

dc279ac6e5b4e0 Stephan Gerhold           2020-07-27  45  static struct priv=
ate_data *cpufreq_dt_find_data(int cpu)
dc279ac6e5b4e0 Stephan Gerhold           2020-07-27  46  {
dc279ac6e5b4e0 Stephan Gerhold           2020-07-27  47  	struct private_da=
ta *priv;
dc279ac6e5b4e0 Stephan Gerhold           2020-07-27  48  =

dc279ac6e5b4e0 Stephan Gerhold           2020-07-27 @49  	list_for_each_ent=
ry(priv, &priv_list, node) {
dc279ac6e5b4e0 Stephan Gerhold           2020-07-27  50  		if (cpumask_test=
_cpu(cpu, priv->cpus))
dc279ac6e5b4e0 Stephan Gerhold           2020-07-27  51  			return priv;
dc279ac6e5b4e0 Stephan Gerhold           2020-07-27  52  	}
dc279ac6e5b4e0 Stephan Gerhold           2020-07-27  53  =

dc279ac6e5b4e0 Stephan Gerhold           2020-07-27  54  	return NULL;
dc279ac6e5b4e0 Stephan Gerhold           2020-07-27  55  }
dc279ac6e5b4e0 Stephan Gerhold           2020-07-27  56  =


:::::: The code at line 49 was first introduced by commit
:::::: dc279ac6e5b4e06ec9c15b82e30e8bf2576b14f9 cpufreq: dt: Refactor initi=
alization to handle probe deferral properly

:::::: TO: Stephan Gerhold <stephan@gerhold.net>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1560945777528836969==--

