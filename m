Content-Type: multipart/mixed; boundary="===============4014828195310519799=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/rtc/rtc-ab-eoz9.c:556:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 26 Nov 2021 14:54:31 +0800
Message-ID: <202111261419.p32V0t9D-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4014828195310519799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Liam Beguin <lvb@xiphos.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a4849f6000e29235a2707f22e39da6b897bb9543
commit: e70e52e1bf1d6d0ea60e2f8294d5e76a8d8f5370 rtc: ab-eoz9: add alarm su=
pport
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20211118 (https://download.01.org/0day-ci/archi=
ve/20211126/202111261419.p32V0t9D-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c46bec=
f500df2a7fb4b4fce16178a036c344315a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De70e52e1bf1d6d0ea60e2f8294d5e76a8d8f5370
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e70e52e1bf1d6d0ea60e2f8294d5e76a8d8f5370
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   fs/splice.c:725:2: warning: Undefined or garbage value returned to calle=
r [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   fs/splice.c:630:2: note: 'ret' declared without an initial value
           ssize_t ret;
           ^~~~~~~~~~~
   fs/splice.c:632:15: note: Assuming 'array' is non-null
           if (unlikely(!array))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/splice.c:632:2: note: Taking false branch
           if (unlikely(!array))
           ^
   fs/splice.c:638:2: note: Loop condition is false. Execution continues on=
 line 717
           while (sd.total_len) {
           ^
   fs/splice.c:722:9: note: Field 'num_spliced' is 0
           if (sd.num_spliced)
                  ^
   fs/splice.c:722:2: note: Taking false branch
           if (sd.num_spliced)
           ^
   fs/splice.c:725:2: note: Undefined or garbage value returned to caller
           return ret;
           ^      ~~~
   fs/splice.c:853:2: warning: Value stored to 'ret' is never read [clang-a=
nalyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   fs/splice.c:853:2: note: Value stored to 'ret' is never read
           ret =3D 0;
           ^     ~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/gpu/drm/drm_modes.c:1768:4: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(mode->name, drm_named_modes_whitelist[i]);
                           ^~~~~~
   drivers/gpu/drm/drm_modes.c:1768:4: note: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119
                           strcpy(mode->name, drm_named_modes_whitelist[i]);
                           ^~~~~~
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
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
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
   16 warnings generated.
   drivers/mmc/core/sdio_cis.c:63:3: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(string, buf);
                   ^~~~~~
   drivers/mmc/core/sdio_cis.c:63:3: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                   strcpy(string, buf);
                   ^~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/rtc/rtc-mc146818-lib.c:187:3: warning: Value stored to 'century'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   century =3D bin2bcd(century);
                   ^
   drivers/rtc/rtc-mc146818-lib.c:187:3: note: Value stored to 'century' is=
 never read
   1 warning generated.
>> drivers/rtc/rtc-ab-eoz9.c:556:3: warning: Value stored to 'ret' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   ret =3D device_init_wakeup(dev, true);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-ab-eoz9.c:556:3: note: Value stored to 'ret' is never re=
ad
                   ret =3D device_init_wakeup(dev, true);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/rtc/rtc-abx80x.c:534:3: warning: Value stored to 'status' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   status &=3D ~ABX8XX_STATUS_BLF;
                   ^         ~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-abx80x.c:534:3: note: Value stored to 'status' is never =
read
                   status &=3D ~ABX8XX_STATUS_BLF;
                   ^         ~~~~~~~~~~~~~~~~~~
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
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
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
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
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
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
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 with check filters).
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/platform/chrome/cros_ec_i2c.c:91:2: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D cros_ec_prepare_tx(ec_dev, msg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/chrome/cros_ec_i2c.c:91:2: note: Value stored to 'ret' =
is never read
           ret =3D cros_ec_prepare_tx(ec_dev, msg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
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
--
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/usb/gadget/configfs.c:884:2: note: 'gi' initialized to a null po=
inter value
           struct gadget_info *gi =3D container_of(to_config_group(os_desc_=
ci),
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/configfs.c:886:2: note: 'cdev' initialized to a null =
pointer value
           struct usb_composite_dev *cdev =3D &gi->cdev;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/configfs.c:888:3: note: Left side of '&&' is false
                   container_of(to_config_group(usb_cfg_ci),
                   ^
   include/linux/kernel.h:709:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/usb/gadget/configfs.c:888:3: note: Taking false branch
                   container_of(to_config_group(usb_cfg_ci),
                   ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/usb/gadget/configfs.c:888:3: note: Loop condition is false.  Exi=
ting loop
                   container_of(to_config_group(usb_cfg_ci),
                   ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/usb/gadget/configfs.c:894:2: note: Access to field 'next' result=
s in a dereference of a null pointer
           list_for_each_entry(c, &cdev->configs, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:708:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   mm/mmu_gather.c:85:3: warning: Value stored to 'batch' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   batch =3D tlb->active;
                   ^       ~~~~~~~~~~~
   mm/mmu_gather.c:85:3: note: Value stored to 'batch' is never read
                   batch =3D tlb->active;
                   ^       ~~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   mm/mremap.c:431:3: warning: Value stored to 'extent' is never read [clan=
g-analyzer-deadcode.DeadStores]
                   extent =3D get_extent(NORMAL_PUD, old_addr, old_end, new=
_addr);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   mm/mremap.c:431:3: note: Value stored to 'extent' is never read
                   extent =3D get_extent(NORMAL_PUD, old_addr, old_end, new=
_addr);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/rtc/rtc-mc146818-lib.c:187:3: warning: Value stored to 'century'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   century =3D bin2bcd(century);
                   ^
   drivers/rtc/rtc-mc146818-lib.c:187:3: note: Value stored to 'century' is=
 never read
   1 warning generated.
>> drivers/rtc/rtc-ab-eoz9.c:556:3: warning: Value stored to 'ret' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   ret =3D device_init_wakeup(dev, true);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-ab-eoz9.c:556:3: note: Value stored to 'ret' is never re=
ad
                   ret =3D device_init_wakeup(dev, true);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/rtc/rtc-abx80x.c:534:3: warning: Value stored to 'status' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   status &=3D ~ABX8XX_STATUS_BLF;
                   ^         ~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-abx80x.c:534:3: note: Value stored to 'status' is never =
read
                   status &=3D ~ABX8XX_STATUS_BLF;
                   ^         ~~~~~~~~~~~~~~~~~~
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
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
   include/asm-generic/bug.h:63:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/leds/led-core.c:424:2: note: Loop condition is false.  Exiting l=
oop
           BUG_ON(props.color =3D=3D LED_COLOR_ID_MULTI);
           ^
   include/asm-generic/bug.h:63:27: note: expanded from macro 'BUG_ON'
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
   drivers/leds/led-core.c:431:12: note: Field 'label' is null
           if (props.label) {
                     ^
   drivers/leds/led-core.c:431:2: note: Taking false branch
           if (props.label) {
           ^
   drivers/leds/led-core.c:445:19: note: Field 'function' is null
           } else if (props.function || props.color_present) {
                            ^
   drivers/leds/led-core.c:445:13: note: Left side of '||' is false
           } else if (props.function || props.color_present) {
                      ^
   drivers/leds/led-core.c:445:37: note: Field 'color_present' is false
           } else if (props.function || props.color_present) {
                                              ^
   drivers/leds/led-core.c:445:9: note: Taking false branch
           } else if (props.function || props.color_present) {
                  ^
   drivers/leds/led-core.c:464:13: note: Assuming field 'default_label' is =
null
           } else if (init_data->default_label) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:464:9: note: Taking false branch
           } else if (init_data->default_label) {
                  ^
   drivers/leds/led-core.c:471:13: note: Assuming the condition is true

vim +/ret +556 drivers/rtc/rtc-ab-eoz9.c

67075b63cce26c Artem Panfilov      2019-02-17  502  =

67075b63cce26c Artem Panfilov      2019-02-17  503  static int abeoz9_probe=
(struct i2c_client *client,
67075b63cce26c Artem Panfilov      2019-02-17  504  			const struct i2c_dev=
ice_id *id)
67075b63cce26c Artem Panfilov      2019-02-17  505  {
67075b63cce26c Artem Panfilov      2019-02-17  506  	struct abeoz9_rtc_data=
 *data =3D NULL;
67075b63cce26c Artem Panfilov      2019-02-17  507  	struct device *dev =3D=
 &client->dev;
67075b63cce26c Artem Panfilov      2019-02-17  508  	struct regmap *regmap;
67075b63cce26c Artem Panfilov      2019-02-17  509  	int ret;
67075b63cce26c Artem Panfilov      2019-02-17  510  =

67075b63cce26c Artem Panfilov      2019-02-17  511  	if (!i2c_check_functio=
nality(client->adapter, I2C_FUNC_I2C |
67075b63cce26c Artem Panfilov      2019-02-17  512  				     I2C_FUNC_SMBUS=
_BYTE_DATA |
44c638ce4ec6fb Alexandre Belloni   2019-08-19  513  				     I2C_FUNC_SMBUS=
_I2C_BLOCK))
44c638ce4ec6fb Alexandre Belloni   2019-08-19  514  		return -ENODEV;
67075b63cce26c Artem Panfilov      2019-02-17  515  =

67075b63cce26c Artem Panfilov      2019-02-17  516  	regmap =3D devm_regmap=
_init_i2c(client, &abeoz9_rtc_regmap_config);
67075b63cce26c Artem Panfilov      2019-02-17  517  	if (IS_ERR(regmap)) {
67075b63cce26c Artem Panfilov      2019-02-17  518  		ret =3D PTR_ERR(regma=
p);
67075b63cce26c Artem Panfilov      2019-02-17  519  		dev_err(dev, "regmap =
allocation failed: %d\n", ret);
44c638ce4ec6fb Alexandre Belloni   2019-08-19  520  		return ret;
67075b63cce26c Artem Panfilov      2019-02-17  521  	}
67075b63cce26c Artem Panfilov      2019-02-17  522  =

67075b63cce26c Artem Panfilov      2019-02-17  523  	data =3D devm_kzalloc(=
dev, sizeof(*data), GFP_KERNEL);
44c638ce4ec6fb Alexandre Belloni   2019-08-19  524  	if (!data)
44c638ce4ec6fb Alexandre Belloni   2019-08-19  525  		return -ENOMEM;
67075b63cce26c Artem Panfilov      2019-02-17  526  =

67075b63cce26c Artem Panfilov      2019-02-17  527  	data->regmap =3D regma=
p;
67075b63cce26c Artem Panfilov      2019-02-17  528  	dev_set_drvdata(dev, d=
ata);
67075b63cce26c Artem Panfilov      2019-02-17  529  =

67075b63cce26c Artem Panfilov      2019-02-17  530  	ret =3D abeoz9_rtc_set=
up(dev, client->dev.of_node);
67075b63cce26c Artem Panfilov      2019-02-17  531  	if (ret)
44c638ce4ec6fb Alexandre Belloni   2019-08-19  532  		return ret;
67075b63cce26c Artem Panfilov      2019-02-17  533  =

67075b63cce26c Artem Panfilov      2019-02-17  534  	data->rtc =3D devm_rtc=
_allocate_device(dev);
67075b63cce26c Artem Panfilov      2019-02-17  535  	ret =3D PTR_ERR_OR_ZER=
O(data->rtc);
67075b63cce26c Artem Panfilov      2019-02-17  536  	if (ret)
44c638ce4ec6fb Alexandre Belloni   2019-08-19  537  		return ret;
67075b63cce26c Artem Panfilov      2019-02-17  538  =

67075b63cce26c Artem Panfilov      2019-02-17  539  	data->rtc->ops =3D &rt=
c_ops;
67075b63cce26c Artem Panfilov      2019-02-17  540  	data->rtc->range_min =
=3D RTC_TIMESTAMP_BEGIN_2000;
67075b63cce26c Artem Panfilov      2019-02-17  541  	data->rtc->range_max =
=3D RTC_TIMESTAMP_END_2099;
e70e52e1bf1d6d Liam Beguin         2021-04-07  542  	data->rtc->uie_unsuppo=
rted =3D 1;
e70e52e1bf1d6d Liam Beguin         2021-04-07  543  =

e70e52e1bf1d6d Liam Beguin         2021-04-07  544  	if (client->irq > 0) {
e70e52e1bf1d6d Liam Beguin         2021-04-07  545  		ret =3D devm_request_=
threaded_irq(dev, client->irq, NULL,
e70e52e1bf1d6d Liam Beguin         2021-04-07  546  						abeoz9_rtc_irq,
e70e52e1bf1d6d Liam Beguin         2021-04-07  547  						IRQF_TRIGGER_LOW =
| IRQF_ONESHOT,
e70e52e1bf1d6d Liam Beguin         2021-04-07  548  						dev_name(dev), de=
v);
e70e52e1bf1d6d Liam Beguin         2021-04-07  549  		if (ret) {
e70e52e1bf1d6d Liam Beguin         2021-04-07  550  			dev_err(dev, "failed=
 to request alarm irq\n");
e70e52e1bf1d6d Liam Beguin         2021-04-07  551  			return ret;
e70e52e1bf1d6d Liam Beguin         2021-04-07  552  		}
e70e52e1bf1d6d Liam Beguin         2021-04-07  553  	}
e70e52e1bf1d6d Liam Beguin         2021-04-07  554  =

e70e52e1bf1d6d Liam Beguin         2021-04-07  555  	if (client->irq > 0 ||=
 device_property_read_bool(dev, "wakeup-source")) {
e70e52e1bf1d6d Liam Beguin         2021-04-07 @556  		ret =3D device_init_w=
akeup(dev, true);
e70e52e1bf1d6d Liam Beguin         2021-04-07  557  		data->rtc->ops =3D &r=
tc_alarm_ops;
e70e52e1bf1d6d Liam Beguin         2021-04-07  558  	}
67075b63cce26c Artem Panfilov      2019-02-17  559  =

fdcfd854333be5 Bartosz Golaszewski 2020-11-09  560  	ret =3D devm_rtc_regis=
ter_device(data->rtc);
67075b63cce26c Artem Panfilov      2019-02-17  561  	if (ret)
44c638ce4ec6fb Alexandre Belloni   2019-08-19  562  		return ret;
67075b63cce26c Artem Panfilov      2019-02-17  563  =

67075b63cce26c Artem Panfilov      2019-02-17  564  	abeoz9_hwmon_register(=
dev, data);
67075b63cce26c Artem Panfilov      2019-02-17  565  	return 0;
67075b63cce26c Artem Panfilov      2019-02-17  566  }
67075b63cce26c Artem Panfilov      2019-02-17  567  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4014828195310519799==--

