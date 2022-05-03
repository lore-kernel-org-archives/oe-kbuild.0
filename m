Content-Type: multipart/mixed; boundary="===============8914332012458531886=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-msm:msm-next-staging 34/96] drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:164:2: warning: Called function pointer is null (null dereference) [clang-analyzer-core.CallAndMessage]
Date: Tue, 03 May 2022 15:56:50 +0800
Message-ID: <202205031541.POCTat30-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8914332012458531886==
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
commit: c929ac60b3ed34accd25a052a4833e418900f466 [34/96] drm/msm/dpu: allow=
 just single IRQ callback
:::::: branch date: 32 hours ago
:::::: commit date: 33 hours ago
config: riscv-randconfig-c006-20220501 (https://download.01.org/0day-ci/arc=
hive/20220503/202205031541.POCTat30-lkp(a)intel.com/config)
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
        git checkout c929ac60b3ed34accd25a052a4833e418900f466
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   memset(&mrq, 0, sizeof(struct mmc_request));
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
   drivers/mmc/core/sd_ops.c:73:3: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                   memset(&mrq, 0, sizeof(struct mmc_request));
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
   drivers/mmc/core/sd_ops.c:75:3: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(cmd->resp, 0, sizeof(cmd->resp));
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
   drivers/mmc/core/sd_ops.c:75:3: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                   memset(cmd->resp, 0, sizeof(cmd->resp));
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
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   sound/soc/uniphier/aio-cpu.c:664:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(chip->plls, chip->chip_spec->plls,
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
   sound/soc/uniphier/aio-cpu.c:664:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(chip->plls, chip->chip_spec->plls,
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
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
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
   59 warnings generated.
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:164:2: warning: Called=
 function pointer is null (null dereference) [clang-analyzer-core.CallAndMe=
ssage]
           dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[=
irq_idx].arg, irq_idx);
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:178:6: note: Assuming =
'intr' is non-null
           if (!intr)
               ^~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:178:2: note: Taking fa=
lse branch
           if (!intr)
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:181:2: note: Loop cond=
ition is false.  Exiting loop
           spin_lock_irqsave(&intr->irq_lock, irq_flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:181:2: note: Loop cond=
ition is false.  Exiting loop
           spin_lock_irqsave(&intr->irq_lock, irq_flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:182:2: note: Loop cond=
ition is true.  Entering loop body
           for (reg_idx =3D 0; reg_idx < ARRAY_SIZE(dpu_intr_set); reg_idx+=
+) {
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:183:7: note: Assuming =
the condition is false
                   if (!test_bit(reg_idx, &intr->irq_mask))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:183:3: note: Taking fa=
lse branch
                   if (!test_bit(reg_idx, &intr->irq_mask))
                   ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:193:7: note: Assuming =
'irq_status' is not equal to 0
                   if (irq_status)
                       ^~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:193:3: note: Taking tr=
ue branch
                   if (irq_status)
                   ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:194:4: note: Value ass=
igned to field 'cb'
                           DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].c=
lr_off,
                           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:310:36: note: expanded from =
macro 'DPU_REG_WRITE'
   #define DPU_REG_WRITE(c, off, val) dpu_reg_write(c, off, val, #off)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:200:7: note: Assuming =
'irq_status' is not equal to 0
                   if (!irq_status)
                       ^~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:200:3: note: Taking fa=
lse branch
                   if (!irq_status)
                   ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:206:3: note: Loop cond=
ition is true.  Entering loop body
                   while ((bit =3D ffs(irq_status)) !=3D 0) {
                   ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:209:4: note: Calling '=
dpu_core_irq_callback_handler'
                           dpu_core_irq_callback_handler(dpu_kms, irq_idx);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:154:2: note: Taking fa=
lse branch
           VERB("irq_idx=3D%d\n", irq_idx);
           ^
   drivers/gpu/drm/msm/msm_drv.h:509:24: note: expanded from macro 'VERB'
   #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
                          ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:156:6: note: Assuming =
field 'cb' is null
           if (!dpu_kms->hw_intr->irq_tbl[irq_idx].cb)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:156:2: note: Taking tr=
ue branch
           if (!dpu_kms->hw_intr->irq_tbl[irq_idx].cb)
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:164:2: note: Called fu=
nction pointer is null (null dereference)
           dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[=
irq_idx].arg, irq_idx);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:255:3: warning: Value =
stored to 'dbgstr' is never read [clang-analyzer-deadcode.DeadStores]
                   dbgstr =3D "DPU IRQ already set:";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:255:3: note: Value sto=
red to 'dbgstr' is never read
                   dbgstr =3D "DPU IRQ already set:";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:257:3: warning: Value =
stored to 'dbgstr' is never read [clang-analyzer-deadcode.DeadStores]
                   dbgstr =3D "DPU IRQ enabled:";
                   ^        ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:257:3: note: Value sto=
red to 'dbgstr' is never read
                   dbgstr =3D "DPU IRQ enabled:";
                   ^        ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:304:3: warning: Value =
stored to 'dbgstr' is never read [clang-analyzer-deadcode.DeadStores]
                   dbgstr =3D "DPU IRQ is already cleared:";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:304:3: note: Value sto=
red to 'dbgstr' is never read
                   dbgstr =3D "DPU IRQ is already cleared:";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:306:3: warning: Value =
stored to 'dbgstr' is never read [clang-analyzer-deadcode.DeadStores]
                   dbgstr =3D "DPU IRQ mask disable:";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:306:3: note: Value sto=
red to 'dbgstr' is never read
                   dbgstr =3D "DPU IRQ mask disable:";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 54 warnings (54 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   fs/quota/quota.c:134:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&uinfo, 0, sizeof(uinfo));

vim +164 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c

667e9985ee24ca Dmitry Baryshkov  2021-05-16  146  =

a73033619ea904 Dmitry Baryshkov  2021-06-18  147  /**
a73033619ea904 Dmitry Baryshkov  2021-06-18  148   * dpu_core_irq_callback_=
handler - dispatch core interrupts
07567d596eb0ad Vinod Koul        2022-02-10  149   * @dpu_kms:		Pointer to =
DPU's KMS structure
a73033619ea904 Dmitry Baryshkov  2021-06-18  150   * @irq_idx:		interrupt i=
ndex
a73033619ea904 Dmitry Baryshkov  2021-06-18  151   */
a73033619ea904 Dmitry Baryshkov  2021-06-18  152  static void dpu_core_irq_=
callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  153  {
a73033619ea904 Dmitry Baryshkov  2021-06-18  154  	VERB("irq_idx=3D%d\n", i=
rq_idx);
a73033619ea904 Dmitry Baryshkov  2021-06-18  155  =

c929ac60b3ed34 Dmitry Baryshkov  2022-02-17  156  	if (!dpu_kms->hw_intr->i=
rq_tbl[irq_idx].cb)
a73033619ea904 Dmitry Baryshkov  2021-06-18  157  		DRM_ERROR("no registere=
d cb, idx:%d\n", irq_idx);
a73033619ea904 Dmitry Baryshkov  2021-06-18  158  =

c929ac60b3ed34 Dmitry Baryshkov  2022-02-17  159  	atomic_inc(&dpu_kms->hw_=
intr->irq_tbl[irq_idx].count);
a73033619ea904 Dmitry Baryshkov  2021-06-18  160  =

a73033619ea904 Dmitry Baryshkov  2021-06-18  161  	/*
a73033619ea904 Dmitry Baryshkov  2021-06-18  162  	 * Perform registered fu=
nction callback
a73033619ea904 Dmitry Baryshkov  2021-06-18  163  	 */
c929ac60b3ed34 Dmitry Baryshkov  2022-02-17 @164  	dpu_kms->hw_intr->irq_tb=
l[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg, irq_idx);
a73033619ea904 Dmitry Baryshkov  2021-06-18  165  }
a73033619ea904 Dmitry Baryshkov  2021-06-18  166  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8914332012458531886==--

