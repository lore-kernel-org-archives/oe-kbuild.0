Content-Type: multipart/mixed; boundary="===============8216065174831867154=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v8 1/3] leds: ktd2692: Avoid duplicate error messages on probe deferral
Date: Fri, 06 May 2022 13:44:17 +0800
Message-ID: <202205061352.CPtBdwTH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8216065174831867154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220505152521.71019-2-markuss.broks@gmail.com>
References: <20220505152521.71019-2-markuss.broks@gmail.com>
TO: Markuss Broks <markuss.broks@gmail.com>
TO: pavel(a)ucw.cz
CC: Markuss Broks <markuss.broks@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: linux-leds(a)vger.kernel.org
CC: devicetree(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Markuss,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pavel-leds/for-next]
[also build test WARNING on robh/for-next v5.18-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Markuss-Broks/leds-k=
td2692-Avoid-duplicate-error-messages-on-probe-deferral/20220506-002732
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git =
for-next
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm-randconfig-c002-20220505 (https://download.01.org/0day-ci/archi=
ve/20220506/202205061352.CPtBdwTH-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/844df84cf0fa0418007=
81e7597b91580fa6e111b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Markuss-Broks/leds-ktd2692-Avoid-d=
uplicate-error-messages-on-probe-deferral/20220506-002732
        git checkout 844df84cf0fa041800781e7597b91580fa6e111b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/hpfs/buffer.c:224:3: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(qbh->bh[1]->b_data, qbh->data + 1 * 512, 512);
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
   fs/hpfs/buffer.c:224:3: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
                   memcpy(qbh->bh[1]->b_data, qbh->data + 1 * 512, 512);
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
   fs/hpfs/buffer.c:225:3: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(qbh->bh[2]->b_data, qbh->data + 2 * 512, 512);
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
   fs/hpfs/buffer.c:225:3: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
                   memcpy(qbh->bh[2]->b_data, qbh->data + 2 * 512, 512);
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
   fs/hpfs/buffer.c:226:3: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(qbh->bh[3]->b_data, qbh->data + 3 * 512, 512);
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
   fs/hpfs/buffer.c:226:3: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
                   memcpy(qbh->bh[3]->b_data, qbh->data + 3 * 512, 512);
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
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/leds/uleds.c:150:4: warning: Value stored to 'retval' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/uleds.c:150:4: note: Value stored to 'retval' is never read
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (50 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
>> drivers/leds/flash/leds-ktd2692.c:241:15: warning: Assigned value is gar=
bage or undefined [clang-analyzer-core.uninitialized.Assign]
           setting->max =3D cfg->flash_max_timeout;
                        ^
   drivers/leds/flash/leds-ktd2692.c:355:6: note: Assuming 'led' is non-null
           if (!led)
               ^~~~
   drivers/leds/flash/leds-ktd2692.c:355:2: note: Taking false branch
           if (!led)
           ^
   drivers/leds/flash/leds-ktd2692.c:361:8: note: Calling 'ktd2692_parse_dt'
           ret =3D ktd2692_parse_dt(led, &pdev->dev, &led_cfg);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-ktd2692.c:277:6: note: Assuming 'np' is non-null
           if (!np)
               ^~~
   drivers/leds/flash/leds-ktd2692.c:277:2: note: Taking false branch
           if (!np)
           ^
   drivers/leds/flash/leds-ktd2692.c:282:6: note: 'ret' is not equal to 0
           if (ret)
               ^~~
   drivers/leds/flash/leds-ktd2692.c:282:2: note: Taking true branch
           if (ret)
           ^
   drivers/leds/flash/leds-ktd2692.c:283:3: note: Returning without writing=
 to 'cfg->flash_max_timeout'
                   return dev_err_probe(dev, ret, "cannot get ctrl-gpios\n"=
);
                   ^
   drivers/leds/flash/leds-ktd2692.c:361:8: note: Returning from 'ktd2692_p=
arse_dt'
           ret =3D ktd2692_parse_dt(led, &pdev->dev, &led_cfg);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-ktd2692.c:362:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/leds/flash/leds-ktd2692.c:362:2: note: Taking false branch
           if (ret)
           ^
   drivers/leds/flash/leds-ktd2692.c:365:2: note: Calling 'ktd2692_init_fla=
sh_timeout'
           ktd2692_init_flash_timeout(fled_cdev, &led_cfg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-ktd2692.c:241:15: note: Assigned value is garbag=
e or undefined
           setting->max =3D cfg->flash_max_timeout;
                        ^ ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/mmc/core/sdio_cis.c:63:3: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(string, buf);
                   ^~~~~~
   drivers/mmc/core/sdio_cis.c:63:3: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                   strcpy(string, buf);
                   ^~~~~~
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/mfd/gateworks-gsc.c:113:8: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   rz =3D sprintf(buf, "%d\n", gsc->fwver);
                        ^~~~~~~
   drivers/mfd/gateworks-gsc.c:113:8: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
                   rz =3D sprintf(buf, "%d\n", gsc->fwver);
                        ^~~~~~~
   drivers/mfd/gateworks-gsc.c:115:8: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   rz =3D sprintf(buf, "0x%04x\n", gsc->fwcrc);
                        ^~~~~~~
   drivers/mfd/gateworks-gsc.c:115:8: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
                   rz =3D sprintf(buf, "0x%04x\n", gsc->fwcrc);
                        ^~~~~~~
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/mmc/host/mmc_spi.c:248:2: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(tag, sizeof(tag), "  ... CMD%d response SPI_%s",
           ^~~~~~~~
   drivers/mmc/host/mmc_spi.c:248:2: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           snprintf(tag, sizeof(tag), "  ... CMD%d response SPI_%s",
           ^~~~~~~~
   drivers/mmc/host/mmc_spi.c:354:4: warning: Value stored to 'end' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                           end =3D cp+1;
                           ^     ~~~~
   drivers/mmc/host/mmc_spi.c:354:4: note: Value stored to 'end' is never r=
ead
                           end =3D cp+1;
                           ^     ~~~~
   drivers/mmc/host/mmc_spi.c:444:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cp, 0xff, sizeof(data->status));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \

vim +241 drivers/leds/flash/leds-ktd2692.c

b7da8c5c725cc2 drivers/leds/leds-ktd2692.c Ingi Kim 2015-05-12  233  =

b7da8c5c725cc2 drivers/leds/leds-ktd2692.c Ingi Kim 2015-05-12  234  static=
 void ktd2692_init_flash_timeout(struct led_classdev_flash *fled_cdev,
b7da8c5c725cc2 drivers/leds/leds-ktd2692.c Ingi Kim 2015-05-12  235  				  =
     struct ktd2692_led_config_data *cfg)
b7da8c5c725cc2 drivers/leds/leds-ktd2692.c Ingi Kim 2015-05-12  236  {
b7da8c5c725cc2 drivers/leds/leds-ktd2692.c Ingi Kim 2015-05-12  237  	struc=
t led_flash_setting *setting;
b7da8c5c725cc2 drivers/leds/leds-ktd2692.c Ingi Kim 2015-05-12  238  =

b7da8c5c725cc2 drivers/leds/leds-ktd2692.c Ingi Kim 2015-05-12  239  	setti=
ng =3D &fled_cdev->timeout;
b7da8c5c725cc2 drivers/leds/leds-ktd2692.c Ingi Kim 2015-05-12  240  	setti=
ng->min =3D KTD2692_FLASH_MODE_TIMEOUT_DISABLE;
b7da8c5c725cc2 drivers/leds/leds-ktd2692.c Ingi Kim 2015-05-12 @241  	setti=
ng->max =3D cfg->flash_max_timeout;
b7da8c5c725cc2 drivers/leds/leds-ktd2692.c Ingi Kim 2015-05-12  242  	setti=
ng->step =3D cfg->flash_max_timeout
b7da8c5c725cc2 drivers/leds/leds-ktd2692.c Ingi Kim 2015-05-12  243  			/ (=
KTD2692_FLASH_MODE_TIMEOUT_LEVELS - 1);
b7da8c5c725cc2 drivers/leds/leds-ktd2692.c Ingi Kim 2015-05-12  244  	setti=
ng->val =3D cfg->flash_max_timeout;
b7da8c5c725cc2 drivers/leds/leds-ktd2692.c Ingi Kim 2015-05-12  245  }
b7da8c5c725cc2 drivers/leds/leds-ktd2692.c Ingi Kim 2015-05-12  246  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8216065174831867154==--

