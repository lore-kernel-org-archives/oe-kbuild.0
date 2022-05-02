Content-Type: multipart/mixed; boundary="===============8810312708455049082=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/5] drivers: thermal: tsens: Add support for combined interrupt
Date: Tue, 03 May 2022 01:53:44 +0800
Message-ID: <202205030118.mW6bIrD6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8810312708455049082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220501182200.47328-2-robimarko@gmail.com>
References: <20220501182200.47328-2-robimarko@gmail.com>
TO: Robert Marko <robimarko@gmail.com>
TO: agross(a)kernel.org
TO: bjorn.andersson(a)linaro.org
TO: amitk(a)kernel.org
TO: rafael(a)kernel.org
TO: daniel.lezcano(a)linaro.org
TO: rui.zhang(a)intel.com
TO: robh+dt(a)kernel.org
TO: krzysztof.kozlowski+dt(a)linaro.org
TO: linux-arm-msm(a)vger.kernel.org
TO: linux-pm(a)vger.kernel.org
TO: devicetree(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
CC: Robert Marko <robimarko@gmail.com>

Hi Robert,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on robh/for-next v5.18-rc5 next-20220502]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Robert-Marko/dt-bind=
ings-thermal-tsens-Add-ipq8074-compatible/20220502-022356
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 thermal
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: riscv-randconfig-c006-20220501 (https://download.01.org/0day-ci/arc=
hive/20220503/202205030118.mW6bIrD6-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d=
36061e42b495d1f4c7e933e260eac260ed)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/414e5df361814f642dd=
320fe517e6e28de8084e5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Robert-Marko/dt-bindings-thermal-t=
sens-Add-ipq8074-compatible/20220502-022356
        git checkout 414e5df361814f642dd320fe517e6e28de8084e5
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~
   drivers/nvmem/core.c:1452:2: note: Taking false branch
           if (!nvmem)
           ^
   drivers/nvmem/core.c:1456:6: note: Assuming 'buf' is non-null
           if (!buf)
               ^~~~
   drivers/nvmem/core.c:1456:2: note: Taking false branch
           if (!buf)
           ^
   drivers/nvmem/core.c:1459:7: note: Calling '__nvmem_cell_read'
           rc =3D __nvmem_cell_read(nvmem, cell->entry, buf, len, cell->id);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1416:6: note: Assuming 'rc' is not equal to 0
           if (rc)
               ^~
   drivers/nvmem/core.c:1416:2: note: Taking true branch
           if (rc)
           ^
   drivers/nvmem/core.c:1459:7: note: Returning from '__nvmem_cell_read'
           rc =3D __nvmem_cell_read(nvmem, cell->entry, buf, len, cell->id);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1460:6: note: 'rc' is not equal to 0
           if (rc) {
               ^~
   drivers/nvmem/core.c:1460:2: note: Taking true branch
           if (rc) {
           ^
   drivers/nvmem/core.c:1666:8: note: Returning from 'nvmem_cell_read'
           buf =3D nvmem_cell_read(cell, len);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1668:2: note: Taking false branch
           if (IS_ERR(buf))
           ^
   drivers/nvmem/core.c:1675:6: note: Assuming 'nbits' is 0
           if (nbits)
               ^~~~~
   drivers/nvmem/core.c:1675:2: note: Taking false branch
           if (nbits)
           ^
   drivers/nvmem/core.c:1678:11: note: The left operand of '>' is a garbage=
 value
           if (*len > max_len) {
               ~~~~ ^
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/gpu/drm/drm_modeset_lock.c:249:2: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ctx, 0, sizeof(*ctx));
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
   drivers/gpu/drm/drm_modeset_lock.c:249:2: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
           memset(ctx, 0, sizeof(*ctx));
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
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
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
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
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
   24 warnings generated.
   Suppressed 24 warnings (24 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
>> drivers/thermal/qcom/tsens.c:549:2: warning: Value stored to 'ret' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           ret =3D tsens_critical_irq_thread(irq, data);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/qcom/tsens.c:549:2: note: Value stored to 'ret' is never=
 read
           ret =3D tsens_critical_irq_thread(irq, data);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/qcom/tsens.c:559:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D priv->dev;
                          ^~~   ~~~~~~~~~
   drivers/thermal/qcom/tsens.c:559:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D priv->dev;
                          ^~~   ~~~~~~~~~
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
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   drivers/thermal/qcom/qcom-spmi-adc-tm5.c:341:2: warning: Value stored to=
 'chip' is never read [clang-analyzer-deadcode.DeadStores]
           chip =3D channel->chip;
           ^      ~~~~~~~~~~~~~
   drivers/thermal/qcom/qcom-spmi-adc-tm5.c:341:2: note: Value stored to 'c=
hip' is never read
           chip =3D channel->chip;
           ^      ~~~~~~~~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
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
   drivers/input/mouse/cyapa_gen3.c:660:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(write_block_cmd.block_data, data, CYAPA_FW_BLOCK_SIZE);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'

vim +/ret +549 drivers/thermal/qcom/tsens.c

a7ff82976122eb Amit Kucheria 2020-04-29  534  =

414e5df361814f Robert Marko  2022-05-01  535  /**
414e5df361814f Robert Marko  2022-05-01  536   * tsens_combined_irq_thread =
- Threaded interrupt handler for combined interrupts
414e5df361814f Robert Marko  2022-05-01  537   * @irq: irq number
414e5df361814f Robert Marko  2022-05-01  538   * @data: tsens controller pr=
ivate data
414e5df361814f Robert Marko  2022-05-01  539   *
414e5df361814f Robert Marko  2022-05-01  540   * Handle the combined interr=
upt as if it were 2 separate interrupts, so call the
414e5df361814f Robert Marko  2022-05-01  541   * critical handler first and=
 then the up/low one.
414e5df361814f Robert Marko  2022-05-01  542   *
414e5df361814f Robert Marko  2022-05-01  543   * Return: IRQ_HANDLED
414e5df361814f Robert Marko  2022-05-01  544   */
414e5df361814f Robert Marko  2022-05-01  545  static irqreturn_t tsens_comb=
ined_irq_thread(int irq, void *data)
414e5df361814f Robert Marko  2022-05-01  546  {
414e5df361814f Robert Marko  2022-05-01  547  	irqreturn_t ret;
414e5df361814f Robert Marko  2022-05-01  548  =

414e5df361814f Robert Marko  2022-05-01 @549  	ret =3D tsens_critical_irq_t=
hread(irq, data);
414e5df361814f Robert Marko  2022-05-01  550  	ret =3D tsens_irq_thread(irq=
, data);
414e5df361814f Robert Marko  2022-05-01  551  =

414e5df361814f Robert Marko  2022-05-01  552  	return ret;
414e5df361814f Robert Marko  2022-05-01  553  }
414e5df361814f Robert Marko  2022-05-01  554  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8810312708455049082==--

