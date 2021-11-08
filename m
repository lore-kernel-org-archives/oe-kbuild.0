Content-Type: multipart/mixed; boundary="===============7503404774098519125=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/drm_fb_helper.c:416:21: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 08 Nov 2021 11:02:48 +0800
Message-ID: <202111081144.VPshMYWG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7503404774098519125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Sam Ravnborg <sam@ravnborg.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6b75d88fa81b122cce37ebf17428a849ccd3d0f1
commit: 1d46491d4a08d7ee657e09808f87d169444a2652 drm/fb-helper: Move damage=
 blit code and its setup into separate routine
date:   12 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 12 months ago
config: mips-randconfig-c004-20210928 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dc6e8d=
fdfe7efecfda318d43a06fae18b40eb498)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D1d46491d4a08d7ee657e09808f87d169444a2652
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1d46491d4a08d7ee657e09808f87d169444a2652
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/mfd/twl-core.c:1168:28: note: Assuming 'pdata' is null
           clocks_init(&client->dev, pdata ? pdata->clock : NULL);
                                     ^~~~~
   drivers/mfd/twl-core.c:1168:28: note: '?' condition is false
   drivers/mfd/twl-core.c:1168:2: note: Calling 'clocks_init'
           clocks_init(&client->dev, pdata ? pdata->clock : NULL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:998:8: note: Value assigned to field 'irq', which=
 participates in a condition later
           osc =3D clk_get(dev, "fck");
                 ^~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:999:2: note: Taking true branch
           if (IS_ERR(osc)) {
           ^
   drivers/mfd/twl-core.c:1168:2: note: Returning from 'clocks_init'
           clocks_init(&client->dev, pdata ? pdata->clock : NULL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:1171:2: note: Taking false branch
           if (twl_class_is_4030()) {
           ^
   drivers/mfd/twl-core.c:1177:6: note: Assuming field 'irq' is not equal t=
o 0
           if (client->irq) {
               ^~~~~~~~~~~
   drivers/mfd/twl-core.c:1177:2: note: Taking true branch
           if (client->irq) {
           ^
   drivers/mfd/twl-core.c:1178:3: note: Taking false branch
                   if (twl_class_is_4030()) {
                   ^
   drivers/mfd/twl-core.c:1185:7: note: Assuming 'irq_base' is >=3D 0
                   if (irq_base < 0) {
                       ^~~~~~~~~~~~
   drivers/mfd/twl-core.c:1185:3: note: Taking false branch
                   if (irq_base < 0) {
                   ^
   drivers/mfd/twl-core.c:1201:6: note: Calling 'twl_class_is_4030'
           if (twl_class_is_4030()) {
               ^~~~~~~~~~~~~~~~~~~
   include/linux/mfd/twl.h:160:1: note: Assuming the condition is true
   TWL_CLASS_IS(4030, TWL4030_CLASS_ID)
   ^
   include/linux/mfd/twl.h:157:10: note: expanded from macro 'TWL_CLASS_IS'
           return ((id) =3D=3D (GET_TWL_REV)) ? 1 : 0; \
                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/twl.h:160:1: note: '?' condition is true
   TWL_CLASS_IS(4030, TWL4030_CLASS_ID)
   ^
   include/linux/mfd/twl.h:157:9: note: expanded from macro 'TWL_CLASS_IS'
           return ((id) =3D=3D (GET_TWL_REV)) ? 1 : 0; \
                  ^
   include/linux/mfd/twl.h:160:1: note: Returning the value 1, which partic=
ipates in a condition later
   TWL_CLASS_IS(4030, TWL4030_CLASS_ID)
   ^
   include/linux/mfd/twl.h:157:2: note: expanded from macro 'TWL_CLASS_IS'
           return ((id) =3D=3D (GET_TWL_REV)) ? 1 : 0; \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:1201:6: note: Returning from 'twl_class_is_4030'
           if (twl_class_is_4030()) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:1201:2: note: Taking true branch
           if (twl_class_is_4030()) {
           ^
   drivers/mfd/twl-core.c:1202:3: note: 'temp' declared without an initial =
value
                   u8 temp;
                   ^~~~~~~
   drivers/mfd/twl-core.c:1204:3: note: Calling 'twl_i2c_read_u8'
                   twl_i2c_read_u8(TWL4030_MODULE_INTBR, &temp, REG_GPPUPDC=
TR1);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/mfd/twl.h:180:9: note: Calling 'twl_i2c_read'
           return twl_i2c_read(mod_no, val, reg, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:473:7: note: 'regmap' is null
           if (!regmap)
                ^~~~~~
   drivers/mfd/twl-core.c:473:2: note: Taking true branch
           if (!regmap)
           ^
   drivers/mfd/twl-core.c:474:3: note: Returning without writing to '*value'
                   return -EPERM;
                   ^
   include/linux/mfd/twl.h:180:9: note: Returning from 'twl_i2c_read'
           return twl_i2c_read(mod_no, val, reg, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/twl.h:180:2: note: Returning without writing to '*val'
           return twl_i2c_read(mod_no, val, reg, 1);
           ^
   drivers/mfd/twl-core.c:1204:3: note: Returning from 'twl_i2c_read_u8'
                   twl_i2c_read_u8(TWL4030_MODULE_INTBR, &temp, REG_GPPUPDC=
TR1);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/mfd/twl-core.c:1205:8: note: The left expression of the compound=
 assignment is an uninitialized value. The computed value will also be garb=
age
                   temp &=3D ~(SR_I2C_SDA_CTRL_PU | SR_I2C_SCL_CTRL_PU | \
                   ~~~~ ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/gpu/drm/drm_fb_helper.c:156:24: warning: Value stored to 'helper=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct drm_fb_helper *helper =3D info->par;
                                 ^~~~~~   ~~~~~~~~~
   drivers/gpu/drm/drm_fb_helper.c:156:24: note: Value stored to 'helper' d=
uring its initialization is never read
           struct drm_fb_helper *helper =3D info->par;
                                 ^~~~~~   ~~~~~~~~~
>> drivers/gpu/drm/drm_fb_helper.c:416:21: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct drm_device *dev =3D helper->dev;
                              ^~~   ~~~~~~~~~~~
   drivers/gpu/drm/drm_fb_helper.c:416:21: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct drm_device *dev =3D helper->dev;
                              ^~~   ~~~~~~~~~~~
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
   drivers/gpu/drm/selftests/test-drm_mm.c:2181:2: warning: Use of memory a=
fter it is freed [clang-analyzer-unix.Malloc]
           drm_mm_for_each_node_safe(node, nn, &mm) {
           ^
   include/drm/drm_mm.h:374:2: note: expanded from macro 'drm_mm_for_each_n=
ode_safe'
           list_for_each_entry_safe(entry, next, drm_mm_nodes(mm), node_lis=
t)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:852:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:2034:29: note: Assuming '__UNIQU=
E_ID___x319' is >=3D '__UNIQUE_ID___y320'
           const unsigned int count =3D min(4096u, max_iterations);
                                      ^
   include/linux/minmax.h:51:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:2034:29: note: '?' condition is =
false
           const unsigned int count =3D min(4096u, max_iterations);
                                      ^
   include/linux/minmax.h:51:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/gpu/drm/selftests/test-drm_mm.c:2050:14: note: Assuming 'n' is >=
 'count'
           for (n =3D 1; n <=3D count; n++) {
                       ^~~~~~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:2050:2: note: Loop condition is =
false. Execution continues on line 2066
           for (n =3D 1; n <=3D count; n++) {
           ^
   drivers/gpu/drm/selftests/test-drm_mm.c:2066:2: note: Left side of '&&' =
is false
           drm_mm_for_each_node_safe(node, nn, &mm) {
           ^
   include/drm/drm_mm.h:374:2: note: expanded from macro 'drm_mm_for_each_n=
ode_safe'
           list_for_each_entry_safe(entry, next, drm_mm_nodes(mm), node_lis=
t)
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
   include/linux/kernel.h:853:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/selftests/test-drm_mm.c:2066:2: note: Taking false branch
           drm_mm_for_each_node_safe(node, nn, &mm) {
           ^
   include/drm/drm_mm.h:374:2: note: expanded from macro 'drm_mm_for_each_n=
ode_safe'
           list_for_each_entry_safe(entry, next, drm_mm_nodes(mm), node_lis=
t)
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:319:2: note: expanded from macro 'compile=
time_assert'
--
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/cardreader/rtsx_usb.c:291:7: note: 'status' is non-null
           if (!status)
                ^~~~~~
   drivers/misc/cardreader/rtsx_usb.c:291:2: note: Taking false branch
           if (!status)
           ^
   drivers/misc/cardreader/rtsx_usb.c:294:6: note: Assuming 'polling_pipe' =
is not equal to 0
           if (polling_pipe =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~
   drivers/misc/cardreader/rtsx_usb.c:294:2: note: Taking false branch
           if (polling_pipe =3D=3D 0) {
           ^
   drivers/misc/cardreader/rtsx_usb.c:308:9: note: Calling 'rtsx_usb_get_st=
atus_with_bulk'
                   ret =3D rtsx_usb_get_status_with_bulk(ucr, status);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/cardreader/rtsx_usb.c:273:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/misc/cardreader/rtsx_usb.c:273:2: note: Taking false branch
           if (ret)
           ^
   drivers/misc/cardreader/rtsx_usb.c:277:6: note: Assuming 'ret' is not eq=
ual to 0
           if (ret)
               ^~~
   drivers/misc/cardreader/rtsx_usb.c:277:2: note: Taking true branch
           if (ret)
           ^
   drivers/misc/cardreader/rtsx_usb.c:278:3: note: Returning without writin=
g to '*status'
                   return ret;
                   ^
   drivers/misc/cardreader/rtsx_usb.c:308:9: note: Returning from 'rtsx_usb=
_get_status_with_bulk'
                   ret =3D rtsx_usb_get_status_with_bulk(ucr, status);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/cardreader/rtsx_usb.c:312:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/misc/cardreader/rtsx_usb.c:312:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/misc/cardreader/rtsx_usb.c:315:2: note: Returning without writin=
g to '*status'
           return 0;
           ^
   drivers/misc/cardreader/rtsx_usb.c:315:2: note: Returning zero, which pa=
rticipates in a condition later
           return 0;
           ^~~~~~~~
   drivers/misc/cardreader/rtsx_usb.c:497:8: note: Returning from 'rtsx_usb=
_get_card_status'
           ret =3D rtsx_usb_get_card_status(ucr, &val);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/cardreader/rtsx_usb.c:502:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/misc/cardreader/rtsx_usb.c:502:2: note: Taking false branch
           if (ret)
           ^
   drivers/misc/cardreader/rtsx_usb.c:505:10: note: The left operand of '&'=
 is a garbage value
           if (val & cd_mask[card])
               ~~~ ^
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
   drivers/gpu/drm/drm_self_refresh_helper.c:85:3: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
   drivers/gpu/drm/drm_self_refresh_helper.c:85:3: note: Value stored to 'r=
et' is never read
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/gpu/drm/drm_fb_helper.c:156:24: warning: Value stored to 'helper=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct drm_fb_helper *helper =3D info->par;
                                 ^~~~~~   ~~~~~~~~~
   drivers/gpu/drm/drm_fb_helper.c:156:24: note: Value stored to 'helper' d=
uring its initialization is never read
           struct drm_fb_helper *helper =3D info->par;
                                 ^~~~~~   ~~~~~~~~~
>> drivers/gpu/drm/drm_fb_helper.c:416:21: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct drm_device *dev =3D helper->dev;
                              ^~~   ~~~~~~~~~~~
   drivers/gpu/drm/drm_fb_helper.c:416:21: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct drm_device *dev =3D helper->dev;
                              ^~~   ~~~~~~~~~~~
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
   drivers/gpu/drm/selftests/test-drm_mm.c:2181:2: warning: Use of memory a=
fter it is freed [clang-analyzer-unix.Malloc]
           drm_mm_for_each_node_safe(node, nn, &mm) {
           ^
   include/drm/drm_mm.h:374:2: note: expanded from macro 'drm_mm_for_each_n=
ode_safe'
           list_for_each_entry_safe(entry, next, drm_mm_nodes(mm), node_lis=
t)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:852:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:2034:29: note: Assuming '__UNIQU=
E_ID___x319' is >=3D '__UNIQUE_ID___y320'
           const unsigned int count =3D min(4096u, max_iterations);
                                      ^
   include/linux/minmax.h:51:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:2034:29: note: '?' condition is =
false
           const unsigned int count =3D min(4096u, max_iterations);
                                      ^
   include/linux/minmax.h:51:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/gpu/drm/selftests/test-drm_mm.c:2050:14: note: Assuming 'n' is >=
 'count'
           for (n =3D 1; n <=3D count; n++) {
                       ^~~~~~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:2050:2: note: Loop condition is =
false. Execution continues on line 2066
           for (n =3D 1; n <=3D count; n++) {
           ^
   drivers/gpu/drm/selftests/test-drm_mm.c:2066:2: note: Left side of '&&' =
is false
           drm_mm_for_each_node_safe(node, nn, &mm) {
           ^
   include/drm/drm_mm.h:374:2: note: expanded from macro 'drm_mm_for_each_n=
ode_safe'
           list_for_each_entry_safe(entry, next, drm_mm_nodes(mm), node_lis=
t)
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
   include/linux/kernel.h:853:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/selftests/test-drm_mm.c:2066:2: note: Taking false branch
           drm_mm_for_each_node_safe(node, nn, &mm) {
           ^
   include/drm/drm_mm.h:374:2: note: expanded from macro 'drm_mm_for_each_n=
ode_safe'
           list_for_each_entry_safe(entry, next, drm_mm_nodes(mm), node_lis=
t)
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:319:2: note: expanded from macro 'compile=
time_assert'

vim +/dev +416 drivers/gpu/drm/drm_fb_helper.c

1d46491d4a08d7 Thomas Zimmermann 2020-11-20  411  =

9622349ea1b623 Thomas Zimmermann 2020-11-20  412  static void drm_fb_helper=
_damage_work(struct work_struct *work)
eaa434defaca17 Noralf Tr=C3=B8nnes    2016-04-28  413  {
eaa434defaca17 Noralf Tr=C3=B8nnes    2016-04-28  414  	struct drm_fb_helpe=
r *helper =3D container_of(work, struct drm_fb_helper,
9622349ea1b623 Thomas Zimmermann 2020-11-20  415  						    damage_work);
1d46491d4a08d7 Thomas Zimmermann 2020-11-20 @416  	struct drm_device *dev =
=3D helper->dev;
9622349ea1b623 Thomas Zimmermann 2020-11-20  417  	struct drm_clip_rect *cl=
ip =3D &helper->damage_clip;
eaa434defaca17 Noralf Tr=C3=B8nnes    2016-04-28  418  	struct drm_clip_rec=
t clip_copy;
eaa434defaca17 Noralf Tr=C3=B8nnes    2016-04-28  419  	unsigned long flags;
a85955568939e2 Thomas Zimmermann 2020-11-03  420  	int ret;
eaa434defaca17 Noralf Tr=C3=B8nnes    2016-04-28  421  =

9622349ea1b623 Thomas Zimmermann 2020-11-20  422  	spin_lock_irqsave(&helpe=
r->damage_lock, flags);
eaa434defaca17 Noralf Tr=C3=B8nnes    2016-04-28  423  	clip_copy =3D *clip;
eaa434defaca17 Noralf Tr=C3=B8nnes    2016-04-28  424  	clip->x1 =3D clip->=
y1 =3D ~0;
eaa434defaca17 Noralf Tr=C3=B8nnes    2016-04-28  425  	clip->x2 =3D clip->=
y2 =3D 0;
9622349ea1b623 Thomas Zimmermann 2020-11-20  426  	spin_unlock_irqrestore(&=
helper->damage_lock, flags);
eaa434defaca17 Noralf Tr=C3=B8nnes    2016-04-28  427  =

2b5f31aaa8d10b Thomas Zimmermann 2020-11-20  428  	/* Call damage handlers =
only if necessary */
2b5f31aaa8d10b Thomas Zimmermann 2020-11-20  429  	if (!(clip_copy.x1 < cli=
p_copy.x2 && clip_copy.y1 < clip_copy.y2))
2b5f31aaa8d10b Thomas Zimmermann 2020-11-20  430  		return;
cf1ca9aeb930df Thomas Zimmermann 2019-07-03  431  =

cf1ca9aeb930df Thomas Zimmermann 2019-07-03  432  	if (helper->buffer) {
1d46491d4a08d7 Thomas Zimmermann 2020-11-20  433  		ret =3D drm_fb_helper_d=
amage_blit(helper, &clip_copy);
1d46491d4a08d7 Thomas Zimmermann 2020-11-20  434  		if (drm_WARN_ONCE(dev, =
ret, "Damage blitter failed: ret=3D%d\n", ret))
cf1ca9aeb930df Thomas Zimmermann 2019-07-03  435  			return;
cf1ca9aeb930df Thomas Zimmermann 2019-07-03  436  	}
222ec45f4c69df Thomas Zimmermann 2020-11-03  437  =

f458579ede0b72 Thomas Zimmermann 2019-07-05  438  	if (helper->fb->funcs->d=
irty)
2b5f31aaa8d10b Thomas Zimmermann 2020-11-20  439  		helper->fb->funcs->dirt=
y(helper->fb, NULL, 0, 0, &clip_copy, 1);
eaa434defaca17 Noralf Tr=C3=B8nnes    2016-04-28  440  }
eaa434defaca17 Noralf Tr=C3=B8nnes    2016-04-28  441  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7503404774098519125==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7503404774098519125==--

