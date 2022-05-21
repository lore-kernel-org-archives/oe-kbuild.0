Content-Type: multipart/mixed; boundary="===============7512883112400840657=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5634/13468] drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1782:2: warning: Value stored to 'dsc_common_mode' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 21 May 2022 21:18:44 +0800
Message-ID: <202205212108.0wSa0zTW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7512883112400840657==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Vinod Koul <vkoul@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   18ecd30af1a8402c162cca1bd58771c0e5be7815
commit: 58dca9810749480737869d02bef4704756372194 [5634/13468] drm/msm/disp/=
dpu1: Add support for DSC in encoder
:::::: branch date: 24 hours ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c002-20220519 (https://download.01.org/0day-ci/archi=
ve/20220521/202205212108.0wSa0zTW-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbb=
ec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D58dca9810749480737869d02bef4704756372194
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 58dca9810749480737869d02bef4704756372194
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:421:2: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(clkname, sizeof(clkname), "di%d", chno);
           ^~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:426:2: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(clkname, sizeof(clkname), "di%d_pll", chno);
           ^~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:426:2: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(clkname, sizeof(clkname), "di%d_pll", chno);
           ^~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:658:3: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(clkname, "di%d_sel", i);
                   ^~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:658:3: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(clkname, "di%d_sel", i);
                   ^~~~~~~
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/spi/spi-omap2-mcspi.c:610:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cfg, 0, sizeof(cfg));
           ^~~~~~
   drivers/spi/spi-omap2-mcspi.c:610:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(&cfg, 0, sizeof(cfg));
           ^~~~~~
   drivers/spi/spi-omap2-mcspi.c:1232:3: warning: Value stored to 'par_over=
ride' is never read [clang-analyzer-deadcode.DeadStores]
                   par_override =3D 0;
                   ^              ~
   drivers/spi/spi-omap2-mcspi.c:1232:3: note: Value stored to 'par_overrid=
