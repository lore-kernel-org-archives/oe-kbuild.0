Content-Type: multipart/mixed; boundary="===============0891629582960865049=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 249/5235] drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c:205:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 07 Dec 2021 05:24:19 +0800
Message-ID: <202112070537.fe1tQKod-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0891629582960865049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
CC: Sam Ravnborg <sam@ravnborg.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   5d02ef4b57f6e7d4dcba14d40cf05373a146a605
commit: a19125a281128c836faae249c1001eb8d7a18b48 [249/5235] drm/panel: Add =
BOE BF060Y8M-AJ0 5.99" AMOLED panel driver
:::::: branch date: 13 hours ago
:::::: commit date: 7 weeks ago
config: riscv-randconfig-c006-20211203 (https://download.01.org/0day-ci/arc=
hive/20211207/202112070537.fe1tQKod-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d30fca=
df07ee552f20156ea90be2fdb54cb9cb08)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Da19125a281128c836faae249c1001eb8d7a18b48
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout a19125a281128c836faae249c1001eb8d7a18b48
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/media/usb/uvc/uvc_driver.c:731:4: note: '?' condition is true
                           min(frame->dwFrameInterval[n],
                           ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
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
   drivers/media/usb/uvc/uvc_driver.c:730:3: note: The value 0 is assigned =
to field 'dwDefaultFrameInterval'
                   frame->dwDefaultFrameInterval =3D
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/uvc/uvc_driver.c:735:7: note: Assuming the condition i=
s false
                   if (dev->quirks & UVC_QUIRK_RESTRICT_FRAME_RATE) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/uvc/uvc_driver.c:735:3: note: Taking false branch
                   if (dev->quirks & UVC_QUIRK_RESTRICT_FRAME_RATE) {
                   ^
   drivers/media/usb/uvc/uvc_driver.c:741:3: note: Assuming the condition i=
s true
                   uvc_dbg(dev, DESCR, "- %ux%u (%u.%u fps)\n",
                   ^
   drivers/media/usb/uvc/uvcvideo.h:760:6: note: expanded from macro 'uvc_d=
bg'
           if (uvc_dbg_param & UVC_DBG_##flag)                             \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/uvc/uvc_driver.c:741:3: note: Taking true branch
                   uvc_dbg(dev, DESCR, "- %ux%u (%u.%u fps)\n",
                   ^
   drivers/media/usb/uvc/uvcvideo.h:760:2: note: expanded from macro 'uvc_d=
bg'
           if (uvc_dbg_param & UVC_DBG_##flag)                             \
           ^
   drivers/media/usb/uvc/uvc_driver.c:741:3: note: Loop condition is false.=
  Exiting loop
                   uvc_dbg(dev, DESCR, "- %ux%u (%u.%u fps)\n",
                   ^
   drivers/media/usb/uvc/uvcvideo.h:761:3: note: expanded from macro 'uvc_d=
bg'
                   dev_printk(KERN_DEBUG, &(_dev)->udev->dev, fmt,         \
                   ^
   include/linux/dev_printk.h:128:3: note: expanded from macro 'dev_printk'
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
   drivers/media/usb/uvc/uvc_driver.c:743:13: note: Division by zero
                           10000000 / frame->dwDefaultFrameInterval,
                                    ^
   drivers/media/usb/uvc/uvcvideo.h:762:9: note: expanded from macro 'uvc_d=
bg'
                              ##__VA_ARGS__);                              \
                                ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                                  ^~~~~~~~~~~
   drivers/media/usb/uvc/uvc_driver.c:771:3: warning: Value stored to 'bufl=
en' is never read [clang-analyzer-deadcode.DeadStores]
                   buflen -=3D buffer[0];
                   ^         ~~~~~~~~~
   drivers/media/usb/uvc/uvc_driver.c:771:3: note: Value stored to 'buflen'=
 is never read
                   buflen -=3D buffer[0];
                   ^         ~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c:205:2: warning: Value sto=
red to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regulator_bulk_disable(ARRAY_SIZE(boe->vregs), boe->vreg=
s);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c:205:2: note: Value stored=
 to 'ret' is never read
           ret =3D regulator_bulk_disable(ARRAY_SIZE(boe->vregs), boe->vreg=
s);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/hwmon/w83793.c:1253:7: warning: Access to field 'client' results=
 in a dereference of a null pointer (loaded from variable 'data') [clang-an=
alyzer-core.NullDereference]
           if (!data->client) {
                ^
   drivers/hwmon/w83793.c:1290:28: note: 'data' initialized to a null point=
er value
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
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
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
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
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
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^

vim +/ret +205 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c

a19125a281128c AngeloGioacchino Del Regno 2021-09-01  190  =

a19125a281128c AngeloGioacchino Del Regno 2021-09-01  191  static int boe_b=
f060y8m_aj0_unprepare(struct drm_panel *panel)
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  192  {
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  193  	struct boe_bf06=
0y8m_aj0 *boe =3D to_boe_bf060y8m_aj0(panel);
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  194  	struct device *=
dev =3D &boe->dsi->dev;
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  195  	int ret;
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  196  =

a19125a281128c AngeloGioacchino Del Regno 2021-09-01  197  	if (!boe->prepa=
red)
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  198  		return 0;
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  199  =

a19125a281128c AngeloGioacchino Del Regno 2021-09-01  200  	ret =3D boe_bf0=
60y8m_aj0_off(boe);
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  201  	if (ret < 0)
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  202  		dev_err(dev, "=
Failed to un-initialize panel: %d\n", ret);
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  203  =

a19125a281128c AngeloGioacchino Del Regno 2021-09-01  204  	gpiod_set_value=
_cansleep(boe->reset_gpio, 1);
a19125a281128c AngeloGioacchino Del Regno 2021-09-01 @205  	ret =3D regulat=
or_bulk_disable(ARRAY_SIZE(boe->vregs), boe->vregs);
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  206  =

a19125a281128c AngeloGioacchino Del Regno 2021-09-01  207  	boe->prepared =
=3D false;
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  208  	return 0;
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  209  }
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  210  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0891629582960865049==--

