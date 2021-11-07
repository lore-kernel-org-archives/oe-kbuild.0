Content-Type: multipart/mixed; boundary="===============9175313277178178325=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: samples/vfio-mdev/mtty.c:930:14: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Mon, 08 Nov 2021 02:48:22 +0800
Message-ID: <202111080218.salD3ddq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9175313277178178325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Christoph Hellwig <hch@lst.de>
CC: Cornelia Huck <cohuck@redhat.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Kirti Wankhede <kwankhede@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b5013d084e03e82ceeab4db8ae8ceeaebe76b0eb
commit: af3ab3f9b986cdbc1b97b8a3341ce78851edb0dd vfio/mdev: Remove CONFIG_V=
FIO_MDEV_DEVICE
date:   5 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-c007-20211030 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5db756=
8a6a1fcb408eb8988abdaff2a225a8eb72)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Daf3ab3f9b986cdbc1b97b8a3341ce78851edb0dd
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout af3ab3f9b986cdbc1b97b8a3341ce78851edb0dd
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/hid.h:1002:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   include/linux/hid.h:1002:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:1002:29: note: 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                      ^
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   include/linux/hid.h:1002:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/hid.h:1003:3: note: Assuming the condition is true
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
   include/linux/hid.h:1003:3: note: Taking true branch
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
   include/linux/hid.h:1004:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:528:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:512:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/iio/imu/fxos8700_core.c:167:8: warning: Excessive padding in 'st=
ruct fxos8700_data' (106 padding bytes, where 42 is optimal). =

   Optimal fields order: =

   buf, =

   regmap, =

   trig, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct fxos8700_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/imu/fxos8700_core.c:167:8: note: Excessive padding in 'struc=