e' is never read
                   par_override =3D 0;
                   ^              ~
   drivers/spi/spi-omap2-mcspi.c:1501:3: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(mcspi->dma_channels[i].dma_rx_ch_name, "rx%d", i=
);
                   ^~~~~~~
   drivers/spi/spi-omap2-mcspi.c:1501:3: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(mcspi->dma_channels[i].dma_rx_ch_name, "rx%d", i=
);
                   ^~~~~~~
   drivers/spi/spi-omap2-mcspi.c:1502:3: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(mcspi->dma_channels[i].dma_tx_ch_name, "tx%d", i=
);
                   ^~~~~~~
   drivers/spi/spi-omap2-mcspi.c:1502:3: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(mcspi->dma_channels[i].dma_tx_ch_name, "tx%d", i=
);
                   ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/w1/slaves/w1_ds250x.c:161:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, &data->eprom[off], count);
           ^~~~~~
   drivers/w1/slaves/w1_ds250x.c:161:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, &data->eprom[off], count);
           ^~~~~~
   drivers/w1/slaves/w1_ds250x.c:201:3: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(data->nvmem_name, sizeof(data->nvmem_name),
                   ^~~~~~~~
   drivers/w1/slaves/w1_ds250x.c:201:3: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(data->nvmem_name, sizeof(data->nvmem_name),
                   ^~~~~~~~
   drivers/w1/slaves/w1_ds250x.c:206:3: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(data->nvmem_name, sizeof(data->nvmem_name),
                   ^~~~~~~~
   drivers/w1/slaves/w1_ds250x.c:206:3: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(data->nvmem_name, sizeof(data->nvmem_name),
                   ^~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/w1/slaves/w1_ds28e04.c:137:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, &data->memory[off], count);
                   ^~~~~~
   drivers/w1/slaves/w1_ds28e04.c:137:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, &data->memory[off], count);
                   ^~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:257:2: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&dither_cfg.matrix, dither_matrix,
           ^~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:257:2: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&dither_cfg.matrix, dither_matrix,
           ^~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:592:2: warning: Value stored=
 to 'mode' is never read [clang-analyzer-deadcode.DeadStores]
           mode =3D &crtc_state->mode;
           ^      ~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:592:2: note: Value stored to=
 'mode' is never read
           mode =3D &crtc_state->mode;
           ^      ~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1782:2: warning: Value store=
d to 'dsc_common_mode' is never read [clang-analyzer-deadcode.DeadStores]
           dsc_common_mode =3D 0;
           ^                 ~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1782:2: note: Value stored t=
o 'dsc_common_mode' is never read
           dsc_common_mode =3D 0;
           ^                 ~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1945:2: warning: Call to fun=
ction 'snprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'snprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, DPU_NAME_SIZE, "encoder%u", drm_enc->base.id);
           ^~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1945:2: note: Call to functi=
on 'snprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, DPU_NAME_SIZE, "encoder%u", drm_enc->base.id);
           ^~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:2058:2: warning: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&phys_params, 0, sizeof(phys_params));
           ^~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:2058:2: note: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11
           memset(&phys_params, 0, sizeof(phys_params));
           ^~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:2205:2: warning: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           kthread_init_work(&dpu_enc->vsync_event_work,
           ^
   include/linux/kthread.h:173:3: note: expanded from macro 'kthread_init_w=
ork'
                   memset((work), 0, sizeof(struct kthread_work));         \
                   ^~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:2205:2: note: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11
           kthread_init_work(&dpu_enc->vsync_event_work,
           ^
   include/linux/kthread.h:173:3: note: expanded from macro 'kthread_init_w=
ork'
                   memset((work), 0, sizeof(struct kthread_work));         \
                   ^~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:2208:2: warning: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&dpu_enc->disp_info, disp_info, sizeof(*disp_info));
           ^~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:2208:2: note: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&dpu_enc->disp_info, disp_info, sizeof(*disp_info));
           ^~~~~~
   Suppressed 56 warnings (55 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/hwmon/lm75.h:30:29: warning: The result of the left shift is und=
efined because the left operand is negative [clang-analyzer-core.UndefinedB=
inaryOperatorResult]
           return (u16)((ntemp / 500) << 7);
                                      ^
   drivers/hwmon/w83627hf.c:777:2: note: Assuming 'err' is 0
           if (err)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/hwmon/w83627hf.c:777:2: note: '?' condition is false
           if (err)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/hwmon/w83627hf.c:777:6: note: 'err' is 0
           if (err)
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
   drivers/hwmon/w83627hf.c:777:2: note: '?' condition is false
           if (err)
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
   drivers/hwmon/w83627hf.c:777:2: note: Taking false branch
           if (err)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/hwmon/w83627hf.c:780:8: note: Assuming 'nr' is not equal to 0
           tmp =3D (nr) ? LM75_TEMP_TO_REG(val) : TEMP_TO_REG(val);
                 ^~~~
   drivers/hwmon/w83627hf.c:780:8: note: '?' condition is true
   drivers/hwmon/w83627hf.c:780:15: note: Calling 'LM75_TEMP_TO_REG'
           tmp =3D (nr) ? LM75_TEMP_TO_REG(val) : TEMP_TO_REG(val);
                        ^~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/lm75.h:27:14: note: Assuming '__UNIQUE_ID___x169' is <=3D =
'__UNIQUE_ID___y170'

vim +/dsc_common_mode +1782 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c

58dca981074948 Vinod Koul 2022-04-06  1757  =

58dca981074948 Vinod Koul 2022-04-06  1758  static void dpu_encoder_prep_ds=
c(struct dpu_encoder_virt *dpu_enc,
58dca981074948 Vinod Koul 2022-04-06  1759  				 struct msm_display_dsc_con=
fig *dsc)
58dca981074948 Vinod Koul 2022-04-06  1760  {
58dca981074948 Vinod Koul 2022-04-06  1761  	/* coding only for 2LM, 2enc, =
1 dsc config */
58dca981074948 Vinod Koul 2022-04-06  1762  	struct dpu_encoder_phys *enc_m=
aster =3D dpu_enc->cur_master;
58dca981074948 Vinod Koul 2022-04-06  1763  	struct dpu_hw_dsc *hw_dsc[MAX_=
CHANNELS_PER_ENC];
58dca981074948 Vinod Koul 2022-04-06  1764  	struct dpu_hw_pingpong *hw_pp[=
MAX_CHANNELS_PER_ENC];
58dca981074948 Vinod Koul 2022-04-06  1765  	int this_frame_slices;
58dca981074948 Vinod Koul 2022-04-06  1766  	int intf_ip_w, enc_ip_w;
58dca981074948 Vinod Koul 2022-04-06  1767  	int dsc_common_mode;
58dca981074948 Vinod Koul 2022-04-06  1768  	int pic_width;
58dca981074948 Vinod Koul 2022-04-06  1769  	u32 initial_lines;
58dca981074948 Vinod Koul 2022-04-06  1770  	int i;
58dca981074948 Vinod Koul 2022-04-06  1771  =

58dca981074948 Vinod Koul 2022-04-06  1772  	for (i =3D 0; i < MAX_CHANNELS=
_PER_ENC; i++) {
58dca981074948 Vinod Koul 2022-04-06  1773  		hw_pp[i] =3D dpu_enc->hw_pp[i=
];
58dca981074948 Vinod Koul 2022-04-06  1774  		hw_dsc[i] =3D dpu_enc->hw_dsc=
[i];
58dca981074948 Vinod Koul 2022-04-06  1775  =

58dca981074948 Vinod Koul 2022-04-06  1776  		if (!hw_pp[i] || !hw_dsc[i]) {
58dca981074948 Vinod Koul 2022-04-06  1777  			DPU_ERROR_ENC(dpu_enc, "inva=
lid params for DSC\n");
58dca981074948 Vinod Koul 2022-04-06  1778  			return;
58dca981074948 Vinod Koul 2022-04-06  1779  		}
58dca981074948 Vinod Koul 2022-04-06  1780  	}
58dca981074948 Vinod Koul 2022-04-06  1781  =

58dca981074948 Vinod Koul 2022-04-06 @1782  	dsc_common_mode =3D 0;
58dca981074948 Vinod Koul 2022-04-06  1783  	pic_width =3D dsc->drm->pic_wi=
dth;
58dca981074948 Vinod Koul 2022-04-06  1784  =

58dca981074948 Vinod Koul 2022-04-06  1785  	dsc_common_mode =3D DSC_MODE_M=
ULTIPLEX | DSC_MODE_SPLIT_PANEL;
58dca981074948 Vinod Koul 2022-04-06  1786  	if (enc_master->intf_mode =3D=
=3D INTF_MODE_VIDEO)
58dca981074948 Vinod Koul 2022-04-06  1787  		dsc_common_mode |=3D DSC_MODE=
_VIDEO;
58dca981074948 Vinod Koul 2022-04-06  1788  =

58dca981074948 Vinod Koul 2022-04-06  1789  	this_frame_slices =3D pic_widt=
h / dsc->drm->slice_width;
58dca981074948 Vinod Koul 2022-04-06  1790  	intf_ip_w =3D this_frame_slice=
s * dsc->drm->slice_width;
58dca981074948 Vinod Koul 2022-04-06  1791  =

58dca981074948 Vinod Koul 2022-04-06  1792  	/*
58dca981074948 Vinod Koul 2022-04-06  1793  	 * dsc merge case: when using =
2 encoders for the same stream,
58dca981074948 Vinod Koul 2022-04-06  1794  	 * no. of slices need to be sa=
me on both the encoders.
58dca981074948 Vinod Koul 2022-04-06  1795  	 */
58dca981074948 Vinod Koul 2022-04-06  1796  	enc_ip_w =3D intf_ip_w / 2;
58dca981074948 Vinod Koul 2022-04-06  1797  	initial_lines =3D dpu_encoder_=
dsc_initial_line_calc(dsc, enc_ip_w);
58dca981074948 Vinod Koul 2022-04-06  1798  =

58dca981074948 Vinod Koul 2022-04-06  1799  	for (i =3D 0; i < MAX_CHANNELS=
_PER_ENC; i++)
58dca981074948 Vinod Koul 2022-04-06  1800  		dpu_encoder_dsc_pipe_cfg(hw_d=
sc[i], hw_pp[i], dsc, dsc_common_mode, initial_lines);
58dca981074948 Vinod Koul 2022-04-06  1801  }
58dca981074948 Vinod Koul 2022-04-06  1802  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7512883112400840657==--

