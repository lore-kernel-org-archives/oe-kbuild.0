Content-Type: multipart/mixed; boundary="===============2474366865737217193=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-msm:msm-next-staging 22/96] drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1782:2: warning: Value stored to 'dsc_common_mode' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 03 May 2022 11:28:10 +0800
Message-ID: <202205031135.LX8fXEgS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2474366865737217193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Vinod Koul <vkoul@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next-staging
head:   f1fc2b87de4719cfa8e193e0746cc524dd9f7472
commit: 58dca9810749480737869d02bef4704756372194 [22/96] drm/msm/disp/dpu1:=
 Add support for DSC in encoder
:::::: branch date: 28 hours ago
:::::: commit date: 7 days ago
config: riscv-randconfig-c006-20220501 (https://download.01.org/0day-ci/arc=
hive/20220503/202205031135.LX8fXEgS-lkp(a)intel.com/config)
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
        git checkout 58dca9810749480737869d02bef4704756372194
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   drivers/input/mousedev.c:280:5: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(p, 0, sizeof(struct mousedev_moti=
on));
                                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/input/mousedev.c:280:5: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                                   memset(p, 0, sizeof(struct mousedev_moti=
on));
                                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/input/mousedev.c:746:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, client->ps2 + client->bufsiz - client->buffer, coun=
t);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/input/mousedev.c:746:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, client->ps2 + client->bufsiz - client->buffer, coun=
t);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:257:2: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&dither_cfg.matrix, dither_matrix,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:257:2: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&dither_cfg.matrix, dither_matrix,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
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
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:2058:2: note: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11
           memset(&phys_params, 0, sizeof(phys_params));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
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
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:2205:2: note: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11
           kthread_init_work(&dpu_enc->vsync_event_work,
           ^
   include/linux/kthread.h:173:3: note: expanded from macro 'kthread_init_w=
ork'
                   memset((work), 0, sizeof(struct kthread_work));         \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:2208:2: warning: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&dpu_enc->disp_info, disp_info, sizeof(*disp_info));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:2208:2: note: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&dpu_enc->disp_info, disp_info, sizeof(*disp_info));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 56 warnings (55 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/gpu/drm/vc4/vc4_validate_shaders.c:169:2: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&temp_samples[s],
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
--===============2474366865737217193==--

