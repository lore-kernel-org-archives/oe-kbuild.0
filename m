Content-Type: multipart/mixed; boundary="===============8864151988143561356=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-msm:msm-next-staging 6/96] drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:563:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 03 May 2022 06:52:14 +0800
Message-ID: <202205030621.L4IWHNhg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8864151988143561356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Stephen Boyd <swboyd@chromium.org>

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next-staging
head:   f1fc2b87de4719cfa8e193e0746cc524dd9f7472
commit: 6874f48bb8b050b695698f1145e6846ba08baa75 [6/96] drm/msm: make mdp5/=
dpu devices master components
:::::: branch date: 23 hours ago
:::::: commit date: 7 days ago
config: riscv-randconfig-c006-20220501 (https://download.01.org/0day-ci/arc=
hive/20220503/202205030621.L4IWHNhg-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d=
36061e42b495d1f4c7e933e260eac260ed)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add drm-msm https://gitlab.freedesktop.org/drm/msm.git
        git fetch --no-tags drm-msm msm-next-staging
        git checkout 6874f48bb8b050b695698f1145e6846ba08baa75
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is f=
alse
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is f=
alse
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/getorder.h:44:9: note: Returning from 'fls'
           return fls(size);
                  ^~~~~~~~~
   mm/slob.c:617:29: note: Returning from 'get_order'
                   b =3D slob_new_pages(flags, get_order(c->size), node);
                                             ^~~~~~~~~~~~~~~~~~
   mm/slob.c:619:23: note: Calling 'get_order'
                                               PAGE_SIZE << get_order(c->si=
ze),
                                                            ^~~~~~~~~~~~~~~=
~~~
   include/asm-generic/getorder.h:31:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/asm-generic/getorder.h:44:9: note: Calling 'fls'
           return fls(size);
                  ^~~~~~~~~
   include/asm-generic/bitops/fls.h:15:2: note: 'r' initialized to 32
           int r =3D 32;
           ^~~~~
   include/asm-generic/bitops/fls.h:17:7: note: 'x' is not equal to 0, whic=
h participates in a condition later
           if (!x)
                ^
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   include/asm-generic/getorder.h:44:9: note: Returning from 'fls'
           return fls(size);
                  ^~~~~~~~~
   include/asm-generic/getorder.h:44:2: note: Returning the value 32
           return fls(size);
           ^~~~~~~~~~~~~~~~
   mm/slob.c:619:23: note: Returning from 'get_order'
                                               PAGE_SIZE << get_order(c->si=
ze),
                                                            ^~~~~~~~~~~~~~~=
~~~
   mm/slob.c:619:20: note: The result of the left shift is undefined due to=
 shifting by '32', which is greater or equal to the width of type 'unsigned=
 long'
                                               PAGE_SIZE << get_order(c->si=
ze),
                                                         ^  ~~~~~~~~~~~~~~~=
