Content-Type: multipart/mixed; boundary="===============0391688511667818092=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4755/6579] drivers/gpu/drm/msm/msm_drv.c:524:2: warning: Value stored to 'mdss' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 11 Dec 2021 10:13:23 +0800
Message-ID: <202112111040.9jl5p4o3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0391688511667818092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ea922272cbe547bdf58da2aaf240d59782c6a009
commit: 2027e5b3413d73533c6853154d31bf70c8eea7e1 [4755/6579] drm/msm: Initi=
alize MDSS irq domain at probe time
:::::: branch date: 5 hours ago
:::::: commit date: 4 days ago
config: arm-randconfig-c002-20211209 (https://download.01.org/0day-ci/archi=
ve/20211211/202112111040.9jl5p4o3-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D2027e5b3413d73533c6853154d31bf70c8eea7e1
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2027e5b3413d73533c6853154d31bf70c8eea7e1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0297.c:64:21: note: Field 'stop_during_re=
ad' is 0
           if (state->config->stop_during_read) {
                              ^
   drivers/media/dvb-frontends/stv0297.c:64:2: note: Taking false branch
           if (state->config->stop_during_read) {
           ^
   drivers/media/dvb-frontends/stv0297.c:74:7: note: Assuming the condition=
 is true
                   if ((ret =3D i2c_transfer(state->i2c, msg, 2)) !=3D 2) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0297.c:74:3: note: Taking true branch
                   if ((ret =3D i2c_transfer(state->i2c, msg, 2)) !=3D 2) {
                   ^
   drivers/media/dvb-frontends/stv0297.c:75:4: note: Left side of '&&' is t=
rue
                           dprintk("%s: readreg error (reg =3D=3D 0x%02x, r=
et =3D=3D %i)\n", __func__, reg, ret);
                           ^
   drivers/media/dvb-frontends/stv0297.c:31:23: note: expanded from macro '=
dprintk'
   #define dprintk(x...) printk(x)
                         ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:374:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   drivers/media/dvb-frontends/stv0297.c:75:4: note: Taking true branch
                           dprintk("%s: readreg error (reg =3D=3D 0x%02x, r=
et =3D=3D %i)\n", __func__, reg, ret);
                           ^
   drivers/media/dvb-frontends/stv0297.c:31:23: note: expanded from macro '=
dprintk'
   #define dprintk(x...) printk(x)
                         ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:374:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   drivers/media/dvb-frontends/stv0297.c:75:4: note: '?' condition is true
                           dprintk("%s: readreg error (reg =3D=3D 0x%02x, r=
et =3D=3D %i)\n", __func__, reg, ret);
                           ^
   drivers/media/dvb-frontends/stv0297.c:31:23: note: expanded from macro '=
dprintk'
   #define dprintk(x...) printk(x)
                         ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:383:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   drivers/media/dvb-frontends/stv0297.c:75:4: note: '?' condition is true
                           dprintk("%s: readreg error (reg =3D=3D 0x%02x, r=
et =3D=3D %i)\n", __func__, reg, ret);
                           ^
   drivers/media/dvb-frontends/stv0297.c:31:23: note: expanded from macro '=
dprintk'
   #define dprintk(x...) printk(x)
                         ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:387:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   drivers/media/dvb-frontends/stv0297.c:75:4: note: Loop condition is fals=
e.  Exiting loop
                           dprintk("%s: readreg error (reg =3D=3D 0x%02x, r=
et =3D=3D %i)\n", __func__, reg, ret);
                           ^
   drivers/media/dvb-frontends/stv0297.c:31:23: note: expanded from macro '=
dprintk'
   #define dprintk(x...) printk(x)
                         ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:373:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   drivers/media/dvb-frontends/stv0297.c:76:4: note: Returning the value -1
                           return -1;
                           ^~~~~~~~~
   drivers/media/dvb-frontends/stv0297.c:130:10: note: Returning from 'stv0=
297_readreg'
                       | (stv0297_readreg(state, 0x58) << 24));
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0297.c:130:39: note: The result of the le=
ft shift is undefined because the left operand is negative
                       | (stv0297_readreg(state, 0x58) << 24));
                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
>> drivers/gpu/drm/msm/msm_drv.c:524:2: warning: Value stored to 'mdss' is =
never read [clang-analyzer-deadcode.DeadStores]
           mdss =3D priv->mdss;
           ^      ~~~~~~~~~~
   drivers/gpu/drm/msm/msm_drv.c:524:2: note: Value stored to 'mdss' is nev=
er read
           mdss =3D priv->mdss;
           ^      ~~~~~~~~~~
   drivers/gpu/drm/msm/msm_drv.c:605:4: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           ret =3D PTR_ERR(priv->event_thread[i].worker);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_drv.c:605:4: note: Value stored to 'ret' is neve=
r read
                           ret =3D PTR_ERR(priv->event_thread[i].worker);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_drv.c:1297:8: warning: 1st function call argumen=
t is an uninitialized value [clang-analyzer-core.CallAndMessage]
           ret =3D add_components_mdp(mdp_dev, matchptr);
                 ^
   drivers/gpu/drm/msm/msm_drv.c:1360:6: note: Assuming 'priv' is non-null
           if (!priv)
               ^~~~~
   drivers/gpu/drm/msm/msm_drv.c:1360:2: note: Taking false branch
           if (!priv)
           ^
   drivers/gpu/drm/msm/msm_drv.c:1365:2: note: Control jumps to the 'defaul=
t' case at line 1372
           switch (get_mdp_ver(pdev)) {
           ^
   drivers/gpu/drm/msm/msm_drv.c:1374:3: note:  Execution continues on line=
 1376
                   break;
                   ^
   drivers/gpu/drm/msm/msm_drv.c:1376:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/gpu/drm/msm/msm_drv.c:1376:2: note: Taking false branch
           if (ret) {
           ^
   drivers/gpu/drm/msm/msm_drv.c:1381:6: note: Assuming the condition is tr=
ue
           if (get_mdp_ver(pdev)) {
               ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_drv.c:1381:2: note: Taking true branch
           if (get_mdp_ver(pdev)) {
           ^
   drivers/gpu/drm/msm/msm_drv.c:1382:9: note: Calling 'add_display_compone=
nts'
                   ret =3D add_display_components(pdev, &match);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_drv.c:1259:2: note: 'mdp_dev' declared without a=
n initial value
           struct device *mdp_dev;
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_drv.c:1269:2: note: 'Default' branch taken. Exec=
ution continues on line 1297
           switch (get_mdp_ver(pdev)) {
           ^
   drivers/gpu/drm/msm/msm_drv.c:1297:8: note: 1st function call argument i=
s an uninitialized value
           ret =3D add_components_mdp(mdp_dev, matchptr);
                 ^                  ~~~~~~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
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
   9 warnings generated.
   drivers/usb/cdns3/cdns3-ti.c:160:2: warning: Value stored to 'reg' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           reg =3D cdns_ti_readl(data, USBSS_STATIC_CONFIG);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/cdns3/cdns3-ti.c:160:2: note: Value stored to 'reg' is never=
 read
           reg =3D cdns_ti_readl(data, USBSS_STATIC_CONFIG);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/usb/host/xhci-pci-renesas.c:413:3: warning: Value stored to 'ret=
val' is never read [clang-analyzer-deadcode.DeadStores]
                   retval =3D pci_read_config_byte(pdev, RENESAS_ROM_STATUS,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-pci-renesas.c:413:3: note: Value stored to 'retval=
' is never read
                   retval =3D pci_read_config_byte(pdev, RENESAS_ROM_STATUS,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/usb/class/cdc-acm.c:369:2: note: Control jumps to 'case 0:' @=
line 370
           switch (status) {
           ^
   drivers/usb/class/cdc-acm.c:372:3: note:  Execution continues on line 388
                   break;
                   ^
   drivers/usb/class/cdc-acm.c:390:6: note: Assuming field 'nb_index' is 0
           if (acm->nb_index)
               ^~~~~~~~~~~~~
   drivers/usb/class/cdc-acm.c:390:2: note: Taking false branch
           if (acm->nb_index)

vim +/mdss +524 drivers/gpu/drm/msm/msm_drv.c

5bf9c0b614542d Rob Clark                  2015-03-03  506  =

70a59dd82959f8 Daniel Vetter              2020-11-04  507  static int msm_d=
rm_init(struct device *dev, const struct drm_driver *drv)
5bf9c0b614542d Rob Clark                  2015-03-03  508  {
2b669875332fbd Archit Taneja              2016-05-02  509  	struct platform=
_device *pdev =3D to_platform_device(dev);
ec919e6e7146e0 AngeloGioacchino Del Regno 2021-12-01  510  	struct msm_drm_=
private *priv =3D dev_get_drvdata(dev);
2b669875332fbd Archit Taneja              2016-05-02  511  	struct drm_devi=
ce *ddev;
5bf9c0b614542d Rob Clark                  2015-03-03  512  	struct msm_kms =
*kms;
bc3220be22577e Rajesh Yadav               2018-06-21  513  	struct msm_mdss=
 *mdss;
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  514  	int ret, i;
5bf9c0b614542d Rob Clark                  2015-03-03  515  =

2b669875332fbd Archit Taneja              2016-05-02  516  	ddev =3D drm_de=
v_alloc(drv, dev);
0f2886057be322 Tom Gundersen              2016-09-21  517  	if (IS_ERR(ddev=
)) {
6a41da17e87dee Mamta Shukla               2018-10-20  518  		DRM_DEV_ERROR(=
dev, "failed to allocate drm_device\n");
0f2886057be322 Tom Gundersen              2016-09-21  519  		return PTR_ERR=
(ddev);
2b669875332fbd Archit Taneja              2016-05-02  520  	}
2b669875332fbd Archit Taneja              2016-05-02  521  	ddev->dev_priva=
te =3D priv;
68209390f11603 Rob Clark                  2016-05-17  522  	priv->dev =3D d=
dev;
5bf9c0b614542d Rob Clark                  2015-03-03  523  =

bc3220be22577e Rajesh Yadav               2018-06-21 @524  	mdss =3D priv->=
mdss;
bc3220be22577e Rajesh Yadav               2018-06-21  525  =

5bf9c0b614542d Rob Clark                  2015-03-03  526  	priv->wq =3D al=
loc_ordered_workqueue("msm", 0);
1d2fa58e0dda33 Samuel Iglesias Gonsalvez  2021-06-07  527  	priv->hangcheck=
_period =3D DRM_MSM_HANGCHECK_DEFAULT_PERIOD;
5bf9c0b614542d Rob Clark                  2015-03-03  528  =

6ed0897cd800c3 Rob Clark                  2021-03-31  529  	INIT_LIST_HEAD(=
&priv->objects);
6ed0897cd800c3 Rob Clark                  2021-03-31  530  	mutex_init(&pri=
v->obj_lock);
6ed0897cd800c3 Rob Clark                  2021-03-31  531  =

3edfa30f2340e6 Rob Clark                  2020-11-16  532  	INIT_LIST_HEAD(=
&priv->inactive_willneed);
3edfa30f2340e6 Rob Clark                  2020-11-16  533  	INIT_LIST_HEAD(=
&priv->inactive_dontneed);
64fcbde772c72a Rob Clark                  2021-04-05  534  	INIT_LIST_HEAD(=
&priv->inactive_unpinned);
d984457b31c4c5 Rob Clark                  2020-10-23  535  	mutex_init(&pri=
v->mm_lock);
48e7f18392c66f Kristian H. Kristensen     2019-03-20  536  =

d984457b31c4c5 Rob Clark                  2020-10-23  537  	/* Teach lockde=
p about lock ordering wrt. shrinker: */
d984457b31c4c5 Rob Clark                  2020-10-23  538  	fs_reclaim_acqu=
ire(GFP_KERNEL);
d984457b31c4c5 Rob Clark                  2020-10-23  539  	might_lock(&pri=
v->mm_lock);
d984457b31c4c5 Rob Clark                  2020-10-23  540  	fs_reclaim_rele=
ase(GFP_KERNEL);
5bf9c0b614542d Rob Clark                  2015-03-03  541  =

2b669875332fbd Archit Taneja              2016-05-02  542  	drm_mode_config=
_init(ddev);
060530f1ea6740 Rob Clark                  2014-03-03  543  =

d863f0c7b53628 Craig Tatlor               2020-12-30  544  	ret =3D msm_ini=
t_vram(ddev);
77050c3febb180 Jeykumar Sankaran          2018-06-27  545  	if (ret)
2027e5b3413d73 Dmitry Baryshkov           2021-12-01  546  		return ret;
060530f1ea6740 Rob Clark                  2014-03-03  547  =

d863f0c7b53628 Craig Tatlor               2020-12-30  548  	/* Bind all our=
 sub-components: */
d863f0c7b53628 Craig Tatlor               2020-12-30  549  	ret =3D compone=
nt_bind_all(dev, ddev);
13f15565f7887a Rob Clark                  2015-05-07  550  	if (ret)
2027e5b3413d73 Dmitry Baryshkov           2021-12-01  551  		return ret;
13f15565f7887a Rob Clark                  2015-05-07  552  =

d5653a994a665c Robin Murphy               2020-09-03  553  	dma_set_max_seg=
_size(dev, UINT_MAX);
db735fc4036bbe Sean Paul                  2020-01-21  554  =

68209390f11603 Rob Clark                  2016-05-17  555  	msm_gem_shrinke=
r_init(ddev);
68209390f11603 Rob Clark                  2016-05-17  556  =

06c0dd96bfbba8 Rob Clark                  2013-11-30  557  	switch (get_mdp=
_ver(pdev)) {
aaded2e3a1f6b7 Jeykumar Sankaran          2018-06-27  558  	case KMS_MDP4:
2b669875332fbd Archit Taneja              2016-05-02  559  		kms =3D mdp4_k=
ms_init(ddev);
0a6030d224d3a4 Archit Taneja              2016-05-08  560  		priv->kms =3D =
kms;
06c0dd96bfbba8 Rob Clark                  2013-11-30  561  		break;
aaded2e3a1f6b7 Jeykumar Sankaran          2018-06-27  562  	case KMS_MDP5:
392ae6e0efa5e2 Archit Taneja              2016-06-14  563  		kms =3D mdp5_k=
ms_init(ddev);
06c0dd96bfbba8 Rob Clark                  2013-11-30  564  		break;
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  565  	case KMS_DPU:
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  566  		kms =3D dpu_km=
s_init(ddev);
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  567  		priv->kms =3D =
kms;
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  568  		break;
06c0dd96bfbba8 Rob Clark                  2013-11-30  569  	default:
e6f6d63ed14c20 Jonathan Marek             2018-12-04  570  		/* valid only =
for the dummy headless case, where of_node=3DNULL */
e6f6d63ed14c20 Jonathan Marek             2018-12-04  571  		WARN_ON(dev->o=
f_node);
e6f6d63ed14c20 Jonathan Marek             2018-12-04  572  		kms =3D NULL;
06c0dd96bfbba8 Rob Clark                  2013-11-30  573  		break;
06c0dd96bfbba8 Rob Clark                  2013-11-30  574  	}
06c0dd96bfbba8 Rob Clark                  2013-11-30  575  =

c8afe684c95cd1 Rob Clark                  2013-06-26  576  	if (IS_ERR(kms)=
) {
6a41da17e87dee Mamta Shukla               2018-10-20  577  		DRM_DEV_ERROR(=
dev, "failed to load kms\n");
e4826a94c74446 Thomas Meyer               2013-09-16  578  		ret =3D PTR_ER=
R(kms);
b2ccfdf1dde588 Jonathan Marek             2018-11-21  579  		priv->kms =3D =
NULL;
77050c3febb180 Jeykumar Sankaran          2018-06-27  580  		goto err_msm_u=
ninit;
c8afe684c95cd1 Rob Clark                  2013-06-26  581  	}
c8afe684c95cd1 Rob Clark                  2013-06-26  582  =

bb676df12b5e81 Jeykumar Sankaran          2018-06-11  583  	/* Enable norma=
lization of plane zpos */
bb676df12b5e81 Jeykumar Sankaran          2018-06-11  584  	ddev->mode_conf=
ig.normalize_zpos =3D true;
bb676df12b5e81 Jeykumar Sankaran          2018-06-11  585  =

c8afe684c95cd1 Rob Clark                  2013-06-26  586  	if (kms) {
2d99ced787e3d0 Rob Clark                  2019-08-29  587  		kms->dev =3D d=
dev;
c8afe684c95cd1 Rob Clark                  2013-06-26  588  		ret =3D kms->f=
uncs->hw_init(kms);
c8afe684c95cd1 Rob Clark                  2013-06-26  589  		if (ret) {
6a41da17e87dee Mamta Shukla               2018-10-20  590  			DRM_DEV_ERROR=
(dev, "kms hw init failed: %d\n", ret);
77050c3febb180 Jeykumar Sankaran          2018-06-27  591  			goto err_msm_=
uninit;
c8afe684c95cd1 Rob Clark                  2013-06-26  592  		}
c8afe684c95cd1 Rob Clark                  2013-06-26  593  	}
c8afe684c95cd1 Rob Clark                  2013-06-26  594  =

2b669875332fbd Archit Taneja              2016-05-02  595  	ddev->mode_conf=
ig.funcs =3D &mode_config_funcs;
d14659f5de7d28 Sean Paul                  2018-02-28  596  	ddev->mode_conf=
ig.helper_private =3D &mode_config_helper_funcs;
c8afe684c95cd1 Rob Clark                  2013-06-26  597  =

25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  598  	for (i =3D 0; i=
 < priv->num_crtcs; i++) {
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  599  		/* initialize =
event thread */
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  600  		priv->event_th=
read[i].crtc_id =3D priv->crtcs[i]->base.id;
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  601  		priv->event_th=
read[i].dev =3D ddev;
1041dee2178ffd Bernard                    2020-07-21  602  		priv->event_th=
read[i].worker =3D kthread_create_worker(0,
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  603  			"crtc_event:%=
d", priv->event_thread[i].crtc_id);
1041dee2178ffd Bernard                    2020-07-21  604  		if (IS_ERR(pri=
v->event_thread[i].worker)) {
a1c9b1e3bdd6d8 Zhen Lei                   2021-05-08  605  			ret =3D PTR_E=
RR(priv->event_thread[i].worker);
4971f090aa7f6c Linus Torvalds             2018-12-25  606  			DRM_DEV_ERROR=
(dev, "failed to create crtc_event kthread\n");
bfddcfe155a2fe Wei Li                     2021-07-05  607  			ret =3D PTR_E=
RR(priv->event_thread[i].worker);
7f9743abaa79d3 Jeykumar Sankaran          2018-10-10  608  			goto err_msm_=
uninit;
7f9743abaa79d3 Jeykumar Sankaran          2018-10-10  609  		}
7f9743abaa79d3 Jeykumar Sankaran          2018-10-10  610  =

6d2b84a4e5b954 Linus Torvalds             2020-08-06  611  		sched_set_fifo=
(priv->event_thread[i].worker->task);
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  612  	}
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  613  =

2b669875332fbd Archit Taneja              2016-05-02  614  	ret =3D drm_vbl=
ank_init(ddev, priv->num_crtcs);
c8afe684c95cd1 Rob Clark                  2013-06-26  615  	if (ret < 0) {
6a41da17e87dee Mamta Shukla               2018-10-20  616  		DRM_DEV_ERROR(=
dev, "failed to initialize vblank\n");
77050c3febb180 Jeykumar Sankaran          2018-06-27  617  		goto err_msm_u=
ninit;
c8afe684c95cd1 Rob Clark                  2013-06-26  618  	}
c8afe684c95cd1 Rob Clark                  2013-06-26  619  =

a2b3a5571f386e Archit Taneja              2016-05-18  620  	if (kms) {
2b669875332fbd Archit Taneja              2016-05-02  621  		pm_runtime_get=
_sync(dev);
f026e431cf8611 Thomas Zimmermann          2021-08-03  622  		ret =3D msm_ir=
q_install(ddev, kms->irq);
2b669875332fbd Archit Taneja              2016-05-02  623  		pm_runtime_put=
_sync(dev);
c8afe684c95cd1 Rob Clark                  2013-06-26  624  		if (ret < 0) {
6a41da17e87dee Mamta Shukla               2018-10-20  625  			DRM_DEV_ERROR=
(dev, "failed to install IRQ handler\n");
77050c3febb180 Jeykumar Sankaran          2018-06-27  626  			goto err_msm_=
uninit;
c8afe684c95cd1 Rob Clark                  2013-06-26  627  		}
a2b3a5571f386e Archit Taneja              2016-05-18  628  	}
c8afe684c95cd1 Rob Clark                  2013-06-26  629  =

2b669875332fbd Archit Taneja              2016-05-02  630  	ret =3D drm_dev=
_register(ddev, 0);
2b669875332fbd Archit Taneja              2016-05-02  631  	if (ret)
77050c3febb180 Jeykumar Sankaran          2018-06-27  632  		goto err_msm_u=
ninit;
2b669875332fbd Archit Taneja              2016-05-02  633  =

6a7e0b0e9fb839 Fabio Estevam              2021-09-14  634  	if (kms) {
98659487b845c0 Abhinav Kumar              2021-04-16  635  		ret =3D msm_di=
sp_snapshot_init(ddev);
98659487b845c0 Abhinav Kumar              2021-04-16  636  		if (ret)
98659487b845c0 Abhinav Kumar              2021-04-16  637  			DRM_DEV_ERROR=
(dev, "msm_disp_snapshot_init failed ret =3D %d\n", ret);
6a7e0b0e9fb839 Fabio Estevam              2021-09-14  638  	}
2b669875332fbd Archit Taneja              2016-05-02  639  	drm_mode_config=
_reset(ddev);
cf3a7e4ce08e68 Rob Clark                  2014-11-08  640  =


:::::: The code@line 524 was first introduced by commit
:::::: bc3220be22577e199452edbb6a24a980a4ab5c73 drm/msm/mdp5: subclass msm_=
mdss for mdp5

:::::: TO: Rajesh Yadav <ryadav@codeaurora.org>
:::::: CC: Sean Paul <seanpaul@chromium.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0391688511667818092==--

