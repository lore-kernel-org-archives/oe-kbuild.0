Content-Type: multipart/mixed; boundary="===============8717096830013491893=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/crypto/atmel-tdes.c:683:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 29 Mar 2022 12:39:03 +0800
Message-ID: <202203291225.EDI1rH7h-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8717096830013491893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1930a6e739c4b4a654a69164dbe39e554d228915
commit: 817b804ca36747f0c9db667d7d8aa9fdd55335c7 crypto: atmel-tdes - Handl=
e error messages
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20220327 (https://download.01.org/0day-ci/archi=
ve/20220329/202203291225.EDI1rH7h-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D817b804ca36747f0c9db667d7d8aa9fdd55335c7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 817b804ca36747f0c9db667d7d8aa9fdd55335c7
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           list_for_each_entry(hole, &mm->hole_stack, hole_stack) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/gpu/drm/drm_mm.c:941:2: note: Assuming the condition is false
           DRM_MM_BUG_ON(&hole->hole_stack =3D=3D &mm->hole_stack);
           ^
   include/drm/drm_mm.h:52:29: note: expanded from macro 'DRM_MM_BUG_ON'
   #define DRM_MM_BUG_ON(expr) BUG_ON(expr)
                               ^~~~~~~~~~~~
   include/asm-generic/bug.h:161:36: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_mm.c:941:2: note: Taking false branch
           DRM_MM_BUG_ON(&hole->hole_stack =3D=3D &mm->hole_stack);
           ^
   include/drm/drm_mm.h:52:29: note: expanded from macro 'DRM_MM_BUG_ON'
   #define DRM_MM_BUG_ON(expr) BUG_ON(expr)
                               ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/gpu/drm/drm_mm.c:941:2: note: Loop condition is false.  Exiting =
loop
           DRM_MM_BUG_ON(&hole->hole_stack =3D=3D &mm->hole_stack);
           ^
   include/drm/drm_mm.h:52:29: note: expanded from macro 'DRM_MM_BUG_ON'
   #define DRM_MM_BUG_ON(expr) BUG_ON(expr)
                               ^
   include/asm-generic/bug.h:161:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/gpu/drm/drm_mm.c:942:6: note: Assuming the condition is false
           if (unlikely(&hole->hole_stack =3D=3D &mm->hole_stack))
               ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_mm.c:942:2: note: Taking false branch
           if (unlikely(&hole->hole_stack =3D=3D &mm->hole_stack))
           ^
   drivers/gpu/drm/drm_mm.c:945:27: note: The left operand of '>' is a garb=
age value
           DRM_MM_BUG_ON(hole_start > scan->hit_start);
                                    ^
   include/drm/drm_mm.h:52:36: note: expanded from macro 'DRM_MM_BUG_ON'
   #define DRM_MM_BUG_ON(expr) BUG_ON(expr)
                                      ^~~~
   include/asm-generic/bug.h:161:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   Suppressed 2 warnings (2 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   crypto/asymmetric_keys/verify_pefile.c:113:14: warning: Although the val=
ue stored to 'secs' is used in the enclosing expression, the value is never=
 actually read from 'secs' [clang-analyzer-deadcode.DeadStores]
           ctx->secs =3D secs =3D pebuf + cursor;
                       ^      ~~~~~~~~~~~~~~
   crypto/asymmetric_keys/verify_pefile.c:113:14: note: Although the value =
stored to 'secs' is used in the enclosing expression, the value is never ac=
tually read from 'secs'
           ctx->secs =3D secs =3D pebuf + cursor;
                       ^      ~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
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
   drivers/char/hw_random/ixp4xx-rng.c:44:17: warning: Value stored to 'dev=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct device *dev =3D &pdev->dev;
                          ^~~   ~~~~~~~~~~
   drivers/char/hw_random/ixp4xx-rng.c:44:17: note: Value stored to 'dev' d=
uring its initialization is never read
           struct device *dev =3D &pdev->dev;
                          ^~~   ~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (2 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (2 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/crypto/atmel-tdes.c:683:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D ctx->dd->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/crypto/atmel-tdes.c:683:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D ctx->dd->dev;
                          ^~~   ~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
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
   3 warnings generated.
   crypto/asymmetric_keys/public_key.c:91:3: warning: Call to function 'str=
cpy' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
                   strcpy(alg_name, pkey->pkey_algo);
                   ^~~~~~
   crypto/asymmetric_keys/public_key.c:91:3: note: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119
                   strcpy(alg_name, pkey->pkey_algo);
                   ^~~~~~
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/leds/led-core.c:472:30: warning: Access to field 'name' results =
in a dereference of a null pointer [clang-analyzer-core.NullDereference]
                   strscpy(led_classdev_name, to_of_node(fwnode)->name,
                                              ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/leds/led-core.c:424:2: note: Taking false branch
           BUG_ON(props.color =3D=3D LED_COLOR_ID_MULTI);
           ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/leds/led-core.c:424:2: note: Loop condition is false.  Exiting l=
oop
           BUG_ON(props.color =3D=3D LED_COLOR_ID_MULTI);
           ^
   include/asm-generic/bug.h:161:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/leds/led-core.c:426:6: note: Assuming 'led_classdev_name' is non=
-null
           if (!led_classdev_name)
               ^~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:426:2: note: Taking false branch
           if (!led_classdev_name)
           ^
   drivers/leds/led-core.c:429:2: note: Calling 'led_parse_fwnode_props'
           led_parse_fwnode_props(dev, fwnode, &props);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:370:6: note: Assuming 'fwnode' is non-null
           if (!fwnode)
               ^~~~~~~
   drivers/leds/led-core.c:370:2: note: Taking false branch
           if (!fwnode)
           ^
   drivers/leds/led-core.c:373:6: note: Assuming the condition is false
           if (fwnode_property_present(fwnode, "label")) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:373:2: note: Taking false branch
           if (fwnode_property_present(fwnode, "label")) {
           ^
   drivers/leds/led-core.c:380:6: note: Assuming the condition is false
           if (fwnode_property_present(fwnode, "color")) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:380:2: note: Taking false branch
           if (fwnode_property_present(fwnode, "color")) {
           ^
   drivers/leds/led-core.c:391:6: note: Assuming the condition is true
           if (!fwnode_property_present(fwnode, "function"))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:391:2: note: Taking true branch
           if (!fwnode_property_present(fwnode, "function"))
           ^
   drivers/leds/led-core.c:392:3: note: Returning without writing to 'props=
->label', which participates in a condition later
                   return;
                   ^
   drivers/leds/led-core.c:392:3: note: Returning without writing to 'props=
->function', which participates in a condition later
   drivers/leds/led-core.c:392:3: note: Returning without writing to 'props=
->color_present', which participates in a condition later
   drivers/leds/led-core.c:429:2: note: Returning from 'led_parse_fwnode_pr=
ops'
           led_parse_fwnode_props(dev, fwnode, &props);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   include/linux/clk.h:954:2: note: Taking false branch
           if (ret)
           ^
   include/linux/clk.h:957:2: note: Returning zero (loaded from 'ret'), whi=
ch participates in a condition later
           return ret;
           ^~~~~~~~~~
   drivers/clocksource/timer-atmel-tcb.c:264:8: note: Returning from 'clk_p=
repare_enable'
           ret =3D clk_prepare_enable(t2_clk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-atmel-tcb.c:265:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/clocksource/timer-atmel-tcb.c:265:2: note: Taking false branch
           if (ret)
           ^
   drivers/clocksource/timer-atmel-tcb.c:271:6: note: 'bits' is equal to 32
           if (bits =3D=3D 32) {
               ^~~~
   drivers/clocksource/timer-atmel-tcb.c:271:2: note: Taking true branch
           if (bits =3D=3D 32) {
           ^
   drivers/clocksource/timer-atmel-tcb.c:290:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/clocksource/timer-atmel-tcb.c:290:2: note: Taking false branch
           if (ret) {
           ^
   drivers/clocksource/timer-atmel-tcb.c:297:66: note: The result of the le=
ft shift is undefined due to shifting by '32', which is greater or equal to=
 the width of type 'unsigned long'
           clockevents_config_and_register(&clkevt.clkevt, clkevt.rate, 1, =
BIT(bits) - 1);
                                                                           ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   lib/list_sort.c:243:28: warning: Access to field 'prev' results in a der=
eference of a null pointer (loaded from variable 'pending') [clang-analyzer=
-core.NullDereference]
                   struct list_head *next =3D pending->prev;
                                            ^~~~~~~
   lib/list_sort.c:187:40: note: 'pending' initialized to a null pointer va=
lue
           struct list_head *list =3D head->next, *pending =3D NULL;
                                                 ^~~~~~~
   lib/list_sort.c:190:6: note: Assuming 'list' is not equal to field 'prev'
           if (list =3D=3D head->prev) /* Zero or one elements */
               ^~~~~~~~~~~~~~~~~~
   lib/list_sort.c:190:2: note: Taking false branch
           if (list =3D=3D head->prev) /* Zero or one elements */
           ^
   lib/list_sort.c:219:3: note: Loop condition is false. Execution continue=
s on line 222
                   for (bits =3D count; bits & 1; bits >>=3D 1)
                   ^
   lib/list_sort.c:222:3: note: Taking false branch
                   if (likely(bits)) {
                   ^
   lib/list_sort.c:232:3: note: Null pointer value stored to field 'prev'
                   list->prev =3D pending;
                   ^~~~~~~~~~~~~~~~~~~~
   lib/list_sort.c:214:2: note: Loop condition is false.  Exiting loop
           do {
           ^
   lib/list_sort.c:241:2: note: Null pointer value stored to 'pending'
           pending =3D pending->prev;
           ^~~~~~~~~~~~~~~~~~~~~~~
   lib/list_sort.c:242:2: note: Loop condition is true.  Entering loop body
           for (;;) {
           ^
   lib/list_sort.c:243:28: note: Access to field 'prev' results in a derefe=
rence of a null pointer (loaded from variable 'pending')
                   struct list_head *next =3D pending->prev;
                                            ^~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/iio/gyro/itg3200_core.c:94:3: warning: Value stored to 'ret' is =
never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D itg3200_read_reg_s16(indio_dev, reg, val);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/gyro/itg3200_core.c:94:3: note: Value stored to 'ret' is nev=
er read
                   ret =3D itg3200_read_reg_s16(indio_dev, reg, val);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/gyro/itg3200_core.c:370:18: warning: Value stored to 'st' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct itg3200 *st =3D iio_priv(indio_dev);
                           ^~   ~~~~~~~~~~~~~~~~~~~
   drivers/iio/gyro/itg3200_core.c:370:18: note: Value stored to 'st' durin=
g its initialization is never read
           struct itg3200 *st =3D iio_priv(indio_dev);
                           ^~   ~~~~~~~~~~~~~~~~~~~
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
>> drivers/crypto/atmel-tdes.c:683:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D ctx->dd->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/crypto/atmel-tdes.c:683:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D ctx->dd->dev;
                          ^~~   ~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/crypto/ccree/cc_driver.c:105:17: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D drvdata_to_dev(drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_driver.c:105:17: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct device *dev =3D drvdata_to_dev(drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_driver.c:231:3: warning: Value stored to 'axi_er=
r' is never read [clang-analyzer-deadcode.DeadStores]
                   axi_err =3D cc_ioread(drvdata, CC_REG(AXIM_MON_ERR));
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_driver.c:231:3: note: Value stored to 'axi_err' =
is never read
                   axi_err =3D cc_ioread(drvdata, CC_REG(AXIM_MON_ERR));
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_driver.c:275:17: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D drvdata_to_dev(drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_driver.c:275:17: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct device *dev =3D drvdata_to_dev(drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (4 in non-user code, 5 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/crypto/ccree/cc_request_mgr.c:190:17: warning: Value stored to '=
dev' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct device *dev =3D drvdata_to_dev(drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_request_mgr.c:190:17: note: Value stored to 'dev=
' during its initialization is never read
           struct device *dev =3D drvdata_to_dev(drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_request_mgr.c:335:17: warning: Value stored to '=
dev' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct device *dev =3D drvdata_to_dev(drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_request_mgr.c:335:17: note: Value stored to 'dev=
' during its initialization is never read
           struct device *dev =3D drvdata_to_dev(drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_request_mgr.c:364:9: warning: Use of memory afte=
r it is freed [clang-analyzer-unix.Malloc]
                   req =3D creq->user_arg;
                         ^
   drivers/crypto/ccree/cc_request_mgr.c:622:2: note: Taking false branch
           dev_dbg(dev, "Completion handler called!\n");
           ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/crypto/ccree/cc_request_mgr.c:634:2: note: Taking false branch
           dev_dbg(dev, "AXI completion after updated: %d\n",
           ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/crypto/ccree/cc_request_mgr.c:637:2: note: Loop condition is fal=
se. Execution continues on line 658
           while (request_mgr_handle->axi_completed) {
           ^
   drivers/crypto/ccree/cc_request_mgr.c:661:2: note: Calling 'cc_proc_back=
log'
           cc_proc_backlog(drvdata);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_request_mgr.c:356:2: note: Loop condition is tru=
e.  Entering loop body
           while (mgr->bl_len) {
           ^
   drivers/crypto/ccree/cc_request_mgr.c:357:9: note: Left side of '&&' is =
false
                   bli =3D list_first_entry(&mgr->backlog, struct cc_bl_ite=
m, list);
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
   drivers/crypto/ccree/cc_request_mgr.c:357:9: note: Taking false branch
                   bli =3D list_first_entry(&mgr->backlog, struct cc_bl_ite=
m, list);
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
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'

vim +/dev +683 drivers/crypto/atmel-tdes.c

13802005d8f2db2 Nicolas Royer  2012-07-01  677  =

967d4910ef0e832 Ard Biesheuvel 2019-11-09  678  static int atmel_tdes_crypt=
(struct skcipher_request *req, unsigned long mode)
13802005d8f2db2 Nicolas Royer  2012-07-01  679  {
61b0dd664fa1873 Tudor Ambarus  2019-11-15  680  	struct crypto_skcipher *sk=
cipher =3D crypto_skcipher_reqtfm(req);
61b0dd664fa1873 Tudor Ambarus  2019-11-15  681  	struct atmel_tdes_ctx *ctx=
 =3D crypto_skcipher_ctx(skcipher);
967d4910ef0e832 Ard Biesheuvel 2019-11-09  682  	struct atmel_tdes_reqctx *=
rctx =3D skcipher_request_ctx(req);
817b804ca36747f Tudor Ambarus  2021-07-20 @683  	struct device *dev =3D ctx=
->dd->dev;
13802005d8f2db2 Nicolas Royer  2012-07-01  684  =

848572f81772149 Tudor Ambarus  2019-12-05  685  	switch (mode & TDES_FLAGS_=
OPMODE_MASK) {
848572f81772149 Tudor Ambarus  2019-12-05  686  	case TDES_FLAGS_CFB8:
967d4910ef0e832 Ard Biesheuvel 2019-11-09  687  		if (!IS_ALIGNED(req->cryp=
tlen, CFB8_BLOCK_SIZE)) {
817b804ca36747f Tudor Ambarus  2021-07-20  688  			dev_dbg(dev, "request si=
ze is not exact amount of CFB8 blocks\n");
13802005d8f2db2 Nicolas Royer  2012-07-01  689  			return -EINVAL;
13802005d8f2db2 Nicolas Royer  2012-07-01  690  		}
1f858040c2f7801 Nicolas Royer  2013-02-20  691  		ctx->block_size =3D CFB8_=
BLOCK_SIZE;
848572f81772149 Tudor Ambarus  2019-12-05  692  		break;
848572f81772149 Tudor Ambarus  2019-12-05  693  =

848572f81772149 Tudor Ambarus  2019-12-05  694  	case TDES_FLAGS_CFB16:
967d4910ef0e832 Ard Biesheuvel 2019-11-09  695  		if (!IS_ALIGNED(req->cryp=
tlen, CFB16_BLOCK_SIZE)) {
817b804ca36747f Tudor Ambarus  2021-07-20  696  			dev_dbg(dev, "request si=
ze is not exact amount of CFB16 blocks\n");
13802005d8f2db2 Nicolas Royer  2012-07-01  697  			return -EINVAL;
13802005d8f2db2 Nicolas Royer  2012-07-01  698  		}
1f858040c2f7801 Nicolas Royer  2013-02-20  699  		ctx->block_size =3D CFB16=
_BLOCK_SIZE;
848572f81772149 Tudor Ambarus  2019-12-05  700  		break;
848572f81772149 Tudor Ambarus  2019-12-05  701  =

848572f81772149 Tudor Ambarus  2019-12-05  702  	case TDES_FLAGS_CFB32:
967d4910ef0e832 Ard Biesheuvel 2019-11-09  703  		if (!IS_ALIGNED(req->cryp=
tlen, CFB32_BLOCK_SIZE)) {
817b804ca36747f Tudor Ambarus  2021-07-20  704  			dev_dbg(dev, "request si=
ze is not exact amount of CFB32 blocks\n");
13802005d8f2db2 Nicolas Royer  2012-07-01  705  			return -EINVAL;
13802005d8f2db2 Nicolas Royer  2012-07-01  706  		}
1f858040c2f7801 Nicolas Royer  2013-02-20  707  		ctx->block_size =3D CFB32=
_BLOCK_SIZE;
848572f81772149 Tudor Ambarus  2019-12-05  708  		break;
848572f81772149 Tudor Ambarus  2019-12-05  709  =

848572f81772149 Tudor Ambarus  2019-12-05  710  	default:
967d4910ef0e832 Ard Biesheuvel 2019-11-09  711  		if (!IS_ALIGNED(req->cryp=
tlen, DES_BLOCK_SIZE)) {
817b804ca36747f Tudor Ambarus  2021-07-20  712  			dev_dbg(dev, "request si=
ze is not exact amount of DES blocks\n");
13802005d8f2db2 Nicolas Royer  2012-07-01  713  			return -EINVAL;
13802005d8f2db2 Nicolas Royer  2012-07-01  714  		}
1f858040c2f7801 Nicolas Royer  2013-02-20  715  		ctx->block_size =3D DES_B=
LOCK_SIZE;
848572f81772149 Tudor Ambarus  2019-12-05  716  		break;
1f858040c2f7801 Nicolas Royer  2013-02-20  717  	}
13802005d8f2db2 Nicolas Royer  2012-07-01  718  =

1f858040c2f7801 Nicolas Royer  2013-02-20  719  	rctx->mode =3D mode;
1f858040c2f7801 Nicolas Royer  2013-02-20  720  =

c65d123742a7bf2 Tudor Ambarus  2019-12-05  721  	if ((mode & TDES_FLAGS_OPM=
ODE_MASK) !=3D TDES_FLAGS_ECB &&
c65d123742a7bf2 Tudor Ambarus  2019-12-05  722  	    !(mode & TDES_FLAGS_EN=
CRYPT) && req->src =3D=3D req->dst) {
61b0dd664fa1873 Tudor Ambarus  2019-11-15  723  		unsigned int ivsize =3D c=
rypto_skcipher_ivsize(skcipher);
61b0dd664fa1873 Tudor Ambarus  2019-11-15  724  =

61b0dd664fa1873 Tudor Ambarus  2019-11-15  725  		if (req->cryptlen >=3D iv=
size)
61b0dd664fa1873 Tudor Ambarus  2019-11-15  726  			scatterwalk_map_and_copy=
(rctx->lastc, req->src,
61b0dd664fa1873 Tudor Ambarus  2019-11-15  727  						 req->cryptlen - ivsi=
ze,
61b0dd664fa1873 Tudor Ambarus  2019-11-15  728  						 ivsize, 0);
61b0dd664fa1873 Tudor Ambarus  2019-11-15  729  	}
61b0dd664fa1873 Tudor Ambarus  2019-11-15  730  =

1f858040c2f7801 Nicolas Royer  2013-02-20  731  	return atmel_tdes_handle_q=
ueue(ctx->dd, req);
1f858040c2f7801 Nicolas Royer  2013-02-20  732  }
1f858040c2f7801 Nicolas Royer  2013-02-20  733  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8717096830013491893==--

