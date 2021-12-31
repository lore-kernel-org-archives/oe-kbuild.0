Content-Type: multipart/mixed; boundary="===============3056034868022987696=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: security/keys/dh.c:400:2: warning: Potential leak of memory pointed to by 'outbuf' [clang-analyzer-unix.Malloc]
Date: Sat, 01 Jan 2022 05:02:27 +0800
Message-ID: <202201010451.8UTyZYpc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3056034868022987696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4f3d93c6eaff6b84e43b63e0d7a119c5920e1020
commit: a52f8a59aef46b59753e583bf4b28fccb069ce64 fortify: Explicitly disabl=
e Clang support
date:   3 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-c001-20211231 (https://download.01.org/0day-ci/arch=
ive/20220101/202201010451.8UTyZYpc-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 441de7=
5f69e975b0c7690044560520f8538b4efb)
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
                         ^
   arch/x86/kernel/cpu/intel.c:919:3: note: Loop condition is true.  Enteri=
ng loop body
                   for (j =3D 0 ; j < 3 ; j++)
                   ^
   arch/x86/kernel/cpu/intel.c:920:4: note: '?' condition is false
                           if (regs[j] & (1 << 31))
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   arch/x86/kernel/cpu/intel.c:920:4: note: Assuming the condition is false
                           if (regs[j] & (1 << 31))
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
   arch/x86/kernel/cpu/intel.c:920:4: note: '?' condition is false
                           if (regs[j] & (1 << 31))
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
   arch/x86/kernel/cpu/intel.c:920:4: note: Taking false branch
                           if (regs[j] & (1 << 31))
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   arch/x86/kernel/cpu/intel.c:919:3: note: Loop condition is true.  Enteri=
ng loop body
                   for (j =3D 0 ; j < 3 ; j++)
                   ^
   arch/x86/kernel/cpu/intel.c:920:4: note: '?' condition is false
                           if (regs[j] & (1 << 31))
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   arch/x86/kernel/cpu/intel.c:920:4: note: Assuming the condition is false
                           if (regs[j] & (1 << 31))
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
   arch/x86/kernel/cpu/intel.c:920:4: note: '?' condition is false
                           if (regs[j] & (1 << 31))
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
   arch/x86/kernel/cpu/intel.c:920:4: note: Taking false branch
                           if (regs[j] & (1 << 31))
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   arch/x86/kernel/cpu/intel.c:919:3: note: Loop condition is false. Execut=
ion continues on line 924
                   for (j =3D 0 ; j < 3 ; j++)
                   ^
   arch/x86/kernel/cpu/intel.c:924:8: note: The value 1 is assigned to 'j'
                   for (j =3D 1 ; j < 16 ; j++)
                        ^~~~~
   arch/x86/kernel/cpu/intel.c:924:3: note: Loop condition is true.  Enteri=
ng loop body
                   for (j =3D 1 ; j < 16 ; j++)
                   ^
   arch/x86/kernel/cpu/intel.c:925:4: note: 1st function call argument is a=
n uninitialized value
                           intel_tlb_lookup(desc[j]);
                           ^                ~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> security/keys/dh.c:400:2: warning: Potential leak of memory pointed to b=
