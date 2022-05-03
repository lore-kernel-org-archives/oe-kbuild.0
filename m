Content-Type: multipart/mixed; boundary="===============3311583203846637151=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-msm:msm-next-staging 61/96] drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:253:34: warning: Access to field 'hdisplay' results in a dereference of an undefined pointer value (loaded from variable 'mode') [clang-analyzer-core.NullDereference]
Date: Tue, 03 May 2022 20:51:22 +0800
Message-ID: <202205032023.OcmtwnJ3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3311583203846637151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Abhinav Kumar <quic_abhinavk@quicinc.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next-staging
head:   f1fc2b87de4719cfa8e193e0746cc524dd9f7472
commit: d7d0e73f7de33a2b9998b607707a3e944ef3b86d [61/96] drm/msm/dpu: intro=
duce the dpu_encoder_phys_* for writeback
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-c006-20220501 (https://download.01.org/0day-ci/arc=
hive/20220503/202205032023.OcmtwnJ3-lkp(a)intel.com/config)
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
        git checkout d7d0e73f7de33a2b9998b607707a3e944ef3b86d
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:148:3: note: Returni=
ng without writing to 'phys_enc->hw_ctl', which participates in a condition=
 later
                   return;
                   ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:148:3: note: Returni=
ng without writing to 'phys_enc->hw_pp'
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:353:2: note: Returni=
ng from 'dpu_encoder_phys_wb_setup_fb'
           dpu_encoder_phys_wb_setup_fb(phys_enc, fb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:355:2: note: Calling=
 'dpu_encoder_phys_wb_setup_cdp'
           dpu_encoder_phys_wb_setup_cdp(phys_enc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:194:7: note: 'phys_e=
nc' is non-null
           if (!phys_enc) {
                ^~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:194:2: note: Taking =
false branch
           if (!phys_enc) {
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:202:6: note: Assumin=
g the condition is true
           if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) &&
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:202:6: note: Left si=
de of '&&' is true
           if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) &&
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:203:14: note: Field =
'hw_ctl' is non-null
                   (phys_enc->hw_ctl &&
                              ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:203:4: note: Left si=
de of '&&' is true
                   (phys_enc->hw_ctl &&
                    ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:204:4: note: Assumin=
g field 'setup_intf_cfg' is non-null
                    phys_enc->hw_ctl->ops.setup_intf_cfg)) {
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:202:2: note: Taking =
true branch
           if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) &&
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:209:13: note: Callin=
g 'dpu_encoder_helper_get_3d_blend_mode'
                   mode_3d =3D dpu_encoder_helper_get_3d_blend_mode(phys_en=
c);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h:340:7: note: 'phys_enc'=
 is non-null
           if (!phys_enc || phys_enc->enable_state =3D=3D DPU_ENC_DISABLING)
                ^~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h:340:6: note: Left side =
of '||' is false
           if (!phys_enc || phys_enc->enable_state =3D=3D DPU_ENC_DISABLING)
               ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h:340:19: note: Assuming =
field 'enable_state' is not equal to DPU_ENC_DISABLING
           if (!phys_enc || phys_enc->enable_state =3D=3D DPU_ENC_DISABLING)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h:340:2: note: Taking fal=
se branch
           if (!phys_enc || phys_enc->enable_state =3D=3D DPU_ENC_DISABLING)
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h:346:6: note: Assuming f=
ield 'split_role' is equal to ENC_ROLE_SOLO
           if (phys_enc->split_role =3D=3D ENC_ROLE_SOLO &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h:346:6: note: Left side =
of '&&' is true
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h:347:6: note: Assuming f=
ield 'num_mixers' is equal to CRTC_DUAL_MIXERS
               dpu_cstate->num_mixers =3D=3D CRTC_DUAL_MIXERS &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h:346:6: note: Left side =
of '&&' is true
           if (phys_enc->split_role =3D=3D ENC_ROLE_SOLO &&
               ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h:348:6: note: Assuming t=
he condition is true
               !dpu_encoder_use_dsc_merge(phys_enc->parent))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h:346:2: note: Taking tru=
e branch
           if (phys_enc->split_role =3D=3D ENC_ROLE_SOLO &&
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h:349:3: note: Returning =
without writing to 'phys_enc->hw_pp'
                   return BLEND_3D_H_ROW_INT;
                   ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:209:13: note: Return=
ing from 'dpu_encoder_helper_get_3d_blend_mode'
                   mode_3d =3D dpu_encoder_helper_get_3d_blend_mode(phys_en=
c);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:214:7: note: 'mode_3=
d' is 2
                   if (mode_3d && hw_pp && hw_pp->merge_3d)
                       ^~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:214:7: note: Left si=
de of '&&' is true
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:214:18: note: Assumi=
ng 'hw_pp' is null
                   if (mode_3d && hw_pp && hw_pp->merge_3d)
                                  ^~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:214:7: note: Assumin=
g pointer value is null
                   if (mode_3d && hw_pp && hw_pp->merge_3d)
                       ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:214:24: note: Left s=
ide of '&&' is false
                   if (mode_3d && hw_pp && hw_pp->merge_3d)
                                        ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:217:7: note: Access =
to field 'merge_3d' results in a dereference of a null pointer (loaded from=
 field 'hw_pp')
                   if (phys_enc->hw_pp->merge_3d && phys_enc->hw_pp->merge_=
3d->ops.setup_3d_mode)
                       ^         ~~~~~
>> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:253:34: warning: Acc=
ess to field 'hdisplay' results in a dereference of an undefined pointer va=
lue (loaded from variable 'mode') [clang-analyzer-core.NullDereference]
                           phys_enc->wb_idx, mode->name, mode->hdisplay, mo=
de->vdisplay);
                                                         ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h:36:21: note: expanded from macro=
 'DPU_DEBUG'
                           DRM_DEBUG(fmt, ##__VA_ARGS__); \
                                            ^~~~~~~~~~~
   include/drm/drm_print.h:526:32: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
                                         ^~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:250:2: note: 'mode' =
declared without an initial value
           const struct drm_display_mode *mode;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:252:2: note: Taking =
true branch
           DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h:35:3: note: expanded from macro =
'DPU_DEBUG'
                   if (drm_debug_enabled(DRM_UT_KMS))                      =
   \
                   ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:253:34: note: Access=
 to field 'hdisplay' results in a dereference of an undefined pointer value=
 (loaded from variable 'mode')
                           phys_enc->wb_idx, mode->name, mode->hdisplay, mo=
de->vdisplay);
                                                         ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h:36:21: note: expanded from macro=
 'DPU_DEBUG'
                           DRM_DEBUG(fmt, ##__VA_ARGS__); \
                                            ^~~~~~~~~~~
   include/drm/drm_print.h:526:32: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
                                         ^~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:412:2: warning: Valu=
e stored to 'refcount' is never read [clang-analyzer-deadcode.DeadStores]
           refcount =3D atomic_read(&wb_enc->wbirq_refcount);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:412:2: note: Value s=
tored to 'refcount' is never read
           refcount =3D atomic_read(&wb_enc->wbirq_refcount);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:613:2: warning: Call=
 to function 'memset' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'memset_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(wb_cfg, 0, sizeof(struct dpu_hw_wb_cfg));
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
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:613:2: note: Call to=
 function 'memset' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(wb_cfg, 0, sizeof(struct dpu_hw_wb_cfg));
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
   Suppressed 57 warnings (55 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/input/mouse/cyapa_gen3.c:621:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&cmd[1], payload, cmd_len);
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
   drivers/input/mouse/cyapa_gen3.c:621:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&cmd[1], payload, cmd_len);
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
   drivers/input/mouse/cyapa_gen3.c:658:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(write_block_cmd.key, security_key, sizeof(security_key));
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
   drivers/input/mouse/cyapa_gen3.c:658:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(write_block_cmd.key, security_key, sizeof(security_key));

vim +253 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c

d7d0e73f7de33a Abhinav Kumar 2022-04-26  237  =

d7d0e73f7de33a Abhinav Kumar 2022-04-26  238  /**
d7d0e73f7de33a Abhinav Kumar 2022-04-26  239   * dpu_encoder_phys_wb_atomic=
_check - verify and fixup given atomic states
d7d0e73f7de33a Abhinav Kumar 2022-04-26  240   * @phys_enc:	Pointer to phys=
ical encoder
d7d0e73f7de33a Abhinav Kumar 2022-04-26  241   * @crtc_state:	Pointer to CR=
TC atomic state
d7d0e73f7de33a Abhinav Kumar 2022-04-26  242   * @conn_state:	Pointer to co=
nnector atomic state
d7d0e73f7de33a Abhinav Kumar 2022-04-26  243   */
d7d0e73f7de33a Abhinav Kumar 2022-04-26  244  static int dpu_encoder_phys_w=
b_atomic_check(
d7d0e73f7de33a Abhinav Kumar 2022-04-26  245  		struct dpu_encoder_phys *ph=
ys_enc,
d7d0e73f7de33a Abhinav Kumar 2022-04-26  246  		struct drm_crtc_state *crtc=
_state,
d7d0e73f7de33a Abhinav Kumar 2022-04-26  247  		struct drm_connector_state =
*conn_state)
d7d0e73f7de33a Abhinav Kumar 2022-04-26  248  {
d7d0e73f7de33a Abhinav Kumar 2022-04-26  249  	struct drm_framebuffer *fb;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  250  	const struct drm_display_mod=
e *mode;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  251  =

d7d0e73f7de33a Abhinav Kumar 2022-04-26  252  	DPU_DEBUG("[atomic_check:%d,=
 \"%s\",%d,%d]\n",
d7d0e73f7de33a Abhinav Kumar 2022-04-26 @253  			phys_enc->wb_idx, mode->na=
me, mode->hdisplay, mode->vdisplay);
d7d0e73f7de33a Abhinav Kumar 2022-04-26  254  =

d7d0e73f7de33a Abhinav Kumar 2022-04-26  255  	if (!conn_state->writeback_j=
ob || !conn_state->writeback_job->fb)
d7d0e73f7de33a Abhinav Kumar 2022-04-26  256  		return 0;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  257  =

d7d0e73f7de33a Abhinav Kumar 2022-04-26  258  	fb =3D conn_state->writeback=
_job->fb;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  259  	mode =3D &crtc_state->mode;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  260  =

d7d0e73f7de33a Abhinav Kumar 2022-04-26  261  	if (!conn_state || !conn_sta=
te->connector) {
d7d0e73f7de33a Abhinav Kumar 2022-04-26  262  		DPU_ERROR("invalid connecto=
r state\n");
d7d0e73f7de33a Abhinav Kumar 2022-04-26  263  		return -EINVAL;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  264  	} else if (conn_state->conne=
ctor->status !=3D
d7d0e73f7de33a Abhinav Kumar 2022-04-26  265  			connector_status_connected=
) {
d7d0e73f7de33a Abhinav Kumar 2022-04-26  266  		DPU_ERROR("connector not co=
nnected %d\n",
d7d0e73f7de33a Abhinav Kumar 2022-04-26  267  				conn_state->connector->st=
atus);
d7d0e73f7de33a Abhinav Kumar 2022-04-26  268  		return -EINVAL;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  269  	}
d7d0e73f7de33a Abhinav Kumar 2022-04-26  270  =

d7d0e73f7de33a Abhinav Kumar 2022-04-26  271  	DPU_DEBUG("[fb_id:%u][fb:%u,=
%u]\n", fb->base.id,
d7d0e73f7de33a Abhinav Kumar 2022-04-26  272  			fb->width, fb->height);
d7d0e73f7de33a Abhinav Kumar 2022-04-26  273  =

d7d0e73f7de33a Abhinav Kumar 2022-04-26  274  	if (fb->width !=3D mode->hdi=
splay) {
d7d0e73f7de33a Abhinav Kumar 2022-04-26  275  		DPU_ERROR("invalid fb w=3D%=
d, mode w=3D%d\n", fb->width,
d7d0e73f7de33a Abhinav Kumar 2022-04-26  276  				mode->hdisplay);
d7d0e73f7de33a Abhinav Kumar 2022-04-26  277  		return -EINVAL;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  278  	} else if (fb->height !=3D m=
ode->vdisplay) {
d7d0e73f7de33a Abhinav Kumar 2022-04-26  279  		DPU_ERROR("invalid fb h=3D%=
d, mode h=3D%d\n", fb->height,
d7d0e73f7de33a Abhinav Kumar 2022-04-26  280  				  mode->vdisplay);
d7d0e73f7de33a Abhinav Kumar 2022-04-26  281  		return -EINVAL;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  282  	} else if (fb->width > DEFAU=
LT_MAX_WRITEBACK_WIDTH) {
d7d0e73f7de33a Abhinav Kumar 2022-04-26  283  		DPU_ERROR("invalid fb w=3D%=
d, maxlinewidth=3D%u\n",
d7d0e73f7de33a Abhinav Kumar 2022-04-26  284  				  fb->width, DEFAULT_MAX_=
WRITEBACK_WIDTH);
d7d0e73f7de33a Abhinav Kumar 2022-04-26  285  		return -EINVAL;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  286  	}
d7d0e73f7de33a Abhinav Kumar 2022-04-26  287  =

d7d0e73f7de33a Abhinav Kumar 2022-04-26  288  	return 0;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  289  }
d7d0e73f7de33a Abhinav Kumar 2022-04-26  290  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3311583203846637151==--

