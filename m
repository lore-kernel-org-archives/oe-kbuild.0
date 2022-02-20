Content-Type: multipart/mixed; boundary="===============2290200291655729808=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iommu/apple-dart.c:671:22: warning: Value stored to 'res' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 21 Feb 2022 07:06:08 +0800
Message-ID: <202202210746.IXOCDPKb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2290200291655729808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sven Peter <sven@svenpeter.dev>
CC: Joerg Roedel <jroedel@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3324e6e803156b4296975555f566892e4e3f4fcf
commit: 46d1fb072e76b161b0fb1ada9e37bf7e4d1f123f iommu/dart: Add DART iommu=
 driver
date:   6 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-c006-20220215 (https://download.01.org/0day-ci/arc=
hive/20220221/202202210746.IXOCDPKb-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 37f422=
f4ac31c8b8041c6b62065263314282dab6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D46d1fb072e76b161b0fb1ada9e37bf7e4d1f123f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 46d1fb072e76b161b0fb1ada9e37bf7e4d1f123f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/base/regmap/regmap-debugfs.c:75:3: note: Calling 'list_del'
                   list_del(&c->list);
                   ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:146:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:132:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:135:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   fs/ubifs/tnc_misc.c:51:35: warning: Access to field 'level' results in a=
 dereference of a null pointer (loaded from variable 'zr') [clang-analyzer-=
core.NullDereference]
                   ubifs_assert(c, znode->level <=3D zr->level);
                                                   ^
   fs/ubifs/debug.h:143:17: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                        =
       \
                          ^~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ubifs/tnc_misc.c:36:2: note: Assuming 'zr' is null
           ubifs_assert(c, zr);
           ^
   fs/ubifs/debug.h:143:15: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                        =
       \
               ~~~~~~~~~^~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ubifs/tnc_misc.c:36:2: note: Taking true branch
           ubifs_assert(c, zr);
           ^
   fs/ubifs/debug.h:143:2: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                        =
       \
           ^
   fs/ubifs/tnc_misc.c:36:2: note: Loop condition is false.  Exiting loop
           ubifs_assert(c, zr);
           ^
   fs/ubifs/debug.h:142:31: note: expanded from macro 'ubifs_assert'
   #define ubifs_assert(c, expr) do {                                      =
       \
                                 ^
   fs/ubifs/tnc_misc.c:38:15: note: Assuming 'znode' is non-null
           if (unlikely(!znode))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ubifs/tnc_misc.c:38:2: note: Taking false branch
           if (unlikely(!znode))
           ^
   fs/ubifs/tnc_misc.c:41:15: note: 'znode' is not equal to 'zr'
           if (unlikely(znode =3D=3D zr)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ubifs/tnc_misc.c:41:2: note: Taking false branch
           if (unlikely(znode =3D=3D zr)) {
           ^
   fs/ubifs/tnc_misc.c:50:2: note: Loop condition is true.  Entering loop b=
ody
           while (1) {
           ^
   fs/ubifs/tnc_misc.c:51:35: note: Access to field 'level' results in a de=
reference of a null pointer (loaded from variable 'zr')
                   ubifs_assert(c, znode->level <=3D zr->level);
                                                   ^
   fs/ubifs/debug.h:143:17: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                        =
       \
                          ^~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/iommu/apple-dart.c:671:22: warning: Value stored to 'res' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct iommu_group *res =3D ERR_PTR(-EINVAL);
                               ^~~   ~~~~~~~~~~~~~~~~
   drivers/iommu/apple-dart.c:671:22: note: Value stored to 'res' during it=
s initialization is never read
           struct iommu_group *res =3D ERR_PTR(-EINVAL);
                               ^~~   ~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   9 warnings generated.
   drivers/iio/adc/meson_saradc.c:1049:13: warning: The left operand of '<=
=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (value1 <=3D value0) {
                      ^
   drivers/iio/adc/meson_saradc.c:1186:6: note: Assuming 'indio_dev' is non=
-null
           if (!indio_dev) {
               ^~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:1186:2: note: Taking false branch
           if (!indio_dev) {
           ^
   drivers/iio/adc/meson_saradc.c:1195:6: note: Assuming 'match_data' is no=
n-null
           if (!match_data) {
               ^~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:1195:2: note: Taking false branch
           if (!match_data) {
           ^
   drivers/iio/adc/meson_saradc.c:1207:2: note: Taking false branch
           if (IS_ERR(base))
           ^
   drivers/iio/adc/meson_saradc.c:1212:2: note: Taking false branch
           if (IS_ERR(priv->regmap))
           ^
   drivers/iio/adc/meson_saradc.c:1216:6: note: Assuming 'irq' is not equal=
 to 0
           if (!irq)
               ^~~~
   drivers/iio/adc/meson_saradc.c:1216:2: note: Taking false branch
           if (!irq)
           ^
   drivers/iio/adc/meson_saradc.c:1221:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/adc/meson_saradc.c:1221:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/adc/meson_saradc.c:1225:2: note: Taking false branch
           if (IS_ERR(priv->clkin)) {
           ^
   drivers/iio/adc/meson_saradc.c:1231:2: note: Taking false branch
           if (IS_ERR(priv->core_clk)) {
           ^
   drivers/iio/adc/meson_saradc.c:1237:2: note: Taking false branch
           if (IS_ERR(priv->adc_clk)) {
           ^
   drivers/iio/adc/meson_saradc.c:1247:2: note: Taking false branch
           if (IS_ERR(priv->adc_sel_clk)) {
           ^
   drivers/iio/adc/meson_saradc.c:1257:6: note: Assuming field 'adc_clk' is=
 non-null
           if (!priv->adc_clk) {
               ^~~~~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:1257:2: note: Taking false branch
           if (!priv->adc_clk) {

vim +/res +671 drivers/iommu/apple-dart.c

46d1fb072e76b1 Sven Peter 2021-08-03  663  =

46d1fb072e76b1 Sven Peter 2021-08-03  664  static struct iommu_group *apple=
_dart_device_group(struct device *dev)
46d1fb072e76b1 Sven Peter 2021-08-03  665  {
46d1fb072e76b1 Sven Peter 2021-08-03  666  	static DEFINE_MUTEX(lock);
46d1fb072e76b1 Sven Peter 2021-08-03  667  	int i, sid;
46d1fb072e76b1 Sven Peter 2021-08-03  668  	struct apple_dart_master_cfg *c=
fg =3D dev_iommu_priv_get(dev);
46d1fb072e76b1 Sven Peter 2021-08-03  669  	struct apple_dart_stream_map *s=
tream_map;
46d1fb072e76b1 Sven Peter 2021-08-03  670  	struct iommu_group *group =3D N=
ULL;
46d1fb072e76b1 Sven Peter 2021-08-03 @671  	struct iommu_group *res =3D ERR=
_PTR(-EINVAL);
46d1fb072e76b1 Sven Peter 2021-08-03  672  =

46d1fb072e76b1 Sven Peter 2021-08-03  673  	mutex_lock(&lock);
46d1fb072e76b1 Sven Peter 2021-08-03  674  =

46d1fb072e76b1 Sven Peter 2021-08-03  675  	for_each_stream_map(i, cfg, str=
eam_map) {
46d1fb072e76b1 Sven Peter 2021-08-03  676  		for_each_set_bit(sid, &stream_=
map->sidmap, DART_MAX_STREAMS) {
46d1fb072e76b1 Sven Peter 2021-08-03  677  			struct iommu_group *stream_gr=
oup =3D
46d1fb072e76b1 Sven Peter 2021-08-03  678  				stream_map->dart->sid2group[=
sid];
46d1fb072e76b1 Sven Peter 2021-08-03  679  =

46d1fb072e76b1 Sven Peter 2021-08-03  680  			if (group && group !=3D strea=
m_group) {
46d1fb072e76b1 Sven Peter 2021-08-03  681  				res =3D ERR_PTR(-EINVAL);
46d1fb072e76b1 Sven Peter 2021-08-03  682  				goto out;
46d1fb072e76b1 Sven Peter 2021-08-03  683  			}
46d1fb072e76b1 Sven Peter 2021-08-03  684  =

46d1fb072e76b1 Sven Peter 2021-08-03  685  			group =3D stream_group;
46d1fb072e76b1 Sven Peter 2021-08-03  686  		}
46d1fb072e76b1 Sven Peter 2021-08-03  687  	}
46d1fb072e76b1 Sven Peter 2021-08-03  688  =

46d1fb072e76b1 Sven Peter 2021-08-03  689  	if (group) {
46d1fb072e76b1 Sven Peter 2021-08-03  690  		res =3D iommu_group_ref_get(gr=
oup);
46d1fb072e76b1 Sven Peter 2021-08-03  691  		goto out;
46d1fb072e76b1 Sven Peter 2021-08-03  692  	}
46d1fb072e76b1 Sven Peter 2021-08-03  693  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2290200291655729808==--

