Content-Type: multipart/mixed; boundary="===============2500444508528177131=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pinctrl/pinctrl-starfive.c:640:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 03 Feb 2022 08:18:16 +0800
Message-ID: <202202030746.ZZk8x0QQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2500444508528177131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Emil Renner Berthing <kernel@esmil.dk>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Huan Feng <huan.feng@starfivetech.com>
CC: Drew Fustini <drew@beagleboard.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   88808fbbead481aedb46640a5ace69c58287f56a
commit: ec648f6b7686b716424e8e73eebb4c11ae199187 pinctrl: starfive: Add pin=
ctrl driver for StarFive SoCs
date:   7 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 weeks ago
config: arm-randconfig-c002-20220201 (https://download.01.org/0day-ci/archi=
ve/20220203/202202030746.ZZk8x0QQ-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e84=
4b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dec648f6b7686b716424e8e73eebb4c11ae199187
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ec648f6b7686b716424e8e73eebb4c11ae199187
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                   ^
   fs/ext4/extents.c:4181:6: note: Assuming the condition is false
           if ((flags & EXT4_GET_BLOCKS_CREATE) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/extents.c:4181:2: note: Taking false branch
           if ((flags & EXT4_GET_BLOCKS_CREATE) =3D=3D 0) {
           ^
   fs/ext4/extents.c:4211:6: note: Assuming 'cluster_offset' is 0
           if (cluster_offset && ex &&
               ^~~~~~~~~~~~~~
   fs/ext4/extents.c:4211:21: note: Left side of '&&' is false
           if (cluster_offset && ex &&
                              ^
   fs/ext4/extents.c:4221:6: note: 'err' is 0
           if (err)
               ^~~
   fs/ext4/extents.c:4221:2: note: Taking false branch
           if (err)
           ^
   fs/ext4/extents.c:4224:8: note: Calling 'ext4_ext_search_right'
           err =3D ext4_ext_search_right(inode, path, &ar.lright, &ar.prigh=
t, &ex2);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   fs/ext4/extents.c:1539:15: note: 'path' is not equal to null
           if (unlikely(path =3D=3D NULL)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ext4/extents.c:1539:2: note: Taking false branch
           if (unlikely(path =3D=3D NULL)) {
           ^
   fs/ext4/extents.c:1546:6: note: 'depth' is not equal to 0
           if (depth =3D=3D 0 && path->p_ext =3D=3D NULL)
               ^~~~~
   fs/ext4/extents.c:1546:17: note: Left side of '&&' is false
           if (depth =3D=3D 0 && path->p_ext =3D=3D NULL)
                          ^
   fs/ext4/extents.c:1555:2: note: Taking false branch
           if (*logical < le32_to_cpu(ex->ee_block)) {
           ^
   fs/ext4/extents.c:1574:2: note: Taking false branch
           if (unlikely(*logical < (le32_to_cpu(ex->ee_block) + ee_len))) {
           ^
   fs/ext4/extents.c:1581:6: note: Assuming the condition is false
           if (ex !=3D EXT_LAST_EXTENT(path[depth].p_hdr)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/extents.c:1581:2: note: Taking false branch
           if (ex !=3D EXT_LAST_EXTENT(path[depth].p_hdr)) {
           ^
   fs/ext4/extents.c:1588:2: note: Loop condition is true.  Entering loop b=
ody
           while (--depth >=3D 0) {
           ^
   fs/ext4/extents.c:1590:7: note: Assuming the condition is true
                   if (ix !=3D EXT_LAST_INDEX(path[depth].p_hdr))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/extents.c:1590:3: note: Taking true branch
                   if (ix !=3D EXT_LAST_INDEX(path[depth].p_hdr))
                   ^
   fs/ext4/extents.c:1591:4: note: Control jumps to line 1601
                           goto got_index;
                           ^
   fs/ext4/extents.c:1602:2: note: Loop condition is false. Execution conti=
nues on line 1612
           while (++depth < path->p_depth) {
           ^
   fs/ext4/extents.c:1613:2: note: Taking true branch
           if (IS_ERR(bh))
           ^
   fs/ext4/extents.c:1614:3: note: Returning without writing to 'ret_ex->ee=
_block'
                   return PTR_ERR(bh);
                   ^
   fs/ext4/extents.c:4224:8: note: Returning from 'ext4_ext_search_right'
           err =3D ext4_ext_search_right(inode, path, &ar.lright, &ar.prigh=
t, &ex2);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   fs/ext4/extents.c:4225:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   fs/ext4/extents.c:4225:2: note: Taking false branch
           if (err < 0)
           ^
   fs/ext4/extents.c:4230:7: note: Assuming field 's_cluster_ratio' is > 1
           if ((sbi->s_cluster_ratio > 1) && err &&
                ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/extents.c:4230:6: note: Left side of '&&' is true
           if ((sbi->s_cluster_ratio > 1) && err &&
               ^
   fs/ext4/extents.c:4230:36: note: 'err' is not equal to 0
           if ((sbi->s_cluster_ratio > 1) && err &&
                                             ^~~
   fs/ext4/extents.c:4230:6: note: Left side of '&&' is true
           if ((sbi->s_cluster_ratio > 1) && err &&
               ^
   fs/ext4/extents.c:4231:6: note: Calling 'get_implied_cluster_alloc'
               get_implied_cluster_alloc(inode->i_sb, map, &ex2, path)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/extents.c:4013:2: note: Assigned value is garbage or undefined
           ext4_lblk_t ee_block =3D le32_to_cpu(ex->ee_block);
           ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/pinctrl/pinctrl-starfive.c:640:17: warning: Value stored to 'dev=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct device *dev =3D sfp->gc.parent;
                          ^~~   ~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-starfive.c:640:17: note: Value stored to 'dev' d=
uring its initialization is never read
           struct device *dev =3D sfp->gc.parent;
                          ^~~   ~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/pinctrl/pinctrl-ingenic.c:3627:15: warning: Value stored to 'idx=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           unsigned int idx =3D pin % PINS_PER_GPIO_CHIP;
                        ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-ingenic.c:3627:15: note: Value stored to 'idx' d=
uring its initialization is never read
           unsigned int idx =3D pin % PINS_PER_GPIO_CHIP;
                        ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-ingenic.c:3628:15: warning: Value stored to 'off=
t' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
                        ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-ingenic.c:3628:15: note: Value stored to 'offt' =
during its initialization is never read
           unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
                        ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-ingenic.c:3696:15: warning: Value stored to 'idx=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           unsigned int idx =3D pin % PINS_PER_GPIO_CHIP;
                        ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-ingenic.c:3696:15: note: Value stored to 'idx' d=
uring its initialization is never read
           unsigned int idx =3D pin % PINS_PER_GPIO_CHIP;
                        ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-ingenic.c:3697:15: warning: Value stored to 'off=
t' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
                        ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-ingenic.c:3697:15: note: Value stored to 'offt' =
during its initialization is never read
           unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
                        ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:73:2: warning: Value stored to '=
temp' is never read [clang-analyzer-deadcode.DeadStores]
           temp =3D RREG32(rec->mask_clk_reg);
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:73:2: note: Value stored to 'tem=
p' is never read
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:77:2: warning: Value stored to '=
temp' is never read [clang-analyzer-deadcode.DeadStores]
           temp =3D RREG32(rec->mask_data_reg);
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:77:2: note: Value stored to 'tem=
p' is never read
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:92:2: warning: Value stored to '=
temp' is never read [clang-analyzer-deadcode.DeadStores]
           temp =3D RREG32(rec->mask_clk_reg);
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:92:2: note: Value stored to 'tem=
p' is never read
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:96:2: warning: Value stored to '=
temp' is never read [clang-analyzer-deadcode.DeadStores]
           temp =3D RREG32(rec->mask_data_reg);
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:96:2: note: Value stored to 'tem=
p' is never read
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:312:3: warning: 4th function cal=
l argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   DRM_DEBUG("i2c 0x%02x 0x%02x read failed\n",
                   ^
   include/drm/drm_print.h:526:2: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:371:2: note: 'val' declared with=
out an initial value
           u8 val;
           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:373:6: note: Assuming field 'cd_=
valid' is true
           if (!amdgpu_connector->router.cd_valid)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:373:2: note: Taking false branch
           if (!amdgpu_connector->router.cd_valid)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:376:6: note: Assuming field 'rou=
ter_bus' is non-null
           if (!amdgpu_connector->router_bus)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:376:2: note: Taking false branch
           if (!amdgpu_connector->router_bus)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:379:2: note: Calling 'amdgpu_i2c=
_get_byte'
           amdgpu_i2c_get_byte(amdgpu_connector->router_bus,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:308:6: note: Assuming the condit=
ion is false
           if (i2c_transfer(&i2c_bus->adapter, msgs, 2) =3D=3D 2) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:308:2: note: Taking false branch
           if (i2c_transfer(&i2c_bus->adapter, msgs, 2) =3D=3D 2) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:312:3: note: 4th function call a=
rgument is an uninitialized value
                   DRM_DEBUG("i2c 0x%02x 0x%02x read failed\n",
                   ^
   include/drm/drm_print.h:526:2: note: expanded from macro 'DRM_DEBUG'

vim +/dev +640 drivers/pinctrl/pinctrl-starfive.c

ec648f6b7686b7 Emil Renner Berthing 2021-07-06  635  =

ec648f6b7686b7 Emil Renner Berthing 2021-07-06  636  static int starfive_se=
t_mux(struct pinctrl_dev *pctldev,
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  637  			    unsigned int fs=
el, unsigned int gsel)
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  638  {
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  639  	struct starfive_pinct=
rl *sfp =3D pinctrl_dev_get_drvdata(pctldev);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06 @640  	struct device *dev =
=3D sfp->gc.parent;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  641  	const struct group_de=
sc *group;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  642  	const u32 *pinmux;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  643  	unsigned int i;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  644  =

ec648f6b7686b7 Emil Renner Berthing 2021-07-06  645  	group =3D pinctrl_gen=
eric_get_group(pctldev, gsel);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  646  	if (!group)
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  647  		return -EINVAL;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  648  =

ec648f6b7686b7 Emil Renner Berthing 2021-07-06  649  	pinmux =3D group->dat=
a;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  650  	for (i =3D 0; i < gro=
up->num_pins; i++) {
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  651  		u32 v =3D pinmux[i];
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  652  		unsigned int gpio =
=3D starfive_pinmux_to_gpio(v);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  653  		u32 dout =3D starfiv=
e_pinmux_to_dout(v);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  654  		u32 doen =3D starfiv=
e_pinmux_to_doen(v);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  655  		u32 din =3D starfive=
_pinmux_to_din(v);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  656  		void __iomem *reg_do=
ut;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  657  		void __iomem *reg_do=
en;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  658  		void __iomem *reg_di=
n;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  659  		unsigned long flags;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  660  =

ec648f6b7686b7 Emil Renner Berthing 2021-07-06  661  		dev_dbg(dev, "GPIO%u=
: dout=3D0x%x doen=3D0x%x din=3D0x%x\n",
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  662  			gpio, dout, doen, d=
in);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  663  =

ec648f6b7686b7 Emil Renner Berthing 2021-07-06  664  		reg_dout =3D sfp->ba=
se + GPON_DOUT_CFG + 8 * gpio;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  665  		reg_doen =3D sfp->ba=
se + GPON_DOEN_CFG + 8 * gpio;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  666  		if (din !=3D GPI_NON=
E)
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  667  			reg_din =3D sfp->ba=
se + GPI_CFG_OFFSET + 4 * din;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  668  		else
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  669  			reg_din =3D NULL;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  670  =

ec648f6b7686b7 Emil Renner Berthing 2021-07-06  671  		raw_spin_lock_irqsav=
e(&sfp->lock, flags);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  672  		writel_relaxed(dout,=
 reg_dout);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  673  		writel_relaxed(doen,=
 reg_doen);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  674  		if (reg_din)
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  675  			writel_relaxed(gpio=
 + 2, reg_din);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  676  		raw_spin_unlock_irqr=
estore(&sfp->lock, flags);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  677  	}
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  678  =

ec648f6b7686b7 Emil Renner Berthing 2021-07-06  679  	return 0;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  680  }
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  681  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2500444508528177131==--