t fxos8700_data' (106 padding bytes, where 42 is optimal). Optimal fields o=
rder: buf, regmap, trig, consider reordering the fields or adding explicit =
padding members
   struct fxos8700_data {
   ~~~~~~~^~~~~~~~~~~~~~~
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   drivers/gnss/sirf.c:191:17: warning: Value stored to 'dev' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &data->serdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/gnss/sirf.c:191:17: note: Value stored to 'dev' during its initi=
alization is never read
           struct device *dev =3D &data->serdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> samples/vfio-mdev/mtty.c:930:14: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
                                   int fd =3D *(int *)data;
                                            ^
   samples/vfio-mdev/mtty.c:1118:6: note: Assuming 'mdev' is non-null
           if (!mdev)
               ^~~~~
   samples/vfio-mdev/mtty.c:1118:2: note: Taking false branch
           if (!mdev)
           ^
   samples/vfio-mdev/mtty.c:1121:15: note: Calling 'mdev_get_drvdata'
           mdev_state =3D mdev_get_drvdata(mdev);
                        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mdev.h:159:2: note: Returning without writing to 'mdev->dr=
iver_data', which participates in a condition later
           return mdev->driver_data;
           ^
   include/linux/mdev.h:159:2: note: Returning pointer, which participates =
in a condition later
           return mdev->driver_data;
           ^~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mtty.c:1121:15: note: Returning from 'mdev_get_drvdata'
           mdev_state =3D mdev_get_drvdata(mdev);
                        ^~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mtty.c:1122:6: note: Assuming 'mdev_state' is non-null
           if (!mdev_state)
               ^~~~~~~~~~~
   samples/vfio-mdev/mtty.c:1122:2: note: Taking false branch
           if (!mdev_state)
           ^
   samples/vfio-mdev/mtty.c:1125:2: note: Control jumps to 'case 15214:'  a=
t line 1196
           switch (cmd) {
           ^
   samples/vfio-mdev/mtty.c:1199:7: note: 'data' initialized to a null poin=
ter value
                   u8 *data =3D NULL, *ptr =3D NULL;
                       ^~~~
   samples/vfio-mdev/mtty.c:1204:7: note: Calling 'copy_from_user'
                   if (copy_from_user(&hdr, (void __user *)arg, minsz))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:193:2: note: Returning value (loaded from 'n'), =
which participates in a condition later
           return n;
           ^~~~~~~~
   samples/vfio-mdev/mtty.c:1204:7: note: Returning from 'copy_from_user'
                   if (copy_from_user(&hdr, (void __user *)arg, minsz))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mtty.c:1204:7: note: Assuming the condition is false
                   if (copy_from_user(&hdr, (void __user *)arg, minsz))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mtty.c:1204:3: note: Taking false branch
                   if (copy_from_user(&hdr, (void __user *)arg, minsz))
                   ^
   samples/vfio-mdev/mtty.c:1211:7: note: Assuming 'ret' is 0
                   if (ret)
                       ^~~
   samples/vfio-mdev/mtty.c:1211:3: note: Taking false branch
                   if (ret)
                   ^
   samples/vfio-mdev/mtty.c:1214:7: note: Assuming 'data_size' is 0
                   if (data_size) {
                       ^~~~~~~~~
   samples/vfio-mdev/mtty.c:1214:3: note: Taking false branch
                   if (data_size) {
                   ^
   samples/vfio-mdev/mtty.c:1222:20: note: Passing null pointer value via 6=
th parameter 'data'
                                       hdr.count, data);
                                                  ^~~~
   samples/vfio-mdev/mtty.c:1221:9: note: Calling 'mtty_set_irqs'
                   ret =3D mtty_set_irqs(mdev, hdr.flags, hdr.index, hdr.st=
art,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   samples/vfio-mdev/mtty.c:906:7: note: 'mdev' is non-null
           if (!mdev)
                ^~~~
   samples/vfio-mdev/mtty.c:906:2: note: Taking false branch
           if (!mdev)
           ^
   samples/vfio-mdev/mtty.c:909:15: note: Calling 'mdev_get_drvdata'
           mdev_state =3D mdev_get_drvdata(mdev);
                        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mdev.h:159:2: note: Returning without writing to 'mdev->dr=
iver_data', which participates in a condition later
           return mdev->driver_data;
           ^
   include/linux/mdev.h:159:2: note: Returning pointer, which participates =
in a condition later
           return mdev->driver_data;
           ^~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mtty.c:909:15: note: Returning from 'mdev_get_drvdata'
           mdev_state =3D mdev_get_drvdata(mdev);
                        ^~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mtty.c:910:7: note: 'mdev_state' is non-null
           if (!mdev_state)
                ^~~~~~~~~~
   samples/vfio-mdev/mtty.c:910:2: note: Taking false branch
           if (!mdev_state)
           ^
   samples/vfio-mdev/mtty.c:914:2: note: Control jumps to 'case VFIO_PCI_IN=
TX_IRQ_INDEX:'  at line 915
           switch (index) {
           ^
   samples/vfio-mdev/mtty.c:916:3: note: Control jumps to 'case 32:'  at li=
ne 920
                   switch (flags & VFIO_IRQ_SET_ACTION_TYPE_MASK) {
                   ^
   samples/vfio-mdev/mtty.c:922:8: note: Assuming the condition is false
                           if (flags & VFIO_IRQ_SET_DATA_NONE) {
--
           struct w83793_data *pos, *data =3D NULL;
                                     ^~~~
   drivers/hwmon/w83793.c:1299:6: note: Assuming the condition is false
           if (!mutex_trylock(&watchdog_data_mutex))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/w83793.c:1299:2: note: Taking false branch
           if (!mutex_trylock(&watchdog_data_mutex))
           ^
   drivers/hwmon/w83793.c:1301:2: note: Left side of '&&' is false
           list_for_each_entry(pos, &watchdog_data_list, list) {
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
   include/linux/kernel.h:704:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/hwmon/w83793.c:1301:2: note: Taking false branch
           list_for_each_entry(pos, &watchdog_data_list, list) {
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
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
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
                   if (!(condition))                                       \
                   ^
   drivers/hwmon/w83793.c:1301:2: note: Loop condition is false.  Exiting l=
oop
           list_for_each_entry(pos, &watchdog_data_list, list) {
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
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
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
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/hwmon/w83793.c:1301:2: note: Loop condition is false. Execution =
continues on line 1309
           list_for_each_entry(pos, &watchdog_data_list, list) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/hwmon/w83793.c:1315:6: note: Assuming 'watchdog_is_open' is 0
           if (!watchdog_is_open)
               ^~~~~~~~~~~~~~~~~
   drivers/hwmon/w83793.c:1315:2: note: Taking true branch
           if (!watchdog_is_open)
           ^
   drivers/hwmon/w83793.c:1321:6: note: 'watchdog_is_open' is 0
           if (watchdog_is_open)
               ^~~~~~~~~~~~~~~~
   drivers/hwmon/w83793.c:1321:2: note: Taking false branch
           if (watchdog_is_open)
           ^
   drivers/hwmon/w83793.c:1325:18: note: Passing null pointer value via 1st=
 parameter 'data'
           watchdog_enable(data);
                           ^~~~
   drivers/hwmon/w83793.c:1325:2: note: Calling 'watchdog_enable'
           watchdog_enable(data);
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/w83793.c:1253:7: note: Access to field 'client' results in=
 a dereference of a null pointer (loaded from variable 'data')
           if (!data->client) {
                ^~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> samples/vfio-mdev/mbochs.c:326:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mdev_dev(mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:326:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D mdev_dev(mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:356:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mdev_dev(mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:356:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D mdev_dev(mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:432:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mdev_dev(mdev);
                          ^~~   ~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:432:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D mdev_dev(mdev);
                          ^~~   ~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:722:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mdev_dev(mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:722:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D mdev_dev(mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:795:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mdev_dev(dmabuf->mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:795:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D mdev_dev(dmabuf->mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:810:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mdev_dev(dmabuf->mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:810:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D mdev_dev(dmabuf->mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> samples/vfio-mdev/mbochs.c:811:6: warning: Value stored to 'fourcc' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           u32 fourcc =3D dmabuf->mode.drm_format;
               ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:811:6: note: Value stored to 'fourcc' during =
its initialization is never read
           u32 fourcc =3D dmabuf->mode.drm_format;
               ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:827:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mdev_dev(dmabuf->mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:827:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D mdev_dev(dmabuf->mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:856:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mdev_dev(dmabuf->mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:856:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D mdev_dev(dmabuf->mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:869:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mdev_dev(mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:869:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D mdev_dev(mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:1070:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mdev_dev(mdev);
                          ^~~   ~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:1070:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D mdev_dev(mdev);
                          ^~~   ~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/input/rmi4/rmi_f11.c:1129:2: warning: Value stored to 'query_off=
set' is never read [clang-analyzer-deadcode.DeadStores]
           query_offset +=3D rc;
           ^               ~~
   drivers/input/rmi4/rmi_f11.c:1129:2: note: Value stored to 'query_offset=
' is never read
           query_offset +=3D rc;
           ^               ~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/input/rmi4/rmi_f12.c:133:3: warning: Value stored to 'offset' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   offset +=3D 1;
                   ^         ~
   drivers/input/rmi4/rmi_f12.c:133:3: note: Value stored to 'offset' is ne=
ver read
                   offset +=3D 1;
                   ^         ~
   drivers/input/rmi4/rmi_f12.c:401:2: warning: Value stored to 'query_addr=
' is never read [clang-analyzer-deadcode.DeadStores]
           query_addr +=3D 3;
           ^             ~
   drivers/input/rmi4/rmi_f12.c:401:2: note: Value stored to 'query_addr' i=
s never read
           query_addr +=3D 3;
           ^             ~
   drivers/input/rmi4/rmi_f12.c:520:3: warning: Value stored to 'data_offse=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   data_offset +=3D item->reg_size;
                   ^              ~~~~~~~~~~~~~~
   drivers/input/rmi4/rmi_f12.c:520:3: note: Value stored to 'data_offset' =
is never read
                   data_offset +=3D item->reg_size;
                   ^              ~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/hid/hid-led.c:70:8: warning: Excessive padding in 'struct hidled=
_config' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   short_name, =

   report_size, =

   init, =

   write, =

   type, =

   max_brightness, =

   num_leds, =

   report_type, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct hidled_config {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/hid/hid-led.c:70:8: note: Excessive padding in 'struct hidled_co=
nfig' (8 padding bytes, where 0 is optimal). Optimal fields order: name, sh=
ort_name, report_size, init, write, type, max_brightness, num_leds, report_=
type, consider reordering the fields or adding explicit padding members
   struct hidled_config {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   net/core/datagram.c:305:5: warning: 5th function call argument is an uni=
nitialized value [clang-analyzer-core.CallAndMessage]
                    !__skb_wait_for_more_packets(sk, sk_queue, err,
                     ^

vim +930 samples/vfio-mdev/mtty.c

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  898  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  899  static int mtty_set_irqs(str=
uct mdev_device *mdev, uint32_t flags,
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  900  			 unsigned int index, unsi=
gned int start,
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  901  			 unsigned int count, void=
 *data)
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  902  {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  903  	int ret =3D 0;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  904  	struct mdev_state *mdev_sta=
te;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  905  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  906  	if (!mdev)
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  907  		return -EINVAL;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  908  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  909  	mdev_state =3D mdev_get_drv=
data(mdev);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  910  	if (!mdev_state)
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  911  		return -EINVAL;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  912  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  913  	mutex_lock(&mdev_state->ops=
_lock);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  914  	switch (index) {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  915  	case VFIO_PCI_INTX_IRQ_INDE=
X:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  916  		switch (flags & VFIO_IRQ_S=
ET_ACTION_TYPE_MASK) {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  917  		case VFIO_IRQ_SET_ACTION_M=
ASK:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  918  		case VFIO_IRQ_SET_ACTION_U=
NMASK:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  919  			break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  920  		case VFIO_IRQ_SET_ACTION_T=
RIGGER:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  921  		{
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  922  			if (flags & VFIO_IRQ_SET_=
DATA_NONE) {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  923  				pr_info("%s: disable INT=
x\n", __func__);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  924  				if (mdev_state->intx_evt=
fd)
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  925  					eventfd_ctx_put(mdev_st=
ate->intx_evtfd);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  926  				break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  927  			}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  928  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  929  			if (flags & VFIO_IRQ_SET_=
DATA_EVENTFD) {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17 @930  				int fd =3D *(int *)data;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  931  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  932  				if (fd > 0) {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  933  					struct eventfd_ctx *evt;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  934  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  935  					evt =3D eventfd_ctx_fdg=
et(fd);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  936  					if (IS_ERR(evt)) {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  937  						ret =3D PTR_ERR(evt);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  938  						break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  939  					}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  940  					mdev_state->intx_evtfd =
=3D evt;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  941  					mdev_state->irq_fd =3D =
fd;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  942  					mdev_state->irq_index =
=3D index;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  943  					break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  944  				}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  945  			}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  946  			break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  947  		}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  948  		}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  949  		break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  950  	case VFIO_PCI_MSI_IRQ_INDEX:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  951  		switch (flags & VFIO_IRQ_S=
ET_ACTION_TYPE_MASK) {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  952  		case VFIO_IRQ_SET_ACTION_M=
ASK:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  953  		case VFIO_IRQ_SET_ACTION_U=
NMASK:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  954  			break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  955  		case VFIO_IRQ_SET_ACTION_T=
RIGGER:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  956  			if (flags & VFIO_IRQ_SET_=
DATA_NONE) {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  957  				if (mdev_state->msi_evtf=
d)
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  958  					eventfd_ctx_put(mdev_st=
ate->msi_evtfd);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  959  				pr_info("%s: disable MSI=
\n", __func__);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  960  				mdev_state->irq_index =
=3D VFIO_PCI_INTX_IRQ_INDEX;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  961  				break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  962  			}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  963  			if (flags & VFIO_IRQ_SET_=
DATA_EVENTFD) {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  964  				int fd =3D *(int *)data;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  965  				struct eventfd_ctx *evt;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  966  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  967  				if (fd <=3D 0)
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  968  					break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  969  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  970  				if (mdev_state->msi_evtf=
d)
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  971  					break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  972  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  973  				evt =3D eventfd_ctx_fdge=
t(fd);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  974  				if (IS_ERR(evt)) {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  975  					ret =3D PTR_ERR(evt);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  976  					break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  977  				}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  978  				mdev_state->msi_evtfd =
=3D evt;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  979  				mdev_state->irq_fd =3D f=
d;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  980  				mdev_state->irq_index =
=3D index;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  981  			}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  982  			break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  983  	}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  984  	break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  985  	case VFIO_PCI_MSIX_IRQ_INDE=
X:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  986  		pr_info("%s: MSIX_IRQ\n", =
__func__);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  987  		break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  988  	case VFIO_PCI_ERR_IRQ_INDEX:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  989  		pr_info("%s: ERR_IRQ\n", _=
_func__);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  990  		break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  991  	case VFIO_PCI_REQ_IRQ_INDEX:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  992  		pr_info("%s: REQ_IRQ\n", _=
_func__);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  993  		break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  994  	}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  995  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  996  	mutex_unlock(&mdev_state->o=
ps_lock);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  997  	return ret;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  998  }
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  999  =


:::::: The code at line 930 was first introduced by commit
:::::: 9d1a546c53b4c1c378b0f34de84ddee2c7d4c90c docs: Sample driver to demo=
nstrate how to use Mediated device framework.

:::::: TO: Kirti Wankhede <kwankhede@nvidia.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============9175313277178178325==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============9175313277178178325==--

