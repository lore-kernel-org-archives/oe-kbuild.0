Content-Type: multipart/mixed; boundary="===============3204390975900154520=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6 2/2] leds: ktd2692: Make aux-gpios optional
Date: Tue, 19 Apr 2022 07:49:41 +0800
Message-ID: <202204190742.7hPtHoMK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3204390975900154520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220408184104.13665-3-markuss.broks@gmail.com>
References: <20220408184104.13665-3-markuss.broks@gmail.com>
TO: Markuss Broks <markuss.broks@gmail.com>
TO: linux-kernel(a)vger.kernel.org
CC: phone-devel(a)vger.kernel.org
CC: ~postmarketos/upstreaming(a)lists.sr.ht
CC: Markuss Broks <markuss.broks@gmail.com>
CC: Pavel Machek <pavel@ucw.cz>
CC: Rob Herring <robh+dt@kernel.org>
CC: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: linux-leds(a)vger.kernel.org
CC: devicetree(a)vger.kernel.org

Hi Markuss,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pavel-leds/for-next]
[also build test WARNING on linus/master linux/master v5.18-rc3 next-202204=
14]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Markuss-Broks/Make-A=
UX-gpio-pin-optional-for-ktd2692/20220409-024603
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git =
for-next
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: x86_64-randconfig-c007-20220418 (https://download.01.org/0day-ci/ar=
chive/20220419/202204190742.7hPtHoMK-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b27430=
f9f46b88bcd54d992debc8d72e131e1bd0)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0b519b2b7290b0e3d0b=
c3687cdc39efc967c6b21
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Markuss-Broks/Make-AUX-gpio-pin-op=
tional-for-ktd2692/20220409-024603
        git checkout 0b519b2b7290b0e3d0bc3687cdc39efc967c6b21
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/mux/mmio.c:58:2: note: Taking false branch
           if (ret =3D=3D 0 || ret % 2)
           ^
   drivers/mux/mmio.c:60:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   drivers/mux/mmio.c:60:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/mux/mmio.c:69:2: note: Taking false branch
           if (IS_ERR(mux_chip))
           ^
   drivers/mux/mmio.c:74:14: note: Assuming 'i' is < 'num_fields'
           for (i =3D 0; i < num_fields; i++) {
                       ^~~~~~~~~~~~~~
   drivers/mux/mmio.c:74:2: note: Loop condition is true.  Entering loop bo=
dy
           for (i =3D 0; i < num_fields; i++) {
           ^
   drivers/mux/mmio.c:78:12: note: 'mask' declared without an initial value
                   u32 reg, mask;
                            ^~~~
   drivers/mux/mmio.c:83:7: note: Assuming 'ret' is not equal to 0
                   if (!ret)
                       ^~~~
   drivers/mux/mmio.c:83:3: note: Taking false branch
                   if (!ret)
                   ^
   drivers/mux/mmio.c:86:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0) {
                       ^~~~~~~
   drivers/mux/mmio.c:86:3: note: Taking false branch
                   if (ret < 0) {
                   ^
   drivers/mux/mmio.c:93:15: note: 1st function call argument is an uniniti=
alized value
                   field.msb =3D fls(mask) - 1;
                               ^   ~~~~
   drivers/mux/mmio.c:102:15: warning: Passed-by-value struct argument cont=
ains uninitialized data (e.g., field: 'id_size') [clang-analyzer-core.CallA=
ndMessage]
                   fields[i] =3D devm_regmap_field_alloc(dev, regmap, field=
);
                               ^                                    ~~~~~
   drivers/mux/mmio.c:47:6: note: Assuming the condition is true
           if (of_device_is_compatible(np, "mmio-mux"))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mux/mmio.c:47:2: note: Taking true branch
           if (of_device_is_compatible(np, "mmio-mux"))
           ^
   drivers/mux/mmio.c:51:2: note: Taking false branch
           if (IS_ERR(regmap)) {
           ^
   drivers/mux/mmio.c:58:6: note: Assuming 'ret' is not equal to 0
           if (ret =3D=3D 0 || ret % 2)
               ^~~~~~~~
   drivers/mux/mmio.c:58:6: note: Left side of '||' is false
   drivers/mux/mmio.c:58:18: note: Assuming the condition is false
           if (ret =3D=3D 0 || ret % 2)
                           ^~~~~~~
   drivers/mux/mmio.c:58:2: note: Taking false branch
           if (ret =3D=3D 0 || ret % 2)
           ^
   drivers/mux/mmio.c:60:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   drivers/mux/mmio.c:60:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/mux/mmio.c:69:2: note: Taking false branch
           if (IS_ERR(mux_chip))
           ^
   drivers/mux/mmio.c:74:14: note: Assuming 'i' is < 'num_fields'
           for (i =3D 0; i < num_fields; i++) {
                       ^~~~~~~~~~~~~~
   drivers/mux/mmio.c:74:2: note: Loop condition is true.  Entering loop bo=
dy
           for (i =3D 0; i < num_fields; i++) {
           ^
   drivers/mux/mmio.c:76:3: note: 'field' initialized here
                   struct reg_field field;
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mux/mmio.c:83:7: note: Assuming 'ret' is 0
                   if (!ret)
                       ^~~~
   drivers/mux/mmio.c:83:3: note: Taking true branch
                   if (!ret)
                   ^
   drivers/mux/mmio.c:86:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0) {
                       ^~~~~~~
   drivers/mux/mmio.c:86:3: note: Taking false branch
                   if (ret < 0) {
                   ^
   drivers/mux/mmio.c:96:7: note: Assuming the condition is false
                   if (mask !=3D GENMASK(field.msb, field.lsb)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mux/mmio.c:96:3: note: Taking false branch
                   if (mask !=3D GENMASK(field.msb, field.lsb)) {
                   ^
   drivers/mux/mmio.c:102:15: note: Passed-by-value struct argument contain=
s uninitialized data (e.g., field: 'id_size')
                   fields[i] =3D devm_regmap_field_alloc(dev, regmap, field=
);
                               ^                                    ~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/leds/flash/leds-ktd2692.c:241:15: warning: Assigned value is gar=
bage or undefined [clang-analyzer-core.uninitialized.Assign]
           setting->max =3D cfg->flash_max_timeout;
                        ^
   drivers/leds/flash/leds-ktd2692.c:359:6: note: Assuming 'led' is non-null
           if (!led)
               ^~~~
   drivers/leds/flash/leds-ktd2692.c:359:2: note: Taking false branch
           if (!led)
           ^
   drivers/leds/flash/leds-ktd2692.c:365:8: note: Calling 'ktd2692_parse_dt'
           ret =3D ktd2692_parse_dt(led, &pdev->dev, &led_cfg);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-ktd2692.c:277:6: note: Assuming 'np' is non-null
           if (!np)
               ^~~
   drivers/leds/flash/leds-ktd2692.c:277:2: note: Taking false branch
           if (!np)
           ^
   drivers/leds/flash/leds-ktd2692.c:282:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/leds/flash/leds-ktd2692.c:282:2: note: Taking false branch
           if (ret) {
           ^
   drivers/leds/flash/leds-ktd2692.c:288:2: note: Taking true branch
           if (IS_ERR(led->aux_gpio)) {
           ^
   drivers/leds/flash/leds-ktd2692.c:290:3: note: Loop condition is false. =
 Exiting loop
                   dev_err(dev, "cannot get aux-gpios %d\n", ret);
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/leds/flash/leds-ktd2692.c:291:3: note: Returning without writing=
 to 'cfg->flash_max_timeout'
                   return ret;
                   ^
   drivers/leds/flash/leds-ktd2692.c:365:8: note: Returning from 'ktd2692_p=
arse_dt'
           ret =3D ktd2692_parse_dt(led, &pdev->dev, &led_cfg);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-ktd2692.c:366:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/leds/flash/leds-ktd2692.c:366:2: note: Taking false branch
           if (ret)
           ^
   drivers/leds/flash/leds-ktd2692.c:369:2: note: Calling 'ktd2692_init_fla=
sh_timeout'
           ktd2692_init_flash_timeout(fled_cdev, &led_cfg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-ktd2692.c:241:15: note: Assigned value is garbag=
e or undefined
           setting->max =3D cfg->flash_max_timeout;
                        ^ ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   mm/huge_memory.c:583:9: warning: Value stored to 'off' during its initia=
lization is never read [clang-analyzer-deadcode.DeadStores]
           loff_t off =3D (loff_t)pgoff << PAGE_SHIFT;
                  ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/huge_memory.c:583:9: note: Value stored to 'off' during its initializ=
ation is never read
           loff_t off =3D (loff_t)pgoff << PAGE_SHIFT;
                  ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/huge_memory.c:3096:4: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(file_path, tok);
                           ^~~~~~
   mm/huge_memory.c:3096:4: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                           strcpy(file_path, tok);
                           ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

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
--===============3204390975900154520==--

