Content-Type: multipart/mixed; boundary="===============5087614175291366447=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/rtc/rtc-ab-eoz9.c:556:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 27 Nov 2021 15:29:24 +0800
Message-ID: <202111271526.x3PNLdVl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5087614175291366447==
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
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: e70e52e1bf1d6d0ea60e2f8294d5e76a8d8f5370 rtc: ab-eoz9: add alarm su=
pport
date:   7 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20211118 (https://download.01.org/0day-ci/archi=
ve/20211127/202111271526.x3PNLdVl-lkp(a)intel.com/config)
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
                   ^
   include/linux/cpumask.h:208:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   drivers/base/cacheinfo.c:275:8: note: 'sibling' is not equal to 'cpu'
                           if (sibling =3D=3D cpu) /* skip itself */
                               ^~~~~~~
   drivers/base/cacheinfo.c:275:4: note: Taking false branch
                           if (sibling =3D=3D cpu) /* skip itself */
                           ^
   drivers/base/cacheinfo.c:279:8: note: Assuming field 'info_list' is null
                           if (!sib_cpu_ci->info_list)
                               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/base/cacheinfo.c:279:4: note: Taking true branch
                           if (!sib_cpu_ci->info_list)
                           ^
   drivers/base/cacheinfo.c:280:5: note:  Execution continues on line 272
                                   continue;
                                   ^
   drivers/base/cacheinfo.c:272:3: note: Loop condition is false. Execution=
 continues on line 286
                   for_each_cpu(sibling, &this_leaf->shared_cpu_map) {
                   ^
   include/linux/cpumask.h:208:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   drivers/base/cacheinfo.c:286:7: note: Calling 'of_have_populated_dt'
                   if (of_have_populated_dt())
                       ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:180:9: note: 'of_root' is not equal to NULL
           return of_root !=3D NULL;
                  ^~~~~~~
   include/linux/of.h:180:2: note: Returning the value 1, which participate=
s in a condition later
           return of_root !=3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/base/cacheinfo.c:286:7: note: Returning from 'of_have_populated_=
dt'
                   if (of_have_populated_dt())
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/base/cacheinfo.c:286:3: note: Taking true branch
                   if (of_have_populated_dt())
                   ^
   drivers/base/cacheinfo.c:287:16: note: Access to field 'fw_token' result=
s in a dereference of a null pointer (loaded from variable 'this_leaf')
                           of_node_put(this_leaf->fw_token);
                                       ^~~~~~~~~
   16 warnings generated.
   fs/sysfs/file.c:54:2: warning: Null pointer passed as 1st argument to me=
mory set function [clang-analyzer-unix.cstring.NullArg]
           memset(buf, 0, PAGE_SIZE);
           ^      ~~~
   fs/sysfs/file.c:49:10: note: Calling 'seq_get_buf'
           count =3D seq_get_buf(sf, &buf);
                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:65:9: note: Assuming field 'count' is <=3D fiel=
d 'size'
           BUG_ON(m->count > m->size);
                  ^
   include/asm-generic/bug.h:63:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/seq_file.h:65:2: note: Taking false branch
           BUG_ON(m->count > m->size);
           ^
   include/asm-generic/bug.h:63:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   include/linux/seq_file.h:65:2: note: Loop condition is false.  Exiting l=
oop
           BUG_ON(m->count > m->size);
           ^
   include/asm-generic/bug.h:63:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   include/linux/seq_file.h:66:6: note: Assuming field 'count' is >=3D fiel=
d 'size'
           if (m->count < m->size)
               ^~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:66:2: note: Taking false branch
           if (m->count < m->size)
           ^
   include/linux/seq_file.h:69:3: note: Null pointer value stored to 'buf'
                   *bufp =3D NULL;
                   ^~~~~~~~~~~~
   fs/sysfs/file.c:49:10: note: Returning from 'seq_get_buf'
           count =3D seq_get_buf(sf, &buf);
                   ^~~~~~~~~~~~~~~~~~~~~
   fs/sysfs/file.c:50:6: note: Assuming the condition is false
           if (count < PAGE_SIZE) {
               ^~~~~~~~~~~~~~~~~
   fs/sysfs/file.c:50:2: note: Taking false branch
           if (count < PAGE_SIZE) {
           ^
   fs/sysfs/file.c:54:2: note: Null pointer passed as 1st argument to memor=
y set function
           memset(buf, 0, PAGE_SIZE);
           ^      ~~~
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
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   include/linux/hid.h:999:9: warning: Access to field 'name' results in a =
dereference of a null pointer (loaded from variable 'input') [clang-analyze=
r-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-belkin.c:32:6: note: Assuming the condition is false
           if ((usage->hid & HID_USAGE_PAGE) !=3D HID_UP_CONSUMER ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-belkin.c:32:6: note: Left side of '||' is false
   drivers/hid/hid-belkin.c:33:4: note: Assuming the condition is false
                           !(quirks & BELKIN_WKBD))
                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-belkin.c:32:2: note: Taking false branch
           if ((usage->hid & HID_USAGE_PAGE) !=3D HID_UP_CONSUMER ||
           ^
   drivers/hid/hid-belkin.c:36:2: note: Control jumps to 'case 60:'  at lin=
e 39
           switch (usage->hid & HID_USAGE) {
           ^
   drivers/hid/hid-belkin.c:39:14: note: Calling 'hid_map_usage_clear'
           case 0x03c: belkin_map_key_clear(KEY_DOCUMENTS);        break;
                       ^
   drivers/hid/hid-belkin.c:24:33: note: expanded from macro 'belkin_map_ke=
y_clear'
   #define belkin_map_key_clear(c) hid_map_usage_clear(hi, usage, bit, max,=
 \
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/hid.h:1027:2: note: Calling 'hid_map_usage'
           hid_map_usage(hidinput, usage, bit, max, type, c);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:974:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:978:2: note: Control jumps to 'case 1:'  at line 987
           switch (type) {
           ^
   include/linux/hid.h:990:3: note:  Execution continues on line 997
                   break;
                   ^
   include/linux/hid.h:997:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:997:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:997:28: note: Assuming 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:997:28: note: Assuming pointer value is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:997:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/hid.h:998:3: note: Assuming the condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:528:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:511:6: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:41:28: note: expanded from macro '__rate=
limit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:998:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:528:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:511:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^
   include/linux/hid.h:999:9: note: Access to field 'name' results in a der=
eference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:528:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
--
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
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   15 warnings generated.
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
   17 warnings generated.
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
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/w1/masters/ds1wm.c:567:2: warning: Value stored to 'inten' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           inten =3D ds1wm_read_register(ds1wm_data, DS1WM_INT_EN);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/masters/ds1wm.c:567:2: note: Value stored to 'inten' is never=
 read
           inten =3D ds1wm_read_register(ds1wm_data, DS1WM_INT_EN);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   17 warnings generated.
   Suppressed 17 warnings (16 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   lib/glob.c:48:32: warning: Assigned value is garbage or undefined [clang=
-analyzer-core.uninitialized.Assign]
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
   lib/glob.c:48:32: note: Assigned value is garbage or undefined
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
   15 warnings generated.
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
   1 warning generated.
   drivers/leds/leds-pca9532.c:514:23: warning: Value stored to 'data' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct pca9532_data *data =3D i2c_get_clientdata(client);
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pca9532.c:514:23: note: Value stored to 'data' during =
its initialization is never read
           struct pca9532_data *data =3D i2c_get_clientdata(client);
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   lib/scatterlist.c:109:10: warning: Access to field 'page_link' results i=
n a dereference of a null pointer (loaded from variable 'ret') [clang-analy=
zer-core.NullDereference]
           BUG_ON(!sg_is_last(ret));
                   ^
   include/linux/scatterlist.h:67:26: note: expanded from macro 'sg_is_last'
   #define sg_is_last(sg)          ((sg)->page_link & SG_END)
                                    ^~~
   include/asm-generic/bug.h:63:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/scatterlist.c:103:27: note: 'ret' initialized to a null pointer value
           struct scatterlist *sg, *ret =3D NULL;
                                    ^~~
   lib/scatterlist.c:106:30: note: Assuming 'i' is >=3D 'nents'
           for_each_sg(sgl, sg, nents, i)
                                       ^
   include/linux/scatterlist.h:146:31: note: expanded from macro 'for_each_=
sg'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
                                        ^~~~~~~~~~
   lib/scatterlist.c:106:2: note: Loop condition is false. Execution contin=
ues on line 109
           for_each_sg(sgl, sg, nents, i)
           ^
   include/linux/scatterlist.h:146:2: note: expanded from macro 'for_each_s=
g'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
           ^
   lib/scatterlist.c:109:10: note: Access to field 'page_link' results in a=
 dereference of a null pointer (loaded from variable 'ret')
           BUG_ON(!sg_is_last(ret));
                   ^
   include/linux/scatterlist.h:67:26: note: expanded from macro 'sg_is_last'
   #define sg_is_last(sg)          ((sg)->page_link & SG_END)
                                    ^~~
   include/asm-generic/bug.h:63:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (15 in non-user code, 1 with check filters).
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
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/video/fbdev/core/fbcvt.c:261:4: warning: Value stored to 'cnt' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           cnt -=3D read;
                           ^      ~~~~
   drivers/video/fbdev/core/fbcvt.c:261:4: note: Value stored to 'cnt' is n=
ever read
                           cnt -=3D read;
                           ^      ~~~~
   drivers/video/fbdev/core/fbcvt.c:262:4: warning: Value stored to 'offset=
' is never read [clang-analyzer-deadcode.DeadStores]
                           offset +=3D read;
                           ^         ~~~~
   drivers/video/fbdev/core/fbcvt.c:262:4: note: Value stored to 'offset' i=
s never read
                           offset +=3D read;

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
--===============5087614175291366447==--

