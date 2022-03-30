Content-Type: multipart/mixed; boundary="===============5975164173336706527=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/test_scanf.c:41:8: warning: Call to function 'vsscanf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides bound...
Date: Wed, 30 Mar 2022 16:56:03 +0800
Message-ID: <202203301618.s9w2CHCf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5975164173336706527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   965181d7ef7e1a863477536dc328c23a7ebc8a1d
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   2 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-c002-20220327 (https://download.01.org/0day-ci/archi=
ve/20220330/202203301618.s9w2CHCf-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/notify/fsnotify.c:204:18: note: Calling 'fsnotify_event_needs_parent'
           parent_needed =3D fsnotify_event_needs_parent(inode, mnt, mask);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:152:6: note: Assuming the condition is true
           if (mask & FS_ISDIR)
               ^~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:152:2: note: Taking true branch
           if (mask & FS_ISDIR)
           ^
   fs/notify/fsnotify.c:153:3: note: Returning zero, which participates in =
a condition later
                   return false;
                   ^~~~~~~~~~~~
   fs/notify/fsnotify.c:204:18: note: Returning from 'fsnotify_event_needs_=
parent'
           parent_needed =3D fsnotify_event_needs_parent(inode, mnt, mask);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:205:6: note: Assuming 'parent_watched' is true
           if (!parent_watched && !parent_needed)
               ^~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:205:22: note: Left side of '&&' is false
           if (!parent_watched && !parent_needed)
                               ^
   fs/notify/fsnotify.c:212:15: note: 'parent_watched' is true
           if (unlikely(parent_watched && !p_mask))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/notify/fsnotify.c:212:15: note: Left side of '&&' is true
           if (unlikely(parent_watched && !p_mask))
                        ^
   fs/notify/fsnotify.c:212:33: note: Assuming 'p_mask' is not equal to 0
           if (unlikely(parent_watched && !p_mask))
                                          ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/notify/fsnotify.c:212:2: note: Taking false branch
           if (unlikely(parent_watched && !p_mask))
           ^
   fs/notify/fsnotify.c:220:6: note: 'parent_needed' is false
           if (parent_needed || parent_interested) {
               ^~~~~~~~~~~~~
   fs/notify/fsnotify.c:220:6: note: Left side of '||' is false
   fs/notify/fsnotify.c:220:23: note: Assuming 'parent_interested' is true
           if (parent_needed || parent_interested) {
                                ^~~~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:220:2: note: Taking true branch
           if (parent_needed || parent_interested) {
           ^
   fs/notify/fsnotify.c:222:45: note: Passing null pointer value via 1st pa=
rameter 'data'
                   WARN_ON_ONCE(inode !=3D fsnotify_data_inode(data, data_t=
ype));
                                                             ^
   include/asm-generic/bug.h:179:41: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                           ^~~~~~~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   fs/notify/fsnotify.c:222:25: note: Calling 'fsnotify_data_inode'
                   WARN_ON_ONCE(inode !=3D fsnotify_data_inode(data, data_t=
ype));
                                         ^
   include/asm-generic/bug.h:179:41: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                           ^~~~~~~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   include/linux/fsnotify_backend.h:273:2: note: Control jumps to 'case FSN=
OTIFY_EVENT_PATH:'  at line 278
           switch (data_type) {
           ^
   include/linux/fsnotify_backend.h:279:18: note: Access to field 'dentry' =
results in a dereference of a null pointer (loaded from variable 'data')
                   return d_inode(((const struct path *)data)->dentry);
                                  ^                     ~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   fs/fuse/xattr.c:25:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&inarg, 0, sizeof(inarg));
           ^~~~~~
   fs/fuse/xattr.c:25:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(&inarg, 0, sizeof(inarg));
           ^~~~~~
   fs/fuse/xattr.c:63:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&inarg, 0, sizeof(inarg));
           ^~~~~~
   fs/fuse/xattr.c:63:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(&inarg, 0, sizeof(inarg));
           ^~~~~~
   fs/fuse/xattr.c:127:2: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&inarg, 0, sizeof(inarg));
           ^~~~~~
   fs/fuse/xattr.c:127:2: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
           memset(&inarg, 0, sizeof(inarg));
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   160 warnings generated.
>> lib/test_scanf.c:41:8: warning: Call to function 'vsscanf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'vsscanf_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D vsscanf(string, fmt, ap_copy);
                 ^~~~~~~
   lib/test_scanf.c:41:8: note: Call to function 'vsscanf' is insecure as i=
t does not provide bounding of the memory buffer or security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'vsscanf_s' in case of C11
           ret =3D vsscanf(string, fmt, ap_copy);
                 ^~~~~~~
   lib/test_scanf.c:219:2: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           simple_numbers_loop(unsigned long long, "%llu",   "llu", check_u=
ll);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:219:2: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           simple_numbers_loop(unsigned long long, "%llu",   "llu", check_u=
ll);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:220:2: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           simple_numbers_loop(long long,          "%lld",   "lld", check_l=
l);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:220:2: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           simple_numbers_loop(long long,          "%lld",   "lld", check_l=
l);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:221:2: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           simple_numbers_loop(long long,          "%lld",   "lli", check_l=
l);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:221:2: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           simple_numbers_loop(long long,          "%lld",   "lli", check_l=
l);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:222:2: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           simple_numbers_loop(unsigned long long, "%llx",   "llx", check_u=
ll);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:222:2: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           simple_numbers_loop(unsigned long long, "%llx",   "llx", check_u=
ll);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:223:2: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           simple_numbers_loop(long long,          "%llx",   "llx", check_l=
l);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:223:2: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           simple_numbers_loop(long long,          "%llx",   "llx", check_l=
l);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:224:2: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           simple_numbers_loop(long long,          "0x%llx", "lli", check_l=
l);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
--
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/gpio/gpio-adnp.c:385:28: warning: The result of the left shift i=
s undefined due to shifting by '4294967292', which is greater or equal to t=
he width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           unsigned int num_regs =3D 1 << adnp->reg_shift, i;
                                     ^
   drivers/gpio/gpio-adnp.c:497:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   drivers/gpio/gpio-adnp.c:497:2: note: Taking false branch
           if (err < 0)
           ^
   drivers/gpio/gpio-adnp.c:501:6: note: Assuming field 'irq' is not equal =
to 0
           if (!client->irq)
               ^~~~~~~~~~~~
   drivers/gpio/gpio-adnp.c:501:2: note: Taking false branch
           if (!client->irq)
           ^
   drivers/gpio/gpio-adnp.c:505:6: note: Assuming 'adnp' is non-null
           if (!adnp)
               ^~~~~
   drivers/gpio/gpio-adnp.c:505:2: note: Taking false branch
           if (!adnp)
           ^
   drivers/gpio/gpio-adnp.c:508:2: note: Loop condition is false.  Exiting =
loop
           mutex_init(&adnp->i2c_lock);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/gpio/gpio-adnp.c:511:8: note: Calling 'adnp_gpio_setup'
           err =3D adnp_gpio_setup(adnp, num_gpios,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-adnp.c:446:2: note: The value 4294967292 is assigned t=
o field 'reg_shift'
           adnp->reg_shift =3D get_count_order(num_gpios) - 3;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-adnp.c:454:2: note: Taking true branch
           if (IS_ENABLED(CONFIG_DEBUG_FS))
           ^
   drivers/gpio/gpio-adnp.c:463:6: note: 'is_irq_controller' is true
           if (is_irq_controller) {
               ^~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-adnp.c:463:2: note: Taking true branch
           if (is_irq_controller) {
           ^
   drivers/gpio/gpio-adnp.c:466:9: note: Calling 'adnp_irq_setup'
                   err =3D adnp_irq_setup(adnp);
                         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-adnp.c:385:28: note: The result of the left shift is u=
ndefined due to shifting by '4294967292', which is greater or equal to the =
width of type 'int'
           unsigned int num_regs =3D 1 << adnp->reg_shift, i;
                                     ^  ~~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
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
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
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
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
>> drivers/bus/fsl-mc/fsl-mc-bus.c:159:9: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           return sprintf(buf, "fsl-mc:v%08Xd%s\n", mc_dev->obj_desc.vendor,
                  ^~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:159:9: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           return sprintf(buf, "fsl-mc:v%08Xd%s\n", mc_dev->obj_desc.vendor,
                  ^~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:203:9: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%s\n", mc_dev->driver_override);
                  ^~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:203:9: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%s\n", mc_dev->driver_override);
                  ^~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:281:2: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(buf, "%d\n", get_dprc_irq_state(root_mc_dev));
           ^~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:281:2: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           sprintf(buf, "%d\n", get_dprc_irq_state(root_mc_dev));
           ^~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:599:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(attr, 0, sizeof(struct dprc_attributes));
           ^~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:599:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(attr, 0, sizeof(struct dprc_attributes));
           ^~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:871:18: warning: Access to field 'icid' =
results in a dereference of a null pointer (loaded from variable 'parent_mc=
_dev') [clang-analyzer-core.NullDereference]
                   mc_dev->icid =3D parent_mc_dev->icid;
                                  ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1120:6: note: Assuming 'mc' is non-null
           if (!mc)
               ^~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1120:2: note: Taking false branch
           if (!mc)
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1126:6: note: Assuming 'plat_res' is null
           if (plat_res) {
               ^~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1126:2: note: Taking false branch
           if (plat_res) {
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1132:6: note: Assuming field 'fsl_mc_reg=
s' is null
           if (mc->fsl_mc_regs) {
               ^~~~~~~~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1132:2: note: Taking false branch
           if (mc->fsl_mc_regs) {
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1178:6: note: Assuming 'error' is >=3D 0
           if (error < 0)
               ^~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1178:2: note: Taking false branch
           if (error < 0)
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1182:6: note: 'error' is equal to 0
           if (error !=3D 0) {
               ^~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1182:2: note: Taking false branch
           if (error !=3D 0) {
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1188:2: note: Loop condition is false.  =
Exiting loop
           dev_info(&pdev->dev, "MC firmware version: %u.%u.%u\n",
           ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1191:6: note: Assuming the condition is =
false
           if (dev_of_node(&pdev->dev)) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1191:2: note: Taking false branch
           if (dev_of_node(&pdev->dev)) {
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1200:6: note: Assuming 'error' is >=3D 0
           if (error < 0) {
               ^~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1200:2: note: Taking false branch
           if (error < 0) {
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1210:6: note: Assuming 'error' is >=3D 0
           if (error < 0)
               ^~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1210:2: note: Taking false branch
           if (error < 0)
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1219:10: note: Calling 'fsl_mc_device_ad=
d'
           error =3D fsl_mc_device_add(&obj_desc, mc_io, &pdev->dev, &mc_bu=
s_dev);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:793:6: note: Assuming the condition is f=
alse
           if (dev_is_fsl_mc(parent_dev))
               ^
   include/linux/fsl/mc.h:353:30: note: expanded from macro 'dev_is_fsl_mc'
   #define dev_is_fsl_mc(_dev) ((_dev)->bus =3D=3D &fsl_mc_bus_type)
--
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:31: note: expanded from macro '__LOCK=
_IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
                                 ^
   include/linux/spinlock_api_up.h:31:3: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
     ^
   drivers/crypto/img-hash.c:504:2: note: Loop condition is false.  Exiting=
 loop
           spin_lock_irqsave(&hdev->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:3: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
     ^
   drivers/crypto/img-hash.c:504:2: note: Loop condition is false.  Exiting=
 loop
           spin_lock_irqsave(&hdev->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:262:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/crypto/img-hash.c:504:2: note: Loop condition is false.  Exiting=
 loop
           spin_lock_irqsave(&hdev->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/crypto/img-hash.c:506:6: note: 'req' is non-null
           if (req)
               ^~~
   drivers/crypto/img-hash.c:506:2: note: Taking true branch
           if (req)
           ^
   drivers/crypto/img-hash.c:509:26: note: Access to field 'flags' results =
in a dereference of a null pointer (loaded from variable 'hdev')
           if (DRIVER_FLAGS_BUSY & hdev->flags) {
                                   ^~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   drivers/dma/qcom/bam_dma.c:638:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&bchan->slave, cfg, sizeof(*cfg));
           ^~~~~~
   drivers/dma/qcom/bam_dma.c:638:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(&bchan->slave, cfg, sizeof(*cfg));
           ^~~~~~
   drivers/dma/qcom/bam_dma.c:1092:4: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&fifo[bchan->tail], desc,
                           ^~~~~~
   drivers/dma/qcom/bam_dma.c:1092:4: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&fifo[bchan->tail], desc,
                           ^~~~~~
   drivers/dma/qcom/bam_dma.c:1094:4: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(fifo, &desc[partial],
                           ^~~~~~
   drivers/dma/qcom/bam_dma.c:1094:4: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                           memcpy(fifo, &desc[partial],
                           ^~~~~~
   drivers/dma/qcom/bam_dma.c:1098:4: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&fifo[bchan->tail], desc,
                           ^~~~~~
   drivers/dma/qcom/bam_dma.c:1098:4: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&fifo[bchan->tail], desc,
                           ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/usb/usbip/stub_main.c:36:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(busid_table, 0, sizeof(busid_table));
           ^~~~~~
   drivers/usb/usbip/stub_main.c:36:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(busid_table, 0, sizeof(busid_table));
           ^~~~~~
   drivers/usb/usbip/stub_main.c:136:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(busid_table[idx].name, 0, BUSID_SIZE);
                   ^~~~~~
   drivers/usb/usbip/stub_main.c:136:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(busid_table[idx].name, 0, BUSID_SIZE);
                   ^~~~~~
>> drivers/usb/usbip/stub_main.c:158:11: warning: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
                           out +=3D sprintf(out, "%s ", busid_table[i].name=
);
                                  ^~~~~~~
   drivers/usb/usbip/stub_main.c:158:11: note: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11
                           out +=3D sprintf(out, "%s ", busid_table[i].name=
);
                                  ^~~~~~~
   drivers/usb/usbip/stub_main.c:162:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           out +=3D sprintf(out, "\n");
                  ^~~~~~~
   drivers/usb/usbip/stub_main.c:162:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           out +=3D sprintf(out, "\n");
                  ^~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/mailbox/mailbox-test.c:178:9: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D snprintf(touser, 20, "<NO RX CAPABILITY>\n");
                         ^~~~~~~~
   drivers/mailbox/mailbox-test.c:178:9: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
                   ret =3D snprintf(touser, 20, "<NO RX CAPABILITY>\n");
                         ^~~~~~~~
   drivers/mailbox/mailbox-test.c:220:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(tdev->rx_buffer, 0, MBOX_MAX_MSG_LEN);
           ^~~~~~
   drivers/mailbox/mailbox-test.c:220:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(tdev->rx_buffer, 0, MBOX_MAX_MSG_LEN);
           ^~~~~~
   drivers/mailbox/mailbox-test.c:289:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(tdev->rx_buffer, message, MBOX_MAX_MSG_LEN);
                   ^~~~~~
   drivers/mailbox/mailbox-test.c:289:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(tdev->rx_buffer, message, MBOX_MAX_MSG_LEN);
                   ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
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
   31 warnings generated.
   drivers/mailbox/mtk-cmdq-mailbox.c:429:2: warning: Use of memory after i=
t is freed [clang-analyzer-unix.Malloc]
           list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
           ^
   include/linux/list.h:726:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   drivers/mailbox/mtk-cmdq-mailbox.c:418:2: note: Loop condition is false.=
  Exiting loop
           spin_lock_irqsave(&thread->chan->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:244:36: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                        ^
   include/linux/irqflags.h:176:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   drivers/mailbox/mtk-cmdq-mailbox.c:418:2: note: Loop condition is false.=
  Exiting loop
           spin_lock_irqsave(&thread->chan->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:244:31: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                   ^
   drivers/mailbox/mtk-cmdq-mailbox.c:418:2: note: Loop condition is false.=
  Exiting loop
           spin_lock_irqsave(&thread->chan->lock, flags);
--
                                                          ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk=
_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                           ^~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   fs/quota/quota.c:134:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&uinfo, 0, sizeof(uinfo));
           ^~~~~~
   fs/quota/quota.c:134:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(&uinfo, 0, sizeof(uinfo));
           ^~~~~~
   fs/quota/quota.c:158:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&qinfo, 0, sizeof(qinfo));
           ^~~~~~
   fs/quota/quota.c:158:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(&qinfo, 0, sizeof(qinfo));
           ^~~~~~
   fs/quota/quota.c:189:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dst, 0, sizeof(*dst));
           ^~~~~~
   fs/quota/quota.c:189:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(dst, 0, sizeof(*dst));
           ^~~~~~
   fs/quota/quota.c:360:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&state, 0, sizeof (struct qc_state));
           ^~~~~~
   fs/quota/quota.c:360:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(&state, 0, sizeof (struct qc_state));
           ^~~~~~
   fs/quota/quota.c:365:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(fqs, 0, sizeof(*fqs));
           ^~~~~~
   fs/quota/quota.c:365:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(fqs, 0, sizeof(*fqs));
           ^~~~~~
   fs/quota/quota.c:458:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&state, 0, sizeof (struct qc_state));
           ^~~~~~
   fs/quota/quota.c:458:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(&state, 0, sizeof (struct qc_state));
           ^~~~~~
   fs/quota/quota.c:463:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(fqs, 0, sizeof(*fqs));
           ^~~~~~
   fs/quota/quota.c:463:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(fqs, 0, sizeof(*fqs));
           ^~~~~~
   fs/quota/quota.c:505:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fqs, 0, sizeof(fqs));
           ^~~~~~
   fs/quota/quota.c:505:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(&fqs, 0, sizeof(fqs));
           ^~~~~~
   fs/quota/quota.c:603:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dst, 0, sizeof(*dst));
           ^~~~~~
   fs/quota/quota.c:603:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(dst, 0, sizeof(*dst));
           ^~~~~~
   fs/quota/quota.c:673:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dst, 0, sizeof(*dst));
           ^~~~~~
   fs/quota/quota.c:673:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(dst, 0, sizeof(*dst));
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/iio/adc/mcp3422.c:277:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "240 60 15\n");
                          ^~~~~~~
   drivers/iio/adc/mcp3422.c:277:10: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "240 60 15\n");
                          ^~~~~~~
   drivers/iio/adc/mcp3422.c:279:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "240 60 15 3\n");
                  ^~~~~~~
   drivers/iio/adc/mcp3422.c:279:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "240 60 15 3\n");
                  ^~~~~~~
   drivers/iio/adc/mcp3422.c:288:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0.%09u 0.%09u 0.%09u 0.%09u\n",
                  ^~~~~~~
   drivers/iio/adc/mcp3422.c:288:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0.%09u 0.%09u 0.%09u 0.%09u\n",
                  ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/usb/musb/musb_dsps.c:351:6: warning: Value stored to 'devctl' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   u8 devctl =3D musb_readb(mregs, MUSB_DEVCTL);
                      ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_dsps.c:351:6: note: Value stored to 'devctl' durin=
g its initialization is never read
                   u8 devctl =3D musb_readb(mregs, MUSB_DEVCTL);
                      ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/musb/musb_dsps.c:414:2: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
           sprintf(buf, "%s.dsps", dev_name(musb->controller));
           ^~~~~~~
   drivers/usb/musb/musb_dsps.c:414:2: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
           sprintf(buf, "%s.dsps", dev_name(musb->controller));
           ^~~~~~~
   drivers/usb/musb/musb_dsps.c:637:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst, &val, len);
                   ^~~~~~
   drivers/usb/musb/musb_dsps.c:637:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dst, &val, len);
                   ^~~~~~
   drivers/usb/musb/musb_dsps.c:735:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(resources, 0, sizeof(resources));
           ^~~~~~
   drivers/usb/musb/musb_dsps.c:735:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(resources, 0, sizeof(resources));
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/usb/musb/tusb6010.c:185:4: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&val, buf, 4);
                           ^~~~~~
   drivers/usb/musb/tusb6010.c:185:4: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&val, buf, 4);
                           ^~~~~~
   drivers/usb/musb/tusb6010.c:194:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&val, buf, len);
                   ^~~~~~
   drivers/usb/musb/tusb6010.c:194:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&val, buf, len);
                   ^~~~~~
   drivers/usb/musb/tusb6010.c:208:4: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(buf, &val, 4);
                           ^~~~~~
   drivers/usb/musb/tusb6010.c:208:4: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                           memcpy(buf, &val, 4);
                           ^~~~~~
   drivers/usb/musb/tusb6010.c:216:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, &val, len);
                   ^~~~~~
   drivers/usb/musb/tusb6010.c:216:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, &val, len);
                   ^~~~~~
   drivers/usb/musb/tusb6010.c:222:15: warning: Value stored to 'musb' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct musb *musb =3D hw_ep->musb;
                        ^~~~   ~~~~~~~~~~~
   drivers/usb/musb/tusb6010.c:222:15: note: Value stored to 'musb' during =
its initialization is never read
           struct musb *musb =3D hw_ep->musb;
                        ^~~~   ~~~~~~~~~~~
   drivers/usb/musb/tusb6010.c:272:15: warning: Value stored to 'musb' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct musb *musb =3D hw_ep->musb;
                        ^~~~   ~~~~~~~~~~~
   drivers/usb/musb/tusb6010.c:272:15: note: Value stored to 'musb' during =
its initialization is never read
           struct musb *musb =3D hw_ep->musb;
                        ^~~~   ~~~~~~~~~~~
   drivers/usb/musb/tusb6010.c:633:2: warning: Value stored to 'otg_stat' i=
s never read [clang-analyzer-deadcode.DeadStores]
           otg_stat =3D musb_readl(tbase, TUSB_DEV_OTG_STAT);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/tusb6010.c:633:2: note: Value stored to 'otg_stat' is n=
ever read
           otg_stat =3D musb_readl(tbase, TUSB_DEV_OTG_STAT);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/tusb6010.c:1226:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(musb_resources, 0x00, sizeof(*musb_resources) *
           ^~~~~~
   drivers/usb/musb/tusb6010.c:1226:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(musb_resources, 0x00, sizeof(*musb_resources) *
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/gpu/drm/bridge/tc358767.c:308:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(auxwdata, data, size);
           ^~~~~~
   drivers/gpu/drm/bridge/tc358767.c:308:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(auxwdata, data, size);
           ^~~~~~
   drivers/gpu/drm/bridge/tc358767.c:326:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, auxrdata, size);
           ^~~~~~
   drivers/gpu/drm/bridge/tc358767.c:326:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, auxrdata, size);
           ^~~~~~
   drivers/gpu/drm/bridge/tc358767.c:678:2: warning: Value stored to 'revis=
ion' is never read [clang-analyzer-deadcode.DeadStores]
           revision =3D tc->link.dpcd[DP_DPCD_REV];
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358767.c:678:2: note: Value stored to 'revision=
' is never read
           revision =3D tc->link.dpcd[DP_DPCD_REV];
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358767.c:820:2: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_write(tc->regmap, DP0_VIDSYNCDELAY,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358767.c:820:2: note: Value stored to 'ret' is =
never read
           ret =3D regmap_write(tc->regmap, DP0_VIDSYNCDELAY,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358767.c:946:2: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_write(tc->regmap, DP_PHY_CTRL, dp_phy_ctrl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358767.c:946:2: note: Value stored to 'ret' is =
never read
           ret =3D regmap_write(tc->regmap, DP_PHY_CTRL, dp_phy_ctrl);
--
           ^~~~~~
   drivers/staging/fieldbus/anybuss/host.c:854:2: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(msg_in, pd->msg, msg_in_sz);
           ^~~~~~
   drivers/staging/fieldbus/anybuss/host.c:854:2: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(msg_in, pd->msg, msg_in_sz);
           ^~~~~~
   drivers/staging/fieldbus/anybuss/host.c:1074:2: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, t->area_pd.buf, count);
           ^~~~~~
   drivers/staging/fieldbus/anybuss/host.c:1074:2: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, t->area_pd.buf, count);
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   drivers/iio/accel/adxl372.c:606:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(axis_sample, 0, 3 * sizeof(__be16));
           ^~~~~~
   drivers/iio/accel/adxl372.c:606:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(axis_sample, 0, 3 * sizeof(__be16));
           ^~~~~~
   drivers/iio/accel/adxl372.c:614:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sample, axis_sample, 3 * sizeof(__be16));
           ^~~~~~
   drivers/iio/accel/adxl372.c:614:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(sample, axis_sample, 3 * sizeof(__be16));
           ^~~~~~
   drivers/iio/accel/adxl372.c:988:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", st->fifo_mode);
                  ^~~~~~~
   drivers/iio/accel/adxl372.c:988:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", st->fifo_mode);
                  ^~~~~~~
   drivers/iio/accel/adxl372.c:998:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", st->watermark);
                  ^~~~~~~
   drivers/iio/accel/adxl372.c:998:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", st->watermark);
                  ^~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c:114:2: warning: Call=
 to function 'memset' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'memset_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cet, 0, sizeof(struct ce_task));
           ^~~~~~
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c:114:2: note: Call to=
 function 'memset' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(cet, 0, sizeof(struct ce_task));
           ^~~~~~
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c:169:3: warning: Call=
 to function 'memcpy' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'memcpy_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(rctx->bounce_iv, areq->iv, ivsize);
                   ^~~~~~
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c:169:3: note: Call to=
 function 'memcpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(rctx->bounce_iv, areq->iv, ivsize);
                   ^~~~~~
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c:259:4: warning: Call=
 to function 'memcpy' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'memcpy_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(areq->iv, rctx->backup_iv, ivsize);
                           ^~~~~~
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c:259:4: note: Call to=
 function 'memcpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(areq->iv, rctx->backup_iv, ivsize);
                           ^~~~~~
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c:322:4: warning: Call=
 to function 'memcpy' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'memcpy_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(areq->iv, rctx->backup_iv, ivsize);
                           ^~~~~~
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c:322:4: note: Call to=
 function 'memcpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(areq->iv, rctx->backup_iv, ivsize);
                           ^~~~~~
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c:383:2: warning: Call=
 to function 'memset' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'memset_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(op, 0, sizeof(struct sun8i_cipher_tfm_ctx));
           ^~~~~~
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c:383:2: note: Call to=
 function 'memset' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(op, 0, sizeof(struct sun8i_cipher_tfm_ctx));
           ^~~~~~
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c:431:23: warning: Val=
ue stored to 'ce' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct sun8i_ce_dev *ce =3D op->ce;
                                ^~   ~~~~~~
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c:431:23: note: Value =
stored to 'ce' during its initialization is never read
           struct sun8i_ce_dev *ce =3D op->ce;
                                ^~   ~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
>> drivers/usb/mtu3/mtu3_debugfs.c:135:2: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           sprintf(mregs->name, "%s", name);
           ^~~~~~~
   drivers/usb/mtu3/mtu3_debugfs.c:135:2: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           sprintf(mregs->name, "%s", name);
           ^~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   include/linux/log2.h:67:13: warning: The result of the left shift is und=
efined due to shifting by '4294967295', which is greater or equal to the wi=
dth of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorRes=
ult]
           return 1UL << (fls_long(n) - 1);
                      ^
   drivers/usb/host/ehci-hcd.c:888:2: note: Control jumps to the 'default' =
case@line 897
           switch (usb_pipetype (urb->pipe)) {
           ^
   drivers/usb/host/ehci-hcd.c:898:3: note: Taking false branch
                   if (!qh_urb_transaction (ehci, urb, &qtd_list, mem_flags=
))
                   ^
   drivers/usb/host/ehci-hcd.c:900:10: note: Calling 'submit_async'
                   return submit_async(ehci, urb, &qtd_list, mem_flags);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/ehci-q.c:1128:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave (&ehci->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:244:36: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                        ^
   include/linux/irqflags.h:176:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   drivers/usb/host/ehci-q.c:1128:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave (&ehci->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:244:31: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                   ^
   drivers/usb/host/ehci-q.c:1128:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave (&ehci->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:31: note: expanded from macro '__LOCK=
_IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
                                 ^
   include/linux/spinlock_api_up.h:31:27: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
                             ^
   include/linux/spinlock_api_up.h:28:3: note: expanded from macro '___LOCK'
     do { __acquire(lock); (void)(lock); } while (0)
     ^
   drivers/usb/host/ehci-q.c:1128:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave (&ehci->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:31: note: expanded from macro '__LOCK=
_IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
                                 ^
   include/linux/spinlock_api_up.h:31:3: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
     ^
   drivers/usb/host/ehci-q.c:1128:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave (&ehci->lock, flags);
--
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:2111:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:2119:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ctx->ctr_nonce, key + keylen, 4);
           ^~~~~~
   drivers/crypto/ccree/cc_aead.c:2119:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ctx->ctr_nonce, key + keylen, 4);
           ^~~~~~
   drivers/crypto/ccree/cc_aead.c:2128:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:2128:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:2136:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ctx->ctr_nonce, key + keylen, 4);
           ^~~~~~
   drivers/crypto/ccree/cc_aead.c:2136:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ctx->ctr_nonce, key + keylen, 4);
           ^~~~~~
   drivers/crypto/ccree/cc_aead.c:2164:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:2164:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:2184:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:2184:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D drvdata_to_dev(ctx->drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_aead.c:2203:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(areq_ctx, 0, sizeof(*areq_ctx));
           ^~~~~~
   drivers/crypto/ccree/cc_aead.c:2203:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(areq_ctx, 0, sizeof(*areq_ctx));
           ^~~~~~
   drivers/crypto/ccree/cc_aead.c:2227:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(areq_ctx, 0, sizeof(*areq_ctx));
           ^~~~~~
   drivers/crypto/ccree/cc_aead.c:2227:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(areq_ctx, 0, sizeof(*areq_ctx));
           ^~~~~~
   drivers/crypto/ccree/cc_aead.c:2254:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(areq_ctx, 0, sizeof(*areq_ctx));
           ^~~~~~
   drivers/crypto/ccree/cc_aead.c:2254:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(areq_ctx, 0, sizeof(*areq_ctx));
           ^~~~~~
   drivers/crypto/ccree/cc_aead.c:2278:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(areq_ctx, 0, sizeof(*areq_ctx));
           ^~~~~~
   drivers/crypto/ccree/cc_aead.c:2278:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(areq_ctx, 0, sizeof(*areq_ctx));
           ^~~~~~
   drivers/crypto/ccree/cc_aead.c:2572:2: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(alg->base.cra_name, CRYPTO_MAX_ALG_NAME, "%s", tmpl->na=
me);
           ^~~~~~~~
   drivers/crypto/ccree/cc_aead.c:2572:2: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(alg->base.cra_name, CRYPTO_MAX_ALG_NAME, "%s", tmpl->na=
me);
           ^~~~~~~~
   drivers/crypto/ccree/cc_aead.c:2573:2: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(alg->base.cra_driver_name, CRYPTO_MAX_ALG_NAME, "%s",
           ^~~~~~~~
   drivers/crypto/ccree/cc_aead.c:2573:2: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(alg->base.cra_driver_name, CRYPTO_MAX_ALG_NAME, "%s",
           ^~~~~~~~
   Suppressed 67 warnings (67 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/input/touchscreen/cy8ctmg110_ts.c:71:2: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(i2c_data + 1, value, len);
           ^~~~~~
   drivers/input/touchscreen/cy8ctmg110_ts.c:71:2: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(i2c_data + 1, value, len);
           ^~~~~~
   drivers/input/touchscreen/cy8ctmg110_ts.c:115:2: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(reg_p, 0, CY8CTMG110_REG_MAX);
           ^~~~~~
   drivers/input/touchscreen/cy8ctmg110_ts.c:115:2: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
           memset(reg_p, 0, CY8CTMG110_REG_MAX);
           ^~~~~~
   drivers/input/touchscreen/cy8ctmg110_ts.c:193:2: warning: Call to functi=
on 'snprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'snprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(ts->phys, sizeof(ts->phys),
           ^~~~~~~~
   drivers/input/touchscreen/cy8ctmg110_ts.c:193:2: note: Call to function =
'snprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(ts->phys, sizeof(ts->phys),
           ^~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
>> drivers/staging/fieldbus/anybuss/arcx-anybus.c:169:9: warning: Call to f=
unction 'sprintf' is insecure as it does not provide bounding of the memory=
 buffer or security checks introduced in the C11 standard. Replace with ana=
logous functions that support length arguments or provides boundary checks =
such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Dep=
recatedOrUnsafeBufferHandling]
           return sprintf(buf, "%s\n", cd->version);
                  ^~~~~~~
   drivers/staging/fieldbus/anybuss/arcx-anybus.c:169:9: note: Call to func=
tion 'sprintf' is insecure as it does not provide bounding of the memory bu=
ffer or security checks introduced in the C11 standard. Replace with analog=
ous functions that support length arguments or provides boundary checks suc=
h as 'sprintf_s' in case of C11
           return sprintf(buf, "%s\n", cd->version);
                  ^~~~~~~
   drivers/staging/fieldbus/anybuss/arcx-anybus.c:178:9: warning: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", cd->design_no);
                  ^~~~~~~
   drivers/staging/fieldbus/anybuss/arcx-anybus.c:178:9: note: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", cd->design_no);
                  ^~~~~~~
   drivers/staging/fieldbus/anybuss/arcx-anybus.c:256:2: warning: Call to f=
unction 'snprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'snprintf_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cd->version, sizeof(cd->version), "%c%d",
           ^~~~~~~~
   drivers/staging/fieldbus/anybuss/arcx-anybus.c:256:2: note: Call to func=
tion 'snprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(cd->version, sizeof(cd->version), "%c%d",
           ^~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/staging/fieldbus/anybuss/hms-profinet.c:69:9: warning: Call to f=
unction 'snprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'snprintf_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, max_size, "%pM\n", response.addr);
                  ^~~~~~~~
   drivers/staging/fieldbus/anybuss/hms-profinet.c:69:9: note: Call to func=
tion 'snprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, max_size, "%pM\n", response.addr);
                  ^~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   103 warnings generated.
   net/ipv4/fib_frontend.c:474:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cfg, 0, sizeof(*cfg));
           ^~~~~~
   net/ipv4/fib_frontend.c:474:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(cfg, 0, sizeof(*cfg));
           ^~~~~~
   net/ipv4/fib_frontend.c:735:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cfg, 0, sizeof(*cfg));
           ^~~~~~
   net/ipv4/fib_frontend.c:735:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(cfg, 0, sizeof(*cfg));
           ^~~~~~
   net/ipv4/fib_frontend.c:1021:5: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(&cb->args[2], 0, sizeof(cb->args)=
 -
                                   ^~~~~~
   net/ipv4/fib_frontend.c:1021:5: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                                   memset(&cb->args[2], 0, sizeof(cb->args)=
 -
                                   ^~~~~~
   Suppressed 100 warnings (99 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   103 warnings generated.
   include/linux/list.h:88:24: warning: Access to field 'next' results in a=
 dereference of a null pointer (loaded from variable 'head') [clang-analyze=
r-core.NullDereference]
           __list_add(new, head, head->next);
                                 ^
   net/ipv4/fib_semantics.c:1395:2: note: 'nh' initialized to a null pointe=
r value
           struct nexthop *nh =3D NULL;
           ^~~~~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:1400:6: note: Assuming the condition is false
           if (cfg->fc_type > RTN_MAX)
               ^~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:1400:2: note: Taking false branch
           if (cfg->fc_type > RTN_MAX)
           ^
   net/ipv4/fib_semantics.c:1404:6: note: Assuming field 'scope' is <=3D fi=
eld 'fc_scope'
           if (fib_props[cfg->fc_type].scope > cfg->fc_scope) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:1404:2: note: Taking false branch
           if (fib_props[cfg->fc_type].scope > cfg->fc_scope) {
           ^
   net/ipv4/fib_semantics.c:1409:6: note: Assuming the condition is false
           if (cfg->fc_flags & (RTNH_F_DEAD | RTNH_F_LINKDOWN)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:1409:2: note: Taking false branch
           if (cfg->fc_flags & (RTNH_F_DEAD | RTNH_F_LINKDOWN)) {
           ^
   net/ipv4/fib_semantics.c:1415:6: note: Assuming field 'fc_nh_id' is 0
           if (cfg->fc_nh_id) {
               ^~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:1415:2: note: Taking false branch
           if (cfg->fc_nh_id) {
           ^
   net/ipv4/fib_semantics.c:1433:6: note: Assuming field 'fc_mp' is null
           if (cfg->fc_mp) {
               ^~~~~~~~~~
   net/ipv4/fib_semantics.c:1433:2: note: Taking false branch
           if (cfg->fc_mp) {
           ^
   net/ipv4/fib_semantics.c:1443:6: note: Left side of '||' is false
           if (READ_ONCE(fib_info_cnt) >=3D fib_info_hash_size) {
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

vim +41 lib/test_scanf.c

50f530e176eac8 Richard Fitzgerald 2021-05-14  26  =

50f530e176eac8 Richard Fitzgerald 2021-05-14  27  typedef int (*check_fn)(c=
onst void *check_data, const char *string,
50f530e176eac8 Richard Fitzgerald 2021-05-14  28  			const char *fmt, int n=
_args, va_list ap);
50f530e176eac8 Richard Fitzgerald 2021-05-14  29  =

50f530e176eac8 Richard Fitzgerald 2021-05-14  30  static void __scanf(4, 6)=
 __init
50f530e176eac8 Richard Fitzgerald 2021-05-14  31  _test(check_fn fn, const =
void *check_data, const char *string, const char *fmt,
50f530e176eac8 Richard Fitzgerald 2021-05-14  32  	int n_args, ...)
50f530e176eac8 Richard Fitzgerald 2021-05-14  33  {
50f530e176eac8 Richard Fitzgerald 2021-05-14  34  	va_list ap, ap_copy;
50f530e176eac8 Richard Fitzgerald 2021-05-14  35  	int ret;
50f530e176eac8 Richard Fitzgerald 2021-05-14  36  =

50f530e176eac8 Richard Fitzgerald 2021-05-14  37  	total_tests++;
50f530e176eac8 Richard Fitzgerald 2021-05-14  38  =

50f530e176eac8 Richard Fitzgerald 2021-05-14  39  	va_start(ap, n_args);
50f530e176eac8 Richard Fitzgerald 2021-05-14  40  	va_copy(ap_copy, ap);
50f530e176eac8 Richard Fitzgerald 2021-05-14 @41  	ret =3D vsscanf(string, =
fmt, ap_copy);
50f530e176eac8 Richard Fitzgerald 2021-05-14  42  	va_end(ap_copy);
50f530e176eac8 Richard Fitzgerald 2021-05-14  43  =

50f530e176eac8 Richard Fitzgerald 2021-05-14  44  	if (ret !=3D n_args) {
50f530e176eac8 Richard Fitzgerald 2021-05-14  45  		pr_warn("vsscanf(\"%s\"=
, \"%s\", ...) returned %d expected %d\n",
50f530e176eac8 Richard Fitzgerald 2021-05-14  46  			string, fmt, ret, n_ar=
gs);
50f530e176eac8 Richard Fitzgerald 2021-05-14  47  		goto fail;
50f530e176eac8 Richard Fitzgerald 2021-05-14  48  	}
50f530e176eac8 Richard Fitzgerald 2021-05-14  49  =

50f530e176eac8 Richard Fitzgerald 2021-05-14  50  	ret =3D (*fn)(check_data=
, string, fmt, n_args, ap);
50f530e176eac8 Richard Fitzgerald 2021-05-14  51  	if (ret)
50f530e176eac8 Richard Fitzgerald 2021-05-14  52  		goto fail;
50f530e176eac8 Richard Fitzgerald 2021-05-14  53  =

50f530e176eac8 Richard Fitzgerald 2021-05-14  54  	va_end(ap);
50f530e176eac8 Richard Fitzgerald 2021-05-14  55  =

50f530e176eac8 Richard Fitzgerald 2021-05-14  56  	return;
50f530e176eac8 Richard Fitzgerald 2021-05-14  57  =

50f530e176eac8 Richard Fitzgerald 2021-05-14  58  fail:
50f530e176eac8 Richard Fitzgerald 2021-05-14  59  	failed_tests++;
50f530e176eac8 Richard Fitzgerald 2021-05-14  60  	va_end(ap);
50f530e176eac8 Richard Fitzgerald 2021-05-14  61  }
50f530e176eac8 Richard Fitzgerald 2021-05-14  62  =


:::::: The code at line 41 was first introduced by commit
:::::: 50f530e176eac808e64416732e54c0686ce2c39b lib: test_scanf: Add tests =
for sscanf number conversion

:::::: TO: Richard Fitzgerald <rf@opensource.cirrus.com>
:::::: CC: Petr Mladek <pmladek@suse.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5975164173336706527==--

