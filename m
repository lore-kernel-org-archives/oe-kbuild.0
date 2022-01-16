Content-Type: multipart/mixed; boundary="===============6046949431797638374=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iommu/apple-dart.c:671:22: warning: Value stored to 'res' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 16 Jan 2022 16:51:22 +0800
Message-ID: <202201161639.F0YG2q8d-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6046949431797638374==
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
head:   a33f5c380c4bd3fa5278d690421b72052456d9fe
commit: 46d1fb072e76b161b0fb1ada9e37bf7e4d1f123f iommu/dart: Add DART iommu=
 driver
date:   5 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 5 months ago
config: riscv-randconfig-c006-20220116 (https://download.01.org/0day-ci/arc=
hive/20220116/202201161639.F0YG2q8d-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 650fc4=
0b6d8d9a5869b4fca525d5f237b0ee2803)
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (8 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
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
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   8 warnings generated.
   drivers/gpu/drm/panfrost/panfrost_mmu.c:70:35: warning: The result of th=
e left shift is undefined because the right operand is negative [clang-anal=
yzer-core.UndefinedBinaryOperatorResult]
           if ((size >> PAGE_SHIFT) !=3D (1ul << (region_width - 11))) {
                                            ^
   drivers/gpu/drm/panfrost/panfrost_mmu.c:386:6: note: Assuming field 'as'=
 is >=3D 0
           if (mmu->as >=3D 0) {
               ^~~~~~~~~~~~
   drivers/gpu/drm/panfrost/panfrost_mmu.c:386:2: note: Taking true branch
           if (mmu->as >=3D 0) {
           ^
   drivers/gpu/drm/panfrost/panfrost_mmu.c:388:3: note: Taking true branch
                   if (pm_runtime_active(pfdev->dev))
                   ^
   drivers/gpu/drm/panfrost/panfrost_mmu.c:389:4: note: Calling 'panfrost_m=
mu_disable'
                           panfrost_mmu_disable(pfdev, mmu->as);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panfrost/panfrost_mmu.c:134:2: note: Calling 'mmu_hw_do_=
operation_locked'
           mmu_hw_do_operation_locked(pfdev, as_nr, 0, ~0UL, AS_COMMAND_FLU=
SH_MEM);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/gpu/drm/panfrost/panfrost_mmu.c:86:6: note: 'as_nr' is >=3D 0
           if (as_nr < 0)
               ^~~~~
   drivers/gpu/drm/panfrost/panfrost_mmu.c:86:2: note: Taking false branch
           if (as_nr < 0)
           ^
   drivers/gpu/drm/panfrost/panfrost_mmu.c:89:6: note: 'op' is not equal to=
 AS_COMMAND_UNLOCK
           if (op !=3D AS_COMMAND_UNLOCK)
               ^~
   drivers/gpu/drm/panfrost/panfrost_mmu.c:89:2: note: Taking true branch
           if (op !=3D AS_COMMAND_UNLOCK)
           ^
   drivers/gpu/drm/panfrost/panfrost_mmu.c:90:3: note: Calling 'lock_region'
                   lock_region(pfdev, as_nr, iova, size);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panfrost/panfrost_mmu.c:70:35: note: The result of the l=
eft shift is undefined because the right operand is negative
           if ((size >> PAGE_SHIFT) !=3D (1ul << (region_width - 11))) {
--
                   ^
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:1164:8: note:=
 Returning from 'komeda_splitter_validate'
           err =3D komeda_splitter_validate(pipe->splitter, conn_st,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:1166:6: note:=
 Assuming 'err' is 0
           if (err)
               ^~~
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:1166:2: note:=
 Taking false branch
           if (err)
           ^
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:1168:8: note:=
 Calling 'komeda_scaler_validate'
           err =3D komeda_scaler_validate(conn, kcrtc_st, &l_dflow);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:514:8: note: =
Branch condition evaluates to a garbage value
           if (!(dflow->en_scaling || dflow->en_img_enhancement))
                 ^~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/gpu/drm/exynos/exynos_drm_dma.c:87:29: warning: Value stored to =
'priv' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct exynos_drm_private *priv =3D drm_dev->dev_private;
                                      ^~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_drm_dma.c:87:29: note: Value stored to 'pr=
iv' during its initialization is never read
           struct exynos_drm_private *priv =3D drm_dev->dev_private;
                                      ^~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_drm_dma.c:119:7: warning: 1st function cal=
l argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   if (IS_ERR(mapping))
                       ^      ~~~~~~~
   drivers/gpu/drm/exynos/exynos_drm_dma.c:101:6: note: Assuming field 'dma=
_dev' is non-null
           if (!priv->dma_dev) {
               ^~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_drm_dma.c:101:2: note: Taking false branch
           if (!priv->dma_dev) {
           ^
   drivers/gpu/drm/exynos/exynos_drm_dma.c:107:2: note: Taking false branch
           if (!IS_ENABLED(CONFIG_EXYNOS_IOMMU))
           ^
   drivers/gpu/drm/exynos/exynos_drm_dma.c:110:6: note: Assuming field 'map=
ping' is null
           if (!priv->mapping) {
               ^~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_drm_dma.c:110:2: note: Taking true branch
           if (!priv->mapping) {
           ^
   drivers/gpu/drm/exynos/exynos_drm_dma.c:111:3: note: 'mapping' declared =
without an initial value
                   void *mapping;
                   ^~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_drm_dma.c:113:3: note: Taking false branch
                   if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU))
                   ^
   drivers/gpu/drm/exynos/exynos_drm_dma.c:116:8: note: Taking false branch
                   else if (IS_ENABLED(CONFIG_IOMMU_DMA))
                        ^
   drivers/gpu/drm/exynos/exynos_drm_dma.c:119:7: note: 1st function call a=
rgument is an uninitialized value
                   if (IS_ERR(mapping))
                       ^      ~~~~~~~
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   10 warnings generated.
   Suppressed 10 warnings (5 in non-user code, 5 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
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
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   6 warnings generated.
   drivers/w1/slaves/w1_ds2438.c:69:3: warning: Value stored to 'crc' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   crc =3D 0;
                   ^     ~
   drivers/w1/slaves/w1_ds2438.c:69:3: note: Value stored to 'crc' is never=
 read
                   crc =3D 0;
                   ^     ~
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

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
--===============6046949431797638374==--

