Content-Type: multipart/mixed; boundary="===============8272027855646026174=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5616/13468] drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:563:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 22 May 2022 20:09:51 +0800
Message-ID: <202205222011.XrGmZ55m-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8272027855646026174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Stephen Boyd <swboyd@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   18ecd30af1a8402c162cca1bd58771c0e5be7815
commit: 6874f48bb8b050b695698f1145e6846ba08baa75 [5616/13468] drm/msm: make=
 mdp5/dpu devices master components
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c002-20220519 (https://download.01.org/0day-ci/archi=
ve/20220522/202205222011.XrGmZ55m-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbb=
ec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D6874f48bb8b050b695698f1145e6846ba08baa75
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6874f48bb8b050b695698f1145e6846ba08baa75
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/leds/leds-tca6507.c:355:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(file, tca->reg_file, TCA6507_REG_CNT);
           ^~~~~~
   drivers/leds/leds-tca6507.c:355:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(file, tca->reg_file, TCA6507_REG_CNT);
           ^~~~~~
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
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
   56 warnings generated.
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:109:3: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst, src, size);
                   ^~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:109:3: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dst, src, size);
                   ^~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:826:2: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(snapshot->data, bo->virt, bo->size);
           ^~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:826:2: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(snapshot->data, bo->virt, bo->size);
           ^~~~~~
   Suppressed 54 warnings (54 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c:137:2: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&buf[1], data, data_len);
           ^~~~~~
   drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c:137:2: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&buf[1], data, data_len);
           ^~~~~~
   drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c:170:4: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(scm_buf, 0, sizeof(scm_buf));
                           ^~~~~~
   drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c:170:4: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
                           memset(scm_buf, 0, sizeof(scm_buf));
                           ^~~~~~
   Suppressed 54 warnings (54 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/gpu/drm/qxl/qxl_ttm.c:248:4: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(qxl_mem_types_names[i], "qxl_mem_mm");
                           ^~~~~~~
   drivers/gpu/drm/qxl/qxl_ttm.c:248:4: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                           sprintf(qxl_mem_types_names[i], "qxl_mem_mm");
                           ^~~~~~~
   drivers/gpu/drm/qxl/qxl_ttm.c:250:4: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(qxl_mem_types_names[i], "qxl_surf_mm");
                           ^~~~~~~
   drivers/gpu/drm/qxl/qxl_ttm.c:250:4: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                           sprintf(qxl_mem_types_names[i], "qxl_surf_mm");
                           ^~~~~~~
   Suppressed 54 warnings (54 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   Suppressed 54 warnings (54 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   Suppressed 54 warnings (54 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c:291:3: warning: Value stored t=
o 'plane' is never read [clang-analyzer-deadcode.DeadStores]
                   plane =3D pstates[i]->base.plane;
                   ^       ~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c:291:3: note: Value stored to '=
plane' is never read
                   plane =3D pstates[i]->base.plane;
                   ^       ~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c:1056:24: warning: Although the=
 value stored to 'x' is used in the enclosing expression, the value is neve=
r actually read from 'x' [clang-analyzer-deadcode.DeadStores]
           mdp5_crtc->cursor.x =3D x =3D max(x, -(int)mdp5_crtc->cursor.wid=
th);
                                 ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c:1056:24: note: Although the va=
lue stored to 'x' is used in the enclosing expression, the value is never a=
ctually read from 'x'
   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c:1057:24: warning: Although the=
 value stored to 'y' is used in the enclosing expression, the value is neve=
r actually read from 'y' [clang-analyzer-deadcode.DeadStores]
           mdp5_crtc->cursor.y =3D y =3D max(y, -(int)mdp5_crtc->cursor.hei=
ght);
                                 ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c:1057:24: note: Although the va=
lue stored to 'y' is used in the enclosing expression, the value is never a=
ctually read from 'y'
   Suppressed 54 warnings (54 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   Suppressed 54 warnings (54 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   Suppressed 54 warnings (54 in non-user code).
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
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:815:6: note: Assuming 'mdp5_kms=
' is non-null
           if (!mdp5_kms) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:815:2: note: '?' condition is f=
alse
           if (!mdp5_kms) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:815:7: note: 'mdp5_kms' is non-=
null
           if (!mdp5_kms) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:815:2: note: '?' condition is f=
alse
           if (!mdp5_kms) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:815:2: note: Taking false branch
           if (!mdp5_kms) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:822:2: note: Loop condition is =
false.  Exiting loop
           spin_lock_init(&mdp5_kms->resource_lock);
           ^
   include/linux/spinlock.h:329:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:828:2: note: '?' condition is f=
alse
           if (ret)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:828:6: note: 'ret' is 0
           if (ret)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:828:2: note: '?' condition is f=
alse
           if (ret)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:828:2: note: Taking false branch
           if (ret)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )

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
--===============8272027855646026174==--

