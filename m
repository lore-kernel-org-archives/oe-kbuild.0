Content-Type: multipart/mixed; boundary="===============4924440845457667316=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/memory/tegra/tegra210-emc-core.c:936:2: warning: Value stored to 'mpc_req' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 20 Mar 2022 16:36:14 +0800
Message-ID: <202203201618.aDOyPLqw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4924440845457667316==
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
head:   34e047aa16c0123bbae8e2f6df33e5ecc1f56601
commit: 56ebc9b0d77e0406aba2d900c82e79204cc7dc32 memory: tegra: Enable comp=
ile testing for all drivers
date:   10 months ago
:::::: branch date: 2 days ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220317 (https://download.01.org/0day-ci/archi=
ve/20220320/202203201618.aDOyPLqw-lkp(a)intel.com/config)
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
   drivers/of/fdt.c:221:3: note: Storing null pointer value
                   *pnp =3D NULL;
                   ^~~~~~~~~~~
   drivers/of/fdt.c:326:9: note: Returning from 'populate_node'
                   ret =3D populate_node(blob, offset, &mem, nps[depth],
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/of/fdt.c:328:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/of/fdt.c:328:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/of/fdt.c:331:8: note: 'dryrun' is false
                   if (!dryrun && nodepp && !*nodepp)
                        ^~~~~~
   drivers/of/fdt.c:331:7: note: Left side of '&&' is true
                   if (!dryrun && nodepp && !*nodepp)
                       ^
   drivers/of/fdt.c:331:18: note: 'nodepp' is null
                   if (!dryrun && nodepp && !*nodepp)
                                  ^~~~~~
   drivers/of/fdt.c:331:25: note: Left side of '&&' is false
                   if (!dryrun && nodepp && !*nodepp)
                                         ^
   drivers/of/fdt.c:333:8: note: 'dryrun' is false
                   if (!dryrun && !root)
                        ^~~~~~
   drivers/of/fdt.c:333:7: note: Left side of '&&' is true
                   if (!dryrun && !root)
                       ^
   drivers/of/fdt.c:333:19: note: 'root' is null
                   if (!dryrun && !root)
                                   ^~~~
   drivers/of/fdt.c:333:3: note: Taking true branch
                   if (!dryrun && !root)
                   ^
   drivers/of/fdt.c:334:4: note: Null pointer value stored to 'root'
                           root =3D nps[depth+1];
                           ^~~~~~~~~~~~~~~~~~~
   drivers/of/fdt.c:317:7: note: Assuming 'offset' is < 0
                offset >=3D 0 && depth >=3D initial_depth;
                ^~~~~~~~~~~
   drivers/of/fdt.c:317:19: note: Left side of '&&' is false
                offset >=3D 0 && depth >=3D initial_depth;
                            ^
   drivers/of/fdt.c:337:6: note: 'offset' is < 0
           if (offset < 0 && offset !=3D -FDT_ERR_NOTFOUND) {
               ^~~~~~
   drivers/of/fdt.c:337:6: note: Left side of '&&' is true
   drivers/of/fdt.c:337:20: note: Assuming the condition is false
           if (offset < 0 && offset !=3D -FDT_ERR_NOTFOUND) {
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/of/fdt.c:337:2: note: Taking false branch
           if (offset < 0 && offset !=3D -FDT_ERR_NOTFOUND) {
           ^
   drivers/of/fdt.c:346:7: note: 'dryrun' is false
           if (!dryrun)
                ^~~~~~
   drivers/of/fdt.c:346:2: note: Taking true branch
           if (!dryrun)
           ^
   drivers/of/fdt.c:347:17: note: Passing null pointer value via 1st parame=
ter 'parent'
                   reverse_nodes(root);
                                 ^~~~
   drivers/of/fdt.c:347:3: note: Calling 'reverse_nodes'
                   reverse_nodes(root);
                   ^~~~~~~~~~~~~~~~~~~
   drivers/of/fdt.c:259:10: note: Access to field 'child' results in a dere=
ference of a null pointer (loaded from variable 'parent')
           child =3D parent->child;
                   ^~~~~~
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
                                      ~~~~~~ ^
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
   include/linux/hid.h:1004:9: warning: Access to field 'name' results in a=
 dereference of a null pointer (loaded from variable 'input') [clang-analyz=
er-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-apple.c:392:6: note: Assuming the condition is true
           if (asc->quirks & APPLE_MIGHTYMOUSE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-apple.c:392:2: note: Taking true branch
           if (asc->quirks & APPLE_MIGHTYMOUSE) {
           ^
   drivers/hid/hid-apple.c:393:7: note: Assuming field 'hid' is equal to HI=
D_GD_Z
                   if (usage->hid =3D=3D HID_GD_Z)
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-apple.c:393:3: note: Taking true branch
                   if (usage->hid =3D=3D HID_GD_Z)
                   ^
   drivers/hid/hid-apple.c:394:4: note: Calling 'hid_map_usage'
                           hid_map_usage(hi, usage, bit, max, EV_REL, REL_H=
WHEEL);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   include/linux/hid.h:979:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:983:2: note: Control jumps to 'case 2:'  at line 988
           switch (type) {
           ^
   include/linux/hid.h:991:3: note:  Execution continues on line 1002
                   break;
                   ^
   include/linux/hid.h:1002:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1002:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:1002:28: note: Assuming 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
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
   Suppressed 15 warnings (15 in non-user code).
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
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   lib/vsprintf.c:331:22: warning: The left operand of '=3D=3D' is a garbag=
e value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           else while (buf[-1] =3D=3D '0')
                               ^
   lib/vsprintf.c:352:6: note: Assuming 'num' is > 9
           if (num <=3D 9) {
               ^~~~~~~~
   lib/vsprintf.c:352:2: note: Taking false branch
           if (num <=3D 9) {
           ^
   lib/vsprintf.c:356:9: note: Calling 'put_dec'
                   len =3D put_dec(tmp, num) - tmp;
                         ^~~~~~~~~~~~~~~~~
   lib/vsprintf.c:308:6: note: Assuming the condition is false
           if (n < 100*1000*1000)
               ^~~~~~~~~~~~~~~~~
   lib/vsprintf.c:308:2: note: Taking false branch
           if (n < 100*1000*1000)
           ^
   lib/vsprintf.c:319:6: note: Calling 'put_dec_helper4'
           q =3D put_dec_helper4(buf, q);
               ^~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:294:9: note: Calling 'put_dec_full4'
           put_dec_full4(buf, x - q * 10000);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:294:9: note: Returning from 'put_dec_full4'
           put_dec_full4(buf, x - q * 10000);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:319:6: note: Returning from 'put_dec_helper4'
           q =3D put_dec_helper4(buf, q);
               ^~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:329:6: note: Assuming 'q' is 0
           if (q)
               ^
   lib/vsprintf.c:329:2: note: Taking false branch
           if (q)
           ^
   lib/vsprintf.c:331:22: note: The left operand of '=3D=3D' is a garbage v=
alue
           else while (buf[-1] =3D=3D '0')
                       ~~~~~~~ ^
   lib/vsprintf.c:529:9: warning: Assigned value is garbage or undefined [c=
lang-analyzer-core.uninitialized.Assign]
                           *buf =3D tmp[i];
                                ^
   lib/vsprintf.c:3150:19: note: Assuming the condition is false
           if (WARN_ON_ONCE(size > INT_MAX))
                            ^
   include/asm-generic/bug.h:145:27: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_once =3D !!(condition);                    \
                                    ^~~~~~~~~
   lib/vsprintf.c:3150:6: note: '__ret_warn_once' is 0
           if (WARN_ON_ONCE(size > INT_MAX))
               ^
   include/asm-generic/bug.h:147:15: note: expanded from macro 'WARN_ON_ONC=
E'
           if (unlikely(__ret_warn_once && !__warned)) {           \
                        ^~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/vsprintf.c:3150:6: note: Left side of '&&' is false
           if (WARN_ON_ONCE(size > INT_MAX))
               ^
   include/asm-generic/bug.h:147:31: note: expanded from macro 'WARN_ON_ONC=
E'
           if (unlikely(__ret_warn_once && !__warned)) {           \
                                        ^
   lib/vsprintf.c:3150:6: note: Taking false branch
           if (WARN_ON_ONCE(size > INT_MAX))
               ^
   include/asm-generic/bug.h:147:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_once && !__warned)) {           \
           ^
   lib/vsprintf.c:3150:2: note: Taking false branch
           if (WARN_ON_ONCE(size > INT_MAX))
           ^
   lib/vsprintf.c:3172:6: note: Assuming 'end' is >=3D 'buf'
           if (end < buf) {
               ^~~~~~~~~
   lib/vsprintf.c:3172:2: note: Taking false branch

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


:::::: The code@line 936 was first introduced by commit
:::::: 10de21148f7d28c9e918aaee7cede74a7d506e24 memory: tegra: Add EMC scal=
ing support code for Tegra210

:::::: TO: Joseph Lo <josephl@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4924440845457667316==--

