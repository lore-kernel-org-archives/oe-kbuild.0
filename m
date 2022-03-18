Content-Type: multipart/mixed; boundary="===============8901347514620833102=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/memory/tegra/tegra210-emc-core.c:936:2: warning: Value stored to 'mpc_req' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 19 Mar 2022 07:43:26 +0800
Message-ID: <202203190700.YnlAyyNj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8901347514620833102==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dmitry Osipenko <digetx@gmail.com>
CC: Thierry Reding <treding@nvidia.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   551acdc3c3d2b6bc97f11e31dcf960bc36343bfc
commit: 56ebc9b0d77e0406aba2d900c82e79204cc7dc32 memory: tegra: Enable comp=
ile testing for all drivers
date:   10 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220317 (https://download.01.org/0day-ci/archi=
ve/20220319/202203190700.YnlAyyNj-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e=
3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D56ebc9b0d77e0406aba2d900c82e79204cc7dc32
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 56ebc9b0d77e0406aba2d900c82e79204cc7dc32
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                   ^
   drivers/hwtracing/coresight/coresight-core.c:469:3: note: Taking true br=
anch
                   if (source_ops(csdev)->disable)
                   ^
   drivers/hwtracing/coresight/coresight-core.c:471:3: note: Calling 'cores=
ight_control_assoc_ectdev'
                   coresight_control_assoc_ectdev(csdev, false);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-core.c:273:6: note: Assuming 'ect_=
csdev' is non-null
           if (!ect_csdev)
               ^~~~~~~~~~
   drivers/hwtracing/coresight/coresight-core.c:273:2: note: Taking false b=
ranch
           if (!ect_csdev)
           ^
   drivers/hwtracing/coresight/coresight-core.c:275:7: note: Assuming field=
 'enable' is null
           if ((!ect_ops(ect_csdev)->enable) || (!ect_ops(ect_csdev)->disab=
le))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-core.c:275:36: note: Left side of =
'||' is true
           if ((!ect_ops(ect_csdev)->enable) || (!ect_ops(ect_csdev)->disab=
le))
                                             ^
   drivers/hwtracing/coresight/coresight-core.c:276:3: note: Returning with=
out writing to 'csdev->enable', which participates in a condition later
                   return 0;
                   ^
   drivers/hwtracing/coresight/coresight-core.c:471:3: note: Returning from=
 'coresight_control_assoc_ectdev'
                   coresight_control_assoc_ectdev(csdev, false);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-core.c:474:2: note: Returning the =
value 1, which participates in a condition later
           return !csdev->enable;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-core.c:1180:25: note: Returning fr=
om 'coresight_disable_source'
           if (!csdev->enable || !coresight_disable_source(csdev))
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-core.c:1180:2: note: Taking false =
branch
           if (!csdev->enable || !coresight_disable_source(csdev))
           ^
   drivers/hwtracing/coresight/coresight-core.c:1183:2: note: Control jumps=
 to the 'default' case at line 1193
           switch (csdev->subtype.source_subtype) {
           ^
   drivers/hwtracing/coresight/coresight-core.c:1195:3: note:  Execution co=
ntinues on line 1198
                   break;
                   ^
   drivers/hwtracing/coresight/coresight-core.c:1199:25: note: Passing null=
 pointer value via 1st parameter 'path'
           coresight_release_path(path);
                                  ^~~~
   drivers/hwtracing/coresight/coresight-core.c:1199:2: note: Calling 'core=
sight_release_path'
           coresight_release_path(path);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-core.c:880:2: note: Access to fiel=
d 'next' results in a dereference of a null pointer (loaded from variable '=
path')
           list_for_each_entry_safe(nd, next, path, link) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^                ~~~~
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^           ~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^            ~~~
   include/linux/kernel.h:703:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~
   drivers/hwtracing/coresight/coresight-core.c:1737:4: warning: Value stor=
ed to 'idx' is never read [clang-analyzer-deadcode.DeadStores]
                           idx =3D -ENOMEM;
                           ^     ~~~~~~~
   drivers/hwtracing/coresight/coresight-core.c:1737:4: note: Value stored =
to 'idx' is never read
                           idx =3D -ENOMEM;
                           ^     ~~~~~~~
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
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/memory/tegra/mc.c:872:19: warning: Value stored to 'mc' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct tegra_mc *mc =3D dev_get_drvdata(dev);
                            ^~   ~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/mc.c:872:19: note: Value stored to 'mc' during its =
initialization is never read
           struct tegra_mc *mc =3D dev_get_drvdata(dev);
                            ^~   ~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/mc.c:886:19: warning: Value stored to 'mc' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct tegra_mc *mc =3D dev_get_drvdata(dev);
                            ^~   ~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/mc.c:886:19: note: Value stored to 'mc' during its =
initialization is never read
           struct tegra_mc *mc =3D dev_get_drvdata(dev);
                            ^~   ~~~~~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
>> drivers/memory/tegra/tegra210-emc-core.c:936:2: warning: Value stored to=
 'mpc_req' is never read [clang-analyzer-deadcode.DeadStores]
           mpc_req =3D emc_readl(emc, EMC_MPC);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-core.c:936:2: note: Value stored to 'm=
pc_req' is never read
           mpc_req =3D emc_readl(emc, EMC_MPC);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/memory/tegra/tegra210-emc-core.c:1901:7: warning: Dereference of=
 null pointer [clang-analyzer-core.NullDereference]
                   if (emc->timings[i].rate =3D=3D current_rate) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-core.c:1837:6: note: Assuming 'emc' is=
 non-null
           if (!emc)
               ^~~~
   drivers/memory/tegra/tegra210-emc-core.c:1837:2: note: Taking false bran=
ch
           if (!emc)
           ^
   drivers/memory/tegra/tegra210-emc-core.c:1841:6: note: Calling 'IS_ERR'
           if (IS_ERR(emc->clk))
               ^~~~~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-core.c:1841:6: note: Returning from 'I=
S_ERR'
           if (IS_ERR(emc->clk))
               ^~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-core.c:1841:2: note: Taking false bran=
ch
           if (IS_ERR(emc->clk))
           ^
   drivers/memory/tegra/tegra210-emc-core.c:1844:2: note: Calling 'platform=
_set_drvdata'
           platform_set_drvdata(pdev, emc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:248:2: note: Calling 'dev_set_drvdata'
           dev_set_drvdata(&pdev->dev, data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:676:1: note: Returning without writing to 'data->=
nominal', which participates in a condition later
   }
   ^
   include/linux/device.h:676:1: note: Returning without writing to 'data->=
derated', which participates in a condition later
   include/linux/device.h:676:1: note: Returning without writing to 'data->=
nominal'
   include/linux/device.h:676:1: note: Returning without writing to 'data->=
timings'
   include/linux/platform_device.h:248:2: note: Returning from 'dev_set_drv=
data'
           dev_set_drvdata(&pdev->dev, data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:249:1: note: Returning without writing t=
o 'data->nominal', which participates in a condition later
   }
   ^
   include/linux/platform_device.h:249:1: note: Returning without writing t=
o 'data->derated', which participates in a condition later
   include/linux/platform_device.h:249:1: note: Returning without writing t=
o 'data->nominal'
   include/linux/platform_device.h:249:1: note: Returning without writing t=
o 'data->timings'
   drivers/memory/tegra/tegra210-emc-core.c:1844:2: note: Returning from 'p=
latform_set_drvdata'
           platform_set_drvdata(pdev, emc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-core.c:1845:2: note: Loop condition is=
 false.  Exiting loop
           spin_lock_init(&emc->lock);
           ^
   include/linux/spinlock.h:334:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/memory/tegra/tegra210-emc-core.c:1848:12: note: Value assigned t=
o field 'nominal'
           emc->mc =3D devm_tegra_memory_controller_get(&pdev->dev);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-core.c:1849:6: note: Calling 'IS_ERR'
           if (IS_ERR(emc->mc))
               ^~~~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-core.c:1849:6: note: Returning from 'I=
S_ERR'
           if (IS_ERR(emc->mc))
               ^~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-core.c:1849:2: note: Taking false bran=
ch
           if (IS_ERR(emc->mc))
           ^
   drivers/memory/tegra/tegra210-emc-core.c:1853:6: note: Calling 'IS_ERR'
           if (IS_ERR(emc->regs))
               ^~~~~~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-core.c:1853:6: note: Returning from 'I=
S_ERR'
           if (IS_ERR(emc->regs))
--
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   include/linux/log2.h:67:13: warning: The result of the left shift is und=
efined due to shifting by '4294967295', which is greater or equal to the wi=
dth of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorRes=
ult]
           return 1UL << (fls_long(n) - 1);
                      ^
   drivers/hwtracing/coresight/coresight-stm.c:414:32: note: Left side of '=
&&' is false
           struct stm_drvdata *drvdata =3D container_of(stm_data,
                                         ^
   include/linux/kernel.h:704:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/hwtracing/coresight/coresight-stm.c:414:32: note: Taking false b=
ranch
           struct stm_drvdata *drvdata =3D container_of(stm_data,
                                         ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
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
   drivers/hwtracing/coresight/coresight-stm.c:414:32: note: Loop condition=
 is false.  Exiting loop
           struct stm_drvdata *drvdata =3D container_of(stm_data,
                                         ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
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
   drivers/hwtracing/coresight/coresight-stm.c:418:8: note: Assuming 'drvda=
ta' is non-null
           if (!(drvdata && local_read(&drvdata->mode)))
                 ^~~~~~~
   drivers/hwtracing/coresight/coresight-stm.c:418:8: note: Left side of '&=
&' is true
   drivers/hwtracing/coresight/coresight-stm.c:418:6: note: Assuming the co=
ndition is false
           if (!(drvdata && local_read(&drvdata->mode)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-stm.c:418:2: note: Taking false br=
anch
           if (!(drvdata && local_read(&drvdata->mode)))
           ^
   drivers/hwtracing/coresight/coresight-stm.c:421:6: note: Assuming 'chann=
el' is < field 'numsp'
           if (channel >=3D drvdata->numsp)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-stm.c:421:2: note: Taking false br=
anch
           if (channel >=3D drvdata->numsp)
           ^
   drivers/hwtracing/coresight/coresight-stm.c:426:15: note: Assuming the c=
ondition is false
           stm_flags =3D (flags & STP_PACKET_TIMESTAMPED) ?
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-stm.c:426:14: note: '?' condition =
is false
           stm_flags =3D (flags & STP_PACKET_TIMESTAMPED) ?
                       ^
   drivers/hwtracing/coresight/coresight-stm.c:428:15: note: Assuming the c=
ondition is false
           stm_flags |=3D test_bit(channel, drvdata->chs.guaranteed) ?
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-stm.c:428:15: note: '?' condition =
is false
   drivers/hwtracing/coresight/coresight-stm.c:431:6: note: Assuming 'size'=
 is <=3D field 'write_bytes'
           if (size > drvdata->write_bytes)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-stm.c:431:2: note: Taking false br=
anch
           if (size > drvdata->write_bytes)
           ^
   drivers/hwtracing/coresight/coresight-stm.c:434:10: note: '?' condition =
is false
                   size =3D rounddown_pow_of_two(size);
                          ^
   include/linux/log2.h:193:2: note: expanded from macro 'rounddown_pow_of_=
two'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/hwtracing/coresight/coresight-stm.c:434:10: note: Calling '__rou=
nddown_pow_of_two'
                   size =3D rounddown_pow_of_two(size);
                          ^
   include/linux/log2.h:195:2: note: expanded from macro 'rounddown_pow_of_=
two'
           __rounddown_pow_of_two(n)               \
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:67:13: note: The result of the left shift is undefi=
ned due to shifting by '4294967295', which is greater or equal to the width=
 of type 'unsigned long'
           return 1UL << (fls_long(n) - 1);
                      ^  ~~~~~~~~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/memory/tegra/tegra210-emc-cc-r21021.c:148:15: warning: The left =
expression of the compound assignment is an uninitialized value. The comput=
ed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
                           temp[i][0] |=3D (value & 0x00ff) >> 0;
                           ~~~~~~~~~~ ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:118:34: note: Assuming 'ty=
pe' is not equal to PERIODIC_TRAINING_UPDATE
           bool periodic_training_update =3D type =3D=3D PERIODIC_TRAINING_=
UPDATE;
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:123:21: note: Assuming 'ty=
pe' is not equal to DVFS_UPDATE
           bool dvfs_update =3D type =3D=3D DVFS_UPDATE;
                              ^~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:125:18: note: Assuming 'ty=
pe' is equal to DVFS_PT1
           bool dvfs_pt1 =3D type =3D=3D DVFS_PT1;
                           ^~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:133:6: note: 'dvfs_pt1' is=
 true
           if (dvfs_pt1 || periodic_training_update) {
               ^~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:133:15: note: Left side of=
 '||' is true
           if (dvfs_pt1 || periodic_training_update) {
                        ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:136:15: note: Assuming 'i'=
 is >=3D field 'num_channels'
                   for (i =3D 0; i < emc->num_channels; i++) {
                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:136:3: note: Loop conditio=
n is false. Execution continues on line 145
                   for (i =3D 0; i < emc->num_channels; i++) {
                   ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:147:15: note: Assuming 'i'=
 is < field 'num_channels'
                   for (i =3D 0; i < emc->num_channels; i++) {
                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:147:3: note: Loop conditio=
n is true.  Entering loop body
                   for (i =3D 0; i < emc->num_channels; i++) {
                   ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:148:15: note: The left exp=
ression of the compound assignment is an uninitialized value. The computed =
value will also be garbage
                           temp[i][0] |=3D (value & 0x00ff) >> 0;
                           ~~~~~~~~~~ ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:157:36: warning: The right=
 operand of '*' is a garbage value [clang-analyzer-core.UndefinedBinaryOper=
atorResult]
                   cval /=3D last_timing_rate_mhz * 2 * temp[0][0];
                                                    ^ ~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:118:34: note: Assuming 'ty=
pe' is not equal to PERIODIC_TRAINING_UPDATE
           bool periodic_training_update =3D type =3D=3D PERIODIC_TRAINING_=
UPDATE;
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:123:21: note: Assuming 'ty=
pe' is not equal to DVFS_UPDATE
           bool dvfs_update =3D type =3D=3D DVFS_UPDATE;
                              ^~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:125:18: note: Assuming 'ty=
pe' is equal to DVFS_PT1
           bool dvfs_pt1 =3D type =3D=3D DVFS_PT1;
                           ^~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:133:6: note: 'dvfs_pt1' is=
 true
           if (dvfs_pt1 || periodic_training_update) {
               ^~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:133:15: note: Left side of=
 '||' is true
           if (dvfs_pt1 || periodic_training_update) {
                        ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:136:15: note: Assuming 'i'=
 is >=3D field 'num_channels'
                   for (i =3D 0; i < emc->num_channels; i++) {
                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:136:3: note: Loop conditio=
n is false. Execution continues on line 145
                   for (i =3D 0; i < emc->num_channels; i++) {
                   ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:147:15: note: Assuming 'i'=
 is >=3D field 'num_channels'
                   for (i =3D 0; i < emc->num_channels; i++) {
                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:147:3: note: Loop conditio=
n is false. Execution continues on line 154
                   for (i =3D 0; i < emc->num_channels; i++) {
                   ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:154:6: note: 'dvfs_pt1' is=
 true
           if (dvfs_pt1 || periodic_training_update) {
               ^~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:154:15: note: Left side of=
 '||' is true
           if (dvfs_pt1 || periodic_training_update) {
                        ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:157:36: note: The right op=
erand of '*' is a garbage value
                   cval /=3D last_timing_rate_mhz * 2 * temp[0][0];
                                                    ^ ~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:283:15: warning: The left =
expression of the compound assignment is an uninitialized value. The comput=
ed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
                           temp[i][0] |=3D (value & 0x00ff) >> 0;
                           ~~~~~~~~~~ ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:118:34: note: Assuming 'ty=
pe' is not equal to PERIODIC_TRAINING_UPDATE
           bool periodic_training_update =3D type =3D=3D PERIODIC_TRAINING_=
UPDATE;
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:123:21: note: Assuming 'ty=
pe' is not equal to DVFS_UPDATE
           bool dvfs_update =3D type =3D=3D DVFS_UPDATE;
                              ^~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:125:18: note: Assuming 'ty=
pe' is equal to DVFS_PT1
           bool dvfs_pt1 =3D type =3D=3D DVFS_PT1;
                           ^~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:133:6: note: 'dvfs_pt1' is=
 true
           if (dvfs_pt1 || periodic_training_update) {
               ^~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:133:15: note: Left side of=
 '||' is true
           if (dvfs_pt1 || periodic_training_update) {
                        ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:136:15: note: Assuming 'i'=
 is < field 'num_channels'
                   for (i =3D 0; i < emc->num_channels; i++) {
                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:136:3: note: Loop conditio=
n is true.  Entering loop body
                   for (i =3D 0; i < emc->num_channels; i++) {
                   ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:136:15: note: Assuming 'i'=
 is >=3D field 'num_channels'
                   for (i =3D 0; i < emc->num_channels; i++) {
                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:136:3: note: Loop conditio=
n is false. Execution continues on line 145
                   for (i =3D 0; i < emc->num_channels; i++) {
                   ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:147:15: note: Assuming 'i'=
 is >=3D field 'num_channels'
                   for (i =3D 0; i < emc->num_channels; i++) {
                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:147:3: note: Loop conditio=
n is false. Execution continues on line 154
                   for (i =3D 0; i < emc->num_channels; i++) {
                   ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:154:6: note: 'dvfs_pt1' is=
 true
           if (dvfs_pt1 || periodic_training_update) {
               ^~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:154:15: note: Left side of=
 '||' is true
           if (dvfs_pt1 || periodic_training_update) {
                        ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:160:6: note: 'dvfs_pt1' is=
 true
           if (dvfs_pt1)
               ^~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:160:2: note: Taking true b=
ranch
           if (dvfs_pt1)
           ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:167:6: note: 'dvfs_update'=
 is false
           if (dvfs_update || periodic_training_update) {
               ^~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:167:6: note: Left side of =
'||' is false
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:167:21: note: 'periodic_tr=
aining_update' is false
           if (dvfs_update || periodic_training_update) {
                              ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:167:2: note: Taking false =
branch
           if (dvfs_update || periodic_training_update) {
           ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:179:6: note: 'dvfs_pt1' is=
 true
           if (dvfs_pt1 || periodic_training_update) {
               ^~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:179:15: note: Left side of=
 '||' is true
           if (dvfs_pt1 || periodic_training_update) {
                        ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:185:6: note: 'dvfs_pt1' is=
 true
           if (dvfs_pt1)
               ^~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:185:2: note: Taking true b=
ranch
           if (dvfs_pt1)
           ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:192:6: note: 'dvfs_update'=
 is false
           if (dvfs_update || periodic_training_update) {
               ^~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:192:6: note: Left side of =
'||' is false
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:192:21: note: 'periodic_tr=
aining_update' is false
           if (dvfs_update || periodic_training_update) {
                              ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:192:2: note: Taking false =
branch
           if (dvfs_update || periodic_training_update) {
           ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:206:11: note: Field 'num_c=
hannels' is <=3D 1
           if (emc->num_channels > 1) {
                    ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:206:2: note: Taking false =
branch
           if (emc->num_channels > 1) {
           ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:262:6: note: Assuming fiel=
d 'num_devices' is >=3D 2
           if (emc->num_devices < 2)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:262:2: note: Taking false =
branch
           if (emc->num_devices < 2)
           ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:268:6: note: 'dvfs_pt1' is=
 true
           if (dvfs_pt1 || periodic_training_update) {
               ^~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:268:15: note: Left side of=
 '||' is true
           if (dvfs_pt1 || periodic_training_update) {
                        ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:271:15: note: Assuming 'i'=
 is >=3D field 'num_channels'
                   for (i =3D 0; i < emc->num_channels; i++) {
                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:271:3: note: Loop conditio=
n is false. Execution continues on line 280
                   for (i =3D 0; i < emc->num_channels; i++) {
                   ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:282:15: note: Assuming 'i'=
 is < field 'num_channels'
                   for (i =3D 0; i < emc->num_channels; i++) {
                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:282:3: note: Loop conditio=
n is true.  Entering loop body
                   for (i =3D 0; i < emc->num_channels; i++) {
                   ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:282:15: note: Assuming 'i'=
 is < field 'num_channels'
                   for (i =3D 0; i < emc->num_channels; i++) {
                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:282:3: note: Loop conditio=
n is true.  Entering loop body
                   for (i =3D 0; i < emc->num_channels; i++) {
                   ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:283:15: note: The left exp=
ression of the compound assignment is an uninitialized value. The computed =
value will also be garbage
                           temp[i][0] |=3D (value & 0x00ff) >> 0;
                           ~~~~~~~~~~ ^
>> drivers/memory/tegra/tegra210-emc-cc-r21021.c:456:5: warning: Value stor=
ed to 'adel' is never read [clang-analyzer-deadcode.DeadStores]
                                   adel =3D update_clock_tree_delay(emc, DV=
FS_PT1);
                                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:456:5: note: Value stored =
to 'adel' is never read
                                   adel =3D update_clock_tree_delay(emc, DV=
FS_PT1);
                                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
>> drivers/memory/tegra/tegra210-emc-cc-r21021.c:500:3: warning: Value stor=
ed to 'value' is never read [clang-analyzer-deadcode.DeadStores]
                   value =3D emc_readl(emc, EMC_DBG);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:500:3: note: Value stored =
to 'value' is never read
                   value =3D emc_readl(emc, EMC_DBG);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/memory/tegra/tegra210-emc-cc-r21021.c:875:3: warning: Value stor=
ed to 'zq_wait_long' is never read [clang-analyzer-deadcode.DeadStores]
                   zq_wait_long =3D max((u32)1, div_o3(1000000, dst_clk_per=
iod));
                   ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:875:3: note: Value stored =
to 'zq_wait_long' is never read
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:877:3: warning: Value stor=
ed to 'zq_wait_long' is never read [clang-analyzer-deadcode.DeadStores]
                   zq_wait_long =3D max(next->min_mrs_wait,
                   ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:877:3: note: Value stored =
to 'zq_wait_long' is never read
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:880:3: warning: Value stor=
ed to 'zq_wait_long' is never read [clang-analyzer-deadcode.DeadStores]
                   zq_wait_long =3D max((u32)256,
                   ^
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:880:3: note: Value stored =
to 'zq_wait_long' is never read
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:883:3: warning: Value stor=
ed to 'zq_wait_long' is never read [clang-analyzer-deadcode.DeadStores]
                   zq_wait_long =3D 0;
                   ^              ~
   drivers/memory/tegra/tegra210-emc-cc-r21021.c:883:3: note: Value stored =
to 'zq_wait_long' is never read
                   zq_wait_long =3D 0;
                   ^              ~
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   include/linux/list.h:135:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   fs/btrfs/qgroup.c:1549:6: note: Assuming field 'quota_root' is non-null
           if (!fs_info->quota_root) {
               ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/qgroup.c:1549:2: note: Taking false branch
           if (!fs_info->quota_root) {
           ^
   fs/btrfs/qgroup.c:1555:6: note: Assuming 'qgroup' is non-null
           if (!qgroup) {
               ^~~~~~~
   fs/btrfs/qgroup.c:1555:2: note: Taking false branch
           if (!qgroup) {
           ^
   fs/btrfs/qgroup.c:1561:6: note: Assuming the condition is false
           if (!list_empty(&qgroup->members)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/qgroup.c:1561:2: note: Taking false branch
           if (!list_empty(&qgroup->members)) {
           ^
   fs/btrfs/qgroup.c:1567:6: note: 'ret' is not equal to 0
           if (ret && ret !=3D -ENOENT)
               ^~~
   fs/btrfs/qgroup.c:1567:6: note: Left side of '&&' is true
   fs/btrfs/qgroup.c:1567:13: note: Assuming the condition is false
           if (ret && ret !=3D -ENOENT)
                      ^~~~~~~~~~~~~~
   fs/btrfs/qgroup.c:1567:2: note: Taking false branch
           if (ret && ret !=3D -ENOENT)
           ^
   fs/btrfs/qgroup.c:1570:2: note: Loop condition is false. Execution conti=
nues on line 1579
           while (!list_empty(&qgroup->groups)) {
           ^
   fs/btrfs/qgroup.c:1580:2: note: Calling 'del_qgroup_rb'
           del_qgroup_rb(fs_info, qgroupid);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/qgroup.c:253:6: note: Assuming 'qgroup' is non-null
           if (!qgroup)
               ^~~~~~~
   fs/btrfs/qgroup.c:253:2: note: Taking false branch
           if (!qgroup)
           ^
   fs/btrfs/qgroup.c:257:2: note: Calling '__del_qgroup_rb'
           __del_qgroup_rb(fs_info, qgroup);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/qgroup.c:231:2: note: Loop condition is true.  Entering loop bo=
dy
           while (!list_empty(&qgroup->groups)) {
           ^
   fs/btrfs/qgroup.c:232:10: note: Left side of '&&' is false
                   list =3D list_first_entry(&qgroup->groups,
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
   fs/btrfs/qgroup.c:232:10: note: Taking false branch
                   list =3D list_first_entry(&qgroup->groups,
                          ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
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

vim +/mpc_req +936 drivers/memory/tegra/tegra210-emc-core.c

10de21148f7d28 Joseph Lo 2019-05-29  930  =

10de21148f7d28 Joseph Lo 2019-05-29  931  void tegra210_emc_start_periodic_=
compensation(struct tegra210_emc *emc)
10de21148f7d28 Joseph Lo 2019-05-29  932  {
10de21148f7d28 Joseph Lo 2019-05-29  933  	u32 mpc_req =3D 0x4b;
10de21148f7d28 Joseph Lo 2019-05-29  934  =

10de21148f7d28 Joseph Lo 2019-05-29  935  	emc_writel(emc, mpc_req, EMC_MPC=
);
10de21148f7d28 Joseph Lo 2019-05-29 @936  	mpc_req =3D emc_readl(emc, EMC_M=
PC);
10de21148f7d28 Joseph Lo 2019-05-29  937  }
10de21148f7d28 Joseph Lo 2019-05-29  938  =


:::::: The code at line 936 was first introduced by commit
:::::: 10de21148f7d28c9e918aaee7cede74a7d506e24 memory: tegra: Add EMC scal=
ing support code for Tegra210

:::::: TO: Joseph Lo <josephl@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8901347514620833102==--