~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
>> drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:563:2: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D mdp5_init(to_platform_device(dev->dev), dev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:563:2: note: Value stored to 'r=
et' is never read
           ret =3D mdp5_init(to_platform_device(dev->dev), dev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:687:12: warning: 1st function c=
all argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   hwpipe =3D mdp5_pipe_init(pipes[i], offsets[i], caps);
                            ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:563:8: note: Calling 'mdp5_init'
           ret =3D mdp5_init(to_platform_device(dev->dev), dev);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:815:6: note: Assuming 'mdp5_kms=
' is non-null
           if (!mdp5_kms) {
               ^~~~~~~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:815:2: note: Taking false branch
           if (!mdp5_kms) {
           ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:822:2: note: Loop condition is =
false.  Exiting loop
           spin_lock_init(&mdp5_kms->resource_lock);
           ^
   include/linux/spinlock.h:329:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:828:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:828:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:832:2: note: Taking false branch
           if (IS_ERR(mdp5_kms->mmio)) {
           ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:839:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:839:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:842:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:842:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:845:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:845:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:848:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:848:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:868:2: note: Taking false branch
           if (IS_ERR(mdp5_kms->cfg)) {
           ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:885:6: note: Assuming the condi=
tion is false
           if (mdp5_kms->caps & MDP_CAP_SMP) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:885:2: note: Taking false branch
           if (mdp5_kms->caps & MDP_CAP_SMP) {
           ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:895:2: note: Taking false branch
           if (IS_ERR(mdp5_kms->ctlm)) {
           ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:901:8: note: Calling 'hwpipe_in=
it'
           ret =3D hwpipe_init(mdp5_kms);
                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:723:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:723:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:729:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:729:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:733:8: note: Calling 'construct=
_pipes'
           ret =3D construct_pipes(mdp5_kms, hw_cfg->pipe_dma.count, dma_pl=
anes,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:684:14: note: Assuming 'i' is <=
 'cnt'
           for (i =3D 0; i < cnt; i++) {
                       ^~~~~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:684:2: note: Loop condition is =
true.  Entering loop body
           for (i =3D 0; i < cnt; i++) {
           ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:688:3: note: Taking false branch
                   if (IS_ERR(hwpipe)) {
                   ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:684:14: note: Assuming 'i' is <=
 'cnt'
           for (i =3D 0; i < cnt; i++) {
                       ^~~~~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:684:2: note: Loop condition is =
true.  Entering loop body
           for (i =3D 0; i < cnt; i++) {

vim +/ret +563 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c

6874f48bb8b050 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Dmitry Baryshkov   =
 2022-04-19  551  =

5d44531be0982d drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Dmitry Baryshkov   =
 2022-04-19  552  static int mdp5_kms_init(struct drm_device *dev)
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  553  {
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  554  	struct msm_drm_private *priv =3D dev->dev_private;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  555  	struct platform_device *pdev;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  556  	struct mdp5_kms *mdp5_kms;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  557  	struct mdp5_cfg *config;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  558  	struct msm_kms *kms;
667ce33e57d0de drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Rob Clark          =
 2016-09-28  559  	struct msm_gem_address_space *aspace;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  560  	int irq, i, ret;
518304cbf3b245 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Jeffrey Hugo       =
 2019-07-08  561  	struct device *iommu_dev;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  562  =

6874f48bb8b050 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Dmitry Baryshkov   =
 2022-04-19 @563  	ret =3D mdp5_init(to_platform_device(dev->dev), dev);
6874f48bb8b050 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Dmitry Baryshkov   =
 2022-04-19  564  =

aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  565  	/* priv->kms would have been populated by the MDP5 drive=
r */
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  566  	kms =3D priv->kms;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  567  	if (!kms)
5d44531be0982d drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Dmitry Baryshkov   =
 2022-04-19  568  		return -ENOMEM;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  569  =

aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  570  	mdp5_kms =3D to_mdp5_kms(to_mdp_kms(kms));
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  571  	pdev =3D mdp5_kms->pdev;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  572  =

ffe71111f4ab5a drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Rob Clark          =
 2020-10-19  573  	ret =3D mdp_kms_init(&mdp5_kms->base, &kms_funcs);
ffe71111f4ab5a drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Rob Clark          =
 2020-10-19  574  	if (ret) {
ffe71111f4ab5a drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Rob Clark          =
 2020-10-19  575  		DRM_DEV_ERROR(&pdev->dev, "failed to init kms\n");
ffe71111f4ab5a drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Rob Clark          =
 2020-10-19  576  		goto fail;
ffe71111f4ab5a drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Rob Clark          =
 2020-10-19  577  	}
ffe71111f4ab5a drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Rob Clark          =
 2020-10-19  578  =

aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  579  	irq =3D irq_of_parse_and_map(pdev->dev.of_node, 0);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  580  	if (irq < 0) {
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  581  		ret =3D irq;
6a41da17e87dee drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Mamta Shukla       =
 2018-10-20  582  		DRM_DEV_ERROR(&pdev->dev, "failed to get irq: %d\n", re=
t);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  583  		goto fail;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  584  	}
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  585  =

aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  586  	kms->irq =3D irq;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  587  =

aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  588  	config =3D mdp5_cfg_get_config(mdp5_kms->cfg);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  589  =

aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  590  	/* make sure things are off before attaching iommu (boot=
loader could
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  591  	 * have left things on, in which case we'll start gettin=
g faults if
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  592  	 * we don't disable):
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  593  	 */
d68fe15b1878ac drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2017-07-28  594  	pm_runtime_get_sync(&pdev->dev);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  595  	for (i =3D 0; i < MDP5_INTF_NUM_MAX; i++) {
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  596  		if (mdp5_cfg_intf_is_virtual(config->hw->intf.connect[i=
]) ||
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  597  		    !config->hw->intf.base[i])
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  598  			continue;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  599  		mdp5_write(mdp5_kms, REG_MDP5_INTF_TIMING_ENGINE_EN(i),=
 0);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  600  =

aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  601  		mdp5_write(mdp5_kms, REG_MDP5_INTF_FRAME_LINE_COUNT_EN(=
i), 0x3);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  602  	}
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  603  	mdelay(16);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  604  =

aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  605  	if (config->platform.iommu) {
ccac7ce373c1b5 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Jordan Crouse      =
 2020-05-22  606  		struct msm_mmu *mmu;
ccac7ce373c1b5 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Jordan Crouse      =
 2020-05-22  607  =

518304cbf3b245 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Jeffrey Hugo       =
 2019-07-08  608  		iommu_dev =3D &pdev->dev;
d3e240c4bcf003 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Joerg Roedel       =
 2020-03-26  609  		if (!dev_iommu_fwspec_get(iommu_dev))
518304cbf3b245 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Jeffrey Hugo       =
 2019-07-08  610  			iommu_dev =3D iommu_dev->parent;
518304cbf3b245 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Jeffrey Hugo       =
 2019-07-08  611  =

ccac7ce373c1b5 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Jordan Crouse      =
 2020-05-22  612  		mmu =3D msm_iommu_new(iommu_dev, config->platform.iommu=
);
ccac7ce373c1b5 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Jordan Crouse      =
 2020-05-22  613  =

ccac7ce373c1b5 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Jordan Crouse      =
 2020-05-22  614  		aspace =3D msm_gem_address_space_create(mmu, "mdp5",
30480e6ed508e3 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Jordan Crouse      =
 2020-06-22  615  			0x1000, 0x100000000 - 0x1000);
ccac7ce373c1b5 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Jordan Crouse      =
 2020-05-22  616  =

667ce33e57d0de drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Rob Clark          =
 2016-09-28  617  		if (IS_ERR(aspace)) {
ccac7ce373c1b5 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Jordan Crouse      =
 2020-05-22  618  			if (!IS_ERR(mmu))
ccac7ce373c1b5 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Jordan Crouse      =
 2020-05-22  619  				mmu->funcs->destroy(mmu);
667ce33e57d0de drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Rob Clark          =
 2016-09-28  620  			ret =3D PTR_ERR(aspace);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  621  			goto fail;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  622  		}
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  623  =

f59f62d592a055 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Rob Clark          =
 2017-06-13  624  		kms->aspace =3D aspace;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  625  	} else {
6a41da17e87dee drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Mamta Shukla       =
 2018-10-20  626  		DRM_DEV_INFO(&pdev->dev,
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  627  			 "no iommu, fallback to phys contig buffers for scanou=
t\n");
52a8988de97f5e drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Luis de Bethencourt=
 2018-01-17  628  		aspace =3D NULL;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  629  	}
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  630  =

3c352b66905b29 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Rob Clark          =
 2017-10-20  631  	pm_runtime_put_sync(&pdev->dev);
d68fe15b1878ac drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2017-07-28  632  =

aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  633  	ret =3D modeset_init(mdp5_kms);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  634  	if (ret) {
6a41da17e87dee drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Mamta Shukla       =
 2018-10-20  635  		DRM_DEV_ERROR(&pdev->dev, "modeset_init failed: %d\n", =
ret);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  636  		goto fail;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  637  	}
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  638  =

aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  639  	dev->mode_config.min_width =3D 0;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  640  	dev->mode_config.min_height =3D 0;
9708ebbe1728e5 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Rob Clark          =
 2016-11-05  641  	dev->mode_config.max_width =3D 0xffff;
9708ebbe1728e5 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Rob Clark          =
 2016-11-05  642  	dev->mode_config.max_height =3D 0xffff;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  643  =

2bab52af6fe68c drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Brian Masney       =
 2019-05-31  644  	dev->max_vblank_count =3D 0; /* max_vblank_count is set =
on each CRTC */
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  645  	dev->vblank_disable_immediate =3D true;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  646  =

5d44531be0982d drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Dmitry Baryshkov   =
 2022-04-19  647  	return 0;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  648  fail:
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  649  	if (kms)
392ae6e0efa5e2 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  650  		mdp5_kms_destroy(kms);
5d44531be0982d drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Dmitry Baryshkov   =
 2022-04-19  651  =

5d44531be0982d drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Dmitry Baryshkov   =
 2022-04-19  652  	return ret;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  653  }
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja      =
 2016-06-14  654  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8864151988143561356==--