y 'outbuf' [clang-analyzer-unix.Malloc]
           crypto_free_kpp(tfm);
           ^
   security/keys/dh.c:245:6: note: Assuming 'params' is non-null
           if (!params || (!buffer && buflen)) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/keys/dh.c:245:6: note: Left side of '||' is false
           if (!params || (!buffer && buflen)) {
               ^
   security/keys/dh.c:245:18: note: Assuming 'buffer' is null
           if (!params || (!buffer && buflen)) {
                           ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/keys/dh.c:245:18: note: Left side of '&&' is true
           if (!params || (!buffer && buflen)) {
                           ^
   security/keys/dh.c:245:2: note: Assuming the condition is true
           if (!params || (!buffer && buflen)) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/keys/dh.c:245:2: note: '?' condition is false
           if (!params || (!buffer && buflen)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/keys/dh.c:245:7: note: 'params' is non-null
           if (!params || (!buffer && buflen)) {
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
   security/keys/dh.c:245:6: note: Left side of '||' is false
           if (!params || (!buffer && buflen)) {
               ^
   security/keys/dh.c:245:19: note: 'buffer' is null
           if (!params || (!buffer && buflen)) {
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
   security/keys/dh.c:245:18: note: Left side of '&&' is true
           if (!params || (!buffer && buflen)) {
                           ^
   security/keys/dh.c:245:2: note: '?' condition is false
           if (!params || (!buffer && buflen)) {
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
   security/keys/dh.c:245:2: note: Taking false branch
           if (!params || (!buffer && buflen)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/dh.c:249:2: note: '?' condition is false
           if (copy_from_user(&pcopy, params, sizeof(pcopy)) !=3D 0) {
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
   drivers/char/ipmi/ipmi_msghandler.c:711:2: note: Memory is released
           kfree(intf);
           ^~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:4682:4: note: Returning; memory was =
released
                           kref_put(&intf->refcount, intf_free);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:4693:2: note: Calling 'spinlock_chec=
k'
           spin_lock_irqsave(&intf->seq_lock, flags);
           ^
   include/linux/spinlock.h:393:24: note: expanded from macro 'spin_lock_ir=
qsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:256:34: note: expanded from macro 'raw_spin_loc=
k_irqsave'
                   flags =3D _raw_spin_lock_irqsave(lock);   \
                                                  ^~~~
   include/linux/spinlock.h:338:2: note: Use of memory after it is freed
           return &lock->rlock;
           ^      ~~~~~~~~~~~~
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
   3 warnings generated.
   drivers/video/backlight/qcom-wled.c:1124:3: warning: Value stored to 'rc=
' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D regmap_update_bits(wled->regmap, addr,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/qcom-wled.c:1124:3: note: Value stored to 'rc' i=
s never read
                   rc =3D regmap_update_bits(wled->regmap, addr,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   3 warnings generated.
   drivers/input/touchscreen/elants_i2c.c:137:8: warning: Excessive padding=
 in 'struct elants_data' (44 padding bytes, where 12 is optimal). =

   Optimal fields order: =

   buf, =

   test_version, =

   fw_version, =

   client, =

   input, =

   vcc33, =

   vccio, =

   reset_gpio, =

   x_res, =

   y_res, =

   x_max, =

   y_max, =

   phy_x, =

   phy_y, =

   state, =

   chip_id, =

   iap_mode, =

   prop, =

   cmd_done, =

   sysfs_mutex, =

   hw_version, =

   solution_version, =

   bc_version, =

   iap_version, =

   major_res, =

   wake_irq_enabled, =

   keep_power_in_suspend, =

   cmd_resp, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct elants_data {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/input/touchscreen/elants_i2c.c:137:8: note: Excessive padding in=
 'struct elants_data' (44 padding bytes, where 12 is optimal). Optimal fiel=
ds order: buf, test_version, fw_version, client, input, vcc33, vccio, reset=
_gpio, x_res, y_res, x_max, y_max, phy_x, phy_y, state, chip_id, iap_mode, =
prop, cmd_done, sysfs_mutex, hw_version, solution_version, bc_version, iap_=
version, major_res, wake_irq_enabled, keep_power_in_suspend, cmd_resp, cons=
ider reordering the fields or adding explicit padding members
   struct elants_data {
   ~~~~~~~^~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> fs/pstore/ram.c:244:30: warning: The left expression of the compound ass=
ignment is an uninitialized value. The computed value will also be garbage =
[clang-analyzer-core.uninitialized.Assign]
                                   tmp_prz->corrected_bytes +=3D
                                   ~~~~~~~~~~~~~~~~~~~~~~~~ ^
   fs/pstore/ram.c:194:9: note: Assuming field 'dump_read_cnt' is >=3D fiel=
d 'max_dump_cnt'
           while (cxt->dump_read_cnt < cxt->max_dump_cnt && !prz) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/pstore/ram.c:194:48: note: Left side of '&&' is false
           while (cxt->dump_read_cnt < cxt->max_dump_cnt && !prz) {
                                                         ^
   fs/pstore/ram.c:210:6: note: Left side of '&&' is true
           if (!prz_ok(prz) && !cxt->console_read_cnt++)
               ^
   fs/pstore/ram.c:210:22: note: Assuming the condition is false
           if (!prz_ok(prz) && !cxt->console_read_cnt++)
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/pstore/ram.c:210:2: note: '?' condition is false
           if (!prz_ok(prz) && !cxt->console_read_cnt++)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/pstore/ram.c:210:6: note: Left side of '&&' is true
           if (!prz_ok(prz) && !cxt->console_read_cnt++)
               ^
   fs/pstore/ram.c:210:22: note: Assuming the condition is false
           if (!prz_ok(prz) && !cxt->console_read_cnt++)
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
   fs/pstore/ram.c:210:2: note: '?' condition is false
           if (!prz_ok(prz) && !cxt->console_read_cnt++)
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
   fs/pstore/ram.c:210:2: note: Taking false branch
           if (!prz_ok(prz) && !cxt->console_read_cnt++)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/pstore/ram.c:213:6: note: Left side of '&&' is true
           if (!prz_ok(prz) && !cxt->pmsg_read_cnt++)
               ^
   fs/pstore/ram.c:213:22: note: Assuming the condition is true
           if (!prz_ok(prz) && !cxt->pmsg_read_cnt++)
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/pstore/ram.c:213:2: note: '?' condition is false
           if (!prz_ok(prz) && !cxt->pmsg_read_cnt++)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/pstore/ram.c:213:6: note: Left side of '&&' is true
           if (!prz_ok(prz) && !cxt->pmsg_read_cnt++)
               ^
   fs/pstore/ram.c:213:2: note: '?' condition is false
           if (!prz_ok(prz) && !cxt->pmsg_read_cnt++)
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
   fs/pstore/ram.c:213:2: note: Taking false branch
           if (!prz_ok(prz) && !cxt->pmsg_read_cnt++)
--
                         ^
   net/ipv4/tcp_ipv4.c:2915:6: note: Assuming field 'skc_state' is equal to=
 TCP_TIME_WAIT
           if (sk->sk_state =3D=3D TCP_TIME_WAIT) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/ipv4/tcp_ipv4.c:2915:2: note: '?' condition is false
           if (sk->sk_state =3D=3D TCP_TIME_WAIT) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/ipv4/tcp_ipv4.c:2915:10: note: Field 'skc_state' is equal to TCP_TIM=
E_WAIT
           if (sk->sk_state =3D=3D TCP_TIME_WAIT) {
                   ^
   include/net/sock.h:376:31: note: expanded from macro 'sk_state'
   #define sk_state                __sk_common.skc_state
                                               ^
   net/ipv4/tcp_ipv4.c:2915:2: note: '?' condition is true
           if (sk->sk_state =3D=3D TCP_TIME_WAIT) {
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
   net/ipv4/tcp_ipv4.c:2915:2: note: Taking true branch
           if (sk->sk_state =3D=3D TCP_TIME_WAIT) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/ipv4/tcp_ipv4.c:2931:2: note: Assuming the condition is false
           if (sk_fullsock(sk))
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/ipv4/tcp_ipv4.c:2931:2: note: '?' condition is false
           if (sk_fullsock(sk))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/ipv4/tcp_ipv4.c:2931:2: note: '?' condition is true
           if (sk_fullsock(sk))
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
   net/ipv4/tcp_ipv4.c:2931:2: note: Taking true branch
           if (sk_fullsock(sk))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/ipv4/tcp_ipv4.c:2932:3: note: 2nd function call argument is an unini=
tialized value
                   unlock_sock_fast(sk, slow);
                   ^                    ~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   kernel/kallsyms.c:436:3: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(buffer, name);
                   ^~~~~~
   kernel/kallsyms.c:436:3: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                   strcpy(buffer, name);
                   ^~~~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/media/dvb-frontends/au8522_common.c:111:56: warning: The express=
ion is an uninitialized value. The computed value will also be garbage [cla=
ng-analyzer-core.uninitialized.Assign]
           ret =3D hybrid_tuner_request_state(struct au8522_state, (*state),
                                                                 ^
   drivers/media/tuners/tuner-i2c.h:146:3: note: expanded from macro 'hybri=
d_tuner_request_state'
                   state->i2c_props.count++;                               \
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/au8522_common.c:111:8: note: Left side of '&=
&' is false
           ret =3D hybrid_tuner_request_state(struct au8522_state, (*state),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
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
   drivers/media/dvb-frontends/au8522_common.c:111:8: note: '?' condition i=
s true
           ret =3D hybrid_tuner_request_state(struct au8522_state, (*state),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/media/dvb-frontends/au8522_common.c:111:8: note: Left side of '&=
&' is false
           ret =3D hybrid_tuner_request_state(struct au8522_state, (*state),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
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
   drivers/media/dvb-frontends/au8522_common.c:111:8: note: Taking false br=
anch
           ret =3D hybrid_tuner_request_state(struct au8522_state, (*state),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/media/dvb-frontends/au8522_common.c:111:8: note: Loop condition =
is false.  Exiting loop
           ret =3D hybrid_tuner_request_state(struct au8522_state, (*state),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
--
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:69:2: note: '=
?' condition is false
           if (IS_ERR(st))
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
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:69:2: note: T=
aking false branch
           if (IS_ERR(st))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:72:2: note: A=
ssuming the condition is false
           if (is_switching_user(crtc, st->crtc)) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:72:2: note: '=
?' condition is false
           if (is_switching_user(crtc, st->crtc)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:72:2: note: A=
ssuming the condition is false
           if (is_switching_user(crtc, st->crtc)) {
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
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:72:2: note: '=
?' condition is true
           if (is_switching_user(crtc, st->crtc)) {
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
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:72:2: note: T=
aking true branch
           if (is_switching_user(crtc, st->crtc)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:74:21: note: =
Passing null pointer value via 1st parameter 'crtc'
                                    drm_crtc_index(crtc), pipe->id);
                                                   ^
   include/drm/drm_print.h:516:34: note: expanded from macro 'DRM_DEBUG_ATO=
MIC'
           __drm_dbg(DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
                                           ^~~~~~~~~~~
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:74:6: note: C=
alling 'drm_crtc_index'
                                    drm_crtc_index(crtc), pipe->id);
                                    ^
   include/drm/drm_print.h:516:34: note: expanded from macro 'DRM_DEBUG_ATO=
MIC'
           __drm_dbg(DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
                                           ^~~~~~~~~~~
   include/drm/drm_crtc.h:1268:9: note: Access to field 'index' results in =
a dereference of a null pointer (loaded from variable 'crtc')
           return crtc->index;
                  ^~~~
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
   3 warnings generated.
>> drivers/media/tuners/mxl5007t.c:853:63: warning: The expression is an un=
initialized value. The computed value will also be garbage [clang-analyzer-=
core.uninitialized.Assign]
           instance =3D hybrid_tuner_request_state(struct mxl5007t_state, s=
tate,
                                                                        ^
   drivers/media/tuners/tuner-i2c.h:146:3: note: expanded from macro 'hybri=
d_tuner_request_state'
                   state->i2c_props.count++;                               \
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mxl5007t.c:853:13: note: Left side of '&&' is false
           instance =3D hybrid_tuner_request_state(struct mxl5007t_state, s=
tate,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
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
   drivers/media/tuners/mxl5007t.c:853:13: note: '?' condition is true
           instance =3D hybrid_tuner_request_state(struct mxl5007t_state, s=
tate,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/media/tuners/mxl5007t.c:853:13: note: Left side of '&&' is false
           instance =3D hybrid_tuner_request_state(struct mxl5007t_state, s=
tate,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
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
   drivers/media/tuners/mxl5007t.c:853:13: note: Taking false branch
           instance =3D hybrid_tuner_request_state(struct mxl5007t_state, s=
tate,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/media/tuners/mxl5007t.c:853:13: note: Loop condition is false.  =
Exiting loop
           instance =3D hybrid_tuner_request_state(struct mxl5007t_state, s=
tate,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
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
   drivers/media/tuners/max2165.c:65:2: note: Taking true branch
           if (ret !=3D 2) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/tuners/max2165.c:66:3: note: Assuming 'debug' is 0
                   dprintk("%s: error reg=3D0x%x, ret=3D%i\n", __func__, re=
g, ret);
                   ^
   drivers/media/tuners/max2165.c:24:3: note: expanded from macro 'dprintk'
                   if (debug) \
                   ^~~~~~~~~~
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/tuners/max2165.c:66:3: note: '?' condition is false
                   dprintk("%s: error reg=3D0x%x, ret=3D%i\n", __func__, re=
g, ret);
                   ^
   drivers/media/tuners/max2165.c:24:3: note: expanded from macro 'dprintk'
                   if (debug) \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/tuners/max2165.c:66:3: note: 'debug' is 0
                   dprintk("%s: error reg=3D0x%x, ret=3D%i\n", __func__, re=
g, ret);
                   ^
   drivers/media/tuners/max2165.c:24:7: note: expanded from macro 'dprintk'
                   if (debug) \
                       ^~~~~
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
   drivers/media/tuners/max2165.c:66:3: note: '?' condition is false
                   dprintk("%s: error reg=3D0x%x, ret=3D%i\n", __func__, re=
g, ret);
                   ^
   drivers/media/tuners/max2165.c:24:3: note: expanded from macro 'dprintk'
                   if (debug) \
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
   drivers/media/tuners/max2165.c:66:3: note: Taking false branch
                   dprintk("%s: error reg=3D0x%x, ret=3D%i\n", __func__, re=
g, ret);
                   ^
   drivers/media/tuners/max2165.c:24:3: note: expanded from macro 'dprintk'
                   if (debug) \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/tuners/max2165.c:66:3: note: Loop condition is false.  Exi=
ting loop
                   dprintk("%s: error reg=3D0x%x, ret=3D%i\n", __func__, re=
g, ret);
                   ^
   drivers/media/tuners/max2165.c:23:2: note: expanded from macro 'dprintk'
           do { \
           ^
   drivers/media/tuners/max2165.c:67:3: note: Returning without writing to =
'*p_data'
                   return -EIO;
                   ^
   drivers/media/tuners/max2165.c:101:3: note: Returning from 'max2165_read=
_reg'
                   max2165_read_reg(priv, REG_ROM_TABLE_DATA, &dat[i]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/max2165.c:99:2: note: Loop condition is false. Exec=
ution continues on line 104
           for (i =3D 0; i < 3; i++) {
           ^
   drivers/media/tuners/max2165.c:108:36: note: The left operand of '&' is =
a garbage value
           priv->bb_filter_7mhz_cfg =3D dat[2] & 0x0F;
                                      ~~~~~~ ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/media/dvb-frontends/cx24117.c:1133:56: warning: The expression i=
s an uninitialized value. The computed value will also be garbage [clang-an=
alyzer-core.uninitialized.Assign]
           ret =3D hybrid_tuner_request_state(struct cx24117_priv, (*priv),
                                                                 ^
   drivers/media/tuners/tuner-i2c.h:146:3: note: expanded from macro 'hybri=
d_tuner_request_state'
                   state->i2c_props.count++;                               \
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cx24117.c:1133:8: note: Left side of '&&' is=
 false
           ret =3D hybrid_tuner_request_state(struct cx24117_priv, (*priv),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
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
   drivers/media/dvb-frontends/cx24117.c:1133:8: note: '?' condition is true
           ret =3D hybrid_tuner_request_state(struct cx24117_priv, (*priv),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/media/dvb-frontends/cx24117.c:1133:8: note: Left side of '&&' is=
 false
           ret =3D hybrid_tuner_request_state(struct cx24117_priv, (*priv),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
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
   drivers/media/dvb-frontends/cx24117.c:1133:8: note: Taking false branch
           ret =3D hybrid_tuner_request_state(struct cx24117_priv, (*priv),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/media/dvb-frontends/cx24117.c:1133:8: note: Loop condition is fa=
lse.  Exiting loop
           ret =3D hybrid_tuner_request_state(struct cx24117_priv, (*priv),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
--
   drivers/mtd/ubi/vtbl.c:531:3: note: '?' condition is true
                   if (be32_to_cpu(vtbl[i].reserved_pebs) =3D=3D 0)
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
   drivers/mtd/ubi/vtbl.c:531:3: note: Taking true branch
                   if (be32_to_cpu(vtbl[i].reserved_pebs) =3D=3D 0)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/mtd/ubi/vtbl.c:532:4: note:  Execution continues on line 528
                           continue; /* Empty record */
                           ^
   drivers/mtd/ubi/vtbl.c:528:14: note: Assuming 'i' is >=3D field 'vtbl_sl=
ots'
           for (i =3D 0; i < ubi->vtbl_slots; i++) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/mtd/ubi/vtbl.c:528:2: note: Loop condition is false. Execution c=
ontinues on line 626
           for (i =3D 0; i < ubi->vtbl_slots; i++) {
           ^
   drivers/mtd/ubi/vtbl.c:626:8: note: Calling 'kzalloc'
           vol =3D kzalloc(sizeof(struct ubi_volume), GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Uninitialized value stored to field 'd=
ata_pad'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/ubi/vtbl.c:626:8: note: Returning from 'kzalloc'
           vol =3D kzalloc(sizeof(struct ubi_volume), GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/ubi/vtbl.c:627:6: note: Assuming 'vol' is non-null
           if (!vol)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/mtd/ubi/vtbl.c:627:2: note: '?' condition is false
           if (!vol)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/mtd/ubi/vtbl.c:627:7: note: 'vol' is non-null
           if (!vol)
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
   drivers/mtd/ubi/vtbl.c:627:2: note: '?' condition is false
           if (!vol)
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
   drivers/mtd/ubi/vtbl.c:627:2: note: Taking false branch
           if (!vol)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/mtd/ubi/vtbl.c:639:45: note: The right operand of '-' is a garba=
ge value
                   (long long)vol->used_ebs * (ubi->leb_size - vol->data_pa=
d);
                                                             ^ ~~~~~~~~~~~~~
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/tuners/tda18271-fe.c:473:2: warning: Value stored to 'bcal=
' is never read [clang-analyzer-deadcode.DeadStores]
           bcal =3D 0;
           ^      ~
   drivers/media/tuners/tda18271-fe.c:473:2: note: Value stored to 'bcal' i=
s never read
           bcal =3D 0;
           ^      ~
>> drivers/media/tuners/tda18271-fe.c:1255:62: warning: The expression is a=
n uninitialized value. The computed value will also be garbage [clang-analy=
zer-core.uninitialized.Assign]
           instance =3D hybrid_tuner_request_state(struct tda18271_priv, pr=
iv,
                                                                       ^
   drivers/media/tuners/tuner-i2c.h:146:3: note: expanded from macro 'hybri=
d_tuner_request_state'
                   state->i2c_props.count++;                               \
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/tda18271-fe.c:1255:13: note: Left side of '&&' is f=
alse
           instance =3D hybrid_tuner_request_state(struct tda18271_priv, pr=
iv,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
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
   drivers/media/tuners/tda18271-fe.c:1255:13: note: '?' condition is true
           instance =3D hybrid_tuner_request_state(struct tda18271_priv, pr=
iv,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/media/tuners/tda18271-fe.c:1255:13: note: Left side of '&&' is f=
alse
           instance =3D hybrid_tuner_request_state(struct tda18271_priv, pr=
iv,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
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
   drivers/media/tuners/tda18271-fe.c:1255:13: note: Taking false branch
           instance =3D hybrid_tuner_request_state(struct tda18271_priv, pr=
iv,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/media/tuners/tda18271-fe.c:1255:13: note: Loop condition is fals=
e.  Exiting loop
           instance =3D hybrid_tuner_request_state(struct tda18271_priv, pr=
iv,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
--
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_util.c:78:2: note: '?' condition is true
           if (map_bankwidth_is_large(map)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/mtd/chips/cfi_util.c:78:2: note: Taking false branch
           if (map_bankwidth_is_large(map)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/mtd/chips/cfi_util.c:91:2: note: Control jumps to 'case 4:'  at =
line 99
           switch (chip_mode) {
           ^
   drivers/mtd/chips/cfi_util.c:100:12: note: '?' condition is true
                   onecmd =3D cpu_to_cfi32(map, cmd);
                            ^
   include/linux/mtd/cfi_endian.h:30:30: note: expanded from macro 'cpu_to_=
cfi32'
   #define cpu_to_cfi32(map, x) _cpu_to_cfi(32, (map)->swap, (x))
                                ^
   include/linux/mtd/cfi_endian.h:36:31: note: expanded from macro '_cpu_to=
_cfi'
   #define _cpu_to_cfi(w, s, x) (cfi_host(s)?(x):_swap_to_cfi(w, s, x))
                                 ^
   include/linux/mtd/cfi_endian.h:25:22: note: expanded from macro 'cfi_hos=
t'
   #define cfi_host(s) (cfi_default(s) =3D=3D CFI_HOST_ENDIAN)
                        ^
   include/linux/mtd/cfi_endian.h:22:25: note: expanded from macro 'cfi_def=
ault'
   #define cfi_default(s) ((s)?:CFI_DEFAULT_ENDIAN)
                           ^
   drivers/mtd/chips/cfi_util.c:100:12: note: Assuming the condition is true
                   onecmd =3D cpu_to_cfi32(map, cmd);
                            ^
   include/linux/mtd/cfi_endian.h:30:30: note: expanded from macro 'cpu_to_=
cfi32'
   #define cpu_to_cfi32(map, x) _cpu_to_cfi(32, (map)->swap, (x))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/cfi_endian.h:36:31: note: expanded from macro '_cpu_to=
_cfi'
   #define _cpu_to_cfi(w, s, x) (cfi_host(s)?(x):_swap_to_cfi(w, s, x))
                                 ^~~~~~~~~~~
   include/linux/mtd/cfi_endian.h:25:22: note: expanded from macro 'cfi_hos=
t'
   #define cfi_host(s) (cfi_default(s) =3D=3D CFI_HOST_ENDIAN)
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/cfi_endian.h:22:24: note: expanded from macro 'cfi_def=
ault'
   #define cfi_default(s) ((s)?:CFI_DEFAULT_ENDIAN)
                          ^
   drivers/mtd/chips/cfi_util.c:100:12: note: '?' condition is true
                   onecmd =3D cpu_to_cfi32(map, cmd);
                            ^
   include/linux/mtd/cfi_endian.h:30:30: note: expanded from macro 'cpu_to_=
cfi32'
   #define cpu_to_cfi32(map, x) _cpu_to_cfi(32, (map)->swap, (x))
                                ^
   include/linux/mtd/cfi_endian.h:36:31: note: expanded from macro '_cpu_to=
_cfi'
   #define _cpu_to_cfi(w, s, x) (cfi_host(s)?(x):_swap_to_cfi(w, s, x))
                                 ^
   include/linux/mtd/cfi_endian.h:25:21: note: expanded from macro 'cfi_hos=
t'
   #define cfi_host(s) (cfi_default(s) =3D=3D CFI_HOST_ENDIAN)
                       ^
   drivers/mtd/chips/cfi_util.c:101:3: note:  Execution continues on line 1=
06
                   break;
                   ^
   drivers/mtd/chips/cfi_util.c:106:2: note: Control jumps to 'case 2:'  at=
 line 116
           switch (chips_per_word) {
           ^
   drivers/mtd/chips/cfi_util.c:117:21: note: The result of the left shift =
is undefined due to shifting by '32', which is greater or equal to the widt=
h of type 'unsigned long'
                   onecmd |=3D (onecmd << (chip_mode * 8));
                                     ^  ~~~~~~~~~~~~~~~
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
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/gpu/drm/drm_atomic.c:106:2: warning: Attempt to free released me=
mory [clang-analyzer-unix.Malloc]
           kfree(state->connectors);
           ^
   drivers/gpu/drm/drm_atomic.c:163:6: note: Assuming field 'atomic_state_a=
lloc' is null
           if (!config->funcs->atomic_state_alloc) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/gpu/drm/drm_atomic.c:163:2: note: '?' condition is false
           if (!config->funcs->atomic_state_alloc) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/gpu/drm/drm_atomic.c:163:22: note: Field 'atomic_state_alloc' is=
 null
           if (!config->funcs->atomic_state_alloc) {
                               ^
   drivers/gpu/drm/drm_atomic.c:163:2: note: '?' condition is true
           if (!config->funcs->atomic_state_alloc) {
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
   drivers/gpu/drm/drm_atomic.c:163:2: note: Taking true branch
           if (!config->funcs->atomic_state_alloc) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/gpu/drm/drm_atomic.c:167:7: note: Assuming 'state' is non-null
                   if (!state)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/gpu/drm/drm_atomic.c:167:3: note: '?' condition is false
                   if (!state)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/gpu/drm/drm_atomic.c:167:8: note: 'state' is non-null
                   if (!state)
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
   drivers/gpu/drm/drm_atomic.c:167:3: note: '?' condition is false
                   if (!state)
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
   drivers/gpu/drm/drm_atomic.c:167:3: note: Taking false branch
                   if (!state)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/gpu/drm/drm_atomic.c:169:7: note: Calling 'drm_atomic_state_init'
                   if (drm_atomic_state_init(dev, state) < 0) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/gpu/drm/drm_atomic.c:134:2: note: '?' condition is false
           if (!state->crtcs)
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
   net/sunrpc/auth_gss/auth_gss.c:1004:6: note: Assuming the condition is f=
alse
           if (!try_module_get(THIS_MODULE))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
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
   net/sunrpc/auth_gss/auth_gss.c:1004:6: note: Assuming the condition is f=
alse
           if (!try_module_get(THIS_MODULE))
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
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
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
   security/keys/encrypted-keys/encrypted.c:420:9: note: Taking true branch
           } else if (!strncmp(epayload->master_desc, KEY_USER_PREFIX,
                  ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/encrypted-keys/encrypted.c:422:10: note: Calling 'request_=
user_key'
                   mkey =3D request_user_key(epayload->master_desc +
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/encrypted-keys/encrypted.c:308:2: note: Assuming the condi=
tion is false
           if (IS_ERR(ukey))
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/keys/encrypted-keys/encrypted.c:308:2: note: '?' condition is f=
alse
           if (IS_ERR(ukey))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/keys/encrypted-keys/encrypted.c:308:2: note: Assuming the condi=
tion is false
           if (IS_ERR(ukey))
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
   security/keys/encrypted-keys/encrypted.c:308:2: note: '?' condition is t=
rue
           if (IS_ERR(ukey))
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
   security/keys/encrypted-keys/encrypted.c:308:2: note: Taking true branch
           if (IS_ERR(ukey))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/encrypted-keys/encrypted.c:309:3: note: Control jumps to l=
ine 323
                   goto error;
                   ^
   security/keys/encrypted-keys/encrypted.c:422:10: note: Returning from 'r=
equest_user_key'
                   mkey =3D request_user_key(epayload->master_desc +
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/encrypted-keys/encrypted.c:428:2: note: '?' condition is f=
alse
           if (IS_ERR(mkey)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/keys/encrypted-keys/encrypted.c:428:2: note: '?' condition is f=
alse
           if (IS_ERR(mkey)) {
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
   security/keys/encrypted-keys/encrypted.c:428:2: note: Taking false branch
           if (IS_ERR(mkey)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/encrypted-keys/encrypted.c:440:2: note: 1st function call =
argument is an uninitialized value
           dump_master_key(*master_key, *master_keylen);
           ^               ~~~~~~~~~~~
>> security/keys/encrypted-keys/encrypted.c:821:2: warning: Potential leak =
of memory pointed to by 'epayload' [clang-analyzer-unix.Malloc]
           kfree_sensitive(datablob);
           ^
   security/keys/encrypted-keys/encrypted.c:793:6: note: Assuming 'datalen'=
 is > 0
           if (datalen <=3D 0 || datalen > 32767 || !prep->data)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/keys/encrypted-keys/encrypted.c:793:6: note: Left side of '||' =
is false
           if (datalen <=3D 0 || datalen > 32767 || !prep->data)
               ^
   security/keys/encrypted-keys/encrypted.c:793:22: note: Assuming 'datalen=
' is <=3D 32767
           if (datalen <=3D 0 || datalen > 32767 || !prep->data)
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/keys/encrypted-keys/encrypted.c:793:6: note: Left side of '||' =
is false
           if (datalen <=3D 0 || datalen > 32767 || !prep->data)
               ^
   security/keys/encrypted-keys/encrypted.c:793:41: note: Assuming field 'd=
ata' is non-null
           if (datalen <=3D 0 || datalen > 32767 || !prep->data)
                                                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/keys/encrypted-keys/encrypted.c:793:2: note: '?' condition is f=
alse
           if (datalen <=3D 0 || datalen > 32767 || !prep->data)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/keys/encrypted-keys/encrypted.c:793:6: note: 'datalen' is > 0
           if (datalen <=3D 0 || datalen > 32767 || !prep->data)
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
   security/keys/encrypted-keys/encrypted.c:793:6: note: Left side of '||' =
is false
           if (datalen <=3D 0 || datalen > 32767 || !prep->data)
               ^
   security/keys/encrypted-keys/encrypted.c:793:22: note: 'datalen' is <=3D=
 32767
           if (datalen <=3D 0 || datalen > 32767 || !prep->data)
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
   security/keys/encrypted-keys/encrypted.c:793:6: note: Left side of '||' =
is false
           if (datalen <=3D 0 || datalen > 32767 || !prep->data)
               ^
   security/keys/encrypted-keys/encrypted.c:793:48: note: Field 'data' is n=
on-null
           if (datalen <=3D 0 || datalen > 32767 || !prep->data)
                                                         ^
   security/keys/encrypted-keys/encrypted.c:793:2: note: '?' condition is f=
alse
           if (datalen <=3D 0 || datalen > 32767 || !prep->data)
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
   security/keys/encrypted-keys/encrypted.c:793:2: note: Taking false branch
           if (datalen <=3D 0 || datalen > 32767 || !prep->data)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/encrypted-keys/encrypted.c:797:6: note: Assuming 'datablob=
' is non-null
           if (!datablob)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
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
   security/keys/encrypted-keys/encrypted.c:462:2: note: '?' condition is t=
rue
           if (IS_ERR(req))
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
   security/keys/encrypted-keys/encrypted.c:462:2: note: Taking true branch
           if (IS_ERR(req))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/encrypted-keys/encrypted.c:463:3: note: Control jumps to l=
ine 485
                   goto out;
                   ^
   security/keys/encrypted-keys/encrypted.c:930:8: note: Returned allocated=
 memory
           ret =3D derived_key_encrypt(epayload, derived_key, sizeof derive=
d_key);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   security/keys/encrypted-keys/encrypted.c:931:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/keys/encrypted-keys/encrypted.c:931:2: note: '?' condition is f=
alse
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
   security/keys/encrypted-keys/encrypted.c:931:6: note: 'ret' is >=3D 0
           if (ret < 0)
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
   security/keys/encrypted-keys/encrypted.c:931:2: note: '?' condition is f=
alse
           if (ret < 0)
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
   security/keys/encrypted-keys/encrypted.c:931:2: note: Taking false branch
           if (ret < 0)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/encrypted-keys/encrypted.c:935:6: note: Assuming 'ret' is =
>=3D 0
           if (ret < 0)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/keys/encrypted-keys/encrypted.c:935:2: note: Potential leak of =
memory pointed to by 'ret'
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
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/media/tuners/xc5000.c:1378:60: warning: The expression is an uni=
nitialized value. The computed value will also be garbage [clang-analyzer-c=
ore.uninitialized.Assign]
           instance =3D hybrid_tuner_request_state(struct xc5000_priv, priv,
                                                                     ^
   drivers/media/tuners/tuner-i2c.h:146:3: note: expanded from macro 'hybri=
d_tuner_request_state'
                   state->i2c_props.count++;                               \
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/xc5000.c:1372:2: note: Assuming 'debug' is < 1
           dprintk(1, "%s(%d-%04x)\n", __func__,
           ^
   drivers/media/tuners/xc5000.c:36:41: note: expanded from macro 'dprintk'
   #define dprintk(level, fmt, arg...) if (debug >=3D level) \
                                       ~~~~^~~~~~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/tuners/xc5000.c:1372:2: note: '?' condition is false
           dprintk(1, "%s(%d-%04x)\n", __func__,
           ^
   drivers/media/tuners/xc5000.c:36:37: note: expanded from macro 'dprintk'
   #define dprintk(level, fmt, arg...) if (debug >=3D level) \
                                       ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/tuners/xc5000.c:1372:2: note: 'debug' is < 1
           dprintk(1, "%s(%d-%04x)\n", __func__,
           ^
   drivers/media/tuners/xc5000.c:36:41: note: expanded from macro 'dprintk'
   #define dprintk(level, fmt, arg...) if (debug >=3D level) \
                                           ^~~~~
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
   drivers/media/tuners/xc5000.c:1372:2: note: '?' condition is false
           dprintk(1, "%s(%d-%04x)\n", __func__,
           ^
   drivers/media/tuners/xc5000.c:36:37: note: expanded from macro 'dprintk'
   #define dprintk(level, fmt, arg...) if (debug >=3D level) \
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
   drivers/media/tuners/xc5000.c:1372:2: note: Taking false branch
           dprintk(1, "%s(%d-%04x)\n", __func__,
           ^
   drivers/media/tuners/xc5000.c:36:37: note: expanded from macro 'dprintk'
   #define dprintk(level, fmt, arg...) if (debug >=3D level) \
                                       ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/tuners/xc5000.c:1378:13: note: Left side of '&&' is false
           instance =3D hybrid_tuner_request_state(struct xc5000_priv, priv,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
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
   drivers/media/tuners/xc5000.c:1378:13: note: '?' condition is true
           instance =3D hybrid_tuner_request_state(struct xc5000_priv, priv,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
--
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   lib/zstd/fse_compress.c:114:2: warning: Value stored to 'workspace' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           workspace =3D (U32 *)workspace + spaceUsed32;
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/zstd/fse_compress.c:114:2: note: Value stored to 'workspace' is neve=
r read
           workspace =3D (U32 *)workspace + spaceUsed32;
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/zstd/fse_compress.c:115:2: warning: Value stored to 'workspaceSize' =
is never read [clang-analyzer-deadcode.DeadStores]
           workspaceSize -=3D (spaceUsed32 << 2);
           ^                ~~~~~~~~~~~~~~~~~~
   lib/zstd/fse_compress.c:115:2: note: Value stored to 'workspaceSize' is =
never read
           workspaceSize -=3D (spaceUsed32 << 2);
           ^                ~~~~~~~~~~~~~~~~~~
   lib/zstd/fse_compress.c:755:2: warning: Value stored to 'srcSize' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           srcSize -=3D 2;
           ^          ~
   lib/zstd/fse_compress.c:755:2: note: Value stored to 'srcSize' is never =
read
           srcSize -=3D 2;
           ^          ~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/gpu/drm/drm_crtc_helper.c:635:2: warning: Value stored to 'count=
' is never read [clang-analyzer-deadcode.DeadStores]
           count =3D 0;
           ^       ~
   drivers/gpu/drm/drm_crtc_helper.c:635:2: note: Value stored to 'count' i=
s never read
           count =3D 0;
           ^       ~
   drivers/gpu/drm/drm_crtc_helper.c:681:2: warning: Value stored to 'count=
' is never read [clang-analyzer-deadcode.DeadStores]
           count =3D 0;
           ^       ~
   drivers/gpu/drm/drm_crtc_helper.c:681:2: note: Value stored to 'count' i=
s never read
           count =3D 0;
           ^       ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/media/tuners/mt20xx.c:253:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:253:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:263:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:263:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:265:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+5,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:265:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+5,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:383:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+1,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:383:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+1,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:391:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+5,6);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:391:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+5,6);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:395:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+12,2);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:395:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+12,2);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/media/tuners/tda9887.c:684:61: warning: The expression is an uni=
nitialized value. The computed value will also be garbage [clang-analyzer-c=
ore.uninitialized.Assign]
           instance =3D hybrid_tuner_request_state(struct tda9887_priv, pri=
v,
                                                                      ^
   drivers/media/tuners/tuner-i2c.h:146:3: note: expanded from macro 'hybri=
d_tuner_request_state'
                   state->i2c_props.count++;                               \
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/tda9887.c:684:13: note: Left side of '&&' is false
           instance =3D hybrid_tuner_request_state(struct tda9887_priv, pri=
v,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
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
   drivers/media/tuners/tda9887.c:684:13: note: '?' condition is true
           instance =3D hybrid_tuner_request_state(struct tda9887_priv, pri=
v,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/media/tuners/tda9887.c:684:13: note: Left side of '&&' is false
           instance =3D hybrid_tuner_request_state(struct tda9887_priv, pri=
v,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
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
   drivers/media/tuners/tda9887.c:684:13: note: Taking false branch
           instance =3D hybrid_tuner_request_state(struct tda9887_priv, pri=
v,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/media/tuners/tda9887.c:684:13: note: Loop condition is false.  E=
xiting loop
           instance =3D hybrid_tuner_request_state(struct tda9887_priv, pri=
v,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
--
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/crypto/fname.c:367:2: note: Loop condition is false.  Exiting loop
           BUILD_BUG_ON(FSCRYPT_NOKEY_NAME_MAX_ENCODED > NAME_MAX);
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
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
   fs/crypto/fname.c:372:6: note: Assuming the condition is true
           if (iname->len <=3D sizeof(nokey_name.bytes)) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/crypto/fname.c:372:2: note: '?' condition is false
           if (iname->len <=3D sizeof(nokey_name.bytes)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/crypto/fname.c:372:2: note: '?' condition is true
           if (iname->len <=3D sizeof(nokey_name.bytes)) {
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
   fs/crypto/fname.c:372:2: note: Taking true branch
           if (iname->len <=3D sizeof(nokey_name.bytes)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/crypto/fname.c:383:15: note: Calling 'fscrypt_base64url_encode'
           oname->len =3D fscrypt_base64url_encode((const u8 *)&nokey_name,=
 size,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/crypto/fname.c:208:14: note: Assuming 'i' is < 'srclen'
           for (i =3D 0; i < srclen; i++) {
                       ^~~~~~~~~~
   fs/crypto/fname.c:208:2: note: Loop condition is true.  Entering loop bo=
dy
           for (i =3D 0; i < srclen; i++) {
           ^
   fs/crypto/fname.c:211:3: note: Loop condition is false.  Exiting loop
                   do {
                   ^
   fs/crypto/fname.c:208:26: note: The value 1 is assigned to 'i'
           for (i =3D 0; i < srclen; i++) {
                                   ^~~
   fs/crypto/fname.c:208:14: note: Assuming 'i' is < 'srclen'
           for (i =3D 0; i < srclen; i++) {
                       ^~~~~~~~~~
   fs/crypto/fname.c:208:2: note: Loop condition is true.  Entering loop bo=
dy
           for (i =3D 0; i < srclen; i++) {
           ^
   fs/crypto/fname.c:209:18: note: The right operand of '|' is a garbage va=
lue
                   ac =3D (ac << 8) | src[i];
                                  ^ ~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/cifs/smb2pdu.c:577:3: warning: Value stored to 'pneg_ctxt' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   pneg_ctxt +=3D ctxt_len;
                   ^            ~~~~~~~~
   fs/cifs/smb2pdu.c:577:3: note: Value stored to 'pneg_ctxt' is never read
                   pneg_ctxt +=3D ctxt_len;
                   ^            ~~~~~~~~
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
>> fs/cifs/cifsacl.c:267:21: warning: Assigned value is garbage or undefine=
d [clang-analyzer-core.uninitialized.Assign]
                   dst->authority[i] =3D src->authority[i];
                                     ^
   fs/cifs/cifsacl.c:1261:2: note: Assuming 'dacloffset' is not equal to 0
           if (dacloffset) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/cifs/cifsacl.c:1261:2: note: '?' condition is false
           if (dacloffset) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/cifs/cifsacl.c:1261:6: note: 'dacloffset' is not equal to 0
           if (dacloffset) {
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
   fs/cifs/cifsacl.c:1261:2: note: '?' condition is true
           if (dacloffset) {
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
   fs/cifs/cifsacl.c:1261:2: note: Taking true branch
           if (dacloffset) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/cifs/cifsacl.c:1263:3: note: '?' condition is false
                   if (end_of_acl < (char *)dacl_ptr + le16_to_cpu(dacl_ptr=
->size)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/cifs/cifsacl.c:1263:3: note: Assuming the condition is false
                   if (end_of_acl < (char *)dacl_ptr + le16_to_cpu(dacl_ptr=
->size)) {
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
   fs/cifs/cifsacl.c:1263:3: note: '?' condition is false
                   if (end_of_acl < (char *)dacl_ptr + le16_to_cpu(dacl_ptr=
->size)) {
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
   fs/cifs/cifsacl.c:1263:3: note: Taking false branch
                   if (end_of_acl < (char *)dacl_ptr + le16_to_cpu(dacl_ptr=
->size)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/cifs/cifsacl.c:1274:6: note: Assuming 'pnmode' is null
           if (pnmode && *pnmode !=3D NO_CHANGE_64) { /* chmod */
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/cifs/cifsacl.c:1274:13: note: Left side of '&&' is false
           if (pnmode && *pnmode !=3D NO_CHANGE_64) { /* chmod */

vim +/outbuf +400 security/keys/dh.c

f1c316a3ab9d24 Stephan Mueller 2016-08-19  226  =

f1c316a3ab9d24 Stephan Mueller 2016-08-19  227  long __keyctl_dh_compute(st=
ruct keyctl_dh_params __user *params,
f1c316a3ab9d24 Stephan Mueller 2016-08-19  228  			 char __user *buffer, si=
ze_t buflen,
f1c316a3ab9d24 Stephan Mueller 2016-08-19  229  			 struct keyctl_kdf_param=
s *kdfcopy)
ddbb4114872436 Mat Martineau   2016-04-12  230  {
ddbb4114872436 Mat Martineau   2016-04-12  231  	long ret;
7cbe0932c2f201 Mat Martineau   2017-06-08  232  	ssize_t dlen;
7cbe0932c2f201 Mat Martineau   2017-06-08  233  	int secretlen;
7cbe0932c2f201 Mat Martineau   2017-06-08  234  	int outlen;
ddbb4114872436 Mat Martineau   2016-04-12  235  	struct keyctl_dh_params pc=
opy;
7cbe0932c2f201 Mat Martineau   2017-06-08  236  	struct dh dh_inputs;
7cbe0932c2f201 Mat Martineau   2017-06-08  237  	struct scatterlist outsg;
7cbe0932c2f201 Mat Martineau   2017-06-08  238  	struct dh_completion compl;
7cbe0932c2f201 Mat Martineau   2017-06-08  239  	struct crypto_kpp *tfm;
7cbe0932c2f201 Mat Martineau   2017-06-08  240  	struct kpp_request *req;
7cbe0932c2f201 Mat Martineau   2017-06-08  241  	uint8_t *secret;
7cbe0932c2f201 Mat Martineau   2017-06-08  242  	uint8_t *outbuf;
f1c316a3ab9d24 Stephan Mueller 2016-08-19  243  	struct kdf_sdesc *sdesc =
=3D NULL;
ddbb4114872436 Mat Martineau   2016-04-12  244  =

ddbb4114872436 Mat Martineau   2016-04-12  245  	if (!params || (!buffer &&=
 buflen)) {
ddbb4114872436 Mat Martineau   2016-04-12  246  		ret =3D -EINVAL;
7cbe0932c2f201 Mat Martineau   2017-06-08  247  		goto out1;
ddbb4114872436 Mat Martineau   2016-04-12  248  	}
ddbb4114872436 Mat Martineau   2016-04-12  249  	if (copy_from_user(&pcopy,=
 params, sizeof(pcopy)) !=3D 0) {
ddbb4114872436 Mat Martineau   2016-04-12  250  		ret =3D -EFAULT;
7cbe0932c2f201 Mat Martineau   2017-06-08  251  		goto out1;
ddbb4114872436 Mat Martineau   2016-04-12  252  	}
ddbb4114872436 Mat Martineau   2016-04-12  253  =

f1c316a3ab9d24 Stephan Mueller 2016-08-19  254  	if (kdfcopy) {
f1c316a3ab9d24 Stephan Mueller 2016-08-19  255  		char *hashname;
f1c316a3ab9d24 Stephan Mueller 2016-08-19  256  =

4f9dabfaf8df97 Eric Biggers    2017-07-13  257  		if (memchr_inv(kdfcopy->_=
_spare, 0, sizeof(kdfcopy->__spare))) {
4f9dabfaf8df97 Eric Biggers    2017-07-13  258  			ret =3D -EINVAL;
4f9dabfaf8df97 Eric Biggers    2017-07-13  259  			goto out1;
4f9dabfaf8df97 Eric Biggers    2017-07-13  260  		}
4f9dabfaf8df97 Eric Biggers    2017-07-13  261  =

f1c316a3ab9d24 Stephan Mueller 2016-08-19  262  		if (buflen > KEYCTL_KDF_M=
AX_OUTPUT_LEN ||
f1c316a3ab9d24 Stephan Mueller 2016-08-19  263  		    kdfcopy->otherinfolen=
 > KEYCTL_KDF_MAX_OI_LEN) {
f1c316a3ab9d24 Stephan Mueller 2016-08-19  264  			ret =3D -EMSGSIZE;
7cbe0932c2f201 Mat Martineau   2017-06-08  265  			goto out1;
f1c316a3ab9d24 Stephan Mueller 2016-08-19  266  		}
f1c316a3ab9d24 Stephan Mueller 2016-08-19  267  =

f1c316a3ab9d24 Stephan Mueller 2016-08-19  268  		/* get KDF name string */
f1c316a3ab9d24 Stephan Mueller 2016-08-19  269  		hashname =3D strndup_user=
(kdfcopy->hashname, CRYPTO_MAX_ALG_NAME);
f1c316a3ab9d24 Stephan Mueller 2016-08-19  270  		if (IS_ERR(hashname)) {
f1c316a3ab9d24 Stephan Mueller 2016-08-19  271  			ret =3D PTR_ERR(hashname=
);
7cbe0932c2f201 Mat Martineau   2017-06-08  272  			goto out1;
f1c316a3ab9d24 Stephan Mueller 2016-08-19  273  		}
f1c316a3ab9d24 Stephan Mueller 2016-08-19  274  =

f1c316a3ab9d24 Stephan Mueller 2016-08-19  275  		/* allocate KDF from the =
kernel crypto API */
f1c316a3ab9d24 Stephan Mueller 2016-08-19  276  		ret =3D kdf_alloc(&sdesc,=
 hashname);
f1c316a3ab9d24 Stephan Mueller 2016-08-19  277  		kfree(hashname);
f1c316a3ab9d24 Stephan Mueller 2016-08-19  278  		if (ret)
7cbe0932c2f201 Mat Martineau   2017-06-08  279  			goto out1;
4693fc734d675c Stephan Mueller 2016-05-26  280  	}
4693fc734d675c Stephan Mueller 2016-05-26  281  =

7cbe0932c2f201 Mat Martineau   2017-06-08  282  	memset(&dh_inputs, 0, size=
of(dh_inputs));
ddbb4114872436 Mat Martineau   2016-04-12  283  =

7cbe0932c2f201 Mat Martineau   2017-06-08  284  	dlen =3D dh_data_from_key(=
pcopy.prime, &dh_inputs.p);
7cbe0932c2f201 Mat Martineau   2017-06-08  285  	if (dlen < 0) {
7cbe0932c2f201 Mat Martineau   2017-06-08  286  		ret =3D dlen;
7cbe0932c2f201 Mat Martineau   2017-06-08  287  		goto out1;
7cbe0932c2f201 Mat Martineau   2017-06-08  288  	}
7cbe0932c2f201 Mat Martineau   2017-06-08  289  	dh_inputs.p_size =3D dlen;
ddbb4114872436 Mat Martineau   2016-04-12  290  =

7cbe0932c2f201 Mat Martineau   2017-06-08  291  	dlen =3D dh_data_from_key(=
pcopy.base, &dh_inputs.g);
7cbe0932c2f201 Mat Martineau   2017-06-08  292  	if (dlen < 0) {
7cbe0932c2f201 Mat Martineau   2017-06-08  293  		ret =3D dlen;
7cbe0932c2f201 Mat Martineau   2017-06-08  294  		goto out2;
ddbb4114872436 Mat Martineau   2016-04-12  295  	}
7cbe0932c2f201 Mat Martineau   2017-06-08  296  	dh_inputs.g_size =3D dlen;
ddbb4114872436 Mat Martineau   2016-04-12  297  =

8c0f9f5b309d62 Lubomir Rintel  2018-09-24  298  	dlen =3D dh_data_from_key(=
pcopy.private, &dh_inputs.key);
7cbe0932c2f201 Mat Martineau   2017-06-08  299  	if (dlen < 0) {
7cbe0932c2f201 Mat Martineau   2017-06-08  300  		ret =3D dlen;
7cbe0932c2f201 Mat Martineau   2017-06-08  301  		goto out2;
ddbb4114872436 Mat Martineau   2016-04-12  302  	}
7cbe0932c2f201 Mat Martineau   2017-06-08  303  	dh_inputs.key_size =3D dle=
n;
ddbb4114872436 Mat Martineau   2016-04-12  304  =

7cbe0932c2f201 Mat Martineau   2017-06-08  305  	secretlen =3D crypto_dh_ke=
y_len(&dh_inputs);
7cbe0932c2f201 Mat Martineau   2017-06-08  306  	secret =3D kmalloc(secretl=
en, GFP_KERNEL);
7cbe0932c2f201 Mat Martineau   2017-06-08  307  	if (!secret) {
ddbb4114872436 Mat Martineau   2016-04-12  308  		ret =3D -ENOMEM;
7cbe0932c2f201 Mat Martineau   2017-06-08  309  		goto out2;
7cbe0932c2f201 Mat Martineau   2017-06-08  310  	}
7cbe0932c2f201 Mat Martineau   2017-06-08  311  	ret =3D crypto_dh_encode_k=
ey(secret, secretlen, &dh_inputs);
7cbe0932c2f201 Mat Martineau   2017-06-08  312  	if (ret)
7cbe0932c2f201 Mat Martineau   2017-06-08  313  		goto out3;
7cbe0932c2f201 Mat Martineau   2017-06-08  314  =

85d7311f1908b9 Eric Biggers    2018-06-30  315  	tfm =3D crypto_alloc_kpp("=
dh", 0, 0);
7cbe0932c2f201 Mat Martineau   2017-06-08  316  	if (IS_ERR(tfm)) {
7cbe0932c2f201 Mat Martineau   2017-06-08  317  		ret =3D PTR_ERR(tfm);
7cbe0932c2f201 Mat Martineau   2017-06-08  318  		goto out3;
7cbe0932c2f201 Mat Martineau   2017-06-08  319  	}
7cbe0932c2f201 Mat Martineau   2017-06-08  320  =

7cbe0932c2f201 Mat Martineau   2017-06-08  321  	ret =3D crypto_kpp_set_sec=
ret(tfm, secret, secretlen);
7cbe0932c2f201 Mat Martineau   2017-06-08  322  	if (ret)
7cbe0932c2f201 Mat Martineau   2017-06-08  323  		goto out4;
7cbe0932c2f201 Mat Martineau   2017-06-08  324  =

7cbe0932c2f201 Mat Martineau   2017-06-08  325  	outlen =3D crypto_kpp_maxs=
ize(tfm);
7cbe0932c2f201 Mat Martineau   2017-06-08  326  =

7cbe0932c2f201 Mat Martineau   2017-06-08  327  	if (!kdfcopy) {
7cbe0932c2f201 Mat Martineau   2017-06-08  328  		/*
7cbe0932c2f201 Mat Martineau   2017-06-08  329  		 * When not using a KDF, =
buflen 0 is used to read the
7cbe0932c2f201 Mat Martineau   2017-06-08  330  		 * required buffer length
7cbe0932c2f201 Mat Martineau   2017-06-08  331  		 */
7cbe0932c2f201 Mat Martineau   2017-06-08  332  		if (buflen =3D=3D 0) {
7cbe0932c2f201 Mat Martineau   2017-06-08  333  			ret =3D outlen;
7cbe0932c2f201 Mat Martineau   2017-06-08  334  			goto out4;
7cbe0932c2f201 Mat Martineau   2017-06-08  335  		} else if (outlen > bufle=
n) {
7cbe0932c2f201 Mat Martineau   2017-06-08  336  			ret =3D -EOVERFLOW;
7cbe0932c2f201 Mat Martineau   2017-06-08  337  			goto out4;
7cbe0932c2f201 Mat Martineau   2017-06-08  338  		}
ddbb4114872436 Mat Martineau   2016-04-12  339  	}
ddbb4114872436 Mat Martineau   2016-04-12  340  =

7cbe0932c2f201 Mat Martineau   2017-06-08  341  	outbuf =3D kzalloc(kdfcopy=
 ? (outlen + kdfcopy->otherinfolen) : outlen,
f1c316a3ab9d24 Stephan Mueller 2016-08-19  342  			 GFP_KERNEL);
7cbe0932c2f201 Mat Martineau   2017-06-08  343  	if (!outbuf) {
ddbb4114872436 Mat Martineau   2016-04-12  344  		ret =3D -ENOMEM;
7cbe0932c2f201 Mat Martineau   2017-06-08  345  		goto out4;
ddbb4114872436 Mat Martineau   2016-04-12  346  	}
ddbb4114872436 Mat Martineau   2016-04-12  347  =

7cbe0932c2f201 Mat Martineau   2017-06-08  348  	sg_init_one(&outsg, outbuf=
, outlen);
7cbe0932c2f201 Mat Martineau   2017-06-08  349  =

7cbe0932c2f201 Mat Martineau   2017-06-08  350  	req =3D kpp_request_alloc(=
tfm, GFP_KERNEL);
7cbe0932c2f201 Mat Martineau   2017-06-08  351  	if (!req) {
7cbe0932c2f201 Mat Martineau   2017-06-08  352  		ret =3D -ENOMEM;
7cbe0932c2f201 Mat Martineau   2017-06-08  353  		goto out5;
7cbe0932c2f201 Mat Martineau   2017-06-08  354  	}
7cbe0932c2f201 Mat Martineau   2017-06-08  355  =

7cbe0932c2f201 Mat Martineau   2017-06-08  356  	kpp_request_set_input(req,=
 NULL, 0);
7cbe0932c2f201 Mat Martineau   2017-06-08  357  	kpp_request_set_output(req=
, &outsg, outlen);
7cbe0932c2f201 Mat Martineau   2017-06-08  358  	init_completion(&compl.com=
pletion);
7cbe0932c2f201 Mat Martineau   2017-06-08  359  	kpp_request_set_callback(r=
eq, CRYPTO_TFM_REQ_MAY_BACKLOG |
7cbe0932c2f201 Mat Martineau   2017-06-08  360  				 CRYPTO_TFM_REQ_MAY_SLE=
EP,
7cbe0932c2f201 Mat Martineau   2017-06-08  361  				 dh_crypto_done, &compl=
);
7cbe0932c2f201 Mat Martineau   2017-06-08  362  =

7cbe0932c2f201 Mat Martineau   2017-06-08  363  	/*
7cbe0932c2f201 Mat Martineau   2017-06-08  364  	 * For DH, generate_public=
_key and generate_shared_secret are
7cbe0932c2f201 Mat Martineau   2017-06-08  365  	 * the same calculation
7cbe0932c2f201 Mat Martineau   2017-06-08  366  	 */
7cbe0932c2f201 Mat Martineau   2017-06-08  367  	ret =3D crypto_kpp_generat=
e_public_key(req);
7cbe0932c2f201 Mat Martineau   2017-06-08  368  	if (ret =3D=3D -EINPROGRES=
S) {
7cbe0932c2f201 Mat Martineau   2017-06-08  369  		wait_for_completion(&comp=
l.completion);
7cbe0932c2f201 Mat Martineau   2017-06-08  370  		ret =3D compl.err;
7cbe0932c2f201 Mat Martineau   2017-06-08  371  		if (ret)
7cbe0932c2f201 Mat Martineau   2017-06-08  372  			goto out6;
7cbe0932c2f201 Mat Martineau   2017-06-08  373  	}
7cbe0932c2f201 Mat Martineau   2017-06-08  374  =

7cbe0932c2f201 Mat Martineau   2017-06-08  375  	if (kdfcopy) {
f1c316a3ab9d24 Stephan Mueller 2016-08-19  376  		/*
f1c316a3ab9d24 Stephan Mueller 2016-08-19  377  		 * Concatenate SP800-56A =
otherinfo past DH shared secret -- the
f1c316a3ab9d24 Stephan Mueller 2016-08-19  378  		 * input to the KDF is (D=
H shared secret || otherinfo)
f1c316a3ab9d24 Stephan Mueller 2016-08-19  379  		 */
7cbe0932c2f201 Mat Martineau   2017-06-08  380  		if (copy_from_user(outbuf=
 + req->dst_len, kdfcopy->otherinfo,
f1c316a3ab9d24 Stephan Mueller 2016-08-19  381  				   kdfcopy->otherinfole=
n) !=3D 0) {
f1c316a3ab9d24 Stephan Mueller 2016-08-19  382  			ret =3D -EFAULT;
7cbe0932c2f201 Mat Martineau   2017-06-08  383  			goto out6;
f1c316a3ab9d24 Stephan Mueller 2016-08-19  384  		}
f1c316a3ab9d24 Stephan Mueller 2016-08-19  385  =

7cbe0932c2f201 Mat Martineau   2017-06-08  386  		ret =3D keyctl_dh_compute=
_kdf(sdesc, buffer, buflen, outbuf,
7cbe0932c2f201 Mat Martineau   2017-06-08  387  					    req->dst_len + kdf=
copy->otherinfolen,
7cbe0932c2f201 Mat Martineau   2017-06-08  388  					    outlen - req->dst_=
len);
7cbe0932c2f201 Mat Martineau   2017-06-08  389  	} else if (copy_to_user(bu=
ffer, outbuf, req->dst_len) =3D=3D 0) {
7cbe0932c2f201 Mat Martineau   2017-06-08  390  		ret =3D req->dst_len;
f1c316a3ab9d24 Stephan Mueller 2016-08-19  391  	} else {
ddbb4114872436 Mat Martineau   2016-04-12  392  		ret =3D -EFAULT;
f1c316a3ab9d24 Stephan Mueller 2016-08-19  393  	}
ddbb4114872436 Mat Martineau   2016-04-12  394  =

7cbe0932c2f201 Mat Martineau   2017-06-08  395  out6:
7cbe0932c2f201 Mat Martineau   2017-06-08  396  	kpp_request_free(req);
7cbe0932c2f201 Mat Martineau   2017-06-08  397  out5:
453431a54934d9 Waiman Long     2020-08-06  398  	kfree_sensitive(outbuf);
7cbe0932c2f201 Mat Martineau   2017-06-08  399  out4:
7cbe0932c2f201 Mat Martineau   2017-06-08 @400  	crypto_free_kpp(tfm);
7cbe0932c2f201 Mat Martineau   2017-06-08  401  out3:
453431a54934d9 Waiman Long     2020-08-06  402  	kfree_sensitive(secret);
7cbe0932c2f201 Mat Martineau   2017-06-08  403  out2:
7cbe0932c2f201 Mat Martineau   2017-06-08  404  	dh_free_data(&dh_inputs);
7cbe0932c2f201 Mat Martineau   2017-06-08  405  out1:
f1c316a3ab9d24 Stephan Mueller 2016-08-19  406  	kdf_dealloc(sdesc);
ddbb4114872436 Mat Martineau   2016-04-12  407  	return ret;
ddbb4114872436 Mat Martineau   2016-04-12  408  }
f1c316a3ab9d24 Stephan Mueller 2016-08-19  409  =


:::::: The code at line 400 was first introduced by commit
:::::: 7cbe0932c2f2014d6e24e716e79ea3910b468950 KEYS: Convert KEYCTL_DH_COM=
PUTE to use the crypto KPP API

:::::: TO: Mat Martineau <mathew.j.martineau@linux.intel.com>
:::::: CC: James Morris <james.l.morris@oracle.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3056034868022987696==--

